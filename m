Return-Path: <linux-renesas-soc+bounces-28943-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oL2xMZfDqmnVWwEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28943-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Mar 2026 13:07:51 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AC65220285
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Mar 2026 13:07:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BBFFB31425E6
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Mar 2026 12:03:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91EAA38BF6A;
	Fri,  6 Mar 2026 12:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LdXcIVPc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EblWVR40"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0851838B7DE
	for <linux-renesas-soc@vger.kernel.org>; Fri,  6 Mar 2026 12:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772798602; cv=none; b=uNzZkuQ7Muoos8KL/k4tv9OzCHV+goU4naDPp3OCLqQtON2Udo+Pc7lW6P4enazblqPmC+Uj5DGnaQrCboXfco129AB/oAMkTYuk/JFKPYE00Ftddy905fNHgye5syx2cVYQWvLexJrUpjT4uSWIUirTf7VveQzBD1Dv/1huZdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772798602; c=relaxed/simple;
	bh=eOMtL1pudAxDLN8GeGr6PmJf215rpqL51x1GL5PbJIc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L3LDfB1bzeuIaL2u5OF4o4qEQUcE3SjE6cN1DOPzVhj0z6hV+CavJr0i2wjEXyrAJZQNK1sYEbmuJtvBCr0hv7mXF9VM4BWe1LHWOjtieDmbiYjCzCC80NOYCzNc9Jt64A8r9IblOinpnyY9xOKzqposCfzbzNR3HWVJY9hw/9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LdXcIVPc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EblWVR40; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626Bb3xJ629064
	for <linux-renesas-soc@vger.kernel.org>; Fri, 6 Mar 2026 12:03:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qsIhiDYqrYhyPHQhfvVcO7ffM//NdCFDfvQA4djkeYg=; b=LdXcIVPcF6oBAPeL
	ppHTobtohVIPcESYYqfiTGnSkzigTSitfQsaVJDYoKkeOZeiCXvxUuKpGmeSWjV5
	BAMq+rVvT1QNpGWsvzTl7BtyOfBRqitIcLN02Gr9vAARLuyjxRbh8znuRY8lF7Zz
	KRfhI22YgQYKXftPUp4Va1VxviUCs6SeSBByzJ0dUJuTuN9wLVSuITMzzAQ4kfOc
	fMlYevq89sF3MAKKzhI+ac8HKTVO0ayJrQ9nKuSxCjdrcDMitm530tsaORlm+HAi
	H0V9LotCfxrR+OsyYLCpj1CXOV4bEDfO+rdypjBa4zvLI8zwytsoy5aV1nModZY/
	bCBsuw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqj4saj7w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Fri, 06 Mar 2026 12:03:20 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c70b6a5821so4366327985a.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 06 Mar 2026 04:03:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772798599; x=1773403399; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qsIhiDYqrYhyPHQhfvVcO7ffM//NdCFDfvQA4djkeYg=;
        b=EblWVR40ze8MJX4w/+6n++vyHfvTqgYpfQgZm83M/NfVOD99QzVVhKqTIP30awh7U4
         jwOh1do/y7wluYKL4CsD1Ant7sX/Zk7ZL/gXpAyz3Im9ZDQ7hrsPk5pqp1KtN9WxPTvI
         lryKEp690Cu6fM1cAJlvuAPFGQqzu4V6O5HvNE+6Vu+kcA0OEfqWXLqyskHbreJBDPco
         Id8BrxBP0aglkwoC80zM8JI5/AbYiA7Of9UYcX20QAwJRHsFpj4N4r3PYfYUkSmENkXj
         SMlGJJSoqeNQcTGzJnWGDcKTIVVZHrcjbF5qD9AUR4HX6pzsOrB3Z0J12yNzKIxFawKi
         NCeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772798599; x=1773403399;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qsIhiDYqrYhyPHQhfvVcO7ffM//NdCFDfvQA4djkeYg=;
        b=hWfmPXVqW1PJ/QK8opf/OlRcbheY3uWh/IzHqSGWRJlUJcBJq0n1aVjf50nzdyeWIY
         44gGMWJNVF60vICv3hcT4++0jAsoJC0DCyOevJ/+NU/q1jCNJRUqWSNFDeCH/54OCgrG
         V/ttbG4nu1u5Wpkby7nFVKi400QfMCfTZv/wc+QFc3KBDSbMO9kljjwIECdsrIf0TPMx
         zgO8wReStSLWk2JabEyPzDEgr+OW0mh8+8lkKM4+6yBW7kY9RWORCOmSptqutSgV29DI
         B3PU4ctjbOsi0UBdP5vO4oj2Aol0k9A2YLbADsLAe9nb6yN0YtSvp+InlgBuvsehTjJy
         ZcMA==
