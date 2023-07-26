Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 01FFB763B24
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Jul 2023 17:33:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232877AbjGZPdf convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 26 Jul 2023 11:33:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232070AbjGZPde (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 26 Jul 2023 11:33:34 -0400
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85A13B5
        for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Jul 2023 08:33:33 -0700 (PDT)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-58459a6f42cso3774647b3.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Jul 2023 08:33:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690385612; x=1690990412;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=864KlZuVNhY4IWbx2nOwFCnUy4i8hk+CNWFAyZIErTw=;
        b=CGX2hgq96UQNCbm+Mq+GYfNkmGmec+rqL7/Syr27HMEAGIa3+DjN23yCRnqBcHI53O
         wcfM2Bm0oulr0sxR/fe1Y6JvJP18iFhnyaoeKxHqUoOJzcEN2LnMK6hDZChCn4XBBY2G
         L0oTDoUaiI1oWHUOJhzICHcSJMJJqBCX8nBO0zwnQTKDD8eyqZUf7S+WX81Ryz4HaWKR
         gP/dINXpWSWv5UIvleMqNfCG8WMh9m13uGTyowXYony8oLqgG+3nG+ut7p22Dc12KbmP
         sIXgproUEq+DsYy1s0fCZiV/Z0O7LfnrKP3bmKaC+3ZMM6A1GzzDAakYmmAVyJLP3OEr
         x43Q==
X-Gm-Message-State: ABy/qLY99+ZMN+7tJZ1CgjbrmykoxhAnA1TTySf/KOYZ7EMznl5+wd8s
        vtFCeSIiqiaptsUyiv9OUkIytH+R4Rz3ag==
X-Google-Smtp-Source: APBJJlGFaz+AVrBHCXeXZmRv1XczDkBwPG2zyIxQ0Q/avqE2ymh+v0VEwUatHBz5kQycszfycCZ1gg==
X-Received: by 2002:a0d:d808:0:b0:57a:8736:a836 with SMTP id a8-20020a0dd808000000b0057a8736a836mr2322648ywe.31.1690385612537;
        Wed, 26 Jul 2023 08:33:32 -0700 (PDT)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com. [209.85.219.182])
        by smtp.gmail.com with ESMTPSA id w189-20020a8162c6000000b00582fae92aa7sm4231700ywb.93.2023.07.26.08.33.31
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jul 2023 08:33:31 -0700 (PDT)
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-d0548cf861aso5857181276.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Jul 2023 08:33:31 -0700 (PDT)
X-Received: by 2002:a25:e68d:0:b0:d0d:9040:f704 with SMTP id
 d135-20020a25e68d000000b00d0d9040f704mr2005821ybh.1.1690385610948; Wed, 26
 Jul 2023 08:33:30 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1690382328.git.geert+renesas@glider.be> <d6ccbb7b7a73eb35f1e1a8d85adcf9f1f980b2c1.1690382328.git.geert+renesas@glider.be>
In-Reply-To: <d6ccbb7b7a73eb35f1e1a8d85adcf9f1f980b2c1.1690382328.git.geert+renesas@glider.be>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 26 Jul 2023 17:33:18 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXR9o4-oibeGy1XAVsqouZNV_uXgynUFyNPOKRix=hZag@mail.gmail.com>
Message-ID: <CAMuHMdXR9o4-oibeGy1XAVsqouZNV_uXgynUFyNPOKRix=hZag@mail.gmail.com>
Subject: Re: [PATCH/RFT 3/3] arm64: dts: renesas: spider: Add keyboard to test IRQ[0145]
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Jul 26, 2023 at 4:44 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> Add an interrupt-controlled keyboard to test operation of the Interrupt
> Controller for External Devices (INTC-EX) on the Spider development
> board.
>
> Test procedure:
>   - Run "evtest" (select device event number "0"),
>   - Pull one of the following signals on the Spider Breakout Board low
>     to trigger the corresponding interrupt and keypress (key release is
>     automatic):
>       - Test point CP18 -> IRQ0 (KEY_0),
>       - Test point CP17 -> IRQ1 (KEY_1),
>       - CN37 pin 4 -> IRQ4 (KEY_4),
>       - CN37 pin 2 -> IRQ5 (KEY_5).
>
> GND is available on e.g. pin 8 of CN37 (MSIOF0 PIN HEADER).
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Not intended for upstream merge.
>
> I do not have physical access to a Spider development board.
> Thanks for testing!

Kieran and I held a remote test session over IRC and Jitsi, and
IRQ4 and IRQ5 are confirmed working.
We couldn't locate test points CP17 and CP18, though.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
