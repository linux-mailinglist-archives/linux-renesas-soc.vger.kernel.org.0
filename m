Return-Path: <linux-renesas-soc+bounces-13228-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C937A3966D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Feb 2025 10:06:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D22C9177ECB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Feb 2025 09:01:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 635B222FF2B;
	Tue, 18 Feb 2025 09:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y3MFSZy/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F10522FF25
	for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Feb 2025 09:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739869210; cv=none; b=RYnrh59S5t/RSZj5/MJi0CaVF8Qa7mtPOGr1oM1RJizuJBzUYzx5u56GwMsDkBIpKWE+plk2jb6eWFv713IgqiFy/xHEzSggzH+frUoxCyXwh9n2iN3ps8+/wD52P7AFF/hu0zpB5tRKoUeTkmAcLR3WsHfKfS8cLxjjIW8KUCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739869210; c=relaxed/simple;
	bh=caFwktgyNsKc837rRj9MnPANQJlOKxZRC0GdxjauixA=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=Ktubk4bMRdO/KjDmsy+M5l12z0fnm7Kd6RIRYTmHXAeEdhnNBjkJVmQePhdi0ElxBXTpNvNAmQJjqQpQOj4C0vEiJbTxjTWme6urxgdffIWVoCnIekL17UaC5l9HI1d4hA+FGd+mKflamGjZzTlFe8Zo/xlm9b6VBIiOdLLAcJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y3MFSZy/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1782CC4CEE2
	for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Feb 2025 09:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739869210;
	bh=caFwktgyNsKc837rRj9MnPANQJlOKxZRC0GdxjauixA=;
	h=Subject:From:Date:To:From;
	b=Y3MFSZy/H7kb9FdYbtND9TVLa5PcVpCsHRiEet7WWQbMtPcqHWI4Ddk7ywlNFiY7G
	 xjEbLuhRgWfepQ8OfKsHNoNa+dq7McvCGT0lFJ9nCm5KRWNbDwFyBQTg4qdN9aV2p8
	 FddaWMDwVbLdEnzJwvmqZ/af9VuTZQ36yYTCfCWZ3bv5XnK3j7wXYjrjvnn7kuQdfw
	 TLPeB1DOoSJv0iSXTVl5Awx3d8ZoSHr2rpewvO3dv7e3EWj3yuMNaLILhGiYfzeCMI
	 aC7S86P+OJnUZ97/Qb3n95hq+GfbbaPX0yvYq4coiQO4xmmyJKwFaicZvveO1BtVGe
	 13CQf+IEccupA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 76E6C380AAD5
	for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Feb 2025 09:00:41 +0000 (UTC)
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
 <173986924005.4006054.5603576645527670237.git-patchwork-summary@kernel.org>
Date: Tue, 18 Feb 2025 09:00:40 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Patch: arm64: dts: renesas: r9a08g045: Add OPP table
  Submitter: Claudiu Beznea <claudiu.beznea@tuxon.dev>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=928849
  Lore link: https://lore.kernel.org/r/20250128145616.2691841-1-claudiu.beznea.uj@bp.renesas.com

Series: arm64: dts: renesas: Re-add voltages to OPP tables
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=896621
  Lore link: https://lore.kernel.org/r/cover.1728377971.git.geert+renesas@glider.be
    Patches: [PATCH/RFC,1/2] arm64: dts: renesas: r8a774c0: Re-add voltages to OPP table
             [PATCH/RFC,2/2] arm64: dts: renesas: r8a77990: Re-add voltages to OPP table


Total patches: 3

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



