Return-Path: <linux-renesas-soc+bounces-34727-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0O0GBh6TSmoqEwEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34727-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 05 Jul 2026 19:23:42 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3491070AAA4
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 05 Jul 2026 19:23:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=DJHctmdS;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="Z2qNC/98";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34727-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34727-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1B8373013881
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  5 Jul 2026 17:23:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BF912E6CC8;
	Sun,  5 Jul 2026 17:23:38 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 214B026A0B9
	for <linux-renesas-soc@vger.kernel.org>; Sun,  5 Jul 2026 17:23:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783272218; cv=none; b=fGw278JEnuNbeLvP536RQKqAzNj5dLu3VM7Beyt5PvqYNosuCBNOM2WGOyqBhrdRG5qSmXB+CWrlmuvcu6D5En0xlnHCU3Q6zybmifcGCHE1f/MgvshlxxjidR3aUIJMkPi7t7K5vQ2CM8qGT5kwGjRGr3QfDlsqSsSZMy6D70Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783272218; c=relaxed/simple;
	bh=c6bm1dsiT0qu8+eII7cc1Rx67c2BU6sOtQgyUeNcf3g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Qauz4n7z0cwl3y9jiGZEEYEkJ2GsgCwEMLNc++6TFzvjD3j8ecMs379RW6YzhV4ZthhTXbUOS3UypBLvHs6WJUMrrpmoV/ijsSiPI2SrJgTXF8DOV9aWUGiKf3Tn3uwjREQK56xBnE68qrpj4xLLycWJEJl1TWIH5nA2UAU0Ra8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DJHctmdS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z2qNC/98; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 664NKG3E4103135
	for <linux-renesas-soc@vger.kernel.org>; Sun, 5 Jul 2026 17:23:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=g7B8TrormH567/TTPoHuj+TNmaAfVPNXio7
	B8SeVx6k=; b=DJHctmdSbBWYfkrBTlhAMlof1IwZs2AvFIQRU1Y7u/OMXsaokEV
	kjju861Noe5lm7PQx+ZGcpYOdJwSKzjUjVjDe9q793RrJ1VjAqdpuoVw/cVpfWM0
	DOrfaN53Oblf3pNg9OUVDEJS3XjgbcMJ/SkmKdy7OPsxZW9gnTl1E015QVhHPkT4
	1NaXiPXCY3pqcwgwCDy9J5fAMCKq/4/6y9RsvzqSsbUWnqQVHG9N39YmzhbGvyBY
	pBkIZVHRes/86UHugLR99p+HwC8mjVl85FBzyBdz0/xPRPdqugmMGwiXunFoY/QK
	7sx1toTgWw2sTHGBxJ3g0O+7fWJpSCG7nsg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6ubgjxh4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Sun, 05 Jul 2026 17:23:36 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e695a3b28so323108585a.1
        for <linux-renesas-soc@vger.kernel.org>; Sun, 05 Jul 2026 10:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783272215; x=1783877015; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=g7B8TrormH567/TTPoHuj+TNmaAfVPNXio7B8SeVx6k=;
        b=Z2qNC/98LsDiQV5bGff7MIX98Pd1g/ZDSzrgvEXkae6xJiBFA+iedM2l03W8h5QBpV
         maqVj2XcbnfWLPWD3qQMUu6PaGAPRgAiDC37nb0bEd0BAbkoH50FTuNW32ogotQMVwOR
         EJsFDypPywbOhz0YDVakK8IKjfKQXUwIdKumc8oV5brIlNoeNgX5ozojdu9TET35UVbS
         99V8RfSrNFLwzeDzOzmG/kziYDUXdWa7IcxiW+oo+CKRm7RJunM/KRlv8YD0PXcsGjH3
         US0tVyeV5OgaQmfwUHak3COsr5F7n9U1ien7Ox90Zjbje93h6VbV3xHXTOV7j/1H2RSM
         UJgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783272215; x=1783877015;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g7B8TrormH567/TTPoHuj+TNmaAfVPNXio7B8SeVx6k=;
        b=FetLG8orzEMbKUx/xjOK26dX5vmiUV9u48AqFZFM3aMA7hji45M2ggFFpQzMc3w2wM
         NhET7M5ceVIpWNZGpQvEBsYyo3SZCSVQ2Z9q1l+o+8MbREJBhEXFNqmjq2v6XFAKZDok
         UBPHbt6Hy0utqFWevV3WgwhCcI22ANvWsEY/zbgnq6IMwAcFPcpRti76WONkBiSjiy/t
         lMhK4MqUuC+bqjOr1wGWh6R1FGbOho2EVKkgS49j76dZj2hLDQXvrxF6hHFXBfK3eaDW
         Pc1YHYusKUhx5fDvgk+IlagSQLKOHotFnDrXBrFOnZJokHiTP87CHK0qv24SKM08sNuP
         xaaA==
