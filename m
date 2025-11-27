Return-Path: <linux-renesas-soc+bounces-25303-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F8C7C8FA07
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Nov 2025 18:16:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8010A4E5E54
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Nov 2025 17:16:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08C1C2E88B6;
	Thu, 27 Nov 2025 17:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eVtr/4g9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D01212E7F20;
	Thu, 27 Nov 2025 17:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764263775; cv=none; b=pfST2TzRPaKN9EyS66zuID/AfSyJOgO7vzHo05s3FM8FhGsAOy+qTlRK7xV9aHZq1AUgHMDIZSyI/ov4TwbZW5Uv7K8vwkAKCmyZ1zvp7svTnSQfHqjYjku2nGgYF+rJ+qggz5LT9cHt51knUD2jDeceU4Sv5StU0zvu8UwVWqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764263775; c=relaxed/simple;
	bh=l1I6cYpnh3zAO6BKqG9Cg75L5iGgzyvEe82eT8sUQkg=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=Q3DBTyNWaMAflwQunYZKiCWq+IorwPtWBaSMN1PYNbdi7cKZjuoSc9okOwDTPcI3bQKzlnw2a4OC7j/CxoAJi0+DGhb5dBztkow2DDiN0t2V+CApHLebnFGnFvHfG5TWxv1XqC+iJ94xzrVs2E6XMytWDzGjtyGeQ0J/5EYk2Lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eVtr/4g9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3869BC4CEF8;
	Thu, 27 Nov 2025 17:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764263775;
	bh=l1I6cYpnh3zAO6BKqG9Cg75L5iGgzyvEe82eT8sUQkg=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=eVtr/4g9goTQkC4s7DzryeW0CzTyfk0VibI8paXIoF/S0smBoI5fvFy7DN9nhJ4OT
	 5g6UNZFJbFmq2JLMducbLJItxODCRxa80uoLlZaDjjxoqp/TqDlPnKtpiWAbKeqIlf
	 vMRIyj5fvoZAAQjiEp6eZWnx2whn3KZhO6Wn0pklWDR2+TIZ0Gefrum22Hm6eWFYp4
	 A7J22V8/reGeGwrZT59HViZhDwQaGRRtUaWKGP31D25LH0APVaadcBDPOkdoEHldQW
	 HK4hbs9WwH3V1OoALxW2S0OzZdd+Cs6jbAU70yvOwUAxxvk518XeNHSP/GMcHmHZiO
	 FNqc0p9eyXGKQ==
Date: Thu, 27 Nov 2025 11:16:13 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, 
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 Biju Das <biju.das.jz@bp.renesas.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
In-Reply-To: <20251127162447.320971-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20251127162447.320971-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20251127162447.320971-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Message-Id: <176426377371.294874.17331116412829860585.robh@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: interrupt-controller:
 renesas,rzv2h-icu: Document RZ/V2N SoC


On Thu, 27 Nov 2025 16:24:46 +0000, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Document the Interrupt Control Unit (ICU) used on the Renesas RZ/V2N SoC.
> Although the ICU closely matches the design found on the RZ/V2H(P) family,
> it differs in its register layout, particularly in the reduced set of
> ECCRAM related registers. These variations require a distinct compatible
> string so that software can correctly match and handle the RZ/V2N
> implementation.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v1->v2:
> - Dropped using RZ/V2H compatible as a fallback.
> ---
>  .../bindings/interrupt-controller/renesas,rzv2h-icu.yaml         | 1 +
>  1 file changed, 1 insertion(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/slimbus/slimbus.example.dtb: slim@28080000 (qcom,slim-ngd-v1.5.0): 'audio-codec@1,0' does not match any of the regexes: '^pinctrl-[0-9]+$', '^slim@[0-9a-f]+$'
	from schema $id: http://devicetree.org/schemas/slimbus/qcom,slim-ngd.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/slimbus/slimbus.example.dtb: slim@28080000 (qcom,slim-ngd-v1.5.0): #address-cells: 1 was expected
	from schema $id: http://devicetree.org/schemas/slimbus/qcom,slim-ngd.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/slimbus/slimbus.example.dtb: slim@28080000 (qcom,slim-ngd-v1.5.0): 'dmas' is a required property
	from schema $id: http://devicetree.org/schemas/slimbus/qcom,slim-ngd.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/slimbus/slimbus.example.dtb: slim@28080000 (qcom,slim-ngd-v1.5.0): 'dma-names' is a required property
	from schema $id: http://devicetree.org/schemas/slimbus/qcom,slim-ngd.yaml
Documentation/devicetree/bindings/thermal/thermal-sensor.example.dtb: /example-0/soc/thermal-sensor@c263000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
Documentation/devicetree/bindings/thermal/thermal-sensor.example.dtb: /example-0/soc/thermal-sensor@c263000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
Documentation/devicetree/bindings/thermal/thermal-sensor.example.dtb: /example-0/soc/thermal-sensor@c265000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
Documentation/devicetree/bindings/thermal/thermal-sensor.example.dtb: /example-0/soc/thermal-sensor@c265000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20251127162447.320971-2-prabhakar.mahadev-lad.rj@bp.renesas.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


