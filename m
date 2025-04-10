Return-Path: <linux-renesas-soc+bounces-15750-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F329A844E4
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Apr 2025 15:34:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 66A79440780
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Apr 2025 13:31:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71ECD28A40F;
	Thu, 10 Apr 2025 13:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EC9QCnIa"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 402B7270EDD;
	Thu, 10 Apr 2025 13:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744291878; cv=none; b=N9Ww8+9IVPRGuuGXZNmNkOk8nY0nljRlLIRBcmpFVSP85XQnwionay1kBPdW1XdyVdw+m7QzzanTy1H1cu2XbtDbCWYkdS5cQxeyOXQHtbK4p1yZyihMQ+hUgp9vy169MAdn51Yi5EELOGD4xaNDh35F9Kwtf9PRQ7Pv20pBizw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744291878; c=relaxed/simple;
	bh=Kdl0DUcFLmDnZW83B2cgZn3vkVospaz2redPCQGfiao=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=XPlQ1bK+Oc/b3/YQWelctOYcEngOrD7fOn3JoMkbh2iFu+Nkuy5BVsRF1r22gyigux9LvV0tiGK4oLTRDlUKLa8jKyjZzVPuMyWK72uOGflwX6qFFtGkLsg/svgQiA7S1GuZUe1yXPhxj9FWa4/jP5N6sWgeohEaC2MEFUskqYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EC9QCnIa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6940DC4CEDD;
	Thu, 10 Apr 2025 13:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744291877;
	bh=Kdl0DUcFLmDnZW83B2cgZn3vkVospaz2redPCQGfiao=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=EC9QCnIazZiRdAsg+uywSsOdSSb07TTH5+VyhiTQXjiMGNxZTJNrZy7vMS7VNeaeP
	 nJpPUfytqa8XPX6G2G+C9h6CTx4Hq61itsQ5yW42e8LjP1vqwT2TWFfmZz+nyqsOCf
	 CU1zj2Nc79UeYiq0PpiWV2LWYAsSCOFq1EVHZXr7MgCZAiTk1/uWcHKbKqtYelaTkY
	 gmS9TRIdRxUTlc7E6qDuFactnPgKkHBcEbmANbB3ZIVYTHXfdH7f1Z4/ahtFNZzbd+
	 fNy0EKcvL5uiRrR6/jTQDAnf49QN7uAQYEJx0NhLB03H7GLoBJUhnun+IDOURQcplD
	 PFEhfTHYWMHVw==
Date: Thu, 10 Apr 2025 08:31:16 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 linux@ew.tq-group.com, linux-arm-kernel@lists.infradead.org, 
 Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Magnus Damm <magnus.damm@gmail.com>, Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
In-Reply-To: <20250410113107.2057426-1-alexander.stein@ew.tq-group.com>
References: <20250410113107.2057426-1-alexander.stein@ew.tq-group.com>
Message-Id: <174429181469.3723423.3872724131863272335.robh@kernel.org>
Subject: Re: [PATCH 1/2] dt: bindings: arm: add bindings for TQMa95xxSA


On Thu, 10 Apr 2025 13:31:02 +0200, Alexander Stein wrote:
> TQMa95xxSA is a SOM using NXP i.MX95 CPU. MB-SMARC-2 is a carrier
> reference design.
> 
> [1] https://www.tq-group.com/en/products/tq-embedded/arm-architecture/tqma95xxsa/
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


This patch series was applied (using b4) to base:
 Base: attempting to guess base-commit...
 Base: tags/next-20250410 (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/freescale/' for 20250410113107.2057426-1-alexander.stein@ew.tq-group.com:

arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dtb: scmi (arm,scmi): Unevaluated properties are not allowed ('linux,code' was unexpected)
	from schema $id: http://devicetree.org/schemas/firmware/arm,scmi.yaml#
arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dtb: scmi (arm,scmi): Unevaluated properties are not allowed ('protocol@81', 'protocol@84' were unexpected)
	from schema $id: http://devicetree.org/schemas/firmware/arm,scmi.yaml#
arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dtb: pcie@4c300000 (fsl,imx95-pcie): clock-names: ['pcie', 'pcie_bus', 'pcie_phy', 'pcie_aux'] is too short
	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml#
arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dtb: pcie@4c380000 (fsl,imx95-pcie): clock-names: ['pcie', 'pcie_bus', 'pcie_phy', 'pcie_aux'] is too short
	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml#






