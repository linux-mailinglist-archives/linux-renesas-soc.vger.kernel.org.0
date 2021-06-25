Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18DB93B4667
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Jun 2021 17:12:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229741AbhFYPPF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 25 Jun 2021 11:15:05 -0400
Received: from mail-ua1-f49.google.com ([209.85.222.49]:43620 "EHLO
        mail-ua1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229445AbhFYPPF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 25 Jun 2021 11:15:05 -0400
Received: by mail-ua1-f49.google.com with SMTP id f1so3670966uaj.10;
        Fri, 25 Jun 2021 08:12:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jb52y/jRuefHz0+oSTJ2Jwp8OVTxytJKD9D+gi1Z+6c=;
        b=srQsqUTyzSMlZfSiTqEsMSq/UuAfVyxHeJ6ts5r++snCe5x6yJLlE0cXi1q93viTWY
         WeVwTyNwScF13+BWlvYpUZ9onZdn7wOItwliSyszey7WSNKKrauMpQEwliaFN8VFewWP
         jVVxpjrPe3kRrvmbbrwmkPkzlUMVC85LreT4v/skMC3s6xY1zs56Bw5KnuRE+flMRUAd
         +rS6nOq9pGZ+3uMojjv7CyyX+M/+0qgX3pRvbHypTzc5XXVkj0KNu3TctO47w/LH9Kfe
         S+LU324FTFNz8QAr8Dc1GjnNCNTLxwZtIkl+glOQxZAcNQRQZ9R9ZWseMAyUMRGNr7fK
         6Esg==
X-Gm-Message-State: AOAM533rTB8qZjjZ9BKpa1SUVPUhwN35nSIOtBKdIBgTyQAY35zP19Oe
        Zu2togusvjsehog3ZRA44kz638W7av6lseLZsnqveJPxH80=
X-Google-Smtp-Source: ABdhPJykYdGUl3uiWzo/tA7jcUhLrKv0LFcWJPQ9Eo3ErWGL1Hs1iZCZoAFfJTWIzjzclLX4J02xqqGXDuR4p6mHrUE=
X-Received: by 2002:ab0:1e4c:: with SMTP id n12mr11907922uak.58.1624633963114;
 Fri, 25 Jun 2021 08:12:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210624130240.17468-1-biju.das.jz@bp.renesas.com> <20210624130240.17468-11-biju.das.jz@bp.renesas.com>
In-Reply-To: <20210624130240.17468-11-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 25 Jun 2021 17:12:31 +0200
Message-ID: <CAMuHMdUnvPbMoU-ECuFksO0MJC0atJtunmr-dF+XBx9HAu1k0Q@mail.gmail.com>
Subject: Re: [PATCH v2 10/11] drivers: clk: renesas: r9a07g044-cpg: Add DMAC clocks/resets
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

On Thu, Jun 24, 2021 at 3:03 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add DMAC clock and reset entries in CPG driver.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v1->v2:
>  * Updated reset entries

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
