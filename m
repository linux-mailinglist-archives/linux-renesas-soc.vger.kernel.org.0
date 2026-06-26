Return-Path: <linux-renesas-soc+bounces-34450-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zKbsFv1wPmqtGAkAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34450-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Jun 2026 14:30:53 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E89196CD009
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Jun 2026 14:30:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=NYO5Z8JH;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=JM36XZy1;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34450-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34450-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5BA59301F8FB
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Jun 2026 12:30:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68EBF3F23D5;
	Fri, 26 Jun 2026 12:30:50 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F308427A462
	for <linux-renesas-soc@vger.kernel.org>; Fri, 26 Jun 2026 12:30:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782477050; cv=none; b=iVIwiErqH6VwLcb9Jwy+opCtXEQa9zB5cgrg2Wqu+sg5paDiziuauxVm4NRjQLH1PiapvlFf8xXa8xDZhuhBVRKiTWzjnDuY6Hj4KvkmRr9VF2DtUo/t5bbWWgilkN5+HcEYR5YQ57rNPuwFuvOZIB7inljAFPk92vxkTIXrRNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782477050; c=relaxed/simple;
	bh=vQWsZeLmo5eF4R9VLfJ0X6Ej2HSrQU0nII1edrWoBPg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EpiP63/gt5Oa+quwxPPAyhg7/XbXn1wDHbsjlADU4UHUO10DuS4/5KzY8eo6M2RaFHRMm/tgOSqFxRJnf8Ha0iNY1HmQWeZnmHAQrj2Kqa+L2uNY+YpkcBQ+ZS439Q3A42ZkxFaU+ZFsraHhw6E5cHpRYiSUB91rIb0ciprt0Eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NYO5Z8JH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JM36XZy1; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65QAchHb1143735
	for <linux-renesas-soc@vger.kernel.org>; Fri, 26 Jun 2026 12:30:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TTDIPGRvRpFqA1xlxZmp5V6MW6Dxq2QB3L1ZJBk3cjE=; b=NYO5Z8JHU0kLnVak
	jecJFGLGhVpR0hbUX6zKhS2mOwvu3eBGD2sS45i+Hav3qp+2t6pE+pFZ2XtSONov
	X4c4W7LDRDpqtWVzmdsTGslFZpTS3BKqmO4LGnnqliXgF1JEa/WwjDEU7/Ezrmid
	/9p6KuxaPEvOhSqpUkA5GVy8m8qG2l9rSHKtxrQJuoHEKNtgMtDVMTwqW8k0h4C4
	z8xYfav8q16kpDuWAc/V7zyurzFDGBPLE82T94+UU8v0ss6Q1pUZpwbdgr6iiq1G
	xZWHKsoWiebuVTcUtPxGLoPpb+LE34GExlbxY4iBcjVil9s5noXrKfGOTvviRZNV
	fOp4EA==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1eewan0j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Fri, 26 Jun 2026 12:30:47 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5bd6a5aa467so47506e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 26 Jun 2026 05:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782477047; x=1783081847; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TTDIPGRvRpFqA1xlxZmp5V6MW6Dxq2QB3L1ZJBk3cjE=;
        b=JM36XZy1dMUivwbRTBp2T7HYvN5EteGuqDIKeghRdvPPFLPOvxZ2WK87G0Qh0m381Q
         cE2pxdBor8yrTpRwSp/WO+ZXs5Fv+y04N0IAGBuXQzixfiArd4Q6RY2oTs4ROBVj3iku
         fN1H5bdvtMVrwqlVFr/HyJE+nmdboJaeVuyi2VKr4jH5CPZx3hZOOEIixCj6AbYut7Zb
         6xhqlw6k79dKa0xjk1FxpURApVJEwE5dcjswXe8rJpthY0a8PMZiUptMHTlxllRJ6JKj
         xq10G+MPiXVTuA0TK7473AhbA5BFovD1NPEa+QT80WAZQFAUkyh0LpYqTcLk4Bdqq2PR
         PH8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782477047; x=1783081847;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TTDIPGRvRpFqA1xlxZmp5V6MW6Dxq2QB3L1ZJBk3cjE=;
        b=GzNvKF1EGNlsQmgRlj/xSBal2xGNS9xKh/ZxgJLpjomt4vmgvBb01HfHGi+1zkYDvR
         lWgyZHppXg2P/C68MUuERmHLto76okZ5DMb77bkB6McGUX+I51D9kci7zgu5i+UcQGfl
         8XaP3wW4Mtya9olEumBsaB0y1PTnoTAj6fXmZbVoM+3CygfSBCNvYbUZ8/ky1hHXttVk
         gWjrbZFqph03/1IP83GmtcePtRuZSHmJyt+fN9dt4vjjfQptuDKQZDGt75g1xLSAMLD7
         S9gUbeiAyZv6nDzA1/aPT2DilU8n4IttTYd9L8cy2NSa0TsMXAvpD+QlhCNm+ZH5JrWv
         lRAg==
