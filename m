Return-Path: <linux-renesas-soc+bounces-11833-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D5FB2A00EDF
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Jan 2025 21:40:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9F5B93A4750
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Jan 2025 20:40:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65C2E1B85FA;
	Fri,  3 Jan 2025 20:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aiPGJuOQ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E4A01B6CF5
	for <linux-renesas-soc@vger.kernel.org>; Fri,  3 Jan 2025 20:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735936813; cv=none; b=cn3mxI6ZJJPbopKlWIY4EqObBjapFc2/GDCKVXWkjXbixQ2o0a7hX3nG7LuouSgHDMIcgt0VHpMTipEsr2jhWNhqj9CDRLNv9UkIP65Uhjjh6Zit+CiSfjDJ+KRDsfvjmq3NV5KSLBAd6NsCd6KekS5AKWtNQZaOYifpTcWb+6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735936813; c=relaxed/simple;
	bh=wEN9MXeia13bSwzusTHsU9Vo+FzD2D5sYlQFibgLBu8=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=u1L76jzyBs1lCywRTCHegnypX14Oc3Xf4Q9xqWKl1kIeeV3gBHJx+FQLVyDS1skCvc/mSGOjbSEmW4hPTzvopG9IJ8x3R0vUm93ebT02LwR4DADdj9RKHPFhNTv28zILs/HD3yotYwcBJ76sW4n87vOVcSe8ofXvV5yGMao0kso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aiPGJuOQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4BAAC4CECE
	for <linux-renesas-soc@vger.kernel.org>; Fri,  3 Jan 2025 20:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735936812;
	bh=wEN9MXeia13bSwzusTHsU9Vo+FzD2D5sYlQFibgLBu8=;
	h=Subject:From:Date:To:From;
	b=aiPGJuOQarw2wBcRTeogOOWwC2GkkazPctaEo9DpAqBAH7EMLXDLkfpibuI2M0+Rn
	 lsG8UJ6J2kobKbagX34GintuTKJWHayDHfiZ7GEvT8Gr0Nrjny8vxfD8JKuusWjOeS
	 xsHENrax39DFpcYQQIdsDXIHs0TDCqsvqMqn6IDIsQdv4qaLp5w2f1/dWPlIe88uIE
	 +rCnb3dBSc4+J/V6wWgixrDIaXEon6GWn5D0+pq1SwB7GBOE5rf1XAWqLWjVk3xj9J
	 e55LStnWvPFYWt8aowQw1K62KHIL3yOFnF0UaVoKGZYsIDMu/rmyAZgOAg+dft35M4
	 XRdFcA3TvP5/A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 76CB4380A96A
	for <linux-renesas-soc@vger.kernel.org>; Fri,  3 Jan 2025 20:40:34 +0000 (UTC)
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
 <173593683301.2297664.13915482912299618288.git-patchwork-summary@kernel.org>
Date: Fri, 03 Jan 2025 20:40:33 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Series: Add RZ/G3E pinctrl support
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=918344
  Lore link: https://lore.kernel.org/r/20241216195325.164212-1-biju.das.jz@bp.renesas.com
    Patches: [v4,1/7] dt-bindings: pinctrl: renesas: Add alpha-numerical port support for RZ/V2H
             [v4,2/7] dt-bindings: pinctrl: renesas: Document RZ/G3E SoC
             [v4,5/7] arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Replace RZG2L macros
             [v4,6/7] arm64: dts: renesas: r9a09g047: Add pincontrol node
             [v4,7/7] arm64: dts: renesas: r9a09g047: Add scif pincontrol

Series: renesas: r8a779g0: Enable VSPX on R-Car V4H
  Submitter: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=919522
  Lore link: https://lore.kernel.org/r/20241219-rcar-v4h-vspx-v3-0-8fe8d2afb268@ideasonboard.com
    Patches: [v3,1/4] clk: renesas: r8a779g0: Add FCPVX clocks
             [v3,2/4] arm64: dts: renesas: r8a779g0: Add FCPVX instances
             [v3,4/4] arm64: dts: renesas: r8a779g0: Add VSPX instances

Series: renesas: r8a779g0: Enable VSPX on R-Car V4H
  Submitter: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=919783
  Lore link: https://lore.kernel.org/r/20241220-rcar-v4h-vspx-v4-0-7dc1812585ad@ideasonboard.com
    Patches: [v4,1/4] clk: renesas: r8a779g0: Add FCPVX clocks
             [v4,2/4] arm64: dts: renesas: r8a779g0: Add FCPVX instances
             [v4,4/4] arm64: dts: renesas: r8a779g0: Add VSPX instances


Total patches: 11

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



