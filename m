Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2FA436912A5
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Feb 2023 22:30:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230040AbjBIVaA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 9 Feb 2023 16:30:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230311AbjBIV36 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 Feb 2023 16:29:58 -0500
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 145726B35C
        for <linux-renesas-soc@vger.kernel.org>; Thu,  9 Feb 2023 13:29:55 -0800 (PST)
Received: by mail-ej1-x635.google.com with SMTP id gr7so10527004ejb.5
        for <linux-renesas-soc@vger.kernel.org>; Thu, 09 Feb 2023 13:29:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6pUzHu7tbp3vZeh7PKcELEvqMtzDwCWK4uWM/JTg9Ls=;
        b=pRYICmpFKOXxO2UJKo4/jYdU2LbImfbGKTwNJFO/vxCUd9K9K6ka573StF++XRUwB/
         Ds3p9f7ShC1ST/9cj1kkRCAlkXCTeYb25D0JesHHJ1rrXOu8XqgLzSNkMkFLPAqUmzHf
         STry3g3knSvPUILCYQu8RWo0CypmBLZKlvFMFmp720Xo4Lzf7xLcS0OlrY4b40Ptlnld
         lwD5tWcqDiXVIiOAH60G1WwljA8H6Mw0Ih7cdX22e+JFXYaPqrhPPPvcL5KOc+PLEzxM
         INCTISp5jEFhrahuBOL3rKzyOeulEYJPsd5ZszZwHJH+4YcB0y0hbLhXOxsiAoFupIHW
         1Jpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6pUzHu7tbp3vZeh7PKcELEvqMtzDwCWK4uWM/JTg9Ls=;
        b=btaGGAP5Bw3kZ+U0XZmHhP3J/rRDnvdw5EwM35ZZnAma6CBXumMinhk8kZujmVOgNu
         RvE5zCZGqBmSO1gcsWI9okbBc5bnVbO0FLyoNLLHafETHLEH0O8u18ssM07OySPoO0th
         7ainfETExBEy7TztY4a63L3EmPr1yIvsHhSSup0pZ4Rt4zKKnbe4o6wkwZ/11YkaH+fQ
         fy50hPES57PUpzDASNn7/FQywalZoMzNFdg8UYH0lBfLJXGHcGdwfGlHNLfX4A+i8MUn
         5vIMRxzAaWAcVmElFKiyuhf0s810sAtRVe0mno6mAutT9tk/kt9L0kDaY+5n8GPCS4Ru
         UVYg==
X-Gm-Message-State: AO0yUKWwdM0YplXZBvstkLv1d2/I5PS3SaHXWvziyKkgD2Hcqm8SjqAe
        3yjp8h6DK56CCPiWOXHHLVE7BQ==
X-Google-Smtp-Source: AK7set9PZnPOFOdL+b49znvHj0mQyLjHtrooRB7utrR/1Fd2gnzQ4xTT18tlH5+70ZfbcMU9PloynQ==
X-Received: by 2002:a17:906:af04:b0:88b:ce27:f51e with SMTP id lx4-20020a170906af0400b0088bce27f51emr12267259ejb.29.1675978194477;
        Thu, 09 Feb 2023 13:29:54 -0800 (PST)
Received: from localhost (h-46-59-89-207.A463.priv.bahnhof.se. [46.59.89.207])
        by smtp.gmail.com with ESMTPSA id n8-20020a1709065e0800b0087fa83790d8sm1407138eju.13.2023.02.09.13.29.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 13:29:53 -0800 (PST)
Date:   Thu, 9 Feb 2023 22:29:53 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: renesas: r8a779f0: use proper labels for
 thermal zones
Message-ID: <Y+Vl0QEzbWlPEL/j@oden.dyn.berto.se>
References: <20230209200735.3882-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230209200735.3882-1-wsa+renesas@sang-engineering.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

Thanks for your work.

On 2023-02-09 21:07:35 +0100, Wolfram Sang wrote:
> The documentation provides information about the placement of the zones,
> so that can be used for more descriptive labels.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
> 
> Inspired by Geert's thermal nodes for V4H. Thanks!
> 
>  arch/arm64/boot/dts/renesas/r8a779f0.dtsi | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a779f0.dtsi b/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
> index f20b612b2b9a..e0f4ab20ae63 100644
> --- a/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
> @@ -1119,7 +1119,7 @@ prr: chipid@fff00044 {
>  	};
>  
>  	thermal-zones {
> -		sensor_thermal1: sensor1-thermal {
> +		sensor_thermal_rtcore: sensor1-thermal {
>  			polling-delay-passive = <250>;
>  			polling-delay = <1000>;
>  			thermal-sensors = <&tsc 0>;
> @@ -1133,7 +1133,7 @@ sensor1_crit: sensor1-crit {
>  			};
>  		};
>  
> -		sensor_thermal2: sensor2-thermal {
> +		sensor_thermal_apcore0: sensor2-thermal {
>  			polling-delay-passive = <250>;
>  			polling-delay = <1000>;
>  			thermal-sensors = <&tsc 1>;
> @@ -1147,7 +1147,7 @@ sensor2_crit: sensor2-crit {
>  			};
>  		};
>  
> -		sensor_thermal3: sensor3-thermal {
> +		sensor_thermal_apcore4: sensor3-thermal {
>  			polling-delay-passive = <250>;
>  			polling-delay = <1000>;
>  			thermal-sensors = <&tsc 2>;
> -- 
> 2.35.1
> 

-- 
Kind Regards,
Niklas Söderlund
