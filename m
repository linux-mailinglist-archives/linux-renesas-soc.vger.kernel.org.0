Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1AD248239C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 31 Dec 2021 12:24:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229687AbhLaLYb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 31 Dec 2021 06:24:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229674AbhLaLYb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 31 Dec 2021 06:24:31 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE450C061574;
        Fri, 31 Dec 2021 03:24:30 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0F72C617AD;
        Fri, 31 Dec 2021 11:24:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6ABE4C36AEB;
        Fri, 31 Dec 2021 11:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1640949868;
        bh=2VTOJRtDMdVNyE75VvyrYmBuOhvMbF0tnHHfgiVwjvA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hQQ3rkYXw6c9OAdBw37Vg0a13g9L9wHhNkCyGpy1eYWx0mT087BlbzGLRJ/dTP5bP
         TSVI7EB2ALZoLhBN0hUFwUiS5K+vTTs5CI8y0/2fXWtg/Hc3hvuFQA8GcNM2AatQNL
         VPH7XlfPs1jyyjg0a1MGleMIKlr/5zpMtSwS/Mdq04dQq+PxosrABCVJhv/E7CBdI6
         nYk15/PpE9A7K4Sz9GQcXyPL6x+e4bwPcbU+jfomB2HrWFQRwKWoT9HKphKrM9BTwq
         +iJzzmNr8zKsNAjshdeoJx8cHRz1I4BPU332u/IP4OvuiLi0H4XJEYZQtihGPmaFmj
         t+cTsOp91mfqA==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1n3G1H-0001fq-Cj; Fri, 31 Dec 2021 12:24:24 +0100
Date:   Fri, 31 Dec 2021 12:24:23 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Magnus Damm <damm@opensource.se>, linux-serial@vger.kernel.org,
        robh@kernel.org, geert+renesas@glider.be,
        linux-renesas-soc@vger.kernel.org,
        wsa+renesas@sang-engineering.com, jirislaby@kernel.org
Subject: Re: [PATCH] serdev: BREAK/FRAME/PARITY/OVERRUN notification
 prototype V2
Message-ID: <Yc7oZ/1tu95Z4wPS@hovoldconsulting.com>
References: <163931528842.27756.3665040315954968747.sendpatchset@octo>
 <Yc2mWlJPNzJodqWl@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yc2mWlJPNzJodqWl@kroah.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Dec 30, 2021 at 01:30:18PM +0100, Greg Kroah-Hartman wrote:
> On Sun, Dec 12, 2021 at 10:21:28PM +0900, Magnus Damm wrote:
> > From: Magnus Damm <damm+renesas@opensource.se>
> > 
> > Allow serdev device drivers get notified by hardware errors such as BREAK,
> > FRAME, PARITY and OVERRUN.
> > 
> > With this patch, in the event of an error detected in the UART device driver
> > the serdev_device_driver will get the newly introduced ->error() callback
> > invoked if serdev_device_set_error_mask() has previously been used to enable
> > the type of error. The errors are taken straight from the TTY layer and fed
> > into the serdev_device_driver after filtering out only enabled errors.
> > 
> > Without this patch the hardware errors never reach the serdev_device_driver.
> > 
> > Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
> > ---
> > 
> >  Applies to linux-5.16-rc4
> > 
> >  Change since V1:
> >  - Use __set_bit() instead of set_bit() in ttyport_receive_buf()
> >  - Switch to assign_bit() in ttyport_set_error_mask()
> > 
> >  Thanks to Geert for feedback!
> > 
> >  The following prototype patch is using serdev error notifications:
> >  [PATCH] r8a77995 Draak SCIF0 LED and KEY Serdev prototype V2
> 
> Looks good, now applied to my tty tree.

I really don't think this is ready to be merged. There's been no
discussion about the design of this interface and importantly there are
no users (there was an RFC floating around but that one too has issues).

Some of the problems with this patch include:

 - performance penalty for all serdev drivers due to unconditional per
   character processing
 - flagged characters are still being forwarded to the consumer (e.g.
   NUL chars inserted on breaks)
 - it only works with some broken serial drivers which do not honour
   TTY_DRIVER_REAL_RAW
 - interface basically limited to the hacky led/input driver mentioned
   above since it does not match flags with characters

I suggest reverting for now.

Johan
