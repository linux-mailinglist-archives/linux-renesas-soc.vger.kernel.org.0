Return-Path: <linux-renesas-soc+bounces-20764-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EA68B2E2DC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Aug 2025 19:03:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C8F551895501
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Aug 2025 17:04:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9C62334709;
	Wed, 20 Aug 2025 17:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nO2FsqLm"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF9DE23E33D;
	Wed, 20 Aug 2025 17:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755709394; cv=none; b=QEM0/Ftprjp/qeRJnXqLsjVGsQGGOe4IpC0vej9GV9cx5yDcdLkj6t8teXxaM3DKkt8NXf9/ydUQDViW7Sx+WKSR5JG1Ujd9weP5Sf0oJZLE8vT3yiloPNl3f84n8f4kC804Ft2gpOBFhYsgi4E8JecicsnBDap2kYyYxifcGuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755709394; c=relaxed/simple;
	bh=8h5swraijlkugF4NxQe+E8fB0bxjOHS1fwKTn+gkooY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=N25Z9JdXJrRY519krOAdM5+jGGSzdwhaNXFcw5Wh9aoG6BBxPo78AHMHHGobMaU5tyCInqlO5zHTJxi32KPohOo1aBPhVdy/dl+3/nIoQtYr61bfz8AnCjwr1lI6jlw62+9uacELMl9/bebzvTKhAMbq8fYqNqfPj+TU24vKCHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nO2FsqLm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FA18C113CF;
	Wed, 20 Aug 2025 17:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755709394;
	bh=8h5swraijlkugF4NxQe+E8fB0bxjOHS1fwKTn+gkooY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=nO2FsqLmDAAbCYg9zp0td9LFAODit7CNnYis/Xj5s0d4JdrlAZRqyDSkulhaIhAC5
	 wO8M5G7uG8nObAjX30ESnFHxvBdLyik+O+EOuL4FOjtwC9qW5ZBbZ376hoIytyr92S
	 sLEVJsCse4zbrdAKwW2/bOry1REwG3h5EMN2PXL6j8NEO9kfaXP52PirZmFQbCLGon
	 w5/OwqVAFpF3ApHeDlIz9xChP0IQ4hTFfqNguySHvgpkGIpjpmJuBEo5hFUMrO1rcE
	 iqahtLl4BAFg9kccYauO4n9FLQYfT7txuVx0fNY+YvawUR3tS+HvkBXs7d4PtbzHhf
	 iX1bUf0N9ItEA==
From: Vinod Koul <vkoul@kernel.org>
To: Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Prabhakar <prabhakar.csengg@gmail.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 Biju Das <biju.das.jz@bp.renesas.com>, 
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250808215209.3692744-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250808215209.3692744-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v2 0/5] Add USB2 PHY support for RZ/T2H and RZ/N2H SoCs
Message-Id: <175570938875.66459.17504688667907589630.b4-ty@kernel.org>
Date: Wed, 20 Aug 2025 22:33:08 +0530
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Fri, 08 Aug 2025 22:52:04 +0100, Prabhakar wrote:
> This patch series adds support for the USB2 PHY on the Renesas RZ/T2H
> and RZ/N2H SoCs. The USB2 PHY driver has been updated to handle
> differences in clocking, reset handling, and register configurations
> specific to these SoCs.
> 
> v1->v2:
> - Added Acked-by from Conor for the DT bindings.
> - Renamed drvdata to phy_data.
> - Updated commit message to clarify the change.
> - Dropped local phy_data variable in probe, using channel->phy_data
>   directly.
> - Included the necessary header files.
> - Simplified device/host detection in rcar_gen3_check_id() as suggested
>   by Geert.
> - Added Reviewed-by from Neil.
> 
> [...]

Applied, thanks!

[1/5] dt-bindings: phy: renesas,usb2-phy: Add RZ/T2H and RZ/N2H support
      commit: ab9c8aeb2d208381a7c948ea2f753cbe8a451502
[2/5] phy: renesas: rcar-gen3-usb2: store drvdata pointer in channel
      commit: f75806d26318c08ddb79652cce89086e4da17257
[3/5] phy: renesas: rcar-gen3-usb2: Allow SoC-specific OBINT bits via phy_data
      commit: 4b7aa47e4c2c921b9511389bf42a4e30d64373e6
[4/5] phy: renesas: rcar-gen3-usb2: Add support for RZ/T2H SoC
      commit: b725741f1c21e8507a58ae86c5a80ca383f96852
[5/5] phy: renesas: rcar-gen3-usb2: Move debug print after register value is updated
      commit: 5f54134428b48261151c725c64b40be54e373345

Best regards,
-- 
~Vinod



