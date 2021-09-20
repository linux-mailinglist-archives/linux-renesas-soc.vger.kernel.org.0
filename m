Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE3924115DE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Sep 2021 15:33:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233966AbhITNfU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 20 Sep 2021 09:35:20 -0400
Received: from foss.arm.com ([217.140.110.172]:47756 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232938AbhITNfU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Sep 2021 09:35:20 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4306612FC;
        Mon, 20 Sep 2021 06:33:53 -0700 (PDT)
Received: from [192.168.1.179] (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ECCC83F882;
        Mon, 20 Sep 2021 06:33:51 -0700 (PDT)
Subject: Re: [PATCH 5/9] drm/panfrost: simplify getting .driver_data
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-kernel@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org, Rob Herring <robh@kernel.org>,
        Tomeu Vizoso <tomeu.vizoso@collabora.com>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org
References: <20210920090522.23784-1-wsa+renesas@sang-engineering.com>
 <20210920090522.23784-6-wsa+renesas@sang-engineering.com>
From:   Steven Price <steven.price@arm.com>
Message-ID: <e2e46b06-b013-cbea-6e48-71633d056813@arm.com>
Date:   Mon, 20 Sep 2021 14:33:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210920090522.23784-6-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 20/09/2021 10:05, Wolfram Sang wrote:
> We should get 'driver_data' from 'struct device' directly. Going via
> platform_device is an unneeded step back and forth.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---

Reviewed-by: Steven Price <steven.price@arm.com>

I'll push this to drm-misc-next.

Thanks,

Steve

> 
> Build tested only. buildbot is happy.
> 
>  drivers/gpu/drm/panfrost/panfrost_device.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_device.c b/drivers/gpu/drm/panfrost/panfrost_device.c
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
> 

