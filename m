Return-Path: <linux-renesas-soc+bounces-25417-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B6CC9694E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 01 Dec 2025 11:13:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 74B8F3415D6
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  1 Dec 2025 10:13:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E8B830214A;
	Mon,  1 Dec 2025 10:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qa3aZOL6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 191C63019C4
	for <linux-renesas-soc@vger.kernel.org>; Mon,  1 Dec 2025 10:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764584019; cv=none; b=Fzpoc0w9Ft9rshoJmMBnfo3QGVQsCGuFcpqJEcE6YF0snmYJ98JccqnUK/nOrAfs0kln8sp94EPUMf3LdplZwtn++Ri5nuApwcrICK84MYccdiou6IfGEUD+b5mPlZ/yAc6rKnwgEColRMWPNelcWpol8wt8eDC2gxUj2Liy+CI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764584019; c=relaxed/simple;
	bh=aiwVIlD8gHoXXHWUEYvXebRVi6Q+OAH3IS0EYHinAPM=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=XqmCTh8tJUzjVABq5oB41EK8v2BdRkm7UoV9uRBIYKxKU1evsy//ZDMwqLHMHkX/UTdTbiAjpeVyU9kgWLUXxRsMexeXManuIrgRknB7rNy044P3B5hYL3+bF59g9N6nmMaN8brcd8Jet45L7KtDnEaAJzDpPB1I4m9y2ryW8R0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qa3aZOL6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B832C4CEF1
	for <linux-renesas-soc@vger.kernel.org>; Mon,  1 Dec 2025 10:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764584018;
	bh=aiwVIlD8gHoXXHWUEYvXebRVi6Q+OAH3IS0EYHinAPM=;
	h=Subject:From:Date:To:From;
	b=Qa3aZOL63A25y1TejyRrUgfc8BIGj/U33tfG+uIvbD9uSGB8cUW96ms5VfWTv3um3
	 YZd0p7rUg+iXsjLzFG5IplwNY7OVEoJ8ERJhV1o3d4jt7/U3VsuYEHlpRqyvhCkLe2
	 cdyK6kMtWiX/S6vY0p8/arNuhYzlW127hQIrIcSe0AZy+tWQYnbMUdtpQmyJ/hMlXQ
	 mvrqU6kVDpwC2UHmkVMlrn8IMBGzo1kWUbJYfCBWw39raigqtwxbg3tD2Qmg3rkes1
	 SoPr02GAQV7e/AHlnPXGLKq1sNWZAPkuhA4n5tURj3QMog04shuBxf04RL4+q/G1m+
	 HIpWSMxx3zGGQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 03793380CEC6
	for <linux-renesas-soc@vger.kernel.org>; Mon,  1 Dec 2025 10:10:40 +0000 (UTC)
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
 <176458383850.2297586.7034742515287704751.git-patchwork-summary@kernel.org>
Date: Mon, 01 Dec 2025 10:10:38 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Series: Add RSPI support for RZ/T2H and RZ/N2H
  Submitter: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1025420
  Lore link: https://lore.kernel.org/r/20251119161434.595677-1-cosmin-gabriel.tanislav.xa@renesas.com
    Patches: [v4,01/13] spi: rzv2h-rspi: make resets optional
             [v4,12/13] arm64: dts: renesas: r9a09g077: Add SPIs support
             [v4,13/13] arm64: dts: renesas: r9a09g087: Add SPIs support


Total patches: 3

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



