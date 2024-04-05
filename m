Return-Path: <linux-renesas-soc+bounces-4347-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 133588996A4
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Apr 2024 09:36:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 446561C20B59
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Apr 2024 07:36:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7FD04EB3D;
	Fri,  5 Apr 2024 07:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="g2wmg619"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E8D74EB30
	for <linux-renesas-soc@vger.kernel.org>; Fri,  5 Apr 2024 07:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712302615; cv=none; b=XC1t0jsiZ1Lt81MyMRbIR6o25VM+QyIKPKTTk3W9ZWSI0Aa5YICkzkFIL8fTqw81H7JQgP9NdLwGKaHSnjkMEBdMM9zNiLqU1wukrotUYDarvt1oc1Ypx5+HKbXjNYYVXpePnvt0LT039LdznKoKsv9ScEPsS0VOPf+sVnsQtCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712302615; c=relaxed/simple;
	bh=N1ReYLLoeB9GenjYlMRHZNhM3gyiOhTPz6iblC9S2nw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IVaj1Aju+VXLKxdWGe7MmZlxtBSv9ki/5WQQM06p78D+q2S2jm5zPtBG3AzFD4QpZ9X4P/mGdvse0yXeVzqtG4ZMVV/y1cpDLyYYIt6k47r/jS5vk3fVG4BTQ3G4Xf/2JZ4lxZGQnxAFubiXmoeR+Jqgo//Gu4gP8SJM91pnmGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=g2wmg619; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=N1Re
	YLLoeB9GenjYlMRHZNhM3gyiOhTPz6iblC9S2nw=; b=g2wmg619I/HR8gxkBA+z
	DxSW2RQtT/7OJJ9aVJzZwA1Yqr0r7zixm9QT9j0ZuZhk/tpe8YMdZOB6M76u4ien
	TA594boc2mWPN6ALcSCeCM8jbCS1YBtxjmWblFwE1PUudehD0utzL+pGnMIfd4jR
	DHOdBy1xXNZUv8zxWVeHIXIhmvpv55Ft5AIXvRCi7RDoI1GMq2sFpzIh9VmTDCiK
	PcJCvNT0fRkkmZU7jPjmExP/NqHvKFwT/vMlLJRYBpDXQ/yF2Wh/H1Gdah3ni1Xi
	ayy9nKk5iD2WhTeGHmBugxZIPHaixr+tjc9TE5Pd1ceGC/NPtfdD3/SHd8foLWwg
	8Q==
Received: (qmail 4024194 invoked from network); 5 Apr 2024 09:36:51 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 5 Apr 2024 09:36:51 +0200
X-UD-Smtp-Session: l3s3148p1@YmHghFQV0NIgAwDPXwEGAANOsN0UmmrN
Date: Fri, 5 Apr 2024 09:36:50 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Thanh Quan <thanh.quan.xn@renesas.com>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r8a779h0: Add CMT nodes
Message-ID: <jms42dcj6l2u4i2pkrnf7z7nv3yqqvwg6p2c3skxlm4iwuaxwj@ibr6sts7xsxq>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Thanh Quan <thanh.quan.xn@renesas.com>
References: <cover.1712068688.git.geert+renesas@glider.be>
 <3c7821e051b880d46be5441dcb571f4c9d0ba408.1712068688.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="o37rqljuleghvnge"
Content-Disposition: inline
In-Reply-To: <3c7821e051b880d46be5441dcb571f4c9d0ba408.1712068688.git.geert+renesas@glider.be>


--o37rqljuleghvnge
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 02, 2024 at 04:44:16PM +0200, Geert Uytterhoeven wrote:
> From: Thanh Quan <thanh.quan.xn@renesas.com>
>=20
> Add device nodes for the Compare Match Timer Type0 (CMT0) and Type1
> (CMT1/2/3) instances on the R-Car V4M (R8A779H0) SoC.
>=20
> Signed-off-by: Thanh Quan <thanh.quan.xn@renesas.com>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--o37rqljuleghvnge
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmYPqhIACgkQFA3kzBSg
KbaO6g//c1IZv9UpRNwfATZdrY0F5S6Tp8/QcXweMgVHomaZw3VhXu7+8dOmk2r7
8SBQ2d/3h+EiuJ+DQV/m3G9qjuylcdiCA4qJNk5eiBJ9k77BVLJj8mF0h4/NRMU/
cUebNN8Hckdoj6SrxWG3qfb2W2RJ/ENs97uOmPnI72mXytsNQILXhJKm57gu5n5h
TwiXdT/DRff7cAiW4akIiwKxjxzSqigj9OQVUjJXN2gBufhvZkr+2QA6ur/i27z8
iPro7pyeMKRxlJwGQwMDqrIqUic9wR9lvmzySXJMae2rBwGnAw1KxxJPNxy7K2Po
ja8IzSCrggzj1+HHlknyPmgv+70RPx/gaRi7nw0dZYVVxqxoQs3pjnshQR4vm+ga
Nihg77EAxs/YmyEQd3h9Jo8YXVJNq0hQhutfyIVkQhvxIaxRULgAFPecf64n487Y
aslcOFg+ab0bZqpY+NS5o9vdPOj2YEUdO/WnOibtUgkco6lzVxxZAIT/mtDOaewL
G/kuTilMDde5igexCEyomGciDQcg8bx/KuuRwPh31XzV5uMaviYrGa8TXyqCBOB4
9x5/NbrRQviJbcaotH1wJwIn7gUPPe/8s+K/hONrCZTeUUxcZpbs6mZkhhrvKdOv
Vlhxj/t2DnIAgEFNm2aLE2TZEEtlGZAilMxihBTR/g8+5SIJWjM=
=YhKr
-----END PGP SIGNATURE-----

--o37rqljuleghvnge--

