Return-Path: <linux-renesas-soc+bounces-18438-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 76225ADC942
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Jun 2025 13:23:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C73031890452
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Jun 2025 11:23:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 596CB2900B0;
	Tue, 17 Jun 2025 11:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="f4aGZJ0r"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC36628F508
	for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Jun 2025 11:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750159383; cv=none; b=IaVSpCIzN1sY6tm0S45GgrdZYluKKndBif075HS+HQDH2SVP4CI2RDKyTU9ZKh+q1pSwET828j4hEDgN75CxSDFzPlcCyYXfR41n6enq+RM1QDkj1sanHYB+6I871pV6k1o+HwdcHhQcVJVqPCrE5nPAUD3ynZUVqS8b7zwNupg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750159383; c=relaxed/simple;
	bh=R31mfLVjC+uIfwrmWjgoOWoNymzfUBxIN2PR9MEKejw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MHR+a2VKUQB5UO3Ai5q9E03Q4TZKzrgmNWS7tKff/hap0svI4w1q9F+Ja/+ch/DcY00yJyi/GxhtoFbhAmIF44Ki2blSX8TXn58Z2EEtQiFvuCMR+99gpgZiLdLmdfymQkBafTI8P54HvNXabmkG02tSO+Op1aSYohqWnRYz6OA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=f4aGZJ0r; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=R31m
	fLVjC+uIfwrmWjgoOWoNymzfUBxIN2PR9MEKejw=; b=f4aGZJ0r2eY9FL211LTc
	nBiYVCeQ1pBudoLeBYLQxlbaM1mL5H1tfTTxIwqBZWXNWEgJpJGgN4Dh9sEakL+e
	4Yy2taOaUTWy8tTaAr56THFNC+j5b0/wKhhiO1TUhc7VGDZokn8ixZMSpGZWchs7
	g/bCnj/+Qb6F10q/hATqYeNVDEr+hB1MM5pYQpmmAw/m6XgmLfmWNobliZ+EevWW
	E/pE+ZoyFzRiDxnD5V6K85V8ukevLfTSROb5shxqLmNP9OL3jUg30I+WnCrKrqIX
	5w5VI3235dta7q88KtlL5hokZqFBC0rlwYXySKlGXqjQRVIRLpk6kgqsy3ZxDt0i
	5A==
Received: (qmail 1628810 invoked from network); 17 Jun 2025 13:22:54 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 17 Jun 2025 13:22:54 +0200
X-UD-Smtp-Session: l3s3148p1@oOjOu8I3vOsgAwDPXy2/ACpZfVCNKldR
Date: Tue, 17 Jun 2025 13:22:54 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-renesas-soc@vger.kernel.org,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Magnus Damm <magnus.damm@gmail.com>, linux-i3c@lists.infradead.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH RFC 4/7] i3c: add driver for Renesas I3C IP
Message-ID: <aFFQDlFJXFRYgNAN@shikoro>
References: <20250611093934.4208-1-wsa+renesas@sang-engineering.com>
 <20250611093934.4208-5-wsa+renesas@sang-engineering.com>
 <aEmws+OtHirrUPUo@lizhi-Precision-Tower-5810>
 <aErqY0QWMRdC7Pvg@shikoro>
 <aEsDj5Vcb4zFJFlo@lizhi-Precision-Tower-5810>
 <aEvyfM42WTKENbFO@shikoro>
 <CAMuHMdXW_4gHSTo0roNUpBrq2gLVBK=6zY_=rhh8OP85KJdqTg@mail.gmail.com>
 <aEwjU-uq4XsNzrOO@shikoro>
 <CAMuHMdWOxBfwwXUpYpmB30Zpqdwgwa2d=hXQyYVsoAD0bN4seQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="O2Q7uDJpF2xSamsp"
Content-Disposition: inline
In-Reply-To: <CAMuHMdWOxBfwwXUpYpmB30Zpqdwgwa2d=hXQyYVsoAD0bN4seQ@mail.gmail.com>


--O2Q7uDJpF2xSamsp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Thanks, much better!

Sadly, my mails still get the "suspicious header" warning :(


--O2Q7uDJpF2xSamsp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmhRUAoACgkQFA3kzBSg
KbY/0hAAqxtUp1HKj3ttcajGfvAqnnYGkByqkVYRsKoh2N8L1pPnXh+C2oOGG/Lp
r1UbolNPnZZ4Asms7E2AeuSxbcV5Qg0Ovdt1qJdZJyKWj9XwY7blcTJgkfGzEY40
0IoHGxAtyTXB7wa+CXgop1Ei96OkQeNnKr+5IICrsHL2i0Ql5i30uZpBKnDkMep1
QB5paadPrC8kW77HhwQ+BmCjNnrzhVbTAAfiQlMbL8uU+XJA5zHVNpFWBu8Hz4Qn
Ux9fxoFnbcFRUKMdUmZJHjcJUb0zwoGdFjcsY+8pwYY44yM8ck1ILD0WgCCeuNv8
2exsBRkHPiSKYLZx5aZgiel8iBLeuTctfqKUTSkBqNmG1RrX7nLmZ33dhqSN7+vd
zySKU7rxqCCoQCaOkgWaAb+tZXW6HXR2iEFcD896zXTRI5/xv5kKsrf7nx/WGWe0
urFU7RJhKoY0pz2VGf+AfmivueG3qoAvGXVgC0kEW8xuTK5CX/BQFaXTfpphCu24
nW5d1RafZ2thdxRwoUiwcwBRf2tQchqCoxi2ZNfoTM9zKzoBnel1eHUIUIfpPze0
9eq0zSmPfyg2xN7xmTAlN9FtbweDDH82eXyJXUuyaBiiEJG98ij07XYmjX4ttJ+/
RFqwmYmV2O5z0MuatSf56eIj+KC1lTI6gIIhssx8ZMzzmB4hoM4=
=MwTx
-----END PGP SIGNATURE-----

--O2Q7uDJpF2xSamsp--