X-Forwarded-Encrypted: i=1; AHgh+RpFfZAbo3QWFfjyK5M3kp9W1ile83BKA1RftnO40naPjNX9zCeUl8rKJ110CgVtpWNZzOpoP8olYsN+yyuESFlfhA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/Vq/jeQCH5uDb4tZPIH1GMkHxerwZdHc5SELDTRb63vKnJ5oy
	7eSuhaPRW8NQOcexSPm2w1vS8WjbwnvUADDS60JjB2Bs1DH6OxKbuiaIjbGoYMN6qqlZNwAL3Lb
	b5l8CjyJ0A4u1ybGYCl4Fr/78hmTbuAqTm7inXcjaIVRlXOxApvQdMo6H3251XIBxIz8Chjgtdg
	==
X-Gm-Gg: AfdE7cmGJ6vTMSxp6rLGslYF2QtrTwW8vmbGeXuk3dJx0QDLjdyRWm2MDn7AM6184rQ
	bvpY14oe3Q7Cuwpq8c31D/SepQZ9P/dBmwW7WwxHnfE02vjYp3Ml5oKnwxOkm5DBC0Hj+pzhvDX
	0XYQnOiQkWUnPYAtMDIX5FaGGVOLudHxhtTEBTKbxarzOcYU42rNTSL4aT7bYb5DT51hx4uyhhF
	ePXcsnaT6VeuHXuSX8k/AZb7XTKBjSWj/aU7veVPp2oYGrUDg+0ErsPz28Zn4KlH6J+cwkxlx4i
	L+YReaSZWW+LZPTg+z970stnHH50E7jUiqJK710W4V8Ef4e//Cwlatcp8XNp0lLlJcPfuYQhBYa
	Q2vnXPTgeCUa8UYpMHnIB2IFYPFHfG1A5f6g=
X-Received: by 2002:a05:6102:50aa:b0:634:11ac:12ca with SMTP id ada2fe7eead31-734362a85b9mr1107941137.5.1782477047281;
        Fri, 26 Jun 2026 05:30:47 -0700 (PDT)
X-Received: by 2002:a05:6102:50aa:b0:634:11ac:12ca with SMTP id ada2fe7eead31-734362a85b9mr1107909137.5.1782477046707;
        Fri, 26 Jun 2026 05:30:46 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c11fbbe5f73sm325659766b.17.2026.06.26.05.30.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jun 2026 05:30:45 -0700 (PDT)
Message-ID: <b74b3123-367e-4f22-a910-a2ceccebdf9a@oss.qualcomm.com>
Date: Fri, 26 Jun 2026 14:30:40 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/8] arm64: dts: qcom: Convert to new media orientation
 definitions
To: Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jacopo Mondi <jacopo@jmondi.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Jimmy Su <jimmy.su@intel.com>, Matthias Fend <matthias.fend@emfend.at>,
        Mikhail Rudenko <mike.rudenko@gmail.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Michael Riesch <michael.riesch@collabora.com>,
        Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
        Sylvain Petinot <sylvain.petinot@foss.st.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Martin Kepplinger <martin.kepplinger@puri.sm>,
        Quentin Schulz <quentin.schulz@theobroma-systems.com>,
        Tommaso Merciai <tomm.merciai@gmail.com>,
        Svyatoslav Ryhel <clamor95@gmail.com>,
        Richard Acayan <mailingradian@gmail.com>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux@ew.tq-group.com, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
