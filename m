Return-Path: <linux-renesas-soc+bounces-16702-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C2B5AABC88
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  6 May 2025 10:06:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9575A7A79B6
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  6 May 2025 07:59:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E035E231CB0;
	Tue,  6 May 2025 07:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ruQsEq/k"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB602228CBC
	for <linux-renesas-soc@vger.kernel.org>; Tue,  6 May 2025 07:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746517789; cv=none; b=QIUJH8K8Oz3GwW3HBHN20TAZ+34sv6/wE2EzJIVFCaUXXD/BpNgmJqxV3tHTyc1Bsn8QQ9iF8+ULS02cBK+SdyWLdNG1zg6SdSAi6+UxTTnSlGftaAKTYdsG1nt4S0DKzBKS4aVDVlaMeqEZ27bgtCDwuhmnf47PNnHX/Udcgwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746517789; c=relaxed/simple;
	bh=oTE7ICN71PiOTdjz0ijUdfJuhlNQqhNOnJhc3Pb54mc=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=NtMV5GwMg+M82ULMkxbuYHZHNm2KAihejyuZBosWwLqhgD6j7wEF/gte/lppU5GZvb+6dBEU3cCQvgSCqmwUeg20xDy4jvxKNf3TkATiftqgBmKSi3ZMvge77+9ckB1BrbKpEJPRtctJ/C97J7QRQYShdlK9YRu0Kpmd17METuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ruQsEq/k; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B6FCC4CEE4
	for <linux-renesas-soc@vger.kernel.org>; Tue,  6 May 2025 07:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746517789;
	bh=oTE7ICN71PiOTdjz0ijUdfJuhlNQqhNOnJhc3Pb54mc=;
	h=Subject:From:Date:To:From;
	b=ruQsEq/kkZY8KHST5wzplHEWb7wpVcz84AUXgZmJHjQWx0jwyZG6idvM5rrE0zONQ
	 jpn5FNyWUXvBHymL+O+EH6WEcpIc8bho6SCe63eo2IMDUrG0NnolwkcCu/rLf1CXW9
	 LNtTvzo+idNXb3d4Y98rBrwl00he793kbE/R9SeabIkCR02ODX6Bho1DtSWHPJNGCT
	 S0ZiNu7aWJWcWgOzqDkINvP1cIhGcLFhwkEXYXZxKmyUOHphSu2o4OXeKdbsji19/T
	 EGvpRWGuq9tUQkOvsYHrhthJcHB7USH8NK3fap0B5pRRX11CY2X3mHlv4A3fy5MViL
	 Y4xXktwjVrlag==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7466D3822D64
	for <linux-renesas-soc@vger.kernel.org>; Tue,  6 May 2025 07:50:29 +0000 (UTC)
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
 <174651782813.1079559.12904681172668075865.git-patchwork-summary@kernel.org>
Date: Tue, 06 May 2025 07:50:28 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Patch: [PATCH/LOCAL] arm64: renesas: defconfig: Enable more Sparrow Hawk support
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=957706
  Lore link: https://lore.kernel.org/r/b798900b9ffb0c7f88ce0b960be011d345a243c1.1745842607.git.geert+renesas@glider.be

Series: ARM: dts: renesas: r9a06g032-rzn1d400: enable USB
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=956944
  Lore link: https://lore.kernel.org/r/20250425100129.11942-4-wsa+renesas@sang-engineering.com
    Patches: [1/2] ARM: dts: renesas: r9a06g032-rzn1d400-db: enable USB device port

Patch: ARM: dts: renesas: r9a06g032-rzn1d400-eb: Add GMAC1 port
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=953009
  Lore link: https://lore.kernel.org/r/20250414100206.7185-2-wsa+renesas@sang-engineering.com

Patch: ARM: shmobile: defconfig: Enable more support for RZN1D-DB/EB
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=957705
  Lore link: https://lore.kernel.org/r/a40aa69832ef292497b9170e2ad607bd9dfd7e21.1745842538.git.geert+renesas@glider.be

Patch: ARM: dts: renesas: r9a06g032-rzn1d400-eb: describe 9-pin SubD-serial port
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=956567
  Lore link: https://lore.kernel.org/r/20250424102805.22803-2-wsa+renesas@sang-engineering.com


Total patches: 5

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



