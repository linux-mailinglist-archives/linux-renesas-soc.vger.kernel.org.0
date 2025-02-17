Return-Path: <linux-renesas-soc+bounces-13212-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 885EBA3821D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Feb 2025 12:44:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4763F18843FB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Feb 2025 11:44:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E7A2219A7A;
	Mon, 17 Feb 2025 11:44:18 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BC23219A94;
	Mon, 17 Feb 2025 11:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739792658; cv=none; b=JhyUZTb/XhIsF3IAoDOOZnE0GGxt8BwnEcPlmrb/b6ONA6fyT5dLKX4aUpg3ayEHAlAc9nUIpI3q5NUWdJ8NZDf7WSszcXtvYa2zoq1GexjH27XMas0GDtSjVc/tGT5V+tWhs7RAxsAtOo2vXVE2NmIRSOJW7Z7JuQChLjuOWf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739792658; c=relaxed/simple;
	bh=AAFbj9nY/mRi1qGspmVJ+yHswu/z2qI/MxMGUFdh3eU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cfRNNp7LWI1Ff0rXRzb7nTK6PflI2YDsIH3nMeTqizyMM3YFTwbnGP3MlAzSQN+UZD2keaGXDBDeAqjUia+xK41KwYNlCFMi1NKEaJ0NoleiGzCdH8XZZp8f/N7ayc2hVE5lMGxEIyoYXGO81P5KiuhiJQx3ON0HJHblkL4lSPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: GYM/Z20KSIW1usH1dsZlmA==
X-CSE-MsgGUID: NmK1gJR/R6mvJLl/43JQ8g==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 17 Feb 2025 20:44:14 +0900
Received: from [10.24.1.21] (unknown [10.24.1.21])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id DEDA44292EAB;
	Mon, 17 Feb 2025 20:44:11 +0900 (JST)
Message-ID: <000e0794-d3cd-4c2e-8eec-9216ac6a08b3@bp.renesas.com>
Date: Mon, 17 Feb 2025 11:44:10 +0000
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/13] clk: renesas: Pass sub struct of cpg_mssr_priv
 to cpg_clk_register
Content-Language: en-GB
To: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>,
 thierry.bultel@linatsea.fr, Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250217105354.551788-1-thierry.bultel.yh@bp.renesas.com>
 <20250217105354.551788-6-thierry.bultel.yh@bp.renesas.com>
From: Paul Barker <paul.barker.ct@bp.renesas.com>
In-Reply-To: <20250217105354.551788-6-thierry.bultel.yh@bp.renesas.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------YBLQ0JorpZHIEAmCAyeC6Y0a"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------YBLQ0JorpZHIEAmCAyeC6Y0a
Content-Type: multipart/mixed; boundary="------------YQ5C76oQXCTeK001HLbo2ZG3";
 protected-headers="v1"
From: Paul Barker <paul.barker.ct@bp.renesas.com>
To: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>,
 thierry.bultel@linatsea.fr, Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
Message-ID: <000e0794-d3cd-4c2e-8eec-9216ac6a08b3@bp.renesas.com>
Subject: Re: [PATCH v2 05/13] clk: renesas: Pass sub struct of cpg_mssr_priv
 to cpg_clk_register
References: <20250217105354.551788-1-thierry.bultel.yh@bp.renesas.com>
 <20250217105354.551788-6-thierry.bultel.yh@bp.renesas.com>
In-Reply-To: <20250217105354.551788-6-thierry.bultel.yh@bp.renesas.com>

--------------YQ5C76oQXCTeK001HLbo2ZG3
Content-Type: multipart/mixed; boundary="------------1OMPQVuedhTrUjkxWedXfoXo"

--------------1OMPQVuedhTrUjkxWedXfoXo
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Thierry,

On 17/02/2025 10:52, Thierry Bultel wrote:
> In a coming evolution, the registration callback will need more paramet=
ers
> from cpg_mssr_priv (like another base address with clock controllers
> with double register block).
> Instead of adding more parameters, mode the needed parameters to a publ=
ic
> sub-struct.

This is missing the Signed-off-by line.

I also think you should mention that rmw_lock is moved to the new struct
as it will be needed in the subsequent patch, since none of the
functions modified by this patch to take a `struct cpg_mssr_pub`
argument use that lock.

