Return-Path: <linux-renesas-soc+bounces-25271-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A57C8E7AF
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Nov 2025 14:32:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 37F103539C3
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Nov 2025 13:31:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FF9828750A;
	Thu, 27 Nov 2025 13:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="olDXfODV"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66527287243;
	Thu, 27 Nov 2025 13:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764250236; cv=none; b=aie2kdyfKJ+y5p9GY0nkoRwSMB1/lU2H7sk/0INPOYe/0DS9GGpyMytT48x4ZrUdopkBOPUKwwmYWDOdvZvaDkr6EDYgTqQausFagmynGWXOM4jZm7AygXgYBxoT+LLTWr6xOJ97tLPz7jXUNUU9BkZ+lf87flYCTKk4s7t2nj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764250236; c=relaxed/simple;
	bh=Iwo7c+gTV15uWo/DLGABqk68Tu9bHSjs5z33OjF7zo0=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=r/OV3Fkqxg0jJ0uDIfmCgIGGDpEHQb+YPyf4Q8FOKg52IVO8P7cbcQYN2WFlkoP7oWOnVNm0xKPx0H/DMIHYomAQJKZyeobkmTiISH3D6yB4ZO6P8V+77a4oTobosMPjrzOUTorBkNfSXCPi3MWr8MnKa5wj2WRJQlzds4IPvPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=olDXfODV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A674BC4CEFB;
	Thu, 27 Nov 2025 13:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764250235;
	bh=Iwo7c+gTV15uWo/DLGABqk68Tu9bHSjs5z33OjF7zo0=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=olDXfODVbYLJx3/tYA6VsaG6KrHqm4QcIkm7sAfnfuYxSpZzN18Fro96R600bEQq1
	 EhuMYaGC8n1Jx3Ng1CVmX15dcZkIphAaaUfNV5Ejk15jno0NG6nQ/wUH4bCXK8ZaGq
	 vDSAnrKQQNkp3Pd9ajobH1n33PiaB1C/F7ximvquzsd2USqfxcPRaga+zlwHuN8NtY
	 3ohLbvSCyyd/QRdGMdwuU5rcQOjgK9TfnHNjoNlAABgsTd9DRbhpJTV/HX6CzR+X95
	 fnnIKWtsf2ZJJBKeEgnml30rjMp2Zhh5nWcKuneL9VADb4Ap3HkOXkZEBLANC8tu1e
	 0hSsqavHY2l6Q==
Date: Thu, 27 Nov 2025 07:30:34 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Guenter Roeck <linux@roeck-us.net>, Vinod Koul <vkoul@kernel.org>, 
 linux-kernel@vger.kernel.org, Georgi Djakov <djakov@kernel.org>, 
 Peter Rosin <peda@axentia.se>, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor.dooley@microchip.com>, tomm.merciai@gmail.com, 
 Arnd Bergmann <arnd@arndb.de>, 
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
 linux-phy@lists.infradead.org, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Jonathan Cameron <jonathan.cameron@huawei.com>, biju.das.jz@bp.renesas.com, 
 Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org, 
 Philipp Zabel <p.zabel@pengutronix.de>, linux-renesas-soc@vger.kernel.org, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Mark Brown <broonie@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <40bb7feff08d6564dcccf50ff51bfcd3023b5ef6.1764241212.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1764241212.git.tommaso.merciai.xr@bp.renesas.com>
 <40bb7feff08d6564dcccf50ff51bfcd3023b5ef6.1764241212.git.tommaso.merciai.xr@bp.renesas.com>
Message-Id: <176425022557.4101692.10561712884961832980.robh@kernel.org>
Subject: Re: [PATCH v5 08/22] dt-bindings: phy: renesas,usb2-phy: Document
 USB VBUS regulator


On Thu, 27 Nov 2025 12:48:35 +0100, Tommaso Merciai wrote:
> Document the 'vbus-regulator' child node in the Renesas USB2 PHY binding
> to describe the internal USB VBUS regulator.
> 
> Require this regulator node on OTG channels to accurately represent
> hardware dependencies in the device tree.
> 
> Documenting this regulator allows device trees to model the VBUS power
> requirements of these SoCs properly.
> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> ---
> v4->v5:
>  - No changes
> 
> v3->v4:
>  - No changes
> 
> v2->v3:
>  - No changes
> 
> v1->v2:
>  - Collected CDooley tag
> 
>  Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/40bb7feff08d6564dcccf50ff51bfcd3023b5ef6.1764241212.git.tommaso.merciai.xr@bp.renesas.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


