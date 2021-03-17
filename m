Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0B5233ECD0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Mar 2021 10:17:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229646AbhCQJRK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 17 Mar 2021 05:17:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229683AbhCQJQq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 17 Mar 2021 05:16:46 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C385C06175F
        for <linux-renesas-soc@vger.kernel.org>; Wed, 17 Mar 2021 02:16:46 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id v9so1905899lfa.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 17 Mar 2021 02:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=X7jkBuOrJJ0Jfs4Q9WqxpRDX/x4oukTABkzO4pd8+2k=;
        b=Sv5rTsXop+2R+H/BzTiyvpnU0IfKFEMtqhG/bx/w+scdSayyo/sUZ1g7no97+iP/QT
         WXUCCiwWnO0Ahy8lHMWnjj+Jpab96NWat6WDwBlGzr+POt/c0pht0qo0XLzMpWaTbz1Z
         5I+qOoiTPxWtvDkUzekbd8Up0wTCBvvvpgtII/yZKfjtcJibDYlFDiqVwq0S+bVZduEz
         7mtMv8SUFKfWbNBiuJNK0XKHIJlXdmDTTENikuzdTIFDI2IEdyXLP0U96ZYR/TR4W54l
         CQ3EAUwimotIL1kXcwyWN0XVYlQs7pnXMbkCEHAX2RkRXo/jSK3NljTWlfUAmbpz3IhU
         78DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=X7jkBuOrJJ0Jfs4Q9WqxpRDX/x4oukTABkzO4pd8+2k=;
        b=RxPzFbRhr5jM9yYr08M6r7e8Y8y1nidTimgWx4iKSCAvhO3521a14SvO7ijyH/bAwk
         72VQbxvV0xQ1FZ5/zTOc/O0y4iFENAQA8iHhJxQQdcoPvmzCzCmlz++TKCSzMvqxD9sv
         nuYcKg3+6gRvH9TnAccUtGiu2ri9+KXC605l3Y9/PjF18lb3AbijxCw7T15Wm6WQC7iI
         eUfiIV91g+ki/yzLLETkzkajeNi6ZnQ46qLR5NZ3fnkfKQVS9Xp+kc1Qm6o3ncACXQFP
         hlFflsKx55MaFOavSOsRiWFCNslZocnCCElrttw2qd/x/zca9J8QCvs1bpmYH5ZmnFLN
         UkXQ==
X-Gm-Message-State: AOAM531s0r3rU8WlGfkZ6LWRTxuQR4XXfo1ELmcv8NxgMoQHtVSmqIum
        RYRBU95wje0Xu6Hc2Gm062Yk2g==
X-Google-Smtp-Source: ABdhPJxap3c0UAD11o46DdF4scYWeoAAMe0ywQ23CiddvAxSb9y2iifFQ7dL/jeYa5iu23KDxcd7WA==
X-Received: by 2002:a05:6512:2026:: with SMTP id s6mr1774689lfs.43.1615972605070;
        Wed, 17 Mar 2021 02:16:45 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id w13sm3465898ljw.2.2021.03.17.02.16.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Mar 2021 02:16:44 -0700 (PDT)
Date:   Wed, 17 Mar 2021 10:16:44 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] media: rcar-csi2: Enable support for r8a77961
Message-ID: <YFHI/O+twAJ8Unk4@oden.dyn.berto.se>
References: <20210312132459.1754782-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210312132459.1754782-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello,

On 2021-03-12 14:24:59 +0100, Niklas Söderlund wrote:
> Enable support for M3-W+ (r8a77961).
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

I have off-band received a tag for this patch,

Tested-by: LUU HOAI <hoai.luu.ub@renesas.com>

> ---
>  drivers/media/platform/rcar-vin/rcar-csi2.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c b/drivers/media/platform/rcar-vin/rcar-csi2.c
> index e06cd512aba207a4..71ff20a165d66547 100644
> --- a/drivers/media/platform/rcar-vin/rcar-csi2.c
> +++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
> @@ -1164,6 +1164,10 @@ static const struct of_device_id rcar_csi2_of_table[] = {
>  		.compatible = "renesas,r8a7796-csi2",
>  		.data = &rcar_csi2_info_r8a7796,
>  	},
> +	{
> +		.compatible = "renesas,r8a77961-csi2",
> +		.data = &rcar_csi2_info_r8a7796,
> +	},
>  	{
>  		.compatible = "renesas,r8a77965-csi2",
>  		.data = &rcar_csi2_info_r8a77965,
> -- 
> 2.30.1
> 

-- 
Regards,
Niklas Söderlund
