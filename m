Return-Path: <linux-renesas-soc+bounces-26083-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B1DCD9C31
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Dec 2025 16:24:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E8554302FA16
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Dec 2025 15:24:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 564C429BD80;
	Tue, 23 Dec 2025 15:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YlkIAk37";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JFjgnvxS"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD250277C81
	for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Dec 2025 15:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766503448; cv=none; b=n4kRQ0kv2DZfj03Gr4vlMjRR25dFzad7XAej1pMg8I6IRAVR1cyBwoh6Gb0iR75dLUjSkAQ088Acr9TRURZaTy/mR0OS6zGisgquM+5Y0lRTHiHbS3VazXa4LYLkO0psSF2J0TdM+Naoe06WJBjSgDemy2UtWtIg8gtYc847GGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766503448; c=relaxed/simple;
	bh=c66B3V+WWte7SdY1FIaza3AAO7PtnnIBv68KPmSgVmc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jFKXEhw8cKMECkKMuZacvPDhuWwEsJXPDfKtW4BFYjLF104kG5jFOcsSZERj8bkCmUPS0qvu5/eXJtEou5x1bW8/W56MiHBvRQw+13whT0S/ZiCFGfLwgeHfm9UkGJZZD71ZPBBRzRsB8Z/ni1gy4PZnyxSG06PN39R6ySzzyx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YlkIAk37; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JFjgnvxS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNEGojP2115503
	for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Dec 2025 15:24:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=3l2OvpWnazsd8alkcAS9q2RDcBacYram7Jq
	cIQFWlgw=; b=YlkIAk37QFTHUsdE/eYS9AXgeCwn2soq2RE2tObUpRFTRmBzS1P
	xdioaY80rBtRFkiXQaOZfaPPuAzjmaftIHVxYpvwcv/KdvdKFsANbovX1Ss6jLO5
	+UMXE7YtNcr/HZNej/Q3HVfqK8EXzrH9AQ3v3ijPWhh91OBwh4xKqXpNduOok53J
	0WtYFE0sQ5H/x761l+zeokcnAp5FCbqq2hRxfSZH8hGIvNwG6xfO5XEW5sQu9+zi
	ht6bIiJzNwuAurb3oQ4sjd9R/1WyOKiHvvjjwzLZqRpcNNfq/sXZ3RRMaKQ7e5zr
	5GeyV63ffUbTlCrlJM1vJDRczWHMCvC2/FA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7cudk4a1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Dec 2025 15:24:05 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4edb6a94873so100490631cf.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Dec 2025 07:24:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766503444; x=1767108244; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3l2OvpWnazsd8alkcAS9q2RDcBacYram7JqcIQFWlgw=;
        b=JFjgnvxSO/qt/T+rbSqbw6eDQ8Nfyu0gZWBcT6GaCqMpFOF1xLYYs1J6pbY+PhNOuK
         MXhBLLLFuaaF3OwzxZYvM7ey82gel8B9oFCB2IBzCdVWMxc2kCQwic50vZlniHikdkSp
         uh7S/i9/bU7aMEQJqFKRjD63o2Z5Q4HfI5Ba6RVGxV9Frgbz0meutN6X4Ipai/NpxE9A
         e434JTzkdELZlH46+hjMptqH/7AddxWeUVnV316LnJf0EjDFFnvBc3OEnGY/vpHm/qTF
         JSDMVoXpjU/QAjLhDHyeBsjLLF+qTtoEpJ6usC8Jt00BdpYjaxC6R11D7o5Xl1HwaR5y
         BT4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766503444; x=1767108244;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3l2OvpWnazsd8alkcAS9q2RDcBacYram7JqcIQFWlgw=;
        b=T1nwM4DMuCh445Dn3aNXe5VrXI9HiK4UhNnia3UJIu4km9jMoqwXdaso0fURsZSobi
         AHzw2PMe/VdnrxinH/0RE96ShQ4zbgZeoCUWPpqYfnTGPg7vOOmv6vilciQkYKrRQBy1
         SiNfNgNc9njhjcbEVDZsdDeS+DdE2+FyOlwT/KpQkkgOdFD1UL2dVBlAUm6Y8b2PQ4iJ
         MtrMfLAqKVHw49fL8v/jZ5zbLZOqhDStcPaoF+jHoqllQShcMRuojs9m3OHGwUiPnzj7
         W+1efw9vd/3NKq3pMP4VaOC87DZonPAaR30TbF6EXPRFiPrjKUwlDuJN3aDMzxGNSa0X
         XwIA==
X-Forwarded-Encrypted: i=1; AJvYcCV0S6cRiq9a9uta4RVeD4TnpasKl3qYzQpaK0v6jCFlwxlnnNzkJ852cj0sE82+Rd5ZbDV6x/kUdxrKOnjpxDSF8Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzgukBYNEB3a9TNTOWHuuuKDBjCTsPcBlkzqJkLcfjBNQe8dkc5
	QySjJDty2ebPHp9xPwT9C8oiF3Lgv4IKgk2l7QZ1+K3zstziERipKcRbJfYiQpdtN+hsUhMell4
	SSqh2YG2+yHn5UkStJdA7dETr940mWTGKJwCasTpG2IM5bG1SEQiPB0x4gvpmJ6EHOOgqum2z3Q
	==
