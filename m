Return-Path: <linux-renesas-soc+bounces-27046-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D45EED3ABF5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Jan 2026 15:31:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B36DD30158C4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Jan 2026 14:23:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE938389DE4;
	Mon, 19 Jan 2026 14:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IE/H7Dlf"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA9E6389462;
	Mon, 19 Jan 2026 14:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768832580; cv=none; b=jvGCSFH+tp7wCN4sshZDRG/OjEojU699WQ+txrt/cDVSHzjhsz5OU2hBDFxniGKxONN75nAIT+oJkxGaepe/t6EKT5YtMdUachZMWlnvkUlj+URLutXoGCc+ao2sKL7ImInGXyjR80DKG+E1V4J48Ak+L7layQPSph2uQiv6YG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768832580; c=relaxed/simple;
	bh=bc+SMSo/BEsJV6kKQTjJ2iqWRMvIFdUr7/HiGEtsBWA=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=Rv56rksG99ByurfeXAV6tnHqJXQI2sGVJX8hCq0beLoaHzkeFHea/yNZULdycpVQrRgd/Xm74L8JrVZEym25i0FK9KxovB5RoFSiC/tgH3dM3gM4jSEeC+KSQvTfVXJWtoETiFniUHEXuguFmScHK/V3P7OBMuBkUb7l6+wuP9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IE/H7Dlf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72E27C116C6;
	Mon, 19 Jan 2026 14:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768832580;
	bh=bc+SMSo/BEsJV6kKQTjJ2iqWRMvIFdUr7/HiGEtsBWA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=IE/H7DlfJUzKatGr0A6P/cCX7S5Wrp5fMfrW+nnZ8pbrE8a9QY5945FI8T6A1O6Nn
	 9cVNqaY16Wo/W2mqRIP7qtErikO0PhDvLnXFcSkHmLn9B6EBgNDnNtk7ZRjZ66xwZQ
	 MToXnPZWalDSyqTOSq91+HCHvpR8EETdfavr1ko6lOXScMSPLGfnf2soZ+SfuCxL1Q
	 rEXM3eSgrz1GKZtGfvrSqoRIP2UYvgzwXBYwkYZ5hUO40Wr80wTF/PdYuYcgfTPVNH
	 qMO2lbtlSW+0eaUwPpBgJd0UWV8u0dbjI4gppp4gq778vzHYLYHc5+q6k26ktXhDVf
	 h3xbNKkfizJlQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 78B503A55FAF;
	Mon, 19 Jan 2026 14:19:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v3 0/2] net: pcs: rzn1-miic: Support configurable
 PHY_LINK polarity
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <176883237003.1426077.11987009309110128646.git-patchwork-notify@kernel.org>
Date: Mon, 19 Jan 2026 14:19:30 +0000
References: <20260112173555.1166714-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: 
 <20260112173555.1166714-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Lad@codeaurora.org, Prabhakar <prabhakar.csengg@gmail.com>
Cc: clement.leger@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, hkallweit1@gmail.com,
 linux@armlinux.org.uk, geert+renesas@glider.be, magnus.damm@gmail.com,
 linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 biju.das.jz@bp.renesas.com, fabrizio.castro.jz@renesas.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 12 Jan 2026 17:35:53 +0000 you wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Hi all,
> 
> This series adds support for configuring the active level of MIIC
> PHY_LINK status signals on Renesas RZ/N1 and RZ/T2H/N2H platforms.
> 
> [...]

Here is the summary with links:
  - [net-next,v3,1/2] dt-bindings: net: pcs: renesas,rzn1-miic: Add phy_link property
    https://git.kernel.org/netdev/net-next/c/98e8039a3b14
  - [net-next,v3,2/2] net: pcs: rzn1-miic: Add PHY_LINK active-level configuration support
    https://git.kernel.org/netdev/net-next/c/61f1139a4765

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



