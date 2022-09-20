Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D655C5BE299
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Sep 2022 12:04:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229982AbiITKEj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 20 Sep 2022 06:04:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229825AbiITKEi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 20 Sep 2022 06:04:38 -0400
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A3F8B84D
        for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Sep 2022 03:04:35 -0700 (PDT)
Received: by mail-qk1-f177.google.com with SMTP id c19so1217692qkm.7
        for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Sep 2022 03:04:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=ghyT8cgVwiLe1DvCIX2P5ZyVfH7PzN5WsJqoA326jcw=;
        b=uwhWqxr9iYsI0yRzIDbcCssBBEUq5Mc+gLavOX52J/nVsk5ul/tCqnZmIWHlxBCa/N
         W1Ot+6x7YUKSPV89YHWFaHGDFNhtHsaDCrnkt8xGJ3TY17r8iNXMV9Ai+AyLfpc+O7CJ
         bJ23doY5tDCFKYQhzpvRJjk9owuxxgxZ6eV/73Gw1TNsuyPFLWr0dI7mHQrJwg3W2IFd
         Fc9vRhIKEnmjHkHlz9Ic/Ts1d1cwZ8oNbjlJd6FWnfSyNDuTbdQUrujC6xnB3o8lBSnC
         mNw4zXnBlWVJHoABJeYgt4JcE6E9/D14ZG0rF7t6Xo2bUFi+ImvaRiqiiIjBa86NEXqQ
         XmWA==
X-Gm-Message-State: ACrzQf2nRFkCvfHhDpbEQhN/WRNMamRIWiDue9LYcDf77MbeyAuDkUer
        gHEyyslUlKqYzupkwfXl+3xfVVgpen8uXw==
X-Google-Smtp-Source: AMsMyM4TAV4cduajmQ6B+AhwqTaxmISJsOVzTNPPNeTfWEmGEy9Zv6MAX7jmMwQ2sZ0eQRKJUcTIyg==
X-Received: by 2002:a05:620a:4309:b0:6bc:4017:8d55 with SMTP id u9-20020a05620a430900b006bc40178d55mr16193829qko.655.1663668274741;
        Tue, 20 Sep 2022 03:04:34 -0700 (PDT)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com. [209.85.219.177])
        by smtp.gmail.com with ESMTPSA id ay20-20020a05622a229400b0035ba3cae6basm627114qtb.34.2022.09.20.03.04.33
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Sep 2022 03:04:34 -0700 (PDT)
Received: by mail-yb1-f177.google.com with SMTP id p69so2703342yba.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Sep 2022 03:04:33 -0700 (PDT)
X-Received: by 2002:a5b:506:0:b0:6af:ffac:4459 with SMTP id
 o6-20020a5b0506000000b006afffac4459mr16987243ybp.365.1663668273568; Tue, 20
 Sep 2022 03:04:33 -0700 (PDT)
MIME-Version: 1.0
References: <3685623bed84674039adb61e723288d359ab0a50.1648544199.git.geert+renesas@glider.be>
 <CAMuHMdWdrugZEN=7yqrsSc86AeuFR2=qM7nRk_aD=UXW9Q6cLQ@mail.gmail.com>
 <CAMuHMdWiQNjx9_hDhMEe0gHLiqLw1U0Sy0JSb+bdXHEBMgyNvg@mail.gmail.com>
 <CAMuHMdXAdeVXFytY4_ffNUJ6JVVt4SpVyk4wwDx4yMNY4hwG4Q@mail.gmail.com> <7b05d61c-3f81-c58d-3728-88a2b4a5201f@arm.com>
In-Reply-To: <7b05d61c-3f81-c58d-3728-88a2b4a5201f@arm.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 20 Sep 2022 12:04:21 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWhHMMzaLhko38Twi2Qv81qtkzsuz0T=Jb4PjLqes09TA@mail.gmail.com>
Message-ID: <CAMuHMdWhHMMzaLhko38Twi2Qv81qtkzsuz0T=Jb4PjLqes09TA@mail.gmail.com>
Subject: Re: [TF-A] Re: [PATCH TF-A] fix(plat/rcar3): Fix RPC-IF device node name
To:     Sandrine Bailleux <sandrine.bailleux@arm.com>
Cc:     tf-a@lists.trustedfirmware.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Sandrine,

[dropped Jorge Ramirez-Ortiz, aas his address bounces, while
 he is still listed as first Renesas maintainer]

On Thu, Sep 1, 2022 at 9:57 AM Sandrine Bailleux
<sandrine.bailleux@arm.com> wrote:
> TF-A project uses Gerrit for code reviews. Please refer to the
> "Contributor's Guide" [1], in particular section "6.3. Submitting Changes".
>
> Could you please post your patch to review.trustedfirmware.org, adding
> the Renesas platform maintainers as reviewers?

