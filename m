Return-Path: <linux-renesas-soc+bounces-24557-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B16C57B24
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Nov 2025 14:36:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 76B94355826
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Nov 2025 13:33:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95E441C3306;
	Thu, 13 Nov 2025 13:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dCTchLVV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S4MiiTFC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DC9C154BE2
	for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Nov 2025 13:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763040787; cv=none; b=tteE6Hni+D8JPNR/MSkdzfRYzIXjx4UOXcr7uOZXrxLCCH1g2q+UAp3imGrpYWJK5aEC+I7B+uOHT23XXS/hl8ZGvbNGkJMIjE9IriKiCWXl6LUiXsqwxak1hAETFGMeQOQ1eLHU2T2LIzxjkb46eyLgbsVpTER8100QAmSc8pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763040787; c=relaxed/simple;
	bh=WXUFQbgGI72BGKFWLLzMLBxPdA8zEK4LiioFwjl4y0E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QXJc+pxY5A8WzN61n/YypHpaByJONI3hgth+LZkmtMeqr4e0dLcR9R5vhM+JcZlgPu+LpUOijUYY2FT9OXhnWO2Cnx1fCsV5wHkWq2e3ZOEHZatR8ml4Yov+FGeXxtXrV0Kx//7rdDMMfZPGFA5Roq1QSPR2RuaebFyYD2k9iBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dCTchLVV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S4MiiTFC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ADDEVFQ3764074
	for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Nov 2025 13:33:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wNLEUtImMXvAmjKIRtueCGZIQNgFOT3pJRe5fakSwLQ=; b=dCTchLVV2jAjgWiY
	ICFZIXcCA1dJnIdIViz48q5cmif6mK4Tv0rs91XKwf+WAKqP0coiOozMAqCNtf54
	v6WWSIzwslz5D+1JkALoTwwk/ae6y6C0EuTKEYl1O4rTOgn9jwhIMXqcJKyIBLLY
	GH+s4I/2nY0dwLFEo34gHaWMjv5jNRb9nyCg3ZtM58/JWNfCxxyRH82pTPnFmMUq
	7osKcoZo/tExDV4AhVEQD/W6FWf5rXTVCv2+piy1J93B+Y6hkdoZc9qgOc+61TyO
	XCK3H+LqmC4PnvDoQJ9QUGE62ObKb9yqGEqPJM9kWCxuO1TDgaUYSBWnqQ0cRRAI
	BI+hQg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ad9jn1bgh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Nov 2025 13:33:03 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8823e9c63c6so2692416d6.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Nov 2025 05:33:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763040782; x=1763645582; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wNLEUtImMXvAmjKIRtueCGZIQNgFOT3pJRe5fakSwLQ=;
        b=S4MiiTFCul1cQhmfXnht+b6ATdsH0JMjbcbDvDo3MrzaUqUSdD6lyxcb9ktD0oktW0
         FOLpdSusJYJd0zsI8CIhbbwufaddB5DlQ7OWsLChIIDL04MKu175s3n+kBYuxxPIw8QK
         YaK+2gC/o2XB2I9mL+avjJH2VTIYnd4wPnddCSveeZx8CIQosuudLimIqCnDpuMqVYBz
         Nm7ts6SM5xPBU26xLaiXCra9UVwY46nLFEjhlHLJ1oGp0Xdn+EopkElfp2sXBFpWTX4Y
         KrPfvZ1lEZ9iJbc8K2GaMuVSWe/1JLgXwm9uJDcHynR7nLyJJl/nJkqVbOC7LIBZvyyt
         tRjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763040782; x=1763645582;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wNLEUtImMXvAmjKIRtueCGZIQNgFOT3pJRe5fakSwLQ=;
        b=gVXs3WnW8CzIxeTYEAfuP7fkWd0daF+diuY+k0kFB+XXHTUxHq2hJBWlrZSr9u846E
         IbxJY/l7gTtBXHUxpZlZozxnEgi9yzNei5rR06XW58msKLPMPBBLxwdDSajxDlWecljx
         nVKnuw95yDa4vZmTq3bNUB2uYqYreYqMYazgwR5NJ2Af4C05Id03R3mtFtkhJM04paYB
         oB1T8dVlCEmHkMbDgGU970MRgQDb8TC1Gp6fVfqxJshCEEcuQOgKFe9JlaR6W2T1uROC
         PSZ4fVDXswGPTXQm1qDCyMjTexE4k9xZAPKG50zmRgDtxViabzhZTSNjgjrocWnin91V
         4VgQ==
