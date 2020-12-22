Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06B782E07AD
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Dec 2020 10:04:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726123AbgLVJEG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 22 Dec 2020 04:04:06 -0500
Received: from mail-oi1-f171.google.com ([209.85.167.171]:42673 "EHLO
        mail-oi1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725870AbgLVJEF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Dec 2020 04:04:05 -0500
Received: by mail-oi1-f171.google.com with SMTP id l200so14061196oig.9;
        Tue, 22 Dec 2020 01:03:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IM9/dhD3GzWky8/GULGxs63avPzuEQHstit06zOVxXE=;
        b=JcrQ2XbctOOL8K2hGqM4BgvHPrZ1hURTYoKs++w6ZVVj0aVUAM+QK8+i4lXllVSlvC
         BZOte0dtVlindFNn2SzoASyBo/qYzRw95HaeizCpn5b6XJ/ZSH2eWKp3pjSjcdTUfh5M
         snL6u27hbaEo0VGHbppUuS/vqy1pVkfj/r95ZCvkwiPuKjCIJaD5AOYATkMGsBTzvsKk
         Cqm+kxEwJy7xfEPakre1+3sMJRIUlV0pX36WqmaX9VrxUapK8Oh4qsjNvR1w1pIWFLDp
         vlW3oCgTIt5VCbVZ0k5r7EdzpVr+SZ3jv88t9IfHddzfIf6q0Mah12o6JHJ2edt0L+FT
         FIAw==
X-Gm-Message-State: AOAM530+c9D5lVspNVBoJjEMiGLAKgi8Y/Wlnb+VpNgQO5su9sWyhSF1
        tWVSLyizH6HHwWiqF/IbdCVC2P/X6s/57lKmLBkBMnI1
X-Google-Smtp-Source: ABdhPJx5L6i7Nacz16E6/htfB9EgCyjmVGYB4K8oNEEI8OKyphaSspA06IuroIIxfFJDekxczCq7W0/xgEaJwHhLpSs=
X-Received: by 2002:aca:3cc5:: with SMTP id j188mr12391030oia.54.1608627804614;
 Tue, 22 Dec 2020 01:03:24 -0800 (PST)
MIME-Version: 1.0
References: <20201218173731.12839-1-wsa+renesas@sang-engineering.com> <20201218173731.12839-3-wsa+renesas@sang-engineering.com>
In-Reply-To: <20201218173731.12839-3-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 22 Dec 2020 10:03:13 +0100
Message-ID: <CAMuHMdUjghZYcMx+A6OB7q91ZzGJJdqJCw2E=dnZUXECzoj=Jg@mail.gmail.com>
Subject: Re: [PATCH 2/5] clk: renesas: r8a779a0: Add RWDT clocks
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Dec 18, 2020 at 6:37 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> And introduce critical clocks, too, because RWDT is one.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk-for-v5.12.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
