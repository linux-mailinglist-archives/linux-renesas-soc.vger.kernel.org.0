Return-Path: <linux-renesas-soc+bounces-16063-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A9EA8B7EC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Apr 2025 13:54:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 830865A00D9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Apr 2025 11:54:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6405724169C;
	Wed, 16 Apr 2025 11:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="JjfcIS8D";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="Ms/MGLW9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03F1F24728F;
	Wed, 16 Apr 2025 11:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744804448; cv=none; b=Ty1PYAqQwl1AwNEo5Z/Db34RwURpWcVQa3wUTSE0eLVry08PZEBRc8f6FVXvMQyBPHUfUO/8Hd5ccUr5+8At1vifh0aSMa9++ZyrN9wWdIKMHuXKMUPYfrPcELWXYBP/omtZkHPQrfPJp6vtNf/4rffZQq6Aqu8ablLNx5vl3ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744804448; c=relaxed/simple;
	bh=Kx9vZ2nOZKWmMvSzfG5+ZeIJH2O5fKX/k65+E4EY3Zo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mQu6qrJGrFcnUvvR/4ZUYbT7TRaWIhAPDjzUoRU15nJIb9bi3bpJ8FYYOpLuWDa2NHAGnZrwszNAE4f0Bgff7fc8pqKuoeviC54kbVwnS0aPlPK0ZPIKRN9ypne6IS9TKRC5eS8r8SmjDBrDCYRBRZovL2K2kbRCWMFdXEjo7Mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=JjfcIS8D; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=Ms/MGLW9 reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1744804445; x=1776340445;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=m+AwIw+jiqBoahqy5bMs4qA16bD3AY0+KgeeCB5/7BE=;
  b=JjfcIS8DBKbzlV6G2rlhxAKrdvQbr/Tj4/8JJUgmCBH9mQKCsFv5XyZ4
   VWnTUHJH6doYJTNCQO9Z4DNYbxiNZFTeFsrlz4YMDAn4e+sjE5Bmr7DG1
   V0emNcOItA+VlTLZRJtcy9KuTWqVXGkyA1lnko8/cGxMLPSmslOmqog57
   WWZ7AY3w0EVMBky70yHv57PZvXdbj5UvqUyp6j7UmXPoE4+eFjxv3cPeu
   Pyx25gyoxnUWETbwQnDZq2M3+7Lj/+M5AblrOVL9dNw8HKxf3P4D+BwYe
   ZCkEZxeaPYzMqLiFzoJKKXKuXKo5M0m1roVR6L9apBthzM80o8I/waFnj
   w==;
X-CSE-ConnectionGUID: ylHedra1QWKFeZvyz3KQ9A==
X-CSE-MsgGUID: /0P0VCQATqu5/tkUK4dy+w==
X-IronPort-AV: E=Sophos;i="6.15,216,1739833200"; 
   d="scan'208";a="43567665"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 16 Apr 2025 13:54:01 +0200
X-CheckPoint: {67FF9A58-43-DC4DC9A0-F4F29281}
X-MAIL-CPID: 13CF670CCFADCC07300DFA99EC2DE8BF_0
X-Control-Analysis: str=0001.0A006396.67FF9A55.000D,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 412DA16B203;
	Wed, 16 Apr 2025 13:53:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1744804436;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=m+AwIw+jiqBoahqy5bMs4qA16bD3AY0+KgeeCB5/7BE=;
	b=Ms/MGLW954pIAQt0KFwUZmPM7HVemUqZtJhiEGJKcsy1qOf+b5UXcqWjQZc60JnHqW9QB+
	QzXdK0hVd8ipAiVOLv3ubGPC11lAuGLtTOIHQxScE6hdNkqXUczd1o1Lt4eMc7L9yFA599
	m1Jl+wOWPsRsmRFDzMG0TLL0MySqHMMD9VAbgJZ4zbtHS2m+fWti7qHSwY2UPwGgOPcfoU
	IT/mF2x+Lfeer3fCYXllTtj5/Ql3srf88doRFDs46AcXnyq5zpOhDf/DX81pg4ZZHdjI7L
	TtBiLXKCggYNppeZdGeF9rfZfkvsc8+1MYLprQ4u/pUffLyKqSqYhfdnQvma9A==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com,
 linux-renesas-soc@vger.kernel.org
Subject:
 Re: [PATCH 2/2] arm64: dts: freescale: add initial device tree for TQMa8XxS
Date: Wed, 16 Apr 2025 13:53:52 +0200
Message-ID: <4975795.GXAFRqVoOG@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <aa21556c-8c79-4d03-b6db-3b4cf450fc3a@lunn.ch>
References:
 <20250415133301.443511-1-alexander.stein@ew.tq-group.com>
 <20250415133301.443511-2-alexander.stein@ew.tq-group.com>
 <aa21556c-8c79-4d03-b6db-3b4cf450fc3a@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3

Hi Andrew,

Am Dienstag, 15. April 2025, 17:27:37 CEST schrieb Andrew Lunn:
> > +&fec1 {
> > +	pinctrl-names =3D "default";
> > +	pinctrl-0 =3D <&pinctrl_fec1>;
> > +	phy-mode =3D "rgmii-id";
> > +	phy-handle =3D <&ethphy0>;
> > +	fsl,magic-packet;
> > +	mac-address =3D [ 00 00 00 00 00 00 ];
> > +
> > +	mdio {
> > +		#address-cells =3D <1>;
> > +		#size-cells =3D <0>;
> > +
> > +		ethphy0: ethernet-phy@0 {
> > +			compatible =3D "ethernet-phy-ieee802.3-c22";
> > +			reg =3D <0>;
> > +			pinctrl-names =3D "default";
> > +			pinctrl-0 =3D <&pinctrl_ethphy0>;
> > +			ti,rx-internal-delay =3D <DP83867_RGMIIDCTL_2_50_NS>;
> > +			ti,tx-internal-delay =3D <DP83867_RGMIIDCTL_2_50_NS>;
> > +			ti,fifo-depth =3D <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
> > +			ti,dp83867-rxctrl-strap-quirk;
> > +			ti,clk-output-sel =3D <DP83867_CLK_O_SEL_OFF>;
> > +			reset-gpios =3D <&lsio_gpio3 22 GPIO_ACTIVE_LOW>;
> > +			reset-assert-us =3D <500000>;
> > +			reset-deassert-us =3D <50000>;
> > +			enet-phy-lane-no-swap;
> > +			interrupt-parent =3D <&lsio_gpio1>;
> > +			interrupts =3D <30 IRQ_TYPE_EDGE_FALLING>;
>=20
> EDGE_FALLING is very likely to be wrong. PHYs are generally level
> triggered, not edge.

Thanks for that comment. I checked with my colleagues and it is
indeed level-low. Will fix in v2.

Thanks
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



