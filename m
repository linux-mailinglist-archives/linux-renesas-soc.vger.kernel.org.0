Return-Path: <linux-renesas-soc+bounces-19658-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 73D4DB10845
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Jul 2025 12:57:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 33DE44E3760
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Jul 2025 10:57:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A84C26B093;
	Thu, 24 Jul 2025 10:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MCM9U+EI"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F0AB26A1C1
	for <linux-renesas-soc@vger.kernel.org>; Thu, 24 Jul 2025 10:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753354670; cv=none; b=PLDQOBjwjBCtJCh2Xkv6zF/2HEZvjzZMklKsJl8PJ5k3r8viSivwRXvzmXJPVtv89frqwf6J397QQ7ehzJ9pz64RUBz18oU9+t16KZqj0q3KWy4eg1Q4Gh6HZmUuITMjSwBPWZfJGmaX2dTXiPd1MIIUIEOY5aAxbKS1hS2+vQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753354670; c=relaxed/simple;
	bh=FHUm8JgjLCIAyUcbE9ObMrZ2uKu/jiL8r01fKXYzPAY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=km7WFrXDIWNkkAP4cK3OkBO5uYDVL6WxpKXks7ZL7FYQpqNJDKGk74G/xwJh9SVPqAYboQ3ijRaVNNWs089+8/+ucFDjNf4KTeY84QolH6N8wlnKF0naxnlFDgJS0AGuN6blxWvN9Z1d4ZN8n+zdwjrWZcbmFAsTGSATE8eYXG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MCM9U+EI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56O9pB2X022003
	for <linux-renesas-soc@vger.kernel.org>; Thu, 24 Jul 2025 10:57:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	frgttlq1wUpHfs85c6sOB8oFTBM5O4TFBHJ8W4S/2Zg=; b=MCM9U+EIRXdUhkkj
	RnaQHyphmlwj8ufux4uRqT1CeeRyh4WJeQyMhFCoM7HUZE8B54OyMur9MQ7pLAHK
	q7Q1KVrS7BFGTDMUnHwdUrmlCjNOXtf0Rp/Gdwturu54n0TsR+qJU3AtKnFv2WhV
	Ajeq9g9mm1HxhnKm5PMSdv09h5GF5GTeKQLa+UREcjMI+vHbBSZEp5ZsQOJYdrBc
	29cuk/jHFBZqdsYWQeB8ET0R6F2HpIBhXtEQ0eTVFTrqxXZJKuhGlQ4XUWQjybWw
	SQmEEyV1+dpeOxXC5puV3gSzpq8fRjewj3wouaPKzcYBH4zMbbbQ82M9zd+81FQV
	uLJMxQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48044dr7qq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Thu, 24 Jul 2025 10:57:46 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6fabbaa1937so2435366d6.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 24 Jul 2025 03:57:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753354666; x=1753959466;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=frgttlq1wUpHfs85c6sOB8oFTBM5O4TFBHJ8W4S/2Zg=;
        b=HmPVi8CzOfQpMfIGfahgwXuySPYOHA57Bpgi2Q+0tRBpCwvMRi53p7s9q0L7LeZOVN
         T+UXlw8YH0s96BNIhqDtfSmq99tamGFsMmyL+ymIPaEjCTD6RiYBRg4gCVetNwuoWvdl
         DW3V2xZ6TZ9F6/dWZjnRpebiw7gxj1jg3an3qgVVqgnM2SA5Q65Tp4vWYm+2GvXyaAkC
         v1DQXtnoGyoUsSOfoXhY+P5sSFl9jbj09/QdHVHQ53LRdAwPfV02SF0EYKSOCbCbS4wk
         eAW9OZd1ofCosoMVkRV+lhlpnU2qcp23rIOQnJjANqbBqRqFyke5T+zlhWAT3FDl4F/F
         4y3A==
X-Forwarded-Encrypted: i=1; AJvYcCXcOy1O/rJQWn7F/njihThtsOaum7RNbUXbxGf9dBYWxeDeK5JyuTJ0fbHW4Isj4tyPEvoTXtSov9xurgIUnoZjvQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxLEc4nfqDYtm9pjKLZbSdfNGwhpdVplOCGS1ePuF4uWksVw4Kq
	QQQ/dgpY68uSY7iY/0HaduFB/x114hYnBKjFwYVcoKq2ZcgPkmPEun8lS/crnSLKuA0iL364r+5
	ol7gRIWSYP8odtv3ha+xlqp3Xr+/5CJtXvAteKI1aSzDVse2FHmzmGZKFVxo+xkIuovtgNPnMvQ
	==
