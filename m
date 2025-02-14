Return-Path: <linux-renesas-soc+bounces-13152-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B1399A359E1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Feb 2025 10:12:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D554A1891FD5
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Feb 2025 09:12:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3EE023A993;
	Fri, 14 Feb 2025 09:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qZ4FhnsA"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE4D22D79D
	for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Feb 2025 09:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739524202; cv=none; b=m4qJTYDK6Ex7DVV+fK8AaSgqVOt8n2ijhJi9kVcIvQ/4lkoEvfEECxCesd6B6Hc+rt3o3VUs815vDQznkcG/gvQGcGHkC/7HRm9hu7c7KVCwBUyrK6rVCxreLnBSL6wPSrWGtKx0F9sa6hUWTMcB0HSkt6qO+196/+vUJIxIiMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739524202; c=relaxed/simple;
	bh=fQqa1LLJGi3peqLMoThHlKnSPnhlJAHNqbCYOXYBhfc=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=OJJ44gb/DPFjKM5HS5OIXmn9PAmvUtsaIBkfycj8cwkkGTz0balhyfg76evakbfDKoKATQeJeITGNxKxNnHra1IGy7z2any/4XpxnN3hE0xyFBJzwxb7ism2Krf2CMWgeIIrHe/rgdlwT9Dt6oXzcv1L9wnMHLBWSP18EkD3ihY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qZ4FhnsA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21D2DC4CEE2
	for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Feb 2025 09:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739524202;
	bh=fQqa1LLJGi3peqLMoThHlKnSPnhlJAHNqbCYOXYBhfc=;
	h=Subject:From:Date:To:From;
	b=qZ4FhnsAbIf4UUidNNmkAhmtOKQQMyqJJE6uchwBzNkMSaRGDrgIu6Y/7HL5UhYi1
	 Lix1c9RIi6JaNERED56Me2ll63+/cVLi2PiL/sstjAABy4kEVmWRlyNzkxisVrb/4N
	 sNTqhYQ+YhCtP9il6XucRPM6NuqfncD1SV2MYcI8X1zDyUeRYgJHRshZHlmpC1a/h4
	 6wNXovDE/j9/G1kZ0OYgkT3/w4ZSFdGOHC9llq4Us+yTAoz8X0a0HR6Cs5uOEFbXFN
	 WogscaGTYqM/A0hSx7A7HabnSzOXcih7t1TWvCRAhpGZ1Gsil+1O6wwpc/XY7kv3V1
	 z5RW4r6gQNfuA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7AAF3380CEE8
	for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Feb 2025 09:10:32 +0000 (UTC)
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
 <173952423109.1559798.2477082500030108249.git-patchwork-summary@kernel.org>
Date: Fri, 14 Feb 2025 09:10:31 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Patch: arm64: dts: renesas: ulcb/kf: Use TDM Split Mode for capture
  Submitter: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=929875
  Lore link: https://lore.kernel.org/r/875xlrshp5.wl-kuninori.morimoto.gx@renesas.com

Series: [1/3] ARM: dts: renesas: Add boot phase tags marking to Renesas R-Car Gen2
  Submitter: Marek Vasut <marek.vasut+renesas@mailbox.org>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=932046
  Lore link: https://lore.kernel.org/r/20250209180616.160253-1-marek.vasut+renesas@mailbox.org
    Patches: [1/3] ARM: dts: renesas: Add boot phase tags marking to Renesas R-Car Gen2
             [2/3] arm64: dts: renesas: Add boot phase tags marking to Renesas R-Car Gen3 and Gen4
             [3/3] arm64: dts: renesas: Add boot phase tags marking to Renesas RZ/G2


Total patches: 4

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



