Return-Path: <linux-renesas-soc+bounces-14832-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66677A714CD
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Mar 2025 11:28:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B1A6416E76C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Mar 2025 10:28:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDB9B1B85CA;
	Wed, 26 Mar 2025 10:28:11 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EEDF191461;
	Wed, 26 Mar 2025 10:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742984891; cv=none; b=Zbv2y5oGAUarPqnpub8JBurMgdVYd5/6mxReW6cD8M1oML3Mnx21S7Fwd3SrkHiJwlY/jxPfPsBPfONJxW73J/f4TwRbgV+iBOY71xRlkFCocjOywFCsWeFAqasZkyblLhnIeQIsCTi41CQGJxKGMffkaj1miHOQImvr/VJ+Azc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742984891; c=relaxed/simple;
	bh=BQ+RCQroniN8Gs4KUOSyIz68iYPmSvAwuWQ0g/bg6x0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KD/qiJKtL7X6LX9tJ1wS43rWyG54nTWaQ4KQ0D/Bn8CmGuhnntWmwWw4gx7PMUabpL26F9tIHRmtSoPYk5Y8acR9W34kZ80g0bWPGlqkdus8QgYmJjg5z8VnZsYxCZpX13ZhA+/ItZEXhI1wkduC8sBz9CpGJDfgOVGo7l227UI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: 4yRLzn7tTCunCWnpSjpHEg==
X-CSE-MsgGUID: u40O+HspSB6HLClGfoz4Hw==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 26 Mar 2025 19:28:06 +0900
Received: from [10.226.94.2] (unknown [10.226.94.2])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id EB1DF424103D;
	Wed, 26 Mar 2025 19:28:03 +0900 (JST)
Message-ID: <d2d09918-5555-47a7-8b82-f88e9ff022d7@bp.renesas.com>
Date: Wed, 26 Mar 2025 10:28:01 +0000
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 02/13] dt-bindings: clock: Add cpg for the Renesas
 RZ/T2H SoC
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
Cc: thierry.bultel@linatsea.fr, linux-renesas-soc@vger.kernel.org,
 geert@linux-m68k.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250325160904.2688858-1-thierry.bultel.yh@bp.renesas.com>
 <20250325160904.2688858-3-thierry.bultel.yh@bp.renesas.com>
 <20250326-enigmatic-cuscus-of-enhancement-410130@krzk-bin>
Content-Language: en-GB
From: Paul Barker <paul.barker.ct@bp.renesas.com>
In-Reply-To: <20250326-enigmatic-cuscus-of-enhancement-410130@krzk-bin>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------UM2wLDiSoAOiEvwXIjdeLEJP"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------UM2wLDiSoAOiEvwXIjdeLEJP
Content-Type: multipart/mixed; boundary="------------Aj96iPSh1N0A0O7GX10xCQuL";
 protected-headers="v1"
From: Paul Barker <paul.barker.ct@bp.renesas.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
Cc: thierry.bultel@linatsea.fr, linux-renesas-soc@vger.kernel.org,
 geert@linux-m68k.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Message-ID: <d2d09918-5555-47a7-8b82-f88e9ff022d7@bp.renesas.com>
Subject: Re: [PATCH v5 02/13] dt-bindings: clock: Add cpg for the Renesas
 RZ/T2H SoC
References: <20250325160904.2688858-1-thierry.bultel.yh@bp.renesas.com>
 <20250325160904.2688858-3-thierry.bultel.yh@bp.renesas.com>
 <20250326-enigmatic-cuscus-of-enhancement-410130@krzk-bin>
In-Reply-To: <20250326-enigmatic-cuscus-of-enhancement-410130@krzk-bin>

--------------Aj96iPSh1N0A0O7GX10xCQuL
Content-Type: multipart/mixed; boundary="------------bVwkNm3YyFrnF17NTE9h5pKF"

--------------bVwkNm3YyFrnF17NTE9h5pKF
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 26/03/2025 07:49, Krzysztof Kozlowski wrote:
> On Tue, Mar 25, 2025 at 05:08:50PM +0100, Thierry Bultel wrote:
>> Document RZ/T2H (a.k.a r9a09g077) cpg-mssr (Clock Pulse Generator) bin=
ding.
>>
>> Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
>> ---
>> Changes v4->v5:
>>   - Set reg minItems and maxItems defaults at top level
>> Changes v3->v4:
>>   - Handle maxItems and clocks names properly in schema.=20
>=20
>=20
> Can you start using b4 or send patchsets in standard way? No links to
> previous versions in changelog and b4 diff does not work:
>=20
> b4 diff '20250325160904.2688858-1-thierry.bultel.yh@bp.renesas.com'
> Grabbing thread from lore.kernel.org/all/20250325160904.2688858-1-thier=
ry.bultel.yh@bp.renesas.com/t.mbox.gz
> Checking for older revisions
> Grabbing search results from lore.kernel.org
>   Added from v4: 14 patches
> ---
> Analyzing 140 messages in the thread
> Preparing fake-am for v4: dt-bindings: soc: Add Renesas RZ/T2H (R9A09G0=
77) SoC
> ERROR: Could not fake-am version v4
> ---
> Could not create fake-am range for lower series v4

Hi Krzysztof,

The above b4 command works for me. Which b4 version are you using and
which base tree do you have checked out?

FYI, this series now applies cleanly on top of tty-next as Geert's
patch [1] has been integrated.

[1]: https://lore.kernel.org/linux-renesas-soc/11c2eab45d48211e75d8b8202c=
ce60400880fe55.1741114989.git.geert+renesas@glider.be/T/#u

Thanks,

--=20
Paul Barker
--------------bVwkNm3YyFrnF17NTE9h5pKF
Content-Type: application/pgp-keys; name="OpenPGP_0x27F4B3459F002257.asc"
Content-Disposition: attachment; filename="OpenPGP_0x27F4B3459F002257.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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3D
=3DsIIN
-----END PGP PUBLIC KEY BLOCK-----

--------------bVwkNm3YyFrnF17NTE9h5pKF--

--------------Aj96iPSh1N0A0O7GX10xCQuL--

--------------UM2wLDiSoAOiEvwXIjdeLEJP
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQSiu8gv1Xr0fIw/aoLbaV4Vf/JGvQUCZ+PWsQUDAAAAAAAKCRDbaV4Vf/JGvdey
AQDfiAJ8CgqUXQ4GyeQ5Y9jP3hLVXfATQlkuc8bRq+cvMQEA3AbLsUg6gMXZoH55IOK40i2EKWJK
iQ8YSEguFbn08gg=
=oUeY
-----END PGP SIGNATURE-----

--------------UM2wLDiSoAOiEvwXIjdeLEJP--

