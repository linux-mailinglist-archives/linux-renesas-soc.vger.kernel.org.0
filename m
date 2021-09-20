Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB56541167E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Sep 2021 16:12:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234701AbhITONp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 20 Sep 2021 10:13:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230175AbhITONp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Sep 2021 10:13:45 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2748EC061574
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Sep 2021 07:12:18 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id b20so9765645lfv.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Sep 2021 07:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=+QHxJjuWeYvLMeveeoTGujZOmzBYAMamf1THD0cD6Mo=;
        b=ZZvylieZUEqG/YQhez/UiP//h6n6lnLlTIrwdjye7heF9Af2qDx9USpVE1ZrZUadll
         kChVQItbpXuNtDPQe7MyxHv1bLf6czC38mPjg6QnWn37QbMlkUDbYoPrE9mE4zrkU+9C
         8H2F/61HTO0z+FXB15w2griw/TQrjC4S3P+NDCZ9Gnxj3HyH4NkSZI7PVAmZ/CrRG6Wr
         TOkGYaG6jY1CWZaRg/iXY58PAYMKYVQhV8HjisPL5bMHrpHBduzyK4pEEYHnGS0xLDNk
         8fP/8Ih00zZo9Ycnmmnq28BWtyxklyp6HtYA8/MavlfzXse00OK/mj/s8h4xbmuOBsy4
         eYKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=+QHxJjuWeYvLMeveeoTGujZOmzBYAMamf1THD0cD6Mo=;
        b=IJTAd3uWjizMW69xb/9a7n90tbtglzLmk6YpExCWDnL2OTmScxvqRNlIDRmJ/sC3Zl
         /dWGgBuTMrKPhaAg9KmClESThi6+do/R+CAHLO1AE8ohFa1uv1Mglx+R6MrMTkxYIjIF
         e+eXKpIN/ihpvV5DobSC27MKbbGXI7FvQjAIB8U0spiNCkN3iQykzRfu1KXODzgI810x
         Sr/LRko7HyPOa9a9paJalXF4uq9LQ6uASmiU517G/5K1N0tbt3Wob/gSKECIcLC9436W
         jA0yHUxbtHNNRXXlrcRTNySAt+vN1ojzOjXnyjk7I9Xu+4iRRkRCm/DPHSFbvioGQ614
         A1ng==
X-Gm-Message-State: AOAM530vAwpYE2kT1o6FYWkL59IfzhqKjdv5GRZ8dwzI+uw4VP/Ij5XK
        oLyc483u2Ac0HreN+qDnxw70O0E1k70=
X-Google-Smtp-Source: ABdhPJzKohm2TpXivowV6n55Sp3dixrRYUz/vzHdGijFpT9lhQRcZI4YuIi9jkAnC0SXe1j8ZxugAw==
X-Received: by 2002:a05:6512:6c8:: with SMTP id u8mr8082920lff.203.1632147067363;
        Mon, 20 Sep 2021 07:11:07 -0700 (PDT)
Received: from localhost (h-46-59-88-219.A463.priv.bahnhof.se. [46.59.88.219])
        by smtp.gmail.com with ESMTPSA id h9sm1275065lfj.145.2021.09.20.07.11.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Sep 2021 07:11:06 -0700 (PDT)
Date:   Mon, 20 Sep 2021 16:11:06 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] arm64: defconfig: add Renesas TPU as module
Message-ID: <YUiWeoZvtduEwDdH@oden.dyn.berto.se>
References: <20210915153143.25184-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210915153143.25184-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

Thanks for your patch.

On 2021-09-15 17:31:43 +0200, Wolfram Sang wrote:
> For better build and test coverage.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 156d96afbbfc..45a17530dfa8 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -1091,6 +1091,7 @@ CONFIG_PWM_MESON=m
>  CONFIG_PWM_MTK_DISP=m
>  CONFIG_PWM_MEDIATEK=m
>  CONFIG_PWM_RCAR=m
> +CONFIG_PWM_RENESAS_TPU=m
>  CONFIG_PWM_ROCKCHIP=y
>  CONFIG_PWM_SAMSUNG=y
>  CONFIG_PWM_SL28CPLD=m
> -- 
> 2.30.2
> 

-- 
Regards,
Niklas Söderlund
