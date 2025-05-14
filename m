Return-Path: <linux-renesas-soc+bounces-17098-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C54CAB6A5E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 May 2025 13:43:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9ACF91B640E6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 May 2025 11:42:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 919C22749C0;
	Wed, 14 May 2025 11:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="LyE2LB9E"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1018B277038
	for <linux-renesas-soc@vger.kernel.org>; Wed, 14 May 2025 11:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747222876; cv=none; b=V8YrX+Hgxaoxo1XCtysgrhIvpMLox4E6ax2sz6fzchBFW0J6ZTCT1hrusD41fdqUWN2RnJNH0XK8brktoytZa8nOwpwpb3lISl2XssDF/2K+6SXfsQPOZgdq/KUwMgxGQv3oUvPpQqkP1Cm3c5KJfiIyVnvN9bh2ce/9B1CvFV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747222876; c=relaxed/simple;
	bh=7JkTC5mLx9u4BimVTeAQi6DGPhg7Opww3j1Bu0kfoWs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HOYZVWOt3LNy4KRWJ5WM57U0mqVBDYk4H61MR1CGmZWDKEtNCAoC0INt7fd3JlSn9I9q7016I0Scb+KOeLBp1UMTFVSU2GYHByV/IYxuDgBwyCW+/CUOB3Z8xv+sYrMV7UkGBcH0HOdVvjeyeWpqMIO8vJGyE4WaXKnBnnnjjeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=LyE2LB9E; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a0bd7f4cd5so5780558f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 May 2025 04:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1747222872; x=1747827672; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1iaWgi2+6QGoD6Bh6MAYJTWH0TqBtpBBy9hMdUN0b9I=;
        b=LyE2LB9EWey131iU5nV94RgjWBZKnmJV0FNFC6RW8e0LVClQ6L0sU2qFOPQXrHwxGU
         e6VZuimb85awUW8bsm7nzIdRoQ4dATJstSAZneMU21yY1ZoiJSdELXuqy+y8Cw7vH8R+
         /eyxR9ngJJfI6STayDqFHoZWVaQdgIBCx16lLhdDvjp+UNH3yyP2qyoIdIboPgNnCgvU
         buBqynTieGow6Kkv+WMT3JcY9kpQIorkDebV3WNxgDttmGqs91g5KWYF+0eQrPQr5ayz
         GqYymkFhYXI1QXuCxDnytLqoDK/9cduJV/v3ezPqjpjOKkb183CevRY0biPgnmr7lAKX
         9hNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747222872; x=1747827672;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1iaWgi2+6QGoD6Bh6MAYJTWH0TqBtpBBy9hMdUN0b9I=;
        b=Y5i798q/bH0+lD5yInl8BNLedT3ZEw2kqd7aup1uFltyi6mRyGpLttfCfs6wz5SBkX
         ltdVMP26WR4L55hCo62hZHXACFWX9szuBaZt1i0YQFBhRSFRNXSqxxDKUuFq8Tk2+GmF
         kPcWsTZPW+gqt1uugymssmTB8lKt7ZIXoSR7NQdir/JzTcDk5im5FByH7FbquI6SBxSb
         /NPWHa4u4CTAChZHbtCA0Bnr+Ax5zEt2aRNSpAGV8ZqOTRn25jM5kvfGrzmwpe8h7M+g
         +XWgFK+/VpkTFlIOuv/XftANv81d2BbTDzPtTmOqI2K+wzJR8RSS60LWpH85e/tvwONk
         itNQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7by19xAO1XOYDczBxdLYxaHDv6AOow2tr/jqyvSbzBxDFHjbXFAdh+UaoMLIUGVV1S4ZJz65UUH2saXsz3uM1tw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzvubj+F924XUkaaAwcni2gNiCW8YAr548gTfPJD7RMFRwerg8A
	NuTD0+AqqR+SkAs3D8p6GsBGnjucA14U7fuZI1k8ktbiDCNMZS5TFPiJdDO4+yo=
