Return-Path: <linux-renesas-soc+bounces-8477-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B1FD5963F02
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Aug 2024 10:50:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7043D281C6F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Aug 2024 08:50:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 392F218C033;
	Thu, 29 Aug 2024 08:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DEUfChwP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14D861370
	for <linux-renesas-soc@vger.kernel.org>; Thu, 29 Aug 2024 08:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724921428; cv=none; b=mvxqbAooZR+s4563QhZuIn/4zh8HxLhiGtvxS+empoC+m+DAxJglID16hIhd7/hZLPa4ldP6NCx2QeBJQgzJmGupmF1qi9gD0RiMn4YpXwCgfjeF7aUKTNIQJMtbaSv4tGkQZujVjRTtZKliWh1+RpnuiU8g8LNhHIejDt9R4KI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724921428; c=relaxed/simple;
	bh=R/bGIyKBbZE/lfT8guF/we6OfBjA2pNuijtpfUWtGPI=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=O0NQ90pdhfOpFd88+i5+cZWOgHSHW46uRhouVnDjQqjIt8T8uDJsPEvH/HEOIeaVWBPvotN8dN0j9vhlPbgIUZyRXABP+WCED1AvXwxiYEPtX67L9eaLYJ3BmM+ZwHG/PSIV+54EITsxs4TiyhTXjICBoM3QL15APkkeOLsHJHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DEUfChwP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A875C4CEC1
	for <linux-renesas-soc@vger.kernel.org>; Thu, 29 Aug 2024 08:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724921427;
	bh=R/bGIyKBbZE/lfT8guF/we6OfBjA2pNuijtpfUWtGPI=;
	h=Subject:From:Date:To:From;
	b=DEUfChwP/ABVuPLkafAx5a65Ox1UiNSsRuHNQm2RztmvuKgdCxD+J7MuXeLWowyH+
	 w8SUFhITycnfi50hQfYRhaYzIczI6EfCQKNUsoy6dcUrvD5SRvXFBZDsBQf8+/qt+R
	 EYchcwpKX38NuPOIu7VzFi7NZvbRk1H/MInsj4Wznq9jsqLJcFYTHDoJ8pPc/pveKK
	 bkHl/v+/aZFkysx0ibPyko2U96QUrguSQsPKJGGZ4/EuN8dk7T69tCGIv6fXWxRdjF
	 Cc2SRbtIKEy1Auw+qh5XBvjquYY1iFgYMB1JETXHf7/XBZ4n+XRXk4ndgC6iJZwgTj
	 gcOLzm+mPOAnA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 025A73809A80
	for <linux-renesas-soc@vger.kernel.org>; Thu, 29 Aug 2024 08:50:29 +0000 (UTC)
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
 <172492142747.1870622.9400807530676981260.git-patchwork-summary@kernel.org>
Date: Thu, 29 Aug 2024 08:50:27 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Patch: [v5] arm64: dts: renesas: r9a07g043u11-smarc: Enable DU
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=883273
  Lore link: https://lore.kernel.org/r/20240826101648.176647-1-biju.das.jz@bp.renesas.com

Series: Add HDMI Audio support
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=883239
  Lore link: https://lore.kernel.org/r/20240826090803.56176-1-biju.das.jz@bp.renesas.com
    Patches: [v2,1/2] arm64: dts: renesas: rzg2l-smarc: Enable HDMI audio
             [v2,2/2] arm64: dts: renesas: rzg2lc-smarc: Enable HDMI audio


Total patches: 3

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



