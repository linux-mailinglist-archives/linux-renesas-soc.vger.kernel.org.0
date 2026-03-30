Return-Path: <linux-renesas-soc+bounces-30561-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cNLGAIg9ymnD6gUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30561-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Mar 2026 11:08:24 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 49961357D7D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Mar 2026 11:08:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 47D26300D31D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Mar 2026 08:57:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDA533AE709;
	Mon, 30 Mar 2026 08:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="K2NhQP66"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 955DC3ACEE1
	for <linux-renesas-soc@vger.kernel.org>; Mon, 30 Mar 2026 08:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774861077; cv=none; b=r3Ql+/s2TS5SPZGN87ZMYaJvmIfZbKPl7AdWIDx484AyfHw3yQw2r4uFg3a4y3EbZtdr4aR6jL2cszp/B53kkp/l4/atNO0N5nw1aj6msv+DBGfxRq79nRiOcix8XebmCYfsXjpn5tMvBAX0Ch8HT1t12Ypik9nRCn8SLOaFEaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774861077; c=relaxed/simple;
	bh=PiuJ4NPKm2leaIla21yUHpUv0jC6jrC8cGAcxXurbYM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YFrU0HDQJHtDYHgcNp2R5eb0aSQT4ShXdQzoybmWu5tjfzCHzRGRUOYm7MR5/1x7hZ5bm2fm6XKss2hAVfacLENDsi8/EHWGKq0+Jdrvms82Ltx19YNNy57gDF1rR/Onl6P2xapd71MUF0efXgqeiXwTQAzrlx7XHHTBo6x+izc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=K2NhQP66; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=PiuJ
	4NPKm2leaIla21yUHpUv0jC6jrC8cGAcxXurbYM=; b=K2NhQP66jiaRD191B3NQ
	Og06GXhV39NEm+iNeBJuoE0E1R91ZmT9nRTj+t6ieCq785ZZJSoD6cxo8DSOJ8NC
	UeiJD+fok1r8Od4fLeqomYaLXt9GIsiOmvr/NLtRU6eUh5f7kL0Y0bJ5nJ6iy2KY
	x/O5V/rB+NhzHX7TSn19G5KIpRmr50Xl0FGBt0kzeXxqgARN35Y8n+8lBrI6awRQ
	ChAxT7hHW9OiyT4+5yXDU2qQjmwxaacRNo5tc5FXJrR+uEE5WcbcWfMK+nYBo/TX
	63LPP+wsYM5N55OU96GIUlnyKk3wGHRjjQcdfjzrajZjkGSoWwbZdnA2vH9k7uKD
	BQ==
Received: (qmail 1198637 invoked from network); 30 Mar 2026 10:57:44 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 30 Mar 2026 10:57:44 +0200
X-UD-Smtp-Session: l3s3148p1@sDZHCzpO1Osujns6
Date: Mon, 30 Mar 2026 10:57:44 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Subject: Re: Sashiko review feedback (was Re: [PATCH 2/3] soc: renesas: Add
 Renesas R-Car MFIS driver)
Message-ID: <aco7CM5N3E6A0v8v@shikoro>
References: <20260317130638.2804-1-wsa+renesas@sang-engineering.com>
 <20260317130638.2804-3-wsa+renesas@sang-engineering.com>
 <ab-vWbjdlAIt1qaX@ninjato>
 <87a4vyynl2.fsf@linux.dev>
 <acIsrJp2Zq2ntS5f@shikoro>
 <87ikalp9b2.fsf@linux.dev>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5FeGGYkkWdRlJwZp"
Content-Disposition: inline
In-Reply-To: <87ikalp9b2.fsf@linux.dev>
X-Spamd-Result: default: False [-1.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30561-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[sang-engineering.com];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,renesas.com,glider.be];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sang-engineering.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 49961357D7D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--5FeGGYkkWdRlJwZp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > Sure thing. Is there a dedicated mailing-list or better email address I
> > can add?
>=20
> Not yet, but I think of creating one.

Until that exists, shall I use your email to add Reported-by tags? In
another of my series, Sashiko found valid issues which already existed
before my series. A tag would be proper, I'd think?


--5FeGGYkkWdRlJwZp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmnKOwQACgkQFA3kzBSg
KbbAQw/+K+sNhSViCAdjwONQjsludmtw5zTk4O14XLhb4U5MITsCqVRx6SCwcQAv
DvwooBgBO8LWPTdGErjCR5vY+k9bjtcdZPZZcnIHYHITmy9tGXu7hLnvaNkDK2LO
oEpl4KT4wfwUJTvWn5vZYe1N2uEDRVXUocpYvHvPPaTZcPdkbb8dKsCjDuZUmcGq
uwZhQe9eYJ3hs5yhe4MQOymyZt8y6z22Xn0fF8W802QsnzSgELJThhMuiwviSsFQ
+RlnTtwuLKVG2CJ5w+qFGaW2tGZkSLL6YHRmjfFLBQ1uiv/NSa+FM+BLFvvnkEmb
J4ff8HCiMjAq4sgy0nvOlbz0JmS8C/UTD1bj0p/zmGH/JD51aakHLt4OmtkLfUyf
CXnEOvviHf+332JM3kjc08YvsKQGnPBBTINOA7cHbJ9fsDP6Uviv0qF9Y14rmdwQ
sdQ684JQKqERUE8hSBLpf9bQ4cqlLfd3qeCD+3e2SfAwhAagev4MG8+FHzqsd/PJ
WVneRPPUhaCGt1dmKvqzYXEeQWTmFS5SXWYp6p+krob1GRZVOcuf5SceYc3v3QK/
leithhZ/AqDL2YRvRDaptzejmf0YzvC3dh1jtQ8nx49Lw/9fC9DjFU4225HEOBB2
IY/ONpJSglqfCqTjE//tb28va7eo7k5cFeZOi2dyrp+0tkMsVko=
=MPZI
-----END PGP SIGNATURE-----

--5FeGGYkkWdRlJwZp--

