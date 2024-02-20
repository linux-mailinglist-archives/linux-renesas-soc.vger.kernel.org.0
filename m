Return-Path: <linux-renesas-soc+bounces-2995-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E46D85BAC7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Feb 2024 12:40:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BF9871C230BB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Feb 2024 11:40:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADA896773B;
	Tue, 20 Feb 2024 11:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mwOkVY4j"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A6B566B5A
	for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Feb 2024 11:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708429231; cv=none; b=kzdj4pcgbJCfz/jmr4bR7AWVtmbBqvIACfJ/YdzjtEQ9K9EkGdEUVI1t1wdN4yzHh2ZZJP8evedCZXFtcUyawhigtzf718nW4mhpcX3QKhoV7l68V85B8bE6auH5b7xiiJf3Vm8bOrZKSpAXpMqDr6iaKbifIkuO4h8QWifWT90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708429231; c=relaxed/simple;
	bh=JDIv6DVkH3Y5v3vPqHVJm7NvIvSg11eW48o5ka07CJY=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=Wbiku4UvN2yi0d4gRypBQN177g72HrdnYf59M5zFO+Wi+k6hxcLC3Y4laz5XPWRBrKxKu9BA+Ami/C3mJQrCavUpFrhsFKpAMpBau2AtnILJzhoPNJLvdq7MHdqNfHm8YKufsPdd+Me+NE/ciwqzQq9Qfus5tPRGVLy16BpdTwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mwOkVY4j; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5B7FDC43390
	for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Feb 2024 11:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708429230;
	bh=JDIv6DVkH3Y5v3vPqHVJm7NvIvSg11eW48o5ka07CJY=;
	h=Subject:From:Date:To:From;
	b=mwOkVY4j6fF3r+TFYXZNNkAE6nDeRPTqZN9sPIo2YWyv55fZvGfhb8ySmOcy7eGfn
	 ZO+CE70YnOU6c7L7SZP0PjKHepG3Wgx1xVdCMhxmBO5c4bWFYnvhecQeQ/JoNAWfb4
	 sbHTiVbRrLbusZW1sgWPBhUrm9HDyHBek0pIYxhTZydVFWO1ALm0Nc7TzjyklRxNAE
	 NGKZ84bylXm/UKhupeic7mX/NW/yRSSC/+l86ExKlINKArqdvheR0WWLUz2dTIp4z6
	 4mCPxYabUx+jNO/boehj6qioLiVK2gypPk4eQTYEILK8exBtLikoRc5msTY/FwvrJm
	 wubYHysdpcQFw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 41EC1D990D9
	for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Feb 2024 11:40:30 +0000 (UTC)
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
 <170842923018.24906.16531772968986994961.git-patchwork-summary@kernel.org>
Date: Tue, 20 Feb 2024 11:40:30 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Patch: arm64: dts: renesas: r8a779h0: Add DMA support
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=826010
  Lore link: https://lore.kernel.org/r/44de886cd83f41659d2f6962c0e277f548fb0adb.1707916707.git.geert+renesas@glider.be

Series: arm64: dts: renesas: r8a779h0/gray-hawk-single: Add RPC and QSPI FLASH support
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=827511
  Lore link: https://lore.kernel.org/r/arm64-dts-renesas-r8a779h0-gray-hawk-single-Add-RPC-.1708354463.git.geert+renesas@glider.be
    Patches: [1/2] arm64: dts: renesas: r8a779h0: Add RPC node
             [2/2] arm64: dts: renesas: gray-hawk-single: Add QSPI FLASH support

Series: arm64: dts: renesas: r8a779h0/gray-hawk-single: Add eMMC support
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=826009
  Lore link: https://lore.kernel.org/r/cover.1707915763.git.geert+renesas@glider.be
    Patches: [1/2] arm64: dts: renesas: r8a779h0: Add SD/MMC node
             [2/2] arm64: dts: renesas: gray-hawk-single: Add eMMC support

Series: [1/2] arm64: dts: renesas: r8a779h0: Add Ethernet-AVB support
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=824999
  Lore link: https://lore.kernel.org/r/ae7488c0065b455b45f23253c997a94f4850064f.1707661382.git.geert+renesas@glider.be
    Patches: [1/2] arm64: dts: renesas: r8a779h0: Add Ethernet-AVB support
             [2/2] arm64: dts: renesas: gray-hawk-single: Add Ethernet support

Series: arm64: dts: renesas: r8a779h0/gray-hawk-single: Add I2C and EEPROM support
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=822139
  Lore link: https://lore.kernel.org/r/cover.1706796660.git.geert+renesas@glider.be
    Patches: [1/2] arm64: dts: renesas: r8a779h0: Add I2C nodes
             [2/2] arm64: dts: renesas: gray-hawk-single: Add I2C0 and EEPROMs

Series: arm64: dts: renesas: r8a779h0/gray-hawk-single: Initial pin control support
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=820212
  Lore link: https://lore.kernel.org/r/cover.1706266286.git.geert+renesas@glider.be
    Patches: [1/2] arm64: dts: renesas: r8a779h0: Add pinctrl device node
             [2/2] arm64: dts: renesas: gray-hawk-single: Add serial console pin control

Series: arm64: dts: renesas: rcar-gen4: Correct avb[01] reg sizes
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=824995
  Lore link: https://lore.kernel.org/r/cover.1707660323.git.geert+renesas@glider.be
    Patches: [1/2] arm64: dts: renesas: r8a779a0: Correct avb[01] reg sizes
             [2/2] arm64: dts: renesas: r8a779g0: Correct avb[01] reg sizes

Patch: arm64: dts: renesas: r8a779h0: Add GPIO nodes
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=822140
  Lore link: https://lore.kernel.org/r/d4c1c40404ab84c7e7c07612077ca1a319ae7283.1706796918.git.geert+renesas@glider.be


Total patches: 14

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



