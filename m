Return-Path: <linux-renesas-soc+bounces-29841-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8tFdJbQ9u2mphQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29841-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 01:05:08 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DE8082C4052
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 01:05:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7AF42303266B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 00:05:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CFEB40DFB2;
	Thu, 19 Mar 2026 00:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GGq/5A0z"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D96E140DFA3;
	Thu, 19 Mar 2026 00:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773878705; cv=none; b=qCXfM6VHi0Rzyr8i+M2zhg0DsZSm1wQOJPa6J+3vEAAZ48O4O6p/nyKejQo5PKcF5c+ar7DixOPJAFbvIXzmkQzBmkA412eOi3cB60PvoboLCnAHLmenqkThfGOe3d1deaYgRiZN+i0A5oxxfY5AyRlxlhDQ+oIYmFMJ9GvNfoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773878705; c=relaxed/simple;
	bh=egtIt3vs7fU1pnVciFOUD3J1cjtgi6HXR89gfgIrrgg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TZ8aBvNVliN+TqQHngL+f8SgadZpnCfirRe+lUHiM0bu6mHWohbaLaWuluogxHQ/HJrecxdSQyKEAbgUdtbcx7nTTdYeToSFwgSd/zVmkUcIua+JsjeCieKcOY/QoDj/dqKDddjhxDdU+qBvmZisMO7U2wls0e/oM2p481eXq2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GGq/5A0z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F0F7C19421;
	Thu, 19 Mar 2026 00:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773878705;
	bh=egtIt3vs7fU1pnVciFOUD3J1cjtgi6HXR89gfgIrrgg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=GGq/5A0zDaU9dYAxXmEoacw3UPKpmGblIzIBvzeOzok8SezzdPpIVGXmzi03cCVAc
	 IfO67qpeKuDk9TZEVJL7bKhH3eV8ES6Thq0D3GDzqmz1O2i31zqbv4+TBhqMEyQ4Pt
	 JXi/nI55K19SMTtT8hQNubkU2Gyzxbg3fzcF67RM7vkLXHBR2etu2vMkeQWTWG695g
	 /PM4USrcH9m+sJ2z74y4RsDs1Bkgf2DgCX3CJsiBvJVbthqZ7nNrahyO0g4Iuoy/5S
	 TUI8Ka4S3I6EeVwr3d3ONWYn+u/d9uFn1g3jNsbxx7AD1rjOrHGbfDyEHMXpxL9sBj
	 Co0dErB3Rwv8Q==
Date: Wed, 18 Mar 2026 17:05:03 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Biju <biju.das.au@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Heiner Kallweit
 <hkallweit1@gmail.com>, Niklas =?UTF-8?B?U8O2ZGVybHVuZA==?=
 <niklas.soderlund@ragnatech.se>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, Biju Das
 <biju.das.jz@bp.renesas.com>, Russell King <linux@armlinux.org.uk>, Paul
 Barker <paul@pbarker.dev>, Neil Armstrong <neil.armstrong@linaro.org>,
 Florian Fainelli <f.fainelli@gmail.com>, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, Sergei Shtylyov
 <sergei.shtylyov@gmail.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH net-next] dt-bindings: net: Remove redundant
 ethernet-phy-ieee802.3-c22 fallback
Message-ID: <20260318170503.316285a7@kernel.org>
In-Reply-To: <20260313130623.297712-1-biju.das.jz@bp.renesas.com>
References: <20260313130623.297712-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
	TAGGED_FROM(0.00)[bounces-29841-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[23];
	FREEMAIL_CC(0.00)[lunn.ch,davemloft.net,google.com,redhat.com,kernel.org,gmail.com,ragnatech.se,glider.be,bp.renesas.com,armlinux.org.uk,pbarker.dev,linaro.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.910];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuba@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,netdev,dt,renesas];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Queue-Id: DE8082C4052
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, 13 Mar 2026 13:06:21 +0000 Biju wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
> 
> Drop the ethernet-phy-ieee802.3-c22 compatible string from ethernet PHY
> bindings and their examples. The c22 fallback is implicitly assumed for
> PHY ID-based compatible strings and does not need to be stated explicitly,
> unlike c45 which requires opt-in.
> 
> Remove the c22 pattern from the ethernet-phy.yaml schema and update
> examples in amlogic,g12a-mdio-mux, mscc-phy-vsc8531, renesas,ether,
> and renesas,etheravb bindings accordingly.

Maybe a noob question but why are you not updating all the other ones?

$ git grep --files-with-matches 'ethernet-phy-ieee802.3-c22' -- \
	Documentation/devicetree/bindings/net/ | \
	wc -l
16

