Return-Path: <linux-renesas-soc+bounces-16314-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3EF2A9A90B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Apr 2025 11:53:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 77D343AC642
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Apr 2025 09:52:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 871BE22686B;
	Thu, 24 Apr 2025 09:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sBOpGtIq"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B7B32253E0
	for <linux-renesas-soc@vger.kernel.org>; Thu, 24 Apr 2025 09:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745488191; cv=none; b=TxndorH60DJqwH4Rj2V2Y37XFqGi9+RzScyEOllQ9/YwfL/Ja952Bd8AUSr7SXEogE1HtRGGLIGdDr816dtNAn7U0JUNa3Nos0136LiTpPGcYwQ43PbpKzJrPqFxKLWqZHpCXzlNWweXcVkAiUkIXb4qv06P4DNDKzYkpAhtySE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745488191; c=relaxed/simple;
	bh=fVelrLCytMzegyjDi1QYENCaROlUaNqRcjWOil06yyo=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=XEpeIxSnT1AM2qJPghcYZLh3+rwmhAqLqRq0H+eCmfsTruRg+ovXnhIvXi9+XY6DDkpF/OZGrXsJ1ql71QUzc2wlZQusQKlcC/GCOLqfSjjkerXdEEPSKjxpF9AnM8/7u6U9LT2IENQBGYHc/eTYfYXIsTyxvXU5hDMK3MQ1E9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sBOpGtIq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD951C4CEEB
	for <linux-renesas-soc@vger.kernel.org>; Thu, 24 Apr 2025 09:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745488190;
	bh=fVelrLCytMzegyjDi1QYENCaROlUaNqRcjWOil06yyo=;
	h=Subject:From:Date:To:From;
	b=sBOpGtIqS5FDzU4TCD58hBHvO25uf8Vzlpgnb0ykem0CyoO4h9WpHxpPnvi7oulmH
	 Mnie4rE5m/3FQpzGrtIqsQ5HxBhB9Ak1brtdmXQbKB1HFkModFpwWDwFJbl5aE+EJe
	 +KDxhpafiwc+0x/BzuWolfsL1qyeaO+R7E0xup64q7z3Yx3E7Nv9SduDtQ762QcPWl
	 B4ISNZcoJ2C+v5HXcEADyvkGZ7SWfqK0ov7STSkzvCA4csO85y+97i1X1r+xr2dqDz
	 8WCT8qZkpVmBetZiv5BCzvUvnWmEMydE7OqT7fuhaOkPFMO5qCW0QBCi3NtCgaw69K
	 DR8vjKeytKvAg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 74514380CFD9
	for <linux-renesas-soc@vger.kernel.org>; Thu, 24 Apr 2025 09:50:30 +0000 (UTC)
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
 <174548822908.3286532.6818974831715230050.git-patchwork-summary@kernel.org>
Date: Thu, 24 Apr 2025 09:50:29 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Series: rcar-isp: Prepare for ISP core support
  Submitter: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=956253
  Lore link: https://lore.kernel.org/r/20250423163113.2961049-1-niklas.soderlund+renesas@ragnatech.se
    Patches: [v3,1/7] dt-bindings: media: renesas,isp: Add ISP core function block
             [v3,2/7] arm64: dts: renesas: r8a779a0: Add ISP core function block
             [v3,3/7] arm64: dts: renesas: r8a779g0: Add ISP core function block
             [v3,4/7] arm64: dts: renesas: r8a779h0: Add ISP core function block

Series: arm64: dts: renesas: r8a779g3: Add Renesas R-Car V4H Sparrow Hawk board support
  Submitter: Marek Vasut <marek.vasut+renesas@mailbox.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=948391
  Lore link: https://lore.kernel.org/r/20250330195715.332106-1-marek.vasut+renesas@mailbox.org
    Patches: [1/4] dt-bindings: PCI: rcar-gen4-pci-host: Document optional aux clock
             [2/4] dt-bindings: vendor-prefixes: Add Retronix Technology Inc.
             [3/4] dt-bindings: soc: renesas: Document Renesas R-Car V4H Sparrow Hawk board support

Series: arm64: dts: renesas: r8a779g3: Add Retronix R-Car V4H Sparrow Hawk board support
  Submitter: Marek Vasut <marek.vasut+renesas@mailbox.org>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=955170
  Lore link: https://lore.kernel.org/r/20250420173829.200553-1-marek.vasut+renesas@mailbox.org
    Patches: [v3,1/3] dt-bindings: vendor-prefixes: Add Retronix Technology Inc.
             [v3,2/3] dt-bindings: soc: renesas: Document Retronix R-Car V4H Sparrow Hawk board support
             [v3,3/3] arm64: dts: renesas: r8a779g3: Add Retronix R-Car V4H Sparrow Hawk board support


Total patches: 10

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



