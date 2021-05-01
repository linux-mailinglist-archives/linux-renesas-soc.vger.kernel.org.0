Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D16AD37062B
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  1 May 2021 09:19:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229640AbhEAHT6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 1 May 2021 03:19:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229510AbhEAHT6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 1 May 2021 03:19:58 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E01FEC06174A
        for <linux-renesas-soc@vger.kernel.org>; Sat,  1 May 2021 00:19:08 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id 12so471707lfq.13
        for <linux-renesas-soc@vger.kernel.org>; Sat, 01 May 2021 00:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=HpRAh0AKr1YDJaa0KEpbsEbW9xmFbeMhwVrzvKzXJx0=;
        b=Nb1J9iTPaupIu47FDL7UQYumq6kbOgLe8SvlsPOxiyYo/jIgLezGneWjtdrZtuGSdG
         XqmBemOQv8A6N4Rbt2YiHcLUIt8qlXLagWxL6aG6mMm7yzRiJaclNc+anJrkXGCVlWwQ
         zxvQyHXhL9QjVxi98D9xdW8WW29imnDvn4TeMpvNnekm7OsSQGE2d+bpOKFxpX4FHc4b
         Zmn35NE9NYHmwmajhCbm9oIBtdgyBlId7xwBLE4ga7vg1yL6Akj7Hjsz6dGsOknv3sC/
         K2WygbrZkOTrTA2+h1TDQ1AJ97EIYC1zFyn1VcC0SzRI0FyWLIwd7TMKbNGqlRl6K/iX
         Y9lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=HpRAh0AKr1YDJaa0KEpbsEbW9xmFbeMhwVrzvKzXJx0=;
        b=UL803D4z1Ga5A1mhCrsJXNYZ1/BTUHXR4BhhbswY71D2K8pcGi3Eeo8sDMz6rmmwOm
         kK+79kJJMCvQbBONHN0G0GUbrkDK5EbzsuNb+UGsjAf3ytxg5yYLj/KEnxEw6x3mIb7f
         p4Hs9hSKQ2W04zHh2PiskQZsjGqO3kLnT+yUDG9kueU/+GS1QFMesABqi8NfYGCCjpwp
         3wpKrSwlW4RwVxJKukB9mQC+qEkQpqJS04UromLJs3BWQEjGpATnUs0FUtw4NuegADzr
         MRWD6Zm468SS0Tb/CnUsXklVUuSTr3QBfX+hgrkIDyMXhLZhraB8SxncVER8zD+ziOW/
         bAmA==
X-Gm-Message-State: AOAM532hJdLI3EQWk76xG7i2WtqkFR7rUxE4JYiLLWKM9X9dj7565M78
        wCLBJre+a5RpjqpF0Y2CscEbpA==
X-Google-Smtp-Source: ABdhPJz/htm2R2SlOuTkn9+pj3//7ImcHUBGYra66Vij+YA02Pc6ejc2l5G4FT3g6Iswnpou4eCb0w==
X-Received: by 2002:ac2:5049:: with SMTP id a9mr6035770lfm.662.1619853547243;
        Sat, 01 May 2021 00:19:07 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id l14sm500592lfc.58.2021.05.01.00.19.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 May 2021 00:19:06 -0700 (PDT)
Date:   Sat, 1 May 2021 09:19:06 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 02/12] pinctrl: renesas: r8a77990: JTAG pins do not have
 pull-down capabilities
Message-ID: <YI0A6pv0AtN0xUMK@oden.dyn.berto.se>
References: <cover.1619785375.git.geert+renesas@glider.be>
 <da4b2d69955840a506412f1e8099607a0da97ecc.1619785375.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <da4b2d69955840a506412f1e8099607a0da97ecc.1619785375.git.geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thanks for your work.

On 2021-04-30 14:31:01 +0200, Geert Uytterhoeven wrote:
> Hence remove the SH_PFC_PIN_CFG_PULL_DOWN flags from their pin
> descriptions.
> 
> Fixes: 83f6941a42a5e773 ("pinctrl: sh-pfc: r8a77990: Add bias pinconf support")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/pinctrl/renesas/pfc-r8a77990.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/pinctrl/renesas/pfc-r8a77990.c b/drivers/pinctrl/renesas/pfc-r8a77990.c
> index d040eb3e305daf40..eeebbab4dd811f9c 100644
> --- a/drivers/pinctrl/renesas/pfc-r8a77990.c
> +++ b/drivers/pinctrl/renesas/pfc-r8a77990.c
> @@ -53,10 +53,10 @@
>  	PIN_NOGP_CFG(FSCLKST_N, "FSCLKST_N", fn, CFG_FLAGS),		\
>  	PIN_NOGP_CFG(MLB_REF, "MLB_REF", fn, CFG_FLAGS),		\
>  	PIN_NOGP_CFG(PRESETOUT_N, "PRESETOUT_N", fn, CFG_FLAGS),	\
> -	PIN_NOGP_CFG(TCK, "TCK", fn, CFG_FLAGS),			\
> -	PIN_NOGP_CFG(TDI, "TDI", fn, CFG_FLAGS),			\
> -	PIN_NOGP_CFG(TMS, "TMS", fn, CFG_FLAGS),			\
> -	PIN_NOGP_CFG(TRST_N, "TRST_N", fn, CFG_FLAGS)
> +	PIN_NOGP_CFG(TCK, "TCK", fn, SH_PFC_PIN_CFG_PULL_UP),		\
> +	PIN_NOGP_CFG(TDI, "TDI", fn, SH_PFC_PIN_CFG_PULL_UP),		\
> +	PIN_NOGP_CFG(TMS, "TMS", fn, SH_PFC_PIN_CFG_PULL_UP),		\
> +	PIN_NOGP_CFG(TRST_N, "TRST_N", fn, SH_PFC_PIN_CFG_PULL_UP)
>  
>  /*
>   * F_() : just information
> -- 
> 2.25.1
> 

-- 
Regards,
Niklas Söderlund
