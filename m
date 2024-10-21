Return-Path: <linux-renesas-soc+bounces-9938-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E82A9A6059
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Oct 2024 11:41:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1466AB210B1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Oct 2024 09:41:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBF0D1E284E;
	Mon, 21 Oct 2024 09:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k+ex4Fyv"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4232198837
	for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Oct 2024 09:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729503672; cv=none; b=QJK5vCEgo0FR7856OItbmMZHvCP1Rl0kK0jCe1LWtk2i72oUaw6i1CIGTnBpZoO5hduaStQQqZnCl+3XKxw9ZdGP+WLlo4KCxKIwOH1dlt9FPDUef9bTEOcXWa05N+MuaxtvSj9TP37vNIJdG65BCXEqxVsuPPyTn2eZ7sOOXsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729503672; c=relaxed/simple;
	bh=LTF9B/5sRSdaf3HfXVlyhk9ED2/MtHCGwmt9h1y/bhM=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=bEuRrzx7Y1/uKmUUYTYUYYZsIAJGOpSGeE03VbnXp6dgEGeqWo5jZNh0LGlJbljL/B6kPBJtCvjlhadg79g1GN+OoP/pXhZ6P/lrkiolB2i/fMJI2DkNQ3qvvPwMiqgMFHdoFziberr1edKAjYGn4Gx99YHKIayGXkuw4A/GZnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k+ex4Fyv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67129C4CEC3
	for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Oct 2024 09:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729503672;
	bh=LTF9B/5sRSdaf3HfXVlyhk9ED2/MtHCGwmt9h1y/bhM=;
	h=Subject:From:Date:To:From;
	b=k+ex4FyvCWNxt8nYjf6zLjPbowDcVTECaCOzvGirKg0Aq09E6HSISFkjQK2RqHrrY
	 KFcSH7sAKzSGmwi2e47PxhXw5FqGLq9OJwiAVCSz4+H0/1BSvnAzgTJkVzsQERyiRW
	 Hl3U8iR3P2muLsIHcpLhRJJeNX/AxwdG84Yh6+iJc7UehQc8J/t4dQHdLKrWDKpxe6
	 cwBQc5uOTSm81Zho+EEczjFV3WlIIfwpBqOQWFvg9X08IRlXnxCGz0Vzt4lXtsjx4w
	 vabGbZGbWAkVYXExQ4k5iJtS1ZTMfYe4TVPI7ym5eFgWlTSH70VdLjWQNJ8pu7A9wt
	 v6qDyO+mO4kTQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 765583809A8A
	for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Oct 2024 09:41:19 +0000 (UTC)
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
 <172950367794.187649.1079974118061118969.git-patchwork-summary@kernel.org>
Date: Mon, 21 Oct 2024 09:41:17 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Patch: [v4] irqchip/renesas-rzg2l: Fix missing put_device
  Submitter: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
  Committer: Thomas Gleixner <tglx@linutronix.de>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=898299
  Lore link: https://lore.kernel.org/r/20241011172003.1242841-1-fabrizio.castro.jz@renesas.com

Patch: [net] net: ethernet: rtsn: fix potential memory leak in rtsn_start_xmit()
  Submitter: Wang Hai <wanghai38@huawei.com>
  Committer: Jakub Kicinski <kuba@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=898931
  Lore link: https://lore.kernel.org/r/20241014144250.38802-1-wanghai38@huawei.com

Patch: [net-next,v2] net: ravb: Only advertise Rx/Tx timestamps if hardware supports it
  Submitter: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
  Committer: Jakub Kicinski <kuba@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=898877
  Lore link: https://lore.kernel.org/r/20241014124343.3875285-1-niklas.soderlund+renesas@ragnatech.se


Total patches: 3

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



