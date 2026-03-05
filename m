Return-Path: <linux-renesas-soc+bounces-28859-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yGoxGWVOqWk14AAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28859-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 05 Mar 2026 10:35:33 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0777E20E8EB
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 05 Mar 2026 10:35:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1547B3067B96
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Mar 2026 09:34:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF9DE3793CC;
	Thu,  5 Mar 2026 09:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SzbctnVq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ATZKfuuf"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD1837AA6C
	for <linux-renesas-soc@vger.kernel.org>; Thu,  5 Mar 2026 09:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772703223; cv=none; b=JFSp3wOkVeaQ9dXI1R9bf4QoF8wogV7EASRh1bCCslHXG72ys477NUrgViIVShqPMQhDVkJqM03ZQfSfTD62h2WzegqfM4jA6opBS/JVX2g8raJbMKca915xbHeqY1CDUQ6Hun3fEYhKb6rUZXdZ6oU6itK/KjPswnYVcKxvsRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772703223; c=relaxed/simple;
	bh=HOFCRWjfrMQ86SS6aNSy6MkJAPJRhPPCTc1Ev4hVuSI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bMa3fnjiWIfEYgZXZOxynrXcK83wz76u2IRK5aQ6pBVkDjt7hdPtdujFyx7UsqUnry7EtSXeihey1hl+yKQ3ZkXgyuHt6eguchw7ILCXVxiYR1ZWwu2revSHVd0SCCYX49Tcy9GOkJbjAcibMkNX7rUWzIM1ichOt2Z4j3GcZCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SzbctnVq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ATZKfuuf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6259FpgB3160422
	for <linux-renesas-soc@vger.kernel.org>; Thu, 5 Mar 2026 09:33:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SDHdZ6o2rq8MSXktK3BRPGVCbkpy9MyaMTwLEiYLbeQ=; b=SzbctnVqNSZ+NFa5
	KZNgrd87lqL1C4EWwyQX3KRCSqm4AR1CtRNPJmQQtSDMvdXfmaYnmP1uJ9mcoU39
	x5oHt1CxUbWXIScr5LqJGXtUzjCR3EYOjo2JeJIVt2bcNqLBumFoF2xCHxj8HJ8p
	3uVKCn8YTKDR50zX3M+04OETB2mKG0qWZNedQEdQDbDZb0bLJzOCAmlar5/bjaut
	YMjVGHQb1+qtI0EAX15PuyQtZJgJfRzxhNIuefwEoIPI+6NkaOq+T0x/MsEecMhn
	ShB8NHHzJIhEeKGVmnCBE1EO3Fsny1DEDi9Ymkt7u8i8x3T9dawWdfRZXVHjFv7c
	+rn9/A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpjh5v2u0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Thu, 05 Mar 2026 09:33:40 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb456d53a5so613599385a.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 05 Mar 2026 01:33:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772703220; x=1773308020; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SDHdZ6o2rq8MSXktK3BRPGVCbkpy9MyaMTwLEiYLbeQ=;
        b=ATZKfuufR3uvkuhUERGJHSMRgrIUAJjOmwORCZ4HmuImcI9xBZcPVAWNrKsKOHBh2I
         N2Eay+ZjEaXlKu6EGzTD3aDcQhFYei4NjhtRiZmBQ38Ue0Ls8bp/xIAUNcJd4ESz4/4C
         w8ok9VblRFiqfib/yTqRE3Zur5OyakLCryNGeAIb5OcADKxQbE1sK9ke+Ayjg5jX3v9w
         QFQ8UiT2QII/5hxCO2RMKj5goiNn8QV8CK96kkvs9abJN0zvpbQqKmS8o3brPOrIqcv6
         MoEcyepRiTknpHsSNePPmv4I+dE32vzNxWATQrHXobq1VG7SdRDuA4HYmzz6iLLXD7+k
         KVmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772703220; x=1773308020;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SDHdZ6o2rq8MSXktK3BRPGVCbkpy9MyaMTwLEiYLbeQ=;
        b=wHRyyeJn4LEsE1qRLLCugyO2k9SF6IUOspOvpMVXahADoc2PsQCjLFiZtWOE2+gLIx
         3g5bFqEBkspowhdUu7u7j7g3CQQJa7LTK1eNuMmqZwM6K6Os5XriHiIR7XOZz1HMBuaB
         JjFwYVy+rm1mQNQw+/PXBdksUZM/NVAjz/VA4REwIoDn5fDSMRxUumcydIm9arMRyuq9
         6dVje6ijtaz9vkMdv3n2idltCk30exT23xMelFuecjDttonYq43nx3KJ6yQ9cx0KocMu
         IOvhLOlB/0K3tfLEepuYOXcNKwMYtiQWhjwnZkW8KOzhRLyIPs7AbosuhfaeOR9XH/hr
         lKmg==
