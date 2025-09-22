Return-Path: <linux-renesas-soc+bounces-22124-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2E98B8ED17
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Sep 2025 04:47:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 65D0D17920F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Sep 2025 02:47:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBEAD80C02;
	Mon, 22 Sep 2025 02:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="kZW7zB/6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09F8B17BA1;
	Mon, 22 Sep 2025 02:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758509240; cv=none; b=Eal70H/tlVcB/SIy7S7tP3Y1qRNWeZZSORQNECc7XQgcfyFi8tYM9ned03gOoizaWHsAUtfB3B0UaBBVzIuYXinxkCd8JMHM86mHrsTLxtDXpqCDaXggw3vs+ewEvCd5VPbalMxEdj5wF5aNQJksj0KEdVCAcf1G4ef7NPn0MI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758509240; c=relaxed/simple;
	bh=8lcFSOzja5E1OdUdSgtdwJamxmrIxOqXabOscv2yoRU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uLP+6ZWCqw6egjjqI05ezOB9ULJAUE3oILPZF8e4sOsZDkCA5jGx1M/7CHYrLCwHDwB66hso5KdjjFR52yun9co9IxJyIhnvNXOuBAXh+KkMO++YrN13kAixgKX/cQAG9oWIRRpiDn4evwIi2ZBhmtbZ/4xZVO3crKG1obknUGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=kZW7zB/6; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1758509234;
	bh=8lcFSOzja5E1OdUdSgtdwJamxmrIxOqXabOscv2yoRU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=kZW7zB/6EL0FgFn6rLaJ6D2Bl9DGzdY3hWfhg93pcG5VaIa5HGLi1t0AijUmBFVFU
	 GkfqvqEqHM7/BejQe+nvSXxYvVhttNV33t6W5iz4ox1xyAauEHCytqMjQ6y0HsZy+D
	 9D12OQB/X8MZo2FILB5BB824OnU6mImg3jy493UxhkO6w8goh4BkCXp+N44fSU+wUx
	 tP81ueKkSUbA8m2w7e/W4Kzjn6TNr6tQSMJD39Db8KCsxLnLqwWB/4koT8o8IIeZhd
	 xRynaMBpOxEc8iocDzgIl25QQSQdelgZFDeEXhNHqu6bKEdTvsEZL74pMlHNqoUAUr
	 R1INSLBUj+INQ==
Received: from [192.168.68.113] (unknown [180.150.112.213])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id DEEE964755;
	Mon, 22 Sep 2025 10:47:12 +0800 (AWST)
Message-ID: <7e6f568da28d7a63738b6ed22b33db3df4c478c9.camel@codeconstruct.com.au>
Subject: Re: [PATCH v1 0/2] Add Meta (Facebook) Yosemite5 BMC (AST2600)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Kevin Tung <kevin.tung.openbmc@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel
 Stanley <joel@jms.id.au>,  Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Date: Mon, 22 Sep 2025 12:17:12 +0930
In-Reply-To: <CABh9gBew1=hbJvg1Mhg5dE7Lr_Z442_kbBX6zTs_6_C2NRyLbw@mail.gmail.com>
References: <20250917074812.4042797-1-kevin.tung.openbmc@gmail.com>
	 <9bb9929a-8130-48da-983e-2901a7c3da36@lunn.ch>
	 <CABh9gBew1=hbJvg1Mhg5dE7Lr_Z442_kbBX6zTs_6_C2NRyLbw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1 
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2025-09-18 at 10:21 +0800, Kevin Tung wrote:
> On Wed, Sep 17, 2025 at 11:12=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wro=
te:
> >=20
> > On Wed, Sep 17, 2025 at 03:48:08PM +0800, Kevin Tung wrote:
> > > Summary:
> > > Add device tree for the Meta (Facebook) Yosemite5 compute node,
> > > based on the AST2600 BMC.
> > >=20
> > > The Yosemite5 platform provides monitoring of voltages, power,
> > > temperatures, and other critical parameters across the motherboard,
> > > CXL board, E1.S expansion board, and NIC components. The BMC also
> > > logs relevant events and performs appropriate system actions in
> > > response to abnormal conditions.
> > >=20
> > > Kevin Tung (2):
> > > =C2=A0 dt-bindings: arm: aspeed: add Meta Yosemite5 board
> > > =C2=A0 ARM: dts: aspeed: yosemite5: Add Meta Yosemite5 BMC
> >=20
> > The threading between your patches are broken? How did you send them?
> > git send-email? b4 send?
>=20
> Yes, the threading is broken. I initially used git send-email, but for
> some reason, only the cover letter was sent. I then sent the remaining
> dt-bindings and DTS patches separately as a follow-up.

I recommend using b4, it helps blunt some of the sharp edges of git-
send-email.

https://b4.docs.kernel.org/en/latest/

Can you please send v2 of the series so that it's properly threaded,
after applying tags you've collected for the involved patches, and
checking your work with `make CHECK_DTBS=3Dy aspeed/aspeed-bmc-facebook-
yosemite5.dtb`?

Andrew