X-Forwarded-Encrypted: i=1; AJvYcCUdbUuZzEWD6j8zsACK6lpeEXSifGChbMQpyyFoQJVnI1feD08wL4fybYeymTkoklNuxAiUdzKjcC0ZlPrtzvrlog==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6ahPx5WLviEbDCWHAzO/ShCUAAObVytVxktpy1zMtO58LZBlj
	sZim9k4R9U1ZdulStGC/jpGRG7FCoB02kCfN9JAFgHh2D0V4i5A63irRNSZd/S2RXMzc2EgSkwr
	4ml5RIbszWcqczNFV3aiRCGyyy0EsVkagCA2rtNH8DevRfgLIBykt4om+n7mKuIA5V7ad5f7l2w
	==
X-Gm-Gg: ATEYQzzRmsYPKiAUsK/fP2azACscj9GU69sQJOF40GnWtX0oywfeVO6VwSkF6Pbafy9
	eOhF1Lzc2gpmIjphKPyEvLZe7N0P5kRUf37X8e5yA/vn9wS6YvVVxBrXVjs8TtQVdj5ROEueYgR
	7s0xs1mMA/Go1UQ0IjI56Ai9AbKJ0rCJmWctV25msWZcWbPyOlG5P7JYNmiU1Wrvsw8ob9eC566
	CBm+7FcZwXCbThcF+mj2t0nPwKmeKMnCbAPRzMf3mnGrBrE9pnpJeUeZf9AJkWBm3hqT73UE+pN
	XxFHtTMAbHGDF3B4ur7PwYa5TnkaPpqTakJ11ZY/C/kew7AhzLxskRO9a/6PGEzyWrMlZibZSNm
	GkWa0DFhNitf0z4D8ANVEHm+spdOIkw4k1M+jNCJq4Iru
X-Received: by 2002:a05:620a:4691:b0:8cb:3a1d:79f9 with SMTP id af79cd13be357-8cd6d40d2f4mr232421385a.6.1772798599074;
        Fri, 06 Mar 2026 04:03:19 -0800 (PST)
X-Received: by 2002:a05:620a:4691:b0:8cb:3a1d:79f9 with SMTP id af79cd13be357-8cd6d40d2f4mr232416285a.6.1772798598558;
        Fri, 06 Mar 2026 04:03:18 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dad1cb7csm3410129f8f.0.2026.03.06.04.03.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 04:03:17 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 06 Mar 2026 13:02:58 +0100
