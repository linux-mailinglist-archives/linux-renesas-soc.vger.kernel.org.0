Return-Path: <linux-renesas-soc+bounces-16825-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 41928AB030B
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 May 2025 20:40:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D6939506694
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 May 2025 18:40:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3DC52882A3;
	Thu,  8 May 2025 18:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JrdtUSdD"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B83228750F
	for <linux-renesas-soc@vger.kernel.org>; Thu,  8 May 2025 18:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746729592; cv=none; b=gtkrJW4xlo0YDxcjozoNG2msuY6LdDKYQhW2ANlk0nUiHnpMK9cDOGZTmXleQxvSkw7UWNBIb614hUNZfEYGoDXLVaoW4V/R583+znjtrCLoVmnXZYSGVPAyC/tsCyQY2NM7vNzKPFNtkPjw9EfdV2cJ4v0NTIB1SHhGd3F4qpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746729592; c=relaxed/simple;
	bh=srfoOUUo2ugkcG2O4pf5kYwKKFTVUSANRo7Hih30/jg=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=WxynlWuLrO9qXpXB6Dcsjr3rCy/TeWkvOvYBMxhbxWc/VSYICBnxTNjLm9fzcnGghvgEcEWn2v9mZT3W5a7Vswh6al2JxgdYFvVmGWPb7qLJPuTMveCKipdu9uZQFE4HWuIxVdHIVVwBQ+4l7onmXOj1bIMx/uT9MJUuLMYWJwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JrdtUSdD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2A1CC4CEE7
	for <linux-renesas-soc@vger.kernel.org>; Thu,  8 May 2025 18:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746729591;
	bh=srfoOUUo2ugkcG2O4pf5kYwKKFTVUSANRo7Hih30/jg=;
	h=Subject:From:Date:To:From;
	b=JrdtUSdD1zLM6MRIUpyniGHbylWboJd7jwdtfi9lWF16Kmt677PEASfDwo01OZp6I
	 nGESYT2AE3t7JmMXOafUZhsgGj1pm6Z/OccV2kC7BQpijyd+5pqNavzuYYbCV8Wfnu
	 WGUOMQPnq68sRRolI2kTCUAIv613KURfVbwD9l+o91+Pg8AIkOfyl3LkWUH5hx0iMi
	 hrDt45Tb6VyoUydqG/qYteyT5p62TpAVpg/5xrehLBevVTCu1iFvtaUDwNkaDvZ1x/
	 9rMxpr2HwPWtMWt9Cem4kQjSBnEiPSvPVe9U+gTZeSKiQFmrTOSFUqQK//91CXcAan
	 bSZTch52s82kA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B215F380AA70
	for <linux-renesas-soc@vger.kernel.org>; Thu,  8 May 2025 18:40:31 +0000 (UTC)
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
 <174672963033.3007694.7819323394619358454.git-patchwork-summary@kernel.org>
Date: Thu, 08 May 2025 18:40:30 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Patch: arm64: dts: renesas: white-hawk-single: Improve Ethernet TSN description
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=960472
  Lore link: https://lore.kernel.org/r/367f10a18aa196ff1c96734dd9bd5634b312c421.1746624368.git.geert+renesas@glider.be

Series: ARM: dts: renesas: r9a06g032-rzn1d400: enable USB host
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=960791
  Lore link: https://lore.kernel.org/r/20250508074311.20343-4-wsa+renesas@sang-engineering.com
    Patches: [v2,1/2] ARM: dts: renesas: r9a06g032-rzn1d400-db: add pinmux for the CPLD
             [v2,2/2] ARM: dts: renesas: r9a06g032-rzn1d400-eb: enable USB host port


Total patches: 3

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



