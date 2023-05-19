Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 29D52709908
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 May 2023 16:10:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231450AbjESOKw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 19 May 2023 10:10:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230116AbjESOKv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 19 May 2023 10:10:51 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE2D0A3;
        Fri, 19 May 2023 07:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1684505451; x=1716041451;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mwsJ84MhCT5OW2OKKVvn60ujUdtFWwELlENzzS6Idqk=;
  b=adTnV75NXxLn8fDw1MuX78wD60By5U8cfJhyB7cki3lzkFLFZpv37C/m
   oEEGWkJRAKT9NwRH8ppRaHZ6eLczz2YdYSeUvryxqnrPI4ytGvKXW31tl
   Tf1Xbhc4QXcjk1IbxEWL2LzmDOjqPdZm9fIskf+HlvuYtKV7erjLKCRkY
   ClgztsXPXjCCayqR2KfN3I7knuJR8wUZbz941gCkrLmOtiUuN2lgrw/EF
   ZgCWqMoWe8rCeBpz26Yja/z94EPRufyzus7gUkI9kfKOJT80XBqdJ+FbF
   KU2+9R/8e7BCg2b0/yolweWdup9C58vUUN/3BOiBRwwzLC5yYKOz6rjuQ
   A==;
X-IronPort-AV: E=Sophos;i="6.00,176,1681196400"; 
   d="asc'?scan'208";a="212138743"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 19 May 2023 07:10:50 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 19 May 2023 07:10:49 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Fri, 19 May 2023 07:10:47 -0700
Date:   Fri, 19 May 2023 15:10:25 +0100
From:   Conor Dooley <conor.dooley@microchip.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
CC:     Conor Dooley <conor@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Subject: Re: [PATCH v4 09/11] regulator: dt-bindings: Add Renesas RAA215300
 PMIC bindings
Message-ID: <20230519-civic-idiocy-5ac6d95675f0@wendy>
References: <20230518113643.420806-1-biju.das.jz@bp.renesas.com>
 <20230518113643.420806-10-biju.das.jz@bp.renesas.com>
 <20230518-prompter-helium-91d0139a61e2@spud>
 <OS0PR01MB59226BDCD4D67430EC7377C6867C9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ENAtQeDKFe/ZkTiM"
Content-Disposition: inline
In-Reply-To: <OS0PR01MB59226BDCD4D67430EC7377C6867C9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

--ENAtQeDKFe/ZkTiM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 19, 2023 at 06:53:03AM +0000, Biju Das wrote:
> > Subject: Re: [PATCH v4 09/11] regulator: dt-bindings: Add Renesas
> > RAA215300 PMIC bindings
> >=20
> > On Thu, May 18, 2023 at 12:36:41PM +0100, Biju Das wrote:
> > > Document Renesas RAA215300 PMIC bindings.
> > >
> > > The RAA215300 is a high Performance 9-Channel PMIC supporting DDR
> > > Memory, with Built-In Charger and RTC.
> > >
> > > It supports DDR3, DDR3L, DDR4, and LPDDR4 memory power requirements.
> > > The internally compensated regulators, built-in Real-Time Clock (RTC),
> > > 32kHz crystal oscillator, and coin cell battery charger provide a
> > > highly integrated, small footprint power solution ideal for
> > > System-On-Module (SOM) applications. A spread spectrum feature
> > > provides an ease-of-use solution for noise-sensitive audio or RF
> > > applications.
> > > +  reg:
> > > +    maxItems: 2
> > > +
> > > +  reg-names:
> > > +    items:
> > > +      - const: main
> > > +      - const: rtc
> >=20
> > > +required:
> > > +  - compatible
> > > +  - reg
> > > +  - reg-names
> >=20
> > Out of curiosity as much as anything else, why do you need reg-names if
> > the two registers are always required?
>=20
> The device has always 2 address spaces and "reg-names" provides a means
> of clear differentiation compared to indices.=20
>=20
> By enforcing "reg-names" as required property, dt can do some schema-vali=
dation
> forcing users to specify "reg-names" in device tree.

Is that not what we have the following for:
  reg:
   items:
     - description: main register space...
     - description: special sauce rtc stuff...
?

The schema validation doesn't stop them putting in the wrong address
either way!

> Implementation wise, we use "rtc" for getting resource details while
> creating the second i2c device which overrides the default address.
>=20
> Strictly speaking reg-names is not required, but from a validation
> perspective and since driver is using the same "resource-name" it is
> better to have it??

If the order is set by the descriptions, reg-names seem superfluous
/shrug

Cheers,
Conor.


--ENAtQeDKFe/ZkTiM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZGeDUQAKCRB4tDGHoIJi
0oDmAQDn7VnMhHGsOtJlAuYq5jOlTuVUCTQHOOvtwKR8LyJc4QEAk1+L4+Osiz2u
F+pwqtfnYexqUSEjcP3vQ3f3FEqfQAo=
=yZif
-----END PGP SIGNATURE-----

--ENAtQeDKFe/ZkTiM--