X-Gm-Gg: ASbGncv00HQsiJQugH2yanmk0ry7KMJWQQ8WkfS6RH988LGJsMCZuWOMudYVaz/3R4U
	ssYbUJYHoHxW/SyMrA777cXpJRa0DrCDHaPT2YBOosmCaGugvoJS3wJVWmfW3wGxiXKNRhLm/PB
	YyUfeh9i8GS+esezihe2pJr5nWo9H0oH0VhfHZSvpf2YJZFPp+mP23E+UbuE/8wjVpJ9ZpYgpjJ
	Rn5Vt13JHISJm2IocZmLc3zXCMRLWaX9dHc8uQPxblUohU/C/ISfW2qZYasMIxYomLUkeHp4OJr
	5WOejm28oWRSK6cPHEE+Rz362e3ftOihknZGxrfRp1AZp9VhtabXJCyFFys=
X-Google-Smtp-Source: AGHT+IH2CN5E5d5IiEul9fORo75uv9zJHPufVjipSowLqASUDKgEkIqOTizOIqaf2tZjC9ZhGWR8Tg==
X-Received: by 2002:a05:6000:1868:b0:3a0:7aa3:cc74 with SMTP id ffacd0b85a97d-3a34969a54dmr2881005f8f.6.1747222872006;
        Wed, 14 May 2025 04:41:12 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f5a2d2f4sm19387956f8f.78.2025.05.14.04.41.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 May 2025 04:41:11 -0700 (PDT)
Message-ID: <2b2efbf8-a5df-4f2b-8660-67fc13168f58@tuxon.dev>
Date: Wed, 14 May 2025 14:41:08 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] dt-bindings: PCI: renesas,r9a08g045s33-pcie: Add
 documentation for the PCIe IP on Renesas RZ/G3S
To: Rob Herring <robh@kernel.org>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, kw@linux.com,
 manivannan.sadhasivam@linaro.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 geert+renesas@glider.be, magnus.damm@gmail.com, mturquette@baylibre.com,
 sboyd@kernel.org, saravanak@google.com, p.zabel@pengutronix.de,
 linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20250430103236.3511989-1-claudiu.beznea.uj@bp.renesas.com>
 <20250430103236.3511989-5-claudiu.beznea.uj@bp.renesas.com>
 <20250509210800.GB4080349-robh@kernel.org>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20250509210800.GB4080349-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Rob,

On 10.05.2025 00:08, Rob Herring wrote:
> On Wed, Apr 30, 2025 at 01:32:32PM +0300, Claudiu wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> The PCIe IP available on the Renesas RZ/G3S complies with the PCI Express
>> Base Specification 4.0. It is designed for root complex applications and
>> features a single-lane (x1) implementation. Add documentation for it.
>> The interrupts, interrupt-names, resets, reset-names, clocks, clock-names
>> description were obtained from the hardware manual.
>>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>> ---
>>  .../pci/renesas,r9a08g045s33-pcie.yaml        | 242 ++++++++++++++++++
>>  1 file changed, 242 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/pci/renesas,r9a08g045s33-pcie.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/pci/renesas,r9a08g045s33-pcie.yaml b/Documentation/devicetree/bindings/pci/renesas,r9a08g045s33-pcie.yaml
>> new file mode 100644
>> index 000000000000..354f9c3be139
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/pci/renesas,r9a08g045s33-pcie.yaml
>> @@ -0,0 +1,242 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/pci/renesas,r9a08g045s33-pcie.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Renesas RZ/G3S PCIe host controller
>> +
>> +maintainers:
>> +  - Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>> +
>> +description:
>> +  Renesas RZ/G3S PCIe host controller complies with PCIe Base Specification
>> +  4.0 and supports up to 5 GT/s (Gen2).
>> +
>> +properties:
>> +  compatible:
>> +    const: renesas,r9a08g045s33-pcie # RZ/G3S
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    items:
>> +      - description: System error interrupt
>> +      - description: System error on correctable error interrupt
>> +      - description: System error on non-fatal error interrupt
>> +      - description: System error on fatal error interrupt
>> +      - description: AXI error interrupt
>> +      - description: INTA interrupt
>> +      - description: INTB interrupt
>> +      - description: INTC interrupt
>> +      - description: INTD interrupt
>> +      - description: MSI interrupt
>> +      - description: Link bandwidth interrupt
>> +      - description: PME interrupt
>> +      - description: DMA interrupt
>> +      - description: PCIe event interrupt
>> +      - description: Message interrupt
>> +      - description: All interrupts
>> +
>> +  interrupt-names:
>> +    items:
>> +      - description: int_serr
>> +      - description: int_ser_cor
>> +      - description: int_serr_nonfatal
>> +      - description: int_serr_fatal
>> +      - description: axi_err_int
>> +      - description: inta_rc
>> +      - description: intb_rc
>> +      - description: intc_rc
>> +      - description: intd_rc
>> +      - description: intmsi_rc
> 
> Isn't every interrupt for the root complex?

