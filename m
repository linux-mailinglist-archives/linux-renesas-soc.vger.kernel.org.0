Return-Path: <linux-renesas-soc+bounces-19940-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CBE3B18E6A
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  2 Aug 2025 14:38:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 546F017E134
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  2 Aug 2025 12:38:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E185230BC8;
	Sat,  2 Aug 2025 12:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iLj+yzbI"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C89402264B5
	for <linux-renesas-soc@vger.kernel.org>; Sat,  2 Aug 2025 12:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754138290; cv=none; b=sarB42UZd0g52sgK7oM2zTvJ/gh65D6fz6ro0LZ9RwLKfsuEYCLMuOAzOSMCoDBe4Utyi0E/UfICGAJcTxs95Sf3quyQRnuPfHj40aH9BvwYyw6MBWFy1TWyLVttg05KR9yqyLXbwAXhiFH5w4nYYQkfbNAMHb0oIXeo+D/U1O4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754138290; c=relaxed/simple;
	bh=kjNMGi0IvuVGXF8RnqYfZcDE+z5GAU+wzdFjcp7iLnM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sTjq4nEN6r3gt4P1EFf5gtNAVdyZeYWyiy6qGyAQFHCVq6ljAZ98KPU7hOJ397/yTrYTNY6PIirye62+iKxBnh6eYlR+lXlrxH+UkQ9s0Onti4q41Az/gUi9t7ASE0sNX33H35Xb3/esvg00vbXjZSKmugKKnnwQuFxZWHiiKCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iLj+yzbI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5728ipTl013448
	for <linux-renesas-soc@vger.kernel.org>; Sat, 2 Aug 2025 12:38:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yY+5Vc4wWCp8Q+lqkXgyh1f1Eka3dbE6PZDRDj30axM=; b=iLj+yzbIUQdJmpPE
	HSCMNc/WukNLpBT4WQTMuU2Elh3jlNsbdJ3wd7gziWpdQ65t+tBxIrNYtMU+MFuJ
	HkIflk49HRXLBE2e9aKmEFEMADiJXGpyVkCfWqzZ2oRbpsC/Is+DUfmvIOCD1CL7
	+su5CJLM5ymQuGWntuLQlXV8emoqlaA1Boot08Xzssob33f1R3HI/ecNvYw7Rexb
	A0P7DlMACxYME3GtSMcdlQDuCabxpvlQxkQpGykwEkKpz6XKqy0U5VviVBINJlk4
	vqmrWlp/XyTcfHt6AsjKW9089optU/83B4pIoedJbH9vwu6CHrl90A4PA/AyXS0L
	8x2ZGA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 489aw70rr3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Sat, 02 Aug 2025 12:38:06 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4aef8afd26bso7088121cf.0
        for <linux-renesas-soc@vger.kernel.org>; Sat, 02 Aug 2025 05:38:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754138285; x=1754743085;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yY+5Vc4wWCp8Q+lqkXgyh1f1Eka3dbE6PZDRDj30axM=;
        b=me+K4pG2Nspkw/xFUuOjCWzrcm8IY/fw/X/I5jVb9riesdofaF9N7Y0mile6vhvMQz
         /wBHbB5TLjBcPQR/14J+whJSyGC6SEvSMH21MxLI7TRX42Z9trYQ4DafzpkAeObvEwxM
         3MXb8Rv4GdC9tMF3EdMyBpbom0aHSUYRHeICkA/+iqqFnspIez/Qt0cqLgdx6U/TRuu2
         8HvWl6KYdHwyOVkXsTIC14q8M6D4QPM8sHwy77cA4M26hGKgxV2/mxsQLQowyk+A09ie
         lnqW4mhZ+gzIvYpVrLJXRDN0YFiVEJlpnPMQbiiKsjAy26biVD/rUWkQaNIRJVF7zaRH
         lzKQ==
X-Forwarded-Encrypted: i=1; AJvYcCXstkO73Oh3c+i9US3ePZGLVwuPnWx+5mDR5EC/SH6jt4a3Qa7Lyk9r4GfJ5pVvQAx+kbySya6wF4issH5mSAPVZg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzTRmYQtYxRLCavL4ITxdwvygZ+PPNLgCqAfTkDZRTICxwwoTet
	mxYfQ7YhKbCqR48kSunLRcBUPBuQJd0mx2Ea5fZo+MoHqX6jN+BuWhs1x/yu71GYacaht2IBLrs
	gKkAEvK+/DyOtPA/grfvALzt7nlkhdo6Zh9bW0kHERE4J3mATrmz0ae2I8CTi/0bHCpq3yCC/bw
	==
