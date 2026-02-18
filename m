Return-Path: <linux-renesas-soc+bounces-28308-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uCmxNSK0lWneUAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28308-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Feb 2026 13:44:18 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DBB0156655
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Feb 2026 13:44:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C3B52300F13B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Feb 2026 12:44:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E772307AF2;
	Wed, 18 Feb 2026 12:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="anFYem6s"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E15B2D9EF3
	for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Feb 2026 12:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771418656; cv=none; b=GSliatl0DzRkmYINBG1CU8y81vKTkxaJtIZ57s+GyT5/m+74NO4et8lDHqHCDiiwSorYKFXlRsfJsY+2y/7AMHdCjxHtFpsoCsgvPUgCsOXAuHhB8OU0t41pxR9AbFRNwwxqI1iAMX+Eg5R72iSlzRiZ9dq1JLQTrnxLKVXWHAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771418656; c=relaxed/simple;
	bh=8Nkby+ddl64SYd7yb1a0u9PkGxEsJvFhKmgjxUU6okY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AFUvbdCXBbOvJ/PUPyido6XuzrndiO3AuILa06rtqAx3QZQYwxet6YGzjVrvNvgOBJ3EtCSVJXa4FuMz9FiYBUxLvCIgbGIj7oLQS6gzFKZliFIJuTiWY2A9BMe7YhV3Tq61CTlqxCPfLlvoPwfBiLqRcriQbikCHVvg6AlmLbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=anFYem6s; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=kJDC
	wFbIwgk+gh/z9/DVKvUt621HqbyVQ3YVZHXcVYc=; b=anFYem6sEUbkTEOAiyon
	Fx00hL9PQswqt587QJwXqbdZXsBiXqSi895BaJKfbt1vkV45LquU4y32BlIn8DkE
	+tP9K2Cg6p1CCU7+9TvX4wQfHY/mYrM6L5S1Ai9p2Ybhn1yb0su7DAIK+eII+cYr
	wxKc4WObl5mbxUXUbJAfbgqeyTcZEKwiVyRBbbX7jamtnxMbdbsB0R+ZWs33Yn0O
	HPV20Jiy94vyl5IzZQKXbnpK5coLoRnn9Vffgmz9kmv4fpfq3nfZ1F7zvyiwr3NA
	bTPxt8hIgnxv7ssFxFlF9XvCmUUfy6lkPLI/m/mX00AS87Br4WQ0WjM4alHi/EDr
	1A==
Received: (qmail 4146608 invoked from network); 18 Feb 2026 13:44:08 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 18 Feb 2026 13:44:08 +0100
X-UD-Smtp-Session: l3s3148p1@vwhKixhL2IUujnsq
Date: Wed, 18 Feb 2026 13:44:08 +0100
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
Message-ID: <aZW0GL8ufBgZlUbU@shikoro>
References: <a3f0cb6c-cff7-419f-839b-13bb1ff4960a@kernel.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0dwGAlVj2ktBi4ws"
Content-Disposition: inline
In-Reply-To: <a3f0cb6c-cff7-419f-839b-13bb1ff4960a@kernel.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-28308-lists,linux-renesas-soc=lfdr.de,renesas];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[sang-engineering.com];
	FREEMAIL_CC(0.00)[renesas.com,glider.be,bp.renesas.com,gmail.com,vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,sang-engineering.com:dkim]
X-Rspamd-Queue-Id: 3DBB0156655
X-Rspamd-Action: no action


--0dwGAlVj2ktBi4ws
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Krzysztof,

adding some relevant people...

> What just happened - sending a patch to fix in-flight (not applied)
> patch instead of just reviewing it [1] - is not acceptable. You should
> work together, review each other patches and improve them BEFORE they
> got merged.

Did this happen multiple times now? Or was it the first time? I agree it
should be avoided.

> Why? Because you put unnecessary load on maintainers, you allow
> knowingly incomplete or buggy or inefficient patches to get in, you do
> not collaborate in open source.

The opposite is true. There is not just "Renesas". Renesas has multiple
divisions, and as you surely know, within bigger companies it can be
complicated to work together internally, think of a division in Europe
and one in Japan. So, the connection point for these divisions is
actually the public lists. We do this development *in the open*. And,
yes, sometimes shit happens.

> And I really do not care about your patch count

Wrong assumption. Nobody here cares about patch count, we want to
support hardware, that's all.

> If this is how @renesas.com submissions work, I will stop trusting them
> and assume your patches are unreviewed internally and buggy.

I told you more than once that it is perfectly fine for us if you skip
reviews until peolpe you trust (e.g. Geert or me) have reviewed them.
Why don't you just do it?

Happy hacking,

   Wolfram


--0dwGAlVj2ktBi4ws
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmmVtBMACgkQFA3kzBSg
KbYx3Q//et8DInTdK4wYg44BHDD5qAXD6n4re/f4U5paOV8sFZRqEyOva1HbtlQW
/TWseuFiIrqYQG6HlLakw2/Vn8VqbuOin+Rafb4GsaWW2mtmWJ1z6Wdxs7ArqjWm
Mt5sTHj//bgNrRyFwbq8FQ7Gx6t1Asou+Ij7Vu6No5Wg64ZQACjzBv2erhoZ0fVM
ldQ6hFyGcvqb8Qb/vM/v/2bReztIUwWWvz7GvWE7h2w+fBeP925Ua5dmEDzVTdf7
FelOoGacPg/yzvH9YlB2KBbhXGec61i71Rt4WUnQAcy9jllX+HkdHK5gtgd1bYDN
N8E0oqnPvGSEPPGS8WjgZydH8ODk5G9xqbg0DO+9Id9dIz5qrSmFGzwoXDqxTm1R
EPRbqZG89CIlsaLBRhHRi0GbF2rbLCyvsP6Tf9P22tFMi4k12q20gt3T7PBmIhiG
Slw1O5OJpowtnTryZT6tt4caBKFBkibysBslhe3xXew0D8g3urREYw54SxTHtyq2
lAaMioCiEnEPw57dygZICnYNVCqALyjMHzkzpLT87wwolBGvyyBkGtWXiEVxjCn0
yZ9sFuZ0uPy8LKaNU7b1OHI5fTR39NgPlT8zEk9ohSYfiiHcpSkHKooJlqDckNGP
AgM96nzhj0c9N7SVgd7sfBsHxItmTMHpEGaQFNwj01/kpA6DgZ8=
=D/A6
-----END PGP SIGNATURE-----

--0dwGAlVj2ktBi4ws--

