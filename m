Return-Path: <linux-renesas-soc+bounces-16224-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 85897A96584
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Apr 2025 12:11:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5D0DB3BB500
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Apr 2025 10:11:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F299E1E231E;
	Tue, 22 Apr 2025 10:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HWcqnOuK"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C56D6202C58
	for <linux-renesas-soc@vger.kernel.org>; Tue, 22 Apr 2025 10:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745316689; cv=none; b=dPoz042Lum0SLi0bpAmEUmss8wtLpJC3RHxz4WR54ObysFOmFNCyitQbCWXS/Wk3T1Pp+oOui4Fc/A+l5AoEEEWWFzBFAr4Os1gcxp9DtKuXqgH4mvn0Sk+VkWRrf40gyLEvxf+bPyCqJx9oO3Dil5fuImvwzOo5MfdQb/xSZmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745316689; c=relaxed/simple;
	bh=Kk0Jw3ZfZDHcx9j0yJwAZlqV+Q9EyIov29RGSm7BbGE=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=l/FFQ9mFfT53J3yqnTwDeOH50s7iR+t0t6e1gJBVMwgukUMfUEFcZpwY646GURfwrliMeAx96E0mEYRQD00VKoAy/oUH5dURgqHVnqTypf8/0C/RywBmQuQsI/onWzGzDhwsszDNjvg964L0NyDygZVlLtVcpSg/pXrbP+A3J78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HWcqnOuK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AC7BC4CEE9
	for <linux-renesas-soc@vger.kernel.org>; Tue, 22 Apr 2025 10:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745316689;
	bh=Kk0Jw3ZfZDHcx9j0yJwAZlqV+Q9EyIov29RGSm7BbGE=;
	h=Subject:From:Date:To:From;
	b=HWcqnOuK5iXPfBhAaky15marISx+J4Tb0KEyO6YuSRuFmsyyTRsE6y2F6OA8faae4
	 /o/lvBD6Qc6d3G+EEdNHsjfPa2bGRLvQwTyn1EzOT4O/9Jx/0uoZEndhOFujChCfos
	 r/KqhleSwFeElUs8CGJkAGhOGShriWML4AGVQaS8QJf5K2fYYb4Qx0fGNRlM+Jb7k1
	 Yz19sAbVLH/hk006p7T5dYfmuUdLC6p7AW2gY/ist5wENJ6d0D3F6uOnQgutEqDlwy
	 L1Xn/N0iUZS9+aukEQEM7TCvcwH2gD8u7XsWiXyWLKunljh0fqZ/ohLSgizIami9ae
	 hXaGCzkAVzizQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAE8F39D6546
	for <linux-renesas-soc@vger.kernel.org>; Tue, 22 Apr 2025 10:12:08 +0000 (UTC)
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
 <174531672760.1505048.5295737091759647561.git-patchwork-summary@kernel.org>
Date: Tue, 22 Apr 2025 10:12:07 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
geert/renesas-devel.git (next):

Series: Add support for Mali-G52 to RZ/G3E SoC
  Submitter: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=949320
  Lore link: https://lore.kernel.org/r/20250402131142.1270701-1-tommaso.merciai.xr@bp.renesas.com
    Patches: [1/4] clk: renesas: r9a09g047: Add clock and reset entries for GE3D
             [3/4] arm64: dts: renesas: r9a09g047: Add Mali-G52 GPU node
             [4/4] arm64: dts: renesas: rzg3e-smarc-som: Enable Mali-G52

Series: arm64: dts: renesas: r9a09g047e57-smarc: Add I2C2 and PMIC support
  Submitter: John Madieu <john.madieu.xa@bp.renesas.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=948254
  Lore link: https://lore.kernel.org/r/20250329121258.172099-1-john.madieu.xa@bp.renesas.com
    Patches: [1/2] arm64: dts: renesas: rzg3e-smarc-som: Add I2C2 device pincontrol
             [2/2] arm64: dts: renesas: rzg3e-smarc-som: add raa215300 pmic support

Series: Add initial support for Renesas RZ/T2H SoC
  Submitter: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=949794
  Lore link: https://lore.kernel.org/r/20250403212919.1137670-1-thierry.bultel.yh@bp.renesas.com
    Patches: [v7,01/13] dt-bindings: soc: Add Renesas RZ/T2H (R9A09G077) SoC


Total patches: 6

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



