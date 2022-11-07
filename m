Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E58A61F878
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Nov 2022 17:09:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232200AbiKGQJi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 7 Nov 2022 11:09:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232211AbiKGQJX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Nov 2022 11:09:23 -0500
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59F2120190
        for <linux-renesas-soc@vger.kernel.org>; Mon,  7 Nov 2022 08:09:12 -0800 (PST)
Received: by mail-qv1-f44.google.com with SMTP id lf15so7959875qvb.9
        for <linux-renesas-soc@vger.kernel.org>; Mon, 07 Nov 2022 08:09:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NDZonkGfpSULEkFMdS4D4gVXUTz5GeH0eJq35MreFJE=;
        b=45+DqGfYSdI2PLlOHy/Y9Er5DCqapvKZRHo1lPa5tIWIuu7bUgCxr+IlPzadwcUDL2
         K4NzvZDr9LrEIvtY+RKeJS2IDzimRWSgUPHkqoALgiTW+1hpmoWXVcEwyEpW0RE+uWT/
         IA+6VhpxcGHzfFT49wbPUiTdNh94a8QxPruP2L+8D3rmp5TNpIdaop5N3JICz2vA1SHe
         5Abqp0R6S8a7JJg+CFax5kE2p/s8c3DC0K9A5SEzGNrymVywMTYW8jCNlKNKu/7gNgXo
         eYz35DLQ2dWzqaP5BqGEyRsKDaCY9skjSn+I5BVo6xJ2TPWRu27Ztn9w9hyEB3HeNQIV
         Xxug==
X-Gm-Message-State: ACrzQf0QvIhC9u+nl4jrwSMGhKeS7Mqu4D/ouCkw0gIwrmOl3lRXWIOK
        rjpJOYPEWhchQk3pHLxwIH80JJBcaCilMi7e
X-Google-Smtp-Source: AMsMyM7/h31TQJnUQzAmq7tLjmzpkDpiTPiJaTZXiHYz2r8n4nh1axeKiuSMhrKUMRu67RpxRtpUyg==
X-Received: by 2002:a0c:f00f:0:b0:4bb:6167:d338 with SMTP id z15-20020a0cf00f000000b004bb6167d338mr45583601qvk.11.1667837351322;
        Mon, 07 Nov 2022 08:09:11 -0800 (PST)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com. [209.85.128.169])
        by smtp.gmail.com with ESMTPSA id j129-20020a37b987000000b006cdd0939ffbsm6977207qkf.86.2022.11.07.08.09.10
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Nov 2022 08:09:10 -0800 (PST)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-36a4b86a0abso108809227b3.7
        for <linux-renesas-soc@vger.kernel.org>; Mon, 07 Nov 2022 08:09:10 -0800 (PST)
X-Received: by 2002:a0d:e301:0:b0:374:a8ba:99b0 with SMTP id
 m1-20020a0de301000000b00374a8ba99b0mr2600599ywe.358.1667837350206; Mon, 07
 Nov 2022 08:09:10 -0800 (PST)
MIME-Version: 1.0
References: <20221103143440.46449-1-wsa+renesas@sang-engineering.com> <20221103143440.46449-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20221103143440.46449-2-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 7 Nov 2022 17:08:58 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUdF3T3jG=cxTo0UyoKn2_B101xyUhDQu-9bL=CBP1mYA@mail.gmail.com>
Message-ID: <CAMuHMdUdF3T3jG=cxTo0UyoKn2_B101xyUhDQu-9bL=CBP1mYA@mail.gmail.com>
Subject: Re: [PATCH 1/4] clk: renesas: r8a779f0: Fix HSCIF parent clocks
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-renesas-soc@vger.kernel.org
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

On Thu, Nov 3, 2022 at 3:34 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> As serial communication requires a clean clock signal, the High Speed
> Serial Communication Interfaces with FIFO (HSCIF) is clocked by a clock
> that is not affected by Spread Spectrum or Fractional Multiplication.
>
> Hence change the parent clocks for the HSCIF modules from the S0D3_PER
> clock to the SASYNCPERD1 clock (which has the same clock rate), cfr.
> R-Car S4-8 Hardware User's Manual rev. 0.81.
>
> Fixes: 080bcd8d5997 ("clk: renesas: r8a779f0: Add HSCIF clocks")
> Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk-for-v6.2.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
