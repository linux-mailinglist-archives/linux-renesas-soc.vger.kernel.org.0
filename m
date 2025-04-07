Return-Path: <linux-renesas-soc+bounces-15509-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC12AA7E78D
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Apr 2025 19:00:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F1A7516828F
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Apr 2025 16:53:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8ECBE217704;
	Mon,  7 Apr 2025 16:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GLinblI+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB10F215772;
	Mon,  7 Apr 2025 16:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744044747; cv=none; b=R7vroH9bp+DlqU3t4KWt8abElgcu76/cj/ADJ6n0oVFAUzlSu7uOiloxR4ccBLhS/x6ecg8sE7nsntSTQoqdADjLbr+PWeqTKN4/H2vm9xWEMBVN5XNlO92QQ3y6QOW4s75Qw5kLI84NkoKaHXuY1NG0fyWy7lVvDp9WGjuygIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744044747; c=relaxed/simple;
	bh=ela736EWUHBiQpuiYcDtOCJ8PCECCMnDysvL0xSC+cU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ftYMh52o4SYSw6CNBN3xe1NepyVKpW4EfUec33ZTOuKWYCp0cXUCijBCEVmNghxVzjDBC/oKfFhNn2uX44yYnk+pBjCD1iGWNTFmlw7kDDB/aLm5unrsMFAkB1S+BcVvxcH2GJctFlsGH5of8/NtqVXe3krejsKAGmxyxYIL73Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GLinblI+; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43ede096d73so17612965e9.2;
        Mon, 07 Apr 2025 09:52:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744044744; x=1744649544; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IXU7b+hw2K35mM44+WPm89Yl9SFCQNywBx9Tt2FHqig=;
        b=GLinblI+XYtuRH/O5eZUTLna1VUF5Ti9TJraBkX1npqDFHjvn59msCc6uawR8AUUvx
         qxKTBvsdENP1Z/dEA83d3Vr0XyWqCzgts+VotwKwyCfBWSe34b+b1z57aSUPQp2NFi4K
         fnJ21tOTLpltaxSxnsQ5COz/myFaobr2oi5RLtQWf6YMpaUA2BWGCb9rbHWYiiGfkYTg
         Bmtw/Ed1c53Ma4zarTMeoNO2FHRd8+ijqTMmc40EiWBLwThqn+s5KON9H1uTxmS66Q6E
         uCHIJ9CU2wOB2sRZtMZ3L52Hlf3n3SklK/DUCEZ1OpUW/Tkwuf7VzBx1nU7jJmgCtKQN
         pgeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744044744; x=1744649544;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IXU7b+hw2K35mM44+WPm89Yl9SFCQNywBx9Tt2FHqig=;
        b=vL1pY4pnqbwOGNSmA+RfOn2ifutxxHMHhn7HpTep2BhiIi1MbjzbYRZ52JZniICjlD
         hfm00cKk7Uha+cOkFHaCTghGcIZ8mDzpMSFjJcSI8Lpr43wwECmwQLXgNn7o9KIQC/vN
         67lypdsedzIvIWoxDQyJf1+u17pe0xBJYAxl1RYiC5K0FoKgtzuO3G5T626RL85FmpwB
         J4O07SKlPnau5RS5LPiSQUyGEO5SgYdeXF33YJgASWerWRoLS04U2xyjFFgILdP6T3p1
         aibhThs8nfw2XCQ3RZ9vsMRIloW45i8leGFjG2ERfYWeQGJuH1KM+NFHG2K0eLuV/gXO
         9X0A==
X-Forwarded-Encrypted: i=1; AJvYcCUCiduY1wmPQO4wqmwUnSWAzNEnHEwFu/3y3YupjEND5PPteEi2B+9JX5f5Nl1OGRWRWNuNJTBIRSEQ@vger.kernel.org, AJvYcCUKnBAymwDVsmJWTcRwOdVdGL1e2yFitWGRFVtEe7JgUgqEWJyI2d9iVMH9CEsQIia1RxRQppeXIZd7@vger.kernel.org, AJvYcCVs0Vh1RlEHODuunndrsO19jUK6hWMlPVzcBVBqe5+gEnSFM5+Qg/XdBoNalJHA1Husc1hpcUKZeP6CLNFy@vger.kernel.org
X-Gm-Message-State: AOJu0YytPk/hoIKqqqGCym9leHz2budvY4QXWmLzS1bLa33awGAGAR+o
	ZB/qJIEnxQGUp8QTqpoiFgAPzikF4gSfsrBezt3VRmXkZPcKdQdg
X-Gm-Gg: ASbGncsPMEdof+WzJP1kCraY84kOBuiKHRFm45xBperpQnEBgM6nbHkbkVxJme7Yelw
	UTj/GFYqtRUwFy7rUlt9w4MezID7ShPD5aJvgJlVBmtIZ19Q5GyQmyieY/Kw8exOmYRALpOlhLe
	Kl24Rd8UwKurUky/QCclECsv8KlcWChv3lKAeprdF74lAR5Hw7L+3y57gK9ocaNqgsk1UC3ucVX
	5oC1+m3d6J0jy5sZ+hnTfCwhuEeE6c4LmXUZpQNSJkzcK3PuIImGLkNXDVfPndaVcoRHxEcommF
	n253PeJMsYyNIQA2aIKE/SByTMsXmtqj97wBOMWnLJ08jt59Dd8YOjua4X0mceyRh7D1AQ==
X-Google-Smtp-Source: AGHT+IGHO2eNUgOEgAq+3R0aNl/OuUk9Q1ZBb5Nk21vyCkFSTgd9accY8BKt+8Wdb8TreOumwnr/Qg==
X-Received: by 2002:a05:600c:1d12:b0:43c:fd72:f028 with SMTP id 5b1f17b1804b1-43ed0db3ba4mr123936715e9.29.1744044743920;
        Mon, 07 Apr 2025 09:52:23 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:78b9:80c2:5373:1b49])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec16ba978sm139272305e9.23.2025.04.07.09.52.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 09:52:23 -0700 (PDT)
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
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 7/9] dt-bindings: clock: renesas,r9a09g057-cpg: Add USB2 PHY and GBETH PTP core clocks
Date: Mon,  7 Apr 2025 17:52:00 +0100
Message-ID: <20250407165202.197570-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250407165202.197570-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250407165202.197570-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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


