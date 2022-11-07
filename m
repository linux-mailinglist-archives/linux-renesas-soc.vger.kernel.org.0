Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3223C61F8A4
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Nov 2022 17:14:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231646AbiKGQOQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 7 Nov 2022 11:14:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232211AbiKGQOE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Nov 2022 11:14:04 -0500
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC37A263A
        for <linux-renesas-soc@vger.kernel.org>; Mon,  7 Nov 2022 08:14:03 -0800 (PST)
Received: by mail-qt1-f170.google.com with SMTP id e15so7142347qts.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 07 Nov 2022 08:14:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L6Vwlx9G4V3+tn5uQO2B0TpffMhPaXYGBatCBgpgwtU=;
        b=D3ZEWg2bTcNqnClhUaec7BolKIfhKCNpmJLz+afotx7I0jxIn1Y03nMjssDEI9T/mA
         7Fsumi2DfCGogn3msvHWvYPOuGHi0fkf1MON4OyaeYXfGu41O6CzKXJznZF6fl6VKVo5
         omW36b+qfqgAbGCMokThW1d+YNmp2TgNJbeEA00FWBhLTOZ6QU+3yO3uuUgIkrywc/yI
         ZIYqSpSa+doFyEIlUzIa3261AL4IygA5nkXVO6YN5JcjGqFErOQkPu6jTcXc5GYU1JT/
         sBXObHIJiJvUbQjqMcV0u0lnXMOkPK8OQw12YD4YO0U8gXhMDfLsSVxGys0Ic7xFT7Rv
         YJhA==
X-Gm-Message-State: ACrzQf1FKIY8be3XNywTvcvsVPTvj2KR/5jUW1Bqn9r1yCiZJLUo2hm/
        sedB0/zRkVp86mmfJeh7ZRLP7VznIoP+/A==
X-Google-Smtp-Source: AMsMyM5vV//bCRxlt8zJWAQ2W0bshKTMXatH5qIGQfpUt4dwiBasWYisyLO5wCeglmexyUgH+bxvDQ==
X-Received: by 2002:a05:622a:591:b0:39c:f3c8:117c with SMTP id c17-20020a05622a059100b0039cf3c8117cmr40008666qtb.270.1667837642665;
        Mon, 07 Nov 2022 08:14:02 -0800 (PST)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com. [209.85.219.172])
        by smtp.gmail.com with ESMTPSA id t19-20020a05620a451300b006ce2c3c48ebsm7283531qkp.77.2022.11.07.08.14.02
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Nov 2022 08:14:02 -0800 (PST)
Received: by mail-yb1-f172.google.com with SMTP id 129so14145314ybb.12
        for <linux-renesas-soc@vger.kernel.org>; Mon, 07 Nov 2022 08:14:02 -0800 (PST)
X-Received: by 2002:a25:6b07:0:b0:6cd:3a43:bfe5 with SMTP id
 g7-20020a256b07000000b006cd3a43bfe5mr37629660ybc.89.1667837642071; Mon, 07
 Nov 2022 08:14:02 -0800 (PST)
MIME-Version: 1.0
References: <20221103143440.46449-1-wsa+renesas@sang-engineering.com> <20221103143440.46449-5-wsa+renesas@sang-engineering.com>
In-Reply-To: <20221103143440.46449-5-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 7 Nov 2022 17:13:51 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUUNH4Og0PyKsowEScWiFB_DyzC4Kpv3H-KouXrA4pdbA@mail.gmail.com>
Message-ID: <CAMuHMdUUNH4Og0PyKsowEScWiFB_DyzC4Kpv3H-KouXrA4pdbA@mail.gmail.com>
Subject: Re: [PATCH 4/4] arm64: dts: renesas: r8a779f0: Fix SCIF "brg_int" clock
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Nov 3, 2022 at 3:34 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> As serial communication requires a clock signal, the Serial

clean clock

> Communication Interfaces with FIFO (SCIF) are clocked by a clock that
> is not affected by Spread Spectrum or Fractional Multiplication.
>
> Hence change the clock input for the SCIF Baud Rate Generator internal
> clock from the S0D3_PER clock to the SASYNCPERD1 clock (which has the
> same clock rate), cfr. R-Car S4-8 Hardware User's Manual rev. 0.81.
>
> Fixes: c62331e8222f ("arm64: dts: renesas: Add Renesas R8A779F0 SoC support")
> Fixes: 40753144256b ("arm64: dts: renesas: r8a779f0: Add SCIF nodes")
> Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.2, with the above fixed.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
