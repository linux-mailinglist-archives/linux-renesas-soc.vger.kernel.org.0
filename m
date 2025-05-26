Return-Path: <linux-renesas-soc+bounces-17486-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 32305AC3B42
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 May 2025 10:13:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5897F3B7788
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 May 2025 08:12:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1144C1E32B9;
	Mon, 26 May 2025 08:12:38 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F3371E2852;
	Mon, 26 May 2025 08:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748247158; cv=none; b=Xu6B3zxJCBlHAoTEP2NDdsRhfKtMLFxY+d31P2ZNZMU7dSPpvX1uvXxCk6S76d+1PVATzl2dEZ41cFOZOVe5qkVItkPDNn/4DUncocPVD49SH6qXtcrsU9VOA3Sk/Dga4cUvF6YENkaI4iRZ/12A9X0Bm64buwm4i2MrF69zYaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748247158; c=relaxed/simple;
	bh=MAENNmNwrH3W/QEGRqPR4bnA+t7nJWBfnxxjoyBBWks=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GozPpLOmdl4AGynmvd0Na15+ZoptRNszhjGNq/RgrzlSBJchY849dicCltx8TDcfN9ut85zw/hascEKcJ1Pase4Ys4FWoIgDmA5iR1jd+beXTXNV++wRbvFYrEiIABSA0iL01/NpyE7KEOe5ckki2wUIh0guX7wpzWUiHpdrqm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 28f646603a0911f0b29709d653e92f7d-20250526
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:429e306a-3d2a-428c-8e5d-381513c7b4c8,IP:10,
	URL:0,TC:0,Content:0,EDM:0,RT:0,SF:-3,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:7
X-CID-INFO: VERSION:1.1.45,REQID:429e306a-3d2a-428c-8e5d-381513c7b4c8,IP:10,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:-3,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:7
X-CID-META: VersionHash:6493067,CLOUDID:556e8e9b46a75800489301288524277b,BulkI
	D:250522180435BN613KC0,BulkQuantity:3,Recheck:0,SF:19|24|38|45|64|66|72|78
	|80|81|82|83|102|841,TC:nil,Content:0|50,EDM:-3,IP:-2,URL:0,File:nil,RT:ni
	l,Bulk:40,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,B
	RR:0,BRE:0,ARC:0
X-CID-BVR: 1,FCT
X-CID-BAS: 1,FCT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FSD,TF_CID_SPAM_FSI
X-UUID: 28f646603a0911f0b29709d653e92f7d-20250526
X-User: aichao@kylinos.cn
Received: from [172.25.120.86] [(112.64.161.44)] by mailgw.kylinos.cn
	(envelope-from <aichao@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 2080723570; Mon, 26 May 2025 16:12:26 +0800
Message-ID: <eb1ddeb3-06b6-4ac5-b20a-06b92c7f1363@kylinos.cn>
Date: Mon, 26 May 2025 16:12:22 +0800
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] ASoC: aoa: Use helper function
 for_each_child_of_node_scoped()
To: Johannes Berg <johannes@sipsolutions.net>, perex <perex@perex.cz>,
 tiwai <tiwai@suse.com>,
 "kuninori.morimoto.gx" <kuninori.morimoto.gx@renesas.com>,
 lgirdwood <lgirdwood@gmail.com>, broonie <broonie@kernel.org>,
 jbrunet <jbrunet@baylibre.com>, "neil.armstrong"
 <neil.armstrong@linaro.org>, khilman <khilman@baylibre.com>,
 "martin.blumenstingl" <martin.blumenstingl@googlemail.com>,
 "shengjiu.wang" <shengjiu.wang@gmail.com>, "Xiubo.Lee"
 <Xiubo.Lee@gmail.com>, festevam <festevam@gmail.com>,
 nicoleotsuka <nicoleotsuka@gmail.com>, shawnguo <shawnguo@kernel.org>,
 "s.hauer" <s.hauer@pengutronix.de>,
 "srinivas.kandagatla" <srinivas.kandagatla@linaro.org>
Cc: linux-sound <linux-sound@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-renesas-soc <linux-renesas-soc@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-amlogic <linux-amlogic@lists.infradead.org>, imx
 <imx@lists.linux.dev>, kernel <kernel@pengutronix.de>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>
References: <2aq0nyvyf7t-2aq4hsc7kp6@nsmail7.0.0--kylin--1>
 <7e708dcc98c6f0f615b1b87d190464cfe78be668.camel@sipsolutions.net>
Content-Language: en-US
From: Ai Chao <aichao@kylinos.cn>
In-Reply-To: <7e708dcc98c6f0f615b1b87d190464cfe78be668.camel@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Johannes:

>> "simplifies the code" is no need to callof_node_put() .
> Fair. Except that's not what you _actually_ changed here. Like I said,
> either it's buggy before or after.
>
In the function i2sbus_probe, it not return a struct device_node, so , I 
think function for_each_child_of_node_scoped is better than 
for_each_child_of_node.

Best regards,
Ai Chao

