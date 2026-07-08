Return-Path: <linux-renesas-soc+bounces-34894-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /UijB95+TmqANwIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34894-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Jul 2026 18:46:22 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D454728DA7
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Jul 2026 18:46:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=PWBUVJVZ;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34894-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34894-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BE75B3166178
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Jul 2026 16:32:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F034F405C30;
	Wed,  8 Jul 2026 16:32:52 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D26793F23B9;
	Wed,  8 Jul 2026 16:32:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783528372; cv=none; b=M5yGF3Cl54AXwRFeGPXxhEYpHahzs0tb2yMohLcptvko4mBFRCd4hzCmycuL2ysx/K+S9K+wl78rImt4VH1MGxP9/uOlnN/0u8c5lafiksCPRiu0WOa22ug6XgDXtv+7itqO8BVk1Dl+Bjx4p6MYKyU0tux+ADHeUPRHoPlrVVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783528372; c=relaxed/simple;
	bh=mDggZD+QJqlEA2zRqaI2SGJsu6BDMXf4CbvxFZeGk4o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Db9o8Oh4HotwlpWU2HD9OlrPI1o0N7ZvKOjFpf5i6PzaqnhPCEnGGYcHnexCA0QjlnPCf7iGo2cyuQhkc6WnWrtjOpFNkuXTjqkcjG/TDcgBB5KFO0fBk7KSC2qVwL2kOTuQ4wZfZH//JvjKhW/aNvTLB7CKyUjZDGPfamrMqvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PWBUVJVZ; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46B411F000E9;
	Wed,  8 Jul 2026 16:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783528371;
	bh=mDggZD+QJqlEA2zRqaI2SGJsu6BDMXf4CbvxFZeGk4o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PWBUVJVZn2RpPmIcNCiUj29WhFoz0zJiRDBkfpHwALAC5AMAA+a1dA+fqt9VsgdYN
	 tsoe/6XGzIIVm0P1For4mrZkz1TNTHI81ILetovOyCEy1x8LfAJPGEUV4kLBF0Hh6C
	 ZU4ZwAGnjeD5KeNEKq7zHwd50RB/5US3BUf1lD38Vgyv/LAJ5WYheF+2E7/Yiq50mX
	 pJTn1Zrjd2WQvsvYrk4RUjHcewf7ZWj400z/vGjD2ZX5EsQzM+uVYFklwKz143DdDE
	 EsVtkutYxc95WgF90qb3IaAtaUzV6gxdfFu4cPUMTbw9qUCbzqTCU5IG5smSEN1q5t
	 7RWD+vKUGrgMA==
Date: Wed, 8 Jul 2026 17:32:46 +0100
From: Conor Dooley <conor@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
	Ulf Hansson <ulfh@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/6] dt-bindings: clock: Document Renesas R-Car X5H
 Clock Pulse Generator
Message-ID: <20260708-valley-lazy-5c330630485a@spud>
References: <cover.1783505142.git.geert+renesas@glider.be>
 <f0f2e810b249a60ff7c27d508366d66be061fed2.1783505142.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+js/rSO4/JLZe+iv"
Content-Disposition: inline
In-Reply-To: <f0f2e810b249a60ff7c27d508366d66be061fed2.1783505142.git.geert+renesas@glider.be>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.26 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[conor@kernel.org,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_RECIPIENTS(0.00)[m:geert+renesas@glider.be,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:ulfh@kernel.org,m:p.zabel@pengutronix.de,m:wsa+renesas@sang-engineering.com,m:marek.vasut+renesas@mailbox.org,m:kuninori.morimoto.gx@renesas.com,m:devicetree@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:geert@glider.be,m:krzk@kernel.org,m:conor@kernel.org,m:wsa@sang-engineering.com,m:marek.vasut@mailbox.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-34894-lists,linux-renesas-soc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,microchip.com:email,spud:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5D454728DA7

--+js/rSO4/JLZe+iv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--+js/rSO4/JLZe+iv
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCak57rgAKCRB4tDGHoIJi
0suDAP0Y7kKxguK/KmeWU+H6eYs6+NPHihHz7U8UE2vznOiVFAD/QFYF6YnnLV6J
OVFcr+QJR9wTl3FiI/QmhyUL3Gk76Ao=
=aiCV
-----END PGP SIGNATURE-----

--+js/rSO4/JLZe+iv--

