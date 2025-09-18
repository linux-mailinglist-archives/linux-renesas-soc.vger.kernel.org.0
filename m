Return-Path: <linux-renesas-soc+bounces-20147-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id ADDB1B1E745
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Aug 2025 13:28:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 497D47A02F1
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Aug 2025 11:26:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F8F4276023;
	Fri,  8 Aug 2025 11:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="B4ST1Bxh"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99995276033
	for <linux-renesas-soc@vger.kernel.org>; Fri,  8 Aug 2025 11:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754652349; cv=none; b=VyhxLFHHHMT99KgaR3xdSkDeWAInmBJPGb7jkqFuClW8YGPVCNfvw760qaCb7eZEINXS0FD2KieOCNVgau9DAgwsqqwAQUpCnLQsvcY8lo9Q99sKwXN+LZ5SqCD/0VGpxS8pii6xMSWsgJogmEUg139dfWPIJZ9lNA6EZU2Qq48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754652349; c=relaxed/simple;
	bh=QA+SPUv+ZJM564GNbwnCFpJZjmCakzVI2B7d0dDz/P0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kj2c1CQlZK6fj+VVG2RQw06HXYbd9dhTzmWptmloG+t2OB6s5TiTj874uBIuiFeJU8gxuaVqdLH5vNcKH8RpyiXZXIViSxxufV/gwVQqV9PgUnG9FIktfQTzN2O2dRBIwmd+vkaphnJG5YzuQzzFqwdRL/sRPRpjAFsCWMdOgjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=B4ST1Bxh; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3b786421e36so1047774f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 08 Aug 2025 04:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1754652345; x=1755257145; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1f6xy+aBOaPKs56VR9kjp6cxPwtioSpnzbBMEVe8kGI=;
        b=B4ST1BxhwH48Z49rewmBOYuuKHqK7zc55gHqNZJJXhgFp+EHc+tKNMkCOtWvF9AWpe
         9mmhjj/RhsSRMqZ0MSvotKyPi5Lfm3EMVWkVKE8nVKgZfFlsfGGpAkBonRcFvnInGI8Z
         G5BgYHruv8iZCoWdS2iwvfzDF78EBuZ7YwHRfhawXE6cA2gaJQ0XECZCrUtvjIPt4OTT
         dTo+GO7MCI70U/tuai1oAFZSUI2z5eg3KUcZeYRV3rnHigrISuz7ZRReuSuAVI8oVDfq
         p7mIZl5brtJ3heD2P6idvBH6ItqWyjC3126U1bqz5qwqOueg09x487B1QVX5ps/qMovM
         r4xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754652345; x=1755257145;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1f6xy+aBOaPKs56VR9kjp6cxPwtioSpnzbBMEVe8kGI=;
        b=NFOamUGgfhluh5lgGGnwr97NQIN7Gb7Jp1qB9E9wBaNkyN/BRRy49oe9YmjXSk51Xa
         QlE2qBEr+nFfAnZZp3AGfdJfL2vQKQDh+/GkP7Tc94PVNr+f9DBh6f2knWCcheAFfF8y
         BHLrWTw1FgJIrMw67vGlPYvv16HNDGDNSWdXSadQLnD4jyStlX0eMkWpb3sCJ+5aNQtM
         wX/yTzIBOYL0GH2z6QCzUkX82CEmkKQrCIPF5s1YMWtdCUtBH0VDkQ7qjQXZyBsMbFEu
         wzIMszPeuAPkIAA2kxdaQpRi0ic++24Jtasnr2Zyb5/AXtR0WiydZ1Pi8PbmsmA3WByX
         g01w==
X-Forwarded-Encrypted: i=1; AJvYcCXl3W68O8IPT4UAEE9FXY+VvHchNAr9ViA83CLpAZZC0JIkB6ElIZY0rolD62/Owq5H3Fed0mMuTHdL+H3y28FlkA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzSK3SmfiRPvlZcBS4FUPYLMFbj9Fc0ponBsac/3pPBPK6TsKjX
	x8btYy42WOv4EnDkmwRreNu4tJKhZHs5htjnQZklJXP+x90r2uxr4pruaiX5XoZAsjo=
X-Gm-Gg: ASbGncstodjtCoDrvk6NzTUd0F/NZ/9yAeNxM6Kh40hb6ps6tLhSFUmsq15CGj1xDb+
	K/DpzStFGquFp7D8ufJ4xJ7Q7ZHuuS6hwclN6b1bbUTgaaefgtTwt6e+vXeJbG7QhsIfBc8O/Oh
	3WI3w/AT9blk7iyIB7WYm91zbG1ZVvr9bYm1FRWdRhPrGmA3+uRQauvfNExzoSqt1bH+52djpeO
	wOfKlU/mZcmxkegxpg+Xw4+gpI/LPMmZhPEd2ITOfthG/zPMsoTjI3WToATeq1lymORcimHT+oa
	77AEHSg2OzjZo/g2d1XEwoBDmZ0a9RqD8oykV0AS57Hi67sJ0/j8CxlGAMGy8XXnudm6O3xNCHN
	kEjJTZHTr7BTxmPl+HUeim1Lqc32YJ5Cj4zEHVp0Dlg==
X-Google-Smtp-Source: AGHT+IG+d+QVEEJZwj2dMpvlEXKWBGDwCt68UnmyWGJ/cwYSS+LXI8Tj/fvC7ktt2tblrQA7hmZ3Sw==
X-Received: by 2002:a05:6000:24c5:b0:3b7:8f49:94f7 with SMTP id ffacd0b85a97d-3b900b4d8b6mr2051559f8f.31.1754652344801;
        Fri, 08 Aug 2025 04:25:44 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.188])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459e58553f8sm141920125e9.14.2025.08.08.04.25.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Aug 2025 04:25:44 -0700 (PDT)
