Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C5492182B99
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Mar 2020 09:55:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726194AbgCLIzF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 12 Mar 2020 04:55:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:37636 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725980AbgCLIzE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Mar 2020 04:55:04 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id AFD3D20578;
        Thu, 12 Mar 2020 08:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584003302;
        bh=z8tXGg7p43hiOHRBmKu5GF7cO2YBA7ZhkgmPMBmqgPk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gOBxrQZxh2mD/SGoHfWSESAS9YFiZPhbQ0h1P8n7W3s7SWueI7qse9R9x7BSifXJf
         4Uz36/r2WEGCXc9JM7Z066xHHYzTbE6Yp3yyTozzFwmgUh0RcJ/+4puma9vfR37/V3
         CULiJLqoJQOTjMYJzkvC9Fbb5s+/5sOaqcbod0fo=
Date:   Thu, 12 Mar 2020 09:55:00 +0100
From:   "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To:     "torii.ken1@fujitsu.com" <torii.ken1@fujitsu.com>
Cc:     "geert@linux-m68k.org" <geert@linux-m68k.org>,
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
Subject: Re: [PATCH] serial: sh-sci: Support custom speed setting
Message-ID: <20200312085500.GA149342@kroah.com>
References: <20200129161955.30562-1-erosca@de.adit-jv.com>
 <CAMuHMdWV0kkKq6sKOHsdz+FFGNHphzq_q7rvmYAL=U4fH2H3wQ@mail.gmail.com>
 <20200210205735.GB1347752@kroah.com>
 <OSBPR01MB29496E76BE5FD0C5BC56D0F0C1FD0@OSBPR01MB2949.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OSBPR01MB29496E76BE5FD0C5BC56D0F0C1FD0@OSBPR01MB2949.jpnprd01.prod.outlook.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Mar 12, 2020 at 05:10:05AM +0000, torii.ken1@fujitsu.com wrote:
> Dear Greg,
> 
> On Tue, 11 Feb 2020 05:57:35 +0900,
> Greg Kroah-Hartman wrote:
> > 
> > On Thu, Jan 30, 2020 at 01:32:50PM +0100, Geert Uytterhoeven wrote:
> > > Hi Eugeniu,
> > > 
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
> > 	http://www.panix.com/~grante/arbitrary-baud.c
> 
> I saw the code above, I thought I wouldn't write such code normally.

Why not?

> >#include <linux/termios.h>
> >
> >int ioctl(int d, int request, ...);
> 
> Do application programmers have to accept this bad code?

I do not understand what you are asking here.

greg k-h
