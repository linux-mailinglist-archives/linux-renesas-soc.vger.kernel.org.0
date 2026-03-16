Return-Path: <linux-renesas-soc+bounces-29487-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cPwvGJoJuGkWYQEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29487-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 14:46:02 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 050EF29AAFE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 14:46:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E59A3301137B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 13:45:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D67F0397E9F;
	Mon, 16 Mar 2026 13:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GIwNuJ/d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TIQmzHRA"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D45FF21D3E4
	for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Mar 2026 13:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773668747; cv=none; b=DQqz4HHuFu/nmTWUG3T39L7DR9xcGf+xMNNC5bTOxgZStFTDWeZIk3g4cow3ZiD+8++FuoaAsVmsUvwmf5qaLg7/Hxq7fIeoWPqSb517z82IH84dAbdwParnvrk9pVpxPBx5Qi7w/VWehTVeYOdPY226CarVh2dDWVbhUziDD5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773668747; c=relaxed/simple;
	bh=t8h9C0qrhILq+5Zys16fRrCe9qjnoZrF/6Ha+44N1jI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YIwvoynL5Op9Bi8If0zw8uBA1L4hbqoTNtUvgihGe3AcG80FhUiPYxbAdiNvp/6R6Dd2zoTSrTO3G0V3NpRnLSmpZNDAD07b0O60AHxBK1yh7cxHprsOlhUGK2XXFcDIuOEtx3GOXGvQmGv65F1XY8az+q+RSgvEi8j7JKgKlTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GIwNuJ/d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TIQmzHRA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G7n24d041968
	for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Mar 2026 13:45:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=GP1eV7PL30/lxFgTAbjPosrwLpCstR2UQ+g
	SV7rTO4s=; b=GIwNuJ/d0zJhJbQyNiUk5I4IVNuselKxgn1qsjJ13Cz2B3mlV+i
	DHGh0bJLsoKYiURZ/GiUarP2+ShGv5uxka+dnwW02AUPIKVVHELj2k06rRawxIIi
	7ppkGbQvntkJXQFChrXgMRl/NLB880cHdGvYXmSyAerhZps4oO/LWD4R9jyOh47u
	znMfpinQYiVa6KtxsLkMsoBEa+0tl+LlrpN5NcnviAgslTXcwvA2n7e72TVFYz6m
	7DvF25s+m8l0ZZLdq33+D5BKTesWEegsfbRpTFs2YvUWD9YcjUI6Xfy/0CKHRnMl
	4iJfwtB2mkS/ompbWng4vABuCmiwQ3/bGXw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxdt81c9c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Mar 2026 13:45:44 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-89c4ec516e5so182368176d6.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Mar 2026 06:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773668744; x=1774273544; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GP1eV7PL30/lxFgTAbjPosrwLpCstR2UQ+gSV7rTO4s=;
        b=TIQmzHRAcMOCkMfYLweByEwKjUL4ap8V6N9w38NOl+2Oh2Wyuiu1o6nD0y5suj9r4m
         DhaGoQuwdjHMaL6vlb4hmLuVeP17/e0eQsJojmU1NyqsFc2vCLJIb66tk7CfLAvEe7jz
         iRL3lwaMXl0p9fq/u6JqLZS9VNtmM89GlXYjiLnbJUxebmPVY0E75cHRXNwIS3uNa044
         JxVwItpZu05jE0Va/IiLzy5qRXR/ABTBWP1aHqoXyykC5O8hb60+alvaU2SN46gTd7MZ
         arMrInfqcvOn63y4obtUWlWqDxIh9tL/zyovDPMe/bNonQWSumWD0MumiAeDqz7XHo/Y
         QNCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773668744; x=1774273544;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GP1eV7PL30/lxFgTAbjPosrwLpCstR2UQ+gSV7rTO4s=;
        b=hhw4yU4l1QLRhyDZ6+65NEiGHhuGH02ETUv6lKUfOhmlSqjasINfeLNnCtNIWwwQTi
         G5xT5lSBP8rdZpj7B4zcKVx0nScfvwxGrxIgBU1+193D1k0+l8h8EmiNYVoDKVPFnpuV
         uY8qrdiLAd7rAu9m6FLEwrBLwuVT5csKRarFaRvAMgXcFgZ+FK/wboVxHLMmWxwFmGoe
         CA0s/ddRgDvtcFvxcdLP/PvY87ZnDeD6dbdndjiK3ZwSFIlnqpN4PSWPP/fS8hGbt3cp
         uD3KxFja3QoAh8NlN5O6/RCPta2mvuY6y+WFH/qBfI5o50rK1aysxSA5lb2aTpGSa+XU
         tNnw==
