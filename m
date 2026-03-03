Return-Path: <linux-renesas-soc+bounces-28691-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GFptB5mzpmk7TAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28691-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Mar 2026 11:10:33 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F02A1EC6DF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Mar 2026 11:10:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B58CC3033D02
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Mar 2026 10:07:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 189F13921D6;
	Tue,  3 Mar 2026 10:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DFMZi/qu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TtEb7TWO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF2A5391830
	for <linux-renesas-soc@vger.kernel.org>; Tue,  3 Mar 2026 10:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772532462; cv=none; b=MQaN1vYH34YjeCX648gv1T4y2nTzjTaKgLeRA7v3qKye6ng1jzqnAJaK9WZ8u7gCWJwCEa2OyBi6phw8bdn+0rXcjPq8Z9IX1Ttm+0qS7Jz+VzmaSRofMTps7lgRnl5H5XilsxvpiYtzO6Xovf+2QBuZHM96K/zUPxee43mgITM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772532462; c=relaxed/simple;
	bh=2QgGw+VLl538AxK4NH+SulIRIdtltjIFPi+D9n3D+pM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AllVnxP2R7uLV5y7LWjSkOq9sZFX9cnvNU4a+WJd26uL7lBJfL/RQqzzkSa1DQVi3h4aQAm8L13G1UZRQkdGvd4RK+aZ6ba7m5hhcT1BGkYbcM7g1eRvIsip2jE+HJf58c9QKdNWhnSwu7NY9cvyIIE/AU0xj5mN+uKzcrG7RQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DFMZi/qu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TtEb7TWO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6239mlSD2614192
	for <linux-renesas-soc@vger.kernel.org>; Tue, 3 Mar 2026 10:07:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CZGGj/Cq43q5ATiRBFYGEftySIRuSNWf8OfummFnl00=; b=DFMZi/quVv2iY5j2
	CsQ1gxfK8ODtli7gAgMSA6d7fHusooOICd3XkfdE0GtLRyF3OzKlW9eSozKfBUO4
	Yh6zLGtVWSYIhO27m3IOOeK0Q3j9rGJx8vwqjza74j7a7BApu14unY/QNnV6LmuA
	amX/d5quVf88qxQOLWVNSjBW29N/elpkcX/Sx2/oLfBL1a4b9sbnY/jR+43Py5hC
	ME/fM6NKtkHAg+xg4xi4njiacE3M3eFb+HMIt/Gov16PWzbTtrRFmHX91m/y63so
	QQIVgrnbpEH6Q+NIwG7ry1LcVJGkq7GefsI65xVswW/Go53CKWA9KUEViI3Cqe+N
	s3lX/g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnvxf85r2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Tue, 03 Mar 2026 10:07:39 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb485c686cso435772285a.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 03 Mar 2026 02:07:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772532459; x=1773137259; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CZGGj/Cq43q5ATiRBFYGEftySIRuSNWf8OfummFnl00=;
        b=TtEb7TWO7qdTjx6M4oUW22UQ8LAU3YaRpdggOsOfcKa2KCfyTpwlhakL3gOLCCBUHd
         HigtBtrEKpKlVbgjS7LlRI9KAe2cjzksdSqqhjPj2C9HE5zsu4focYt2EDfPThTmDXsQ
         wMz0xr59+HHrHRaWF6g6+An4FVa6qF0yeowqQH0TI5V8r7Itr+uf4hP4LH5XqjO/KzvQ
         YjAc+gNj2se0J4WqaSqEEDHwLXrHu8xRNTIPjYHRDUJo7Xm3f1UKdjn3mWiP9RJxbv3S
         LNIG27KUbmdc6v2OfzCxBgaJ6izKgU34LYndww9AsN4sVdTg3UzQMDOLddyG979LbhDz
         b6aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772532459; x=1773137259;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CZGGj/Cq43q5ATiRBFYGEftySIRuSNWf8OfummFnl00=;
        b=wAobJVp2d6dxoW4afXysCqIYPnzWGzb7zm+I3KNsFegeQxLJ1jHfDUg2dPeBM+DNyi
         nXToHMvcmpM2FZbTq+paU5mnn7HFIJGBmPkir7IGselgexxnLntj9QYKzPbkFXYGWGRp
         yBtiOqZUbUXQJ+hrDPoKlQUYaYKZqg+sr/BMgWHyPMy49bsnOvmH2fpTHxtXKAWmK6ho
         7v8B8yjhyEKbUA8tvr9OJgyWA/ybG9lWsd0TrG2ZYghV+dWpZh2LfpjAzhVsd0yd7woq
         dtK+fuHSEDLbCxx1AmogkZOqRXuhl5IsTmcyZ4GfDAn2kuIyjNPCiLQ5dtLOfYxuTxOT
         JbLg==
