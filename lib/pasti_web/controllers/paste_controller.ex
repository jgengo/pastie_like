defmodule PastiWeb.PasteController do
  use PastiWeb, :controller

  alias Pasti.Paste
  alias Pasti.Repo

  # -----------------

  def index(conn, _) do
    pastes = Repo.all(Paste)
    render conn, "index.html", pastes: pastes
  end

  # -----------------

  def new(conn, _) do
    changeset = Paste.changeset(%Paste{}, %{})
    render conn, "new.html", changeset: changeset
  end
  def create(conn, %{"paste" => paste}) do # awful, but refactoring is to be expected.
    extensions = %{1 => nil, 2 => "ruby", 3 => "c", 4 => "python"}
    expirations = %{1 => 0, 2 => 10, 3 => 60, 4 => 10080}
    kinds = %{1 => "public", 2 => "unlisted", 3 => "private"}

    paste = paste 
      |> Map.fetch!("extension") 
      |> String.to_integer 
      |> (&Map.put(paste, "extension", extensions[&1])).()
    paste = paste 
      |> Map.fetch!("expiration_at") 
      |> String.to_integer 
      |> (&Timex.shift(Timex.now, minutes: expirations[&1])).() 
      |> (&Map.put(paste, "expiration_at", &1)).()
    paste = paste 
      |> Map.fetch!("kind")
      |> String.to_integer
      |> (&Map.put(paste, "kind", kinds[&1])).()
      
    IO.puts "++++"
    IO.inspect paste

    conn
    |> redirect(to: paste_path(conn, :new))
  end

  # -----------------

end