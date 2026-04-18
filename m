Return-Path: <linux-renesas-soc+bounces-31378-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OTSGMXQa5GlSRAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31378-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 19 Apr 2026 01:57:40 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 30CDB422A1C
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 19 Apr 2026 01:57:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AC7E3301F7B4
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 18 Apr 2026 23:57:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E501435B657;
	Sat, 18 Apr 2026 23:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="UWbbMv8z"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EA5130CD95
	for <linux-renesas-soc@vger.kernel.org>; Sat, 18 Apr 2026 23:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776556657; cv=none; b=FNjtDExGvYd8Xg0ip40RymTOn0T21j/TBWUNty5kbpMOA5bxnAIn6Ma6ORY2kj8KfajguQAZqZUDtAcCcIl8NQnqrDhGM4jrH3Lja+SMI3jfq+AaEtqPMaS64Wj+0lY51eEwomX6y3zFOnYnP1gmD3yKzRWNLHpJVPPZ5ZO8Ofo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776556657; c=relaxed/simple;
	bh=t826djOZehDiEzZZ3bOuHqOGiv9M/FNBghWh0gZIhcw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MHP0lBV7uKxp+A9x/Uo9iVd9wC7dLNU8MLLfjf8FPq2XVLyt/uu9aLzap4XZCkV9n3b1tXsX1ei0edi5LjFMufqYwrCOB5/SfCo3zendZE3scR7uThs4Da53hOrgj13Vuzyrah2mx73nrE2MZ9BAo3+7WTa0hCHgWsQiAmzUMxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=UWbbMv8z; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=t826
	djOZehDiEzZZ3bOuHqOGiv9M/FNBghWh0gZIhcw=; b=UWbbMv8zm9kefYFBuZQx
	B9hiATVSfN+kd0UmtpdrgmltY6m28m3cNR+wNHOhUnzKak74zt2g6ggEJfVHpdpL
	9x3d6kIYb4qhwtQYx7cKsPQdtC6jFa2Z90tSFe0JWflFIEJm8HpAoNruetomtNFx
	ytYcd9vJiaj7GHpulN6iZWIQ2wL0Y4Bhl9tWzTX0IeZ+fYe7sgQ5ZxiiORdQKgaB
	ycTMsdxnTfCUwjZDHuTlDNIxKgb4AD4pDk3Rw2ToIEZiCGlFY/W/g4T1rEz7bprj
	VsSuwVgfLrfX7JVzQP93Xb75MrAOaxOQIwKs129P9/OEyAgQCFXCU15f30w/s3zv
	2A==
Received: (qmail 255179 invoked from network); 19 Apr 2026 01:57:25 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 Apr 2026 01:57:25 +0200
X-UD-Smtp-Session: l3s3148p1@A3jA08RPurEujnud
Date: Sun, 19 Apr 2026 01:57:22 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Mark Brown <broonie@linaro.org>
Subject: Re: [PATCH 1/2] mailbox: add sanity check for channel array
Message-ID: <aeQaYmXr8XV9r3ME@shikoro>
References: <20260413104240.30493-1-wsa+renesas@sang-engineering.com>
 <20260413104240.30493-2-wsa+renesas@sang-engineering.com>
 <CABb+yY0NrmCRu7c3Y0JiahmVCNCq-B57TckQC++X=HY6bL0-sQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5aZf8Rd/a3oheU2V"
Content-Disposition: inline
In-Reply-To: <CABb+yY0NrmCRu7c3Y0JiahmVCNCq-B57TckQC++X=HY6bL0-sQ@mail.gmail.com>
X-Spamd-Result: default: False [-3.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[sang-engineering.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-31378-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 30CDB422A1C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--5aZf8Rd/a3oheU2V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> This sounds like a quick suggestion from some AI tool -- looks nice
> but doesn't mean much.

Nope, from the cover letter:

While diving deeper into this subsystem, I manually found these two
issues which I wanted to fix right away.

I just wanted to check which parameters are required and which are
optional. And the array is definitely required, so the core should check
for it IMHO.

> point to an array of channels. NULL is just another garbage value, why
> not also check for 0xdeadbabe or 0xffff... ?

Because NULL is what we get if we kzalloc a structure unlike the values
you mentioned.

> I can let loose a claude session and I will find 1000s of such "fixes"
> in the kernel.

No AI was involved in the generation of these patches. I think I marked
the patches which resulted from AI review correctly so far.


--5aZf8Rd/a3oheU2V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmnkGl0ACgkQFA3kzBSg
KbYQvA/9HIHfz2qikrszJ3caT9xO1fo5tqjnu94Q3hsP8pWnqsTcriN3ZBwQrDdy
q6dafcyGY90NwfC+bt+nc2npFui95eTatg+xlcTLpLo+edAWF9JFl54JCK4gOF7r
4+AzUsOdJjBy+QwYi91tueMkgmCNKTrQn/2aiaTYMrw//JVixKdswmnQjOhgsjVu
ICYQaT1c0rAXCKYvjA7tqgEPaVNH6470D1nBNM0Sx0bwvTCTkoTSrdLxrQ7JElPp
MW7PAVXdFllEEF835K7U9BrYpbNKSGVHbxBFKT/pJvYFqpxMUrOq1vix1+8SRj1u
vSwg+/vkvbiC9BUE04MHpSe8MCpvkqBphRHWRFzdOv807jyb013gREamodlGrDF+
zaKRzNdGbxqQNiJDMQG9HYAsnJOmAjmNQ4j7mUM4MTXBJ49ZLwb3gGpIRyfBXvYz
oolZRLTeIgCr2zK7nr+szaVDszkKx5N9EuuFNkwVsjcvihmQABC4LFzKzqbhLZCp
NRcBkTcIRVOxe99m1ZQmyW8fkN24MnT/5p2FjEnsYorp3C0H4bzZCwPadmY9WYvw
0GmYlmhUd2I5xIMsQfvtahfF84fzekjLeh7/xtlJjJ/Kj7oRNTBPK1nATMRmAmM6
+H8uMZOQQ8pm9g5M9eIhdK/mrYdWnCYkQn/Z98C7sZ1aUdaIJ7k=
=wbDH
-----END PGP SIGNATURE-----

--5aZf8Rd/a3oheU2V--

