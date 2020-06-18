Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 286FF1FED7F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Jun 2020 10:21:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727121AbgFRIV5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 18 Jun 2020 04:21:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:50904 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727039AbgFRIVy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 18 Jun 2020 04:21:54 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E490E2166E;
        Thu, 18 Jun 2020 08:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592468514;
        bh=/GNoG1njsbggEGIgI3wXL+GAgFcyGekPs/NEVWfrjfo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hhbJGF0ANyFn2NP7ZkK7OQbFP1n+fVi/oko8L8IOKYKBVB+aEUuXJiqs1CzwKAZ9O
         ZbMzencXwqO/Q/G4FK0YPnI2sbZfwb2shdkT7/fAsqGPDqMUhf6+cN4MKlV6soukK4
         rkpsJ2YjWZe876r21UYmMmMByhvYaRx4+kBHGvPI=
Date:   Thu, 18 Jun 2020 10:21:47 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org,
        Jiri Kosina <trivial@kernel.org>,
        "open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 07/17] drivers: usb: Fix trivial spelling
Message-ID: <20200618082147.GA1050104@kroah.com>
References: <20200609124610.3445662-1-kieran.bingham+renesas@ideasonboard.com>
 <20200609124610.3445662-8-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200609124610.3445662-8-kieran.bingham+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Jun 09, 2020 at 01:46:00PM +0100, Kieran Bingham wrote:
> The word 'descriptor' is misspelled throughout the tree.
> 
> Fix it up accordingly:
>     decriptors -> descriptors
> 
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> ---
>  drivers/usb/core/of.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/core/of.c b/drivers/usb/core/of.c
> index 651708d8c908..617e92569b2c 100644
> --- a/drivers/usb/core/of.c
> +++ b/drivers/usb/core/of.c
> @@ -45,7 +45,7 @@ EXPORT_SYMBOL_GPL(usb_of_get_device_node);
>   *
>   * Determine whether a USB device has a so called combined node which is
>   * shared with its sole interface. This is the case if and only if the device
> - * has a node and its decriptors report the following:
> + * has a node and its descriptors report the following:
>   *
>   *	1) bDeviceClass is 0 or 9, and
>   *	2) bNumConfigurations is 1, and
> -- 
> 2.25.1
> 

Already fixed in Linus's tree :(
