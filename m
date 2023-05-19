Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 60AB2709AB9
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 May 2023 16:58:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232100AbjESO6f (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 19 May 2023 10:58:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231296AbjESO6f (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 19 May 2023 10:58:35 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F887C4;
        Fri, 19 May 2023 07:58:34 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id F3A3565879;
        Fri, 19 May 2023 14:58:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF3F0C433A0;
        Fri, 19 May 2023 14:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1684508313;
        bh=kRl8iMDtyfZGkWzmJOePe5MYNDKrVxqiiSBDUkI4Ylk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KE4qV6p2bCdPjQDigfgufaGcjeHAm/aUaK8g3GPwVc+xV8/vhGRdT+OvmfrkvMvmk
         Ns5GVS2xK2GWY2JfknwaXW2JQlpDZj+wP59VirNyhqyJNjnEZVRQm1KfQ/nfGBE2Jl
         CwXnB1n4gbWzAoUy2u5RhcFeHyxSQCBCqN8gNxXUcwwxFHT75M8TP2WP6rM32xJfqA
         KpNGciteXetGtYCaJTYTSPgIEeTUF384e6Yq32uVHDFlR7hmuIjC5JOuR7skEmMCh4
         6IUQphcEM1xl858MxJaW7A+KAOGmY/kTsrZTaYUbj9HIknfnRdvEwq6XC7UXxEaNaN
         X2HUUYuOWZwUg==
Date:   Fri, 19 May 2023 23:58:30 +0900
From:   Mark Brown <broonie@kernel.org>
To:     Conor Dooley <conor.dooley@microchip.com>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Conor Dooley <conor@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Subject: Re: [PATCH v4 09/11] regulator: dt-bindings: Add Renesas RAA215300
 PMIC bindings
Message-ID: <ZGeOlrwfpqIE4Roi@finisterre.sirena.org.uk>
References: <20230518113643.420806-1-biju.das.jz@bp.renesas.com>
 <20230518113643.420806-10-biju.das.jz@bp.renesas.com>
 <20230518-prompter-helium-91d0139a61e2@spud>
 <OS0PR01MB59226BDCD4D67430EC7377C6867C9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <20230519-civic-idiocy-5ac6d95675f0@wendy>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="8cDhzFgPi3nbFOI8"
Content-Disposition: inline
In-Reply-To: <20230519-civic-idiocy-5ac6d95675f0@wendy>
X-Cookie: Avoid contact with eyes.
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--8cDhzFgPi3nbFOI8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 19, 2023 at 03:10:25PM +0100, Conor Dooley wrote:
> On Fri, May 19, 2023 at 06:53:03AM +0000, Biju Das wrote:

> > By enforcing "reg-names" as required property, dt can do some schema-validation
> > forcing users to specify "reg-names" in device tree.

> Is that not what we have the following for:
>   reg:
>    items:
>      - description: main register space...
>      - description: special sauce rtc stuff...
> ?

> The schema validation doesn't stop them putting in the wrong address
> either way!

Being able to look things up by name does help make the code using the
binding more readable, and it helps with reading the DTs too.

--8cDhzFgPi3nbFOI8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmRnjpMACgkQJNaLcl1U
h9Cyygf9E6xYqYISzc4lJUtsGvlPH8/8X3P4N5mfoziciYdj/2cynhD5meR7byqj
VJyXpo9G1qzlldorgSyRkMc5hxSYOn34lxelsXmvG0ADvUnmMDYE5hOKu+ik9izk
c6Bzn704thMCGbazETPf+jP9wTuwPrsOI6mVHV1myyGAM+sy8X3UpRO0Hi7d3Jq0
qfPtILvWKTHa3yRKUD3wiCI0xsfjudYKwG8iRfasRUZe+Id7c/ZdRhU62DvJR3kT
kym6p0Arl+8R3BKbmySLgZwHBwem6qUF08texho5PBMyZk7u211B8fL8TCYGkJI5
lKrCUhH7fsKkYm159nkwk1PCG64c7A==
=vc3n
-----END PGP SIGNATURE-----

--8cDhzFgPi3nbFOI8--
