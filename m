Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A4176967EC
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Feb 2023 16:22:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233525AbjBNPWp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 14 Feb 2023 10:22:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233236AbjBNPWn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 14 Feb 2023 10:22:43 -0500
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26D5628212;
        Tue, 14 Feb 2023 07:22:29 -0800 (PST)
Received: by mail-qt1-f177.google.com with SMTP id h24so17874667qtr.0;
        Tue, 14 Feb 2023 07:22:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4SHQ35UeliM91D1wLKZjKtKGrS2DGLJ/hyCLpMmalEE=;
        b=Y11tBqzFU00Zn/BdacVzUajCiJki6J1sY2iIjNKNffBVcQAzUGRrbh5eJYKcudb5L9
         Jrze361r2vH3fxKM+Zqaz5DGFiiOmJ9D9Iiqtw3uRDheS4jNSSih4Ig1ZaoAw6ahN0qu
         1LP4BzQKW98q/su6trqaiOgupHTZXumh0Sw2YYvRAhDSVYtMZ48LOjp/HE0yg6UIT5CU
         d3JusF5offCluado/DA8d1qN3n2uJ/2Rc5W2WXNlRPKAvkTTrjeJ+RjMcsqNMkBN/iHk
         DYOQsA1DUPiojCleNXk5+8OIbJUJT5UN+YKFDutQYOk+Mj0/A7XKlqSY4RYTrdRreZzj
         IArg==
X-Gm-Message-State: AO0yUKUf/mGx74culpB/GyQHn4PB/K+ZEkyCN3sV0Y+Ro/fO5R4kIndV
        d/PJtZvpzNzujB5vUY7i+5Sx1V/GXStbI8gM
X-Google-Smtp-Source: AK7set80WQnYjJJWk10RYBAaKuxQFxqHjn1L5l44TNW9JDqxbKmDviO41nO/4bCVXFax+xGk29lc2w==
X-Received: by 2002:ac8:7d50:0:b0:3a5:ff6e:d425 with SMTP id h16-20020ac87d50000000b003a5ff6ed425mr4196806qtb.4.1676388147901;
        Tue, 14 Feb 2023 07:22:27 -0800 (PST)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com. [209.85.219.175])
        by smtp.gmail.com with ESMTPSA id i23-20020ac87657000000b003b86b962030sm11422685qtr.72.2023.02.14.07.22.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Feb 2023 07:22:27 -0800 (PST)
Received: by mail-yb1-f175.google.com with SMTP id o66so12651453ybc.0;
        Tue, 14 Feb 2023 07:22:26 -0800 (PST)
X-Received: by 2002:a05:6902:14d:b0:921:783:f2f5 with SMTP id
 p13-20020a056902014d00b009210783f2f5mr231912ybh.574.1676388146523; Tue, 14
 Feb 2023 07:22:26 -0800 (PST)
MIME-Version: 1.0
References: <afe470603028db9374930b0c57464b1f6d52bdd3.1676384304.git.geert+renesas@glider.be>
 <20230214154433.6a421c51@xps-13>
In-Reply-To: <20230214154433.6a421c51@xps-13>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 14 Feb 2023 16:22:15 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVK7vOTNMF53SvHn8LtiHX7MSN-Fp80jngSsosYBhhrHQ@mail.gmail.com>
Message-ID: <CAMuHMdVK7vOTNMF53SvHn8LtiHX7MSN-Fp80jngSsosYBhhrHQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: mtd: jedec,spi-nor: Document CPOL/CPHA support
To:     Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     Tudor Ambarus <tudor.ambarus@linaro.org>,
        Pratyush Yadav <pratyush@kernel.org>,
        Michael Walle <michael@walle.cc>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Mark Brown <broonie@kernel.org>, linux-mtd@lists.infradead.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Miquel,

On Tue, Feb 14, 2023 at 3:44 PM Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> geert+renesas@glider.be wrote on Tue, 14 Feb 2023 15:26:43 +0100:
> > SPI EEPROMs typically support both SPI Mode 0 (CPOL=CPHA=0) and Mode 3
> > (CPOL=CPHA=1).  However, using the latter is currently flagged as an
> > error by "make dtbs_check", e.g.:
> >
> >     arch/arm/boot/dts/r8a7791-koelsch.dtb: flash@0: Unevaluated properties are not allowed ('spi-cpha', 'spi-cpol' were unexpected)
> >           From schema: Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> >
> > Fix this by documenting support for CPOL=CPHA=1.
> >
> > Fixes: 233363aba72ac638 ("spi/panel: dt-bindings: drop CPHA and CPOL from common properties")
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> >  Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> > index f86255ce13af0871..bb62ac4585822982 100644
> > --- a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> > +++ b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> > @@ -76,6 +76,13 @@ properties:
> >        If "broken-flash-reset" is present then having this property does not
> >        make any difference.
> >
> > +  spi-cpol: true
> > +  spi-cpha: true
>
> I see that spi-cpol and spi-cpha are described in spi-controller.yaml
> which references spi-peripheral-props.yaml, but jedec,spi-nor.yaml
> only references spi-peripheral-props.yaml leading to spi-cpol and
> spi-cpha not being recognized as valid properties.
>
> Wouldn't it be cleaner to to have these two properties defined in
> spi-peripheral-props.yaml instead?

They were moved out of that file by the commit referenced in the
Fixes: tag above, because they are not supported by all SPI targets.
It's the responsibility of the SPI target bindings to list what is supported.

>
> > +
> > +dependencies:
> > +  spi-cpol: [ spi-cpha ]
> > +  spi-cpha: [ spi-cpol ]
> > +
> >  unevaluatedProperties: false
> >
> >  examples:

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
