Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB13A2EF0CA
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Jan 2021 11:41:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727378AbhAHKlu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 8 Jan 2021 05:41:50 -0500
Received: from mail-qk1-f174.google.com ([209.85.222.174]:36204 "EHLO
        mail-qk1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727363AbhAHKlu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 8 Jan 2021 05:41:50 -0500
Received: by mail-qk1-f174.google.com with SMTP id 186so8072311qkj.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 08 Jan 2021 02:41:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=cXRX3IBhGp8gRku2dI6tZRey/IDIJSohdlea9sAMurg=;
        b=OP/WeI3Yo43wlo6LmjEE/1VH4DYAsP//fvkYrYmpG0VtVxsWtsZ8VIoY6HN6Toj6sa
         eXAX9CGLDM/FezGW1hnW53aBA6MrrDW9X5kosuvZp0i672gX6gT6HVFjQdwrHATteD8i
         1WDPlmbR2PXanfU+0foMkolLA+TUW+yIZvW9oDaOM25DgI3bhllPu+OqJbLV+7sJ67lV
         IP6BNskwSCdIuqoUvz8NDKHvSrCjak61vLhqd9iao60W8ZWmHaIlfnFvY4evzaXpOkeR
         f67Y5uiRxyXsw2RhCpGwNVyWGf7Nr8c16J6MSD7ETNWHhp3rOmGUH5Y4BbXUiM/3NzIU
         P4IA==
X-Gm-Message-State: AOAM530K9EWlutgyYsz1rSFDnfSbhlDXcjq/TJntIWOa+xWEDIWKtN1Y
        j1UI2CoXrwXHM3572nfNa4o6p+27LS+RD+Zb4Z0=
X-Google-Smtp-Source: ABdhPJxKt9sazjRGWyN520/0q12G5I1XClPh1aTgEacuxT9yjDDgwP2BzxSOLNsKeYwtSEjv0oLg3TmilJgMZvnzuq0=
X-Received: by 2002:a37:6c06:: with SMTP id h6mr3191227qkc.115.1610102469356;
 Fri, 08 Jan 2021 02:41:09 -0800 (PST)
MIME-Version: 1.0
References: <20210108102854.2025261-1-geert+renesas@glider.be>
 <20210108102854.2025261-3-geert+renesas@glider.be> <20210108103047.GD1223@kunai>
In-Reply-To: <20210108103047.GD1223@kunai>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 8 Jan 2021 11:40:56 +0100
Message-ID: <CAMuHMdUKOZ5aHjKf9Ar68=9UBZpy5PfhC=YNuvJL5D6gnHFWbA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: renesas: r8a779a0: Add GPIO nodes
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Ulrich Hecht <uli+renesas@fpond.eu>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

On Fri, Jan 8, 2021 at 11:30 AM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> On Fri, Jan 08, 2021 at 11:28:54AM +0100, Geert Uytterhoeven wrote:
> > Add device nodes for the General Purpose Input/Output (GPIO) block on
> > the Renesas R-Car V3U (r8a779a0) SoC.
> >
> > As there is no node for the PFC yet, all "gpio-ranges" properties are
> > commented out.
>
> This paragraph is obsolete by now.

Oops, thanks, will remove in v3.

> > v2:
> >   - Add Tested-by,
> >   - Fix "V3u" typo in patch description,
> >   - Uncomment "gpio-ranges" properties,
> >   - Verified resets values.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
