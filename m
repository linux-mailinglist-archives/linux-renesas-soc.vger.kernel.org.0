Return-Path: <linux-renesas-soc+bounces-6843-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32B0391ACF9
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Jun 2024 18:40:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E2A43288B95
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Jun 2024 16:40:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEFFC199381;
	Thu, 27 Jun 2024 16:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iJi3VSMq"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B77F19754D
	for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Jun 2024 16:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719506435; cv=none; b=RrgaZ4oWStII05quM3AfwxA3FxcN/KxfFPeZIJBrmTZ8/PcQjNfCGAN0o1yZ9ZWetNsXpMJXidPYXgrd3gYhIq47neKtgSAK1TOGqgsi8KLdvxgg0yb9QYDiSmmQqOsiZqIieQTwXn+8bk9yxsLEg2AyLPqeV7ULGhkm9HUqr3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719506435; c=relaxed/simple;
	bh=hEk+GpYvpSiSTHfQVasfHPoD25MpEfNd1pqeqMw4HVQ=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=sN+srKr5Z/HEVPmgVn1up0CVes5BiArionh+EmEuYJp/oXHrBo8BdMGHBSkXUAR7NG4fKA7EdF8ECwIKW9829DeIKGcV1nClZHxFoIeWVIgzJwA/wachX13RVaXzAaURiWMHrijFbe4Ytfbm3op+XM15dvxvixw+MpRMugmtReI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iJi3VSMq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 217C5C2BBFC
	for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Jun 2024 16:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719506435;
	bh=hEk+GpYvpSiSTHfQVasfHPoD25MpEfNd1pqeqMw4HVQ=;
	h=Subject:From:Date:To:From;
	b=iJi3VSMqwZ2ZwFXjIS90ak1dZSh7+zBngGyGorwwD0SjM9n63l3YZrJCRQeLGTijT
	 i2Kk+bwpbQmDSjmpkLe1UZG/ilFNJlY4Z4VgiE/gKGMhv/q+JOREmXZMEDO+7vo8V7
	 cqFZF9TQD4WtTRRiFzSfUYVN24s9QXAR654JCfmBhcNNZeMCq0/xlZ04yjlaqEnh4q
	 GuM3kwXzfGnEla0fJNhwe+5gYzJKVQYbrfVgiRtGcIX6rWKc8d+plIfLc2mlCeE38U
	 3hgXdyZylC0rwp16UU6C6eFuYPIhfWI13Er3bRn0bz3cjIote01usg+suhe0vMOyd2
	 zTeMEt/mrfrlQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 0EAA7C433A2
	for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Jun 2024 16:40:35 +0000 (UTC)
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
 <171950643500.27243.10574381732144489764.git-patchwork-summary@kernel.org>
Date: Thu, 27 Jun 2024 16:40:35 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Series: dts: renesas: Add missing hypervisor virtual timer IRQs and interrupt-names
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=863871
  Lore link: https://lore.kernel.org/r/cover.1718890849.git.geert+renesas@glider.be
    Patches: [1/9] arm64: dts: renesas: r8a779a0: Add missing hypervisor virtual timer IRQ
             [2/9] arm64: dts: renesas: r8a779f0: Add missing hypervisor virtual timer IRQ
             [3/9] arm64: dts: renesas: r8a779g0: Add missing hypervisor virtual timer IRQ
             [4/9] arm64: dts: renesas: r9a07g043u: Add missing hypervisor virtual timer IRQ
             [5/9] arm64: dts: renesas: r9a07g044: Add missing hypervisor virtual timer IRQ
             [6/9] arm64: dts: renesas: r9a07g054: Add missing hypervisor virtual timer IRQ
             [7/9] arm64: dts: renesas: r9a08g045: Add missing hypervisor virtual timer IRQ
             [8/9] ARM: dts: renesas: Add interrupt-names to arch timer nodes
             [9/9] arm64: dts: renesas: Add interrupt-names to arch timer nodes

Series: arm64: V4M GrayHawk Sound support
  Submitter: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=864678
  Lore link: https://lore.kernel.org/r/87jzifkxi4.wl-kuninori.morimoto.gx@renesas.com
    Patches: [1/6] clk: renesas: r8a779h0: Add Audio clocks
             [2/6] arm64: dts: renesas: r8a779g0: tidyup sound DT settings
             [3/6] arm64: dts: renesas: r8a779h0: R-Car Sound support


Total patches: 12

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



