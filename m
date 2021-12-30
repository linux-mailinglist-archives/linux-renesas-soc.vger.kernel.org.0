Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9483481C10
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Dec 2021 13:30:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239254AbhL3MaZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 30 Dec 2021 07:30:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235404AbhL3MaY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 30 Dec 2021 07:30:24 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 048E1C061574;
        Thu, 30 Dec 2021 04:30:23 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id BFC2EB81C11;
        Thu, 30 Dec 2021 12:30:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC8A5C36AE9;
        Thu, 30 Dec 2021 12:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1640867421;
        bh=Sy6pNp8QtUUsCDO29AwQGmgu/oNOOBEKULszRSt6f3w=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TOocbAB89matda7HUvGOjltsNakNfM4t/g9sPfKPjrPtRc0L0SeNw3v6dSgFBVMHn
         61y3Axcxjoymiceh27Vv/AGcONh5PIkpvr1mIC3AjZtApRcFyIffHvnQC+2zlsBdej
         0KyT9QPv2QyQg1nNx4CM/9HkYNEgEgjR8pXxG+es=
Date:   Thu, 30 Dec 2021 13:30:18 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Magnus Damm <damm@opensource.se>
Cc:     linux-serial@vger.kernel.org, robh@kernel.org,
        geert+renesas@glider.be, linux-renesas-soc@vger.kernel.org,
        wsa+renesas@sang-engineering.com, jirislaby@kernel.org
Subject: Re: [PATCH] serdev: BREAK/FRAME/PARITY/OVERRUN notification
 prototype V2
Message-ID: <Yc2mWlJPNzJodqWl@kroah.com>
References: <163931528842.27756.3665040315954968747.sendpatchset@octo>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <163931528842.27756.3665040315954968747.sendpatchset@octo>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sun, Dec 12, 2021 at 10:21:28PM +0900, Magnus Damm wrote:
> From: Magnus Damm <damm+renesas@opensource.se>
> 
> Allow serdev device drivers get notified by hardware errors such as BREAK,
> FRAME, PARITY and OVERRUN.
> 
> With this patch, in the event of an error detected in the UART device driver
> the serdev_device_driver will get the newly introduced ->error() callback
> invoked if serdev_device_set_error_mask() has previously been used to enable
> the type of error. The errors are taken straight from the TTY layer and fed
> into the serdev_device_driver after filtering out only enabled errors.
> 
> Without this patch the hardware errors never reach the serdev_device_driver.
> 
> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
> ---
> 
>  Applies to linux-5.16-rc4
> 
>  Change since V1:
>  - Use __set_bit() instead of set_bit() in ttyport_receive_buf()
>  - Switch to assign_bit() in ttyport_set_error_mask()
> 
>  Thanks to Geert for feedback!
> 
>  The following prototype patch is using serdev error notifications:
>  [PATCH] r8a77995 Draak SCIF0 LED and KEY Serdev prototype V2

Looks good, now applied to my tty tree.

thanks,

greg k-h
