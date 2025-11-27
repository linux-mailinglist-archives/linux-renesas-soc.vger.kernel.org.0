Return-Path: <linux-renesas-soc+bounces-25274-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF7DC8E7CD
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Nov 2025 14:33:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 764043547CD
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Nov 2025 13:31:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E930932D0F3;
	Thu, 27 Nov 2025 13:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gMbf5A7C"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC56132ABCF;
	Thu, 27 Nov 2025 13:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764250240; cv=none; b=BjGHdMh30qWZ7o4Wp40F4KJ4MtUcL3YUs5iuC8JLMTE9s3YIF2Y6pXL4pIgkgvXgetZ97m8KPaPpnwNijZuV1lEa6qxIpiqWESjphSYid1Si2PKzjSXbFbgfm1WIExgW1T1UH71knKgB/D/lCCB5jkKIgobmXXgUKHYtvXpyKLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764250240; c=relaxed/simple;
	bh=7W8m1gN6iJf6URJXr6P1P/KidZjp2vGFzBw9uIu20F8=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=uRaJwiRSCMN4eZvzHDqJnQYLYccXsKf4j3nGIi+bV2VU5Ny3KKvBNrRf5zAil6jDnkctEKL6Ut6eMEbUjID5cfSLZeeZzm7i1jt9f1g1fQkVm0gu2S881NmgydSZHtPcGUyuXZhSbnBekUYxDixNHZXpxj39TWkQr55Ntf6+k48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gMbf5A7C; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A3B2C116D0;
	Thu, 27 Nov 2025 13:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764250240;
	bh=7W8m1gN6iJf6URJXr6P1P/KidZjp2vGFzBw9uIu20F8=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=gMbf5A7CTRvABqJ/dgN2OT/F+AgyUwVkZR0IW2G5x+RetylR2amp7Dsn+OgeXuDbR
	 0ZPjC+prWEU7eIXio3ic321IPHk28ckzA3AvGQgPoi3kbOdRyyjiZhaEvK1JI3dd36
	 fff2bHzcr0ivLqY/4ncM6DNu/W5NqKwPuwaOTUeaqSaxW7iX6icWQq4xsx3FCz3u/p
	 g6QZFo/WG4grEC+zFMrOc3KvUHG9JbaUnb+TwkzsCivUL+JLRBctJvXFie1VdAYS5i
	 O4iGm9u7NQvL6N5mWcOqKEB7cGYTa2V5qIVP+5EA7jsD9f15tKP1Y1D41adEEDVv2U
	 NOra7lPJGjpwQ==
Date: Thu, 27 Nov 2025 07:30:38 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>, linux-phy@lists.infradead.org, 
 linux-renesas-soc@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>, 
 tomm.merciai@gmail.com, 
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>, biju.das.jz@bp.renesas.com, 
 Jonathan Cameron <jonathan.cameron@huawei.com>, 
 Peter Rosin <peda@axentia.se>, linux-kernel@vger.kernel.org, 
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
 Mark Brown <broonie@kernel.org>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Arnd Bergmann <arnd@arndb.de>, devicetree@vger.kernel.org, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <32c6393bc89fd7f4b354def0028220a1916315e6.1764241212.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1764241212.git.tommaso.merciai.xr@bp.renesas.com>
 <32c6393bc89fd7f4b354def0028220a1916315e6.1764241212.git.tommaso.merciai.xr@bp.renesas.com>
Message-Id: <176425022981.4101836.1767439068441155398.robh@kernel.org>
Subject: Re: [PATCH v5 13/22] dt-bindings: phy: renesas,usb2-phy: Document
 RZ/G3E SoC


On Thu, 27 Nov 2025 12:48:40 +0100, Tommaso Merciai wrote:
> Document USB2.0 phy bindings for RZ/G3E ("R9A09G047") SoC.
> 
> The RZ/G3E USB2.0 phy is functionally identical to the one found
> on the RZ/V2H(P), so no driver changes are needed. The existing
> "renesas,usb2-phy-r9a09g057" will be used as a fallback compatible for
> this IP.
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
>  Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/32c6393bc89fd7f4b354def0028220a1916315e6.1764241212.git.tommaso.merciai.xr@bp.renesas.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


