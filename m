Return-Path: <linux-renesas-soc+bounces-4348-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8603D8996A5
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Apr 2024 09:37:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1EB7E1F219DD
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Apr 2024 07:37:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F230152F8E;
	Fri,  5 Apr 2024 07:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="NJY0u6Oq"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14D93524C3
	for <linux-renesas-soc@vger.kernel.org>; Fri,  5 Apr 2024 07:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712302620; cv=none; b=eaF2jFwH6W5aFZ5BJAJVSAlW6EUDrfz5m1RqatBWJ/0SNAykeiAWkGXyS6ZO78UQA90sqeUCiIqlAtAZPEn2TJpp8LK7yRnjCZePrvi0YEN7grXaNxcGWIhf/Yxrc1L4ZXaMZ/kBf5lfZK3xZizSqzs5hqy0/Zi1tmaWJR6kILY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712302620; c=relaxed/simple;
	bh=tSw1iej0oL/IWob3Ulq8/H4sWQA0+hBYrrVjoW6rDK4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bt30KvLh8lzTwhoxWrS9dCX3ZBTmHhFo3mMGrj6LiqZyiyGIVwpdsJdiGlEmmXP/dFBu2YP3iDKSZIk9RAxOlvPiSOSgMLuSbobKVzsqtUFMQp6qmp3txeAq2USFd5zj/OC+zEiWMctjk3KwPKvRH5YjvWTLZMNP0Ip0eqWyFLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=NJY0u6Oq; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=tSw1
	iej0oL/IWob3Ulq8/H4sWQA0+hBYrrVjoW6rDK4=; b=NJY0u6Oqo9z7q3O9cqQf
	lomakjwhF3RyPJ5lkjpxo7Ig/u0QrF5Lj02MCbLDpljwryOIkmCdf9Hdg16RBg+f
	YjArN18IRxjZhGjmnNh0LoKqZzDlJ0Wruj1xyaHvgJRWbXPPEytW+4YxP3iUww6a
	xnrhrNhJ5705M6ijy7h0Qq9qIQADwenG0GgWIT51griH2m2osotrIt/vtCIUTwfA
	QCdpQng0qpoy5qGrUOU3yIFiXqzAE1E5prXrEkdbE6VLkSRl7Qhd3QKwLiUFoENQ
	s8j0rRJhuKAFIjuZGGcfDGOYEV9y87BYlnEp2Do1JdwvpOqWQ1AGj1mKJs5ojl19
	Jg==
Received: (qmail 4024238 invoked from network); 5 Apr 2024 09:36:57 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 5 Apr 2024 09:36:57 +0200
X-UD-Smtp-Session: l3s3148p1@nA49hVQVcMIgAwDPXwEGAANOsN0UmmrN
Date: Fri, 5 Apr 2024 09:36:56 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Thanh Quan <thanh.quan.xn@renesas.com>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: r8a779h0: Add TMU nodes
Message-ID: <z25yr54p52o62njymi7py4xlmh6f5g5eakcsamfe2gaqqtlxxe@2thjqucgdhxf>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Thanh Quan <thanh.quan.xn@renesas.com>
References: <cover.1712068688.git.geert+renesas@glider.be>
 <9b82bcb345f14ffd740156b6d41088e02d45e72d.1712068688.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lx75dmsze4sevhvc"
Content-Disposition: inline
In-Reply-To: <9b82bcb345f14ffd740156b6d41088e02d45e72d.1712068688.git.geert+renesas@glider.be>


--lx75dmsze4sevhvc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 02, 2024 at 04:44:17PM +0200, Geert Uytterhoeven wrote:
> From: Thanh Quan <thanh.quan.xn@renesas.com>
>=20
> Add device nodes for the Timer Units (TMU) on the R-Car V4M (R8A779H0)
> SoC.
>=20
> Signed-off-by: Thanh Quan <thanh.quan.xn@renesas.com>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--lx75dmsze4sevhvc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmYPqhgACgkQFA3kzBSg
KbYj1g/6AhO5B9ZCpfr30xW8dpCLe1LAhuVL2QIq2ik9Nm02K6kOe8hm47uVPP7m
KfhnLTjjvQgc6hWAun6RFE/RH6f7CZj5KUScouq85WNlViqdzelbw4+LafxoVo6d
j690hP6NvmN7cLg+9gqVO31ywbHws7NxjBdKih4lg5J/YgtblMnaprvXvIyU8Gl8
GVVw8P8dNV4DTIarcDg6XtZeLkLfW7UkRhvDRVjka68fQKGweFs88BO3gqmBLsvN
gR1OGwfxRSvkRpQUNO1PIwn8GctbGRvLUU3mfA8dgiKyECFh8pJcZKDXdXONea1m
zUP0VdYuxQopCneSUXEhLoiqjAxAgsB2E9pX4/CTwsnKNOrIaXSVYutVHK/6S+xE
Rrfwu4992YlvYToTucx01vWUrgseAWBw2noLMvK6/1qyzr2OQWa+JAQahk27GCXs
mE9ge5f1wGmVXIEzaVCLlTCOOy7rexdjcn0e4ZLhchDcmn4I8obNP/TC3mhx6sG8
4s4U8rtl0/Hqvaj4/Yh/psL2AzqqZjjKADL1UaAtJjx45gcK7uUBikSLLf69Dc6n
bEVTgN5wg3JWjWVDATnKvevoyDzt1csmeXRaYUKZhAk4affBANItTyKx4qZSrn3C
Ac0C90nDgRXe0hdYouv274zzhruJp1Vy2mEoeLywJSVaO8FWeZM=
=OQLB
-----END PGP SIGNATURE-----

--lx75dmsze4sevhvc--

