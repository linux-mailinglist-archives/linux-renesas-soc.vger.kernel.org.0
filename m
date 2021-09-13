Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 846B3408416
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Sep 2021 07:52:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232041AbhIMFxx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 13 Sep 2021 01:53:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:58546 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230390AbhIMFxx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Sep 2021 01:53:53 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E44C560F4B;
        Mon, 13 Sep 2021 05:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1631512358;
        bh=/CJlH/agN5jb675n1VWpDBk3jgGbQWAhdQoHNfFNYLg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bcbMuXtjNJ4FjQqmmXMAy43R6OM5aj4W/s2YbeNjSakbC2/VZYSdeejyv6XFtrdp3
         jwZakLi6MQSJ+Eu4mRnaZ7p2sPurtDrKp69oEUYKDyG/L/OPFEHMWiK1E+csL4OqqL
         4SLZOAU0V/is2Gkr3B9KwNwfg6bGUIaehidElwgk=
Date:   Mon, 13 Sep 2021 07:52:15 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     balbi@kernel.org, linux-usb@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: legacy: audio: add c_sync parameter
Message-ID: <YT7nD+ToVpe135LU@kroah.com>
References: <20210913024723.1334206-1-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210913024723.1334206-1-yoshihiro.shimoda.uh@renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Sep 13, 2021 at 11:47:23AM +0900, Yoshihiro Shimoda wrote:
> The commit 40c73b30546e ("usb: gadget: f_uac2: add adaptive sync
> support for capture") supported 'c_sync' for configfs file.
> To configure the 'c_sync' via legacy audio driver, add c_sync
> parameter. And then, we can change the 'c_sync' to 'ADAPTIVE' like
> below:
> 
>     modprobe g_audio c_sync=8
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  drivers/usb/gadget/legacy/audio.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/usb/gadget/legacy/audio.c b/drivers/usb/gadget/legacy/audio.c
> index a748ed0842e8..f9765bf63006 100644
> --- a/drivers/usb/gadget/legacy/audio.c
> +++ b/drivers/usb/gadget/legacy/audio.c
> @@ -49,6 +49,11 @@ MODULE_PARM_DESC(c_srate, "Capture Sampling Rate");
>  static int c_ssize = UAC2_DEF_CSSIZE;
>  module_param(c_ssize, uint, S_IRUGO);
>  MODULE_PARM_DESC(c_ssize, "Capture Sample Size(bytes)");
> +
> +/* Capture Default ASYNC */
> +static int c_sync = UAC2_DEF_CSYNC;
> +module_param(c_sync, uint, S_IRUGO);
> +MODULE_PARM_DESC(c_sync, "Capture Sync Type");

Please do not add new module parameters when ever possible.

Why are you adding "new" features to the legacy driver?  Why can you not
just use the newer driver instead if you want this feature?

thanks,

greg k-h
