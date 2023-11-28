Return-Path: <linux-renesas-soc+bounces-320-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D8267FB60E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Nov 2023 10:40:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B76481F20C22
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Nov 2023 09:40:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B984249F8B;
	Tue, 28 Nov 2023 09:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H/dRDdMb"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AE882E3F2
	for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Nov 2023 09:40:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 11AB9C433C9
	for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Nov 2023 09:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701164426;
	bh=5K2UxS4Xn/InnFjd7qTVHwxvzfqABLxf0/OQFx6PXAg=;
	h=Subject:From:Date:To:From;
	b=H/dRDdMbcznmNrF89/lVQCUhbECj2boznHpvHcPwt6V3cyxh34MZZ+Ex1sDjCnkh0
	 9hQ5Z8xtPE2owgm9vfJOujT6QaSu0bmRjyW+wvj6d/IDaq3kRpe9lPGUy7k+vgsltt
	 5q64sSyTHLgWsRhy7HcTqJqUBjpOptqSNBKj6cuwZbMnrbH1jO33O02TUQMk+XaoP7
	 981jgeJDIC/U04d05q0KQ1pRUgS6DMA1h5N93RClIoVfglJykneZZlhfSQCQD/spTh
	 ChOk7bGOZ2g2a0tr8mP9+ZBqGmEK207Ofvpv6tSMswNy8IzQP7x+aVDzGl7nLHXrir
	 kghk4SU5N6d+w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E19FBDFAA80
	for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Nov 2023 09:40:25 +0000 (UTC)
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
 <170116442585.19881.1852450150785289675.git-patchwork-summary@kernel.org>
Date: Tue, 28 Nov 2023 09:40:25 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Patch: arm64: dts: renesas: r9a09g011: Add missing space in compatible
  Submitter: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=804258
  Lore link: https://lore.kernel.org/r/20231125233242.237660-1-niklas.soderlund+renesas@ragnatech.se

Patch: ARM: dts: renesas: r9a06g032: Add missing space in compatible
  Submitter: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=804259
  Lore link: https://lore.kernel.org/r/20231125233327.238575-1-niklas.soderlund+renesas@ragnatech.se


Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



