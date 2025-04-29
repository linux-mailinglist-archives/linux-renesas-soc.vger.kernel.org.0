Return-Path: <linux-renesas-soc+bounces-16438-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D9469AA0213
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 29 Apr 2025 07:53:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 605D11B62EB0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 29 Apr 2025 05:53:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3401C26C39D;
	Tue, 29 Apr 2025 05:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="Zu9L/7HS";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="TBLMHc1q"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3377C14EC5B;
	Tue, 29 Apr 2025 05:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745905977; cv=none; b=hTNZe+L4dW/Ik0LfWMDWvlVJ5i0hvRQ9143bmam3kDbzaRDMowlwFlpJKzO2eMRGeCLLNH1kgiHdOyAu5e/rEsNnhDMR0G4xwcpgpQJe4wefSh/pbmVs3uN9bELoyudOu0XTdNBcjow/WLRm7TASgcJXjD9JWlH+bROpQzCRtDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745905977; c=relaxed/simple;
	bh=d67rc5Pj7DKyx5hArOAJ+U2tD86Zu4dyIJvH1zZq6R4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=f+uY2Ty/PTc4SkUm29eZWMw65aLPbVbzxz8kFxyz7NwJJ6rnMDqMY9Ifk6cXGlDHHzspVmI2IWqZQ4Bx1bz8BIKV0mB0p+WvaUCZ3RWa60lyjgqGVlWF/HzhnBpWV3Ke74f2VvrdOHLvrxADP7EKFxsd3Qjr3fPYAkRheJ91bxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=Zu9L/7HS; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=TBLMHc1q reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1745905973; x=1777441973;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=H+ePYln7tPjjBoVKR5HPMEIWQT/EraWtuD1GVt6HQFQ=;
  b=Zu9L/7HS8GKXHM3Lm/A3tVQIeF/wsU8VJugAmDp+yMmo1jTHg2BjLZF8
   tzU6HXw3qqGjQHqp/Dc234kbQdy2AOBNaaivQgM2tjB43LlHfRPjz+x0i
   51dhmPX9KhqO5L3gLTtmDskWqQFWU2PhaK8VOHCv1++V8XBT9vaBsmlpS
   rN+oa6WHBq72XUUeznwwU0foi8SrrGnB6eWyZ0POe56a2RpZSdN1+F+J+
   /thByEYMip+MOaZg77lOeJDk5hCqGXucyGnwyImn5zaCY3wtwKeGbDyqW
   3gIj9NMAMOkmnsu/jjZkNa3JS71/k5QgT39yRidYr9KKUF7zU1rLCaxQ5
   Q==;
X-CSE-ConnectionGUID: S+IJdN4BTNCSJu0p4aaddQ==
X-CSE-MsgGUID: PJJbB2nYTaKOVHj4c7k3fQ==
X-IronPort-AV: E=Sophos;i="6.15,248,1739833200"; 
   d="scan'208";a="43769108"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 29 Apr 2025 07:52:50 +0200
X-CheckPoint: {68106932-7-903EAEAC-E04C76C8}
X-MAIL-CPID: 873A8EB189AFEA30A497699562E47968_5
X-Control-Analysis: str=0001.0A006398.6810693E.0055,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 945A916AADE;
	Tue, 29 Apr 2025 07:52:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1745905965;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H+ePYln7tPjjBoVKR5HPMEIWQT/EraWtuD1GVt6HQFQ=;
	b=TBLMHc1qj6p8JIsxAqlB6IGbirIcg2hrkGe1NspBevfecMRkvRfmAa+zmdyf/55v7iaABs
	vtYVyApWu3GM0POM3BBmvkNZKwxW6soD462APIiKguDhKuXGIxA64Vdo0tufqD4gxqUW54
	q59lL/AtXKDtgGcgeabeZ/S3PSUUVJtAk3+N5Wo8HyygS/ml5Yk5DwVyKCIuV4QQmBgsUb
	K4S/5OLkhdJQjr14Mv/6Ntr2H2OqYrJnr24nFTjiJdTChIdLLTESnEdhNQykzO63tUAx5S
	PywhHa6o2GpfAiwjkLJHPT3HhTQxG6Hl8WSG1wSe86BosPWqQBJL2VDLwyEOMw==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com,
 linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dt: imx95: Add TQMa95xxSA
Date: Tue, 29 Apr 2025 07:52:44 +0200
Message-ID: <2436245.ElGaqSPkdT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <aA-xLX_O94O_U5Mt@shikoro>
References:
 <20250428135915.520432-1-alexander.stein@ew.tq-group.com>
 <20250428135915.520432-2-alexander.stein@ew.tq-group.com>
 <aA-xLX_O94O_U5Mt@shikoro>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3

Hi Wolfram,

Am Montag, 28. April 2025, 18:47:41 CEST schrieb Wolfram Sang:
>=20
> > Add initial support for TQMa95xxSA module compatible to SMARC-2.
> > There is a common device tree for all variants with e.g. reduced CPU co=
unt.
> > It supports LPUART7 for console, CAN, PCIe I2C, SPI, USB3.0, USB2.0, Au=
dio,
> > SDHC1/2 and QSPI as storage.
>=20
> Dunno why renesas-soc was CCed but since you are here... ;) do these
> boards support I3C, too? I know that imx95 has I3C cores. Just out of
> interest, not relevant for this series, of course.

get_maintainer.pl lists (among others) for this patch
> linux-renesas-soc@vger.kernel.org (open list:ARM/RISC-V/RENESAS ARCHITECT=
URE:Keyword:\brenesas,)

because of this node
> pcieclk: clock-generator@6a {
>     compatible =3D "renesas,9fgv0441";
>     reg =3D <0x6a>;
>     clocks =3D <&clk_xtal25>;
>     #clock-cells =3D <1>;
> };

renesas-soc gets triggered ;-) I'll pay attention for further patches.

This is a SMARC-2 module, but there is no i3c interface in this standard.

Best regards
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



