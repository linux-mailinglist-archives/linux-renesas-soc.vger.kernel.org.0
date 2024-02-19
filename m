Return-Path: <linux-renesas-soc+bounces-2955-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B1F85A6B3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Feb 2024 16:00:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9F2742838B3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Feb 2024 15:00:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DA4137704;
	Mon, 19 Feb 2024 15:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uF8g079K"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7352A1DDD5;
	Mon, 19 Feb 2024 15:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708354833; cv=none; b=VRJetSucHpBJt417Jmgc15NJSVPDrvSo0ksrum9UciH/FtC5y+lsjgvU+v3p1JXFehQVIOpvNdCORxRZekeYI7YiWI3Nma1Ez9VnR9RgXR2+Zz/NxJK6uPPP4LTFOPT91QvSaoadUxM9QB+KUagTeejoj53C9OqN9yZMhbgee+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708354833; c=relaxed/simple;
	bh=a6lyAmlE56aHTQTNPwgweXDP46yyIT+YlcRQ80DVnOU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X/TdRWkKW87r8J84z/hMU4V9+RiHULeGlRchPafRpySVxLTuMg55yyjncogj0aTbtU5NsrxqlFhZBcZA2xTvaqiZ8YKIeKkFMbLuar1uQ5h+yHhl5p2KV4mKfjoHXHaUwvv6RAV1O6KmZ5+Z+0gan6TxUBvj4T/aA0Oizib4ZCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uF8g079K; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D01BC433F1;
	Mon, 19 Feb 2024 15:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708354832;
	bh=a6lyAmlE56aHTQTNPwgweXDP46yyIT+YlcRQ80DVnOU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uF8g079KYgIwkkWtAQoC629bJISmGsB84YN1Sm5Epj63ipSvYmB/W+Ll2eSlY6MPS
	 375ZlPucg/7HBc1Ukl+HT/JyjCct2dw6o+VAJ55uCePApWfw7puSineo19XHHE9wIg
	 ws/SeQTIBVcZeLnfCT0T7v/8cWS80pgyOqAvEXisnIu3fqkjvBjlYHGjSMY2ZeBCFF
	 rvIVnZG4s27vJ1oNSVlzvZevthmz56zIb6/UMwwWbFf8uDdftaKnkwDu5g7zluM/Yw
	 M3bDIF+0N4+1iXsLVejxrFVosa3TMzI3Voc8ZPqwNt1mEIn9DsEH+UXq+FNPe3J8+7
	 Z9rPm8zxzzqnA==
Date: Mon, 19 Feb 2024 16:00:29 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org, Cong Dang <cong.dang.xn@renesas.com>
Subject: Re: [PATCH] clk: renesas: r8a779h0: Add RPC-IF clock
Message-ID: <ZdNtDcNgmAJCppwd@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org, Cong Dang <cong.dang.xn@renesas.com>
References: <07a72378ca64b44341af960f042a6efd41d10dc3.1708354355.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="s204NvcoCoouzZlm"
Content-Disposition: inline
In-Reply-To: <07a72378ca64b44341af960f042a6efd41d10dc3.1708354355.git.geert+renesas@glider.be>


--s204NvcoCoouzZlm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 19, 2024 at 03:54:09PM +0100, Geert Uytterhoeven wrote:
> From: Cong Dang <cong.dang.xn@renesas.com>
>=20
> Add the module clock used by the SPI Multi I/O Bus Controller (RPC-IF)
> on the Renesas R-Car V4M (R8A779H0) SoC.
>=20
> Signed-off-by: Cong Dang <cong.dang.xn@renesas.com>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--s204NvcoCoouzZlm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmXTbQ0ACgkQFA3kzBSg
KbanbBAAp2cQCDFmytCFVjoTbMn3meB/0b4Ux8eARJhkeWY+VOrl4Jh4yVC6/cnL
aOdbyqdHnxZelLYKElX/mrsvcb08doZkwGvUtEf1KXyBFNwr3eUvxgzLsFwxZeYy
LMnQyX1vKK3b9i/p2qyV0xNwzNq8LDX48l6l/2OSTMgzJgrMlTC4mEqOaBzgPdwb
aD0N3jV0nhmytbAM25131xutcaE6v20vinkZSrqi+hjd9hYPz5vDI8I6kfl8Xd3H
mQCo9QwjcPdaWcYFaoxRokNK0o8Zajt6RmyWJ9PLyh433Nl34VdVBrvhG88mMhPE
AstyxQ7/+Jjx5DV4MlwNGr5qBpdx4KIeRC9zXv9XCkqLhhjjrpVcsDzOsIzpe/P7
A0R8+UqcD8hJhPg3DcnTozR/6m9MbW7DfWsgIPhd5MNHGHgZ38VjExIs+JQ22Kb0
HMRvJWDaMKBK8lNb6wsTu9GaU4NvR2zpAyHSJ7QWOt93LEoDm94SLXB0FtXoxUja
IodaxkWycY/kPh2D2ZqPw8WfgCtP9Rae+obgi44nXxSBEUjicLLVNfFj8EbKLPDv
KWJ1Mu5lPgw67IZ678zRTm08fkNQccIY5fOwtxxXCIJB4djlQPAs1+THGqpy1ThV
6T99USRsJOVoAHAr5FiFybDsLqqsK2u7eAnqRH0zjyI/Y4r8k2U=
=/2b1
-----END PGP SIGNATURE-----

--s204NvcoCoouzZlm--