X-Forwarded-Encrypted: i=1; AJvYcCXxRO/z7zh9TgAcGhL8mkNrP1ROKjttQHlHOwGBIOZdi654LwTt93pRFzZq6slU8UOrbJ6pP68Nuu07rXVZQGUkbA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyTp3ZVm960d9fRWu8mr4qo4C7izxGRZ6E3uHjFvl+MPhAypEsv
	00Oc57M07L2PZWqa7iysRacJBtV2Xdy8vwybgABlm77f6jaLkzo9GYgbq93KFoAED2wvXaLjSMt
	CrVI/iO/mUu+K7h7bwgmkgDzBzjJH8oqD41dANMi98GLLsaWgYD+O7hHl7HCYXgkUyRct6x1yHA
	==
X-Gm-Gg: ATEYQzwgdN9bqMufjBBpBboP4zR4fopFBTbWS5ueBx/zK0d2b/Ak7D606MpYXyoIA2i
	j/acujkftKkloVeN2q43jVvKuFeMuqSQBNQ9s3gB4j/MYYrduyQJigJDPpXBEAcoZI+XguHC5QH
	DDdFoKXRriqkBHbLrY4pkzKAUCkFEjf4DF6ChL4iIq+RfEpYYZj+57NAPlhBJE/+s8koPdI/C+B
	kOlbZD5tJojhIOUdoseCRpB44yH3m4z4JA/jtKovXbBvXd+P6UudLjr1PmdrTd1HJO/ORcuXwRA
	m1T3gFGLScvR2G7L7+vloC79jD/6pg7CozjE+VLnGJ2F40SeZMOb0E5aKQNEHu8gfZaJCM1GSLM
	GII/2DuAG2bXYSvj+mdqePPStTvjOLWE5qlKB
X-Received: by 2002:a05:620a:7103:b0:8bb:1a5b:5a47 with SMTP id af79cd13be357-8cdb5a4abd1mr1692420385a.17.1773668743553;
        Mon, 16 Mar 2026 06:45:43 -0700 (PDT)
X-Received: by 2002:a05:620a:7103:b0:8bb:1a5b:5a47 with SMTP id af79cd13be357-8cdb5a4abd1mr1692414785a.17.1773668743019;
        Mon, 16 Mar 2026 06:45:43 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b416e3678sm14307231f8f.17.2026.03.16.06.45.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 06:45:42 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Tommaso Merciai <tomm.merciai@gmail.com>,
        Martin Hecht <mhecht73@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Sebastian Reichel <sre@kernel.org>,
        Alain Volmat <alain.volmat@foss.st.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Quentin Schulz <quentin.schulz@theobroma-systems.com>,
        Todor Tomov <todor.too@gmail.com>,
        "Paul J. Murphy" <paul.j.murphy@intel.com>,
        Daniele Alessandrelli <daniele.alessandrelli@gmail.com>,
        Marco Felsch <kernel@pengutronix.de>, Lubomir Rintel <lkundrak@v3.sk>,
        linux-renesas-soc@vger.kernel.org,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 1/2] media: dt-bindings: i2c: Drop redundant endpoint properties
