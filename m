Return-Path: <linux-renesas-soc+bounces-21231-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AA029B4145E
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Sep 2025 07:31:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1E8D71A85211
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Sep 2025 05:31:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5030F2D12E3;
	Wed,  3 Sep 2025 05:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="fACK4iWC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6F16198A11;
	Wed,  3 Sep 2025 05:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756877485; cv=none; b=VR2QtWM4TEkoXzubpXvJwaMneCKA1prxUx4of/uHTim0Hjo7yUYDHRI/XiqKAm/D8w9VmWe+ufvMef/L49b45mnwTR3A45fG6+VL7pKyciWb3iQx3ID6nXWH7juFlOpzVUyVLHd94v97Oj/9KLlGE6ImssiDy7cGafbpCRcjF/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756877485; c=relaxed/simple;
	bh=JnGCK1lahw6eKRr1X7LuKjE36AI6nTTs35DYpWRjgPc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OseoByuFlk7uGnvk614N3gCf2q1ypG4rafnFFrrJlCfdeghYzYpYXcpvx3scoaZ+1PC5LgRh6xXYFRjwYK4M7UePq6kkoISWXzeZ8HkYRiCZYBXT87QGOzQg7G6Qq41dANwyPcU5MMvfmurW3R1RzcLtdaeGlkFJkWkTyVHH6+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=fACK4iWC; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1756877481;
	bh=JnGCK1lahw6eKRr1X7LuKjE36AI6nTTs35DYpWRjgPc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=fACK4iWCaKo+xngoM6xHxCzq0XPdutG9X6hPIigvvWVSmK74s7mhro+frrRzWJf8X
	 OOYOjzr4AOdyVtWojQJJE9cQfqj7xvXWFZpR3a+PY+wIfKrOKt55gO4N+8L09S8Tof
	 nA+VmVkuO2mOzgy7lo0knxxgHC7hsYG92ijBNNs2CMCqkTVcQk9KEMdD0UFul/dnju
	 ISXtX1w929DiSsKtz9ZKAGunLxnoeB4VbtTHYubhHvG677FF4F4W32PwzSXte0UPDK
	 KHrFXLX0JS5qVR35s/NXnjkWfUMyz/fjnuHj+h68ZgA6PWkdyMzMCOoyfOD4CGbljF
	 9jSktTJKjFDYg==
Received: from [192.168.68.113] (unknown [180.150.112.213])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id D93F56E02C;
	Wed,  3 Sep 2025 13:31:20 +0800 (AWST)
Message-ID: <307fa87eb552ac4a1f6dd6139450786195e3892a.camel@codeconstruct.com.au>
Subject: Re: [PATCH] ARM: dts: aspeed: Fix/add I2C device vendor prefixes
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: "Rob Herring (Arm)" <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley
 <joel@jms.id.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm
 <magnus.damm@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Date: Wed, 03 Sep 2025 15:01:20 +0930
In-Reply-To: <20250815230841.3487764-1-robh@kernel.org>
References: <20250815230841.3487764-1-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Rob,

On Fri, 2025-08-15 at 18:08 -0500, Rob Herring (Arm) wrote:
> The ASpeed DTS files have various I2C devices with missing or incorrect
> vendor prefixes in their compatible strings. This hasn't really mattered
> and doesn't impact ABI compatibility as I2C devices get matched with thei=
r
> vendor prefix stripped.
>=20
> With this, the "maxim,max31790" nodes now validate and have some
> warnings. Remove the spurious "#address-cells" and "#size-cells"
> properties to fix the warnings.
>=20
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> =C2=A0.../aspeed-bmc-arm-stardragon4800-rep2.dts=C2=A0=C2=A0=C2=A0 |=C2=
=A0 2 +-
> =C2=A0.../dts/aspeed/aspeed-bmc-facebook-harma.dts=C2=A0 |=C2=A0 8 ++----=
-
> =C2=A0.../aspeed/aspeed-bmc-facebook-minerva.dts=C2=A0=C2=A0=C2=A0 | 24 +=
++++--------------
> =C2=A0.../aspeed/aspeed-bmc-facebook-tiogapass.dts=C2=A0 |=C2=A0 2 +-
> =C2=A0.../dts/aspeed/aspeed-bmc-lenovo-hr855xg2.dts |=C2=A0 2 +-
> =C2=A0.../dts/aspeed/aspeed-bmc-opp-palmetto.dts=C2=A0=C2=A0=C2=A0 |=C2=
=A0 2 +-
> =C2=A0.../boot/dts/aspeed/aspeed-bmc-quanta-s6q.dts |=C2=A0 4 ++--
> =C2=A07 files changed, 14 insertions(+), 30 deletions(-)
>=20

I see you've applied this to your tree. Sorry for being slow on the up-
take, I've been focusing on other things recently. Happy to take it
though, if you're happy to drop it?

Andrew