It is! I just used the names that were available in the hardware manual.
I'll drop the "_rc" it in the next version.

> 
>> +      - description: int_link_bandwidth
>> +      - description: int_pm_pme
>> +      - description: dma_int
>> +      - description: pcie_evt_int
>> +      - description: msg_int
>> +      - description: int_all
> 
> 'int_' or '_int' is redundant (and inconsistent). Drop.

OK

> 
>> +
>> +  clocks:
>> +    items:
>> +      - description: System clock
>> +      - description: PM control clock
>> +
>> +  clock-names:
>> +    items:
>> +      - description: aclk
>> +      - description: clkl1pm
> 
> 'l1pm' or 'pm'

OK

> 
>> +
>> +  resets:
>> +    items:
>> +      - description: AXI2PCIe Bridge reset
>> +      - description: Data link layer/transaction layer reset
>> +      - description: Transaction layer (ACLK domain) reset
>> +      - description: Transaction layer (PCLK domain) reset
>> +      - description: Physical layer reset
>> +      - description: Configuration register reset
>> +      - description: Configuration register reset
>> +
>> +  reset-names:
>> +    items:
>> +      - description: aresetn
>> +      - description: rst_b
>> +      - description: rst_gp_b
>> +      - description: rst_ps_b
>> +      - description: rst_rsm_b
>> +      - description: rst_cfg_b
>> +      - description: rst_load_b
>> +
>> +  power-domains:
>> +    maxItems: 1
>> +
>> +  dma-ranges:
>> +    description:
>> +      A single range for the inbound memory region.
>> +    maxItems: 1
>> +
>> +  renesas,sysc:
>> +    description: System controller phandle
>> +    $ref: /schemas/types.yaml#/definitions/phandle
>> +
>> +  vendor-id:
>> +    const: 0x1912
>> +
>> +  device-id:
>> +    const: 0x0033
>> +
>> +  legacy-interrupt-controller:
>> +    description: Interrupt controller node for handling legacy PCI interrupts
>> +    type: object
>> +
>> +    properties:
>> +      "#address-cells":
>> +        const: 0
>> +
>> +      "#interrupt-cells":
>> +        const: 1
>> +
>> +      interrupt-controller: true
>> +
>> +      interrupts:
>> +        items:
>> +          - description: INTA interrupt
>> +          - description: INTB interrupt
>> +          - description: INTC interrupt
>> +          - description: INTD interrupt
>> +
>> +    required:
>> +      - "#address-cells"
>> +      - "#interrupt-cells"
>> +      - interrupt-controller
>> +      - interrupts
>> +
>> +    additionalProperties: false
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +  - resets
>> +  - reset-names
>> +  - interrupts
>> +  - interrupt-names
>> +  - interrupt-map
>> +  - interrupt-map-mask
>> +  - power-domains
>> +  - "#address-cells"
>> +  - "#size-cells"
>> +  - "#interrupt-cells"
>> +  - renesas,sysc
>> +  - vendor-id
>> +  - device-id
>> +
>> +allOf:
>> +  - $ref: /schemas/pci/pci-host-bridge.yaml#
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/r9a08g045-cpg.h>
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +
>> +    bus {
>> +        #address-cells = <2>;
>> +        #size-cells = <2>;
>> +
>> +        gic: interrupt-controller {
>> +            interrupt-controller;
>> +            #interrupt-cells = <3>;
>> +        };
> 
> Drop. Don't need to show provider nodes for the example.

This was needed for the schema to compile with the intx node.

> 
>> +
>> +        pcie@11e40000 {
>> +            compatible = "renesas,r9a08g045s33-pcie";
>> +            reg = <0 0x11e40000 0 0x10000>;
>> +            ranges = <0x03000000 0 0x30000000 0 0x30000000 0 0x8000000>;
>> +            dma-ranges = <0x42000000 0 0x48000000 0 0x48000000 0 0x8000000>;
>> +            bus-range = <0x0 0xff>;
>> +            clocks = <&cpg CPG_MOD R9A08G045_PCI_ACLK>,
>> +                     <&cpg CPG_MOD R9A08G045_PCI_CLKL1PM>;
>> +            clock-names = "aclk", "clkl1pm";
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
> 
> It is very odd that you have the INTx interrupts here and below.
> 
> As I mentioned in the driver, you don't need the legacy node any more. 
> Just add 'interrupt-controller' to this node and point interrupt-map to 
> this node.
Will try it like this.

Thank you for your review,
Claudiu

> 
>> +                         <GIC_SPI 404 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 405 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 406 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 407 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 408 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 409 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 410 IRQ_TYPE_LEVEL_HIGH>;
>> +            interrupt-names = "int_serr", "int_serr_cor", "int_serr_nonfatal",
>> +                              "int_serr_fatal", "axi_err_int", "inta_rc",
>> +                              "intb_rc", "intc_rc", "intd_rc",
>> +                              "intmsi_rc", "int_link_bandwidth", "int_pm_pme",
>> +                              "dma_int", "pcie_evt_int", "msg_int",
>> +                              "int_all";
>> +            #interrupt-cells = <1>;
>> +            interrupt-map-mask = <0 0 0 7>;
>> +            interrupt-map = <0 0 0 1 &pcie_intx 0>, /* INT A */
>> +                            <0 0 0 2 &pcie_intx 1>, /* INT B */
>> +                            <0 0 0 3 &pcie_intx 2>, /* INT C */
>> +                            <0 0 0 4 &pcie_intx 3>; /* INT D */
>> +            device_type = "pci";
>> +            num-lanes = <1>;
>> +            #address-cells = <3>;
>> +            #size-cells = <2>;
>> +            power-domains = <&cpg>;
>> +            renesas,sysc = <&sysc>;
>> +            vendor-id = <0x1912>;
>> +            device-id = <0x0033>;
>> +
>> +            pcie_intx: legacy-interrupt-controller {
>> +                interrupt-controller;
>> +                #interrupt-cells = <1>;
>> +                #address-cells = <0>;
>> +                interrupt-parent = <&gic>;
>> +                interrupts = <GIC_SPI 400 IRQ_TYPE_LEVEL_HIGH>,
>> +                             <GIC_SPI 401 IRQ_TYPE_LEVEL_HIGH>,
>> +                             <GIC_SPI 402 IRQ_TYPE_LEVEL_HIGH>,
>> +                             <GIC_SPI 403 IRQ_TYPE_LEVEL_HIGH>;
>> +            };
>> +        };
>> +    };
>> +
>> +...
>> -- 
>> 2.43.0
>>


