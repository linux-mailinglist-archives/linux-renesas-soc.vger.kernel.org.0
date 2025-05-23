Return-Path: <linux-renesas-soc+bounces-17462-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 39617AC2685
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 May 2025 17:32:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B1C963B24C2
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 May 2025 15:32:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4789C23C51B;
	Fri, 23 May 2025 15:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="ccPDq27S"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27C681C84D9
	for <linux-renesas-soc@vger.kernel.org>; Fri, 23 May 2025 15:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748014358; cv=none; b=JNfFUSGKUejU1qFn0E5Wn2Br6vgD5xbJ1aFjMcpGd1D4yw6IQa5CkApVbAJPN0US1dV2g7nJHyjSLchL29LTxWOKHoICTHyya4T3+NmhVAja4jr62WNrt5U6hb6wMXYBEdf04g1Xtk14gn1sn3ZL9ZJWHwETSo7L9BjTC1edm3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748014358; c=relaxed/simple;
	bh=lXCsVLwTtddatg+nn+pcyJHYSBYGcU3WP44kyBfV/K8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zcd0rPlRNBqF90oAWF4oy7XZXQxs/H1mgnuO0cgHjfW3CVOpaV8fkpcfjwbhIvVGAplGixB2X5QCIl0Wh8k6jKZMwD4wQIZSb2e8b28XYwgzTU2b6HMmFF1HFHk9GGUga8fTG7RqLuSTYlEymRBaspX2g3cJkUU4V1BJ73PBcMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=ccPDq27S; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=lXCs
	VLwTtddatg+nn+pcyJHYSBYGcU3WP44kyBfV/K8=; b=ccPDq27SAn7ldyn9CPTD
	E3xioQFuovavzDi0UY5Ia9ggxOfslp/pmVhJZ0+L2v+JCpNHMr3D89Fy9YXbPjn7
	stUwmqTm7hFdG3WaR3GNYlHA1wICBqOcj5RjkZvlk71ZOmnfswjPxmWnZEVnocZH
	9SW21fMfycnvTkIN+T+xj5sqW/Nkb0vJ/VSotxVCRaDOg+IBVkCf3yO48GmjKMyU
	7lbbqSke8owu560YFEAA89yiIg+0T8j0QfVnSQpFHdYBd1QkPIt51Ndam79Ta54l
	A04eF+zRHnKYm+3UxHoBqLzRGSpNMkdYrz8AYh1KD/1B1Ri27VQIgauwbFqkgkJd
	8A==
Received: (qmail 4090207 invoked from network); 23 May 2025 17:32:33 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 23 May 2025 17:32:33 +0200
X-UD-Smtp-Session: l3s3148p1@EwSaTs81rlJtKPAL
Date: Fri, 23 May 2025 17:32:33 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: long.yunjian@zte.com.cn
Cc: andi.shyti@kernel.org, codrin.ciubotariu@microchip.com,
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev, till@harbaum.org,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org, mou.yi@zte.com.cn,
	xu.lifeng1@zte.com.cn, fang.yumeng@zte.com.cn,
	ouyang.maochun@zte.com.cn
Subject: Re: [PATCH v2] i2c: Use str_read_write() helper
Message-ID: <aDCVEYGdRnl9YfoY@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	long.yunjian@zte.com.cn, andi.shyti@kernel.org,
	codrin.ciubotariu@microchip.com, nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev,
	till@harbaum.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org, mou.yi@zte.com.cn,
	xu.lifeng1@zte.com.cn, fang.yumeng@zte.com.cn,
	ouyang.maochun@zte.com.cn
References: <20250523165445002hUV3RCqhv6Xng7_bbUxlJ@zte.com.cn>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mg4ZxSxuCsqHtK15"
Content-Disposition: inline
In-Reply-To: <20250523165445002hUV3RCqhv6Xng7_bbUxlJ@zte.com.cn>


--mg4ZxSxuCsqHtK15
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 23, 2025 at 04:54:45PM +0800, long.yunjian@zte.com.cn wrote:
> From: Yumeng Fang <fang.yumeng@zte.com.cn>
>=20
> Remove hard-coded strings by using the str_read_write() helper.
>=20
> Signed-off-by: Yumeng Fang <fang.yumeng@zte.com.cn>
> Signed-off-by: Yunjian Long <long.yunjian@zte.com.cn>
> ---
> v1 -> v2
> Fix this in the whole i2c subsystem.

Cool, I like it this way. Andi, I hope you are okay with me taking it.

Applied to for-next, thanks!


--mg4ZxSxuCsqHtK15
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmgwlREACgkQFA3kzBSg
KbZJxA/+NYenoREEfGYRWIuwdVOcGcf+fweviT9dtESxyjspH4kZB/81bh7uczZl
mJ/xnxXFrBjuMrMMhtMt+NcTT1VF/3XhoWogXE4GQJ+X50rsxhjsDZdtWIZIQhVc
TVZlRUrXPkTj5kke9sy+8qocdeyrP4hDdDKEZp4R8G2YC0B83v9Cadhwl4ClxIoL
hne7FAoazJ1LEpHCmeUQxrJD9A7sjUr4fiZp0aFmgeSzViUAEJ5oO5Wtlq6T4yBB
F9izay1neHNuQsjgRGpe8nx/Zkta1EtfRKM/TTgJxC0+M33h2QTvbG5O5jIFYhHH
USsQTxajeJY532ZgAII1CSdGHC7FLFwwn+RsCFJtUF5helhqzdbxNtPnzwOPRoji
UeTnMwGGza2PN0USrtgy/5kxco7JxYuSMJxIj0g7J0IV4M+3fB1p9qU3iRnfGxrY
HtgTvmfnP+ONkPhzDq5sN3Ne8Q7CCsAdfk09UX4yDR13g6YFnpenVhHvDdT1wQ6H
C2X2OpYyzuj+tpozPiqfADjMXom7ekc3QT4JaNLA4EcQgPZP1jOslcoRrfwdzf/W
ErbVzYC1BddlmHwUDUNg3Erq/LjLOJFFg1ZkTlt4VMDLPHK5sZlH0aTVprMOmLL/
jmyg/5VA8XI+jseDwWI3+TP1GKIz/nkxaDl+WVw/t4lLxtHYWVc=
=8apr
-----END PGP SIGNATURE-----

--mg4ZxSxuCsqHtK15--

