Return-Path: <linux-renesas-soc+bounces-20112-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19CFBB1E036
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Aug 2025 03:43:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CD33A626418
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Aug 2025 01:43:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC82178F4C;
	Fri,  8 Aug 2025 01:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="FHNEVcw7"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9D18125D6;
	Fri,  8 Aug 2025 01:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754617414; cv=none; b=BMdUiG6ZPvZv8BlNB8tH0u49wo60HQnzi5yYKow7SchxzHi28SN+DRtKdx3FZYx0dZ0ABjjAeLD1isSzGZq4LDXaAtAEU4CJJLQ5iOfVfsqLR0rcQUreP4OHk4hedwG53e9fJfCZ1XLlwpeHLrpwv9WlNHtKR9LoB8BVXIgPncs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754617414; c=relaxed/simple;
	bh=Ts1zobpCK/euzxoCBpLogZaK0KIVWRAOk6N20EwhcMI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Yx4GFF+9IkYIov6MRbO+SwcLDTsGoPaJ6nozuID5MAdMC1ubDSuLSGDGi5RQ7dMUfRuWPjfrqE9bcF10IO3iEpY7cGUQ25ZA0TBw/C5QtLih5msE1uuCtzLiRGoALhThapMxQBy4ND9Ftswynbg+LiP3A8FEBtUnc+MedA9ZwrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=FHNEVcw7; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1754617407;
	bh=Ts1zobpCK/euzxoCBpLogZaK0KIVWRAOk6N20EwhcMI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=FHNEVcw7jWORt5mo5EgNeEBRd3dIcoL/5kB5U83zUl1HwD6KeiVLYcBokMPbHCaRg
	 6ou1vmExWaWE4rBAJGHNlNxdP3/FMMFy90TxLwoalnTh6qt5N5xhvfW772Dm9NGC9d
	 LUBTPFp8nDLlQHHPmoJM6lu+4PIc3rxgXNdLYBdqWwaUEtNqZ5Qo3eVBeffXksgC3F
	 0Z2/E8U0GKsbHniDdgYZF/c7JarjK8Tjz6YjeeEOiJ8RpiJRu2c+un7bYjU2vKKh+j
	 pEgcpXsLnrXnhuezZEdoX5wCWvLrAPO1L03W15Rq/jxkmRhcasVvZp19MKTZiLKvHc
	 +iHss2W0MA6DA==
Received: from [192.168.68.112] (unknown [180.150.112.70])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 8234A6AF39;
	Fri,  8 Aug 2025 09:43:22 +0800 (AWST)
Message-ID: <f1aaeb371eb0c753e6ace45e5e1ce5ccd73a0f76.camel@codeconstruct.com.au>
Subject: Re: [PATCH v10 0/3] ARM: dts: Add support for Meta Clemente BMC
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
	bruce.jy.hung@fii-foxconn.com, Conor Dooley <conor.dooley@microchip.com>
Date: Fri, 08 Aug 2025 11:13:21 +0930
In-Reply-To: <20250801-add-support-for-meta-clemente-bmc-v10-0-c1c27082583d@fii-foxconn.com>
References: 
	<20250801-add-support-for-meta-clemente-bmc-v10-0-c1c27082583d@fii-foxconn.com>
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

On Fri, 2025-08-01 at 16:22 +0800, Leo Wang wrote:
> This series adds initial support for the Meta Clemente BMC based on
> the
> ASPEED AST2600 SoC.
>=20
> Patch 1 documents the compatible string.
> Patch 2 adds the device tree for the board.

There are now three patches :)

However, the main concern is that these do not apply without fuzz.

Can you please rebase them on the following branch and re-send?

https://git.kernel.org/pub/scm/linux/kernel/git/bmc/linux.git aspeed/dt

Thanks,

Andrew

