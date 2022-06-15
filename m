Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5BFCF54CB6C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jun 2022 16:34:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241863AbiFOOeg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 Jun 2022 10:34:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236996AbiFOOeg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 Jun 2022 10:34:36 -0400
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A659369FD
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Jun 2022 07:34:35 -0700 (PDT)
Received: by mail-qk1-f172.google.com with SMTP id g15so7457027qke.4
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Jun 2022 07:34:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QBe342T7J92VWzefM/fn50jekflYTT/EelGkl/djKwM=;
        b=mpL8gxH2LXzTvlxWcMo3qoYmD+DXXCYs8zFvwYljJFXVCNe7ChVmTU3o7YW0hZoh74
         nQvtd/++P2nihI+c33odjjwf4Y/uTmGZDzAB+zJt9Id4NcIWwCgJCcjfjxyOnfuEzPRG
         vV338kEIvpjHWTmJGK2ZrxnDRYE6q/O3bzWTEVvJ2/NOZ0ahMF2iDbV6TBBMiZDua3Vr
         bYVYJ8NpyFOs8XdczBIYOOYSGm/9WSYADEosgvqQjmit2jwfcMTSQUtNx+9XP1nyYg9u
         +wC+Z87mkgrj36qdDLWjDc/hb5Q6WcezODs80qmQDGVRU7G1ebBMzmDcZqFrCm9icSma
         z5iw==
X-Gm-Message-State: AOAM533/Wf2oKqsQ8DTbxPcPx+E00OXqcwHwMJL7nCPjL9dqegIG/9VH
        dP0fmDdpVKmcOkY7Ne7qYR/ThsrQPPzz7g==
X-Google-Smtp-Source: ABdhPJxKiDW/L0zbCQnBJgw13E41xWZkCcHZBPyTGd+QgOWQyl6Gc3fwcucNq182tWudwWsVr9nDFg==
X-Received: by 2002:a37:aa81:0:b0:6a6:8097:3f5b with SMTP id t123-20020a37aa81000000b006a680973f5bmr8230043qke.335.1655303674301;
        Wed, 15 Jun 2022 07:34:34 -0700 (PDT)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com. [209.85.128.172])
        by smtp.gmail.com with ESMTPSA id t5-20020a05622a148500b00304e90f66f7sm9649749qtx.70.2022.06.15.07.34.33
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jun 2022 07:34:33 -0700 (PDT)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-30fa61b1a83so63888147b3.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Jun 2022 07:34:33 -0700 (PDT)
X-Received: by 2002:a81:1dd2:0:b0:30f:a4fc:315e with SMTP id
 d201-20020a811dd2000000b0030fa4fc315emr12412537ywd.383.1655303672793; Wed, 15
 Jun 2022 07:34:32 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1648544792.git.geert+renesas@glider.be>
In-Reply-To: <cover.1648544792.git.geert+renesas@glider.be>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 15 Jun 2022 16:34:21 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWNMcVcTRJ--pi1HkL1cmDOCE1SuOWMR6fY8jOj1d77LA@mail.gmail.com>
Message-ID: <CAMuHMdWNMcVcTRJ--pi1HkL1cmDOCE1SuOWMR6fY8jOj1d77LA@mail.gmail.com>
Subject: Re: [PATCH u-boot 0/3] renesas: Fix RPC-IF enablement
To:     U-Boot Mailing List <u-boot@lists.denx.de>
Cc:     Marek Vasut <marek.vasut+renesas@gmail.com>,
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

On Tue, Mar 29, 2022 at 2:19 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> On Renesas R-Car Gen3 platforms, the SPI Multi I/O Bus Controllers
> (RPC-IF) provide access to HyperFlash or QSPI storage.  On production
> systems, they are typically locked by the TF-A firmware, unless TF-A is
> built with RCAR_RPC_HYPERFLASH_LOCKED=0.  When unlocked, TF-A
> communicates this to subsequent software by passing a DT fragment that
> sets the "status" property of the RPC-IF device node to "okay".
>
> Unfortunately there are several issues preventing this from working all
> the way to Linux:
>   1. TF-A (and U-Boot on the receiving side) uses a device node name
>      that does not conform to the DT specification nor the DT bindings
>      for RPC-IF,
>   2. While U-Boot receives the RPC-IF enablement from TF-A, it does not
>      propagate it to Linux yet,
>   3. The DTS files that are part of Linux do not have RPC HyperFlash
>      support yet.
>
> The first issue in TF-A is handled by [1].
>
> This patch series takes care of the first and second issue in U-Boot, by
> renaming the RPC-IF device node, and by propagating the enablement from
> TF-A, if present, to Linux.  The third patch updates the RPC-IF
> compatible values to match the actual DT bindings, but this is not
> critical for operation, and can be postponed (e.g. by syncing DTS with
> Linux v5.19).
>
> Patches to enable RPC-IF support in Linux are available at [2].

The patches to enable RPC HyperFlash support in Linux are now in
v5.19-rc1.  What needs to be done to accept the U-Boot counterpart?

Thanks!

>
> Thanks for your comments!
>
> [1] "[PATCH TF-A] fix(plat/rcar3): Fix RPC-IF device node name"
>     https://lore.kernel.org/r/3685623bed84674039adb61e723288d359ab0a50.1648544199.git.geert+renesas@glider.be
> [2] "[PATCH 0/5] arm64: dts: renesas: rcar-gen3: Enable HyperFlash support"
>     https://lore.kernel.org/r/cover.1648548339.git.geert+renesas@glider.be
>
> Geert Uytterhoeven (3):
>   ARM: dts: rmobile: Fix RPC-IF device node names
>   ARM: renesas: Propagate RPC-IF enablement to subsequent software
>   [RFC] renesas: Fix RPC-IF compatible values
>
>  arch/arm/dts/r7s72100-gr-peach-u-boot.dts |  4 +-
>  arch/arm/dts/r8a774c0-u-boot.dtsi         |  4 +-
>  arch/arm/dts/r8a77950-u-boot.dtsi         |  4 +-
>  arch/arm/dts/r8a77960-u-boot.dtsi         |  4 +-
>  arch/arm/dts/r8a77965-u-boot.dtsi         |  4 +-
>  arch/arm/dts/r8a77970-u-boot.dtsi         |  4 +-
>  arch/arm/dts/r8a77980-u-boot.dtsi         |  4 +-
>  arch/arm/dts/r8a77990-u-boot.dtsi         |  4 +-
>  arch/arm/dts/r8a77995-u-boot.dtsi         |  4 +-
>  arch/arm/dts/r8a779a0-u-boot.dtsi         |  2 +-
>  board/renesas/rcar-common/common.c        | 46 ++++++++++++++++++++++-
>  drivers/mtd/renesas_rpc_hf.c              |  3 +-
>  drivers/spi/renesas_rpc_spi.c             |  9 +----
>  13 files changed, 67 insertions(+), 29 deletions(-)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
