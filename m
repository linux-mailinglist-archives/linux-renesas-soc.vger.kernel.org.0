Return-Path: <linux-renesas-soc+bounces-34728-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6eYhKDCTSmosEwEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34728-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 05 Jul 2026 19:24:00 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0620E70AAAE
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 05 Jul 2026 19:24:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=W5cIk1Nc;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=jo1NNBzo;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34728-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34728-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8C8633010B8C
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  5 Jul 2026 17:23:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89F6E2E06EF;
	Sun,  5 Jul 2026 17:23:40 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3515B2F9C37
	for <linux-renesas-soc@vger.kernel.org>; Sun,  5 Jul 2026 17:23:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783272220; cv=none; b=S9m+de9wHfhJz5asgOVziQGRMV9ZFr+vApaF7gW9HkoeCr+R2g5knBVIRd9qzJDqgyleLrycBvgoi2ZFEoXy2dK/AGUnOc3KuZaJOzt+TWU8OwFqdk9TzmgJUnpJIB8Y8a6ooKNVrhQRPWt60X/TRXLB0ApCTQtuk6CNjDBxOeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783272220; c=relaxed/simple;
	bh=EdaayfbS7qq3rEU+QMGMwkIwVzxFaUAzlHvGodRkVNM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oP06n2B++bcKQb5Yz+3EK/KdvDtoLW7MRN9GS6GRkaEJm6sxHRnrM+YZaTx32IDpcrDpm0X+wgq4ZW77OX1RJVQGxC/xnPc9CLfAWq2oYtRVC5esLGV2dsdtWcGVhgm5aCkNVKAm/5eIL0fXSwaRIjyi09Vy3L2WOkKiRomsAsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W5cIk1Nc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jo1NNBzo; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6651lgG7396223
	for <linux-renesas-soc@vger.kernel.org>; Sun, 5 Jul 2026 17:23:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=D4LYO0KJ0Fk
	gBtSAGBYQCbWONk0/lVRRlOaXENHlC0Q=; b=W5cIk1NcVNKYhcgvUOxgY01agRM
	rmvAlIDPq41gOAHtTzr+MsGqYlNEK1xnvwxTSoVtP5E2UclWb9JNtesZh1EbaG68
	dWOzESuqve26E3brHuyxyxzIkH9LCMtqIwzmWYgazNP8iPNhgBDJztvm2q7IEsm3
	TIFofmFYquVybM74WaLpRno5cFpPdYIj+cLutb2ghUVHwGY1NQnL9zn+LptxSpVe
	BxMiIuMCocTqDm3xVolQ5SXx9mJoKcO1tMzqkRlnJ43Pc2plfLbotmRH4AFsEtdN
	Y38aITKT8VseUodgQ9BM/HxbrhdeNgFLgEcyP/89Sm6IC8OjfImWFl7b8tQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6qvgudfd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Sun, 05 Jul 2026 17:23:38 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e53b8a302so209554885a.1
        for <linux-renesas-soc@vger.kernel.org>; Sun, 05 Jul 2026 10:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783272217; x=1783877017; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D4LYO0KJ0FkgBtSAGBYQCbWONk0/lVRRlOaXENHlC0Q=;
        b=jo1NNBzoz9d4vHVxUop2+ST2cZNG54o+7ne2rCbjziQXOOSSE8SjOTRtKx9ZtwMA34
         FzO5Y9YEjXSpEhZPBi2nHDG8BY1Fkfo3rEAbq8rzVxfYosr9gZolXKTtz2ZWONecTQC+
         gkXXmMIW0Mg56ENxdL4l9SCUQ/1WGsg+J44kkYeW/Nxbis4TyC90pXdmaDJh+xYmBVe8
         QUMHjL/go7ELQd/EyMjiGkXUXjp7wbl366N3zWkAq62Q2wLK7H8PWKhEY/Dwvi8oUk1h
         VlbwP5/zlyYryo3aGokGTt9/eu9SElIuoZG/9BRWDydXhFGOej96231bhIG9NOyMbtQo
         F34A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783272217; x=1783877017;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=D4LYO0KJ0FkgBtSAGBYQCbWONk0/lVRRlOaXENHlC0Q=;
        b=FOmtD8S7XEpM1EX7l539Ge/j+OBvQfzY4WxdX+Kg3dqphpl2lpXHBDqeJW3SxOdjS9
         rX5Nn617HAZ0BG0Y5OcWGLdzpqfG2KZlwXhJFZnvp8dFdVugztJxnPoyGvaUX5EgfHdp
         tWc92/cMLbPb8Y/dKeAvZvUMYxRIKf8UpG93ZC/joqWK+jiws2YD5wHV47dKKrTXgslp
         arCyb6WE7Rrhpj7sK6SblyU1NYRmD3z6y8SEFpugh8GmY7G986D7fWVurfHSy/hA1P5/
         wuQSB35H3L0AFFY9RpqBaZ8FHu9TyFlAJuKNGt/SMPOHUdwWs9T5N1klZnmB0RLznCmj
         /ekA==
