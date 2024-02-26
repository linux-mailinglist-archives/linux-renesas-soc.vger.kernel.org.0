Return-Path: <linux-renesas-soc+bounces-3160-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2000886704C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Feb 2024 11:15:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CDECC285838
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Feb 2024 10:15:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59CC677F18;
	Mon, 26 Feb 2024 09:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GMtRJ3Bp"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3609977F19
	for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Feb 2024 09:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708941056; cv=none; b=FSGqNxz9h9gVvov4GcnnQ7mBouLd5WQn1TIkowNIsa8XXwxSV30+RkOlnAY3G7XgCaj3pZvET+mORkdrP0nHCIii9D15ALQ35D9g/Z2c6myVlNTa1TMhPW4nGAkhRV4YD2O3Un663+maixqHAp61i/RSOXrO67oR9R/B5GvwEMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708941056; c=relaxed/simple;
	bh=7Pchoczvcmhu2cNRIUzZLibp/7ML3RCLGR/a6vVYJj4=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=q3EYnzu3Y62CL0j2vL6e4vJBkW23l8Jx1XUkmdHnkH78ixPx72DuIa8QGmJazEAjAsyVJbNQHSGxZ8HKlrL73JRmFwQshJf6zqbBEnFgN+H5EO3CQ5iBP0C7T9lxQA3sU6jiWAexoR2mvWcxJ0MxdstnEYmC+a1R0xv6lO4cJu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GMtRJ3Bp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id AC9C6C433C7
	for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Feb 2024 09:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708941055;
	bh=7Pchoczvcmhu2cNRIUzZLibp/7ML3RCLGR/a6vVYJj4=;
	h=Subject:From:Date:To:From;
	b=GMtRJ3Bp5Dx1tmexLtdgD90LRA2A5C1GH9MmrKHtH0I5z+rzK2dQh4JvStiH5KDyT
	 JebGmEs4Si5T8pyA83DFa7dDdKAbEyKjXdnoEy7W5SnBXnlu96yFl6hvpJMeipXD7Z
	 VozVZZOkmuRCM9Q6yvpWoPa+2rBZY9Oq6HKRrHdpUv/C1l/2kM860sFceHaHVXc3MW
	 lcgy/cOpgdB/PWHrfgw+FSrIytRL/sKfKcwYXNazY0uKyH15FBx/fc5F5f3d6zoT08
	 S43NIPGayRuJVAidKB0uHW0WVGHYzuS4GkkkcxF/ZJcrZPiG27kMcEUWnFamAUlMGM
	 RQ1K8eW+rkAEw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 8FC2BD88FB1
	for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Feb 2024 09:50:55 +0000 (UTC)
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
 <170894105551.27061.7124315324098347846.git-patchwork-summary@kernel.org>
Date: Mon, 26 Feb 2024 09:50:55 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Patch: [GIT,PULL] Renesas fixes for v6.8
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=828619
  Lore link: https://lore.kernel.org/r/cover.1708597150.git.geert+renesas@glider.be

Patch: cache: ax45mp_cache: Align end size to cache boundary in ax45mp_dma_cache_wback()
  Submitter: Lad, Prabhakar <prabhakar.csengg@gmail.com>
  Committer: Conor Dooley <conor.dooley@microchip.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=822809
  Lore link: https://lore.kernel.org/r/20240203212640.129797-1-prabhakar.mahadev-lad.rj@bp.renesas.com


Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



