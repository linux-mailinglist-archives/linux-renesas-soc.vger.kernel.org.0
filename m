Return-Path: <linux-renesas-soc+bounces-9628-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A792F996A03
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Oct 2024 14:30:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D986C1C21536
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Oct 2024 12:30:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 038C1192580;
	Wed,  9 Oct 2024 12:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AnrU1dgZ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D365C191F82
	for <linux-renesas-soc@vger.kernel.org>; Wed,  9 Oct 2024 12:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728477030; cv=none; b=doB2O1jZvCS8L23fefDISZOnayg8pZhVEx/IECnQqZoLJLdQAlTFpdziiyfoCLTXhKc9RlqT0r1ogb0bq5Zj+Pl1vCTr4DRw4CJjnJ9iMk0ajDyDJ7nxNpN/L3c0fMYHBcWpKyZpGwY2xNR3d+b6jrZyvkF6UXegvDHTFVmDTB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728477030; c=relaxed/simple;
	bh=05+jw1wSiQyNMxGuh59w3XVHJ+UUDYG1Nq2uzpl0HWo=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=tOG6KxCWaUb6N6UwNPbkkR1ZhQWlrOr1VEdBKhdrtfJxf+JrPVE0FrShyUUqg9S7T0k1/T0llpwWqi4wZyole7dGycZ854EsmtjHLjJL747zedcrTmftxlzUMxe+KpF1Py2jsqxxLJTJt6jzYqAgTkqXIFc2Vpv+3Mbdlb9QGAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AnrU1dgZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A79EC4CEC5
	for <linux-renesas-soc@vger.kernel.org>; Wed,  9 Oct 2024 12:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728477030;
	bh=05+jw1wSiQyNMxGuh59w3XVHJ+UUDYG1Nq2uzpl0HWo=;
	h=Subject:From:Date:To:From;
	b=AnrU1dgZsejM+/eaI3fH1HD09uzhFjZonGLy7alJJ80aMBUOJoq1WM3nVEG6oD32Y
	 1b9UI3BfEhcsl7QfcEFh5HsFRfOl0l0dywMe+OEEM3wiFP8yz2SApweIGBwNcqftP0
	 rgAuy6gHzhYuxVByK0lSgp40GMLdT2B2uNNWi8tB1Imfw9h5vzJAjqC/sCHBpKEYUg
	 SB+5qT9xPm75SY7PQmkBdAVxqwJVOPyIsTcg4tCjD9wU1rketQh3dMXlN0c8D1kfj5
	 J5N1XdWIuU9LY8kNfphD1nWEZSk9sHAr//ntOM0JbTiU6+oM8iwct7XQVybRZvFUzL
	 7+rXrC3WlgH+A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B554E3806644
	for <linux-renesas-soc@vger.kernel.org>; Wed,  9 Oct 2024 12:30:35 +0000 (UTC)
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
 <172847703429.1249779.7875180071052727267.git-patchwork-summary@kernel.org>
Date: Wed, 09 Oct 2024 12:30:34 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Series: arm64: dts: renesas: Add SD/OE pin properties (part B)
  Submitter: Sean Anderson <sean.anderson@linux.dev>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=893565
  Lore link: https://lore.kernel.org/r/20240927201313.624762-1-sean.anderson@linux.dev
    Patches: [1/3] arm64: dts: renesas: salvator-x: Add SD/OE pin properties
             [2/3] arm64: dts: renesas: hihope: Add SD/OE pin properties
             [3/3] arm64: dts: renesas: beacon: Add SD/OE pin properties

Series: arm64: renesas: defconfig: Updates after v6.12-rc1
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=895135
  Lore link: https://lore.kernel.org/r/cover.1727949523.git.geert+renesas@glider.be
    Patches: [PATCH/LOCAL,1/3] arm64: renesas: defconfig: Disable Synopsys DesignWare I2C support
             [PATCH/LOCAL,2/3] arm64: renesas: defconfig: Enable RZ/V2H(P) Watchdog support
             [PATCH/LOCAL,3/3] arm64: renesas: defconfig: Refresh for v6.12-rc1

Series: ARM: dts: renesas: genmai: enable SDHI and MMCIF
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=893604
  Lore link: https://lore.kernel.org/r/20240928092953.2982-5-wsa+renesas@sang-engineering.com
    Patches: [v2,1/3] ARM: dts: renesas: genmai: enable SDHI0
             [v2,3/3] ARM: dts: renesas: genmai: enable MMCIF

Series: arm64: dts: renesas: Add SD/OE pin properties
  Submitter: Sean Anderson <sean.anderson@linux.dev>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=893232
  Lore link: https://lore.kernel.org/r/20240926180903.479895-1-sean.anderson@linux.dev
    Patches: [1/2] arm64: dts: renesas: salvator-xs: Add SD/OE pin properties
             [2/2] arm64: dts: renesas: ulcb: Add SD/OE pin properties

Series: Add Renesas R-Car Gen4 E-FUSE support
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=895205
  Lore link: https://lore.kernel.org/r/cover.1727963347.git.geert+renesas@glider.be
    Patches: [v3,resend,1/7] dt-bindings: fuse: Move renesas,rcar-{efuse,otp} to nvmem
             [v3,resend,3/7] arm64: dts: renesas: r8a779a0: Add E-FUSE node
             [v3,resend,4/7] arm64: dts: renesas: r8a779f0: Add E-FUSE node
             [v3,resend,6/7] arm64: dts: renesas: r8a779g0: Add OTP_MEM node
             [v3,resend,7/7] arm64: dts: renesas: r8a779h0: Add OTP_MEM node

Series: Enable serial NOR flash on RZ/G2UL SMARC EVK
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=895688
  Lore link: https://lore.kernel.org/r/20241004173235.74307-1-biju.das.jz@bp.renesas.com
    Patches: [v5,1/2] arm64: dts: renesas: rzg2ul-smarc-som: Enable serial NOR flash
             [v5,2/2] arm64: dts: renesas: rz{g2l,g2lc}-smarc-som: Update partition table for spi-nor flash


Total patches: 17

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



