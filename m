Return-Path: <linux-renesas-soc+bounces-23339-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A082BF344E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Oct 2025 21:46:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4CF88484575
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Oct 2025 19:46:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 770416BFCE;
	Mon, 20 Oct 2025 19:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="hR3TFxwv"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B2D02F12D6
	for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Oct 2025 19:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760989597; cv=none; b=VE8Fh+mVI+kGY0jbjxpc+uLe1S0Qmio/9hUYd5vyxcGKtuiKkNoZIYxHzlIMreAnp3K+3qnGembi7oeb1LWuJoOLoPj+VmJ9OAkleyYVAe/QfweA+vsHrYtbhaMBnkOJGbIxMGnSrEyvPZu+YQO+UJe6J8bVD2FGPraxOhjirDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760989597; c=relaxed/simple;
	bh=u4PYmow5/v/DDxWjJ7oTwtaN90PzWrj5dhR07VK72ts=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D1siC69B4CuleY3LBkP5Y1VXIp016UE2vYCb5TW+wwwzP++3UajrQLlzoyUzyeRft1PUT/lhlrvjT2ZSaas+FpVf+Oj4mQ0rS20VmD+TAPJntIJ9g9jPNT17hDK5qeu74ztllT6HRaWYcg9WS1I7EXdvf4qiOlKoBm5SJ69zYtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=hR3TFxwv; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=6zAR
	vpi6qP7dxJxbr82EO0VKzo/F2Qcg3yg4b/Ywn+A=; b=hR3TFxwvm2vINoyXz0UX
	ZosAOExKgbxdS6CfL9jmhwAYuGKFshwOBhk09SSLm/4JJPANyBJ1oG7OUU+S1cCY
	T7dsfnz15samNwLqt8tNkcVYJYBQyQ9DwVsRtMdo1EyfHayI6dv2qvymvRSZidwg
	i7X2sbE1kXhuIWSTNVeGDNyktfxQKCyPqZIuTFgLSUAAdJX0Js/dWiEwYydgRrIv
	yczDjXmqMqecIk8szbR7oXaBmnLxjIvalhag8LOzKm3fL502txefg24mB+hk9vI/
	WwVfhPRA9WAaLrhlT+E2zX32pqZlQx0CaySVdNDbAKI1u+flrXHu0ugl5T4fMhTw
	jQ==
Received: (qmail 1173215 invoked from network); 20 Oct 2025 21:46:21 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 Oct 2025 21:46:21 +0200
X-UD-Smtp-Session: l3s3148p1@QqVyVpxBq1ptKPGK
Date: Mon, 20 Oct 2025 21:46:20 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [PATCH] soc: renesas: rcar-rst: keep RESBAR2S in default state
Message-ID: <aPaRjKJVx6jvWP58@shikoro>
References: <20251017114234.2968-2-wsa+renesas@sang-engineering.com>
 <CAMuHMdUFFprx2HPT9oyF_Yer_zG3yoajzFUcTyDephCOA2yz_g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xtiuN1bcivmVSPY0"
Content-Disposition: inline
In-Reply-To: <CAMuHMdUFFprx2HPT9oyF_Yer_zG3yoajzFUcTyDephCOA2yz_g@mail.gmail.com>


--xtiuN1bcivmVSPY0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Geert,

> BTW, did you experience any ill effects from accidentally clearing
> this bit? IIRC Falcon (and Spider) still rebooted fine before.
> Perhaps you need it to make subsequent reboots work?

I didn't experience problems, found it in the datasheets while working
with S4 and watchdogs. I'd think a likely issue is that
MD-switch-changes might not be detected after a soft reboot?

Happy hacking,

   Wolfram


--xtiuN1bcivmVSPY0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmj2kYYACgkQFA3kzBSg
KbZPRw/9Fb84Z5VvsUbwVjzZm1RDe4gZiZYLWhckKsF8rQIopws6PlyU8FpcH7SS
MjwtTGepQhCTcPmQl4YlNyhDTNJAC+xlb6alyom1utD/rY5UZXuIbq9/ddlwEEN0
FqkZcq7vebLG6LN35KXCHzYk5pfQFvzIXwGRZXXrcrbx313Bh8NY2LLtk2chJdfp
Oy63L4mWVl/tFmh+5/ll5/jzYQU+u8Ym7qTUBE8mjf7s4LWgTWqO5Q/bX4salFfd
8OmGjJsEoc5d/So5vTBiwCUt8Xwy0/Xnyq+YZnQbLamID5AD1wiTA9j45Mm+41eg
7iNBzWY282A/4cD2h8R0y0TEbR3UVcJOhjcFk0YmcBkhpWzcnWpch+0RR/cttByd
W5oeOoPrg6Uy5uqHI62yNdJq6pJ2HMPixmUca9DliYgYJW3JtGReORCsPw4l+7hb
exeaxHGjxFlcq8X+nMvd/4zWXe2DMWJ+zUDorniAaUg+y4dAQ/DGozFFeNvOHKqR
rsapX2QBLRX6VI5Q+ah+UhDT85aKV8rEbMaLd/DO9SlLI8e2bc7XLYQCVsnsw/OO
p2zo/LuuaOXTLbrPpzap+Z8lTZDeJVUh3H+IO5+hIm4dwpw7iqIY/Rl2OYEDQF6r
Dh9gLDxgWlDUDF7OzkoDYaCzj7ZWWBjW8sri1Cuc21ikXnzJ+DU=
=/nrC
-----END PGP SIGNATURE-----

--xtiuN1bcivmVSPY0--

