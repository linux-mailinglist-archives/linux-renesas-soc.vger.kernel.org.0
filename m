Return-Path: <linux-renesas-soc+bounces-4932-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 978BF8B532A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Apr 2024 10:31:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 494F62828C7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Apr 2024 08:31:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59BD1175A4;
	Mon, 29 Apr 2024 08:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ofsywKAF"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 335821758E
	for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Apr 2024 08:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714379460; cv=none; b=ZU4VBTQm1gQYqIx5EPNt2IhA5ZB0XDkN6uCqYDSw7FY1k4215McIVz67vdB7pgzfG0xnQxrnRZqEPuQQQ1rKhLL95hHKr+7Opv5V+JULWLCZnCIArazhQL8NHk8DZdJZWanK68hXg/Cwe7QdmixbL2cF6MUVFYonTT4LVfKUfmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714379460; c=relaxed/simple;
	bh=Ce3eS+IeG85JtA5m4ZLHU68eyREsITd4rB1TUzrvrGI=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=rVCo5Xa7o5AIgyFJUFXVZBjORCUzjz6SPnBjW4BpE1bIdQkAQSyjn8daDPmhXF2OpkpPWX6QljlDhzHeIp3YnBlmTTeaHjGHWUVb7Bl95qNvp6GCS4uLpajAas7VlyF6skN7Gb3O2zJ70KyyeDX4Bo56FyMPfa1rUMDxiROYA4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ofsywKAF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C2208C113CD
	for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Apr 2024 08:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714379459;
	bh=Ce3eS+IeG85JtA5m4ZLHU68eyREsITd4rB1TUzrvrGI=;
	h=Subject:From:Date:To:From;
	b=ofsywKAFPT+7Cuz+OrWcrLa5w6Fq4FwPnc2KUa8ZTRgT3bcRz6WB2naWVswNpLox/
	 Y7JqeItj27FSmd2AjyvwT3MZLuJ5Kc4mxsVSqJ3VUjaD0LPGtX7PGleyzCPCJx8jgA
	 BX7cpwdK5+/YUpVUrXzky7j3k3UP2C4N0z6UkjvoAM3E/lvhg0nRmb5DZtA3ovD54n
	 H1F5HD4UE0JT7EsYWm2VsJhQrneDxhwN08moI8RPISUmpxhABWQaVPWvaZV922l87f
	 k1KByqgzhZIOJPSe44afIvNHBw7/s769pkc8oOLdQW6ZWOi5W4duaWyitgare+8ufz
	 DrtXVDthioI4Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id AE4CAC43616
	for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Apr 2024 08:30:59 +0000 (UTC)
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
 <171437945965.19610.12443071697513734591.git-patchwork-summary@kernel.org>
Date: Mon, 29 Apr 2024 08:30:59 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Patch: net: ravb: Fix registered interrupt names
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Jakub Kicinski <kuba@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=847346
  Lore link: https://lore.kernel.org/r/cde67b68adf115b3cf0b44c32334ae00b2fbb321.1713944647.git.geert+renesas@glider.be


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



