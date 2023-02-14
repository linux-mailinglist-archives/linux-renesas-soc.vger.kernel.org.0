Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 86777696889
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Feb 2023 16:56:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231781AbjBNP4n (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 14 Feb 2023 10:56:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231448AbjBNP4n (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 14 Feb 2023 10:56:43 -0500
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49AF2252BD;
        Tue, 14 Feb 2023 07:56:41 -0800 (PST)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 8F2A52000A;
        Tue, 14 Feb 2023 15:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1676390200;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=vNKGSGMg8f++uU4wWjyIvzgyGnDvNR/WlS+2/U80G8U=;
        b=Ejr7sNtEtXRqpXUU+WCTcDwLrHnimWJPzCRHYgSteerTTDCqasSDuy0z7imGZIbDP+qrap
        03llLZoGdnzSzOHE75z7OC7a/uDELmhZLByqKufP6q1JsgmEOwjEdxwYGPd+MEybsI2m9y
        1CUSy9Y+2T3mqLk6EOCqlBP1/piLzDIm8LqCb9fQKPpCtJyBgG/ixmugcsvrFRcUwqzmg8
        8tKYN704Yar6jK56J2RuNaBe8hCSt1cU8mrEDGvoDD2LhK64AuS9IIOMi4C4VKcFMq8BfD
        uV07gry0AztsNvAV7VPn8IgSQpXyCjIqh/gd8W3PrBDTlybL5KdfFfFFWNYUVQ==
Date:   Tue, 14 Feb 2023 16:56:37 +0100
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Tudor Ambarus <tudor.ambarus@linaro.org>,
        Pratyush Yadav <pratyush@kernel.org>,
        Michael Walle <michael@walle.cc>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Mark Brown <broonie@kernel.org>, linux-mtd@lists.infradead.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mtd: jedec,spi-nor: Document CPOL/CPHA
 support
Message-ID: <20230214165637.56102b18@xps-13>
In-Reply-To: <CAMuHMdVK7vOTNMF53SvHn8LtiHX7MSN-Fp80jngSsosYBhhrHQ@mail.gmail.com>
References: <afe470603028db9374930b0c57464b1f6d52bdd3.1676384304.git.geert+renesas@glider.be>
        <20230214154433.6a421c51@xps-13>
        <CAMuHMdVK7vOTNMF53SvHn8LtiHX7MSN-Fp80jngSsosYBhhrHQ@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

geert@linux-m68k.org wrote on Tue, 14 Feb 2023 16:22:15 +0100:

> Hi Miquel,
>=20
> On Tue, Feb 14, 2023 at 3:44 PM Miquel Raynal <miquel.raynal@bootlin.com>=
 wrote:
> > geert+renesas@glider.be wrote on Tue, 14 Feb 2023 15:26:43 +0100: =20
> > > SPI EEPROMs typically support both SPI Mode 0 (CPOL=3DCPHA=3D0) and M=
ode 3
> > > (CPOL=3DCPHA=3D1).  However, using the latter is currently flagged as=
 an
> > > error by "make dtbs_check", e.g.:
> > >
> > >     arch/arm/boot/dts/r8a7791-koelsch.dtb: flash@0: Unevaluated prope=
rties are not allowed ('spi-cpha', 'spi-cpol' were unexpected)
> > >           From schema: Documentation/devicetree/bindings/mtd/jedec,sp=
i-nor.yaml
> > >
> > > Fix this by documenting support for CPOL=3DCPHA=3D1.
> > >
> > > Fixes: 233363aba72ac638 ("spi/panel: dt-bindings: drop CPHA and CPOL =
from common properties")
> > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > ---
> > >  Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml | 7 +++++++
> > >  1 file changed, 7 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml=
 b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> > > index f86255ce13af0871..bb62ac4585822982 100644
> > > --- a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> > > +++ b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> > > @@ -76,6 +76,13 @@ properties:
> > >        If "broken-flash-reset" is present then having this property d=
oes not
> > >        make any difference.
> > >
> > > +  spi-cpol: true
> > > +  spi-cpha: true =20
> >
> > I see that spi-cpol and spi-cpha are described in spi-controller.yaml
> > which references spi-peripheral-props.yaml, but jedec,spi-nor.yaml
> > only references spi-peripheral-props.yaml leading to spi-cpol and
> > spi-cpha not being recognized as valid properties.
> >
> > Wouldn't it be cleaner to to have these two properties defined in
> > spi-peripheral-props.yaml instead? =20
>=20
> They were moved out of that file by the commit referenced in the
> Fixes: tag above, because they are not supported by all SPI targets.
> It's the responsibility of the SPI target bindings to list what is suppor=
ted.

Oops, I overlooked that line.

I actually see no point in constraining device trees on that regard,
but, well, Krzysztof is the author, I believe he knows his stuff, so
let's go for it.

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

Thanks,
Miqu=C3=A8l
