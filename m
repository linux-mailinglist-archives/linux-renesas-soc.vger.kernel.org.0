Return-Path: <linux-renesas-soc+bounces-17437-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F637AC2388
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 May 2025 15:16:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 75AFB3B426E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 May 2025 13:15:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB86F28E560;
	Fri, 23 May 2025 13:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="PHANUYEV"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B78828DF38
	for <linux-renesas-soc@vger.kernel.org>; Fri, 23 May 2025 13:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748006157; cv=none; b=qUAyB5vrSl0hTlkRDA/Sr/OozOOFqSnsX/eMWQ9Mg34j8/OLYhncTvaIpnc6eBhCO2RDKwfrkbNjNL4MPMA/8vlcpGLcH9/cV07LhqcWi8aiOIaChDTfkEZoCAhbW1uHnVXbwL3v/92xk4HBkl4o4lSOpQ67I/HhJRD4ehriQYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748006157; c=relaxed/simple;
	bh=wrPM53to5XZACUy4zMzTiK9ky1x1walXJTeIVv3PPuY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eZi2QL9n0yrwHDDVK3ZprXlnCDIuqfJlaWnaC3wrxEBpoDTYcAUywegZVi5Gxx1/pmxniwal6TwxKqOYPDL4Le+WbUPnwVuERPN1DuUJJSIN09tL6A9Q1HR+DaHaQJ34duBmXoHRBf2dIKo6ruzKze1bspMwNQeeAJ//+RcTZIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=PHANUYEV; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=wrPM
	53to5XZACUy4zMzTiK9ky1x1walXJTeIVv3PPuY=; b=PHANUYEVtQ/+C3C4EweO
	q/6Z6y/BwXBxbjgzcxCeNZuWxZ4Lvwf4/RbMFFt5aHPJKye1JpRGKPhSyq2cgAaX
	+6vEhlrjF0kRCfuM3yog4Y+gMKHQIMQXBpNWk2sjcqTx48B/KkBI0xA5qhU0xZHS
	SMhiXWC+Sx+v4Df5VqXHl9MvGqF2+j/xkXjDRxHRPQV2oXqBjODkajo3D/B8hwmp
	+uwuQrhyZFf2+A2bihBBy+Rtfn4TD4PsmiLmDVsiIq0Kk5NO/T7gCLp+1UrlXJjD
	vneRpfvGsjvI/i+hAK3nfTBwCTTBb82hwnjn2a1Qlx/hJLkW9krnpRWlWU1a/OcH
	RQ==
Received: (qmail 4052070 invoked from network); 23 May 2025 15:15:52 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 23 May 2025 15:15:52 +0200
X-UD-Smtp-Session: l3s3148p1@mxTIZc01Jo9ehhrS
Date: Fri, 23 May 2025 15:15:52 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Thierry Bultel <thierry.bultel@linatsea.fr>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-renesas-soc@vger.kernel.org, paul.barker.ct@bp.renesas.com,
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org
Subject: Re: [PATCH v9 06/10] serial: sh-sci: Use private port ID
Message-ID: <aDB1CDYiY_XF62UF@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Thierry Bultel <thierry.bultel@linatsea.fr>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-renesas-soc@vger.kernel.org, paul.barker.ct@bp.renesas.com,
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org
References: <20250515141828.43444-1-thierry.bultel.yh@bp.renesas.com>
 <20250515141828.43444-7-thierry.bultel.yh@bp.renesas.com>
 <aC2yYDpsv7ef9IVA@shikoro>
 <CAMuHMdVPn3adKZMiLqoEz9ANNyekmB9WRFyz++49+FeEOkrSSA@mail.gmail.com>
 <aDBoLr-uPxxHgzEU@ninjato>
 <4b9e63e8-388e-4b24-98dd-05bd9e73731f@linatsea.fr>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mqAi+Bx2hFZjh1sj"
Content-Disposition: inline
In-Reply-To: <4b9e63e8-388e-4b24-98dd-05bd9e73731f@linatsea.fr>


--mqAi+Bx2hFZjh1sj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> but is this something wanted now in PATCH v10 or can this be in a later
> patch ?

I don't mind.


--mqAi+Bx2hFZjh1sj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmgwdQQACgkQFA3kzBSg
KbZ19g/+Kl9xKhEY2I7CVfKxmSOmrtdh+834J+QkiIV5g6A2uRpYw573cFFiYeuY
hZBl4tsD4m37n9tDkaMN6z2luw06WAP+KKEpOY+4k0WyARhvmtWhSGWIzUyeg/y+
zxpF+wYmdDmjfFQDBc/Q7DloJB7Nv7k1aPdbxQ7nW9P7D/BkvHHZRyC6VCphl4Jy
J+jvkxkBChmiTsEMIG0MfA7dESfVtgJudtcm2WOBEgDvYziGkLhdZb/nvGJzW7b/
uXyFgOAqsaVA1SxG/dliAAAgUs22pE2F8MjQcvcvufGCD818zF/8sVSlkaADkpQa
RDdZcrHn/Knm+ZfWzMr473nQ0wnxC/1yEOctA8PTus29YR5l3VGvp8Bts5x5dfaY
J5Td82xtFG7rOv7VJR+WLX7CGzrenN4l/urETt7Z5JQrOqBNxf4zT6iYVDX2gA4m
uAZm7efI668DqQCVbOXOaAXL8Jt+et9W11+YOsKVWEzDW0sca6IFwh2YCCUO4ZUm
+Yd5zFix/RQ0jqKxUnvNLSCDwpQW8AKEXgkvutZL4DfpnCz3aR6balH/UFGH/Z2c
wgzpD8c5U9q5LTGWImSz3hIv/CrrztuqK2BadbqJFIx/bSunBE837beS0pGQ4P24
kY+e7OXPfcwW+IvFN1ID3QKiLbDmr9woLkB/BwfN0ETyQJBjY40=
=zvZO
-----END PGP SIGNATURE-----

--mqAi+Bx2hFZjh1sj--

