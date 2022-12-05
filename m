Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E7F8642CE8
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 Dec 2022 17:34:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231845AbiLEQeP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 5 Dec 2022 11:34:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232781AbiLEQdZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 5 Dec 2022 11:33:25 -0500
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 110C01EAEC;
        Mon,  5 Dec 2022 08:33:08 -0800 (PST)
Received: by mail-oi1-f171.google.com with SMTP id r11so7932091oie.13;
        Mon, 05 Dec 2022 08:33:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hqhqp0ZXnkI0q0Biib9w/buyr5MoNs1FLwzcB1Vt6bM=;
        b=71fZkXsVoFEwPozUmoFH15ih8+FavB3OmObN52fagiBXdkMVxUZ51CHy+G6WM9QNgt
         gWb6jfaH0eeUfdqfukhAzvrtHAeaLeGLzhBR2iGnKIyaLf9NEd3oj+ijs3OseqL5kSxj
         CgCZC03pUANw8cuQbzljhwmqTR/2AQHe/LnIvMcjjS3F7K5YM0q9/CRyT0AKhPsuRDts
         Lu3BWvePePkihYPZ793Lh2UmTkQksDM1a2d2Y8BreYkrv+mlWMBlxyv7RX3Et07f6Qzm
         LAUzRuIoyH7X7bHzzdjAbvjon18ajfJKZAkHfHLldeidn/dDi2ceErwHFUsOkkXrnIo7
         Q+TQ==
X-Gm-Message-State: ANoB5pkS6btfy+yYt0oEnfgUuMssB21qhg7WtmPrDU4xMS6pWLdKcjlq
        VEM9c0JIRn+SGG9XJ9s82iL90+ZHxQ==
X-Google-Smtp-Source: AA0mqf4MvfbOP05MYi3I90IViiSBgYnNTh5GEOHb/N8V1hTeGsbZjHM0XH27IkGpGsVY9fC3KRZDQA==
X-Received: by 2002:a54:451a:0:b0:35b:3f80:32e8 with SMTP id l26-20020a54451a000000b0035b3f8032e8mr29418287oil.177.1670257987238;
        Mon, 05 Dec 2022 08:33:07 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id j2-20020a4a9442000000b0049f0671a23asm6803680ooi.9.2022.12.05.08.33.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Dec 2022 08:33:06 -0800 (PST)
Received: (nullmailer pid 2034077 invoked by uid 1000);
        Mon, 05 Dec 2022 16:33:06 -0000
Date:   Mon, 5 Dec 2022 10:33:06 -0600
From:   Rob Herring <robh@kernel.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Michael Walle <michael@walle.cc>,
        Tudor Ambarus <tudor.ambarus@microchip.com>,
        Pratyush Yadav <pratyush@kernel.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mtd: jedec,spi-nor: Document support for
 more MT25QU parts
Message-ID: <20221205163306.GB2012644-robh@kernel.org>
References: <363186079b4269891073f620e3e2353cf7d2559a.1669988238.git.geert+renesas@glider.be>
 <1503a3857107e3a4f34e0c7fb5dada39@walle.cc>
 <CAMuHMdXN+HJb=zGeG=3t=Pie9cVpnBLYuEb_qX6=oSxG8eTkAw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdXN+HJb=zGeG=3t=Pie9cVpnBLYuEb_qX6=oSxG8eTkAw@mail.gmail.com>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Dec 02, 2022 at 02:56:01PM +0100, Geert Uytterhoeven wrote:
> Hi Michael,
> 
> On Fri, Dec 2, 2022 at 2:50 PM Michael Walle <michael@walle.cc> wrote:
> > Am 2022-12-02 14:37, schrieb Geert Uytterhoeven:
> > > Document support for the Micron MT25QU256A and MT25QU512A Serial NOR
> > > FLASHes.
> > >
> > > Merge the new entries with the existing entry for MT25QU02G.
> > >
> > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > ---
> > > mt25qu512a is already in active use, causing "make dtbs_check" errors.
> > > mt25qu256a is supported by the Linux spi-nor driver, but there are no
> > > upstream users yet.
> >
> > Is it encouraged to use the specific compatible with SPI-NOR flashes?
> > As far as I know it isn't. The spi-nor subsys tries hard to identify
> > any flashes at runtime and any additional information in the device tree
> > is used as a last resort (just for flashes which doesn't support the
> > read jedec id command yet). And usually boards have different sources
> > for flash chips, so hardcoding a particular part in the device tree
> > doesn't make sense.
> 
> Thanks, I am aware there have been pushbacks when trying to
> document more compatible values.
> 
> IMHO either all or none of them should be documented.
> If device-specific compatible values are discouraged, the bindings
> should be updated to reflect that, and document a single compatible
> value ("jedec,spi-nor") only.

That's already allowed, so there's your answer.

The caveat is don't be adding them later to your DT when you find an 
issue and new quirk properties will probably be rejected.

Rob
