Return-Path: <linux-renesas-soc+bounces-13721-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 732F2A46373
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Feb 2025 15:47:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B79D61792C7
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Feb 2025 14:47:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1952221CC48;
	Wed, 26 Feb 2025 14:46:45 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2346E3209;
	Wed, 26 Feb 2025 14:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740581205; cv=none; b=ZooFMRXOGAvmWB8m/fB1ZGmTEjtZSpWTT2DZ+2MDHNzoFQzsTMrg6MCRemu0K28dNTpOurR0WukKTbsEtK9ktCxOy515XdgOl0/aEXyiEocdPKFC9N1zyEAjOzkeo6tgABUHCSm1rMSmwfCTNcAyqct9MJIs+IHmz3zFWRp4r94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740581205; c=relaxed/simple;
	bh=agp7jtzUO2c9Z8k+/9oj5UauhbN4dN90fCMt+PYatUg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j2/7UOn2JF2RiBqL3cTP1g2UStAsmkx+HkawHJk1zprkrRnyPWAm0UZVkScV9bUd9T13Oe5Md+gYDJnNNu5QKNeuvSAMUUzuivrz1eZhkImYRNUTCw7U1j3E9uGIoW2i6paV8BKicIElILzJPSoD+aNiLdFFIsboAtr0ulUsQTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: aK9IqcVPSCmUF10jJnwz3Q==
X-CSE-MsgGUID: lels0FDnSl65jyZ8SE+33Q==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 26 Feb 2025 23:46:41 +0900
Received: from [10.226.93.138] (unknown [10.226.93.138])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 88F5F403BC9A;
	Wed, 26 Feb 2025 23:46:39 +0900 (JST)
Message-ID: <5beab0aa-ef61-4a9e-882a-99b6d9220879@bp.renesas.com>
Date: Wed, 26 Feb 2025 14:46:37 +0000
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 12/13] arm64: dts: renesas: Add initial support for
 renesas RZ/T2H eval board
Content-Language: en-GB
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Thierry Bultel <thierry.bultel.yh@bp.renesas.com>, thierry.bultel@linatsea.fr
Cc: linux-renesas-soc@vger.kernel.org, geert@linux-m68k.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250226130935.3029927-1-thierry.bultel.yh@bp.renesas.com>
 <20250226130935.3029927-13-thierry.bultel.yh@bp.renesas.com>
 <9e973021-8f10-4870-8534-29c7669c7c74@kernel.org>
From: Paul Barker <paul.barker.ct@bp.renesas.com>
In-Reply-To: <9e973021-8f10-4870-8534-29c7669c7c74@kernel.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------MtSXPOi1jblFPh60l5klKt0w"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------MtSXPOi1jblFPh60l5klKt0w
Content-Type: multipart/mixed; boundary="------------ELOeBP4c4kHw8aSvpoxlU1j6";
 protected-headers="v1"
From: Paul Barker <paul.barker.ct@bp.renesas.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Thierry Bultel <thierry.bultel.yh@bp.renesas.com>, thierry.bultel@linatsea.fr
Cc: linux-renesas-soc@vger.kernel.org, geert@linux-m68k.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Message-ID: <5beab0aa-ef61-4a9e-882a-99b6d9220879@bp.renesas.com>
Subject: Re: [PATCH v3 12/13] arm64: dts: renesas: Add initial support for
 renesas RZ/T2H eval board
References: <20250226130935.3029927-1-thierry.bultel.yh@bp.renesas.com>
 <20250226130935.3029927-13-thierry.bultel.yh@bp.renesas.com>
 <9e973021-8f10-4870-8534-29c7669c7c74@kernel.org>
In-Reply-To: <9e973021-8f10-4870-8534-29c7669c7c74@kernel.org>

--------------ELOeBP4c4kHw8aSvpoxlU1j6
Content-Type: multipart/mixed; boundary="------------aNtAtrUNDAIxA7q6AYYG9AG5"

--------------aNtAtrUNDAIxA7q6AYYG9AG5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 26/02/2025 14:23, Krzysztof Kozlowski wrote:
> On 26/02/2025 14:09, Thierry Bultel wrote:
>> Add the initial device tree for the RZ/T2H evaluation board.
>>
>> Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
>> Reviewed-by: Paul Barker <paul.barker.ct@bp.renesas.com>
>=20
> Where did this happen? I see tags only to few patches, not all of them.=

>=20
> Same questions for all other places.
>=20
> Best regards,
> Krzysztof

Hi Krzysztof,

We've recently switched to a patchwork instance and internal mailing
list for review within our team before sending things to the mailing
list. We did a round of internal review and the Reviewed-by tags from
this have accidentally been included here. It can easily be fixed.

Thierry, could you re-send a v4 series keeping my Reviewed-by tag only
on patch 7/13, as that was added on the public mailing list.

Thanks,

--=20
Paul Barker
--------------aNtAtrUNDAIxA7q6AYYG9AG5
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

--------------aNtAtrUNDAIxA7q6AYYG9AG5--

--------------ELOeBP4c4kHw8aSvpoxlU1j6--

--------------MtSXPOi1jblFPh60l5klKt0w
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQSiu8gv1Xr0fIw/aoLbaV4Vf/JGvQUCZ78pTgUDAAAAAAAKCRDbaV4Vf/JGvTwQ
AP4v5qXZ0PRRjjhxDA7Oqsjm/5v7StEMg0dw5LQclRN8HwEA85g0uBf8eFF5sQ9JNxOILZlDffSz
PhA8SAfybtlZDQE=
=Iqtm
-----END PGP SIGNATURE-----

--------------MtSXPOi1jblFPh60l5klKt0w--

