Return-Path: <linux-renesas-soc+bounces-32188-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YCvDCzTi+2lGGwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32188-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 07 May 2026 02:52:04 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8880A4E1C76
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 07 May 2026 02:52:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C24DD303013F
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 May 2026 00:51:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C0651A681E;
	Thu,  7 May 2026 00:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BmNFwson"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18E4F3A1B5;
	Thu,  7 May 2026 00:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778115066; cv=none; b=QZrwH09p1qc0j+p/8MUMMasN7SreZ+HOKY8TVqSVjwJo8chFULHUEx5k8cT+NUBOWOODGmWK12iWkKWGWwj2fzTMhVfl/foxNYkddcPAGoQden38gXh0QTDr2RcWjqwQauMIcIgTZ9Rv+BezCPipYH1ERD87SBmOmJWpXmLSEss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778115066; c=relaxed/simple;
	bh=zR7sFFYFJAjQQGbCRgoYjQn3+Ja+hAAxRZlOC0HrOY4=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=uSwF806OxaG3BFWEIBMOtEqZ7s/Wc1VsJuCbn+iHLgQO6/3w3K6u0DwF7tQre0Ig5w3ErriQgxdURmrMsBIKIylufKoJCcXGXE7jGbh4CYHXX5BcgJxKesy3KQc+xa+FvZYL3gKcbSwwtripFmKhEUwoA+j+cCKzbsNq9erkibQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BmNFwson; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB1D6C2BCB0;
	Thu,  7 May 2026 00:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778115065;
	bh=zR7sFFYFJAjQQGbCRgoYjQn3+Ja+hAAxRZlOC0HrOY4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=BmNFwsoniN/14y19zfCBZz4V81ERflEi+ghphceYvq93kig/rNIi/mKNiMA5v7O9+
	 j/CLlZP2545x8YIqPetbGoaZxtLIy9kw6LBgNAijghtAAWdv2P+lxe3Hqjxq6FYKxp
	 H7FXn3+Vvf+OzWS1khnqlu4sTHDYVM/BabGCAWaxwGHMnGs2xJ0vsp2mvewk1sL7b6
	 AY5fPHVOaOwoSOHbdTapZLzfOarzrz6Y5ub54gPlWCBMQ1/oweoBO+b8RrwKWpOeoz
	 oE/GGOaYOfJpKGPU/s/DYD9zmqCAAmF2OhvyIXBPmT+PKLeaIPjEa40QsOEPPC2SSx
	 SSSVkat4Mmo/Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7CDF9393089F;
	Thu,  7 May 2026 00:50:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v2] net: rtsn: fix mdio_node leak in rtsn_mdio_alloc()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <177811501510.3280886.3966126681952503544.git-patchwork-notify@kernel.org>
Date: Thu, 07 May 2026 00:50:15 +0000
References: <20260505123236.406000-1-shitalkumar.gandhi@cambiumnetworks.com>
In-Reply-To: <20260505123236.406000-1-shitalkumar.gandhi@cambiumnetworks.com>
To: Shitalkumar Gandhi <shital.gandhi45@gmail.com>
Cc: niklas.soderlund@ragnatech.se, geert+renesas@glider.be, andrew@lunn.ch,
 kuba@kernel.org, davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 horms@kernel.org, netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, shitalkumar.gandhi@cambiumnetworks.com
X-Rspamd-Queue-Id: 8880A4E1C76
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32188-lists,linux-renesas-soc=lfdr.de,netdevbpf];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[cambiumnetworks.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Hello:

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue,  5 May 2026 18:02:36 +0530 you wrote:
> of_get_child_by_name() takes a reference. The rtsn_reset() and
> rtsn_change_mode() failure paths jump to out_free_bus and leak
> mdio_node.
> 
> Add out_put_node to drop it before falling through.
> 
> Fixes: b0d3969d2b4d ("net: ethernet: rtsn: Add support for Renesas Ethernet-TSN")
> Signed-off-by: Shitalkumar Gandhi <shitalkumar.gandhi@cambiumnetworks.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> [...]

Here is the summary with links:
  - [net,v2] net: rtsn: fix mdio_node leak in rtsn_mdio_alloc()
    https://git.kernel.org/netdev/net/c/701ea57feaab

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



