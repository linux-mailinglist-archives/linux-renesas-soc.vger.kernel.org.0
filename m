Return-Path: <linux-renesas-soc+bounces-27508-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0FhaDn3xeWnT1AEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27508-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Jan 2026 12:22:37 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D851AA0419
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Jan 2026 12:22:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2DE2B303E2E1
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Jan 2026 11:21:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D4FF344DB0;
	Wed, 28 Jan 2026 11:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OVGNQAqE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g/jx4RyX"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54B8030E852
	for <linux-renesas-soc@vger.kernel.org>; Wed, 28 Jan 2026 11:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769599265; cv=none; b=d+Uo1mKUE8/YXiJzUtOBL3ZDfgKOcCyhhT5wCueLyqXCdBb//TpGszWw1vhNDAYmuyoG7uFT8U3RwpPbnNVeFZPdDL3am2A9mUV35M1mORRmUN4insVmHFKAC5WMbWbAyrjgMYPZl3Jk6fEXqbW73rZUA/lTJhbnDZnoLxcWDY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769599265; c=relaxed/simple;
	bh=0qnHLqAs5qKXRZ3SwSRRXmZ/pwA2WYkJLsmOPNdmiTw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h5FHqhjAIMXosE103I2NsZvPt5lHfb0TnlZJ1SF8ASb+IIx7vD/L7oQUZeWUKqGu7JSCeqeS3PpouXy2y4XQn6eZsSaonY7rrIXT1dH+IjYC0D7DsKHRcPPFF6q5PlqSqINAWielujXamGrt8sTco2QItjoidQ2VC5DIAQ/AQi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OVGNQAqE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g/jx4RyX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60S92F3B320570
	for <linux-renesas-soc@vger.kernel.org>; Wed, 28 Jan 2026 11:21:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1g2tc08NYFOW9PyN0Q/fD1WgNK60ygQO4ur4eDmhFgk=; b=OVGNQAqEyJXdmDbO
	aX2gznPXCvBCwLJ4xK/OpqjbaCvvSwc1KeNGm/O01eQWMAlYDlKB9OJALSBfeL4r
	9xtn/GECQXB+R9N2zUluP7CwdvXl62t0TYrydk8Hucqk6htd6HktYD+XRIITjTmf
	xccgtRCt1vWAPxHQkm/RVAaCaOGUwwEkvgnSIZbMorPoTOgOqO/j2RaWBHGw62jG
	ri/Oo1v52yjuh8kj/HMK+NQZHy4gT5GrifNZGVKnknxs0OLYqWrawc5RDHl+cGPM
	nl6sOXory+jz3KDsHJ3c03uUOeRdbMJJRHuBarobuF6wiaYcpcbjbtNPwVEfOL+Y
	BlD9Zw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4by4sjtg9p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Wed, 28 Jan 2026 11:21:01 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-89481f822aeso19779706d6.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 28 Jan 2026 03:21:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769599261; x=1770204061; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1g2tc08NYFOW9PyN0Q/fD1WgNK60ygQO4ur4eDmhFgk=;
        b=g/jx4RyXoh3QRzM4Uipsx7+oDExNOELAv9PrLSSXG/soQdhPFB1XBHMDosPk0ThBqb
         uT8MWt1Qz/R/sddO89dmHwtrwYPwnsgg9Imd1C5jXBT6TVd9Ix/zVYU0boxDCv4Dm3ZZ
         CqJfxpAAKe6A9yr3k9GtatX+tK0Lxyy+iVkzyh1xwflHrb+CpbgzojDm9tH7h7BGqduL
         zw0ENELZ3qgf1H2XJpdETphAKPwfrpSaHsYOqvQjzC+Yeqa81uZ15rgnuO5lhA4DmxAN
         ESbP5rXohrNLc5uYMnE0bio0qyUh893LahXogR8kthDkE521YSR2NuOq/TQHrTbn2V9C
         xBuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769599261; x=1770204061;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1g2tc08NYFOW9PyN0Q/fD1WgNK60ygQO4ur4eDmhFgk=;
        b=mQ910l5gSONl3ebafSm46Gx6eROwTsV4DEp59boK96hhPos6tqBmzP68QK1I5gcmN3
         Fi5eSNxPCBMlN1oZy84IO1R4foYPQJ/+XC8xqbZOOnGEFFM5WwdumbinfuQRW8180xaP
         ncgXW9o5JjhnZgpf/Hd2TXxxaMTfKB4IwfUDaof0/zOqyBK7XsnTdY7YDHDh0jvAo53J
         3g0wfkjHfHSbCIvPvQLSmCeY0b/vfG4qjvhECOSUykOu0BUcsyUY3iz2/9yQRID3E8M3
         scYm6IOZx2hpGS4L14enjnJHZe7bBi7W5kC86A6ymcvwi5s79CJdmkbNVd32q8c/qj2I
         7G9A==
