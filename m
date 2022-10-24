Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9CD1760A358
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Oct 2022 13:55:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231834AbiJXLzV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 24 Oct 2022 07:55:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232431AbiJXLyo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 24 Oct 2022 07:54:44 -0400
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CD32792CE
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Oct 2022 04:45:48 -0700 (PDT)
Received: by mail-qk1-f174.google.com with SMTP id z30so5833108qkz.13
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Oct 2022 04:45:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qzRTIDzEwdqztDpMK8WUBQNfIGnSzcnmTeZ0Sqbgjvc=;
        b=w+Be4mtbvyw6Md94Z9+zJyz3RPyWIiaiimIxynqI48fvOBNkIZut/omewF51DuFrm7
         isZGQwPqJr79PVfgSwV64lwxRpyAfLNCDQR8GQQtS6Aq5vZQ3aVCXt0BMtKXf9KOIT4o
         5d57rnT3clFo2BOCnL26l2bfmBg/MG5xu/qotM2XPz2JZt7SgKhwPoHBMtmE1ewORaUq
         8a7d++UNDm+qhyjnmyQZEmxerAngbauIQkXwoJ38EdIfOwoIdIw6xn//pJugxa9vY5Lv
         IPIBlt/CFnKeDLMr5kxObhC4vJLsDQJW5Ds0/5/A2Ci2d9Natq6Jq2pDH/bBTZEPlMI8
         maXw==
X-Gm-Message-State: ACrzQf1ZRO7QZ/hRUNOzD00bJNKmIHj+AuUUrV9ufiW7kplZrJnlPnQb
        sw0yWdKOJuCMDvZBfADLUnWMMAjyUGy1Mg==
X-Google-Smtp-Source: AMsMyM6EqATu2vUq+LTIxJEb8gfR3FB4XkJdq0L5dpPMcEY7FYl+2AkhdAkQbBM2Xq6VgPK1eA1mLQ==
X-Received: by 2002:a05:620a:28cd:b0:6cf:93b3:a78 with SMTP id l13-20020a05620a28cd00b006cf93b30a78mr22764699qkp.11.1666611863259;
        Mon, 24 Oct 2022 04:44:23 -0700 (PDT)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com. [209.85.219.176])
        by smtp.gmail.com with ESMTPSA id w27-20020a05620a0e9b00b006cdd0939ffbsm14553672qkm.86.2022.10.24.04.44.22
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Oct 2022 04:44:23 -0700 (PDT)
Received: by mail-yb1-f176.google.com with SMTP id r3so10706567yba.5
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Oct 2022 04:44:22 -0700 (PDT)
X-Received: by 2002:a25:687:0:b0:6c2:2b0c:26e with SMTP id 129-20020a250687000000b006c22b0c026emr28194432ybg.202.1666611862378;
 Mon, 24 Oct 2022 04:44:22 -0700 (PDT)
MIME-Version: 1.0
References: <166659844222.14311.17116209019703402868.git-patchwork-summary@kernel.org>
In-Reply-To: <166659844222.14311.17116209019703402868.git-patchwork-summary@kernel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 24 Oct 2022 13:44:11 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUm48et-gb565iCcut-n+4coHManX=XONN+STJLEY5zkA@mail.gmail.com>
Message-ID: <CAMuHMdUm48et-gb565iCcut-n+4coHManX=XONN+STJLEY5zkA@mail.gmail.com>
Subject: Re: Patchwork summary for: linux-renesas-soc
To:     patchwork-bot+linux-renesas-soc@kernel.org
Cc:     linux-renesas-soc@vger.kernel.org, helpdesk <helpdesk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

CC helpdesk

On Mon, Oct 24, 2022 at 10:07 AM
<patchwork-bot+linux-renesas-soc@kernel.org> wrote:
>
> Hello:
>
> The following patches were marked "mainlined", because they were applied to
> geert/renesas-devel.git (master):
>
> Series: Rename DTB overlay source files
>   Submitter: Andrew Davis <afd@ti.com>
>   Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=687972
>   Lore link: https://lore.kernel.org/r/20221023182437.15263-1-afd@ti.com
>     Patches: [1/6] kbuild: Allow DTB overlays to built from .dtso named source files
>              [4/6] arm64: dts: freescale: Rename DTB overlay source files from .dts to .dtso
>              [5/6] arm64: dts: renesas: Rename DTB overlay source files from .dts to .dtso
>              [6/6] arm64: dts: xilinx: Rename DTB overlay source files from .dts to .dtso

Any idea how come the four patches above were marked mainlined?

I did not apply them, cfr.
https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git/log/

> Series: arm64: dts: renesas: r8a779g0: Add remaining (H)SCIF nodes
>   Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
>   Committer: Geert Uytterhoeven <geert+renesas@glider.be>
>   Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=687545
>   Lore link: https://lore.kernel.org/r/cover.1666361314.git.geert+renesas@glider.be
>     Patches: [v3,1/2] arm64: dts: renesas: r8a779g0: Add SCIF nodes
>              [v3,2/2] arm64: dts: renesas: r8a779g0: Add remaining HSCIF nodes

I did apply the two above.

Thanks!

> Total patches: 6
>
> --
> Deet-doot-dot, I am a bot.
> https://korg.docs.kernel.org/patchwork/pwbot.html

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
