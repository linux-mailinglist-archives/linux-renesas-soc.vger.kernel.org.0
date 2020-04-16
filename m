Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 927511ABE71
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Apr 2020 12:50:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2505630AbgDPKu1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 16 Apr 2020 06:50:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2505612AbgDPKuL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 Apr 2020 06:50:11 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2A37C061A0C
        for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Apr 2020 03:50:11 -0700 (PDT)
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A454397D;
        Thu, 16 Apr 2020 12:50:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1587034210;
        bh=t1O8p0UcTJfBiTcodTYb+SQlEKiZqcbqKr+1FprtEqs=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=GMkaG6REyfPI1MzraOpP8gW1Ug1qpR1+sKXtx/h08ANzyiQg0G72zRuFaPnzipom/
         ZlFXtPaHooECHI4D076x/kaVGZ3agprOZuBDSJV57YhCnapZwxgTX/8i8e0JisYobI
         3xw9WnwOmBk/lHrLlOx7SCnhw16VVerkyAZIHTb0=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [v8-rc1 15/20] squash! max9286: Disable overlap window
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-renesas-soc@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, niklas.soderlund@ragnatech.se,
        hyunk@xilinx.com, manivannan.sadhasivam@linaro.org
References: <20200416104052.2643098-1-jacopo+renesas@jmondi.org>
 <20200416104052.2643098-16-jacopo+renesas@jmondi.org>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <f5b02b7e-4479-c6ea-1318-ff5bfd1d816b@ideasonboard.com>
Date:   Thu, 16 Apr 2020 11:50:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200416104052.2643098-16-jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Jacopo,

On 16/04/2020 11:40, Jacopo Mondi wrote:
> From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> 
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> 
> ---
> v2:
>   [Jacopo]
>   - Write register 0x63 and 0x64 directly as going through the function
>     breaks RDACM21 operations
> ---
>  drivers/media/i2c/max9286.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
> index 3ef74ba10074..e0c637d4a7de 100644
> --- a/drivers/media/i2c/max9286.c
> +++ b/drivers/media/i2c/max9286.c
> @@ -966,6 +966,18 @@ static int max9286_setup(struct max9286_priv *priv)
>  	max9286_write(priv, 0x0c, MAX9286_HVEN | MAX9286_INVVS |
>  		      MAX9286_HVSRC_D14);
>  
> +	/*
> +	 * The overlap window seems to provide additional validation by tracking
> +	 * the delay between vsync and frame sync, generating an error if the
> +	 * delay is bigger than the programmed window, though it's not yet clear
> +	 * what value should be set.
> +	 *
> +	 * As it's an optional value and can be disabled, we do so by setting
> +	 * a 0 overlap value.

Are you happy to add the following as part of the removal of the function?

	 *
	 * The overlap window is a 13 bit value, and register 0x64 is
	 * shared with ENFSINLAST in BIT(5) which is also set zero.
	 *

> +	 */
> +	max9286_write(priv, 0x63, 0);
> +	max9286_write(priv, 0x64, 0);
> +
>  	/*
>  	 * Wait for 2ms to allow the link to resynchronize after the
>  	 * configuration change.
> 

