Return-Path: <linux-renesas-soc+bounces-18806-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E05AEA1AE
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Jun 2025 17:00:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 208754E04B0
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Jun 2025 14:56:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E88AA2FA64D;
	Thu, 26 Jun 2025 14:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tslMoStT"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C45D42FA637
	for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Jun 2025 14:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750949380; cv=none; b=HBq3h+0N/OMduf3kmdIFt9q51zLxlqWrrkSXsPxWl5Gu4Wdp3QntBnUrVYgyEl2giC5yj29tsEiIDoxr5K8Bg+LbtGWyxP7QdA6bspqfr94/xTM/SkmsgOC+QodGMHDiUX7k5wxIQfMKLGIbt2lntrPhMoQV4MQ7WyZLlMud4/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750949380; c=relaxed/simple;
	bh=4D7Sp9pQZtpjcLaVxXvZBVeFN9ChvXhO5eTB207an54=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=Li4AI0oNx6InWHGTHnyvunG3KGVQ/fvNndKnTycCeAHrqCCEFrwmMZl86RbDaO5iv5M9ByA2697GP/oJ7ARuP+U36OEuOAYqzZbHA91q8lD/cRHPsnQmZAqok8GSjWAhKGhyY0bFrMOg5L0ce/WqU52tZwgceHlsuCd+NpCfvfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tslMoStT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F3EFC4CEED
	for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Jun 2025 14:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750949380;
	bh=4D7Sp9pQZtpjcLaVxXvZBVeFN9ChvXhO5eTB207an54=;
	h=Subject:From:Date:To:From;
	b=tslMoStTJmS1RDm4x4xWq/umomG+vCb2Ch1bpC3nH32dq3ieAbXR+rjNJhi5OJliQ
	 0OyCUpa3QM6Zf9XShCJTkyDWddZbCBhlfWwbKWmhZtOESeMb9d0+blIwHH2WWMFrj6
	 dqwrP8jdrR+Q8F8AgdVbP4oQXJOoFBVIXCPzegMg5lxkIuYuUXqJuQqdSFmY9xPRj6
	 D3BMFGgt6qd+9osCiPTaA9p9g9ugWtq5CMn4B2dWf/j5nSz+8FrFHPEmhXi3gFtPF4
	 YtaJpCJ4vleHQHKftKOrnHxeC3NJpo80NlpkQjj6bEOjQmaUuNgz/MYIXWv+gk8Jtd
	 sfBMN+8A1jp6g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B1D0B3A40FCB
	for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Jun 2025 14:50:07 +0000 (UTC)
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
 <175094940619.1228459.13927593975751216888.git-patchwork-summary@kernel.org>
Date: Thu, 26 Jun 2025 14:50:06 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Series: Add RAA215300 PMIC support to RZ/V2H and RZ/V2N EVKs
  Submitter: Prabhakar <prabhakar.csengg@gmail.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=973847
  Lore link: https://lore.kernel.org/r/20250619135539.207828-1-prabhakar.mahadev-lad.rj@bp.renesas.com
    Patches: [1/2] arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Add RAA215300 PMIC
             [2/2] arm64: dts: renesas: r9a09g056n48-rzv2n-evk: Add RAA215300 PMIC

Series: Add CN15 eMMC and SD overlays for RZ/V2N and RZ/V2H EVKs
  Submitter: Prabhakar <prabhakar.csengg@gmail.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=974254
  Lore link: https://lore.kernel.org/r/20250620121045.56114-1-prabhakar.mahadev-lad.rj@bp.renesas.com
    Patches: [1/3] arm64: dts: renesas: Add CN15 eMMC and SD overlays for RZ/V2N EVK
             [2/3] arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Rename fixed regulator node names


Total patches: 4

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



