Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26BED482401
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 31 Dec 2021 13:43:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230166AbhLaMnF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 31 Dec 2021 07:43:05 -0500
Received: from sin.source.kernel.org ([145.40.73.55]:50410 "EHLO
        sin.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229519AbhLaMnF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 31 Dec 2021 07:43:05 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 12DAECE1D47;
        Fri, 31 Dec 2021 12:43:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 656E4C36AEB;
        Fri, 31 Dec 2021 12:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1640954582;
        bh=0/Hsv9jqcCsD82QyEdJOXpq8W14oea2nCwnX4Xg1esM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fiw2vfBppXJMDQeIdVPQhA50lxP9vVC6d55fKBor2xwDFQf23XBVUa4Fxts6LnSnG
         Ucafce0ux36JKQSReEpQOdMOXxI7lpiEqYeXAFcz+0OXcgWZbkhaHqMDMOE+rDj5mc
         2NSRa6O+r7OTs8lHnEhqn0a2sNYuhmsSKeMO1E/c=
Date:   Fri, 31 Dec 2021 13:42:58 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     Magnus Damm <damm@opensource.se>, linux-serial@vger.kernel.org,
        robh@kernel.org, geert+renesas@glider.be,
        linux-renesas-soc@vger.kernel.org,
        wsa+renesas@sang-engineering.com, jirislaby@kernel.org
Subject: Re: [PATCH] serdev: BREAK/FRAME/PARITY/OVERRUN notification
 prototype V2
Message-ID: <Yc760m+/mXsuVo1h@kroah.com>
References: <163931528842.27756.3665040315954968747.sendpatchset@octo>
 <Yc2mWlJPNzJodqWl@kroah.com>
 <Yc7oZ/1tu95Z4wPS@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yc7oZ/1tu95Z4wPS@hovoldconsulting.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Dec 31, 2021 at 12:24:23PM +0100, Johan Hovold wrote:
> On Thu, Dec 30, 2021 at 01:30:18PM +0100, Greg Kroah-Hartman wrote:
> > On Sun, Dec 12, 2021 at 10:21:28PM +0900, Magnus Damm wrote:
> > > From: Magnus Damm <damm+renesas@opensource.se>
> > > 
> > > Allow serdev device drivers get notified by hardware errors such as BREAK,
> > > FRAME, PARITY and OVERRUN.
> > > 
> > > With this patch, in the event of an error detected in the UART device driver
> > > the serdev_device_driver will get the newly introduced ->error() callback
> > > invoked if serdev_device_set_error_mask() has previously been used to enable
> > > the type of error. The errors are taken straight from the TTY layer and fed
> > > into the serdev_device_driver after filtering out only enabled errors.
> > > 
> > > Without this patch the hardware errors never reach the serdev_device_driver.
> > > 
> > > Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
> > > ---
> > > 
> > >  Applies to linux-5.16-rc4
> > > 
> > >  Change since V1:
> > >  - Use __set_bit() instead of set_bit() in ttyport_receive_buf()
> > >  - Switch to assign_bit() in ttyport_set_error_mask()
> > > 
> > >  Thanks to Geert for feedback!
> > > 
> > >  The following prototype patch is using serdev error notifications:
> > >  [PATCH] r8a77995 Draak SCIF0 LED and KEY Serdev prototype V2
> > 
> > Looks good, now applied to my tty tree.
> 
> I really don't think this is ready to be merged. There's been no
> discussion about the design of this interface and importantly there are
> no users (there was an RFC floating around but that one too has issues).
> 
> Some of the problems with this patch include:
> 
>  - performance penalty for all serdev drivers due to unconditional per
>    character processing
>  - flagged characters are still being forwarded to the consumer (e.g.
>    NUL chars inserted on breaks)
>  - it only works with some broken serial drivers which do not honour
>    TTY_DRIVER_REAL_RAW
>  - interface basically limited to the hacky led/input driver mentioned
>    above since it does not match flags with characters
> 
> I suggest reverting for now.

No problem, will go revert it right now, thanks for looking at it.

greg k-h