Date: Mon, 16 Mar 2026 14:45:34 +0100
Message-ID: <20260316134533.56941-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=11781; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=t8h9C0qrhILq+5Zys16fRrCe9qjnoZrF/6Ha+44N1jI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpuAl9YgBvP32SjYWo80scAqVVEVAf3vCg36Tgh
 00ORW56KwyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCabgJfQAKCRDBN2bmhouD
 12IwD/0YGAwVGszr0xaWr778UXYyxWM3NBBhAE0GyZhy3Apy0zpcIKBwlLycZItBw6M9p9r9ijH
 Ukikbu5fVSKjZ+yKGvsoPo9IV53t6mwhSB+U9B/3+MeEa5Hvu7DdoBcPXCIF0ZrUMGBcK/BA8Z9
 0F2M38hSuSQaniKB5W4n0GhHke/Ffmz2MWg2YI0N68O7E8Z3PsVKObQNPpTG+uy4kUP1+fy3eB+
 nmLlRFK96RGxiYSy+DVFEjkRJ+IqpXdpjUYd5nUi1tEjNEbvxOv4ghaI1l6kFCobhikCRlcbqln
 KrzCjECNNFQkwmdA2cDt7ltiYgiX7VzDadTfRL29qyj8TM/HqWNEBFtGpgkiJdvXS9YjteYZVwC
 RWZgRygb+TVskiFJ8/AkuVBMb1bCisFgZtPM3DkhyjEyBtgEaGOvUL8TV+zM2zs+Z/g2Uc2QpqK
 ePk3GPFf7rcQk5G4Bh0h25WTDOPw/yd/wSFoiGRNY4y/u4U//pToYbU/HwAWXlvDffsRuTuA0nC
 GzMa7R6ljF8ILfG2Me8ddwTrbty1a6xjCPuczkeui17n3YeC9hswAdZyl81H0+HlRRbhk00YYuV
 LZNvzPKasQnbdf+fvkMvhJGVeVOjMTdt9U2YhXYWacrCAEZoei+DjXKbWNN3qGJVt+WUD0NGwCb /psZdl3mwmr6R+Q==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: up53aGWwb9TVrz74MAq1rp2SmS-qP55w
X-Authority-Analysis: v=2.4 cv=CKInnBrD c=1 sm=1 tr=0 ts=69b80988 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=RqNHlvAEXZaMOB3n50YA:9 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: up53aGWwb9TVrz74MAq1rp2SmS-qP55w
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDEwNCBTYWx0ZWRfX2UC/qIRTM/tu
 wNiNnfZRuR8DmJv+ZHl4R7tdCn2BEird6Gflo8xGdr6IlTGUHxBAUipIbEYYjfj7gBcxbcWhZOV
 PDODaRkDQ5fMOpfTIBM2E1u3yZxU4LChTfa49d5rt2PNqIbwqcmVTb3Y/Odu0VXyugDqoJtnrYX
 EPEYnHtjwuXaLoikebMMEKx0/nzWXF1AVMUqNmZb5aC26F+GUFLG8N3iRTUkHGDTPmxH1THZL6k
 j+03GriJgmKiUWpy9Gwqu6roico2VlK2msPyY6OEn7lhb86owRxxPO+zVAOytLZ6+0RrZOFVIBE
 zOoS7L7MTQz/aBb6U+5e9MylmmrcAJj0HFzpI8CU39Qyrnt+nXFhbscqWA6w/2Ge0Dl+bu9dHOp
 RdmAsj2qobCJFsEIYmxEzzIx1hQg9hZxF2sHTYfeqCYP+UUKOMO/cZ48NxGRf2Y40OUHLgDlqG0
 cI9qNQrgh5wt9oeTY3A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_04,2026-03-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160104
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,foss.st.com,jmondi.org,ideasonboard.com,ragnatech.se,linux.intel.com,raspberrypi.com,glider.be,linaro.org,mediatek.com,bootlin.com,theobroma-systems.com,intel.com,pengutronix.de,v3.sk,vger.kernel.org,bp.renesas.com];
	RCPT_COUNT_TWELVE(0.00)[31];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29487-lists,linux-renesas-soc=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 050EF29AAFE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The "endpoint" node references video-interfaces.yaml schema with
"unevaluatedProperties: false" which means that all properties from
referenced schema apply.  Listing some of them with ": true" is simply
redundant and does not make this code easier to read.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/media/i2c/alliedvision,alvium-csi2.yaml      | 2 --
 .../devicetree/bindings/media/i2c/galaxycore,gc0308.yaml  | 8 --------
 .../devicetree/bindings/media/i2c/galaxycore,gc2145.yaml  | 3 ---
 .../devicetree/bindings/media/i2c/maxim,max9286.yaml      | 3 ---
 .../devicetree/bindings/media/i2c/maxim,max96712.yaml     | 1 -
 Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml | 2 --
 .../devicetree/bindings/media/i2c/ovti,og01a1b.yaml       | 2 --
 .../devicetree/bindings/media/i2c/ovti,ov02a10.yaml       | 1 -
 .../devicetree/bindings/media/i2c/ovti,ov5647.yaml        | 3 ---
 .../devicetree/bindings/media/i2c/ovti,ov5648.yaml        | 2 --
 .../devicetree/bindings/media/i2c/ovti,ov5675.yaml        | 4 +---
 .../devicetree/bindings/media/i2c/ovti,ov7251.yaml        | 2 --
 .../devicetree/bindings/media/i2c/ovti,ov8865.yaml        | 2 --
 .../devicetree/bindings/media/i2c/ovti,ov9282.yaml        | 4 ----
 .../devicetree/bindings/media/i2c/sony,imx334.yaml        | 4 ----
 .../devicetree/bindings/media/i2c/sony,imx412.yaml        | 4 ----
 .../devicetree/bindings/media/i2c/toshiba,tc358746.yaml   | 5 -----
 17 files changed, 1 insertion(+), 51 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/alliedvision,alvium-csi2.yaml b/Documentation/devicetree/bindings/media/i2c/alliedvision,alvium-csi2.yaml
