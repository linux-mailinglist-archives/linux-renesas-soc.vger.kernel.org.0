Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4B9A3127CF4
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Dec 2019 15:32:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727497AbfLTOb2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 20 Dec 2019 09:31:28 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:45339 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727511AbfLTOb1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 20 Dec 2019 09:31:27 -0500
Received: by mail-oi1-f194.google.com with SMTP id n16so514677oie.12;
        Fri, 20 Dec 2019 06:31:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CXTmqfsqQIcvEZP4mfMoRX6YILN9s0WAIe4dxaX6Qsg=;
        b=dMlZ7eStNEwddH6GRgemuEa3afTmIU5NIg6f8PjfJk2PSggU7ZbIdxmnaInI6w0th5
         cDBmWpFrFhZkvhK55JQFdp5uVPdUAErw9fZQbTdByVJcfBn6h4nOgzTj4atidRa+IJrU
         Z/So5mln87XslszONLiGsaC6G1Mr+Q4FSTG25sQXmhMhXFDeKG7Um4XeC7Rf4ak18OnP
         R3O6G7fLzHzHpP8FXpknT/s2WJim8PWcwCA2WeJPcbrI42Hy7ykE9ssqSAXOc02oKdDZ
         73YcNhS4mojmaddMIexxNvc3CZH+Zl6Ok27O0cRE0d7ZqVZ8Eb0YMiNg3qyorcEYbSiq
         B/kg==
X-Gm-Message-State: APjAAAWUITk3ByJIbQlEIqzRQ0NdZ95ktx6qZNm0BoOzT/HYiq+fKube
        IkCO0WOp53m5HOwpBROVrCNhk4HlyEYSJc6jk60=
X-Google-Smtp-Source: APXvYqwXppQv9wXn0gUgYJoZYpJSkOFnsvXl+hpWQJPSejWrZ2S9U8+/w+h2wepfv5vwz4nkuHyDx+zAV9zu/HQ7Uj0=
X-Received: by 2002:aca:36c5:: with SMTP id d188mr3991242oia.54.1576852286954;
 Fri, 20 Dec 2019 06:31:26 -0800 (PST)
MIME-Version: 1.0
References: <f1c53dd5-2dc5-9f11-44e3-8e222ed21903@cogentembedded.com>
 <be27a344-d8bf-9e0c-8950-2d1b48498496@cogentembedded.com> <CAMuHMdVmh6fZ=oRRMA6+H05jdpyPPgK3g=1ivNQUe0LB5sfMjg@mail.gmail.com>
In-Reply-To: <CAMuHMdVmh6fZ=oRRMA6+H05jdpyPPgK3g=1ivNQUe0LB5sfMjg@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 20 Dec 2019 15:31:15 +0100
Message-ID: <CAMuHMdXfqJpm_F=vQ6rmrTBo80tQ1wV6Uf6VRTvvRiO1pECr7g@mail.gmail.com>
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

On Mon, Oct 7, 2019 at 1:45 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Fri, Sep 27, 2019 at 8:09 PM Sergei Shtylyov
> <sergei.shtylyov@cogentembedded.com> wrote:
> > I was unable to get clk_set_rate() setting a lower RPC-IF clock frequency
> > and that issue boiled down to me not passing CLK_SET_RATE_PARENT flag to
> > clk_register_composite() when registering the RPC[D2] clocks...
> >
> > Fixes: db4a0073cc82 ("clk: renesas: rcar-gen3: Add RPC clocks")
> > Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>
> Thanks for your patch!
>
> LGTM, so
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Queueing in clk-renesas-for-v5.6.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
