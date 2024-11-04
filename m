Return-Path: <linux-renesas-soc+bounces-10287-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BCEC9BBE56
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Nov 2024 20:59:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3FD8A1C20E44
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Nov 2024 19:59:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E9C71D094B;
	Mon,  4 Nov 2024 19:59:53 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64D531CFEDB;
	Mon,  4 Nov 2024 19:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730750393; cv=none; b=ryqy0OYUwEOlQNP7EPRMlL8zAUkmG0B3isHLYcai2C9uf/GlyFzVQ0Gp82KB2ZYnj/bC20rm8ItJnqRUz9hSTcRm5b2FadCXG1o3EC77r0r3YcikWog6L8zYObit8eO40JyR34NgepT9mYKIEsKim3zsUu8oiH1qEFp2s9OCjqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730750393; c=relaxed/simple;
	bh=jbjOKVANvclpUTixXs2kQAQDzLiGZTAn32T4/xyTNtk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kE2M8O0RESiK9wzeUdgq6uKVkwz07bRWVpkLgaGXQ3zMTK4kr7G42N0iZ6OawUbvS4Vr/UyjRA5JNYDiXHNnp5C6zZKUu0OREk5BvajRfAGlt+l5t1HGAnrkuRu4PqVv7YMg9Mz9JRXz7/V+BnngL6AlLj1Q75J8pz+62AoR+QY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.11,257,1725289200"; 
   d="asc'?scan'208";a="227829294"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 05 Nov 2024 04:59:47 +0900
Received: from [10.226.93.217] (unknown [10.226.93.217])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 40B2C400618A;
	Tue,  5 Nov 2024 04:59:42 +0900 (JST)
Message-ID: <f4a34b8a-5d3f-41da-a2f0-7fc9d808d790@bp.renesas.com>
Date: Mon, 4 Nov 2024 19:59:41 +0000
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH/RFC v2] MAINTAINERS: Re-add cancelled Renesas driver
 sections
Content-Language: en-GB
To: Sergey Shtylyov <sergei.shtylyov@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 James Bottomley <James.Bottomley@hansenpartnership.com>,
 Arnd Bergmann <arnd@arndb.de>
Cc: linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org,
 linux-ide@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-kernel@vger.kernel.org, Simon Horman <horms@kernel.org>,
 Niklas Cassel <cassel@kernel.org>
References: <90447fa332b6f73bffcb486ccfe2515c59546253.1730717649.git.geert+renesas@glider.be>
 <e7123fcb-048c-4415-adb5-97b9f032e6ff@gmail.com>
From: Paul Barker <paul.barker.ct@bp.renesas.com>
In-Reply-To: <e7123fcb-048c-4415-adb5-97b9f032e6ff@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------lfaRTfq7xxgxfR59uiOdt40i"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------lfaRTfq7xxgxfR59uiOdt40i
Content-Type: multipart/mixed; boundary="------------bF3mpbBUAzRevzt3a8G0dNGT";
 protected-headers="v1"
From: Paul Barker <paul.barker.ct@bp.renesas.com>
To: Sergey Shtylyov <sergei.shtylyov@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 James Bottomley <James.Bottomley@hansenpartnership.com>,
 Arnd Bergmann <arnd@arndb.de>
Cc: linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org,
 linux-ide@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-kernel@vger.kernel.org, Simon Horman <horms@kernel.org>,
 Niklas Cassel <cassel@kernel.org>
Message-ID: <f4a34b8a-5d3f-41da-a2f0-7fc9d808d790@bp.renesas.com>
Subject: Re: [PATCH/RFC v2] MAINTAINERS: Re-add cancelled Renesas driver
 sections
References: <90447fa332b6f73bffcb486ccfe2515c59546253.1730717649.git.geert+renesas@glider.be>
 <e7123fcb-048c-4415-adb5-97b9f032e6ff@gmail.com>
In-Reply-To: <e7123fcb-048c-4415-adb5-97b9f032e6ff@gmail.com>

--------------bF3mpbBUAzRevzt3a8G0dNGT
Content-Type: multipart/mixed; boundary="------------b6Br0Rk0b0pvfc4JazypEaPi"

--------------b6Br0Rk0b0pvfc4JazypEaPi
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 04/11/2024 19:29, Sergey Shtylyov wrote:
> On 11/4/24 2:05 PM, Geert Uytterhoeven wrote:
>=20
>> Removing full driver sections also removed mailing list entries, causi=
ng
>> submitters of future patches to forget CCing these mailing lists.
>>
>> Hence re-add the sections for the Renesas Ethernet AVB, R-Car SATA, an=
d
>> SuperH Ethernet drivers.  Add people who volunteered to maintain these=

