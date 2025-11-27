Return-Path: <linux-renesas-soc+bounces-25272-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E4ECDC8E7AC
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Nov 2025 14:32:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id EF44D4E80DC
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Nov 2025 13:31:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B398E2BE047;
	Thu, 27 Nov 2025 13:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sOcCVY8b"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88E1A296BB3;
	Thu, 27 Nov 2025 13:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764250237; cv=none; b=SG+Ef9qsuRufmGvcpLkyMoxbJZAldkYOO5TowtNLyYUyeEtbz6QUq7jcY6FerHbPfNm0o0tLNLlK8+RQWdB3oLYIqEKFSCaOql3kpJQ9IoIc3+vj2wszoIkzbLB4FGGBfYmxHBIYoH5y03qXeRC+Yh0uWrUCZtw1asPR72wFgvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764250237; c=relaxed/simple;
	bh=b2yoGxwAA3ugcSh2vOXlMJhKFbpukq1Md+KWqVQY0I4=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=pc9My4vQ8hjyTx0RVE4S8POI7NpPn1M+NILwBxO4p2hJp/iDvaqJAEsbGnXWOkv1Vt6BgC6NCMqyEaVWLFqEDNoxYmM11icG3e8rxJMxy6RQBP/6Iq1d6+dn303HZYwX9GxjQOvwDm3hlsnObkYSLYCPL8dWhyOkNP4E9Nf9h+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sOcCVY8b; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B9B7C4CEF8;
	Thu, 27 Nov 2025 13:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764250237;
	bh=b2yoGxwAA3ugcSh2vOXlMJhKFbpukq1Md+KWqVQY0I4=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=sOcCVY8bn0GaKeo4jGywq3iw2Gk/iJxvIweigNPMCcLHsPmZYbIEHo4W3lM8wKiDv
	 F8SOLTN1nimsBTra9mfYaSyVRzwWZ6K9fg4x17oDwYTty7JGmk3HZb7xH57E/dOJad
	 iU6mNHrqoW+3JJGkkjvGbZp9i0/Ts5SAbo8bLDK9y2ePylD2pEjjmB6hhus6RirAyK
	 JgfLqp4tggIBJlgI2hkHk4Ni8OBBwescJFA7I0a5llDZghqgxHA9VEBKZ6v/J6Z8qz
	 U4KqEMoh4sDW2E0BDes+iAlQKIBtnp/qytRHuwsoXXgjP4pZVsf1omsYJzZQh30j+m
	 FDQxBM31jJTuQ==
Date: Thu, 27 Nov 2025 07:30:36 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: biju.das.jz@bp.renesas.com, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Georgi Djakov <djakov@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 linux-phy@lists.infradead.org, Magnus Damm <magnus.damm@gmail.com>, 
 linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
 linux-renesas-soc@vger.kernel.org, tomm.merciai@gmail.com, 
 Jonathan Cameron <jonathan.cameron@huawei.com>, 
 Mark Brown <broonie@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Guenter Roeck <linux@roeck-us.net>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, devicetree@vger.kernel.org, 
 Arnd Bergmann <arnd@arndb.de>, Peter Rosin <peda@axentia.se>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <5c5a85eb777f327e659cb3a969ebed8531c05a26.1764241212.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1764241212.git.tommaso.merciai.xr@bp.renesas.com>
 <5c5a85eb777f327e659cb3a969ebed8531c05a26.1764241212.git.tommaso.merciai.xr@bp.renesas.com>
Message-Id: <176425022696.4101743.14899408887981951821.robh@kernel.org>
Subject: Re: [PATCH v5 09/22] dt-bindings: phy: renesas,usb2-phy: Document
 mux-states property


On Thu, 27 Nov 2025 12:48:36 +0100, Tommaso Merciai wrote:
> Some Renesas SoCs, such as RZ/G3E, provide a USB2.0 OTG PHY with
> configurable VBUS control through a multiplexed hardware register.
> This register allows selecting the VBUS source via a mux control
> line exposed by the PHY.
> 
> To represent this hardware configuration, support the standard
> `mux-states` property in the Renesas USB2 PHY binding.
> This allows the DeviceTree to model the VBUS source selection as
> a mux, consistent with generic binding conventions.
> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> ---
> v4->v5:
>  - No changes.
> 
> v3->v4:
>  - Collected CDooley tag.
> 
> v2->v3:
>  - Improved commit body.
>  - Improved mux-states description.
> 
> v1->v2:
>  - New patch
> 
>  Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/5c5a85eb777f327e659cb3a969ebed8531c05a26.1764241212.git.tommaso.merciai.xr@bp.renesas.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


