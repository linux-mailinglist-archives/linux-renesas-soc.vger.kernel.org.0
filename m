Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 82CE77C316
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Jul 2019 15:15:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727124AbfGaNP1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 31 Jul 2019 09:15:27 -0400
Received: from foss.arm.com ([217.140.110.172]:47038 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726339AbfGaNP1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 31 Jul 2019 09:15:27 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B068C344;
        Wed, 31 Jul 2019 06:15:26 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6B5E03F575;
        Wed, 31 Jul 2019 06:15:26 -0700 (PDT)
Received: by e110455-lin.cambridge.arm.com (Postfix, from userid 1000)
        id 2D5EC680205; Wed, 31 Jul 2019 14:15:25 +0100 (BST)
Date:   Wed, 31 Jul 2019 14:15:25 +0100
From:   Liviu Dudau <Liviu.Dudau@arm.com>
To:     "Lowry Li (Arm Technology China)" <Lowry.Li@arm.com>
Cc:     "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>,
        "maarten.lankhorst@linux.intel.com" 
        <maarten.lankhorst@linux.intel.com>,
        "seanpaul@chromium.org" <seanpaul@chromium.org>,
        "airlied@linux.ie" <airlied@linux.ie>,
        "daniel@ffwll.ch" <daniel@ffwll.ch>,
        Brian Starkey <Brian.Starkey@arm.com>,
        "Julien Yin (Arm Technology China)" <Julien.Yin@arm.com>,
        "maxime.ripard@bootlin.com" <maxime.ripard@bootlin.com>,
        "eric@anholt.net" <eric@anholt.net>,
        "kieran.bingham+renesas@ideasonboard.com" 
        <kieran.bingham+renesas@ideasonboard.com>,
        "sean@poorly.run" <sean@poorly.run>,
        "laurent.pinchart@ideasonboard.com" 
        <laurent.pinchart@ideasonboard.com>,
        "Jonathan Chai (Arm Technology China)" <Jonathan.Chai@arm.com>,
        Ayan Halder <Ayan.Halder@arm.com>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>, nd <nd@arm.com>
Subject: Re: [PATCH v1 2/2] drm: Clear the fence pointer when writeback job
 signaled
Message-ID: <20190731131525.vjnkbnbatb5tbuzh@e110455-lin.cambridge.arm.com>
References: <1564571048-15029-1-git-send-email-lowry.li@arm.com>
 <1564571048-15029-3-git-send-email-lowry.li@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1564571048-15029-3-git-send-email-lowry.li@arm.com>
User-Agent: NeoMutt/20180716
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Lowry,

On Wed, Jul 31, 2019 at 11:04:45AM +0000, Lowry Li (Arm Technology China) wrote:
> During it signals the completion of a writeback job, after releasing
> the out_fence, we'd clear the pointer.
> 
> Check if fence left over in drm_writeback_cleanup_job(), release it.
> 
> Signed-off-by: Lowry Li (Arm Technology China) <lowry.li@arm.com>
> ---
>  drivers/gpu/drm/drm_writeback.c | 23 +++++++++++++++--------
>  1 file changed, 15 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_writeback.c b/drivers/gpu/drm/drm_writeback.c
> index ff138b6..43d9e3b 100644
> --- a/drivers/gpu/drm/drm_writeback.c
> +++ b/drivers/gpu/drm/drm_writeback.c
> @@ -324,6 +324,9 @@ void drm_writeback_cleanup_job(struct drm_writeback_job *job)
>  	if (job->fb)
>  		drm_framebuffer_put(job->fb);
>  
> +	if (job->out_fence)
> +		dma_fence_put(job->out_fence);
> +
>  	kfree(job);
>  }

This change looks good.

>  EXPORT_SYMBOL(drm_writeback_cleanup_job);
> @@ -366,25 +369,29 @@ static void cleanup_work(struct work_struct *work)
>  {
>  	unsigned long flags;
>  	struct drm_writeback_job *job;
> +	struct dma_fence *out_fence;
>  
>  	spin_lock_irqsave(&wb_connector->job_lock, flags);
>  	job = list_first_entry_or_null(&wb_connector->job_queue,
>  				       struct drm_writeback_job,
>  				       list_entry);
> -	if (job) {
> +	if (job)
>  		list_del(&job->list_entry);
> -		if (job->out_fence) {
> -			if (status)
> -				dma_fence_set_error(job->out_fence, status);
> -			dma_fence_signal(job->out_fence);
> -			dma_fence_put(job->out_fence);

*Here*

> -		}
> -	}
> +
>  	spin_unlock_irqrestore(&wb_connector->job_lock, flags);
>  
>  	if (WARN_ON(!job))
>  		return;
>  
> +	out_fence = job->out_fence;
> +	if (out_fence) {
> +		if (status)
> +			dma_fence_set_error(out_fence, status);
> +		dma_fence_signal(out_fence);
> +		dma_fence_put(out_fence);
> +		job->out_fence = NULL;
> +	}
> +

I don't get the point of this change. Why not just add job->out_fence = NULL
where *Here* is?

Best regards,
Liviu 

>  	INIT_WORK(&job->cleanup_work, cleanup_work);
>  	queue_work(system_long_wq, &job->cleanup_work);
>  }
> -- 
> 1.9.1
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
