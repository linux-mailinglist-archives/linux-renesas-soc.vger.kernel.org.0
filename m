Return-Path: <linux-renesas-soc+bounces-35092-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DjVTFUygVGqpoQMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-35092-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jul 2026 10:22:36 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E01AA7489FC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jul 2026 10:22:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=mubL5Dtc;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=O1CbeLl9;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-35092-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-35092-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 59EE73001D67
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jul 2026 08:22:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FF0C3A7F75;
	Mon, 13 Jul 2026 08:22:34 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B9861F09A8
	for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Jul 2026 08:22:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783930954; cv=none; b=iQkVaFPImdLH+Vl/w+ceJjHtjHVL1R5g84po+kvG1K1Jzayh8BDPdcnFE06+kZPWSpUs33g1T+IVjr33geekTnDbO9nwWxinJx8eB1+iK5CBqEtUeet/90Icg6fsI/uAfhpyHTblQWL2KqWy/FnfR6H9HF7Q8PnBHJvZab7ZQs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783930954; c=relaxed/simple;
	bh=bxRMLXmQHwXLglGw45CZyj/G9zrvnc8zeYpRSzODb04=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kk2+nMVcRc+7v1FfFyhNlkvR9+V4FeDrlTaWqRraB8iD9bgDNxWa289ZNiO5f43kMUN6pf3Hge0Hv5oymg48t5wHMBLBMJL9VXR4yzqDrjZT7w3dDK1Bvg4Jd+tUZrJtrMdfbV0I+7UiKPYVn/XXfwR1KY0OVKPYxIXW4p00tzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mubL5Dtc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O1CbeLl9; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D77MOA810492
	for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Jul 2026 08:22:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	taDteVqnZDMlnEbdgnMrSoFaQv4SalG2UgotBTSbtqM=; b=mubL5DtckRzWngQ2
	CABDPvM2DxPzWXXoh63RJ9lQuh5p7AdUWJ7TUW9KzYEjFfKdlt/ZWEDg8/qlQm4X
	p9ZN+R9R4rDKPODdBtVOBWKN2k2EeYhI7nZccAVWj/H/9t3jga8hNSu49xQ9TGdT
	8lW8b8Epj6YErTp1Zxp3VNfVK06qzCFiqnmvk26r+lXs5r+ZdzEceoSyLRmbqVbh
	SB+8IsuNO9wiwWEXAGUoy6cMV/zLfhTcTHoouHTJvi0fpoZA13VBQtEF6OYOyA5h
	BICH1QJQKnPUqQLwcs76+X1AWxzi4jmYKS27bu8pB3M4ZKXLGJbw6B17NQsAv/Ut
	aFevOA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcubsr8jk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Jul 2026 08:22:31 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51bfe3fa93bso50642261cf.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Jul 2026 01:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783930951; x=1784535751; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=taDteVqnZDMlnEbdgnMrSoFaQv4SalG2UgotBTSbtqM=;
        b=O1CbeLl93za+muaP+EtRH5u3PbqakORFgUW5tCflj2jqy8dRhpMsMQJLjrhlcv1YWn
         55VcURsMdks787ddvD2f4cTLVxPuBFEXVUoG+DTNN7jDvmxUq8v64xZ+zy/37nSdmopx
         MnDUxoGD1t7uJQEV88GTV+a+WBxHx/6QmUYDthG3Zp3CPrn74NTxVh7n/iGGGUBsIkxZ
         PpkdEezLqaij6MaX7W+yt346VS/duCxju5MaKECeESmbLk9WtCXTTSh04YHftpjqwEpG
         3xkhNRWmVApy4duPK4pYRAijCwK9yhO//PMi6QL5/3xfcZV3gG9zKDUn/2zJgYEaKuNc
         D83w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783930951; x=1784535751;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=taDteVqnZDMlnEbdgnMrSoFaQv4SalG2UgotBTSbtqM=;
        b=MyGM5jl+ecsdSICwwo0yXcuZwAr61FkkdDM4EYpPsXdoDU2qe3HUL6ye+IAoD1zXxY
         A5rG8P6H4ZtHskXQnyTxQ0cSqYTJfjt5lvyH0x2u2z7a/Z5Cc7T8UFXWKQeHH2T/Hm3N
         KYz5WD9qaNgCpj5HqNnubDvshh3fpx7erKU6R3sBgwtQhUQcxoGx3OY/wBOmoHmW3o3C
         BmJRQOKpWzUB71euqPFpquPR4pC1jtX2wcCvOPxV8w4Wyt1gboX0Z0Bxo1hYiG85oDtP
         oNhB7yxFoCuyzeUO23QdyPjHAFZ+C+QDslDso8uRy749/GrwEpatXTlwRHxSYJmdQSq8
         Bokw==
X-Gm-Message-State: AOJu0YxQTrQF/lEgF5Wo9epjFVEkCOTmLz0HIra4R4BTUQAtojqyVcUZ
	l0zlKtZthuUjOCTtw3/obKxRRHmdjD6sG+bVqBvMABA2u5vomF+7Rh/4Ypy1J0c4l9R9hsMw/R1
	yqrinIhVdJDVIzKzF5kchC8iuJSvCc0dhz39FXmcITPBb7XweBUXe7SthCNrWXnEDtRcj1eVTBI
	OJcHL0UQ==
