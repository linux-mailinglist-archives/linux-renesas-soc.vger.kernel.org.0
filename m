Return-Path: <linux-renesas-soc+bounces-7941-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BB1F795806B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Aug 2024 10:00:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6F6BB1F21A54
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Aug 2024 08:00:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E135B18E37D;
	Tue, 20 Aug 2024 08:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nk950Bzj"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD2AE18E345
	for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Aug 2024 08:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724140830; cv=none; b=fdZIu6iQE3iAWIutGpi6bkDroyzGRbLGKYPQy08vtpiRA5CUVRuFwuWcgOCA0grlXw7vOFjiFJ6EU5hJ5PsrkXv6cculDTdKICFjNC/Ys7BQQvDvcrXsruKW6bydBeQCNMke1RrkjvxkmZnNqu9EDuQEijYIj1mFtvQZOnQHQxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724140830; c=relaxed/simple;
	bh=zuoYKAM2gTXXl6tVjqKJcT9Sxi4qonpt1suTguiIDic=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=mUGd1t4Sp8e9igXK6n7IsAXHdY1hQIRUmkcSDa9lFmszRONt+eZZg7r1Cf4pxST04Z7bQn3Bx9m5Kye+ZiXqYwKkln7H5B41FZy0v4nWVrw5RIKuKBdRddHjYJ9XtM+wFjWWxmaFsNFGQhw9pKwpt28WtvveArlT99wmaKb3baM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nk950Bzj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93318C4AF0B
	for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Aug 2024 08:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724140830;
	bh=zuoYKAM2gTXXl6tVjqKJcT9Sxi4qonpt1suTguiIDic=;
	h=Subject:From:Date:To:From;
	b=nk950BzjoJImPe6vr8TRpFWNdI5IhK2AHvwcXv+i16NpMkFtkMnakgLvQIItrfUAF
	 c7uzS6t9yF6JVrm9Bx5P74cnwFfzGsitT66kBGJXL5epZ4J9GN9NO5lgxOZYriw5GC
	 yue7w+No7ly6YUbne2V6NFQg2H3AWcbaOa/1jC2oEDp5SHUZzUAF9+Zg9fSPH1qfed
	 oCAxyJNwFRWs3CC5yNJuI82SkkJvPLgwUY7xAC9wDklI7G+UxWWOQViwitEuX3aKeI
	 k4AnQmnPeMhs6EaHoFZuf8QH9S78WiR3jDseUUfcTTOjy93rpRQeAkLX5HprJdW0tV
	 /I+BJrwzDu01w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 378FF3804CA6
	for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Aug 2024 08:00:31 +0000 (UTC)
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
 <172414082974.1061129.7698781108181012909.git-patchwork-summary@kernel.org>
Date: Tue, 20 Aug 2024 08:00:29 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Series: arm64: dts: renesas: Add CAN-FD support for R-Car V4M and Gray Hawk Single
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=875933
  Lore link: https://lore.kernel.org/r/cover.1722519717.git.geert+renesas@glider.be
    Patches: [v2,1/2] arm64: dts: renesas: r8a779h0: Add CAN-FD node
             [v2,2/2] arm64: dts: renesas: gray-hawk-single: Add CAN-FD support


Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



