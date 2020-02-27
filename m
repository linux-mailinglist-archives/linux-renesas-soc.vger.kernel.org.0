Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 57D68171EB3
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Feb 2020 15:30:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388107AbgB0O3e (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 27 Feb 2020 09:29:34 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:36542 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731106AbgB0O3e (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 27 Feb 2020 09:29:34 -0500
Received: by mail-ot1-f67.google.com with SMTP id j20so3095840otq.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Feb 2020 06:29:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JCe2qKYwous/dcomBSOOP1MBejhPAUJJqlWqSZ+WcRs=;
        b=J0DIAeu8FCDdFNmo50CrR+PInKKVWzcTOqNAjXG6fAgJ0K7ujcG8N7r9eeO+meIYkK
         zVfKBEveJ/l2z01Kdh1gQbHOYntNkzDTWp87uiijcb8LZo7NLA/JKWzaSKHMgfHHu2RP
         5wpIdU9ZsUWg4YmC72bTGDiT5smkRFDEIN7MYzBgQpOT6RdV965Shq2U/RU/fEnTZqlE
         1O5mjgrCsRkilQaSRTbBBRGs4nF+WkBFxxmNufiZ+jnUESlbGOcptlxsJt/eLhldHLmC
         cYb8DQIAE1VtIu5uZTbWB/n8pftQD8MnX38d1/sbZ0j2o9uf6NQ4PdUTV5rEIGHB5fQH
         n9Bw==
X-Gm-Message-State: APjAAAU4vg7H8W8HC6+jLKK0yM3y425Jz+mGmaLgwzUad8yTRETM3tlx
        hBvwsW7ua/Bu4XiAyTkPxRmNboJwIed+w57W3do=
X-Google-Smtp-Source: APXvYqzejmffVTy/AdvH5rJg9kFSD0M8MR2sO9jC5iWfUZh0NoCuJCWeZGM01U+bEv1nhia8r0OcNbPdv9G7i4B6aa8=
X-Received: by 2002:a05:6830:100e:: with SMTP id a14mr3599892otp.297.1582813772592;
 Thu, 27 Feb 2020 06:29:32 -0800 (PST)
MIME-Version: 1.0
References: <1582748897-17374-1-git-send-email-uli+renesas@fpond.eu>
In-Reply-To: <1582748897-17374-1-git-send-email-uli+renesas@fpond.eu>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 27 Feb 2020 15:29:21 +0100
Message-ID: <CAMuHMdXwdAzgp86JzJOHyop+CA0KgwvJQdCi6-R5WP+So-1uUw@mail.gmail.com>
Subject: Re: [PATCH 00/11] clk: renesas: cpg-mssr: add ignore-unused option
To:     Ulrich Hecht <uli+renesas@fpond.eu>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Uli,

On Wed, Feb 26, 2020 at 9:28 PM Ulrich Hecht <uli+renesas@fpond.eu> wrote:
> This series adds the option for declaring clocks as "ignore-unused", i.e.
> clocks that will not be turned on if not used, but also not turned off if
> unused. It also enables this option for the RWDT clocks in (almost) all
> SoCs.

Thanks for your series!

> The point of this is to allow a WDT that has been enabled by the bootloader
> to survive these events:
>
> - deferred probing of the WDT device, which can lead the clock driver
>   to disable the WDT clock until the WDT is re-probed, giving it a
>   blind spot
> - probe failure in the WDT driver
>
> There are a number of SoCs that have the RWDT clock already declared as
> critical (i.e. turn it on even if it is off _and_ unused). I don't know if
> that is because there was no option for ignore-unused before, or if the
> behavior of turning the clock on even if neither the bootloader nor anything
> in the kernel has asked for it is actually desired. If it's the former,
> these SoCs also have to be converted to the new mechanism.

That was done on all of R-Car Gen2 and RZ/G1, as the SMP bringup code
needs to check the watchdog registers, which can happen at any time, cfr.
commit 58adf1ba0d227754 ("ARM: shmobile: Add watchdog support").

Presumable that was fixed on R-Car Gen3 and RZ/G2, so the watchdog registers
don't have to be checked, and the watchdog doesn't have to run all the
time (holding wood, rabbit legs, and whatever ;-)

> Ulrich Hecht (11):
>   clk: renesas: cpg-mssr: add support for ignore-unused clocks
>   clk: renesas: r8a7796: mark RWDT clock as ignore-unused
>   clk: renesas: r8a7795: mark RWDT clock as ignore-unused
>   clk: renesas: r8a77970: mark RWDT clock as ignore-unused
>   clk: renesas: r8a77980: mark RWDT clock as ignore-unused
>   clk: renesas: r8a77995: mark RWDT clock as ignore-unused
>   clk: renesas: r8a774a1: mark RWDT clock as ignore-unused
>   clk: renesas: r8a774b1: mark RWDT clock as ignore-unused
>   clk: renesas: r8a774c0: mark RWDT clock as ignore-unused
>   clk: renesas: r8a77965: mark RWDT clock as ignore-unused
>   clk: renesas: r8a77990: mark RWDT clock as ignore-unused

I think the SoC-specific parts can be merged safely into two patches,
one for R-Car Gen3, and one for RZ/G2?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
