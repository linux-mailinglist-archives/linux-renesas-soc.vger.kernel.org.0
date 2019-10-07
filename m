Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5C443CE0C7
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Oct 2019 13:45:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727675AbfJGLpr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 7 Oct 2019 07:45:47 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:37826 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727395AbfJGLpr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Oct 2019 07:45:47 -0400
Received: by mail-ot1-f67.google.com with SMTP id k32so10654201otc.4;
        Mon, 07 Oct 2019 04:45:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uytjcaMHwFJ7fFDd0XQ/DbQV+FftN6aCoZfpIyy/aWk=;
        b=CjbS/APC1yk6mnaoAShbbQv58RJvbxk8WZrD4YRw0inpa70Kmm1hgfU/66yq+HygML
         rya8STK+IRauGkF4OzITrw9KGAJeTa7h1N+KBv+PKaEJnMmgoEo6QvV/Hd4nabbdmYH6
         rJpw+zu97hGB1zMjp79KsVMX7jCaxeq3yRwctTj0+H/b332E0sFifG1eHqkD5ZXo8Pt6
         oAasrVUf9QPzFHjUl186gWvmMoc9Mt+lNaZo+sOCafLBy4P3BVfU9ypGyOTsP+wg2gkt
         CHXQ78xnthulZy8HBbr2neXYKQkQJkhLYSOvd422LWav2TFqXQFSyYUhQIwkMJP75P4l
         9OSg==
X-Gm-Message-State: APjAAAXIIND4w0TwaYn2RWVYNy50X9k1juD/pcGL0GOuRcE5ebaLS1UI
        HnOO9bzDHjqWvC/GqWrpbcFPsRKx9K+MCafKrao=
X-Google-Smtp-Source: APXvYqyeELGWmtZakqHbbTWnsav2OZKFU5N6EyRxBoueWqmCjSHqSMFE118LUWUwpeXKQYgqQlTKyOnuE9lQXm+6lK8=
X-Received: by 2002:a9d:730d:: with SMTP id e13mr1144834otk.145.1570448746373;
 Mon, 07 Oct 2019 04:45:46 -0700 (PDT)
MIME-Version: 1.0
References: <f1c53dd5-2dc5-9f11-44e3-8e222ed21903@cogentembedded.com> <be27a344-d8bf-9e0c-8950-2d1b48498496@cogentembedded.com>
In-Reply-To: <be27a344-d8bf-9e0c-8950-2d1b48498496@cogentembedded.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 7 Oct 2019 13:45:35 +0200
Message-ID: <CAMuHMdVmh6fZ=oRRMA6+H05jdpyPPgK3g=1ivNQUe0LB5sfMjg@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: rcar-gen3: allow changing the RPC[D2] clocks
To:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Sergei,

On Fri, Sep 27, 2019 at 8:09 PM Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> I was unable to get clk_set_rate() setting a lower RPC-IF clock frequency
> and that issue boiled down to me not passing CLK_SET_RATE_PARENT flag to
> clk_register_composite() when registering the RPC[D2] clocks...
>
> Fixes: db4a0073cc82 ("clk: renesas: rcar-gen3: Add RPC clocks")
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Thanks for your patch!

LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Now, before I apply this: does this make RPC-IF work?

> --- renesas.orig/drivers/clk/renesas/rcar-gen3-cpg.c
> +++ renesas/drivers/clk/renesas/rcar-gen3-cpg.c
> @@ -464,7 +464,8 @@ static struct clk * __init cpg_rpc_clk_r
>
>         clk = clk_register_composite(NULL, name, &parent_name, 1, NULL, NULL,
>                                      &rpc->div.hw,  &clk_divider_ops,
> -                                    &rpc->gate.hw, &clk_gate_ops, 0);
> +                                    &rpc->gate.hw, &clk_gate_ops,
> +                                    CLK_SET_RATE_PARENT);
>         if (IS_ERR(clk)) {
>                 kfree(rpc);
>                 return clk;
> @@ -500,7 +501,8 @@ static struct clk * __init cpg_rpcd2_clk
>
>         clk = clk_register_composite(NULL, name, &parent_name, 1, NULL, NULL,
>                                      &rpcd2->fixed.hw, &clk_fixed_factor_ops,
> -                                    &rpcd2->gate.hw, &clk_gate_ops, 0);
> +                                    &rpcd2->gate.hw, &clk_gate_ops,
> +                                    CLK_SET_RATE_PARENT);
>         if (IS_ERR(clk))
>                 kfree(rpcd2);

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
