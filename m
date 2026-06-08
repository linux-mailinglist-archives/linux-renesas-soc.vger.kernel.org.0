Return-Path: <linux-renesas-soc+bounces-33711-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yqRCCG0qJ2pbswIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33711-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 08 Jun 2026 22:47:41 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D4D765A855
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 08 Jun 2026 22:47:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=MGT7HmAO;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=FpS3M9uW;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33711-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33711-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 547EC306150E
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Jun 2026 20:44:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 132A43A3E60;
	Mon,  8 Jun 2026 20:44:41 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 646BE399890
	for <linux-renesas-soc@vger.kernel.org>; Mon,  8 Jun 2026 20:44:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780951481; cv=none; b=ixGj20ULK04DLR7VzfKxsSBZplETbSHD7EKEhQHz4xthtkNacqwZH2ObEH3P8FNEnOBBTZ18qqm5eiDL0zzwGD0UMkmBIM5wQt8eGmdfiY4CV6ZUns6Sd6XaqWC68YNcW96SRh92+9EJcB7dVoUxFnNPOvcRQyNjAhLYRYbQdoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780951481; c=relaxed/simple;
	bh=5Xa72kw9Ltgd7CByB7B5latAUb0JYhrgHD01OqlPHas=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=JtfyY3+E9RXqnnndeeHyFH75rxjB9mt1noPYQYludHEYEIOW/RPiD7JVvULk1ZmTIIL5LNI0jHKAwaLNHeNIn+EVQNZPKc+yl99F69fXKVf3jLdpVfz14gAlpWmKkDeI54ToOoQs/1SpuxQkFYsVhvMY6PCEY02nUFqEO6yPbRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MGT7HmAO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FpS3M9uW; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658IwguX326885
	for <linux-renesas-soc@vger.kernel.org>; Mon, 8 Jun 2026 20:44:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=JZcc6TPeUx/2ww8Z8bbTx4
	r6S+aoLRf/jpoC61OzVbc=; b=MGT7HmAOHcVdj0yATV7HMAwbU5uk4J313+T5nm
	84kICFmcHfToU9Lqm9Zj1W8my/y4+rF2I1dGopuun62rFv8Fw2trVIkKDB3yKySW
	qydpBOtZnfMRszANz62Pt50+mwOEp0Ujx4Zp18DgPJCVsRwORM4Er5MujfDwelpy
	ptJDMUpbk/tCmC6s1na0lS+aQUhoepuuYyFJBT0tP7qg8AZABd46rd0j/jD4sGWe
	Pih62qqCqyu29l++9QOUW7MKDU7kcjJF5AxMJXi8jD4J37DBGonSUMg6w0aopY6s
	ItlzeTEe2ujWvVOt4J54RBTMEjcYrpwJuSquw8sPHnljJNCg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enun8jvk8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Mon, 08 Jun 2026 20:44:37 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51768072950so66849451cf.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 08 Jun 2026 13:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780951477; x=1781556277; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JZcc6TPeUx/2ww8Z8bbTx4r6S+aoLRf/jpoC61OzVbc=;
        b=FpS3M9uWNviodCwpv2bLtoVECRrIQVkBxlMUstq/FCM6RxHg+e0vPAcN6CHwLPUegJ
         Mm76Rkr+yHt4v6VOPb3Xb5IQgzFFJ1QYU43evugRLHNOzYa7R9QZyK2hqMRScVi9/++D
         U+3DnDdnfzhWifpJeFW4EAVKll1DkfMZ6nWtPGsJh9v4h+ahc6hqKcUKT2byGpXBMpli
         KqPD4ApjbE7WAmtEs6qL49I+Xxxc//DczzqtbF20h45N9wLAoHC7JgCgz6b9nyg4nqEw
         DO4VpO12jDTk7mYgXfWPeZjdM5RrJXpibDGbVl7HTBb5lQZfy4tPosr9FIZgPZSgnAc8
         uwQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780951477; x=1781556277;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JZcc6TPeUx/2ww8Z8bbTx4r6S+aoLRf/jpoC61OzVbc=;
        b=UFGNgcXFVlV9TBKUluhyEHMd3sM/MrB9TQKUZG4RG4YCtPWTg5Z7OPjdrFQmswYTiG
         B/RPmSrcckPakbYkDh1Obxmfuzlqy3h732Kyp+McOG+jyFTShURYOFLgzAUih8GGEhfI
         0eYNQGSTzTQp3Pivq5nLv5X6o5r3X9fSdDVC3rECtPc4JBNistLfktGj/Z6BSCBDrxLE
         KVULE6hXp8+VmHEXHQBVHNQ+7tin2k1uurR6dFlOZcdmpx9Qa8nwa/HJA/KHCOlKW16s
         DGghjL/hARfO2QHwDNYUB4fq3GiUupPOj1dWvhQrMLimkambHCqry8lijoNfYkcR233p
         JR+Q==
