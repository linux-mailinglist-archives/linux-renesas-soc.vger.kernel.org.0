Return-Path: <linux-renesas-soc+bounces-15035-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D85A75125
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Mar 2025 21:02:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AB3063A9DC4
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Mar 2025 20:01:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B21051F0985;
	Fri, 28 Mar 2025 20:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jO11ZxXc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E41431EDA19;
	Fri, 28 Mar 2025 20:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743192091; cv=none; b=Gj+2eJSrHipKlFNqeng5N1l624ZJgmmtU9nSSDiAwjamARwX8i1hKxnkQ46GELcuVLNY2KV0ROYZ6/kFZgsMkA+DZJ6rPC5j/83gkmNk955/6rLE4k8dgluC1YQC7LOZ1MYaCJL32dVKgyJydP1X+bIprCDAVdY8Td9m8OUA1xI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743192091; c=relaxed/simple;
	bh=SmGZmSs0jAN2F9cfo9+ZfJfH0tqEjk7syAbSsAg/elM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RQOslK7L4lM8JNehqv95oOCzs/xQFKoC6GW0CuyD5e3t9k5AuT/YBeEmbZXBC/XE5HwIDI6OTlzzd0YdxU96VvhEcrljSnJ1kAbuJ10yzIjckP36UP6MWNhBBXiijanXo3g0uwXW+agS/rmmUZ6hqGJC5Km3FsgeUWVebgZ4KSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jO11ZxXc; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4394a823036so25136105e9.0;
        Fri, 28 Mar 2025 13:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743192088; x=1743796888; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hR/ZEJowjkxQ8M2CChvL0ELqlxgAaDnp+KCqaZOS0ak=;
        b=jO11ZxXc3LE5t34BeLk6N8YAvaRTEstvKhQQ2xcUFQvtLwje4Nf2uij9b6Umru9Ngf
         NEe8f6G+shufuQrKK/Dla5woz980JmSk8eSmmmIjLp6VP6KT18gS8Uz64S/ON85maxYE
         TQyv4lNNjjmrdgyohUspH8P9yCEuUUbjK7iOQjPj816WksnuTMZUEKp+w3oi2ONucN1q
         psNTe3psf0vSnbirWh1dYRzM+b0rXQDU0NO0Dx1+pSW1k4eFVIWmGygmaELk+1Ll/o7T
         Ofn0CgaNuWaB6eYse9LOGmtgG+uV6AJCm3OV/bJ7lgb7KX5eWwdjeQxiJ1W0EQa9EICG
         jLGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743192088; x=1743796888;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hR/ZEJowjkxQ8M2CChvL0ELqlxgAaDnp+KCqaZOS0ak=;
        b=MoPCuDs0KFW43V8i1H/uUcoty0cN5m/JNw8QtIjU98N8eoIqKB+MvkMWazEivP+67L
         fnsyUeZLSdfUXYc9pyiyo41nMYQy8LIgqzf/tFTrKhEocf4s/Gm51WSk/Rv/fMMa/6Hx
         T4D5dA43uHR8iFXIxx4IEEoRrM9OObcKV4AD15iJY6W1RqYYKT+3Bqj/koTjrQ+0N6Zv
         mqYOLQ4zCt0PckypOpFkhzmoJ9++XtnNYL5t9TZ3yPKFvegEs18Hk2E1lIJdCsuxReTh
         2JR7f+bjace1NnfeK0IeYpYlFTGIle63UvQIZVr4eazhCUm8763Y5UwCN73BwjK9ADEu
         fyMw==
X-Forwarded-Encrypted: i=1; AJvYcCVYyO5GJRaEc5N8XgeZxMobCmHMIGJq0Knbh6wSv/0rerKKsHryBT8HaK0g1kpigm7os3r7ED40jV1HqeFU@vger.kernel.org, AJvYcCVp+0BKlumnbLvQMgCu8X87z7NiCvuysF/CL506+HUXyNcQHnShhTLp7hC9GNaN+GG9GrsFLKTUGeLt@vger.kernel.org, AJvYcCWpSffN1g15WG7WVCez2H1Rhup7SZ/KnvWxQpEEvmT0ucGZwEZ/7oMwsY1Tvg2oOfuMP2KRFkLKxNaR@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1u6Tatc2oS43SM1ah+3YOFvMmdjrKY6Zfiocuk4TtfNNYzDw1
	s89Bc2Q0dRrspEJXi4MmR4vsFR9fsId7d5z85QCb+ziBQYz+YhgO
X-Gm-Gg: ASbGnctud+Wc0yEyDugoLEP6tR09O0FlbXnHD7+Dw1armeKgTK+lXSE0crxt6I08StB
	uminFIu7od0tShiHT2O83sBs8/E/Mj8+NKUCLw8959FqtZWyASEa231YBc540w4OjTG22mYxuFs
	CTc0LVqmZ/OhvJuKfVAunDJOcOwl8OOhLEQvZ7nzW8v6N7ed7OR4ONPHO6olsTE3dWP7EMpPIK4
	8478/fiQsLRAeL55TLTDVLF7IXIQYfZB/6Uy4aqw+5p4xmX8x6rAR3SaTPP3pRk1YL6lWwhYd14
	hREnlAsYT1VOIqKXG6W+OoiF5jmJX9zV64NC/PTZ+cd13a0gJfnpeshH/NcseY9KcsA=
X-Google-Smtp-Source: AGHT+IGDDmIVMuuPmc+T+CvGNrz4n2UjVZR3mhSkkiVSb//PSAUuBcHkCroR36pX9ZXZsp8/M/cRrQ==
X-Received: by 2002:a05:600c:3ca6:b0:439:9b2a:1b2f with SMTP id 5b1f17b1804b1-43db61dc71dmr8933545e9.3.1743192088165;
        Fri, 28 Mar 2025 13:01:28 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:b400:d08:873:badd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d8fcceaaasm37930955e9.18.2025.03.28.13.01.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 13:01:26 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 4/6] dt-bindings: clock: renesas,r9a09g057-cpg: Add USB2 PHY and GBETH PTP core clocks
Date: Fri, 28 Mar 2025 20:01:03 +0000
Message-ID: <20250328200105.176129-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250328200105.176129-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250328200105.176129-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add definitions for USB2 PHY core clocks and Gigabit Ethernet PTP
reference core clocks in the R9A09G057 CPG bindings header file.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
Please note these marcos are used in the clock driver
patch 5/6 and patch 6/6. Also these macros will be used in
the SoC DTSI when USB2 and GBETH are added.
---
 include/dt-bindings/clock/renesas,r9a09g057-cpg.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/dt-bindings/clock/renesas,r9a09g057-cpg.h b/include/dt-bindings/clock/renesas,r9a09g057-cpg.h
index 541e6d719bd6..884dbeb1e139 100644
--- a/include/dt-bindings/clock/renesas,r9a09g057-cpg.h
+++ b/include/dt-bindings/clock/renesas,r9a09g057-cpg.h
@@ -17,5 +17,9 @@
 #define R9A09G057_CM33_CLK0			6
 #define R9A09G057_CST_0_SWCLKTCK		7
 #define R9A09G057_IOTOP_0_SHCLK			8
+#define R9A09G057_USB2_0_CLK_CORE0		9
+#define R9A09G057_USB2_0_CLK_CORE1		10
+#define R9A09G057_GBETH_0_CLK_PTP_REF_I		11
+#define R9A09G057_GBETH_1_CLK_PTP_REF_I		12
 
 #endif /* __DT_BINDINGS_CLOCK_RENESAS_R9A09G057_CPG_H__ */
-- 
2.49.0


