Return-Path: <linux-renesas-soc+bounces-8237-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC8DA95EDB5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Aug 2024 11:52:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EFC4F1C21105
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Aug 2024 09:52:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B123D14658C;
	Mon, 26 Aug 2024 09:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="EODnI/Hq"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAA77146581;
	Mon, 26 Aug 2024 09:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724665940; cv=none; b=V0yYOd6vWQuKGgy1/wb5hA3zogua2C/2iH4yZWMp+xn6uIK6gLhnOXM7yATGP/meDAKcES6ohyyzC1lqYvwhNWNAcrQls4BJWesqy0Sack/3YA8fT1HEf7D6m+5DE6nTqIAUrSkQ1VvJpsiTJqdF/9QFPGP3NcQoaishBaTwGP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724665940; c=relaxed/simple;
	bh=lQulIFQ3MSaYELsasLXuNGLySXXrhci4b3aPunJJ4Vc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uP0l4/a2hqwZPNFUx879iOmTUq1ZU+Keqau4oQldcocolXk+K3BkzIWii+tUG1mpulxzdRaAL+rnEuGPKxPd/5Aq7XHUBcl2qj7MzS4IANWDi6o2hM/P/RbXVqgwZwdtUP524BzUiCPgUG46tnrTlBV1ShbXhuA6F8nG2B7ZXWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=EODnI/Hq; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9D811C0003;
	Mon, 26 Aug 2024 09:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1724665937;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lQulIFQ3MSaYELsasLXuNGLySXXrhci4b3aPunJJ4Vc=;
	b=EODnI/Hqi2gf0HbwFYGycKIX5kvmTtlkTXDO4Ou41WtUREytRJW+uzyzbbje/qpzCVBu79
	fSZNUNx2Pxbz8rCB1K+3cs0Z8CNQ6fLkHIwW5Bf6JR/H+u0kujeYra4gUVJGr+fZL4LuHr
	dFci05mgwwLcdxWD/Qzu8SeLe/SSFqSkzp30cRWgijaUwcA6Z1Qe0BrxDoge9GG6wuyzFj
	yQiNVtFwqBXdgnAeUce96v1BjYId0+uglxNfMH0LbemPRVBVRY17gS0V5iTNfRUltLRJu5
	r1jGtikL/0Eu0CG3oeVC7zp0fWlE96seULFGTb96CUMnB+71d1pjwhU6ZMy6kg==
Date: Mon, 26 Aug 2024 11:52:13 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: <michal.simek@amd.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <liang.yang@amlogic.com>, <neil.armstrong@linaro.org>,
 <khilman@baylibre.com>, <jbrunet@baylibre.com>,
 <martin.blumenstingl@googlemail.com>, <matthias.bgg@gmail.com>,
 <angelogioacchino.delregno@collabora.com>, <heiko@sntech.de>,
 <mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>,
 <wens@csie.org>, <jernej.skrabec@gmail.com>, <samuel@sholland.org>,
 <kees@kernel.org>, <gustavoars@kernel.org>, <linux@treblig.org>,
 <robh@kernel.org>, <u.kleine-koenig@pengutronix.de>,
 <erick.archer@gmx.com>, <christophe.jaillet@wanadoo.fr>,
 <val@packett.cool>, <christophe.kerello@foss.st.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
 <linux-renesas-soc@vger.kernel.org>, <linux-rockchip@lists.infradead.org>,
 <linux-stm32@st-md-mailman.stormreply.com>, <krzk@kernel.org>,
 <jic23@kernel.org>
Subject: Re: [PATCH -next RESEND 00/10] mtd: Use
 for_each_child_of_node_scoped()
Message-ID: <20240826115213.389acaef@xps-13>
In-Reply-To: <20240826094328.2991664-1-ruanjinjie@huawei.com>
References: <20240826094328.2991664-1-ruanjinjie@huawei.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com

Hi Jinjie,

ruanjinjie@huawei.com wrote on Mon, 26 Aug 2024 17:43:18 +0800:

> Use scoped for_each_available_child_of_node_scoped() when iterating over
> device nodes to make code a bit simpler.

Why is this a resend ? Did I miss a previous iteration?

Thanks,
Miqu=C3=A8l

