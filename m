Return-Path: <linux-renesas-soc+bounces-24321-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E6CC3FAA1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 07 Nov 2025 12:11:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4A0D24F27DC
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Nov 2025 11:10:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 193853203BA;
	Fri,  7 Nov 2025 11:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kTVL2uNA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kesRY2/m"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 658E631D75E
	for <linux-renesas-soc@vger.kernel.org>; Fri,  7 Nov 2025 11:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762513816; cv=none; b=NHZw1o/3dBsPrfOx9RFS54I5bKYIW44lps6meI48tUhmJBVmaX13lQFsMkk6HO5cC16+xzkgiCuFYT76Vs0mBNObIqwtyrYw9qVcbn/6OXg2h1BtFPuvFZbp8fDL9CHozIHzciZfmIZM3OjdtQFTNEHORGLqhW0+q+PRVC9y6GI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762513816; c=relaxed/simple;
	bh=uvdSLrRqeSgJ29fmx5TFOH169Lf+Eo9jUOrniAkdVq4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EY6HT6yuF4kQfjepKoMz3nfbvy2P30ARA5ZjS4vbjn08KniMNh9VznKt5RHYOJeGEu0ST/LOZBVS9Sw22ZOjM33rSa0FFpV3/C7qztEmNHBj22SSTxB+NNzmjkALzczJ+S77Ofo7aFAAXQOGJAwYmExs1XJ52c0mNU4yG5dy3y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kTVL2uNA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kesRY2/m; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A78sRun1711846
	for <linux-renesas-soc@vger.kernel.org>; Fri, 7 Nov 2025 11:10:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vP5CsM5g0HeHOTSJ0OMxMqeLtmj8J5VZdu7ouInriPk=; b=kTVL2uNAU7+oNJ0t
	NR/5a4pLbFGYY5wf72iiXu3Aa4fetjFKQ9zdlH8oYDu1NewO8kjuYZOdjhXjdvUv
	bf9H5CrpXtD3FxEPcZGGEe/I7iM/0aRRpxXoXCHoPjp7StVXZ72j9UVDYvOKO9PK
	dM6P/R36KX94fYH/c+vCqaqes2PvZ/LrkNM01vU7XAbdqPBV6FVSt3SDB1O09pk8
	SELlf5XSIHWr6/eEojdjY43BaCIsGJtdJhRfz412+r7RW1eoyiS4nL6TQwJhxIf7
	B3ni+nzSCZoHdKpoDZxL3P9Eh96zOXP7YNsyWVkUNd24P1KuGRuBYPvKnw4TQFFq
	CgY3uQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a96ue1ky6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Fri, 07 Nov 2025 11:10:12 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4e8934ae68aso1780681cf.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 07 Nov 2025 03:10:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762513812; x=1763118612; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vP5CsM5g0HeHOTSJ0OMxMqeLtmj8J5VZdu7ouInriPk=;
        b=kesRY2/m6/Ql5d99ElFud0oWw0VkJ5waHJ+m95Yknp5polEBeCjAFhrRUUJpzLV55I
         4YyGYsI3GspN8ZWgBGHKG+pXFP6RUTDKgxXZl/D1ElccuIbKNdfJURsUEZVuloFXcxPO
         iabWhHZIVHsTh+IIKlq/ecRv4x2XrwPpKTuPYLZove3XZY6JRAFs74gar3Yv31gJH/Aj
         ufusMx9PGabtOiyP4YfT+sAJmn/fZaIT9yofNnte+loATYPysMwrsRYAYd4AeKwITkCl
         t2w3QAkoCw00nl/NCNzwMJWV+gw5fOVXZNCPgZ9FS03OIY71gnKwmffWgRsp7hHyQQWR
         iGdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762513812; x=1763118612;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vP5CsM5g0HeHOTSJ0OMxMqeLtmj8J5VZdu7ouInriPk=;
        b=qKUlOZwkyI9vSvMorQ9qBRA/DCbkWFsQWbH+BMsXlVCkMf7TSM9Ao4s+324/8hmQms
         WQVtdfT88MDRoFewzt9bn3CpIW7e61155N9bqpxz+9f722kwXAS6mB9tOjZW81rSPCmx
         tLYNTDA4SaanisS7xvx8UZfKiXk9Uv0jiTVoEexjTCQ0SMx3qe+u1RvfoyOfUELnyxeL
         MjLmgB+VBu/9XQYSrfXvcqS+k+ZFhQ8EZ9nBQ/KHM5uPCiFgkvPbYbCa9mC+Hyf4Q/p5
         ncrsWU51iLPL1G+jEpjLlYBKLy5B2McEWPGH9Gavc7QLm9rsLxGCz3BW2W7TuJz3xMfX
         U0bQ==
X-Forwarded-Encrypted: i=1; AJvYcCXMmEyLPMJ/U/8ibZW4EUaGnX+2k3TxZva4DDNqYWdjpoBRijNi3TilS1SuSQTcpZIPjSSL9P+2uNCwIqEmFqB43g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyE0igP3VrkVGJWXvMdZ1OBAIW+mPEO0fh7YckxC55vKkZrGmAd
	rHmnxzhHK5jH3IgLmfgECmJE/Qr1/Fgp/ybbTwd0U1yqVsDx9Rs29d5RHLmhTBcZWufCikie0SN
	bczULz5QWMxM3/IyMe417RPcfGOqEN1oO7qAUnPlE3fxwd3ehvThOlTuDczU+RrARx0Hn1Ms4kw
	==
