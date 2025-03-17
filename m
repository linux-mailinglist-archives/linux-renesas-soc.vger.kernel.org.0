Return-Path: <linux-renesas-soc+bounces-14458-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 52CBCA649CA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Mar 2025 11:28:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AE11E7A2CF1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Mar 2025 10:27:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4580923370D;
	Mon, 17 Mar 2025 10:27:47 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4076219A67;
	Mon, 17 Mar 2025 10:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742207267; cv=none; b=CPcJE6gmDJjHnEer6QfuW3HDNsTE4Tde/b6VGh2Pf6oJN/hfyZELcR9/01Ye4MZ4GXspFGq/pomXWr16byL3SvUkWS87y4XHq+96PlHAd64TT8CXaH4g7hHJ/XenyLi98RM35o01PVAFMaNYUqPYidC6bR+yNvOwnp4JfvB9exI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742207267; c=relaxed/simple;
	bh=2jv2oNnuMomXh9Kr1t2fb+sIQ5lE6UaVgX/GXBxiVg0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=P0+qBwWQCXGkSKAN1W4Idlb+IUOrRNrYYgm/rJQvbwpoi+IpI18pM5yMbzA/6Wzd4JEXFP5k8pMp03WUM25s0oFpH7sg++jeT41InGdmVCii9MoKRC2p2cFuybVOLOFY2EcfIKFrLSDsXiXaMkzNWtGEA7FIvWyDI7jAVdTJyOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: D4GfsnCxQ+6aG0qymhfE/w==
X-CSE-MsgGUID: rAaiZvVRRKO+OkoXRswZAA==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 17 Mar 2025 19:27:36 +0900
Received: from [10.226.93.170] (unknown [10.226.93.170])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id AD8C9402ADFF;
	Mon, 17 Mar 2025 19:27:33 +0900 (JST)
Message-ID: <999cb080-ea61-45e5-9ea0-356fb8bc4639@bp.renesas.com>
Date: Mon, 17 Mar 2025 10:27:32 +0000
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 08/13] serial: sh-sci: Introduced function pointers
Content-Language: en-GB
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Thierry Bultel <thierry.bultel.yh@bp.renesas.com>,
 thierry.bultel@linatsea.fr, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 Ulrich Hecht <uli@fpond.eu>, Linux-sh list <linux-sh@vger.kernel.org>
References: <20250306152451.2356762-1-thierry.bultel.yh@bp.renesas.com>
 <20250306152451.2356762-9-thierry.bultel.yh@bp.renesas.com>
 <CAMuHMdVM_ozW4LAA4DstQuDfEcOnOcXZ2QHGv8nYMKDPWJe43Q@mail.gmail.com>
 <Z9fxfV9jAGJ51fcn@shikoro>
From: Paul Barker <paul.barker.ct@bp.renesas.com>
In-Reply-To: <Z9fxfV9jAGJ51fcn@shikoro>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------GSaVrcKpNAh8KYWgWD9dUaOq"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------GSaVrcKpNAh8KYWgWD9dUaOq
Content-Type: multipart/mixed; boundary="------------O6kgC8qtnfCsHbkVJ7nSz61a";
 protected-headers="v1"
From: Paul Barker <paul.barker.ct@bp.renesas.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Thierry Bultel <thierry.bultel.yh@bp.renesas.com>,
 thierry.bultel@linatsea.fr, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 Ulrich Hecht <uli@fpond.eu>, Linux-sh list <linux-sh@vger.kernel.org>
Message-ID: <999cb080-ea61-45e5-9ea0-356fb8bc4639@bp.renesas.com>
Subject: Re: [PATCH v4 08/13] serial: sh-sci: Introduced function pointers
References: <20250306152451.2356762-1-thierry.bultel.yh@bp.renesas.com>
 <20250306152451.2356762-9-thierry.bultel.yh@bp.renesas.com>
 <CAMuHMdVM_ozW4LAA4DstQuDfEcOnOcXZ2QHGv8nYMKDPWJe43Q@mail.gmail.com>
 <Z9fxfV9jAGJ51fcn@shikoro>
