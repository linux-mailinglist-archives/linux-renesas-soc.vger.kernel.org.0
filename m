Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9ABF3AB675
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Jun 2021 16:48:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232097AbhFQOuu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 17 Jun 2021 10:50:50 -0400
Received: from mail-ua1-f51.google.com ([209.85.222.51]:40508 "EHLO
        mail-ua1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231759AbhFQOuu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Jun 2021 10:50:50 -0400
Received: by mail-ua1-f51.google.com with SMTP id r9so830473ual.7;
        Thu, 17 Jun 2021 07:48:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DLTXApXv60sqdh5K9ydoNzUe24XMsQP0xX4ggOlS8M4=;
        b=rXVEycDSLOwi+50quGoNBO2fCJuAFr3CkFCCGD795Cc5+Pb55893uAsDAp6A4OfQV6
         NduCVGPtKb5wr7y0eUIjmRFcXVJrjR57s20XoQzjCKWbz9ztuVnLKLCWw1VVhf4ibcmb
         Br43dedHoODk6I2RGrawXBYW8gQCeAP5sKj8rYKOcIuebesxLeGC+OVhKmnDC/8FHZBX
         gZpUfakoqCfAVbA2uUR12+o4/XD+zeXlYs3SMHlPGIxima4Km7zv29zWA+9sM95/HYNF
         pwplIRYkandUlJpEqNc98n7p10ZIDA5PkifIeg4yL+nwJZ+W8ZtCef8hOLL3JWxOLzCE
         aB7Q==
X-Gm-Message-State: AOAM531K2GiOckorPyS37ru+EOy8i4ryK41bHW3C6WUi3XANeJf37PLj
        pOBctkjtf5BXBDmSroFskuteoxPVk71MBiCz1/4=
X-Google-Smtp-Source: ABdhPJy+EUCoZIZHnb1pLH4PfGavFmnh2lM9r2zalq/xyPsKZhU9c98PXlA1TkXHaih4yvdy6NzxlwMBqTJs51DzL0s=
X-Received: by 2002:ab0:63d9:: with SMTP id i25mr5817183uap.106.1623941320943;
 Thu, 17 Jun 2021 07:48:40 -0700 (PDT)
MIME-Version: 1.0
References: <YMtYs7LVveYH4eRe@mwanda>
In-Reply-To: <YMtYs7LVveYH4eRe@mwanda>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 17 Jun 2021 16:48:28 +0200
Message-ID: <CAMuHMdVUGHpoRJ0na3cwxEBnWkNr1pN+tdWZ7XzzncPeNGqHZw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] clk: renesas: fix a double free on error
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Jun 17, 2021 at 4:14 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> The "pll_clk" and "clock" pointers are allocated with devm_kzalloc() so
> freeing them with kfree() will lead to a double free.  This would only
> happen if probe failed, and the system is not bootable.
>
> Fixes: ef3c613ccd68 ("clk: renesas: Add CPG core wrapper for RZ/G2L SoC")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> V2: Fix "pll_clk" as well.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v5.15.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
