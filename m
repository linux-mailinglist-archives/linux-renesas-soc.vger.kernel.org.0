Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F9853CAE67
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Jul 2021 23:16:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230115AbhGOVTL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 15 Jul 2021 17:19:11 -0400
Received: from fgw20-7.mail.saunalahti.fi ([62.142.5.81]:65297 "EHLO
        fgw20-7.mail.saunalahti.fi" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229591AbhGOVTL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Jul 2021 17:19:11 -0400
Received: from localhost (88-115-248-186.elisa-laajakaista.fi [88.115.248.186])
        by fgw20.mail.saunalahti.fi (Halon) with ESMTP
        id e12a8b70-e5b1-11eb-ba24-005056bd6ce9;
        Fri, 16 Jul 2021 00:16:15 +0300 (EEST)
Date:   Fri, 16 Jul 2021 00:16:11 +0300
From:   andy@surfacebook.localdomain
To:     "ashiduka@fujitsu.com" <ashiduka@fujitsu.com>
Cc:     'Geert Uytterhoeven' <geert@linux-m68k.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
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
        "magnus.damm@gmail.com" <magnus.damm@gmail.com>,
        "torii.ken1@fujitsu.com" <torii.ken1@fujitsu.com>
Subject: Re: [PATCH] serial: sh-sci: Support custom speed setting
Message-ID: <YPClm+OPLVhlhgdm@surfacebook.localdomain>
References: <20200129161955.30562-1-erosca@de.adit-jv.com>
 <CAMuHMdWV0kkKq6sKOHsdz+FFGNHphzq_q7rvmYAL=U4fH2H3wQ@mail.gmail.com>
 <20200210205735.GB1347752@kroah.com>
 <OSBPR01MB29496E76BE5FD0C5BC56D0F0C1FD0@OSBPR01MB2949.jpnprd01.prod.outlook.com>
 <CAMuHMdXYPG8t=vBn6c2B=8TwbWJfFCjW8peDLgHBwW_AxpH5Hw@mail.gmail.com>
 <OSBPR01MB50612C6EF774733B3496AECADFFD0@OSBPR01MB5061.jpnprd01.prod.outlook.com>
 <OSBPR01MB506141BA2FDD08FE11FC4DEBDFCB0@OSBPR01MB5061.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <OSBPR01MB506141BA2FDD08FE11FC4DEBDFCB0@OSBPR01MB5061.jpnprd01.prod.outlook.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Mon, Mar 30, 2020 at 07:43:09AM +0000, ashiduka@fujitsu.com kirjoitti:
> Dear Greg, Geert,
> 
> > Right.
> > Adding "#include <sys/ioctl.h>" to Greg's sample code causes a
> > compilation error.
> <snip>
> > Is it normal to declare ioctl() without "#include <sys/ioctl.h>" ?
> 
> I would be happy if you could give me some comments.
> 
> > http://www.panix.com/~grante/arbitrary-baud.c
> 
> We think this sample code is no good.
> Should I work on glibc changes instead of kernel fixes?

Side note: I hope introducing spd_cust hack hadn't made upstream.

To the point. Use BOTHER as in code excerpt. Yes, there is a problematic parts
with the headers regarding to this feature. But you may look how others solve
it.

https://github.com/npat-efault/picocom/blob/master/termios2.txt

> > Subject: RE: [PATCH] serial: sh-sci: Support custom speed setting
> > 
> > Dear Greg, Geert,
> > 
> > > I guess you mean the forward declaration of ioctrl()?
> > > No, they should include <sys/ioctl.h> instead.
> > 
> > Right.
> > Adding "#include <sys/ioctl.h>" to Greg's sample code causes a
> > compilation error.
> > 
> > > > I saw the code above, I thought I wouldn't write such code
> > normally.
> > > Why not?
> > 
> > Is it normal to declare ioctl() without "#include <sys/ioctl.h>" ?
> > 
> > Thanks & Best Regards,
> > Yuusuke Ashiduka <ashiduka@fujitsu.com>
> > Embedded System Development Dept. Embedded System Development Div.
> > FUJITSU COMPUTER TECHNOLOGIES Ltd.
> > 
> > > -----Original Message-----
> > > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > > Sent: Thursday, March 12, 2020 6:03 PM
> > > To: Torii, Kenichi/鳥居 健一 <torii.ken1@fujitsu.com>
> > > Cc: gregkh@linuxfoundation.org; erosca@de.adit-jv.com;
> > > linux-serial@vger.kernel.org;
> > linux-renesas-soc@vger.kernel.org;
> > > wsa+renesas@sang-engineering.com;
> > > yoshihiro.shimoda.uh@renesas.com; uli+renesas@fpond.eu;
> > > george_davis@mentor.com; andrew_gabbasov@mentor.com;
> > > jiada_wang@mentor.com; yuichi.kusakabe@denso-ten.com;
> > > yasano@jp.adit-jv.com; linux-kernel@vger.kernel.org;
> > > jslaby@suse.com; yohhei.fukui@denso-ten.com; Ashizuka, Yuusuke/
> > > 芦塚 雄介 <ashiduka@fujitsu.com>; magnus.damm@gmail.com
> > > Subject: Re: [PATCH] serial: sh-sci: Support custom speed setting
> > >
> > > Hi Torii-san,
> > >
> > > On Thu, Mar 12, 2020 at 6:10 AM torii.ken1@fujitsu.com
> > > <torii.ken1@fujitsu.com> wrote:
> > > > On Tue, 11 Feb 2020 05:57:35 +0900,
> > > > Greg Kroah-Hartman wrote:
> > > > > On Thu, Jan 30, 2020 at 01:32:50PM +0100, Geert Uytterhoeven
> > > wrote:
> > > > > > On Wed, Jan 29, 2020 at 5:20 PM Eugeniu Rosca
> > > <erosca@de.adit-jv.com> wrote:
> > > > > > > From: Torii Kenichi <torii.ken1@jp.fujitsu.com>
> > > > > > >
> > > > > > > This patch is necessary to use BT module and XM module
> > with
> > > DENSO TEN
> > > > > > > development board.
> > > > > > >
> > > > > > > This patch supports ASYNC_SPD_CUST flag by
> > ioctl(TIOCSSERIAL),
> > > enables
> > > > > > > custom speed setting with setserial(1).
> > > > > > >
> > > > > > > The custom speed is calculated from uartclk and
> > > custom_divisor.
> > > > > > > If custom_divisor is zero, custom speed setting is invalid.
> > > > > > >
> > > > > > > Signed-off-by: Torii Kenichi <torii.ken1@jp.fujitsu.com>
> > > > > > > [erosca: rebase against v5.5]
> > > > > > > Signed-off-by: Eugeniu Rosca <erosca@de.adit-jv.com>
> > > > > >
> > > > > > Thanks for your patch!
> > > > > >
> > > > > > While this seems to work fine[*], I have a few
> > > comments/questions:
> > > > > >   1. This feature seems to be deprecated:
> > > > > >
> > > > > >          sh-sci e6e68000.serial: setserial sets custom speed
> > > on
> > > > > > ttySC1. This is deprecated.
> > > > > >
> > > > > >   2. As the wanted speed is specified as a divider, the
> > resulting
> > > speed
> > > > > >      may be off, cfr. the example for 57600 below.
> > > > > >      Note that the SCIF device has multiple clock inputs,
> > and
> > > can do
> > > > > >      57600 perfectly if the right crystal has been fitted.
> > > > > >
> > > > > >  3. What to do with "[PATCH/RFC] serial: sh-sci: Update
> > uartclk
> > > based
> > > > > >      on selected clock"
> > > (https://patchwork.kernel.org/patch/11103703/)?
> > > > > >      Combined with this, things become pretty complicated
> > and
> > > > > >      unpredictable, as uartclk now always reflect the
> > frequency
> > > of the
> > > > > >      last used base clock, which was the optimal one for the
> > > previously
> > > > > >      used speed....
> > > > > >
> > > > > > I think it would be easier if we just had an API to specify
> > > a raw speed.
> > > > > > Perhaps that already exists?
> > > > >
> > > > > Yes, see:
> > > > >       http://www.panix.com/~grante/arbitrary-baud.c
> > > >
> > > > I saw the code above, I thought I wouldn't write such code
> > normally.
> > > >
> > > > >#include <linux/termios.h>
> > > > >
> > > > >int ioctl(int d, int request, ...);
> > > >
> > > > Do application programmers have to accept this bad code?
> > >
> > > I guess you mean the forward declaration of ioctrl()?
> > > No, they should include <sys/ioctl.h> instead.
> > >
> > > Gr{oetje,eeting}s,
> > >
> > >                         Geert
> > >
> > > --
> > > Geert Uytterhoeven -- There's lots of Linux beyond ia32 --
> > > geert@linux-m68k.org
> > >
> > > In personal conversations with technical people, I call myself
> > a
> > > hacker. But
> > > when I'm talking to journalists I just say "programmer" or
> > something
> > > like that.
> > >                                 -- Linus Torvalds

-- 
With Best Regards,
Andy Shevchenko