Thank you, I have done so.
If anything is still missing, please let me know.

Thanks!

> I will trigger a CI run on your patch (in this case, given the nature of
> the change, this is mainly just for commit message compliance) and I'll
> provide the "maintainer" review.
>
> [1]
> https://trustedfirmware-a.readthedocs.io/en/latest/process/contributing.html
>
> On 8/24/22 11:54, Geert Uytterhoeven via TF-A wrote:
> > CC the other Renesas rcar-gen3 platform port maintainer
> >
> > On Wed, Aug 24, 2022 at 10:04 AM Geert Uytterhoeven
> > <geert@linux-m68k.org> wrote:
> >> On Wed, Jun 15, 2022 at 4:33 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> >>> On Tue, Mar 29, 2022 at 2:17 PM Geert Uytterhoeven
> >>> <geert+renesas@glider.be> wrote:
> >>>> According to the Generic Names Recommendation in the Devicetree
> >>>> Specification Release v0.3, and the DT Bindings for the Renesas Reduced
> >>>> Pin Count Interface, the node name for a Renesas RPC-IF device should be
> >>>> "spi".  The node name matters, as the node is enabled by passing a DT
> >>>> fragment from TF-A to subsequent software.
> >>>>
> >>>> Fix this by renaming the device nodes from "rpc" to "spi".
> >>>>
> >>>> Fixes: 12c75c8886a0ee69 ("feat(plat/rcar3): emit RPC status to DT fragment if RPC unlocked")
> >>>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >>>> ---
> >>>> Background:
> >>>>
> >>>> On Renesas R-Car Gen3 platforms, the SPI Multi I/O Bus Controllers
> >>>> (RPC-IF) provide access to HyperFlash or QSPI storage.  On production
> >>>> systems, they are typically locked by the TF-A firmware, unless TF-A is
> >>>> built with RCAR_RPC_HYPERFLASH_LOCKED=0.  When unlocked, TF-A
> >>>> communicates this to subsequent software by passing a DT fragment that
> >>>> sets the "status" property of the RPC-IF device node to "okay".
> >>>>
> >>>> Unfortunately there are several issues preventing this from working all
> >>>> the way to Linux:
> >>>>    1. TF-A (and U-Boot on the receiving side) uses a device node name
> >>>>       that does not conform to the DT specification nor the DT bindings
> >>>>       for RPC-IF,
> >>>>    2. While U-Boot receives the RPC-IF enablement from TF-A, it does not
> >>>>       propagate it to Linux yet,
> >>>>    3. The DTS files that are part of Linux do not have RPC HyperFlash
> >>>>       support yet.
> >>>>
> >>>> This patch takes care of the first issue in TF-A.
> >>>>
> >>>> The related patches for U-Boot are [1].
> >>>> Patches to enable RPC-IF support in Linux are available at [2].
> >>>
> >>> The patches to enable RPC HyperFlash support in Linux are now in
> >>> v5.19-rc1.  What needs to be done to accept the TF-A counterpart?
> >>
> >> The Linux counterpart is now in v5.19.
> >> Can you please apply this patch to TF-A?
> >> Thanks!
> >>
> >>>> [1] "[PATCH u-boot 0/3] renesas: Fix RPC-IF enablement"
> >>>>      https://lore.kernel.org/r/cover.1648544792.git.geert+renesas@glider.be
> >>>> [2] "[PATCH 0/5] arm64: dts: renesas: rcar-gen3: Enable HyperFlash support"
> >>>>      https://lore.kernel.org/r/cover.1648548339.git.geert+renesas@glider.be
> >>>>
> >>>> ---
> >>>>   plat/renesas/rcar/bl2_plat_setup.c | 2 +-
> >>>>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>>>
> >>>> diff --git a/plat/renesas/rcar/bl2_plat_setup.c b/plat/renesas/rcar/bl2_plat_setup.c
> >>>> index bbfa16927d6c2384..f85db8d650c6b1a5 100644
> >>>> --- a/plat/renesas/rcar/bl2_plat_setup.c
> >>>> +++ b/plat/renesas/rcar/bl2_plat_setup.c
> >>>> @@ -574,7 +574,7 @@ static void bl2_add_rpc_node(void)
> >>>>                  goto err;
> >>>>          }
> >>>>
> >>>> -       node = ret = fdt_add_subnode(fdt, node, "rpc@ee200000");
> >>>> +       node = ret = fdt_add_subnode(fdt, node, "spi@ee200000");
> >>>>          if (ret < 0) {
> >>>>                  goto err;
> >>>>          }

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
