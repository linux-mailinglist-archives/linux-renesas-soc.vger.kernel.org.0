Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 51960158534
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Feb 2020 22:45:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727546AbgBJVpH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 10 Feb 2020 16:45:07 -0500
Received: from smtp1.de.adit-jv.com ([93.241.18.167]:38312 "EHLO
        smtp1.de.adit-jv.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727003AbgBJVpH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Feb 2020 16:45:07 -0500
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
        by smtp1.de.adit-jv.com (Postfix) with ESMTP id 133413C057F;
        Mon, 10 Feb 2020 22:45:03 +0100 (CET)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
        by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id QURNWDN5PY02; Mon, 10 Feb 2020 22:44:54 +0100 (CET)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by smtp1.de.adit-jv.com (Postfix) with ESMTPS id D36383C0012;
        Mon, 10 Feb 2020 22:44:54 +0100 (CET)
Received: from lxhi-065.adit-jv.com (10.72.93.66) by HI2EXCH01.adit-jv.com
 (10.72.92.24) with Microsoft SMTP Server (TLS) id 14.3.468.0; Mon, 10 Feb
 2020 22:44:54 +0100
Date:   Mon, 10 Feb 2020 22:44:51 +0100
From:   Eugeniu Rosca <erosca@de.adit-jv.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>
CC:     "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
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
        Eugeniu Rosca <roscaeugeniu@gmail.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>
Subject: Re: [PATCH] serial: sh-sci: Support custom speed setting
Message-ID: <20200210214451.GA6104@lxhi-065.adit-jv.com>
References: <20200129161955.30562-1-erosca@de.adit-jv.com>
 <CAMuHMdWV0kkKq6sKOHsdz+FFGNHphzq_q7rvmYAL=U4fH2H3wQ@mail.gmail.com>
 <20200210205735.GB1347752@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200210205735.GB1347752@kroah.com>
X-Originating-IP: [10.72.93.66]
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Dear Geert and Greg,

On Mon, Feb 10, 2020 at 12:57:35PM -0800, Greg Kroah-Hartman wrote:
> On Thu, Jan 30, 2020 at 01:32:50PM +0100, Geert Uytterhoeven wrote:
> > Hi Eugeniu,
> > 
> > On Wed, Jan 29, 2020 at 5:20 PM Eugeniu Rosca <erosca@de.adit-jv.com> wrote:
> > > From: Torii Kenichi <torii.ken1@jp.fujitsu.com>
> > >
> > > This patch is necessary to use BT module and XM module with DENSO TEN
> > > development board.
> > >
> > > This patch supports ASYNC_SPD_CUST flag by ioctl(TIOCSSERIAL), enables
> > > custom speed setting with setserial(1).
> > >
> > > The custom speed is calculated from uartclk and custom_divisor.
> > > If custom_divisor is zero, custom speed setting is invalid.
> > >
> > > Signed-off-by: Torii Kenichi <torii.ken1@jp.fujitsu.com>
> > > [erosca: rebase against v5.5]
> > > Signed-off-by: Eugeniu Rosca <erosca@de.adit-jv.com>
> > 
> > Thanks for your patch!
> > 
> > While this seems to work fine[*], I have a few comments/questions:
> >   1. This feature seems to be deprecated:
> > 
> >          sh-sci e6e68000.serial: setserial sets custom speed on
> > ttySC1. This is deprecated.
> > 
> >   2. As the wanted speed is specified as a divider, the resulting speed
> >      may be off, cfr. the example for 57600 below.
> >      Note that the SCIF device has multiple clock inputs, and can do
> >      57600 perfectly if the right crystal has been fitted.
> > 
> >  3. What to do with "[PATCH/RFC] serial: sh-sci: Update uartclk based
> >      on selected clock" (https://patchwork.kernel.org/patch/11103703/)?
> >      Combined with this, things become pretty complicated and
> >      unpredictable, as uartclk now always reflect the frequency of the
> >      last used base clock, which was the optimal one for the previously
> >      used speed....
> > 
> > I think it would be easier if we just had an API to specify a raw speed.
> > Perhaps that already exists?
> 
> Yes, see:
> 	http://www.panix.com/~grante/arbitrary-baud.c

This looks like a compelling piece of evidence users should stay away
from implementing and using the kludge (38400 baud) mechanism?

Unless the author and the users of this patch (CC-ed in this thread)
have a different opinion, I consider this topic closed. Thanks!

-- 
Best Regards
Eugeniu Rosca
