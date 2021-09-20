Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C033411354
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Sep 2021 13:06:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232424AbhITLII (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 20 Sep 2021 07:08:08 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:34670 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232382AbhITLII (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Sep 2021 07:08:08 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: alyssa)
        with ESMTPSA id 713FD1F42BA9
Date:   Mon, 20 Sep 2021 07:06:34 -0400
From:   Alyssa Rosenzweig <alyssa@collabora.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Rob Herring <robh@kernel.org>,
        Tomeu Vizoso <tomeu.vizoso@collabora.com>,
        Steven Price <steven.price@arm.com>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 5/9] drm/panfrost: simplify getting .driver_data
Message-ID: <YUhrOueF2hb8o+IA@maud>
References: <20210920090522.23784-1-wsa+renesas@sang-engineering.com>
 <20210920090522.23784-6-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210920090522.23784-6-wsa+renesas@sang-engineering.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Reviewed-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>

> index bd9b7be63b0f..fd4309209088 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_device.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_device.c
> @@ -400,8 +400,7 @@ void panfrost_device_reset(struct panfrost_device *pfdev)
>  #ifdef CONFIG_PM
>  int panfrost_device_resume(struct device *dev)
>  {
> -	struct platform_device *pdev = to_platform_device(dev);
> -	struct panfrost_device *pfdev = platform_get_drvdata(pdev);
> +	struct panfrost_device *pfdev = dev_get_drvdata(dev);
>  
>  	panfrost_device_reset(pfdev);
>  	panfrost_devfreq_resume(pfdev);
> @@ -411,8 +410,7 @@ int panfrost_device_resume(struct device *dev)
>  
>  int panfrost_device_suspend(struct device *dev)
>  {
> -	struct platform_device *pdev = to_platform_device(dev);
> -	struct panfrost_device *pfdev = platform_get_drvdata(pdev);
> +	struct panfrost_device *pfdev = dev_get_drvdata(dev);
>  
>  	if (!panfrost_job_is_idle(pfdev))
>  		return -EBUSY;
> -- 
> 2.30.2
> 
