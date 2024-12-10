Return-Path: <linux-renesas-soc+bounces-11149-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 209C99EB030
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Dec 2024 12:50:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 43A67188673C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Dec 2024 11:50:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7468E19E7F9;
	Tue, 10 Dec 2024 11:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O+L3/0y+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50A3419CC3E
	for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Dec 2024 11:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733831419; cv=none; b=jVU91Y+mfnLZfM9L5Z32KC14au4aYsHnGRyw8I1peML7+/iw1bd27KrM7jNOTA+T44sI1unEvs7Y5pl1EY59bxcOh5LpL6+gZRH7J1Xvdehkv/NTuxg+927Nr7k9ZWEmkS34NtReaSgL0u+airKWnegVimjQ/bCK8rf9sVH1WbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733831419; c=relaxed/simple;
	bh=WYXpQq8l15r4gPSz4Ss5v5CRIvLCP1xy4Obsc/ulX+k=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=smThkjr+7AUPBYONnhp1KVv6ycpEhcjpYaeh2xMAGevENQQv/T7GV+fPBUqj4UUfi5kU4t6qMWEKRbEh5COLqa9f4YRfh3U0QrY3/IDSObP3Hk5JOteJKg3R+V7a6+cwL/z+QjE9P3c4VxsGkMNF6e4EsQLoA8Ta+Uljta3DpyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O+L3/0y+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8D08C4CED6
	for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Dec 2024 11:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733831418;
	bh=WYXpQq8l15r4gPSz4Ss5v5CRIvLCP1xy4Obsc/ulX+k=;
	h=Subject:From:Date:To:From;
	b=O+L3/0y+KNDNo+0f6rilsgF+u9enHHxVYUnZ0iTGeiOAUA6eZFpqcse2orRVT6rE/
	 ZSJuWfo33LsOm60/S8PqJnXTwTeK912BwC8sUEJAu5+lv1Gu9D/Qx+V5xp8Q7cJH7M
	 +hYO4DpXBo+wKZ2s90JudE1uMp0Z8ySHXxDNsmNJLm5NxocMCjpz0Bqwe6rILAJwHt
	 38xwuMkFnUV7VnExVpBHipAP/HgOMZdUrMXz0G6XjGbtiMgjwChqwrGLhOdyPjiLyZ
	 0nmULJHZrV+CvxSPJD1Zc9qlvQPaTHtgLfRbu2U8ZPCKiLxAWyIYMVbUzL7CyuXmLj
	 CSf2yYPtkOZBw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B1E45380A95E
	for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Dec 2024 11:50:35 +0000 (UTC)
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
 <173383143416.778032.277194372244242859.git-patchwork-summary@kernel.org>
Date: Tue, 10 Dec 2024 11:50:34 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Patch: ARM: shmobile: defconfig: Refresh for v6.13-rc1
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=914568
  Lore link: https://lore.kernel.org/r/b8727e642508433016290a998c880b54de2e208d.1733320866.git.geert+renesas@glider.be

Series: arm64: renesas: Add R8A779G3 White Hawk Single support
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=913832
  Lore link: https://lore.kernel.org/r/cover.1733156661.git.geert+renesas@glider.be
    Patches: [1/5] dt-bindings: soc: renesas: Move R8A779G0 White Hawk up
             [2/5] dt-bindings: soc: renesas: Document R8A779G3 White Hawk Single
             [3/5] arm64: dts: renesas: Factor out White Hawk Single board support
             [4/5] arm64: dts: renesas: Add R8A779G3 SoC support
             [5/5] arm64: dts: renesas: r8a779g3: Add White Hawk Single support

Series: arm64: dts: renesas: white-hawk-single: Add R-Car Sound support
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=914917
  Lore link: https://lore.kernel.org/r/cover.1733402907.git.geert+renesas@glider.be
    Patches: [1/2] arm64: dts: renesas: white-hawk-ard-audio: Drop SoC part
             [2/2] arm64: dts: renesas: white-hawk-single: Add R-Car Sound support

Series: Add support for the rest of Renesas RZ/G3S serial interfaces
  Submitter: Claudiu Beznea <claudiu.beznea@tuxon.dev>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=909989
  Lore link: https://lore.kernel.org/r/20241115134401.3893008-1-claudiu.beznea.uj@bp.renesas.com
    Patches: [v3,1/8] clk: renesas: r9a08g045: Add clock, reset and power domain for the remaining SCIFs
             [v3,4/8] arm64: dts: renesas: r9a08g045: Add the remaining SCIF interfaces
             [v3,5/8] arm64: dts: renesas: rzg3s-smarc: Fix the debug serial alias

Patch: arm64: defconfig: Enable Renesas RZ/V2H(P) Watchdog driver
  Submitter: Lad, Prabhakar <prabhakar.csengg@gmail.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=908775
  Lore link: https://lore.kernel.org/r/20241112093412.20093-1-prabhakar.mahadev-lad.rj@bp.renesas.com

Patch: [PATCH/LOCAL] arm64: renesas: defconfig: Refresh for v6.13-rc1
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=914573
  Lore link: https://lore.kernel.org/r/6c2212abecd41e99b0acff3620a0b11f76a7e942.1733320915.git.geert+renesas@glider.be

Patch: [PATCH/LOCAL] riscv: rzfive: defconfig: Refresh for v6.13-rc1
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=914574
  Lore link: https://lore.kernel.org/r/907bc1b1ac5cc5840da47f6d8204fd1213164644.1733321043.git.geert+renesas@glider.be


Total patches: 14

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



