Return-Path: <linux-renesas-soc+bounces-33495-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cKCREC7XH2pbqwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33495-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 03 Jun 2026 09:26:38 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D5BBD635308
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 03 Jun 2026 09:26:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=sang-engineering.com header.s=k1 header.b=D8+tQfNv;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33495-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33495-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 904CE30561AF
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Jun 2026 07:19:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4093839D6CA;
	Wed,  3 Jun 2026 07:19:30 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5CCA39A4D6
	for <linux-renesas-soc@vger.kernel.org>; Wed,  3 Jun 2026 07:19:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780471170; cv=none; b=BlG6McWzEGtOHnY02U+DXVmzMVdGHWi9hF3WfXYELzuQThwxTPpFK8stmNwW4pviHFig7QdwmF1lfKxKrNXwmTqp5FSW2/PMcidjNI/Qj+oZzmK4i517lsGhDudU/9nAJS9IqENrVQI2YL1kbERZELb2NTjFhgh5Vw71xt7jeGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780471170; c=relaxed/simple;
	bh=isQWyrVE+AEdcnOVp2BzHrZyGYpDqrdcau8Wk5dWc3U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oqwxgfPwswub5jMujEsu49vzaPMq/WZKcVeG6QWi74mKsvoeyBfypq5JAv0jhpYJWP+BzK4Iskncf0rgkMGAQlP2A+jrZBzu9EZI6woPp8EC5IU0oSodOl8KIkyd1hGOQZAHfvPST2LsqjQutPsFrYDO7Iv+x4UMZBmtBH/SRo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=D8+tQfNv; arc=none smtp.client-ip=194.117.254.33
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=isQW
	yrVE+AEdcnOVp2BzHrZyGYpDqrdcau8Wk5dWc3U=; b=D8+tQfNviaIlP8oA5l4c
	COhQq+GSJTh0YqO+zVgiEav5w3rU/aypfE12u5i6awlrNItZaK0jRbzzPuEFepr4
	BfiujfgAn/pHca2hRULimJrI91dvwXlS8mF8H2p6Too77heEWLjjj+qREIyjqh6a
	KnovaW70iqWZHgf3hsdjAbnda/XVd42JlydJfGfxWe25U/ZhET/WkM5eq1R9kLDl
	yz1tIGzVUkZZFbZNiEvX8bibv0ArqMZAiEUrYk06LmHEQ1JdtMHD6ui2PoWr8QaE
	QuD7u2YpuWIT1mM999vkmj+ZjHsw4ozdtw/4XaMiyzzhSLbrGA4v+R5aLtu4DqZt
	Iw==
Received: (qmail 3173096 invoked from network); 3 Jun 2026 09:19:23 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 3 Jun 2026 09:19:23 +0200
X-UD-Smtp-Session: l3s3148p1@6iQ9P1RT8pAujnsK
Date: Wed, 3 Jun 2026 09:19:23 +0200
From: wsa+renesas <wsa+renesas@sang-engineering.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: "biju.das.au" <biju.das.au@gmail.com>, Ulf Hansson <ulfh@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	"magnus.damm" <magnus.damm@gmail.com>,
	"linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v17 00/17] Add Renesas RZ/G3L SD/eMMC support
Message-ID: <ah_Ve65DvPhlTZ7a@ninjato>
References: <20260603065731.93243-1-biju.das.jz@bp.renesas.com>
 <TY3PR01MB11346485C16AFB6299B1711FD86132@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="E+zmNv8waiDrnk90"
Content-Disposition: inline
In-Reply-To: <TY3PR01MB11346485C16AFB6299B1711FD86132@TY3PR01MB11346.jpnprd01.prod.outlook.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:biju.das.jz@bp.renesas.com,m:biju.das.au@gmail.com,m:ulfh@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:p.zabel@pengutronix.de,m:magnus.damm@gmail.com,m:linux-mmc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:bijudasau@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[sang-engineering.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-33495-lists,linux-renesas-soc=lfdr.de,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,glider.be,pengutronix.de,vger.kernel.org,bp.renesas.com];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp,sang-engineering.com:from_mime,sang-engineering.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D5BBD635308


--E+zmNv8waiDrnk90
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> I will fix the issue soon.

No need to resend from my POV.


--E+zmNv8waiDrnk90
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmof1XcACgkQFA3kzBSg
KbagyQ//YbOXNDZ8LY7TvmANTK1JEeI8QQ20H9VxQQ1tEBdsu9UKi6Ejc2lUDge2
GTMxvGyjVJkFhpEkwfOrswLpaaAsQKH3peuQcDMeocXy/W7Q97xWinAfOnZwa7EW
+TPLPOc/3fmkQa2a+00j2yoRJ6awF8Ek60g9bAVbp4nUQ/A5iCAPWfabUrcXdI5w
o0nEx4t5wOdX86brXnW2B/wAXw8ul8bXeTc1O0wbD9wUbbpoQtZawIG0g02SKgro
b+porJrZQtFGdGtllUJhH0bvD2b4NHFq926jPVNP+v1JELgG1/H2QvJLMdnGMJis
Kkh8bXh14QERURdW7JleZnErxAi+4X5s2PX3cZ6nr+nAq3IoeHMdyc9tJ85kKNus
wnzBlWTvcbEPiA8iLr1bBXJ8j3DKJxIye/gYPDXbNki5ee0D8KxFjZdl3UtAfsWX
ilK4pr/1UaLm/nml3eEGipGUejh9OVHDEi2g8rXs116zU6z6KkMmaInaNDBTyFZa
N0TpRmducyocbUiAqi3O9FqPBv29/2YNrjDmnSnYo/IQDiwYQBiCy9CFV4o1EoAl
5AJd2Qd0kF1QCFH46CQLPs9t1T6lCvcprhFQi/wRPvwr6rXlNWNustP3yIYZk8ah
gz3XquRg/k03ZUIKMbEOVr3EOe9iOcj4xQ8wJILJazqHtGL5OEk=
=5yEy
-----END PGP SIGNATURE-----

--E+zmNv8waiDrnk90--

