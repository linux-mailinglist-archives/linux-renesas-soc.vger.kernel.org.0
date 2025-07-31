Return-Path: <linux-renesas-soc+bounces-19798-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 305E3B16A6A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 31 Jul 2025 04:30:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 744437AA359
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 31 Jul 2025 02:29:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13A4A23643E;
	Thu, 31 Jul 2025 02:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="CyfgZAWw"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 685F1A94F;
	Thu, 31 Jul 2025 02:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753929037; cv=none; b=XJy3q0wOZjxMsmGi9y+0W/7OrX/QswMADJ5ueSZ7xoOdoIjn9sycdvS0/+GbmzO7cV4POyj6nl2QCJ8RjWBpbH5GpgryJBszdgYFOWJXyJ3jGQl7QDUpE8ksWrHB3DCD610gcOeuENhWJz+vZUGZfRgkhbuQ4IbJBqu6tj0PyXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753929037; c=relaxed/simple;
	bh=GQkDPLCi2StQpsUNzGuKJMftf7ArsxQi2n/TY08G0oA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tyIKehIrvZ4zhUtYhgOOsoswTQ2Cz7y7PHZxQ2bm8Z4IenjNWyazoRzptMt02MNFbmYBGt04tPco/I5YPKX3Ddra3A6M6yTsRqWxXlmaFeY4c3PJzJVfPrZeuEbq+70qqpV7gtHr+LeyrVkUmFr/qdDCWpxWii2jAWrIhGtB7ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=CyfgZAWw; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1753929032;
	bh=8jEKI+a2l5XlR/E3JP8s37RLYXVe77DyLwBFBCUJqfg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=CyfgZAWwliTD+nM38ntQktYQ6EDUNpi1cSwNgQDwKa6MmNl8SVPJGeIz7K9giG4Di
	 e5Wz6neH3xPuwqfYdFUv60ksXRiZsq9DIWMeRGARjKmMSdZB+KefgmezJ/loQt1HM4
	 iK4SE2HpyeyLAh+aYVOdZX261BuuFO8srTPoVhLfYT2mulmzYC4qglZ5mVdDxdJ9I+
	 PT9mA5lJ6PMe9SjzCIrd+GYCnb7aGt7beSe5aMUDc2CtfgHJxMt4dfUnVCbxHTn06d
	 BJViD8JZXtPjGJwcNf/aqlBHJu6C/f1kdnQerG6xTz9ECtH9+OhSUiipnj48R7qtKj
	 O3gdcNXzV8jhQ==
Received: from [192.168.68.112] (unknown [180.150.112.70])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id B881069374;
	Thu, 31 Jul 2025 10:30:29 +0800 (AWST)
Message-ID: <b32a9de1d591d3012240919d23dbb22305cce6e2.camel@codeconstruct.com.au>
Subject: Re: [PATCH v9 2/3] ARM: dts: aspeed: clemente: add Meta Clemente BMC
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
	leo.jt.wang@fii-foxconn.com, george.kw.lee@fii-foxconn.com, 
	bruce.jy.hung@fii-foxconn.com
Date: Thu, 31 Jul 2025 12:00:29 +0930
In-Reply-To: <20250723-add-support-for-meta-clemente-bmc-v9-2-b76e7de4d6c8@fii-foxconn.com>
References: 
	<20250723-add-support-for-meta-clemente-bmc-v9-0-b76e7de4d6c8@fii-foxconn.com>
	 <20250723-add-support-for-meta-clemente-bmc-v9-2-b76e7de4d6c8@fii-foxconn.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2025-07-23 at 11:42 +0800, Leo Wang wrote:
> From: Leo Wang <leo.jt.wang@gmail.com>
>=20
> Add linux device tree entry for Meta Clemente compute-tray
> BMC using AST2600 SoC.
>=20
> Signed-off-by: Leo Wang <leo.jt.wang@gmail.com>

Aside from the usual ASPEED warnings, I see:

arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dtb: adc@34 (maxim,ma=
x1363): '#address-cells', '#size-cells', 'channel@0', 'channel@1', 'channel=
@2', 'channel@3' do not match any of the regexes: '^pinctrl-[0-9]+$'
        from schema $id: http://devicetree.org/schemas/iio/adc/maxim,max136=
3.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dtb: adc@35 (maxim,ma=
x1363): '#address-cells', '#size-cells', 'channel@0', 'channel@1', 'channel=
@2', 'channel@3' do not match any of the regexes: '^pinctrl-[0-9]+$'
        from schema $id: http://devicetree.org/schemas/iio/adc/maxim,max136=
3.yaml#

Can you please submit a binding for this device, or drop the nodes from
the devicetree for now?

Andrew

