Return-Path: <linux-renesas-soc+bounces-8527-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94BE39657A9
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Aug 2024 08:34:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0433AB20D00
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Aug 2024 06:34:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40C7514C5AE;
	Fri, 30 Aug 2024 06:34:47 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 547481D131D;
	Fri, 30 Aug 2024 06:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.255
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724999687; cv=none; b=AwlbsQCHew+NesI4b2CA46RqzaJCCtX1RI1siD6tdPcLhrKob5W1M91RpEberp9EmORhyQK8GQdUJMcDqjn1B6ouLDavO1yiSl4SQ2gxvfrXz6R+iSakrWB7MflnbSRWqqr4prhLoCcOi2Mmcsk5e1bW2nMkAgAkYV/xmuh9u/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724999687; c=relaxed/simple;
	bh=kUpqT8jMjevQ7Wt6Fg62s/nEvpFn2mHHVE8PIYca72A=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=XarqE0snQi2c0Xpqr18Iq9r/mMaGBa6n55uKFWrBbSBtEQuwKJ12FpP7ExSlnRQJrGoPmL8xbkyTMRlR3gzgmIdQADKJRA44ULCpZ+kYSozxjcT+L/Nt7cnlthEKGK6ArJfuaHyRE7VYoWIPGEzBwuNmFyeEuIQKQH/FsgidyPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.255
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4Ww7dp3fr0z18MyV;
	Fri, 30 Aug 2024 14:33:50 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
	by mail.maildlp.com (Postfix) with ESMTPS id 14CA1140202;
	Fri, 30 Aug 2024 14:34:41 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemh500013.china.huawei.com (7.202.181.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 30 Aug 2024 14:34:39 +0800
Message-ID: <c29263ae-89f1-edd7-003a-bd03cdddc821@huawei.com>
Date: Fri, 30 Aug 2024 14:34:38 +0800
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
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
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

Hi, Miquel,

Could this series be merged, thank you!

> 
> Jinjie, please always include a changelog when you send new versions,
> and explanations for a RESEND.
> 
> Thanks,
> Miquèl

