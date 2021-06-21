Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 214D13AF6AE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Jun 2021 22:11:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231526AbhFUUNS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Jun 2021 16:13:18 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:59874 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231490AbhFUUNR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Jun 2021 16:13:17 -0400
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2BBEA5E17;
        Mon, 21 Jun 2021 22:11:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1624306262;
        bh=o+u/433qK8t33vt08BQlHoou31CmP8DEAHrWGJr/gI8=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=Afe3hXXfkQsDt2mfTR3LweURxUyqBaHUqh0Efj9A8vqc/jDGXrVZSd2j4VeA5s4Gn
         6BcspolCN1I2VHwtn/sR/Kci5eHz4qLKuEgbEAhlR9uvhY2aday270VJvZazrHbOTI
         URGx/oI4RaHuR5LOT40WXHSwHhWAjh0WOF1vGUC4=
Subject: Re: [PATCH] drm: rcar-du: Shutdown the display on system shutdown
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org
References: <20210323001246.16182-1-laurent.pinchart+renesas@ideasonboard.com>
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Message-ID: <87d9607b-f7f7-2ba6-3b4d-c8c9f794484c@ideasonboard.com>
Date:   Mon, 21 Jun 2021 21:10:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210323001246.16182-1-laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent,

On 23/03/2021 00:12, Laurent Pinchart wrote:
> When the system shuts down or warm reboots, the display may be active,
> with the hardware accessing system memory. Upon reboot, the DDR will not
> be accessible, which may cause issues.

Troublesome indeed.

> Implement the platform_driver .shutdown() operation and shut down the
> display to fix this.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Looking in drm_atomic_helper.c, I saw reference to
drm_atomic_helper_shutdown() also being used at driver unload ... so I
was going to ask about that - until I saw "Shutdown the display on
remove" which is in the next 2 patches of my review queue ;-)

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>



> ---
>  drivers/gpu/drm/rcar-du/rcar_du_drv.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> index bfbff90588cb..43de3d8686e8 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> @@ -561,6 +561,13 @@ static int rcar_du_remove(struct platform_device *pdev)
>  	return 0;
>  }
>  
> +static void rcar_du_shutdown(struct platform_device *pdev)
> +{
> +	struct rcar_du_device *rcdu = platform_get_drvdata(pdev);
> +
> +	drm_atomic_helper_shutdown(&rcdu->ddev);
> +}
> +
>  static int rcar_du_probe(struct platform_device *pdev)
>  {
>  	struct rcar_du_device *rcdu;
> @@ -617,6 +624,7 @@ static int rcar_du_probe(struct platform_device *pdev)
>  static struct platform_driver rcar_du_platform_driver = {
>  	.probe		= rcar_du_probe,
>  	.remove		= rcar_du_remove,
> +	.shutdown	= rcar_du_shutdown,
>  	.driver		= {
>  		.name	= "rcar-du",
>  		.pm	= &rcar_du_pm_ops,
> 