X-Forwarded-Encrypted: i=1; AJvYcCU6FjjWPVFp0qT/JfFcgw8AXC4OZeYRDKv66SibSrtEbETCfy6sJ1jjmXA1fTVICfUkUFyqGKG7dSssab88lcN+bA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxS1STOlYUbaRMZ76lSqoNg+/BT2f4X7wLpcff2GQn0zCnj73De
	2jwh4LwMbTBXaEFfNkMI+SUBW6eS6EKNJDIPZ6Q2ELL1pI9SIaO6CWUpaoXdZdQq926ww+M3sn8
	yB1SaPosysjwDlxhIOfzqj+zuYJAvScqBPTD9oMGLoemSzsf5SQT/gOG3RLaKSEEXNuuDloNU3A
	==
X-Gm-Gg: AZuq6aKtcMbot/nqrkF1vPylymHB/J0eqRk73G3mu8GEv4DYSTN0HmCGDW19IK+fZrm
	hxdo7jkIepPa1EOtbazQX/OSe840BZ7NMEA1WYKPEgUJg5snu50hoIv0pBsIO/n32SZqZvf5hgN
	0PCML6P+B0970nqQZW7BPMxMT6Rt6e8wXEmyhmkVpSSHtJNI9gmmQcmAgAP/G0DmcTkeRqfiLVD
	j5i/JnIKbOF6EyofaccpUn8ClFqVjHfBGkAvfcR+MkPKj7WS66J0eI3k7WywjLh6g4vVb0RTHAY
	dQXbL/hNB6JtJo6ah6pfvMW9IN8qnFf2x78M1LZPNiNcnKcO/KL8UpUqLLM0StSqZ8ZwVWoRFdT
	LjtRJT67/SrVl4dopPBR4gyOoantwjDAJslHQ9uF+ChQ5uFZ28VRnmzA7KoSu9L1u3c8=
X-Received: by 2002:a05:6214:5c92:b0:795:c55c:87de with SMTP id 6a1803df08f44-894d786e265mr9868296d6.5.1769599260715;
        Wed, 28 Jan 2026 03:21:00 -0800 (PST)
X-Received: by 2002:a05:6214:5c92:b0:795:c55c:87de with SMTP id 6a1803df08f44-894d786e265mr9867946d6.5.1769599260101;
        Wed, 28 Jan 2026 03:21:00 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-658b44527eesm1422612a12.9.2026.01.28.03.20.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jan 2026 03:20:59 -0800 (PST)
Message-ID: <56b686d8-d526-4e11-9b5b-b98e4f1f72d0@oss.qualcomm.com>
Date: Wed, 28 Jan 2026 12:20:55 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/7] arm64: dts: qcom: sm8650: Add sound DAI prefix for
 DP
To: Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-usb@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-pci@vger.kernel.org
References: <20260127-topic-sm8650-ayaneo-pocket-s2-base-v2-0-c55ec1b5d8bf@linaro.org>
 <20260127-topic-sm8650-ayaneo-pocket-s2-base-v2-6-c55ec1b5d8bf@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260127-topic-sm8650-ayaneo-pocket-s2-base-v2-6-c55ec1b5d8bf@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDA5MiBTYWx0ZWRfX0pWBD7Y6Z/jy
 Dvff0nr+rbwKUhzz2HXbsEXUiJdBMxUUtR33qodrRNgFmKGi+EEV1j5R6A6ovJOjzZBeuePDDiP
 TY0macJA/pZ7gB4m9K0ed/YTDV5DCNpwh1zQMoHhXSzCx1+9fWU8oYmOWvsXj9JRgSaXu9b8Hon
 0OToBr0NxShBkcfWZtv3lWOa+CrnEdvQI4tGeRBvwAz5HuAnnSvJGclZx3SbxiSHL8PQpDwZJrP
 aFfIeWAYfF6zmSi+jWnpaaXmU0LdREHhd5Sm5j162zYsnfbEHv9naNwwLVAlOBDLq44FRfJ1E0R
 X+AwM+SgetQvihDxKaaIQI8ryGHcy/zL1cMwxx8L2jLQ2Ki3V56MHH8ojnlKMRL8wjlhubrvZpP
 kqcUctDcFSlvUXtSn/OuinSkE3QZD49B1/mIzWrbIFxy38OFCbd5MsyShPwKfBsiWwwtGnwSsXw
 Xhn9N7y1IAmP3a0iKKw==
X-Proofpoint-ORIG-GUID: xZJmZhxGztQ7c2lSmfOCqmlP2WQmwjaJ
X-Authority-Analysis: v=2.4 cv=KezfcAYD c=1 sm=1 tr=0 ts=6979f11d cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=UpTyAFhicMDBmGaZp7IA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: xZJmZhxGztQ7c2lSmfOCqmlP2WQmwjaJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_02,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 spamscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601280092
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-27508-lists,linux-renesas-soc=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,linaro.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[linaro.org,kernel.org,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linuxfoundation.org,glider.be,google.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D851AA0419
X-Rspamd-Action: no action

On 1/27/26 10:57 AM, Neil Armstrong wrote:
> Sound DAI devices exposing same set of mixers, e.g. each DisplayPort
> controller, need to add dedicated prefix for these mixers to avoid
> conflicts and to allow ALSA to properly configure given instance.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

