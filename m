Return-Path: <linux-renesas-soc+bounces-30620-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4KcvG0h5y2k3HwYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30620-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 31 Mar 2026 09:35:36 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A2B73654AC
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 31 Mar 2026 09:35:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7030F300BBA4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 31 Mar 2026 07:33:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71E3E3C2798;
	Tue, 31 Mar 2026 07:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="aeXZS/6C"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A08FB3BF677
	for <linux-renesas-soc@vger.kernel.org>; Tue, 31 Mar 2026 07:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774942425; cv=none; b=reEomjCe3Ju8ztufO47gq7F3co1ytwKcXTH39EtlMNM8snL57BfzrHA36nsIJ5AjAZaPeief9BRpmNKaQhvgvLMb7DCVPRHuf8IheNglZ1nPhDN9kC5BlleKxY/znbxYVcJtY4EkEds+J7dHotvXan5DWX1eA4I3tCHlIoIEqfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774942425; c=relaxed/simple;
	bh=xGO9cJCF9yFsZpN1UnzEF0N+yYGVMT7/dqkAnyOaLBU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kj4AuOJBF/7Ue61uNJX5olquSpAzkUKF+Xm2tEKiMkloxKQKIdqB+yob+SlJJrd5yhty5a5AlwVYKpjX+ODhfUjjTH+B0RENrmgnDXJU93rCh774IJuYL0La9rP+X5ZI2bhqR6LD0fyX1Iw3DEhTbRBGaCEbQ/4rWcnmfIZDZZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=aeXZS/6C; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=xGO9
	cJCF9yFsZpN1UnzEF0N+yYGVMT7/dqkAnyOaLBU=; b=aeXZS/6CH178XYZzMgey
	PLzGDK9/+CyaCEkuHsYPbtXzjxoJR/GssWtw9wIowt2mIkNHsSQOGWPrW31nGHt7
	1N/oMDlXPCR2p5CLhUDuaS+XXBo3Yc6DRqD4wZ/orhIJ1gO5yHryC4IOEWhKM8gf
	9FQ726vkoC+AXGZcC9vmxfKVA8OFaz6oXKzaf+bujgDjD7IVWD6Svtbxz1NWO8IC
	w96ygeJTbRAQNrFFjoqkt2OuDdpcXo9UZeCjLoIOIBSsWg7bszz7JPq+3ipBETDW
	r/Xg2D/xZiEfRagGPpcdYTpoHg/GCgB2R4JvovJ0VY2UsWJDuJ0dp77jxmTHrmfV
	RA==
Received: (qmail 1587397 invoked from network); 31 Mar 2026 09:33:41 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 31 Mar 2026 09:33:41 +0200
X-UD-Smtp-Session: l3s3148p1@RsKG/ExO0Jcujnu8
Date: Tue, 31 Mar 2026 09:33:41 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: soc: renesas: add MFIS binding
 documentation
Message-ID: <act41fVsL1F17bHa@shikoro>
References: <20260317130638.2804-1-wsa+renesas@sang-engineering.com>
 <20260317130638.2804-2-wsa+renesas@sang-engineering.com>
 <20260318-camouflaged-umber-oxpecker-b2b29e@quoll>
 <CAMuHMdX=DRnFWG1ky8wT7mK=LHeJ6LduL28nYd19QpASrn6mew@mail.gmail.com>
 <c46357c9-8cf4-45ec-8b48-8cf979de2e98@kernel.org>
 <actzUSIKKzcDmBCT@shikoro>
 <28396df7-bb9f-4a6a-963c-0b56c66fb3cd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qw9sYZXXv/5ffU+l"
Content-Disposition: inline
In-Reply-To: <28396df7-bb9f-4a6a-963c-0b56c66fb3cd@kernel.org>
X-Spamd-Result: default: False [-3.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30620-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[sang-engineering.com];
	FREEMAIL_CC(0.00)[linux-m68k.org,vger.kernel.org,gmail.com,glider.be,kernel.org];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sang-engineering.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3A2B73654AC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--qw9sYZXXv/5ffU+l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> And look when my question was asked:
> 19th of Match:
> "I did not get the driver so I cannot verify that. What sort of Linux
> ABI does this bind?"
>=20
> You ignore it and on 23rd of Match you send v2.

The opposite is true. I saw it as a short-coming of v1 that you didn't
get the driver to properly review it. So, like many other short-comings
of v1, I addressed it in v2. I explicitly paid attention to send the
driver in v2 to you and explain more of my reasoning to continue the
discussion then on a better ground. This is exactly *not ignoring*!

> And now you reply that "you got driver as well in v2". Seriously? How
> can I move from 19th Match into the future of 23rd to get the email from
> the future? And some answers from the future?

You can't. But why can't we move the discussion to v2 instead? There is
more context. This seems like absolutely normal development to me.

> Respond to review instead of ignoring it and sending v2.

Again, it was not ignoring. I even explained in v2 why I kept some
choices as in v1. Might still be wrong, could be. But I tried to address
the comments as best as I could.


--qw9sYZXXv/5ffU+l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmnLeNUACgkQFA3kzBSg
KbaZFBAAhEP1X9PgPI+kS+jBDbO8qwkVYf6ffuXOQ8w1kcrpfkr5XKN40g2Jg/jq
WdGl2adoex217URbXXvTj+DWU7KBS8BLK0SKdvFeiNlgRHcitgwvz6HpALz9XiLn
s8sCYxVUG1YugbF2kgEDhqKtOdLA6HTqnWrOLiCx46SA/ybkY1KEPehO9c6kSLxx
LarfQwIjxL4e80EK8+OfEKIFY5xLZ+BGGmwOQFqQc1idaEAbfEKiKsOfLKJfrfEk
rRhmmAPK2d0sojqO9/nfI60HTFHN6KuXxh0eQqnoedkxeNcIM6+sYYOtOHAzQQ80
7mfqMkv/N4lKvy6RNyG7l+EnvOeC86UG1vZqX2gbDYgJnnqlyidY1EEgaGbPb7ni
s8TBDjKjILTtnrohMkv75RgTbrGaUqfjALaz/jQ/qaEhZvRN9OToRKib6PNyAONC
jWIwrmYKYWj/9jYkh2adsklVbEZC4tifl5svrjsRRl+v2oydJ5k19Q8AXqNpcBNG
HTq8FjUaMJIWwnVLMlVel7R/64/DDvp1TQDBOJJFVvDJ4uwUA9ueyXXLdwaH5d7i
RDq4W7Cqlazeej5HwMZ0CfXHCHV18kbfl0538kX0vykrRVf62UqMzkTousO3z3n6
4Qbo+LNtuyOfmU5f5zpin2tTj29gPg81fD5LIj/6NLWRwX11rTU=
=H6YP
-----END PGP SIGNATURE-----

--qw9sYZXXv/5ffU+l--

