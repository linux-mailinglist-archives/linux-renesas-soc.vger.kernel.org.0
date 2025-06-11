Return-Path: <linux-renesas-soc+bounces-18133-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE43AD5EA7
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Jun 2025 20:56:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B75AF18962F8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Jun 2025 18:56:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FFD8278774;
	Wed, 11 Jun 2025 18:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="O0Su8fYL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E5722777F9
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Jun 2025 18:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749668190; cv=none; b=kx76R6pRNXzzrsscomqk6FxChdResGR2n56x0BEoQRnG2gsodZn7l61YxL2Zs2v5FDcpicoY/MPtUg3gjBj7hF9alxrRzwrEQC13EWNiGT0a1K4wNIjMervQnf0Qa3az7KurO14HMJu/XMwLtMlp7OH+56XfC6Z2BevMYg2XSY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749668190; c=relaxed/simple;
	bh=+sHLOtvVQAWPzK90izduJIoY+Zm6g8PEnogD+3ePDdk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vfmnxpi1yMAGY7zfCOyVXRXIlh41YYLJvd3y5QWE79DwIVRzoTim8RVtsSRo5eksiphOl3U44I1UrbEPZDCLtZcPh5mO9Kn6AuAl6amFFqQtOwhOlRh3f6mZ1PII2TM7cL0q8hjT14k86nKI+SHQq1f1zVjMMYJ3B+BwnWmoI4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=O0Su8fYL; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=+sHL
	OtvVQAWPzK90izduJIoY+Zm6g8PEnogD+3ePDdk=; b=O0Su8fYL2y6JCn4UtX02
	MxQ8BZJNCO6R1O8DyI5SQxIYUYq2CuHf4RF/TxYVy9Qilfc2b9attcXNGbmYOcos
	SfUSDlBGmw1Y0cSjfzp3X33b1JVjNIbwrnL+ed/nxle2WVaAWJcgL83xEC7V5KeS
	s3z4dCk20wFvFlGF8FFRRe3SoGaQ/AN2M0d0lgLm9afs2xQrPFQyGV2Csg5Oyaqn
	DwJAN2xeSjTdLKgblPllneWRFWmnb1HkNNccwRGsZYl4SWO0lPFOAQ463VslSb9C
	WbxHLglYdhvLLbcFRc1AZzXARaD5smw7dM0SvflySCOXhxR4ORo9G9GQAVIDBrKw
	yQ==
Received: (qmail 3350333 invoked from network); 11 Jun 2025 20:56:24 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 11 Jun 2025 20:56:24 +0200
X-UD-Smtp-Session: l3s3148p1@x1CSXlA3cIEujnuC
Date: Wed, 11 Jun 2025 20:56:23 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-hardening@vger.kernel.org, linux-i3c@lists.infradead.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, Kees Cook <kees@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>
Subject: Re: [PATCH RFC 0/7] i3c: add driver for the Renesas IP and support
 RZ/G3S+G3E
Message-ID: <aEnRV_ORTzoxv0sM@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	"Rob Herring (Arm)" <robh@kernel.org>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-hardening@vger.kernel.org, linux-i3c@lists.infradead.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, Kees Cook <kees@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>
References: <20250611093934.4208-1-wsa+renesas@sang-engineering.com>
 <174964724485.330045.2181706921272138816.robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="aSViWGA52tcJQoQY"
Content-Disposition: inline
In-Reply-To: <174964724485.330045.2181706921272138816.robh@kernel.org>


--aSViWGA52tcJQoQY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> New warnings running 'make CHECK_DTBS=3Dy for arch/arm64/boot/dts/renesas=
/' for 20250611093934.4208-1-wsa+renesas@sang-engineering.com:
>=20
> arch/arm64/boot/dts/renesas/r9a08g045s33-smarc.dtb: /soc/i3c@1005b000/tem=
p@4a: failed to match any schema with compatible: ['adi,adt7411']

I sent a patch for 'trivial-devices' to fix this already [1]. I forgot
to add it to this series, sorry.

[1] https://lore.kernel.org/r/20250608162240.3023-2-wsa+renesas@sang-engine=
ering.com


--aSViWGA52tcJQoQY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmhJ0VQACgkQFA3kzBSg
KbbGQQ/+Jku4T09kmX5TY0+yOrTfJx5eErXFxKVs/BqNK8vt10Uwi8RNOe0E8cb3
kiOQjG2P1cbu6KD/jH4hbKJh/AiQXUJTfYWt95PDLqsLTa/9XzdbeOE5BoH1syl/
UZ2vmjA5cEIUgdTx1YdHMK5XipyeeKa6giMj56jFajjXKayAnpfYn+kKDKgvfYs4
sYuIX1jyhOoJRP1DADW3sLrMXVBgCnmaKwbR05OK8VshzXjYDdPLZYgH/W6rzEb7
hZ4yT3vGCXYw5Sz7aVk1+q/u91ZhTAcz08A3oEhHmSpuuaeCViWk+mOpPhhHR7Gf
V18zhJVyapl4Mm0XfwgmeAp/g7iPsMga1V72ajDNs85PO9V2itHtpysMepHGXT0K
Jag70wsEDL+gm+eg1MWmx80ucltZ78ytY71p4mtszJ8IA/QTdyhf6FFXZeo+r/Dk
HmL7RWiFSvKh6iukMcs+/+EEfo5d0InJ8ALbTq9Slv/TvuCJxrIdOEi7K5o2vXAW
NhfzbJ6EyamcMxRmDwj4ubcVk/TQcu5RYmpMj1TrNgYgSpIRymhe5I0XLpLsB3Km
9dtw0bqAn7FLRcCyISn+TJK1L4FZ2Ps6fi5hFXUvyeM9uXP6R1yoy6EvTNeIDKru
FMPv8Xn2ksbKeP+a4rSVyQqJvmWJ1jhkAVNeq1LTjr2RI+OUSJI=
=coKS
-----END PGP SIGNATURE-----

--aSViWGA52tcJQoQY--

