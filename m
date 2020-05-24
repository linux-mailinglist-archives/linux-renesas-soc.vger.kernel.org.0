Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA1101E03A5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 May 2020 00:20:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387960AbgEXWU3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 24 May 2020 18:20:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387850AbgEXWU3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 24 May 2020 18:20:29 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BDA3C061A0E;
        Sun, 24 May 2020 15:20:29 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id v63so8034341pfb.10;
        Sun, 24 May 2020 15:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=qzOOykkiRvxuCnGSXuvFzSZSZDJX5DiShQxILehWR4U=;
        b=IiLtSBuYysFTpCnaOdBkP/mhnUmJNWnoxdN6ndX3QXXS6S64MrSsnNWGw1tZoqVUuR
         NyddUH3uqru8kVIlY0IJfS/oCCLH/V3Lk3ZL/sbqT/l8tm9dKf485NMj9b/CLXgRjBZq
         DpGOPdiWPSDfYNRStO1IASDntvS16RNu0NKXV9w9kzantNvbHiTejOYEOhJQV3yr6GQR
         El1V/f06IhiK0gVRVbIaQLCtaZ0o88zF68NOGKSws4R9Sy7mZ5ebIO7z70gUvq3d7fOB
         FDyy5mlY5SrAZ/72AUnbolSaKNTJ7Nq/U3acGydojkHdvfAEo+YQoxKCZj2u+d2FODD7
         CO6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=qzOOykkiRvxuCnGSXuvFzSZSZDJX5DiShQxILehWR4U=;
        b=YbLwxlsZSAhIqyXiGy8Rx5HsPQVHvE+yZQgbGK0XgE+2xO+hDX72aUt+3Le6613Icp
         jizIYbdXOjb0HQS1WVA/C8bvdgaY6iVepREerD4XS9gdEANy+lzcV0pXBwWqn8nRAzgv
         hO/PXp1yemJrYlLUGtLkbn91BZqZZglArd5B9k3P0A3X75167jeYG6v1WDp4OfUvPC9v
         kFk2/3aPy/XkAWSDc6OOXwHJ//ePSx3cUVUBTSLh5yQaXEJc5l2r2pZARVh8wBfTZSxp
         05oa5oQBvB+nWLEuswdRW8L7YJTaz8/dLIcPuwwHx6g0pKkjrdwnHp4OgoEdoshYMhbG
         YHog==
X-Gm-Message-State: AOAM530C94mLaEYqAZnSQoUlbBuj6RstgX2uZC6uUh30tpY6t/8IDh9J
        dcPWgrbFczRhS8XIJxH3WlE=
X-Google-Smtp-Source: ABdhPJy4VbkiZti3bfziZPr/Msc80U2+uxRQPHsLAZTS9t0EpjeDTpiVfuIY+A21TC+v8CJKr0Mp6w==
X-Received: by 2002:a62:fcc9:: with SMTP id e192mr14967945pfh.244.1590358828529;
        Sun, 24 May 2020 15:20:28 -0700 (PDT)
Received: from ubuntu-s3-xlarge-x86 ([2604:1380:4111:8b00::1])
        by smtp.gmail.com with ESMTPSA id l1sm12063035pjr.17.2020.05.24.15.20.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2020 15:20:27 -0700 (PDT)
Date:   Sun, 24 May 2020 15:20:25 -0700
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Anders Roxell <anders.roxell@linaro.org>
Cc:     geert+renesas@glider.be, magnus.damm@gmail.com,
        linux-renesas-soc@vger.kernel.org, sre@kernel.org, robh@kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] power: reset: vexpress: fix build issue
Message-ID: <20200524222025.GA3116034@ubuntu-s3-xlarge-x86>
References: <20200522220103.908307-1-anders.roxell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200522220103.908307-1-anders.roxell@linaro.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sat, May 23, 2020 at 12:01:03AM +0200, Anders Roxell wrote:
> An allmodconfig kernel makes CONFIG_VEXPRESS_CONFIG a module and
> CONFIG_POWER_RESET_VEXPRESS builtin. That makes us see this build
> error:
> 
> aarch64-linux-gnu-ld: drivers/power/reset/vexpress-poweroff.o: in function `vexpress_reset_probe':
> ../drivers/power/reset/vexpress-poweroff.c:119: undefined reference to `devm_regmap_init_vexpress_config'
> ../drivers/power/reset/vexpress-poweroff.c:119:(.text+0x48c): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol
> `devm_regmap_init_vexpress_config'
> make[1]: *** [/srv/src/kernel/next/Makefile:1126: vmlinux] Error 1
> 
> Rework so that POWER_RESET_VEXPRESS depends on 'VEXPRESS_CONFIG=y'.
> 
> Fixes: d06cfe3f123c ("bus: vexpress-config: Merge vexpress-syscfg into vexpress-config")
> Acked-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
> ---
>  drivers/power/reset/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/power/reset/Kconfig b/drivers/power/reset/Kconfig
> index 4dfac618b942..f07b982c8dff 100644
> --- a/drivers/power/reset/Kconfig
> +++ b/drivers/power/reset/Kconfig
> @@ -191,7 +191,7 @@ config POWER_RESET_VERSATILE
>  config POWER_RESET_VEXPRESS
>  	bool "ARM Versatile Express power-off and reset driver"
>  	depends on ARM || ARM64
> -	depends on VEXPRESS_CONFIG
> +	depends on VEXPRESS_CONFIG=y
>  	help
>  	  Power off and reset support for the ARM Ltd. Versatile
>  	  Express boards.
> -- 
> 2.26.2
> 

This causes a warning for ARCH=arm allmodconfig:

$ make -j"$(nproc)" -s ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- O=out/arm allmodconfig

WARNING: unmet direct dependencies detected for POWER_RESET_VEXPRESS
  Depends on [n]: POWER_RESET [=y] && (ARM [=y] || ARM64) && VEXPRESS_CONFIG [=m]=y
  Selected by [y]:
  - ARCH_VEXPRESS [=y] && ARCH_MULTI_V7 [=y]

and still doesn't fix the error:

arm-linux-gnueabi-ld: drivers/power/reset/vexpress-poweroff.o: in function `vexpress_reset_probe':
vexpress-poweroff.c:(.text+0x36c): undefined reference to `devm_regmap_init_vexpress_config'

Cheers,
Nathan
