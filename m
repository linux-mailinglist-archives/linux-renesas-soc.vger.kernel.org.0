Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C174327A15
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  1 Mar 2021 09:55:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233597AbhCAIyt convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 1 Mar 2021 03:54:49 -0500
Received: from mail-ot1-f52.google.com ([209.85.210.52]:41570 "EHLO
        mail-ot1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233645AbhCAIvp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 1 Mar 2021 03:51:45 -0500
Received: by mail-ot1-f52.google.com with SMTP id x9so11388221otp.8
        for <linux-renesas-soc@vger.kernel.org>; Mon, 01 Mar 2021 00:51:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=88mn0US+kUxVp+uc8KTAAvNnNhz+QTYUO9EjV5kMqU0=;
        b=dho//Fd+Q08LxBmtNVeEhNtCEPS8CPdl3KkNkDTqqJo5tVIyuDCubZyz5HBXATeF76
         /Dhl6A8Rpi9m98lVwIOe3hzBmFsA1ztmgNH8BMqm9ZbuUhSLpJzIJm/VUfx8cMdq1gIB
         hV5UgScwf5h5B/TxZd8doS+5UcxT2fqwF0CAvVtvZBRxmPQrejIV7wuJiYg4XDmZvtd2
         9rcctWtfRr2+bFrLB0mX9KYcJY8pbcd2BIn5EuWqFWNiMx4FfRaHsNMsfTITBIZF3cdI
         N4C0RbVxzMnOipafQh2i6feopruPSUDkSHebKOTGKG8zSFKijoa2zA4cs7UDBTwCmHhv
         Z/Jg==
X-Gm-Message-State: AOAM532WDvXg0tHIErUtGsrBPJCnlq/x6PHCvUyf7HS7WUqrV/2dxMIg
        QNQ9hby6bI7bXr8Kn/yZq3ehaV1eRYUhBEd+BVE=
X-Google-Smtp-Source: ABdhPJwsiZO7pYGoUS9AgmjBCaBOsIMP4I71KJzLgA/TvpQLEHHP0LJnYvXC/rR6VVHkpi6DYPCs65tkZ5wW63OvmzE=
X-Received: by 2002:a05:6830:244b:: with SMTP id x11mr11951037otr.19.1614588662023;
 Mon, 01 Mar 2021 00:51:02 -0800 (PST)
MIME-Version: 1.0
References: <1614255382-6377-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdWLBX89R+jZSZSofgL-ONhjFBBdMDwd44Tuu8BY46+GjA@mail.gmail.com>
 <TY2PR01MB369202DF4D3EEC1085F6B00CD89D9@TY2PR01MB3692.jpnprd01.prod.outlook.com>
 <TY2PR01MB3692F86C982DAA22761A3DDBD89A9@TY2PR01MB3692.jpnprd01.prod.outlook.com>
In-Reply-To: <TY2PR01MB3692F86C982DAA22761A3DDBD89A9@TY2PR01MB3692.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 1 Mar 2021 09:50:49 +0100
Message-ID: <CAMuHMdXXBKe8Dzobfwf=L6O9=b5vDo2Z7JLpwPa2SH_cdK_uHA@mail.gmail.com>
Subject: Re: [PATCH v3] arm64: dts: renesas: Add mmc aliases into board dts files
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san,

On Mon, Mar 1, 2021 at 4:13 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> > From: Yoshihiro Shimoda, Sent: Friday, February 26, 2021 10:02 AM
> > > From: Geert Uytterhoeven, Sent: Thursday, February 25, 2021 9:47 PM
> > > On Thu, Feb 25, 2021 at 1:16 PM Yoshihiro Shimoda
> > > <yoshihiro.shimoda.uh@renesas.com> wrote:
> > > > --- a/arch/arm64/boot/dts/renesas/salvator-common.dtsi
> > > > +++ b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
> > > > @@ -36,6 +36,9 @@
> > > >                 serial0 = &scif2;
> > > >                 serial1 = &hscif1;
> > > >                 ethernet0 = &avb;
> > > > +               mmc0 = &sdhi0;
> > > > +               mmc1 = &sdhi2;
> > > > +               mmc2 = &sdhi3;
> > > >         };
> > >
> > > Looks like on Salvator-X(S) the two SD card slots are labeled
> > > SD0 and SD3, so the last one should be mmc3?
> > >
> > > What's most important? Getting the naming right, or matching the
> > > traditional naming?
> >
> > Most important is stable these mmcblkN naming for using it on
> > the "root=" parameter :)
> >
> > I don't have a strong opinion though, IMO, matching the traditional naming
> > is better than board labeled because:
> > - we don't need to add any alias into a board dts if the board is using one
> >   sdhi/eMMC only like r8a77995-draak.dts.
> > - also, the traditional naming is familiar to us.
>
> I'm afraid about changing my mind. But, may I use eMMC channel as mmc0?

“A wise man changes his mind sometimes, but a fool never."

> This mean that I'd like to change the aliases as below.
>
> +               mmc0 = &sdhi2;
> +               mmc1 = &sdhi0;
> +               mmc2 = &sdhi3;
>
> This is because it's easy to imagine mmcblk0 as eMMC
> and super old kernels (v5.4 or or earlier) were probed as mmcblk0
> so that we can use "root=/dev/mmcblk0pN" on the kernel parameter.

Makes sense.  I had a look at my R-Car H3 ES1.0/Salvator-X boot logs,
which shows the following history:

  - v4.7..v4.9-rc8: mmc0 = SD0 mmc1 = SD3
  - v4.8-rc7..v5.4-rc1: mmc0 = eMMC mmc1 = SD0 mmc2 = SD3
  - v5.4-rc3..v5.11-rc7: mmc0 = SD0 mmc1 = eMMC mmc2 = SD3
  - v5.9-rc7..v5.11: mmc0 = SD0 mmc1 = SD3 mmc2 = eMMC

Note that (1) this includes both mainline and development kernels based
on renesas-drivers, and (2) naming could be unstable, hence the
overlapping ranges.

So I'll be waiting for your v4...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
