Return-Path: <linux-renesas-soc+bounces-26084-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 86125CD9C2E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Dec 2025 16:24:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 305D53003BEA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Dec 2025 15:24:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9560E29B8D9;
	Tue, 23 Dec 2025 15:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tafw+Bv9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TYTg8sEW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB00229DB6E
	for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Dec 2025 15:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766503451; cv=none; b=PSMELJ0LfWDRibQEIVqyY2JwBivPtzZX1iVWvkX04bMLigsqsXaz+PlRzzyhrApuyVvYx768tY2MogMQqWMY5ZFQNDdy3nZSLuSCnrmhWfa0yEYQWvVLIOOLYrdnt2WIRyKSKYw3oP0U3PZSb7UMqYz+mD07LHr+D+s1ZdYdcas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766503451; c=relaxed/simple;
	bh=qSfWwDgs97LdiYoHtgF54xbNKw+lI7sBOXcblme8tuo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NBsPgFGuJTHMU5XRl4e91KwV2msCsqgwun1bxx7oHzGzFSd46MfHRnHSoADMs1uq7OUWf3ReQCTY7eLpGLTUKIN6HVZMHSJW8iUcm8FVLBd65kvHpRerYc7gOjXiQflaXvxTa7oGhwVkdcFaGunhf9U4H2omuxYUqnWwoI1OtxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tafw+Bv9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TYTg8sEW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNErvlP461405
	for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Dec 2025 15:24:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=pJtjSdBc6am
	BYowr025xAo962LjpwgMpRL6m54Ryp4Y=; b=Tafw+Bv9sfmveWxwb9S8Bs2CCwF
	deBiXGjVafMcUBN0DmNlhKXgewKTuRdL9O7qjroztxjLyysqQLucr0N+zns9Ut9F
	WaM1zJPpms046lAHZ/dDnAWL55ohpw4Ft3aM8M8hrxZ1XqYWr/hGVkXzQzbh+90t
	SfwBGj5YABUzhj+UGGzXXlrAd+yXAiz2C1jwB5PcxGhEIX7vwqy/YDBYgrF8j1K+
	g2QofWRRrCtafgyTTc/SKVMfzQ4Ga2fRc5RP+ElKbVsT9Tn+jm5bTar29MTEhzd8
	iXhb5S8ASGJ5VU41k62b2fLQuKjeouqQ2lMjB7Q0onO/umpz/PSe5lPpxZw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7w8fr2vd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Dec 2025 15:24:07 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4f4d60d1fbdso55189631cf.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Dec 2025 07:24:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766503447; x=1767108247; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pJtjSdBc6amBYowr025xAo962LjpwgMpRL6m54Ryp4Y=;
        b=TYTg8sEWqIboF26UuWT6/RYcudDzTw0FVarkdUFf8HrRgNd2rjQjInvWLhWwlzQSbP
         G2UOEpnGhIy5AeWDIMCu9q6nLe7INolWA1Jxn+auiRp1NVgwgcY+ItFiWjE2Cv0vmoWW
         rrc6ww/z4WMSQfGe/vmulnTDentAFzKPgZW5txBKYxk8L5sJERQY11V25TcLyAR7IrUT
         hyAT26l9QggJBPSLOFlxyTnsOlHaFQ9SY5/rhZcGN8j+FxnGqiP6UrtTUYf89srySFTU
         qN33WtwqPFqsTA/XI40WfIE35B9ys1Y8ma+iGuFa6WbrXROuPqvHl1QfNssHj18tcu9t
         k8fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766503447; x=1767108247;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pJtjSdBc6amBYowr025xAo962LjpwgMpRL6m54Ryp4Y=;
        b=jr/iGLhIlLaEMvyBS127gEaLigEn9r+LxwE1bFNcYANfhaJbIcIvujQCTv3VbZgdYl
         17nvVMI1kDa2dC2njnXC9hhlSjC06sOSCONAaECrAyYyO99aPFn9UkXxTxrdE62L32O7
         VNpTd51C9nzpp5OoppuTQohy1jqsgMIlx+tV2GdIZ3x5ziL6Id6vtxM+sVTtpTFSvQcO
         ZiSlHJetHCL+FnFv8pN0/ARPfd01iEp2JPVJJVnt1REkBbTF4JwUq69a+ZQExWqqrG/Y
         60YN9LROUzoyc+tMcZt6CKFqsFRETUCxROARQ+JhxKSkCbZ4MKz4o6VVF2NXt2lPvKHN
         wE+Q==
X-Forwarded-Encrypted: i=1; AJvYcCW5jnnJCipuYR8vnnlYrFMUXGRvDyDcM7BmqIzAtQNywoHsy3VwumeVM1ICpOxm6eltl0t8TLqbDVVykbRUMb/9JA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8mqTUu6mha17WRTyu9inR5ktpig/A29k6ukN/yORQxReg0zvC
	mOTwQ4YukZ/PTYVWMEj5zbIB35vYwT9p6BtAfUw+kOMmYVnIypDKkbKeqWxW6kn6m5JqKErI8ZN
	3mAvITfbsbiCCDoLKQg8MorI6knnuWdpKtyGL+bR8NErcS8uCl47GhfBvuklZvOR/c9sPYnLJvw
	==
X-Gm-Gg: AY/fxX4Qtao8s5sEk0US3G4cSNVbnLYGEM7Y0XIpsaNdPHOiuHt2Q2WfUTFKl0jrrOY
	ooNcZI0HhEnU48BL3+MjWruIqNpCRZb7wNotpSbkBDBdIHSFyO4CsCJ6ud1FDw4H35fc04DFdy3
	mObxsA/OLq+L3I8sgVXioXviIlbmOtOTKiltckjDIUoYO8w3h3H0p6pvtYww7yBvFzAJeJJ69vp
	HecTcZ0mnb+tSNV9kZnCqW4qQMI2grDlo0l3UJR1HeozEWBq50RJOI9Z5BXDbeqs5FNpip7ALiH
	77OaPhG6+uOXHYk1keonBLLVKllGzbqBFQvnVdXopEyX0ihXoAIwtVOy+KKGsehw7Qt6U1LPElt
	rwn8iOi7rQmMvfCB71EuomvvXMRLLREemWZz5vLQ1j/S1T6cx6lAU82o3OwTihuwBc7c=
X-Received: by 2002:a05:622a:7502:b0:4f4:df23:ab5d with SMTP id d75a77b69052e-4f4e39243a4mr6935381cf.75.1766503445874;
        Tue, 23 Dec 2025 07:24:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF+RwaUamzisROa/2FJXw4rIlxwNFnT5uOXtpIgJ7thRl4qkS7WxqCn1G0+s1JOpPZp31g1/g==
X-Received: by 2002:a05:622a:7502:b0:4f4:df23:ab5d with SMTP id d75a77b69052e-4f4e39243a4mr6934851cf.75.1766503445147;
        Tue, 23 Dec 2025 07:24:05 -0800 (PST)