X-Gm-Gg: ASbGnctTZR42w66cN1BbhdM+QZABkA4rvVg4jEs5xt6u9IxU+cGu+/ChDDTfwxd8CAI
	BTFajQj6SW2+zTpaR2YHBP20/BD4Ii0fV3vQmUDlzwHDYEz0iDgqnKR9jEYF/j0Pt7hlgq9e5YJ
	GsgRQ1RaoIbOERwIMjLQCQFycHmRpy6Lu20TQmYwlhu6b/c9H7KL8hRFSkVDfrXveARt84G+H9k
	G4LQDBkN3MlWlkpEYUygjJpS4FJgJ5cFHtwGvXKaXcg6x0VDLAVlb6lydd2taejb9YDnh15BuK4
	V4amoYgxJmhc/o2c2rjjM8oqb1qJaqWj0FwAgcEQsd+xMW0BJoeNgUIELFrvMET3QyTLF+Jgm8b
	gXGXZh5B5oO/DjuLZiw==
X-Received: by 2002:a05:6214:1d2f:b0:702:d3c5:2bf1 with SMTP id 6a1803df08f44-70700537849mr43874796d6.3.1753354666060;
        Thu, 24 Jul 2025 03:57:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGOPUGD8doV9+jglxqU2GB0DYEWEF7aTYg/TWGqOaOfQBWULvPms9oF3r1fFWzU0hBkNoKlEg==
X-Received: by 2002:a05:6214:1d2f:b0:702:d3c5:2bf1 with SMTP id 6a1803df08f44-70700537849mr43874396d6.3.1753354665532;
        Thu, 24 Jul 2025 03:57:45 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af47cc6e753sm95191866b.50.2025.07.24.03.57.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Jul 2025 03:57:44 -0700 (PDT)
Message-ID: <bbb07270-cf7d-4fc6-9a74-334fcaf00f05@oss.qualcomm.com>
Date: Thu, 24 Jul 2025 12:57:39 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/15] pinctrl: qcom: use generic pin function helpers
To: Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        Lorenzo Bianconi <lorenzo@kernel.org>,
        Sean Wang <sean.wang@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Paul Cercueil <paul@crapouillou.net>, Kees Cook <kees@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Andrew Morton
 <akpm@linux-foundation.org>,
        David Hildenbrand <david@redhat.com>,
        Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka
 <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
        Jacky Bai <ping.bai@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP S32 Linux Team <s32@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Tony Lindgren <tony@atomide.com>,
        Haojian Zhuang
 <haojian.zhuang@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-hardening@vger.kernel.org, linux-mm@kvack.org,
        imx@lists.linux.dev, linux-omap@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250724-pinctrl-gpio-pinfuncs-v3-0-af4db9302de4@linaro.org>
 <20250724-pinctrl-gpio-pinfuncs-v3-11-af4db9302de4@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250724-pinctrl-gpio-pinfuncs-v3-11-af4db9302de4@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=BJ6zrEQG c=1 sm=1 tr=0 ts=688211ab cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=jpok1_DMC_Ne8w05vhoA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: fP1hP6aZK_kmA5SeXj-3B_asroNrmIJT
X-Proofpoint-ORIG-GUID: fP1hP6aZK_kmA5SeXj-3B_asroNrmIJT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI0MDA4MSBTYWx0ZWRfX2O1RJ+Ysb7nR
 Gymkjr9iQzrXL8Cgj6gnaiHqrkt+wVoLYI9BC1rpm02YahgxkGi1FwwE+pEN0B2XdtBCaY39vFK
 1gZ6BGGsKzifJYeYnzHrMk5IIkjI08lnWWK0ux7103bMdzBDhBI8XERCm+N+B16PNBPqkeUB03n
 G3zG1NTWmSXMMXKxL807h0dTJIJvlx5FbiWVWslg0d7wtgjjWlhVvqHgUE27TP05hXP10qb0EY0
 yY2NtPSYeaSDuZA+DpXf8fVp+4F0jX2PDaVLisVCXBdjqp7c2iv/3Bt9PzI8Qp9BvKx0YCaxmQU
 gMjQm5HCSDGRf3VHNMt3F1mHPD5dDokcuwVZT8CwQl3TKe42nqB5JhqNcc7vRnyHCp/JvRZgMRm
 ueHPPzV+ZZnsVG4fV3C92kH2xx1RCHKpSDc1ylsNNlLqKktp4iTF76sJWoWfZtgE6i57zcWU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-24_01,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1011 spamscore=0
 mlxlogscore=465 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0
 mlxscore=0 malwarescore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507240081

On 7/24/25 11:24 AM, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> With the pinmux core no longer duplicating memory used to store the
> struct pinfunction objects in .rodata, we can now use the existing
> infrastructure for storing and looking up pin functions in qualcomm
> drivers. Remove hand-crafted callbacks.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

