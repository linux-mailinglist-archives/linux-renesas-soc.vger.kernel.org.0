Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 099613132DF
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Feb 2021 14:01:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229789AbhBHNB0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 8 Feb 2021 08:01:26 -0500
Received: from mail-ot1-f41.google.com ([209.85.210.41]:36550 "EHLO
        mail-ot1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229681AbhBHNBY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 8 Feb 2021 08:01:24 -0500
Received: by mail-ot1-f41.google.com with SMTP id 100so7377786otg.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 08 Feb 2021 05:01:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=t3tzNiNQLhmnuCVSfpZbNAY2+lL3JZ4pfQLxshc53og=;
        b=Ws7DszW/H1Xl5CyJMJ9JF2+epzysqUyh6TYuzMy8VEoQfjr9GPg01cqHT9ZKeDixhu
         LbiN24pZG8yd1pYqJkoQqEqqXGr5BqHOWe/Jc2N6Vv30MniDJfLUSWho2lCxqWADGDsF
         EAw6V6lqy3MMQcHRH7eOWT52M4OF9RUGlGWrdYYQUllww9nC59MOD7x17cwgPlEnlZEf
         vrZVHI8z83UK0rNdO6IOXReAxaQXN/nBTjEwTrcihlyKlcWMYiQlUZ11zh7JuII90dBd
         jRsaCPizVo3KpoMAUPjRFhN8e/Qr7+Z5oXzLbBExWJbsVsORx1/rvuTd1Eyi8aSUVph+
         AQpA==
X-Gm-Message-State: AOAM533Czu6h81m7CSXRXYhjSmd9XP5sU3eSx+hH15A5JpyUKV3q3TOX
        Bjs7f5wpguf6q3s81X07D+M71RL3XfVuSYv3AfwagjFFAy4=
X-Google-Smtp-Source: ABdhPJz4m8Fg0K82PZ7hYHgUct9YDyhyHGxtZDOO7yss9rnLmMnpORCcxKLTi9VVQDScc0Lm4SapfCYks3w2Vvi16WI=
X-Received: by 2002:a9d:3604:: with SMTP id w4mr12650478otb.107.1612789243587;
 Mon, 08 Feb 2021 05:00:43 -0800 (PST)
MIME-Version: 1.0
References: <1612752464-27838-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdVBAy7wtB-_uOsTg5NiEorCwyHgENrwUQBxtcqRChvp1Q@mail.gmail.com>
 <TY2PR01MB3692141F9F2AD0E1CCD0D10ED88F9@TY2PR01MB3692.jpnprd01.prod.outlook.com>
 <CAMuHMdXrgDG2AaDQO0cS_-G8-WDHGx2HFha6Nva8zhL8QLnnCQ@mail.gmail.com> <TY2PR01MB36923DB45B66F0EABA1256E2D88F9@TY2PR01MB3692.jpnprd01.prod.outlook.com>
In-Reply-To: <TY2PR01MB36923DB45B66F0EABA1256E2D88F9@TY2PR01MB3692.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 8 Feb 2021 14:00:32 +0100
Message-ID: <CAMuHMdVgTfp5-q08VvUEEtLOE+LeeEPCY5wsfvhCyuHGa9Xung@mail.gmail.com>
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

On Mon, Feb 8, 2021 at 1:31 PM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> > From: Geert Uytterhoeven, Sent: Monday, February 8, 2021 8:45 PM
> > On Mon, Feb 8, 2021 at 11:53 AM Yoshihiro Shimoda
> > <yoshihiro.shimoda.uh@renesas.com> wrote:
> > > > From: Geert Uytterhoeven, Sent: Monday, February 8, 2021 6:46 PM
> > > > On Mon, Feb 8, 2021 at 3:48 AM Yoshihiro Shimoda
> > > > <yoshihiro.shimoda.uh@renesas.com> wrote:

> > > > > --- a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
> > > > > +++ b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
> > > > > @@ -14,6 +14,12 @@
> > > > >         #address-cells = <2>;
> > > > >         #size-cells = <2>;
> > > > >
> > > > > +       aliases {
> > > > > +               mmc0 = &sdhi0;
> > > > > +               mmc1 = &sdhi1;
> > > > > +               mmc3 = &sdhi3;
> > > > > +       };
> > > >
> > > > BTW, this is one of the other issues with aliases: where is mmc2?
> > > > Yes, I know why it's done this way ;-)
> > >
> > > Ah, I intended to assign the aliases 1:1 between "mmcN" and "sdhiN".
> > > But, should we use "mmc2 = &sdhi3;" instead on r8a774c0 and r8a77990?
> >
> > I'm fine with the numbering you used, as the aliases match the existing
> > labels.
> >
> > However, on R-Car Gen2 we did use contiguous numbering of the labels,
> > as early revisions of the datasheet used contiguous numbering for the
> > interfaces, while later revisions changed this.
> > I think the sensible thing to do is to make the aliases match the existing
> > labels, too.
>
> Thank you for the comment about R-Car Gen2. I didn't realized that.
> On R-Car Gen2 SoCs, they also have mmcif controllers. So, I'm thinking
> the mmc aliases should use contiguous numbering for Gen2 mmcif and sdhi
> at least. And, perhaps, I feel using same this rule (contiguous numbering) on
> Gen3 is better. But, what do you think?

Thank you for the comment about MMCIF,  I had forgotten about that.
R-Car Gen2 is even more complicated, as you have 1, 3, or 4 SDHI
instances, and may have 1 or 2 MMC instances.  So is mmc0 the first
SDHI interface, or the first MMC interface?
Worse, they share pins. So the user can actually choose to use an SDHI or
MMCIF instance on some of the pin groups (for now ignoring that MMCIF
supports 1/4/8 bit, and SDHI only 1/4).

Hence I think on R-Car Gen2 you have to add the aliases to the board DTS
files, based on the connector labels on the physical boards, which
brings us back to the original idea behind the aliases...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
