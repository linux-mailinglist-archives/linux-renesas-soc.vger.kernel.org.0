Return-Path: <linux-renesas-soc+bounces-31224-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WPXNOZun3GkEUgkAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31224-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Apr 2026 10:21:47 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 696EE3E9070
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Apr 2026 10:21:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 61C393031F04
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Apr 2026 08:20:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA84E3A75AE;
	Mon, 13 Apr 2026 08:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="WhzwecdK"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4FFA3A7831
	for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Apr 2026 08:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776068400; cv=none; b=E8t3Od5sFvx/dYepoTq37I4HBHDXDPjh4lh51lnBSlukteZo/bx40oNv/zDa4rYvnDXV55opGXXs+NepowfgREDS91CbSG0OAU22VsHlWx4Fl6fyDCkVRwxt7B+uFjogMCVpemPrg2zJtKpX5+Cygdm4qTCmEUX3ucWUvGS9SEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776068400; c=relaxed/simple;
	bh=nkcjafFrKDZFgmrNkcMG7xbdwDnpy6HNaqs609fJgPY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nUfhB4tkQTvJskxtGa9EhSTIlW0LFNZ4h3xrdDaIRkhFFKAEqcenVoo6QniN/8zwogB275fq/Ryg20EwD6CtweA38L41JsFq24x8tWB6KKRdsHZm4NlGM9xijTFO7i8eTsRkNPLLE7B1wlRKiuurrmp9Kl3c73Cfqd9bVdeERxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=WhzwecdK; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=/LuK
	OXt8KZLfmvv0HRbpvMU29rkq84QSF5kzlxNheT8=; b=WhzwecdK6T9H7Lu3+BmA
	53/DfTggzd71znXLJPARFGhqsafs2uuhCyXBrnnNEQsEapGHJdLQfv884GkxQvkI
	paHzIgQbbaKq7xOfL4g8QsAE6xCrmsm8CaAzLatFywpPZfJXspPl06nz7q3+qsX5
	7ND2jO3C/M+m8MLqencJZw8YHDm73EWCylEUF8qxWfUTVi6X7jOXewwxVnNVZwTv
	ifQU+yITvv+ZYGLtpk7zGWuIvJcwEaHxmguIYFqvEcQuFvDKlkF1oVhr1gSXG443
	L/q/2frZSPxK7UtlnkgrImPh2KbOZPchkcVhxcsf1Nj9PPJwSjf9hi+eLFWya623
	gQ==
Received: (qmail 2205691 invoked from network); 13 Apr 2026 10:19:54 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Apr 2026 10:19:54 +0200
X-UD-Smtp-Session: l3s3148p1@E4m0JVNP8I0ujnvz
Date: Mon, 13 Apr 2026 10:19:53 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org,
	Jassi Brar <jassisinghbrar@gmail.com>
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mailbox: add list of used channels to debugfs
Message-ID: <adynKeTJiap_88cj@shikoro>
References: <20260410131604.42267-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OMm5XdIlCDlpyGtt"
Content-Disposition: inline
In-Reply-To: <20260410131604.42267-2-wsa+renesas@sang-engineering.com>
X-Spamd-Result: default: False [-3.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[sang-engineering.com];
	FREEMAIL_TO(0.00)[vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-31224-lists,linux-renesas-soc=lfdr.de,renesas];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 696EE3E9070
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--OMm5XdIlCDlpyGtt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> +		if (chan->cl)
> +			seq_printf(seq, " %3u: %s\n", i, dev_name(chan->cl->dev));

Sashiko has some IMO valid concerns here about the life cycle of the
client. I'll check and update.


--OMm5XdIlCDlpyGtt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmncpyUACgkQFA3kzBSg
KbZa/w//b0jk7EqpDU123lV5PddPWJxAGR3Rt44k0iTCraxqIuzOAUYraO5OXoEV
sFceiZ+aY0PB5uBYrnmUT+f5W94H/77uNKygIxoaob24uUbSpUJWBSttBPxZkaQp
YB+gQNTYTfsrAbwWh8+ChYr8yi5SnK1S/g132ZAMAX1zh9kXZZ6wU0glKZakId8v
MGaSmXu9I1CENjQGnkbKulDrCs5QKLIYb/EbWnvUCpJxoX4YYlo9E6645ZdmlK4c
PM5qUDr0V2J8sn+TKnQHQOWLFwnvmSMerYutH7h1niPn9cSD0LNh16g43psyfO81
SsU4EuVHJHuwr5Oeh9P88IB7Ba2RdKqNgtfhuXnYbkZWJX5RZgOf11RtB8W1TlmH
Y0V39KTYHTyH91cIYe7pNJGnnJJrA4vxmdwvaUOJZkGx+zQbacwruIUf+mFtm28k
ckGfxQTkHgDRHaqTe6fUqxakXvOKFaLbkaiHhKETa3unkPG8C1s+3ynSM/smQTK0
GV9mVVOysghlvfroLx8RcJM3jZroz9l41HHmlWYujGxvy+TJ1ur5GeYUJhSdj+lP
3Ycce2yCcfsTEiJOEhhVfpOLrEKaIo+vikzM5DOAU12tpb5SoVCXO+iCxolzCXO3
FCMRc2VMtbWe+RwHBIYVHnBYfq+64NmioLb54X7XFFm+h6/nh74=
=zPBk
-----END PGP SIGNATURE-----

--OMm5XdIlCDlpyGtt--

