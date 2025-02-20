Return-Path: <linux-renesas-soc+bounces-13441-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 651C9A3E4E3
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Feb 2025 20:17:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 20A753A98F6
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Feb 2025 19:17:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3A5724BD10;
	Thu, 20 Feb 2025 19:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gb6cTjiq"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C490615A858;
	Thu, 20 Feb 2025 19:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740079040; cv=none; b=X6QFw3xDnDdKa3FoH0FCnjqh/AyRd/BChdYPMI+P/13C6B6O1l/StAEHo9FnFG0QrxQZH2bQxaMkDq6QSa2OLPNpUCg6+g/etRJ7jFMX3JJNCaphUsL7/66S9yAugu/QZjYYBqI0eeHfC5Qd4NItu/US4BBiLdV4iVDK3GToZvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740079040; c=relaxed/simple;
	bh=lkpi7G9jCAF4vbm6a82bVaSbXE3wZ94p94V1Wbfso6Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F4UN+HW49Ux8GyxVNqVJEGlWdUXsD7cXKArx3p6/Rcz8lzq3tzplOg6t+Aw6EYgJQkGWPV1WIrtaLB2sIlI2PWv1v0vpmFLpoJjGbXWe9T9R09ekJ8XSnSnHllOSyNRyphqFopEq1ukdpMkMIZrofQ2R/ieolxy/jXAIQXsn/E0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gb6cTjiq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 060E6C4CED1;
	Thu, 20 Feb 2025 19:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740079039;
	bh=lkpi7G9jCAF4vbm6a82bVaSbXE3wZ94p94V1Wbfso6Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gb6cTjiqo42jcTPslkZNuOozcBM/CXdf5Fp8wJmu1lv/yAUJWc9b8T+7NpHp8OZ3I
	 ESrqW3aRykQDSDHW8DVT+vQYCPvySEW3Aw/Ukh2XZ7Wi88suGJ1cabBYo2YQmLiTT3
	 wmo3Uo46havAbMmKJziRL0/Ll8THvG2pXwQx+OcWQW0PlISCtZXvPjR3YiX4k4vnk7
	 QNMgfw34SmhSXslPwYRi5vamgTjBBFSc1ea9v31jXP+VjgX7PMHGnnSKZ4xFg1ZW0l
	 mJBQYbjIybfv3hIm8oubdJe9lu5f1rVQTtu7kj5tty/5+lyXbCp9ASKu4aoU8AfVFv
	 uIHWC5PX1/DWQ==
Date: Thu, 20 Feb 2025 13:17:18 -0600
From: Rob Herring <robh@kernel.org>
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: mturquette@baylibre.com, magnus.damm@gmail.com, krzk+dt@kernel.org,
	rui.zhang@intel.com, daniel.lezcano@linaro.org, sboyd@kernel.org,
	geert+renesas@glider.be, lukasz.luba@arm.com, rafael@kernel.org,
	p.zabel@pengutronix.de, biju.das.jz@bp.renesas.com,
	claudiu.beznea.uj@bp.renesas.com, conor+dt@kernel.org,
	devicetree@vger.kernel.org, john.madieu@gmail.com,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH 3/7] dt-bindings: thermal: r9a09g047-tsu: Document the
 TSU unit
Message-ID: <20250220191718.GA3642117-robh@kernel.org>
References: <20250220152640.49010-1-john.madieu.xa@bp.renesas.com>
 <20250220152640.49010-4-john.madieu.xa@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250220152640.49010-4-john.madieu.xa@bp.renesas.com>

