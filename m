Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DA2BC182BCE
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Mar 2020 10:03:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726099AbgCLJD0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 12 Mar 2020 05:03:26 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:40967 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725980AbgCLJD0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Mar 2020 05:03:26 -0400
Received: by mail-ot1-f66.google.com with SMTP id s15so5304000otq.8;
        Thu, 12 Mar 2020 02:03:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pcqqOkF47Er9rA3HRF63y15rDeiBnLWeD7fktteNLOs=;
        b=kjHndIYH3dDb4ZAnrK7tnaOk44t/NSsm8rN/9dtFBzXPfHyZFfj7mqidpYUPIIGDaD
         57S9aAlUDqOnf3iQG0fsfYlyMISoVktm8TsK1fZCODtxQAeA2idathLrHYlk3SHZaiUr
         TzhK6BkHLAtBhaAvdhCh1GcgKjftIUydGPwMyUQuw4UsLeVF0yOFnlQTkYExXloLrojH
         72fhpmhUUeQMp9dNBRUQVaLM/lnMGvvehDL5qqFs73Rslwmf23ed3QRrueyKHp/F1h6X
         kct5Ricq+dDQ3NaNhtQsa4KPUACVICBf7gMQ7bO4PU/4GXiUUqof/6ZE4/OmufYqvn/T
         l08g==
X-Gm-Message-State: ANhLgQ0Cnn7JmHgvDoBI8LhggaTZ134KStdmpI2rGaqLn4xcXi86crz/
        ShAdcbB1CzPz8HcRuYoFuS6WqvlTO/zcl08BECc=
X-Google-Smtp-Source: ADFU+vuqRv/msI6FIPxofSR85RYexCgGBztJMSn0nVO9TKf0PXVAe6MlC96Q9T8bKTzZ7kmVzB3HK2f6BgUHFfRhLgk=
X-Received: by 2002:a9d:1708:: with SMTP id i8mr5511068ota.250.1584003805625;
 Thu, 12 Mar 2020 02:03:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200129161955.30562-1-erosca@de.adit-jv.com> <CAMuHMdWV0kkKq6sKOHsdz+FFGNHphzq_q7rvmYAL=U4fH2H3wQ@mail.gmail.com>
 <20200210205735.GB1347752@kroah.com> <OSBPR01MB29496E76BE5FD0C5BC56D0F0C1FD0@OSBPR01MB2949.jpnprd01.prod.outlook.com>
In-Reply-To: <OSBPR01MB29496E76BE5FD0C5BC56D0F0C1FD0@OSBPR01MB2949.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 12 Mar 2020 10:03:13 +0100
Message-ID: <CAMuHMdXYPG8t=vBn6c2B=8TwbWJfFCjW8peDLgHBwW_AxpH5Hw@mail.gmail.com>
Subject: Re: [PATCH] serial: sh-sci: Support custom speed setting
To:     "torii.ken1@fujitsu.com" <torii.ken1@fujitsu.com>
Cc:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "erosca@de.adit-jv.com" <erosca@de.adit-jv.com>,
        "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "wsa+renesas@sang-engineering.com" <wsa+renesas@sang-engineering.com>,
        "yoshihiro.shimoda.uh@renesas.com" <yoshihiro.shimoda.uh@renesas.com>,
        "uli+renesas@fpond.eu" <uli+renesas@fpond.eu>,
        "george_davis@mentor.com" <george_davis@mentor.com>,
        "andrew_gabbasov@mentor.com" <andrew_gabbasov@mentor.com>,
        "jiada_wang@mentor.com" <jiada_wang@mentor.com>,
        "yuichi.kusakabe@denso-ten.com" <yuichi.kusakabe@denso-ten.com>,
        "yasano@jp.adit-jv.com" <yasano@jp.adit-jv.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "jslaby@suse.com" <jslaby@suse.com>,
        "yohhei.fukui@denso-ten.com" <yohhei.fukui@denso-ten.com>,
        "ashiduka@fujitsu.com" <ashiduka@fujitsu.com>,
        "magnus.damm@gmail.com" <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Torii-san,

On Thu, Mar 12, 2020 at 6:10 AM torii.ken1@fujitsu.com
<torii.ken1@fujitsu.com> wrote:
> On Tue, 11 Feb 2020 05:57:35 +0900,
> Greg Kroah-Hartman wrote:
> > On Thu, Jan 30, 2020 at 01:32:50PM +0100, Geert Uytterhoeven wrote:
> > > On Wed, Jan 29, 2020 at 5:20 PM Eugeniu Rosca <erosca@de.adit-jv.com> wrote:
> > > > From: Torii Kenichi <torii.ken1@jp.fujitsu.com>
> > > >
> > > > This patch is necessary to use BT module and XM module with DENSO TEN
> > > > development board.
> > > >
> > > > This patch supports ASYNC_SPD_CUST flag by ioctl(TIOCSSERIAL), enables
> > > > custom speed setting with setserial(1).
> > > >
> > > > The custom speed is calculated from uartclk and custom_divisor.
> > > > If custom_divisor is zero, custom speed setting is invalid.
> > > >
> > > > Signed-off-by: Torii Kenichi <torii.ken1@jp.fujitsu.com>
> > > > [erosca: rebase against v5.5]
> > > > Signed-off-by: Eugeniu Rosca <erosca@de.adit-jv.com>
> > >
> > > Thanks for your patch!
> > >
> > > While this seems to work fine[*], I have a few comments/questions:
> > >   1. This feature seems to be deprecated:
> > >
> > >          sh-sci e6e68000.serial: setserial sets custom speed on
> > > ttySC1. This is deprecated.
> > >
> > >   2. As the wanted speed is specified as a divider, the resulting speed
> > >      may be off, cfr. the example for 57600 below.
> > >      Note that the SCIF device has multiple clock inputs, and can do
> > >      57600 perfectly if the right crystal has been fitted.
> > >
> > >  3. What to do with "[PATCH/RFC] serial: sh-sci: Update uartclk based
> > >      on selected clock" (https://patchwork.kernel.org/patch/11103703/)?
> > >      Combined with this, things become pretty complicated and
> > >      unpredictable, as uartclk now always reflect the frequency of the
> > >      last used base clock, which was the optimal one for the previously
> > >      used speed....
> > >
> > > I think it would be easier if we just had an API to specify a raw speed.
> > > Perhaps that already exists?
> >
> > Yes, see:
> >       http://www.panix.com/~grante/arbitrary-baud.c
>
> I saw the code above, I thought I wouldn't write such code normally.
>
> >#include <linux/termios.h>
> >
> >int ioctl(int d, int request, ...);
>
> Do application programmers have to accept this bad code?

I guess you mean the forward declaration of ioctrl()?
No, they should include <sys/ioctl.h> instead.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
