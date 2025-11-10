Return-Path: <linux-renesas-soc+bounces-24376-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 13E8AC4604C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Nov 2025 11:44:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5332C1883FAB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Nov 2025 10:42:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8473E305E3A;
	Mon, 10 Nov 2025 10:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DCEyCPE3"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F58E305E24
	for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Nov 2025 10:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762771276; cv=none; b=HN86ZG01cpJYFEyxqtnLYh3kQHUeIAzMRVe6eczCbq5lMN7suPjoSADEYF1CoK9LIN4cFeCnkxjDdbQuZLjNrufkB7dv2wIYmElJ4l9lEfVjB3nUPoCqid8jUt+o2aRLVa5qekSvZZ6g110YEjm9qxTu1TbrnQpmVs3HxiPsjuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762771276; c=relaxed/simple;
	bh=gavX3u75GDlTxwp0X5zFcrygP2trs5QJnvc7UAqa7ME=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=mSi8AOTld3OzDoFIZL6os/1RW/hofDfsLaEmZR+FJmah0H9AbV5hzgJgk0V6/Id8MEwHRh5Q+JzbtFxu5JuNKR29vY++pap9oxk/PTuHcmVo76P07G7bzw2Y8oRxwLPH9W+iZkvIxUkZpb+E11pGxKaVnUlc5bV15OLbRXe2U3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DCEyCPE3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36986C113D0
	for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Nov 2025 10:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762771276;
	bh=gavX3u75GDlTxwp0X5zFcrygP2trs5QJnvc7UAqa7ME=;
	h=Subject:From:Date:To:From;
	b=DCEyCPE3We6598dPcg1a3YJmtjzPk7tdkxWAEaz1vbPSBi0n1WWHaZHuhj0Mw6JOG
	 jW7zVOKiBx6ADTpJCvANS4EvCvGTkm9l/0izrBKH+LEk94V0iT2xDXS1s1ILAPsShF
	 4Ttvgdq11dDA8GrtsKwAyXYJAiaUKB0LP20wh41pm+icGJEid8dw/W+x7bKilhA9pO
	 cgtTaCs4HEBf3TtElm2DJkcFCIndGRmWhYufmC9Sy7Dfx/H6kye/dyEVNMPbK5Asxx
	 d2duZ8dRHqdwf89FPKY5cNX7v6jhk7PURZMhO9vpEVjm3DSC4jDp0Gtuy8tsP7EU3+
	 YsKPckmPdxMGw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 37D943A41001
	for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Nov 2025 10:40:48 +0000 (UTC)
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
 <176277124668.2555207.2009610396994409073.git-patchwork-summary@kernel.org>
Date: Mon, 10 Nov 2025 10:40:46 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Series: [1/2] dt-bindings: gpu: img,powervr-rogue: Document GE7800 GPU in Renesas R-Car M3-N
  Submitter: Marek Vasut <marek.vasut+renesas@mailbox.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1019102
  Lore link: https://lore.kernel.org/r/20251103200800.173440-1-marek.vasut+renesas@mailbox.org
    Patches: [1/2] dt-bindings: gpu: img,powervr-rogue: Document GE7800 GPU in Renesas R-Car M3-N
             [2/2] arm64: dts: renesas: r8a77965: Add GE7800 GPU node

Series: [v2,1/3] dt-bindings: gpu: img,powervr-rogue: Keep lists sorted alphabetically
  Submitter: Marek Vasut <marek.vasut+renesas@mailbox.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1019460
  Lore link: https://lore.kernel.org/r/20251104135716.12497-1-marek.vasut+renesas@mailbox.org
    Patches: [v2,1/3] dt-bindings: gpu: img,powervr-rogue: Keep lists sorted alphabetically
             [v2,3/3] arm64: dts: renesas: r8a77965: Add GE7800 GPU node

Series: arm64: dts: renesas: Describe GPU on V3U
  Submitter: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1020649
  Lore link: https://lore.kernel.org/r/20251106212342.2771579-1-niklas.soderlund+renesas@ragnatech.se
    Patches: [v2,1/2] dt-bindings: gpu: img,powervr-rogue: Document GE7800 GPU in Renesas R-Car V3U
             [v2,2/2] arm64: dts: renesas: r8a779a0: Add GE7800 GPU node

Series: clk: renesas: r8a779a0: Add clocks needed for GPU
  Submitter: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1020646
  Lore link: https://lore.kernel.org/r/20251106211604.2766465-1-niklas.soderlund+renesas@ragnatech.se
    Patches: [v2,1/4] dt-bindings: clock: r8a779a0: Add ZG core clock


Total patches: 7

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



