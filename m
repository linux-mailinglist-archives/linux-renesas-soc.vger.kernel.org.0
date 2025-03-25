Return-Path: <linux-renesas-soc+bounces-14818-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A92CCA706CF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Mar 2025 17:27:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 503821893823
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Mar 2025 16:24:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 911C925D1E6;
	Tue, 25 Mar 2025 16:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="PJ1V+p7+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2F8C19C574
	for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Mar 2025 16:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742919858; cv=none; b=k6Xs1rCrK4I3X2NB+cmDmJJ+oyHgjqepa2cD0eaEbYU4RM+g0J0Bd+IRp3I5hRA58pXV2HRM7/eTmx//Tac24wAo5pUSm7JIGyqGe6gLkh3ifX3xzVj6jwXWG0mYVLdEdYDYb6cA1GOaXV4eH7+QGA4+/ILQ+t75FtzJ48gm8eI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742919858; c=relaxed/simple;
	bh=8envqdz1HzVBk/AC7bUCztFD3Rt0l4ml1ELc4W8/Jns=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FObYchmyZ7RqeiXPiWfPXugE5wlRN29crAjFC/gXX6Sq1s1zGOpYCn49rD51MWZSvUNlzr6PYXI1rss4Loe8b4Gm3Gjb3TX2nFp541xKuNNwQtb8QnK0tkmTGBm0dv2U1QYNPwJT035nqUoIK1OnleUJLMeDnf3Ontc3irkgtng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=PJ1V+p7+; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=8env
	qdz1HzVBk/AC7bUCztFD3Rt0l4ml1ELc4W8/Jns=; b=PJ1V+p7+M71shBjhIjt3
	gvk6z4VFbYRotNfxRcfpM49VJnSiB0qcvt8vK89F+fB90LKfePxM06ikYlkxpqtX
	8PpuOaOucRD+djwr0Tw2yfwkmLpVXK43fjG8rp2QYxOwEInd6g7cRjfhcSLLtcCj
	UNn1NZs+z99dTQPPm2VxYWn4uZ3i/N0OOLen2RlKDozNtG4+GjNJBpWkdJkcZuxm
	//XmVEthnluyJr1vE4ct/Oi6pp+UoqVdqE8Yz/pp4rWh0aYEaeB2YNpEjhUjWZBF
	kcjaTfcFILXcJqZvQvzISS/IJe89z9agkfsU62YthF/d/fdZtZLQlF8wbTGFadBT
	eg==
Received: (qmail 3150851 invoked from network); 25 Mar 2025 17:24:13 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Mar 2025 17:24:13 +0100
X-UD-Smtp-Session: l3s3148p1@AZ28Ji0x7usujnsv
Date: Tue, 25 Mar 2025 17:24:13 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
Cc: thierry.bultel@linatsea.fr, linux-renesas-soc@vger.kernel.org,
	geert@linux-m68k.org, paul.barker.ct@bp.renesas.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 13/13] arm64: defconfig: Enable Renesas RZ/T2H serial
 SCI
Message-ID: <Z-LYrS3g-A17yQF3@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Thierry Bultel <thierry.bultel.yh@bp.renesas.com>,
	thierry.bultel@linatsea.fr, linux-renesas-soc@vger.kernel.org,
	geert@linux-m68k.org, paul.barker.ct@bp.renesas.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250325160904.2688858-1-thierry.bultel.yh@bp.renesas.com>
 <20250325160904.2688858-14-thierry.bultel.yh@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2sIjaC3kYYWGMAIO"
Content-Disposition: inline
In-Reply-To: <20250325160904.2688858-14-thierry.bultel.yh@bp.renesas.com>


--2sIjaC3kYYWGMAIO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 25, 2025 at 05:09:01PM +0100, Thierry Bultel wrote:
> Selects RZ/T2H (aka r9a09g077) SCI (serial) specific code.
>=20
> Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--2sIjaC3kYYWGMAIO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmfi2K0ACgkQFA3kzBSg
KbaTKw//a/WIeIycQC7xEn8lZeof/blj3eX+KR73rn+D3gNXu/Qh/EP7NDp/XqKS
GaLQn4I+/OpfTOjLJEkLICKcqTKuPviZCTYFUOFFgDULxCpHPuOY5kNSEWjrbWCY
qdVf11KDV+UbugjuZZRqbxl5Y+Chz4rmcQVCvMhrWDy6hAO3+BCsnBwZgJTtV7Ze
GT6fzQbuqVcn97SI9miknopovSU0NQjP4JhRtyVh8/+RALA08Mq0Vqk5eVB29AI8
XabGA8w3PKQMrFMGxV+NIjJ0sNTByg/YioMehqvuuXICcgYGk7hE1gB1c2jQwmLU
mppJGFtMFLyL4sadWTYr4WhAcHTRTSVlHtaKzDh62EmVT3TQdxJcQLPnx60GjB+9
sgOJCvfa9KLNcO17/s1GU2o1i6gj8CqWN6LJ6UgMxR3pFakReiczPMc5Bsznwxzz
YURAqQCKgIrepcN+00hclxyspZxh7gM6GuQ6HVCvLCHTKLD0MbTHUj8TPlAKcjlB
BFYnh570b3w3bRL4ju79Eg1QmD7fFPrePBn5+caekYaMDaVnEKxcIp0N7bsu39no
11T9b9t/eOBixKYmGJvhTqtpX8DZl43OWMw2PnZZO5P4oy47HqqnrE/SRkOmJ1M1
EUhhldymmmxpC5XCR/FqOrpsk103tozwD4VIL0N2q5lHfrvqEEM=
=6Lzt
-----END PGP SIGNATURE-----

--2sIjaC3kYYWGMAIO--

