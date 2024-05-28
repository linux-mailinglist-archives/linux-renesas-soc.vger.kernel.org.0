Return-Path: <linux-renesas-soc+bounces-5544-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F3638D1827
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 May 2024 12:10:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 12F561F22000
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 May 2024 10:10:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72452155C95;
	Tue, 28 May 2024 10:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L/e9I+wk"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E08D17E8F4
	for <linux-renesas-soc@vger.kernel.org>; Tue, 28 May 2024 10:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716891033; cv=none; b=uod8+jtxljOdTz9UBxad9Y72lpjOhU/xcHPhxxL8hntRAUToCW0Wq0Wlo+VZqg3meJqmmStM7fIu58IXmIcBCneKSXfHoE0Y9Pc+KAFtRu2Zt/AKKRWtosMEjsi4gDEFC3p45b+/OnRRq7iReONCiCTy40SY9DgnGhnAwWNCJmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716891033; c=relaxed/simple;
	bh=5E+GHGPWjpJscKDr/VANcZDjfEO5sPiXH1HNxgzeInk=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=FwhthII3pSlAtqNJ5/ib5b8G9rCirXiUUZXHwhC1/m0wjiRN3Fgv1yn/nKg/atsl5FDiNE9uZUCQhgQsgWhQ64cf4hkFJAPMD4PixMOopBY/eOAQsOD51FZJSGw3C10Sj73HT954MJ2aV08p18DBk2MMtUNflyEPmHmWkw/c4Wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L/e9I+wk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id CBC00C3277B
	for <linux-renesas-soc@vger.kernel.org>; Tue, 28 May 2024 10:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716891032;
	bh=5E+GHGPWjpJscKDr/VANcZDjfEO5sPiXH1HNxgzeInk=;
	h=Subject:From:Date:To:From;
	b=L/e9I+wkJwxffbzqOh4uexfYHAqIz8/q1bKuMzQ3ugIWqoX3/mJ6xX9amFbJ7j/UU
	 GzT088bMuAjCzcyG5lOoreLqwqdKJ7uFNdDWrvufkBz56+Xu/0Ph5nKCQMJfg6eToW
	 F08Rp5svi37d9goAEPjEPle1zXJS6DwPLXAsyp2weSSG629Bsm20dCXp7F+y7vqwPO
	 kJWq7CUwKL3wvPQmMGg5/PV7EE/cno3NQfrIkSghUZtCDtlDG2B9AN4IGl70JeeNA5
	 8aNQkvHqv5Ixs5YoCXm29f98pI8XQuyCg8CRho7itcRoaXyRkjIfVG4XzTfzqHdS5/
	 ee4CggPtApCAw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id B9BC5C4361C
	for <linux-renesas-soc@vger.kernel.org>; Tue, 28 May 2024 10:10:32 +0000 (UTC)
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
 <171689103267.16293.1959453582124424547.git-patchwork-summary@kernel.org>
Date: Tue, 28 May 2024 10:10:32 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Patch: [v2] arm64: defconfig: Enable Renesas R-Car Gen4 PCIe controller
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=855479
  Lore link: https://lore.kernel.org/r/20240523203431.6423-1-wsa+renesas@sang-engineering.com

Series: arm64: dts: renesas: add aliases for I2C
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=855481
  Lore link: https://lore.kernel.org/r/20240523205041.7356-1-wsa+renesas@sang-engineering.com
    Patches: [1/3] arm64: dts: renesas: white-hawk-cpu: add aliases for I2C busses
             [2/3] arm64: dts: renesas: spider-cpu: add aliases for I2C busses
             [3/3] arm64: dts: renesas: s4sk: add aliases for I2C busses

Series: arm64: dts: renesas: white-hawk: Add AVB1 and AVB2
  Submitter: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=844266
  Lore link: https://lore.kernel.org/r/20240413141806.300989-1-niklas.soderlund+renesas@ragnatech.se
    Patches: [v3,1/2] arm64: dts: renesas: r8a779g0: Use MDIO node for all AVB devices
             [v3,2/2] arm64: dts: renesas: white-hawk: ethernet: Describe AVB1 and AVB2

Patch: arm64: dts: renesas: condor-i: Add I2C EEPROM
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=855263
  Lore link: https://lore.kernel.org/r/33a1ec9ee8fff7708f699c668d7399fde2b46553.1716455483.git.geert+renesas@glider.be

Patch: arm64: dts: renesas: gray-hawk-single: add aliases for I2C busses
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=853347
  Lore link: https://lore.kernel.org/r/20240515091925.24353-2-wsa+renesas@sang-engineering.com

Series: net: stmmac: Add support for RZN1 GMAC devices
  Submitter: Romain Gantois <romain.gantois@bootlin.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=852743
  Lore link: https://lore.kernel.org/r/20240513-rzn1-gmac1-v7-0-6acf58b5440d@bootlin.com
    Patches: [net-next,v7,1/7] dt-bindings: net: renesas,rzn1-gmac: Document RZ/N1 GMAC support
             [net-next,v7,7/7] ARM: dts: r9a06g032: describe GMAC1


Total patches: 10

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



