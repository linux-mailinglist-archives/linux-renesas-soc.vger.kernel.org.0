Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 327E469B674
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 18 Feb 2023 00:27:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229728AbjBQX1I (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 Feb 2023 18:27:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229623AbjBQX1H (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Feb 2023 18:27:07 -0500
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CE20460BE;
        Fri, 17 Feb 2023 15:27:04 -0800 (PST)
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-1718a49f834so2724692fac.8;
        Fri, 17 Feb 2023 15:27:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LKUc5pbw1yazGVhBpNKjeMy/4FeHfZzgptlXZ0pQics=;
        b=sZM34XTQS+7Kp96zIzNUHm572rCcUUbxxsYYN/+nBR79O8g8Z6RGHjPLGz6obIqDoh
         62PN3PKPDNKnS/YkWpluv8QJmqr3ItBbUNH4XvoTxmiZ3E/eQ7JJT4B7rEcwPrNcn1wy
         OloUn+A6Yz686cm9YJ02R1TwfKnzNvMSzqS4V6CaBaUpT6B2RKVXOWPYjNl/aZZWXkoa
         MmesgOO2iczagrAzgEewzR87pFbJ7rIFPEKIme6JXrwhGaiPcTnWbY9W4AykoAvLIbki
         +nhtTiJY7Gwc+bjQUEOAb6JGes5IK8Bqeuh8zKm4m1gHfoO4ES6HOnf7lQMULQEG33WI
         UGyg==
X-Gm-Message-State: AO0yUKVK7YBBKZ/5RviQvLOXs0FJ1z+l/XMGjbSvOI62EhZMGhWhOlrP
        aEH6yoBH2u4pEsd6NEfwRA==
X-Google-Smtp-Source: AK7set+mj3tCBmniQ4Vc/uuMNYw3VzuxafpQVmLbG/0nKq0jLJoNNkhvc7DvBjP86Zs2XAxRPe2WTA==
X-Received: by 2002:a05:6870:b150:b0:169:dcba:1ec9 with SMTP id a16-20020a056870b15000b00169dcba1ec9mr1615221oal.41.1676676423521;
        Fri, 17 Feb 2023 15:27:03 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id v1-20020a056870e28100b0015f4d1b195bsm2194520oad.36.2023.02.17.15.27.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Feb 2023 15:27:03 -0800 (PST)
Received: (nullmailer pid 2260551 invoked by uid 1000);
        Fri, 17 Feb 2023 23:27:02 -0000
Date:   Fri, 17 Feb 2023 17:27:02 -0600
From:   Rob Herring <robh@kernel.org>
To:     Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Tudor Ambarus <tudor.ambarus@linaro.org>,
        Pratyush Yadav <pratyush@kernel.org>,
        Michael Walle <michael@walle.cc>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Mark Brown <broonie@kernel.org>, linux-mtd@lists.infradead.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mtd: jedec,spi-nor: Document CPOL/CPHA
 support
Message-ID: <20230217232702.GA2257281-robh@kernel.org>
References: <afe470603028db9374930b0c57464b1f6d52bdd3.1676384304.git.geert+renesas@glider.be>
 <20230214154433.6a421c51@xps-13>
 <CAMuHMdVK7vOTNMF53SvHn8LtiHX7MSN-Fp80jngSsosYBhhrHQ@mail.gmail.com>
 <20230214165637.56102b18@xps-13>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230214165637.56102b18@xps-13>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Feb 14, 2023 at 04:56:37PM +0100, Miquel Raynal wrote:
> Hi Geert,
> 
> geert@linux-m68k.org wrote on Tue, 14 Feb 2023 16:22:15 +0100:
> 
> > Hi Miquel,
> > 
> > On Tue, Feb 14, 2023 at 3:44 PM Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> > > geert+renesas@glider.be wrote on Tue, 14 Feb 2023 15:26:43 +0100:  
> > > > SPI EEPROMs typically support both SPI Mode 0 (CPOL=CPHA=0) and Mode 3
> > > > (CPOL=CPHA=1).  However, using the latter is currently flagged as an
> > > > error by "make dtbs_check", e.g.:
> > > >
> > > >     arch/arm/boot/dts/r8a7791-koelsch.dtb: flash@0: Unevaluated properties are not allowed ('spi-cpha', 'spi-cpol' were unexpected)
> > > >           From schema: Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> > > >
> > > > Fix this by documenting support for CPOL=CPHA=1.
> > > >
> > > > Fixes: 233363aba72ac638 ("spi/panel: dt-bindings: drop CPHA and CPOL from common properties")
> > > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > > ---
> > > >  Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml | 7 +++++++
> > > >  1 file changed, 7 insertions(+)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> > > > index f86255ce13af0871..bb62ac4585822982 100644
> > > > --- a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> > > > +++ b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> > > > @@ -76,6 +76,13 @@ properties:
> > > >        If "broken-flash-reset" is present then having this property does not
> > > >        make any difference.
> > > >
> > > > +  spi-cpol: true
> > > > +  spi-cpha: true  
> > >
> > > I see that spi-cpol and spi-cpha are described in spi-controller.yaml
> > > which references spi-peripheral-props.yaml, but jedec,spi-nor.yaml
> > > only references spi-peripheral-props.yaml leading to spi-cpol and
> > > spi-cpha not being recognized as valid properties.
> > >
> > > Wouldn't it be cleaner to to have these two properties defined in
> > > spi-peripheral-props.yaml instead?  
> > 
> > They were moved out of that file by the commit referenced in the
> > Fixes: tag above, because they are not supported by all SPI targets.
> > It's the responsibility of the SPI target bindings to list what is supported.
> 
> Oops, I overlooked that line.
> 
> I actually see no point in constraining device trees on that regard,
> but, well, Krzysztof is the author, I believe he knows his stuff, so
> let's go for it.

It's a feature of the specific device as to what modes it supports. For 
most cases where there is only one choice it should be implied from the 
compatible, but there's some exceptions like this one. 

Rob
