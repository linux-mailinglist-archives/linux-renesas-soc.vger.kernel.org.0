Return-Path: <linux-renesas-soc+bounces-27928-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gJnDGKwFhGn+wwMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27928-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 05 Feb 2026 03:51:24 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 743F7EE202
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 05 Feb 2026 03:51:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D677B300C54B
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Feb 2026 02:50:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 096762DA74C;
	Thu,  5 Feb 2026 02:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NrDsCSAV"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAC4B2D9ECA;
	Thu,  5 Feb 2026 02:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770259828; cv=none; b=We8hdyMk5mx30JA73eqXPv/ua9ITezNuDAfOMUVxDCo2HJMsIZE1jCBWpm8UPBk96BE5eebZBHD+M7xis5PVR4qFm30R3Exhdj2vR4u9Y995LgyKwEkN6glrea7xMzSTbzIWycu5KcbgaSVuVeTtqAtTgXeAeiWwC1WMraf07AM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770259828; c=relaxed/simple;
	bh=BUy2dVCixoseStXfiVAk0ujdpry9e6lGpslQgyg3lCQ=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=opboJ59eQ6jAnpXX1bm9GjOPPI6S/q0FVrYCGWL7Wxz6Qjik0x+1dQHGrdU29LefVI0qMhhgsfzTB2lvTwseFCHMs471GmcGLVTqHI91oHEbdyVKwEyeSNdWdsNEeFqkEFXgxFDuDokQ0YWd2ilbQzBWhW1Mi5t6oo0lTyW2SpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NrDsCSAV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8036CC4CEF7;
	Thu,  5 Feb 2026 02:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770259828;
	bh=BUy2dVCixoseStXfiVAk0ujdpry9e6lGpslQgyg3lCQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=NrDsCSAVNzugFjc3fZgGOL+MyMQXtfvr388atDnMfqwA1hig5bpegZrMa09NSoxId
	 oN6PzhY3pNs0t0UEQhK3rKCOuVhK/ZVkawkPFsij8kQFNUxldvIv9dL6u988ejoGK5
	 36U7i6K5Xv3BUZnBr5jBESkOxbHaqRKbaU2xmcgL2KguP1fW+E2gpMVZZC+rc/Y/sp
	 0FTlCV1gCwt1QsnZPCQiYnz+yXrwkZekGuUZcsVDsc4rklHWdTrzikiV0uGfATLpJx
	 hyT5ys/Bp8A51HObdxgKnTzmRT5CNfgFWJkG8BQwDyH4r7a97XWwYzSHbfk0lHpEvz
	 RHXm+chJmrRrA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id C22913808200;
	Thu,  5 Feb 2026 02:50:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] dt-bindings: net: renesas,rzv2h-gbeth: Document
 Renesas
 RZ/G3L RMII{tx,rx} clocks To: Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <177025982657.136386.4531312791158041568.git-patchwork-notify@kernel.org>
Date: Thu, 05 Feb 2026 02:50:26 +0000
References: <20260204212541.4870-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260204212541.4870-1-biju.das.jz@bp.renesas.com>
To: Biju <biju.das.au@gmail.com>
Cc: biju.das.jz@bp.renesas.com, netdev@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, conor.dooley@microchip.com
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.34 / 15.00];
	LONG_SUBJ(3.00)[525];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-renesas-soc@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-27928-lists,linux-renesas-soc=lfdr.de,netdevbpf];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NO_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lunn.ch:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,microchip.com:email,davemloft.net:email,glider.be:email]
X-Rspamd-Queue-Id: 743F7EE202
X-Rspamd-Action: no action

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed,  4 Feb 2026 21:25:38 +0000 you wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
> 
> As per the RZ/G3L Hardware manual, CPG_CLKON_ETH register bits{12,13} are
> to control the RMII{tx, rx} clocks. Document the RMII{tx, rx} clocks for
> RZ/G3L SoC.
> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Fixes: 3ac2aa31b489eb4e ("dt-bindings: net: renesas,rzv2h-gbeth: Document Renesas RZ/G3L SoC")
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> 
> [...]

Here is the summary with links:
  - [v2] dt-bindings: net: renesas,rzv2h-gbeth: Document Renesas RZ/G3L RMII{tx,rx} clocks To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google
    https://git.kernel.org/netdev/net-next/c/d2adcbdae5f6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



