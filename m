Return-Path: <linux-renesas-soc+bounces-27929-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qMIyMMcFhGn+wwMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27929-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 05 Feb 2026 03:51:51 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE04EE225
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 05 Feb 2026 03:51:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D6C0A302EABA
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Feb 2026 02:50:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E8B32DC32C;
	Thu,  5 Feb 2026 02:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KcRAShb3"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B6412DBF5E;
	Thu,  5 Feb 2026 02:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770259830; cv=none; b=OPyErPFC2e9DPP0P9pYUdZ0F1urV3L+XHfhTG89Ooc1YYwEGiAPhq1jZq5PNWBlupCb61mJSxNwHHmsilN5dkZSaF/iCspDig+CzUgFZClJPePzPdi6E6Ze82XHv2yGTK3DkwbidkmjhRYIzON1EOnJ6cdRK5hxxTHwPAwdWlV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770259830; c=relaxed/simple;
	bh=Z5FbbNY0STtYUKLtYxBGy8j7sp1YcjshYnyolrepKRU=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=iVrwvhm9MWcgePbfqcQwd+Ewt1zxSSnGk9QCnEwweiP+Sqr6L/BGfSsX74AtdC0wZsHGP6yo4wosCL7BVRmZyTBnXmGYjm+lADU/oC83AMwQnJqxKPFyxVvtAAJjlSrRL0z0jooiKtkvpIYKkGBsnHyaJBkkKde22Kz7sIdCWko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KcRAShb3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCC3CC19422;
	Thu,  5 Feb 2026 02:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770259829;
	bh=Z5FbbNY0STtYUKLtYxBGy8j7sp1YcjshYnyolrepKRU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=KcRAShb3qJxUP1fS38Y/DMmY+579c0j5hORee1je1WXIKIs1prwQoYkgbDqoPqS6w
	 /DgCljLInB0+Fen78dT+qagFUkeWFo10n4o6BATzzNMUfxlahXp4BBHLnHfMdv/oDu
	 uRy+YASlMZ7/mHxCxgHnmOdiG8yu9Hj1dYQzTAgm8MJEzKAmIC2FOsexJpvJtNhcwV
	 vZgjEjhJl05RNNv0vQydSTXqzFB7SW0yMCeLzz3+e1xZJ9/t7XdbbDu+3OEVEIQWww
	 t4OblunhuUnMVsC4AX+7DhTytPCQlsr4xxMIH7lZhQqW2ZxhCceZTY6vBuSjsvRA5C
	 D3oBbCxm1fJpA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 0B1803808200;
	Thu,  5 Feb 2026 02:50:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2] dt-bindings: net: renesas,rzv2h-gbeth:
 Document
 Renesas RZ/G3L RMII{tx, rx} clocks
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <177025982782.136386.8080534432621107971.git-patchwork-notify@kernel.org>
Date: Thu, 05 Feb 2026 02:50:27 +0000
References: <20260204213524.3437-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260204213524.3437-1-biju.das.jz@bp.renesas.com>
To: Biju <biju.das.au@gmail.com>
Cc: prabhakar.mahadev-lad.rj@bp.renesas.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 geert+renesas@glider.be, magnus.damm@gmail.com, biju.das.jz@bp.renesas.com,
 netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 conor.dooley@microchip.com
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-27929-lists,linux-renesas-soc=lfdr.de,netdevbpf];
	FREEMAIL_CC(0.00)[bp.renesas.com,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,glider.be,gmail.com,vger.kernel.org,microchip.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[18];
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
	TAGGED_RCPT(0.00)[linux-renesas-soc,netdev,dt,renesas];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,microchip.com:email,renesas.com:email]
X-Rspamd-Queue-Id: 3BE04EE225
X-Rspamd-Action: no action

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed,  4 Feb 2026 21:35:21 +0000 you wrote:
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
  - [net-next,v2] dt-bindings: net: renesas,rzv2h-gbeth: Document Renesas RZ/G3L RMII{tx, rx} clocks
    https://git.kernel.org/netdev/net-next/c/d2adcbdae5f6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



