Return-Path: <linux-renesas-soc+bounces-30731-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OOWyICRDzmlQmQYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30731-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Apr 2026 12:21:24 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 802E6387A0E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Apr 2026 12:21:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C2C703047D44
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Apr 2026 10:06:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D058F3DC4A0;
	Thu,  2 Apr 2026 10:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="iEg0hZ9N"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E67B83A4528
	for <linux-renesas-soc@vger.kernel.org>; Thu,  2 Apr 2026 10:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775124415; cv=none; b=ZSAxw6FeKU+YTu5yK5pJs8LfqdX/FdJvdmcWGBoIGBx2Y6M2SSHvN1UV+zAdZqfCHxTs9qtQnw6SYrd+NR8Def2RoRPqKVcZmER3QvE1A3Z+I+K2ljUWzeZDZirFseVbnfl2hMsbfRMLNi6oOj+uDfkg7vqgh4rlHTNiZAHrYMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775124415; c=relaxed/simple;
	bh=FEqOTX0+MX3OvcNh1OKo0TLHzCD1SesruAzAzW67E3g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nZSTwCyftCloZq+GXn+wSvBp3NkDJSgXvjhHwojBn6uYKf8HZvyz2MkKoFTpx0v49/kUAOZhJvimCSbwsf2JqCIgKCgVm7LE0yNjkrJLF7GUEVO60PAcyA/ULLi6cuieCJP31ZTel8vVx4nIfW++dlcnufWxvY6PyVDwcbyyDJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=iEg0hZ9N; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=FEqO
	TX0+MX3OvcNh1OKo0TLHzCD1SesruAzAzW67E3g=; b=iEg0hZ9NKhwU6q362ls0
	UaILA+MMkgq/32CPsGcFR1R9fm5XwPx2fGgn/t9zNFcjzQP7+mvxkDeUtHJaRbgA
	w+fd31LfvjthfB2y7JLVVSi5wpCu8ErXRsALaFB5zC4ZdI508kgd2LrRHjyhBdaj
	46UvtCTrm9QWs6MMY+ULwgyQBVj09JQW9v+3f/3b5VbDnwW/hmPber3+CUOYJc4R
	b0bCUhHfilzo2tcHASYewkUMPuP+e65Dv602lo/zbLzr0YIKP+qFhTvs9th2Ve1Z
	NaFQdhgpyfHUqjATbO8WjgfznL4v2Heq5GiCvJrcZDR1Jt/OGa0f6Ln4C88kU446
	Vw==
Received: (qmail 2451725 invoked from network); 2 Apr 2026 12:06:42 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 2 Apr 2026 12:06:42 +0200
X-UD-Smtp-Session: l3s3148p1@h8FmW3dO6GdUhsJN
Date: Thu, 2 Apr 2026 12:06:41 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-renesas-soc@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Marek Vasut <marek.vasut@mailbox.org>,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: soc: renesas: Document MFIS IP core
Message-ID: <ac4_sXOdlZSr09qm@shikoro>
References: <20260331104527.29170-1-wsa+renesas@sang-engineering.com>
 <20260331104527.29170-2-wsa+renesas@sang-engineering.com>
 <CAMuHMdVeecbOGg=BmE77TOPiZJMUYVMVZe5CarAevG==2PY+sA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="P4BXCcWzd+pdv7uw"
Content-Disposition: inline
In-Reply-To: <CAMuHMdVeecbOGg=BmE77TOPiZJMUYVMVZe5CarAevG==2PY+sA@mail.gmail.com>
X-Spamd-Result: default: False [-1.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30731-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[sang-engineering.com];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,mailbox.org,gmail.com];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sang-engineering.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,glider.be:email]
X-Rspamd-Queue-Id: 802E6387A0E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--P4BXCcWzd+pdv7uw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> As these don't impact correctness:

Just tested it. Works fine with these lines removed, so I'll send v4.

> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks!


--P4BXCcWzd+pdv7uw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmnOP6kACgkQFA3kzBSg
KbYdPw//VCVw3hlFMsHtyY0lvZfaA/gQrF0g0gnQqojbdj3c4WcB2pZwjfZ1ggf9
XZLS8InJUjOyICjiR1sOrgo6FJiJMJdBkyMHKpeJW8/WgAvl4iJqAr1DnmFOolDK
xnnMYP0ozFadFvTHK70A5wjYg4HuRIhV/LPy88GkG/dUcD16xumcSppd3RA6ZeuC
wHucpUqO8b3eJbtJQjtCq+ZEqWxIbKKR2PLXiGru3S5HNEN1kHIu9dQHBrBoVevU
AkdlPlnTDSn5TRC+1uinp7PqnRpLc/gxrbovLsi7lUQWLV3uwnMfuDx+47riZn+S
CuHB90mMtPScyejKZ8Lnro+Q3Mb1TiA9mJHM/Jc7GcFbInLSjFCBUOczK32MlOnC
3y6YoH2VpF1ayFCf4hxrC4czWpH6Ag7C6JHlhMShB1xAKFjw0YfoKZXf7rDC5lYF
06E9BIdGES3kOD7socUtQmYfonRpHbmfj6ieTS4UDOleVn/BkaNbdE795DgVl+6S
kOH1WgTMKYbycwoyvKQp/ij1Z66beYvp6TsBRWmWmpuZyNCjEFZmsLLXX6cVvfC7
/zAjLA5xz64NrZZ1lICU55qxBTIIO+lJShdAOTStyiZK8oeEwYTiaUU8IDPZ7SWc
7pTbJ9+mBBpDnr81nuOTSD7HBcEgAWhIjWpJimiZMCC4tj8cH7s=
=aDbC
-----END PGP SIGNATURE-----

--P4BXCcWzd+pdv7uw--

