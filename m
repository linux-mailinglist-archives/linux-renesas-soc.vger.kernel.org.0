Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E978B59F4B0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Aug 2022 10:03:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235552AbiHXIDX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 24 Aug 2022 04:03:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235571AbiHXIDS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 24 Aug 2022 04:03:18 -0400
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D857E883C2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Aug 2022 01:03:16 -0700 (PDT)
Received: by mail-qv1-f44.google.com with SMTP id e4so12302786qvr.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Aug 2022 01:03:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=9fRUMqAzdXfUjsju6Hx+VIJGS2oDQtH41W+JcPjdv3g=;
        b=Km2rBEDHS54Ty/y0QqFg825gKC1lN7IHnHb2/Q2w7aBrmO9E5Mv72WWzWei2f+F3NR
         1vg/xfMpoUMLmt27kiOIc9hrMpIccReye3sfh3Q6nqiz3x5QOT9q8OZTAL17Iv+AJGU+
         yBlCUqmOIHTNdgaEnjNLkj2h4vahPx9j/QEVOVwTqGhXYRTrJbjHxjTfk0A6scDmPuK/
         2uBlL8i86JN6WOKCU250sGCQYqJIryieted+yzJWZfgw7Oj0GKOXz5fhIfG3TDx2D0fJ
         jn6AkgleqL6o7AJEWQ79pxmzx2LF4qY5KYe9Wal6Wuxh+77gnYlnD/arffaPtCfF+h9L
         IdDg==
X-Gm-Message-State: ACgBeo0AHRfnf5HO+vGXkrvNT3Nanh/ZTe29mlsoairElpspDlXQbPbK
        ul3/STraX1fsTROJN46ihrSMKBlOEtEgUg==
X-Google-Smtp-Source: AA6agR4d3TirGte6kOkDGGq77cR1j9oVuj8Qvi5EBStv7r48C//eJfQvf3hhCqOiFaYiEME2Lb6FVg==
X-Received: by 2002:a05:6214:2267:b0:474:8ff7:a21c with SMTP id gs7-20020a056214226700b004748ff7a21cmr23447030qvb.56.1661328195831;
        Wed, 24 Aug 2022 01:03:15 -0700 (PDT)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com. [209.85.128.170])
        by smtp.gmail.com with ESMTPSA id u6-20020a05620a430600b006bc5cdc890bsm379474qko.77.2022.08.24.01.03.15
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Aug 2022 01:03:15 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-3378303138bso400229867b3.9
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Aug 2022 01:03:15 -0700 (PDT)
X-Received: by 2002:a0d:eb45:0:b0:333:f813:6c79 with SMTP id
 u66-20020a0deb45000000b00333f8136c79mr29681652ywe.384.1661328194704; Wed, 24
 Aug 2022 01:03:14 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1648544792.git.geert+renesas@glider.be> <CAMuHMdWNMcVcTRJ--pi1HkL1cmDOCE1SuOWMR6fY8jOj1d77LA@mail.gmail.com>
In-Reply-To: <CAMuHMdWNMcVcTRJ--pi1HkL1cmDOCE1SuOWMR6fY8jOj1d77LA@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 24 Aug 2022 10:03:03 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVX73sFo8NqfTv0-Q_twZuBR7bkTOAcaRO2dFEDdzoZQA@mail.gmail.com>
Message-ID: <CAMuHMdVX73sFo8NqfTv0-Q_twZuBR7bkTOAcaRO2dFEDdzoZQA@mail.gmail.com>
Subject: Re: [PATCH u-boot 0/3] renesas: Fix RPC-IF enablement
To:     Nobuhiro Iwamatsu <iwamatsu@nigauri.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>
Cc:     U-Boot Mailing List <u-boot@lists.denx.de>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Iwamatsu-san, Marek,

On Wed, Jun 15, 2022 at 4:34 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Tue, Mar 29, 2022 at 2:19 PM Geert Uytterhoeven
> <geert+renesas@glider.be> wrote:
> > On Renesas R-Car Gen3 platforms, the SPI Multi I/O Bus Controllers
> > (RPC-IF) provide access to HyperFlash or QSPI storage.  On production
> > systems, they are typically locked by the TF-A firmware, unless TF-A is
> > built with RCAR_RPC_HYPERFLASH_LOCKED=0.  When unlocked, TF-A
> > communicates this to subsequent software by passing a DT fragment that
> > sets the "status" property of the RPC-IF device node to "okay".
> >
> > Unfortunately there are several issues preventing this from working all
> > the way to Linux:
> >   1. TF-A (and U-Boot on the receiving side) uses a device node name
> >      that does not conform to the DT specification nor the DT bindings
> >      for RPC-IF,
> >   2. While U-Boot receives the RPC-IF enablement from TF-A, it does not
> >      propagate it to Linux yet,
> >   3. The DTS files that are part of Linux do not have RPC HyperFlash
> >      support yet.
> >
> > The first issue in TF-A is handled by [1].
> >
> > This patch series takes care of the first and second issue in U-Boot, by
> > renaming the RPC-IF device node, and by propagating the enablement from
> > TF-A, if present, to Linux.  The third patch updates the RPC-IF
> > compatible values to match the actual DT bindings, but this is not
> > critical for operation, and can be postponed (e.g. by syncing DTS with
> > Linux v5.19).
> >
> > Patches to enable RPC-IF support in Linux are available at [2].
>
> The patches to enable RPC HyperFlash support in Linux are now in
> v5.19-rc1.  What needs to be done to accept the U-Boot counterpart?

The Linux counterpart is now in v5.19.
Can you please apply at least the first two patches to U-Boot?
Thanks!

> >
> > Thanks for your comments!
> >
> > [1] "[PATCH TF-A] fix(plat/rcar3): Fix RPC-IF device node name"
> >     https://lore.kernel.org/r/3685623bed84674039adb61e723288d359ab0a50.1648544199.git.geert+renesas@glider.be
> > [2] "[PATCH 0/5] arm64: dts: renesas: rcar-gen3: Enable HyperFlash support"
> >     https://lore.kernel.org/r/cover.1648548339.git.geert+renesas@glider.be
> >
> > Geert Uytterhoeven (3):
> >   ARM: dts: rmobile: Fix RPC-IF device node names
> >   ARM: renesas: Propagate RPC-IF enablement to subsequent software
> >   [RFC] renesas: Fix RPC-IF compatible values
> >
> >  arch/arm/dts/r7s72100-gr-peach-u-boot.dts |  4 +-
> >  arch/arm/dts/r8a774c0-u-boot.dtsi         |  4 +-
> >  arch/arm/dts/r8a77950-u-boot.dtsi         |  4 +-
> >  arch/arm/dts/r8a77960-u-boot.dtsi         |  4 +-
> >  arch/arm/dts/r8a77965-u-boot.dtsi         |  4 +-
> >  arch/arm/dts/r8a77970-u-boot.dtsi         |  4 +-
> >  arch/arm/dts/r8a77980-u-boot.dtsi         |  4 +-
> >  arch/arm/dts/r8a77990-u-boot.dtsi         |  4 +-
> >  arch/arm/dts/r8a77995-u-boot.dtsi         |  4 +-
> >  arch/arm/dts/r8a779a0-u-boot.dtsi         |  2 +-
> >  board/renesas/rcar-common/common.c        | 46 ++++++++++++++++++++++-
> >  drivers/mtd/renesas_rpc_hf.c              |  3 +-
> >  drivers/spi/renesas_rpc_spi.c             |  9 +----
> >  13 files changed, 67 insertions(+), 29 deletions(-)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
