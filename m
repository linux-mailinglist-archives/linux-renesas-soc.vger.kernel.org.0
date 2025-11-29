Return-Path: <linux-renesas-soc+bounces-25390-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 26105C94595
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 29 Nov 2025 18:23:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id CE6774E1216
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 29 Nov 2025 17:23:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 690B92773CB;
	Sat, 29 Nov 2025 17:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BmZnVym6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35A829475;
	Sat, 29 Nov 2025 17:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764436995; cv=none; b=IaeZAwskRnmAZA+PfI0pg9uGWGqhkg2ol1rWGDMzllR77GFDsMg1CBVqWM3AjZxsZRwv2auTiYMo7fMDk/xRogjgoVcfeZ9JrUkzqp8yPg/NP34PaFgHCEsgPH7TZraZaxUayKwgWGSs+KOWn6sMNRai077SIioUl4LCBZWIULg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764436995; c=relaxed/simple;
	bh=hcf0tmmS2hYQVgxM04bUNP6aZ50+ZdT+pgjr2voqQZs=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=WODRA1mx9XPsTiCUIbXFpi07uxF6XVrWxlpNPDApqg1CoyTrxDV45qfeOhrtiWtxwMZohXsSDRdR9u+TBOG1+ercYMyWe5dYbMVjpCZYqpQGR1Rd/1vA9HZ8KUjQ8S2IKG4/Kz8HW6BU6nkI3P6sMzHcCsLFhbtOKSNxU/a7iq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BmZnVym6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F234C4CEF7;
	Sat, 29 Nov 2025 17:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764436994;
	bh=hcf0tmmS2hYQVgxM04bUNP6aZ50+ZdT+pgjr2voqQZs=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=BmZnVym62T9pOToXgo3TRIXQhqhDaqGCp9apcAXQKDne8ZpnzBipOiq8zF2iFiiW3
	 E6QTN/G9phedlmcC6mCMkLUttvRLcjTDkdyVCKT7pjOQnvK/OyhAUAStID3yTMqqFy
	 y1e7cf5dzWpeKnTfJ9LVeCLEi5nTO97RKbap97EH80o0xy7Xedxlpo9BHTlVRzTuAj
	 c4IBrmwl611PE/f6fRIyx8x+MK0kz6z0ePXgLhS2iAiAyBGHSaCeS7uMqm75Ic+euI
	 OY6rXsrCrJgN17273rWFrjq9uKjMmSKZUIBFJ8YjCJ5nKMOhal2qCFNdJV/6oLdstW
	 mYJhdPrxbzUHA==
Date: Sat, 29 Nov 2025 11:23:13 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, Jiri Slaby <jirislaby@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Biju Das <biju.das.jz@bp.renesas.com>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 linux-serial@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Biju <biju.das.au@gmail.com>
In-Reply-To: <20251129164325.209213-2-biju.das.jz@bp.renesas.com>
References: <20251129164325.209213-1-biju.das.jz@bp.renesas.com>
 <20251129164325.209213-2-biju.das.jz@bp.renesas.com>
Message-Id: <176443699313.11808.1467058497468917565.robh@kernel.org>
Subject: Re: [PATCH v5 01/17] dt-bindings: serial: renesas,rsci: Document
 RZ/G3E support


On Sat, 29 Nov 2025 16:42:57 +0000, Biju wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
> 
> Add documentation for the serial communication interface (RSCI) found on
> the Renesas RZ/G3E (R9A09G047) SoC. The RSCI IP on this SoC is identical
> to that on the RZ/T2H (R9A09G077) SoC, but it has a 32-stage FIFO compared
> to 16 on RZ/T2H. It supports both FIFO and non-FIFO mode operation. RZ/G3E
> has 6 clocks(5 module clocks + 1 external clock) compared to 3 clocks
> (2 module clocks + 1 external clock) on RZ/T2H, and it has multiple resets.
> It has 6 interrupts compared to 4 on RZ/T2H.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v4->v5:
>  * Updated commit description related to IRQ difference
>  * Added aed and bfd irqs for RZ/G3E.
>  * Moved reset: false to RZ/T2H SoC and dropped the else part for RZ/G3E.
>  * Updated conditional schema with interrupts and interrupts-names.
>  * Dropped the tag as there are new changes.
> v3->v4:
>  * Dropped separate compatible for non-FIFO mode and instead using single
>    compatible "renesas,r9a09g047-rsci" as non-FIFO mode can be achieved
>    by software configuration.
>  * Renamed clock-names bus->pclk
>  * Rearranged clock-names tclk{4, 16, 64}
>  * Retained the tag as the changes are trivial.
> v2->v3:
>  * Dropped 1st and 3rd items from clk-names and added minItems for the
>    range.
>  * Added minItems for clk and clk-names for RZ/T2H as the range is 2-3
>  * Added maxItems for clk and clk-names for RZ/G3E as the range is 5-6
>  * Retained the tag as it is trivial change.
> v1->v2:
>  * Updated commit message
>  * Added resets:false for non RZ/G3E SoCs.
> ---
>  .../bindings/serial/renesas,rsci.yaml         | 99 ++++++++++++++++---
>  1 file changed, 88 insertions(+), 11 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/thermal/thermal-zones.example.dtb: /example-0/soc/thermal-sensor@c263000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
Documentation/devicetree/bindings/thermal/thermal-zones.example.dtb: /example-0/soc/thermal-sensor@c263000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
Documentation/devicetree/bindings/thermal/thermal-zones.example.dtb: /example-0/soc/thermal-sensor@c265000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
Documentation/devicetree/bindings/thermal/thermal-zones.example.dtb: /example-0/soc/thermal-sensor@c265000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
Documentation/devicetree/bindings/thermal/thermal-sensor.example.dtb: /example-0/soc/thermal-sensor@c263000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
Documentation/devicetree/bindings/thermal/thermal-sensor.example.dtb: /example-0/soc/thermal-sensor@c263000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
Documentation/devicetree/bindings/thermal/thermal-sensor.example.dtb: /example-0/soc/thermal-sensor@c265000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
Documentation/devicetree/bindings/thermal/thermal-sensor.example.dtb: /example-0/soc/thermal-sensor@c265000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20251129164325.209213-2-biju.das.jz@bp.renesas.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


