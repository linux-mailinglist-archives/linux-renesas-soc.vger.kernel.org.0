Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DBCEC5B801
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  1 Jul 2019 11:27:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728351AbfGAJ1G (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 1 Jul 2019 05:27:06 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:40808 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727994AbfGAJ1G (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 1 Jul 2019 05:27:06 -0400
Received: by mail-oi1-f195.google.com with SMTP id w196so9391579oie.7
        for <linux-renesas-soc@vger.kernel.org>; Mon, 01 Jul 2019 02:27:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/BFFKpdHMAZ0FTsfJ9I5iBica3jH/QgWYLll3WVk2K8=;
        b=eiowIHxyzReHeo7ZTuVyyO2X5A5fUtiDCuYQpZXUyMmn2a/oq1lqmKCcdK3ieBqfku
         r9aL75hPrWTAIg3QVzrexthHQlw5FPC4iK5HdGTqhYzwCIt8ZQNJFdGCQD1LBGuQX1e9
         t84WsfIWze4Dk4XkoR2rxMh46N1VaBpQFCFeFCpoxeMuKZN+Lr6flZqI0vAfawktmwqJ
         NWSfIFzLJzkItQ0l3xNXffhF22MUH9WOHOZINaYvkNjoZLit0ys4+AyfffQDdcdLiO53
         qrD9QOkCBoXekDeSVdc/F2cn87Ez+MnqPSTadLnxKediwPxifhUUYypyG1m+dVe9omVd
         9iCA==
X-Gm-Message-State: APjAAAULERKGsGHC8R0E6bSuULsIMxIcGuBKyaW57/3zcZP9YMxF5kEA
        DA8RNSpWX9AW8xpHQUvaEd7mD/Rsvli0gCeJQqA=
X-Google-Smtp-Source: APXvYqy0F7bifNtwSVPHKKfZY3PaA6fwBjsATwJBxxCCisl2oC2UL4s7PvROjcgKRTNjMIdLPO7DwdXNXD4vQNgQpEE=
X-Received: by 2002:aca:bd43:: with SMTP id n64mr5699304oif.148.1561973225368;
 Mon, 01 Jul 2019 02:27:05 -0700 (PDT)
MIME-Version: 1.0
References: <20190628175144.GA1043@ninjato> <CAMuHMdWLhRwdcvR=Y1TnBuo+zzUJi-iV75_eGO+29wboU2i4Vw@mail.gmail.com>
 <20190701092338.GA1968@kunai>
In-Reply-To: <20190701092338.GA1968@kunai>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 1 Jul 2019 11:26:54 +0200
Message-ID: <CAMuHMdXaAS8UCBk=wd=srnKJBnM-3VCTttcAMnh9hu-afG=TjA@mail.gmail.com>
Subject: Re: [PULL REQUEST] renesas/topic/sdhi-manual-calib for renesas drivers
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

On Mon, Jul 1, 2019 at 11:23 AM Wolfram Sang <wsa@the-dreams.de> wrote:
> > mmc/next is included in renesas-drivers anyway, but Ulf sometimes likes
> > to rebase that branch.
>
> I know :(
>
> > Actually you made it more difficult for me, as you changed the mere
> > possibility of a conflict due to Ulf rebasing mmc/next, into a certainty
> > of your branch conflicting with mmc/next ;-)
>
> Wouldn't that happen as well if I base it on an old version of mmc/next?
> As soon as Ulf rebases -> problem. Geez, his rebasing is annoying.

Yes it would, _iff_ he rebases, which he doesn't always do.

> What would be the easiest solution for you here? (except waiting for
> -rc1 which was sadly not an option here)

Base it on mmc/next? As long as Ulf doesn't rebase mmc/next, and
doesn't queue conflicting patches, there would be no conflict.

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
