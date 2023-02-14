Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF8C069673B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Feb 2023 15:44:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233420AbjBNOot (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 14 Feb 2023 09:44:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232231AbjBNOos (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 14 Feb 2023 09:44:48 -0500
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95DAC1D936;
        Tue, 14 Feb 2023 06:44:41 -0800 (PST)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id E976E40009;
        Tue, 14 Feb 2023 14:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1676385880;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=spc8MwHpcjXgH4ztj2eiUqqTcn2TdRR+RZKvGct5U4M=;
        b=mLlalOBeJtNca5NZp/JfEJYC3gTbI74xNgXIKae64Y0pqN0RthdmJRJy92EjgKWDF2gIac
        0EIOt2l9hAGg9qptE6DnUPSV64dZQ/L7+C2zJtMxiBk5FGFkA0pEUPd7tIuGXrN3TpcI9P
        RFaLVQa4/j4nhJAG2TRkr9alGESGvYb1bYBZNCyRgSyr4QzFv9Z9zjvpmuRwfM2QcCyDpu
        jdVQrefBvkt5NYZb6pTRrxSNLOxY5HWul5OZAFOzlEg0OIZ7NnK7W2MMoEfeMNiRnFBzdX
        tM/P2+9u2Cicj58KMvIslKfbEp0mR85LNh6SQqvEPrjPKeKkgxuhoU/BXW6Jsg==
Date:   Tue, 14 Feb 2023 15:44:33 +0100
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
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
Message-ID: <20230214154433.6a421c51@xps-13>
In-Reply-To: <afe470603028db9374930b0c57464b1f6d52bdd3.1676384304.git.geert+renesas@glider.be>
References: <afe470603028db9374930b0c57464b1f6d52bdd3.1676384304.git.geert+renesas@glider.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert, Krzysztof, Rob,

geert+renesas@glider.be wrote on Tue, 14 Feb 2023 15:26:43 +0100:

> SPI EEPROMs typically support both SPI Mode 0 (CPOL=3DCPHA=3D0) and Mode 3
> (CPOL=3DCPHA=3D1).  However, using the latter is currently flagged as an
> error by "make dtbs_check", e.g.:
>=20
>     arch/arm/boot/dts/r8a7791-koelsch.dtb: flash@0: Unevaluated propertie=
s are not allowed ('spi-cpha', 'spi-cpol' were unexpected)
> 	    From schema: Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
>=20
> Fix this by documenting support for CPOL=3DCPHA=3D1.
>=20
> Fixes: 233363aba72ac638 ("spi/panel: dt-bindings: drop CPHA and CPOL from=
 common properties")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml b/D=
ocumentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> index f86255ce13af0871..bb62ac4585822982 100644
> --- a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> +++ b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> @@ -76,6 +76,13 @@ properties:
>        If "broken-flash-reset" is present then having this property does =
not
>        make any difference.
> =20
> +  spi-cpol: true
> +  spi-cpha: true

I see that spi-cpol and spi-cpha are described in spi-controller.yaml
which references spi-peripheral-props.yaml, but jedec,spi-nor.yaml
only references spi-peripheral-props.yaml leading to spi-cpol and
spi-cpha not being recognized as valid properties.

Wouldn't it be cleaner to to have these two properties defined in
spi-peripheral-props.yaml instead?

> +
> +dependencies:
> +  spi-cpol: [ spi-cpha ]
> +  spi-cpha: [ spi-cpol ]
> +
>  unevaluatedProperties: false
> =20
>  examples:


Thanks,
Miqu=C3=A8l
