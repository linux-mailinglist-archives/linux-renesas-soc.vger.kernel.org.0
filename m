Return-Path: <linux-renesas-soc+bounces-20924-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A9CB32068
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 Aug 2025 18:23:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4489C5860A5
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 Aug 2025 16:20:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD6B92727F3;
	Fri, 22 Aug 2025 16:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IMi+85sx"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D129239567;
	Fri, 22 Aug 2025 16:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755879644; cv=none; b=bUZhR9eDSsKbUkHXLkTwCTO6dp3CHf5/V+svqgVy4+xhcdLP/HJN/AvkqaFesdIS+zLZrXQOCPYfi4NYtNHpJLZIRxy9/+UXuX/NrIFNW0s67IymMJxHaaMWnwhu8M+6Pea58TFtOGp9NW4BKlV95U5tnx225CnMmDsiGtbGH4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755879644; c=relaxed/simple;
	bh=O6G/Aax9AfaMy7cKL+RsehhRcoBaJheJ6T/fA+30ExQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CpaXoqdI0MjjwOXu5EnG9dwQXnQw1GZyNAJQ+SFOOiM6tsVvOIoLLNpCXJnBqQfyCP1ps5t8Gp9yEBnLeY0qB3om3ta234OSREk1YDej2+bkf0d1sGQX9HuIMDdU4W4gvlF3erXswCOJWrLtD2ra8qcs/ZmxWGb9ofiOODv8x5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IMi+85sx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDDF6C4CEED;
	Fri, 22 Aug 2025 16:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755879644;
	bh=O6G/Aax9AfaMy7cKL+RsehhRcoBaJheJ6T/fA+30ExQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IMi+85sxc1/ebXZRbIBpo4iBm8lXcoJfP4+kwGGXyCpjHfoNtlDFDvNC/LW32XO4r
	 CG1JJYVPeLew2z7dIrQFOGnnO7d/RYV4Q7bE5hDMMRLewFNS3ZAYr7Ud1/yAAXkRx/
	 43vth9t6BDB7bdpNfbUPyU/OLIEPq+9oLdm4sx8UVGEtYY4PRE2ZyVDwg126Zglmc0
	 nUR3ZTKPMEIxqlVMtaaCiNxeHM5ZE680VhZGM8jB5oravxZ/44se1K4ikBk+fdcWKU
	 jKRTNZGfB+o7+Mf9OFihrQBdnqt1bXTW7k50TNsx3YGRbBSRhCQR7IICOhPh3wTMFZ
	 4RShDckUvXiMQ==
Date: Fri, 22 Aug 2025 11:20:43 -0500
From: Rob Herring <robh@kernel.org>
To: Biju <biju.das.au@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 06/11] dt-bindings: usb: Document Renesas RZ/G3E USB3HOST
Message-ID: <20250822162043.GA3920949-robh@kernel.org>
References: <20250820171812.402519-1-biju.das.jz@bp.renesas.com>
 <20250820171812.402519-7-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250820171812.402519-7-biju.das.jz@bp.renesas.com>

On Wed, Aug 20, 2025 at 06:17:53PM +0100, Biju wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
> 
> Document the Renesas RZ/G3E USB3.2 Gen2 Host Controller (a.k.a USB3HOST).
> The USB3HOST is compliant with the Universal Serial Bus 3.2 Specification
> Revision 1.0.
>  - Supports 1 downstream USB receptacles
>      - Number of SSP Gen2 or SS ports: 1
>      - Number of HS or FS or LS ports: 1
>  - Supports Super Speed Plus Gen2x1 (10 Gbps), Super Speed (5 Gbps),
>    High Speed (480 Mbps), Full Speed (12Mbps), and Low Speed (1.5 Mbps).
>  - Supports all transfer-types: Control, Bulk, Interrupt, Isochronous, and
>    these split-transactions.
>  - Supports Power Control and Over Current Detection.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  .../bindings/usb/renesas,rzg3e-xhci.yaml      | 84 +++++++++++++++++++
>  1 file changed, 84 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/renesas,rzg3e-xhci.yaml
> 
> diff --git a/Documentation/devicetree/bindings/usb/renesas,rzg3e-xhci.yaml b/Documentation/devicetree/bindings/usb/renesas,rzg3e-xhci.yaml
> new file mode 100644
> index 000000000000..2f73ea2e1e78
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/renesas,rzg3e-xhci.yaml
> @@ -0,0 +1,84 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/usb/renesas,rzg3e-xhci.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas RZ/G3E USB 3.2 Gen2 Host controller
> +
> +maintainers:
> +  - Biju Das <biju.das.jz@bp.renesas.com>
> +

Common USB and XHCI properties don't apply?

> +properties:
> +  compatible:
> +    const: renesas,r9a09g047-xhci
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    items:
> +      - description: Logical OR of all interrupt signals.
> +      - description: System management interrupt
> +      - description: Host system error interrupt
> +      - description: Power management event interrupt
> +      - description: xHC interrupt
> +
> +  interrupt-names:
> +    items:
> +      - const: all
> +      - const: smi
> +      - const: hse
> +      - const: pme
> +      - const: xhc
> +
> +  clocks:
> +    maxItems: 1
> +
> +  phys:
> +    maxItems: 2
> +
> +  phy-names:
> +    items:
> +      - const: usb2-phy
> +      - const: usb3-phy
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - interrupt-names
> +  - clocks
> +  - power-domains
> +  - resets
> +  - phys
> +  - phy-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/renesas,r9a09g047-cpg.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    usb@15850000 {
> +      compatible = "renesas,r9a09g047-xhci";
> +      reg = <0x15850000 0x10000>;
> +      interrupts = <GIC_SPI 759 IRQ_TYPE_LEVEL_HIGH>,
> +                   <GIC_SPI 758 IRQ_TYPE_LEVEL_HIGH>,
> +                   <GIC_SPI 757 IRQ_TYPE_LEVEL_HIGH>,
> +                   <GIC_SPI 756 IRQ_TYPE_LEVEL_HIGH>,
> +                   <GIC_SPI 755 IRQ_TYPE_LEVEL_HIGH>;
> +      interrupt-names = "all", "smi", "hse", "pme", "xhc";
> +      clocks = <&cpg CPG_MOD 0xaf>;
> +      power-domains = <&cpg>;
> +      resets = <&cpg 0xaa>;
> +      phys = <&usb3_phy>, <&usb3_phy>;
> +      phy-names = "usb2-phy", "usb3-phy";
> +    };
> -- 
> 2.43.0
> 