X-Gm-Gg: AY/fxX6JtET1LG7SrBFNR6Vu4kA7WPXKd3kDdz1oN0133GT8aM0+lZrOKVdaII4gEYq
	CO7kJl2xXFUFgshVFflVtja6bcUSey9b8NP4UE2SobzrgGe1L8TnBg/JkJ1ToeGiwRj7e9mtFmO
	0zJj5rT9fY/Ul02KKmIsyQw+wdgqa/TgjlwM/RJVjgj5A5pJNfbtosLMCXDdLxqzZDh5WL15Mey
	A9zHk2IRSlASIXhQlgbb8lg7YHdedYmaFBL/RekJwgbGQAIHcrVe7AWqsaEmYebJB0bDvsKAkGS
	SHUpJrFic5rmf9hE5hDvkVEmb2GIoF6jL0tmTQxkabQwdpB/Y+f2BU6VW7mIbRE42/1Qojx1qs6
	kpyH239qOpAn9/HxEweytBHMRkukQNMCxfxn2g/GJQ4qwbcA9QjfpyYkfGMXB1lOJtMk=
X-Received: by 2002:a05:622a:410e:b0:4f3:4cde:1637 with SMTP id d75a77b69052e-4f4abccebedmr189804981cf.10.1766503443980;
        Tue, 23 Dec 2025 07:24:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHAZ0CofaZ1CXl6fkipQqMqDa5McjkT/3PQ4ymoUwCIp5eso+MhGndh2jvQcnH8uheozTSAxw==
X-Received: by 2002:a05:622a:410e:b0:4f3:4cde:1637 with SMTP id d75a77b69052e-4f4abccebedmr189804551cf.10.1766503443505;
        Tue, 23 Dec 2025 07:24:03 -0800 (PST)
