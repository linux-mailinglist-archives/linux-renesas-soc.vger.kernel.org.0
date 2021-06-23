Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D9133B19B5
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Jun 2021 14:18:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230273AbhFWMUc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 23 Jun 2021 08:20:32 -0400
Received: from mail-vk1-f169.google.com ([209.85.221.169]:43554 "EHLO
        mail-vk1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230019AbhFWMUc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Jun 2021 08:20:32 -0400
Received: by mail-vk1-f169.google.com with SMTP id k16so452180vke.10;
        Wed, 23 Jun 2021 05:18:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wXULYjUZF6p9ZIURHFCn4NITYUcSU904Yw5wnHedq3U=;
        b=WzGrlzq2cZ51T0ZvBA81AlSt99rhIXBHXYY+GmgsILNNGR8idusAMB3hMYfaL6tHAC
         FCQDjZ9NzkXifycN9AWaXo1OeDS37QeVr4JYe/zFePnM6PL7N0gP2OoyVAgcNPEfRRhE
         cSFRKnPwnBoFS7gkAJY2KEgrjUlAcrVfP2vu9FuBW4354nXVAluOufnIdfVZxfKcRYA8
         UDPPhOR4qUAn5h7cf+e9bmhcgUNqe3NKfMUPlDQ0GZAt3aHFsxsMNtwGFaO6s5aSZ7KE
         5WIpV+PbwlZydXRbdFA8ZLDS+vQ1wzKjjUivdYJdSDGyKP3fj9MMCJnQElG+v9LGtZvg
         TFNA==
X-Gm-Message-State: AOAM533Sza/igfIToL2UeISpMQKGCN5CKyQ3lpWGfSu2VJNqLDbH1qDB
        TMdJJP85pTnTWsLVTK+PA68SORUJzlL6UwKTZtq9JvL1qzM=
X-Google-Smtp-Source: ABdhPJxRg3bxOvg9QQ/x0Q+bhG+Fby0rbQQW04F53GilS6+5ZTPbnbnOhueI4IrAGn5okTNGZbKvkDQdGIRe+QBu8mk=
X-Received: by 2002:a1f:9505:: with SMTP id x5mr23372914vkd.6.1624450694541;
 Wed, 23 Jun 2021 05:18:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210622232711.3219697-1-kieran.bingham@ideasonboard.com> <20210622232711.3219697-2-kieran.bingham@ideasonboard.com>
In-Reply-To: <20210622232711.3219697-2-kieran.bingham@ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 23 Jun 2021 14:18:03 +0200
Message-ID: <CAMuHMdVVN2zO-VFRUGpLrL5a685oxyMZEumrWaZsD6ZbDQawUQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] clk: renesas: r8a779a0: Add the DU clock
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Kieran,

On Wed, Jun 23, 2021 at 1:27 AM Kieran Bingham
<kieran.bingham@ideasonboard.com> wrote:
> The DU clock is added to the S3D1 clock parent. The Renesas BSP lists
> S2D1 as the clock parent, however there is no S2 clock on this platform.
>
> S3D1 is chosen as a best effort guess and demonstrates functionality but
> is not guaranteed to be correct.

Makes sense.

> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk-for-v5.15.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
