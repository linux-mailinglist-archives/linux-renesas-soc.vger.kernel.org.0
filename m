Return-Path: <linux-renesas-soc+bounces-6012-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2BF59024CC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Jun 2024 16:59:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 039141C22641
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Jun 2024 14:59:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87BA1135A7E;
	Mon, 10 Jun 2024 14:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="SfCfBIAb"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AD2A134402
	for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Jun 2024 14:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718031566; cv=none; b=X7nqjtn5jYFvhwhYtVdYwjXxCX8V2b6suSYDR748JTU7D9VgAg4I1EzjwFCFRmZqkIVSp+YkPpD+++E4xegbrzRA7VugM0BTBeF+jYerkayPVjYmdq9sA1cgpWu/ZMWvcVlBMdxeftvGmRLAesP87uRj4BYqFF8TOmx4zC0lgpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718031566; c=relaxed/simple;
	bh=NSTH4lED6HdhRJ+wmedA9JMfmF/qvXAd6kr6DRyN7uk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pdhYMUu8DPYiM1emeraeNRweWQ0nG7GNmozxC98i5pHA02OfI59dY5zi7j7O69f/LcxA2/YAutgTMxNyqgKZBs6RAZDpeRwM7KGZ9xC78PSBszpq54zQDYnMau3ETYw+k+BaNge0gU+PEwrctbHjUA8hfVCJRe1RNvaoSkeGTlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=SfCfBIAb; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=NSTH
	4lED6HdhRJ+wmedA9JMfmF/qvXAd6kr6DRyN7uk=; b=SfCfBIAb+I/pt14QMX6Z
	c3WaY09OgZPadFb0Rd+MfqPASoFqhv6bJerBKG8C5WGw5mJ7eiEUmpHv/wqEoI8K
	SlfbyCSrJfxlWsebOyFogNJiBILu3xMKkFxohA1gU/VnnNmPwNv13Xy9RTiWZbAD
	2i3UwzXoGBHhIMJvXinDx5B3vmslZOcIMzP8EtqOWaK2oJm8X9l1/+fy03gDk1vL
	P5iejhn+A4M1eMbtm0DZWznCh4Zc6rpecFqtJ9kiHXZ2Aa1Q/9XKuBE1/ilBG68v
	NyFDTTlg7LgB73BydbY5YQ5LKp+LUh9QQVT4/4sU2hCCGz0JSaXRQjJMqNQYXjqo
	gg==
Received: (qmail 116539 invoked from network); 10 Jun 2024 16:59:22 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Jun 2024 16:59:22 +0200
X-UD-Smtp-Session: l3s3148p1@8pL6ZIoaDt1ehhrL
Date: Mon, 10 Jun 2024 16:59:22 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-renesas-soc@vger.kernel.org, Andy Whitcroft <apw@canonical.com>, 
	Joe Perches <joe@perches.com>, Dwaipayan Ray <dwaipayanray1@gmail.com>, 
	Lukas Bulwahn <lukas.bulwahn@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] checkpatch: really skip LONG_LINE_* when LONG_LINE is
 ignored
Message-ID: <jsyf5islonamw76iulcvpzuoqjzbfo5uwehcscggkimhd6u4sw@kik5u3dv42tm>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, linux-renesas-soc@vger.kernel.org, 
	Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>, 
	Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org
References: <20240610114554.82496-2-wsa+renesas@sang-engineering.com>
 <CAMuHMdXOHHsyvZKME75qHk0M9sVf6A8EnA0YwJpbDSHt48tTVw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gwc63oiajlpzjsc6"
Content-Disposition: inline
In-Reply-To: <CAMuHMdXOHHsyvZKME75qHk0M9sVf6A8EnA0YwJpbDSHt48tTVw@mail.gmail.com>


--gwc63oiajlpzjsc6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> I don't know if the change in logic is correct, but if it is, you
> probably want to remove one set of parentheses:
> A && (B && C) => A && B && C

Oh, true, thanks!


--gwc63oiajlpzjsc6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmZnFMkACgkQFA3kzBSg
KbaE1Q/+KoqebFqxusVE5lFzivYUI31Do5UCPfhua/XuP3JD9hDjN9tka6K0lMby
cmpbYKpaTxvMjjdTQhEp+7oEw1YDQL8EiYDbZlLFTbP3AWVPPY04UgFGRjVLA0mB
CEGmakZNZ+YUzhKJxy/UuIndeQPkqnA62nWLm6tU2zeoPhbxKgxE7xfLTOXBT8//
aXv0dEAR66dR8/FOG5Cu2NA/QKT/eTTPN83vgLUDN/piOZnHKnUrERjjlc+J+rzw
YeEf5n+Yg21zcMSkdJFrpAqMuQXXEU1Fm0sg6eaEiupfVYzEcEqJlU/n2q6sqiFc
E9ttVkGnvYcFj5FvIm6fTdzvMUa1yjmvkElWshE0VqOsDD5ZVL8e4HTFmHJLUJvv
NfgH5uvWmOB7wED5hzD7ltPVOaJ1yfChwv0AYp5ANnBxe7qUAzVijtKjEttRSPm/
ECRqt/2v+briMRnWRekrVEYeyk3GE5UHGuoxJjVwkC0Kb0i1QyJCnIFZ7dtL1Ttf
O/kWm7gLqkL6kEM0kDtcFH3tJSs8l0pVC9u4v8SGXOCi0FIzb5MO1CiGSTYF/Jlj
59gd8fKk8p2LxqdwC3Sr7ow23bqMrU8VkQtu2PAJZkkFjfknRlYPYzf8EBha2tsV
o0HqCEKXNXPyouYR5wCAc/eB1umJsBRE0ruIZM/v0rkQO4FLkGw=
=xrXW
-----END PGP SIGNATURE-----

--gwc63oiajlpzjsc6--

