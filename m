Return-Path: <linux-renesas-soc+bounces-5557-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4498E8D22A1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 May 2024 19:41:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D9586B23805
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 May 2024 17:41:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A595137719;
	Tue, 28 May 2024 17:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AVXGb2LU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DDAA328A0;
	Tue, 28 May 2024 17:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716918101; cv=none; b=al9YZgv/+sAW4sQ3+ufbOnpT8Bg8sILseLj3iAY1OYAb06NsSYyFWQL17WRlYBDNUIf2sLDgsM1XmVsaWI1UCJYLE2loJ31Tgl52nlMD1rya6z1c0mG5w0asCS0I0oKe2CNd0gMhBDMiSi+i3P02sil2ijGShjqu0/5b3LSy4CI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716918101; c=relaxed/simple;
	bh=Y7NsUJEDenpBaq8JlXL3XeBFXZcbz3Zkrbq2F9QJ/B8=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=disvQ3gpZ3UZwzzvsN7OMe6N1RnxvWzOkcIsLbRuizn24gXZL+Pd1q7+CiwXk2WIjJsZ/XMUY9Jd5MmCA7qyjHycUlrQHMde5wzvo1zLzUR+w2CJAIwURLeWlU39oixntXIWYDVZhafKQjk4Op+uu8APMh/TwPDzA+obbXzstTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AVXGb2LU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D85C7C4AF0D;
	Tue, 28 May 2024 17:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716918101;
	bh=Y7NsUJEDenpBaq8JlXL3XeBFXZcbz3Zkrbq2F9QJ/B8=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=AVXGb2LU1c8RUQJSYhiUpaYhV6hBexbThgNSLiR1ZZpLCtk1sV9CgdgnS0xqbRg3c
	 T/ct7ps9BfpGd1jCixMGkNXItFbEBDtBxhl9bgF1TOHW0uH2P3mVCEE5feP7h1Yp5B
	 2CKFcDLIttkioxVlCKEojffFCJc0nZxR8GUfStu4ZLEVwXz+tG+GM0L9mylIrtahok
	 Y6nv/1x8T7dr9mbp2cs5FNmA8kepdQzQCY4o2acxP7Q5Obw6TTDZXiv2E0gj86fMlf
	 aSA3fCa3/ezdPcES9msD2lmlnVGAONs8jRrySpy7aYaiRKK4I2BjU/3y9D7R1JyGTS
	 pMdDVALvR/jOQ==
Date: Tue, 28 May 2024 12:41:39 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, devicetree@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org
In-Reply-To: <20240527134129.1695450-1-niklas.soderlund+renesas@ragnatech.se>
References: <20240527134129.1695450-1-niklas.soderlund+renesas@ragnatech.se>
Message-Id: <171691793216.1180592.3679496322433886659.robh@kernel.org>
Subject: Re: [PATCH 0/3] arm64: dts: renesas: gray-hawk: Add video capture
 pipeline


On Mon, 27 May 2024 15:41:26 +0200, Niklas Söderlund wrote:
> Hello Geert,
> 
> This series adds support for video capture on V4M.
> 
> I only have schematics for the gray-hawk single board but I opted to
> keep the structure from white-hawk and create a dedicated DTSI file for
> the CSI-2 and DSI sub-board.
> 
> Patch 1 adds the IP nodes for VIN, ISPCS and CSI-2. While patch 2 and 3
> creates and wires up the sub-board to the two MAX96724 CSI-2
> transmitters.
> 
> Niklas Söderlund (3):
>   arm64: dts: renesas: r8a779h0: Add video capture nodes
>   arm64: dts: renesas: gray-hawk: Create separate CSI/DSI sub-board
>   arm64: dts: renesas: gray-hawk-csi-dsi: Add and connect MAX96724
> 
>  .../boot/dts/renesas/gray-hawk-csi-dsi.dtsi   | 201 ++++++
>  .../dts/renesas/r8a779h0-gray-hawk-single.dts |   8 +-
>  arch/arm64/boot/dts/renesas/r8a779h0.dtsi     | 666 ++++++++++++++++++
>  3 files changed, 868 insertions(+), 7 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/renesas/gray-hawk-csi-dsi.dtsi
> 
> --
> 2.45.1
> 
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


New warnings running 'make CHECK_DTBS=y renesas/r8a779h0-gray-hawk-single.dtb' for 20240527134129.1695450-1-niklas.soderlund+renesas@ragnatech.se:

arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: /soc/i2c@e6508000/gmsl-deserializer@4e: failed to match any schema with compatible: ['maxim,max96724']
arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: /soc/i2c@e6508000/gmsl-deserializer@4f: failed to match any schema with compatible: ['maxim,max96724']






