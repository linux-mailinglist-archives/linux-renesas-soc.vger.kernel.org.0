Return-Path: <linux-renesas-soc+bounces-34422-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VVzjDBRWPWoo1ggAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34422-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jun 2026 18:23:48 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D51356C7718
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jun 2026 18:23:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=jCcQqzEr;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34422-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34422-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 14B25309A5EC
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jun 2026 16:21:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07FCA3EB0EE;
	Thu, 25 Jun 2026 16:21:03 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF2363EAC8F;
	Thu, 25 Jun 2026 16:21:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782404462; cv=none; b=S6AVNTgj4NLNFBsMsU7zfSAGLAUj83Ny83RRbvl959Pf9CvPvkzH0eclZDwYaX0A9Jk1lnngMoT81ZMarRbIwd+TnmNRE71xJ3alH3nbe6y1Bw1vAEeS0HB9N+JSColtiT4CC4SR7IMmx4Fm4wEB3zqToxBvbeRdAZUuCg47B0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782404462; c=relaxed/simple;
	bh=85TxGeKv1xAPnRWjfdfN5Xlx6FXRhfdATrT4oqviB3k=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=gPqQCeYBdN7rCKcrTffdgFO3lvrb927Syucu06d90TZDK2K9hV3GtIjLR7iPMkSFspBxzkBUQbijDfTKlBgB0OsMv7MAs31zBUuPfoVUWGH+XMN3Jy+wWUm19fyOlYaW0cJsusL2GKrKK0sIWfpabz7rHLNJ9a38Q37CUqFt1Cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jCcQqzEr; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF7081F00A3A;
	Thu, 25 Jun 2026 16:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782404461;
	bh=wRMh7roqKvVnshiWYjOq5PyXn3UR06HRwFr+YAEnocY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=jCcQqzEr38YdZv/aXwvb71XIWvwXrey7oyPJwjweemQ2PZgF3l5Wni17+cTKfeer9
	 VuenjTj9MVfdwmdG/MEoD5WNOQgbmBQ7u/j0XyJFMnHdGr2hvdIMqAmAMeT4A6omrV
	 eGfTqa9sWYeHqaDzrfTKfqv4zYFB7YmvbQ1HxRKtAPL2MG503dpcbx+ALvVBU9U7rv
	 bLz1u5KuOz2TRX9nSRqg8WQB9x2gzzZgQ3ZMqBHtOGxbynstbBmREyw8pKs+HvqYTp
	 5pc5Eg903jNLlyHdC3mRM3PbFRbpxtrm55h3dELY6l2S191eZTYW4A9xlw54aw0u/7
	 RP0zNJMUohuvA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 93A443AD449A;
	Thu, 25 Jun 2026 16:20:50 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] dt-bindings: net: renesas,ether: Drop example
 "ethernet-phy-ieee802.3-c22" fallback
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <178240444931.3803792.10522936278966862343.git-patchwork-notify@kernel.org>
Date: Thu, 25 Jun 2026 16:20:49 +0000
References: <20260624150250.131966-2-robh@kernel.org>
In-Reply-To: <20260624150250.131966-2-robh@kernel.org>
To: Rob Herring (Arm) <robh@kernel.org>
Cc: niklas.soderlund@ragnatech.se, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, krzk+dt@kernel.org,
 conor+dt@kernel.org, geert+renesas@glider.be, magnus.damm@gmail.com,
 sergei.shtylyov@gmail.com, netdev@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[ragnatech.se,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,glider.be,gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34422-lists,linux-renesas-soc=lfdr.de,netdevbpf];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER(0.00)[patchwork-bot@kernel.org,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:niklas.soderlund@ragnatech.se,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:sergei.shtylyov@gmail.com,m:netdev@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:andrew@lunn.ch,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,m:sergeishtylyov@gmail.com,s:lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-renesas-soc@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,netdev,dt,renesas];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,devicetree.org:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D51356C7718

Hello:

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 24 Jun 2026 10:02:50 -0500 you wrote:
> Fix the Micrel PHY in the example which shouldn't have the
> fallback "ethernet-phy-ieee802.3-c22" compatible:
> 
> Documentation/devicetree/bindings/net/renesas,ether.example.dtb: ethernet-phy@1 \
>   (ethernet-phy-id0022.1537): compatible: ['ethernet-phy-id0022.1537', 'ethernet-phy-ieee802.3-c22'] is too long
>         from schema $id: http://devicetree.org/schemas/net/micrel.yaml
> 
> [...]

Here is the summary with links:
  - [net] dt-bindings: net: renesas,ether: Drop example "ethernet-phy-ieee802.3-c22" fallback
    https://git.kernel.org/netdev/net/c/14eb1d2c03b3

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



