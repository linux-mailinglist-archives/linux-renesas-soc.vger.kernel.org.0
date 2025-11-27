Return-Path: <linux-renesas-soc+bounces-25269-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E27C8E794
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Nov 2025 14:31:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6326D3B2DE0
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Nov 2025 13:30:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 923B22773F8;
	Thu, 27 Nov 2025 13:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eTlK3v2U"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 631F42750ED;
	Thu, 27 Nov 2025 13:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764250233; cv=none; b=CCZ6B5XetZlKWCfR5BamqzMwJtVFgQtASM2nJD+0b74YUf9tPZgwCp2rN+aOtx1oked4wRfE4KWdYo3PabK8RBVZYbcbAjzovbCtj4S8cxIPkqk3k4luemi8ht4hHSxZWtJgpK9zq1k0RyH8XSVxf9cxa9wYTmdQpCD56xe0by0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764250233; c=relaxed/simple;
	bh=Prjok+iXF1v1hGeCvqQIR+6Jng3EBvwwFgpQYwSmgbQ=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=Qr+oc0tWdq+gBox0/Nn1RgJK1jeE53drPXBkJGrxnIKAn3OBwtdn3lhVWVsATcQ+mXHmn7xVLNAjAfAlUGn6EZwa5nlbp9tYdUcA4vSlAxC1DXL1rc4qD3gVHCTZQyVM1qMYmRpyTY8dRR5PlsQ7DPsz7dKwcB/O4KbWWXifURg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eTlK3v2U; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA2C8C4CEF8;
	Thu, 27 Nov 2025 13:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764250233;
	bh=Prjok+iXF1v1hGeCvqQIR+6Jng3EBvwwFgpQYwSmgbQ=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=eTlK3v2UNpOgmiFtMX2GWXFkE7uP5RVqAs0OSVzfZn4Bwz6U5zZOVEreVXmiDYsnU
	 OtW0asZhPl4FCezktxsV++OB4kd16Zgf4FtUICE/KdKVnkbcD2EUTuv7Ss+q53szBp
	 LMNuNIEu3kYrzysDNwUYtaw1yyfFvfPSydxrz6NW9/Qxew0CGYbEcWefXieL6piTDu
	 6RhdKI6Vba18PePUkWV3gD/u42DT9KqpfUAJIqcIZxVIIsZjzpOfnGEfTwUOZHGFhz
	 YeQdQjL/qaYZwb+tMB2W7AYE2225oIG3cb1fMzSlXWARLaZz5HBhOy2JTlDPZYf4iN
	 gpHha8HIOSyKA==
Date: Thu, 27 Nov 2025 07:30:31 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, Peter Rosin <peda@axentia.se>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Georgi Djakov <djakov@kernel.org>, 
 Jonathan Cameron <jonathan.cameron@huawei.com>, tomm.merciai@gmail.com, 
 Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 biju.das.jz@bp.renesas.com, Magnus Damm <magnus.damm@gmail.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Conor Dooley <conor+dt@kernel.org>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 linux-phy@lists.infradead.org, 
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
 linux-renesas-soc@vger.kernel.org, Mark Brown <broonie@kernel.org>, 
 Guenter Roeck <linux@roeck-us.net>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <d0518a64bac31a5a755471f79d6000aa81657503.1764241212.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1764241212.git.tommaso.merciai.xr@bp.renesas.com>
 <d0518a64bac31a5a755471f79d6000aa81657503.1764241212.git.tommaso.merciai.xr@bp.renesas.com>
Message-Id: <176425022262.4101597.2096782802654822701.robh@kernel.org>
Subject: Re: [PATCH v5 01/22] dt-bindings: mux: Remove nodename pattern
 constraints


On Thu, 27 Nov 2025 12:48:28 +0100, Tommaso Merciai wrote:
> The nodename pattern in  created an unnecessary restriction that forced
> all mux nodes to be named with the 'mux-controller' prefix.
> This prevented valid use cases where mux functionality is part of other
> hardware blocks that should use more specific naming conventions.
> 
> Remove the $nodename pattern constraints from both the 'select' keyword
> and the properties section of the mux-controller schema.
> 
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> ---
> v4->v5:
>  - Added Reviewed-by tag from Conor Dooley.
> 
> v3->v4:
>  - New patch.
> 
>  Documentation/devicetree/bindings/mux/mux-controller.yaml | 6 ------
>  1 file changed, 6 deletions(-)
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

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/d0518a64bac31a5a755471f79d6000aa81657503.1764241212.git.tommaso.merciai.xr@bp.renesas.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