Received: from quoll.home (83.31.98.88.ipv4.supernova.orange.pl. [83.31.98.88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f13847sm1391221766b.57.2025.12.23.07.24.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 07:24:04 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 2/2] arm64: dts: renesas: Use lowercase hex
Date: Tue, 23 Dec 2025 16:24:00 +0100
Message-ID: <20251223152358.152533-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251223152358.152533-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20251223152358.152533-3-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=39898; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=qSfWwDgs97LdiYoHtgF54xbNKw+lI7sBOXcblme8tuo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpSrQPNtXM97spghofO+47DYnYDmWC+hGsnL0LS
 Dt1/pNf+SSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaUq0DwAKCRDBN2bmhouD
 1zSyEACR4vpE3iQMkegHABJA2ABFZaJ+tglDTzj1CrWWOMYEXe1V2URvhywjtzrVjKLY5KLWgMe
 koQfmBx/8+XngQfospO/QXN8AxYfREeih5WeDwJGc9iFGx2Rp2MjZ3ONwFU3aDQIUqGD1IJRBy2
 jBxfPaygx6DM00XJhUyLDrcodgRcvj6OV5bpf6QdELPfhcjd27WOvN5FnjSJOtOi9a3tTiyLroG
 yeJCNY8Cw1DHhG7DyE+kL9U6OtW943Wwpza1eNxSxAmZc6Rnwfo3X4OjnBZYnUIKHCHdl/wix/O
 229j8PJrGAdq6VtWzRziL9uxYKbZkpergFHeUhHZqlaXTvYxkbzObb92aiQ0EKUnVg82SITkwwc
 hYAcEOSv83j8BNosBa9pAX5rDyTlnX02L7NU8xC6tgAdybs/a0OPcfxMcjoKO1Y+xOnqDjovg+O
 GcFXfr+nEUH1vU+mkK5DAIHPn/CGocxCwbf0M+7qxDQ+TmdL/VPlJvSNnQZKciE2mR4kYp65Cr3
 T0oIVc8KKYbtC8lAdJGuTaAjeFAorNqyFng+zVp7AmxzmH0+1xRnwQCtqO0Us54DySlQ8WmrNvp
 qnLsUJB2YCuRL936R/LQM02MY4iphraYAtpNwhsbGVMUfdKvPMW/vqu5v0LO0L6QR14+8Mp58Oj 16y46BB1wNMan8A==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: _l431xY1H_gezD49RVh3DIiZDvBHDwFf
X-Proofpoint-ORIG-GUID: _l431xY1H_gezD49RVh3DIiZDvBHDwFf
X-Authority-Analysis: v=2.4 cv=QutTHFyd c=1 sm=1 tr=0 ts=694ab417 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=qe4J/qXhiWkb1JZGYKbLYA==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=fzms0QyhRIQr47BOOiQA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDEyNyBTYWx0ZWRfX3g9zkWw0NY67
 r7qmbZWE8Bt+fqUh+9spvyV+cH59+PEjoEg59Gd+NYGrFRhEWb9jQtF0JzxTf65tY2RUqDl+069
 cs+vD5wwICr+L3Hiic3L1aUM/mZiXhSV5jTw4kvp7GMDFUy/svqn6wbMsvG6ygkUFjOtoDcDVqp
 1MvHqOSlpztpIkPK6HOudvGG1UJRWkZtHxNPDpk/m1wICBDG+loKh5pfyPdr5fCIkmn+1KUa6DC
 KYsR1QZ6aWOn7WQoYzcpSLYF3TkcWoM+9XYxFD94EE2DycvbE7V7wTbNdJNuzNSSHWplKB1vCAU
 cdMumjLF2Y7IEo5wm/jKY5Mc5BEO732BPRRGuAxhDgAX5Trf9/yGIV3/oQ2Y4IEUC34FLQ3x5qS
 t8+32eg6nIvIIcyzvzjQo0KcTzSO+RnJcTV3C7EvPnK1D79e3LZEV5MyDkrep3dzOuNFufGL3gn
 oIJ4fc8iHATeBrbHwhw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 impostorscore=0 spamscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512230127

The DTS code coding style expects lowercase hex for values and unit
addresses.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Patches done with sed, verified with comparing unflattened DTB and
dtx_diff.
---
 arch/arm64/boot/dts/renesas/r8a774a1.dtsi     | 52 +++++++++----------
 arch/arm64/boot/dts/renesas/r8a774b1.dtsi     | 52 +++++++++----------
 arch/arm64/boot/dts/renesas/r8a774e1.dtsi     | 52 +++++++++----------
 arch/arm64/boot/dts/renesas/r8a77951.dtsi     | 52 +++++++++----------
 arch/arm64/boot/dts/renesas/r8a77960.dtsi     | 52 +++++++++----------
 arch/arm64/boot/dts/renesas/r8a77961.dtsi     | 52 +++++++++----------
 arch/arm64/boot/dts/renesas/r8a77965.dtsi     | 52 +++++++++----------
 arch/arm64/boot/dts/renesas/r9a07g044.dtsi    |  2 +-
 arch/arm64/boot/dts/renesas/r9a07g054.dtsi    |  2 +-
 .../dts/renesas/r9a09g057h44-rzv2h-evk.dts    |  2 +-
 .../boot/dts/renesas/r9a09g057h48-kakip.dts   |  2 +-
 11 files changed, 186 insertions(+), 186 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
index f0729a482cef..36675f5bcdea 100644
--- a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
@@ -1901,7 +1901,7 @@ ssiu03: ssiu-3 {
 					dma-names = "rx", "tx";
 				};
 				ssiu04: ssiu-4 {
-					dmas = <&audma0 0x3F>, <&audma1 0x40>;
+					dmas = <&audma0 0x3f>, <&audma1 0x40>;
 					dma-names = "rx", "tx";
 				};
 				ssiu05: ssiu-5 {
@@ -1909,7 +1909,7 @@ ssiu05: ssiu-5 {
 					dma-names = "rx", "tx";
 				};
 				ssiu06: ssiu-6 {
-					dmas = <&audma0 0x4F>, <&audma1 0x50>;
+					dmas = <&audma0 0x4f>, <&audma1 0x50>;
 					dma-names = "rx", "tx";
 				};
 				ssiu07: ssiu-7 {
@@ -1921,7 +1921,7 @@ ssiu10: ssiu-8 {
 					dma-names = "rx", "tx";
 				};
 				ssiu11: ssiu-9 {
-					dmas = <&audma0 0x4B>, <&audma1 0x4C>;
+					dmas = <&audma0 0x4b>, <&audma1 0x4c>;
 					dma-names = "rx", "tx";
 				};
 				ssiu12: ssiu-10 {
@@ -1929,23 +1929,23 @@ ssiu12: ssiu-10 {
 					dma-names = "rx", "tx";
 				};
 				ssiu13: ssiu-11 {
-					dmas = <&audma0 0x59>, <&audma1 0x5A>;
+					dmas = <&audma0 0x59>, <&audma1 0x5a>;
 					dma-names = "rx", "tx";
 				};
 				ssiu14: ssiu-12 {
-					dmas = <&audma0 0x5F>, <&audma1 0x60>;
+					dmas = <&audma0 0x5f>, <&audma1 0x60>;
 					dma-names = "rx", "tx";
 				};
 				ssiu15: ssiu-13 {
-					dmas = <&audma0 0xC3>, <&audma1 0xC4>;
+					dmas = <&audma0 0xc3>, <&audma1 0xc4>;
 					dma-names = "rx", "tx";
 				};
 				ssiu16: ssiu-14 {
-					dmas = <&audma0 0xC7>, <&audma1 0xC8>;
+					dmas = <&audma0 0xc7>, <&audma1 0xc8>;
 					dma-names = "rx", "tx";
 				};
 				ssiu17: ssiu-15 {
-					dmas = <&audma0 0xCB>, <&audma1 0xCC>;
+					dmas = <&audma0 0xcb>, <&audma1 0xcc>;
 					dma-names = "rx", "tx";
 				};
 				ssiu20: ssiu-16 {
@@ -1957,27 +1957,27 @@ ssiu21: ssiu-17 {
 					dma-names = "rx", "tx";
 				};
 				ssiu22: ssiu-18 {
-					dmas = <&audma0 0x6B>, <&audma1 0x6C>;
+					dmas = <&audma0 0x6b>, <&audma1 0x6c>;
 					dma-names = "rx", "tx";
 				};
 				ssiu23: ssiu-19 {
-					dmas = <&audma0 0x6D>, <&audma1 0x6E>;
+					dmas = <&audma0 0x6d>, <&audma1 0x6e>;
 					dma-names = "rx", "tx";
 				};
 				ssiu24: ssiu-20 {
-					dmas = <&audma0 0xCF>, <&audma1 0xCE>;
+					dmas = <&audma0 0xcf>, <&audma1 0xce>;
 					dma-names = "rx", "tx";
 				};
 				ssiu25: ssiu-21 {
-					dmas = <&audma0 0xEB>, <&audma1 0xEC>;
+					dmas = <&audma0 0xeb>, <&audma1 0xec>;
 					dma-names = "rx", "tx";
 				};
 				ssiu26: ssiu-22 {
-					dmas = <&audma0 0xED>, <&audma1 0xEE>;
+					dmas = <&audma0 0xed>, <&audma1 0xee>;
 					dma-names = "rx", "tx";
 				};
 				ssiu27: ssiu-23 {
-					dmas = <&audma0 0xEF>, <&audma1 0xF0>;
+					dmas = <&audma0 0xef>, <&audma1 0xf0>;
 					dma-names = "rx", "tx";
 				};
 				ssiu30: ssiu-24 {
@@ -2001,15 +2001,15 @@ ssiu34: ssiu-28 {
 					dma-names = "rx", "tx";
 				};
 				ssiu35: ssiu-29 {
-					dmas = <&audma0 0x29>, <&audma1 0x2A>;
+					dmas = <&audma0 0x29>, <&audma1 0x2a>;
 					dma-names = "rx", "tx";
 				};
 				ssiu36: ssiu-30 {
-					dmas = <&audma0 0x2B>, <&audma1 0x2C>;
+					dmas = <&audma0 0x2b>, <&audma1 0x2c>;
 					dma-names = "rx", "tx";
 				};
 				ssiu37: ssiu-31 {
-					dmas = <&audma0 0x2D>, <&audma1 0x2E>;
+					dmas = <&audma0 0x2d>, <&audma1 0x2e>;
 					dma-names = "rx", "tx";
 				};
 				ssiu40: ssiu-32 {
@@ -2021,19 +2021,19 @@ ssiu41: ssiu-33 {
 					dma-names = "rx", "tx";
 				};
 				ssiu42: ssiu-34 {
-					dmas = <&audma0 0x19>, <&audma1 0x1A>;
+					dmas = <&audma0 0x19>, <&audma1 0x1a>;
 					dma-names = "rx", "tx";
 				};
 				ssiu43: ssiu-35 {
-					dmas = <&audma0 0x1B>, <&audma1 0x1C>;
+					dmas = <&audma0 0x1b>, <&audma1 0x1c>;
 					dma-names = "rx", "tx";
 				};
 				ssiu44: ssiu-36 {
-					dmas = <&audma0 0x1D>, <&audma1 0x1E>;
+					dmas = <&audma0 0x1d>, <&audma1 0x1e>;
 					dma-names = "rx", "tx";
 				};
 				ssiu45: ssiu-37 {
-					dmas = <&audma0 0x1F>, <&audma1 0x20>;
+					dmas = <&audma0 0x1f>, <&audma1 0x20>;
 					dma-names = "rx", "tx";
 				};
 				ssiu46: ssiu-38 {
@@ -2065,7 +2065,7 @@ ssiu90: ssiu-44 {
 					dma-names = "rx", "tx";
 				};
 				ssiu91: ssiu-45 {
-					dmas = <&audma0 0x7F>, <&audma1 0x80>;
+					dmas = <&audma0 0x7f>, <&audma1 0x80>;
 					dma-names = "rx", "tx";
 				};
 				ssiu92: ssiu-46 {
@@ -2077,19 +2077,19 @@ ssiu93: ssiu-47 {
 					dma-names = "rx", "tx";
 				};
 				ssiu94: ssiu-48 {
-					dmas = <&audma0 0xA3>, <&audma1 0xA4>;
+					dmas = <&audma0 0xa3>, <&audma1 0xa4>;
 					dma-names = "rx", "tx";
 				};
 				ssiu95: ssiu-49 {
-					dmas = <&audma0 0xA5>, <&audma1 0xA6>;
+					dmas = <&audma0 0xa5>, <&audma1 0xa6>;
 					dma-names = "rx", "tx";
 				};
 				ssiu96: ssiu-50 {
-					dmas = <&audma0 0xA7>, <&audma1 0xA8>;
+					dmas = <&audma0 0xa7>, <&audma1 0xa8>;
 					dma-names = "rx", "tx";
 				};
 				ssiu97: ssiu-51 {
-					dmas = <&audma0 0xA9>, <&audma1 0xAA>;
+					dmas = <&audma0 0xa9>, <&audma1 0xaa>;
 					dma-names = "rx", "tx";
 				};
 			};
diff --git a/arch/arm64/boot/dts/renesas/r8a774b1.dtsi b/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
index c9857ea944ed..ceef0104f75e 100644
--- a/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
@@ -1785,7 +1785,7 @@ ssiu03: ssiu-3 {
 					dma-names = "rx", "tx";
 				};
 				ssiu04: ssiu-4 {
-					dmas = <&audma0 0x3F>, <&audma1 0x40>;
+					dmas = <&audma0 0x3f>, <&audma1 0x40>;
 					dma-names = "rx", "tx";
 				};
 				ssiu05: ssiu-5 {
@@ -1793,7 +1793,7 @@ ssiu05: ssiu-5 {
 					dma-names = "rx", "tx";
 				};
 				ssiu06: ssiu-6 {
-					dmas = <&audma0 0x4F>, <&audma1 0x50>;
+					dmas = <&audma0 0x4f>, <&audma1 0x50>;
 					dma-names = "rx", "tx";
 				};
 				ssiu07: ssiu-7 {
@@ -1805,7 +1805,7 @@ ssiu10: ssiu-8 {
 					dma-names = "rx", "tx";
 				};
 				ssiu11: ssiu-9 {
-					dmas = <&audma0 0x4B>, <&audma1 0x4C>;
+					dmas = <&audma0 0x4b>, <&audma1 0x4c>;
 					dma-names = "rx", "tx";
 				};
 				ssiu12: ssiu-10 {
@@ -1813,23 +1813,23 @@ ssiu12: ssiu-10 {
 					dma-names = "rx", "tx";
 				};
 				ssiu13: ssiu-11 {
-					dmas = <&audma0 0x59>, <&audma1 0x5A>;
+					dmas = <&audma0 0x59>, <&audma1 0x5a>;
 					dma-names = "rx", "tx";
 				};
 				ssiu14: ssiu-12 {
-					dmas = <&audma0 0x5F>, <&audma1 0x60>;
+					dmas = <&audma0 0x5f>, <&audma1 0x60>;
 					dma-names = "rx", "tx";
 				};
 				ssiu15: ssiu-13 {
-					dmas = <&audma0 0xC3>, <&audma1 0xC4>;
+					dmas = <&audma0 0xc3>, <&audma1 0xc4>;
 					dma-names = "rx", "tx";
 				};
 				ssiu16: ssiu-14 {
-					dmas = <&audma0 0xC7>, <&audma1 0xC8>;
+					dmas = <&audma0 0xc7>, <&audma1 0xc8>;
 					dma-names = "rx", "tx";
 				};
 				ssiu17: ssiu-15 {
-					dmas = <&audma0 0xCB>, <&audma1 0xCC>;
+					dmas = <&audma0 0xcb>, <&audma1 0xcc>;
 					dma-names = "rx", "tx";
 				};
 				ssiu20: ssiu-16 {
@@ -1841,27 +1841,27 @@ ssiu21: ssiu-17 {
 					dma-names = "rx", "tx";
 				};
 				ssiu22: ssiu-18 {
-					dmas = <&audma0 0x6B>, <&audma1 0x6C>;
+					dmas = <&audma0 0x6b>, <&audma1 0x6c>;
 					dma-names = "rx", "tx";
 				};
 				ssiu23: ssiu-19 {
-					dmas = <&audma0 0x6D>, <&audma1 0x6E>;
+					dmas = <&audma0 0x6d>, <&audma1 0x6e>;
 					dma-names = "rx", "tx";
 				};
 				ssiu24: ssiu-20 {
-					dmas = <&audma0 0xCF>, <&audma1 0xCE>;
+					dmas = <&audma0 0xcf>, <&audma1 0xce>;
 					dma-names = "rx", "tx";
 				};
 				ssiu25: ssiu-21 {
-					dmas = <&audma0 0xEB>, <&audma1 0xEC>;
+					dmas = <&audma0 0xeb>, <&audma1 0xec>;
 					dma-names = "rx", "tx";
 				};
 				ssiu26: ssiu-22 {
-					dmas = <&audma0 0xED>, <&audma1 0xEE>;
+					dmas = <&audma0 0xed>, <&audma1 0xee>;
 					dma-names = "rx", "tx";
 				};
 				ssiu27: ssiu-23 {
-					dmas = <&audma0 0xEF>, <&audma1 0xF0>;
+					dmas = <&audma0 0xef>, <&audma1 0xf0>;
 					dma-names = "rx", "tx";
 				};
 				ssiu30: ssiu-24 {
@@ -1885,15 +1885,15 @@ ssiu34: ssiu-28 {
 					dma-names = "rx", "tx";
 				};
 				ssiu35: ssiu-29 {
-					dmas = <&audma0 0x29>, <&audma1 0x2A>;
+					dmas = <&audma0 0x29>, <&audma1 0x2a>;
 					dma-names = "rx", "tx";
 				};
 				ssiu36: ssiu-30 {
-					dmas = <&audma0 0x2B>, <&audma1 0x2C>;
+					dmas = <&audma0 0x2b>, <&audma1 0x2c>;
 					dma-names = "rx", "tx";
 				};
 				ssiu37: ssiu-31 {
-					dmas = <&audma0 0x2D>, <&audma1 0x2E>;
+					dmas = <&audma0 0x2d>, <&audma1 0x2e>;
 					dma-names = "rx", "tx";
 				};
 				ssiu40: ssiu-32 {
@@ -1905,19 +1905,19 @@ ssiu41: ssiu-33 {
 					dma-names = "rx", "tx";
 				};
 				ssiu42: ssiu-34 {
-					dmas = <&audma0 0x19>, <&audma1 0x1A>;
+					dmas = <&audma0 0x19>, <&audma1 0x1a>;
 					dma-names = "rx", "tx";
 				};
 				ssiu43: ssiu-35 {
-					dmas = <&audma0 0x1B>, <&audma1 0x1C>;
+					dmas = <&audma0 0x1b>, <&audma1 0x1c>;
 					dma-names = "rx", "tx";
 				};
 				ssiu44: ssiu-36 {
-					dmas = <&audma0 0x1D>, <&audma1 0x1E>;
+					dmas = <&audma0 0x1d>, <&audma1 0x1e>;
 					dma-names = "rx", "tx";
 				};
 				ssiu45: ssiu-37 {
-					dmas = <&audma0 0x1F>, <&audma1 0x20>;
+					dmas = <&audma0 0x1f>, <&audma1 0x20>;
 					dma-names = "rx", "tx";
 				};
 				ssiu46: ssiu-38 {
@@ -1949,7 +1949,7 @@ ssiu90: ssiu-44 {
 					dma-names = "rx", "tx";
 				};
 				ssiu91: ssiu-45 {
-					dmas = <&audma0 0x7F>, <&audma1 0x80>;
+					dmas = <&audma0 0x7f>, <&audma1 0x80>;
 					dma-names = "rx", "tx";
 				};
 				ssiu92: ssiu-46 {
@@ -1961,19 +1961,19 @@ ssiu93: ssiu-47 {
 					dma-names = "rx", "tx";
 				};
 				ssiu94: ssiu-48 {
-					dmas = <&audma0 0xA3>, <&audma1 0xA4>;
+					dmas = <&audma0 0xa3>, <&audma1 0xa4>;
 					dma-names = "rx", "tx";
 				};
 				ssiu95: ssiu-49 {
-					dmas = <&audma0 0xA5>, <&audma1 0xA6>;
+					dmas = <&audma0 0xa5>, <&audma1 0xa6>;
 					dma-names = "rx", "tx";
 				};
 				ssiu96: ssiu-50 {
-					dmas = <&audma0 0xA7>, <&audma1 0xA8>;
+					dmas = <&audma0 0xa7>, <&audma1 0xa8>;
 					dma-names = "rx", "tx";
 				};
 				ssiu97: ssiu-51 {
-					dmas = <&audma0 0xA9>, <&audma1 0xAA>;
+					dmas = <&audma0 0xa9>, <&audma1 0xaa>;
 					dma-names = "rx", "tx";
 				};
 			};
diff --git a/arch/arm64/boot/dts/renesas/r8a774e1.dtsi b/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
index 52920a6bf592..9df5f1a42400 100644
--- a/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
@@ -1944,7 +1944,7 @@ ssiu03: ssiu-3 {
 					dma-names = "rx", "tx";
 				};
 				ssiu04: ssiu-4 {
-					dmas = <&audma0 0x3F>, <&audma1 0x40>;
+					dmas = <&audma0 0x3f>, <&audma1 0x40>;
 					dma-names = "rx", "tx";
 				};
 				ssiu05: ssiu-5 {
@@ -1952,7 +1952,7 @@ ssiu05: ssiu-5 {
 					dma-names = "rx", "tx";
 				};
 				ssiu06: ssiu-6 {
-					dmas = <&audma0 0x4F>, <&audma1 0x50>;
+					dmas = <&audma0 0x4f>, <&audma1 0x50>;
 					dma-names = "rx", "tx";
 				};
 				ssiu07: ssiu-7 {
@@ -1964,7 +1964,7 @@ ssiu10: ssiu-8 {
 					dma-names = "rx", "tx";
 				};
 				ssiu11: ssiu-9 {
-					dmas = <&audma0 0x4B>, <&audma1 0x4C>;
+					dmas = <&audma0 0x4b>, <&audma1 0x4c>;
 					dma-names = "rx", "tx";
 				};
 				ssiu12: ssiu-10 {
@@ -1972,23 +1972,23 @@ ssiu12: ssiu-10 {
 					dma-names = "rx", "tx";
 				};
 				ssiu13: ssiu-11 {
-					dmas = <&audma0 0x59>, <&audma1 0x5A>;
+					dmas = <&audma0 0x59>, <&audma1 0x5a>;
 					dma-names = "rx", "tx";
 				};
 				ssiu14: ssiu-12 {
-					dmas = <&audma0 0x5F>, <&audma1 0x60>;
+					dmas = <&audma0 0x5f>, <&audma1 0x60>;
 					dma-names = "rx", "tx";
 				};
 				ssiu15: ssiu-13 {
-					dmas = <&audma0 0xC3>, <&audma1 0xC4>;
+					dmas = <&audma0 0xc3>, <&audma1 0xc4>;
 					dma-names = "rx", "tx";
 				};
 				ssiu16: ssiu-14 {
-					dmas = <&audma0 0xC7>, <&audma1 0xC8>;
+					dmas = <&audma0 0xc7>, <&audma1 0xc8>;
 					dma-names = "rx", "tx";
 				};
 				ssiu17: ssiu-15 {
-					dmas = <&audma0 0xCB>, <&audma1 0xCC>;
+					dmas = <&audma0 0xcb>, <&audma1 0xcc>;
 					dma-names = "rx", "tx";
 				};
 				ssiu20: ssiu-16 {
@@ -2000,27 +2000,27 @@ ssiu21: ssiu-17 {
 					dma-names = "rx", "tx";
 				};
 				ssiu22: ssiu-18 {
-					dmas = <&audma0 0x6B>, <&audma1 0x6C>;
+					dmas = <&audma0 0x6b>, <&audma1 0x6c>;
 					dma-names = "rx", "tx";
 				};
 				ssiu23: ssiu-19 {
-					dmas = <&audma0 0x6D>, <&audma1 0x6E>;
+					dmas = <&audma0 0x6d>, <&audma1 0x6e>;
 					dma-names = "rx", "tx";
 				};
 				ssiu24: ssiu-20 {
-					dmas = <&audma0 0xCF>, <&audma1 0xCE>;
+					dmas = <&audma0 0xcf>, <&audma1 0xce>;
 					dma-names = "rx", "tx";
 				};
 				ssiu25: ssiu-21 {
-					dmas = <&audma0 0xEB>, <&audma1 0xEC>;
+					dmas = <&audma0 0xeb>, <&audma1 0xec>;
 					dma-names = "rx", "tx";
 				};
 				ssiu26: ssiu-22 {
-					dmas = <&audma0 0xED>, <&audma1 0xEE>;
+					dmas = <&audma0 0xed>, <&audma1 0xee>;
 					dma-names = "rx", "tx";
 				};
 				ssiu27: ssiu-23 {
-					dmas = <&audma0 0xEF>, <&audma1 0xF0>;
+					dmas = <&audma0 0xef>, <&audma1 0xf0>;
 					dma-names = "rx", "tx";
 				};
 				ssiu30: ssiu-24 {
@@ -2044,15 +2044,15 @@ ssiu34: ssiu-28 {
 					dma-names = "rx", "tx";
 				};
 				ssiu35: ssiu-29 {
-					dmas = <&audma0 0x29>, <&audma1 0x2A>;
+					dmas = <&audma0 0x29>, <&audma1 0x2a>;
 					dma-names = "rx", "tx";
 				};
 				ssiu36: ssiu-30 {
-					dmas = <&audma0 0x2B>, <&audma1 0x2C>;
+					dmas = <&audma0 0x2b>, <&audma1 0x2c>;
 					dma-names = "rx", "tx";
 				};
 				ssiu37: ssiu-31 {
-					dmas = <&audma0 0x2D>, <&audma1 0x2E>;
+					dmas = <&audma0 0x2d>, <&audma1 0x2e>;
 					dma-names = "rx", "tx";
 				};
 				ssiu40: ssiu-32 {
@@ -2064,19 +2064,19 @@ ssiu41: ssiu-33 {
 					dma-names = "rx", "tx";
 				};
 				ssiu42: ssiu-34 {
-					dmas = <&audma0 0x19>, <&audma1 0x1A>;
+					dmas = <&audma0 0x19>, <&audma1 0x1a>;
 					dma-names = "rx", "tx";
 				};
 				ssiu43: ssiu-35 {
-					dmas = <&audma0 0x1B>, <&audma1 0x1C>;
+					dmas = <&audma0 0x1b>, <&audma1 0x1c>;
 					dma-names = "rx", "tx";
 				};
 				ssiu44: ssiu-36 {
-					dmas = <&audma0 0x1D>, <&audma1 0x1E>;
+					dmas = <&audma0 0x1d>, <&audma1 0x1e>;
 					dma-names = "rx", "tx";
 				};
 				ssiu45: ssiu-37 {
-					dmas = <&audma0 0x1F>, <&audma1 0x20>;
+					dmas = <&audma0 0x1f>, <&audma1 0x20>;
 					dma-names = "rx", "tx";
 				};
 				ssiu46: ssiu-38 {
@@ -2108,7 +2108,7 @@ ssiu90: ssiu-44 {
 					dma-names = "rx", "tx";
 				};
 				ssiu91: ssiu-45 {
-					dmas = <&audma0 0x7F>, <&audma1 0x80>;
+					dmas = <&audma0 0x7f>, <&audma1 0x80>;
 					dma-names = "rx", "tx";
 				};
 				ssiu92: ssiu-46 {
@@ -2120,19 +2120,19 @@ ssiu93: ssiu-47 {
 					dma-names = "rx", "tx";
 				};
 				ssiu94: ssiu-48 {
-					dmas = <&audma0 0xA3>, <&audma1 0xA4>;
+					dmas = <&audma0 0xa3>, <&audma1 0xa4>;
 					dma-names = "rx", "tx";
 				};
 				ssiu95: ssiu-49 {
-					dmas = <&audma0 0xA5>, <&audma1 0xA6>;
+					dmas = <&audma0 0xa5>, <&audma1 0xa6>;
 					dma-names = "rx", "tx";
 				};
 				ssiu96: ssiu-50 {
-					dmas = <&audma0 0xA7>, <&audma1 0xA8>;
+					dmas = <&audma0 0xa7>, <&audma1 0xa8>;
 					dma-names = "rx", "tx";
 				};
 				ssiu97: ssiu-51 {
-					dmas = <&audma0 0xA9>, <&audma1 0xAA>;
+					dmas = <&audma0 0xa9>, <&audma1 0xaa>;
 					dma-names = "rx", "tx";
 				};
 			};
diff --git a/arch/arm64/boot/dts/renesas/r8a77951.dtsi b/arch/arm64/boot/dts/renesas/r8a77951.dtsi
index 9ad700bde4ba..607f62a448d8 100644
--- a/arch/arm64/boot/dts/renesas/r8a77951.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77951.dtsi
@@ -2176,7 +2176,7 @@ ssiu03: ssiu-3 {
 					dma-names = "rx", "tx";
 				};
 				ssiu04: ssiu-4 {
-					dmas = <&audma0 0x3F>, <&audma1 0x40>;
+					dmas = <&audma0 0x3f>, <&audma1 0x40>;
 					dma-names = "rx", "tx";
 				};
 				ssiu05: ssiu-5 {
@@ -2184,7 +2184,7 @@ ssiu05: ssiu-5 {
 					dma-names = "rx", "tx";
 				};
 				ssiu06: ssiu-6 {
-					dmas = <&audma0 0x4F>, <&audma1 0x50>;
+					dmas = <&audma0 0x4f>, <&audma1 0x50>;
 					dma-names = "rx", "tx";
 				};
 				ssiu07: ssiu-7 {
@@ -2196,7 +2196,7 @@ ssiu10: ssiu-8 {
 					dma-names = "rx", "tx";
 				};
 				ssiu11: ssiu-9 {
-					dmas = <&audma0 0x4B>, <&audma1 0x4C>;
+					dmas = <&audma0 0x4b>, <&audma1 0x4c>;
 					dma-names = "rx", "tx";
 				};
 				ssiu12: ssiu-10 {
@@ -2204,23 +2204,23 @@ ssiu12: ssiu-10 {
 					dma-names = "rx", "tx";
 				};
 				ssiu13: ssiu-11 {
-					dmas = <&audma0 0x59>, <&audma1 0x5A>;
+					dmas = <&audma0 0x59>, <&audma1 0x5a>;
 					dma-names = "rx", "tx";
 				};
 				ssiu14: ssiu-12 {
-					dmas = <&audma0 0x5F>, <&audma1 0x60>;
+					dmas = <&audma0 0x5f>, <&audma1 0x60>;
 					dma-names = "rx", "tx";
 				};
 				ssiu15: ssiu-13 {
-					dmas = <&audma0 0xC3>, <&audma1 0xC4>;
+					dmas = <&audma0 0xc3>, <&audma1 0xc4>;
 					dma-names = "rx", "tx";
 				};
 				ssiu16: ssiu-14 {
-					dmas = <&audma0 0xC7>, <&audma1 0xC8>;
+					dmas = <&audma0 0xc7>, <&audma1 0xc8>;
 					dma-names = "rx", "tx";
 				};
 				ssiu17: ssiu-15 {
-					dmas = <&audma0 0xCB>, <&audma1 0xCC>;
+					dmas = <&audma0 0xcb>, <&audma1 0xcc>;
 					dma-names = "rx", "tx";
 				};
 				ssiu20: ssiu-16 {
@@ -2232,27 +2232,27 @@ ssiu21: ssiu-17 {
 					dma-names = "rx", "tx";
 				};
 				ssiu22: ssiu-18 {
-					dmas = <&audma0 0x6B>, <&audma1 0x6C>;
+					dmas = <&audma0 0x6b>, <&audma1 0x6c>;
 					dma-names = "rx", "tx";
 				};
 				ssiu23: ssiu-19 {
-					dmas = <&audma0 0x6D>, <&audma1 0x6E>;
+					dmas = <&audma0 0x6d>, <&audma1 0x6e>;
 					dma-names = "rx", "tx";
 				};
 				ssiu24: ssiu-20 {
-					dmas = <&audma0 0xCF>, <&audma1 0xCE>;
+					dmas = <&audma0 0xcf>, <&audma1 0xce>;
 					dma-names = "rx", "tx";
 				};
 				ssiu25: ssiu-21 {
-					dmas = <&audma0 0xEB>, <&audma1 0xEC>;
+					dmas = <&audma0 0xeb>, <&audma1 0xec>;
 					dma-names = "rx", "tx";
 				};
 				ssiu26: ssiu-22 {
-					dmas = <&audma0 0xED>, <&audma1 0xEE>;
+					dmas = <&audma0 0xed>, <&audma1 0xee>;
 					dma-names = "rx", "tx";
 				};
 				ssiu27: ssiu-23 {
-					dmas = <&audma0 0xEF>, <&audma1 0xF0>;
+					dmas = <&audma0 0xef>, <&audma1 0xf0>;
 					dma-names = "rx", "tx";
 				};
 				ssiu30: ssiu-24 {
@@ -2276,15 +2276,15 @@ ssiu34: ssiu-28 {
 					dma-names = "rx", "tx";
 				};
 				ssiu35: ssiu-29 {
-					dmas = <&audma0 0x29>, <&audma1 0x2A>;
+					dmas = <&audma0 0x29>, <&audma1 0x2a>;
 					dma-names = "rx", "tx";
 				};
 				ssiu36: ssiu-30 {
-					dmas = <&audma0 0x2B>, <&audma1 0x2C>;
+					dmas = <&audma0 0x2b>, <&audma1 0x2c>;
 					dma-names = "rx", "tx";
 				};
 				ssiu37: ssiu-31 {
-					dmas = <&audma0 0x2D>, <&audma1 0x2E>;
+					dmas = <&audma0 0x2d>, <&audma1 0x2e>;
 					dma-names = "rx", "tx";
 				};
 				ssiu40: ssiu-32 {
@@ -2296,19 +2296,19 @@ ssiu41: ssiu-33 {
 					dma-names = "rx", "tx";
 				};
 				ssiu42: ssiu-34 {
-					dmas = <&audma0 0x19>, <&audma1 0x1A>;
+					dmas = <&audma0 0x19>, <&audma1 0x1a>;
 					dma-names = "rx", "tx";
 				};
 				ssiu43: ssiu-35 {
-					dmas = <&audma0 0x1B>, <&audma1 0x1C>;
+					dmas = <&audma0 0x1b>, <&audma1 0x1c>;
 					dma-names = "rx", "tx";
 				};
 				ssiu44: ssiu-36 {
-					dmas = <&audma0 0x1D>, <&audma1 0x1E>;
+					dmas = <&audma0 0x1d>, <&audma1 0x1e>;
 					dma-names = "rx", "tx";
 				};
 				ssiu45: ssiu-37 {
-					dmas = <&audma0 0x1F>, <&audma1 0x20>;
+					dmas = <&audma0 0x1f>, <&audma1 0x20>;
 					dma-names = "rx", "tx";
 				};
 				ssiu46: ssiu-38 {
@@ -2340,7 +2340,7 @@ ssiu90: ssiu-44 {
 					dma-names = "rx", "tx";
 				};
 				ssiu91: ssiu-45 {
-					dmas = <&audma0 0x7F>, <&audma1 0x80>;
+					dmas = <&audma0 0x7f>, <&audma1 0x80>;
 					dma-names = "rx", "tx";
 				};
 				ssiu92: ssiu-46 {
@@ -2352,19 +2352,19 @@ ssiu93: ssiu-47 {
 					dma-names = "rx", "tx";
 				};
 				ssiu94: ssiu-48 {
-					dmas = <&audma0 0xA3>, <&audma1 0xA4>;
+					dmas = <&audma0 0xa3>, <&audma1 0xa4>;
 					dma-names = "rx", "tx";
 				};
 				ssiu95: ssiu-49 {
-					dmas = <&audma0 0xA5>, <&audma1 0xA6>;
+					dmas = <&audma0 0xa5>, <&audma1 0xa6>;
 					dma-names = "rx", "tx";
 				};
 				ssiu96: ssiu-50 {
-					dmas = <&audma0 0xA7>, <&audma1 0xA8>;
+					dmas = <&audma0 0xa7>, <&audma1 0xa8>;
 					dma-names = "rx", "tx";
 				};
 				ssiu97: ssiu-51 {
-					dmas = <&audma0 0xA9>, <&audma1 0xAA>;
+					dmas = <&audma0 0xa9>, <&audma1 0xaa>;
 					dma-names = "rx", "tx";
 				};
 			};
diff --git a/arch/arm64/boot/dts/renesas/r8a77960.dtsi b/arch/arm64/boot/dts/renesas/r8a77960.dtsi
index e03b1f7cbfd6..e64c7b1aebc4 100644
--- a/arch/arm64/boot/dts/renesas/r8a77960.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77960.dtsi
@@ -2101,7 +2101,7 @@ ssiu03: ssiu-3 {
 					dma-names = "rx", "tx";
 				};
 				ssiu04: ssiu-4 {
-					dmas = <&audma0 0x3F>, <&audma1 0x40>;
+					dmas = <&audma0 0x3f>, <&audma1 0x40>;
 					dma-names = "rx", "tx";
 				};
 				ssiu05: ssiu-5 {
@@ -2109,7 +2109,7 @@ ssiu05: ssiu-5 {
 					dma-names = "rx", "tx";
 				};
 				ssiu06: ssiu-6 {
-					dmas = <&audma0 0x4F>, <&audma1 0x50>;
+					dmas = <&audma0 0x4f>, <&audma1 0x50>;
 					dma-names = "rx", "tx";
 				};
 				ssiu07: ssiu-7 {
@@ -2121,7 +2121,7 @@ ssiu10: ssiu-8 {
 					dma-names = "rx", "tx";
 				};
 				ssiu11: ssiu-9 {
-					dmas = <&audma0 0x4B>, <&audma1 0x4C>;
+					dmas = <&audma0 0x4b>, <&audma1 0x4c>;
 					dma-names = "rx", "tx";
 				};
 				ssiu12: ssiu-10 {
@@ -2129,23 +2129,23 @@ ssiu12: ssiu-10 {
 					dma-names = "rx", "tx";
 				};
 				ssiu13: ssiu-11 {
-					dmas = <&audma0 0x59>, <&audma1 0x5A>;
+					dmas = <&audma0 0x59>, <&audma1 0x5a>;
 					dma-names = "rx", "tx";
 				};
 				ssiu14: ssiu-12 {
-					dmas = <&audma0 0x5F>, <&audma1 0x60>;
+					dmas = <&audma0 0x5f>, <&audma1 0x60>;
 					dma-names = "rx", "tx";
 				};
 				ssiu15: ssiu-13 {
-					dmas = <&audma0 0xC3>, <&audma1 0xC4>;
+					dmas = <&audma0 0xc3>, <&audma1 0xc4>;
 					dma-names = "rx", "tx";
 				};
 				ssiu16: ssiu-14 {
-					dmas = <&audma0 0xC7>, <&audma1 0xC8>;
+					dmas = <&audma0 0xc7>, <&audma1 0xc8>;
 					dma-names = "rx", "tx";
 				};
 				ssiu17: ssiu-15 {
-					dmas = <&audma0 0xCB>, <&audma1 0xCC>;
+					dmas = <&audma0 0xcb>, <&audma1 0xcc>;
 					dma-names = "rx", "tx";
 				};
 				ssiu20: ssiu-16 {
@@ -2157,27 +2157,27 @@ ssiu21: ssiu-17 {
 					dma-names = "rx", "tx";
 				};
 				ssiu22: ssiu-18 {
-					dmas = <&audma0 0x6B>, <&audma1 0x6C>;
+					dmas = <&audma0 0x6b>, <&audma1 0x6c>;
 					dma-names = "rx", "tx";
 				};
 				ssiu23: ssiu-19 {
-					dmas = <&audma0 0x6D>, <&audma1 0x6E>;
+					dmas = <&audma0 0x6d>, <&audma1 0x6e>;
 					dma-names = "rx", "tx";
 				};
 				ssiu24: ssiu-20 {
-					dmas = <&audma0 0xCF>, <&audma1 0xCE>;
+					dmas = <&audma0 0xcf>, <&audma1 0xce>;
 					dma-names = "rx", "tx";
 				};
 				ssiu25: ssiu-21 {
-					dmas = <&audma0 0xEB>, <&audma1 0xEC>;
+					dmas = <&audma0 0xeb>, <&audma1 0xec>;
 					dma-names = "rx", "tx";
 				};
 				ssiu26: ssiu-22 {
-					dmas = <&audma0 0xED>, <&audma1 0xEE>;
+					dmas = <&audma0 0xed>, <&audma1 0xee>;
 					dma-names = "rx", "tx";
 				};
 				ssiu27: ssiu-23 {
-					dmas = <&audma0 0xEF>, <&audma1 0xF0>;
+					dmas = <&audma0 0xef>, <&audma1 0xf0>;
 					dma-names = "rx", "tx";
 				};
 				ssiu30: ssiu-24 {
@@ -2201,15 +2201,15 @@ ssiu34: ssiu-28 {
 					dma-names = "rx", "tx";
 				};
 				ssiu35: ssiu-29 {
-					dmas = <&audma0 0x29>, <&audma1 0x2A>;
+					dmas = <&audma0 0x29>, <&audma1 0x2a>;
 					dma-names = "rx", "tx";
 				};
 				ssiu36: ssiu-30 {
-					dmas = <&audma0 0x2B>, <&audma1 0x2C>;
+					dmas = <&audma0 0x2b>, <&audma1 0x2c>;
 					dma-names = "rx", "tx";
 				};
 				ssiu37: ssiu-31 {
-					dmas = <&audma0 0x2D>, <&audma1 0x2E>;
+					dmas = <&audma0 0x2d>, <&audma1 0x2e>;
 					dma-names = "rx", "tx";
 				};
 				ssiu40: ssiu-32 {
@@ -2221,19 +2221,19 @@ ssiu41: ssiu-33 {
 					dma-names = "rx", "tx";
 				};
 				ssiu42: ssiu-34 {
-					dmas = <&audma0 0x19>, <&audma1 0x1A>;
+					dmas = <&audma0 0x19>, <&audma1 0x1a>;
 					dma-names = "rx", "tx";
 				};
 				ssiu43: ssiu-35 {
-					dmas = <&audma0 0x1B>, <&audma1 0x1C>;
+					dmas = <&audma0 0x1b>, <&audma1 0x1c>;
 					dma-names = "rx", "tx";
 				};
 				ssiu44: ssiu-36 {
-					dmas = <&audma0 0x1D>, <&audma1 0x1E>;
+					dmas = <&audma0 0x1d>, <&audma1 0x1e>;
 					dma-names = "rx", "tx";
 				};
 				ssiu45: ssiu-37 {
-					dmas = <&audma0 0x1F>, <&audma1 0x20>;
+					dmas = <&audma0 0x1f>, <&audma1 0x20>;
 					dma-names = "rx", "tx";
 				};
 				ssiu46: ssiu-38 {
@@ -2265,7 +2265,7 @@ ssiu90: ssiu-44 {
 					dma-names = "rx", "tx";
 				};
 				ssiu91: ssiu-45 {
-					dmas = <&audma0 0x7F>, <&audma1 0x80>;
+					dmas = <&audma0 0x7f>, <&audma1 0x80>;
 					dma-names = "rx", "tx";
 				};
 				ssiu92: ssiu-46 {
@@ -2277,19 +2277,19 @@ ssiu93: ssiu-47 {
 					dma-names = "rx", "tx";
 				};
 				ssiu94: ssiu-48 {
-					dmas = <&audma0 0xA3>, <&audma1 0xA4>;
+					dmas = <&audma0 0xa3>, <&audma1 0xa4>;
 					dma-names = "rx", "tx";
 				};
 				ssiu95: ssiu-49 {
-					dmas = <&audma0 0xA5>, <&audma1 0xA6>;
+					dmas = <&audma0 0xa5>, <&audma1 0xa6>;
 					dma-names = "rx", "tx";
 				};
 				ssiu96: ssiu-50 {
-					dmas = <&audma0 0xA7>, <&audma1 0xA8>;
+					dmas = <&audma0 0xa7>, <&audma1 0xa8>;
 					dma-names = "rx", "tx";
 				};
 				ssiu97: ssiu-51 {
-					dmas = <&audma0 0xA9>, <&audma1 0xAA>;
+					dmas = <&audma0 0xa9>, <&audma1 0xaa>;
 					dma-names = "rx", "tx";
 				};
 			};
diff --git a/arch/arm64/boot/dts/renesas/r8a77961.dtsi b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
index 31b11bdab69b..89f6c052c5e0 100644
--- a/arch/arm64/boot/dts/renesas/r8a77961.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
@@ -1981,7 +1981,7 @@ ssiu03: ssiu-3 {
 					dma-names = "rx", "tx";
 				};
 				ssiu04: ssiu-4 {
-					dmas = <&audma0 0x3F>, <&audma1 0x40>;
+					dmas = <&audma0 0x3f>, <&audma1 0x40>;
 					dma-names = "rx", "tx";
 				};
 				ssiu05: ssiu-5 {
@@ -1989,7 +1989,7 @@ ssiu05: ssiu-5 {
 					dma-names = "rx", "tx";
 				};
 				ssiu06: ssiu-6 {
-					dmas = <&audma0 0x4F>, <&audma1 0x50>;
+					dmas = <&audma0 0x4f>, <&audma1 0x50>;
 					dma-names = "rx", "tx";
 				};
 				ssiu07: ssiu-7 {
@@ -2001,7 +2001,7 @@ ssiu10: ssiu-8 {
 					dma-names = "rx", "tx";
 				};
 				ssiu11: ssiu-9 {
-					dmas = <&audma0 0x4B>, <&audma1 0x4C>;
+					dmas = <&audma0 0x4b>, <&audma1 0x4c>;
 					dma-names = "rx", "tx";
 				};
 				ssiu12: ssiu-10 {
@@ -2009,23 +2009,23 @@ ssiu12: ssiu-10 {
 					dma-names = "rx", "tx";
 				};
 				ssiu13: ssiu-11 {
-					dmas = <&audma0 0x59>, <&audma1 0x5A>;
+					dmas = <&audma0 0x59>, <&audma1 0x5a>;
 					dma-names = "rx", "tx";
 				};
 				ssiu14: ssiu-12 {
-					dmas = <&audma0 0x5F>, <&audma1 0x60>;
+					dmas = <&audma0 0x5f>, <&audma1 0x60>;
 					dma-names = "rx", "tx";
 				};
 				ssiu15: ssiu-13 {
-					dmas = <&audma0 0xC3>, <&audma1 0xC4>;
+					dmas = <&audma0 0xc3>, <&audma1 0xc4>;
 					dma-names = "rx", "tx";
 				};
 				ssiu16: ssiu-14 {
-					dmas = <&audma0 0xC7>, <&audma1 0xC8>;
+					dmas = <&audma0 0xc7>, <&audma1 0xc8>;
 					dma-names = "rx", "tx";
 				};
 				ssiu17: ssiu-15 {
-					dmas = <&audma0 0xCB>, <&audma1 0xCC>;
+					dmas = <&audma0 0xcb>, <&audma1 0xcc>;
 					dma-names = "rx", "tx";
 				};
 				ssiu20: ssiu-16 {
@@ -2037,27 +2037,27 @@ ssiu21: ssiu-17 {
 					dma-names = "rx", "tx";
 				};
 				ssiu22: ssiu-18 {
-					dmas = <&audma0 0x6B>, <&audma1 0x6C>;
+					dmas = <&audma0 0x6b>, <&audma1 0x6c>;
 					dma-names = "rx", "tx";
 				};
 				ssiu23: ssiu-19 {
-					dmas = <&audma0 0x6D>, <&audma1 0x6E>;
+					dmas = <&audma0 0x6d>, <&audma1 0x6e>;
 					dma-names = "rx", "tx";
 				};
 				ssiu24: ssiu-20 {
-					dmas = <&audma0 0xCF>, <&audma1 0xCE>;
+					dmas = <&audma0 0xcf>, <&audma1 0xce>;
 					dma-names = "rx", "tx";
 				};
 				ssiu25: ssiu-21 {
-					dmas = <&audma0 0xEB>, <&audma1 0xEC>;
+					dmas = <&audma0 0xeb>, <&audma1 0xec>;
 					dma-names = "rx", "tx";
 				};
 				ssiu26: ssiu-22 {
-					dmas = <&audma0 0xED>, <&audma1 0xEE>;
+					dmas = <&audma0 0xed>, <&audma1 0xee>;
 					dma-names = "rx", "tx";
 				};
 				ssiu27: ssiu-23 {
-					dmas = <&audma0 0xEF>, <&audma1 0xF0>;
+					dmas = <&audma0 0xef>, <&audma1 0xf0>;
 					dma-names = "rx", "tx";
 				};
 				ssiu30: ssiu-24 {
@@ -2081,15 +2081,15 @@ ssiu34: ssiu-28 {
 					dma-names = "rx", "tx";
 				};
 				ssiu35: ssiu-29 {
-					dmas = <&audma0 0x29>, <&audma1 0x2A>;
+					dmas = <&audma0 0x29>, <&audma1 0x2a>;
 					dma-names = "rx", "tx";
 				};
 				ssiu36: ssiu-30 {
-					dmas = <&audma0 0x2B>, <&audma1 0x2C>;
+					dmas = <&audma0 0x2b>, <&audma1 0x2c>;
 					dma-names = "rx", "tx";
 				};
 				ssiu37: ssiu-31 {
-					dmas = <&audma0 0x2D>, <&audma1 0x2E>;
+					dmas = <&audma0 0x2d>, <&audma1 0x2e>;
 					dma-names = "rx", "tx";
 				};
 				ssiu40: ssiu-32 {
@@ -2101,19 +2101,19 @@ ssiu41: ssiu-33 {
 					dma-names = "rx", "tx";
 				};
 				ssiu42: ssiu-34 {
-					dmas = <&audma0 0x19>, <&audma1 0x1A>;
+					dmas = <&audma0 0x19>, <&audma1 0x1a>;
 					dma-names = "rx", "tx";
 				};
 				ssiu43: ssiu-35 {
-					dmas = <&audma0 0x1B>, <&audma1 0x1C>;
+					dmas = <&audma0 0x1b>, <&audma1 0x1c>;
 					dma-names = "rx", "tx";
 				};
 				ssiu44: ssiu-36 {
-					dmas = <&audma0 0x1D>, <&audma1 0x1E>;
+					dmas = <&audma0 0x1d>, <&audma1 0x1e>;
 					dma-names = "rx", "tx";
 				};
 				ssiu45: ssiu-37 {
-					dmas = <&audma0 0x1F>, <&audma1 0x20>;
+					dmas = <&audma0 0x1f>, <&audma1 0x20>;
 					dma-names = "rx", "tx";
 				};
 				ssiu46: ssiu-38 {
@@ -2145,7 +2145,7 @@ ssiu90: ssiu-44 {
 					dma-names = "rx", "tx";
 				};
 				ssiu91: ssiu-45 {
-					dmas = <&audma0 0x7F>, <&audma1 0x80>;
+					dmas = <&audma0 0x7f>, <&audma1 0x80>;
 					dma-names = "rx", "tx";
 				};
 				ssiu92: ssiu-46 {
@@ -2157,19 +2157,19 @@ ssiu93: ssiu-47 {
 					dma-names = "rx", "tx";
 				};
 				ssiu94: ssiu-48 {
-					dmas = <&audma0 0xA3>, <&audma1 0xA4>;
+					dmas = <&audma0 0xa3>, <&audma1 0xa4>;
 					dma-names = "rx", "tx";
 				};
 				ssiu95: ssiu-49 {
-					dmas = <&audma0 0xA5>, <&audma1 0xA6>;
+					dmas = <&audma0 0xa5>, <&audma1 0xa6>;
 					dma-names = "rx", "tx";
 				};
 				ssiu96: ssiu-50 {
-					dmas = <&audma0 0xA7>, <&audma1 0xA8>;
+					dmas = <&audma0 0xa7>, <&audma1 0xa8>;
 					dma-names = "rx", "tx";
 				};
 				ssiu97: ssiu-51 {
-					dmas = <&audma0 0xA9>, <&audma1 0xAA>;
+					dmas = <&audma0 0xa9>, <&audma1 0xaa>;
 					dma-names = "rx", "tx";
 				};
 			};
diff --git a/arch/arm64/boot/dts/renesas/r8a77965.dtsi b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
index 4e730144e5fd..425561e658ca 100644
--- a/arch/arm64/boot/dts/renesas/r8a77965.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
@@ -1911,7 +1911,7 @@ ssiu03: ssiu-3 {
 					dma-names = "rx", "tx";
 				};
 				ssiu04: ssiu-4 {
-					dmas = <&audma0 0x3F>, <&audma1 0x40>;
+					dmas = <&audma0 0x3f>, <&audma1 0x40>;
 					dma-names = "rx", "tx";
 				};
 				ssiu05: ssiu-5 {
@@ -1919,7 +1919,7 @@ ssiu05: ssiu-5 {
 					dma-names = "rx", "tx";
 				};
 				ssiu06: ssiu-6 {
-					dmas = <&audma0 0x4F>, <&audma1 0x50>;
+					dmas = <&audma0 0x4f>, <&audma1 0x50>;
 					dma-names = "rx", "tx";
 				};
 				ssiu07: ssiu-7 {
@@ -1931,7 +1931,7 @@ ssiu10: ssiu-8 {
 					dma-names = "rx", "tx";
 				};
 				ssiu11: ssiu-9 {
-					dmas = <&audma0 0x4B>, <&audma1 0x4C>;
+					dmas = <&audma0 0x4b>, <&audma1 0x4c>;
 					dma-names = "rx", "tx";
 				};
 				ssiu12: ssiu-10 {
@@ -1939,23 +1939,23 @@ ssiu12: ssiu-10 {
 					dma-names = "rx", "tx";
 				};
 				ssiu13: ssiu-11 {
-					dmas = <&audma0 0x59>, <&audma1 0x5A>;
+					dmas = <&audma0 0x59>, <&audma1 0x5a>;
 					dma-names = "rx", "tx";
 				};
 				ssiu14: ssiu-12 {
-					dmas = <&audma0 0x5F>, <&audma1 0x60>;
+					dmas = <&audma0 0x5f>, <&audma1 0x60>;
 					dma-names = "rx", "tx";
 				};
 				ssiu15: ssiu-13 {
-					dmas = <&audma0 0xC3>, <&audma1 0xC4>;
+					dmas = <&audma0 0xc3>, <&audma1 0xc4>;
 					dma-names = "rx", "tx";
 				};
 				ssiu16: ssiu-14 {
-					dmas = <&audma0 0xC7>, <&audma1 0xC8>;
+					dmas = <&audma0 0xc7>, <&audma1 0xc8>;
 					dma-names = "rx", "tx";
 				};
 				ssiu17: ssiu-15 {
-					dmas = <&audma0 0xCB>, <&audma1 0xCC>;
+					dmas = <&audma0 0xcb>, <&audma1 0xcc>;
 					dma-names = "rx", "tx";
 				};
 				ssiu20: ssiu-16 {
@@ -1967,27 +1967,27 @@ ssiu21: ssiu-17 {
 					dma-names = "rx", "tx";
 				};
 				ssiu22: ssiu-18 {
-					dmas = <&audma0 0x6B>, <&audma1 0x6C>;
+					dmas = <&audma0 0x6b>, <&audma1 0x6c>;
 					dma-names = "rx", "tx";
 				};
 				ssiu23: ssiu-19 {
-					dmas = <&audma0 0x6D>, <&audma1 0x6E>;
+					dmas = <&audma0 0x6d>, <&audma1 0x6e>;
 					dma-names = "rx", "tx";
 				};
 				ssiu24: ssiu-20 {
-					dmas = <&audma0 0xCF>, <&audma1 0xCE>;
+					dmas = <&audma0 0xcf>, <&audma1 0xce>;
 					dma-names = "rx", "tx";
 				};
 				ssiu25: ssiu-21 {
-					dmas = <&audma0 0xEB>, <&audma1 0xEC>;
+					dmas = <&audma0 0xeb>, <&audma1 0xec>;
 					dma-names = "rx", "tx";
 				};
 				ssiu26: ssiu-22 {
-					dmas = <&audma0 0xED>, <&audma1 0xEE>;
+					dmas = <&audma0 0xed>, <&audma1 0xee>;
 					dma-names = "rx", "tx";
 				};
 				ssiu27: ssiu-23 {
-					dmas = <&audma0 0xEF>, <&audma1 0xF0>;
+					dmas = <&audma0 0xef>, <&audma1 0xf0>;
 					dma-names = "rx", "tx";
 				};
 				ssiu30: ssiu-24 {
@@ -2011,15 +2011,15 @@ ssiu34: ssiu-28 {
 					dma-names = "rx", "tx";
 				};
 				ssiu35: ssiu-29 {
-					dmas = <&audma0 0x29>, <&audma1 0x2A>;
+					dmas = <&audma0 0x29>, <&audma1 0x2a>;
 					dma-names = "rx", "tx";
 				};
 				ssiu36: ssiu-30 {
-					dmas = <&audma0 0x2B>, <&audma1 0x2C>;
+					dmas = <&audma0 0x2b>, <&audma1 0x2c>;
 					dma-names = "rx", "tx";
 				};
 				ssiu37: ssiu-31 {
-					dmas = <&audma0 0x2D>, <&audma1 0x2E>;
+					dmas = <&audma0 0x2d>, <&audma1 0x2e>;
 					dma-names = "rx", "tx";
 				};
 				ssiu40: ssiu-32 {
@@ -2031,19 +2031,19 @@ ssiu41: ssiu-33 {
 					dma-names = "rx", "tx";
 				};
 				ssiu42: ssiu-34 {
-					dmas = <&audma0 0x19>, <&audma1 0x1A>;
+					dmas = <&audma0 0x19>, <&audma1 0x1a>;
 					dma-names = "rx", "tx";
 				};
 				ssiu43: ssiu-35 {
-					dmas = <&audma0 0x1B>, <&audma1 0x1C>;
+					dmas = <&audma0 0x1b>, <&audma1 0x1c>;
 					dma-names = "rx", "tx";
 				};
 				ssiu44: ssiu-36 {
-					dmas = <&audma0 0x1D>, <&audma1 0x1E>;
+					dmas = <&audma0 0x1d>, <&audma1 0x1e>;
 					dma-names = "rx", "tx";
 				};
 				ssiu45: ssiu-37 {
-					dmas = <&audma0 0x1F>, <&audma1 0x20>;
+					dmas = <&audma0 0x1f>, <&audma1 0x20>;
 					dma-names = "rx", "tx";
 				};
 				ssiu46: ssiu-38 {
@@ -2075,7 +2075,7 @@ ssiu90: ssiu-44 {
 					dma-names = "rx", "tx";
 				};
 				ssiu91: ssiu-45 {
-					dmas = <&audma0 0x7F>, <&audma1 0x80>;
+					dmas = <&audma0 0x7f>, <&audma1 0x80>;
 					dma-names = "rx", "tx";
 				};
 				ssiu92: ssiu-46 {
@@ -2087,19 +2087,19 @@ ssiu93: ssiu-47 {
 					dma-names = "rx", "tx";
 				};
 				ssiu94: ssiu-48 {
-					dmas = <&audma0 0xA3>, <&audma1 0xA4>;
+					dmas = <&audma0 0xa3>, <&audma1 0xa4>;
 					dma-names = "rx", "tx";
 				};
 				ssiu95: ssiu-49 {
-					dmas = <&audma0 0xA5>, <&audma1 0xA6>;
+					dmas = <&audma0 0xa5>, <&audma1 0xa6>;
 					dma-names = "rx", "tx";
 				};
 				ssiu96: ssiu-50 {
-					dmas = <&audma0 0xA7>, <&audma1 0xA8>;
+					dmas = <&audma0 0xa7>, <&audma1 0xa8>;
 					dma-names = "rx", "tx";
 				};
 				ssiu97: ssiu-51 {
-					dmas = <&audma0 0xA9>, <&audma1 0xAA>;
+					dmas = <&audma0 0xa9>, <&audma1 0xaa>;
 					dma-names = "rx", "tx";
 				};
 			};
diff --git a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
index bd52d60bafb9..29273da81995 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
@@ -1371,7 +1371,7 @@ wdt0: watchdog@12800800 {
 		wdt1: watchdog@12800c00 {
 			compatible = "renesas,r9a07g044-wdt",
 				     "renesas,rzg2l-wdt";
-			reg = <0 0x12800C00 0 0x400>;
+			reg = <0 0x12800c00 0 0x400>;
 			clocks = <&cpg CPG_MOD R9A07G044_WDT1_PCLK>,
 				 <&cpg CPG_MOD R9A07G044_WDT1_CLK>;
 			clock-names = "pclk", "oscclk";
diff --git a/arch/arm64/boot/dts/renesas/r9a07g054.dtsi b/arch/arm64/boot/dts/renesas/r9a07g054.dtsi
index 4e0256d3201d..0dee48c4f1e4 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g054.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a07g054.dtsi
@@ -1379,7 +1379,7 @@ wdt0: watchdog@12800800 {
 		wdt1: watchdog@12800c00 {
 			compatible = "renesas,r9a07g054-wdt",
 				     "renesas,rzg2l-wdt";
-			reg = <0 0x12800C00 0 0x400>;
+			reg = <0 0x12800c00 0 0x400>;
 			clocks = <&cpg CPG_MOD R9A07G054_WDT1_PCLK>,
 				 <&cpg CPG_MOD R9A07G054_WDT1_CLK>;
 			clock-names = "pclk", "oscclk";
diff --git a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
index a865bf404dfb..788bbf15869f 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
@@ -50,7 +50,7 @@ key-wakeup {
 	memory@48000000 {
 		device_type = "memory";
 		/* first 128MB is reserved for secure area. */
-		reg = <0x0 0x48000000 0x1 0xF8000000>;
+		reg = <0x0 0x48000000 0x1 0xf8000000>;
 	};
 
 	memory@240000000 {
diff --git a/arch/arm64/boot/dts/renesas/r9a09g057h48-kakip.dts b/arch/arm64/boot/dts/renesas/r9a09g057h48-kakip.dts
index adf3ab8aef2b..bfe3cd5fdf0f 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g057h48-kakip.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g057h48-kakip.dts
@@ -27,7 +27,7 @@ chosen {
 	memory@48000000 {
 		device_type = "memory";
 		/* first 128MB is reserved for secure area. */
-		reg = <0x0 0x48000000 0x1 0xF8000000>;
+		reg = <0x0 0x48000000 0x1 0xf8000000>;
 	};
 
 	reg_3p3v: regulator-3v3 {
-- 
2.51.0


