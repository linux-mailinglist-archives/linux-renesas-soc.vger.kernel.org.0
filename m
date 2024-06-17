Return-Path: <linux-renesas-soc+bounces-6326-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9754D90A782
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Jun 2024 09:41:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7336FB22DFF
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Jun 2024 07:40:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C25118754D;
	Mon, 17 Jun 2024 07:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YWYpHVOL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB379187544
	for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Jun 2024 07:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718610051; cv=none; b=PGUzSqN+lAP7zwyavcyiX8Ux1/b1A0uunxreuUzJNDI6ymNFS+aF3lk8nQGaIHQpiuxHb0bd7v0cVmiuhqiaaCL1MjLGjz4Za/YYAEZRggN5SNcKz2wtJaHUUgeHs9eqxjdgCyrI55nAXTWuBHFJeUtC3sMIdmfD3qx9dcoh4c4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718610051; c=relaxed/simple;
	bh=hOHG790zGeY5JtuqRF2P7FpwtwVCs05zeER1N39/R5s=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=hj/gB31vj+FWMFihMWCeI/zx/TorfXyYaCy+r37Rlgad8aP3X9CxrceMyMq2ZSXhq3S3GkcC7cu60ZGlnta9ExPI8MRAgaI5oTSDNjvwZyAeihi5U5L9sCIbq/jtMww49DntlFvN5hlUnZBKA3BqWqMwmLYIZMIBqWh9aRpBXjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YWYpHVOL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 66759C2BD10
	for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Jun 2024 07:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718610050;
	bh=hOHG790zGeY5JtuqRF2P7FpwtwVCs05zeER1N39/R5s=;
	h=Subject:From:Date:To:From;
	b=YWYpHVOLeLQaqlwRFuKguM9Q3dTXuu4CIKLHXhYZSboeaoGhKQz2QQE745q9+FPWH
	 7FevE7AW0IWPLG+W5xFdGp0bc65KmaK/xBayBclv43fMA4q9jq80MVxaHWS22fKSDp
	 2/aQ3g6U0iqrMv257hr2cUnilslnYrOF5jn1R1lpQt0X1ft/bjXz8U8ziDMenXDeio
	 da9VhUrI4LQ/kSzGe5E88WhiFT86vgl59s1NItdcNXt3UQVCow/KiWylDIkwBdZ0hs
	 E0+nqZu0dnS64v3VP6IUcZljAcqg6OxBDMIdzwdFd1TU0k0F9fWuig8DD2a5yVJYyg
	 qKCcOxoQfMufQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 4C410C4332E
	for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Jun 2024 07:40:50 +0000 (UTC)
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
 <171861005025.13781.4501912624088066829.git-patchwork-summary@kernel.org>
Date: Mon, 17 Jun 2024 07:40:50 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Patch: [v3] drm: renesas: shmobile: Call drm_atomic_helper_shutdown() at shutdown time
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Maxime Ripard <mripard@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=861055
  Lore link: https://lore.kernel.org/r/17c6a5a668e5975f871b77fb1fca6711a0799d9e.1718176895.git.geert+renesas@glider.be


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



