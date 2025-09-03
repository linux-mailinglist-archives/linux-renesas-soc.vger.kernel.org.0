Return-Path: <linux-renesas-soc+bounces-21232-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E027B4158F
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Sep 2025 08:52:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 18E7B3A5366
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Sep 2025 06:52:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4564F2D839C;
	Wed,  3 Sep 2025 06:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="dAHoAAqa"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 727951E2307;
	Wed,  3 Sep 2025 06:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756882325; cv=none; b=hUt+YGrQ9d2bSwIAiqvR1JsYKc+Ogdz/SLMjk7Pl7STE0ZezGJNgTE1Y6yEXm4/Pb4TYxHBBIazZ5IltdEMhKdvVRcGfJwRa7Y35e/xt7svDcx2dW6rtYmvL+2rRVFGCH8em330RiIrNRTT3sCFORxAFFG+QJ4Ulc05byQrdcEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756882325; c=relaxed/simple;
	bh=iX6E278sLnenR0ElEl7fBs88lDGzWQdjTL8gZ1XkMuQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ASYHCe/JN5bYr7EsXCE2CRgP/BkHAtogtdY/mTYg7sVsuaC/YCt7ZExguv2jBSpfaR4qSkRiduCcW2xUzGYPMrHcANSZchSOjWwvvmKpy7O42r8GXMv7+CbrEkl8vCAtzq62pUG/XR5y9yKwCy4RBZP8dTuMcu8XYBNNu0TUpRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=dAHoAAqa; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1756882321;
	bh=iX6E278sLnenR0ElEl7fBs88lDGzWQdjTL8gZ1XkMuQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=dAHoAAqaJCfLWv6t/f4kUcLxb4ed9cEPu8uYgdRqon2TC5yW7HPgF4I3f+d7kIIrd
	 HD/2tREDqXOl3kP5qf9DzVqylPq6JZd8JvlxLr0WbyxJeZCppIGrM90WtcWTMeAqgx
	 vdCR4coU5Dc5OaC8G9KUMIiDtGywshOBQEYWeze1jz1dFVQXTTrWSNPTiH/RpWCMrR
	 Z0A1pPWpYjmf9L4oZ8Rs2hkjuAoVDX2z+3zo5ZBGwRgBY0DHoH7trP/vMCaiemfnaB
	 1rxVGui1XlMhDkeNIs7crK3W9K/s9WmwzW9cikY6D6y7GVWwLcqNszRtEwLV71GiPa
	 RzbNftqiDUHWQ==
Received: from [IPv6:2405:6e00:242a:e4ac:24d9:ee83:45da:199b] (unknown [120.20.133.19])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 6799D6445D;
	Wed,  3 Sep 2025 14:51:58 +0800 (AWST)
Message-ID: <360776d4dd765dc2c98f0c1b718fe63d4a8a70d4.camel@codeconstruct.com.au>
Subject: Re: [PATCH] ARM: dts: aspeed: Fix/add I2C device vendor prefixes
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: "Rob Herring (Arm)" <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley
 <joel@jms.id.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm
 <magnus.damm@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Date: Wed, 03 Sep 2025 16:21:56 +0930
In-Reply-To: <307fa87eb552ac4a1f6dd6139450786195e3892a.camel@codeconstruct.com.au>
References: <20250815230841.3487764-1-robh@kernel.org>
	 <307fa87eb552ac4a1f6dd6139450786195e3892a.camel@codeconstruct.com.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2025-09-03 at 15:01 +0930, Andrew Jeffery wrote:
> Hi Rob,
>=20
> On Fri, 2025-08-15 at 18:08 -0500, Rob Herring (Arm) wrote:
> > The ASpeed DTS files have various I2C devices with missing or incorrect
> > vendor prefixes in their compatible strings. This hasn't really mattere=
d
> > and doesn't impact ABI compatibility as I2C devices get matched with th=
eir
> > vendor prefix stripped.
> >=20
> > With this, the "maxim,max31790" nodes now validate and have some
> > warnings. Remove the spurious "#address-cells" and "#size-cells"
> > properties to fix the warnings.
> >=20
> > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > ---
> > =C2=A0.../aspeed-bmc-arm-stardragon4800-rep2.dts=C2=A0=C2=A0=C2=A0 |=C2=
=A0 2 +-
> > =C2=A0.../dts/aspeed/aspeed-bmc-facebook-harma.dts=C2=A0 |=C2=A0 8 ++--=
---
> > =C2=A0.../aspeed/aspeed-bmc-facebook-minerva.dts=C2=A0=C2=A0=C2=A0 | 24=
 +++++--------------
> > =C2=A0.../aspeed/aspeed-bmc-facebook-tiogapass.dts=C2=A0 |=C2=A0 2 +-
> > =C2=A0.../dts/aspeed/aspeed-bmc-lenovo-hr855xg2.dts |=C2=A0 2 +-
> > =C2=A0.../dts/aspeed/aspeed-bmc-opp-palmetto.dts=C2=A0=C2=A0=C2=A0 |=C2=
=A0 2 +-
> > =C2=A0.../boot/dts/aspeed/aspeed-bmc-quanta-s6q.dts |=C2=A0 4 ++--
> > =C2=A07 files changed, 14 insertions(+), 30 deletions(-)
> >=20
>=20
> I see you've applied this to your tree. Sorry for being slow on the up-
> take, I've been focusing on other things recently. Happy to take it
> though, if you're happy to drop it?

Actually, do you mind dropping it from your tree? It conflicts with
Krzysztof's patch that I'd already applied:

https://lore.kernel.org/all/20250819131743.86905-2-krzysztof.kozlowski@lina=
ro.org/

I've applied your patch here with a note in the trailer:

https://git.kernel.org/pub/scm/linux/kernel/git/bmc/linux.git/commit/?h=3Da=
speed/dt&id=3D61a913644a8c5b6c8bd9da09f78f88e50edfaeb

Andrew


