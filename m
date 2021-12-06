Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 470DF469650
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Dec 2021 14:08:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243854AbhLFNLt (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 6 Dec 2021 08:11:49 -0500
Received: from mail-vk1-f174.google.com ([209.85.221.174]:41691 "EHLO
        mail-vk1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241808AbhLFNLs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Dec 2021 08:11:48 -0500
Received: by mail-vk1-f174.google.com with SMTP id 188so6724898vku.8;
        Mon, 06 Dec 2021 05:08:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=D1r6hfuTFD8/idc23ZEYSBtnOxYSTyn6Hk+edccYmCI=;
        b=0V4E4DmN3AI8NH5vdmf3FQL15P5ousmlWQhocpJX43kReSEHRLqrt5XKdMXEeBeu2r
         J3ajMLlnaR+35JNm+r6yJSDNmuccgp3HhPCUA7R88TGD86MdnQEfppGazgu5/CUSE5iF
         2TuBnGOmU7O5ZIzETvzOrcwp2PNV8jBi0FP0iuhYVQjQq7gjU8EbmZLePxb5iEVE/59j
         7erFmtJzLKGI05Z6oZ+DUkpZLFfyA8TGvLAm4LjFxS0mIOSvfxyTYGNWbWr2sE+1MtEG
         JzRZ5Y2NrY7RHDplBvAGI+JujksCOYow4rnn6NiIxlxXRuUgW8M6qjbjdUYDg96VqGbP
         dc0Q==
X-Gm-Message-State: AOAM533pB/xjbzzKjIFhY6J697Ma04dSQQ0YxFa0jmvs6I5Fu2a7b1ii
        iudhwc5FGX3rpVOtBT80F8exai4LU6P0yA==
X-Google-Smtp-Source: ABdhPJzguK79Oyx4AKJ603IilTKX73BcHNE1QBOpAkl7ggmdLTlyKLW0wCDCLYoUJcG4QgjzZRiqMg==
X-Received: by 2002:a1f:5f94:: with SMTP id t142mr41443102vkb.34.1638796099328;
        Mon, 06 Dec 2021 05:08:19 -0800 (PST)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id a128sm4134348vki.11.2021.12.06.05.08.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Dec 2021 05:08:18 -0800 (PST)
Received: by mail-ua1-f52.google.com with SMTP id r15so19389976uao.3;
        Mon, 06 Dec 2021 05:08:18 -0800 (PST)
X-Received: by 2002:a67:c106:: with SMTP id d6mr36282668vsj.77.1638796098448;
 Mon, 06 Dec 2021 05:08:18 -0800 (PST)
MIME-Version: 1.0
References: <20211203115154.31864-1-biju.das.jz@bp.renesas.com> <20211203115154.31864-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20211203115154.31864-2-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 6 Dec 2021 14:08:07 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWEG8dMKYBw2hZ2fdEqXgJHcpnqvLHtaNbXz77ZfD1tCg@mail.gmail.com>
Message-ID: <CAMuHMdWEG8dMKYBw2hZ2fdEqXgJHcpnqvLHtaNbXz77ZfD1tCg@mail.gmail.com>
Subject: Re: [PATCH 1/6] clk: renesas: r9a07g044: Rename CLK_PLL3_DIV4 macro
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Dec 3, 2021 at 12:52 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Rename the macro CLK_PLL3_DIV4->CLK_PLL3_DIV2_2 to match the clock tree
> mentioned in the hardware manual(Rev.1.00 Sep, 2021).
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk-for-v5.17.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
