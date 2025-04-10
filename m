Return-Path: <linux-renesas-soc+bounces-15790-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66996A84992
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Apr 2025 18:27:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AB1744A139A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Apr 2025 16:25:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 541F11EE7B9;
	Thu, 10 Apr 2025 16:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DRKNXxAb"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC90D1E9B1C
	for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Apr 2025 16:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744302330; cv=none; b=DQTYdutrAd+miHKFGzuwy+ZE1N91R24UzLB2tdrObJ6weIKrFYftlCqOLUCXJit19xzd9duUKE7ME6WZnF6qGCA2jPq4suzXRWYRuzGveSyOn5Yk8brH7GccE4673uNkh4ux3aDwmth0dC3mopGFxlQuS4hTkj1RvvSTQ/8/JQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744302330; c=relaxed/simple;
	bh=vIUbdxOYqvSTKo9IQatuZE5t3HopXP85AqmNwZ7+JzA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TxA05jjf6FvEHRuQLLseHawaMNwmP/WtRSJ7iK8amjuI3/QaySHGuW2Un4MfabH82kkvP/3RnkbusTzmEz7ALsFTT5nPNsDUu2461t88QVEszd9zseAHqwGt0VCAkzxFoQGCZyuXFntkDmwO6R9uvapOCyEaQXU+vbFLhuqwHOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DRKNXxAb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53AFe6ge018659
	for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Apr 2025 16:25:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zR4+XiWiYcCAIsEskE+Pa3uKadOj7H5b8EyZw08afF4=; b=DRKNXxAb/WCjQgrY
	hz9jTbcUmyc+6kpdmMafLPwR+le4Cq1jMeyTjCxsCejceOyQfmi7oALTlTQNZWmt
	HZ6ObdJEu2UlNJkxKLh981hjfDcheQK0YO0wpLYTB3oAE0bD7z6wPJkf39uMqmv3
	CuXvn7AHdYvhyvsQsOt9vExk3T9+laF7gO/oW+l2c7/SeICL+lhWMeaeZjtfRw2b
	SiKNTFqzXURqsJ0+m/R/jLELMHOJ18HrzMql88kcjtfnQ+hgcZkTDD8CVSedDpi7
	E+HHxl/0WDpxjk88guiiXC047QSHSRPQvoSO7HNYuo0vrP/LcMl7CKsMAUYEQ12n
	hZULkA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twdgqpbq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Apr 2025 16:25:20 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c545ac340aso23596685a.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Apr 2025 09:25:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744302319; x=1744907119;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zR4+XiWiYcCAIsEskE+Pa3uKadOj7H5b8EyZw08afF4=;
        b=UQjxlpNVc9TcK03i4He+Z+mruUwI5P1JVebI5DRUwJ0gVrqtV8s5RrvV8McNtkKSDl
         2oHCD2c3EIBYxVh2jH6DDU0UVpDvMzp7ubwsaE1Nfqysdrypq0pk973jo/U3KnXkxu0w
         6SArARkYxvwIQlbCNZu1X6aO8Bvch4y/h0Ihw7uZkv0p5KLFANz5XPgxH3DPcD6wJKHU
         KEgkZnQfwmO1mALxcSFkVUE75B952qNUhkpvMyxOZiePaR1etQIFNoOZkL/7qTj3d6KX
         5smaJF3zi6I4zO7ZbF76VNLWHiFkndMwhn825takcYfBJSovkpIQQ0eS3KTPpfIQ09tI
         qpNA==
X-Forwarded-Encrypted: i=1; AJvYcCVWxWupmztwArkgX+lgiHzss121W4Dlrm1N/XHBF7eBrvB0klDyB+gewOWBtynce1bx8tl2PCAXJZNjnHEsvVQMNA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/iajoc3x3RQSX4n+qSmILIm6wkYEfjdE1jrfCz2cvZjeANnDQ
	0b06BAOb2Wr8doqj0TnZNrqs9A0SPuW81b24pENDXSnKt09iBFKiZ1rSb6y3sSRfxqyafSWznDl
	RS3V8wGB4ceJpj38i8FFfSx7LhxccB5tc96qhKZguo+Dwx5eoYYhsGcJEykIBxEdr76vxCw==
X-Gm-Gg: ASbGncuTGPNiHKbV8uWmutzuLSeyvMOucKsSHt3k1DpDi9441Pa8U0wmcDbU662gAWH
	AoJodWjJ4quAdj+zCmY9EihOolkm/0sIoWhbBfBu63lC2RmOepZX7RWYGuL8dKtUfaZMxT4Pgoh
	XaZEGJaTPHVjmIJCBnoa3cnPeMgBVE16qjpbPKdC5pT2KJ35bKdtdTU3xcSb2E+EVLabD/vQTVu
	QMFgmDfHO/HclbABKc/W8bzqvUPnO5tyMRJkCk3zhvwH8PQxxRJRs6TkLtw/zMU/Toh0aAUfl0z
	d4XhHF3o0mUs9bpJs6jg5Bt7QCgSVBqsy1fWvUboFZ05ExZxAB3LVzlMpZvSFzFq6w==
