Return-Path: <linux-renesas-soc+bounces-33925-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZSYPKecTLGrxKwQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33925-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 16:12:55 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD5C67A15C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 16:12:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=WbkDfSUv;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33925-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33925-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C8362317978E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 14:11:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 450383839A8;
	Fri, 12 Jun 2026 14:11:45 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E1D227E1A1;
	Fri, 12 Jun 2026 14:11:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781273505; cv=none; b=BN3nsYcAyvkLu4dVE1KcLXA+C3TJnQ+jR5DkajMQzdoWr7s/wNf2dHs8DndnLrfGC6uDkYkxPMmlbEwRq1WGsOyG/NM73sNtU2C+Qd2uuyssK1Gi3NvqPPo0MzdXX0tu3zngz4gfNDEMqvfrHt9qU1xAAaKiDvLdokj960ZoqX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781273505; c=relaxed/simple;
	bh=zIiwxq5MYuZ1Xink+1WuZ0ldvNVMFfHqm2hcRDF/moI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PTONjQxJ8k+7wRWsrkldpDzkGPuQuapSFrmdEn5H27L49uRVePaCfAi/v5K//KHFuil7wWZ0KNQxpfbBcZyOw+smk8kSy5qJnpQUd13Hov01bn3TWRwKtrY+7hJm/5CW2ZpdIpeXHgLsky+/REu4asvSegf8EvtDTxeWDracHX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WbkDfSUv; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A583E1F000E9;
	Fri, 12 Jun 2026 14:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781273503;
	bh=YPSIQHesNYp6mKnxTN6vC8q7P0Hn+TPBZyyWY0vEwAg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WbkDfSUvhzc0aHrq3YoaM/ZzSLkLSGF8UUC9PllO/HBQx2p2v1hUGPVOYvBLDXq1Z
	 zrRtVNY/gDQIiIX2IQPBYCzFQG5OY9SBxUG6edOWt4PORJ1kwAl9TPiPO6WCWg8htC
	 5Dca2prpu8SsAm8W0TWDZ8yCy6CuKxvsZVMuy3sO/7xQS1dIrlOvRRH+paOFdjSi70
	 gCSqtfg+0hMUhSPA2nOpPLUqINBVuUl8ZR6deZAHHPlYxixr61Bf1XFVQoeCwSvaxX
	 DTpwEGrFDG6/qVDn/kGhPwq5FN/8GWa6t6Kj76wQpYJaN/+BBjD5awiVg2h+Jg9n1m
	 hS3RJj4nvtjzA==
Date: Fri, 12 Jun 2026 09:11:42 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Conor Dooley <conor@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH] dt-bindings: cache: l2c2x0: Add missing power-domains
Message-ID: <178127350175.916476.16317522760209240659.robh@kernel.org>
References: <0a57ab356e5f426e28ead373b809f88a63e55380.1781105151.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0a57ab356e5f426e28ead373b809f88a63e55380.1781105151.git.geert+renesas@glider.be>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33925-lists,linux-renesas-soc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:geert+renesas@glider.be,m:conor@kernel.org,m:krzk+dt@kernel.org,m:devicetree@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:jic23@kernel.org,m:geert@glider.be,m:krzk@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[robh@kernel.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,devicetree.org:url,glider.be:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EBD5C67A15C


On Wed, 10 Jun 2026 17:29:20 +0200, Geert Uytterhoeven wrote:
> On Renesas SH-Mobile and R-Mobile SoCs, the ARM PL310 L2 Cache
> Controller is located in a controllable power area.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> This fixes "make dtbs_check":
> 
>     arch/arm/boot/dts/renesas/r8a7740-armadillo800eva.dtb: cache-controller@f0100000 (arm,pl310-cache): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
> 	    from schema $id: http://devicetree.org/schemas/cache/l2c2x0.yaml
>     arch/arm/boot/dts/renesas/sh73a0-kzm9g.dtb: cache-controller@f0100000 (arm,pl310-cache): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
> 	    from schema $id: http://devicetree.org/schemas/cache/l2c2x0.yaml
> ---
>  Documentation/devicetree/bindings/cache/l2c2x0.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

Applied, thanks!


