Return-Path: <linux-renesas-soc+bounces-24038-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id DF3E8C2CBD9
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 03 Nov 2025 16:31:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 8830D34ABAC
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Nov 2025 15:31:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76AFC312812;
	Mon,  3 Nov 2025 15:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="MmEjov3S"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E30C3019BD
	for <linux-renesas-soc@vger.kernel.org>; Mon,  3 Nov 2025 15:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762183387; cv=none; b=mqCRb/UFGdYyNQaMu+XVKNXsT9aWhmUBFtIjvl4Y9zi3poWvKB2KEQz1hBJVh5dXw9GjEAxARuj0JkVZZySU2sbD4HohGouokDWeKoat3PFqDRYjdG/rrBuGTdvBY1K4aLbHdr1ac7/XodfmnHYNv8ieGE0fZ8v+vmo6A0IB+9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762183387; c=relaxed/simple;
	bh=yHDBgbpa9bCMN8LXx/Vq8O5VD7Cdb0L0jjUmq+4QPZg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fMDSe2vCMG3gO7wtf8d9dhuuv7Ltgo7AujyhyiWs+ZkvUPWxs+Znkg4rfKRdsPYyTi53VlUE3aF6pUfFfGXYEauZlwQRUdPoE1LZlyVJkGQlqLCxsOuPM/lsIYZZRt2YNK4ncsBN5rqZ6QIe88f3wxDEN6TLLatQN5Z7RTsT03k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=MmEjov3S; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=yHDB
	gbpa9bCMN8LXx/Vq8O5VD7Cdb0L0jjUmq+4QPZg=; b=MmEjov3SJxhTme/OsL0y
	oiduaAYpAlhqXtvJBOAW7zzpoaZNMYInjE666oJ1bXfwxxSFBqYAqkbcch31XXnm
	Spjasl0JlYmavdu6XdcgYKLWmj2K87SoXy2zpHkfiL1cyMTr/qlV032KNGJq7l5K
	xMNS5iIkwyNWytBYUmP/G/4KynhvQF7P38rzy9zLxegGZctW6GS+PoMovKxuSLoM
	yAb77TegJNc5h7k+vQSvhIf9tMPTZJvALw090A5zGjqDIwOVmWNIDoTgcWtszkiF
	C26qZMtIjPX5/2nSLYDjXc1j+GIYbmvFhv+8kEnVz7QtPiBdSIB63Vc9awO6V5Wt
	uA==
Received: (qmail 2268408 invoked from network); 3 Nov 2025 16:23:02 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 3 Nov 2025 16:23:02 +0100
X-UD-Smtp-Session: l3s3148p1@oE+JSrJCAVFtKPNt
Date: Mon, 3 Nov 2025 16:23:02 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-renesas-soc@vger.kernel.org,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-kernel@vger.kernel.org,
	Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v2 0/2] reset: handle RESET_GPIO better to provide the
 fallback
Message-ID: <aQjI1m0yYs2t1hYq@shikoro>
References: <20251015205919.12678-4-wsa+renesas@sang-engineering.com>
 <e1fd975c-56ef-442b-8617-d63237bf795a@linaro.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Qp8UMBI+Dd1+y4QJ"
Content-Disposition: inline
In-Reply-To: <e1fd975c-56ef-442b-8617-d63237bf795a@linaro.org>


--Qp8UMBI+Dd1+y4QJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> You removed RFC and entire rationale. Your earlier commit - 690de2902dca
> - is broken. You must not do that.

Wojciech was told to do exactly what he did. Dunno by whom, I trusted
that after seeing the handling code in reset core. Is the required
fallback documented somewhere?

> Broken 690de2902dca leads to this broken patchset, but that is not a
> correct fix. You need to fix the source - revert 690de2902dca, because
> it is obviously wrong. You MUST ave fallback to reset-gpios, that was
> the entire concept how this driver was written.

What is the benefit of having reset-gpios handling in the reset core
optionally and required as a fallback?

What is the drawback of having this tiny driver in the core and provide
the core-based reset-gpios handling as a way to prevent open coded
solutions?

Sure, I can revert the changes to avoid problems for users, and will
probably do so, but it still feels all very strange to me.


--Qp8UMBI+Dd1+y4QJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmkIyNUACgkQFA3kzBSg
KbZArxAAsj8/fFVv6DM8kCt/GBjwz0IG6WilLeCCGE/s5mDh59OLH3vglWyxgh8j
9KkTKRQA4hthZAlNSktEzF4mBQsNAKLsuBQqcw68UXA8b70I4qHoqSZang5PMs9b
6HyOZJbTdqe9TAQurmYJPsFowHjEnp2k/MablNQqW5+1ph/BbjklL4CeM7dBY6Cg
cLjCA+lAaSLOAlmOmaauclUfx7CwEHtCFKz9zTBwB5CBlfJbvpe+Q7jcvf4IcZR4
vRHceULLZ8xbwxBSsQcsOjxsnP0thKUpthzac4rPV5Zuukw/HmcSh9LlSH2h+/hi
TxyN62bhm0wJSA72PsPic9LXuCp+wHobKFcbZesoYjmlZhlAfXm1EUahOW5hUYAz
LjbMCYOMgFgIT/oKTWKIxT0ZjS8bFhCrJHvB2HMwDXi2/FdBSRHuXynAdIu017KO
tWpjtSS7FaBg9EpgfDU4YDunnostU/d1x9Jw3Ox1UyiwoRdYLVyrv8DTNV+GtpLQ
Iz8m1ynCB9hpdEQaP+GI95af3j8faYZXtnp2oq9dqLP676POfyG+ngAaMUqHSvqI
R9VvGwrZe0BOwm3P5dqJc9EgKCXp3AkfwsKRh6iuiLz7nXdz/EYfQ4kUH2SYYhRU
NonnPg+1iJYAdEiSlHv3JWm3z1MQKQw+ctd+arlfVp6oZCYi984=
=eORx
-----END PGP SIGNATURE-----

--Qp8UMBI+Dd1+y4QJ--