Subject: [PATCH 5/5] dt-bindings: display: panel: Align style of "true"
 properties
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-dt-bindings-display-panel-clean-v1-5-3086eda1efaf@oss.qualcomm.com>
References: <20260306-dt-bindings-display-panel-clean-v1-0-3086eda1efaf@oss.qualcomm.com>
In-Reply-To: <20260306-dt-bindings-display-panel-clean-v1-0-3086eda1efaf@oss.qualcomm.com>
To: Artur Weber <aweber.kernel@gmail.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dzmitry Sankouski <dsankouski@gmail.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=8793;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=eOMtL1pudAxDLN8GeGr6PmJf215rpqL51x1GL5PbJIc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpqsJ2egJADa1wD/I3+dbMeZPrxGfxjU6pK3X3Z
 HOZtmfjJcGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaarCdgAKCRDBN2bmhouD
 16ASEACankKcaY8YWF8NbeZ0RXRJtmVxWwnfhbOAW8jOU2YvRF9BuWTEmIvLeiSs0aT4LfsxbnJ
 rXKcqHapTug3l5fQs0Xavf0/iaPKEQtbRT/wS4dCy16ecZzybwigHyyilQlYbrQjzAZjDqtE8XX
 KYaJZHUQl3XurOX1AEQMT1t+QE9LGEaYMK//y5ESuUO3mrDAgF/YYrJS+Sa29mu8Z36dluxz1Xc
 fiEesnABLeS2I3fjDsG2K66mNoiFF0zTz0y3oQVKHWRpzoQ36G0J+sE6MytRYyBzqg0C73TyOrr
 sYR1JDrUUHkKcnBojPAAlegsfr7nJfr6ZYQL6BASi8WS+cqH0wFro0ciGTHIKDyNjsvXAmK8tHh
 lXOcOvzaawDizbkaq3xyWgAkEGuEiEcARRSAOyS6i3qPo/RjQ7jdRMuCrQf4QFiipT/9Srrswww
 qpIHIaLW3otUe/BhPch2hwnCkcsWE8464mWYSs0VzDNQSuNlXaj4r3gBr7/mOWvS2iGtaCuo+oN
 7uoed6sg0XzbX5GpNH6unrSdwCcAlzGpfsqfs2fgTVowZBZrT5+XrhZbASSgPvbmtLNXypqTWFq
 +kX3I/DfFkM/mInvRZCd/kuQGBeiBYO/2dp0kIy5aRU/kYE7Jd9dbJVgcYVgp0Q2GhI4+dGKhFl
 OfmsXAoc0VgIa5Q==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDExNSBTYWx0ZWRfX7JDl3645Meht
 ggHwVpKo5JaLqBIRVc6vQn/VwXU06fv6A4s+76Co+haQBn/TYh8RP4mQy5HypmK7r+4cYsN12rO
 UtsHQkPao7Rph8hhtP+k9aEwMKu6IFEVsmGbJCR2XdQKGT5FMC3uKdXqZesvyjSZO0cBODOSa2x
 AVIL/CVA40XHQLy1vm6uFZrHO+qn6WT3R4x+cI+PP401R1oZHNi6bEJRPcIONArrC5O7pXAMPb/
 3QP3sEnuEDyVFWEHs7YQVB9vKgUTyE7LmPjOxlh9YPtIt+GJg3E8smUNzoHVG9UVMzOnwJy9dva
 zcVzfaiVEXQRFPnmcKnk8IOGW/YdgBD7FTgv/ghL3/fTd9D2mbBa4NOu5h39GYS24yTNGmysZHA
 kwch6K9kJf0EzzOdRS02bLSrYzOniMaVaaPlnUnJXEcx4zUPknwpTYRzZhlcgbQxKrt6oUTaxm2
 dQLIdactfaEYxtAxS2w==