On Thu, Feb 20, 2025 at 04:26:08PM +0100, John Madieu wrote:
> The Renesas RZ/G3E SoC includes a Thermal Sensor Unit (TSU) block designed
> to measure the junction temperature. The device provides real-time temperature
> measurements for thermal management, utilizing a single dedicated channel
> (channel 1) for temperature sensing.
> 
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> ---
>  .../thermal/renesas,r9a09g047-tsu.yaml        | 123 ++++++++++++++++++
>  1 file changed, 123 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/thermal/renesas,r9a09g047-tsu.yaml
> 
> diff --git a/Documentation/devicetree/bindings/thermal/renesas,r9a09g047-tsu.yaml b/Documentation/devicetree/bindings/thermal/renesas,r9a09g047-tsu.yaml
> new file mode 100644
> index 000000000000..dbd3860a31d0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/thermal/renesas,r9a09g047-tsu.yaml
> @@ -0,0 +1,123 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/thermal/renesas,r9a09g047-tsu.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas RZ/G3E Temperature Sensor Unit (TSU)
> +
> +maintainers:
> +  - John Madieu <john.madieu.xa@bp.renesas.com>
> +
> +description: |

Don't need '|' if there is no formatting to preserve.

> +  The Temperature Sensor Unit (TSU) is an integrated thermal sensor that monitors

Wrap lines at <80 char.

> +  the chip temperature on the Renesas RZ/G3E SoC. The TSU provides real-time
> +  temperature measurements for thermal management.
> +
> +properties:
> +  compatible:
> +    const: renesas,r9a09g047-tsu
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  interrupts:
> +    description: |
> +      Interrupt specifiers for the TSU:
> +      - S12TSUADI1: Conversion complete interrupt signal (pulse)
> +      - S12TSUADCMPI1: Comparison result interrupt signal (level)
> +
> +  interrupt-names:
> +    items:
> +      - const: S12TSUADI1
> +      - const: S12TSUADCMPI1

Odd names for the interrupts... 'S12TSUAD' is the same for both, so that 
part is redundant from my perspective. I guess if these strings are 
meaningful for anyone familiar with this h/w, then it's fine.

> +
> +  "#thermal-sensor-cells":
> +    const: 0
> +
> +  renesas,tsu-calibration-sys:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: |
> +      Phandle to the system controller (sys) that contains the TSU
> +      calibration values used for temperature calculations.
> +
> +  renesas,tsu-operating-mode:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [0, 1]
> +    description: |
> +      TSU operating mode:
> +      0: Mode 0 - Conversion started by software
> +      1: Mode 1 - Conversion started by ELC trigger
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - resets
> +  - power-domains
> +  - interrupts
> +  - interrupt-names
> +  - "#thermal-sensor-cells"
> +  - renesas,tsu-operating-mode
> +  - renesas,tsu-calibration-sys
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/renesas,r9a09g047-cpg.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    tsu: thermal@14002000 {
> +        compatible = "renesas,r9a09g047-tsu";
> +        reg = <0 0x14002000 0 0x1000>;
> +        clocks = <&cpg CPG_MOD 0x10a>;
> +        resets = <&cpg 0xf8>;
> +        power-domains = <&cpg>;
> +        interrupts = <GIC_SPI 250 IRQ_TYPE_EDGE_RISING>,
> +                     <GIC_SPI 251 IRQ_TYPE_LEVEL_HIGH>;
> +        interrupt-names = "S12TSUADI1", "S12TSUADCMPI1";
> +        #thermal-sensor-cells = <0>;
> +        renesas,tsu-operating-mode = <0>;
> +        renesas,tsu-calibration-sys = <&sys>;
> +    };
> +
> +    thermal-zones {
> +        cpu-thermal {
> +            polling-delay = <1000>;
> +            polling-delay-passive = <250>;
> +            thermal-sensors = <&tsu>;
> +
> +            cooling-maps {
> +                map0 {
> +                    trip = <&target>;
> +                    cooling-device = <&cpu0 0 3>, <&cpu1 0 3>,
> +                                     <&cpu2 0 3>, <&cpu3 0 3>;
> +                    contribution = <1024>;
> +                };
> +            };
> +
> +            trips {
> +                target: trip-point {
> +                    temperature = <95000>;
> +                    hysteresis = <1000>;
> +                    type = "passive";
> +                };
> +
> +                sensor_crit: sensor-crit {
> +                    temperature = <120000>;
> +                    hysteresis = <1000>;
> +                    type = "critical";
> +                };
> +            };
> +        };
> +    };
> -- 
> 2.25.1
> 

