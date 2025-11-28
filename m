Return-Path: <linux-renesas-soc+bounces-25322-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC9A4C91FF6
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Nov 2025 13:33:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 821B63AB9A3
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Nov 2025 12:33:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C740230FF39;
	Fri, 28 Nov 2025 12:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nfnz6E3K"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A25E42D592C
	for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Nov 2025 12:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764333187; cv=none; b=b0CJ4R6MMeJgAGJzbk3Q4quf7xqvHcBpg+HEKXfjKwP2Fb8tD3wRjUVjQSH/b0RP8RyCuldqlVGqaG/170a3iGJYGDbUTiS1dWkhIENRHAcmjivYB79LcTfpgn6nF1HhgY+2Q85EA1dekh/3aA81noZ2RqYE01gwwIT2CAQHd+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764333187; c=relaxed/simple;
	bh=Kyr+NGaRBxO6hxm8PXRSen/ZkY/TwK354v30zxL0lcQ=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=ob+pPuwRLj9JaK5YEC3BuwOkLqgrlgoa/r/Y/w1HM1aACPaVzj/d2pUqEj99zTjwvSVrd0w1xOFOfKGmGMfM2wdImZCxMkHnvY/4ijm0La9oq86RjwqpokPmfbjCRA1iIAWreMGwFC8WyXPfqN7BDmDEx6bbtIHDzPsahw7YQtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nfnz6E3K; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E331C4CEF1
	for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Nov 2025 12:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764333186;
	bh=Kyr+NGaRBxO6hxm8PXRSen/ZkY/TwK354v30zxL0lcQ=;
	h=Subject:From:Date:To:From;
	b=nfnz6E3K52VbSzeZGBrkUnErussrNO+HKVPpjx399a+lna9HqeL7a40zegdk8T1jF
	 3tZpDFfzfIH/ejmL0bLObMTWOpMA1o5vbRMjjGItGWX6TIPKNY60dXND3JrR2GuxoL
	 UxP08mexCZq/BXrd2PSyvPcfTp/fHRH0XJ8+jNsBO8V1TCO2oK9QBP2B85pvvgq573
	 mnE8+W5x7VcpcRGdEuCs31ajp8UeSmoSkYqoIAGwBH1Hxhf8dEjnzXrMMkq/7ZE5+5
	 ah7H/65FovKN81sEVRvUB3TI86Nuczs6p82tO5oB7vW75S1L4XjRlWWm55jd+ESl3U
	 GDPymtLz9Tg8w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3FEDF3806929
	for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Nov 2025 12:30:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From: patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: 
 <176433300764.651353.8922513840619075250.git-patchwork-summary@kernel.org>
Date: Fri, 28 Nov 2025 12:30:07 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Series: PCI: rzg3s-host: Add PCIe driver for Renesas RZ/G3S SoC
  Submitter: Claudiu Beznea <claudiu.beznea@tuxon.dev>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1025374
  Lore link: https://lore.kernel.org/r/20251119143523.977085-1-claudiu.beznea.uj@bp.renesas.com
    Patches: [v8,1/6] dt-bindings: PCI: renesas,r9a08g045s33-pcie: Add Renesas RZ/G3S
             [v8,3/6] arm64: dts: renesas: r9a08g045: Add PCIe node
             [v8,4/6] arm64: dts: renesas: rzg3s-smarc-som: Add PCIe reference clock
             [v8,5/6] arm64: dts: renesas: rzg3s-smarc: Enable PCIe
             [v8,6/6] arm64: defconfig: Enable PCIe for the Renesas RZ/G3S SoC

Series: Add ICU, DMAC, RSPI support for Renesas RZ/V2N SoC
  Submitter: Lad, Prabhakar <prabhakar.csengg@gmail.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1027569
  Lore link: https://lore.kernel.org/r/20251125224533.294235-1-prabhakar.mahadev-lad.rj@bp.renesas.com
    Patches: [1/4] arm64: dts: renesas: r9a09g056: Add ICU node
             [2/4] arm64: dts: renesas: r9a09g056: Add DMAC nodes
             [3/4] arm64: dts: renesas: r9a09g056: Add RSPI nodes
             [4/4] arm64: dts: renesas: r9a09g056n48-rzv2n-evk: Add NMI wakeup button support

Patch: ARM: dts: renesas: r9a06g032: Add Ethernet switch interrupts
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1028283
  Lore link: https://lore.kernel.org/r/53d45eed3709cba589a4ef3e9ad198d7e44fd9a5.1764249063.git.geert+renesas@glider.be

Patch: arm64: dts: renesas: r9a09g047e57-smarc: Remove duplicate SW_LCD_EN
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1027449
  Lore link: https://lore.kernel.org/r/1f93558c62f4461f50935644ec831a7d2cb52630.1764089463.git.geert+renesas@glider.be


Total patches: 11

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