X-Gm-Gg: ASbGncuN4BfTPOrPQ18UeQqBjZAp9gHfs3+67QjUy/pcU2PT6Z1Aj1JHa1MNl8QKhuU
	NNH/2Ex7Y/ZdZe2MWoStiQsUieYIFBttnbUoSeufnflWrtJBJwpblSOfl+W2fcGkZVqS7xZXOdA
	MQTeOxWwIsDrZmcy9GT5LfnTm4Jr3dOyR17ROh+SjS3TrvNs7eU1s+aiCkm7oKzmRwpB8anoM4V
	ow0nkwADPEPMbMNwIBmJ4epzBwLbn3Qpb0tX4YwXeMWBzofe0Qh9pB4pI+u4gG6QFsIOxfnfl0X
	FM3WwBmQBa/Ps0/j/a8MhvMImP9eHTs3HAOGQyqY8HfzspBeBnd8P/TzFmcmmtiT1nLENgq83b7
	IgmP4vmLdLAcjhNmVqQ==
X-Received: by 2002:a05:622a:54e:b0:4ab:67a3:ec09 with SMTP id d75a77b69052e-4af1094cd78mr22381991cf.6.1754138285166;
        Sat, 02 Aug 2025 05:38:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGFPF9qOzJpGO98jPyAvuhk/RML1vSf6VMcwdOoFpMcr/LQVR1VYdVHuTAn5xus4wthkO0plg==
X-Received: by 2002:a05:622a:54e:b0:4ab:67a3:ec09 with SMTP id d75a77b69052e-4af1094cd78mr22381721cf.6.1754138284551;
        Sat, 02 Aug 2025 05:38:04 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a0761f2sm434931766b.11.2025.08.02.05.37.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 Aug 2025 05:38:03 -0700 (PDT)
Message-ID: <0c2cc631-21fd-41fd-9293-fd86dd09a2d2@oss.qualcomm.com>
Date: Sat, 2 Aug 2025 14:37:54 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 2/6] dmaengine: Make of_dma_request_slave_channel pass
 a cookie to of_xlate
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Frank Li <Frank.li@nxp.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
        Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
        Viresh Kumar <vireshk@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Taichi Sugaya <sugaya.taichi@socionext.com>,
        Takao Orito <orito.takao@socionext.com>,
        =?UTF-8?Q?Andreas_F=C3=A4rber?=
 <afaerber@suse.de>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        =?UTF-8?Q?Am=C3=A9lie_Delaunay?= <amelie.delaunay@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Chen-Yu Tsai
 <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Laxman Dewangan
 <ldewangan@nvidia.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Michal Simek <michal.simek@amd.com>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@google.com>,
        =?UTF-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
        Viken Dadhaniya <quic_vdadhani@quicinc.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Krzysztof Kozlowski
 <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
        asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-rpi-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        imx@lists.linux.dev, linux-actions@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
        linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-spi@vger.kernel.org
References: <20250730-topic-dma_genise_cookie-v1-0-b505c1238f9f@oss.qualcomm.com>
 <20250730-topic-dma_genise_cookie-v1-2-b505c1238f9f@oss.qualcomm.com>
 <aIpKz495WI1SJTeB@lizhi-Precision-Tower-5810>
 <20250730180417.GC21430@pendragon.ideasonboard.com>
 <aIpmgpXME1BmThxU@lizhi-Precision-Tower-5810>
 <20250801120007.GB4906@pendragon.ideasonboard.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250801120007.GB4906@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: fqu9QOcdXirktK6ac6EvXSryRmXqx8Rv
X-Proofpoint-ORIG-GUID: fqu9QOcdXirktK6ac6EvXSryRmXqx8Rv
X-Authority-Analysis: v=2.4 cv=MrZS63ae c=1 sm=1 tr=0 ts=688e06ae cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=Hh3C_mqfd76DgmRPW0UA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAyMDEwNSBTYWx0ZWRfXxdaOzdlneaf6
 0lUAZkkZCKhMsAusn8/7NxYqpyb7MLQOsl8x+2n+Vlw3mS/vag3HzmW+kRbg+cP5/p9lwLefQuV
 mv7NeUG6u1XpOAgbul00FPtXX2NAe+4r5bm0NL3YCrsV/C5UEJLF32TVR7yvIN87sgqYB81wzOZ
 VNBi3PgrziLK71072nguf0+0lb9Ga7MCH+aRwVlVSDhmXvcsKSfdeHeRL1Vs2JK5mDL2N/7uTXm
 hemZHEHT2fuctFQL3i7mxG935x34Ghl3NaDf+TO0rSfLOdnQV3NCd3J/w72N+rTTd+yJfjfb83e
 aGg2wekzDRzjCPNFG9dV0zQBILY8OSkbocTlygzXCsXri/MKBN44dhTLEeSZAA6cO9jAoRFKGK1
 /gAd40i/DPrcxdOeUgk/m0paK5arz5c1ZjN0+ZyjWb4kQIEYWsxGskrC3oTUrnaMPF3hAVnx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_08,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 impostorscore=0 bulkscore=0 phishscore=0 mlxlogscore=999 priorityscore=1501
 malwarescore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508020105

