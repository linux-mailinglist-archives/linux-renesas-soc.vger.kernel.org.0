Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC2C6368E18
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Apr 2021 09:47:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240881AbhDWHrn convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 23 Apr 2021 03:47:43 -0400
Received: from mail-vk1-f181.google.com ([209.85.221.181]:45583 "EHLO
        mail-vk1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230125AbhDWHrn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 23 Apr 2021 03:47:43 -0400
Received: by mail-vk1-f181.google.com with SMTP id u23so6302764vkl.12;
        Fri, 23 Apr 2021 00:47:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=DOftMGZ26u8aDShr9MM94hOHRtPJOC5C7SHCNKRrakg=;
        b=EPP8zelfYQyQwOsO8U6/D81jZacZRXaza9lIe/yZTNlzC4hYiIgyew8qfPn/7C5w3/
         7X7T1WGT4+C0cTgfHilrZuqsWqUmDh5+dj9A/N06PtKIVCLsaRhp9HCuuSmWILDbfBcL
         ldBHREs2P42AztFnf9FE7cxDzqsUT0V02hKnqLAYXy8iqhjJak2PUOLz1iyvVD7N9Qdh
         odYuUjrMP2o6kz1lvvYnaeiwQjs6veSFGlPSDaMxhLp1CBU8jhSHM/DV4AECJ+6LEb6M
         A7FEozEtpRMRsXIZmJLSz2hUc55AlRYrv14sCRI0UsVlGLSN9mE4O4bnXCQKtuvNZ0zS
         rSpw==
X-Gm-Message-State: AOAM531Nqeg2UQr6pUDtEBC+k9KrUNMJAZB5J2DKHl/fWPCcOURxSAsl
        8G7m3Hir53NHgEWnRgsI9phQL5fnGwkxVZyoC2Q=
X-Google-Smtp-Source: ABdhPJzQOXljPbDIPIMMTXxljP477uqkL8QHnn/bbME4AXbk3cJgQQWE7Q4Mor788MHzFPFkruj4RHwBPuEDEH4Wr2M=
X-Received: by 2002:a1f:2504:: with SMTP id l4mr1959677vkl.5.1619164026406;
 Fri, 23 Apr 2021 00:47:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210415073338.22287-1-dinghao.liu@zju.edu.cn>
In-Reply-To: <20210415073338.22287-1-dinghao.liu@zju.edu.cn>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 23 Apr 2021 09:46:55 +0200
Message-ID: <CAMuHMdVgtZkO3FfLOph41cXXJbSuc16UX1Z+fD0_iNN7nM-GtA@mail.gmail.com>
Subject: Re: [PATCH] [v3] clk: renesas: rcar-usb2-clock-sel: Fix error
 handling in rcar_usb2_clock_sel_probe
To:     Dinghao Liu <dinghao.liu@zju.edu.cn>
Cc:     Kangjie Lu <kjlu@umn.edu>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Dinghao,

On Thu, Apr 15, 2021 at 9:33 AM Dinghao Liu <dinghao.liu@zju.edu.cn> wrote:
> The error handling paths after pm_runtime_get_sync() has no
> refcount decrement, which leads to refcount leak.
>
> Signed-off-by: Dinghao Liu <dinghao.liu@zju.edu.cn>
> ---
>
> Changelog:
>
> v2: - Move the position of pm_runtime_enable,_get_sync().
>       Use devm_clk_register() to simplify error handling.

Thanks for the update!

> --- a/drivers/clk/renesas/rcar-usb2-clock-sel.c
> +++ b/drivers/clk/renesas/rcar-usb2-clock-sel.c
> @@ -131,7 +131,6 @@ static int rcar_usb2_clock_sel_remove(struct platform_device *pdev)
>         struct usb2_clock_sel_priv *priv = platform_get_drvdata(pdev);

    warning: unused variable ‘priv’ [-Wunused-variable]

Have you compiled this?

>
>         of_clk_del_provider(dev->of_node);
> -       clk_hw_unregister(&priv->hw);
>         pm_runtime_put(dev);
>         pm_runtime_disable(dev);
>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk-for-v5.14, with the above fixed.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
