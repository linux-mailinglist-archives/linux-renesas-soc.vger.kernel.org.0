Return-Path: <linux-renesas-soc+bounces-8286-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AA2E395F239
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Aug 2024 14:56:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 55B561F2303A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Aug 2024 12:56:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8C64155A34;
	Mon, 26 Aug 2024 12:56:11 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79AC6155A43;
	Mon, 26 Aug 2024 12:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724676971; cv=none; b=DlohVf/TZzT5dBbJy4EqgMiN5gW0xSDjP9qvHwD4wvRtvV02RxjaKTzpt8RVKCZGv35swg2SGctJkkedmgyloa1VReXvPOUUa/YGTYFIEEfRb01cnF1RLQjFIFN6FC7ZBhLElsgIYl4hQIDETqs4xNnhZPIGkRr7AsjhvjT6xDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724676971; c=relaxed/simple;
	bh=EzVe+IRj5Ys6ZzjzM1mOznky6zY0gybFP8fcg3upRys=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=G7sOYKOYR2fdQj7A0A8Hzf+a5Rf4nh0ojD+fwDeCS31XgtWdgYUiDBQzNzrrVJJxzqDOZiYKmc1V1lXj+777q8RIdqcsZnjXOCYUAx4Mzu3oQS6Q4ts8TTrHeVZmySH15mft8Wdk4OmHoq0R75Xa2eTkYqVdDtlks0hsTIjTE9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4WsrJ9268SzyR3h;
	Mon, 26 Aug 2024 20:55:37 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
	by mail.maildlp.com (Postfix) with ESMTPS id 79DC01800A5;
	Mon, 26 Aug 2024 20:56:05 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemh500013.china.huawei.com (7.202.181.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 26 Aug 2024 20:56:03 +0800
Message-ID: <061c39b9-c2fb-34e8-5848-dc2d2d9ca5eb@huawei.com>
Date: Mon, 26 Aug 2024 20:56:02 +0800
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
To: Miquel Raynal <miquel.raynal@bootlin.com>, Krzysztof Kozlowski
	<krzk@kernel.org>
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
	<linux-stm32@st-md-mailman.stormreply.com>, <jic23@kernel.org>
References: <20240826094328.2991664-1-ruanjinjie@huawei.com>
 <20240826115213.389acaef@xps-13>
 <f7430f87-88d2-4c08-bc1e-6bb3da4e332c@kernel.org>
 <20240826144917.2c4e202d@xps-13>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20240826144917.2c4e202d@xps-13>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemh500013.china.huawei.com (7.202.181.146)



On 2024/8/26 20:49, Miquel Raynal wrote:
> Hi Krzysztof,
> 
> krzk@kernel.org wrote on Mon, 26 Aug 2024 12:19:07 +0200:
> 
>> On 26/08/2024 11:52, Miquel Raynal wrote:
>>> Hi Jinjie,
>>>
>>> ruanjinjie@huawei.com wrote on Mon, 26 Aug 2024 17:43:18 +0800:
>>>   
>>>> Use scoped for_each_available_child_of_node_scoped() when iterating over
>>>> device nodes to make code a bit simpler.  
>>>
>>> Why is this a resend ? Did I miss a previous iteration?  
>>
>> You were not cc-ed on previous iteration. I asked for proper split
>> between subsystems and sending to maintainers, thus this resend.
> 
> Ok. Makes sense, and the patchset looks fine.
> 
> Jinjie, please always include a changelog when you send new versions,
> and explanations for a RESEND.

Ok, thanks for the advice.

> 
> Thanks,
> Miquèl

