Return-Path: <linux-renesas-soc+bounces-30619-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wE/QOKp2y2k3HwYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30619-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 31 Mar 2026 09:24:26 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FBA9365188
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 31 Mar 2026 09:24:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id AA614304057D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 31 Mar 2026 07:18:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EB093A3E61;
	Tue, 31 Mar 2026 07:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="J9Tuh0Or"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D1D1396598
	for <linux-renesas-soc@vger.kernel.org>; Tue, 31 Mar 2026 07:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774941490; cv=none; b=OYsVaTprVWe1EdpxSrW8YN2svFEmtwB/fg7+DGRVUDmHPpY/VzPPNfpYvv3jQXt1a5f2RGXlCib56nCcMBWnRBBtWqB1f50+bnr28IXiBLEQ0hZdgJt3vAAWHbQjCPMYqs6Xh4I8QwVYKJo/u0vXLK4yhENxWPU9IfMQafSnGRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774941490; c=relaxed/simple;
	bh=cimXkWUdkk5b9oxVceiRqqigTs5T3aol9/4LoAcBTWQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ztu2Q66WIIAp3ZRb6mshZDFygsHTbdI1nbLNao31Rk1q3YHZ02s0/HF1KohPJEH9q+h7qd6VaUE08M2DkHQqIqtCKzwIvrpGhrAE89Z+lJIndkcqW8ChaLAvreysLriihLbiE3PQbIJcRMusW90G3t5ft7yvLdNGLz/0HvopTvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=J9Tuh0Or; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=9NzM
	r6W8TQkI0N4T4AOLc0N2j7MJivziyDU9EpcgLI8=; b=J9Tuh0Or0PZDTm7zOd66
	PEs7JDQDBU/g7iGrxvr5ZwlFq7WE3Z4bkGUrpqpke/FsibkJNP0VvW66s3lgSvlS
	6/4zaiyXRGppBuOctfIFL9MRWG4yD19vbCitJ+lsgmZJTa26KvasbfuoPphVGE7Q
	QsgmwCY0YrUI6rlotaZFgtTbpn9ATH8idZwxSiRFRmjlM4x05TAbDCyzK3dgJMLN
	1Hw/6EB3+26j6/hL40QKncF1r3A5dHOTIVySFxOfXsG/KJxyvnnvl5MohyQnq7J8
	62cXLJa3oUMuF/N9Im6OD7JkeuL56/4OX7TCud9f9OE26dWBkGMmAALAl/exyC7x
	kQ==
Received: (qmail 1580210 invoked from network); 31 Mar 2026 09:18:07 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 31 Mar 2026 09:18:07 +0200
X-UD-Smtp-Session: l3s3148p1@Jw7YxExORLsujnu8
Date: Tue, 31 Mar 2026 09:18:07 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Theodore Tso <tytso@mit.edu>
Cc: Roman Gushchin <roman.gushchin@linux.dev>,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Subject: Re: Sashiko review feedback (was Re: [PATCH 2/3] soc: renesas: Add
 Renesas R-Car MFIS driver)
Message-ID: <act1L-2tQV4fHyU7@shikoro>
References: <20260317130638.2804-1-wsa+renesas@sang-engineering.com>
 <20260317130638.2804-3-wsa+renesas@sang-engineering.com>
 <ab-vWbjdlAIt1qaX@ninjato>
 <87a4vyynl2.fsf@linux.dev>
 <acIsrJp2Zq2ntS5f@shikoro>
 <87ikalp9b2.fsf@linux.dev>
 <aco7CM5N3E6A0v8v@shikoro>
 <20260330135050.GD22278@macsyma.local>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Ej5xfyCnwyWtSpC/"
Content-Disposition: inline
In-Reply-To: <20260330135050.GD22278@macsyma.local>
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
	TAGGED_FROM(0.00)[bounces-30619-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[sang-engineering.com];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FREEMAIL_CC(0.00)[linux.dev,vger.kernel.org,gmail.com,renesas.com,glider.be];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.993];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,sang-engineering.com:dkim]
X-Rspamd-Queue-Id: 0FBA9365188
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--Ej5xfyCnwyWtSpC/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Ted,

> I was thinking about proposing some tagging convention such as:
>=20
>    Suggested-by: Sashiko:Gemini 3.1 Pro
> or
>    Reviewed-by: Sashiko:Gemini 3.1 Pro
>=20
> to Documentation/process/coding-assistants.rst.  Alas, neither is
> perfect.

Yes, maybe an email is not so much needed and the information about
Sashiko and Gemini is much more relevant.

> Suggested-by: is generlly used when someone inspires a particular
> commit.  This might apply if Sashiko found a problem as an incidental
> finding, which we then fixed in a subsequent commit.  An example of
> this might be[1], or in the case which you suggested above.  But what

What about Reported-by? The required closes by would then link to the
actual report:

Reported-by: Sashiko:Gemini 3.1 Pro
Closes: https://sashiko.dev/#/patchset/20260319105947.6237-1-wsa%2Brenesas%=
40sang-engineering.com

The drawback currently is that only the whole report for the patchset
can be linked. But probably Sashiko-reports could have some more HTML
tags to reference only the paragraph needed.

Happy hacking,

   Wolfram


--Ej5xfyCnwyWtSpC/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmnLdS8ACgkQFA3kzBSg
KbZNPw//UHS9gnCVAVr3OK8QPCczPsu2z6A5LsMZ4Fvq8uzoLGznzbJQDtOR5he5
ZLBJTKBQEEsLbgVQBYR6GDo7oTJtROxyCc5jFIqd7Yfl4JRXYtlAJZWlUrqhsGkq
LMsyBZYm7w1nly71ePp8Uy2RMlURTPwAK9f+vymj5Q80hBGxqwuOwlexWaZ3tUgp
wCE415N/bfWAOV0RoQZ7vZElUcFAfzWWZSuNd0IZVyxeHhoUMmmbvi1ZZJAUwsfb
V8k5/eH1JO+5O9W/u4TyKl05BWt2rA1ZfFa/kdzswqb1Ypu5pi9qYGkh7DbPSln8
c/XrQ6jkgkixSIsGF2twIAR96FXPMpIeMTK5go10t3ONwQiTQCihf/T+8mYJh6F7
s4CdrhYAywOYBJ/0NJ3/m/BWh8HUYtFaRPOYJpZX/U1HU0LqVQl0jkPhtfZTY1oQ
rAKN1ZncpoRsGyqqVVJltun/6lhMhk5vwPg+G2Pb1chlBF60P/7jnZO+qZED976z
tKWfgyAnHXpOXj7zNYuhuUscl7yohJKDUkxfGt0Yv9P07hhirmTJCDAxbZxw+Xh+
NtdeBNbT19nAub8z0giZE4vfCWTpKGGO/BKIEZ/XD9w0fomK/qQGFxyBx9EJMSkp
8EWCtMHhfeg0j7LcwP5PcGbsjI5Rh6oubCu//2UtIhQnwO6ml+I=
=ZyVC
-----END PGP SIGNATURE-----

--Ej5xfyCnwyWtSpC/--

