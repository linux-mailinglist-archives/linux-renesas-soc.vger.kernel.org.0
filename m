Return-Path: <linux-renesas-soc+bounces-25905-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E92CCCEE65
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Dec 2025 09:10:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 632CC305F338
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Dec 2025 08:10:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47DB22DF15C;
	Fri, 19 Dec 2025 08:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="db2vHWh5"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx-relay49-hz3.antispameurope.com (mx-relay49-hz3.antispameurope.com [94.100.134.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F15EF2DEA6B
	for <linux-renesas-soc@vger.kernel.org>; Fri, 19 Dec 2025 08:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.134.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766131811; cv=pass; b=XzmGvYxzWTvmi1xAsIDolp65XIvVDqFTroanESFfnqNFeroxycX/k+8qFaXLtBB8GLWSSUKU6Uj00+krZ6wRTGQ3zoVQhFNmi1DXQVDzKh8DgxxPbJ16dPLtljJfdjahrIhOuZ/2hZr4aH7qtkUWBk+9uOZXQamGaGlMAJ1Rh5w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766131811; c=relaxed/simple;
	bh=SshNRPgIyfZhOL9g00Tx3x9NU8S7Oou4WRUj0p6RJMc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=igb4nUndB/x+CE3L1dBhv3jgYg1h7xTnSAzhPDfL00UmuUEncSqGmj2frkj1GmIeBNyeYPsiFGE1xsnL2Hx0AcAd8YKQ8z32b4MqtZGVLkTBprpjETAUGhAeQL8yOX33VpyZPzoowOuby/lbf9m9/gz/OgB5wKy2x635FEvFpdE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=db2vHWh5; arc=pass smtp.client-ip=94.100.134.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
ARC-Authentication-Results: i=1; mx-gate49-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=9ZkmG5LDdBWcr5F9UYs40lXE33P3xPwDRyGsRHQ2ZJw=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1766131786;
 b=pbNpYDyiECrUW78rC8E7srxOzBFw11mXuGCPq+hWrPmw+fZz5M2cjc4Rb6VM3mNE5FagPBAg
 dtXoytniCTWYtW8U9KdeNFcixoCLl3NQZpyDafb+yUCxmcHAb6qonPG+WS+yyTOKWzuq8HImwF/
 +TjJzkw5mIJG1dbswIoYFmzZ7NJLKSqJEtSI0YRey+1qPZRP0kgpuBTJe3hCz4UZGrHi5H6NXzR
 h8wM19LmU64o3uqNS8+Wcp6e9+D2KzABRS6XCHgBEb7ePbZc/rtax674DUYDKLX12rQv+47vecb
 oWM9AAz82CH2XE8LL27YEBVQumrNZ62txQQhK7yAWBtcw==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1766131786;
 b=q++RZ6lgCbVys3XIwjfUxNKmOK7G6IHH/0Cc1rLhXSvCl5IAhbm9dB4pxlPnmrorksoAuU/A
 ZchxM6Z3XkCfgMQeUqQzCYvLZ9cF0+4oWH7xxO5vUykKcroozJ21tsZYpnwkeV+ZR8JDYXTP7Ss
 kYR0HQT0U3PupQTxi+z6emjzhUuKv2rWszIT6ixUP8Tyn2+B1CtJnp3o8t7c11T1CtZio1bU+i/
 Q+FqyZxZcpK+bp8x7feD/BQU36k1qo1UG3UDHO2yxL2NgtuS8LCufZjjorgdzP9p/DOUg0xEzof
 /BZKBrkyF5aRb+YcmOiNsCgmSUoCnw86sUxGtSE1THkfg==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay49-hz3.antispameurope.com;
 Fri, 19 Dec 2025 09:09:46 +0100
Received: from steina-w.localnet (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id AC51CCC0DAC;
	Fri, 19 Dec 2025 09:09:23 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Peter Chen <peter.chen@kernel.org>, Pawel Laszczak <pawell@cadence.com>,
 Roger Quadros <rogerq@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Magnus Damm <magnus.damm@gmail.com>,
 Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-usb@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com
Subject:
 Re: [PATCH 1/6] dt-bindings: clk: rs9: add clock-output-names property
Date: Fri, 19 Dec 2025 09:09:23 +0100
Message-ID: <3357591.tdWV9SEqCh@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To:
 <CAMuHMdWEJ-eYwUTnotsTVEtKrujYVsEB4kFVjRYh3wXZvyjfGQ@mail.gmail.com>
References:
 <20251218152058.1521806-1-alexander.stein@ew.tq-group.com>
 <20251218152058.1521806-2-alexander.stein@ew.tq-group.com>
 <CAMuHMdWEJ-eYwUTnotsTVEtKrujYVsEB4kFVjRYh3wXZvyjfGQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-cloud-security-sender:alexander.stein@ew.tq-group.com
X-cloud-security-recipient:linux-renesas-soc@vger.kernel.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay49-hz3.antispameurope.com with 4dXgDN6fwtz3yb91
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:5b88bc5d9b014baba218eed2fec8b5d2
X-cloud-security:scantime:2.167
DKIM-Signature: a=rsa-sha256;
 bh=9ZkmG5LDdBWcr5F9UYs40lXE33P3xPwDRyGsRHQ2ZJw=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1766131786; v=1;
 b=db2vHWh5VH3No74UjUSdFMPKP31kO4dxi2sbF2krsN2ddUAuXgmOcOwtFrgPzePf7fPNfR4O
 vkAFTC1oI0yhfyEf1sFNs3oKRAM+ollZx+5bifwu/SSN3/7JqTfZCjg3ym74YchMwJhhtnqLdOe
 HFfZl1Vp5skEyA9QS+TtKbEwqipqYFTeIZuOGYL84/ojy+jln4MThdDL/jlAxm1EAVjMincZNRI
 cdDAsIV4ZgDtJOt6W4n6SNdmBUrQWZ0ozBI0mwxW7THXu4lHxUA7RCgPR1EaDDnTA2t0AP2zgB5
 SfEMKNfGR4ReTQKs2eBBIhB2LaohvODdHcgsfVPR+hzrg==

Am Donnerstag, 18. Dezember 2025, 16:26:10 CET schrieb Geert Uytterhoeven:
> Hi Alexander,
>=20
> On Thu, 18 Dec 2025 at 16:21, Alexander Stein
> <alexander.stein@ew.tq-group.com> wrote:
> > Add "clock-output-names" which is a standard property for clock
> > providers.
>=20
> Why? Isn't that property sort of deprecated?

It is? Oh, I wasn't aware of that. Maybe the property should be
marked deprecated in dt schema then.

Thanks and best regards,
Alexander

>=20
> Will be replying to the cover letter next...
>=20
> > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
>=20
> Gr{oetje,eeting}s,
>=20
>                         Geert
>=20
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



