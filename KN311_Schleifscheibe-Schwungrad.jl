### A Pluto.jl notebook ###
# v0.20.3

using Markdown
using InteractiveUtils

# ╔═╡ 31004250-bd3d-11ef-3805-4f4a7b6ac632
using Unitful

# ╔═╡ 6ed2f7e5-0725-4856-8e7f-957b1951eddd
md"""
# Technische Berechnungen mit Julia
## Kinetik der Drehbewegung um eine raumfeste Achse"""

# ╔═╡ 7114d5ee-7aeb-4511-82c6-4b654bf5223b
md"""
### Abschalten einer Schleifscheibe"""

# ╔═╡ 412be34d-b2c5-42a0-bd3f-9fecc824ac8c
md"""Eine Schleifscheibe mit dem Trägheitsmoment ``J`` wird von der Drehzahl ``n_0`` abgeschaltet und läuft während der Zeit ``\Delta t`` aus. Wie groß ist die Drehbeschleunigung und wie groß ist das Reibmoment in den Lagern?"""

# ╔═╡ b74bfe5e-1638-4fa4-a592-8ff0f378ca63
begin
	J = 3.0u"kg*m^2"
	n0 = 2500.0u"minute^-1"
	Δt = 210.0u"s"
end;

# ╔═╡ ac4e756f-6317-4be9-9c88-48e854279bf1
md"""Wenn man eine konstante Drehbeschleunigung unterstellt (resultierend aus einem zumindest näherungsweise konstanten Bremsmoment), dann gilt
```math
\alpha = \frac{-2\pi n_0}{\Delta t}\;\Rightarrow\;M_\mathrm{Reib} = J\alpha.
```
"""

# ╔═╡ fefead3c-c6a7-421c-ae52-00b9289d40ba
α = -2*π*n0/Δt |> u"s^-2"

# ╔═╡ 651e326f-fcf0-471e-9ecf-8361e72f358f
MReib = J*α |> u"N*m"

# ╔═╡ 5841d224-9472-43f4-adad-b24e674bf329
md"""**Antwortsatz** Die Winkelbeschleunigung beträgt $(round(ustrip(u"s^-2",α),digits=3)) ``\mathrm{s^{-2}}``, das Bremsmoment $(round(ustrip(u"N*m",MReib),digits=2)) Nm."""

# ╔═╡ 11b29daa-9cf8-4c3b-9515-fc22c7761fe1
md"""
### Abbremsen eines Schwungrades"""

# ╔═╡ cae1c580-3f2c-481b-bc93-16dbe7bf4878
md"""Ein Schwungrad wird durch ein konstantes Bremsmoment ``M_\mathrm{B}`` in der Zeit ``t_\mathrm{B}`` aus der Drehzahl ``n_\mathrm{St}`` bis zum Stillstand gebremst.
Wie groß ist das Massenträgheitsmoment des Schwungrads? Wie viele Umdrehungen hat das Schwungrad während der Bremsung gemacht?"""

# ╔═╡ de84a788-36a5-4ccf-808c-b979e362a591
begin
	MB = 710.0u"N*m"
	tB = 95.0u"s"
	nSt = 630.0u"minute^-1"
end;

# ╔═╡ 1c9eb647-1ab5-4f2c-93a1-995dbc9e8d41
md"""Für die Drehbeschleunigung gilt der gleiche Ansatz wie oben."""

# ╔═╡ 99ac1b30-0428-41cb-a684-e442ad9e6164
αS = 2*π*nSt/tB |> u"s^-2"

# ╔═╡ d873a2e4-f794-42da-a378-39b0a7705cc0
md"""Im Gegensatz zur anderen Aufgabe ist jetzt das Bremsmoment bekannt und das Massenträgheitsmoment bezüglich der Drehachse ist gesucht."""

# ╔═╡ 49a20f16-2f77-411a-a9ca-2af73f4c19c7
JS = MB/αS |> u"kg*m^2"

# ╔═╡ 31b9752f-a946-4f70-9f4b-d2d116956a0e
md"""Da das Bremsmoment und damit die Drehbeschleunigung konstant sind, nimmt die Drehzahl linear mit der Zeit vom Startwert auf Null ab. Die Zahl der Umdrehungen ist demnach
```math
N_\mathrm{B} = \frac{1}{2} n_\mathrm{St} t_\mathrm{B}\;.
```
"""

# ╔═╡ 4a0897a1-2357-4bf8-94bc-772a78c8533d
NB = 0.5*nSt*tB |> u"NoUnits"

