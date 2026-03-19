Return-Path: <linux-renesas-soc+bounces-29911-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sGGcC0INvGkArgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29911-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 15:50:42 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DF9E52CD2B6
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 15:50:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 86C13300A10B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 14:50:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1863A3DB65E;
	Thu, 19 Mar 2026 14:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eXGKt6dx"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E82823DB632;
	Thu, 19 Mar 2026 14:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773931840; cv=none; b=bainVpZMvhbFcK0r2eyxy0A6IQnTbo+l3WacSHzr4oXzb9B+FgHje0OHN56QjhjtKS4S36fEDECW/A9sUi3HvVh4FLGl6kNHBC7HausZ3+aEBI8+et2oAIiST+BVg2YimhTj4Sjgb5nHPddMHG7VM0AZ/pf7kpZ/a3aqxtfpZpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773931840; c=relaxed/simple;
	bh=RSrXDaSoIfCD2lr/IV1qX8u7HfAhgEPYGnkvHpAEQXE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BUlZx2qqRdWEEH/ZgUfZqLoIo4iHewZFb6k0QpIuw84XkvfbPIlE3idaDgN4n8k0F4w68hRTco54xP0m3QjDmmnvsyAEETlyLRMWGNlUf+iSG5yUkeWj/KxkWqSz7URlbtLKCqkuSTgul53RjILP3bcoYTY/PVO98G7xIlmjiyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eXGKt6dx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D36BC19424;
	Thu, 19 Mar 2026 14:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773931839;
	bh=RSrXDaSoIfCD2lr/IV1qX8u7HfAhgEPYGnkvHpAEQXE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=eXGKt6dxaZVmGUEvYb1D3fBZR/2vc4REJ//52PYbj+0WbHmwh/s6mV4qp0O3RlTTe
	 r9t15Yy7yhyfuz/u5uNN2/FWYIuGxRcGEOHKb94h3rNBgKaM6ibk3mhLUmVip5Cs2y
	 ITlRVapKquRGA+LRYXggTLVKxySgxGz1yrWwjt8m4o+NtgqYkojc1ysF3nv4hVid0J
	 s/JQyJQjYy03F4TsiTB3gMZZLEuRde9WbsmSB6IACZ1BXec/rommo6zCOGpwCb1sUV
	 ZsQ0MpGpDb30fm1J2HskB4ZR4d5npBEdGy3Iig8tlHT1FAqddIT2/zZzkWaXTq1IpG
	 ovTcoWUTv6ClQ==
Date: Thu, 19 Mar 2026 07:50:37 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Rob Herring <robh@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Heiner Kallweit
 <hkallweit1@gmail.com>, "niklas.soderlund" <niklas.soderlund@ragnatech.se>,
 Geert Uytterhoeven <geert+renesas@glider.be>, "magnus.damm"
 <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>, Paul Barker
 <paul@pbarker.dev>, Neil Armstrong <neil.armstrong@linaro.org>, Florian
 Fainelli <f.fainelli@gmail.com>, Prabhakar Mahadev Lad
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, Sergei Shtylyov
 <sergei.shtylyov@gmail.com>, "netdev@vger.kernel.org"
 <netdev@vger.kernel.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "biju.das.au" <biju.das.au@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH net-next] dt-bindings: net: Remove redundant
 ethernet-phy-ieee802.3-c22 fallback
Message-ID: <20260319075037.5666c9ab@kernel.org>
In-Reply-To: <TY3PR01MB1134654258041DDB93CF81573864FA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260313130623.297712-1-biju.das.jz@bp.renesas.com>
	<20260318170503.316285a7@kernel.org>
	<TY3PR01MB1134654258041DDB93CF81573864FA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,lunn.ch,davemloft.net,google.com,redhat.com,gmail.com,ragnatech.se,glider.be,armlinux.org.uk,pbarker.dev,linaro.org,bp.renesas.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-29911-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[23];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuba@kernel.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.895];
	TAGGED_RCPT(0.00)[linux-renesas-soc,netdev,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: DF9E52CD2B6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 19 Mar 2026 14:38:37 +0000 Biju Das wrote:
> > Maybe a noob question but why are you not updating all the other ones?
> > 
> > $ git grep --files-with-matches 'ethernet-phy-ieee802.3-c22' -- \
> > 	Documentation/devicetree/bindings/net/ | \
> > 	wc -l
> > 16  
> 
> The other files have only 'compatible = "ethernet-phy-ieee802.3-c22"'
> 
> Whereas this patch removes the fallback pattern based on
> Rob's suggestion [1]
> 
> compatible = "ethernet-phy-id0022.1622",                     
> 		 "ethernet-phy-ieee802.3-c22"; 

Got it

> Please let me know, should I drop all 'ethernet-phy-ieee802.3-c22' compatibles? 

No, let's wait for DT maintainers' review.