[snip]

> diff --git a/drivers/clk/renesas/rcar-gen3-cpg.c b/drivers/clk/renesas/=
rcar-gen3-cpg.c
> index 027100e84ee4..aafeb139fdb4 100644
> --- a/drivers/clk/renesas/rcar-gen3-cpg.c
> +++ b/drivers/clk/renesas/rcar-gen3-cpg.c
> @@ -345,9 +345,11 @@ static const struct soc_device_attribute cpg_quirk=
s_match[] __initconst =3D {
> =20
>  struct clk * __init rcar_gen3_cpg_clk_register(struct device *dev,
>  	const struct cpg_core_clk *core, const struct cpg_mssr_info *info,
> -	struct clk **clks, void __iomem *base,
> -	struct raw_notifier_head *notifiers)
> +	struct cpg_mssr_pub *pub)
>  {
> +	struct raw_notifier_head *notifiers =3D &pub->notifiers;
> +	void __iomem *base =3D pub->base0;
> +	struct clk **clks =3D pub->clks;
>  	const struct clk *parent;
>  	unsigned int mult =3D 1;
>  	unsigned int div =3D 1;
> @@ -431,7 +433,7 @@ struct clk * __init rcar_gen3_cpg_clk_register(stru=
ct device *dev,
>  			}
> =20
>  			writel(value, csn->reg);
> -			cpg_simple_notifier_register(notifiers, csn);
> +			cpg_simple_notifier_register(&pub->notifiers, csn);

This change isn't needed as you've added a notifiers variable at the
start of the function.

>  			break;
>  		}
> =20

[snip]

> diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c b/drivers/clk/renes=
as/renesas-cpg-mssr.c
> index 79e7a90c3b1b..7d5fba3aef19 100644
> --- a/drivers/clk/renesas/renesas-cpg-mssr.c
> +++ b/drivers/clk/renesas/renesas-cpg-mssr.c
> @@ -127,7 +127,6 @@ static const u16 srstclr_for_gen4[] =3D {
>   *
>   * @rcdev: Optional reset controller entity
>   * @dev: CPG/MSSR device
> - * @base: CPG/MSSR register block base address
>   * @reg_layout: CPG/MSSR register layout
>   * @rmw_lock: protects RMW register accesses
>   * @np: Device node in DT for this CPG/MSSR module
> @@ -143,6 +142,7 @@ static const u16 srstclr_for_gen4[] =3D {
>   *                 [].val: Saved values of SMSTPCR[]
>   * @reserved_ids: Temporary used, reserved id list
>   * @num_reserved_ids: Temporary used, number of reserved id list
> + * @pub: Data passed to clock registration callback
>   * @clks: Array containing all Core and Module Clocks
>   */
>  struct cpg_mssr_priv {
> @@ -150,16 +150,13 @@ struct cpg_mssr_priv {
>  	struct reset_controller_dev rcdev;
>  #endif
>  	struct device *dev;
> -	void __iomem *base;
>  	enum clk_reg_layout reg_layout;
> -	spinlock_t rmw_lock;

You can remove the documentation line for @base in the comment above.

>  	struct device_node *np;
> =20
>  	unsigned int num_core_clks;
>  	unsigned int num_mod_clks;
>  	unsigned int last_dt_core_clk;
> =20
> -	struct raw_notifier_head notifiers;

As above, you can remove the @notifiers entry from the comment above.

Thanks,

--=20
Paul Barker
--------------1OMPQVuedhTrUjkxWedXfoXo
Content-Type: application/pgp-keys; name="OpenPGP_0x27F4B3459F002257.asc"
Content-Disposition: attachment; filename="OpenPGP_0x27F4B3459F002257.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsFNBGS4BNsBEADEc28TO+aryCgRIuhxWAviuJl+f2TcZ1JeeaMzRLgSXKuXzkiI
g6JIVfNvThjwJaBmb7+/5+D7kDLJuutu9MFfOzTS0QOQWppwIPgbfktvMvwwsq3m
7e9Qb+S1LVeV0/ldZfuzgzAzHFDwmzryfIyt2JEbsBsGTq/QE+7hvLAe8R9xofIn
z6/IndiiTYhNCNf06nFPR4Y5ZDZPGb9aw5Jisqh+OSxtc0BFHDSV8/35yWM/JLQ1
Ja8AOHw1kP9KO+iE9rHMt0+7lH3mN1GBabxH26EdgFfPShsi14qmziLOuUlGLuwO
ApIYqvdtCs+zlMA8PsiJIMuxizZ6qCLur3r2b+/YXoJjuFDcax9M+Pr0D7rZX0Hk
6PW3dtvDQHfspwLY0FIlXbbtCfCqGLe47VaS7lvG0XeMlo3dUEsf707Q2h0+G1tm
wyeuWSPEzZQq/KI7JIFlxr3N/3VCdGa9qVf/40QF0BXPfJdcwTEzmPlYetRgA11W
bglw8DxWBv24a2gWeUkwBWFScR3QV4FAwVjmlCqrkw9dy/JtrFf4pwDoqSFUcofB
95u6qlz/PC+ho9uvUo5uIwJyz3J5BIgfkMAPYcHNZZ5QrpI3mdwf66im1TOKKTuf
3Sz/GKc14qAIQhxuUWrgAKTexBJYJmzDT0Mj4ISjlr9K6VXrQwTuj2zC4QARAQAB
zStQYXVsIEJhcmtlciA8cGF1bC5iYXJrZXIuY3RAYnAucmVuZXNhcy5jb20+wsGU
BBMBCgA+FiEE9KKf333+FIzPGaxOJ/SzRZ8AIlcFAmS4BNsCGwEFCQPCZwAFCwkI
BwIGFQoJCAsCBBYCAwECHgECF4AACgkQJ/SzRZ8AIlfxaQ/8CM36qjfad7eBfwja
cI1LlH1NwbSJ239rE0X7hU/5yra72egr3T5AUuYTt9ECNQ8Ld03BYhbC6hPki5rb
OlFM2hEPUQYeohcJ4Na5iIFpTxoIuC49Hp2ce6ikvt9Hc4O2FAntabg+9hE8WA4f
QWW+Qo5ve5OJ0sGylzu0mRZ2I3mTaDsxuDkXOICF5ggSdjT+rcd/pRVOugImjpZv
/jzSgUfKV2wcZ8vVK0616K21tyPiRjYtDQjJAKff8gBY6ZvP5REPl+fYNvZm1y4l
hsVupGHL3aV+BKooMsKRZIMTiKJCIy6YFKHOcgWFG62cuRrFDf4r54MJuUGzyeoF
1XNFzbe1ySoRfU/HrEuBNqC+1CEBiduumh89BitfDNh6ecWVLw24fjsF1Ke6vYpU
lK9/yGLV26lXYEN4uEJ9i6PjgJ+Q8fubizCVXVDPxmWSZIoJg8EspZ+Max03Lk3e
flWQ0E3l6/VHmsFgkvqhjNlzFRrj/k86IKdOi0FOd0xtKh1p34rQ8S/4uUN9XCVj
KtmyLfQgqPVEC6MKv7yFbextPoDUrFAzEgi4OBdqDJjPbdU9wUjONxuWJRrzRFcr
nTIG7oC4dae0p1rs5uTlaSIKpB2yulaJLKjnNstAj9G9Evf4SE2PKH4l4Jlo/Hu1
wOUqmCLRo3vFbn7xvfr1u0Z+oMTOOARkuAhwEgorBgEEAZdVAQUBAQdAcuNbK3VT
WrRYypisnnzLAguqvKX3Vc1OpNE4f8pOcgMDAQgHwsF2BBgBCgAgFiEE9KKf333+
FIzPGaxOJ/SzRZ8AIlcFAmS4CHACGwwACgkQJ/SzRZ8AIlc90BAAr0hmx8XU9KCj
g4nJqfavlmKUZetoX5RB9g3hkpDlvjdQZX6lenw3yUzPj53eoiDKzsM03Tak/KFU
FXGeq7UtPOfXMyIh5UZVdHQRxC4sIBMLKumBfC7LM6XeSegtaGEX8vSzjQICIbaI
roF2qVUOTMGal2mvcYEvmObC08bUZuMd4nxLnHGiej2t85+9F3Y7GAKsA25EXbbm
ziUg8IVXw3TojPNrNoQ3if2Z9NfKBhv0/s7x/3WhhIzOht+rAyZaaW+31btDrX4+
Y1XLAzg9DAfuqkL6knHDMd9tEuK6m2xCOAeZazXaNeOTjQ/XqCHmZ+691VhmAHCI
7Z7EBPh++TjEqn4ZH+4KPn6XD52+ruWXGbJP29zc+3bwQ+ZADfUaL3ADj69ySxzm
bO24USHBAg+BhZAZMBkbkygbTen/umT6tBxG91krqbKlDdc8mhGonBN6i+nz8qv1
6MdC5P1rDbo834rxNLvoFMSLCcpjoafiprl9qk0wQLq48WGphs9DX7V75ZAU5Lt6
yA+je8i799EZJsVlB933Gpj688H4csaZqEMBjq7vMvI+a5MnLCGcjwRhsUfogpRb
AWTx9ddVau4MJgEHzB7UU/VFyP2vku7XPj6mgSfSHyNVf2hqxwISQ8eZLoyxauOD
Y61QMX6YFL170ylToSFjH627h6TzlUDOMwRkuAiAFgkrBgEEAdpHDwEBB0Bibkmu
Sf7yECzrkBmjD6VGWNVxTdiqb2RuAfGFY9RjRsLB7QQYAQoAIBYhBPSin999/hSM
zxmsTif0s0WfACJXBQJkuAiAAhsCAIEJECf0s0WfACJXdiAEGRYIAB0WIQSiu8gv
1Xr0fIw/aoLbaV4Vf/JGvQUCZLgIgAAKCRDbaV4Vf/JGvZP9AQCwV06n3DZvuce3
/BtzG5zqUuf6Kp2Esgr2FrD4fKVbogD/ZHpXfi9ELdH/JTSVyujaTqhuxQ5B7UzV
CUIb1qbg1APIEA/+IaLJIBySehy8dHDZQXit/XQYeROQLTT9PvyM35rZVMGH6VG8
Zb23BPCJ3N0ISOtVdG402lSP0ilP/zSyQAbJN6F0o2tiPd558lPerFd/KpbCIp8N
kYaLlHWIDiN2AE3c6sfCiCPMtXOR7HCeQapGQBS/IMh1qYHffuzuEy7tbrMvjdra
VN9Rqtp7PSuRTbO3jAhm0Oe4lDCAK4zyZfjwiZGxnj9s1dyEbxYB2GhTOgkiX/96
Nw+m/ShaKqTM7o3pNUEs9J3oHeGZFCCaZBv97ctqrYhnNB4kzCxAaZ6K9HAAmcKe
WT2q4JdYzwB6vEeHnvxl7M0Dj9pUTMujW77Qh5IkUQLYZ2XQYnKAV2WI90B0R1p9
bXP+jqqkaNCrxKHV1tYOB6037CziGcZmiDneiTlM765MTLJLlHNqlXxDCzRwEazU
y9dNzITjVT0qhc6th8/vqN9dqvQaAGa13u86Gbv4XPYdE+5MXPM/fTgkKaPBYcIV
QMvLfoZxyaTk4nzNbBxwwEEHrvTcWDdWxGNtkWRZw0+U5JpXCOi9kBCtFrJ701UG
UFs56zWndQUS/2xDyGk8GObGBSRLCwsXsKsF6hSX5aKXHyrAAxEUEscRaAmzd6O3
ZyZGVsEsOuGCLkekUMF/5dwOhEDXrY42VR/ZxdDTY99dznQkwTt4o7FOmkY=3D
=3DsIIN
-----END PGP PUBLIC KEY BLOCK-----

--------------1OMPQVuedhTrUjkxWedXfoXo--

--------------YQ5C76oQXCTeK001HLbo2ZG3--

--------------YBLQ0JorpZHIEAmCAyeC6Y0a
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQSiu8gv1Xr0fIw/aoLbaV4Vf/JGvQUCZ7MhCgUDAAAAAAAKCRDbaV4Vf/JGvWbH
AP0SmohalwuqwIWVjH9ceGZjqqUNzIE7rwe4EX7d25ynJQD/TZ88Z3DQ+nrK/jIDJE3jmtKKlnHS
F9PXuxREjxw56gs=
=mEbh
-----END PGP SIGNATURE-----

--------------YBLQ0JorpZHIEAmCAyeC6Y0a--

