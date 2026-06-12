Return-Path: <linux-renesas-soc+bounces-33944-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7UMTDNU3LGp5NwQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33944-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 18:46:13 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2337167B0AC
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 18:46:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Kk4bDBKZ;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33944-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33944-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id AFBC1302BC94
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 16:41:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 101383FFAAD;
	Fri, 12 Jun 2026 16:41:26 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14A903FE65F;
	Fri, 12 Jun 2026 16:41:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781282486; cv=none; b=t0x4AlsNJ/BqUgOYWf5dofPMQa1kT3PkbJCVCzCt7WapFDiCmUkrDtrEHvZtJ2Ngdhk5YxVJNWXaExpnhW2YjdQ2dIFRQ7izT4hY9XQ+KMi0WrZdJW7d1CJ71nqpStOuhfpf+NaH4J58K9KR2UEmZ/3PX+rCxyjNr0w6u1Qvksk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781282486; c=relaxed/simple;
	bh=hpIOFq02kqJlChjw+UQcihDpokRd9fou6FOwtsRenUQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RGiJileTfUDag8tMdg489JC6OCPCRnaaU5BlqFUAUUyiiw91f6zPn7IgpKiZov9Q8yRCQkqZ6qhjO6cHd3eZSYla8xh0Eb0L4VeFnEpo0k+EfaS7ON4svbpQ1iVIkOd9Wpvd0KIAA4RnlFfUkvGqBrTRpbjBhSDQXKssEHispzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kk4bDBKZ; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 804C11F000E9;
	Fri, 12 Jun 2026 16:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781282484;
	bh=H6VSC3WKELPd1vO7ngpqqEQy2JlL/CllqgvI8yj6l6Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Kk4bDBKZqjNkLC3tSiq0hps9LjFbfbWci+mM369v/l4k8uE7AdNDr1YBQK1oeYRde
	 OAR5nw5HVAJtDXPtTd5LrptPTsp+HJpIncCT6IoIkzvlHbg8cS0FTK60lfBKd19weY
	 B+MyXzq85KBzgZnBWM/M8GhcCSzptqJiSD25XDiqQfzWltZsTrHJR08+/qnA7LLeRw
	 CSwLa8mGVv46VmTIQdnq3t25Pb1Ah5kh+7/n2gfp8CQ76Ai26e0/CnPK81yZrsy8Zz
	 uzGsiTWiKEQ48GDnjoeRPYQUYKXfrldplWVoUYlVqe5mX18aHEzwLV7in/n9h+XUKd
	 qnkKxDMmOQ6SA==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id B20DB1AC5AC2; Fri, 12 Jun 2026 17:41:21 +0100 (BST)
Date: Fri, 12 Jun 2026 17:41:21 +0100
From: Mark Brown <broonie@kernel.org>
To: Biju <biju.das.au@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>, linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 07/11] regulator: renesas-usb-vbus-regulator: Add RZ/G3L
 VBUS regulator support
Message-ID: <aiw2sePsgDK2pDdN@sirena.co.uk>
References: <20260612143048.317907-1-biju.das.jz@bp.renesas.com>
 <20260612143048.317907-8-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="prfcgpyF4G2Ul5+f"
Content-Disposition: inline
In-Reply-To: <20260612143048.317907-8-biju.das.jz@bp.renesas.com>
X-Cookie: Nice guys get sick.
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-7.26 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,bp.renesas.com,vger.kernel.org,glider.be];
	TAGGED_FROM(0.00)[bounces-33944-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_RECIPIENTS(0.00)[m:biju.das.au@gmail.com,m:lgirdwood@gmail.com,m:biju.das.jz@bp.renesas.com,m:linux-kernel@vger.kernel.org,m:geert+renesas@glider.be,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:linux-renesas-soc@vger.kernel.org,m:bijudasau@gmail.com,m:geert@glider.be,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[broonie@kernel.org,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp,sirena.co.uk:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2337167B0AC


--prfcgpyF4G2Ul5+f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 12, 2026 at 03:30:35PM +0100, Biju wrote:

> -static int rzg2l_usb_vbus_regulator_probe(struct platform_device *pdev)
> +static int rzg2l_usb_vbus_regulator_common_probe(struct platform_device *pdev,
> +						 bool multi_regulator)

This multi_regulator thing feels not super scalable - it might be better
to pass in a pointer to an array of regulators.

--prfcgpyF4G2Ul5+f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmosNrAACgkQJNaLcl1U
h9AwyAf/b6dSy62ZTm4smDU4sc9Y3OY1vT9QG5UOJZPQjs1rncdhwfjJhypYsDM+
DfOvt+JDoQGSyv9p57eRbXT0+97KOSlSRamQZrHfe3qgTBo0xIMtNcHJ+xZGxCw1
TR5K/Hne+j2636zjLx/Y3T29qNtgyLs5+xaslZcypWpRJ0tC57JOgFqGHONfil69
6EtylIojLnlN68QxLowKldFfiKD66BVwCwPxgDt2zqGuuM9qnXbsH9lsCoGwKMbw
LhdNyqPx4Xja5HqzgZhRLcysIFF227bU0qyo62Vt9ucDl37O5R1IMKdGB2uFZKcx
jimK+cp6eDATGP0NHA+SwPR76hsgiw==
=qppE
-----END PGP SIGNATURE-----

--prfcgpyF4G2Ul5+f--

