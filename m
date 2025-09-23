Return-Path: <linux-renesas-soc+bounces-22193-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B60DB94DAB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Sep 2025 09:50:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1DCA3171062
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Sep 2025 07:50:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C95A3164B5;
	Tue, 23 Sep 2025 07:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aaz1HHPf"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 488E2316191
	for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Sep 2025 07:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758613808; cv=none; b=TzR/OVk9rIlVsq4ezXUJhguRu2IDR8S/r1SY/TABFFFAM1yjJAenMRmtGaL3UDwSftysXPavw0rpoJpGwnkAGrNak84R4ChE+arGSdd74KBdRMXjFke67V6tPvlYdZl4QtEc3u7QpZ7g3EIhKT5NXuTuaEmQ9vpL2DN799eI+E8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758613808; c=relaxed/simple;
	bh=LWrcHQpuNdck3b6WIzzO9iS/eYNJY1+EIFNZWDRZgm4=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=gtftAkHo/5rR4gbAxp071RpKtY9Ky1cggMciumAxYs5zQf/hasHtDYQRun8IrDm2slyyPWZGune+mRdrwz8K3HLQhtQS/NUBLkQ84FE5a5Gvd9tjYxnoqxnf01svaWJ6PbFz3+nVbJI8l6dXE2aRzw1REzaBUdtCpxk7PoetILc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aaz1HHPf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB0F1C4CEF5
	for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Sep 2025 07:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758613807;
	bh=LWrcHQpuNdck3b6WIzzO9iS/eYNJY1+EIFNZWDRZgm4=;
	h=Subject:From:Date:To:From;
	b=aaz1HHPf78SqARluekXDF8of7QXCc/gknFErSIR7+4QVM4neCJj5wLfFXvex5Nmfy
	 p6f9m0dqgeMMlvPjMr/UDI1pZb2TnaGWzKI5lRNBXJOAuBVgQFL2UR7aWYpHFZvIss
	 1N+4jvGJn72fPcAl0wh4mCMcrbhIemng4ET8Uv8tEdVmgjPnzeavkj8nU5pcgzRJj7
	 s91t6p331gJiJvM0DQ61qaXr2cITXIsoYDgQyLU9ZC8HPkYEKLyhT8WrR4U/iKKUjF
	 tZJukcy/tpPiv6JEirCkLdcUkT+qZspEl08PJfQ22TCTqQhKYTY2/sOKzDrWp3LG1s
	 B9Ilho6SevWDw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3761739D0C20
	for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Sep 2025 07:50:06 +0000 (UTC)
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
 <175861380479.1318316.11036238782187371369.git-patchwork-summary@kernel.org>
Date: Tue, 23 Sep 2025 07:50:04 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Patch: arm64: dts: renesas: v3{m|h}sk: remove wrong sound property in HDMI encoder node
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1004464
  Lore link: https://lore.kernel.org/r/20250920070433.8229-2-wsa+renesas@sang-engineering.com


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



