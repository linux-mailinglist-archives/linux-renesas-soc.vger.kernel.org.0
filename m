Return-Path: <linux-renesas-soc+bounces-28863-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4CvkI9RWqWkh5wAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28863-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 05 Mar 2026 11:11:32 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9500F20F77E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 05 Mar 2026 11:11:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E84E7305FF03
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Mar 2026 10:02:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFF6637C105;
	Thu,  5 Mar 2026 10:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kN+AXckW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QKzPHGHT"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B8D037C0E1
	for <linux-renesas-soc@vger.kernel.org>; Thu,  5 Mar 2026 10:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772704936; cv=none; b=LWS839PeM5TaDT66M9R3gYDArV7O9bSzIjPDcwixtv1mgew7t8vSawLh9XZvdJ6YeSc1RH4DisGbO48YrXC3AuU8RU88l0ttre0QpcfR41xroFQxOPSBl5PzqNRlMd+vlNHD9ZS4WdeVSMxCn6xu2ZfH6T82VCAirVLSValp+Tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772704936; c=relaxed/simple;
	bh=sdqAqjrVvRH62b9KukgizTgaTiOnXZlSQR1sQ+H8r9A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Lcv3IeqEd1qSCFQEdDaZ6sv42ukcoPCzxUAsaP21OXDyjQ/6J+2JRhk7WQBkeQmDvW03czA9k08PfSLCraD28+MYazf0F9jsQQNPx832JZoJrCD/zKdp6Wr3jHaOAf1m8rIUck/kE5IM+rutYc+1DKBBtjFotHLiPKIpvD8LPx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kN+AXckW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QKzPHGHT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62597T5A3160348
	for <linux-renesas-soc@vger.kernel.org>; Thu, 5 Mar 2026 10:02:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U/N+fxc7FCXKFi9LiVqjU80w7/4CSzI0iBcib2Hltxk=; b=kN+AXckWrGaNHZZm
	jf4xSJd0s78PHX0x5FJWfoVPPXDSDLvHXVtpa+lgGAbrzrK2xS6zVQ8NakKmGYAE
	0Zrfiog2BU1++B7ORhtLrcHsBEwM7UYh4w7hsovbto/u0NFLFW5u93VR1M1Ryyhu
	+WtN6Bd5Dh+MC6fZk97UHDvrhnrAfFmWFS5e43T0BhqqTmPzgVXdfQk+FWZ0Ddjo
	W2LjCX8ckVom4jsE8Gpt/s0IKTv1RVKN1j90DT8bmHL3VDLetzptu6FCsjg4J3JD
	Qcv0QjKMIM88rHxsDoFHi1hX48xX3mdtVErfjjS+AzLxCnX4Iq2Yco8qfWXdlH8r
	+RrkVA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpjh5v64h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Thu, 05 Mar 2026 10:02:12 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c70cb31bcdso580009685a.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 05 Mar 2026 02:02:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772704932; x=1773309732; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U/N+fxc7FCXKFi9LiVqjU80w7/4CSzI0iBcib2Hltxk=;
        b=QKzPHGHTHqP0uYNy51Sul+RMdpQF/ADpeiRSPH11dqwgvtx2IZvi/gCg8C0WNxgBkk
         ivJxp1fHA++DIAh5jbeWLVaIFLV6RaxmaoA9g94wUrx2Vqivu5uSlNxJP0wld9epaSkj
         v6amDlHhQGxrRo5qQwBNFUVdW4cmDG66N3mYl0suDyoFwIshiGHputf6Mg+q5TlVBqOt
         a3xwYBg6E7bWMw5mXQ8rHnUMNlZtmjdBLeTMc2gylqP9BZgly1Kqkrm+M2UYjjvZ7kjd
         va4i7cGSD3nQq9MN2Q60dfGCYn7omFYwKAhFqipU591jdKImQErxzqBkpXU48uSuJRvN
         bVQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772704932; x=1773309732;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U/N+fxc7FCXKFi9LiVqjU80w7/4CSzI0iBcib2Hltxk=;
        b=sMGF56VGT07c4A12hQImzU8Cmn1gu2hKw+AIxSDJVnXZw/GfY/FMYyt5w91Ge4BrIJ
         U/Ht7l18E4IUjkZI/52fyVexG6k6mE+aSGpLc2zeSiXaMkxh3F6UyqGUAssAQvWFmpA2
         sEUkjZZqlsOQyfnklYI1XvQXF0mS83Mbf23ycoYgdp+ZbFtdL24zNeQDW6fv5C/73Jqr
         482VzwUV7rVxfhrVtwXRXEHCeYyuqaE9VEslZzRjb50gWU/yFijy+hNXY51WBa7bKrYP
         YY0XUC9H/ntaggyhkCV7o+jZjvEbrSnQTIgRFVI4yOSQjybHlZF0WnVe+Pyq4iiuD8gW
         wf4A==