X-Forwarded-Encrypted: i=1; AJvYcCUQtYv3CcwHjdYt2ZjXzV2KVPWIoo0t/XGfLFUz6gw/4aUQfGhwBTFwJjBlIQAqD6r+xNDEozMm/rMD4iYgXZW0rw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzK+iksv7QgpfjPTYQq7O2sM5LamkEYuo4N8dm+SGrDPNNcrxAV
	JRZBpb56wRisXkgL1qQxTQkqx4vfoPXvxAhlMXUfOlPIYhSc9VntB101xkkS6TUSgnsdd6Lf8n/
	LT9rOEaOEbmw9kleGkRxfp0oWvsQnKQWo4vmc4bc7J3jH3H2g5lnfd2wzVxQcPxATspINv5aVVw
	==
X-Gm-Gg: ATEYQzyzKcZYnlWMauO1SCxrlWPACVpJFVscTXmmWU7xT+PWxPSZLtJIZDpfw7kEivH
	Dymxy4FO78Jqhkj4dW/AmSkKcdFI246iy0dC4LkniY6FKo96UT2hNBGcr/rfpZ/9lzPIFemFVDW
	eCP21ZAp7NsxhoxDDQx+UJdNdImND8IdS07IRraptEaRwxqiEjxDG6p398L9/LhhTZpF/Zplzpg
	Lw5GB39dvyRGqUmKtW/e9wkp0C+8EkMnTCeiphWF1SgpY9Ng8h+hTI5Ne5W0y7gF94RyQUNoU+V
	PGFLy4FeIWDc7biau2gBdrq9PgGiMWYWIQMXsK1kVPWSMw2UN4ZrkJJgUPRHtugJ4DX/FAznVL3
	/oLXXQg+drtJ0dIJNRM081CrKrCxBEKcfG1PpievaOQYzuG2Gi/JVJtcAlkW2bDr5H58Oo8QhYN
	oMYy0=
X-Received: by 2002:a05:620a:7007:b0:8cb:3fa7:c4f0 with SMTP id af79cd13be357-8cbc8ee5ac8mr1679032385a.5.1772532459063;
        Tue, 03 Mar 2026 02:07:39 -0800 (PST)
X-Received: by 2002:a05:620a:7007:b0:8cb:3fa7:c4f0 with SMTP id af79cd13be357-8cbc8ee5ac8mr1679030485a.5.1772532458530;
        Tue, 03 Mar 2026 02:07:38 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9383397fcasm444054166b.60.2026.03.03.02.07.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 02:07:37 -0800 (PST)
Message-ID: <aef4305e-3965-4f55-8eb5-3bbabd63bd18@oss.qualcomm.com>
Date: Tue, 3 Mar 2026 11:07:35 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] soc: qcom: pd-mapper: Convert to
 of_machine_get_match()
To: Geert Uytterhoeven <geert+renesas@glider.be>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>, Ilia Lin <ilia.lin@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1772468323.git.geert+renesas@glider.be>
 <0d23a449e62ac85f04ff07bc2758efbaa709c9d1.1772468323.git.geert+renesas@glider.be>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <0d23a449e62ac85f04ff07bc2758efbaa709c9d1.1772468323.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDA3NiBTYWx0ZWRfXx6xCa81ZqtF4
 ZIKsKB4NN7rUMIPdzd5tU5DedheF9c1hAMzeKVHK7+9F4VH8KXQZeNtp0tfsPU+aNxgS64Z9t55
 4CDrdopJAZb7/bEr7k1SkRJc460OKHRdgAfCnxVJZ7Bek7wNlCTv2qUo5fyAYzAfGJNZuBeeeTW
 VV4JozaXUIRmMtwpSaPRJqdt0ekChGJWe2qi5T2y0muabvMIMnomAXx0XmAdqJRgjm6fpeP5fI5
 wC8oLY59Vx3VDh/bS+03AkA2TrU7v7wwxHWAfUVNbL75dXrmykjbBv+J6zmbELigl/qACGMr/Qk
 JBe84YuKvkUpQbsYu+E6iGisz2330z6CUhe+1ZMsCkbblyPZqAY7LMhuWUN6y/r2DRTl6C6W6HE
 afde73XooIXfa9Y3EhjI/OfkmXabtzmsdgeow4cnexVXadLnTi1jfak01fyYxdNI3qzr7g5rDZ2
 w/Mk4fkDfBPBz7WNDGg==
X-Proofpoint-ORIG-GUID: kQfHMm9sTlVJ1LKYwxVWqSnNwNFJ746N
X-Authority-Analysis: v=2.4 cv=S+HUAYsP c=1 sm=1 tr=0 ts=69a6b2eb cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=O2ICF3MwSKB_Mz4s5DoA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: kQfHMm9sTlVJ1LKYwxVWqSnNwNFJ746N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 spamscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030076
X-Rspamd-Queue-Id: 6F02A1EC6DF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-28691-lists,linux-renesas-soc=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:email,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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

On 3/2/26 5:29 PM, Geert Uytterhoeven wrote:
> Use the of_machine_get_match() helper instead of open-coding the same
> operation.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Compile-tested only.
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

