Return-Path: <linux-renesas-soc+bounces-1926-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C7D3840768
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jan 2024 14:51:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4F0C41C204F6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jan 2024 13:51:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84558657DC;
	Mon, 29 Jan 2024 13:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fKfapbz3"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 609C8657D9
	for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Jan 2024 13:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706536254; cv=none; b=P8rq5+oXQkCZT4AjLOEGacElZ5HzTf5lfN5JNMvYopZs6uAjJVPj7rST+qTlJLk80QG8ODuHaVG6zTu0E+1vWewh1IGYCrIWaO4c0yuB9HpnAOTKqapEG0qZ6/PzCl6/INh0lJfoI67eR48Bi7FCSkLYMoUgYwh5nDWUtdGp+ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706536254; c=relaxed/simple;
	bh=cR6fpGtRL0HDz4zdVXWEjkvlGVqD8EVTvsAPlc36Kwc=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=Q7kIAXbeGNeRL15iK0Q8o3T/3Qy/JODm9YF1ZHblk+PTgw4+CRA6VBDcvodpipo/ruagTPQ6DK3elDqc7MGL3FNguQizDlyfWpQcHoyKme2+CbesV9Khapk18VjysS2DwInFFR4b2MqOjds/8V8naM/61wPJsaBVWNHXTDTTkXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fKfapbz3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E46FFC433F1
	for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Jan 2024 13:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706536253;
	bh=cR6fpGtRL0HDz4zdVXWEjkvlGVqD8EVTvsAPlc36Kwc=;
	h=Subject:From:Date:To:From;
	b=fKfapbz3H08A0SNEBZs0Y8dyBnwQ/ORrojwqupBaJO2dlzf+OzIt1AFJW6EBlch0l
	 1FS3Ae8FPC7pJG4/l7ELPVih1ESPzVvX++r7eVT3+WxgkiTPLJ26xXbR+WRMriw46a
	 9+bfx7fCfn1IOl2FBs78J4wZl7FcAF0+FpptznB3QylW9JZaY66PfwIPKMQaKvVXLb
	 b2v7TmPMqqed2ToUDeDQuBOm8ZgbxAH7N0v/lkUZedBvSliB7UBDjRnwmbcPN4q875
	 EWBrauJ4a1mLJfv6dOdhqpwDUlyR5quZXenhQr6OnsJhRowmyjcaSsy1VH0MAWJnYK
	 +Z+6/pj5vGF1Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id CB8F4C43153
	for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Jan 2024 13:50:53 +0000 (UTC)
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
 <170653625377.6936.15762622895809922254.git-patchwork-summary@kernel.org>
Date: Mon, 29 Jan 2024 13:50:53 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Series: arm64: dts: renesas: ulcb-kf: add GNSS support
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=817516
  Lore link: https://lore.kernel.org/r/20240117131807.24997-1-wsa+renesas@sang-engineering.com
    Patches: [RFC,v3,1/2] arm64: dts: renesas: ulcb-kf: drop duplicate 3.3v regulators
             [RFC,v3,2/2] arm64: dts: renesas: ulcb-kf: add node for GNSS

Series: arm64: dts: renesas: Add support for more R-Car V4H and White Hawk variants
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=819907
  Lore link: https://lore.kernel.org/r/cover.1706192990.git.geert+renesas@glider.be
    Patches: [v2,1/9] dt-bindings: soc: renesas: Document R-Car V4H White Hawk Single
             [v2,2/9] arm64: dts: renesas: r8a779g0: Add standalone White Hawk CPU support
             [v2,3/9] arm64: dts: renesas: white-hawk-cpu: Restore sort order
             [v2,4/9] arm64: dts: renesas: white-hawk: Drop SoC parts from sub boards
             [v2,5/9] arm64: dts: renesas: white-hawk: Add SoC name to top-level comment
             [v2,6/9] arm64: dts: renesas: white-hawk-cpu: Factor out common parts
             [v2,7/9] arm64: dts: renesas: white-hawk: Factor out common parts
             [v2,8/9] arm64: dts: renesas: Add Renesas R8A779G2 SoC support
             [v2,9/9] arm64: dts: renesas: r8a779g2: Add White Hawk Single support


Total patches: 11

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



