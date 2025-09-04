Return-Path: <linux-renesas-soc+bounces-21323-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 50297B43812
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 12:11:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8BD50189350D
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 10:11:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39DD52F90E2;
	Thu,  4 Sep 2025 10:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tyVZFtbp"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14F7A2EC567
	for <linux-renesas-soc@vger.kernel.org>; Thu,  4 Sep 2025 10:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756980605; cv=none; b=UbS+ckwTsHvAAmMLo35kw6bMMk66VBaTFKDLD4RZLabbETW217VQ0IoYCx97p9HjhjdKJeD48BheGmJDuA/AVVLeIJUcY/F0zPOTv1DEEs5EtKIGUQXH7AQu3v21DVKwHHA3WqA4OWzmReMj52UhXqIKDUY4aSzy/Pu5/chZT1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756980605; c=relaxed/simple;
	bh=nx5qbbA6fZxYSzaizdNlNByp8SHIV6HgUMg375NsjkA=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=nPWS/681cGyFfSrBOU3EFL+/WPeDjz0lmp7YkTujlYH6rA2ffy7wWNa/5qdfIr1ZVKKqPSRakjdv0+nm+i8gtwsPKDiKdEygx2ZzgnZJoGcDdAu0RKm+usNp6hcwjLTTvYVBE3v31v9QMmyeUrt4V0+5Wnrus1OONv6JOaAggSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tyVZFtbp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 780CFC4CEF0
	for <linux-renesas-soc@vger.kernel.org>; Thu,  4 Sep 2025 10:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756980604;
	bh=nx5qbbA6fZxYSzaizdNlNByp8SHIV6HgUMg375NsjkA=;
	h=Subject:From:Date:To:From;
	b=tyVZFtbpVCLUE5Ry5C6suNvp+DTVL2PspmMckPdS+lKIDM6jWp8ZOQIWay6UK09Xy
	 FvGhpyjm+40iM+5+cl9sphmd/WIS2J+QoUgpad24yH8MlmM1GYAjt9dbwcQynOUu47
	 wFvGjN+eQ/ie8HYqfc/PEOfReGOXunmgLvXF5T4wnm6EQat2zAT88NifcH4+JShLvj
	 vePUV7S14gtWAR6o765faQ74XbOU2PeViLlrDhqRu6MVcHn89sk+gTbB1nHFRB8JKD
	 si7GA5fURCxVitEBJosK3a45FgsjWmlb56i3Ix6qriN11RlrLWGLGHnfzg7BBSuVXI
	 vG9IydXuSAimg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 74AB5383C259
	for <linux-renesas-soc@vger.kernel.org>; Thu,  4 Sep 2025 10:10:10 +0000 (UTC)
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
 <175698060893.1749921.1418617214117468000.git-patchwork-summary@kernel.org>
Date: Thu, 04 Sep 2025 10:10:08 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Series: arm64: dts: renesas: Add support for LEDs/I2C/MMC on RZ/{T2H,RZ/N2H} SoCs and boards
  Submitter: Prabhakar <prabhakar.csengg@gmail.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=993668
  Lore link: https://lore.kernel.org/r/20250820200659.2048755-1-prabhakar.mahadev-lad.rj@bp.renesas.com
    Patches: [v2,1/9] arm64: dts: renesas: r9a09g087: Add pinctrl node
             [v2,2/9] arm64: dts: renesas: r9a09g077m44-rzt2h-evk: Add user LEDs
             [v2,3/9] arm64: dts: renesas: r9a09g087m44-rzn2h-evk: Add user LEDs
             [v2,4/9] arm64: dts: renesas: rzt2h-evk-common: Add pinctrl for SCI0 node
             [v2,5/9] arm64: dts: renesas: r9a09g087m44-rzt2h-evk: Enable I2C0 and I2C1 support
             [v2,6/9] arm64: dts: renesas: rzt2h-evk-common: Enable EEPROM on I2C0
             [v2,7/9] arm64: dts: renesas: rzt2h/rzn2h: Enable eMMC
             [v2,8/9] arm64: dts: renesas: rzt2h/rzn2h: Enable MicroSD card slot
             [v2,9/9] arm64: dts: renesas: rzt2h/rzn2h: Enable SD card slot

Series: arm64: dts: renesas: Add support for WDT/USB2.0 on RZ/{T2H,N2H} SoCs and EVKs
  Submitter: Prabhakar <prabhakar.csengg@gmail.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=994145
  Lore link: https://lore.kernel.org/r/20250821161946.1096033-1-prabhakar.mahadev-lad.rj@bp.renesas.com
    Patches: [1/6] arm64: dts: renesas: r9a09g077: Add WDT nodes
             [2/6] arm64: dts: renesas: r9a09g087: Add WDT nodes
             [3/6] arm64: dts: renesas: rzt2h-evk-common: Enable WDT2

Series: arm64: dts: renesas: Add support for SCI/LEDs/I2C/MMC on RZ/{T2H,RZ/N2H} SoCs and boards
  Submitter: Prabhakar <prabhakar.csengg@gmail.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=990711
  Lore link: https://lore.kernel.org/r/20250812200344.3253781-1-prabhakar.mahadev-lad.rj@bp.renesas.com
    Patches: [01/13] arm64: dts: renesas: r9a09g077: Add DT nodes for SCI channels 1-5
             [10/13] arm64: dts: renesas: rzt2h-evk-common: Enable EEPROM on I2C0


Total patches: 14

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



