Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7DF63C5FA2
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Jul 2021 17:45:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233922AbhGLPsJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 12 Jul 2021 11:48:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233166AbhGLPsJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 12 Jul 2021 11:48:09 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 720B0C0613DD
        for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Jul 2021 08:45:19 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id q16so7925701lfa.5
        for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Jul 2021 08:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=3GNvIH6j09xn0UtxxsHhKVyd4bEJY1cjA3GME8Lc8HI=;
        b=QCfuS/XYtlCppa+2qMm54M+hT6v31+LtSjps+wO6F+Wco1guXqwJhgIH0o49Eqr3wl
         eIoIBfG5Mkq6Owac8YIbFIZlTf4pJ9jUmfnS2TEEAccmYrLFt+5FvJiYZcAqwpQ+iENL
         c0TDqdeTNWzCrc9TZKnSDisBU0lZ3FAa5unjwuKFEAPwVsi1ydIffTL3u/fvdapMVz/R
         D4bAr+GtTZ/d2D6IWoFWrRckimXYPRXltfvaWqRBE4x8RAWxdcgmOFjidJEpd8Ke1rx6
         QW8iJclLAOGmtmPNszsuCBG1qgirzFWBxVomAqnVXoQ5M5FEG4HV+iM5nZqL8G0y4T/I
         l7XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=3GNvIH6j09xn0UtxxsHhKVyd4bEJY1cjA3GME8Lc8HI=;
        b=ekuHlq0zg/OsaqhI2u5/Q5ZOGW7AGEMBwgP0TaPeHUoYPqa5cWYZOYbkOuYp2sdFW2
         V0iJHVnRAgihktICi/YPoq+u2kcplPF1i5BT1AW8eFA8U5T26brqpKKKY2Nkc8FdaK6d
         XG+u6QdPMYxAQgCs9zsEv5Y+ALFprzwChV0VAYle5q9U5J0wdlECzClFulabgJdBYyaH
         Az013GM5L/NG4Dn9CGq62YG9qIZJMtaNhwbCRSF1KNwdghRTvfg2fea4xNoOCY6KSJ5M
         nu5Gg0B/6IZxA9f7fRi9UB7zF/BOmE2wCB5EQLbodHWZXGauY7bTsYPRb/snCE0TPY6Q
         6HQg==
X-Gm-Message-State: AOAM532yhmtVhytY3nApHPkKIDqDjbqKyz4I/as3pHuddu8TOigxpnN4
        zoTm4BUzMUpk8XebHwnqdcfqpdv3q8I=
X-Google-Smtp-Source: ABdhPJyJVskDrBRGSJZYKAo0ZdxTWrid0o2++dvWaMkvyHpvDLQmrMRqPq9ED/dwh5FVhcEKt4KPaQ==
X-Received: by 2002:a05:6512:16a6:: with SMTP id bu38mr40200056lfb.92.1626104717618;
        Mon, 12 Jul 2021 08:45:17 -0700 (PDT)
Received: from [192.168.1.102] ([178.176.79.81])
        by smtp.gmail.com with ESMTPSA id v18sm630572lfp.194.2021.07.12.08.45.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jul 2021 08:45:17 -0700 (PDT)
Subject: Re: [PATCH] drm/shmobile: Convert to Linux IRQ interfaces
To:     Thomas Zimmermann <tzimmermann@suse.de>,
        laurent.pinchart@ideasonboard.com,
        kieran.bingham+renesas@ideasonboard.com, airlied@linux.ie,
        daniel@ffwll.ch
Cc:     dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
References: <20210706074900.8928-1-tzimmermann@suse.de>
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Message-ID: <b4db77fd-4526-8a09-04ee-272d90977cb4@gmail.com>
Date:   Mon, 12 Jul 2021 18:45:15 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210706074900.8928-1-tzimmermann@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 7/6/21 10:49 AM, Thomas Zimmermann wrote:

> Drop the DRM IRQ midlayer in favor of Linux IRQ interfaces. DRM's
> IRQ helpers are mostly useful for UMS drivers. Modern KMS drivers
> don't benefit from using it.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/shmobile/shmob_drm_drv.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/shmobile/shmob_drm_drv.c b/drivers/gpu/drm/shmobile/shmob_drm_drv.c
> index 0a02b7092c04..032a2fff5efd 100644
> --- a/drivers/gpu/drm/shmobile/shmob_drm_drv.c
> +++ b/drivers/gpu/drm/shmobile/shmob_drm_drv.c
[...]
> @@ -258,7 +256,7 @@ static int shmob_drm_probe(struct platform_device *pdev)
>  		goto err_modeset_cleanup;
>  	}
>  
> -	ret = drm_irq_install(ddev, platform_get_irq(pdev, 0));
> +	ret = request_irq(platform_get_irq(pdev, 0), shmob_drm_irq, 0, ddev->driver->name, ddev);

   You can't call request_irq() on the result of platfrom_get_irq(), you need to check ifq >= 0 first!
You really need a local (or even global) variable for the IRQ #...

[...]

MBR, Sergei