X-Proofpoint-ORIG-GUID: DZrVS_7nESN9QHvMzsr64PosqHG1hfe2
X-Proofpoint-GUID: DZrVS_7nESN9QHvMzsr64PosqHG1hfe2
X-Authority-Analysis: v=2.4 cv=T8uBjvKQ c=1 sm=1 tr=0 ts=69aac288 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=y7DYbA0_Xfvc-Urf_C0A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_04,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 phishscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060115
X-Rspamd-Queue-Id: 2AC65220285
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
	TAGGED_FROM(0.00)[bounces-28943-lists,linux-renesas-soc=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[gmail.com,linaro.org,linux.intel.com,kernel.org,suse.de,ffwll.ch,ti.com,ideasonboard.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

For code readability, several bindings which list allowed properties
with ": true" syntax group them in one place, without line breaks
between each.  Align a few bindings to match this style.  No functional
impact.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/display/panel/feiyang,fy07024di26a30d.yaml | 1 -
 Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml  | 3 ---
 .../devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml      | 2 --
 .../devicetree/bindings/display/panel/leadtek,ltk050h3146w.yaml    | 1 +
 .../devicetree/bindings/display/panel/leadtek,ltk500hd1829.yaml    | 1 +
 .../devicetree/bindings/display/panel/mantix,mlaf057we51-x.yaml    | 5 ++---
 .../devicetree/bindings/display/panel/novatek,nt35510.yaml         | 3 ++-
 .../devicetree/bindings/display/panel/renesas,r61307.yaml          | 3 +--
 .../devicetree/bindings/display/panel/renesas,r69328.yaml          | 1 -
 .../devicetree/bindings/display/panel/rocktech,jh057n00900.yaml    | 5 ++---
 .../bindings/display/panel/sony,tulip-truly-nt35521.yaml           | 2 --
 .../devicetree/bindings/display/panel/startek,kd070fhfid015.yaml   | 7 ++-----
 12 files changed, 11 insertions(+), 23 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/panel/feiyang,fy07024di26a30d.yaml b/Documentation/devicetree/bindings/display/panel/feiyang,fy07024di26a30d.yaml
index 92df69e80a82..f288fa2390c9 100644
--- a/Documentation/devicetree/bindings/display/panel/feiyang,fy07024di26a30d.yaml
+++ b/Documentation/devicetree/bindings/display/panel/feiyang,fy07024di26a30d.yaml
@@ -28,7 +28,6 @@ properties:
 
   port: true
   reset-gpios: true
-
   backlight: true
 
 required:
diff --git a/Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml b/Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml
index 182a2b825e1c..84e840e0224f 100644
--- a/Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml
+++ b/Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml
@@ -33,11 +33,8 @@ properties:
     maxItems: 1
 
   reset-gpios: true
-
   backlight: true
-
   rotation: true
-
   port: true
 
   vcc-supply:
diff --git a/Documentation/devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml b/Documentation/devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml
index 5802fb3c9ffe..2fa07ec55b08 100644
--- a/Documentation/devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml
+++ b/Documentation/devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml
@@ -35,9 +35,7 @@ properties:
     description: supply regulator for VCCIO, usually 1.8V
 
   reset-gpios: true
-
   backlight: true
-
   port: true
 
 required:
diff --git a/Documentation/devicetree/bindings/display/panel/leadtek,ltk050h3146w.yaml b/Documentation/devicetree/bindings/display/panel/leadtek,ltk050h3146w.yaml
index 5fcea62fd58f..2f49a6bbf3d7 100644
--- a/Documentation/devicetree/bindings/display/panel/leadtek,ltk050h3146w.yaml
+++ b/Documentation/devicetree/bindings/display/panel/leadtek,ltk050h3146w.yaml
@@ -25,6 +25,7 @@ properties:
   backlight: true
   port: true
   reset-gpios: true
+
   iovcc-supply:
     description: regulator that supplies the iovcc voltage
   vci-supply:
diff --git a/Documentation/devicetree/bindings/display/panel/leadtek,ltk500hd1829.yaml b/Documentation/devicetree/bindings/display/panel/leadtek,ltk500hd1829.yaml
index b0e2c82232d3..3f56047f4469 100644
--- a/Documentation/devicetree/bindings/display/panel/leadtek,ltk500hd1829.yaml
+++ b/Documentation/devicetree/bindings/display/panel/leadtek,ltk500hd1829.yaml
@@ -24,6 +24,7 @@ properties:
   backlight: true
   port: true
   reset-gpios: true
+
   iovcc-supply:
     description: regulator that supplies the iovcc voltage
   vcc-supply:
diff --git a/Documentation/devicetree/bindings/display/panel/mantix,mlaf057we51-x.yaml b/Documentation/devicetree/bindings/display/panel/mantix,mlaf057we51-x.yaml
index 74ff772973d6..b8b153a6e6cc 100644
--- a/Documentation/devicetree/bindings/display/panel/mantix,mlaf057we51-x.yaml
+++ b/Documentation/devicetree/bindings/display/panel/mantix,mlaf057we51-x.yaml
@@ -22,7 +22,6 @@ properties:
       - mantix,mlaf057we51-x
       - ys,ys57pss36bh5gq
 
-  port: true
   reg:
     maxItems: 1
     description: DSI virtual channel
@@ -36,13 +35,13 @@ properties:
   vddi-supply:
     description: 1.8V I/O voltage supply
 
-  reset-gpios: true
-
   mantix,tp-rstn-gpios:
     maxItems: 1
     description: second reset line that triggers DSI config load
 
   backlight: true
+  port: true
+  reset-gpios: true
 
 required:
   - compatible
diff --git a/Documentation/devicetree/bindings/display/panel/novatek,nt35510.yaml b/Documentation/devicetree/bindings/display/panel/novatek,nt35510.yaml
index b39fd0c5a48a..43d134daf0ac 100644
--- a/Documentation/devicetree/bindings/display/panel/novatek,nt35510.yaml
+++ b/Documentation/devicetree/bindings/display/panel/novatek,nt35510.yaml
@@ -28,13 +28,14 @@ properties:
   reg:
     maxItems: 1
 
-  reset-gpios: true
   vdd-supply:
     description: regulator that supplies the vdd voltage
   vddi-supply:
     description: regulator that supplies the vddi voltage
+
   backlight: true
   port: true
+  reset-gpios: true
 
 required:
   - compatible
diff --git a/Documentation/devicetree/bindings/display/panel/renesas,r61307.yaml b/Documentation/devicetree/bindings/display/panel/renesas,r61307.yaml
index 90cce221c0d1..3d7761717b74 100644
--- a/Documentation/devicetree/bindings/display/panel/renesas,r61307.yaml
+++ b/Documentation/devicetree/bindings/display/panel/renesas,r61307.yaml
@@ -33,8 +33,6 @@ properties:
   iovcc-supply:
     description: Regulator for 1.8V IO power supply.
 
-  backlight: true
-
   renesas,gamma:
     $ref: /schemas/types.yaml#/definitions/uint32
     description:
@@ -51,6 +49,7 @@ properties:
     type: boolean
     description: digital contrast adjustment
 
+  backlight: true
   reset-gpios: true
   port: true
 
diff --git a/Documentation/devicetree/bindings/display/panel/renesas,r69328.yaml b/Documentation/devicetree/bindings/display/panel/renesas,r69328.yaml
index 1cd219b510ee..740185f778a1 100644
--- a/Documentation/devicetree/bindings/display/panel/renesas,r69328.yaml
+++ b/Documentation/devicetree/bindings/display/panel/renesas,r69328.yaml
@@ -33,7 +33,6 @@ properties:
     description: Regulator for 1.8V IO power supply.
 
   backlight: true
-
   reset-gpios: true
   port: true
 
diff --git a/Documentation/devicetree/bindings/display/panel/rocktech,jh057n00900.yaml b/Documentation/devicetree/bindings/display/panel/rocktech,jh057n00900.yaml
index 4ae152cc55e0..ebfc825b8346 100644
--- a/Documentation/devicetree/bindings/display/panel/rocktech,jh057n00900.yaml
+++ b/Documentation/devicetree/bindings/display/panel/rocktech,jh057n00900.yaml
@@ -33,7 +33,6 @@ properties:
       # Xingbangda XBD599 5.99" 720x1440 TFT LCD panel
       - xingbangda,xbd599
 
-  port: true
   reg:
     maxItems: 1
     description: DSI virtual channel
@@ -44,9 +43,9 @@ properties:
   iovcc-supply:
     description: I/O voltage supply
 
-  reset-gpios: true
-
   backlight: true
+  port: true
+  reset-gpios: true
   rotation: true
 
 required:
diff --git a/Documentation/devicetree/bindings/display/panel/sony,tulip-truly-nt35521.yaml b/Documentation/devicetree/bindings/display/panel/sony,tulip-truly-nt35521.yaml
index a58a31349757..85c5dee65383 100644
--- a/Documentation/devicetree/bindings/display/panel/sony,tulip-truly-nt35521.yaml
+++ b/Documentation/devicetree/bindings/display/panel/sony,tulip-truly-nt35521.yaml
@@ -31,9 +31,7 @@ properties:
     description: Negative 5V supply
 
   reset-gpios: true
-
   enable-gpios: true
-
   port: true
 
 required:
diff --git a/Documentation/devicetree/bindings/display/panel/startek,kd070fhfid015.yaml b/Documentation/devicetree/bindings/display/panel/startek,kd070fhfid015.yaml
index 0819f38a9d2c..7fd9364fa385 100644
--- a/Documentation/devicetree/bindings/display/panel/startek,kd070fhfid015.yaml
+++ b/Documentation/devicetree/bindings/display/panel/startek,kd070fhfid015.yaml
@@ -16,8 +16,6 @@ properties:
   compatible:
     const: startek,kd070fhfid015
 
-  enable-gpios: true
-
   iovcc-supply:
     description: Reference to the regulator powering the panel IO pins.
 
@@ -25,11 +23,10 @@ properties:
     maxItems: 1
     description: DSI virtual channel
 
-  reset-gpios: true
-
+  enable-gpios: true
   port: true
-
   power-supply: true
+  reset-gpios: true
 
 required:
   - compatible

-- 
2.51.0


