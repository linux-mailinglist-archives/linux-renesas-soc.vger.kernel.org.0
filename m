Return-Path: <linux-renesas-soc+bounces-14042-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C546A50E86
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Mar 2025 23:23:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ED65E167C27
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Mar 2025 22:23:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E638266B55;
	Wed,  5 Mar 2025 22:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A9tWZpGe"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AAEE266B56
	for <linux-renesas-soc@vger.kernel.org>; Wed,  5 Mar 2025 22:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741213417; cv=none; b=GjRe7lg/n4hPk6TSmt+kxt0uNkDipnAZlHd9bXtoEjiZ5o0SC7Rrd6lZ3twdXsh31LT4g8TlcBC5kYCD5SuUQzVZRRipJpq7OKnEYi/XoeWwETSqGaSsHTvPlrJ/e3pal9tMi5JCMEfV2rt4FKVsV25oP6cp3z5M6XQt0mhff8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741213417; c=relaxed/simple;
	bh=am2QtQAbUka0EU00ofGO9S5CBbuQtg1K0zlpNhYg8BE=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=aRWfMf1S8ScgN7dHWvDnYwvWJtXqSHsHt97D37f+8Nxhm4+xzz1dY5Np60lWEZ5HuIL9d9kTgWZ0cxpSORwQMiPUa9lBelVUgHuWbRl3HpKldVsQc3KXMGrwIW75MivCubCDC3vXTvw2UEfhdLZvGyKZkCIFtxAT3JNPLi28c/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A9tWZpGe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 949EDC4CEE8;
	Wed,  5 Mar 2025 22:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741213416;
	bh=am2QtQAbUka0EU00ofGO9S5CBbuQtg1K0zlpNhYg8BE=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=A9tWZpGe/oAzeCBY2QFymhr1bXB78nkfrJBA202yTlt4sSyKEohB1ChecPRHddDB2
	 TVgY6xD6mfD38OX1vxzI4KsyT0MWPY5DBaJ1ZgfesxGLTIAmp0OchK5Ht2oA2i4iV2
	 7d/M33ECAMC/Re1rj8EO6W59H4qnuFeg/eKeWqEYcjHJ7wGLIxxD+YgeIa27i7PapR
	 ZsmrbSxw4C0j8ko1mydUFstCi5nIwawW3SF6Lm6fDXMUprV/yb9oVLE5eplO+F1EG3
	 aIGtkKX+YrNiPFgwwYuOhybcNuERcpSCw02TDRtXAckqEdCutSsXAFtVY3qX70SXDf
	 FnQxIGB9WZGIw==
Date: Wed, 05 Mar 2025 16:23:35 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
In-Reply-To: <3e4fca228eb049d54a1ae520104558505dbdf803.1741179629.git.geert+renesas@glider.be>
References: <3e4fca228eb049d54a1ae520104558505dbdf803.1741179629.git.geert+renesas@glider.be>
Message-Id: <174121293051.2932459.11282638089781621289.robh@kernel.org>
Subject: Re: [PATCH] arm64: dts: renesas: r8a779f4: Add UFS tuning
 parameters in E-FUSE


On Wed, 05 Mar 2025 14:35:13 +0100, Geert Uytterhoeven wrote:
> Describe the location in the E-FUSE block of the PLL and AFE tuning
> parameters for the Universal Flash Storage controller.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Updated DT bindings and driver code are available in "[PATCH v3 0/7]
> scsi: ufs: renesas: Add support for R-Car S4-8 ES1.2"
> https://lore.kernel.org/cover.1741179611.git.geert+renesas@glider.be
> ---
>  arch/arm64/boot/dts/renesas/r8a779f4.dtsi | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
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


New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/renesas/' for 3e4fca228eb049d54a1ae520104558505dbdf803.1741179629.git.geert+renesas@glider.be:

arch/arm64/boot/dts/renesas/r8a779f4-s4sk.dtb: ufs@e6860000: Unevaluated properties are not allowed ('nvmem-cell-names', 'nvmem-cells' were unexpected)
	from schema $id: http://devicetree.org/schemas/ufs/renesas,ufs.yaml#






