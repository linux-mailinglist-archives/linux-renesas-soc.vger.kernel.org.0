Return-Path: <linux-renesas-soc+bounces-17490-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C592AAC3C1D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 May 2025 10:54:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8F0BD3A5946
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 May 2025 08:53:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0ED71E7C05;
	Mon, 26 May 2025 08:53:55 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE8F71EF397;
	Mon, 26 May 2025 08:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748249635; cv=none; b=RR0K/oNKnq71iz8tdxpDmk+CsoDf9d/sDujbAnGJ372UhXiij+SSduzvvm6xdiWiyILc9RTXZlin7NMEFjb99NWh+cfLNvbtBJWPXazLvuW9C/jZdhs8/2LvwbaEKEI/vV+A/o1IEuf418QnghBiJiuLhqS77qZjoyMgvSM59mI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748249635; c=relaxed/simple;
	bh=FlCOtU9CCuR9lkUNWVYDcar0PqDo3voYYIIfoi97ZlQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dODZ2/FgIOQyXIUyi9ti2GW07yrhWX/LLPK99wdt1GzFZ4kUfkqG4usHOyDrcfIgXSpY25Q8gI9Yg2CAeUwti7EbY24cYQxMtV9gqOpPpHv3kZEPodqyr0hUMg8zDZD00sfvCendPzWzhPn1DmxbI1ei3Gr4hxJiyhZMmD5hjw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: ef5a1a7a3a0e11f0b29709d653e92f7d-20250526
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:2a582296-71b1-4427-aff1-0d66ba2e24a6,IP:10,
	URL:0,TC:0,Content:0,EDM:0,RT:0,SF:-3,FILE:0,BULK:30,RULE:Release_Ham,ACTI
	ON:release,TS:37
X-CID-INFO: VERSION:1.1.45,REQID:2a582296-71b1-4427-aff1-0d66ba2e24a6,IP:10,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:-3,FILE:0,BULK:30,RULE:Release_Ham,ACTION
	:release,TS:37
X-CID-META: VersionHash:6493067,CLOUDID:01155e3f26d2f9f964f0833965c5c673,BulkI
	D:250522180435BN613KC0,BulkQuantity:7,Recheck:0,SF:19|24|38|45|64|66|72|78
	|80|81|82|83|102|841,TC:nil,Content:0|50,EDM:-3,IP:-2,URL:0,File:nil,RT:ni
	l,Bulk:40|23,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:
	0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 1,FCT
X-CID-BAS: 1,FCT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FSD,TF_CID_SPAM_FSI
X-UUID: ef5a1a7a3a0e11f0b29709d653e92f7d-20250526
X-User: aichao@kylinos.cn
Received: from [172.25.120.86] [(112.64.161.44)] by mailgw.kylinos.cn
	(envelope-from <aichao@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 2088584585; Mon, 26 May 2025 16:53:46 +0800
Message-ID: <3869e6fc-1cbf-4113-9b34-0cbb5d4b5176@kylinos.cn>
Date: Mon, 26 May 2025 16:53:42 +0800
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] ASoC: aoa: Use helper function
 for_each_child_of_node_scoped()
To: Christophe Leroy <christophe.leroy@csgroup.eu>, perex@perex.cz,
 tiwai@suse.com, johannes@sipsolutions.net, kuninori.morimoto.gx@renesas.com,
 lgirdwood@gmail.com, broonie@kernel.org, jbrunet@baylibre.com,
 neil.armstrong@linaro.org, khilman@baylibre.com,
 martin.blumenstingl@googlemail.com, shengjiu.wang@gmail.com,
 Xiubo.Lee@gmail.com, festevam@gmail.com, nicoleotsuka@gmail.com,
 shawnguo@kernel.org, s.hauer@pengutronix.de, srinivas.kandagatla@linaro.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-renesas-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 imx@lists.linux.dev, kernel@pengutronix.de, linux-arm-msm@vger.kernel.org
References: <20250522050300.519244-1-aichao@kylinos.cn>
 <20250522050300.519244-3-aichao@kylinos.cn>
 <8ad901c3-3fcb-4643-ac5a-c1f30f93d07f@csgroup.eu>
Content-Language: en-US
From: Ai Chao <aichao@kylinos.cn>
In-Reply-To: <8ad901c3-3fcb-4643-ac5a-c1f30f93d07f@csgroup.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Christophe:

>> The for_each_child_of_node_scoped() helper provides a scope-based
>> clean-up functionality to put the device_node automatically, and
>> as such, there is no need to call of_node_put() directly.
>
> I don't understand this explanation.
>
> You say "no need to call of_node_put()" and the only thing you do in 
> addition to changing from for_each_child_of_node() to 
> for_each_child_of_node_scoped() is to _add_ a new call to of_node_put().
>
> I would expect to see a _removal_ of some of_node_put() when I read 
> your description.
>
>>       }
>> +    of_node_put(sound);
>> +

The for_each_child_of_node() function is used to iterate over all child 
nodes of a device tree node.  During each iteration, it retrieves a 
pointer to the child node via of_get_next_child() and automatically 
increments the node's reference count (of_node_get()). Each call to 
of_get_next_child() increases the reference count (refcount) of the 
returned child node, ensuring that the node is not freed while in use.
for_each_child_of_node() increments the child node's reference count in 
each iteration but does not decrement it automatically.
If of_node_put() is not called manually, the reference count will never 
reach zero, resulting in a memory leak of the node.

In function i2sbus_add_dev, it used device_node out of 
for_each_child_of_node(){},  it need to add a new call to 
of_node_put(sound) to reference count.

In function i2cbus_probe, it used device_node in 
for_each_child_of_node(){}, used for_each_child_of_node_scoped() is 
better than for_each_child_of_node().

Best regards,
Ai Chao