X-Forwarded-Encrypted: i=1; AHgh+Rpjo/dx/y5+qCXZ1oriAtOAC9JlG8pwVAZ8AkxJIpQKEtewHFuHl/OkdVxQH1GSxCwXeuXa2vWAt7mibzuG94eu0g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4UOpMjzSOzpbq9DuT2K7swlIfESxbgOre2gB4nxGGR/+jGFTX
	frp0ty7o/oPc2wk45EAPHC8YTj7+X+N0WcSHPKVgLL0uLFFN8nIXU16pk4TDQcZpqbyB1coOx9b
	JeeyIgJCsf9B9Ym74+cpY1+Uld93q+KNI9sFOY+B+Bs87ZDEoSWlfH3qfpxchEJoS/TE3BKlpag
	==
X-Gm-Gg: AfdE7cmqjTnlQq31MV0OI4gSa3iVTdBXjp7fEkjvPakrPQyIkg++Q7qeCjCyMPzcZv5
	wd7dc8NedfW9Vd2vEjMJ8vOw1OMjo15BxleENNpkrV76MuQdkT8QGBB8EqNm5Ale/dvnJMO749a
	ayNmQRKPK0xJdhZHoHWYOwC3ckn5I44I1IGjbmpPZ0hyafUsJWKAq+s63I/kEnMhSFzvxTfnajE
	wd2ZGBuB9t0sNBoStaRiyVJP8DEvuc6ClN95UVl+dFWM38AVWJNlLT8aSBJF0Fq9GzTtXdwAaU0
	vtn6+Gc8BgPBWdUDxNKrSmoXVLgBgncOuTPZVnsYvLW1yMfu1/8yA5d49EqJwjoFWdd0h8uszwj
	1BaZkDPN2z+Nd7WpAE8yN3DtzjBg=
X-Received: by 2002:a05:620a:468f:b0:92e:754e:226c with SMTP id af79cd13be357-92e8b5d77f0mr1438786385a.44.1783272215497;
        Sun, 05 Jul 2026 10:23:35 -0700 (PDT)
X-Received: by 2002:a05:620a:468f:b0:92e:754e:226c with SMTP id af79cd13be357-92e8b5d77f0mr1438781785a.44.1783272214738;
        Sun, 05 Jul 2026 10:23:34 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493cce12c40sm365840195e9.13.2026.07.05.10.23.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 10:23:33 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 1/2] ASoC: renesas: adg: Drop redundant NULL check on clk_get and clk_register_fixed_rate
Date: Sun,  5 Jul 2026 19:23:26 +0200
Message-ID: <20260705172325.118926-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1433; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=c6bm1dsiT0qu8+eII7cc1Rx67c2BU6sOtQgyUeNcf3g=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqSpMNJX9Nw6UMueesp8jAoVeKYHs7wIeEouITc
 R0JZszRoy2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCakqTDQAKCRDBN2bmhouD
 1x+cD/9Z+y6QVfiPBRM1knLHodV4nbFmdlDDSXA9INJA5AF+H30pt+h0pNEU0ktYESRpaYUa3VT
 VtQJP8oXXAWzaP9qu97ztD6baLRbjTobXGRluJzg+7Fiks1iQ17loPapzDbsFSJDF1BpD3plIwG
 xaVmXXtIQ5Us2gm+n+jgFLjGZJjxoiQ2CH7Y96VZPLxFMjQ5g9fgNHHbYeathpniu7CEIXX5QYw
 cAQVD145RUjejqaGtgs+bQjYcrn71iCc3FV6j0ajrmuDDhDiEedMHY4e/yWO3lTbkzDBlg26aIx
 usC1ouG3Uh2jDLTIhXTaLRBZuZMGoq17/m5e6f1r3WXYXyt8q4stRUAS9/CZDg13F3xCt70GI4O
 Nwzrwu38yBjCA62iXcr5XU/qsfOyHJutqTs/Z1z+oQckif1kcLy6FK8jbwY5ok3mVs8ywzsMGio
 aT1e08aAieQsI8U7V35Rp5fgXeWToFRYO42uY3QZuRs0WMxjR25SkQxu8tvT7xcw4lJ9rCrtkz0
 qrt8Eck2uct6iMeicT4vm+1K80O6L7va9Yp34erK1D/MrETP/aLd9QX7RyWGYT/8tYl+2u+Sj28
 RN2Aqmc3QrdJFci3nDPe9bfyGsssE4E+xZwg1WzGOvdFvyMV1FsFS+9n0pTJ92YkPbHZGWqlduf ES8YwET0OMTjf0A==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDE4NyBTYWx0ZWRfX9u+PlMiFk3Vv
 W7ssJnQnd/P4hWq0EPlhEiHAUEhXNdQt3/v3WhyLncyo8S6IrlVaYbxq5W6cmkarYX9aFN1nBoD
 7FpISuSESgNu1A5hr9gx6SSH5EhfKqY=
