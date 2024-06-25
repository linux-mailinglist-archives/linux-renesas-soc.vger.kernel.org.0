Return-Path: <linux-renesas-soc+bounces-6749-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 79376916D97
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Jun 2024 17:56:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BEE93B22332
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Jun 2024 15:56:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5E6D16EBF4;
	Tue, 25 Jun 2024 15:56:25 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A1FF16F91E;
	Tue, 25 Jun 2024 15:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719330985; cv=none; b=N2OSV7Hk0/iMlJURxQSrpzezxhAk9i3nSK5tTO9GETzAr17bTk7GoE3k3cAZtxa0o8FTFix0iTMNcrULCx59EBeDSw6gMECbWQzpGnlotTOtZrR8QB2zMeXRGzC30PaK+oAPQ3HlsB+I6RhoEmdDgaI3EQGeAMJQ4js3S1B4iy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719330985; c=relaxed/simple;
	bh=n1FFf5mujbNwYqKy/el2+g6OPIJw7BUE+uVESDPrvtQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NufbZy085AYElP870pFFsaQFffdQ7j74TYB2UPusL4HE8V96/3QfC+Ykvdbu0XtvOxjvco4kUOtUHCNJoWhrdTdjAPZisA8+bGkmMtI7AjawA7Yc795Uvf5ClfKjh9J3ZdiGwp9qIufb/kNzHlTO6SKfAmFRq3CeGy9fnrABu0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.08,264,1712588400"; 
   d="asc'?scan'208";a="209250203"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 26 Jun 2024 00:51:12 +0900
Received: from [10.226.92.125] (unknown [10.226.92.125])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id DC0BF400D0C1;
	Wed, 26 Jun 2024 00:51:09 +0900 (JST)
Message-ID: <796db874-b88e-4e7b-aebb-7b0a0361843c@bp.renesas.com>
Date: Tue, 25 Jun 2024 16:51:08 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [net-next,v9] net: ethernet: rtsn: Add support for Renesas
 Ethernet-TSN
To: Paolo Abeni <pabeni@redhat.com>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20240618090824.553018-1-niklas.soderlund+renesas@ragnatech.se>
 <716088809af5c646b3f1342656dbb08969becaaa.camel@redhat.com>
 <20240620115051.GW382677@ragnatech.se>
 <4bc6795cb1b731f47d2c0b3f06f106f59abf0637.camel@redhat.com>
Content-Language: en-GB
From: Paul Barker <paul.barker.ct@bp.renesas.com>
Organization: Renesas Electronics Corporation
In-Reply-To: <4bc6795cb1b731f47d2c0b3f06f106f59abf0637.camel@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------nIhq4e2lwqrmhMK7LsjZX6S1"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------nIhq4e2lwqrmhMK7LsjZX6S1
Content-Type: multipart/mixed; boundary="------------jZ0SiwluMZy9D0NHvgRw5B1o";
 protected-headers="v1"
From: Paul Barker <paul.barker.ct@bp.renesas.com>
To: Paolo Abeni <pabeni@redhat.com>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Message-ID: <796db874-b88e-4e7b-aebb-7b0a0361843c@bp.renesas.com>
Subject: Re: [net-next,v9] net: ethernet: rtsn: Add support for Renesas
 Ethernet-TSN
References: <20240618090824.553018-1-niklas.soderlund+renesas@ragnatech.se>
 <716088809af5c646b3f1342656dbb08969becaaa.camel@redhat.com>
 <20240620115051.GW382677@ragnatech.se>
 <4bc6795cb1b731f47d2c0b3f06f106f59abf0637.camel@redhat.com>
In-Reply-To: <4bc6795cb1b731f47d2c0b3f06f106f59abf0637.camel@redhat.com>

--------------jZ0SiwluMZy9D0NHvgRw5B1o
Content-Type: multipart/mixed; boundary="------------drz42KU1z0pbXahb33cpo4m0"

--------------drz42KU1z0pbXahb33cpo4m0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Paolo, Niklas,

On 20/06/2024 16:23, Paolo Abeni wrote:
> On Thu, 2024-06-20 at 13:50 +0200, Niklas S=C3=B6derlund wrote:
>> On 2024-06-20 13:13:21 +0200, Paolo Abeni wrote:
>>>
>>> skb allocation is preferred at receive time, so that the sk_buff itse=
lf
>>> is hot in the cache. Adapting to such style would likely require a
>>> larger refactor, so feel free to avoid it.
>>
>> This is good feedback. There are advanced features in TSN that I would=
=20
>> like to work on in the future. One of them is to improve the Rx path t=
o=20
>> support split descriptors allowing for larger MTU. That too would=20
>> require invasive changes in this code. I will make a note of it and tr=
y=20
>> to do both.
>=20
> In the context of a largish refactor, then I suggest additional
> investigating replacing napi_gro_receive() with napi_gro_frags().
>=20
> The latter should provide the best performances for GRO-ed traffic.

This prompted me to try converting ravb_rx_gbeth() in the ravb driver to
use napi_get_frags()/napi_gro_frags(). The result of that change was no
improvement in TCP RX performance and a roughly 10% loss in UDP RX
performance on the RZ/G2UL. i.e. napi_gro_frags() is worse than
napi_gro_receive() in this driver.

I guess using napi_gro_frags() removes the need to copy data if you need
to add space to the first fragment for a struct skb_shared_info. For the
GbEth IP, we reserve space for the shared info structure in every
fragment buffer anyway. For <=3D1500 byte packets there is no benefit to
changing this, but for larger packets perhaps we would see better
efficiency if all of each 2kB fragment buffer could be used for packet
data, with space for the shared info being allocated separately via
napi_get_frags(). Some thoughts for the future I guess.

Am I missing anything here about why napi_gro_frags() should be better?

Thanks,

--=20
Paul Barker
--------------drz42KU1z0pbXahb33cpo4m0
Content-Type: application/pgp-keys; name="OpenPGP_0x27F4B3459F002257.asc"
Content-Disposition: attachment; filename="OpenPGP_0x27F4B3459F002257.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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3D
=3DsIIN
-----END PGP PUBLIC KEY BLOCK-----

--------------drz42KU1z0pbXahb33cpo4m0--

--------------jZ0SiwluMZy9D0NHvgRw5B1o--

--------------nIhq4e2lwqrmhMK7LsjZX6S1
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQSiu8gv1Xr0fIw/aoLbaV4Vf/JGvQUCZnrnbAUDAAAAAAAKCRDbaV4Vf/JGvT27
AQCjjCgn5mjoUHQValsWHrY++7tjBqDDboyxK0xoec/viAEAuP2PGSMi60t35bU/EHG8W2KXCtPy
QX/nZ7N9ZXA2Mgo=
=eb+y
-----END PGP SIGNATURE-----

--------------nIhq4e2lwqrmhMK7LsjZX6S1--

