Return-Path: <linux-renesas-soc+bounces-12968-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C5BE8A2E804
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Feb 2025 10:40:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1CFFA1888C10
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Feb 2025 09:40:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CF0D185935;
	Mon, 10 Feb 2025 09:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AiVJ+Pz1"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47BAF12B71
	for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Feb 2025 09:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739180444; cv=none; b=mEYccsF2aHuYHXCqkXdUbRuwxerBN3fVGf/3lzRa21hWmOlH/dU6iJzVTQitzgBg6bEYbCvvNjlQFXTu9E2/pSvif/sOVGRr3NLFWLp1oRgLdFXsG5O9mpPQ1ntNYTtpPpN58bLpl3OEkAyDFEGdowDbXZxD9g9e6AAYmWy6Mqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739180444; c=relaxed/simple;
	bh=+5/HSFr2GrzKpt1kDgXaBzsdB5YQmqmUf9rS8FE04RU=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=j/Y8JPEOBLjNjqKhq/NMbax7LsxnJR4mDTiT+ztoxZLJW9Q44QAE/T87/o0fLU00/JxN0qxbFDnG/siZqSHA92+bBfXowbBGGgGtiRoOz5GBPhtiTK+X8YZ3D3juDwan5/NEE7hfPQiQ6Rb1YUul4SviF8KkantAy6Hw894uVlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AiVJ+Pz1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A13DAC4CED1
	for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Feb 2025 09:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739180442;
	bh=+5/HSFr2GrzKpt1kDgXaBzsdB5YQmqmUf9rS8FE04RU=;
	h=Subject:From:Date:To:From;
	b=AiVJ+Pz1OSllF4FpSjYC7e4L6e3BOgC9U+cnoLAfgqjy1GBylG4rfOLxR9XQGpAas
	 XduAWx31Xnh2ur6ann+lUlmDNaBmIPaH6TTQiUCoBxWlBCCpeQFNXSoj1Q5z+g01AV
	 V1vAgeaTNgjZq5CCjKTZ5hvPxyzkcObbH7ta6ATdeEXliFAiMMKBOX0Y9x7K+UsXvK
	 +3mfUWSGySnCnDWFsrP7wqzO38xzQjM8L3/+yuO1qfQDP9VuDbjd6Agba6kK0/HHUb
	 AH4VhqRgjSXNgZoL+dG2oUZbUiVtQh3EymHEaOnwND3eVP5YCM/QFh9d8VS67SOoLL
	 ETayn3iLFLdpw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 379B0380AAE2
	for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Feb 2025 09:41:12 +0000 (UTC)
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
 <173918047065.3697046.510312984647636418.git-patchwork-summary@kernel.org>
Date: Mon, 10 Feb 2025 09:41:10 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Series: i2c: revert flag based client handling
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=930827
  Lore link: https://lore.kernel.org/r/20250205134623.6921-1-wsa+renesas@sang-engineering.com
    Patches: [1/2] Revert "i2c: Replace list-based mechanism for handling userspace-created clients"
             [2/2] Revert "i2c: Replace list-based mechanism for handling auto-detected clients"

Series: Add basic support for MyIR Remi Pi
  Submitter: Julien Massot <julien.massot@collabora.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=928494
  Lore link: https://lore.kernel.org/r/20250127-myir-remi-pi-v2-0-7bd3a1c62752@collabora.com
    Patches: [v2,1/2] dt-bindings: soc: renesas: Document MyIR Remi Pi board

Series: Add basic support for MYIR Remi Pi
  Submitter: Julien Massot <julien.massot@collabora.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=929461
  Lore link: https://lore.kernel.org/r/20250131-myir-remi-pi-v3-0-2dda53e79291@collabora.com
    Patches: [v3,1/2] dt-bindings: soc: renesas: Document MYIR Remi Pi board
             [v3,2/2] arm64: renesas: add initial support for MYIR Remi Pi

Patch: [LOCAL] riscv: rzfive: defconfig: Disable unsupported ISA extensions
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=930749
  Lore link: https://lore.kernel.org/r/d184b4527cf7791f8c0d6f46ce4c901e662692df.1738749745.git.geert+renesas@glider.be

Patch: arm64: dts: renesas: white-hawk-csi-dsi: Use names for CSI-2 data line orders
  Submitter: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=930752
  Lore link: https://lore.kernel.org/r/20250205103311.668768-1-niklas.soderlund+renesas@ragnatech.se


Total patches: 7

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