On 8/1/25 2:00 PM, Laurent Pinchart wrote:
> Hi Frank,
> 
> On Wed, Jul 30, 2025 at 02:37:54PM -0400, Frank Li wrote:
>> On Wed, Jul 30, 2025 at 09:04:17PM +0300, Laurent Pinchart wrote:
>>> On Wed, Jul 30, 2025 at 12:39:43PM -0400, Frank Li wrote:
>>>> On Wed, Jul 30, 2025 at 11:33:29AM +0200, Konrad Dybcio wrote:
>>>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>>
>>>>> The DMA subsystem attempts to make it theoretically possible to pair
>>>>> any DMA block with any user. While that's convenient from a
>>>>> codebase sanity perspective, some blocks are more intertwined.
>>>>>
>>>>> One such case is the Qualcomm GENI, where each wrapper contains a
>>>>> number of Serial Engine instances, each one of which can be programmed
>>>>> to support a different protocol (such as I2C, I3C, SPI, UART, etc.).
>>>>>
>>>>> The GPI DMA it's designed together with, needs to receive the ID of the
>>>>> protocol that's in use, to adjust its behavior accordingly. Currently,
>>>>> that's done through passing that ID through device tree, with each
>>>>> Serial Engine expressed NUM_PROTOCOL times, resulting in terrible
>>>>> dt-bindings that are full of useless copypasta.
>>>>>
>>>>> In a step to cut down on that, let the DMA user give the engine driver
>>>>> a hint at request time.
>>>>>
>>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>> ---

[...]

>>>>> diff --git a/include/linux/of_dma.h b/include/linux/of_dma.h
>>>>> index fd706cdf255c61c82ce30ef9a2c44930bef34bc8..9f9bc4207b85d48d73c25aad4b362e7c84c01756 100644
>>>>> --- a/include/linux/of_dma.h
>>>>> +++ b/include/linux/of_dma.h
>>>>> @@ -19,7 +19,7 @@ struct of_dma {
>>>>>  	struct list_head	of_dma_controllers;
>>>>>  	struct device_node	*of_node;
>>>>>  	struct dma_chan		*(*of_dma_xlate)
>>>>> -				(struct of_phandle_args *, struct of_dma *);
>>>>> +				(struct of_phandle_args *, struct of_dma *, void *);
>>>>
>>>> I suggest pass down more informaiton, like client's dev point. So we can
>>>> auto create device link between client's dev and dma chan's device.
>>>
>>> Is .of_dma_xlate() really the right place to do that ? If you want to
>>> create a device link for PM reasons, isn't it better created when the
>>> channel is requested ? It should also be removed when the channel is
>>> freed.
>>
>> I remember just need record client device pointer here.
>>
>>>>
>>>> DMA Engineer device
>>>>    DMA chan device
>>>>        consumer clients' device.
>>>>
>>>> If consumer device runtime pm suspend can auto trigger DMA chan's device's
>>>> runtime pm function.
>>>>
>>>> It will simplifly DMA engine's run time pm manage. Currently many DMA run
>>>> time pm implement as, runtime_pm_get() when alloc and runtime_pm_put() at
>>>> free channel.  But many devices request dma channel at probe, which make
>>>> dma engine work at always 'on' state.
>>>>
>>>> But ideally, dma chan should be resume only when it is used to transfer.
>>>
>>> This is exactly what I was going to mention after reading the last
>>> paragraph. Is there anything that prevents a DMA engine driver to
>>> perform a rutime PM get() when a transfer is submitted
>>
>> DMA description is a queue, It is hard to track each descriptor submit and
>> finished. espcially cycle buffer case.
>>
>> And according to dma engine API defination, submit a descriptor not
>> neccessary to turn on clock, maybe just pure software operation, such as
>> enqueue it to a software list.
>>
>> Many driver call dmaengine_submit() in irq context,  submit new descriptor
>> when previous descriptor finished. runtime_pm_get() can NOT be called in
>> atomic context.
>>
>> And some driver submit many descripor advance. Only issue_transfer() is
>> actually trigger hardware to start transfer.
>>
>> Some client use cycle descripor, such audio devices.  Some audio devices
>> have not free descriptor at their run time suspend function, just disable
>> audio devices's clocks.  Audio devices run time suspend, which means no
>> one use this dma channel, dma channel can auto suspend if built device link
>> between audio device and dma chan devices.
>>
>> Some DMA client have not devices, such as memory to memory. for this kind
>> case, it need keep chan always on.
>>
>> issue_transfer() can be call in atomic context. but trigger hardware transfer
>> need clock and runtime_pm_get() can't be called in atomic context.
>>
>> Most case issue_transfer() is call in irq handle, which means device should
>> already be in runtime resume statue.  DMA engine can safely access their
>> register if using device link.
> 
> You have good points there, in particular the fact the issue_transfer()
> can be called in interrupt context.
> 
> For me this calls for new DMA engine operations to "start/stop" the DMA
> engine (better names are likely needed) from a client perspective.
> 
>>> and a put() when
>>> it completes ? (Logically speaking, the actual implementation would
>>> likely be a bit different in drivers, but the result would be similar.)

So.. do you folks want me to alter the patch in any way?

Konrad

