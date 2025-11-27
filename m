Return-Path: <linux-renesas-soc+bounces-25270-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74783C8E7A0
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Nov 2025 14:31:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5B9043B30ED
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Nov 2025 13:30:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA4C527FD44;
	Thu, 27 Nov 2025 13:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EONxN74B"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCE0827B357;
	Thu, 27 Nov 2025 13:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764250234; cv=none; b=nIJFCDfyCESVNeJPM4mIjAmU/eES26vNQMHnzXjGq3DivpOULCd+u9+ruhVQz98hha274+zd8NLc0vZEKf6FMl+fcKna3xyhTRTj8T/pAuZTya4DanmhI78PT0rYd9q/sptk5a6jIbwDGC6h2QuIskhUpVSJvKijNyhR/QG9J6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764250234; c=relaxed/simple;
	bh=cn9VrPGx8O8d67Cq596Nucl4T2GLkQ6vC881WnyUEDY=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=UiVTm9VMg7MJIyrzIaTsLjqi4CSmdsV8hZgssFP0wDvlYk5Wz+PANFNFnzCrhsG2oGKbNI/VA1+Ad2ouQQTMsqwiHwI7iCeI7+Y6VtmGYG3UpduYC+UksL3kpJZvyydN0qguTZ2oYa8bJHKVG+yc+VkB5pCpypXD99LZIK0lwCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EONxN74B; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40D41C4CEF8;
	Thu, 27 Nov 2025 13:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764250234;
	bh=cn9VrPGx8O8d67Cq596Nucl4T2GLkQ6vC881WnyUEDY=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=EONxN74BponLklBaZkMH8KM86rZ3lNcF/RhvEyMW0etFJXTAZ05DalnkSESNuB5/x
	 N7p+UkAlhsFVXxEO/gDRIzQgvjSMLEVtPnkSQshArzLU8BiCOgfSDS5oRtg+SVPMpB
	 YNFfVsUJZstuvpg8+ehymmX91Dth1zlsvkkDHtK0NB1N6e19MN/5P77BJAqxGfVJCT
	 wYC7LrYl05k17vja2eqA4IJoVlq08MGnB+xzGvBFIXS4HGMOL2SzeHwKi0UJ67p7Ji
	 boYE40kZVbCTQdH11Erhs+KwCg76zF6ZEzYtf0b1rc6XQT6JtK4WeIWVo98Gxn7hPi
	 zGntbACHxZWVQ==
Date: Thu, 27 Nov 2025 07:30:33 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
 linux-phy@lists.infradead.org, tomm.merciai@gmail.com, 
 Vinod Koul <vkoul@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 biju.das.jz@bp.renesas.com, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Guenter Roeck <linux@roeck-us.net>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Mark Brown <broonie@kernel.org>, 
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
 linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 devicetree@vger.kernel.org, Peter Rosin <peda@axentia.se>, 
 Jonathan Cameron <jonathan.cameron@huawei.com>, 
 Georgi Djakov <djakov@kernel.org>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <9848482be3655a9351a13cdbf815db6b556201d0.1764241212.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1764241212.git.tommaso.merciai.xr@bp.renesas.com>
 <9848482be3655a9351a13cdbf815db6b556201d0.1764241212.git.tommaso.merciai.xr@bp.renesas.com>
Message-Id: <176425022416.4101652.1368465209303910384.robh@kernel.org>
Subject: Re: [PATCH v5 05/22] dt-bindings: reset: renesas,rzv2h-usb2phy:
 Add '#mux-state-cells' property


On Thu, 27 Nov 2025 12:48:32 +0100, Tommaso Merciai wrote:
> Add the '#mux-state-cells' property to support describing the USB VBUS_SEL
> multiplexer as a mux-controller in the Renesas RZ/V2H(P) USB2PHY binding.
> 
> The mux-controller cannot be integrated into the parent USB2PHY node
> because the VBUS source selector is part of a separate hardware block,
> not the USB2PHY block itself.
> 
> This is required to properly configure USB PHY power selection on
> RZ/V2H(P) and RZ/G3E SoCs.
> 
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> ---
> v4->v5:
>  - No changes
> 
> v3->v4:
>  - Switch back to v2 implementation.
>  - Improve commit body.
> 
> v2->v3:
>  - Manipulate mux-controller as an internal node.
>  - Improved commit body.
> 
> v1->v2:
>  - New patch
> 
>  .../bindings/reset/renesas,rzv2h-usb2phy-reset.yaml          | 5 +++++
>  1 file changed, 5 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/9848482be3655a9351a13cdbf815db6b556201d0.1764241212.git.tommaso.merciai.xr@bp.renesas.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


