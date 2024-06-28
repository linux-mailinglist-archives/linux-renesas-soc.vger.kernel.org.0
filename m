Return-Path: <linux-renesas-soc+bounces-6858-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F70891B8EC
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Jun 2024 09:50:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1C974287909
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Jun 2024 07:50:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55CAF142E88;
	Fri, 28 Jun 2024 07:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jaiIbPDX"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 314E51420D0
	for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Jun 2024 07:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719561030; cv=none; b=grF5jZB7EQBFsF77JDRBT4rA9TccrJ/WS7a1fJJdpmmJ7qGaamILAGjxX34iHSqaNXrrHpy+/5LlxNNWBNFLIZd5bbkOdi3+iLJ0vOoUxiwDOnWNlqwcP7sK8fmjxIFZjwfLL0k5GtFgV9R6Yv3CkISvfHBPm7JCA6cZqMfXNqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719561030; c=relaxed/simple;
	bh=V0SdAxRBXLfZjQln9LkWS2rq5/lxnADgnUu3ABxmCzE=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=TTJZ8oo1W86E28fOvL4syEv8Vp9T2go/M41qAnLr4uuTxHAaJZsJhdofW0EsC3aRI5FP3AP4CDyuWUE/F7DFAmc3+/+gtnWrLYjZLH6JJR/U2v/hRbop+MNbDkAyjh6/2AOzwwa1rXFlLd3PVmBq4VEur+shfWN46SrnYwn3TVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jaiIbPDX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id B3805C116B1
	for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Jun 2024 07:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719561029;
	bh=V0SdAxRBXLfZjQln9LkWS2rq5/lxnADgnUu3ABxmCzE=;
	h=Subject:From:Date:To:From;
	b=jaiIbPDX3WPciDBZd+ro1I4x2sVQb+3FNbxVJhOAkn3MYEVv7xAdzzGz6fgAetT8k
	 vK4AiH9bLes4KmFsBc2p0+04NajtsXcJ5PfLzu4o2yiUSZLUXGSM+AnIJ+mDA1k40g
	 vwF0hao/v/dAQ/ResnocW6lCSU/HqH/wx7HHysUwK0vcISwuD1Efcx4z0DKQsc+ny0
	 wgYm8vc5wjFTxI2YLDUXk9US1GrYzcIvRUQ/4u1zJtRudFuPkaYvvuju2N9fphU2SI
	 /JU1ia/gC3W8q7oam0rLhG2gU5WeDBGdncxTkc0VLGyxjRUOv16QYyI8c+vDjnKEd1
	 kvMsjrVMKj1SQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A5F05C433A2
	for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Jun 2024 07:50:29 +0000 (UTC)
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
 <171956102961.7063.6966405225977460755.git-patchwork-summary@kernel.org>
Date: Fri, 28 Jun 2024 07:50:29 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Patch: [-next] soc: renesas: Remove unneeded semicolon
  Submitter: Yang Li <yang.lee@linux.alibaba.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=866397
  Lore link: https://lore.kernel.org/r/20240628052010.31856-1-yang.lee@linux.alibaba.com

Patch: arm64: dts: renesas: r8a779h0: Drop "opp-shared" from opp-table-0
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=863865
  Lore link: https://lore.kernel.org/r/4e0227ff4388485cdb1ca2855ee6df92754e756e.1718890585.git.geert+renesas@glider.be


Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



