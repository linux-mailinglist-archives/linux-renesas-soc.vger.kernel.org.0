Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4415C3039CB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 Jan 2021 11:06:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391761AbhAZKFs convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 26 Jan 2021 05:05:48 -0500
Received: from mail-ot1-f45.google.com ([209.85.210.45]:39094 "EHLO
        mail-ot1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390004AbhAZKFj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 26 Jan 2021 05:05:39 -0500
Received: by mail-ot1-f45.google.com with SMTP id i30so15676691ota.6;
        Tue, 26 Jan 2021 02:05:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=rF/1vmEFIVRHjc8AWuZDMv+It2bXb57sOL79ReSBh8A=;
        b=PV7HUAmdZMxB/Orc1r0hfREx0Dewzfq44/aVkssoQkc/CJw3+BuCObBQ4f/jaZJ/KT
         BLjMLSvehXfv0Zm1aMlzpfc6fqkf7txiKcW3HQp7Y1SZ50+OC0H0BV+DQHQ8n6LPl08U
         CU6ZD0cuPs7H+HySQAGzHds5pdCCOF39QXXyym+m+kVS7J7oj05tF/Vtb4HyqI4lg5Ac
         EIAxh8tNUr9PIyVdfOMbjN4B2VmlIpx84/w+wZyPTJd5HbsSvUqMO4qfN3fELLUbrkCP
         N01XfB/WUc1Odm/fpmbCA51qxFkV4zV4cMzc/s+2pAFK0Z9dyHxay97r9sVwafuJJrpX
         PR8Q==
X-Gm-Message-State: AOAM5332T9ETGyn+dJIsBIo28QoXUSjy65NSKgQ5K6UbBZIQj9OgWjYm
        OE5IIZOfGI8Z5pPQHvyjMCH6tulurkmwXGxfhstm9ZDI
X-Google-Smtp-Source: ABdhPJzoRECB4L8uCs8vp+zPXDTBi+GBtP4zmDVSAH9+pdMgnTKapYgjlRDr/HMP1hVrai5n4e0LYvGrLm4Da6OPk70=
X-Received: by 2002:a9d:c01:: with SMTP id 1mr3400993otr.107.1611655498614;
 Tue, 26 Jan 2021 02:04:58 -0800 (PST)
MIME-Version: 1.0
References: <20201228120147.59387-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20201228120147.59387-1-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 26 Jan 2021 11:04:47 +0100
Message-ID: <CAMuHMdWD-8YxdrTmaTW7YTOFj+8hHM5LvegnC274QOTOO_gXcg@mail.gmail.com>
Subject: Re: [PATCH] arm: smp: remove unused variable
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

On Mon, Dec 28, 2020 at 1:03 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Not used anymore after refactoring:
>
> arch/arm/kernel/smp.c: In function ‘show_ipi_list’:
> arch/arm/kernel/smp.c:543:16: warning: variable ‘irq’ set but not used [-Wunused-but-set-variable]
>   543 |   unsigned int irq;
>
> Fixes: 88c637748e31 ("ARM: smp: Use irq_desc_kstat_cpu() in show_ipi_list()")
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Marc Zyngier <maz@kernel.org>

Known issue since Dec 15, and still not fixed...

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