# ╔═╡ b9a2aa22-6b62-4da4-b090-c56996b9e43a
md"""**Antwortsatz** Das Massenträgheitsmoment des Schwungrads beträgt $(round(ustrip(u"kg*m^2",JS),digits=1)) ``\mathrm{kg\,m^2}``.  Das Schwungrad macht $(round(ustrip(u"NoUnits",NB),digits=1)) Umdrehungen bis zum Stillstand."""

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
Unitful = "1986cc42-f94f-5a68-af5c-568840ba703d"

[compat]
Unitful = "~1.21.1"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.11.3"
manifest_format = "2.0"
project_hash = "fa9526340d64c5f8d3499995ce0fd05d5b979e89"

[[deps.Artifacts]]
uuid = "56f22d72-fd6d-98f1-02f0-08ddc0907c33"
version = "1.11.0"

[[deps.CompilerSupportLibraries_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "e66e0078-7015-5450-92f7-15fbd957f2ae"
version = "1.1.1+0"

[[deps.Dates]]
deps = ["Printf"]
uuid = "ade2ca70-3891-5945-98fb-dc099432e06a"
version = "1.11.0"

[[deps.Libdl]]
uuid = "8f399da3-3557-5675-b5ff-fb832c97cbdb"
version = "1.11.0"

[[deps.LinearAlgebra]]
deps = ["Libdl", "OpenBLAS_jll", "libblastrampoline_jll"]
uuid = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"
version = "1.11.0"

[[deps.OpenBLAS_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "Libdl"]
uuid = "4536629a-c528-5b80-bd46-f80d51c5b363"
version = "0.3.27+1"

[[deps.Printf]]
deps = ["Unicode"]
uuid = "de0858da-6303-5e67-8744-51eddeeeb8d7"
version = "1.11.0"

[[deps.Random]]
deps = ["SHA"]
uuid = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"
version = "1.11.0"

[[deps.SHA]]
uuid = "ea8e919c-243c-51af-8825-aaa63cd721ce"
version = "0.7.0"

[[deps.Unicode]]
uuid = "4ec0a83e-493e-50e2-b9ac-8f72acf5a8f5"
version = "1.11.0"

[[deps.Unitful]]
deps = ["Dates", "LinearAlgebra", "Random"]
git-tree-sha1 = "01915bfcd62be15329c9a07235447a89d588327c"
uuid = "1986cc42-f94f-5a68-af5c-568840ba703d"
version = "1.21.1"

    [deps.Unitful.extensions]
    ConstructionBaseUnitfulExt = "ConstructionBase"
    InverseFunctionsUnitfulExt = "InverseFunctions"

    [deps.Unitful.weakdeps]
    ConstructionBase = "187b0558-2788-49d3-abe0-74a17ed4e7c9"
    InverseFunctions = "3587e190-3f89-42d0-90ee-14403ec27112"

[[deps.libblastrampoline_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "8e850b90-86db-534c-a0d3-1478176c7d93"
version = "5.11.0+0"
"""

# ╔═╡ Cell order:
# ╟─6ed2f7e5-0725-4856-8e7f-957b1951eddd
# ╟─7114d5ee-7aeb-4511-82c6-4b654bf5223b
# ╠═31004250-bd3d-11ef-3805-4f4a7b6ac632
# ╟─412be34d-b2c5-42a0-bd3f-9fecc824ac8c
# ╠═b74bfe5e-1638-4fa4-a592-8ff0f378ca63
# ╟─ac4e756f-6317-4be9-9c88-48e854279bf1
# ╠═fefead3c-c6a7-421c-ae52-00b9289d40ba
# ╠═651e326f-fcf0-471e-9ecf-8361e72f358f
# ╟─5841d224-9472-43f4-adad-b24e674bf329
# ╟─11b29daa-9cf8-4c3b-9515-fc22c7761fe1
# ╟─cae1c580-3f2c-481b-bc93-16dbe7bf4878
# ╠═de84a788-36a5-4ccf-808c-b979e362a591
# ╟─1c9eb647-1ab5-4f2c-93a1-995dbc9e8d41
# ╠═99ac1b30-0428-41cb-a684-e442ad9e6164
# ╟─d873a2e4-f794-42da-a378-39b0a7705cc0
# ╠═49a20f16-2f77-411a-a9ca-2af73f4c19c7
# ╟─31b9752f-a946-4f70-9f4b-d2d116956a0e
# ╠═4a0897a1-2357-4bf8-94bc-772a78c8533d
# ╟─b9a2aa22-6b62-4da4-b090-c56996b9e43a
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