Received: from quoll.home (83.31.98.88.ipv4.supernova.orange.pl. [83.31.98.88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f13847sm1391221766b.57.2025.12.23.07.24.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 07:24:02 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 1/2] arm64: dts: renesas: Use hyphen in node names
Date: Tue, 23 Dec 2025 16:23:59 +0100
Message-ID: <20251223152358.152533-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3856; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=c66B3V+WWte7SdY1FIaza3AAO7PtnnIBv68KPmSgVmc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpSrQOW+evM+zKx48uDpLpfQT5HbXerd1TUVyn9
 PNVGXXHVyWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaUq0DgAKCRDBN2bmhouD
 11baD/0W5PIaeesSGHNi1mwlvy5QrXnhlpxXgHWrItsbkOxFsbPN5xdsn5psFaxDOS1ye+KuKQz
 CEScAoeZgLQ14H6B34mvXGSt7JDZIn54XCxGsAbWjuOxdJ+0PbGmcN3C03MCdw4Y635oClNgNIM
 GeStByM6FybmkOORmailupmtGNQdRmSIM41oz9dBi8fYyXVZh+clI5hLdI90e9aL2ieax9FpTRx
 NHlXc+5i7u8n/GnCtbl8tPgx5p8rj3QL56cw9Ximesx6QsnNIIk81Fx7TnWGTMHujZRb1vkZQc2
 wyQ/M/p6iPGITjLqNyf+ZXoRYJrZnG16jhJT3KiTQb4JKRcEd//eUJ7pGOmH+87BdG18q/3yaWa
 17BduO83KpMoY63de5JzhLW/mWBUln0lodymGerjJhHoDU4oqLehSSUapOqB4sMzP1RqBSKDIcu
 EYFU9LHYfCQOKG4fmESxsqEULXVH4d969GmbwSqGUSlYE5hXodsxF0K6v7488LCeKL+DS0l4S0q
 thXZVdClpjANuZl2habRp7ELFKCjYpRK9LgdbCWQ2IyKBAmpX57nr36EE2D5khwZAgappQRQk6N
 oHvHYsIDD0XWYFA/2Ki2sgLJCbCQAOYpdQl8IYYKTsu3AZhAF0K/zZbFkNkdOoeYPytQ+nXumPC fOfOcAGDrObNRuw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ebkwvrEH c=1 sm=1 tr=0 ts=694ab415 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=qe4J/qXhiWkb1JZGYKbLYA==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=FUnLEkIPDp6DTj-5v1EA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: uySkZakH93_npKOpquBIjpftRgito_Nv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDEyNyBTYWx0ZWRfX7JxauE0iNdRe
 DUulcX7dwRgTA2oV5Yhqy7vtpnfTJjcJWCsYImSylwd0wMPskF1jp8rt7qVU9ZHXW1G8sWgC5g9
 xPJg0uzJ5b/q5nj4FOcl6oNk2YXVhb0EgEp/zFxiihPD8f0T57Yba+WN7iUjEJgxqAO6A1f4dwy
 FhUiH5amboXW9HegKmYoJVnLuEkHdeujqtnyRHNMsN4JnsKiqLTcd294xlI73Sh8q8YX1lcZ8ye
 SlN3XcWPG//aZS8a9Hs4scU2rYqvpj9LOhaclRlXUPTpNUXDHIrZIRHU77h79E9Wa/zTlazH8Iw
 ziFOKWUwdncX0lF8S3xDytvjoAMp+udHI2L3xQw+xsn5avFaa+CG85nQb4bs6O5zDmYIbdFfCsq
 7ub1eVhZ/BYIngflM/5yCb7LOL7qB8phE6pQHcBL2EYawbFJJwfTnNmmqsbHQGYlGv5Iz8Y5Tkc
 rgh3zYHbC9wRGNLx58Q==
X-Proofpoint-ORIG-GUID: uySkZakH93_npKOpquBIjpftRgito_Nv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230127

DTS coding style prefers hyphens instead of underscores in the node
names.  Change should be safe, because node names are not considered an
ABI.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Patches done with sed, verified with comparing unflattened DTB and
dtx_diff.
---
 arch/arm64/boot/dts/renesas/r8a77970-eagle.dts   | 4 ++--
 arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts   | 4 ++--
 arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts   | 4 ++--
 arch/arm64/boot/dts/renesas/salvator-common.dtsi | 4 ++--
 arch/arm64/boot/dts/renesas/ulcb.dtsi            | 2 +-
 5 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts b/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
index b7328f9f7d4b..b26c5a709777 100644
--- a/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
@@ -364,7 +364,7 @@ cr7@40000 {
 				reg = <0x00040000 0x080000>;
 				read-only;
 			};
-			cert_header_sa3@c0000 {
+			cert-header-sa3@c0000 {
 				reg = <0x000c0000 0x080000>;
 				read-only;
 			};
@@ -372,7 +372,7 @@ bl2@140000 {
 				reg = <0x00140000 0x040000>;
 				read-only;
 			};
-			cert_header_sa6@180000 {
+			cert-header-sa6@180000 {
 				reg = <0x00180000 0x040000>;
 				read-only;
 			};
diff --git a/arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts b/arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts
index f18d26360610..343f9610f892 100644
--- a/arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts
@@ -255,7 +255,7 @@ cr7@40000 {
 				reg = <0x00040000 0x080000>;
 				read-only;
 			};
-			cert_header_sa3@c0000 {
+			cert-header-sa3@c0000 {
 				reg = <0x000c0000 0x080000>;
 				read-only;
 			};
@@ -263,7 +263,7 @@ bl2@140000 {
 				reg = <0x00140000 0x040000>;
 				read-only;
 			};
-			cert_header_sa6@180000 {
+			cert-header-sa6@180000 {
 				reg = <0x00180000 0x040000>;
 				read-only;
 			};
diff --git a/arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts b/arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts
index 2da63b4daa0a..8ccf669b2cf0 100644
--- a/arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts
@@ -236,7 +236,7 @@ cr7@40000 {
 				reg = <0x00040000 0x080000>;
 				read-only;
 			};
-			cert_header_sa3@c0000 {
+			cert-header-sa3@c0000 {
 				reg = <0x000c0000 0x080000>;
 				read-only;
 			};
@@ -244,7 +244,7 @@ bl2@140000 {
 				reg = <0x00140000 0x040000>;
 				read-only;
 			};
-			cert_header_sa6@180000 {
+			cert-header-sa6@180000 {
 				reg = <0x00180000 0x040000>;
 				read-only;
 			};
diff --git a/arch/arm64/boot/dts/renesas/salvator-common.dtsi b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
index fa8bfee07b3c..d4a921bed4c3 100644
--- a/arch/arm64/boot/dts/renesas/salvator-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
@@ -501,7 +501,7 @@ ak4613_endpoint: endpoint {
 		};
 	};
 
-	cs2000: clk_multiplier@4f {
+	cs2000: clk-multiplier@4f {
 		#clock-cells = <0>;
 		compatible = "cirrus,cs2000-cp";
 		reg = <0x4f>;
@@ -890,7 +890,7 @@ bl2@40000 {
 				reg = <0x00040000 0x140000>;
 				read-only;
 			};
-			cert_header_sa6@180000 {
+			cert-header-sa6@180000 {
 				reg = <0x00180000 0x040000>;
 				read-only;
 			};
diff --git a/arch/arm64/boot/dts/renesas/ulcb.dtsi b/arch/arm64/boot/dts/renesas/ulcb.dtsi
index a9e53b36f1d9..241caf737abb 100644
--- a/arch/arm64/boot/dts/renesas/ulcb.dtsi
+++ b/arch/arm64/boot/dts/renesas/ulcb.dtsi
@@ -413,7 +413,7 @@ bl2@40000 {
 				reg = <0x00040000 0x140000>;
 				read-only;
 			};
-			cert_header_sa6@180000 {
+			cert-header-sa6@180000 {
 				reg = <0x00180000 0x040000>;
 				read-only;
 			};
-- 
2.51.0


