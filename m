Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A032F44E930
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Nov 2021 15:49:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235144AbhKLOwH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 12 Nov 2021 09:52:07 -0500
Received: from mail-ua1-f50.google.com ([209.85.222.50]:41603 "EHLO
        mail-ua1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235124AbhKLOwH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 Nov 2021 09:52:07 -0500
Received: by mail-ua1-f50.google.com with SMTP id p37so17605015uae.8;
        Fri, 12 Nov 2021 06:49:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ph9WX+PC9wwTgY9FjYpuT8CokvHK7k/9y95jF3C8Dtw=;
        b=ldviGeQt1ugAXnR6SpEgfRiXCPspihrtpBJYBB9yMDom642gSI4eOPDuB4UtNSQnhC
         BnlQbCm3ui4iOVv9QEFn0vZLsrTS6C0xxvI//9K2XbQxQJQaQtAE8LssOjBzVKDizkwr
         ZkvE4pnn1vPS4QHsi3+FJVExMs+j3GrqT22vxfYQAxqFt0/wPQFpLyFuIisyrvVDaOwj
         x8mS4eXo1w/1kPsOzBI0KJKpSNfarWR3ny2KoJ8Y+749e9bu4SkInXAswF75iHauE3OP
         TdTREFCWRyNdzM91+JvbMg0idUKsoJ1Qp/xaKxFuIgcRgBVb1wNf7rHxEiWMN/N3CkSA
         ZcZw==
X-Gm-Message-State: AOAM532XVZ5Fdc97t0F95mYD3QI7IbV6YH4GT5mhi2pfh5IsohiT7MY9
        25g0vH2p5FFYgyDkEE+Y6NlAfa0Wh9wqtQ==
X-Google-Smtp-Source: ABdhPJyscCgmJrxdotsPiJ4tCsBoaiO0McxvhkwpmH+dFiuri+fPsKuqJ6XW/pTnVPz/vUhHvbAq7g==
X-Received: by 2002:ab0:5a23:: with SMTP id l32mr23371059uad.129.1636728555806;
        Fri, 12 Nov 2021 06:49:15 -0800 (PST)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id l24sm4052909vkk.37.2021.11.12.06.49.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Nov 2021 06:49:15 -0800 (PST)
Received: by mail-ua1-f46.google.com with SMTP id p2so19246239uad.11;
        Fri, 12 Nov 2021 06:49:15 -0800 (PST)
X-Received: by 2002:a9f:2c98:: with SMTP id w24mr23034111uaj.89.1636728555102;
 Fri, 12 Nov 2021 06:49:15 -0800 (PST)
MIME-Version: 1.0
References: <20211110082019.28554-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20211110082019.28554-1-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 12 Nov 2021 15:49:04 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXdy7rfxJrZw5Ug10cAj1ekDxc_UfwVoaKdExRsSiN59g@mail.gmail.com>
Message-ID: <CAMuHMdXdy7rfxJrZw5Ug10cAj1ekDxc_UfwVoaKdExRsSiN59g@mail.gmail.com>
Subject: Re: [PATCH 1/2] clk: renesas: r9a07g044: Rename CLK_PLL2_DIV16 and
 CLK_PLL2_DIV20 macros
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

On Wed, Nov 10, 2021 at 9:20 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Rename the macros CLK_PLL2_DIV16->CLK_PLL2_DIV2_8 and
> CLK_PLL2_DIV20->CLK_PLL2_DIV2_10 to match the clock tree mentioned in
> the hardware manual(Rev.1.00 Sep, 2021).
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
