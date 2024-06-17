Return-Path: <linux-renesas-soc+bounces-6351-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EDF2D90B59A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Jun 2024 18:00:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 359DBB24962
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Jun 2024 15:06:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBD4814D29C;
	Mon, 17 Jun 2024 14:20:51 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B921314431B;
	Mon, 17 Jun 2024 14:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718634051; cv=none; b=tU/IzkOh0KC5kPXTXNSw54cScu01+8OWPCNx5AiCEXYs70EgtDkLZR23iyibrTVwgT7qaLrPGFukHkhG9xsJrI+FppJ+HOYdo/iOqOjuZDVigEtJNC8DJZGLDCLNmg/bzIhOgG/SqzwtmY/YL0RYmOa5UunbwmocYpvkzDkmlT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718634051; c=relaxed/simple;
	bh=LBgqC8IZm7VqHKZVzVoxowDTpsG6xwMKBK6SPTTMDiY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h243+RdU1b7kdpY6XiQ84/5lBlyjywXTa0VTxbDIt4JdjqcaDVaN2vY/qmjrr+3GmM2MuDErUSjtiElIpVfRmw9fsLDg7oYnWUEMscZcEOMbePLhyL1LBfKT3/0/7bED6xRfK0A1PRhFegJMKShm0kU2WoPFZuW57H6SrZTFBbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.08,244,1712588400"; 
   d="asc'?scan'208";a="208262803"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 17 Jun 2024 23:20:47 +0900
Received: from [10.226.92.92] (unknown [10.226.92.92])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 35E33439D038;
	Mon, 17 Jun 2024 23:20:42 +0900 (JST)
Message-ID: <a6f2700b-8b90-4dd7-b8cf-0a061b790b36@bp.renesas.com>
Date: Mon, 17 Jun 2024 15:20:41 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [net-next PATCH 2/2] net: ravb: Fix R-Car RX frame size limit
Content-Language: en-GB
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Sergey Shtylyov <s.shtylyov@omp.ru>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Mitsuhiro Kimura <mitsuhiro.kimura.kc@renesas.com>, netdev@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240615103038.973-1-paul.barker.ct@bp.renesas.com>
 <20240615103038.973-3-paul.barker.ct@bp.renesas.com>
 <20240615130439.GM382677@ragnatech.se>
From: Paul Barker <paul.barker.ct@bp.renesas.com>
Organization: Renesas Electronics Corporation
In-Reply-To: <20240615130439.GM382677@ragnatech.se>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------wulCbgkreFkWwlcbfMTg0YSj"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------wulCbgkreFkWwlcbfMTg0YSj
Content-Type: multipart/mixed; boundary="------------gcL5ZRsLg00ezCA9MUSzjSVW";
 protected-headers="v1"
From: Paul Barker <paul.barker.ct@bp.renesas.com>
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Sergey Shtylyov <s.shtylyov@omp.ru>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Mitsuhiro Kimura <mitsuhiro.kimura.kc@renesas.com>, netdev@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Message-ID: <a6f2700b-8b90-4dd7-b8cf-0a061b790b36@bp.renesas.com>
Subject: Re: [net-next PATCH 2/2] net: ravb: Fix R-Car RX frame size limit
References: <20240615103038.973-1-paul.barker.ct@bp.renesas.com>
 <20240615103038.973-3-paul.barker.ct@bp.renesas.com>
 <20240615130439.GM382677@ragnatech.se>
In-Reply-To: <20240615130439.GM382677@ragnatech.se>

--------------gcL5ZRsLg00ezCA9MUSzjSVW
Content-Type: multipart/mixed; boundary="------------f0WuzJ5XyOwLarbWSwgdzs3C"

--------------f0WuzJ5XyOwLarbWSwgdzs3C
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 15/06/2024 14:04, Niklas S=C3=B6derlund wrote:
> Hi Paul,
>=20
> Thanks for your work.
>=20
> On 2024-06-15 11:30:38 +0100, Paul Barker wrote:
>> The RX frame size limit should not be based on the current MTU setting=
=2E
>> Instead it should be based on the hardware capabilities.
>>
>> Fixes: c156633f1353 ("Renesas Ethernet AVB driver proper")
>=20
> I agree with the change the RFLR.RFL setting should not be connected to=
=20
> the MTU setting. And this likely comes from the early days of the drive=
r=20
> where neither Rx or Tx supported multiple descriptors for each packet. =
=20
> In those days the single descriptor used for each packet was tied to th=
e=20
> MTU setting. So likely the fixes tag should point to a later commit?>=20

If my understanding of MTU & MRU are correct, even with a single
descriptor we can always accept the same number of bytes regardless of
the current MTU.

> This is a great find and shows a flaw in the driver. But limiting the=20
> size of each descriptor used for Tx is only half the solution right? As=
=20
> the driver now supports multiple descriptors for Tx (on GbEth) the=20
> driver allows setting an MTU larger then the maximum size for single=20
> descriptor on those devices. But the xmit function of the driver still =

> hardcode the maximum of 2 descriptors for each Tx packet. And it only=20
> uses the two descriptors to align the data to hardware constrains.
>=20
> Is it not incorrect for the driver to accept an MTU larger then the=20
> maximum size of a single descriptor with the current Tx implementation?=
 =20
> The driver can only support larger MTU settings for Rx, but not Tx ATM.=

>=20
> I think the complete fix is to extend ravb_start_xmit() to fully suppor=
t=20
> split descriptors for packets larger then the maximum single descriptor=
=20
> size. Not just to align the packet between a DT_FSTART and DT_FEND=20
> descriptor when needed.

For the RZ SoCs I have looked at, this isn't an issue. We support
transmitting frames of slightly over 1500 bytes on the SoCs with GbEth
IP, or 2047 bytes on the SoCs with R-Car AVB IP (e.g. RZ/G2H). Given
that a single descriptor can cover up to 4095 bytes of data (with its 12
bit DS field), we don't need split TX descriptors for either of these.

Thanks,

--=20
Paul Barker
--------------f0WuzJ5XyOwLarbWSwgdzs3C
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

--------------f0WuzJ5XyOwLarbWSwgdzs3C--

--------------gcL5ZRsLg00ezCA9MUSzjSVW--

--------------wulCbgkreFkWwlcbfMTg0YSj
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQSiu8gv1Xr0fIw/aoLbaV4Vf/JGvQUCZnBGOQUDAAAAAAAKCRDbaV4Vf/JGvbd8
APwMiYBePqtIRpEbPzl1Lwzu9gHICHwFFzUYOUwX55l1CwD+P0vPtGK2ToYrBA1i4cvbrksRxElV
OfA6l4Mmc5JB2gc=
=EaxN
-----END PGP SIGNATURE-----

--------------wulCbgkreFkWwlcbfMTg0YSj--