X-Proofpoint-ORIG-GUID: sr4WzmHuVUCJhRSMUX3d-fIc0F2gFP0V
X-Proofpoint-GUID: sr4WzmHuVUCJhRSMUX3d-fIc0F2gFP0V
X-Authority-Analysis: v=2.4 cv=FJwrAeos c=1 sm=1 tr=0 ts=6a4a9318 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=2Cth1FtITvL5ni5luVUA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDE4NyBTYWx0ZWRfXyv1+MKPSYB4N
 wuTqViIR3ZjRNIQeaJhKz+9UO5fugJRbIVLYxgKZNILRFCQgelCc2Gl+I6ZoMLWsRxo115jukB6
 oqt2f2J6OvSQUlvjf/mtDJavdy2TfTvLdgtSvHXQE7IF+FeuJ1trTs8vTC3+1Q2d9XiNYIlJbh7
 FrqM9sQIPronAt2OFHcc7xDEXaOG8J4GLh9dsDWe++095XMaU8tXYtT0X77uFx+5xXLW0i3QPIU
 dSehK7xJDNZDXHc+r8GgvKBGBL5iDEkuVByWrhHeb06tJkqnmgayfgp56cNbJxAbf8EfypzYOSJ
 9NzdsAvLD9e8kKdyOX5TSAE+ZsuZGIxiGgww1j/6pLsoMZoDhqlmJZC3/6zDD3Lxz73rldSZEib
 HWjfVJRpb+gOhwJAUkMgyJYDr+rd8nP9jwerSEvzUF+X6hfKQHWZrbHOTSp/rxrulubCU0I2SHY
 0aYhXn/6SKFZu4FwM3g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-04_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607050187
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:lgirdwood@gmail.com,m:broonie@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:kuninori.morimoto.gx@renesas.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:linux-sound@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-renesas-soc@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34727-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,perex.cz,suse.com,renesas.com,glider.be,vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3491070AAA4

devm_clk_get() and clk_register_fixed_rate() do not return NULL (only
valid clock or ERR pointer), so simplify the code to drop redundant
IS_ERR_OR_NULL().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 sound/soc/renesas/rcar/adg.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/renesas/rcar/adg.c b/sound/soc/renesas/rcar/adg.c
index 53efd1be5139..2a74d89ba39d 100644
--- a/sound/soc/renesas/rcar/adg.c
+++ b/sound/soc/renesas/rcar/adg.c
@@ -565,7 +565,7 @@ static struct clk *rsnd_adg_create_null_clk(struct rsnd_priv *priv,
 	struct clk *clk;
 
 	clk = clk_register_fixed_rate(dev, name, parent, 0, 0);
-	if (IS_ERR_OR_NULL(clk)) {
+	if (IS_ERR(clk)) {
 		dev_err(dev, "create null clk error\n");
 		return ERR_CAST(clk);
 	}
@@ -618,7 +618,7 @@ static int rsnd_adg_get_clkin(struct rsnd_priv *priv)
 	 * No "adg" is not error
 	 */
 	clk = devm_clk_get(dev, "adg");
-	if (IS_ERR_OR_NULL(clk))
+	if (IS_ERR(clk))
 		clk = rsnd_adg_null_clk_get(priv);
 	adg->adg = clk;
 
@@ -626,9 +626,9 @@ static int rsnd_adg_get_clkin(struct rsnd_priv *priv)
 	for (i = 0; i < clkin_size; i++) {
 		clk = devm_clk_get(dev, clkin_name[i]);
 
-		if (IS_ERR_OR_NULL(clk))
+		if (IS_ERR(clk))
 			clk = rsnd_adg_null_clk_get(priv);
-		if (IS_ERR_OR_NULL(clk))
+		if (IS_ERR(clk))
 			goto err;
 
 		adg->clkin[i] = clk;
-- 
2.53.0