In-Reply-To: <Z9fxfV9jAGJ51fcn@shikoro>

--------------O6kgC8qtnfCsHbkVJ7nSz61a
Content-Type: multipart/mixed; boundary="------------Ijb1tC0cLv8GylxNAv6i7gC5"

--------------Ijb1tC0cLv8GylxNAv6i7gC5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 17/03/2025 09:55, Wolfram Sang wrote:
> Hi all,
>=20
> sorry for missing this series so far and thanks to Geert for pulling me=

> into the loop.
>=20
>> While most rough edges have been polished by now (thanks!), and the
>> driver seems to still work on a variety of platforms, I am still
>> worried about the impact of this change:
>>   - Maintainability and future bug fixing?
>=20
> I hate to see development work going to waste, yet I have to say I am
> also concerned about the maintainability of this driver after this very=

> intrusive changeset. The driver is already quite complex. Adding anothe=
r
> layer of complexity (function pointers) will make proper bugfixing for
> all supported instances quite harder, I'd think.
>=20
> Has it been discussed to have this as a separate driver? Were there
> reasons against it? This is really an open question. Maybe it is
> justified to do it like this if we have reasons for it.
>=20
> Seeing that SCI core needs 800+ lines changed and we still have a
> seperate driver with 460 lines driver, I do wonder if copying the logic=

> from SCI core to a seperate driver would make sense. I am aware that th=
e
> core has currently 3500+ lines currently. I'd estimate it would shrink
> quite a bit when copying because you won't need to handle all the
> differences to other SCI entries.
>=20
> Again, this is not a request to follow my suggestion, it is an open
> question to make sure all paths have been considered.

Hi Geert, Wolfram,

Thierry is out of the office this week so we can follow this up next
week, but I do want to give some input in the meantime.

We discussed both approaches internally and did an initial
proof-of-concept of a separate driver. The result was over 1,000 lines
of code copy-pasted from the existing sh-sci driver into the new driver,
which is generally something maintainers want us to avoid doing. The
trade off here is whether we want a single more complex driver, or two
copies of much of the code so that bugfixes/improvements to the common
sections in the future need to be duplicated.

The RZ/V2H and RZ/G3E have interfaces of both the existing sh-sci
register layout ("SCIF" ports in RZ/V2H & RZ/G3E manual) and the RZ/T2H
style register layout ("RSCI" ports in RZ/V2H manual, "SCI" ports in
RZ/G3E manual), so keeping things closely aligned as we move forward
will be beneficial. I expect that this will be easier with a combined
driver.

Thanks,

--=20
Paul Barker
--------------Ijb1tC0cLv8GylxNAv6i7gC5
Content-Type: application/pgp-keys; name="OpenPGP_0x27F4B3459F002257.asc"
Content-Disposition: attachment; filename="OpenPGP_0x27F4B3459F002257.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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3D
=3DsIIN
-----END PGP PUBLIC KEY BLOCK-----

--------------Ijb1tC0cLv8GylxNAv6i7gC5--

--------------O6kgC8qtnfCsHbkVJ7nSz61a--

--------------GSaVrcKpNAh8KYWgWD9dUaOq
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQSiu8gv1Xr0fIw/aoLbaV4Vf/JGvQUCZ9f5FAUDAAAAAAAKCRDbaV4Vf/JGvc9m
AP9eGklGc56ll2C1TBfHvkIFUNbW1y9Hzwk00cBLYsy+8QEA+3jtJ2DfsW0bZ6yH9NnzAN46Iay7
WtqeXOrDyo9qIAo=
=dKJM
-----END PGP SIGNATURE-----

--------------GSaVrcKpNAh8KYWgWD9dUaOq--

