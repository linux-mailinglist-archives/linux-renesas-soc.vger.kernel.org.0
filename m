Return-Path: <linux-renesas-soc+bounces-23953-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 83187C2429C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 31 Oct 2025 10:30:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2E6064E4015
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 31 Oct 2025 09:30:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5A732F0C68;
	Fri, 31 Oct 2025 09:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nSAE1VkO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C13F33594A
	for <linux-renesas-soc@vger.kernel.org>; Fri, 31 Oct 2025 09:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761903029; cv=none; b=Xw+7vlfyaTK0k4RcioFbFhaPAs23AhC02atSRBcpmTI6zc1Vv/iVoXDRhN+DcUipvWJpHRMDbmiduD46sejHoP8SZvAYY79ZDw1SLCAovpeoMd5mh7w+GBL5p3fS/nWPOLL9E1OGMKxCEUS9h+xMjeVzziGHoKbFwpmZdQsCZvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761903029; c=relaxed/simple;
	bh=ok9LydhYxMmfmLGgUimzBaFOJ2zylM6LYL1U/Z4I6YM=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=eSv3LzFmcj9laE2WbmwYrrZh+CxeaHEb3rhe2ZJ9DJr24lCz1++ZJP5pT4HnVxsPMWwMrzQuDpQ7ipAzl7Ndm6PTdFInJAAbV3NZNfVf8cmGj43m7jmSHKlIJq5Bh8w39oCGA80Hjf6xhYLLDmWamk/jjB2gPhMLeMzt5wVN6m4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nSAE1VkO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49D9BC4CEE7
	for <linux-renesas-soc@vger.kernel.org>; Fri, 31 Oct 2025 09:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761903029;
	bh=ok9LydhYxMmfmLGgUimzBaFOJ2zylM6LYL1U/Z4I6YM=;
	h=Subject:From:Date:To:From;
	b=nSAE1VkOac7v5ELiMuOYQyorTu7opSN9kT/oiVHISYn0Gt6DshqEbn5KvU7Tm1VfC
	 FtGMsjJCWBNdf9p6g+RlrYu1q2rCdlDE6Y6eC8nqOVYWh0GDySHXtli6X4cNaPPBHU
	 GP7mIoT9SehUP3zU5DiEwhI6z4tdXCYS+gZGi3TfC8Te2Xh1IkX4jZm+ehyXFOtxkV
	 2E6/cXZJkUF154+3gLHUAdvDUUlwHnPCtZqkC6w5RTBrrRC2lgNjke1uTNiKj92nYq
	 8eG2MGao1nTVmKmtCaEmnub6YNLxlzMYf0OwRI8x6FbQl4bBMs/16Y9L1DlaKinkwb
	 vKtJ4I/HQGXBQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B146A3A78B28
	for <linux-renesas-soc@vger.kernel.org>; Fri, 31 Oct 2025 09:30:06 +0000 (UTC)
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
 <176190300521.19177.10901732149221740310.git-patchwork-summary@kernel.org>
Date: Fri, 31 Oct 2025 09:30:05 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Patch: arm64: dts: renesas: sparrow-hawk: Fix full-size DP connector node name and labels
  Submitter: Marek Vasut <marek.vasut+renesas@mailbox.org>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1016413
  Lore link: https://lore.kernel.org/r/20251027184604.34550-1-marek.vasut+renesas@mailbox.org


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



