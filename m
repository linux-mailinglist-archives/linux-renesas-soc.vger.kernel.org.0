Return-Path: <linux-renesas-soc+bounces-5482-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E278CFB90
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 May 2024 10:34:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D4D74B21159
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 May 2024 08:34:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 702F413541E;
	Mon, 27 May 2024 08:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W/WpKMlY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CD961327E5
	for <linux-renesas-soc@vger.kernel.org>; Mon, 27 May 2024 08:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716798860; cv=none; b=r69rrlUfDWxEOpTxql76sGzid/f8Lt6MYM+nVljb/z9PHxlV2PacfnWyLaat1+f10yE/EC3ez944WlXkgpCX2CPSuKsKgEx8AYFTblnUJBr9kcZt6ZxkPiGf0d5Ik+zz5cP1dV8vuT7zjIwndoKyYXaUeAEU8QEufTSuxCYXxrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716798860; c=relaxed/simple;
	bh=TQizAR9KhgN2bZF3L4w8J7hK9VXV7wftCT4QJ4Rbqz0=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=OBc8DSSxGj6FuUIeB9MJjRxutKcFAppUHrQqiwDSG2QLi8PWezwpA5Xtdk6U3324SbzqtqLGpKyYyrTWagwk/aS/zC7AtIjQz/LB7nC/e55InQrDZ85BHi9OyMEvWSW9WjCOYcVt/yatwhbf6oad3UAufgLmuTC+vAfzRSUMlUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W/WpKMlY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C6CD5C4AF0A
	for <linux-renesas-soc@vger.kernel.org>; Mon, 27 May 2024 08:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716798859;
	bh=TQizAR9KhgN2bZF3L4w8J7hK9VXV7wftCT4QJ4Rbqz0=;
	h=Subject:From:Date:To:From;
	b=W/WpKMlYRgkCh2fVT5unuT2jkfOPpxwhQhTpqhMSk/ZUWR+99jTgjtxrbvKpankJz
	 Aq09nLCyynbHEA/yhGCsTPv5rkg3YuhvVv9SQ8IJwYeaWQws2U4JpEoudZdu9EirHm
	 1WGPGrXepG2xrJbREasvJHIYnwUVRenv3C5AuwwhOvD+8DYN0ez+Vvu8X5I7OTq1w6
	 Y21IOjRuSvhbCL3iUuM6unNoSgb89s96+nPPTsmwJUXqFlb/4iwE2WwLiv1yO68efr
	 1ZnlplIvmVQB9WBNt9Oto2Lz8YY5ZNJa6V55g3F0tPBWn7tLa7+Iulg6Ux2VQ/QOKL
	 qbRJ/iqRfWecg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id B72BCCF21F8
	for <linux-renesas-soc@vger.kernel.org>; Mon, 27 May 2024 08:34:19 +0000 (UTC)
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
 <171679885967.18134.8828861554576371927.git-patchwork-summary@kernel.org>
Date: Mon, 27 May 2024 08:34:19 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
geert/renesas-devel.git (next):

Patch: [GIT,PULL] Renesas DTS updates for v6.10 (take two)
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=848113
  Lore link: https://lore.kernel.org/r/cover.1714116737.git.geert+renesas@glider.be

Series: Renesas SoC updates for v6.10
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=843991
  Lore link: https://lore.kernel.org/r/cover.1712915528.git.geert+renesas@glider.be
    Patches: [GIT,PULL,1/4] Renesas ARM defconfig updates for v6.10
             [GIT,PULL,2/4] Renesas driver updates for v6.10
             [GIT,PULL,3/4] Renesas DT binding updates for v6.10
             [GIT,PULL,4/4] Renesas DTS updates for v6.10


Total patches: 5

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



