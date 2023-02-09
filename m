Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D281C6913B7
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Feb 2023 23:49:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230283AbjBIWtF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 9 Feb 2023 17:49:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229700AbjBIWs6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 Feb 2023 17:48:58 -0500
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31EC711658
        for <linux-renesas-soc@vger.kernel.org>; Thu,  9 Feb 2023 14:48:50 -0800 (PST)
Received: by mail-ed1-x531.google.com with SMTP id fi26so3397069edb.7
        for <linux-renesas-soc@vger.kernel.org>; Thu, 09 Feb 2023 14:48:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XyWo2zO4dvGXWFJtJgoJZZVyO6XKnm2xahOkMMOVXbI=;
        b=EcK8gFkjOvcbUZ26ixzm9QOa2qF939D8fpnzfkQSvGBx/nyOzSJlCE/1THc0A/7YAE
         HWfUmwGem6g1e1tufjh56UXbvnjITp54gsyYGHpFmzjpiNjo9LccXpisLXa+S8G9DCZY
         KKD20EmdT68+qrjTR8HY+IuyuUKDKL2I95fNQNLoPTy/Pi9T99BVEVwlT1e6TauVmglP
         CzWvWiOuvlmLTQlhcl4PVbGCYnsEEopmYK8ZD/TNYTHtng+zrRzK5L25HvMx+SnZJDS2
         OhVjMe+dJ9q9QKoQ41TJ6xXqRWBPiYec9ulS2o62DJ6dbTBjBB3qn3aHHv+XLcTt8q+Y
         UtTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XyWo2zO4dvGXWFJtJgoJZZVyO6XKnm2xahOkMMOVXbI=;
        b=Q08Y6g/KmMzHP/vVD60IhBdyF2FPJt7AlytLQA4ehlXelk8MR9Gpoe81GlraA1gIM3
         V9T9JPjWTcH8r/J8MwwEQ0rTyu4tVAjeHAxjCYLTG1USPInxAZ4MsqxoPqpkII3ePONM
         MYePmJRsXhgi/j6EkUhTcljM1HmxqWJnzhCWwJL1AK5jqXgk/KcQ5ktYRZc/f0AvPCS4
         nj1IOmny4olXU4gJkFOubp1jpGPAt33loil8GN5BD0IbmqiAcKv0rrh5qJ0rypsuTjSX
         V7X+b57m0usF0iOrlTMOBnAmmRpjplmulDGxifLtOJGeGWiNWCXr+dXftFNPUpeHmhA9
         EMqQ==
X-Gm-Message-State: AO0yUKXX3bY2lhiRN0Zs8VBEp+g61dF6NJc7eMDfeBF22a0f+wj+N4H6
        5+RufcxGmHI+EHtkfIaN9o3zog==
X-Google-Smtp-Source: AK7set9A7Ra/aegx3S43kpP81yyoupcto0SVS0hA9tCaVI+cpBVBi6mYv35KfR3JD8WMB0EnMJDiQA==
X-Received: by 2002:a50:9eee:0:b0:49d:9ff4:d82b with SMTP id a101-20020a509eee000000b0049d9ff4d82bmr14323132edf.15.1675982928827;
        Thu, 09 Feb 2023 14:48:48 -0800 (PST)
Received: from localhost (h-46-59-89-207.A463.priv.bahnhof.se. [46.59.89.207])
        by smtp.gmail.com with ESMTPSA id k26-20020a50c09a000000b004a21304f5a0sm1379071edf.72.2023.02.09.14.48.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 14:48:48 -0800 (PST)
Date:   Thu, 9 Feb 2023 23:48:47 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     "Rafael J . Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        linux-renesas-soc@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] thermal/drivers/rcar_gen3: Add support for R-Car V4H
Message-ID: <Y+V4T0KuX9BTEcW6@oden.dyn.berto.se>
References: <cover.1675958665.git.geert+renesas@glider.be>
 <852048eb5f4cc001be7a97744f4c5caea912d071.1675958665.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <852048eb5f4cc001be7a97744f4c5caea912d071.1675958665.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thanks for your work.

On 2023-02-09 17:11:54 +0100, Geert Uytterhoeven wrote:
> Add support for the Thermal Sensor/Chip Internal Voltage Monitor/Core
> Voltage Monitor (THS/CIVM/CVM) on the Renesas R-Car V4H (R8A779G0) SoC.
> 
> According to the R-Car V4H Hardware User's Manual Rev. 0.70, the
> (preliminary) conversion formula for the thermal sensor is the same as
> for most other R-Car Gen3 and Gen4 SoCs, while the (preliminary)
> conversion formula for the chip internal voltage monitor differs.
> As the driver only uses the former, no further changes are needed.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas S�derlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/thermal/rcar_gen3_thermal.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/thermal/rcar_gen3_thermal.c b/drivers/thermal/rcar_gen3_thermal.c
> index 4ef927437842af74..04245393e78d02c5 100644
> --- a/drivers/thermal/rcar_gen3_thermal.c
> +++ b/drivers/thermal/rcar_gen3_thermal.c
> @@ -403,6 +403,10 @@ static const struct of_device_id rcar_gen3_thermal_dt_ids[] = {
>  		.compatible = "renesas,r8a779f0-thermal",
>  		.data = &rcar_gen3_ths_tj_1,
>  	},
> +	{
> +		.compatible = "renesas,r8a779g0-thermal",
> +		.data = &rcar_gen3_ths_tj_1,
> +	},
>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, rcar_gen3_thermal_dt_ids);
> -- 
> 2.34.1
> 

-- 
Kind Regards,
Niklas S�derlund