X-Gm-Gg: ASbGncvGkBACX2RnCtqa8W2dT/H9OyDEgy/eSXJL/Ioijp5PmyZOtgv0QG2PtrR/VBH
	Ee1xsc1N78DGh8FS3QEDuYWcORUNe6uQKO4Uwazp5Aa87vys8EpWrU7kuNsulfKz2vEroVjdaLm
	KSzM7nVAKsb7uzo67eaejwnPFjFj4qnYWFFB0PsYcFqTb8+jQ0xlU68TCc3CTvs6N75Ll6EhYBp
	STITaQ/hZTsbW4Hcfmz3cFC7BNKuF7L/f1dHwTSm+9hkJ/bp+JfGcJt3F883ls+0f+OYGWtUrjR
	6pOW32ejPfpNqfMaAk3B1uGkLPASzSpE0bCvWSDqW0ow5ESn0Vyt0RPswahWigJprlc6gwPK4Qb
	5Jy1To0WyeBImDd9VeaZP7RodIYigwq9HVuFbzqLUYyqWOmA2izCrIHLA
X-Received: by 2002:ac8:108f:0:b0:4ed:94e7:97bc with SMTP id d75a77b69052e-4ed94e79806mr13951771cf.3.1762513811875;
        Fri, 07 Nov 2025 03:10:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG+oSsE67XF0MhznsqL3RMh0VmCG7Jg2iUSdY+a5r8YCwj9SfReJWThGgi5T1OFd6OFN1sfjw==
X-Received: by 2002:ac8:108f:0:b0:4ed:94e7:97bc with SMTP id d75a77b69052e-4ed94e79806mr13951281cf.3.1762513811430;
        Fri, 07 Nov 2025 03:10:11 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bf31286esm217650966b.21.2025.11.07.03.10.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Nov 2025 03:10:10 -0800 (PST)
Message-ID: <5fea976c-a047-43a4-a062-fee1d40447b4@oss.qualcomm.com>
Date: Fri, 7 Nov 2025 12:10:02 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 8/8] net: stmmac: qcom-ethqos: add support for sa8255p
To: Bartosz Golaszewski <brgl@bgdev.pl>,
        Bjorn Andersson <andersson@kernel.org>,
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
        Swathi K S <swathi.ks@samsung.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Drew Fustini
 <dfustini@tenstorrent.com>, linux-sunxi@lists.linux.dev,
        linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org,
        imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org, sophgo@lists.linux.dev,
        linux-riscv@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20251107-qcom-sa8255p-emac-v5-0-01d3e3aaf388@linaro.org>
 <20251107-qcom-sa8255p-emac-v5-8-01d3e3aaf388@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251107-qcom-sa8255p-emac-v5-8-01d3e3aaf388@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=fYKgCkQF c=1 sm=1 tr=0 ts=690dd394 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=hDgXwu4zDwT_Ch0b-w8A:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: K18YwDFNPrrRusu4dAc60TLL_es22Kkq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA3MDA5MCBTYWx0ZWRfX4/Ygyc9vn5Lv
 vFrkdYjNEdFYbPkSWV7jB2cP4KvPMxzqgSz0NvluP87RoC6JVqnwcmdREn4HQvs+J/Xvc+Zd3QZ
 REH6SXgiav5bHewfZ1rq1SDD4ic/vNmlrBs90pqcPql4wP6zwSvrEPn/qwr3OhqphOb25Kgt71Q
 VRPCisTxFwVYBG3A9fYgEQuTL4/QXT4gdbMyRN6rANfM1UHsrFNe3eBWPqvP02pfh+zfv/WppyY
 s0lErLucMbjwjuo/sdFyzOaq5H8DNF3euxKaNQJS9JVlr4+vG+lWu55qII45Lmcm5tkiovKlIhY
 kfmZJ2u+olcZ20FQRpWaY5BqsD56dsiUx7eNEpN1Kw9DYwVSO6j8XUbTklkCkusWyNF892heR8Y
 8X77eqD9tDOb0Gje9KDrZnLMZHol4Q==
X-Proofpoint-GUID: K18YwDFNPrrRusu4dAc60TLL_es22Kkq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-07_02,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511070090

On 11/7/25 11:29 AM, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Extend the driver to support a new model - sa8255p. Unlike the
> previously supported variants, this one's power management is done in
> the firmware using SCMI. This is modeled in linux using power domains so
> add support for them.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

[...]
> +static void qcom_ethqos_pd_serdes_powerdown(struct net_device *ndev, void *priv)
> +{
> +	struct qcom_ethqos *ethqos = priv;
> +
> +	/* TODO set level */
> +	qcom_ethqos_domain_off(ethqos, ETHQOS_PD_SERDES);

dev_pm_opp_set_level(dev, 0);?

perhaps with _index?

Konrad

