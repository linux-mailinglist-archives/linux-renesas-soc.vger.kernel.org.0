Return-Path: <linux-renesas-soc+bounces-18571-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 08456AE13C5
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Jun 2025 08:26:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 96EB116538F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Jun 2025 06:26:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11A1E220F23;
	Fri, 20 Jun 2025 06:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="KXifEzUg"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7713430E837;
	Fri, 20 Jun 2025 06:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750400756; cv=none; b=SQPSODkyrrdSce5F1hHMpsCm85x4dJbbctmMqOkj/Gna6EuYBHpe1DdDf6ilYZZaoXz1AlqiVgXAX+ESzqVKhtsi4DADhUx7NFs/6r0quBSBKAceZiJ/J4B8lX2grt6eP74uM/rRN33OcSPkKLDxeiI9Chp02o078RvaCe4nZ1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750400756; c=relaxed/simple;
	bh=HeuYZMsC9WsSiMUpmqqe0M3z0iwrxrWn7R8Czqja7Co=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DYkjamto25uNhQ6vJmGK5nHhsXquQ1Gy6cMU4SiAjdDa4WSANX8VV0Mqm61ENCx+FhsEAQbttHmqMcrY5KATgGJz7U5Bwy4bgX95qm+wJlNDt0++H96GKOBNch9LfQ9VWKe6SHI1cR16fYS+U20ETArFxZ/e/U3lEFbe70C2t8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=KXifEzUg; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1750400750;
	bh=HeuYZMsC9WsSiMUpmqqe0M3z0iwrxrWn7R8Czqja7Co=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=KXifEzUgUP5oogEUgfxYXUvo0+ZE4B6Y5AjhwTwC0AykM3w1FC+7pF+jUWSMhzefL
	 CivXgonieQSyHUacztzurorFb4fwwccraax9Co1aXrXO6nuhh0NNBmhPqvfaWTZdof
	 SPZHhVJmY9U6ePBcvZWfHZjsC46HUTXbBhf6SffmywGIztUrqb/+dKpzmCDZThHs0f
	 wBHMdv6ljIYj+KEulcdDMQmqfxqi++QThGq6i+pjVphzUPvpGBwNCPVCZKumLyVBpk
	 7WN+lIe3s/FXcT9Pbd5Y9tTQntf9e4iXVpxbvy6Wxyo2ws8jgJYWMhpgyxEFy4IOqc
	 bV7vT2roNn1ZQ==
Received: from [192.168.68.112] (unknown [180.150.112.166])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 44C7664426;
	Fri, 20 Jun 2025 14:25:46 +0800 (AWST)
Message-ID: <8120f04c23f14ac48671a0af45838536a4600e98.camel@codeconstruct.com.au>
Subject: Re: [PATCH 1/2]
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Leo Wang <leo.jt.wang@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Kees Cook
 <kees@kernel.org>, Tony Luck <tony.luck@intel.com>,  "Guilherme G. Piccoli"
 <gpiccoli@igalia.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Magnus
 Damm <magnus.damm@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	bruce.jy.hung@fii-foxconn.com, george.kw.lee@fii-foxconn.com, Leo Wang
	 <leo.jt.wang@fii-foxconn.com>, Conor Dooley <conor.dooley@microchip.com>
Date: Fri, 20 Jun 2025 15:55:44 +0930
In-Reply-To: <20250618-add-support-for-meta-clemente-bmc-v1-1-e5ca669ee47b@fii-foxconn.com>
References: 
	<20250618-add-support-for-meta-clemente-bmc-v1-0-e5ca669ee47b@fii-foxconn.com>
	 <20250618-add-support-for-meta-clemente-bmc-v1-1-e5ca669ee47b@fii-foxconn.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Leo,

The patch subject should not be the path to the affected file. Can you
please fix that? Follow the lead of other patches that have recently
touched the file.

Thanks,

Andrew

On Wed, 2025-06-18 at 17:40 +0800, Leo Wang wrote:
> Document the new compatibles used on Meta Clemente.
>=20
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Leo Wang <leo.jt.wang@fii-foxconn.com>
> ---
> =C2=A0Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
> =C2=A01 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> index
> 01333ac111fbb076582a6c0e801903c3500b459f..ff3fea63cecd99ec2dc56d3cf71
> 403f897681a98 100644
> --- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> +++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> @@ -81,6 +81,7 @@ properties:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 - asus,x4tf-bmc
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 - facebook,bletchley-bmc
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 - facebook,catalina-bmc
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 - facebook,clemente-bmc
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 - facebook,cloudripper-bmc
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 - facebook,elbert-bmc
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 - facebook,fuji-bmc
>=20


