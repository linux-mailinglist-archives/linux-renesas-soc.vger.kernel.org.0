Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E7EBC59F6EC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Aug 2022 11:55:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235404AbiHXJzU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 24 Aug 2022 05:55:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236067AbiHXJy4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 24 Aug 2022 05:54:56 -0400
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2FB26FA32
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Aug 2022 02:54:40 -0700 (PDT)
Received: by mail-qk1-f176.google.com with SMTP id j6so12231296qkl.10
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Aug 2022 02:54:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=S3vPn7CGFqWszcPDoTJKVUPT7qXdqM74TP/Buh24uy4=;
        b=0we8PvaDFukYlnIeMBaU5xR1KpyycUGjZ0d+GTB0QDy4oo/C+bxBHN5cGJvNCNZ3/3
         tGO4jdiR7suptBmmbLACukL3vX2dNbV+RBV5BOOh6fCpPgV3vMCBr2YtUYOklM+FSoYD
         mrRLUAaYuW4VQw+zatXZGdbnto0irpmeUNoHZGlETxI3YVXuN/5GPbpqFsByS9Sufepx
         LNIx7OMPtDvGqwxfXcI4/Q0rblAPxrsqMWU2e75sUy/aVtwbXuuQ0f23AGPTM8FN9ZYZ
         xhTZy8BQOsyb0LUPAwd+WDXIbI8zP9LQO/viLdAb590f0K69Zx0xVucYwF7TpL5moY3j
         PC5A==
X-Gm-Message-State: ACgBeo0flprNu2vQvcpwWcoIZgWca/436AyurWraxsA7BHUxGLcCRLx8
        GSpIUkolM/AEg0OltgZncdlQcx+e3DY8AQ==
X-Google-Smtp-Source: AA6agR4l2dJIOMybzCJtMVY8TfP/65pVkdtnr4WZjGZY9F8zh4mYzLXDAd2rpa76okqr8kp+hK+omg==
X-Received: by 2002:a37:8903:0:b0:6bb:e6e8:a6c6 with SMTP id l3-20020a378903000000b006bbe6e8a6c6mr14276492qkd.316.1661334879636;
        Wed, 24 Aug 2022 02:54:39 -0700 (PDT)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com. [209.85.128.171])
        by smtp.gmail.com with ESMTPSA id bj21-20020a05620a191500b006bbfc742511sm9636293qkb.12.2022.08.24.02.54.38
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Aug 2022 02:54:38 -0700 (PDT)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-33387bf0c4aso445846417b3.11
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Aug 2022 02:54:38 -0700 (PDT)
X-Received: by 2002:a25:415:0:b0:696:814:7c77 with SMTP id 21-20020a250415000000b0069608147c77mr4781723ybe.36.1661334878450;
 Wed, 24 Aug 2022 02:54:38 -0700 (PDT)
MIME-Version: 1.0
References: <3685623bed84674039adb61e723288d359ab0a50.1648544199.git.geert+renesas@glider.be>
 <CAMuHMdWdrugZEN=7yqrsSc86AeuFR2=qM7nRk_aD=UXW9Q6cLQ@mail.gmail.com> <CAMuHMdWiQNjx9_hDhMEe0gHLiqLw1U0Sy0JSb+bdXHEBMgyNvg@mail.gmail.com>
In-Reply-To: <CAMuHMdWiQNjx9_hDhMEe0gHLiqLw1U0Sy0JSb+bdXHEBMgyNvg@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 24 Aug 2022 11:54:27 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXAdeVXFytY4_ffNUJ6JVVt4SpVyk4wwDx4yMNY4hwG4Q@mail.gmail.com>
Message-ID: <CAMuHMdXAdeVXFytY4_ffNUJ6JVVt4SpVyk4wwDx4yMNY4hwG4Q@mail.gmail.com>
Subject: Re: [PATCH TF-A] fix(plat/rcar3): Fix RPC-IF device node name
To:     tf-a@lists.trustedfirmware.org
Cc:     Marek Vasut <marek.vasut+renesas@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Jorge Ramirez-Ortiz <jramirez@baylibre.com>
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

CC the other Renesas rcar-gen3 platform port maintainer

On Wed, Aug 24, 2022 at 10:04 AM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Wed, Jun 15, 2022 at 4:33 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Tue, Mar 29, 2022 at 2:17 PM Geert Uytterhoeven
> > <geert+renesas@glider.be> wrote:
> > > According to the Generic Names Recommendation in the Devicetree
> > > Specification Release v0.3, and the DT Bindings for the Renesas Reduced
> > > Pin Count Interface, the node name for a Renesas RPC-IF device should be
> > > "spi".  The node name matters, as the node is enabled by passing a DT
> > > fragment from TF-A to subsequent software.
> > >
> > > Fix this by renaming the device nodes from "rpc" to "spi".
> > >
> > > Fixes: 12c75c8886a0ee69 ("feat(plat/rcar3): emit RPC status to DT fragment if RPC unlocked")
> > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > ---
> > > Background:
> > >
> > > On Renesas R-Car Gen3 platforms, the SPI Multi I/O Bus Controllers
> > > (RPC-IF) provide access to HyperFlash or QSPI storage.  On production
> > > systems, they are typically locked by the TF-A firmware, unless TF-A is
> > > built with RCAR_RPC_HYPERFLASH_LOCKED=0.  When unlocked, TF-A
> > > communicates this to subsequent software by passing a DT fragment that
> > > sets the "status" property of the RPC-IF device node to "okay".
> > >
> > > Unfortunately there are several issues preventing this from working all
> > > the way to Linux:
> > >   1. TF-A (and U-Boot on the receiving side) uses a device node name
> > >      that does not conform to the DT specification nor the DT bindings
> > >      for RPC-IF,
> > >   2. While U-Boot receives the RPC-IF enablement from TF-A, it does not
> > >      propagate it to Linux yet,
> > >   3. The DTS files that are part of Linux do not have RPC HyperFlash
> > >      support yet.
> > >
> > > This patch takes care of the first issue in TF-A.
> > >
> > > The related patches for U-Boot are [1].
> > > Patches to enable RPC-IF support in Linux are available at [2].
> >
> > The patches to enable RPC HyperFlash support in Linux are now in
> > v5.19-rc1.  What needs to be done to accept the TF-A counterpart?
>
> The Linux counterpart is now in v5.19.
> Can you please apply this patch to TF-A?
> Thanks!
>
> > > [1] "[PATCH u-boot 0/3] renesas: Fix RPC-IF enablement"
> > >     https://lore.kernel.org/r/cover.1648544792.git.geert+renesas@glider.be
> > > [2] "[PATCH 0/5] arm64: dts: renesas: rcar-gen3: Enable HyperFlash support"
> > >     https://lore.kernel.org/r/cover.1648548339.git.geert+renesas@glider.be
> > >
> > > ---
> > >  plat/renesas/rcar/bl2_plat_setup.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/plat/renesas/rcar/bl2_plat_setup.c b/plat/renesas/rcar/bl2_plat_setup.c
> > > index bbfa16927d6c2384..f85db8d650c6b1a5 100644
> > > --- a/plat/renesas/rcar/bl2_plat_setup.c
> > > +++ b/plat/renesas/rcar/bl2_plat_setup.c
> > > @@ -574,7 +574,7 @@ static void bl2_add_rpc_node(void)
> > >                 goto err;
> > >         }
> > >
> > > -       node = ret = fdt_add_subnode(fdt, node, "rpc@ee200000");
> > > +       node = ret = fdt_add_subnode(fdt, node, "spi@ee200000");
> > >         if (ret < 0) {
> > >                 goto err;
> > >         }

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
