Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98D2C313156
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Feb 2021 12:49:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232545AbhBHLsz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 8 Feb 2021 06:48:55 -0500
Received: from mail-oi1-f169.google.com ([209.85.167.169]:33333 "EHLO
        mail-oi1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233386AbhBHLpq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 8 Feb 2021 06:45:46 -0500
Received: by mail-oi1-f169.google.com with SMTP id g84so1478925oib.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 08 Feb 2021 03:45:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ia9PFxht5ayn6H7OynF7v6lDAjAsnjaSBrL3nP1f4WE=;
        b=cIbvGGgExwv8fmuVoPnGKXVrtwP6l15uiZib18YjdjVqLZ05x7QsBIjd8Mapg1d94f
         CPqFgX15OqvBxSTcsKnhZUU3V7scUid7eSUrvPrL7egDdS3tY/BmULE7/tqYC81lQv+y
         5NVRL0bLqRM7tdJJmNDXvRKf15Drl9u74bCYwR8Ji6/+/uDVvSTdSgRw8nDOawh6EOZe
         2ZrxQSny+rY6Qdo8nTj9AR8VCGzIvRlo1iA3uIw42JAW9WM2hQ54xpU3b1m1Mq0bqNP2
         nl7ywTErvxEjiSR1QrSZf+JaNFFZkdW8Zcr/8bOpJK6EcSB0vHeLi94Gnm3HloyRdeiR
         1mew==
X-Gm-Message-State: AOAM530JsLpMvdFrlJFCj4XVCHsZVzxUwvHabgYyWJ4OpE9o3sXyMXUc
        BwcLVvv2jdm5zi+hSZzr5T3mZTralzv7lb+V85A=
X-Google-Smtp-Source: ABdhPJxf6gCKPLlrCt0U1GOJBRdVEaieJvFcRlKFleg91i7xen/fzgicZtZrh57XVlCqwe5/mHccAR6gSYrUfkr/Sqk=
X-Received: by 2002:aca:744:: with SMTP id 65mr10768186oih.153.1612784691090;
 Mon, 08 Feb 2021 03:44:51 -0800 (PST)
MIME-Version: 1.0
References: <1612752464-27838-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdVBAy7wtB-_uOsTg5NiEorCwyHgENrwUQBxtcqRChvp1Q@mail.gmail.com> <TY2PR01MB3692141F9F2AD0E1CCD0D10ED88F9@TY2PR01MB3692.jpnprd01.prod.outlook.com>
In-Reply-To: <TY2PR01MB3692141F9F2AD0E1CCD0D10ED88F9@TY2PR01MB3692.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 8 Feb 2021 12:44:39 +0100
Message-ID: <CAMuHMdXrgDG2AaDQO0cS_-G8-WDHGx2HFha6Nva8zhL8QLnnCQ@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: renesas: add sdhi/mmc aliases
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san,

On Mon, Feb 8, 2021 at 11:53 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> > From: Geert Uytterhoeven, Sent: Monday, February 8, 2021 6:46 PM
> > On Mon, Feb 8, 2021 at 3:48 AM Yoshihiro Shimoda
> > <yoshihiro.shimoda.uh@renesas.com> wrote:
> > > After the commit 7320915c8861 ("mmc: Set PROBE_PREFER_ASYNCHRONOUS
> > > for drivers that existed in v4.14"), the order of /dev/mmcblkN
> > > was not fixed in some SoCs which have multiple sdhi controllers.
> > > So, we were hard to use an sdhi device as rootfs by using
> > > the kernel parameter like "root=/dev/mmcblkNpM".
> > >
> > > According to the discussion on a mainling list [1], we can add
> > > mmc aliases to fix the issue. So, add such aliases into R-Car Gen3
> > > and RZ/G2 dtsi files. Note that, if an SoC like r8a77980 has one
> > > sdhi controller only, the alias is not defined.
> > >
> > > [1]
> <snip>
> > >
> > > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > > ---
> > >  Changes from v1:
> > >  - Revise the commit description.
> > >  - Remove some alias which SoC has one sdhi controller only.
> > >
> <snip>
> >
> > Thanks for the update!
> >
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > i.e. I plan to queue this in renesas-devel for v5.13.
> > Unless you want to upstream this as a fix for v5.11, in which case we
> > have to hurry. Note that v5.10 already has the issue, too.
>
> Thank you for this comment. For v5.13 is enough to me. However,

OK.

> if possible, I'd like to apply this patch v5.10.xx too.
> So, should/may I add the following Fixes tag for it?
>
> Fixes: 7320915c8861 ("mmc: Set PROBE_PREFER_ASYNCHRONOUS for drivers that existed in v4.14")

I can add the tag while applying.

> > BTW, shouldn't we add the aliases on 32-bit arm, too?
>
> I think so. I'll prepare such a patch too.

TIA!

> > > --- a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
> > > +++ b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
> > > @@ -14,6 +14,12 @@
> > >         #address-cells = <2>;
> > >         #size-cells = <2>;
> > >
> > > +       aliases {
> > > +               mmc0 = &sdhi0;
> > > +               mmc1 = &sdhi1;
> > > +               mmc3 = &sdhi3;
> > > +       };
> >
> > BTW, this is one of the other issues with aliases: where is mmc2?
> > Yes, I know why it's done this way ;-)
>
> Ah, I intended to assign the aliases 1:1 between "mmcN" and "sdhiN".
> But, should we use "mmc2 = &sdhi3;" instead on r8a774c0 and r8a77990?

I'm fine with the numbering you used, as the aliases match the existing
labels.

However, on R-Car Gen2 we did use contiguous numbering of the labels,
as early revisions of the datasheet used contiguous numbering for the
interfaces, while later revisions changed this.
I think the sensible thing to do is to make the aliases match the existing
labels, too.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
