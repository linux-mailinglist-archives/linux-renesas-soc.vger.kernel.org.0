Return-Path: <linux-renesas-soc+bounces-321-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B3D37FB648
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Nov 2023 10:51:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7AE95B21604
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Nov 2023 09:51:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 189624B5B2;
	Tue, 28 Nov 2023 09:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VePyDTgJ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C41CEDD
	for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Nov 2023 01:51:06 -0800 (PST)
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-54b0e553979so4482153a12.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Nov 2023 01:51:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701165065; x=1701769865; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4uMBANKaqpPmKTnnSwXs+PN4+MO+y59jIe/Y85fpLPg=;
        b=VePyDTgJ82yr77aDG2OlqneDMYkd+Ttc8J5/jA78DHpN7MZbOVU7Mqpf7l9HBIDas5
         G4j/E4vSSHxLKHqdeY6LlG2HGHP63M/IekGVZfCx/weTfr6q1aV7ZXA6blqbZTxqUDsT
         FVCTcCaX9iQW4A/7O+VTSeZp86RnGXvMNG5e3+WQ8MlJHBJnCMPDMOweo1f99epBtEMh
         lta8lN622zwugAUI50P2qOt1KDFOQEw8S2cbN2SixA5tn4cxycOgaf3D8CTa06coFTqd
         4vn4HqLOsvVja5QTqwRhIOEv9U58/uW2D0qkGrAF2EPwPwBtdfR8N0RBlwTd56VHywne
         u7zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701165065; x=1701769865;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4uMBANKaqpPmKTnnSwXs+PN4+MO+y59jIe/Y85fpLPg=;
        b=XdqwQ5+X2GFbqxwdbWEM9yz3oAyxG2nihmq3ieFUtAFbH61hbQ0aEkeXxl2OLiE+nf
         sPQRHgCh/aD+l9iSpEFi7urS4L1HujXQyTcY0V9gVyWy3HTyQHHxv0X0vlTh1srYS0yB
         Cim//T+XSQWHKywVnj38iZIl1u4D4ZCV+OOHmdKqwhjU5NYuXW8oWR7jqZHs/eG3oZYd
         TKiSHFAtkyoZOqWveykywernaelDkQIfHVcbpB21vKccerF27OGTEKtZC613mh03oVZx
         co2q8DRQtan/cWbXGq3KIVFMYTJAidzNaiHxK+Cfbk+t19EpBdileJoY0C0419habn4r
         u3bw==
X-Gm-Message-State: AOJu0YwpjTk39hl1PDx1KCoG1a2QLz8cFO4wT8YhnZUUXUFa4kP0I53d
	jjDdxbr+aNgF1VjA4HQUPPOYyQ==
X-Google-Smtp-Source: AGHT+IHLwCtp5smMD5qxAQb0nxZH5y1fMrNXvZVipJH8dwdMFyh2QW8AXAS+ZuwYCr6Wax1gczsg3w==
X-Received: by 2002:a17:907:1686:b0:a12:bde:7acc with SMTP id cx6-20020a170907168600b00a120bde7accmr2182793ejd.67.1701165065253;
        Tue, 28 Nov 2023 01:51:05 -0800 (PST)
Received: from [192.168.1.20] ([178.197.223.109])
        by smtp.gmail.com with ESMTPSA id i17-20020a170906265100b009ff10bfcefbsm6627368ejc.106.2023.11.28.01.51.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Nov 2023 01:51:04 -0800 (PST)
Message-ID: <deacc7ea-6fad-47d6-978b-3f639aa5da35@linaro.org>
Date: Tue, 28 Nov 2023 10:51:03 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: renesas: Document preferred compatible
 naming
Content-Language: en-US
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?=
 <niklas.soderlund+renesas@ragnatech.se>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20231125232821.234631-1-niklas.soderlund+renesas@ragnatech.se>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20231125232821.234631-1-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26/11/2023 00:28, Niklas Söderlund wrote:
