Return-Path: <linux-renesas-soc+bounces-28789-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MMEVK+RnqGl3uQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28789-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Mar 2026 18:12:04 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 35092204F1B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Mar 2026 18:12:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 52EC230E3839
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Mar 2026 17:04:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33B1E35F182;
	Wed,  4 Mar 2026 17:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="WMfmVQ5P"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41622376BDC
	for <linux-renesas-soc@vger.kernel.org>; Wed,  4 Mar 2026 17:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772643879; cv=none; b=o1oFy4ADZfqSIJwoi74E5NjidWFNz8WoaDZsD62GljahIX6OLn2z0zmgsN3gzBXiGz31bRy8Yxsvn+IyEbQWQCkSwvPSPM8jU++clm5cGvcqxlh2HQFkxUmGoKnuD6jqKuXUfpkwQ+A4ejyaYO29B9IkzAVOW52fvlaqYOCH03I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772643879; c=relaxed/simple;
	bh=caNVgAbko22YQBRKAA/SlwJ2LxiJSjEJIUPq8p751lQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rsHZy0xJ94aWX8zQK9ZWFcs3xhmPy3dRKtxqjFYdVOc/ZJLWB00c/Al4SEJmJU1mqLMpLg5QDKjTwkMIRkGylx/PIZtnvkxpaTQbpN45Nb8ILcDP5QBow0d9y8ji5+XcjvdzoCNovqF+nDO0Dtt/cA6mmsUBqfNRgwPgkWVToYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=WMfmVQ5P; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=caNV
	gAbko22YQBRKAA/SlwJ2LxiJSjEJIUPq8p751lQ=; b=WMfmVQ5Pr03d1Odibz/A
	Skm77dmCQ20lfikyo4zSTJGIi4T7LeoBIAG8qRYpDPDq0YbpoHk6j9kKsvB9m4t3
	plL1HaxgIVe77YheB3PAULbbPhUKBle+mx1t8rYOhVN9evQL9qxglEjulGatlC8R
	QLqUTZrsBCCBDX3h1I2VZVLsbt8BcYeMbkyhamjFlvnfPLIzWF++4KD5I4eFt0QP
	emf3r1XvNfKqOeJzl3570RGQAc5PTALSFrWd06jqvxNyNQLpZYIzptmNtFNm5LQm
	IvRhs4NEcV1n5dHmE+SXPbCgMeaU53qNtU63/Tkzpn8rmrHDwI/GNGhER7Lqje/q
	8g==
Received: (qmail 829194 invoked from network); 4 Mar 2026 18:04:35 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 4 Mar 2026 18:04:35 +0100
X-UD-Smtp-Session: l3s3148p1@Dud30DVMWCFtKXFP
Date: Wed, 4 Mar 2026 18:04:34 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
	Chris Paterson <Chris.Paterson2@renesas.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: Lack of review from Renesas
Message-ID: <aahmIijr9PT36Llk@shikoro>
References: <a3f0cb6c-cff7-419f-839b-13bb1ff4960a@kernel.org>
 <aZW0GL8ufBgZlUbU@shikoro>
 <aagmDTa3KM3EYx0N@shikoro>
 <8efddf8f-a9d3-4c29-b54f-201304339843@kernel.org>
 <c1a7223c-42d3-45d2-a57d-6d990e38a78a@kernel.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="V0Z0USM99W4u5Y0a"
Content-Disposition: inline
In-Reply-To: <c1a7223c-42d3-45d2-a57d-6d990e38a78a@kernel.org>
X-Rspamd-Queue-Id: 35092204F1B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	TAGGED_FROM(0.00)[bounces-28789-lists,linux-renesas-soc=lfdr.de,renesas];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[sang-engineering.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[renesas.com,glider.be,bp.renesas.com,gmail.com,vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,sang-engineering.com:dkim]
X-Rspamd-Action: no action


--V0Z0USM99W4u5Y0a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> That's pretty convenient actually, thanks for the idea of less work.

Yes, you having less work is in deed the whole idea.


--V0Z0USM99W4u5Y0a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmmoZiIACgkQFA3kzBSg
KbZ81RAAiFhZ0h5IMUM8UBCfu78sdLMBeC9nA/UZmp3TgS73Ew0CX0eI7q1laV0O
G9evdxY1coPqTUGqWUjVT4ZO/0N5JwfkZuo8T/9mzXn9Brhln7XTtsWOHznbWC0p
VkbtlFEjtqZPiwS7CjWcFGh7Qg4PBu7P9tNvZI8s/IaNxkvrsSijifS3KrujLjr8
ACVTK704ZUU11q7axwHSyOryn1h7yRijoIE1p/DbFV7BA0ATSAC3FadEhrX/Shfn
dn5LgKp3ezgqBfc9Rd4FkO0hmc3bflXUu74Db+Jey4m9hp90CHQxkvAcjybR+abl
VjbFYfj4uSb7dW5BUA9Nb817jYLuG54RxAInTjbvdO2qpYxS47sWmfPUCAHy0CwG
BAx3vI3qo0qrgebOAQoiE5T6MVQJoaUTXDyOXlH9uq8L+JXzxMSqzbibHew8zKBX
FV1WTAQNQklv270vch2FOXSaHiq9TPP8M4a//VfD5/4bsckgC3Cnr0CtbaOrYH59
ojnpAROyXbEE9KdTB/DxSYUSaHiKixCKtYaxZa5krivLrBUXg7bT3oWCo1ZdIqVy
XYlreQTcuPSvj8yHaF7j/OALMtF5HL+VFriUIEvmEQoxnAX8K240/xITGRXNGd8Q
vN1h3NZbxKMxQ/QVVpg+yLbn0NyK6BSp8NOJ9sY5Qkh1Q0RoEzk=
=5yfL
-----END PGP SIGNATURE-----

--V0Z0USM99W4u5Y0a--

