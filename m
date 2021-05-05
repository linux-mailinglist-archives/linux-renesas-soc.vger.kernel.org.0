Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FA8D373851
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 May 2021 12:04:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232381AbhEEKFm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 5 May 2021 06:05:42 -0400
Received: from mslow1.mail.gandi.net ([217.70.178.240]:58429 "EHLO
        mslow1.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232490AbhEEKFg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 May 2021 06:05:36 -0400
Received: from relay9-d.mail.gandi.net (unknown [217.70.183.199])
        by mslow1.mail.gandi.net (Postfix) with ESMTP id 9334DDF7AB
        for <linux-renesas-soc@vger.kernel.org>; Wed,  5 May 2021 09:55:50 +0000 (UTC)
X-Originating-IP: 93.61.96.190
Received: from uno.localdomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
        (Authenticated sender: jacopo@jmondi.org)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id AE699FF809;
        Wed,  5 May 2021 09:55:24 +0000 (UTC)
Date:   Wed, 5 May 2021 11:56:08 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [PATCH 14/25] media: renesas-ceu: Properly check for PM errors
Message-ID: <20210505095608.cpe45sljqkyeyeez@uno.localdomain>
References: <cover.1620207353.git.mchehab+huawei@kernel.org>
 <c3b5546444a33840c569e9b7b968f5f81db96ac0.1620207353.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c3b5546444a33840c569e9b7b968f5f81db96ac0.1620207353.git.mchehab+huawei@kernel.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Mauro,

On Wed, May 05, 2021 at 11:42:04AM +0200, Mauro Carvalho Chehab wrote:
> Right now, the driver just assumes that PM runtime resume
> worked, but it may fail.
>
> Well, the pm_runtime_get_sync() internally increments the
> dev->power.usage_count without decrementing it, even on errors.
>
> So, using it is tricky. Let's replace it by the new
> pm_runtime_resume_and_get(), introduced by:
> commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
> and return an error if something bad happens.
>
> This should ensure that the PM runtime usage_count will be
> properly decremented if an error happens at open time.
>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Looks good!
Acked-by: Jacopo Mondi <jacopo@jmondi.org>

Thanks
  j

> ---
>  drivers/media/platform/renesas-ceu.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/platform/renesas-ceu.c b/drivers/media/platform/renesas-ceu.c
> index cd137101d41e..17f01b6e3fe0 100644
> --- a/drivers/media/platform/renesas-ceu.c
> +++ b/drivers/media/platform/renesas-ceu.c
> @@ -1099,10 +1099,10 @@ static int ceu_open(struct file *file)
>
>  	mutex_lock(&ceudev->mlock);
>  	/* Causes soft-reset and sensor power on on first open */
> -	pm_runtime_get_sync(ceudev->dev);
> +	ret = pm_runtime_resume_and_get(ceudev->dev);
>  	mutex_unlock(&ceudev->mlock);
>
> -	return 0;
> +	return ret;
>  }
>
>  static int ceu_release(struct file *file)
> --
> 2.30.2
>
