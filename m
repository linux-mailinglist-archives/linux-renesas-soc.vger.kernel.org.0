Return-Path: <linux-renesas-soc+bounces-10260-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ABEFA9BA553
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  3 Nov 2024 12:50:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 691B22819F0
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  3 Nov 2024 11:50:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BDB81632CC;
	Sun,  3 Nov 2024 11:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G4V6SLAA"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34AA82572
	for <linux-renesas-soc@vger.kernel.org>; Sun,  3 Nov 2024 11:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730634621; cv=none; b=RY02QW2MyH4fwWZ7yuW6mFyTJodf6UCOKcLUThLOMJ0Q80+7EF+LbN8b5yoo13ufb7szLm7Gwq0G8VNRNtJM17OTItNyVS3ZZ2Xy3G/fxUEhb6HTqwNSN/sr//RadNBCemFzao2PGEJ3jlL3NAuKh33yqkohaYs0uszobfND1i0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730634621; c=relaxed/simple;
	bh=xTZblqovj8rSuT4KL1FjTv1Dir7/ZDAk4nZ6OvcIkNg=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=X6fo5hrndtNxjKL6MH34P4dJnUQDYx3vvdZVuDsuvN1UR03m0+EdF/m6aAi4njiLkN3uCfTpcWNumIRODkejwFblUcLMO8hR6th/pCsMLj5MUBguZMGpZXu0Vb1pu9FB/25v5aS2nd1aYL767u5DP0OZwaKXnMkPqRaBYaM82r4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G4V6SLAA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3126C4CECD
	for <linux-renesas-soc@vger.kernel.org>; Sun,  3 Nov 2024 11:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730634620;
	bh=xTZblqovj8rSuT4KL1FjTv1Dir7/ZDAk4nZ6OvcIkNg=;
	h=Subject:From:Date:To:From;
	b=G4V6SLAAs/2uvRug1yMAGMa2krVLex6+YKTuRkp1CRiDKyoBpl1599+NoUDdURTBd
	 1si/FAcVSpKqQCAJrNtq40Y+AyXvbWqk2HRU+91roDhL72M22mAffoO2hujo5NSqLy
	 6NDoJh8BQKH7JYdBIyGHRpFIB4IVAwP6mfU+vBkH7S8lsEGqcrzwYASOfR7pc0cJK/
	 gthsmXmUYfk90s10jeX2aEqNIaewFaW9igjNyVvcBngj8PutAxpGbTekS0lG4Mhrdj
	 +jzDEvBWV0uyVeSjuaL5DxcWEYgfsbglyCisE41YcU5Iqljp3jBAKVskGJ8VdQkaeU
	 YvM+EoWNJZsZw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 373E238363C3
	for <linux-renesas-soc@vger.kernel.org>; Sun,  3 Nov 2024 11:50:30 +0000 (UTC)
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
 <173063462887.3169702.8418893833534360361.git-patchwork-summary@kernel.org>
Date: Sun, 03 Nov 2024 11:50:28 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Series: Add RTC support for the Renesas RZ/G3S SoC
  Submitter: Claudiu <claudiu.beznea@tuxon.dev>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=905332
  Lore link: https://lore.kernel.org/r/20241101095720.2247815-1-claudiu.beznea.uj@bp.renesas.com
    Patches: [v6,1/9] dt-bindings: clock: renesas,r9a08g045-vbattb: Document VBATTB
             [v6,5/9] arm64: dts: renesas: r9a08g045: Add VBATTB node
             [v6,6/9] arm64: dts: renesas: r9a08g045: Add RTC node
             [v6,7/9] arm64: dts: renesas: rzg3s-smarc-som: Enable VBATTB
             [v6,8/9] arm64: dts: renesas: rzg3s-smarc-som: Enable RTC
             [v6,9/9] arm64: defconfig: Enable VBATTB clock and Renesas RTCA-3 flags


Total patches: 6

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



