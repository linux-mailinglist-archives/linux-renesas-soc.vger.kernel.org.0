Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8BE6917D4AD
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  8 Mar 2020 17:26:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726279AbgCHQ0i (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 8 Mar 2020 12:26:38 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:39732 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726270AbgCHQ0i (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 8 Mar 2020 12:26:38 -0400
Received: by mail-lf1-f68.google.com with SMTP id j15so5659105lfk.6
        for <linux-renesas-soc@vger.kernel.org>; Sun, 08 Mar 2020 09:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=OxYUCpymTQKyh/Zbcj6rnN2cqzFH378GX45gA5Aa85c=;
        b=WI2lBknG1kB4QUIwRtAqQSF0FeqwrfWNQEX6PKrjPmBBkdEkE5XEz94twM/+Pkc2DJ
         7Z/gOBhyNZ0phrtxKil6xb6sMNbJGAX0oz6im9TK8yDISsikzFYa1h1GNDqNU1BRusXs
         op8vGT5TH9UWKqhzwXwk9s/f94TgAwMxvCzyD6HJlhjZnSqtZDIfq04RMT9UZkNwYOtZ
         q9yaVeDrlhtxPKn2rfciU/wG1shzSVot114jen77a4cbjBvKux+ZmrB3UOpVd3sqa0kb
         L940Ubg5DDOvmXS1uCFfamvDpMNivcyrQ75v92SgTw0t+OAt7hBXqpM1SjoA8jK7K+6W
         oMCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=OxYUCpymTQKyh/Zbcj6rnN2cqzFH378GX45gA5Aa85c=;
        b=G98FklzxsmCJRswP1Wy7PERSh7J/IpLaWsJjPb/ZWvuMfzFvdlaPSHoZSwSgoErVkD
         3k4yCmfJcnHfwvHnI3LQYK107G2MDRzbcTeW0B54z4YGPz8IXynLYq4Go53U6juDmVE0
         YRV83vmvfVw9IZbtEXSOxeHPua8+bX81N/j6wV53SWZ44F2rdwjAyJZGF/eWqZgSVtl9
         ZDGPkq6IGR35m+oKXM5auZp4frfKUDl0YfHuVhAPDIP1SRV4/iithCCr854LHcYQZrSn
         HWKi8+UF4eCaZwT1/ljjglpHHa+i3sRL8EPMK9o0sU9oHJcy93hAE1LLWwSd9uWwO66y
         89cg==
X-Gm-Message-State: ANhLgQ2AmmTQRMQlKnSMX/mWKcujJ0OhEdChaAI6IrVpBaAmiIQ9NPGj
        7gRh7sjLS8fhTG3TwfK8dJBpaA==
X-Google-Smtp-Source: ADFU+vvLj9947q2eq5NymLrmOdpYhDI4kv3dx/GK9iDq9j8U+KsaxvWNy3cVavNC8pPNW8aOpHZgNA==
X-Received: by 2002:a19:c70d:: with SMTP id x13mr3177936lff.204.1583684795775;
        Sun, 08 Mar 2020 09:26:35 -0700 (PDT)
Received: from localhost (h-200-138.A463.priv.bahnhof.se. [176.10.200.138])
        by smtp.gmail.com with ESMTPSA id 140sm7960803lfk.19.2020.03.08.09.26.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2020 09:26:34 -0700 (PDT)
Date:   Sun, 8 Mar 2020 17:26:34 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Zhang Rui <rui.zhang@intel.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Amit Kucheria <amit.kucheria@verdurent.com>,
        Rob Herring <robh+dt@kernel.org>, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: thermal: rcar-gen3-thermal: Add
 r8a77961 support
Message-ID: <20200308162634.GB2975348@oden.dyn.berto.se>
References: <20200306105503.24267-1-geert+renesas@glider.be>
 <20200306105503.24267-2-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200306105503.24267-2-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thanks for your work.

On 2020-03-06 11:55:02 +0100, Geert Uytterhoeven wrote:
> Document R-Car M3-W+ (R8A77961) SoC bindings.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas S�derlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  Documentation/devicetree/bindings/thermal/rcar-gen3-thermal.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/thermal/rcar-gen3-thermal.txt b/Documentation/devicetree/bindings/thermal/rcar-gen3-thermal.txt
> index 12c740b975f78690..2993fa720195308f 100644
> --- a/Documentation/devicetree/bindings/thermal/rcar-gen3-thermal.txt
> +++ b/Documentation/devicetree/bindings/thermal/rcar-gen3-thermal.txt
> @@ -11,6 +11,7 @@ Required properties:
>  			    - "renesas,r8a774b1-thermal" (RZ/G2N)
>  			    - "renesas,r8a7795-thermal" (R-Car H3)
>  			    - "renesas,r8a7796-thermal" (R-Car M3-W)
> +			    - "renesas,r8a77961-thermal" (R-Car M3-W+)
>  			    - "renesas,r8a77965-thermal" (R-Car M3-N)
>  			    - "renesas,r8a77980-thermal" (R-Car V3H)
>  - reg			: Address ranges of the thermal registers. Each sensor
> -- 
> 2.17.1
> 

-- 
Regards,
Niklas S�derlund