>> drivers (thanks a lot!).
>>
>> Fixes: 6e90b675cf942e50 ("MAINTAINERS: Remove some entries due to vari=
ous compliance requirements.")
>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>> Reviewed-by: Simon Horman <horms@kernel.org>
>> Acked-by: Niklas Cassel <cassel@kernel.org>
> [...]
>=20
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 13f4c23281f89332..b04d678240e80ec9 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -19578,6 +19578,16 @@ S:	Supported
>>  F:	Documentation/devicetree/bindings/i2c/renesas,iic-emev2.yaml
>>  F:	drivers/i2c/busses/i2c-emev2.c
>> =20
>> +RENESAS ETHERNET AVB DRIVER
>> +M:	Paul Barker <paul.barker.ct@bp.renesas.com>
>> +M:	Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.se>
>=20
>    M:, not R:?

I would prefer these to be M: regardless of which of us is listed
(always send patches to this person, not just should "should be Cc'd",
as explained at the top of the file).

>=20
> [...]
>> @@ -19627,6 +19637,14 @@ F:	Documentation/devicetree/bindings/i2c/rene=
sas,rmobile-iic.yaml
>>  F:	drivers/i2c/busses/i2c-rcar.c
>>  F:	drivers/i2c/busses/i2c-sh_mobile.c
>> =20
>> +RENESAS R-CAR SATA DRIVER
>> +M:	Geert Uytterhoeven <geert+renesas@glider.be>
>=20
>    M:, not R:?
>=20
>> +L:	linux-ide@vger.kernel.org
>> +L:	linux-renesas-soc@vger.kernel.org
>> +S:	Supported
>> +F:	Documentation/devicetree/bindings/ata/renesas,rcar-sata.yaml
>> +F:	drivers/ata/sata_rcar.c
>> +
>>  RENESAS R-CAR THERMAL DRIVERS
>>  M:	Niklas S=C3=B6derlund <niklas.soderlund@ragnatech.se>
>>  L:	linux-renesas-soc@vger.kernel.org
>> @@ -19702,6 +19720,16 @@ S:	Supported
>>  F:	Documentation/devicetree/bindings/i2c/renesas,rzv2m.yaml
>>  F:	drivers/i2c/busses/i2c-rzv2m.c
>> =20
>> +RENESAS SUPERH ETHERNET DRIVER
>> +M:	Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.se>
>=20
>    M:, not R:?
>=20
>> +L:	netdev@vger.kernel.org
>> +L:	linux-renesas-soc@vger.kernel.org
>> +F:	Documentation/devicetree/bindings/net/renesas,ether.yaml
>> +F:	drivers/net/ethernet/renesas/Kconfig
>> +F:	drivers/net/ethernet/renesas/Makefile
>> +F:	drivers/net/ethernet/renesas/sh_eth*
>> +F:	include/linux/sh_eth.h
>> +
>>  RENESAS USB PHY DRIVER
>>  M:	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
>>  L:	linux-renesas-soc@vger.kernel.org
>=20
>    Niklas, Paul, I hope you won't mind me re-joining the sh_eth/ravb
> entries as a reviewer when the fog clears a bit?
>    (Besides, I'm still on vacation -- till 11/11...)

I don't mind at all, I hope things get cleared up soon so that you can
be re-added. And, enjoy the rest of your vacation!

Thanks,

--=20
Paul Barker
--------------b6Br0Rk0b0pvfc4JazypEaPi
Content-Type: application/pgp-keys; name="OpenPGP_0x27F4B3459F002257.asc"
Content-Disposition: attachment; filename="OpenPGP_0x27F4B3459F002257.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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3D
=3DsIIN
-----END PGP PUBLIC KEY BLOCK-----

--------------b6Br0Rk0b0pvfc4JazypEaPi--

--------------bF3mpbBUAzRevzt3a8G0dNGT--

--------------lfaRTfq7xxgxfR59uiOdt40i
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQSiu8gv1Xr0fIw/aoLbaV4Vf/JGvQUCZyknrQUDAAAAAAAKCRDbaV4Vf/JGvQN0
AQDet76+lYzutHWgrX1iBIIypTRLdh8wyTec9YaYQE2rhgEA0/cs0J8X2UaOM8ni7d3NF+AsknhG
J7/8uKWLvvi4OAM=
=hrTr
-----END PGP SIGNATURE-----

--------------lfaRTfq7xxgxfR59uiOdt40i--

