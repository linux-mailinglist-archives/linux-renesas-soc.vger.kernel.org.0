Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 367291FF0DD
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Jun 2020 13:45:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728096AbgFRLp2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 18 Jun 2020 07:45:28 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:46746 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727784AbgFRLp2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 18 Jun 2020 07:45:28 -0400
Received: by mail-ot1-f66.google.com with SMTP id g7so4228048oti.13;
        Thu, 18 Jun 2020 04:45:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3/GmHzHaJXfKPAE4Dhv91aGLVhmYtoCuc/JwKOn8/nI=;
        b=oSvPp8ncOsb3JmMMQuMizeoBkNRXjwVo7FcPVdEsEb90MYGys5SSms0y5D1HWlNDrF
         YKuxe2kmnFqB8YSBLipH3MgQc5sFSg5A1dHgfNbTtXLXHWZaog26CdQKdjX26Cyj3doS
         rRl8Lt57RQ7BjhAyOgjLPgQPG3tMfi3BaoyRbeQJanxhnl7T1JGOtXRFJSOkl5mLcvti
         FPu5wFZoc9qecMlGXhTXPFWx0NrEs18lLN3AueiLOjhPs2pNjWHdnZIQDZvxJI6P2pGR
         KSXFWkMLjsSAo98nmSfMwkJyeGrVfB6zD8LVpzLRLQnps5AUgAs73grPQ2u+FALwtiIJ
         ydFg==
X-Gm-Message-State: AOAM533FKMTGC59noSZA9ccd1dfeTWfmDu28SLzmlVuPkz3OXmz4OWuq
        nwMNlB/adq9Vv5BuxGh9XduPb61EQd+p3VXqIkRBWbyB
X-Google-Smtp-Source: ABdhPJycsp05t8ByudTXOt3lT+dkPulFnzfATKph8iduA2TSPSvS+yA65IqLg+4Qt/n4J5ENA0aXyI1IxGR5oDYqZjI=
X-Received: by 2002:a9d:c29:: with SMTP id 38mr2856813otr.107.1592480725841;
 Thu, 18 Jun 2020 04:45:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200616162626.27944-1-uli+renesas@fpond.eu>
In-Reply-To: <20200616162626.27944-1-uli+renesas@fpond.eu>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 18 Jun 2020 13:45:14 +0200
Message-ID: <CAMuHMdW4m4Qr0QgCQiXofCbvB--MZzoxPty8+Q_bKi2Y5-PG8w@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] clk: renesas: cpg-mssr: add RWDT to critical clocks
To:     Ulrich Hecht <uli+renesas@fpond.eu>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Uli,

On Tue, Jun 16, 2020 at 6:26 PM Ulrich Hecht <uli+renesas@fpond.eu> wrote:
> The purpose of this series is to allow a WDT that has been enabled by the
> bootloader to survive these events:
>
> - deferred probing of the WDT device, which can lead the clock driver
>   to disable the WDT clock until the WDT is re-probed, giving it a
>   blind spot
> - probe failure in the WDT driver
>
> Following a suggestion by Geert, this revision, instead of adding another
> list of clocks with special handling, changes the semantics of the
> crit_mod_clks[] array slightly by only marking clocks critical that are
> enabled at boot time. That way it can be used for RWDT without forcing the
> clock on unnecessarily.
>
> The other existing user of crit_mod_clks[] (INTC-AP) is always on at boot time
> and should thus not be affected by this change.
>
> There are a number of Gen2 and RZ/G1 SoCs that have the RWDT clock declared
> as critical already in order to allow SMP bringup code to work. That should
> still work with this series applied, assuming that the WDT clock is on at
> boot time.

It must be, as initial secondary CPU bringup runs very early.

That does mean I will have to remove the RWDT clock from my debug code
to disable all unused clocks during boot[1].
Interestingly, the SMP bringup code still seems to work (on R-Car M2-W
ES1.0) if the RWDT clock is disabled, both for initial bringup and
manual CPU off/onlining later. And it keeps working if I move the debug
code earlier (currently it runs after initial bringup).

So we're all fine ;-)

[1] https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git/log/?h=topic/renesas-debug

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
