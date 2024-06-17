Return-Path: <linux-renesas-soc+bounces-6349-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A9190B35D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Jun 2024 17:05:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8AD46B3BE6D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Jun 2024 14:57:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23DE5383BD;
	Mon, 17 Jun 2024 14:03:33 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CB873B1A1;
	Mon, 17 Jun 2024 14:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718633013; cv=none; b=OYDsDwXsY26LOOgW+5eCmuiXVSYpViFzAvY/kRc5IIsVvA/rj4FAeBuyU9Rt+7Fjru0mOVYHffD9RcD1ZRCurEWbplqm2VlPDXzQrfNx3j5atO4Ld3gkScSiJ1sGqoRrSqpm3hK+iVLglAMqBte2uE09U/tCK0lkKqMzrP7ziYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718633013; c=relaxed/simple;
	bh=4Wk2uUHFGwBTd8590+ukd6SHK0BLyByUgTCriUPM4yI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rw1Xz+1cwjBPnBmC0bfJMtk7FazAusC5FvXD/a7dC4B7Y0omBEodCaUZa5r80UVXWVxxrgBq/0RoVWUslBbIXwfhdTWhgHtPYTxcyGn9dr/7XUdafqW8CUDJmviYAQXWU3o6YDUO1dcz79Nb0FA39RQExH2TAMcBLXobO+qyh7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.08,244,1712588400"; 
   d="asc'?scan'208";a="208261329"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 17 Jun 2024 23:03:27 +0900
Received: from [10.226.92.92] (unknown [10.226.92.92])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 134424394971;
	Mon, 17 Jun 2024 23:03:22 +0900 (JST)
Message-ID: <933ffa58-8092-4768-993d-cd62897d203d@bp.renesas.com>
Date: Mon, 17 Jun 2024 15:03:21 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [net-next PATCH 2/2] net: ravb: Fix R-Car RX frame size limit
Content-Language: en-GB
To: Andrew Lunn <andrew@lunn.ch>
Cc: Sergey Shtylyov <s.shtylyov@omp.ru>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Mitsuhiro Kimura <mitsuhiro.kimura.kc@renesas.com>, netdev@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240615103038.973-1-paul.barker.ct@bp.renesas.com>
 <20240615103038.973-3-paul.barker.ct@bp.renesas.com>
 <b1c10539-4d47-4752-8613-785b0ad83f5e@lunn.ch>
From: Paul Barker <paul.barker.ct@bp.renesas.com>
Organization: Renesas Electronics Corporation
In-Reply-To: <b1c10539-4d47-4752-8613-785b0ad83f5e@lunn.ch>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------3oRCa9JXa8rEzNUJpWGX5HXa"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------3oRCa9JXa8rEzNUJpWGX5HXa
Content-Type: multipart/mixed; boundary="------------sg0aRvFe07KycBt0Lop00RNu";
 protected-headers="v1"
From: Paul Barker <paul.barker.ct@bp.renesas.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Sergey Shtylyov <s.shtylyov@omp.ru>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Mitsuhiro Kimura <mitsuhiro.kimura.kc@renesas.com>, netdev@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Message-ID: <933ffa58-8092-4768-993d-cd62897d203d@bp.renesas.com>
Subject: Re: [net-next PATCH 2/2] net: ravb: Fix R-Car RX frame size limit
References: <20240615103038.973-1-paul.barker.ct@bp.renesas.com>
 <20240615103038.973-3-paul.barker.ct@bp.renesas.com>
 <b1c10539-4d47-4752-8613-785b0ad83f5e@lunn.ch>
In-Reply-To: <b1c10539-4d47-4752-8613-785b0ad83f5e@lunn.ch>

--------------sg0aRvFe07KycBt0Lop00RNu
Content-Type: multipart/mixed; boundary="------------mvw0FoEI0clK5poGQBBl8Kra"

--------------mvw0FoEI0clK5poGQBBl8Kra
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 16/06/2024 02:23, Andrew Lunn wrote:
> On Sat, Jun 15, 2024 at 11:30:38AM +0100, Paul Barker wrote:
>> The RX frame size limit should not be based on the current MTU setting=
=2E
>> Instead it should be based on the hardware capabilities.
>=20
> This is a bit odd. MTU is Maximum Transmission Unit, so clearly is
> about Tx. MRU does not really exist. Does TCP allow for asymmetric
> MTU/MRU? Does MTU discovery work correctly for this?
>=20
> In general, it seems like drivers implement min(MTU, MRU) and nothing
> more. Do you have a real use case for this asymmetry?
>=20
>       Andrew

Hi Andrew,

This change is based on my understanding of MTU/MRU, on the specs of the
RZ SoCs I'm working with (primarily RZ/G2L family, RZ/G3S and RZ/G2H)
and on some testing. My goal here is just to make the capabilities of
the hardware available to users.

For the RZ/G2L family and RZ/G3S, we can only support an MTU of up to
1500 bytes, but we can receive frames of up to (IIRC) 8192 bytes. I have
tested sending jumbo frames to an RZ/G2L device using both iperf3 and
ping and I see no errors.

* For iperf3 RX testing, the RZ/G2L is only responding with acks. These
  are small regardless of the size of the received packets, so the
  mis-match in MTU between the two hosts causes no issue.

* For ping testing, the RZ/G2L will give a fragmented response to the
  ping packet which the other host can reassemble.

For the RZ/G2H, we support sending frames of up to 2047 bytes but we can
receive frames of up to 4092 bytes. The driver will need a few more
changes to handle reception of packets >2kB in size, but this is
something we can do in the near future.

Is there any reason why we shouldn't support this? I am by no means an
expert in the Linux networking internals so there may be things I'm
missing.

Thanks,

--=20
Paul Barker
--------------mvw0FoEI0clK5poGQBBl8Kra
Content-Type: application/pgp-keys; name="OpenPGP_0x27F4B3459F002257.asc"
Content-Disposition: attachment; filename="OpenPGP_0x27F4B3459F002257.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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3D
=3DsIIN
-----END PGP PUBLIC KEY BLOCK-----

--------------mvw0FoEI0clK5poGQBBl8Kra--

--------------sg0aRvFe07KycBt0Lop00RNu--

--------------3oRCa9JXa8rEzNUJpWGX5HXa
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQSiu8gv1Xr0fIw/aoLbaV4Vf/JGvQUCZnBCKQUDAAAAAAAKCRDbaV4Vf/JGvV1b
AP9FgB7lkBOCd+twlXt7EsbaCUytaGIfCRnM01oKcKSbjwEAkFllMCdFLlIhP3RXzaFXpygvBqKL
vA9hUFLCIeoR+AY=
=5ZCu
-----END PGP SIGNATURE-----

--------------3oRCa9JXa8rEzNUJpWGX5HXa--

