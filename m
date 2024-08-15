Return-Path: <linux-renesas-soc+bounces-7834-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 425EF952BF9
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Aug 2024 12:24:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E0423285288
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Aug 2024 10:24:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D35A1BDA86;
	Thu, 15 Aug 2024 09:10:38 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FEC71B8EAF;
	Thu, 15 Aug 2024 09:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723713038; cv=none; b=F0GWAFbiyPFZ8bNSXCF06O5MMoaDo7A26eorGmoREvVsNK65nhvicWJCe95xe/rtAqqoBGUSHECcMdhd9sVUpztirxKzzH8fgwzm7YPcIWHnfnDGCtH0GpuuJ4rtgj1szRCDrrKBPPYSrAAFw+WR3O19ysq30wIsrcCZpMP+KIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723713038; c=relaxed/simple;
	bh=gXbtDV3Den7rYv5gxqLb1TBgiTVBk3gTcwJQqn4DZto=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hmN7rNlG/I1hR6U+F419+MBmK3i+i4O90QK3/vCdBXCMpB24kybJCFvpLz+sbJNGHglpCjexS/TTnMyHPc79udGQJEnPMR/XzlxZ/noCLt+ZTC419/9wnrQU8X5y979Fh1Q95+8/FEVmS76wu74Ef7V2D5mZgF+Ek4JRnx6CBl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.10,148,1719846000"; 
   d="asc'?scan'208";a="215659341"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 15 Aug 2024 18:10:27 +0900
Received: from [10.226.92.106] (unknown [10.226.92.106])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 6B69941B0FBE;
	Thu, 15 Aug 2024 18:10:23 +0900 (JST)
Message-ID: <4e1034fb-daf6-4bdb-80d2-62536394fc2d@bp.renesas.com>
Date: Thu, 15 Aug 2024 10:10:21 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [net-next PATCH 2/2] net: ravb: Fix R-Car RX frame size limit
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
 <933ffa58-8092-4768-993d-cd62897d203d@bp.renesas.com>
 <ed455f3f-dcb3-4654-af78-6ff6c6c5c22e@lunn.ch>
 <524873e1-d770-4f29-a374-dab99fe87c14@bp.renesas.com>
 <d5e2d054-e309-4382-a211-9fa9a0e83783@lunn.ch>
Content-Language: en-GB
From: Paul Barker <paul.barker.ct@bp.renesas.com>
Organization: Renesas Electronics Corporation
In-Reply-To: <d5e2d054-e309-4382-a211-9fa9a0e83783@lunn.ch>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------erULbL10teRUTagGlpnZc7J2"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------erULbL10teRUTagGlpnZc7J2
Content-Type: multipart/mixed; boundary="------------VVx40Kl2aWXzy9BT3U745Et1";
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
Message-ID: <4e1034fb-daf6-4bdb-80d2-62536394fc2d@bp.renesas.com>
Subject: Re: [net-next PATCH 2/2] net: ravb: Fix R-Car RX frame size limit
References: <20240615103038.973-1-paul.barker.ct@bp.renesas.com>
 <20240615103038.973-3-paul.barker.ct@bp.renesas.com>
 <b1c10539-4d47-4752-8613-785b0ad83f5e@lunn.ch>
 <933ffa58-8092-4768-993d-cd62897d203d@bp.renesas.com>
 <ed455f3f-dcb3-4654-af78-6ff6c6c5c22e@lunn.ch>
 <524873e1-d770-4f29-a374-dab99fe87c14@bp.renesas.com>
 <d5e2d054-e309-4382-a211-9fa9a0e83783@lunn.ch>
In-Reply-To: <d5e2d054-e309-4382-a211-9fa9a0e83783@lunn.ch>

--------------VVx40Kl2aWXzy9BT3U745Et1
Content-Type: multipart/mixed; boundary="------------0pJW0lJQaD5HaO0BUI0PAW4f"

--------------0pJW0lJQaD5HaO0BUI0PAW4f
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 13/08/2024 15:06, Andrew Lunn wrote:
>> Apologies, my response here is abysmally late due to illness, other
>> priorities and then the loss of my main dev box.
>=20
> Not a problem, life happens.
>=20
>> As you've said, a number of devices do not limit received packet size =
to
>> the MTU. There are many applications, other than a gateway, where usin=
g
>> jumbo packets in even just one direction would be beneficial. For
>> example if an application needs to receive large amounts of data but
>> only needs to send back control and acknowledgement messages. I think =
we
>> should support this where possible. This is the thought behind the fir=
st
>> patch in this series as the GbEth IP present in the RZ/G2L and other
>> Renesas SoCs has a very asymmetric capability (it can receive 8000 byt=
e
>> frames but only transmit 1522 byte frames).
>>
>> If we explicitly do not wish to support this, that restriction should =
be
>> documented and then (maybe over time) handled uniformly for all networ=
k
>> drivers.
>>
>> I'm planning to submit v2 of this series shortly.
>=20
> Does the hardware support scatter/gather? How does supporting jumbo
> receive affect memory usage? Can you give the hardware a number of 2K
> buffers, and it will use one for a typical packet, and 4 for a jumbo
> frame?

This is exactly what happens. After recent changes [1], we use 2kB RX
buffers and an 8kB maximum RX frame size for the GbEth IP. The hardware
will split the received frame over one or more buffers as needed. As we
would allocate a ring of 2kB buffers in any case, supporting jumbo
packets doesn't cause any increase in memory usage or in CPU time spent
in memory management.

[1]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/c=
ommit/?id=3D966726324b7b14009216fda33b47e0bc003944c6

Thanks,

--=20
Paul Barker
--------------0pJW0lJQaD5HaO0BUI0PAW4f
Content-Type: application/pgp-keys; name="OpenPGP_0x27F4B3459F002257.asc"
Content-Disposition: attachment; filename="OpenPGP_0x27F4B3459F002257.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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3D
=3DsIIN
-----END PGP PUBLIC KEY BLOCK-----

--------------0pJW0lJQaD5HaO0BUI0PAW4f--

--------------VVx40Kl2aWXzy9BT3U745Et1--

--------------erULbL10teRUTagGlpnZc7J2
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQSiu8gv1Xr0fIw/aoLbaV4Vf/JGvQUCZr3F/gUDAAAAAAAKCRDbaV4Vf/JGvYDB
AP9ii2E2RVOgViQWR4hwEteXogdhQevtQDhtKYFohrPM6gEAicbbVIF6CnteUb65/fPI6HFXJdjs
y5kNFqt69TdVwAk=
=kSLz
-----END PGP SIGNATURE-----

--------------erULbL10teRUTagGlpnZc7J2--

