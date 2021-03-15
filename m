Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D26C33C01B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Mar 2021 16:37:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229896AbhCOPhG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 15 Mar 2021 11:37:06 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:37416 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232776AbhCOPgv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 15 Mar 2021 11:36:51 -0400
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 971DF556;
        Mon, 15 Mar 2021 16:36:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1615822609;
        bh=LSgRHQigW940XBd74UXGpNku/xX5Nwf32ClnHtxTU+I=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=vr2327+qXHsLrOSx2Vo/9n8GnxZ8dZtDMSHoVHn1IKm4dUCcIpafXuFmu1yAH7UbR
         naMOCED084DNfoG86QZtOSDR74+kfi5PNxqCP3BbtOxN7zPgh8UDJaHpFW77oS4Etn
         tfRGHaKGChS583NkZ5kbNhFjI1jvd7uvq7dzyVlI=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH v2 04/18] media: i2c: rdacm20: Replace goto with a loop
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20210315131512.133720-1-jacopo+renesas@jmondi.org>
 <20210315131512.133720-5-jacopo+renesas@jmondi.org>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <07c2b414-c437-f78f-f431-ae4dc20308f4@ideasonboard.com>
Date:   Mon, 15 Mar 2021 15:36:45 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210315131512.133720-5-jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Jacopo,

On 15/03/2021 13:14, Jacopo Mondi wrote:
> During the camera module initialization the image sensor PID is read to
> verify it can correctly be identified. The current implementation is
> rather confused and uses a loop implemented with a label and a goto.
> 
> Replace it with a more compact for() loop.
> 
> No functional changes intended.
> 
> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  drivers/media/i2c/rdacm20.c | 29 +++++++++++++----------------
>  1 file changed, 13 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/media/i2c/rdacm20.c b/drivers/media/i2c/rdacm20.c
> index 4d9bac87cba8..e190fd2e611a 100644
> --- a/drivers/media/i2c/rdacm20.c
> +++ b/drivers/media/i2c/rdacm20.c
> @@ -59,6 +59,8 @@
>   */
>  #define OV10635_PIXEL_RATE		(44000000)
>  
> +#define OV10635_PID_TIMEOUT		3
> +
>  static const struct ov10635_reg {
>  	u16	reg;
>  	u8	val;
> @@ -452,7 +454,7 @@ static const struct v4l2_subdev_ops rdacm20_subdev_ops = {
>  
>  static int rdacm20_initialize(struct rdacm20_device *dev)
>  {
> -	unsigned int retry = 3;
> +	unsigned int i;
>  	int ret;
>  
>  	/* Verify communication with the MAX9271: ping to wakeup. */
> @@ -501,23 +503,18 @@ static int rdacm20_initialize(struct rdacm20_device *dev)
>  		return ret;
>  	usleep_range(10000, 15000);
>  
> -again:
> -	ret = ov10635_read16(dev, OV10635_PID);
> -	if (ret < 0) {
> -		if (retry--)
> -			goto again;
> +	for (i = 0; i < OV10635_PID_TIMEOUT; ++i) {
> +		ret = ov10635_read16(dev, OV10635_PID);
> +		if (ret == OV10635_VERSION)
> +			break;
> +		else if (ret >= 0)
> +			/* Sometimes we get a successful read but a wrong id. */

Trivial/nit, I'd have written "but an incorrect ID."

But that's not worthy of any respin.

> +			dev_dbg(dev->dev, "OV10635 ID mismatch (%d)\n", ret);

Thanks, this alleviates my concerns from the previous version.



>  
> -		dev_err(dev->dev, "OV10635 ID read failed (%d)\n",
> -			ret);
> -		return -ENXIO;
> +		usleep_range(1000, 2000);
>  	}
> -
> -	if (ret != OV10635_VERSION) {
> -		if (retry--)
> -			goto again;
> -
> -		dev_err(dev->dev, "OV10635 ID mismatch (0x%04x)\n",
> -			ret);
> +	if (i == OV10635_PID_TIMEOUT) {
> +		dev_err(dev->dev, "OV10635 ID read failed (%d)\n", ret);
>  		return -ENXIO;
>  	}
>  
> 

