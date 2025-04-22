Return-Path: <linux-renesas-soc+bounces-16223-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B08ECA96583
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Apr 2025 12:11:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 88B1E3BBD86
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Apr 2025 10:11:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B665220C03F;
	Tue, 22 Apr 2025 10:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TncP4ddS"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C68E20B1FC
	for <linux-renesas-soc@vger.kernel.org>; Tue, 22 Apr 2025 10:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745316680; cv=none; b=CQ9Ha8qVeV2CPBLfwGsr5ONxVnYvbOa7z10ttsZ11U9PI5cFqk4nLY20ijeh6jkT/lGnrAx15KFMmUyBMJqvbwsA2xNjWkS44MoAWWxaynicfOBdhsJ8sBXzJBc0BX5NWgkGlBAtxEptWPmZXOKJJ9B/6jfxbWI0BZ97dxnr2xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745316680; c=relaxed/simple;
	bh=Qu1KI3tv3gN3fKVFZQu8sOuXRuL+iju1jYpwtBz6Ahc=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=W9TTweOLIfQvAfAu63vNHtWCel9sE4hZq8PAN0bsQcHi9xLnCMegKsHBMc+CquhkfsWgOJ/C1tB4EIepSn6lSJPJOgJhSJHjMBraXqgsnKGzatkQYC86N6oGN+cFZ/2X3W8yk8R9hkyBeGXASxuILWtuQVqeM5Qb4HcTdPdmDes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TncP4ddS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C065C4CEE9
	for <linux-renesas-soc@vger.kernel.org>; Tue, 22 Apr 2025 10:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745316680;
	bh=Qu1KI3tv3gN3fKVFZQu8sOuXRuL+iju1jYpwtBz6Ahc=;
	h=Subject:From:Date:To:From;
	b=TncP4ddSGcPfXuPvSXvhOhSjW6rIw/oyrMrY5o4KlkxP8q9a6bcvRX8n1dbB53GWv
	 To5q2d2r+Fo+9t9wGP88vmX+azj7fv3WcD1Zhj5ontDfqhdbZqkkvVwq1ez/Uc913R
	 dHP2ePVnqwCMDQTdvGvtgEn8XozdXB00JC0MMq8lV1JJ3dolq+O5S/QrH7w5W+at8B
	 FWhqSXc19RBhK4jY0lTpMFZlMQuAGF8QESCSd/yh/U6kPEQb74j38g1gW+7HiHUTwL
	 8Iamo0BLAZTmpESUWiuxmcr4ho+85T6yvThi3hjeMP3xjX7NCkOnAMMit5H6HFD0ly
	 N4W4+DcVh+9wQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B31CE39D6546
	for <linux-renesas-soc@vger.kernel.org>; Tue, 22 Apr 2025 10:11:59 +0000 (UTC)
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
 <174531671836.1505048.9320660964572819220.git-patchwork-summary@kernel.org>
Date: Tue, 22 Apr 2025 10:11:58 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

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

Series: Add support for Mali-G52 to RZ/G3E SoC
  Submitter: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=949320
  Lore link: https://lore.kernel.org/r/20250402131142.1270701-1-tommaso.merciai.xr@bp.renesas.com
    Patches: [1/4] clk: renesas: r9a09g047: Add clock and reset entries for GE3D
             [3/4] arm64: dts: renesas: r9a09g047: Add Mali-G52 GPU node
             [4/4] arm64: dts: renesas: rzg3e-smarc-som: Enable Mali-G52


Total patches: 6

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



