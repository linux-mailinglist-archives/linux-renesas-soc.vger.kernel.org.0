Return-Path: <linux-renesas-soc+bounces-2566-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 58AF385047B
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 10 Feb 2024 14:06:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 522D91F226BF
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 10 Feb 2024 13:06:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75CB147F6A;
	Sat, 10 Feb 2024 13:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="KHLJcBkn"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1496731A8F
	for <linux-renesas-soc@vger.kernel.org>; Sat, 10 Feb 2024 13:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707570385; cv=none; b=Hsro7qyXjLogmMPLkoVDSLpMd51GvrWGrtFBkfx+22pWUSFB2jDQpCNl2AI+7vbIiIHW8hOBTGc+57vpG0eru0z9vpbCEwjLYr6FC1hwd/9cMyhcbARFgEe5qdBTrRnNb6zkg+Z9gbtmt8qxx8e7TKnOZ+tQJOF9mKtv5En6OQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707570385; c=relaxed/simple;
	bh=m1wtskg6J8X1KfuTCxbTVD5fkmzc9Qf2L2ersIWun90=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YEm74fJey1EOxz2W74d9p2O2ihp9tfPgNag2vWqL1rEcsjnd3t561T85M3r4kasdU/RT6n03Vm3hoEsFfEGgfeNog7LcDFdoCRuVffPEc6M6WEGZdE2k9l2ViB2W8rwzmnBSOelVv7vSRVAR3pN1id206gv6mMxaGtkX5Fd0mFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=KHLJcBkn; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2d0e521de4eso5975531fa.2
        for <linux-renesas-soc@vger.kernel.org>; Sat, 10 Feb 2024 05:06:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech.se; s=google; t=1707570381; x=1708175181; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vD8vyTajkLSeekCEtzddFVL3re/Xwa+J5JcL0VXtqug=;
        b=KHLJcBkn7x42Q+wtYpOXMaHrtTrx9Yh15onDkaDOYuGIvBzDTVexLXs4Zu8yGp4iyA
         QxetqiYv/FU6YNw9h57ZJtp28j49ImrEBJUzbJqeUST/j8adahL8FO3M94c5opiOBM2N
         l3UmqGnjdaCOuj0HxeykolfGv1YUgejHPfsxT0KwrwGayRgHOUWIWZcEcNbvgVr7SM/F
         TxdeQ9aIQlZFFbCTQL7IjzSMndoI7xopvblEop7a+JGmlf1X5FwSIXH9fUua5qk8poag
         6CzIyj79zL9WE92MwunhURNfPFYc29oQ5fA6jKTJsjn4yAqgJ+ihmP/IfwLFc0JOWYVZ
         cAQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707570381; x=1708175181;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vD8vyTajkLSeekCEtzddFVL3re/Xwa+J5JcL0VXtqug=;
        b=taHfDf4sCfB4SnkbKwOINR81rSrf9HH6x1zkQTcSR1iqmkczK3Yso4EndDpPy6BuVL
         a5Axu4ssD39lws6y4h7QfzmSN9pua0oukNuFW0uq78ZM18NOf44QEbNSz1SPOLHbdQDt
         sZAg6rEe8v5DcDP51NAJLEVaTcF/HLQx35rVfJ8tcAwiVTs73rWd44LTcBmj3Y/ZU3dw
         DNb031DwlOs46ued/blUv16ojV5/K4CYPR+54M6Y+MWlxD/dyZaBKXuYoD/0S1QDcrw0
         n4uwtUN4SmYyJttHuB/hMV/DzClUbiQ4PfCmpFNCx9NVlttETDLbov4g9BXrq8n4m8Sp
         byvQ==
X-Gm-Message-State: AOJu0Yyo5n7L68YNnd0woRSVgeDF3PcZw+CBBbp+efyNLXROVfNQpKrA
	KIRTXvbVGQlxp6CwGM/XRMqGZyXRjem+ije83jIYk4dSdiLAUtIfHt2Cvd0TIH4=
X-Google-Smtp-Source: AGHT+IECacRzBK2KLBRy4BB56jsxJlXwFAaY+fxrGjNtS/te/VKYtlzvqzQkb0jeU20o+NyLxC+x1A==
X-Received: by 2002:a2e:94d6:0:b0:2d0:e298:5777 with SMTP id r22-20020a2e94d6000000b002d0e2985777mr1348834ljh.29.1707570381107;
        Sat, 10 Feb 2024 05:06:21 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVPsh78RFyAu+CyKvIYOBZz3Xp1SyrjsxGtM0S2nOSWSYxYDC4a/beLkPIYjqWCIfXHvlns6+xySSl2WZsH7Tf8vI6I3+HN67a7AU88tT39OQwsS1Zhv1X6ecNsbUd5oi8j1DB3I2N/DNiLq14Ng9+kB0MDrmrHcGi09ug3Aff2gEtpKIin5W+KwfDlyEDBPkt5vB5zCIJYXqHEkNbf852FgzNqWVvq6dW/N0t0iUb1jrTVLivo6Fzu/JrPMPE=
