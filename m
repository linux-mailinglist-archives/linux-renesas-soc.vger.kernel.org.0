Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBE3A2EF2CA
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Jan 2021 14:01:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727584AbhAHNA0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 8 Jan 2021 08:00:26 -0500
Received: from mail-ot1-f52.google.com ([209.85.210.52]:37766 "EHLO
        mail-ot1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727226AbhAHNAZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 8 Jan 2021 08:00:25 -0500
Received: by mail-ot1-f52.google.com with SMTP id o11so9575991ote.4;
        Fri, 08 Jan 2021 05:00:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UU74Cn0/Xi0UY8mJY9QQZ0sYhgcykeAtPrL5gGmy/64=;
        b=B8C/pmFuKdDic47EJD56aWGJqPhLD0Jhz4NC+DIZJaN2BO7/7LVceIS27cbGySzm0X
         Th3D5Rvgqqr+63V33D3ZHPrrvq+PfuL36MOZAQGDa8w3/bkpUE4ae5aWK2xmZsZDu5i2
         yy0VKBtnBrEi14+VgcAF/gMllIWYXVCi9EP5xdNoCIZnF55zTUl7M3e3OLH1yoID5lu+
         8Mp1NcWd1AANYf4l/uDa5OWbQjTt/FO6iaYi4df+Jl3JW84wkikttkyLP+gJ4JW2bdZJ
         dRoLBpfAi1cT1ApQoNOqHLg6mL1C9ClfJtLEjjGKJbN6kJc+RbCg7HAPqFgn5ARyFvwq
         34mA==
X-Gm-Message-State: AOAM531Du39WzXecSOE3N0LpAAWXuaN8iS5QUqCGzuo+vmpyorVm1RNB
        49S2xHC2qqjzN1d0Htfp0d5QEJvw5Hht3GrPWKFr/9Hx
X-Google-Smtp-Source: ABdhPJwlqXMY9WTzamy00U9ixLLVKTAcn93ejhXn3fhlacNo6t3JxmUv7YpdG56Xy9C3uD3oKULdnSj4cANrFWXsgNk=
X-Received: by 2002:a05:6830:210a:: with SMTP id i10mr2449693otc.145.1610110784743;
 Fri, 08 Jan 2021 04:59:44 -0800 (PST)
MIME-Version: 1.0
References: <20201227174202.40834-1-wsa+renesas@sang-engineering.com> <20201227174202.40834-3-wsa+renesas@sang-engineering.com>
In-Reply-To: <20201227174202.40834-3-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 8 Jan 2021 13:59:33 +0100
Message-ID: <CAMuHMdX-_p7SKmuujtf0py76cPY3SC_SNAApd=L8sPdcrsFXUw@mail.gmail.com>
Subject: Re: [PATCH 2/6] clk: renesas: rcar-gen3: remove cpg_quirks access
 when registering SD clock
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

On Sun, Dec 27, 2020 at 6:42 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> We want to reuse SD clock handling for other SoCs and, thus, need to
> generalize it. So, don't access cpg_quirks in that realm.
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
