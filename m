Return-Path: <linux-renesas-soc+bounces-19303-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F3568AFAFFC
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Jul 2025 11:41:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 001237AE766
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Jul 2025 09:40:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B70328ECF4;
	Mon,  7 Jul 2025 09:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N0CzqnbD"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3652D28ECEA
	for <linux-renesas-soc@vger.kernel.org>; Mon,  7 Jul 2025 09:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751881252; cv=none; b=lUkE0BuiughbunEG3sFm0J7AZtxsNQkTBkjjpRYMOhGNRLGWaXem2NdXnw0rOYt8z9XRcToj8/NVWGuhyUEkgZHhTk7z+GvazAp3f1oI8alnfkRnMlyGW5FdoP8V9RgfcZZtDmsJDxcFukueGyMi4TgyZhJTrGcc3w/voiYklEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751881252; c=relaxed/simple;
	bh=7J0wwTgad0W6SQgjrAkumA6aQJuIizhTO3CZNKJ2voY=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=UFAlwQtDBNKoIMHKIJoThAJpm4LYlsWg35CHbV6kJRc8eyW/vih6dUvbElVlsgZ+629H8NMhMdzMAaxPGYhWIThgqf+LAd2gJwt4Od85tl15SdpsdnckQGvHEeQdBVdKsXmTWxAcsNrCIgoBrDIGnc2uiOcg7TPCzGLVhqQwT34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N0CzqnbD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1654DC4CEE3
	for <linux-renesas-soc@vger.kernel.org>; Mon,  7 Jul 2025 09:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751881252;
	bh=7J0wwTgad0W6SQgjrAkumA6aQJuIizhTO3CZNKJ2voY=;
	h=Subject:From:Date:To:From;
	b=N0CzqnbDx4eFlYDnmAxB2JP/89DBziYzuqHlFXrIY7EcK6MfyMI+2nYXx6VfhMgaX
	 Sp44wgkhnTx3CpYkpdOcHhY94MZsnR06c53U3/Hlb2S0EEyzyDLpkzMfn5iqsFlplF
	 HFmJoVQJaEw8P8/TJxOgDQWMziocM3IkZ3Gr7X4exT7yukmOuc0O5sEfbW5p7tD4Uu
	 pZTrDU2eEOS/p79zwZzEzvwrF4OQwlYSCtgN4ZT0sjLlZhxvDpOFx40iAYDhdppX5C
	 NMAgLSJO9WQCSz0NdgppL216R0A//CW4LMzgrUbubU17HSsTl/Rz0tDyA7WMgHea5l
	 U/YkzS4aKroBw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7481838111DD
	for <linux-renesas-soc@vger.kernel.org>; Mon,  7 Jul 2025 09:41:16 +0000 (UTC)
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
 <175188127498.3230045.3029014230214563121.git-patchwork-summary@kernel.org>
Date: Mon, 07 Jul 2025 09:41:14 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Series: arm64: dts: renesas: sparrow-hawk: Add overlays for camera sensors
  Submitter: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=979080
  Lore link: https://lore.kernel.org/r/20250704100734.3387856-1-niklas.soderlund+renesas@ragnatech.se
    Patches: [v3,1/5] arm64: dts: renesas: r8a779g3-sparrow-hawk-fan-pwm: Add missing install target


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



