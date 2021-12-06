Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8113A469654
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Dec 2021 14:08:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243858AbhLFNMT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 6 Dec 2021 08:12:19 -0500
Received: from mail-ua1-f45.google.com ([209.85.222.45]:41778 "EHLO
        mail-ua1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241808AbhLFNMT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Dec 2021 08:12:19 -0500
Received: by mail-ua1-f45.google.com with SMTP id p37so19329893uae.8;
        Mon, 06 Dec 2021 05:08:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=loXQvP2YzIyqcDaAKgORVi34ZXI76y5GJIRMETH4MMI=;
        b=ufxP4LXIazuEatKB2XjlvtPqjZSbyXshDCyeirKu52eA+eT+dTwEpLLYjCQ2FZRndW
         fnKE8ktKtFulK6+gTo6XGvxRFVzgv8doUva4v17hx5wmWsxyBxyo2wvUC7HUIcGD55c+
         dyL1zY7MO0HLtLQSCRdwD80hdMlkLJh5Vw4eGXmf7RGc+8ESnXM1rX7ton5QpDXIj75J
         maGUT8ShCde/GP/JLSjYWY7EMeQmQgXQwIYN0/kvoILsW0/zYy/zfYUMwA6psKKz26I6
         GqUJGGafvO50OMwqkF96ZsTZbLZC7pjuwU2z065J7AcMVu3QoRa/BbusgqYac4YBDQj+
         63aA==
X-Gm-Message-State: AOAM532bNMjp9m3w4b4PEYh8XU6fSLB0x4ohBROxLZ4IgLzgZG5gHjTT
        iPVyfGBAilAolWYJkP+OiKDPwtVXEw7Eqw==
X-Google-Smtp-Source: ABdhPJy1H8Bq0SfCPoYzBQ1VGC56CKkHBtB778+9FNRuJY7cCE3nrR+G50+JYJJGXBkrK/MXJTf7MA==
X-Received: by 2002:a05:6102:3ec9:: with SMTP id n9mr34289008vsv.22.1638796130085;
        Mon, 06 Dec 2021 05:08:50 -0800 (PST)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id bk3sm4109498vkb.33.2021.12.06.05.08.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Dec 2021 05:08:49 -0800 (PST)
Received: by mail-ua1-f41.google.com with SMTP id r15so19393716uao.3;
        Mon, 06 Dec 2021 05:08:49 -0800 (PST)
X-Received: by 2002:a9f:248b:: with SMTP id 11mr40046553uar.14.1638796129620;
 Mon, 06 Dec 2021 05:08:49 -0800 (PST)
MIME-Version: 1.0
References: <20211203115154.31864-1-biju.das.jz@bp.renesas.com> <20211203115154.31864-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20211203115154.31864-3-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 6 Dec 2021 14:08:38 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVeJP+QanfPGENJ4aYftq1jU91b_qxAEiiKVQXXscyPnA@mail.gmail.com>
Message-ID: <CAMuHMdVeJP+QanfPGENJ4aYftq1jU91b_qxAEiiKVQXXscyPnA@mail.gmail.com>
Subject: Re: [PATCH 2/6] clk: renesas: r9a07g044: Add mux and divider for G clock
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Dec 3, 2021 at 12:52 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> G clock is sourced from PLL3 and PLL6. The output of the mux is
> connected to divider.
>
> This patch adds a mux and divider for getting different rates from
> this clock sources.
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
