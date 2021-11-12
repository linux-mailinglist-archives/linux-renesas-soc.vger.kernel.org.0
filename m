Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6DCA44E91E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Nov 2021 15:44:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235122AbhKLOq4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 12 Nov 2021 09:46:56 -0500
Received: from mail-ua1-f47.google.com ([209.85.222.47]:44937 "EHLO
        mail-ua1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231553AbhKLOqz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 Nov 2021 09:46:55 -0500
Received: by mail-ua1-f47.google.com with SMTP id p2so19214051uad.11;
        Fri, 12 Nov 2021 06:44:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GHvrmpyxF2faKEffFevVulgV+nzW+ekrpS6EN0E7lvM=;
        b=10yXJF47/CYKyICCHoVHzNmYCD0kqvWJf562Plst8Bg759lScGIBU9qRgpBDyMbHWI
         kdpXp09AxyRSHZM6NF2n9uCtC+XvTzqykXJR/+2GEL4PZ7qpLbphfVoE9MR4zhNNvu+k
         hvYXya8duxE+MzdaYhEz+iMnB+pmrfZtDEFZHoJQkMrIRWsZsXqqkrPe3EJctwjwCAUG
         LpweOzqfG2hhNZKdKGqHAmD+jzWrg/WzrCfpAccqcgkWHANlsKJ5XMF/eNpv1rLolzTu
         xbOu0jG3p10m+SmyquEzIDbc+g8J0ANn3bFBZ5BVb0oSkiRmpRVhobdzyMwTfvB1NHSN
         Vzxw==
X-Gm-Message-State: AOAM530Doy0qoVi/s2dZtIjWxMZNsNoEH0CZbzJ7Qym1ZU7pro1OnkCz
        8IRqqxaMND+oDl9AfHX/ZWuwleSKF/jNYg==
X-Google-Smtp-Source: ABdhPJzH2UtxYkhhENXoOWJkBSAc1+5wlvdpq3TgPsHwgwfxlZCz3beYPz14coBRZp6qO9JkzW10gA==
X-Received: by 2002:ab0:7399:: with SMTP id l25mr6982546uap.120.1636728244501;
        Fri, 12 Nov 2021 06:44:04 -0800 (PST)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id e13sm4080333vkd.21.2021.11.12.06.44.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Nov 2021 06:44:04 -0800 (PST)
Received: by mail-ua1-f54.google.com with SMTP id e10so19342554uab.3;
        Fri, 12 Nov 2021 06:44:04 -0800 (PST)
X-Received: by 2002:a05:6102:2910:: with SMTP id cz16mr10876143vsb.9.1636728243974;
 Fri, 12 Nov 2021 06:44:03 -0800 (PST)
MIME-Version: 1.0
References: <20211110082019.28554-1-biju.das.jz@bp.renesas.com> <20211110082019.28554-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20211110082019.28554-2-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 12 Nov 2021 15:43:53 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU+_1kHg+MidVuQ65UuXXD3HH0xg09D3A5-V+bbFU=RDg@mail.gmail.com>
Message-ID: <CAMuHMdU+_1kHg+MidVuQ65UuXXD3HH0xg09D3A5-V+bbFU=RDg@mail.gmail.com>
Subject: Re: [PATCH 2/2] clk: renesas: r9a07g044: Add OSTM clock and reset entries
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
> Add OSTM{0,1,2} clock and reset entries to CPG driver.
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
