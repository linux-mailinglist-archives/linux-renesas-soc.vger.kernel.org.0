Return-Path: <linux-renesas-soc+bounces-28836-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4ChaBpMfqWmg2QAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28836-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 05 Mar 2026 07:15:47 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ABD820B4EE
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 05 Mar 2026 07:15:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 010793016CB3
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Mar 2026 06:15:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30EDE19CD1B;
	Thu,  5 Mar 2026 06:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="YxrG5z4u"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD84229DB6A
	for <linux-renesas-soc@vger.kernel.org>; Thu,  5 Mar 2026 06:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772691344; cv=none; b=eEQiW3iAs5O8jVsGaSmVVGH38lkXhgCwxiTznSxkMnC83XOH+Hb20CWCioIJQLIRLC/7AYLcG92MQjZy4iQE5ZePfIJ6XcrsYe2ECAdkpRUS139AzylsIJnC4UipfKDi7kL6y9QO+WFRT/xEXbfCnblWyWeBzn3LI69QQZOFlSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772691344; c=relaxed/simple;
	bh=WKZHTuQMJmF+uaCrWD7CPTpADClkuwoajnDIQinq0hU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ipvz/gceUHbkDJWMNk5q/Lf8ZrpY866s2gy+yylH/BEFEf7fqyzVfO4Y2cPKQ/bB/Wecxz1sRtGPHvcl7tebDF7tr2nB3LlG5fBf2qsgjW8/wXQp/8C62Intt65y70W1nfKKGm7I2S+vXAK4KXGXn9Q95bigCwCwNQeqeOwfvvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=YxrG5z4u; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=WKZH
	TuQMJmF+uaCrWD7CPTpADClkuwoajnDIQinq0hU=; b=YxrG5z4u3f5CgaEw0b6H
	2b4f0mUha6n6ghl1bCHNpIr9sunNEwT668YneRQi3NiFCdJwjpfKyPDhVSiCofzm
	UWYjsrYx6L/B/7+n0G+tRQQEm1NqvWx5bzygZmAPiTYCFYIqmtAfYmE+wyyV5ilI
	psz8laJ8RbRflKkTup+EUukWbXAGaY1FMcZ5dAa1mB8v8wFzHnJhu8nCc20M4OAP
	lYHWkHvFRYwl1K01eWoKdXRjCe8vSUnJs4d3MFe/1G03XF4zngffJEUacRAqGV5N
	wEbMmx8dChRGaSlPOPqlwMtdPYJq2/BusZQQSSyQsCzwgM5UWiOjIlN9iCsG2hje
	1Q==
Received: (qmail 1046036 invoked from network); 5 Mar 2026 07:15:30 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 5 Mar 2026 07:15:30 +0100
X-UD-Smtp-Session: l3s3148p1@eCoC3UBMGIUujns5
Date: Thu, 5 Mar 2026 07:15:29 +0100
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
Message-ID: <aakfgR3EnLuRULIH@shikoro>
References: <a3f0cb6c-cff7-419f-839b-13bb1ff4960a@kernel.org>
 <aZW0GL8ufBgZlUbU@shikoro>
 <aagmDTa3KM3EYx0N@shikoro>
 <8efddf8f-a9d3-4c29-b54f-201304339843@kernel.org>
 <aahlEKyKF7x2JSuB@shikoro>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="puL3chh2/p3oS91B"
Content-Disposition: inline
In-Reply-To: <aahlEKyKF7x2JSuB@shikoro>
X-Rspamd-Queue-Id: 6ABD820B4EE
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
	TAGGED_FROM(0.00)[bounces-28836-lists,linux-renesas-soc=lfdr.de,renesas];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action


--puL3chh2/p3oS91B
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Okay, if changing status is the only way to get attention: can I then
> get the patchwork permission to change the status when we think they are
> ready?

A maybe simpler idea is to mark the patches as "NeedsAck" instead of
"NotApplicable". This way, they stay in the list but you can still
ignore them until the review counter goes non-zero.


--puL3chh2/p3oS91B
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmmpH30ACgkQFA3kzBSg
KbaXTg//eUpuIV+aHVeXZURiVZn873Xq54j6p3+t6EXf/HGsX7eaNdVNA6Uik2DL
ByVmzpjav0NEWLX40bba8AqJZ20eErdQQbIEo2+lN2896xOTKI0ZKZMkJKsLXJfq
aAHXTNStWB4Pf4rNV5FzX4APxYTWIJda5iE/uZRF01rqmsSMwnu6UO0GG2gZE65m
hjHwGftnlu3VGWXCqrXIDrJShZbrB5otK2cefhDLiV53cYkilsulPV0G5gkYoHu5
nW8FyKr6O8ouysyB4ioiL9LzxJNqcySkBAsNSmSrVJkqr0Zicc2qYbJi4tIupI+V
zzPCbUQJVAhfwCkh3IkHO+sqvj74qA4t9Va6KQvMl3dWfqcBoJEWF4dF+bHpOa3D
UbpaMbOL6HFkfItTsvEmNz2h0lfAsUregfqwF/9ZT53zMhdrWAELCxrGHIlboEps
pTdkVJa1wXdCHZERLPsccCdD03TR6y26Dfck3xp6BCr3vs54mtwD5wG3qmPPV5z8
jB9OinFSq0FXC3iuPYch1taHjHxs2/KR5zP4/y647LT/N8GooMGBKoOZfOAYhQKa
YFSt7XHvj0dhMeXD/6tlWFIgvU8yvJiV8pn9v5UNIltNHYPF3g6Bm7Vf/+5M8A98
dqagSGu0MNsEobLceA7nP/Em5qIuphMmSokS+Hz76Nkqn7Q0IEg=
=w/0V
-----END PGP SIGNATURE-----

--puL3chh2/p3oS91B--