X-Forwarded-Encrypted: i=1; AJvYcCX6AsApI9IdhUFqi9XGxct+AEPUYWIhqzCyFEhmMkYQ93q0DYarU12mRoCYjIpFEzHe0MzRMKIhE0Hj/VgUoULt4w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzXJ9k/wKwqcho0M7hCAVmGcgHrZDz8ZJBkUeEfR2PWrqKw4ev5
	yT3WKzFzNSp8ANTijvR8zLDXAwn1LW2dKKDzoS2Lcz1IDWsZg0wOGcVmWxoeN/64mrPR6N97Kwy
	FTRw/ua56T0OKyZ3oZUN5TaATYXVZmeXk4TaZVzQsfI6fFih1GTMDuql63vwshW2Fh17dAG2EfA
	==
X-Gm-Gg: ATEYQzzqGKMl2Rj6EWz3PlCj9ELbJQullPD6t55daNRu36Fwl/HLNjfQe9Cmi8TlPrW
	lOy6TjmL/jHHM03ry/NYHyzUTkgXlF0ku/teb8bSc3BG4MPAo9c6/p7BdBmxUijn8QO+h+wUFXo
	hYPaxVId8AI/kBcZnhNXFrJfaO7Pj7neEo1r8atkQeiDx54jpzYi4KfZpzRMRwnOeBamncAP1Sn
	mWI45MdECDFMHAiC+GLx4kuJOeFcdnnW/cd06Og5/rIXjfAYxC883Cw7bK5jSIIPoLXVHJJTfIx
	EO/n10rlDi6HgYkmDHD1k/u07bKOBhHK3pw7Ljrqn9Z/FTaomYlSw/vi5KiiRVYzych2RuvgWqX
	U2iueP8tsEl8csqJiF8PltePwF+cgnBNsFRCs3bn/vRCb9Z0Es/tMmuVHkutB2UTBsft+rPBe0b
	cU3gY=
X-Received: by 2002:a05:620a:4014:b0:8cb:4059:a90c with SMTP id af79cd13be357-8cd5afbef4dmr443240985a.8.1772704931626;
        Thu, 05 Mar 2026 02:02:11 -0800 (PST)
X-Received: by 2002:a05:620a:4014:b0:8cb:4059:a90c with SMTP id af79cd13be357-8cd5afbef4dmr443235485a.8.1772704931010;
        Thu, 05 Mar 2026 02:02:11 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935aee3ab4sm870864166b.61.2026.03.05.02.02.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 02:02:10 -0800 (PST)
Message-ID: <fd00e0bf-7b73-49fd-a2d7-1d4a88bed5e7@oss.qualcomm.com>
Date: Thu, 5 Mar 2026 11:02:08 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] arm64: dts: qcom: Drop CPU masks from GICv3 PPI
 interrupts
To: Geert Uytterhoeven <geert+renesas@glider.be>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Peter Griffin <peter.griffin@linaro.org>,
        =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
        Tudor Ambarus <tudor.ambarus@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Dinh Nguyen <dinguyen@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Thierry Reding <treding@nvidia.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1772643434.git.geert+renesas@glider.be>
 <226c5d1005a6e295e0581b2c89e5510dbb7aa9d1.1772643434.git.geert+renesas@glider.be>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <226c5d1005a6e295e0581b2c89e5510dbb7aa9d1.1772643434.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: MxKalekjUKYoNvQSrbIwP_GASWoS1hA9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDA4MCBTYWx0ZWRfX6J8ki3uv39XO
 264GX94fJTuLNIk23gJgIVamberQJ4cbJyxsO+aEBLwfkmM2ISTTic6p3HnVZsx4ai2PyCBlmWa
 klxBk+Nv/VpzU5Yq2jaVYpLthXvpcZbyhsb0OlqUxKg4osjb0ddVaswRY/EAn8kT043i2jQCbTa
 LCglmoPahl+jF6HYDzCzlCegsij45bbETpmFQuWVDWwtvyesuuqjjNHkbwF7SqVSYXvpX0xLKmx
 hxOYSCQkmsWo6rvhU551P00I73zrDue80V0yPkKZgTA4RscDMqk/HPDw3o2onJJTvLX3JP8pJs6
 6uD/2QVADG4qPoPyG3OOkYzoVX+kP6shTlinpxTYINFht4isteEU2r4RrwQGEjnlLrEwWwLpf2W
 G6oxFSkh0J6tzSH5iDB2LPORpfz9WgByGYfbPnbksXIjZC3+QdKLzyI3rdOYlSCB245eZt+e9SF
 ENcWrFB/LswVDwC0B9w==
X-Authority-Analysis: v=2.4 cv=JK82csKb c=1 sm=1 tr=0 ts=69a954a4 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=QiSWx1vRvZ7C5zKyDnUA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: MxKalekjUKYoNvQSrbIwP_GASWoS1hA9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_02,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050080
X-Rspamd-Queue-Id: 9500F20F77E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-28863-lists,linux-renesas-soc=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,glider.be:email];
	FREEMAIL_TO(0.00)[glider.be,arm.com,linaro.org,baylibre.com,googlemail.com,samsung.com,nxp.com,pengutronix.de,gmail.com,kernel.org,nvidia.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/4/26 6:11 PM, Geert Uytterhoeven wrote:
> Unlike older GIC variants, the GICv3 DT bindings do not support
> specifying a CPU mask in PPI interrupt specifiers.  Drop the masks.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