X-Received: by 2002:a05:620a:f11:b0:7c5:8f37:1eb2 with SMTP id af79cd13be357-7c79cbed7e5mr390019385a.9.1744302319232;
        Thu, 10 Apr 2025 09:25:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFGh0TA+XXGeyGhF/XKIz0cXHA6zoUdAUUcHCD76IoGVEG3eLbl5iKlo88Yqsik48pUsXmHeg==
X-Received: by 2002:a05:620a:f11:b0:7c5:8f37:1eb2 with SMTP id af79cd13be357-7c79cbed7e5mr390015185a.9.1744302318810;
        Thu, 10 Apr 2025 09:25:18 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ce818bsm297826166b.182.2025.04.10.09.25.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 09:25:18 -0700 (PDT)
Message-ID: <898bebc3-e2b1-4819-9869-05b783509146@oss.qualcomm.com>
Date: Thu, 10 Apr 2025 18:25:11 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/19] arm: dts: qcom: sdx55/sdx65: Fix CPU
 power-domain-names
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
        "Rob Herring (Arm)"
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        "Rafael J. Wysocki"
 <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Stephen Boyd <sboyd@kernel.org>, zhouyanjie@wanyeetech.com,
        Conor Dooley <conor@kernel.org>,
        Nicolas Ferre
 <nicolas.ferre@microchip.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        Daniel Machon <daniel.machon@microchip.com>,
        UNGLinuxDriver@microchip.com, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Heiko Stuebner <heiko@sntech.de>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-mips@vger.kernel.org, imx@lists.linux.dev,
        linux-rockchip@lists.infradead.org, linux-amlogic@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
References: <20250403-dt-cpu-schema-v1-0-076be7171a85@kernel.org>
 <20250403-dt-cpu-schema-v1-9-076be7171a85@kernel.org>
 <03011a33-174b-4027-bdd2-043aa685380b@oss.qualcomm.com>
 <CAPDyKFoZ7NfN+pkCPnusvTOEaxbQhr=1FJqzdDGrLcKAzBpGyQ@mail.gmail.com>
 <66f8d957-f7a5-4aec-b8e7-5bcc7ff7f569@oss.qualcomm.com>
 <Z_dvAT7LdR7xbH45@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <Z_dvAT7LdR7xbH45@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=PJgP+eqC c=1 sm=1 tr=0 ts=67f7f0f0 cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=LizfDJ_PtI4Zq51CQE4A:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: fiR9YfN_KgZR4jBW_zP9YMWK0gjvnpYU
X-Proofpoint-GUID: fiR9YfN_KgZR4jBW_zP9YMWK0gjvnpYU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-10_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 malwarescore=0 spamscore=0
 impostorscore=0 suspectscore=0 mlxlogscore=973 bulkscore=0 mlxscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504100118

On 4/10/25 9:10 AM, Stephan Gerhold wrote:
> On Wed, Apr 09, 2025 at 08:35:29PM +0200, Konrad Dybcio wrote:
>> On 4/7/25 6:27 PM, Ulf Hansson wrote:
>>> On Fri, 4 Apr 2025 at 22:41, Konrad Dybcio
>>> <konrad.dybcio@oss.qualcomm.com> wrote:
>>>>
>>>> On 4/4/25 4:59 AM, Rob Herring (Arm) wrote:
>>>>> "rpmhpd" is not documented nor used anywhere. As the enable-method is
>>>>> "psci" use "psci" for the power-domain name.
>>>>>
>>>>> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
>>>>> ---
>>>>
>>>> "psci" is what we want here, but these platforms require some more
>>>> massaging..
>>>
>>> So this isn't for CPU performance scaling?
>>
>> Nope!
>>
> 
> Huh, this is definitely "perf" (= cpufreq) and not "psci" (= cpuidle).
> If you run blame on this line you get to:
> 
> commit 0ec7bde7b590f8efa5823df3b52b32dd373060ff
> Author: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Date:   Thu Apr 8 22:34:45 2021 +0530
> 
>     ARM: dts: qcom: sdx55: Add CPUFreq support
> 
>     Add CPUFreq support to SDX55 platform using the cpufreq-dt driver.
>     There is no dedicated hardware block available on this platform to
>     carry on the CPUFreq duties. Hence, it is accomplished using the CPU
>     clock and regulators tied together by the operating points table.
> 
> https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=0ec7bde7b590f8efa5823df3b52b32dd373060ff
> 
> The OPP table looks like it's supposed to set SDX55_CX performance
> states according to the chosen CPU frequency. MSM8909 has a similar
> setup where the CPU is supplied directly by VDDCX and we describe that
> with "perf" too [1].

Ohh right I was under the impression that qcom,cpufreq-hw is used on
those too, but apparently not..

Konrad

