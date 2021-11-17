Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D4F0454500
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Nov 2021 11:31:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236349AbhKQKeG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 17 Nov 2021 05:34:06 -0500
Received: from www.zeus03.de ([194.117.254.33]:42394 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231381AbhKQKeF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 17 Nov 2021 05:34:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=w3UYELVUuE8yzeIIX5b1Rsj8TGhp
        EGKqWdrRhkydfdA=; b=pNU91uOzFmDTMHEkByOFKNZfVcE44DHvMeYFYEckpQ3f
        stBED1M6Sr/ziImzcGRR3mEZquh/Uy8PrsutFC1F9gCZexiH0lX1AWXpnlZywOa6
        tZ9r00XzXeN7onmUOlzEATcZOSLoY5aBQEnCqwS2G3PrQy+uuwCP6CRperTpN30=
Received: (qmail 3055967 invoked from network); 17 Nov 2021 11:31:06 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 17 Nov 2021 11:31:06 +0100
X-UD-Smtp-Session: l3s3148p1@OmscivnQtOwgAwDPXwoaAHKn46ZTsFWo
Date:   Wed, 17 Nov 2021 11:31:05 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>
Subject: Re: [PATCH v3] dt-bindings: mmc: renesas,sdhi: add optional SDnH
 clock
Message-ID: <YZTZ6U/z+pQd5gGx@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>
References: <20211115160600.4455-1-wsa+renesas@sang-engineering.com>
 <OS0PR01MB59220D97CD59F44918DE4FA586989@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <YZKz/ptgPfzqGfeq@kunai>
 <OS0PR01MB592241C04F5CDDB94D850FFA86989@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdUm2EG3Yi+eTZA0E9tZOT71ewkbx=yh8sVOnL207Od3Rw@mail.gmail.com>
 <OS0PR01MB5922A978B55C09B9E754DBD486999@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdWVB_7U0R5hkO7eEkzdkmhwCEFstskvXJgO-dU1hog=+A@mail.gmail.com>
 <OS0PR01MB59220069B3113A206F31305286999@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <OS0PR01MB592210D033924785A1C33A3386999@OS0PR01MB5922.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="VRdEKuecTN1s8yuN"
Content-Disposition: inline
In-Reply-To: <OS0PR01MB592210D033924785A1C33A3386999@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--VRdEKuecTN1s8yuN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Please let me know, if you want me to do this changes as separate patch(binding + dtsi) or
> Will you take care this? Both are ok to me.

This patch is then good as-is with Biju sending the incremental patches?
Or did I miss something from this discussion?


--VRdEKuecTN1s8yuN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmGU2eUACgkQFA3kzBSg
Kbbohg/+LzBsQfdV+yXE8czHkQmEEs0pxfes8/CuDOXxPez/blT14F/ioJdwXJoS
Ewdzfvw1DDAxZnrJC3Jxz1FX7mdNPHLeOXL66q/9DM7nPM0LPjo/KQNaw5KyCmMb
H1NL/Ec23Zze1vKfIFvBKuJmrRfQexvyGDqxlzXVPGOBMqwp78JYHG5EZ0BHZzBK
52MiBoJOnUKd/BgMBE4IncXM1+aElWa4cVbAtcWihkGUkqJDPPT66xhIC+6otmtp
6zfQj2+5tX/Id8PzL0gOUe56x7JIb91xUbmAx82oNjBgRFcPq5q0y/hjWE+XOvdd
qa7wtBZD8I35LGALp9rqZB6czWMBqPPTNyQh6sl0pMV5LWt8cHLlaUG4Oxdu40gI
eD8M1+fiWu8+LUfzLejN19bUcobK4BgGFLR11GtvQZPoWGi24+UDU7Uah2uZiS0C
SVaUBMRPuI8PhCJTl6+aMmVG3/ZYBTwnqFsvZIt9WVQR4wgXGjiNSypkj2VBAkbQ
KGnXMVFRf9cZAUK022v128KKyt/Dw6byOic4aV6gs9LWW8xyizNlyKVRyNbUcWse
QqExalO4wFJZgcV4vOS1GjqYv3J+9d95Zwf/SG/QzXnRli8h2MC1WC4NUssFKjdy
OC4e+ANs0ocUrDphELvWxUj8CUhx+ddyuF0Wy0ml/kPU83le1T0=
=pizD
-----END PGP SIGNATURE-----

--VRdEKuecTN1s8yuN--
