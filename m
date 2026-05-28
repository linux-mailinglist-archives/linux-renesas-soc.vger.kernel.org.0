Return-Path: <linux-renesas-soc+bounces-33298-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gKBgEOBNGGomiwgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33298-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 May 2026 16:14:56 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CFAE5F3810
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 May 2026 16:14:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2E6E3306F735
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 May 2026 14:03:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0681F2D97A6;
	Thu, 28 May 2026 14:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="McxHLS0L"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFB0C2D7D47
	for <linux-renesas-soc@vger.kernel.org>; Thu, 28 May 2026 14:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779977022; cv=none; b=t0x00OFmFBwedn+90dLoqO/iGlzSAR753mk0NY2tKzn7CcrG43PF61ATyqcrMh6YvRDiJHyf0t3EGBjed/pjlkXa83DoJM/mn5viW01xG0tRJtYWlmT6EddC7BrodiENoxnqcUYjbLpvrWhXvYKTDl6tB0PqhYOMEfMzYccuMNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779977022; c=relaxed/simple;
	bh=CSsx0HXjLCj+H35zRjNH/2c7lMd5CrPaoH2+4KWhDbM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HAdj7MI31of8WKxmpgEJIcuct/pIroqQHXTmVkDZjdhne511SSecKuV3V069180SQRSQIjTxLzMpyCDaEiXgNUSqlpnyuF/pooj8b9L+D83B8hQIJRJPw4f0byq9UWtAb7VubcKXNf+PPIwuNSyt/LLNm68KWQCI4y7AzA1bML4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=McxHLS0L; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=CSsx
	0HXjLCj+H35zRjNH/2c7lMd5CrPaoH2+4KWhDbM=; b=McxHLS0LgcSI5TheiVZy
	E3GYA8m7ASTaWnOnTiC1aNYFI5WkE3bpOUPOL7QaMAWRMPMF3uqtnIXPjBMDtMhK
	sV9xIqnzcNRciYrm5yFHtD72Cfgol3I55Bs8/F7vLw2AZLyQUcv6C1yOFNJLWO/T
	m9x+pegCWmT+k476Ta7zrN8qnee9I8ATm7msjhLoFkwJdJI3u6weP2b1wV336ul2
	XxFE5CTp/DB1Zg4ADYLm0ypioajcjgLld/nE8z3HoEn5kOifzPSLcBYE0sAc1+6d
	NUxzfxrzs1ZdaLUaKuf6ZyKf2uMUzcGS3WKDdg270EJhwPvs52A+FEEhebwv59HK
	sA==
Received: (qmail 1060636 invoked from network); 28 May 2026 16:03:38 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 28 May 2026 16:03:38 +0200
X-UD-Smtp-Session: l3s3148p1@xVjWMeFSlpKSAB9x
Date: Thu, 28 May 2026 16:03:36 +0200
From: Wolfram Sang <wsa@sang-engineering.com>
To: Claudiu Beznea <claudiu.beznea@kernel.org>
Cc: chris.brandt@renesas.com, andi.shyti@kernel.org,
	claudiu.beznea@tuxon.dev, linux-renesas-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] i2c: riic: Use the "dev_name:irq_name" format for
 the interrupt name
Message-ID: <ahhLOPEmI0g6m1Re@shikoro>
References: <20260520131206.932050-1-claudiu.beznea@kernel.org>
 <20260520131206.932050-3-claudiu.beznea@kernel.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9omyMXJyxjzhq7t0"
Content-Disposition: inline
In-Reply-To: <20260520131206.932050-3-claudiu.beznea@kernel.org>
X-Spamd-Result: default: False [-3.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[sang-engineering.com];
	TAGGED_FROM(0.00)[bounces-33298-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sang-engineering.com:email,sang-engineering.com:dkim,renesas.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 7CFAE5F3810
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--9omyMXJyxjzhq7t0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 20, 2026 at 04:12:04PM +0300, Claudiu Beznea wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>=20
> Use the "dev_name:irq_name" format for the interrupt names. This makes it
> easier to identify interrupts in systems where multiple devices may reque=
st
> interrupts with the same name.
>=20
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Looks good. I can do testing next week.

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--9omyMXJyxjzhq7t0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmoYSzgACgkQFA3kzBSg
KbboEQ//ZUGahxpVIx4ciP7YEPQyAfjqEEvERzzH32bg22BdAbza+2He/YeoVkc0
MOK5qrG8zGUYanipPJPOqz570RbJ0sA4H/+wpiESG/66dK1JDgpjW/ticYD1BvyL
Nukg6yWBzVTThIE5TMGN5ZEQk/GN0gw+e4u30Lk2C2rUeeo00s5EvtYNv+LzyXN6
2C5tSA7JwrDjkIl9tayOHOkYJWX6/U/bwgt+UDn7QXBdGFGFf+KJFefZgBDTD0uA
nnLeECNvlwpwwAK2+7gblTOjDnr+53gvkEVx+1muupJID1V6QdYGryd/x2lLdcaG
YOCrcFelRv0PTp1QnKxkGscZcA3wi6IVbp3+MgiRSOMXJtQohC2m4AXg7M6YIfxb
yL8wnzPO+BTovZ5C7LJb5bEQ5YP16C6bGkNruv4r5MJT3qn1JQtQuVXUcqb1ZcFP
+fV9/eV6xB8ofU9eTixB+1U3KQoxFGIoVSThm607RDBuBa5AGGChW57LV9EWsSjD
R2tgrbp5LwyxpZtGTo02dHxcnQT195XQRQvxABhmU/XD4CkhiEds9+S5rwg6b7Jb
XUrt30KLRrJ9QNIkDc426Q5uTKTF148XlLqlmWxMW+BcYyuruWdckNDkq3CNePEE
xbLpEm77GnnIJmHRQAGWinNZ0n4JFw2eWRM0AGPkpmm9TBcXW58=
=m2B+
-----END PGP SIGNATURE-----

--9omyMXJyxjzhq7t0--

