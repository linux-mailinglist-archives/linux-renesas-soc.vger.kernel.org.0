Return-Path: <linux-renesas-soc+bounces-29179-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UBZ5AjEpsWkBrgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29179-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 09:34:57 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 134E825F693
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 09:34:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A1D1A3052CF1
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 08:30:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E80F3AF658;
	Wed, 11 Mar 2026 08:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="I3QH+Xuc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B5A535A3B4
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Mar 2026 08:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773217776; cv=none; b=XE7EGjO62ZAKESg35f3xecehWNYG6/xAQlCagFt/zTiRFgJgp+pTAkxxnfaoljcyxapY3Y8B1tFvb1nJpOHTVtUuazZAVJIK0UJnGEskl7tPG89KRFYfHlmtIMqtIb8kemwelwrfDo9QnRxzuLo0RW8d0qcWmLCHs173NO5InZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773217776; c=relaxed/simple;
	bh=gwlTfr7vU13jo+B7K+RhuMhIRQGNp0Y8x670Pk/RspE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t0kAZZic6zVXc8WVFj42aeIlF7qeVrVJuEAd8f7J5MGmf3Mtkh8bRHw3rdFSuuS+OAaW/3NHlMAvY44/jyQjkirjd946kfeItYmeFCSTWKqG1hE71oVPvmkhVyhAnFJTeY0L81rSTUHmVNrfXF6b4455MgXDvNNKisIB6u2Dnp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=I3QH+Xuc; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=gwlT
	fr7vU13jo+B7K+RhuMhIRQGNp0Y8x670Pk/RspE=; b=I3QH+XucnnyTu3v7yH8j
	ihOj5m1rSkSks+vcXyXsR5iKjTHh8TUs2HsPGNDncaW+mSwXMhzK57rLd5BDuzFh
	1dsAG+4ZuoQNXj6GNwmnG7g3+ZAepdKpSPg3vx/XCJ6MnCqzy1X20j9HvjLw0NZm
	l28WH5fMb8FoK2KLbAPKUw603nEXtaj5nGwZY3GEAw96uklmQ/xUa8nkScJ1HUdh
	xZ+WMnp52obrycbz5uodYZOsD6NKzethSB2XSORsW3XyVltJ/m9swJLkAg+yXrB0
	Lmwb46ObjK0aO7/rDpoP2R7slyRrZZpiOR7rSXTCAx3nrTHOqkx+vOWTE14fdr9N
	Vg==
Received: (qmail 3563424 invoked from network); 11 Mar 2026 09:29:21 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 11 Mar 2026 09:29:21 +0100
X-UD-Smtp-Session: l3s3148p1@sjW/brtMZrQujnut
Date: Wed, 11 Mar 2026 09:29:20 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pascal Eberhard <pascal.eberhard@se.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH] ARM: dts: r9a06g032: Add #address-cells in the GIC node
Message-ID: <abEn4La90AJTthjj@ninjato>
References: <20260303102029.147359-1-herve.codina@bootlin.com>
 <abCWATS9MiRhcqlM@shikoro>
 <20260311083021.259ffc9d@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oGSmIdU1e1wqyPhk"
Content-Disposition: inline
In-Reply-To: <20260311083021.259ffc9d@bootlin.com>
X-Rspamd-Queue-Id: 134E825F693
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-3.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[sang-engineering.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	TAGGED_FROM(0.00)[bounces-29179-lists,linux-renesas-soc=lfdr.de,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[glider.be,gmail.com,kernel.org,vger.kernel.org,se.com,bootlin.com];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Action: no action


--oGSmIdU1e1wqyPhk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> I compiled the dtb with W=1 and CHECK_DTBS=1

W=1 adds extra warnings? I am surprised I didn't know this yet. Updated
my build scripts, thanks! Confirming the issue.


--oGSmIdU1e1wqyPhk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmmxJ9sACgkQFA3kzBSg
KbYE7g/+ON2Zj2rgKu1i5xUsyQZHtpmT1Z01qs6mK8hgSsCaAsH5+4nJ2pKzhb92
7baPPzeWQGJXPjJGDI9mUqfDcPaE+1FJ9Q/keXwIyUWqxTYWR81pHx3u3TDr/vMw
X6lAMr1y3k3tOtlXWFbMyzV2WEPY63e8Z03MeWq937SGyry5Kbced1d0griUKiBk
+bwU8NBftpX1Ju+Eq9ZDAwbIZninS5dPcgEMrR3TJU7Fee6dbN8bjjwSRUxR/iBI
6XPZ1PD56VH3caseUDvVPpOfBFuilWz0AxU1iJ9qji9G4z6VxoC63rrrG5xCVt3C
PkDW0gS8K+clydtabvrQPJVfJFIGL52F1vAsbSk2NVxDxSoRCNAczlY16jorKolc
NxjDkMfPb8nn7kzQgIUmILcP6y07dbSS9KiSA4k0CB5CIfQJqR2eZFVFBe+1AjKs
4nINsNVx9iWZ5aFa2geL32U7+QyOAJgv1ij++H+ymu3vkJXPOum4oBtXywnoj/DS
P734yI78T8J9WyFl9fmQW5x/etUmSaiyzv7iZ/NqyvydARZJG5TvMEkJtH4JOkLf
HiCWGRB89VnH5/qm+vNWpahR3e+aM5FpL77b4i7kX7EsccVdWFqxYikc89Evz3fc
lAE46ydZzTAFA/Usqh/Xgy/r8lWZyQkqDsJtbXooOf9PgtFtd0E=
=0thC
-----END PGP SIGNATURE-----

--oGSmIdU1e1wqyPhk--

