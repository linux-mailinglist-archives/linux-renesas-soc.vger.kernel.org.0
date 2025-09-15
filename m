Return-Path: <linux-renesas-soc+bounces-21852-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B35AB57337
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Sep 2025 10:40:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4F34216DD19
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Sep 2025 08:40:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12F9F2D5C7A;
	Mon, 15 Sep 2025 08:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="opowCYAa"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E299829D260
	for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Sep 2025 08:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757925654; cv=none; b=L0ry9xC+e1NCCwhSavn3T7FYpwZ4JJBAexOJEujlS0K37ta+iNpN7BI/Shdl5rBMa0H/CHb/TYNJjxA/ETuMPCrNCNvVSX8mEJXL8UqHXcrjFjvEA3T2h8XD2en4uBQND3dnm8RQOeMg7VogMSDQJTPyM2gmwOwjIjGka87Pwds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757925654; c=relaxed/simple;
	bh=euto4cuMNR6EFFz7yLRMDR8VJ7RFrcMGFxGQq7RHwnI=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=XaJ6twP3w9HUUfxA3zytJ54QVzZDjFZ7TeuOwobhximW2orps/94ekwGyP15kiEvycGHwTbddiPciMf5QRI3i6T48uxPrakTDGr1Sh8n4Gqaef7yroLQIW4ZBW8wC+Elbnki+xq1cTenTeAAORvNDWB3MkO11t24ODBCeXC3NRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=opowCYAa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A9D6C4CEF1
	for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Sep 2025 08:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757925653;
	bh=euto4cuMNR6EFFz7yLRMDR8VJ7RFrcMGFxGQq7RHwnI=;
	h=Subject:From:Date:To:From;
	b=opowCYAaPqbAseivpbEZIWFvwWAB9zj8O+nK+/wKmlWQC7gru1Nah4kiYzzA4Fg6i
	 6TKy4SADJ7KdhWP7KBK8hxp/HmIhlGCQPhcQqdhxBXOAKatnl6eiyvjWrJVVyH9Vlz
	 HWXIrmgFsGok2f6+02CSupXtLeje/wAD5rUnGq7YD6Oy1mtfkqb22AO9k2hTpIyyss
	 c+M6zuK5uOwjb42J4kbqQRnZ8aacu0M8qnUtTM/FiR8N/XMXIwjt7+3tc6c4Vj3ZMl
	 CNvPwvpIRW+2CG2cFncWnmPNWqLxczvgBUiQXkYKo7EhBKIKypb34SCZQh7ffIn/yV
	 fTzJI/CDFqKWg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 37E13383BF57
	for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Sep 2025 08:40:56 +0000 (UTC)
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
 <175792565484.4057911.15657949252487241858.git-patchwork-summary@kernel.org>
Date: Mon, 15 Sep 2025 08:40:54 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Patch: can: rcar_can: Fix s2ram with PSCI
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Marc Kleine-Budde <mkl@pengutronix.de>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=991477
  Lore link: https://lore.kernel.org/r/699b2f7fcb60b31b6f976a37f08ce99c5ffccb31.1755165227.git.geert+renesas@glider.be


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



