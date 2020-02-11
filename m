Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F0069158E82
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Feb 2020 13:30:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728801AbgBKMaK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 11 Feb 2020 07:30:10 -0500
Received: from mail.kernel.org ([198.145.29.99]:51908 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728467AbgBKMaK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Feb 2020 07:30:10 -0500
Received: from localhost (unknown [209.37.97.194])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8CD5820714;
        Tue, 11 Feb 2020 12:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1581424209;
        bh=UOl+tQ/zZd+KwI4FO4cTDXiLUcocDiU1LoF+UqO99S4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TyAGYzmBk647Xic8+Af5jY50tMRYt9H5bHtn6wsE10WXBTvj6piI1yGy8Z6MCj+ZS
         ansTqCI6m6WsvLaA3okd2k0EYZxvvCWq6Iq7nJE8mUUSf4uxk4FoLXexYzdDYJU1te
         3efECLAoHJQaFnkycH7+U+jvYJPstPYkJ8I0fcYI=
Date:   Tue, 11 Feb 2020 04:30:09 -0800
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Eugeniu Rosca <erosca@de.adit-jv.com>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Ulrich Hecht <uli+renesas@fpond.eu>,
        "George G . Davis" <george_davis@mentor.com>,
        Andrew Gabbasov <andrew_gabbasov@mentor.com>,
        Jiada Wang <jiada_wang@mentor.com>,
        Yuichi Kusakabe <yuichi.kusakabe@denso-ten.com>,
        Yasushi Asano <yasano@jp.adit-jv.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jiri Slaby <jslaby@suse.com>,
        Fukui Yohhei <yohhei.fukui@denso-ten.com>,
        Torii Kenichi <torii.ken1@jp.fujitsu.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>,
        linux-man@vger.kernel.org
Subject: Re: [PATCH] serial: sh-sci: Support custom speed setting
Message-ID: <20200211123009.GB1858119@kroah.com>
References: <20200129161955.30562-1-erosca@de.adit-jv.com>
 <CAMuHMdWV0kkKq6sKOHsdz+FFGNHphzq_q7rvmYAL=U4fH2H3wQ@mail.gmail.com>
 <20200210205735.GB1347752@kroah.com>
 <CAMuHMdUa0fUHZF03QCLsgvS8LSN_rGUQ1gPtotQ3uNGEHkCm6g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdUa0fUHZF03QCLsgvS8LSN_rGUQ1gPtotQ3uNGEHkCm6g@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Feb 11, 2020 at 09:15:02AM +0100, Geert Uytterhoeven wrote:
> Hi Greg,
> 
> CC man
> 
> On Mon, Feb 10, 2020 at 9:57 PM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
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
> >         http://www.panix.com/~grante/arbitrary-baud.c
> 
> Thanks a lot!!
> This must be one of the most guarded secrets of serial port programming ;-)

It really is, I have to look it up each time it comes up :(

> Implemented since 2006, commit edc6afc5496875a6 ("[PATCH] tty: switch to
> ktermios and new framework"), not documented in today's man-pages.

yeah, serial port control really needs to be documented better, there's
all sorts of nice ways of controlling them that people don't seem to
know about.  I used to have a link to a bunch of online examples, but
can't seem to find that anymore either.  Ugh, another thing for the long
TODO file...

greg k-h
