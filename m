Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDCB53603F8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Apr 2021 10:13:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231594AbhDOINZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 15 Apr 2021 04:13:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:55956 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231491AbhDOINY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Apr 2021 04:13:24 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A29D76113D;
        Thu, 15 Apr 2021 08:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1618474382;
        bh=5VB3MopVYdbx4zWERPF6x1EaQLrVdCynPHD83ady02Q=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=U7mu55ebD1FomjHb3mg9d64G8Z7U2QaypHZvpvoGjuOkeYLDLmckmOyDwOczHZvUJ
         h+EJchQbDpQuZmQgt8kTnJaXq68oK4SuGw13caPNSW7LCSy/OHlTK731q8YVAji7Mv
         GPjkBwYpi0eov1ufhoxyCoTGDVsbuggSey0Z8aI4=
Date:   Thu, 15 Apr 2021 10:12:59 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Ulrich Hecht <uli+renesas@fpond.eu>
Cc:     linux-renesas-soc@vger.kernel.org, linux-serial@vger.kernel.org,
        wsa@kernel.org, geert@linux-m68k.org,
        yoshihiro.shimoda.uh@renesas.com
Subject: Re: [PATCH] serial: sh-sci: remove obsolete latency workaround
Message-ID: <YHf1i00hLCd2/HVE@kroah.com>
References: <20210413084611.27242-1-uli+renesas@fpond.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210413084611.27242-1-uli+renesas@fpond.eu>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Apr 13, 2021 at 10:46:11AM +0200, Ulrich Hecht wrote:
> Since the transition to hrtimers there is no more need to set a minimum
> RX timeout to work around latency issues.
> 
> Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>
> ---
>  drivers/tty/serial/sh-sci.c | 13 +------------
>  1 file changed, 1 insertion(+), 12 deletions(-)

$ ./scripts/get_maintainer.pl --file drivers/tty/serial/sh-sci.c
Greg Kroah-Hartman <gregkh@linuxfoundation.org> (maintainer:SERIAL DRIVERS)
Jiri Slaby <jirislaby@kernel.org> (supporter:TTY LAYER)
linux-serial@vger.kernel.org (open list:SERIAL DRIVERS)
linux-kernel@vger.kernel.org (open list)

{sigh}

Care to resend this and cc: the other developers here?

thanks,

greg k-h