X-Forwarded-Encrypted: i=1; AFNElJ+yQNsSe+QD23oRp0RUmcdOZiWmBkLGBK8PLclMmTKZb9gjOp29kn1vBJhU7UTyl8H41UHEk7Me56Cf+gCPf+XwMw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwMYkBq2TuBuwrKbxal6rxbNhO925vCKSZlCHqk3m+3f/9UT2FH
	oBwSVn8Ur2qIMQRKDKdhKaA142ebD1Po73ubhgHO4jSJAVsH1J29diVa7DwWcHDjXhnMVbIF70s
	Bd6OnEJUHufBdEYUbks5BYJyuJtA8OH2OAUQGJ56EM2S0V9cu7Uvfj9cxKW7xMY8g382E2TziYg
	==
X-Gm-Gg: Acq92OErJOSQeliyfAfIh1IUB6SQmxf9b/IUjlj9+IxaeItmTDzB31PxpwKe9lkGeeV
	U3tW2islIHhyMrUxJ1EDz6FlDjZ8wY5nkN+HCEhu6L4FTcrhPD0PE5ba+mhUQ62xHcSbuDXz1iJ
	kgV7iu1JtlA62qhdWA6x5Hx3fITcraFU321Ngb8mnisyaF6Ov5Sk5Nu6AhUD+DT32JagQDWJMQ4
	Fx4FdwBJd6AUGJWgMiuLUfgIavLgmWkP5dMxIHSREeKIBztKrBZKqaIcwzUYIjrAG64Qg7XYJpv
	dDNjyERTYUib4PMJMY+FZeXKEx+0IWmXAUEjkrxpbsR4/zsYR5RNBqDPOklHB6i1ySutd+npN/d
	YTJOjsr3FZ6udMVjtukbdg5H3CyOZAgo5a4l98jtZ+pb95q4VgYzl0rA=
X-Received: by 2002:a05:622a:1f90:b0:517:75d8:b95d with SMTP id d75a77b69052e-51795c0cf7bmr247057181cf.40.1780951476563;
        Mon, 08 Jun 2026 13:44:36 -0700 (PDT)
X-Received: by 2002:a05:622a:1f90:b0:517:75d8:b95d with SMTP id d75a77b69052e-51795c0cf7bmr247056621cf.40.1780951475888;
        Mon, 08 Jun 2026 13:44:35 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4602cda3651sm44018439f8f.32.2026.06.08.13.44.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 13:44:35 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 0/3] dt-bindings: mfd: syscon: Tighten checks
Date: Mon, 08 Jun 2026 22:44:23 +0200
Message-Id: <20260608-n-dt-bindings-simple-bus-syscon-v3-0-4eba9ec1212a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42OwQqDMBBEf0Vy7soSRbSn/kfxoMmqWzSxrkpF/
 PdG+wO9DPNgmJldCU1Mou7RriZaWdi7AMktUqarXEvANrDSqDPMMAcHdoaanWXXCggPY09QL8F
 uYrwDSgrbpJhXqK0KLeNEDX+uhWf5Y1nqF5n5rD0THcvsp+26sOoz9//aqgEBNSaUGZ0W1jy8S
 Pxeqt74YYiDqPI4ji9iGIV15wAAAA==
X-Change-ID: 20260608-n-dt-bindings-simple-bus-syscon-e39df408a02d
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Jacky Huang <ychuang3@nuvoton.com>,
        Shan-Chun Hung <schung@nuvoton.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Andreas Kemnade <andreas@kemnade.info>,
        Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>,
        Tony Lindgren <tony@atomide.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-omap@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1955;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=5Xa72kw9Ltgd7CByB7B5latAUb0JYhrgHD01OqlPHas=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqJymqXzctnjCZTlgfqtTkKkReZfSxm69dcth3s
 +3KPVCaK/qJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaicpqgAKCRDBN2bmhouD
 12o+D/9dEqmiBDrunvPNTigrYZ65joY0Y404B5kMuUHwxnjcIcSDy0bYTIMZus92hnmDEYvpC9U
 i2tw9EoYNrO1EeZYBOWcj+FJKTG5wLwU8EqAG5w3fIa2zQ5rVTe+zDoNtqRzLgckMUTIEZVoWSl
 xx/h49ZbzgXV9CJzte6U0Fp3ycwf0J/HUsNBQqNpdja+HyIoWu5Qd4HWIFShKkueEUH8KcNSwnJ
 1TC2Rn4T9MbSDCBS/0klhPlGPyYvR1WG42P3wjHdLDH8pUHPHYBBPrRNq85x/OK1BKmigWgYkam
 7ZIy5F0wlV+4bECVkaIfnFpsg2p78TeS9WWPQgGmIdmfb0GPbMkK9PkDozcrjmLEJk/QRny2IS2
 79lvO18dQiOU738h5JoKCuWKzvLCoBtiw627Gbqo21BHDrLWo8oF3ZWR3kXm5RUPVnRTQ8EVr7x
 F07R0Zx2p4W1tYV4zFk1IV+3EbHBSbfAJQle3zzH24lTJr8rOPXXbnu+2F2CbirwcO++zy7xoTb
 dXOxD+QhaGr6V/LYklyLnTx9IdHl0LJsEnzLdfpfUal5h6SuMSxFInElOpARadLe8wgkHeegyap
 mybKDxrB8IWZUlFjKaqVHhruAjaUBKUEjuTpgmBT44Z5ACshQzaraQj4ifeRN4qFcde73irdf/H
 QC7QfMmQpvt0MRg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDE4OCBTYWx0ZWRfX+wDesJLw9lx1
 edWDvN4dLt+R/lm6Vnaz+/3IfI9HRd/C5b+6dU03iw+vP2pqv31mXjfgPwojSzqsgwukOsDE4yF
 vH9uc2G1tBy81/+y5/PqwCnlXDM6LWVmpZcApfh6VRsvl4LuPik3YeeZvP2i4o0mgsQqXoqzp25
 JgeWurR9l+8PGCZXcYIjEZQR7npHNd9ZP8IL5fAtUZrb6eyzsbFjZYOdibHNUIQe47E47K6uMRa
 q7Z6/NrFV9QLwgkr8Qu2N+Eb6jw+h5XvO0/6lQ/65m3rFXX6yK7SV5T6rXOcP8K8OOB0LB7DM3e
 E5AHKtRpNB0wsDbyxNdfewfX62Ra5q4CgHbimp2/znr6oN/v3J3QFfse4sL2OthJtuI358hyoMr
 47mI17Fzj7SeOGRzAKeh9NvXzqTEDuHZ12GEPsQgIoRpqLf2IB4dojnYdU2gpSLW+jhhTEZxn/0
 VuthjDxQ4/d0peVbu3A==