X-Forwarded-Encrypted: i=1; AHgh+RovSUxQM2oi67DqQ7dPK9m5Y+FomWj1BH3TQl3S3XDKsrojI/k9rPpDrvqWBqjxO1nx68jsmmNVcdp4CJew4enOdQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyAlOMuRf7r0eFJXeaGoxLfrZKJSBqP+uuKrBELeYmpesIKwkGr
	Y5jSNhG8hflM18GB3jABMCVufJ+2jKo4/H1C3VsCcYyrc0x01J04yL2pidMs9Jx5au/1nV8eY/Q
	y9rw6aKVopPVkyTPgAEwlbXur4kwBkn+hT71DGDTLQOj1dmrZnm2TEL8YwxjRY1zvBIMX/n3UoQ
	==
X-Gm-Gg: AfdE7clbwma47s9Jy3WJl2BcpKlyy1zYy4Dgd/18aSK0aUoR03Stp5FmVoT0qt1EmGb
	2+ZqvEKQezDiGnCLBv+vZbYrdWkLZTQDlxvmXMO/wzOQgh9uDQ7/4c/IpZBzSnvEGYDFLk42xWU
	FrUsOuNkUXcAsAqfe4HTVcBvgQLhGr7EtVa4DFO9UuB/umA+5A5+yq1sWOQjmlvArrmyQr78r18
	NTvk8GDyu7qv4FoDl57H/SElrjN2NpG3vo4l8nDRbaE2R1Z7ajLM0wSWSywd4kXoio7eY2XMUMC
	7rwZHKUHaEqBsxVzMNoJUQJoc2u/Hv0T1rkcPgrUTy6pEaQZHlHfVMNyeXmBgPrCyDgKsSirb4F
	VTx5vMDHFUim3NBDJmIBSWp2ckMk=
X-Received: by 2002:a05:620a:4590:b0:92e:8a88:ab27 with SMTP id af79cd13be357-92e9a35c0acmr1064785985a.14.1783272217435;
        Sun, 05 Jul 2026 10:23:37 -0700 (PDT)
X-Received: by 2002:a05:620a:4590:b0:92e:8a88:ab27 with SMTP id af79cd13be357-92e9a35c0acmr1064781785a.14.1783272216956;
        Sun, 05 Jul 2026 10:23:36 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493cce12c40sm365840195e9.13.2026.07.05.10.23.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 10:23:36 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 2/2] ASoC: codecs: es9356: Constify regmap_sdw_mbq_cfg