X-Forwarded-Encrypted: i=1; AJvYcCXbdsa13dphBhPeiiw6z7XxoIBnmq6uvs1CUIJbkybGiNDx5pqyckpECVOe2XHyEiz9j+NuMRdpRcvdFK/L1TRfDA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzhgrqdLTMZEJIGNStV7kWTIz5F94FMrlq+uMRw5ZiYzmML60JL
	LiaZbB2yRGA0Xhxie4i9yBWKy9g0IT7kArGE9zT7TGLnMqWs5iL2jsIn1B0QI26qkIccNe2Xngt
	I7W551nB3hdCe1T/fVXkNX33ctxfaCa4AdYfS9XRISfk8d/PaRT2f8okybK08sYkFsGcCAsmiQQ
	==
X-Gm-Gg: ASbGnctolTiGbwXylatxc/XB+BJDpPdCYqJZKPoPfQt7K7Fq3GLNI+nJ9DWIZ3u52Pu
	SWdDm4VzS+c4rhf5FY1+oH9HT1PwHqg/vBtK0WLL7Goa0RuFtFwQdDSL0184icUAVT3oCXweNGa
	++9TOt8Go8ReXXk9IlA+VsPEUeIPtkwgxw4EQ6ypO77s3cE+QI3/bzg8/tNtdpq9P0DIruNKK/r
	e3dbNHHsnPI/QqJdMkhl9drszAWN16cdS0n6o9NxrVe27v4e2nqGJEVB2znBjQi2n+/Y9Wvz7Lj
	1LlhSBFxxqPHiXVfh+y1S8sW8Bbw5Gmfn1hMohsen/1o6l6bU/jjRxtrxyIXeQ4Gn7l0SHofRVM
	OJvIUY+cJ6esNgb9svcOuqoYCNmSo8pj0gq1JBIHSPylbd+ruxwbMk72l
X-Received: by 2002:ac8:5d8e:0:b0:4ed:b9ee:3ce2 with SMTP id d75a77b69052e-4eddbdae8demr64144601cf.11.1763040782380;
        Thu, 13 Nov 2025 05:33:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGrzhJHhVjwGaQu/IkcGeYInBcpQOo8PGlB0mVpgZ0Fcc+3wNub2niPYVso88lX2dAHMTacPQ==
X-Received: by 2002:ac8:5d8e:0:b0:4ed:b9ee:3ce2 with SMTP id d75a77b69052e-4eddbdae8demr64144061cf.11.1763040781802;
        Thu, 13 Nov 2025 05:33:01 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fd80a11sm162333266b.39.2025.11.13.05.32.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Nov 2025 05:33:01 -0800 (PST)
