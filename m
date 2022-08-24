Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BECE959F4B4
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Aug 2022 10:04:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231569AbiHXIEk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 24 Aug 2022 04:04:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233776AbiHXIEk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 24 Aug 2022 04:04:40 -0400
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C6D2883C2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Aug 2022 01:04:39 -0700 (PDT)
Received: by mail-qv1-f52.google.com with SMTP id p5so10768278qvz.6
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Aug 2022 01:04:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=fj9S+x3AN3eiTlhfIMho2NCqNEd+XeeVd+l1ozB8GLo=;
        b=Xf1b9fY2mSNtmT7TqdjUfhUt7SkZwbBTPjfGGdb5sZURZqrcRnxlkbM2pSFk0lyyLo
         m1reZAkMCNgwatVSZo1yp85GBpaOyZassJBh/aSdyDbH2QI49/ZzqTmr9X5DwXEJHXIK
         BQo28+G/kvKeWSKpavMkD0hCFA18qfqQrsEls0HX+iiVME59dM2izqa6XLUiWNZ2q5ZM
         zhSD+dt9tRu16llkCJulgltjqMPGuPi7lyQbaWVBQkTOtvafWsuOlwYs6cji/J1mhzva
         NVWQOIgIVF97ZWNRNBCzUzKVeRHTBhCJ1M5qlLz9A6SHe3SSMNCVS9Qsp4IaOiBLGza7
         sQIg==
X-Gm-Message-State: ACgBeo00KxZJPiIjrXz5cCJVU4OFfrasW9M4vFdWi6iYS4j1ODa2nKU0
        YYsGjjLjC9nn0UfTljdkXIG8+VAFebTcZQ==
X-Google-Smtp-Source: AA6agR5ZO7Hljjyrmg1LyzbLkdxkOnk/9eWsCer/8HJ5yOdxBcnn+DkVbf++Fi+Lh5C/7FWf17TThA==
X-Received: by 2002:a05:6214:76f:b0:486:b1a1:753b with SMTP id f15-20020a056214076f00b00486b1a1753bmr23434396qvz.18.1661328278115;
        Wed, 24 Aug 2022 01:04:38 -0700 (PDT)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com. [209.85.128.174])
        by smtp.gmail.com with ESMTPSA id dm47-20020a05620a1d6f00b006b8fb2a1145sm14736831qkb.124.2022.08.24.01.04.37
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Aug 2022 01:04:37 -0700 (PDT)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-3378303138bso400306907b3.9
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Aug 2022 01:04:37 -0700 (PDT)
X-Received: by 2002:a05:690c:830:b0:33d:794b:e66c with SMTP id
 by16-20020a05690c083000b0033d794be66cmr7938828ywb.502.1661328277487; Wed, 24
 Aug 2022 01:04:37 -0700 (PDT)
MIME-Version: 1.0
References: <3685623bed84674039adb61e723288d359ab0a50.1648544199.git.geert+renesas@glider.be>
 <CAMuHMdWdrugZEN=7yqrsSc86AeuFR2=qM7nRk_aD=UXW9Q6cLQ@mail.gmail.com>
In-Reply-To: <CAMuHMdWdrugZEN=7yqrsSc86AeuFR2=qM7nRk_aD=UXW9Q6cLQ@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 24 Aug 2022 10:04:25 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWiQNjx9_hDhMEe0gHLiqLw1U0Sy0JSb+bdXHEBMgyNvg@mail.gmail.com>
Message-ID: <CAMuHMdWiQNjx9_hDhMEe0gHLiqLw1U0Sy0JSb+bdXHEBMgyNvg@mail.gmail.com>
Subject: Re: [PATCH TF-A] fix(plat/rcar3): Fix RPC-IF device node name
To:     tf-a@lists.trustedfirmware.org
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

On Wed, Jun 15, 2022 at 4:33 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Tue, Mar 29, 2022 at 2:17 PM Geert Uytterhoeven
> <geert+renesas@glider.be> wrote:
> > According to the Generic Names Recommendation in the Devicetree
> > Specification Release v0.3, and the DT Bindings for the Renesas Reduced
> > Pin Count Interface, the node name for a Renesas RPC-IF device should be
> > "spi".  The node name matters, as the node is enabled by passing a DT
> > fragment from TF-A to subsequent software.
> >
> > Fix this by renaming the device nodes from "rpc" to "spi".
> >
> > Fixes: 12c75c8886a0ee69 ("feat(plat/rcar3): emit RPC status to DT fragment if RPC unlocked")
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > Background:
> >
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
> > This patch takes care of the first issue in TF-A.
> >
> > The related patches for U-Boot are [1].
> > Patches to enable RPC-IF support in Linux are available at [2].
>
> The patches to enable RPC HyperFlash support in Linux are now in
> v5.19-rc1.  What needs to be done to accept the TF-A counterpart?

The Linux counterpart is now in v5.19.
Can you please apply this patch to TF-A?
Thanks!

> > [1] "[PATCH u-boot 0/3] renesas: Fix RPC-IF enablement"
> >     https://lore.kernel.org/r/cover.1648544792.git.geert+renesas@glider.be
> > [2] "[PATCH 0/5] arm64: dts: renesas: rcar-gen3: Enable HyperFlash support"
> >     https://lore.kernel.org/r/cover.1648548339.git.geert+renesas@glider.be
> >
> > ---
> >  plat/renesas/rcar/bl2_plat_setup.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/plat/renesas/rcar/bl2_plat_setup.c b/plat/renesas/rcar/bl2_plat_setup.c
> > index bbfa16927d6c2384..f85db8d650c6b1a5 100644
> > --- a/plat/renesas/rcar/bl2_plat_setup.c
> > +++ b/plat/renesas/rcar/bl2_plat_setup.c
> > @@ -574,7 +574,7 @@ static void bl2_add_rpc_node(void)
> >                 goto err;
> >         }
> >
> > -       node = ret = fdt_add_subnode(fdt, node, "rpc@ee200000");
> > +       node = ret = fdt_add_subnode(fdt, node, "spi@ee200000");
> >         if (ret < 0) {
> >                 goto err;
> >         }

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
