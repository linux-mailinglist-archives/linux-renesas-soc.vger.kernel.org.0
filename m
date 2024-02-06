Return-Path: <linux-renesas-soc+bounces-2390-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8134B84B2A0
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  6 Feb 2024 11:40:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B38E91C214E8
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  6 Feb 2024 10:40:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A4F11DDC8;
	Tue,  6 Feb 2024 10:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Izaku3/r"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB2281CD07
	for <linux-renesas-soc@vger.kernel.org>; Tue,  6 Feb 2024 10:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707216028; cv=none; b=kfDDrhScqtO6GkKGCAMgfEmu1GDTHsOar2ScVXU3TL1vTnWEG4ifAKVkeePCrzYVmRlyyMvR0LO0d6FyQrMiW1Lo+xPpVk1NBYGcp41V9Sf/eJ9ThuHo7w88YoobUNKofyHGuQ0b+whD+qJymTQReOW82nGCvPKrTcljJGRB8DM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707216028; c=relaxed/simple;
	bh=gOv2kgZS3mhoou1voyfSevXFcXf6oDpwZgeffl3zO0A=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=qPDgdkVrgFbVVzD9Jfnsy6wcYqQJ4Yn9b33QZ1NHZgEZHd9CpeoVnh1dQozJqJluq44CsNdhxY5Hz+dCvSB6WSsM1ISkJuIKJ6zvevS5rDtRCacR/sjqNrhtkEiaqqTuThQ3rc8HXIgeKwWCWy5qG9XNPj8OLpkSub7vuOaTyNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Izaku3/r; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5CE49C43390
	for <linux-renesas-soc@vger.kernel.org>; Tue,  6 Feb 2024 10:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707216027;
	bh=gOv2kgZS3mhoou1voyfSevXFcXf6oDpwZgeffl3zO0A=;
	h=Subject:From:Date:To:From;
	b=Izaku3/rPLZCTKQkiW/lawvkPeBTSos5GtjsSeESw4g3bzurehRz8yLIonL9MKtKj
	 OtUBCkG4mJrOhOhqqP48Revg30UhNoNhm44bGA94kmHvWTYXh9Mf5mJL0G+rMoVIAI
	 pp7ikGSLlxsKVwAmWNCSj8uA0c93oPQbdwupLN2UcGcpQfLK4wi9vjjwEHnjJgVNMA
	 Silc/fI5LcfOwAiX5ZpdpyWiJv6qavnWXAEV+KnHSb8uZOXbCmdnIrWCzoIFc8wG38
	 Z3HhoxWDKPpg23+NCRHJ4UM8hwtXS9JsdPgy21Ku8zEZ2ed/Cd3FUc5TqzcmlFbo60
	 jHHADgd+vtaZA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 39469E2F31F
	for <linux-renesas-soc@vger.kernel.org>; Tue,  6 Feb 2024 10:40:27 +0000 (UTC)
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
 <170721602716.19475.3555107654277183700.git-patchwork-summary@kernel.org>
Date: Tue, 06 Feb 2024 10:40:27 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Series: ARM/arm64: dts: renesas: Improve TMU interrupt descriptions
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=816924
  Lore link: https://lore.kernel.org/r/cover.1705325654.git.geert+renesas@glider.be
    Patches: [1/2] ARM: dts: renesas: Improve TMU interrupt descriptions
             [2/2] arm64: dts: renesas: Improve TMU interrupt descriptions

Series: arm64: dts: renesas: r8a779h0/gray-hawk-single: Add watchdog support
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=822137
  Lore link: https://lore.kernel.org/r/cover.1706790320.git.geert+renesas@glider.be
    Patches: [1/2] arm64: dts: renesas: r8a779h0: Add RWDT node
             [2/2] arm64: dts: renesas: gray-hawk-single: Enable watchdog timer


Total patches: 4

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



