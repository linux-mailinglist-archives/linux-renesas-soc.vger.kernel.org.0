Return-Path: <linux-renesas-soc+bounces-20746-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EFFECB2D4B8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Aug 2025 09:19:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A1A471BA66EF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Aug 2025 07:20:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B5C72D3EC2;
	Wed, 20 Aug 2025 07:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xug1Qf+o"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 178182C3757
	for <linux-renesas-soc@vger.kernel.org>; Wed, 20 Aug 2025 07:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755674396; cv=none; b=aW0mFqRM5HjWhqzSv6TQfajorQU4aE623eyBKez4v0x3Mf3aSfca+w/wfpVQvfJGH9Sh7SDDEymF3KIGR+aovKkv/+RR2CE4joTDYI7zAc0QIyPQuwGaLaZfyFXS/UwZzY209HAO2aHtTiF6aSPZsSsPbu0G8nBQqTaNXkhuZ7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755674396; c=relaxed/simple;
	bh=Ilu42AWHxUEBJ1kU3M5h3ZaN6FDNChCDAlsUsalBnQw=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=oBO4HvnDFxcf1cxzG3nOIV2wYb4IHN2t+edxUUtrKbyNxpi+9vKGk5YAEt1TNeIrEemGEWuMFOCzzI8VBJDchR17ABJ/uST/s9kxHyvffLmxIreMOLnazs0wluJ2Rd/y+FDyjJNX7/JM3l7SWsmUSAggFr2BDGt3PZtcNhLiZYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xug1Qf+o; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3F09C113CF
	for <linux-renesas-soc@vger.kernel.org>; Wed, 20 Aug 2025 07:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755674395;
	bh=Ilu42AWHxUEBJ1kU3M5h3ZaN6FDNChCDAlsUsalBnQw=;
	h=Subject:From:Date:To:From;
	b=Xug1Qf+oc7UU4pUvJjf4YlzEztiEVgtt3S0OrVbIndjxUVu0C7dnltTaltc4+jjLH
	 dmSB0sxVcfMfvecsAf2oKSbE1Q1K6N3vtf54C8TSJBtcPW5FkVLPT9jzVJR9ePAMFm
	 p2FWjP+ccSBCuINbOgr73UzOgiK2KEPQu2qC6MtbmZKXnlvqb1EEPxUA9QFM/rkZ+o
	 G9+BOhHprY/xGbtThGynweY9mEjd+Yz5blL4KRULZuAG4i5+HZzK8DEwJ14/Sg2PiD
	 9MhC5ew9NKeWTy9ydoUdwmxQQmIcKhl11ey8tRmaxKOka1IM+F2W/XpaHgE2lF44JA
	 6Mvu6/VhMbGew==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B278D383BF4E
	for <linux-renesas-soc@vger.kernel.org>; Wed, 20 Aug 2025 07:20:06 +0000 (UTC)
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
 <175567440532.122725.6251531758853404186.git-patchwork-summary@kernel.org>
Date: Wed, 20 Aug 2025 07:20:05 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Patch: arm64: dts: renesas: Minor whitespace cleanup
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=993054
  Lore link: https://lore.kernel.org/r/20250819131619.86396-2-krzysztof.kozlowski@linaro.org

Patch: arm64: dts: renesas: r8a779g3: Invert microSD voltage selector on Retronix R-Car V4H Sparrow Hawk EVTB1
  Submitter: Marek Vasut <marek.vasut+renesas@mailbox.org>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=986259
  Lore link: https://lore.kernel.org/r/20250727235905.290427-1-marek.vasut+renesas@mailbox.org

Patch: arm64: dts: renesas: r8a779g3: Set VDDQ18_25_AVB voltage on Retronix R-Car V4H Sparrow Hawk EVTB1
  Submitter: Marek Vasut <marek.vasut+renesas@mailbox.org>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=988872
  Lore link: https://lore.kernel.org/r/20250806192821.133302-1-marek.vasut+renesas@mailbox.org


Total patches: 3

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



