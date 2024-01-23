Return-Path: <linux-renesas-soc+bounces-1680-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D23F88389DF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Jan 2024 10:00:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6E7C31F21251
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Jan 2024 09:00:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91053524A9;
	Tue, 23 Jan 2024 09:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Knd1K4Jc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CF1851C54
	for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Jan 2024 09:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706000427; cv=none; b=dbWOw6Llnr8uxmpbW3R7zlSWZtOSiCvPMtsnoqxwcY3sfORMV6bOxsHel1oWUM/uX50k2foNB4uqiJVLomFVxRjVAb8skeI07CfBmUQtFhFbyNLHmu22jDqX/cAOz7V3FD97oSVpu0TxWteCQG1I05fOwj02qIon/DaEplne1pI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706000427; c=relaxed/simple;
	bh=6w8ZhBpgfhAb9m8NQpa/H9rxC+e6qaGf+iHCYP4rYQ0=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=tmrLlvGKuFhl6qmtWfxqb+SKxlU8rvCU6UDXe9ElB1ccQdpfSwfDi7ZlsyfECp1drfB8yT/8RMWIvACWs5CwxIlthZyG/TdFdmPXp39l5Hemb+UV6+vVlCtrbMY55oDxymJ4HbRcgTaRaIGZDbXjCZlmFdrhyH13+8BaBXRLNlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Knd1K4Jc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 05224C433F1
	for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Jan 2024 09:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706000427;
	bh=6w8ZhBpgfhAb9m8NQpa/H9rxC+e6qaGf+iHCYP4rYQ0=;
	h=Subject:From:Date:To:From;
	b=Knd1K4JcRI0Rq2Jn2/PNW+ETK05CEkbsUKuBV7WrnDwEFAigXVmOgzQyvo6AKg7ZN
	 HHn03x0C+E90bjMjIZt/r7L/POpp4/SV+xxxIZ7onz8x2AN7LWxz25bLIrFwASOplq
	 byuJHkLR2O04Qa4bqz9x4S1U24qgCy6NaJy+3T5euxHEzOv0xH4LokZPU4sTgKbKRM
	 SQviJ5HuCT9KQj6ZniiIvWrqiWxg8b5nGDsPsJnCnt7jtAn6WEFAhM3IXjn/+XkRq9
	 Z1BTnSADZ89vfGqpZjLPhPr0Yj7RV+WDtp3PQ94uBP0VX4yhoBtqIGLdpNN92BMqd1
	 47lVOtggM0FVg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id DE956D8C97F
	for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Jan 2024 09:00:26 +0000 (UTC)
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
 <170600042686.13828.12041259576317861388.git-patchwork-summary@kernel.org>
Date: Tue, 23 Jan 2024 09:00:26 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Patch: ARM: shmobile: defconfig: Disable staging
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=818641
  Lore link: https://lore.kernel.org/r/7f1fa862cb508a5d29947380b72324be027ac76f.1705933596.git.geert+renesas@glider.be

Patch: ARM: multi_v7_defconfig: Disable board staging
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=818644
  Lore link: https://lore.kernel.org/r/64c1d4613d5dfc1f70816f2136d66b75c8e39c1f.1705933656.git.geert+renesas@glider.be

Patch: [PATCH/LOCAL] arm64: renesas: defconfig: Refresh for v6.8-rc1
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=818645
  Lore link: https://lore.kernel.org/r/7de641cfea3f78c6ebb6f05e5f1475c0424f2abc.1705933751.git.geert+renesas@glider.be


Total patches: 3

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