Date: Sun,  5 Jul 2026 19:23:27 +0200
Message-ID: <20260705172325.118926-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260705172325.118926-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260705172325.118926-3-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=720; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=EdaayfbS7qq3rEU+QMGMwkIwVzxFaUAzlHvGodRkVNM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqSpMOJnaga3x/m/ed7/YLjQ6CeQ3jQtLVC9szN
 mqVYB+ItAiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCakqTDgAKCRDBN2bmhouD
 1z3OEACT/cBIcmKBkj2sEJcLkzgCFmq4xGOqqNnB+1g2oqri/eWn9TX5EgKifJfDq06DS6iYC/o
 TC8T/dS7DQbO2N+YOK/0jPatz+dE7zKlR0f38JOz1E4Fteb+HFLoti2HkXW54OHFQGVNdV70AFd
 zLznXwPp1QvrbqttO0ddVz1fyCKoL3WGgDAxO0doW5ShW81d7sWqMU8SSYqyGld7Lf9+r1/Jmn3
 DjHtH6i8uqOy0SYYSMxqwkMVfkmE7a8b1Jq8bR9LW2rqh3+9YwfAyc2b5zYEzB4TeM7MZTCsWtD
 lHw8GB4b10d8mcD4S454V5fGucSf/xRIpG2J92/lJ2Hmd5HqfVinZrWstcAM/rBv7e7xAYKRbBh
 Exka5PTREw2OY69yUc9OnGABdRSCjoD0SzPpNhODyHHUZEmUpJKUSUP13i43iva9bjBGgu6CRjC
 QLiMhKwVZcvGxl8dCCM+9H//gIcgV7OTP488YvpHOraSFRWg2Jr0RE841xfn3nN1DI7GafW6/WH
 m+btxu2AHMNyS4Yh6nMfc1CqiKWyHOIilV94qdGr656lOBLOR7pvmFolOd9Y5b83ZrGAjv7WRzr
 +49BDcOjFR+cj2iAKPZfAj9+UMpoUsr3FFaQhpI5BjMucjLxynQr93KhV+xEuosdsX3QqZeoZcX zn93j5rMMdMQSPg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=VvoTxe2n c=1 sm=1 tr=0 ts=6a4a931a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=x8S3Fr8Iud8vDYM-HtcA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: UgyXPf29qBmD97Ie2vOdXKToysYORVvG
X-Proofpoint-GUID: UgyXPf29qBmD97Ie2vOdXKToysYORVvG
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDE4NyBTYWx0ZWRfX5BmWxVD0RMBR
 SCbgzjy9DnDEuc22zHxvDYYQ8fXetPphktnPYdVYDe61djXfA5o78v5Sad9zxhwJCXJwfyK+NAj
 E8w0GKsOodq4HEjlEB4JKBYytLIqQPo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDE4NyBTYWx0ZWRfX60rxp5hvI6Bn
 XOK40YUi0f0oJ1/CHJH38hfNF88GlS7Er+3qoDzalVWCuKTgSlBytq23vSqxcFznEsOXzxTEpHQ
 rtm7OVzfyZogPAqIGha3y6octaYmq7Y941riQjFvmfqyjUkyzXLp+GTdlrfG08TP5Zs6ELZMtWZ
 D4n1waddHWRqu+D1EgxJa9Lhr1EJi2KoNjLSuqTsKtd6Te+vHnB4Zcj0RROuHbgHMIz5VNZTUmG
 fizsXmM9ygvxorUdLn395m9qSwk5qgTdj/vIflZ2iRBGsEbM4H8aZZqlEkeNUWnRp/uT8BLzr7i
 oMNUFWaDko8S9dZViplXBnJ0dIXyfVZKEK1oGzG0ClPT18Z46Dhwfup0brzdofKvgR1k4X5U/j2
 kTff7MQCiM5oW63HvHHfiMujYlmDziLpdlPrrELCuJcGN2XiZmLuXGrC6g8d/o0QBnp8+2qbVLu
 5HLzgKGLJNmLWLG20Rg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-04_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 malwarescore=0 phishscore=0
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:lgirdwood@gmail.com,m:broonie@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:kuninori.morimoto.gx@renesas.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:linux-sound@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-renesas-soc@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34728-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,perex.cz,suse.com,renesas.com,glider.be,vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0620E70AAAE

Static 'struct regmap_sdw_mbq_cfg' is not modified so can be changed to
const for more safety.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 sound/soc/codecs/es9356.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/es9356.c b/sound/soc/codecs/es9356.c
index 1122455aab77..f574b3d6cb3c 100644
--- a/sound/soc/codecs/es9356.c
+++ b/sound/soc/codecs/es9356.c
@@ -671,7 +671,7 @@ static int es9356_sdca_mbq_size(struct device *dev, unsigned int reg)
 	}
 }
 
-static struct regmap_sdw_mbq_cfg es9356_mbq_config = {
+static const struct regmap_sdw_mbq_cfg es9356_mbq_config = {
 	.mbq_size = es9356_sdca_mbq_size,
 };
 
-- 
2.53.0


