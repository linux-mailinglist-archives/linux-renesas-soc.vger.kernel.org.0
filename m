Return-Path: <linux-renesas-soc+bounces-17669-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A2CA4AC8AE1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 May 2025 11:33:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9A6D07B513C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 May 2025 09:32:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5150422AE7B;
	Fri, 30 May 2025 09:31:15 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E23221560;
	Fri, 30 May 2025 09:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748597475; cv=none; b=XDQsH0+YHY5XjVaTgW1RXTiRtlDQ/lp88FXy4/cj7GBakfV6qVUY2cKke9J9lZ2jjdpFZv55ByhPv8cTeziefySjasfOZXZKIhjru0aIZ4rpFGehtisopqnpXMlQp9s0H1c1alTedwqiyPewprK8rgH/9aKuIj06/sty1GfygjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748597475; c=relaxed/simple;
	bh=aggFkJ8dzIspA0Ee5ZCSXr4Q9BtosF9ZAdFKHZ23WJo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z6FuM1baEJfcQGThZwWYaN+tXugFSQ43L79TFAHQKqmMcJO3zBO4hcsOV1PreEBWZPOoKjgp/ikJgmnHs04zx/bTKn1i1toDcQIVcX36h4aAZVp5otRMe4K6ck3XLd8y/IODVygwXlFdCqId1AnSDQtpXJumA+v4tUm77xuySus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: ce23f0383d3811f0b29709d653e92f7d-20250530
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:9901f846-04db-40fa-9f89-284431738858,IP:10,
	URL:0,TC:0,Content:0,EDM:0,RT:0,SF:-9,FILE:0,BULK:30,RULE:Release_Ham,ACTI
	ON:release,TS:31
X-CID-INFO: VERSION:1.1.45,REQID:9901f846-04db-40fa-9f89-284431738858,IP:10,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:-9,FILE:0,BULK:30,RULE:Release_Ham,ACTION
	:release,TS:31
X-CID-META: VersionHash:6493067,CLOUDID:9a3853ec8758490979c83e53ed79c393,BulkI
	D:250522180435BN613KC0,BulkQuantity:9,Recheck:0,SF:17|19|24|38|45|64|66|78
	|80|81|82|83|102|841,TC:nil,Content:0|50,EDM:-3,IP:-2,URL:0,File:nil,RT:ni
	l,Bulk:40|23,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:
	0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,TF_CID_SPAM_FSI,TF_CID_SPAM_SNR
X-UUID: ce23f0383d3811f0b29709d653e92f7d-20250530
X-User: aichao@kylinos.cn
Received: from [172.25.120.86] [(112.64.161.44)] by mailgw.kylinos.cn
	(envelope-from <aichao@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 1724392610; Fri, 30 May 2025 17:31:03 +0800
Message-ID: <22dfeb0b-c3ff-4a7a-8471-1bb89dccdc17@kylinos.cn>
Date: Fri, 30 May 2025 17:30:58 +0800
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
 <eb1ddeb3-06b6-4ac5-b20a-06b92c7f1363@kylinos.cn>
 <23aadbd78d3585c900c579c26f360011cf1ca830.camel@sipsolutions.net>
 <9ec008a8-b569-4ad1-9206-fe241fb1712d@kylinos.cn>
 <b36908bf35a20f7196bec4fe22e392a015d9b7d1.camel@sipsolutions.net>
Content-Language: en-US
From: Ai Chao <aichao@kylinos.cn>
In-Reply-To: <b36908bf35a20f7196bec4fe22e392a015d9b7d1.camel@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Johannes:
     Thanks for your feedback.  I will drop it.

> On Mon, 2025-05-26 at 16:20 +0800, Ai Chao wrote:
>> Hi Johannes:
>>>> for_each_child_of_node.
>>> You still haven't explained why it's even correct.
>>>
>>> johannes
>> The for_each_child_of_node() function is used to iterate over all child
>> nodes of a device tree node.
>> During each iteration, it retrieves a pointer to the child node via
>> of_get_next_child() and automatically increments the node's reference
>> count (of_node_get()).
>> Each call to of_get_next_child() increases the reference count
>> (refcount) of the returned child node, ensuring that the node is not
>> freed while in use.
>> for_each_child_of_node() increments the child node's reference count in
>> each iteration but does not decrement it automatically.
>> If of_node_put() is not called manually, the reference count will never
>> reach zero, resulting in a memory leak of the node.
> Yes, good! Now show that you can apply what you've learned to the
> specific code (and changes) at hand.
>
> johannes

-- 
Best regards,
Ai Chao


