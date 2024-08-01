Return-Path: <linux-renesas-soc+bounces-7687-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE86944F43
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Aug 2024 17:31:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C21271C2561A
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Aug 2024 15:31:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D40E31B0125;
	Thu,  1 Aug 2024 15:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bbGg8qaj"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADFF61B4C2F
	for <linux-renesas-soc@vger.kernel.org>; Thu,  1 Aug 2024 15:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722526183; cv=none; b=X+zpZffE0J99cf/DbKUhCeCGpE1OJV4U2FKfzcteGisRjH2bBI7dYDtQ4Obl4DW4e6LDT3PjFMrMEIH4n+8/PjaJeAdTulVpFDJjfV3ycBg4vjzGoC7Xde8v6Yi3KDN3Y8grj/rol4QJbiAoxFauJI+Tcu60K9aaNCE7mXyKJbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722526183; c=relaxed/simple;
	bh=R8dLdAAKT6xcigbZDkC8nKSrDhh+M92bcz2XOxHxess=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=Ex6HMinwD0U16ofrRlozE0nnh4h1CZOfsemgtMHYIZPqrqOpyB9or3VJSeQauhSy5jhxB6jA0RVLjoHqyOEFcAn9MHg4q3NXl8+6cTLRYliiZdpoyh74dGSTwITEaBdTM2R2pF2dgW5HML14+XPeTG9Oar6ny65kkZj5sMHGg18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bbGg8qaj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06EA4C32786;
	Thu,  1 Aug 2024 15:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722526183;
	bh=R8dLdAAKT6xcigbZDkC8nKSrDhh+M92bcz2XOxHxess=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=bbGg8qajmzQ+rrAf9MLCoNQQ2VB+7xvPu15Y9KfOxp7FeC1MMPjWX0dlq4I1+PA+Q
	 qqnaWH1yfLFnFnRabfdEw0ndM14rZ/2h5PBYoLx7jyGYEw9s9LYFK26YbNgxS+yMRK
	 VsO6Dx3vCPiKKh/tlzhiqvC6Jt5eAMaJ2iMo1VtvMd3DQDwkrmhSqYV01N8h2YpV9B
	 /goyg+994rCMm1ELKOWt0aj60XY0HSTENJzMijWTNj7IWz3eDxWr6CdyJdiuuOlGgW
	 0L1RACKugyOvWQMrY0yqDFNjll1vtp86hPLnJfZoFlUiBszTrGNrloHYsdpRCIK/M3
	 x3tW9PQOJxpRQ==
Date: Thu, 01 Aug 2024 09:29:41 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org
In-Reply-To: <cover.1722519717.git.geert+renesas@glider.be>
References: <cover.1722519717.git.geert+renesas@glider.be>
Message-Id: <172252601096.120849.16110760383811958819.robh@kernel.org>
Subject: Re: [PATCH v2 0/2] arm64: dts: renesas: Add CAN-FD support for
 R-Car V4M and Gray Hawk Single


On Thu, 01 Aug 2024 15:54:34 +0200, Geert Uytterhoeven wrote:
> 	Hi all,
> 
> This patch series adds support for CAN-FD on the R-Car V4M SoC and the
> Gray Hawk Single development board.
> 
> The CAN-FD module on R-Car V4M is very similar to the one on R-Car V4H,
> but differs in some hardware parameters, as reflected by the Parameter
> Status Information part of the Global IP Version Register.  However,
> none of this parameterization should have any impact on the driver, as
> the driver does not access any register that is impacted by the
> parameterization (except for the number of channels).
> 
> Just like on R-Car V4H and on the White Hawk development board, channels
> 0 and 1 work fine, while channel 2 does not seem to work at all, and
> channel 3 works for transmit only.  Hence this patch keeps channels 2
> and 3 disabled.
> 
> Changes compared to v1[1]:
>   - Spun off clock and DT binding patches,
>   - Add missing pinctrl-names,
>   - Correct TJR1443AT Enable GPIO,
>   - Reword now channels 0 and 1 work.
> 
> I plan to queue this is renesas-devel for v6.12.
> 
> Thanks for your comments!
> 
> [1] https://lore.kernel.org/cover.1715956819.git.geert+renesas@glider.be
> 
> Duy Nguyen (1):
>   arm64: dts: renesas: r8a779h0: Add CAN-FD node
> 
> Geert Uytterhoeven (1):
>   arm64: dts: renesas: gray-hawk-single: Add CAN-FD support
> 
>  .../dts/renesas/r8a779h0-gray-hawk-single.dts | 41 +++++++++++++++++++
>  arch/arm64/boot/dts/renesas/r8a779h0.dtsi     | 41 +++++++++++++++++++
>  2 files changed, 82 insertions(+)
> 
> --
> 2.34.1
> 
> Gr{oetje,eeting}s,
> 
> 						Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
> 							    -- Linus Torvalds
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


New warnings running 'make CHECK_DTBS=y renesas/r8a779h0-gray-hawk-single.dtb' for cover.1722519717.git.geert+renesas@glider.be:

arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: can@e6660000: compatible: 'oneOf' conditional failed, one must be fixed:
	'renesas,r8a779h0-canfd' is not one of ['renesas,r8a774a1-canfd', 'renesas,r8a774b1-canfd', 'renesas,r8a774c0-canfd', 'renesas,r8a774e1-canfd', 'renesas,r8a7795-canfd', 'renesas,r8a7796-canfd', 'renesas,r8a77961-canfd', 'renesas,r8a77965-canfd', 'renesas,r8a77970-canfd', 'renesas,r8a77980-canfd', 'renesas,r8a77990-canfd', 'renesas,r8a77995-canfd']
	'renesas,r8a779h0-canfd' is not one of ['renesas,r8a779a0-canfd', 'renesas,r8a779g0-canfd']
	'renesas,r8a779h0-canfd' is not one of ['renesas,r9a07g043-canfd', 'renesas,r9a07g044-canfd', 'renesas,r9a07g054-canfd']
	'renesas,rcar-gen3-canfd' was expected
	'renesas,rzg2l-canfd' was expected
	from schema $id: http://devicetree.org/schemas/net/can/renesas,rcar-canfd.yaml#
arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: can@e6660000: Unevaluated properties are not allowed ('compatible' was unexpected)
	from schema $id: http://devicetree.org/schemas/net/can/renesas,rcar-canfd.yaml#






