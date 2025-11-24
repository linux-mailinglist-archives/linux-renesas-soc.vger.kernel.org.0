Return-Path: <linux-renesas-soc+bounces-25064-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A3948C7FF3D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Nov 2025 11:41:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 96B9A4E2871
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Nov 2025 10:41:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0C4D2749C7;
	Mon, 24 Nov 2025 10:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T+NsC4I6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC0B421A449
	for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Nov 2025 10:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763980888; cv=none; b=ciGwSZZKs6n5boeJE1WOtAv4QFuByG20kGWsTUDzD7N93z1Mah813aOIkugersel4LVz2qtgdE+LrqZP2WA/50wW3r99iR5h4nCpCFgRCf/AOPMgNfhzkonG6Okjy+ugA2fFcepcl3+Ne2GCO36HRqY4cLn1SRNxhNO4tAE4ZVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763980888; c=relaxed/simple;
	bh=wtvvpw1PpCnlCOAeEXQh+1cy3xm5A9EO5ij/DCRhJmA=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=RaIPptUFkc6bo+c9kLov335CMFwu3duQlMy3qLn075iCySZr5igml98V5fmVZGBF63CWqe+3/T5RhcJBv9IKXyIkMffpeyNxFfPkeGEQt90PVkusH4zXj3wSILu/c9Olg+1J+GMn88D/mWk6XPXsgwKd9qX6Lfs6OS0psG9cjmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T+NsC4I6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80170C4CEF1
	for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Nov 2025 10:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763980888;
	bh=wtvvpw1PpCnlCOAeEXQh+1cy3xm5A9EO5ij/DCRhJmA=;
	h=Subject:From:Date:To:From;
	b=T+NsC4I6YEyC7MwgNXdhN+JxokqeR7DwY4whAPaWtPSNmVP35kQXVKy+pTQSF8wGZ
	 G/kXyyLAvDxwi8uMTfzR34UQk1ZA+1U7vWV7d3pn0z5qtMGWRNk2glT8iIs0X1dpJu
	 g6bm1wiDlU2rQtS9PUD2AjdzvFQ/I1GtKMGQ3UAIDgOef3dKooLOxkOKQB50rMTCZR
	 2IILYpXR1VyWAH9hD6Ds+110ZbcOl3Xa1r0v7F0sRqW14IReweBNAr4r7/LWmjgIZT
	 ZuJ1LIsi6/KQBaYmqjhhv9G4tV8ET2KqoVM/XtQH0+3s09sVqWyPCO/q6AClXj9chF
	 KbdDzMl2lIRVQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B20C23A8625F
	for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Nov 2025 10:40:52 +0000 (UTC)
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
 <176398085125.3676046.13208144078948855727.git-patchwork-summary@kernel.org>
Date: Mon, 24 Nov 2025 10:40:51 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Patch: [PATCH/LOCAL] riscv: rzfive: defconfig: Refresh for v6.18-rc6
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1024205
  Lore link: https://lore.kernel.org/r/b21a89cc6d17ace3d71dda68199fd0880d71405e.1763374913.git.geert+renesas@glider.be

Series: Add RZ/G3E USB3.2 Gen1 Host Controller support
  Submitter: Biju <biju.das.au@gmail.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1002960
  Lore link: https://lore.kernel.org/r/20250916150255.4231-1-biju.das.jz@bp.renesas.com
    Patches: [v3,1/9] dt-bindings: phy: renesas: Document Renesas RZ/G3E USB3.0 PHY
             [v3,7/9] arm64: dts: renesas: r9a09g047: Add USB3 PHY/Host nodes
             [v3,8/9] arm64: dts: renesas: r9a09g047e57-smarc: Enable USB3HOST
             [v3,9/9] arm64: defconfig: Enable RZ/G3E USB3 PHY driver

Patch: arm64: dts: renesas: rzt2h/rzn2h-evk: add note about SD1 1.8V modes
  Submitter: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1014376
  Lore link: https://lore.kernel.org/r/20251022073141.1989762-1-cosmin-gabriel.tanislav.xa@renesas.com


Total patches: 6

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