Message-ID: <cd7c0490-a2d6-4885-aa36-ee1492f107b8@oss.qualcomm.com>
Date: Thu, 13 Nov 2025 14:32:53 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/8] net: stmmac: qcom-ethqos: use generic device
 properties
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Vinod Koul <vkoul@kernel.org>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Jose Abreu <joabreu@synopsys.com>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Matthew Gerlach <matthew.gerlach@altera.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Keguang Zhang <keguang.zhang@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com,
        Romain Gantois <romain.gantois@bootlin.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Heiko Stuebner <heiko@sntech.de>, Chen Wang <unicorn_wang@outlook.com>,
        Inochi Amaoto <inochiama@gmail.com>,
        Emil Renner Berthing <kernel@esmil.dk>,
        Minda Chen <minda.chen@starfivetech.com>,
        Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>,
        Fu Wei <wefu@redhat.com>,
        Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Shuang Liang <liangshuang@eswincomputing.com>,
        Zhi Li <lizhi2@eswincomputing.com>,
        Shangjuan Wei <weishangjuan@eswincomputing.com>,
        "G. Jaya Kumaran" <vineetha.g.jaya.kumaran@intel.com>,
        Clark Wang <xiaoning.wang@nxp.com>, Linux Team <linux-imx@nxp.com>,
        Frank Li <Frank.Li@nxp.com>, David Wu <david.wu@rock-chips.com>,
        Samin Guo <samin.guo@starfivetech.com>,
        Christophe Roullier <christophe.roullier@foss.st.com>,
        Swathi K S <swathi.ks@samsung.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Drew Fustini
 <dfustini@tenstorrent.com>, linux-sunxi@lists.linux.dev,
        linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org,
        imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org, sophgo@lists.linux.dev,
        linux-riscv@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20251107-qcom-sa8255p-emac-v5-0-01d3e3aaf388@linaro.org>
 <20251107-qcom-sa8255p-emac-v5-2-01d3e3aaf388@linaro.org>
 <21a3d269-76e6-4da9-aa25-bfd1fb6dfb07@oss.qualcomm.com>
 <CAMRc=MexMn_GSC2EtMek5hDRLjGYA5HKM8ge9vrxw1pYDqPJgw@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAMRc=MexMn_GSC2EtMek5hDRLjGYA5HKM8ge9vrxw1pYDqPJgw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=BvmQAIX5 c=1 sm=1 tr=0 ts=6915de0f cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=Pp6BL5jzwldociJZjw0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: AblMIt2LjUFxcZlLD_KtS7kyria7IBom
X-Proofpoint-GUID: AblMIt2LjUFxcZlLD_KtS7kyria7IBom
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDEwMyBTYWx0ZWRfX3YoXvIZxabsi
 W8qo2QhhVQcIVmzxClQ2Xch0u1iK6pU+FFcNK6ZlrEDnE4Vp4coLmag4jURytTNuuJh8dzn4yYx
 zK3yN+TEC+dnnWutww43jxUXYWZ4dhy67TTu636O/YWBQia/YiFkzgqv4pZEwtLvIYE/s5jke5x
 1pJXttrEbvwCTX0VczGUGeQdP1RLL37laE1SJUh/zFZzs5cTQI310r7bp2TYbw9DOTy0g2dYZvm
 KyMRyJsslAIlyz4SUHfWXhGkhB5xWfBH0qkSVZCHTcpBQMByT7+1fCcgDpgNJG7NBz233pRNXcH
 kDjTYKa1Ws737uygNbT3CmZQxCchMSLnfAtX+p8pTqRXxVvkNP+JN+lToTWVk8zL3ItVxw4FVKu
 9+UeEZIXUeRUN8SyfB0Ih81BwUppng==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_02,2025-11-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 clxscore=1015 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511130103

On 11/13/25 2:18 PM, Bartosz Golaszewski wrote:
> On Fri, Nov 7, 2025 at 11:49 AM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 11/7/25 11:29 AM, Bartosz Golaszewski wrote:
>>> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>>
>>> In order to drop the dependency on CONFIG_OF, convert all device property
>>> getters from OF-specific to generic device properties and stop pulling
>>> in any linux/of.h symbols.
>>>
>>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>> ---
>>
>> [...]
>>
>>> -     if (of_property_read_bool(np, "snps,tso"))
>>> +     if (device_property_present(dev, "snps,tso"))
>>
>> This is a change in behavior - "snps,tso = <0>" would have previously
>> returned false, it now returns true
>>
> 
> This property is a boolean flag, it cannot have a value.

Every DT property may have a value, so this is not as obvious as we'd
like it to be (IIUC - unless that changed recently)

Konrad