index d3329e991d16..c2ae33532700 100644
--- a/Documentation/devicetree/bindings/media/i2c/alliedvision,alvium-csi2.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/alliedvision,alvium-csi2.yaml
@@ -35,8 +35,6 @@ properties:
         unevaluatedProperties: false
 
         properties:
-          link-frequencies: true
-
           data-lanes:
             minItems: 1
             items:
diff --git a/Documentation/devicetree/bindings/media/i2c/galaxycore,gc0308.yaml b/Documentation/devicetree/bindings/media/i2c/galaxycore,gc0308.yaml
index 2bf1a81feaf4..fcf79f4c5a0d 100644
--- a/Documentation/devicetree/bindings/media/i2c/galaxycore,gc0308.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/galaxycore,gc0308.yaml
@@ -53,14 +53,6 @@ properties:
         $ref: /schemas/media/video-interfaces.yaml#
         unevaluatedProperties: false
 
-        properties:
-          bus-width: true
-          data-shift: true
-          hsync-active: true
-          vsync-active: true
-          data-active: true
-          pclk-sample: true
-
         required:
           - bus-width
 
diff --git a/Documentation/devicetree/bindings/media/i2c/galaxycore,gc2145.yaml b/Documentation/devicetree/bindings/media/i2c/galaxycore,gc2145.yaml
index 9eac588de0bc..ccac2cb85d57 100644
--- a/Documentation/devicetree/bindings/media/i2c/galaxycore,gc2145.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/galaxycore,gc2145.yaml
@@ -58,9 +58,6 @@ properties:
         $ref: /schemas/media/video-interfaces.yaml#
         unevaluatedProperties: false
 
-        properties:
-          link-frequencies: true
-
         required:
           - link-frequencies
 
diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
index a37447256f8d..d806b821dae3 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
@@ -137,9 +137,6 @@ properties:
             $ref: /schemas/media/video-interfaces.yaml#
             unevaluatedProperties: false
 
-            properties:
-              data-lanes: true
-
             required:
               - data-lanes
 
diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
index 26f85151afbd..4b9afc73de62 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
@@ -67,7 +67,6 @@ properties:
             unevaluatedProperties: false
 
             properties:
-              data-lanes: true
               bus-type:
                 enum:
                   - 1 # MEDIA_BUS_TYPE_CSI2_CPHY
diff --git a/Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml b/Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml
index 217b08c8cbbd..9ba8a17c62e0 100644
--- a/Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml
@@ -78,8 +78,6 @@ properties:
         unevaluatedProperties: false
 
         properties:
-          link-frequencies: true
-          data-lanes: true
           bus-type:
             enum:
               - 1 # CSI-2 C-PHY
diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,og01a1b.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,og01a1b.yaml
index ca57c01739d2..efdac2e91589 100644
--- a/Documentation/devicetree/bindings/media/i2c/ovti,og01a1b.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,og01a1b.yaml
@@ -64,8 +64,6 @@ properties:
             items:
               enum: [1, 2]
 
-          link-frequencies: true
-
         required:
           - data-lanes
           - link-frequencies
diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
index 0e1d9c390180..b98260d5e6a3 100644
--- a/Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
@@ -81,7 +81,6 @@ properties:
         unevaluatedProperties: false
 
         properties:
-          link-frequencies: true
           ovti,mipi-clock-voltage:
             $ref: /schemas/types.yaml#/definitions/uint32
             description:
diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov5647.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov5647.yaml
index 2d7937a372a2..7a05a1eda58d 100644
--- a/Documentation/devicetree/bindings/media/i2c/ovti,ov5647.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov5647.yaml
@@ -51,9 +51,6 @@ properties:
         $ref: /schemas/media/video-interfaces.yaml#
         unevaluatedProperties: false
 
-        properties:
-          clock-noncontinuous: true
-
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov5648.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov5648.yaml
index 8028c8b107c4..ec53e55b2290 100644
--- a/Documentation/devicetree/bindings/media/i2c/ovti,ov5648.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov5648.yaml
@@ -48,8 +48,6 @@ properties:
         unevaluatedProperties: false
 
         properties:
-          link-frequencies: true
-
           data-lanes:
             minItems: 1
             maxItems: 2
diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov5675.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov5675.yaml
index ad07204057f9..90b2c6d35df6 100644
--- a/Documentation/devicetree/bindings/media/i2c/ovti,ov5675.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov5675.yaml
@@ -21,6 +21,7 @@ description: |
 
   This chip is programmable through I2C and two-wire SCCB. The sensor output
   is available via CSI-2 serial data output (up to 2-lane).
+  It supports max data transfer of 900 Mbps per lane.
 
 properties:
   compatible:
@@ -67,9 +68,6 @@ properties:
             minItems: 1
             maxItems: 2
 
-          # Supports max data transfer of 900 Mbps per lane
-          link-frequencies: true
-
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov7251.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov7251.yaml
index 922996da59b2..0ad271a4bf39 100644
--- a/Documentation/devicetree/bindings/media/i2c/ovti,ov7251.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov7251.yaml
@@ -63,8 +63,6 @@ properties:
           data-lanes:
             maxItems: 1
 
-          link-frequencies: true
-
         required:
           - data-lanes
           - link-frequencies
diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov8865.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov8865.yaml
index 320b9aacbb8b..c535a5257a3e 100644
--- a/Documentation/devicetree/bindings/media/i2c/ovti,ov8865.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov8865.yaml
@@ -48,8 +48,6 @@ properties:
         unevaluatedProperties: false
 
         properties:
-          link-frequencies: true
-
           data-lanes:
             minItems: 1
             maxItems: 4
diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov9282.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov9282.yaml
index 401c8613f840..20dc0885e30e 100644
--- a/Documentation/devicetree/bindings/media/i2c/ovti,ov9282.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov9282.yaml
@@ -53,10 +53,6 @@ properties:
         $ref: /schemas/media/video-interfaces.yaml#
         unevaluatedProperties: false
 
-        properties:
-          data-lanes: true
-          link-frequencies: true
-
         required:
           - data-lanes
           - link-frequencies
diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx334.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx334.yaml
index 3842e5130463..e90ebe6a0a24 100644
--- a/Documentation/devicetree/bindings/media/i2c/sony,imx334.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx334.yaml
@@ -40,10 +40,6 @@ properties:
         $ref: /schemas/media/video-interfaces.yaml#
         unevaluatedProperties: false
 
-        properties:
-          data-lanes: true
-          link-frequencies: true
-
         required:
           - data-lanes
           - link-frequencies
diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx412.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx412.yaml
index 5447ab0768a6..dec428d46937 100644
--- a/Documentation/devicetree/bindings/media/i2c/sony,imx412.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx412.yaml
@@ -52,10 +52,6 @@ properties:
         $ref: /schemas/media/video-interfaces.yaml#
         unevaluatedProperties: false
 
-        properties:
-          data-lanes: true
-          link-frequencies: true
-
         required:
           - data-lanes
           - link-frequencies
diff --git a/Documentation/devicetree/bindings/media/i2c/toshiba,tc358746.yaml b/Documentation/devicetree/bindings/media/i2c/toshiba,tc358746.yaml
index 1c476b635b69..505c6d22ef7c 100644
--- a/Documentation/devicetree/bindings/media/i2c/toshiba,tc358746.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/toshiba,tc358746.yaml
@@ -78,8 +78,6 @@ properties:
             unevaluatedProperties: false
 
             properties:
-              hsync-active: true
-              vsync-active: true
               bus-type:
                 enum: [ 5, 6 ]
 
@@ -103,9 +101,6 @@ properties:
                 minItems: 1
                 maxItems: 4
 
-              clock-noncontinuous: true
-              link-frequencies: true
-
             required:
               - data-lanes
               - link-frequencies
-- 
2.51.0


