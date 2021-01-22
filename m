Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C89830008C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 Jan 2021 11:45:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727006AbhAVKZW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 22 Jan 2021 05:25:22 -0500
Received: from mail-qk1-f171.google.com ([209.85.222.171]:38995 "EHLO
        mail-qk1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727772AbhAVKRt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 22 Jan 2021 05:17:49 -0500
Received: by mail-qk1-f171.google.com with SMTP id k193so4566306qke.6;
        Fri, 22 Jan 2021 02:17:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7zsc6xzux0GCBLlL4UKSB6x9FSfXUZHxkP/Pv0eueKY=;
        b=TKJjxvAyHCRiIepZ9/Fm33mMUpRAon8BdsdBwhO3XS4BytBNJPhSpNBKSfIBhmsAZx
         5GyVEAJ3ydur7qW6X2NwWXA+7dvz9mv+81FVUC3qU2fb1c3WEwAhXE9Vm0o7t9O5PWSN
         Sxhr2KUImS72dox09Puzmr24yKhmyPpnts6Px+373aFNW2lrwDx/8sZL7eprhD5JONH4
         xfcOArBvloE349G5anQLCZbux6LsZLBcxeJ56RTy7nopZWSCqP5lqIcyeDaq3MLX4QIK
         DyZrXpHTmo5WcmM9DduvmKsddlkmsfrNXz4lhVSGi+Shf+Zt9LannuGFuQ1il199PbA8
         80Lw==
X-Gm-Message-State: AOAM530Ib84Vlh4cUv3CFSgdxUomdXRY9DRXQaiMXL261+aHIULrRWoJ
        oPvWTOtmTgvggMEzyt7PjFUvKdAuf8Z78K9v5OM=
X-Google-Smtp-Source: ABdhPJyEtoIqIYr9dpcGXfp0DGUeqfGn7izIr0qNDH8dstFOi1qUddx7S8ySQ4XEN/zPxFI0wMe6UiaxAZnLHgMl2w0=
X-Received: by 2002:a05:620a:11ad:: with SMTP id c13mr4011390qkk.134.1611310627579;
 Fri, 22 Jan 2021 02:17:07 -0800 (PST)
MIME-Version: 1.0
References: <20210121100619.5653-1-wsa+renesas@sang-engineering.com> <20210121100619.5653-3-wsa+renesas@sang-engineering.com>
In-Reply-To: <20210121100619.5653-3-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 22 Jan 2021 11:16:55 +0100
Message-ID: <CAMuHMdXbnMENy3czKL-+Dgp4M24D3A_HvaiUAasdENvKupRQfg@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] clk: renesas: r8a779a0: add clocks for RAVB
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

On Thu, Jan 21, 2021 at 11:06 AM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>
> Change since v1:
> * use S3D2 as parent clock

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk-for-v5.12.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
