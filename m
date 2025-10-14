Return-Path: <linux-renesas-soc+bounces-23009-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 64FF8BD9BC9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Oct 2025 15:33:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C1206189D500
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Oct 2025 13:29:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E248E31354E;
	Tue, 14 Oct 2025 13:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TAnMWUCi"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8E0B21E0BB;
	Tue, 14 Oct 2025 13:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760448567; cv=none; b=ce+bzjeNA8LbHLf7uwKEUj6yjVLLmZOo64WvAiQ9SjA9FVoSnudHphCwuRYMT5j8lL1JTxJMhpJ4ncyLqQu5swDqGwm8IyawshUW1eSf+HNWrV9DAz9AIp4N/gHTyGSfL5gmvTpKEjaGaqnGuizKGMg5bKYWJzPH9Klw6AJ1VtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760448567; c=relaxed/simple;
	bh=QiXQnftXW1d9rJAEQ6KtRkpR9BslCCYM3ivIwvsJqxc=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=JdP4h+NsSiCq92gPV8R/cqm69Cm3gymfR6AZV37XFVcy13VYuvcTzgcFp702u2/H1z7DcUIE8L7BFjSD+bOR7pAFAB+HRg+7uZmwwIXwnbqskxdDjkUVrwXrhc1sce9VvBWYlFGlMMlFtUiNiIVBcIVdpycieQEanwh5gPemFb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TAnMWUCi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13F9CC4CEF1;
	Tue, 14 Oct 2025 13:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760448567;
	bh=QiXQnftXW1d9rJAEQ6KtRkpR9BslCCYM3ivIwvsJqxc=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=TAnMWUCif1YonqEkAVnuSFvB9eNbrhifuqgaBBrwMBTNteapV79Ueu7vp+yHXBisi
	 SUhbbM0TkJ53cHe0D250faJ4U46BzFgIeW3W38IjcKeDy+s7Oxh4QYn8eVXglp4OfK
	 Fm/IeSQy1df0UevAGeU37JHvhsH11HP4s9S3wsDaHSwmgT34LLIGEb56gON944mhHh
	 Wd5XlZWektTvp3MFajwCEgx9oSoY6CSa8a57zGLTcsRPBVxC40URyj4dAxD+vjGV5K
	 MNvnqlRVKZiM6b/XkcoKgwQzpJmImqeFGUCN/tFyHSvDVzhFb4pUbWOTTxdgeomfBs
	 4bAA1Tnn51M6A==
Date: Tue, 14 Oct 2025 08:29:25 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 Matt Coster <matt.coster@imgtec.com>, Magnus Damm <magnus.damm@gmail.com>, 
 Adam Ford <aford173@gmail.com>, Frank Binns <frank.binns@imgtec.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 dri-devel@lists.freedesktop.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, David Airlie <airlied@gmail.com>, 
 linux-arm-kernel@lists.infradead.org
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
In-Reply-To: <20251013190210.142436-1-marek.vasut+renesas@mailbox.org>
References: <20251013190210.142436-1-marek.vasut+renesas@mailbox.org>
Message-Id: <176044840106.3094437.2331943625522490352.robh@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: gpu: img,powervr-rogue: Document
 GX6250 GPU in Renesas R-Car M3-W/M3-W+


On Mon, 13 Oct 2025 21:01:17 +0200, Marek Vasut wrote:
> Document Imagination Technologies PowerVR Rogue GX6250 BNVC 4.45.2.58
> present in Renesas R-Car R8A77960 M3-W and R8A77961 M3-W+ SoC.
> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---
> Cc: Adam Ford <aford173@gmail.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Frank Binns <frank.binns@imgtec.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Magnus Damm <magnus.damm@gmail.com>
> Cc: Matt Coster <matt.coster@imgtec.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: devicetree@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-renesas-soc@vger.kernel.org
> ---
> See https://gitlab.freedesktop.org/imagination/linux-firmware/-/issues/13
> for related userspace bits.
> ---
>  .../devicetree/bindings/gpu/img,powervr-rogue.yaml          | 6 ++++++
>  1 file changed, 6 insertions(+)
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
 Base: tags/next-20251013 (exact match)
 Base: tags/next-20251013 (use --merge-base to override)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/renesas/' for 20251013190210.142436-1-marek.vasut+renesas@mailbox.org:

Lexical error: arch/arm64/boot/dts/renesas/r8a77961.dtsi:2456.27-43 Unexpected 'R8A7796_PD_3DG_B'
FATAL ERROR: Syntax error parsing input tree
make[3]: *** [scripts/Makefile.dtbs:132: arch/arm64/boot/dts/renesas/r8a77961-ulcb-kf.dtb] Error 1
make[2]: *** [scripts/Makefile.build:556: arch/arm64/boot/dts/renesas] Error 2
make[2]: Target 'arch/arm64/boot/dts/renesas/r8a77961-ulcb-kf.dtb' not remade because of errors.
make[1]: *** [/home/rob/proj/linux-dt-testing/Makefile:1478: renesas/r8a77961-ulcb-kf.dtb] Error 2
Lexical error: arch/arm64/boot/dts/renesas/r8a77961.dtsi:2456.27-43 Unexpected 'R8A7796_PD_3DG_B'
FATAL ERROR: Syntax error parsing input tree
make[3]: *** [scripts/Makefile.dtbs:132: arch/arm64/boot/dts/renesas/r8a779m3-ulcb-kf.dtb] Error 1
make[2]: *** [scripts/Makefile.build:556: arch/arm64/boot/dts/renesas] Error 2
make[2]: Target 'arch/arm64/boot/dts/renesas/r8a779m3-ulcb-kf.dtb' not remade because of errors.
make[1]: *** [/home/rob/proj/linux-dt-testing/Makefile:1478: renesas/r8a779m3-ulcb-kf.dtb] Error 2
Lexical error: arch/arm64/boot/dts/renesas/r8a77961.dtsi:2456.27-43 Unexpected 'R8A7796_PD_3DG_B'
FATAL ERROR: Syntax error parsing input tree
make[3]: *** [scripts/Makefile.dtbs:132: arch/arm64/boot/dts/renesas/r8a77961-salvator-xs.dtb] Error 1
make[2]: *** [scripts/Makefile.build:556: arch/arm64/boot/dts/renesas] Error 2
make[2]: Target 'arch/arm64/boot/dts/renesas/r8a77961-salvator-xs.dtb' not remade because of errors.
make[1]: *** [/home/rob/proj/linux-dt-testing/Makefile:1478: renesas/r8a77961-salvator-xs.dtb] Error 2
Lexical error: arch/arm64/boot/dts/renesas/r8a77961.dtsi:2456.27-43 Unexpected 'R8A7796_PD_3DG_B'
FATAL ERROR: Syntax error parsing input tree
make[3]: *** [scripts/Makefile.dtbs:132: arch/arm64/boot/dts/renesas/r8a77961-ulcb.dtb] Error 1
make[2]: *** [scripts/Makefile.build:556: arch/arm64/boot/dts/renesas] Error 2
make[2]: Target 'arch/arm64/boot/dts/renesas/r8a77961-ulcb.dtb' not remade because of errors.
make[1]: *** [/home/rob/proj/linux-dt-testing/Makefile:1478: renesas/r8a77961-ulcb.dtb] Error 2
Lexical error: arch/arm64/boot/dts/renesas/r8a77961.dtsi:2456.27-43 Unexpected 'R8A7796_PD_3DG_B'
FATAL ERROR: Syntax error parsing input tree
make[3]: *** [scripts/Makefile.dtbs:132: arch/arm64/boot/dts/renesas/r8a779m3-ulcb.dtb] Error 1
make[2]: *** [scripts/Makefile.build:556: arch/arm64/boot/dts/renesas] Error 2
make[2]: Target 'arch/arm64/boot/dts/renesas/r8a779m3-ulcb.dtb' not remade because of errors.
make[1]: *** [/home/rob/proj/linux-dt-testing/Makefile:1478: renesas/r8a779m3-ulcb.dtb] Error 2
Lexical error: arch/arm64/boot/dts/renesas/r8a77961.dtsi:2456.27-43 Unexpected 'R8A7796_PD_3DG_B'
FATAL ERROR: Syntax error parsing input tree
make[3]: *** [scripts/Makefile.dtbs:132: arch/arm64/boot/dts/renesas/r8a779m3-salvator-xs.dtb] Error 1
make[2]: *** [scripts/Makefile.build:556: arch/arm64/boot/dts/renesas] Error 2
make[2]: Target 'arch/arm64/boot/dts/renesas/r8a779m3-salvator-xs.dtb' not remade because of errors.
make[1]: *** [/home/rob/proj/linux-dt-testing/Makefile:1478: renesas/r8a779m3-salvator-xs.dtb] Error 2
make: *** [Makefile:248: __sub-make] Error 2
make: Target 'renesas/r9a07g044c2-smarc.dtb' not remade because of errors.
make: Target 'renesas/r8a77961-ulcb-kf.dtb' not remade because of errors.
make: Target 'renesas/r8a77965-ulcb.dtb' not remade because of errors.
make: Target 'renesas/r8a77965-ulcb-kf.dtb' not remade because of errors.
make: Target 'renesas/r8a779m1-ulcb.dtb' not remade because of errors.
make: Target 'renesas/r8a774c0-ek874.dtb' not remade because of errors.
make: Target 'renesas/r8a774c0-ek874-idk-2121wr.dtb' not remade because of errors.
make: Target 'renesas/r9a09g077m44-rzt2h-evk.dtb' not remade because of errors.
make: Target 'renesas/r8a77960-ulcb-kf.dtb' not remade because of errors.
make: Target 'renesas/r8a77980a-condor-i.dtb' not remade because of errors.
make: Target 'renesas/r8a774a1-hihope-rzg2m-rev2.dtb' not remade because of errors.
make: Target 'renesas/r8a779g0-white-hawk.dtb' not remade because of errors.
make: Target 'renesas/r8a774b1-hihope-rzg2n-rev2-ex.dtb' not remade because of errors.
make: Target 'renesas/r8a779g2-white-hawk-single.dtb' not remade because of errors.
make: Target 'renesas/r8a774e1-hihope-rzg2h-ex-idk-1110wr.dtb' not remade because of errors.
make: Target 'renesas/r9a07g044l2-remi-pi.dtb' not remade because of errors.
make: Target 'renesas/r8a774a1-hihope-rzg2m-ex-mipi-2.1.dtb' not remade because of errors.
make: Target 'renesas/r8a774b1-hihope-rzg2n-rev2-ex-idk-1110wr.dtb' not remade because of errors.
make: Target 'renesas/r8a774c0-ek874-mipi-2.1.dtb' not remade because of errors.
make: Target 'renesas/r9a07g044l2-smarc.dtb' not remade because of errors.
make: Target 'renesas/r9a09g056n48-rzv2n-evk.dtb' not remade because of errors.
make: Target 'renesas/r8a774e1-hihope-rzg2h-ex-mipi-2.1.dtb' not remade because of errors.
make: Target 'renesas/r8a779m5-salvator-xs.dtb' not remade because of errors.
make: Target 'renesas/r8a77970-eagle.dtb' not remade because of errors.
make: Target 'renesas/r8a77980-v3hsk.dtb' not remade because of errors.
make: Target 'renesas/r8a77951-salvator-xs.dtb' not remade because of errors.
make: Target 'renesas/r8a77951-ulcb-kf.dtb' not remade because of errors.
make: Target 'renesas/r8a77965-salvator-xs.dtb' not remade because of errors.
make: Target 'renesas/r9a09g057h48-kakip.dtb' not remade because of errors.
make: Target 'renesas/r8a779f4-s4sk.dtb' not remade because of errors.
make: Target 'renesas/r8a774b1-hihope-rzg2n-ex-mipi-2.1.dtb' not remade because of errors.
make: Target 'renesas/r8a774b1-hihope-rzg2n-ex.dtb' not remade because of errors.
make: Target 'renesas/r8a779h0-gray-hawk-single.dtb' not remade because of errors.
make: Target 'renesas/r8a774c0-cat874.dtb' not remade because of errors.
make: Target 'renesas/r8a77960-ulcb.dtb' not remade because of errors.
make: Target 'renesas/r8a77951-ulcb.dtb' not remade because of errors.
make: Target 'renesas/r8a774a1-hihope-rzg2m-rev2-ex-idk-1110wr.dtb' not remade because of errors.
make: Target 'renesas/r8a774e1-beacon-rzg2h-kit.dtb' not remade because of errors.
make: Target 'renesas/r9a09g087m44-rzn2h-evk.dtb' not remade because of errors.
make: Target 'renesas/r8a779m1-ulcb-kf.dtb' not remade because of errors.
make: Target 'renesas/r8a774b1-hihope-rzg2n-rev2.dtb' not remade because of errors.
make: Target 'renesas/r8a77970-v3msk.dtb' not remade because of errors.
make: Target 'renesas/r8a779m1-salvator-xs.dtb' not remade because of errors.
make: Target 'renesas/r8a779m3-ulcb-kf.dtb' not remade because of errors.
make: Target 'renesas/r9a09g047e57-smarc.dtb' not remade because of errors.
make: Target 'renesas/r9a08g045s33-smarc.dtb' not remade because of errors.
make: Target 'renesas/r8a77961-salvator-xs.dtb' not remade because of errors.
make: Target 'renesas/r8a77960-salvator-xs.dtb' not remade because of errors.
make: Target 'renesas/r8a77960-salvator-x.dtb' not remade because of errors.
make: Target 'renesas/r8a77990-ebisu.dtb' not remade because of errors.
make: Target 'renesas/r8a774b1-hihope-rzg2n-ex-idk-1110wr.dtb' not remade because of errors.
make: Target 'renesas/r8a77980-condor.dtb' not remade because of errors.
make: Target 'renesas/r9a07g054l2-smarc.dtb' not remade because of errors.
make: Target 'renesas/r8a779g3-white-hawk-single.dtb' not remade because of errors.
make: Target 'renesas/r8a779f0-spider.dtb' not remade because of errors.
make: Target 'renesas/r8a774e1-hihope-rzg2h-ex.dtb' not remade because of errors.
make: Target 'renesas/r8a779a0-falcon.dtb' not remade because of errors.
make: Target 'renesas/r8a77965-salvator-x.dtb' not remade because of errors.
make: Target 'renesas/r8a774e1-hihope-rzg2h.dtb' not remade because of errors.
make: Target 'renesas/r8a77951-salvator-x.dtb' not remade because of errors.
make: Target 'renesas/r9a09g011-v2mevk2.dtb' not remade because of errors.
make: Target 'renesas/r8a774b1-hihope-rzg2n.dtb' not remade because of errors.
make: Target 'renesas/r8a774b1-beacon-rzg2n-kit.dtb' not remade because of errors.
make: Target 'renesas/r9a09g057h44-rzv2h-evk.dtb' not remade because of errors.
make: Target 'renesas/r8a77961-ulcb.dtb' not remade because of errors.
make: Target 'renesas/r8a774a1-hihope-rzg2m.dtb' not remade because of errors.
make: Target 'renesas/r8a779h2-gray-hawk-single.dtb' not remade because of errors.
make: Target 'renesas/r8a77995-draak.dtb' not remade because of errors.
make: Target 'renesas/r8a774a1-hihope-rzg2m-ex.dtb' not remade because of errors.
make: Target 'renesas/r8a779m3-ulcb.dtb' not remade because of errors.
make: Target 'renesas/r8a774a1-hihope-rzg2m-ex-idk-1110wr.dtb' not remade because of errors.
make: Target 'renesas/r8a779m3-salvator-xs.dtb' not remade because of errors.
make: Target 'renesas/r9a07g043u11-smarc.dtb' not remade because of errors.
make: Target 'renesas/r8a779g3-sparrow-hawk.dtb' not remade because of errors.
make: Target 'renesas/r8a774a1-beacon-rzg2m-kit.dtb' not remade because of errors.
make: Target 'renesas/r8a774a1-hihope-rzg2m-rev2-ex.dtb' not remade because of errors.
make: Target 'renesas/r8a779g0-white-hawk-cpu.dtb' not remade because of errors.






