Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10D4F3EA81B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Aug 2021 17:56:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238485AbhHLP5G (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 12 Aug 2021 11:57:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238391AbhHLP5F (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Aug 2021 11:57:05 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07AF1C061756;
        Thu, 12 Aug 2021 08:56:40 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id z2so14403568lft.1;
        Thu, 12 Aug 2021 08:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=A7HUd0nU0npMSrYUznOJbVJsMaRrMewEeWqFZ6APtx4=;
        b=j/GN+r1KBaVWAoC9ZJQmNjaUsiw+qZDHrTwbWr3orzuAL2hdRPlZTxgET/HQvaNQnx
         PjZ7D+NeFSwhBkXzYjKEyW3hp+spXzKQJlaDDl9kO51wW9qklshwbd+6oH/GI0dIXd0k
         Tf2HLUn+y/G1+5KjkqTEnMFmGPjZYqcJolutbtjoK3Hujl6eP/IR77GI5oEBaDEWx4DT
         ykjHfz6FxXZtpIF158T4fe9lRrqujqkUKQfDmLYUAspjAEKSEqmOZ23Y+ZdMte+c84iG
         E/JD8l1CgBC0/kRhlan4v2ZFhcwA5IWz6A/GMySojaIAEPnq7VrWOKVU39b5lgPWmBEk
         DfkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=A7HUd0nU0npMSrYUznOJbVJsMaRrMewEeWqFZ6APtx4=;
        b=RtwSu+RVDfhz4dLVc9ChZ6wk5BFbx/nLRN20PAmsxPKstf8mEpDS+7z4JrpPe7x1mg
         30V6f+if5Ia20/qolHbnPtAfDshGkbIzwgJ/6m6tBAGkK/jy50nQ2z1cH+pubeNT71Ce
         uTA8T6JRr5qTxVy8QubcnJil1DqlI+GJyaQY5IrBSt8HQDk70x5waq4XmcyJ5BiBNga1
         pUx6ng1gdbKr07ibJCaiIwGczbkTjHtSVQOG9RpgTY+j9AvtfRysgYeuK64H0yEpscPb
         P5SsA4lv/FTzK5PaYeY7h5qbF8KLOYlM2H6N4pRIDJlICFkHOGGsah65b2AnxhQwKLm7
         5KiQ==
X-Gm-Message-State: AOAM532TgIqPfdXjkq2bO4M1EDvtGEVNb1BG41C+h3sm8ucjuC/JEQd1
        8vMyuAOJHVr2JOej/ik+pLo=
X-Google-Smtp-Source: ABdhPJyhGqznobSV1gQojSF5F6cY4ISEPvrme2LFQmK269nPCFUnNk+kZNG2hQSDiTpokrCJC7cb0A==
X-Received: by 2002:a05:6512:2603:: with SMTP id bt3mr2982007lfb.476.1628783798362;
        Thu, 12 Aug 2021 08:56:38 -0700 (PDT)
Received: from [192.168.1.102] ([178.176.76.126])
        by smtp.gmail.com with ESMTPSA id j17sm351117ljq.136.2021.08.12.08.56.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Aug 2021 08:56:37 -0700 (PDT)
Subject: Re: [PATCH v6 3/3] arm64: dts: renesas: r9a07g044: Add USB2.0 device
 support
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20210812151808.7916-1-biju.das.jz@bp.renesas.com>
 <20210812151808.7916-4-biju.das.jz@bp.renesas.com>
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Message-ID: <2f5f8999-260d-e9c0-731e-df644b528b61@gmail.com>
Date:   Thu, 12 Aug 2021 18:56:36 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210812151808.7916-4-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 8/12/21 6:18 PM, Biju Das wrote:

> Add USB2.0 device support to RZ/G2L SoC DT.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
[...]
> diff --git a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
> index de78c921af22..2f313c2a81c7 100644
> --- a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
> @@ -391,6 +391,25 @@
>  			power-domains = <&cpg>;
>  			status = "disabled";
>  		};
> +
> +		hsusb: usb@11c60000 {
> +			compatible = "renesas,usbhs-r9a07g044",
> +				     "renesas,rza2-usbhs";
> +			reg = <0 0x11c60000 0 0x10000>;
> +			interrupts = <GIC_SPI 100 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;

   Don't we need to specify "interrupt-names" when there a more than 1 interrupts?

> +			clocks = <&cpg CPG_MOD R9A07G044_USB_PCLK>,
> +				 <&cpg CPG_MOD R9A07G044_USB_U2P_EXR_CPUCLK>;

   And "clock-names" too?

> +			resets = <&phyrst 0>,
> +				 <&cpg R9A07G044_USB_U2P_EXL_SYSRST>;

   And "reset-names"?

[...]

MBR, Sergei
