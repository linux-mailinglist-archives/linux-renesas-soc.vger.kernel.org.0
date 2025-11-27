Return-Path: <linux-renesas-soc+bounces-25275-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D658C8E7D3
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Nov 2025 14:33:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 1C6A0354C5C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Nov 2025 13:31:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A91C2330324;
	Thu, 27 Nov 2025 13:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O086NR3L"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2025C2773F8;
	Thu, 27 Nov 2025 13:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764250242; cv=none; b=GsgJTP80yaOKO0A7A3h9AaZoxuXugGNrhbbJeXWxOP5kyXl3JrU+zunq1KFQyU7EMnIXEUtlxR6TY7zEBDjvNOJuuotkM1BW/mgTqFAp4gJpJ7fG/FWSZozXDgVlgZMu7/0jZIK9gCgz440e3KKqBWevcF0q5J9NvP0CFB9LGS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764250242; c=relaxed/simple;
	bh=pSESYEnUKyu08mrKfHQDZ5cAjFCRoX+nSdnwwFzzBoU=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=RxWcFy24yvA90HTbe06iyfctmFMyDB1zm6E2YgIFWJ/HJA7fdnrduZaU4Rcj62ZUeAAeNSxh2HpyWH6dLjLu1sp1j64z79IfVZznCnz0J27WUwtap/SHfVv5qVFLhmjSF8whKtbcUzzS8O/Y1GZEoiE1y3U9U8y7QBWIIpY2yhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O086NR3L; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51D16C116D0;
	Thu, 27 Nov 2025 13:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764250241;
	bh=pSESYEnUKyu08mrKfHQDZ5cAjFCRoX+nSdnwwFzzBoU=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=O086NR3LcDosRFq36fL/6nhqc3C4yIsK5uceqV0dZ55x8L18kcrwolKn5grr61j+T
	 ADb/Cv3GE3BWy7bFszgRCUbMBSPbbAm9aaN2/+APk3MBUoF31GJ5YXGLAUHH/BnHfI
	 TBJY3lNw+WmWtoRij72e1nyEC2zi4CsujVOmpzivnrsC+JfjNGvLl6uy4j7xO42Zhm
	 /1XoQX0+a62xYOiVA16kQ2lcbaxQioU+njcO/kPFwQ/sp7bquEt/knMsQTeaU2GmYk
	 0LasDi/3F4kvDCHFLcIWMsT/ENBjRxWFhGm+H848iGXTBbsMwFZYqcFIedrhlkIWR5
	 7tQCq4Y3dSV8Q==
Date: Thu, 27 Nov 2025 07:30:40 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Guenter Roeck <linux@roeck-us.net>, Mark Brown <broonie@kernel.org>, 
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 linux-phy@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>, 
 linux-renesas-soc@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org, 
 Vinod Koul <vkoul@kernel.org>, Peter Rosin <peda@axentia.se>, 
 biju.das.jz@bp.renesas.com, Georgi Djakov <djakov@kernel.org>, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Jonathan Cameron <jonathan.cameron@huawei.com>, devicetree@vger.kernel.org, 
 tomm.merciai@gmail.com, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <6f2ba4b376b0ed5652dac4729d9c020d2059eb70.1764241212.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1764241212.git.tommaso.merciai.xr@bp.renesas.com>
 <6f2ba4b376b0ed5652dac4729d9c020d2059eb70.1764241212.git.tommaso.merciai.xr@bp.renesas.com>
Message-Id: <176425023140.4101874.6056536862726379533.robh@kernel.org>
Subject: Re: [PATCH v5 14/22] dt-bindings: reset: Document RZ/G3E USB2PHY
 reset


On Thu, 27 Nov 2025 12:48:41 +0100, Tommaso Merciai wrote:
> Document USB2PHY reset controller bindings for RZ/G3E ("R9A09G047") SoC.
> 
> The RZ/G3E USB2PHY reset controller is functionally identical to the one
> found on the RZ/V2H(P), so no driver changes are needed. The existing
> "renesas,r9a09g057-usb2phy-reset" will be used as a fallback compatible
> for this IP.
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
>  .../bindings/reset/renesas,rzv2h-usb2phy-reset.yaml           | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/6f2ba4b376b0ed5652dac4729d9c020d2059eb70.1764241212.git.tommaso.merciai.xr@bp.renesas.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


