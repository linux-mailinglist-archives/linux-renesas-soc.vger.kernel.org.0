Return-Path: <linux-renesas-soc+bounces-34160-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7ltFLFuRMmr72AUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34160-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Jun 2026 14:21:47 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B5CCB699AAA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Jun 2026 14:21:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=sang-engineering.com header.s=k1 header.b=WkefzqrQ;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34160-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34160-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5CE093004621
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Jun 2026 12:21:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EA6C3F39DB;
	Wed, 17 Jun 2026 12:21:36 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 792AA38E10F
	for <linux-renesas-soc@vger.kernel.org>; Wed, 17 Jun 2026 12:21:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781698896; cv=none; b=TiT+WWAhuuu0+crVkduXVhQgr25neFJLoFAITzk09v/PTFc90TlE85X6f4q9HNlv8UF4ZphQb9v3ASuE7hK9JpF6kSJ84E68pThXut0/Kw3Y79psvPHr9hJ36FE4YuvZIDzwdfZq+lc+/QzJPF7qo/XDzdOvyeN8djDX3AkREU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781698896; c=relaxed/simple;
	bh=TvGs1xYMMyeNllFhYN8S0bdscHxRJbItlrNVJfrh//I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EWjbAcXMvcdpQUUsH3R1hXjPE5UjP2bO0J54rkM0KidHVUCU9waNVN9ghpoiRcayMdyCQeiEx5Lfdtv00Ym7h4n2Qj3KMUVRlB2YOmdI0dtisb/WUKckcuf+biklHFw4TgXHcUQTk1AbWyO40eDkma2ie1trph9i+4oDPHrPPGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=WkefzqrQ; arc=none smtp.client-ip=194.117.254.33
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=TvGs
	1xYMMyeNllFhYN8S0bdscHxRJbItlrNVJfrh//I=; b=WkefzqrQFCJ6vVPGA0Ij
	9k/xQZmjG3B5FNi0Pe9WmyM3sfPMjpFWEkDo/vzkATc6qt+ZwcLKdx3ZvC5uY+xj
	KXevnafVXgRWVPeQ5ljcllFhtbHHh+VNa2rhExnqyyvxKfNCsu5OoHlzeT6cMOpV
	3TaXvggjPiByKiwN/3L4M24hcYt0EM2YPj9GkPl8UQ//asg9A3SBKTYhYefxy6/Y
	2K+XBbjNOaW/rodJfO7DC77DKnLyAfPWpO5oC3LoHuEht6caIlNWQ4EDsGENSjCb
	fuH6eZhz3f05O8VCNsg6XLUk+QkUmuYkMAcxt1msXVyoSvp8XVKKkYUBq3EhF+Iq
	Fw==
Received: (qmail 160927 invoked from network); 17 Jun 2026 14:21:32 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 17 Jun 2026 14:21:32 +0200
X-UD-Smtp-Session: l3s3148p1@oj6RGXJUiJgujnvI
Date: Wed, 17 Jun 2026 14:21:32 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Biju <biju.das.au@gmail.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>,
	linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v17 05/17] mmc: renesas_sdhi_internal_dmac: Fix
 whitespace alignment in struct initializer
Message-ID: <ajKRTA6JunfWTACv@shikoro>
References: <20260603065731.93243-1-biju.das.jz@bp.renesas.com>
 <20260603065731.93243-6-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PN2ULZANnQ+cyghL"
Content-Disposition: inline
In-Reply-To: <20260603065731.93243-6-biju.das.jz@bp.renesas.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:biju.das.au@gmail.com,m:ulfh@kernel.org,m:biju.das.jz@bp.renesas.com,m:linux-mmc@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:geert+renesas@glider.be,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:bijudasau@gmail.com,m:geert@glider.be,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	DMARC_NA(0.00)[sang-engineering.com];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34160-lists,linux-renesas-soc=lfdr.de,renesas];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sang-engineering.com:dkim,sang-engineering.com:email,sang-engineering.com:from_mime,shikoro:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,renesas.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B5CCB699AAA


--PN2ULZANnQ+cyghL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 03, 2026 at 07:57:05AM +0100, Biju wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>=20
> Remove extra tabs used to align .of_data and .quirks fields in the
> of_rza2_compatible struct initializer, replacing them with single space,
> consistent with kernel coding style.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Should be merged with previous patch IMO.


--PN2ULZANnQ+cyghL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmoykUwACgkQFA3kzBSg
KbbvwxAAn+5JL8ajUK0ZH/CylTJC1KJo3SlfBtmkUE+FXw7QbmRSuy+JxPLFG0G+
FiV0Hu7Wj8sjZM5mDSwnRyCHMaxIrbozANYCMzmdZf/Kvpi5a1yPSsXxB70Jouma
PxOhWoN4VVlTbwd78Uibwj8Fl0PqDCMlvdw/CWq4KnfnmRK5HOgjhKR80PxudoMl
P9mO7LlqOcD6i6Bw7VtaiPnZTOA9EAvNR48gkxpoHIeg/KYkCdR7kLCJKtJlUT1n
/Q/+0k5EA3Js1dkwhMfTuObfURmSi4IYQcnZ2N1k62CnUIxC0qepzS1HjKbFMPTO
67ffudile8SXekiYzCyM0FiM4h9jBChwcQClSUmb5x4YnPMrfs0j5x+GKr+X+qHH
6+r8VsLsrF20HaJB+BStX7ctEukQCQ59G6PGdWizD0yJesPt/vGj3sWhnQSgpamz
NbTrUMRB3XB3PK0aURl4xSeUc597u2oUVJolU8sIV4u8/S351DZ7Vq9rJWJVsLrp
M5thkj1Uet1QDkzVpineGK64TiC/O6fO4lPc8JxGi1Vlu1a5u0wBKsPI65cPjnk1
teaApmaGHYveSiwwyuPWDjhbA1mZgvbVbh9JUkHkCyoD7W/QpcgNtG7nUz6bE+58
iV6MoAyC9LuMg8ZshVbxq33XNJt8YRVPRGUHwqT5GauJ/J0wmbk=
=0P/+
-----END PGP SIGNATURE-----

--PN2ULZANnQ+cyghL--

