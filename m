Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB6916294D3
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Nov 2022 10:52:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238211AbiKOJwM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 15 Nov 2022 04:52:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237829AbiKOJv7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Nov 2022 04:51:59 -0500
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF55FEE2A
        for <linux-renesas-soc@vger.kernel.org>; Tue, 15 Nov 2022 01:51:56 -0800 (PST)
Received: by mail-qt1-f173.google.com with SMTP id a27so8378851qtw.10
        for <linux-renesas-soc@vger.kernel.org>; Tue, 15 Nov 2022 01:51:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3ZyIT9v2CXnEL22VP8lT84dFO8Nk5idFAZIUTiFV+o8=;
        b=OaQl9cyX7I9NY53s/6d0u81+SoGEf1Os/OBVFGGAL5aXiiObVU3yUxd1cQyYecP/vL
         Qag3iiweGMR1fFArfWCwQMv8yzAa9PYlYc84p2pO7Au81+eLyc8k5mAb93VDqyytn73L
         umwg9O8QTbsdhDE0T3HaHIvsp0SJStcUZz3w8Sz/Dx6vtqTTfjVGJJfmj4OiPI3tFcKp
         sTp0SQvCikb1tePnpm9p7VL8j1L6OF8ZcuWkWx66NQgzdhyGDQqK/wPfRGdhlsq3mgqi
         SSuvFHKnBoX/ufJv/usBuFsqqbzpZSQ36YvO0APdFbmsL5jl1a6VQaTX1BHItb0ks2Kl
         XDig==
X-Gm-Message-State: ANoB5pniKE/APOH9aWF52rXR7p6Ly57mBIHdds3vET6dbZa7QG3XeOFZ
        9wooGJRggGHdCeW0A50Gk+IBvqyosWMycg==
X-Google-Smtp-Source: AA0mqf4qUlFva50PYx8tzPoegQiqCuFa+p/KtOhO5+KB1+hcVlpmcoKyXVu42NyTOXnBkZoB/hz7iA==
X-Received: by 2002:ac8:4542:0:b0:3a5:1ea9:711e with SMTP id z2-20020ac84542000000b003a51ea9711emr15285087qtn.280.1668505915794;
        Tue, 15 Nov 2022 01:51:55 -0800 (PST)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com. [209.85.219.169])
        by smtp.gmail.com with ESMTPSA id u14-20020a05620a430e00b006f9c2be0b4bsm7873396qko.135.2022.11.15.01.51.55
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Nov 2022 01:51:55 -0800 (PST)
Received: by mail-yb1-f169.google.com with SMTP id 7so16518189ybp.13
        for <linux-renesas-soc@vger.kernel.org>; Tue, 15 Nov 2022 01:51:55 -0800 (PST)
X-Received: by 2002:a25:ba4c:0:b0:6dc:dc81:aaf4 with SMTP id
 z12-20020a25ba4c000000b006dcdc81aaf4mr14646181ybj.365.1668505915330; Tue, 15
 Nov 2022 01:51:55 -0800 (PST)
MIME-Version: 1.0
References: <166850281738.23226.13783577826286959412.git-patchwork-summary@kernel.org>
In-Reply-To: <166850281738.23226.13783577826286959412.git-patchwork-summary@kernel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 15 Nov 2022 10:51:43 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXR7gnTNhSV5fX9rJ-WUjiP1OS8R2rSW3Du25_VE1t3dA@mail.gmail.com>
Message-ID: <CAMuHMdXR7gnTNhSV5fX9rJ-WUjiP1OS8R2rSW3Du25_VE1t3dA@mail.gmail.com>
Subject: Re: Patchwork summary for: linux-renesas-soc
To:     patchwork-bot+linux-renesas-soc@kernel.org
Cc:     linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Nov 15, 2022 at 10:07 AM
<patchwork-bot+linux-renesas-soc@kernel.org> wrote:
> The following patches were marked "mainlined", because they were applied to
> geert/renesas-devel.git (master):
>
> Series: Add Watchdog support for RZ/V2M EVK v2
>   Submitter: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
>   Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=691848
>   Lore link: https://lore.kernel.org/r/20221103223956.50575-1-fabrizio.castro.jz@renesas.com
>     Patches: [1/3] watchdog: rzg2l_wdt: Fix reboot for RZ/V2M
>              [2/3] arm64: dts: renesas: r9a09g011: Add watchdog node
>              [3/3] arm64: dts: renesas: v2mevk2: Enable watchdog
>
> Patch: arm64: dts: renesas: r9a09g011: Add L2 Cache node
>   Submitter: Biju Das <biju.das.jz@bp.renesas.com>
>   Committer: Geert Uytterhoeven <geert+renesas@glider.be>
>   Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=694147
>   Lore link: https://lore.kernel.org/r/20221110160931.101539-1-biju.das.jz@bp.renesas.com
>
>
> Total patches: 4

Incorrect: " [1/3] watchdog: rzg2l_wdt: Fix reboot for RZ/V2M" was not applied.

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
