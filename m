Return-Path: <linux-renesas-soc+bounces-34405-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id t10MN7sHPGqViwgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34405-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Jun 2026 18:37:15 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 391106C0021
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Jun 2026 18:37:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=g5oRNt7j;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34405-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34405-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8A7C630C4F9D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Jun 2026 16:36:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55CA031A556;
	Wed, 24 Jun 2026 16:36:04 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48F163195FA;
	Wed, 24 Jun 2026 16:36:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782318964; cv=none; b=fgr5Jkq0S2Bub8P0E6p4MTPafBNqvwXVQhma/zA47kN2eJP1LeRHaluaKLzP0FkLVH7JCDEEHzbksSYxpCJBImNKZNKuN7UBe9h7ONKih7Yt5G3xMwNaRVjmcfFJbrhWL80j+bsiWoNMoZ/hUvggf/2Lpkuj8buFSr1/AKAL0GY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782318964; c=relaxed/simple;
	bh=p08OngOsIzGr6ZhopN+/dY2mbYDLgnBM/tGzG5KMUsw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rtn6vmCw4wqAg4cNnMO6cl6CurV0LAnMbLEsm8ZVcpEIhaImLArsZGGU1qyuq2E9fdjIam+XdeEig/AgmB2jeeCKat6rVhoZKjBmNiUkyyfr/yhVz+8TwBkBxs2NKtHFEiGfFHqbX6MK5jW+5No52W/7DkKb56B91nHueeqeKhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g5oRNt7j; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38C5F1F000E9;
	Wed, 24 Jun 2026 16:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782318963;
	bh=p08OngOsIzGr6ZhopN+/dY2mbYDLgnBM/tGzG5KMUsw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=g5oRNt7jHwV1inO+CWVFbTML0PH7pCY4GZx5EU3nFW5GzHBwDchc0evlBpiLpu3qK
	 l1RBUCs/I2mM9q8yxPZg0bG8TW7v12+/Y/anReySyEL2baAGq5qVRxX648bPu6PYpR
	 zvp9ITsOETD9qlB8FqOPowI7eIuiIZuqedqYfwO+zPVv5EgIZ0F19RVOtPUmgBCVeV
	 HkRRgJ65iK1xZD0vNOZFaZFmikJz4VmI81r5Nj9vXnVVEF3oF649KdC+jPxW1UyaEQ
	 2MVueMq0P8vP51IbSZXnchOlXftFuV1fQdBoNWICA7e/Tc8pTGfVlvHarL5JWalOhg
	 A85BueHHww1yg==
Date: Wed, 24 Jun 2026 17:35:58 +0100
From: Conor Dooley <conor@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Sergei Shtylyov <sergei.shtylyov@gmail.com>, netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] dt-bindings: net: renesas,ether: Drop example
 "ethernet-phy-ieee802.3-c22" fallback
Message-ID: <20260624-navigator-candle-1c5beb80f86f@spud>
References: <20260624150250.131966-2-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/bmMDEtLuouUAJqo"
Content-Disposition: inline
In-Reply-To: <20260624150250.131966-2-robh@kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.26 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34405-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[conor@kernel.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:niklas.soderlund@ragnatech.se,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:sergei.shtylyov@gmail.com,m:netdev@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:andrew@lunn.ch,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,m:sergeishtylyov@gmail.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[ragnatech.se,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,glider.be,gmail.com,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_RCPT(0.00)[linux-renesas-soc,netdev,dt,renesas];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 391106C0021


--/bmMDEtLuouUAJqo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--/bmMDEtLuouUAJqo
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCajwHbQAKCRB4tDGHoIJi
0la/AQCah45Q3RREHspmj82zTCeY0rS8vYHCdVEpQDgxSl8o6gEAlB/SpV9wcc90
zE2XuJetPcft0syPmsVSNmWkDLq+GQI=
=4Rx0
-----END PGP SIGNATURE-----

--/bmMDEtLuouUAJqo--