X-Gm-Gg: AfdE7cn/bb7CSsUqi03WQKI1mDjCIDf2TWD/pEl/HG+YrO/JcHYycoRA6jAMKeQykYV
	DvlWcYeZC+nRtxMQS4Zn/29kGrbkFKGLTeR/L629TGv2IXgW3HB2HxS2pdSB2JxgD6NkK63cVSG
	jF/H32ZFaD7py6AiOfADk3bT/42ga2gcbxXhiTVT5rdxO7taBspZW77lG46xFla1k8Yi0gUuLXc
	ne3V6/FzV7Fx6D9LcQ1XM4QiywVGpNTe3AUtMH1LEu4imayi9mkUosj6RiJkASfzr4k5Hhx/nfs
	iKuVL86tCEHM9uiOxTp9G12HBP8KCwRdLz74ZFUlWCx7KTCidxjRixMsGr5abR/bqsSfMijjNuF
	mo08g1iGY9K397+L2cYxJGxGOy/lNGi1TnZOAlh0=
X-Received: by 2002:ac8:5ac4:0:b0:51c:7b13:62ff with SMTP id d75a77b69052e-51cbf380b99mr72834581cf.85.1783930950817;
        Mon, 13 Jul 2026 01:22:30 -0700 (PDT)
X-Received: by 2002:ac8:5ac4:0:b0:51c:7b13:62ff with SMTP id d75a77b69052e-51cbf380b99mr72834501cf.85.1783930950429;
        Mon, 13 Jul 2026 01:22:30 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8881:83b8:89fa:1a2a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47df6a31dd5sm40344350f8f.16.2026.07.13.01.22.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 01:22:29 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Abdun Nihaal <nihaal@cse.iitm.ac.in>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org
Subject: Re: [PATCH] gpio: sloppy-logic-analyzer: add a comment explaining the buffer init
Date: Mon, 13 Jul 2026 10:22:27 +0200
Message-ID: <178393094383.9372.7978842835455605078.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260712093148.21446-2-wsa+renesas@sang-engineering.com>
References: <20260712093148.21446-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Oq9/DS/t c=1 sm=1 tr=0 ts=6a54a047 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=L2B-HX8WAKF3q-jLy38A:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: VCTaGM-Eo4Slh4oltl9v9HIVSMghsMCH
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA4NiBTYWx0ZWRfX6021YMd7dv6N
 sREh6XFwXZErucmKsIsONUqFZgp5veOQQXJINb9indrlGfN0B0owFaNd/pE9EqyFgK0HEmkfs77
 AVBRxe6Y1BpfkDwlIJ6ospLM7Oc1rYo=
X-Proofpoint-GUID: VCTaGM-Eo4Slh4oltl9v9HIVSMghsMCH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA4NiBTYWx0ZWRfX1D4l6Q9wTfXl
 L0zMSs6GK4Yzj5U4WMfXSHt8QVupg/iPF7/LsfPqqeJRHqd7yYHsAmnYWUSCySJgZ6r700phU4W
 MusFIelXE+uXkuCWCAqHM/MjfxS1vqrYn5qAqiRCzpL6UN4f8D+kZAXtsj6eo//i9HaxFbCjKMF
 j/T3WOsXG6oB7SLG4LQWqUbPruuWeehhsccJzhrie+zwPMDtvr2XY95bMiCMV7RmMniZusp/IaS
 NOQ5nfA61gCa39hHpGyn0p59nRbqW7jlF51Toz3Gpzj6b6uTcgR8x/XiN3AIBgveWOdNe7MP/a2
 CM4j8pNx9iMN21TuXtr/OGcBDZq76frL33A7uAp1h7tLl4YJjjs+zzQvXmlr+ZYa1bkZUzYG9cN
 HczmFng29jpVEVClHM+F353qE7pEMnFScrIvATAbddbjN8BNvjltrM6VbLQsiQ5vbu5tuXHYFOn
 lU592FlqoH4tBLF8Obw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0
 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130086
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35092-lists,linux-renesas-soc=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_RECIPIENTS(0.00)[m:linux-renesas-soc@vger.kernel.org,m:wsa+renesas@sang-engineering.com,m:bartosz.golaszewski@oss.qualcomm.com,m:nihaal@cse.iitm.ac.in,m:linusw@kernel.org,m:brgl@kernel.org,m:linux-gpio@vger.kernel.org,m:wsa@sang-engineering.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E01AA7489FC


On Sun, 12 Jul 2026 11:31:48 +0200, Wolfram Sang wrote:
> To avoid more false positive reports of "leaking memory" when
> fops_buf_size_set() returns an error.
> 
> 

Applied, thanks!

[1/1] gpio: sloppy-logic-analyzer: add a comment explaining the buffer init
      https://git.kernel.org/brgl/c/029023cd5c4b75a598e34fec9e48781761c09885

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

