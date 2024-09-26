Return-Path: <linux-renesas-soc+bounces-9089-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A302F987647
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Sep 2024 17:14:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3DF35B26F04
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Sep 2024 15:14:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDD0714A4DE;
	Thu, 26 Sep 2024 15:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="DAx4UMmO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E66184E1C
	for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Sep 2024 15:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727363646; cv=none; b=UK5PoTNWDhWW5mEL/NGbPwdL8qqaoc/x+dBlrylfp1CMo/8lnGJT1O7JQ9y3Bg9I5NDRzh2kfRmwg3kVM1f5gxe5ng4T0kFgd4oqlO/SsNkixAv2kqvClroNY3GsTliO0szR6v0PX5PD7HwFk6xqcURKDr+5BkGX98V5Ozj1EbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727363646; c=relaxed/simple;
	bh=E0u1kDqhxnr1ysNdtZs+jR46huzaJmlmg8ilGVG2UJo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q7o/hs3GkRMH2LK3kemFhPfb6Hsm1y1stbgI/TNquF8dnAd503IgnQAvODU+tdKul6hzv0udLCnIRq21cnJW4dAji6p57RN4LN9HSaqeDIw0/2SEzlcR1mU8IafOyl6kpUCZQ6cj8QfIzgNHhn1Yf1jbzwR6utw2KvyAsEpJ8VA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=DAx4UMmO; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=E0u1
	kDqhxnr1ysNdtZs+jR46huzaJmlmg8ilGVG2UJo=; b=DAx4UMmOH4HS3r/Iun7M
	iJfrgMR0eshVjLFV0ar7h5i7jQPrQgxPY4Kzbr+S24o/1I6sUi8eqBeYOSChK26Y
	xPvOsuA1a1hozRaSl/y9z0m3WTM1Tq6obCXCxrmBkTy/wwEZHx4o6ya49MYWVmr5
	L+/I5Pu3gb5FyIA0ajsjWGV/tfUk76qsTOg0KKZzPQanUWZ3Cu8o/AuUln7e9zGj
	S7tKclaKOyf1jIcvnzKUbByJCQObg7G7Pwse6487nG8ynGv80yub6SzN74L/La2s
	A1b3M6fYVQDbOkcMs8j7NUrGC4NySyPKnwK6jlcaJi4Ko42PCuGjpqR7qqQ6Qda/
	Ow==
Received: (qmail 1031025 invoked from network); 26 Sep 2024 17:13:53 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 26 Sep 2024 17:13:53 +0200
X-UD-Smtp-Session: l3s3148p1@ppXBLwcjXsZehhYc
Date: Thu, 26 Sep 2024 17:13:53 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH 4/5] ARM: dts: renesas: genmai: sort pinctrl entries
Message-ID: <ZvV6MfQyH5Cma5kG@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-renesas-soc@vger.kernel.org,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
References: <20240921114813.4124-7-wsa+renesas@sang-engineering.com>
 <20240921114813.4124-11-wsa+renesas@sang-engineering.com>
 <CAMuHMdUpW8+REtap4dwKyqEjwbUC=h=+JiidhzidBGJJYpTLuA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WqIS/9GDZ6dZLZpR"
Content-Disposition: inline
In-Reply-To: <CAMuHMdUpW8+REtap4dwKyqEjwbUC=h=+JiidhzidBGJJYpTLuA@mail.gmail.com>


--WqIS/9GDZ6dZLZpR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> If you don't mind, I will fold this into the previous patch, and move
> the /memory node while applying.

Super fine with me. Thank you for assisting!


--WqIS/9GDZ6dZLZpR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmb1ejEACgkQFA3kzBSg
KbaXnA/6AzPm/cYu95sUxR7NLISIaxSP4Oy5eJatLFGEENxhnnglnpak1G05AjXw
3rMDSCg4lHQo7PXxh+OBLl0EXmKUyBzxsRO9f1zTO8P7dquOsGsBIN9BzPjnzIBy
n0Lo3474nxcNvdckMiCsfLh42/uHyJTThKI6xU336HO3AnsysoU5w3A0CHX5SYrS
yJLd4+egEk9KuDBhaYKwlpOmRB7DjXLxTWFBbeT6E+LIJb4wFqgGS/pxffVZNxSs
Upr9JbBUPdzUntY2jf91C2NhLNNlDs69a6R72zmj8kWU2LANNKy1l2DcJg++pWKk
PHRgnyoOp0pcmcrVuJTx9D2FApL5P4xI09dz8+kCkg5xQeQQh8cd3SB0hoWkiwYO
wKUyYPeP2ZZrMWutwcT4Z268mlJpbOWL7iEg1frkWuExp6Zl0xwmQNz/iQckRHpK
M/OTTDgpUNeA9PMwnUDyDEhK7LXzXqH9qbFXK0WFmr+pZMNPgMNlZGFvK+1rpWJQ
RvagDWH8bYh+nYhY9TjmK1Vi3st+WSb26ORgtIXIQOwxdp41o6f9B/5w2o5FEomK
YN2Cx5S78JNu4qtflpQV1SXTVz+gJyRGEzM81cR8ezxBDJaLsns/S/vnOiYybck0
yJPRdCNvm3biTV1sHw9wKzD9oVj9KAGobJ1+lh4T2ECDZjWM2js=
=+8Wn
-----END PGP SIGNATURE-----

--WqIS/9GDZ6dZLZpR--

