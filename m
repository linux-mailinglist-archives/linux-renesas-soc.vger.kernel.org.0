Return-Path: <linux-renesas-soc+bounces-14199-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A5736A590F4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Mar 2025 11:20:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C429F188DE4C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Mar 2025 10:20:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5549022259D;
	Mon, 10 Mar 2025 10:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sgl6lIy8"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30FEA21D5A0
	for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Mar 2025 10:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741602020; cv=none; b=KJDxIe/HvmUGJhM8Gj6qZa5yxN+d7LCPW/6Z6x7AW/pmU4F0fDc5YfWmUnM1e8ROWItJ5aCkCTPFZEJMOd+A+o/b3ocErdzVM39DAnqdEoF1KU/B0KNht56tzSxViG0Lx5EFz1DLwr5g4rxSu37dx2jm26/x2wyDZeidwDMjsyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741602020; c=relaxed/simple;
	bh=6Plh781Rhx7mhAbqymjvh4kjrR5C1YQEl4JejE992dU=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=t2BgcUVXNjND7cyUHnhquOm/TMCvOskDWiActFCG1/0fHwDKQXGcFd+kcZ/Vj3Q/CFGYRXt+rNzJUz3axIBpVAm+v7Z2GdNvOfkuPNPCUpsRjazkDe0W/FaKxVloVwvK96G4p14kljdDIc0V77R1wMjVcRgZMhnrJgLhLMQHsHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sgl6lIy8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0A22C4CEE5
	for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Mar 2025 10:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741602018;
	bh=6Plh781Rhx7mhAbqymjvh4kjrR5C1YQEl4JejE992dU=;
	h=Subject:From:Date:To:From;
	b=Sgl6lIy8o99UIGWk4O+fuORGBEituWopObzhtQPWC4+rXb+lu7/X9900znYMis/e1
	 BNNflBIuJt7gnvI8g6/e4yJiesh1y/sa/atd7fapfIdRJocyFSb0UQVQSVvz1++1EC
	 79Jq7h4TBgulQFLY8VktFxvjBzUfLoAT88Be+txcurO/aY3rG0ARsr0/e+3BXAGNje
	 JA6mX8GO5jsiez4raa4NJ0hCrE5kFAGpgDhc+/d/VUs6CYrpWKOGc42Y/pTRs0iDU0
	 gEq7anSe+odAay1PYltOs+g0ppSRbvwScAwrg2X9rYDCmuz9hw9CyJG0Bc5iT4rHN2
	 kqukSWjKAhtZQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B4B49380AC1C
	for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Mar 2025 10:20:53 +0000 (UTC)
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
 <174160205222.3465667.515162537380859248.git-patchwork-summary@kernel.org>
Date: Mon, 10 Mar 2025 10:20:52 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Patch: gpio: rcar: Use raw_spinlock to protect register access
  Submitter: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
  Committer: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=927247
  Lore link: https://lore.kernel.org/r/20250121135833.3769310-1-niklas.soderlund+renesas@ragnatech.se

Series: Fix missing of_node_put() calls
  Submitter: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
  Committer: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=940635
  Lore link: https://lore.kernel.org/r/20250305163753.34913-1-fabrizio.castro.jz@renesas.com
    Patches: [1/4] gpio: rcar: Fix missing of_node_put() call


Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