Message-ID: <71d109a1-211a-45ee-8525-03f1859b789a@tuxon.dev>
Date: Fri, 8 Aug 2025 14:25:42 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/9] dt-bindings: PCI: renesas,r9a08g045s33-pcie: Add
 documentation for the PCIe IP on Renesas RZ/G3S
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org,
 mani@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 geert+renesas@glider.be, magnus.damm@gmail.com, catalin.marinas@arm.com,
 will@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
 p.zabel@pengutronix.de, lizhi.hou@amd.com, linux-pci@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, Claudiu Beznea
 <claudiu.beznea.uj@bp.renesas.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
References: <20250708163407.GA2149616@bhelgaas>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20250708163407.GA2149616@bhelgaas>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Bjorn,

On 08.07.2025 19:34, Bjorn Helgaas wrote:
> On Fri, Jul 04, 2025 at 07:14:04PM +0300, Claudiu wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> The PCIe IP available on the Renesas RZ/G3S complies with the PCI Express
>> Base Specification 4.0. It is designed for root complex applications and
>> features a single-lane (x1) implementation. Add documentation for it.
> 
>> +++ b/Documentation/devicetree/bindings/pci/renesas,r9a08g045s33-pcie.yaml
> 
> The "r9a08g045s33" in the filename seems oddly specific.  Does it
> leave room for descendants of the current chip that will inevitably be
> added in the future?  Most bindings are named with a fairly generic
> family name, e.g., "fsl,layerscape", "hisilicon,kirin", "intel,
> keembay", "samsung,exynos", etc.
> 
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/r9a08g045-cpg.h>
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +
>> +    bus {
>> +        #address-cells = <2>;
>> +        #size-cells = <2>;
>> +
>> +        pcie@11e40000 {
>> +            compatible = "renesas,r9a08g045s33-pcie";
>> +            reg = <0 0x11e40000 0 0x10000>;
>> +            ranges = <0x02000000 0 0x30000000 0 0x30000000 0 0x8000000>;
>> +            dma-ranges = <0x42000000 0 0x48000000 0 0x48000000 0 0x38000000>;
>> +            bus-range = <0x0 0xff>;
>> +            clocks = <&cpg CPG_MOD R9A08G045_PCI_ACLK>,
>> +                     <&cpg CPG_MOD R9A08G045_PCI_CLKL1PM>;
>> +            clock-names = "aclk", "pm";
>> +            resets = <&cpg R9A08G045_PCI_ARESETN>,
>> +                     <&cpg R9A08G045_PCI_RST_B>,
>> +                     <&cpg R9A08G045_PCI_RST_GP_B>,
>> +                     <&cpg R9A08G045_PCI_RST_PS_B>,
>> +                     <&cpg R9A08G045_PCI_RST_RSM_B>,
>> +                     <&cpg R9A08G045_PCI_RST_CFG_B>,
>> +                     <&cpg R9A08G045_PCI_RST_LOAD_B>;
>> +            reset-names = "aresetn", "rst_b", "rst_gp_b", "rst_ps_b",
>> +                          "rst_rsm_b", "rst_cfg_b", "rst_load_b";
>> +            interrupts = <GIC_SPI 395 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 396 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 397 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 398 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 399 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 400 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 401 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 402 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 403 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 404 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 405 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 406 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 407 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 408 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 409 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 410 IRQ_TYPE_LEVEL_HIGH>;
>> +            interrupt-names = "serr", "serr_cor", "serr_nonfatal",
>> +                              "serr_fatal", "axi_err", "inta",
>> +                              "intb", "intc", "intd", "msi",
>> +                              "link_bandwidth", "pm_pme", "dma",
>> +                              "pcie_evt", "msg", "all";
>> +            #interrupt-cells = <1>;
>> +            interrupt-controller;
>> +            interrupt-map-mask = <0 0 0 7>;
>> +            interrupt-map = <0 0 0 1 &pcie 0 0 0 0>, /* INT A */
>> +                            <0 0 0 2 &pcie 0 0 0 1>, /* INT B */
>> +                            <0 0 0 3 &pcie 0 0 0 2>, /* INT C */
>> +                            <0 0 0 4 &pcie 0 0 0 3>; /* INT D */
> 
> The spec styles these closed up: "INTA", "INTB", etc.

I'll update it.

> 
>> +            device_type = "pci";
>> +            num-lanes = <1>;
>> +            #address-cells = <3>;
>> +            #size-cells = <2>;
>> +            power-domains = <&cpg>;
>> +            vendor-id = <0x1912>;
>> +            device-id = <0x0033>;
> 
> Some of this is specific to a Root Port, not to the Root Complex as a
> whole.  E.g., device-type = "pci", num-lanes, vendor-id, device-id,
> are Root Port properties.  Some of the resets, clocks, and interrupts
> might be as well.
> 
> I really want to separate those out because even though this
> particular version of this PCIe controller only supports a single Root
> Port, there are other controllers (and possibly future iterations of
> this controller) that support multiple Root Ports, and it makes
> maintenance easier if the DT bindings and the driver structures are
> similar.

I'll ask the Renesas HW team about the resets and clocks as the HW manual
don't offer any information about this.

If they will confirm some of the clocks and/or resets could be controlled
as part of a port then patch 3/9 "PCI: of_property: Restore the arguments
of the next level parent" in this series will not be needed anymore. Would
you prefer me to abandon it or post it as individual patch, if any?

> 
> This email includes pointers to sample DT bindings and driver code
> that is structured to allow multiple Root Ports:
> 
>   https://lore.kernel.org/linux-pci/20250625221653.GA1590146@bhelgaas/

Thank you for this!

And, thank you for your review,
Claudiu

> 
> Bjorn


