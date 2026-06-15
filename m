Return-Path: <linux-renesas-soc+bounces-34050-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5JvIMX8oMGrPPAUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34050-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jun 2026 18:29:51 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2606C68861B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jun 2026 18:29:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Btwp8BMl;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34050-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34050-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 901E630A6BA5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jun 2026 16:22:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D440040962E;
	Mon, 15 Jun 2026 16:22:47 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E010A40913D;
	Mon, 15 Jun 2026 16:22:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781540567; cv=none; b=gUvo8N0jrM4uZDIF2uxvWaAkfajLYS3sp5ZyeFi8Mhlq6F4q6IdmuVmX4oWL3t/4Uts7A0+nXmKv6JR8G11dh5p5iV83GZsV2kcENfQOjAJA+1q0yry+wmJ5os6cGSyQpJ+NX1aFA+DlGPDJ0rFL68I2pxIRN5tABL0ETgrj0DA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781540567; c=relaxed/simple;
	bh=NNMMkyuns7W3CVSK7S6dgZm53LkcD5YuxUTaUIh8hiA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QTVdrtbkBfTExS2eK6QovdIqZ0hi4Jy4ZMjUnBdl3c95DU+Uf/Po+K5aPKkKtsyySsgXr3eq6ZknfWdVHK4bYh8x1/EbaM6ibW42HmNeNezFg3XWrE4sYj6QTZmdk5xr8SD38bFgz4f4ZHwJAfbcd9drckxyQynblJHh9j/Mcdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Btwp8BMl; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9ADD21F000E9;
	Mon, 15 Jun 2026 16:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781540566;
	bh=NNMMkyuns7W3CVSK7S6dgZm53LkcD5YuxUTaUIh8hiA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Btwp8BMlTOkNCNl2B6fhmj7Fzd6FTFbz1ba0nYq2mFoyY5JzaghmJEn1urjWC4yJC
	 57RLnzoOM0gt7+Jcbw1y+21PB2X7wgxvPe1+2pideJVzrMcqVALybRSiLHYKGZnEve
	 noIxlBCXQfsxzeOafE6bMKkXh9wt1573eWKLCNFn0E4jglKpqloMEu2GjuSo7vFfVk
	 in9na+XueRqIOTiH4OBgxb2CuY2cMnfX/CSguZYR8UKF3Au6Xglnj/9uNlM8jlvkAD
	 MPWaJ3/2tmi+3pPeQyonqnGh3WT58AZmyaDf8XEnfN5zTXxWhDWilk7Jizom9gu0ap
	 7wQ1ZrKuOVjzA==
Date: Mon, 15 Jun 2026 17:22:41 +0100
From: Conor Dooley <conor@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 1/2] dt-bindings: clock: renesas,r9a09g077/87: Add
 PCLKRTC clock ID
Message-ID: <20260615-catfish-starry-189f8565f98c@spud>
References: <20260615143943.1610095-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260615143943.1610095-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="73D7qR4Epe13nmtL"
Content-Disposition: inline
In-Reply-To: <20260615143943.1610095-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.26 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:prabhakar.csengg@gmail.com,m:geert+renesas@glider.be,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:magnus.damm@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:prabhakarcsengg@gmail.com,m:geert@glider.be,m:krzk@kernel.org,m:conor@kernel.org,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[conor@kernel.org,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-34050-lists,linux-renesas-soc=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[glider.be,baylibre.com,kernel.org,redhat.com,gmail.com,vger.kernel.org,bp.renesas.com,renesas.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[spud:mid,microchip.com:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2606C68861B


--73D7qR4Epe13nmtL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--73D7qR4Epe13nmtL
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCajAm0QAKCRB4tDGHoIJi
0hKnAQD78P2MtWziQZtQhxOmsGMny0RGEBF0soeyl/jJJJjw5QD/ZMMjOWbEA5+b
NOokepVBgvG1vYOBh3YtA8cMaO95YQ4=
=z6z3
-----END PGP SIGNATURE-----

--73D7qR4Epe13nmtL--