X-Forwarded-Encrypted: i=1; AJvYcCUnbF8adWt7ikf9qmvoVUAoTsC4CzmIsKNB0qWh4F6MGh5C63uVCmY/dIitASLwbl/qoV8tLRPgk03MbfrXkAC+jA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzBEH/EEFg6OrUPb1munuX4+1REf9xbkGKMtvKNhhzKifwM4Xkt
	hqmSoFGvibA1FJv8yTbYpjkFRc4lMUEthYqC8vnr/cwACjxTiYJbQOdiFHkEoMtSsdUC2dfZNMX
	YVGg1c30WmSfXGcJbPRc0Ib0yEKWc94Kc0y8Zic5qakZv0lcfEMi/KhJfgr0ZEDfCTmemOG/yuA
	==
X-Gm-Gg: ATEYQzzo/N+bjCb4druIECz8EP3DcrKbaB0fxG0iJ4uuwxjQE8nyM6G/Hqb0GpKGDNg
	eM/qD+TeoW2G9AdOdAokwREe4ie6gdDoRqvEda4/OzFAfgN8HGY26sMqTfwrLsyv4XVhKNLl1Mr
	tB/MuDf//nNN/DHT4BUUg5heOHpeecu+Qdcxp2vQBuCuYcCTjuo9oVqE4I3Eh8R//9QrQ5fynx1
	siATBllukNWa2QyvdhIz5yPD43gQUTmoJKmt+iYywhLwdmS0r4BTwc77yNgjVdwvXuxpEYfHajN
	+wNynEPs+mkanPgnNOm/5lc62joVs4ruUkMjuxYRG/XsBg4pKVaiHhkW69wLxTtFbPYZG1XYrCE
	Kb7ZCrY4gSzKt32Z3nJ8qvpd2xcoGB/MRMRSfjKwq/9N+ZzRU1ot9LcEVcLZAIS2yMBMb+DA9FJ
	y1MFU=
X-Received: by 2002:a05:620a:c55:b0:8c9:fefa:89d5 with SMTP id af79cd13be357-8cd5afde9cemr462862285a.10.1772703220096;
        Thu, 05 Mar 2026 01:33:40 -0800 (PST)
X-Received: by 2002:a05:620a:c55:b0:8c9:fefa:89d5 with SMTP id af79cd13be357-8cd5afde9cemr462859985a.10.1772703219701;
        Thu, 05 Mar 2026 01:33:39 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935ae65662sm884380166b.41.2026.03.05.01.33.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 01:33:38 -0800 (PST)
Message-ID: <ee2980af-e37c-4b4d-86c2-32467d2af454@oss.qualcomm.com>
Date: Thu, 5 Mar 2026 10:33:35 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] arm64: dts: Drop CPU masks from GICv3 PPI interrupts
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <cover.1772643434.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: RexyE0p5qg2_5c8VkDUrSxcgfJcgW2Q2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDA3NiBTYWx0ZWRfX0g0+UV4GNw7l
 JqBH4onBsoy1y03wdFoHVb8KjlHK7a6v/n60DNxOugSlhQ2x6OiOk5+Y7JbDEgr6kCN8k48HeuF
 Ag3tBqQVXgFjyYXcSbG+XdqH/l/ap3U9Q6ryVR/0ThoPxvbbzJ2JXQlMBCbedxmSznDebnHKVvc
 87rZBtMTIXWpITVo1eWSE4ObdBLPN3rLW3j7AXPINLXjDSq4lkbRanIngz5wnfSy40314oD043M
 Tge0Jh/W0vvp+4xWXFATU08RJEBzF1XrVFiXyikFdnX54GO0X/EBjl/MfsTSJBIw87cHnxqiz3Z
 TXqCW41FeH4tZDTdBGgDA+xpC/GmiBzi0MN72CafZyDXmLMSaI8fdrSKjfi79oov3BZt8ZE48qD
 f1FyfNsd0bajuPp4cTPwHIHPmBke8MLn9H/PR0JM7ZNu4N/vB32Vwcd3pVVB7HRT5QEiX2E+i9Y
 U7fxVSwbbgVepxKtTMw==
X-Authority-Analysis: v=2.4 cv=JK82csKb c=1 sm=1 tr=0 ts=69a94df4 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=QiSWx1vRvZ7C5zKyDnUA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: RexyE0p5qg2_5c8VkDUrSxcgfJcgW2Q2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_02,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050076
X-Rspamd-Queue-Id: 0777E20E8EB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-28859-lists,linux-renesas-soc=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[glider.be,arm.com,linaro.org,baylibre.com,googlemail.com,samsung.com,nxp.com,pengutronix.de,gmail.com,kernel.org,nvidia.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
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

On 3/4/26 6:10 PM, Geert Uytterhoeven wrote:
> 	Hi all,
> 
> Unlike older GIC variants, the GICv3 DT bindings do not support
> specifying a CPU mask in PPI interrupt specifiers.  Hence this patch
> series drop all such masks where they are still present.

I'm having trouble finding where that's used on pre-v3 even.. does
that actually get processed on the older iterations?

Konrad

