Return-Path: <linux-renesas-soc+bounces-2309-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 860FE8487F8
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  3 Feb 2024 18:40:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AEFFC1C23344
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  3 Feb 2024 17:40:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 038C05F86A;
	Sat,  3 Feb 2024 17:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M2e1DLCg"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFA6C5F54D;
	Sat,  3 Feb 2024 17:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706982007; cv=none; b=VlgWoSV2s/hv5dI7YtHDjS96c4OvyJBbIMjDWUeyYTL/u7l7IX7fsKd0XnIPF1hT1nNWOwJwczJCVwb5KThJ9Osfng44kNnCKFsnwBy2Gfg5QdJfLwzmzDzAu0C08Jy0PQoQQnuD4JajGKVoHYlllhXV4Mg/rcTpwaObEDZi3Rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706982007; c=relaxed/simple;
	bh=sJ5dR86lqOLETZ/oJMT7ifSiCYggbtLFez7bSt5sqcc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CpR3qiUrwV2vVoTqmD4R9ijoAMCB+5sLGn9mRxR6Nhw8kbgvAFyy1y3mw7/pH45ScfUIGHsFskgArrKsBks1tCgsfDHzTieqZh3YlGuv4DmPYq51skSLFnnhZr1Aj4SjB0xP0VBKRPMdWo4qd40ugQGu04BTvAWq9t4KJ0pb1Wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M2e1DLCg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33BBCC433F1;
	Sat,  3 Feb 2024 17:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706982007;
	bh=sJ5dR86lqOLETZ/oJMT7ifSiCYggbtLFez7bSt5sqcc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M2e1DLCg5KpL7DlFboUD9dF7xJChMqfnRD1mjB+Byp7ePdrNT6Is8JN194cYCoKpv
	 GpiliENoCOyHe+cewfzcT8XsPewQYT5uHWdr5pV8oA/0JMze40L+1s+BHJvjX7kE/L
	 9TF92CnoUUcPI1whueht41Rb4V9KXmPrLwcENtZOe20tPtCIhKULda3CwKKWGGSbuz
	 zWqXFIig/hCMMNo/y1q3zTf/WWS1AQncNUysQkBxovuTY0DL4BEdby4v0/3DHpbBsf
	 iqK7QO2xeIud4yb3QsgxaoMmwAzlG/uY6wscI1GIj5nVMe4bspJPCodsyWhMtUYDRX
	 jGb2++r391oLA==
Date: Sat, 3 Feb 2024 18:40:04 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org, Cong Dang <cong.dang.xn@renesas.com>
Subject: Re: [PATCH] clk: renesas: r8a779h0: Add I2C clocks
Message-ID: <Zb56dNAUFLMD27cI@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org, Cong Dang <cong.dang.xn@renesas.com>
References: <7a76dadbce24c81dd2bee68765a0b41beca2d565.1706790236.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="EK9mvlLcUB0sIgUO"
Content-Disposition: inline
In-Reply-To: <7a76dadbce24c81dd2bee68765a0b41beca2d565.1706790236.git.geert+renesas@glider.be>


--EK9mvlLcUB0sIgUO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 01, 2024 at 01:24:56PM +0100, Geert Uytterhoeven wrote:
> From: Cong Dang <cong.dang.xn@renesas.com>
>=20
> Add the module clocks used by the I2C Bus Interfaces on the Renesas
> R-Car V4M (R8A779H0) SoC.
>=20
> Signed-off-by: Cong Dang <cong.dang.xn@renesas.com>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--EK9mvlLcUB0sIgUO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmW+enQACgkQFA3kzBSg
KbZPXw//UYHJsBZ1ba8zUgq6FU4shhsWblCId1C7EEVCsejX+puxAj+WHTUyx/7x
Qw5sq1fL8izghWDRpdKlI6bnZbp3nS6TuGmAeeIpV626HBw5N17mUU+7JFAddWln
oRwJuytZZAsvtgiVPevWKp/kdcvAZ7FIHatzBjgGeIBCK2dDybfH1ITQfFVi/wt3
4ZybodB4SJO73Zs2gE2HHr+TK5VzdHAreC7mmmYm6iyhkZCpAko5zQ5plFVBvTTF
cUfuQnkq4WkErGtNLZpEKqXRnwy8XKnAP7Gw/geYK9l9l8GesLbJgQC/Vfno7+lF
KSjp6NeegfNhK+foOLrO1vwHQ996i2Kj3nfU42X01VdFiFRSqY4+ARVIPQk7DndT
8g34G2n7qwqx63pl5J6KcL6pT36ybSyBqwq8eV8otgiqG6dMmQPzC4yXrCYbZU4y
nRh3mQPUEl56wdvkDanvhxWfPx6xpC/c9txqeipHvqv/ZS/WNLJiM2iP7Jaurq7p
Ac3cKIWdz4rZ16RbKi8ItraIYoOqqGLrdMbhjKmoE7Ll7h0uJuMnTUDJskPFEvpO
pbMUpq7E38B64/U0T48fIXfptWskoR7Z5nE3WKDjw5FugXI7oT1ClH4ck0YGVVeI
6j0+fiJGwW+nCWxg3mPwDa2L558ML19WHR0iOoPl5a1nw7iTDvw=
=cJoa
-----END PGP SIGNATURE-----

--EK9mvlLcUB0sIgUO--

