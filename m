Return-Path: <linux-renesas-soc+bounces-15899-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B900A87C10
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Apr 2025 11:40:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E17417A2E5B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Apr 2025 09:39:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF9921F1506;
	Mon, 14 Apr 2025 09:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SO+aG8TO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8A671A83E8
	for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Apr 2025 09:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744623638; cv=none; b=BytBefmdj2QxUkPzrYzdfWRU7nYHLadX/2DTXcZCS7yEQsMYCOQLzmqzCWgBvyt9tykAPx6C5CZ+9C1m9evDpzUPwxOvKEUE4AyRo9Rn+6M0IzXtOxJ+tiCcI4wpdSZLW9sRSq7nMp1Z4+qPrnGw+9ouwIkVrG2tmkJAQ4RtS8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744623638; c=relaxed/simple;
	bh=r7h2RASlOq1SZOphAsbaKidaaHYWvsXqLBDI8jx6UDo=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=PCl98717dRDbQqo2jLKl7qunec9n/62UB25klP1BFEalgsi7VYy/427TqsYcgei0ojV/4eJjkODm9r8bnDhG41hZZrTb7eLZ74/CR5hyo7hx7qFvQUPuUWyKCO2n2MyJ18uqSvtYeCu70lDWLxvN7L0c5XKneJ5QubSOlVXbbWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SO+aG8TO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35820C4CEE2
	for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Apr 2025 09:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744623638;
	bh=r7h2RASlOq1SZOphAsbaKidaaHYWvsXqLBDI8jx6UDo=;
	h=Subject:From:Date:To:From;
	b=SO+aG8TOhgWeAyMqO9ZDkF1Q9O07Y37kcQi06tIC+Vd56zAf0d3qm3KLXmI6fLfry
	 DN+yJBI4bpLTbXs8b9gmCC060Cu7xA77Z1UqeMKME2n/FVOLN14JRnMqjuhxUFFjTb
	 +nn8VEeyN8iFDDmicULYA/vE1EJKCOnkjPrvTw7hDsJdL5Z4SQ9IEM/Ysg4zXO9ZuA
	 1O7lUHEcN6lMmJOrAAn9N2BEsLZDbkDq1UxSDrTUZ8yN935QJF3+oJvHkxQPfz0GHm
	 k4OoAweTYDoIo0QVa3+FM5Ydru/d/WV6HZwZov45ytgBqnDFRA+sLuFzS3e6oVnnJ7
	 66eTrIiF2CokQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 385CC3822D4B
	for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Apr 2025 09:41:17 +0000 (UTC)
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
 <174462367581.1816700.4741970780781124771.git-patchwork-summary@kernel.org>
Date: Mon, 14 Apr 2025 09:41:15 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Series: Add support for Renesas RZ/V2N SoC and EVK
  Submitter: Lad, Prabhakar <prabhakar.csengg@gmail.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=947472
  Lore link: https://lore.kernel.org/r/20250326143945.82142-1-prabhakar.mahadev-lad.rj@bp.renesas.com
    Patches: [01/15] dt-bindings: soc: renesas: Document Renesas RZ/V2N SoC variants
             [04/15] dt-bindings: soc: renesas: Document SYS for RZ/V2N SoC
             [08/15] dt-bindings: clock: renesas: Document RZ/V2N SoC CPG

Series: Add support for Renesas RZ/V2N SoC and EVK
  Submitter: Lad, Prabhakar <prabhakar.csengg@gmail.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=950770
  Lore link: https://lore.kernel.org/r/20250407191628.323613-1-prabhakar.mahadev-lad.rj@bp.renesas.com
    Patches: [v2,01/12] dt-bindings: soc: renesas: Document Renesas RZ/V2N SoC variants and EVK
             [v2,02/12] soc: renesas: Add config option for RZ/V2N (R9A09G056) SoC
             [v2,03/12] dt-bindings: soc: renesas: Document SYS for RZ/V2N SoC
             [v2,06/12] dt-bindings: clock: renesas: Document RZ/V2N SoC CPG
             [v2,09/12] dt-bindings: pinctrl: renesas: Document RZ/V2N SoC
             [v2,11/12] arm64: dts: renesas: Add initial SoC DTSI for RZ/V2N
             [v2,12/12] arm64: dts: renesas: Add initial device tree for RZ/V2N EVK

Patch: [v4] ARM: dts: r9a06g032: add r9a06g032-rzn1d400-eb board device-tree
  Submitter: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=946866
  Lore link: https://lore.kernel.org/r/20250324-rzn1d400-eb-v4-1-d7ebbbad1918@bootlin.com

Patch: [PATCH/LOCAL] arm64: renesas: defconfig: Refresh for v6.15-rc1
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=951548
  Lore link: https://lore.kernel.org/r/7c1e94ef1d150a4ea1c08492d33e608acb5402ec.1744203030.git.geert+renesas@glider.be

Series: Simplify Renesas SoC Configuration
  Submitter: Lad, Prabhakar <prabhakar.csengg@gmail.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=948828
  Lore link: https://lore.kernel.org/r/20250401090133.68146-1-prabhakar.mahadev-lad.rj@bp.renesas.com
    Patches: [1/4] soc: renesas: Kconfig: Enable SoCs by default when ARCH_RENESAS is set
             [2/4] arm64: defconfig: Remove individual Renesas SoC entries
             [3/4] arm: shmobile_defconfig: Drop individual Renesas SoC entries
             [4/4] arm: multi_v7_defconfig: Drop individual Renesas SoC entries

Patch: [PATCH/LOCAL] arm64: renesas: defconfig: Remove individual Renesas SoC entries
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=951547
  Lore link: https://lore.kernel.org/r/b76439632baf86289dea00ff6b2e3ac69251cebc.1744203849.git.geert+renesas@glider.be

Series: ARM: dts: renesas: r9a06g032-rzn1d400-eb: enable SD card port
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=951879
  Lore link: https://lore.kernel.org/r/20250410071406.9669-4-wsa+renesas@sang-engineering.com
    Patches: [1/2] ARM: dts: renesas: r9a06g032: Describe SDHCI controllers
             [2/2] ARM: dts: renesas: r9a06g032-rzn1d400-eb: describe SD card port

Series: ARM: dts: renesas: r9a06g032-rzn1d400-db: enable I2C infrastructure
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=948117
  Lore link: https://lore.kernel.org/r/20250328153134.2881-7-wsa+renesas@sang-engineering.com
    Patches: [1/5] ARM: dts: renesas: r9a06g032: Describe I2C controllers
             [2/5] ARM: dts: renesas: r9a06g032-rzn1d400-db: describe I2C bus
             [3/5] ARM: dts: renesas: r9a06g032-rzn1d400-eb: describe I2C bus
             [5/5] ARM: dts: renesas: r9a06g032-rzn1d400-db: describe keys

Patch: [PATCH/LOCAL] riscv: rzfive: defconfig: Refresh for v6.15-rc1
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=951546
  Lore link: https://lore.kernel.org/r/8a76cfea356d60b15e1108e408ca09f3fff8c0f5.1744203111.git.geert+renesas@glider.be

Patch: iommu/ipmmu-vmsa: Register in a sensible order
  Submitter: Robin Murphy <robin.murphy@arm.com>
  Committer: Joerg Roedel <jroedel@suse.de>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=945954
  Lore link: https://lore.kernel.org/r/53be6667544de65a15415b699e38a9a965692e45.1742481687.git.robin.murphy@arm.com


Total patches: 25

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



