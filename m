Return-Path: <linux-renesas-soc+bounces-14462-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 335FEA64C45
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Mar 2025 12:20:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 565317A20FC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Mar 2025 11:19:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23C40233141;
	Mon, 17 Mar 2025 11:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VQzp9ikd"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F411E19F133
	for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Mar 2025 11:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742210417; cv=none; b=H0DKlmwucODn2N5F5N8d0mT/+mE/gUZui6IsDg7LZ8jQgJvsGcXdZU+XYoS/1CzPXJhhsEe7cYo8h6Cl07gGCTuRgItGvfcXaJiqWo8zQzl5+nrZei041kBjn6+e6RD18koX//NlP8yyjyCEoOc9vSLS8HxKITaDeoAt1BT3CSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742210417; c=relaxed/simple;
	bh=gepm7eEs+eOdsK/0envpXJq/8iZFnb0qumLA+Rk9g60=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=dMjPFW6uarcvP7Xt+oHfKPn/7nbpkFKC0JB2vgje+814e7zkBxEuYNzsVSf8ckL7gD4BdyOWyHWKH5naR6xhNB6YvQG6CBeO6IJPtKhi8moVkmIiRZZbTeX+HW2NUp+9YSUexlobTVd79UFkTuQWXffK/OF1iwPT/3CUVLpBRGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VQzp9ikd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D40ACC4CEE3
	for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Mar 2025 11:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742210416;
	bh=gepm7eEs+eOdsK/0envpXJq/8iZFnb0qumLA+Rk9g60=;
	h=Subject:From:Date:To:From;
	b=VQzp9ikdA3mlcSbC8QNLaIrxcEYj/YPg0j7BMU4QOl/TL2XV3Z1qDXCHbdjBAEZLu
	 4VwkiKQj79fcWWl9l1R+b390o5nRKdunymHF/2AC1bz/Iwdz192gxX6K4dy4wzurNb
	 bpBi75woOQnq2Cy76MFFur+VlV3jlQHDMkIMaW1z4ZXQ92gGj57NKy69+s7nNXU3uY
	 XQbEDA+CHRx0cks1TRV5a6eb2RcvJrPIFxSSiWl3I/ykB6n8s01meY1H8T51dTk3/d
	 Ftfy7TIsncbsjmRPd2KpGet5T5gEaUzrInawR1NEKBBN+tGp6CRGWpBnXA8NLDvGvE
	 pE8cdtepLSjEw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3ACD13804CB5
	for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Mar 2025 11:20:53 +0000 (UTC)
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
 <174221045164.3375011.10122625998213885496.git-patchwork-summary@kernel.org>
Date: Mon, 17 Mar 2025 11:20:51 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Patch: arm64: dts: renesas: Remove undocumented compatible micron,mt25qu512a
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=942015
  Lore link: https://lore.kernel.org/r/20250309184326.75452-1-biju.das.jz@bp.renesas.com

Patch: arm64: dts: renesas: r8a779f4: Add UFS tuning parameters in E-FUSE
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=940571
  Lore link: https://lore.kernel.org/r/3e4fca228eb049d54a1ae520104558505dbdf803.1741179629.git.geert+renesas@glider.be


Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



