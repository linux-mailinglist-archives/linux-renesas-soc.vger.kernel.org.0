Return-Path: <linux-renesas-soc+bounces-8248-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2412495EF16
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Aug 2024 12:55:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D56DA288C56
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Aug 2024 10:55:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5241C1487E3;
	Mon, 26 Aug 2024 10:53:51 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ECF129A2;
	Mon, 26 Aug 2024 10:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724669631; cv=none; b=jCoitjs+T4ZA4/jx7/6WZXj/26elVXnqJ6GKmEFQJN92C/c3TfQPABdrAzsLshVibS8H4maborotPJ5GB4MpA4d2RDOhxFtV5udDEjcWqN1TvnuSjQQ7Ng81T6zQ07Ojv1wCzPBWX9Gslft77Wxn7FIYwgs53aU8Zeb9C29deak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724669631; c=relaxed/simple;
	bh=rbLDSLzqYVWDbIAJ0gQcb0pY+30c68c0iGZfrbxw1B0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Hpwid4d5GpjM2Ds7klO/et+9F8YMSOROKLcaNyFuSpQuIW8Ab84A65eMWaAPYvBWeHw66wSc4C+ajQZA7qETiuU3W8HuKqzWiNqmVzWfIiUApnllzM26E8dWigIQRRV+x/rjwANACxFDosN8JBopSmNXYvk5S17WkSG9F2FE8Y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4WsnYB2s0kzhXc8;
	Mon, 26 Aug 2024 18:51:42 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
	by mail.maildlp.com (Postfix) with ESMTPS id 4FD851800A7;
	Mon, 26 Aug 2024 18:53:45 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemh500013.china.huawei.com (7.202.181.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 26 Aug 2024 18:53:43 +0800
Message-ID: <3e0ba029-d658-be41-77ac-6edec75762d1@huawei.com>
Date: Mon, 26 Aug 2024 18:53:42 +0800
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH -next RESEND 00/10] mtd: Use
 for_each_child_of_node_scoped()
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: <michal.simek@amd.com>, <richard@nod.at>, <vigneshr@ti.com>,
	<liang.yang@amlogic.com>, <neil.armstrong@linaro.org>,
	<khilman@baylibre.com>, <jbrunet@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <heiko@sntech.de>,
	<mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>, <wens@csie.org>,
	<jernej.skrabec@gmail.com>, <samuel@sholland.org>, <kees@kernel.org>,
	<gustavoars@kernel.org>, <linux@treblig.org>, <robh@kernel.org>,
	<u.kleine-koenig@pengutronix.de>, <erick.archer@gmx.com>,
	<christophe.jaillet@wanadoo.fr>, <val@packett.cool>,
	<christophe.kerello@foss.st.com>, <linux-mtd@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-renesas-soc@vger.kernel.org>, <linux-rockchip@lists.infradead.org>,
	<linux-stm32@st-md-mailman.stormreply.com>, <krzk@kernel.org>,
	<jic23@kernel.org>
References: <20240826094328.2991664-1-ruanjinjie@huawei.com>
 <20240826115213.389acaef@xps-13>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20240826115213.389acaef@xps-13>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemh500013.china.huawei.com (7.202.181.146)



On 2024/8/26 17:52, Miquel Raynal wrote:
> Hi Jinjie,
> 
> ruanjinjie@huawei.com wrote on Mon, 26 Aug 2024 17:43:18 +0800:
> 
>> Use scoped for_each_available_child_of_node_scoped() when iterating over
>> device nodes to make code a bit simpler.
> 
> Why is this a resend ? Did I miss a previous iteration?

Hi Miquel,

The previous cc list has missing some entries.

> 
> Thanks,
> Miquèl

