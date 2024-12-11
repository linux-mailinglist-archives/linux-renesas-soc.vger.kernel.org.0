Return-Path: <linux-renesas-soc+bounces-11215-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 687079ECAF4
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Dec 2024 12:20:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6858F28508F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Dec 2024 11:20:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61E6B1A8413;
	Wed, 11 Dec 2024 11:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aZjJKFhM"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AE6E187872
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Dec 2024 11:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733916014; cv=none; b=rhf5sma0rE/T6oANwzzpURcF/Oy9Todnx0OURKdOD0frCYcDyDgmKJfSuSr7BV8pQGydi/CbpQ/hvlhbbV2wYo46CYPJtbjLwx8w69MXtGwLjdb5Wm+GpZj27jhMs355k9Y0vKWbPjTbQ7m1Wad+IGj6MOX+AO1AomPjRF4ma+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733916014; c=relaxed/simple;
	bh=shY+QVQ8BOJBNDRpeXZdPaEwrIdA63GWZ9fW9Ef/4ks=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=MIJT2QzfP+GhghpiTgOV3S5mATrg1y+pdEqI4k916Ye2jP5+jodM/NwDRnMic8jg4kcZked/p/HmwE6k3fU7n0Ta4MiW5J11zfwVH5SriCgwAHaQwjks/EjaZMFDfwHjNgKS4pA37rCOzClOJtcVBB5siuFOvKgV5J1eBV0RO1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aZjJKFhM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9B13C4CED2
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Dec 2024 11:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733916013;
	bh=shY+QVQ8BOJBNDRpeXZdPaEwrIdA63GWZ9fW9Ef/4ks=;
	h=Subject:From:Date:To:From;
	b=aZjJKFhMdy4WO1qJQOLLD4M0Y32kP0ojWY07TJBT+4pxG/BZy1MgHx9fS8VWS1gUV
	 UsRiPAjwSMYnqwUUmd2xTRiPMFB+i8zlW6do2rDJ8bMt5ZrcoZcSdiYN+sduRH1uGc
	 +bCyWw6dbhunXUPYQ7PmShx51knJYAXSpmf0KlPQSjvyP7+NMcp4ipNGA7gViTYjCp
	 t6hN6WXaLIEsCKXD57SH2PTSsu3SEM2q/WCODNIx8wNNeIo0wYDYDbawTp+fbm1+w0
	 Mpx+R3aL/LZElxzjP2AT2V+ZhK8Q7EtW0U7OjsZeAtvz6ef8OQc0Q0YU/xhXWaEhS1
	 z1tyYd4aBtIlg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B4853380A962
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Dec 2024 11:20:30 +0000 (UTC)
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
 <173391602920.1543078.5414965028943624184.git-patchwork-summary@kernel.org>
Date: Wed, 11 Dec 2024 11:20:29 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Series: drm: Add DSI/DP support for Renesas r8a779h0 V4M and grey-hawk board
  Submitter: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=915266
  Lore link: https://lore.kernel.org/r/20241206-rcar-gh-dsi-v3-0-d74c2166fa15@ideasonboard.com
    Patches: [v3,01/10] drm/rcar-du: dsi: Fix PHY lock bit check
             [v3,08/10] arm64: dts: renesas: gray-hawk-single: Fix indentation
             [v3,09/10] arm64: dts: renesas: r8a779h0: Add display support
             [v3,10/10] arm64: dts: renesas: gray-hawk-single: Add DisplayPort support

Patch: ARM: dts: renesas: r7s72100: Add DMA support to RSPI
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=911226
  Lore link: https://lore.kernel.org/r/dfafc16b840630f20e75292d419479294558e173.1732098491.git.geert+renesas@glider.be

Patch: arm64: dts: renesas: gray-hawk-single: Add video capture support
  Submitter: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=915961
  Lore link: https://lore.kernel.org/r/20241209125504.2010984-1-niklas.soderlund+renesas@ragnatech.se


Total patches: 6

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



