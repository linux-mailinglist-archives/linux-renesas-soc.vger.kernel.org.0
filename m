Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E534C4A590F
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Feb 2022 10:19:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235899AbiBAJT0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 1 Feb 2022 04:19:26 -0500
Received: from mail-ua1-f45.google.com ([209.85.222.45]:33355 "EHLO
        mail-ua1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232795AbiBAJTZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 1 Feb 2022 04:19:25 -0500
Received: by mail-ua1-f45.google.com with SMTP id r8so429516uaj.0;
        Tue, 01 Feb 2022 01:19:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AAj/SCAqug0uHxi3aj3zWdBdV6BKFubOWZxEj9a715U=;
        b=706oNn889ZJzUFXs/l55PsoFMdignJhGts/ueCP2ne4vwgFMSpaphqqKiCZ4G4s+lo
         FBcXN4QYFpHBuTVB0drOu3xUD5CVQd3rBM4qHC8VNrxfVZjcL8HUd9cMeaR2LsvlPQw3
         UImVuisp1vdykkfPSgXx8hmMZEOvFhPCYE5r7+Qx0L8qQEppjgpYlkjTz8ozPcmWFmrT
         xjr6jfyBW6TpnLVkYsHCI3uvciJl/LMvvVzJpJLAvKStE9jJwpHxjK01UA1xLAnMHY1u
         B8v/O7RzyF7m664RYyE+4J5LRPuTZljOgxRsIuZe2KucddPbXgNwEqNUkH0MQvlK5jFE
         1j/g==
X-Gm-Message-State: AOAM532XyTbZ5OUMFhsm/tKhvPualUXJ6ulbl35k/VpHW+0TBhSucCl2
        TsljUDAogjOwy28z74iwQfctzEB8YvCkkw==
X-Google-Smtp-Source: ABdhPJx+KgP//6Bxk41XwkZ7cgKsu4aZVlKAwTCw8B4VNa143O2jdD9Uyp4LAfOl2dNJAjMwQBaToA==
X-Received: by 2002:ab0:2411:: with SMTP id f17mr4827083uan.125.1643707164942;
        Tue, 01 Feb 2022 01:19:24 -0800 (PST)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id q68sm4024040vsa.30.2022.02.01.01.19.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Feb 2022 01:19:24 -0800 (PST)
Received: by mail-vs1-f51.google.com with SMTP id g23so15226717vsf.7;
        Tue, 01 Feb 2022 01:19:24 -0800 (PST)
X-Received: by 2002:a67:a401:: with SMTP id n1mr8881586vse.38.1643707163968;
 Tue, 01 Feb 2022 01:19:23 -0800 (PST)
MIME-Version: 1.0
References: <20220112174612.10773-1-biju.das.jz@bp.renesas.com> <20220112174612.10773-9-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220112174612.10773-9-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 1 Feb 2022 10:19:12 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU0L1tsyV80PF8jQb1DdcUk8c1LA-87sskqieeWS7Yk8A@mail.gmail.com>
Message-ID: <CAMuHMdU0L1tsyV80PF8jQb1DdcUk8c1LA-87sskqieeWS7Yk8A@mail.gmail.com>
Subject: Re: [RFC 08/28] clk: renesas: r9a07g044: Add LCDC clock and reset entries
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

On Wed, Jan 12, 2022 at 6:46 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add LCDC clock and reset entries to CPG driver.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
