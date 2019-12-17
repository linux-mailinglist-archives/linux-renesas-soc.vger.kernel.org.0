Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DF2F71237F7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Dec 2019 21:44:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728361AbfLQUoE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 17 Dec 2019 15:44:04 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:34481 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728178AbfLQUoE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Dec 2019 15:44:04 -0500
Received: by mail-ot1-f67.google.com with SMTP id a15so2227011otf.1;
        Tue, 17 Dec 2019 12:44:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vIAFaatzQ9dEbyxMJbeRSvuGBi8SLBfPTGFC4qFE2Wo=;
        b=ZkEJR7F+HZd8XXFi3lC+m0NWMDbGWChyJldwJU6OAOV9+fDqpy1oopUzswinmoCnP+
         m2aS7CZVG624feSoVacLncXKGxACSOc1+Z3yRfyrhibLDmkBLeEC97a2jfbTzEvzutyZ
         +s1/lDcibmY5guqMom0cLytg8OYbO4W/GbtWSq8/osD6PbrQtxQJfJ61UgKzPkxY0OhD
         lb7jGyFTzujoySdX25BneoqHrrehSlWvUqZ5RCGczvMcPd9sb/yyxSpBQq1MEELUKluK
         pIvL+JxQcALzOhN6k6wJNrFLKqznr81xXNnxhSpbT2jS4tEablmVWuoslqyLPG6A9MSi
         v6+A==
X-Gm-Message-State: APjAAAUjZgjpD8ocx37lzTAn8a35NX2Rlxg4GuMTTeZgH90XTl6UH9Yu
        nIDy+7YHEhlUQEr7CMQySf5roYC3PYf1AvSY6Dk=
X-Google-Smtp-Source: APXvYqy6UVIEM4WCuowsz46uqoM8XGNVtkaIIXGrLSDRfNWt02ihLENOR4YxW90YkrUASNscNSxYUWPVicpDGD83Gco=
X-Received: by 2002:a05:6830:18e2:: with SMTP id d2mr9993806otf.107.1576615443128;
 Tue, 17 Dec 2019 12:44:03 -0800 (PST)
MIME-Version: 1.0
References: <f1c53dd5-2dc5-9f11-44e3-8e222ed21903@cogentembedded.com>
 <be27a344-d8bf-9e0c-8950-2d1b48498496@cogentembedded.com> <CAMuHMdVmh6fZ=oRRMA6+H05jdpyPPgK3g=1ivNQUe0LB5sfMjg@mail.gmail.com>
 <c879023c-77d9-5230-7086-4a495999f154@cogentembedded.com>
In-Reply-To: <c879023c-77d9-5230-7086-4a495999f154@cogentembedded.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 17 Dec 2019 21:43:51 +0100
Message-ID: <CAMuHMdV_hYNLYxQXvpVLgSphzpJn0NckOu0CvwUO+ggF0thhkw@mail.gmail.com>
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

On Mon, Oct 7, 2019 at 1:49 PM Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> On 10/07/2019 02:45 PM, Geert Uytterhoeven wrote:
> >> I was unable to get clk_set_rate() setting a lower RPC-IF clock frequency
> >> and that issue boiled down to me not passing CLK_SET_RATE_PARENT flag to
> >> clk_register_composite() when registering the RPC[D2] clocks...
> >>
> >> Fixes: db4a0073cc82 ("clk: renesas: rcar-gen3: Add RPC clocks")
> >> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> >
> > Thanks for your patch!
> >
> > LGTM, so
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
>    Thanks. :-)
>
> > Now, before I apply this: does this make RPC-IF work?
>
>    Unfortunately, no. :-/

As per private communication, I understand the problem is elsewhere,
and this patch itself is working fine, and thus safe to apply?

Thanks for confirming!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
