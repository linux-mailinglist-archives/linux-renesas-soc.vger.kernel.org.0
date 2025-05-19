Return-Path: <linux-renesas-soc+bounces-17204-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 44734ABC143
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 May 2025 16:47:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7612F3A8B69
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 May 2025 14:47:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E9291DE2DC;
	Mon, 19 May 2025 14:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Oa2i8hLG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36FA91D5AD4
	for <linux-renesas-soc@vger.kernel.org>; Mon, 19 May 2025 14:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747666059; cv=none; b=NBa6DnRM+NmOdUhfm+94/RyP/JqoWR2EbtWpZCoHqyJ98BT+FSgS8JOIPd1xHce0PT1Aq555eC1Z8hsD5A+j0+CC8cpJpejc1BWDNgXB7kJ8A8tRv/nDYV+6b8sS37O8y6CRVjchG479gCa09cbdY2xOe1/UTtuDn4EPcx3SSyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747666059; c=relaxed/simple;
	bh=DaQWvWsw3oOgXKm2fONwUyOY8e59GUzYmRtivJS0iws=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZobPo85n+p8Pf5+Fvjq18wf5BIrYcc3aJAuFzAgmMotY8I3FKhDMLQyNJ5PoJwKQBLvL5tBc/GwmFRUYHhJL9Ct+IYSVJq5blQUnREGvwDq3TC0c1DrU0sbEoMtrueF1lf/TgjOMY+y6RXqUYCC1tdTa06MDSRn+YAUSI/1E91o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Oa2i8hLG; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=DaQW
	vWsw3oOgXKm2fONwUyOY8e59GUzYmRtivJS0iws=; b=Oa2i8hLGt0Jdgu81TAxR
	42Sq/n5Fy06uXNsziux+wldXdqK8G8Z80rUrQNuT+3gELRNOV36sDV4bOgtcWFQh
	WbtOMLrjM7t15wXZOZGj2mmPwRKmvpu2+zfGlbhbsoFIUsdd+G4+5ABdYKF1nVCn
	7T/xLeRYiPSx0ZpyRsIPHve6rda6mcFtludrKaa4PHiNj4F2AUcmMx5oVi3zJrp1
	mu7hWjngUZV4Zm/vwcgGsj8VzBCyLNjjOQk7bm1s8O2gjN16+gLSZcN3cthfmLlK
	klzN7Nm/6Isc29qsKwJvByK1Bt0iBEM4smkLBBvfsSVe+gJqoRJ7qdwld5sGuLry
	EQ==
Received: (qmail 2526926 invoked from network); 19 May 2025 16:47:34 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 May 2025 16:47:34 +0200
X-UD-Smtp-Session: l3s3148p1@veEiNn41guhZz6uL
Date: Mon, 19 May 2025 16:47:30 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-renesas-soc@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Huacai Chen <chenhuacai@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-riscv@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
	loongarch@lists.linux.dev,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Rob Herring <robh@kernel.org>, Samuel Holland <samuel@sholland.org>,
	WANG Xuerui <kernel@xen0n.name>
Subject: Re: [PATCH 0/7] archs: use proper node names for GPIO based I2C
 busses
Message-ID: <aCtEgg55uuXQ87HP@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-renesas-soc@vger.kernel.org,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Huacai Chen <chenhuacai@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-riscv@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
	loongarch@lists.linux.dev,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Rob Herring <robh@kernel.org>, Samuel Holland <samuel@sholland.org>,
	WANG Xuerui <kernel@xen0n.name>
References: <20250519121512.5657-1-wsa+renesas@sang-engineering.com>
 <CAMuHMdUOXZOe++Zpk_fGnPuGtQARN1fLQvTr0YX108OzZi4YmA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="N7Vk71n9RCcoPa7f"
Content-Disposition: inline
In-Reply-To: <CAMuHMdUOXZOe++Zpk_fGnPuGtQARN1fLQvTr0YX108OzZi4YmA@mail.gmail.com>


--N7Vk71n9RCcoPa7f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Hmmm... which of these changes affect the R-Car board? ;-)

Right, in this series, none :)

> Am I missing something?

I tested another series on top of this series with Lager. After the
EmbeddedRecipes break, I forgot that only the next series affects Lager.
Sorry for the confusion!


--N7Vk71n9RCcoPa7f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmgrRIIACgkQFA3kzBSg
KbbgVRAAmUME4MmnnZpUQF8oA9Puxa4+zkHCjVgbOIgusPPh2aR5/c0/7PUXw2Bx
ukaYwg8/xwbBBinpd9xhp1DmqZGsGGSJO5XLiNKrX6OBBaMNZpd4v5Ei9z8E4UJL
UlVumquQLHo1ZDXbOfcDNkMfUrNnX7TtnZ0c30giIbm6nonKr8s+QYV0q7lC/DpI
Oltxl6kw1P/dWfnL2NJz5TyspBwEIHcocL7D1PIIfvtZEgVQnHSZFrh6fQBpcX4F
54FtZCi9DDbf0HZm9EfFzz3ZwRIZlzRW1Y9tgxl2qpX2Qp7jAM8wTVt10o4l4ETp
M7tnC4Z1Kuu8H49QB/LjJg3QzJbwbxpEFXATgxtu6AzlkNx/IiNXWalPyfnSu77v
ZOMT0GEooVmBZQsDZdOhW5MlPHkOZ2J5CSaGL/OvuFv5yU32ptbpaIbg2zrz8TCa
k80QJ6g6yYIyWnYYWW3qOMlp3UFBecMKI9ySmCdrgJBFA/1dPeaj2oaS/QcTWMh9
ZF2/zsYXssh8d3RBIUeNSXjkPtqa25SQkSadSMtBp1qnf7krcS0BaYwKcFFEmMAL
oxBozBVc2c1cTc5A0ASRTNBObEw6GNwm117KzDjFvKaToLfpJjh6miCw7u9VDYV0
SwabTA88Llt75S083kfsEK4rmvosJnLWTNuClppH+ziwVhboPa4=
=DyAR
-----END PGP SIGNATURE-----

--N7Vk71n9RCcoPa7f--

