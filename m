Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EED75103588
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Nov 2019 08:47:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727230AbfKTHrJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 20 Nov 2019 02:47:09 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:42031 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727008AbfKTHrJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 20 Nov 2019 02:47:09 -0500
Received: by mail-oi1-f196.google.com with SMTP id o12so11524098oic.9;
        Tue, 19 Nov 2019 23:47:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uH17i9VqVXMVKtgDKg0Cq09oKBpoxUDf16GI7SgDM64=;
        b=dUmXJsDKvFcvSoUCdsDfaRlBQS0uEoyMW4OLna9SW7qpgVJed8pOVXsb6d8nwcF1GA
         JYxgLFYzraXfF/gar6wfB4ZBlG5ZhaJ+rnx0w3z1PqBDyoVzLVdy6Tnoo1U7E5TvKolR
         uRL773ZED7DNKneu2EedU3+dunl0grkKOUNgoUOb+s7Y5Wri97I6i5Q0mo+7AoX/773Q
         HkTUdEGnZS7G2QHW1bBbxERcmG2F9yi2fNXDSbvEPrKi+FmHsxQwgtWHzvRLq8piUQp9
         SlqdidU8Dt4ZAE7oqOLeV298hQfTekFC5xX88yCyZWqTc8+S6ZZ5ohTq/x/EgB8h2Brw
         LJbg==
X-Gm-Message-State: APjAAAWGBFj+aYnt4L5bnjyGQwEt8XFqTPGs6lkOcYKgqvRqUHxIsgGI
        W3evhxKXvHZU2hmBkoSlJ/JZ9IxcNT3OHjUlhVOYT90A
X-Google-Smtp-Source: APXvYqwuJ1b/hFm8Qxa/NpiH2pxSQcR6UDGho+bR9Z94EwecsMHAUrz55k+tU/l36kfYmQSkFHvMaukQHz4FAUCd6eY=
X-Received: by 2002:aca:fc92:: with SMTP id a140mr1487718oii.153.1574236027863;
 Tue, 19 Nov 2019 23:47:07 -0800 (PST)
MIME-Version: 1.0
References: <20190917183652.7310-1-wsa+renesas@sang-engineering.com>
 <CAMuHMdVYYveVeF4+16vi8zk+0yVZMMJnMvKbLms7CbQ6w00uVg@mail.gmail.com> <20191119204725.GA1454@kunai>
In-Reply-To: <20191119204725.GA1454@kunai>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 20 Nov 2019 08:46:56 +0100
Message-ID: <CAMuHMdV+W62MkSRuYZNT0ezOt_KkyStfoeZohu7m1pOP=4a0HQ@mail.gmail.com>
Subject: Re: [PATCH] mmc: tmio: remove workaround for NON_REMOVABLE
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

On Tue, Nov 19, 2019 at 9:47 PM Wolfram Sang <wsa@the-dreams.de> wrote:
> > Interestingly, this patch has been part of renesas-drivers since the
> > 2019-10-15-v5.4-rc3 release, without real issues.
>
> Huh, interesting. With which branch does this appear then? linux-next?

renesas-drivers

I can reproduce this with renesas-drivers-2019-11-19-v5.4-rc8 and
renesas_defconfig by booting a ramdisk, and reading from /dev/mmcblk1.

Also with renesas-drivers-2019-10-15-v5.4-rc3.
So some of my local code on top must have impacted the behavior.

> > Today, it was fairly reproducible, so I managed to bisect it to commit
> > 7a7dab237027939c ("mmc: tmio: remove workaround for NON_REMOVABLE") in
> > mmc/next.  Reverting this commit fixes the issue.
>
> Hmm, probably we should do the revert despite our discusstion here. And
> then resend the original patch after we figured the cause of this hang.
>
> > The issue can also be fixed by:
> >   1. enabling the hs400_4taps and/or hs400_disabled quirks in
> >      sdhi_quirks_match[], OR
> >   2. forcing use_4tap = true in renesas_sdhi_check_scc_error().
> >
> > Salvator-X(S) with R-Car H3 ES1.0 & ES2.0, or M3-W ES1.0, the issue
> > does not show up (probably because of sdhi_quirks_match[]).
> >
> > Do you have a clue?
>
> Not very clear. M3-N is not a 4tap-device, so this can't be a fix.
> However, both disabling HS400 as well as using 4tap will prevent the SCC
> error checking in renesas_sdhi_check_scc_error(). I'd assume the SCC
> hangs.

Makes sense.

> I am working on an issue where the SCC hangs, but this has to do with
> always providing the SCC clock (SDnH). I don't really see the connection
> of that to RuntimePM yet, though :/

Makes sense: this is consistent with the behavior when accessing
registers without enabling the corresponding module clock: it hangs.
So this can happen with other clocks, too.
One more reason not to delegate clock handling to a guest, as doing it
wrong can take down the host, too...

> Can you test this simple workaround patch instead of the revert just so
> we get an idea if these issues are related?

Thanks, applying your workaround on top of
renesas-drivers-2019-11-19-v5.4-rc8 fixes the issue.

This fix is part of renesas/topic/sdhi-manual-calib, right?
And thus has been present in some renesas-drivers release, but was
dropped _before_ the 2019-10-15-v5.4-rc3 release.


Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