> Compatibles can come in two formats. Either "vendor,ip-soc" or
> "vendor,soc-ip". Add a DT schema file documenting Renesas preferred
> policy and enforcing it for all new compatibles, except few existing
> patterns.
> 
> Suggested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
> * Changes since RFC
> - Moved to Documentation/devicetree/bindings/soc/renesas.
> - Changed the pattern in the initial select to match on .*-.*.
> - Added a lot of missing compatible values.
> 
> Compared to the RFC I did not use make dt_binding_check and manual
> reading of the bindings to find all compatibles. Instead I generated
> YAML of all renesas related files under arch/arm and arc/arm64 and
> parsed all the compatible values.
> 
> For v6.7-rc2 the hits on each pattern where,
> 
> ^renesas,emev2-[a-z0-9-]+$ = 14
> ^renesas,r7s[0-9]+-[a-z0-9-]+$ = 58
> ^renesas,r8a[a-z0-9]+-[a-z0-9-]+$ = 1661
> ^renesas,r9a[0-9]+g[a-z0-9]+-[a-z0-9-]+$ = 160
> ^renesas,rcar-[a-z0-9-]+$ = 4522
> ^renesas,rz-[a-z0-9-]+$ = 26
> ^renesas,rza-[a-z0-9-]+$ = 4
> ^renesas,rza1-[a-z0-9-]+$ = 10
> ^renesas,rza2-[a-z0-9-]+$ = 6
> ^renesas,rzg2l-[a-z0-9-]+$ = 54
> ^renesas,rzn1[a-z0-9]*-[a-z0-9-]+$ = 22
> ^renesas,rzv2m-[a-z0-9-]+$ = 9
> ^renesas,sh-[a-z0-9-]+$ = 36
> ^renesas,sh7[a-z0-9]+-[a-z0-9-]+$ = 27
> renesas,cpg-div6-clock = 45
> renesas,cpg-mstp-clocks = 49
> renesas,intc-irqpin = 20
> renesas,smp-sram = 20
> ^renesas,can-[a-z0-9]+$ = 136
> ^renesas,dmac-[a-z0-9]+$ = 326
> ^renesas,du-[a-z0-9]+$ = 77
> ^renesas,ether-[a-z0-9]+$ = 21
> ^renesas,etheravb-[a-z0-9]+$ = 84
> ^renesas,etheravb-rcar-gen[0-9]$ = 82
> ^renesas,gether-[a-z0-9]+$ = 4
> ^renesas,gpio-[a-z0-9]+$ = 608
> ^renesas,hscif-[a-z0-9]+$ = 336
> ^renesas,i2c-[a-z0-9]+$ = 517
> ^renesas,iic-[a-z0-9]+$ = 118
> ^renesas,intc-ex-[a-z0-9]+$ = 58
> ^renesas,intc-irqpin-[a-z0-9]+$ = 10
> ^renesas,ipmmu-[a-z0-9]+$ = 828
> ^renesas,irqc-[a-z0-9]+$ = 22
> ^renesas,jpu-[a-z0-9]+$ = 6
> ^renesas,mmcif-[a-z0-9]+$ = 29
> ^renesas,msiof-[a-z0-9]+$ = 290
> ^renesas,pci-[a-z0-9]+$ = 38
> ^renesas,pci-rcar-gen[0-9]$ = 36
> ^renesas,pcie-[a-z0-9]+$ = 105
> ^renesas,pcie-rcar-gen[0-9]$ = 105
> ^renesas,pfc-[a-z0-9]+$ = 84
> ^renesas,pwm-[a-z0-9]+$ = 984
> ^renesas,qspi-[a-z0-9]+$ = 21
> ^renesas,rcar_sound-[a-z0-9]+$ = 136
> ^renesas,riic-[a-z0-9]+$ = 64
> ^renesas,rspi-[a-z0-9]+$ = 48
> ^renesas,sata-[a-z0-9]+(-es1)?$ = 38
> ^renesas,scif-[a-z0-9]+$ = 506
> ^renesas,scifa-[a-z0-9]+$ = 108
> ^renesas,scifb-[a-z0-9]+$ = 57
> ^renesas,sdhi-[a-z0-9]+$ = 294
> ^renesas,thermal-[a-z0-9]+$ = 22
> ^renesas,tmu-[a-z0-9]+$ = 298
> ^renesas,tpu-[a-z0-9]+$ = 44
> ^renesas,usb-phy-[a-z0-9]+$ = 18
> ^renesas,usb2-phy-[a-z0-9]+$ = 118
> ^renesas,usbhs-[a-z0-9]+$ = 86
> ^renesas,vin-[a-z0-9]+$ = 523
> ^renesas,xhci-[a-z0-9]+$ = 59
> renesas,bsc-r8a73a4 = 1
> renesas,bsc-sh73a0 = 1
> renesas,dbsc-r8a73a4 = 2
> renesas,dbsc3-r8a7740 = 1
> renesas,em-gio = 5
> renesas,em-sti = 1
> renesas,em-uart = 5
> renesas,fsi2-r8a7740 = 1
> renesas,fsi2-sh73a0 = 1
> renesas,hspi-r8a7778 = 3
> renesas,hspi-r8a7779 = 3
> renesas,imr-lx4 = 36
> renesas,mtu2-r7s72100 = 3
> renesas,rmobile-iic = 116
> renesas,sbsc-sh73a0 = 2
> renesas,sdhi-mmc-r8a77470 = 1
> renesas,shmobile-flctl-sh7372 = 0
> renesas,sysc-r8a73a4 = 1
> renesas,sysc-r8a7740 = 1
> renesas,sysc-rmobile = 3
> renesas,sysc-sh73a0 = 1
> renesas,usb-dmac = 144
> 
> This do not include the examples in the bindings YAML files. So there is
> on hit, renesas,shmobile-flctl-sh7372, that is not used in an upstream
> DTS.
> ---
>  .../bindings/soc/renesas/renesas-soc.yaml     | 126 ++++++++++++++++++
>  1 file changed, 126 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/renesas/renesas-soc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/soc/renesas/renesas-soc.yaml b/Documentation/devicetree/bindings/soc/renesas/renesas-soc.yaml
> new file mode 100644
> index 000000000000..4674c1f61c1e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/renesas/renesas-soc.yaml
> @@ -0,0 +1,126 @@
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
> +      # Preferred naming style for compatibles of SoC components:
> +      - pattern: "^renesas,emev2-[a-z0-9-]+$"
> +      - pattern: "^renesas,r7s[0-9]+-[a-z0-9-]+$"
> +      - pattern: "^renesas,r8a[a-z0-9]+-[a-z0-9-]+$"
> +      - pattern: "^renesas,r9a[0-9]+g[a-z0-9]+-[a-z0-9-]+$"
> +      - pattern: "^renesas,rcar-[a-z0-9-]+$"
> +      - pattern: "^renesas,rz-[a-z0-9-]+$"
> +      - pattern: "^renesas,rza-[a-z0-9-]+$"
> +      - pattern: "^renesas,rza1-[a-z0-9-]+$"
> +      - pattern: "^renesas,rza2-[a-z0-9-]+$"
> +      - pattern: "^renesas,rzg2l-[a-z0-9-]+$"
> +      - pattern: "^renesas,rzn1[a-z0-9]*-[a-z0-9-]+$"
> +      - pattern: "^renesas,rzv2m-[a-z0-9-]+$"
> +      - pattern: "^renesas,sh-[a-z0-9-]+$"
> +      - pattern: "^renesas,sh7[a-z0-9]+-[a-z0-9-]+$"

Why so many different patterns? Why it cannot be for example:
"^renesas,rz[a-z0-9]*-[a-z0-9-]+$" to cover multiple entries?

The point is not to validate the devices. Other bindings do it. The
point is to have one or two patterns to enforce ordering of SoC-block.

The size of this file suggests you either over-complicated the thing or
there is little benefit of adding it.

> +
> +      # SoC agnostic compatibles - new compatibles are OK:

Why new compatibles are ok?

> +      - enum:
> +          - renesas,cpg-div6-clock
> +          - renesas,cpg-mstp-clocks
> +          - renesas,intc-irqpin
> +          - renesas,smp-sram

smp-sram can have new compatibles? I am sorry, but this needs explanation...

> +
> +      # Legacy namings - variations of existing patterns/compatibles are OK,
> +      # but do not add completely new entries to these:
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

No, wait, you basically listed most of the SoC as exceptions. What SoC
blocks exactly are you going to cover in such case with your rules?



Best regards,
Krzysztof


