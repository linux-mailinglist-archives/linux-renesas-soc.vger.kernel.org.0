Return-Path: <linux-renesas-soc+bounces-25273-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B109BC8E7BF
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Nov 2025 14:32:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id E5122354176
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Nov 2025 13:31:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF8162FD661;
	Thu, 27 Nov 2025 13:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h/zdPLFT"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C329128751D;
	Thu, 27 Nov 2025 13:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764250238; cv=none; b=c9P8e2Xd2NRsPaeFrMjdSt2csj98QX9HbHZSYOnIKedttsUTiJVcY4TVhnqYu/AefklTN7EV6rgIO6brxb5IBhgDTlKgQg8PTjCfxAkmayyYjMhtli0EMarQVB09v4qx4uT/NZ2uUA4SraTCNSiESqudnKQcr4yO8gzsIECLS20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764250238; c=relaxed/simple;
	bh=qfCyuPWT5K6vsKLyo7M2+8kULAW3XzKDaTl3mUicdWg=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=IWfGzvjcJE9Ya8LIg2hGxv0PcTcQTfwGcSn7A0GVMJdatGzaQEZPSBIBQAz6E76ynPaaBydHHld77BAXxfW0KW1XSc13xsORsT8n1yWvn/GJCXMlV2Bm8xvaJk+gNZ2/XN1MCsXBMmTdkvKezhozfSYJ36h6X1qPUf9kXzcBdFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h/zdPLFT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61963C4CEFB;
	Thu, 27 Nov 2025 13:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764250238;
	bh=qfCyuPWT5K6vsKLyo7M2+8kULAW3XzKDaTl3mUicdWg=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=h/zdPLFTwBrn/TQD+O3Ne2L5zDppooLS+N0Vo+Pk2xvn+SmxKbrZtqta8otTzSEY5
	 gBaGeOSLqxOjWXEwKIXnj+J2Ql+oRQY13V/DCLtXSmdUO1T0cphEBjvGdnPUafD6zT
	 Bmv/5wHYnJQbFFzbTEDdTMixhDUBaFGfm3j4et8n6r1pPAZJfWdGEAM9YRypt3qrmX
	 6SyL1K3MgpAK52uHwgo6xHFsiSBIXUNElMLIUjIqAd4ckWel3aYWXBMGVtfuRkBcgT
	 0H+mHk3qnSxfFNmHkyIkXPrH4HCa+xR0cRpcIinUgrWqb14LtWKdcSq50NbO9UtyEL
	 Q/+zYA1pC6Mcw==
Date: Thu, 27 Nov 2025 07:30:37 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 biju.das.jz@bp.renesas.com, Georgi Djakov <djakov@kernel.org>, 
 Conor Dooley <conor.dooley@microchip.com>, Arnd Bergmann <arnd@arndb.de>, 
 Peter Rosin <peda@axentia.se>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Mark Brown <broonie@kernel.org>, tomm.merciai@gmail.com, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Guenter Roeck <linux@roeck-us.net>, 
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
 linux-kernel@vger.kernel.org, Kishon Vijay Abraham I <kishon@kernel.org>, 
 linux-phy@lists.infradead.org, 
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
 Jonathan Cameron <jonathan.cameron@huawei.com>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <33e2552871c7a93a75ccaface5491f994c6156f1.1764241212.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1764241212.git.tommaso.merciai.xr@bp.renesas.com>
 <33e2552871c7a93a75ccaface5491f994c6156f1.1764241212.git.tommaso.merciai.xr@bp.renesas.com>
Message-Id: <176425022839.4101786.8488594837632751244.robh@kernel.org>
Subject: Re: [PATCH v5 12/22] dt-bindings: usb: renesas,usbhs: Add RZ/G3E
 SoC support


On Thu, 27 Nov 2025 12:48:39 +0100, Tommaso Merciai wrote:
> Document the Renesas USBHS controller found on the Renesas RZ/G3E SoC.
> The USBHS block on RZ/G3E is functionally identical to the one found
> on the RZ/G2L family, so no driver changes are needed. The existing
> "renesas,rzg2l-usbhs" fallback compatible will continue to be used for
> handling this IP.
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
>  Documentation/devicetree/bindings/usb/renesas,usbhs.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/33e2552871c7a93a75ccaface5491f994c6156f1.1764241212.git.tommaso.merciai.xr@bp.renesas.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


