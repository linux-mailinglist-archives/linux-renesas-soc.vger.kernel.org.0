Return-Path: <linux-renesas-soc+bounces-19596-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id ED157B0C2F4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Jul 2025 13:30:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D90AC1886482
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Jul 2025 11:30:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 587E915A858;
	Mon, 21 Jul 2025 11:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="h05tw4Dr"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D03B228DEE9
	for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Jul 2025 11:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753097374; cv=none; b=W80zl8slsSNgpVLQaI3dHsm2kKLdNJBl4gLovb618gXDe7iqC3SSQAaP9BOWZSX+EG+mAGWTwmllLDn8NvFS99BkAOuBBJZPh517+bMyk4PVSyMnQsyYkxBqFz7emWZCVnL4aFsgYQIBzInhZB0MsIXUuy09x00ZmcSuw0E6eZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753097374; c=relaxed/simple;
	bh=gGkVIXAjN0oHEuk7wBfBzhUX6JrnfqviRFZD/sRdWD0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qjODHmlOhbGt2+GGS71Y6qDuvEE9LPFo6hSUIowBBZj981vlpWGcZ7PiaM7OaU3XBfNM2nCrysQSZP1mLOQPCrYr3FXF0a73hDBbmQ1eo+Q9HzeZCEW+e5t0A8x6AJjMhpv1mvwAnvnIDJu2rL7Pkmt83ULLxVoaRYlyWOTS4xU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=h05tw4Dr; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=gGkV
	IXAjN0oHEuk7wBfBzhUX6JrnfqviRFZD/sRdWD0=; b=h05tw4DroinaNPYLesXC
	+p0vKD9KcoZ/rBcwCooTvwCWMcgyVeUuFLUTTWpYpOps3tA/ty+bRlhCYMYD4HNa
	SUjx9SZnYpyNOEAIprnEKxI3JIxkMYkCA9vPoZDthudL8FiPrVm7q/PmjACuG7TK
	3/vZHO0uMo9RqJOPze4Faxla6T508+dwCQOGZLf4oN7PBIHJj0T/45k84q1zF0/f
	E8jgtVV1pHJxEdFtsNtLG5xRRf+VI78TtDr6U06+pFgVUNLqyYLMsqJoPiFUfNun
	/zI5oMoGBKiSEdJ/ykaHQd3z+H7zLBjJmRLCKxCKBk2yf7YB0MYLtulVT/hCHTHP
	EQ==
Received: (qmail 889386 invoked from network); 21 Jul 2025 13:29:28 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 21 Jul 2025 13:29:28 +0200
X-UD-Smtp-Session: l3s3148p1@OKPeyW46sRVtKPBP
Date: Mon, 21 Jul 2025 13:29:27 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: Re: [PATCH RFC/RFT 2/2] mmc: renesas_sdhi: Enable 64-bit polling mode
Message-ID: <aH4klx3je64AWymC@shikoro>
References: <20250630081315.33288-1-biju.das.jz@bp.renesas.com>
 <20250630081315.33288-3-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QrOnRUl+cjunIQOP"
Content-Disposition: inline
In-Reply-To: <20250630081315.33288-3-biju.das.jz@bp.renesas.com>


--QrOnRUl+cjunIQOP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 30, 2025 at 09:13:11AM +0100, Biju Das wrote:
> Enable 64-bit polling mode for R-Car gen3 and RZ/G2L SoCs.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Same as patch 1, not tested yet, hope for tomorrow.


--QrOnRUl+cjunIQOP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmh+JJcACgkQFA3kzBSg
KbbzShAApCGtAmwcV14esMGlDs9+OxguzRlDxqP3oUWpLAEstGWxAzYrqat2P+7F
epbQ5BckCm+orHa2d5Zo/RVQ0KvSLnoKhjTHatYECOYEYLO8vZqYUZj7TFpCcb7R
Ch7eUX3FOjDAyKaVBZ8qJbwpl1ttSzJqAF/xVGOZVoUZDJhLORRvPJKIWaVtnRmc
3xBPeVe4vePKLcwnhiVfKgAj+TgQUH2xKgvzV6XM2qAECiHEphbRdZv9QNekFuw4
Cf04igvcCsthWffKam6tDr8dVMERaxn0IZCBx0JHJ9aFy14J6ujn7wDj3NYCO/2z
ZRO2XmmaV8fnNheq4WSL3vzXyz0VH/FGkZChutw8N3gFdknaf1+2XHsU3iPZ4Lv7
5cdmaQ6ddJ7qMqXb9aaHqdaBBo7LF8DLeNyAwu0s+wlfUOebuumsyAXYuDcgVKf8
W5loUZ+Hya3W1egEMglj6jV+MxvWXOkHqD6kJBAEZ6u4TsQ0WMfbabrorHYQsV9d
b+/tx+gHY3o8L5MfqfScaCE8+1yIp5grq4CbKkjUkVJF8P2O5Qr/lmwApNh3cxpu
2Mk+QtmAclORIpLQgw3pfOwTAFQnO7UuFvZWPEbDhyGqpGCH/UNzUGtJtI3pvRy6
RGjGjBedrzd2R1HsiwqJ5sZpWD/4jqen35o1GqszADqiUWueen4=
=0QyZ
-----END PGP SIGNATURE-----

--QrOnRUl+cjunIQOP--

