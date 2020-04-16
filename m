Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5CCC1ABF71
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Apr 2020 13:35:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2506047AbgDPLep (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 16 Apr 2020 07:34:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2506043AbgDPLEu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 Apr 2020 07:04:50 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0E15C08ED7D
        for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Apr 2020 03:55:58 -0700 (PDT)
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 04FB197D;
        Thu, 16 Apr 2020 12:54:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1587034495;
        bh=jw1XO9hCcekPiItS9M0AAaVosMBBUSGXWJs1Pgk/ejU=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=Im2vvzsti7ri0oL38kyq7o7134rRrPNRPwR+qoOGaEBFpelt4JuokpvvbSnRm/bNY
         vQwmlU/hjWdoPTdcyQug2IaFlpskGD+KZn3WSi+cmF0UXfpnO9+V2h3eKg4vUB+hrs
         MIEyafeLJLRMUrvOGV95S66NyK76xKIEjA7Pf/24=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [v8-rc1 03/20] squash!: max9286: Rebase on latest media/master
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-renesas-soc@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, niklas.soderlund@ragnatech.se,
        hyunk@xilinx.com, manivannan.sadhasivam@linaro.org
References: <20200416104052.2643098-1-jacopo+renesas@jmondi.org>
 <20200416104052.2643098-4-jacopo+renesas@jmondi.org>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <94486b0d-fb88-1ad1-c0f0-cd0a12d83a93@ideasonboard.com>
Date:   Thu, 16 Apr 2020 11:54:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200416104052.2643098-4-jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Jacopo,

On 16/04/2020 11:40, Jacopo Mondi wrote:
> Adapt Kconfig to latest upstream changes
> Fixes: 32a363d0b0b1 ("media: Kconfig files: use select for V4L2 subdevs and MC")

Aha, I hadn't hit this yet, I guess this is part of the move to the
/next/ linux-media/master :-D

Thanks.

Oh - I see - it's just a change in 'policy'.

Well - it matches the tree so ...

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>


> ---
>  drivers/media/i2c/Kconfig | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> index 04186787a2f0..5d810f6f230e 100644
> --- a/drivers/media/i2c/Kconfig
> +++ b/drivers/media/i2c/Kconfig
> @@ -467,8 +467,9 @@ config VIDEO_VPX3220
>  config VIDEO_MAX9286
>  	tristate "Maxim MAX9286 GMSL deserializer support"
>  	depends on I2C && I2C_MUX
> -	depends on VIDEO_V4L2_SUBDEV_API && MEDIA_CONTROLLER
>  	select V4L2_FWNODE
> +	select VIDEO_V4L2_SUBDEV_API
> +	select MEDIA_CONTROLLER
>  	help
>  	  This driver supports the Maxim MAX9286 GMSL deserializer.
>  
> 

