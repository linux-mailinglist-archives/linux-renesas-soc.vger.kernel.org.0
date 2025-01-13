Return-Path: <linux-renesas-soc+bounces-12077-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CEAABA0B2CF
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jan 2025 10:30:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EA1791886781
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jan 2025 09:30:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54E3A232368;
	Mon, 13 Jan 2025 09:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UocXKzKw"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 308A018A950
	for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Jan 2025 09:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736760637; cv=none; b=ufElTeCytQ+6m5jMDLux1TjRcRDwoU/JSfUQt8ZeadJ1I3vmcNXfXl6GtX1Td/+K4CGh4gxT6tt8kLsOmtkNmVZiYDvBcrqWjaW24POPWwpGq8ykmFQ43PiAUqmueMD9834gwZaNHYVs19C8RyTe7nUBqBCgwE5ZBE2RSUhs8dU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736760637; c=relaxed/simple;
	bh=hswqT1l+6j698BHYO4925PuisH4xNZ+QNv6aKy1xTLc=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=t5RHryg9Etv/lgxcl+oPdEmXYtgTcE2g28YjyebCwmp4OIvLovZwKYO8JV5nHW43yUEaXDMc76pgEjJmttEX/dfFLJE2SNFL/W5W60R1dxgDF0hp5yCLYRuvWZ8ihmcprqlVoyzRjFWOkrYmXEz9E9yoXWDnkNoZMB0sGf7G7FI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UocXKzKw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFD6CC4CED6
	for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Jan 2025 09:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736760636;
	bh=hswqT1l+6j698BHYO4925PuisH4xNZ+QNv6aKy1xTLc=;
	h=Subject:From:Date:To:From;
	b=UocXKzKwGcv/msQRT2PvrgpYjgLpPkfyiiDHv5xKjGg1uBR6FvDlyX7PYfwhQwMwr
	 u9yE8ihFdWFgjE75ODA5WnwioNQvbmtE4xILFhmkc7Eh/lgiVURHJhJnGgXS+jG1kQ
	 pUR8oXk/jKwNUpL7UvVw8m27GteB2KTnlFYbhPButDdyNwbf7N6aGi+a4TVSP2HJfe
	 QoXuvo/p8qgiWJIX79rSpTvzCSbJUqr9mrLIxLvHO74uDnqA7xSo4bsdTxzoV6klOJ
	 Zn/rALaVpNjiBfCmhz/Nj/08sYfT9+F29pc+ROHuFR3YHGPbBCfKe9FTR1oqrEoM8X
	 KuO3RqR1VbCYQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3B96D380AA61
	for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Jan 2025 09:31:00 +0000 (UTC)
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
 <173676065878.3421781.16874476348682065270.git-patchwork-summary@kernel.org>
Date: Mon, 13 Jan 2025 09:30:58 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Patch: [PATCH/RFC] ARM: shmobile: rcar-gen2: Remove CMA reservation code
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=922878
  Lore link: https://lore.kernel.org/r/3d38f4fec20c4af46e4570012de7017eee9a39e9.1736249109.git.geert+renesas@glider.be

Series: arm64: dts: renesas: r8a779a0: Describe FCPVX and VSPX
  Submitter: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=923737
  Lore link: https://lore.kernel.org/r/20250109125433.2402045-1-niklas.soderlund+renesas@ragnatech.se
    Patches: [1/2] arm64: dts: renesas: r8a779a0: Add FCPVX instances
             [2/2] arm64: dts: renesas: r8a779a0: Add VSPX instances

Patch: arm64: dts: renesas: gray-hawk-single: Restore sort order
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=924188
  Lore link: https://lore.kernel.org/r/4f3e057b9a73d7ee7ff073f51bb9a4c30bdd0c84.1736506813.git.geert+renesas@glider.be


Total patches: 4

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



