Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A458461F8A2
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Nov 2022 17:13:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232258AbiKGQNq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 7 Nov 2022 11:13:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231682AbiKGQN3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Nov 2022 11:13:29 -0500
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDD346433
        for <linux-renesas-soc@vger.kernel.org>; Mon,  7 Nov 2022 08:13:27 -0800 (PST)
Received: by mail-qt1-f182.google.com with SMTP id h24so7131686qta.7
        for <linux-renesas-soc@vger.kernel.org>; Mon, 07 Nov 2022 08:13:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9GtmRAzjcP+reqRSVCyT5MoncSAz28sgsxTGskON2NI=;
        b=LF8HcO4yBSYoqbXcgEx+TiFCPuPmvYSnB5+Ygl8i+61ILF4xnzIKj3hgQzLxLy3db3
         1qISGc6zkFIlfzVXJPF7o9ywsDIGypj0cVguVdNzFY6hyOk97pu9CaVwUeXY+OQfl24h
         kBSoqUcV/bjz6lzLqld+6yk0+oeLpotr+Y1xp9BCVyNTVxTuDImZrv+OD6kzeYFnF8SI
         9w9qqa0feRxymvDT1yG/LqZOZIEpInEwh9LLnH8Z+eozJ5Fa1NQ6oiOW7wj1s0dH8q5b
         IwBz1RFvDSjSy42Saf2D49ZddAJstKw7YXM57aH/hPcuU/eQfuaXxl8ec+NSxN7YyEOu
         o7/Q==
X-Gm-Message-State: ACrzQf1SSUUO5nob3d4IQd2jFj2k99QdWjgy86xBKFN9I28qLMZ5ObhA
        wgDoXw6ubacWUEkHIEyc6xSDDlF/WJE5Bw==
X-Google-Smtp-Source: AMsMyM4y3m3Y4+KaL6x+5pSx473PQSSI089VFSbXYhtka54VOjUBMcLSobIMzHiGjpxIBJ2THL7jBA==
X-Received: by 2002:a05:622a:1e18:b0:3a5:5bc0:85be with SMTP id br24-20020a05622a1e1800b003a55bc085bemr16410293qtb.201.1667837606853;
        Mon, 07 Nov 2022 08:13:26 -0800 (PST)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com. [209.85.128.174])
        by smtp.gmail.com with ESMTPSA id m13-20020a05620a290d00b006fa43e139b5sm7279714qkp.59.2022.11.07.08.13.26
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Nov 2022 08:13:26 -0800 (PST)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-369426664f9so108672557b3.12
        for <linux-renesas-soc@vger.kernel.org>; Mon, 07 Nov 2022 08:13:26 -0800 (PST)
X-Received: by 2002:a0d:e301:0:b0:374:a8ba:99b0 with SMTP id
 m1-20020a0de301000000b00374a8ba99b0mr2621211ywe.358.1667837606346; Mon, 07
 Nov 2022 08:13:26 -0800 (PST)
MIME-Version: 1.0
References: <20221103143440.46449-1-wsa+renesas@sang-engineering.com> <20221103143440.46449-4-wsa+renesas@sang-engineering.com>
In-Reply-To: <20221103143440.46449-4-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 7 Nov 2022 17:13:15 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWjGbP0zQ6ZzZZ4noNWrK7CrHR+W0GjcaApCAHbgELCvQ@mail.gmail.com>
Message-ID: <CAMuHMdWjGbP0zQ6ZzZZ4noNWrK7CrHR+W0GjcaApCAHbgELCvQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] arm64: dts: renesas: r8a779f0: Fix HSCIF "brg_int" clock
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
> As serial communication requires a clock signal, the High Speed Serial

I see the missing "clean" introduced by me is propagating ;-)

> Communication Interfaces with FIFO (HSCIF) are clocked by a clock that
> is not affected by Spread Spectrum or Fractional Multiplication.
>
> Hence change the clock input for the HSCIF Baud Rate Generator internal
> clock from the S0D3_PER clock to the SASYNCPERD1 clock (which has the
> same clock rate), cfr. R-Car S4-8 Hardware User's Manual rev. 0.81.
>
> Fixes: 01a787f78bfd ("arm64: dts: renesas: r8a779f0: Add HSCIF nodes")
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