References: <20260626-kbingham-orientation-v2-0-47178be927b4@ideasonboard.com>
 <20260626-kbingham-orientation-v2-6-47178be927b4@ideasonboard.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260626-kbingham-orientation-v2-6-47178be927b4@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDEwMiBTYWx0ZWRfX6w6HXRc22T7S
 QD6whn2ADVfFf4gktD+Jc42ESiqhPKUwVQoAA4sEuytzgGwAjr7tug0seqd/VJWIq2m2t7eE2pO
 FPLXQ+h4xfnEoYwXQojvZfZQ/M2kT3g=
X-Proofpoint-GUID: sLaQWI_sf6paUDyuTq0jJfzM5AUOlxld
X-Proofpoint-ORIG-GUID: sLaQWI_sf6paUDyuTq0jJfzM5AUOlxld
X-Authority-Analysis: v=2.4 cv=P7UKQCAu c=1 sm=1 tr=0 ts=6a3e70f7 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=P1BnusSwAAAA:8 a=EUspDBNiAAAA:8 a=O-OUeni-LN-QTous_GcA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDEwMiBTYWx0ZWRfXwAZ9sYUKJ7e8
 g9i4JNcFhdWeysQqEAwUQzhGkPhsOcLomFgQvY7JrstT0jyumthVkmF9HnE/0RAz8XZEj2uEGlv
 WZJL2tbrtr5kMVrBLfiXUuDBSQqWDDXj93XrIzZ9+qmXc2X9DE+rPKwG57u80NYkfLJXrNvJEmU
 U0r1oDUU6qJ5zmKhmpSay3FFOtU2HQD6+LzkhUVONzkzAJlSTmn4Q8txsN3OOOTExz7iYA1O3lx
 WqM7SM0fUzEq01s1jneiTKw8mh00ImjU+rPx+wGTLgwSHm2amdmGiIoDi0Abkmq0HqMBxwtAQDs
 XOwP1xTTTkVqIls9ugaVUgxL/FFcG4RqK8L2GvzI3irDeMSy8xV+dKVC0VI0fpczWxgBk7x7yTw
 8UaRWOIqvKH+syH1MazCCEJm0SEEsc6E2i9QA2/WDu5/1Esn3616NhtXC/SGugW0VK0ufjxug3m
 CKNvcYq8V/QZbTouXDg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_03,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 phishscore=0 bulkscore=0 spamscore=0
 impostorscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606260102
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-34450-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[43];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[ideasonboard.com,kernel.org,jmondi.org,linux.intel.com,intel.com,emfend.at,gmail.com,collabora.com,foss.st.com,puri.sm,theobroma-systems.com,nvidia.com,nxp.com,pengutronix.de,glider.be,sntech.de];
	FORGED_RECIPIENTS(0.00)[m:kieran.bingham@ideasonboard.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:jacopo@jmondi.org,m:sakari.ailus@linux.intel.com,m:jimmy.su@intel.com,m:matthias.fend@emfend.at,m:mike.rudenko@gmail.com,m:dan.scally@ideasonboard.com,m:jacopo.mondi@ideasonboard.com,m:michael.riesch@collabora.com,m:benjamin.mugnier@foss.st.com,m:sylvain.petinot@foss.st.com,m:laurent.pinchart@ideasonboard.com,m:paul.elder@ideasonboard.com,m:martin.kepplinger@puri.sm,m:quentin.schulz@theobroma-systems.com,m:tomm.merciai@gmail.com,m:clamor95@gmail.com,m:mailingradian@gmail.com,m:thierry.reding@kernel.org,m:jonathanh@nvidia.com,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:heiko@sntech.de,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-tegra@vger.kernel.org
 ,m:linux@ew.tq-group.com,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,m:mikerudenko@gmail.com,m:tommmerciai@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,ideasonboard.com:email];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E89196CD009

On 6/26/26 2:07 PM, Kieran Bingham wrote:
> The orientation property for video interface devices now has definitions
> to prevent hardcoded integer values for the enum options.
> 
> Update the users throughout the qualcomm device trees to use the new
> definitions.
> 
> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> ---

Finally someone shaved this yak, thank you

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

