Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B2BF6663D4A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Jan 2023 10:52:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231502AbjAJJvq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 10 Jan 2023 04:51:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238352AbjAJJvm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 10 Jan 2023 04:51:42 -0500
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F1DD120A7
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Jan 2023 01:51:41 -0800 (PST)
Received: by mail-qt1-f174.google.com with SMTP id x7so348542qtv.13
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Jan 2023 01:51:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eigs0KIB6vZTz5dAhQwrrkvs/u8+bC5YUeIwqMOYTPA=;
        b=w2n+2kw1Yvxvibwp3fUX1W3hTOzjoTgwVlUUWrsrJ9UAH1n6cFcc30TqLnwF+pV81/
         Qq22E01QGVUwbU6by+jOCFODwETdRXPO3Qi+15tzXFThAXRO3U8h+/W+R/HLRgYp2i77
         caBw8DPXeE9KAxmeQkANuoBBTYI3dzlerAfIrq8hm3Mp3Bbx+0Hr4t3DeiNvmZVJE7s7
         8694c41KGQ/mazbnTurGHJ4l1vA4m/4GUNdINtX8j1rWKHf62kPwutmPG7pHU6qKTsWj
         3+2zsF7GUwjJbHXNRYBKg7/dRSl9+p6EibovFxgpRo2RLZRlcL/oZxnD8rUyY1Y1DVld
         vBCA==
X-Gm-Message-State: AFqh2kqzlwc5jW7L/G7OufFlmfV1aSg0zkqibxSklA/Ow+Pva29fVP8M
        cUXYTKcqyYdn87WU+O80tyrtILgRSzh3WQ==
X-Google-Smtp-Source: AMrXdXtqftKO310nzs9jJ4ZsAVVIRjB5m8+54vYI/ehfzCPw1TYhdJT0KSM6jwaS/gcpY7/9eJgKRQ==
X-Received: by 2002:a05:622a:418b:b0:3a8:2f65:6ccb with SMTP id cd11-20020a05622a418b00b003a82f656ccbmr82660275qtb.65.1673344299888;
        Tue, 10 Jan 2023 01:51:39 -0800 (PST)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com. [209.85.128.178])
        by smtp.gmail.com with ESMTPSA id x23-20020ac87ed7000000b0039467aadeb8sm5736035qtj.13.2023.01.10.01.51.39
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jan 2023 01:51:39 -0800 (PST)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-476e643d1d5so147504327b3.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Jan 2023 01:51:39 -0800 (PST)
X-Received: by 2002:a05:690c:313:b0:37e:6806:a5f9 with SMTP id
 bg19-20020a05690c031300b0037e6806a5f9mr2085182ywb.47.1673344299227; Tue, 10
 Jan 2023 01:51:39 -0800 (PST)
MIME-Version: 1.0
References: <167334301925.30821.9231161898233495130.git-patchwork-summary@kernel.org>
In-Reply-To: <167334301925.30821.9231161898233495130.git-patchwork-summary@kernel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 10 Jan 2023 10:51:26 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU1w1Th2Wf3RoNtwQWoJOcUsDY3SAmk0Vr+sNcsq-9jaQ@mail.gmail.com>
Message-ID: <CAMuHMdU1w1Th2Wf3RoNtwQWoJOcUsDY3SAmk0Vr+sNcsq-9jaQ@mail.gmail.com>
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

On Tue, Jan 10, 2023 at 10:33 AM
<patchwork-bot+linux-renesas-soc@kernel.org> wrote:
> The following patches were marked "mainlined", because they were applied to
> geert/renesas-devel.git (master):

> Series: SDHI/MMC SoC support for the RZ/V2M
>   Submitter: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
>   Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=704311
>   Lore link: https://lore.kernel.org/r/20221213230129.549968-1-fabrizio.castro.jz@renesas.com
>     Patches: [1/4] clk: renesas: r9a09g011: Add SDHI/eMMC clock and reset entries
>              [4/4] arm64: dts: renesas: r9a09g011: Add eMMC and SDHI support

This is not correct: [1/4] was not applied to geert/renesas-devel.git (master).
Its patchwork state is correct, though (manually marked accepted after
applying to renesas-drivers/renesas-clk).

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