Received: from localhost (h-46-59-36-113.A463.priv.bahnhof.se. [46.59.36.113])
        by smtp.gmail.com with ESMTPSA id m10-20020a2eb6ca000000b002d0bfd10153sm581922ljo.5.2024.02.10.05.06.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Feb 2024 05:06:20 -0800 (PST)
Date: Sat, 10 Feb 2024 14:06:19 +0100
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2] dt-bindings: renesas: Document preferred compatible
 naming
Message-ID: <20240210130619.GE1177919@ragnatech.se>
References: <20240127121937.2372098-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240127121937.2372098-1-niklas.soderlund+renesas@ragnatech.se>

Hi,

I'm unsure who to ping for this patch. It have been acked by Rob so is 
the intention this can go thru Geert's Renesas tree?

On 2024-01-27 13:19:37 +0100, Niklas Söderlund wrote:
> Compatibles can come in two formats. Either "vendor,ip-soc" or
> "vendor,soc-ip". Add a DT schema file documenting Renesas preferred
> policy and enforcing it for all new compatibles, except few existing
> patterns.
> 
> Suggested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
> * Changes since v1
> - Split the "SoC agnostic compatibles" section into two to make it's
>   intent clearer.
> - Improved the documentation for each group of compatibles.
> - Reduced the number of regexp to create a larger target area. As
>   suggested by Krzysztof the goal is not to validate each SoC name but
>   check for the correct order of SoC-IP.
> 
> * Changes since RFC
> - Moved to Documentation/devicetree/bindings/soc/renesas.
> - Changed the pattern in the initial select to match on .*-.*.
> - Added a lot of missing compatible values.
> ---
>  .../bindings/soc/renesas/renesas-soc.yaml     | 135 ++++++++++++++++++
>  1 file changed, 135 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/renesas/renesas-soc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/soc/renesas/renesas-soc.yaml b/Documentation/devicetree/bindings/soc/renesas/renesas-soc.yaml
> new file mode 100644
> index 000000000000..91310d23cf0b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/renesas/renesas-soc.yaml
> @@ -0,0 +1,135 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/renesas/renesas-soc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas SoC compatibles naming convention
> +
> +maintainers:
> +  - Geert Uytterhoeven <geert+renesas@glider.be>
> +  - Niklas Söderlund <niklas.soderlund@ragnatech.se>
> +
> +description: |
> +  Guidelines for new compatibles for SoC blocks/components.
> +  When adding new compatibles in new bindings, use the format::
> +    renesas,SoC-IP
> +
> +  For example::
> +   renesas,r8a77965-csi2
> +
> +  When adding new compatibles to existing bindings, use the format in the
> +  existing binding, even if it contradicts the above.
> +
> +select:
> +  properties:
> +    compatible:
> +      pattern: "^renesas,.*-.*$"
> +  required:
> +    - compatible
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      # Preferred naming style for compatibles of SoC components
> +      - pattern: "^renesas,emev2-[a-z0-9-]+$"
> +      - pattern: "^renesas,r(7s|8a|9a)[a-z0-9]+-[a-z0-9-]+$"
> +      - pattern: "^renesas,rcar-[a-z0-9-]+$"
> +      - pattern: "^renesas,rz[a-z0-9]*-[a-z0-9-]+$"
> +      - pattern: "^renesas,sh-[a-z0-9-]+$"
> +      - pattern: "^renesas,sh7[a-z0-9]+-[a-z0-9-]+$"
> +
> +      # Fallback compatibles
> +      #
> +      # Some SoC components in addition to a specific SoC compatible have a
> +      # generic fallback compatible. For example the Interrupt Controller,
> +      #
> +      #   compatible = "renesas,intc-irqpin-r8a7740", "renesas,intc-irqpin";
> +      #
> +      # This is OK and new fallback compatibles are allowed.
> +      - enum:
> +          - renesas,cpg-div6-clock
> +          - renesas,cpg-mstp-clocks
> +          - renesas,intc-irqpin
> +
> +      # Legacy compatibles
> +      #
> +      # New compatibles are not allowed but new variations of existing
> +      # patterns/compatibles are.
> +      - pattern: "^renesas,can-[a-z0-9]+$"
> +      - pattern: "^renesas,dmac-[a-z0-9]+$"
> +      - pattern: "^renesas,du-[a-z0-9]+$"
> +      - pattern: "^renesas,ether-[a-z0-9]+$"
> +      - pattern: "^renesas,etheravb-[a-z0-9]+$"
> +      - pattern: "^renesas,etheravb-rcar-gen[0-9]$"
> +      - pattern: "^renesas,gether-[a-z0-9]+$"
> +      - pattern: "^renesas,gpio-[a-z0-9]+$"
> +      - pattern: "^renesas,hscif-[a-z0-9]+$"
> +      - pattern: "^renesas,i2c-[a-z0-9]+$"
> +      - pattern: "^renesas,iic-[a-z0-9]+$"
> +      - pattern: "^renesas,intc-ex-[a-z0-9]+$"
> +      - pattern: "^renesas,intc-irqpin-[a-z0-9]+$"
> +      - pattern: "^renesas,ipmmu-[a-z0-9]+$"
> +      - pattern: "^renesas,irqc-[a-z0-9]+$"
> +      - pattern: "^renesas,jpu-[a-z0-9]+$"
> +      - pattern: "^renesas,mmcif-[a-z0-9]+$"
> +      - pattern: "^renesas,msiof-[a-z0-9]+$"
> +      - pattern: "^renesas,pci-[a-z0-9]+$"
> +      - pattern: "^renesas,pci-rcar-gen[0-9]$"
> +      - pattern: "^renesas,pcie-[a-z0-9]+$"
> +      - pattern: "^renesas,pcie-rcar-gen[0-9]$"
> +      - pattern: "^renesas,pfc-[a-z0-9]+$"
> +      - pattern: "^renesas,pwm-[a-z0-9]+$"
> +      - pattern: "^renesas,qspi-[a-z0-9]+$"
> +      - pattern: "^renesas,rcar_sound-[a-z0-9]+$"
> +      - pattern: "^renesas,riic-[a-z0-9]+$"
> +      - pattern: "^renesas,rspi-[a-z0-9]+$"
> +      - pattern: "^renesas,sata-[a-z0-9]+(-es1)?$"
> +      - pattern: "^renesas,scif-[a-z0-9]+$"
> +      - pattern: "^renesas,scifa-[a-z0-9]+$"
> +      - pattern: "^renesas,scifb-[a-z0-9]+$"
> +      - pattern: "^renesas,sdhi-[a-z0-9]+$"
> +      - pattern: "^renesas,thermal-[a-z0-9]+$"
> +      - pattern: "^renesas,tmu-[a-z0-9]+$"
> +      - pattern: "^renesas,tpu-[a-z0-9]+$"
> +      - pattern: "^renesas,usb-phy-[a-z0-9]+$"
> +      - pattern: "^renesas,usb2-phy-[a-z0-9]+$"
> +      - pattern: "^renesas,usbhs-[a-z0-9]+$"
> +      - pattern: "^renesas,vin-[a-z0-9]+$"
> +      - pattern: "^renesas,xhci-[a-z0-9]+$"
> +
> +      # Fixed legacy compatibles
> +      #
> +      # List cannot grow with new bindings.
> +      - enum:
> +          - renesas,bsc-r8a73a4
> +          - renesas,bsc-sh73a0
> +          - renesas,dbsc-r8a73a4
> +          - renesas,dbsc3-r8a7740
> +          - renesas,em-gio
> +          - renesas,em-sti
> +          - renesas,em-uart
> +          - renesas,fsi2-r8a7740
> +          - renesas,fsi2-sh73a0
> +          - renesas,hspi-r8a7778
> +          - renesas,hspi-r8a7779
> +          - renesas,imr-lx4
> +          - renesas,mtu2-r7s72100
> +          - renesas,rmobile-iic
> +          - renesas,sbsc-sh73a0
> +          - renesas,sdhi-mmc-r8a77470
> +          - renesas,shmobile-flctl-sh7372
> +          - renesas,sysc-r8a73a4
> +          - renesas,sysc-r8a7740
> +          - renesas,sysc-rmobile
> +          - renesas,sysc-sh73a0
> +          - renesas,usb-dmac
> +
> +      # None SoC component compatibles
> +      #
> +      # Compatibles with the Renesas vendor prefix that do not relate to any SoC
> +      # component are OK. New compatibles are allowed.
> +      - enum:
> +          - renesas,smp-sram
> +
> +additionalProperties: true
> -- 
> 2.43.0
> 

-- 
Kind Regards,
Niklas Söderlund

