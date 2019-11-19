Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F03981028A8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Nov 2019 16:51:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727509AbfKSPvj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 19 Nov 2019 10:51:39 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:44262 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727591AbfKSPvj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 Nov 2019 10:51:39 -0500
Received: by mail-ot1-f67.google.com with SMTP id c19so18246204otr.11;
        Tue, 19 Nov 2019 07:51:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EI7Opp0EhqtgVydNb6S9xbjO00XdbKQ8ztCEnk99UbA=;
        b=ktTNNK0+mkt1W5bC6t75TjXANO4w6KCG8Bxrxb2F+fFoDuKGn8bkKGfCcWKbp03ZbB
         m4SuexjYp/0wTAsfSLeCpxTmEoI9YeW3UAZjfqNfGc/lq5j+ojsy5vYeG0m3DHEe+pwR
         Adez0rgxAaw+hQOWbehC2ezxRcj70Xtq9CVoOEUCWwmiVBjBDIfxFik2bLnK3K6UswMF
         T1NcqB2joUByUDWVtpkj2qnB+lLXI+frPjrIY29OXr+uTDncuUD9CrdwUHcctrDbVIZ6
         c5kJKTuySh/QEPR14D95ygBh/R81DbvIj2dRd9FOHbi3vVmGwysBgR+s7nRvTfVx/OOQ
         U8aw==
X-Gm-Message-State: APjAAAV/MRxWx+9LFODS0E8S1RquDDdzQXM5EnxWOUcLf6K3CAlZRP4l
        2CJ/mBzchiRQQ4wxAUficyFDfsoALBuQcKPPRbfNTjO3
X-Google-Smtp-Source: APXvYqwYDopHnuwRPYWCjt5WfEH856jgbKoQrSWecbkQW8/baUGgFP73oVk4Ar3K7z7c1soqk2qx7KYpFIQL5ggC/pk=
X-Received: by 2002:a05:6830:2363:: with SMTP id r3mr4434048oth.39.1574178698185;
 Tue, 19 Nov 2019 07:51:38 -0800 (PST)
MIME-Version: 1.0
References: <20190917183652.7310-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20190917183652.7310-1-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 19 Nov 2019 16:51:27 +0100
Message-ID: <CAMuHMdVYYveVeF4+16vi8zk+0yVZMMJnMvKbLms7CbQ6w00uVg@mail.gmail.com>
Subject: Re: [PATCH] mmc: tmio: remove workaround for NON_REMOVABLE
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

On Tue, Sep 17, 2019 at 9:46 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> PM has been reworked, so eMMC gets now detected on R-Car H3 ES1.0 and
> 2.0 as well as M3-N without the workaround. Card detect and write
> protect also still work. Remove the workaround.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

> --- a/drivers/mmc/host/tmio_mmc_core.c
> +++ b/drivers/mmc/host/tmio_mmc_core.c
> @@ -1208,15 +1208,6 @@ int tmio_mmc_host_probe(struct tmio_mmc_host *_host)
>         if (!_host->reset)
>                 _host->reset = tmio_mmc_reset;
>
> -       /*
> -        * On Gen2+, eMMC with NONREMOVABLE currently fails because native
> -        * hotplug gets disabled. It seems RuntimePM related yet we need further
> -        * research. Since we are planning a PM overhaul anyway, let's enforce
> -        * for now the device being active by enabling native hotplug always.
> -        */
> -       if (pdata->flags & TMIO_MMC_MIN_RCAR2)
> -               _host->native_hotplug = true;
> -
>         /*
>          * While using internal tmio hardware logic for card detection, we need
>          * to ensure it stays powered for it to work.

On Salvator-XS with R-Car M3-N, this causes lock ups during early userspace
boot up (Debian 9 nfsroot), usually after:

    [  OK  ] Started D-Bus System Message Bus.

At first I suspected systemd.  Then I noticed the kernel had locked up
completely, and no longer responded to ping requests.

Interestingly, this patch has been part of renesas-drivers since the
2019-10-15-v5.4-rc3 release, without real issues.
The first time I saw the issue was last week. Then it happened only after I
had disabled a debug print, which probably caused a timing difference in
Runtime PM disablement (and was fully reproducible).

Today, it was fairly reproducible, so I managed to bisect it to commit
7a7dab237027939c ("mmc: tmio: remove workaround for NON_REMOVABLE") in
mmc/next.  Reverting this commit fixes the issue.

The issue can also be fixed by:
  1. enabling the hs400_4taps and/or hs400_disabled quirks in
     sdhi_quirks_match[], OR
  2. forcing use_4tap = true in renesas_sdhi_check_scc_error().

Salvator-X(S) with R-Car H3 ES1.0 & ES2.0, or M3-W ES1.0, the issue
does not show up (probably because of sdhi_quirks_match[]).

Do you have a clue?
Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
