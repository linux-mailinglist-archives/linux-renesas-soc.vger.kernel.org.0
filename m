Return-Path: <linux-renesas-soc+bounces-28788-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8EfeDKhmqGl3uQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28788-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Mar 2026 18:06:48 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 897A9204D8A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Mar 2026 18:06:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1EB3D300EABD
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Mar 2026 17:00:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42C893659E5;
	Wed,  4 Mar 2026 17:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="a6Ks94yw"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94EA835C1BE
	for <linux-renesas-soc@vger.kernel.org>; Wed,  4 Mar 2026 17:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772643609; cv=none; b=C9erUdJWSuMvvbG1DqN48Gr75UQyJqkGRHS7FT3fAPChRlNolI3FcGKIw+56HUCYxyGq99d8s/2E/ueKb3S064LHAg7F2NFL6nz5c/VSDAVaZ+HnyWO0XPprUhdx7ER/e8knrzoF1P/1MPma8hUOTEQH7VAQN1rgGN0LW8JOh+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772643609; c=relaxed/simple;
	bh=QUNQZzy2gMF/iQdbfBJiw3hFxMJcsPqTzYWg7DcCsk4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nbc9uHdTvCOZEljA+iMUNsyXTBGVB7s4o5x4zxF9zXBy9yEJ+w8vRxCV8AUoYkVbgPIxFgle4MzsS3WtNERwv5DQqjZZ+e6RQvU7RMoxLph6Swvy8LITtr18jebcowM31NyRC/ZUn7HFlU6CfIxzf1wI+8mhTzuQWKDYG6wCjTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=a6Ks94yw; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=etQP
	hLiLJwJwQTaiOopYG4DbDv9RsVnIJcJL0UAnY/Y=; b=a6Ks94yw+4UxbDxuYqIi
	x6bXIKnrXR/gKAXO8+nMUHBtetO0xbSjY976yx5x7fnNtVB1DgDHGjGIPCQNDVBS
	7f3zHzn2aa8c1BTJMQMr0/R7F/il9OWBL/S5pBg+M8etzeNwcYJpLQeEszb+g4Rq
	nc4w1ZsK77R9T+2QsFzGSH+IoVi/G83kQiEiSWFqcy/kHy9EI2PAcftIJTJrrzXU
	PsTcmkGALP+bjA807bxrPTz2rpTTlR9DMUcwKgS8d5hU4m/jBI8XfgFmJp8fCkZp
	BEXJJLYZ3efRGvAgdaX5Vcmv2TZz+6IRszK3udOP0g6dtXIf1UB1u9E338SKUPvj
	mA==
Received: (qmail 827664 invoked from network); 4 Mar 2026 18:00:01 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 4 Mar 2026 18:00:01 +0100
X-UD-Smtp-Session: l3s3148p1@wBEjwDVMkhZtKXFP
Date: Wed, 4 Mar 2026 18:00:00 +0100
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
Message-ID: <aahlEKyKF7x2JSuB@shikoro>
References: <a3f0cb6c-cff7-419f-839b-13bb1ff4960a@kernel.org>
 <aZW0GL8ufBgZlUbU@shikoro>
 <aagmDTa3KM3EYx0N@shikoro>
 <8efddf8f-a9d3-4c29-b54f-201304339843@kernel.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zT1/Oa99lnMOCBpb"
Content-Disposition: inline
In-Reply-To: <8efddf8f-a9d3-4c29-b54f-201304339843@kernel.org>
X-Rspamd-Queue-Id: 897A9204D8A
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
	TAGGED_FROM(0.00)[bounces-28788-lists,linux-renesas-soc=lfdr.de,renesas];
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


--zT1/Oa99lnMOCBpb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Krzysztof,

> No problem, I will be marking patches as N/A in patchwork. Just have in
> mind that they will not re-appear on the queue and pinging won't work,
> because it does not change status of Patchwork.

Okay, if changing status is the only way to get attention: can I then
get the patchwork permission to change the status when we think they are
ready?

Happy hacking,

   Wolfram


--zT1/Oa99lnMOCBpb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmmoZQwACgkQFA3kzBSg
KbZ4PhAAs38U8GRftnT2JxmEsbRTneHIT2fqz1/akNRRMGcYLwlEcMl7SPiwzv8b
uHZ91UDJ77EuMQqDap9BlV7/ON0KDlKe7EUNnIOv50NQp7FGahA1EXeM2XW4kPCm
mix8piD3506fhQqj5pTw+jyq2mRnNAwrlwrjmRL4xmYbWVS0VfJtH2M5ehWx4tOo
ZFmduMy7SgNcDA5dTpMNUJKKKKban+ZY3XXsVDhff58z6MqmAqP2yDXjYGF+z+X4
6C4at6zGhGn63cEMjahumv73ElEa2j23MK01UhZOvCpzXFNn5uWfhO/wB0GNqILw
JmfMSbiypHfm/oaZYpMtFMOhBmDyVCz9beYwU/ZYVt2Rnu/cuDpe6mFELKb+9NIO
IzXMyGXSW6LcXzQbsuLrqt7Y3AtIOxQALXsXZt7zjCUdXEiJ0cQvY2vCx3ftfI1N
KFkyqAoS/LICKRbxoBR7YkxllY5H02cxXspuq5CwA25VvbB42UQ3F+rk6RFACYpl
TalEBTAHwI9T4mjyB+HfFHSEPITJyKJthETIJqVC5XYTRsIMK73SEhMUM/CtyPPk
93n4nrOC63palNEakDbb3Vn7AEzMfVfL/kbopXfR9/aOi5dR6c62u4fnCYxFyBzX
lLGXz9yfwOrCYbyNsog+Lxuz18fgwRcbsJRRZUOyIfmFGZbHYZc=
=xDiz
-----END PGP SIGNATURE-----

--zT1/Oa99lnMOCBpb--