X-Proofpoint-ORIG-GUID: 1IyHMjFSNkEpOceDGf19htSLozW3ZzJy
X-Proofpoint-GUID: 1IyHMjFSNkEpOceDGf19htSLozW3ZzJy
X-Authority-Analysis: v=2.4 cv=Z7rc2nRA c=1 sm=1 tr=0 ts=6a2729b5 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=s4keiGDSzyMyFUzW_nEA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_05,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0 adultscore=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080188
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33711-lists,linux-renesas-soc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:ychuang3@nuvoton.com,m:schung@nuvoton.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:heiko@sntech.de,m:aaro.koskinen@iki.fi,m:andreas@kemnade.info,m:khilman@baylibre.com,m:rogerq@kernel.org,m:tony@atomide.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-mediatek@lists.infradead.org,m:linux-renesas-soc@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:linux-omap@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:matthiasbgg@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,collabora.com,nuvoton.com,glider.be,sntech.de,iki.fi,kemnade.info,baylibre.com,atomide.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8D4D765A855

Changes in v3:
- Drop patch #2:
  dt-bindings: mfd: syscon: Drop unneeded case for syscon + simple-mfd
- Bump dtschema requirement
- Link to v2: https://patch.msgid.link/20260608-n-dt-bindings-simple-bus-syscon-v2-0-0203e6c249dc@oss.qualcomm.com

Changes in v2:
1. New patches #2 and #3
1. Add missing part of patch #1, thus not adding Rob's Ack.
https://lore.kernel.org/all/20260531110404.12768-3-krzysztof.kozlowski@oss.qualcomm.com/

I tested dt_binding_check and dtbs_check for arm, arm64 and riscv and I
think I did not introduce new dtbs_check warnings. Old code anyway has
multiple abuses of syscon, thus tricky to judge for arm at least.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (3):
      dt-bindings: mfd: syscon: Disallow simple-bus with syscon
      dt-bindings: mfd: syscon: Drop custom select for older dtschema
      ARM: dts: ti: Add specific compatibles for SCM conf nodes

 Documentation/devicetree/bindings/Makefile         |   2 +-
 .../devicetree/bindings/mfd/syscon-common.yaml     |  34 ++++++
 Documentation/devicetree/bindings/mfd/syscon.yaml  | 116 ---------------------
 arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi           |   2 +-
 arch/arm/boot/dts/ti/omap/am437x-l4.dtsi           |   2 +-
 arch/arm/boot/dts/ti/omap/dm814x.dtsi              |   2 +-
 arch/arm/boot/dts/ti/omap/dm816x.dtsi              |   2 +-
 arch/arm/boot/dts/ti/omap/dra7-l4.dtsi             |   2 +-
 arch/arm/boot/dts/ti/omap/omap2430.dtsi            |   2 +-
 arch/arm/boot/dts/ti/omap/omap3.dtsi               |   2 +-
 arch/arm/boot/dts/ti/omap/omap4-l4.dtsi            |   2 +-
 arch/arm/boot/dts/ti/omap/omap5-l4.dtsi            |   6 +-
 12 files changed, 46 insertions(+), 128 deletions(-)
---
base-commit: 78f5e68a8d0a1123dd1b007688ccf0e6876a5c15
change-id: 20260608-n-dt-bindings-simple-bus-syscon-e39df408a02d

Best regards,
--  
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>


