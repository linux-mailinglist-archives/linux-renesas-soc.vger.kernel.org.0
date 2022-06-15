Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9CE1254CB6A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jun 2022 16:33:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230355AbiFOOdc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 Jun 2022 10:33:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348902AbiFOOd1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 Jun 2022 10:33:27 -0400
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AB8F340E9
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Jun 2022 07:33:26 -0700 (PDT)
Received: by mail-qt1-f177.google.com with SMTP id j8so8254217qtn.13
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Jun 2022 07:33:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=o3e3wEZj1xDPDAOZQxNyT4NMW7EiooLrp17yoP9YH0o=;
        b=x3A4W7i1KG+rzj7aUAK1eZnt9HxoiCgdiHUX+1i0dcBUn4EETTh+2WN8k6Rj8HfeT8
         khRb4Jgg8R2rHg0T+uhU4Ke+YsWRmmUFiVea9MR23yd1du8vDtzFrXxifpTBDh40uPTi
         mZlu4v6cTnkv46fW+s2De5AVZ7y7dqI2k1qfVBluixbUUNDU4VdFxrxo3hPESEgEmo6P
         ev6bX++AfPkJdj0SPkxkgsbfjevvdQtW7Z/JIOnFLPxM4j/WW5EOur8Hk1vM7B/qEznN
         beNP5873EeqU8lX+WPY5kgAhwWYktp+FEOS7oM3aMG7YAQWVb57S6Ajtx3oCVGwcC+/c
         kV6A==
X-Gm-Message-State: AOAM531mq8vEFUnUHQU9dBb/ha4dhrkoazmePI1LL69c8UhbbAPj9osy
        3DMGjfxr+oj2R4pChNKa1gNA0QntQb9qEg==
X-Google-Smtp-Source: ABdhPJyrRtAHx8zwXp5iY2XN36UUo74vkPc8cWzMGopwYYKDJ6DtUjs+MDvbXPiZjQq+VKhFI2lk6A==
X-Received: by 2002:ac8:5c07:0:b0:304:f7b7:7dda with SMTP id i7-20020ac85c07000000b00304f7b77ddamr8999496qti.123.1655303604959;
        Wed, 15 Jun 2022 07:33:24 -0700 (PDT)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id l11-20020ac84ccb000000b002f92b74ba99sm9330534qtv.13.2022.06.15.07.33.24
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jun 2022 07:33:24 -0700 (PDT)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-3137c877092so62750157b3.13
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Jun 2022 07:33:24 -0700 (PDT)
X-Received: by 2002:a0d:f801:0:b0:30f:f716:2950 with SMTP id
 i1-20020a0df801000000b0030ff7162950mr12372108ywf.358.1655303603835; Wed, 15
 Jun 2022 07:33:23 -0700 (PDT)
MIME-Version: 1.0
References: <3685623bed84674039adb61e723288d359ab0a50.1648544199.git.geert+renesas@glider.be>
In-Reply-To: <3685623bed84674039adb61e723288d359ab0a50.1648544199.git.geert+renesas@glider.be>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 15 Jun 2022 16:33:12 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWdrugZEN=7yqrsSc86AeuFR2=qM7nRk_aD=UXW9Q6cLQ@mail.gmail.com>
Message-ID: <CAMuHMdWdrugZEN=7yqrsSc86AeuFR2=qM7nRk_aD=UXW9Q6cLQ@mail.gmail.com>
Subject: Re: [PATCH TF-A] fix(plat/rcar3): Fix RPC-IF device node name
To:     tf-a@lists.trustedfirmware.org
Cc:     Marek Vasut <marek.vasut+renesas@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Mar 29, 2022 at 2:17 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> According to the Generic Names Recommendation in the Devicetree
> Specification Release v0.3, and the DT Bindings for the Renesas Reduced
> Pin Count Interface, the node name for a Renesas RPC-IF device should be
> "spi".  The node name matters, as the node is enabled by passing a DT
> fragment from TF-A to subsequent software.
>
> Fix this by renaming the device nodes from "rpc" to "spi".
>
> Fixes: 12c75c8886a0ee69 ("feat(plat/rcar3): emit RPC status to DT fragment if RPC unlocked")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Background:
>
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
> This patch takes care of the first issue in TF-A.
>
> The related patches for U-Boot are [1].
> Patches to enable RPC-IF support in Linux are available at [2].

The patches to enable RPC HyperFlash support in Linux are now in
v5.19-rc1.  What needs to be done to accept the TF-A counterpart?

Thanks!

>
> Thanks for your comments!
>
> [1] "[PATCH u-boot 0/3] renesas: Fix RPC-IF enablement"
>     https://lore.kernel.org/r/cover.1648544792.git.geert+renesas@glider.be
> [2] "[PATCH 0/5] arm64: dts: renesas: rcar-gen3: Enable HyperFlash support"
>     https://lore.kernel.org/r/cover.1648548339.git.geert+renesas@glider.be
>
> ---
>  plat/renesas/rcar/bl2_plat_setup.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/plat/renesas/rcar/bl2_plat_setup.c b/plat/renesas/rcar/bl2_plat_setup.c
> index bbfa16927d6c2384..f85db8d650c6b1a5 100644
> --- a/plat/renesas/rcar/bl2_plat_setup.c
> +++ b/plat/renesas/rcar/bl2_plat_setup.c
> @@ -574,7 +574,7 @@ static void bl2_add_rpc_node(void)
>                 goto err;
>         }
>
> -       node = ret = fdt_add_subnode(fdt, node, "rpc@ee200000");
> +       node = ret = fdt_add_subnode(fdt, node, "spi@ee200000");
>         if (ret < 0) {
>                 goto err;
>         }

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
