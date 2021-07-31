Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76A913DC588
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 31 Jul 2021 12:14:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232616AbhGaKOV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 31 Jul 2021 06:14:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233016AbhGaKOT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 31 Jul 2021 06:14:19 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C467FC0617A1;
        Sat, 31 Jul 2021 03:13:18 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id u20so16381874ljo.0;
        Sat, 31 Jul 2021 03:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=OZPudOm1n3Y0XK4jpf40ZUtCnIltLVwQU7PwAg/PlfY=;
        b=DRZznyy8033aJy2PoYq1zVwec5R6Eceg1j5V48MBWbNB0iv7w7ORqdtrgcv2QjX+V6
         Rvia4WqY0iJvNvsVcXOBk1t1TkUQWAlDoP3RQJGlc2kRUdxSAf84hmkUAQNFShMPuq27
         eS9BN6ie7iwx334d4wKMQGi+ybdC9EoU9+kXmLM2/NCtIojOirgxY5mfAEjCKiAVGzIE
         4frtasTQw/Kgi3REZzYXx0/Phgm79S27UcWUKph8t4JEljjkj8ZirEg2egWmd2NEQF2l
         57lolTAXyQYaYHP5WvfPSdjY1655PKC15xhDpaunlERKBX9c74aRxCO29KO+KZYcMFot
         B5gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=OZPudOm1n3Y0XK4jpf40ZUtCnIltLVwQU7PwAg/PlfY=;
        b=l1GTNQwj7E+6HJqIICF8cSXJMyreGGzlDHZ8aPLwyyXFjHP535LUwZokCAV48ujQOK
         KaUiNQ4ZjZ0wvNQaZVkPLpNXJVpVRHPVKpPhopGHhOGqzJnAs/gSEAvsD0T9e8gtRrQ3
         13u/xAL7A5eoectxrs2tHIISqiZJ8CfagxTpjTIzpcn7YRsh+ouS8RN9vAYyeKr4JK2v
         kva432/ZiJVWz9hK88nfE/xYUNm0nYesmMsD2I/IUsg1oaHJbZRcJ47t3v0jpJ5F31e7
         4qVzgOMjLyaGqPqcIywvDJlApRW/jX2CWCQ1EpbfMS37XKfhNUHmdGBL54wDBCJczZTt
         isnw==
X-Gm-Message-State: AOAM531biaeJoVWTrNoU9UaEgvTo2Mu+mSdZvjoXlcZy5sR4ny/9m9pJ
        UlEow31JbVIByVKz/L/rE7c=
X-Google-Smtp-Source: ABdhPJz32IHR5BKnLNNi9FksHxGMzGdjnjiBqp7uquONQESyGp5t0qF7c6FPEGC/L09TJGPVjkiaRA==
X-Received: by 2002:a2e:a712:: with SMTP id s18mr4775392lje.161.1627726397082;
        Sat, 31 Jul 2021 03:13:17 -0700 (PDT)
Received: from [192.168.1.100] ([178.176.77.134])
        by smtp.gmail.com with ESMTPSA id w26sm301595ljd.89.2021.07.31.03.13.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Jul 2021 03:13:16 -0700 (PDT)
Subject: Re: [PATCH v2 2/9] drm/omap: Cast pointer to integer without
 generating warning
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org
Cc:     Tomi Valkeinen <tomba@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Jyri Sarha <jyri.sarha@iki.fi>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-renesas-soc@vger.kernel.org,
        Thierry Reding <thierry.reding@gmail.com>, linux-imx@nxp.com,
        Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
        linux-tegra@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>,
        Alain VOLMAT-SCND-01 <alain.volmat@foss.st.com>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>
References: <20210731013954.11926-1-laurent.pinchart+renesas@ideasonboard.com>
 <20210731013954.11926-3-laurent.pinchart+renesas@ideasonboard.com>
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Organization: Brain-dead Software
Message-ID: <32ff5167-01f3-3af4-9075-f61a659c35eb@gmail.com>
Date:   Sat, 31 Jul 2021 13:12:58 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210731013954.11926-3-laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello

On 31.07.2021 4:39, Laurent Pinchart wrote:

> On 64-bit platforms, the compiler complains that casting a void pointer
> to an unsigned int loses data. Cast the pointer to a uintptr_t unsigned

    Is "unsigned" really needed here?

> to fix this.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>   drivers/gpu/drm/omapdrm/omap_drv.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/omap_drv.c b/drivers/gpu/drm/omapdrm/omap_drv.c
> index f86e20578143..c05d3975cb31 100644
> --- a/drivers/gpu/drm/omapdrm/omap_drv.c
> +++ b/drivers/gpu/drm/omapdrm/omap_drv.c
> @@ -572,7 +572,7 @@ static int omapdrm_init(struct omap_drm_private *priv, struct device *dev)
>   	priv->dss->mgr_ops_priv = priv;
>   
>   	soc = soc_device_match(omapdrm_soc_devices);
> -	priv->omaprev = soc ? (unsigned int)soc->data : 0;
> +	priv->omaprev = soc ? (uintptr_t)soc->data : 0;
>   	priv->wq = alloc_ordered_workqueue("omapdrm", 0);
>   
>   	mutex_init(&priv->list_lock);

MBR, Sergei
