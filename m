Return-Path: <linux-renesas-soc+bounces-19166-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F95AF8495
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Jul 2025 01:56:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5E22F3BE18A
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Jul 2025 23:55:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45B982DCF44;
	Thu,  3 Jul 2025 23:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B6umOCG7"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9017C2D94A8;
	Thu,  3 Jul 2025 23:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751586955; cv=none; b=IzLoEBiYyWZ/wjIYaeBvr79oXEDLFsMw0lkUbDW8ROCNsqeEDZRkCB1OZIusmv4wkc6YYfKjltox+xEdkuDIwgA9K868dEosefo1ISln21UQi4KHqaPA6Mx0ngl67BBeIj9LsC19cn8Fu+qK9uqlTl+7xO7fo7kLvOuDeLCp4Ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751586955; c=relaxed/simple;
	bh=Xfz6hC7jz97fFLB5d3hQE+rUkPnpU2We7tBGKP4GcE0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ktxWfM8fscX2vMHPuq3xBPgo2WyagaLZa5bO58NVSnnn9igkRIaoWmiRhnZdiBct7JcA3MQYd+BoSsxmDvPSXihZ+V1FhT+6UYpKpmyRIw4aLGIoHfJZ6Dwyy38yu/gF9NDnYmgCw1mdtaIEp5OWMVk5Lt4YIzdq0iFhoMF17RQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B6umOCG7; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a54690d369so323943f8f.3;
        Thu, 03 Jul 2025 16:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751586952; x=1752191752; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4s9tDwpu+CGg5KxQAN0dIuAaNelo5QTkVP8HKKltOvE=;
        b=B6umOCG7/eMQUbRGd855IoQi2EyQJpNcY5TMPpA6Y4L3O/y1ndnB+IoWpxBe1Ud4xr
         V2ltUnYLmOQwP+d6qTPXOitR8R59ha+F7hJqjyWYqzZH8GWnBVAAoGYueaS2JsPjd5OO
         1dOKFuljaLPjJwmHN7oVgRrbldq1888GwjRVUoty3acJTfZ/M6QpJJmolR3k6LNSrPVr
         dU6KGhpRrqTj6Uj5sjJF6PD2uOrNbbgdelx03Z26zCQd0kgtXP3HQuCqubC8XXu3Oov7
         SxdeO/D0xkHKwJFtA7xrnyNY+B/TBH8kVEjXqVJ9/UaFMCEs9gp+taRI4v4JgBjENthp
         tskw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751586952; x=1752191752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4s9tDwpu+CGg5KxQAN0dIuAaNelo5QTkVP8HKKltOvE=;
        b=iFTzgoZUs3Y98vQf29JD9MixwU8Kyp80MnH0cQM3L2jE9hMD97Gvgfei0nINg9vnvt
         0dcNCE2y6MRAXbiz+HJ7Q4Z4x+S0rrNPRu24Ul0BGYjele0YE8zABeq/gCVWM/yEq/4x
         NWmCLkLltnC9jV4gb/Lhvq24FHZw9c10TN0e2E8b5SdwbshXWmQ51qa9oBWbNRS6lyF4
         n+sKxUUi/il2roZQ+uO14bpEK+KHDehcakiVXyiTWJWyZE35qzcU+9eF5jRG18DapgqQ
         n9c5TiGqI/ixNXAwO1+oTx08ELwAQLNAcgV3H6VrhIqNiCXk/oLy5XeRbXfBTj/WDyVO
         oynQ==
X-Forwarded-Encrypted: i=1; AJvYcCWynEQSr9fcbcf+PF8VaM4+aqLC1+yqpWqHIeFVr68jn8SzX5XJ8u6PXs80Dwtl7L8So6QFRya0jshpHn5b@vger.kernel.org, AJvYcCXTjfqFgHogugdBoC0o56rA8RWlwPRkiuXENlr++dPbAggIhKSHfF1ZDL4ZJhom6sl/Pij9KktF4vDj@vger.kernel.org
X-Gm-Message-State: AOJu0YxxRP+2rqhv6Li0/wALqZch/DnpKoijP6Z9D07fdrQKdiLq21kW
	V97vn3cXLnarkgEb3C3VqMoKGECvUl49+MmSsvexetBCICd1b1t7qPy2gnlKRFV9XE8=
X-Gm-Gg: ASbGncuP9gJWe06P2zzWY7Lf5djC9c4BSpvBpS8zJSUExZ3hhtyRcRN3d1MZabmhDjt
	i4jUM6VRs8lPdT7ot4BoDUvYoh/TZ/ynEoFfGBUdtdkBQ92aIdGbNKRRHgDBrG/6/eway6DH4VR
	ANExG5hEtlYn9JGEdnuLz85ajNn1C5XgqyAt5xw6WCqzLA2Gq5LQmNh3hbR/gaw78ZlGgnKmmp+
	z2J++GQeJxsFTq8INQaRrVbMHeFBn79aTGDcrcFTq0vAT6J0gRNjJBT8kdH5lv2V+B44FRF1MH8
	I6ETbL7dWWtrYxHm7FNNRQRlhEuHRVAVqROm0bfeta1Wptj6IZNnLsfIGYiOJRwhmBrReXx5/gZ
	gYLmVS7vOzMk=
X-Google-Smtp-Source: AGHT+IFJS8FlvyijHEAXvCtJh0wU2IwwKQ3TbpccQZIDSRcIBBSYWTV3td38WtRPmLDM6g7EhNT+IQ==
X-Received: by 2002:a05:6000:25ed:b0:3a4:cfbf:5199 with SMTP id ffacd0b85a97d-3b4964f5030mr251608f8f.9.1751586951797;
        Thu, 03 Jul 2025 16:55:51 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:5f46:9d65:6ef9:1650])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b47225b5cdsm932436f8f.85.2025.07.03.16.55.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 16:55:51 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 1/2] arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Fix pinctrl node name for GBETH1
Date: Fri,  4 Jul 2025 00:55:43 +0100
Message-ID: <20250703235544.715433-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250703235544.715433-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250703235544.715433-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Rename the GBETH1 pinctrl node from "eth0" to "eth1" to avoid duplicate
node names in the DT and correctly reflect the label "eth1_pins".

Fixes: 802292ee27a7 ("arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Enable GBETH")
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
index 272aa848715f..bb5e6f4a0c25 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
@@ -593,7 +593,7 @@ eth0_pins: eth0 {
 		output-enable;
 	};
 
-	eth1_pins: eth0 {
+	eth1_pins: eth1 {
 		pins = "ET1_TXC_TXCLK";
 		output-enable;
 	};
-- 
2.49.0


