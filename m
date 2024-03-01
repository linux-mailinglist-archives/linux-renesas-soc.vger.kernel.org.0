Return-Path: <linux-renesas-soc+bounces-3375-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C46C886E42A
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Mar 2024 16:20:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 003BA1C20B39
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Mar 2024 15:20:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 491313AC0C;
	Fri,  1 Mar 2024 15:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GxE08CZM"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 250403A8E3
	for <linux-renesas-soc@vger.kernel.org>; Fri,  1 Mar 2024 15:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709306432; cv=none; b=c/r8MxtNZWJywmty9Sn9O92NXz6bog6FYpO87b7KrEMft29DJOzjvI4glFokyIVY/Wnn/U0+/zvzsN/RZe8zFZep1JL50xUbHaHKq0IrTZEWQI5lx3yU/MZF78Y/60YKyiML2qpw36PLWI6gAOyAfTuMaz98KR7QfrM9SbeTA84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709306432; c=relaxed/simple;
	bh=nnSSbci1YuYmLzLDQrJYNYVjm/DhKpmNSNeLHxA8hao=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=sinX65s5FEHiZ+/IzZeCg2E3M/MQjm3cSovHBmRNCqGnsN0p5RLDJCxzDlgz6P/Bjdn4d7YbtL1ImPGkFim0JxqSRXrM+xNXbw0ZYtsaZi74lB44gaZurMcfwxgcxQevJGeHMIJwPSWB4iMcGRoGqkZOcebcbfbi0JbpxyywHTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GxE08CZM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9A764C433F1
	for <linux-renesas-soc@vger.kernel.org>; Fri,  1 Mar 2024 15:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709306431;
	bh=nnSSbci1YuYmLzLDQrJYNYVjm/DhKpmNSNeLHxA8hao=;
	h=Subject:From:Date:To:From;
	b=GxE08CZM9zDDtQaGu7qZ1e0ZmWFpsTYX2fDkjMQcaqcSjns5LlcZ8tAHtdburHrWg
	 xVo6oh1gRx5foSLnHslrgTjOQrpdFWfQTydTbwjRDJiaz1ZV0FjcS5/eeJDdP6uFFL
	 P8siOYZPNH6MXWl8e/5jcry7ruIVvkBn95rcn4DGGm0HrE0ukWWw7tD7F8slQH5SSc
	 CWB9VZDJoKmBvqgudzqpTitPXTrfakOH4a3UBkTH+n83RDiouucTTtSQ/PX94PICyS
	 OfIO1Ja+0jMR6JcMCkTEPRWVZ2hiZAmGD6qPfewcYjrNofXqxSAqRQbLsOemcWTUMP
	 X4SQrJ4UH2aaQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 8332DC595D1
	for <linux-renesas-soc@vger.kernel.org>; Fri,  1 Mar 2024 15:20:31 +0000 (UTC)
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
 <170930643147.4197.16194187749574454327.git-patchwork-summary@kernel.org>
Date: Fri, 01 Mar 2024 15:20:31 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Series: Add SoC identification for Renesas RZ/V2H SoC
  Submitter: Lad, Prabhakar <prabhakar.csengg@gmail.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=830464
  Lore link: https://lore.kernel.org/r/20240227232531.218159-1-prabhakar.mahadev-lad.rj@bp.renesas.com
    Patches: [v2,1/4] dt-bindings: soc: renesas: Document Renesas RZ/V2H(P) SoC variants
             [v2,2/4] dt-bindings: arm: renesas: Document Renesas RZ/V2H(P) System Controller
             [v2,3/4] soc: renesas: Add identification support for RZ/V2H SoC
             [v2,4/4] arm64: defconfig: Enable R9A09G057 SoC

Patch: arm64: defconfig: Enable Renesas RZ/G2L display unit DRM driver
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=829076
  Lore link: https://lore.kernel.org/r/20240223123646.245655-1-biju.das.jz@bp.renesas.com

Patch: arm64: renesas_defconfig: Enable PANFROST and Renesas RZ/G2L display unit DRM driver
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=829074
  Lore link: https://lore.kernel.org/r/20240223123127.221610-1-biju.das.jz@bp.renesas.com

Patch: [v2] arm64: dts: renesas: eagle: Add capture overlay for function expansion board
  Submitter: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=829502
  Lore link: https://lore.kernel.org/r/20240224191902.2065733-1-niklas.soderlund+renesas@ragnatech.se

Series: Add new Renesas RZ/V2H SoC
  Submitter: Lad, Prabhakar <prabhakar.csengg@gmail.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=827536
  Lore link: https://lore.kernel.org/r/20240219160912.1206647-1-prabhakar.mahadev-lad.rj@bp.renesas.com
    Patches: [1/4] dt-bindings: soc: renesas: Document Renesas RZ/V2H{P} SoC variants
             [4/4] arm64: defconfig: Enable R9A09G057 SoC

Patch: [v3] arm64: defconfig: Enable Renesas DA9062 PMIC
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=830265
  Lore link: https://lore.kernel.org/r/20240227130010.45361-1-biju.das.jz@bp.renesas.com

Patch: arm64: renesas_defconfig: Enable Renesas DA9062 PMIC
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=830014
  Lore link: https://lore.kernel.org/r/20240226201305.429790-1-biju.das.jz@bp.renesas.com

Series: Enable DA9062 PMIC and built-in RTC, GPIO and ONKEY
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=830005
  Lore link: https://lore.kernel.org/r/20240226194715.427597-1-biju.das.jz@bp.renesas.com
    Patches: [v2,1/2] arm64: dts: renesas: rzg2ul-smarc: Enable PMIC and built-in RTC, GPIO and ONKEY

Patch: dt-bindings: soc: renesas: renesas-soc: Add pattern for gray-hawk
  Submitter: Lad, Prabhakar <prabhakar.csengg@gmail.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=830446
  Lore link: https://lore.kernel.org/r/20240227220930.213703-1-prabhakar.mahadev-lad.rj@bp.renesas.com


Total patches: 13

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



