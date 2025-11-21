Return-Path: <linux-renesas-soc+bounces-24987-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 7858AC7ABF1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 17:11:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 3F627365205
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 16:09:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 206D334E763;
	Fri, 21 Nov 2025 16:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fR2iFjJ2"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D278E34C802
	for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Nov 2025 16:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763741334; cv=none; b=s0FapqfPsZ0Kp9L484txRthRofIIfMTqp5SY0/uTB9dRuYk6tVMknUD4PpwQwFVHX6ntKTGsBppvPO1YFfqdi149MT0KXOZ0aW7bNWU2RHiJ57t1oHxlYUKdP8iAvePH3nL8The+V49XqHiyw7IQpDJlp9OTCALWydKstOPvjSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763741334; c=relaxed/simple;
	bh=5vIEJNIW8ykQZr77pegt1bgUXX58QKKelJaeySDGSzc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XFIblrGpqUbVN/6+E2cLOvf0DOLb9vdyEYRBLgCa0ITOtDFBuJZdD8UlaLoBey1Xi0b0fHZTO9JAjzJaU0MJXo+7VmnZA1mbNdgklX9chA7HeNRSoko48+YxxRj59HF3T7m91zpEy+Ha8YAJVYQc0X2dnC4S11Lv9HcmoahE8iY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fR2iFjJ2; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-477ba2c1ca2so21136615e9.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Nov 2025 08:08:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763741330; x=1764346130; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fVsaNTGWKSBzHg1qPcit/s0U5N3vNySXGtP98T9JdBw=;
        b=fR2iFjJ2jYKWx0vMcbPHu6iHZYiMLZxfqUcmWNimXJSoS+yTGsvODEoBbJqHoBuIpJ
         oWo6Ham3Ltqoe7lv3uiQYsF351SK2FIpmvg6fNEWPwVdkQfFGtQlFGO98dYAJ/ZkRhNX
         zTzSB1a99yoXzz25BqYRay6qJnLd6Nt2PexYmUJHeR/gt7hh92zxIAALknomzKG4kLH+
         /1vSdcDyG3ZwcoYA8fS7QKdz+cty54kCWtXK98JqIkKp6BupyiN4KI6uWMgHU1MSn6XY
         4I+BAuHo2LxHsKTnu9WlMqPDYiOsrOSrJYs4XhvIa7OvZUqr/ZRSZpWbu8t5KlDaCEEZ
         KfiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763741330; x=1764346130;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fVsaNTGWKSBzHg1qPcit/s0U5N3vNySXGtP98T9JdBw=;
        b=KPxWS9jjFpxxG+6+sxVQ8j4coVAK9h5IyrpQysMVSLa6JdMKpq+1jY6pgsySYYj4ap
         B9Oq4Kb+MRZTUiXC7TgKJrZp3NoBYF5OpGKYNFqb1CZPQqH+INdpPXM2TS7KAyiilS+p
         tjWcTqkYdvaBTlF245BuYd7SjWpcZ2UeEMzqzZy5HY+eJ5HnRmIwRq/QFvuYPIxz5/wc
         jV5PqK14h4X55FLRMNbaCJBmaVrNckm1Z3j5Gvi66jdXThbLo8f3SQw2nh1NEm9qZJNO
         YSL0r2GnlZp+LKZqDCrnHV0AYR3VIkIFQiuIzB4TcBdpi2I6ifQvyGmA7e+xStJ0W6MM
         LikQ==
X-Forwarded-Encrypted: i=1; AJvYcCVIrFxa2iW1DpWZhnBMmmJ7h9gf3vqKXL0BWj68tmBSzXOoGDiBkjU2qhpLu6JJejzcbsYlOf3dR+q4Fv6+Wccd1w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx31I7TawhEu1bWafPBCAZBZBHEaVnVeURqyrVS3uTxx7cdTCam
	J47fNkSMViQNKyoIyyM4bPC9T7k6MNdGvW5Xqdhh3rMrW4m5gVhuq9sL
X-Gm-Gg: ASbGncsP2heGqTWDBCVk1/WAOKenkUjQ8z+n157zEKUxVq399TiXZ3Y1s9tZzmXtfXg
	9xC6QQCQngjiIar0rD7XQIZq88nn86WZ3J3cCvuGweO0eiTwgeNkWZVSbJ/VzANq9DzA3EX9qWg
	UneK96QzLMTvjpT77Dg5rAxdI3E1oXk4P8OS4/rMzvIbmgf1RQEk82Xwfbomi4g71dIJKxE2qxB
	1c9oH1thAVFrF5UcECTmRzKgpzQTY7Ez0wlQHozeNfQwskrgeaPDLzVt1D88um4NI9DdkG3qJZ4
	Sfr7XJIdxxpu140ZOJvN3WNY+a9VDcvRokwVoPAW4Zbv2T5W4DzO3E4YZ38B1+NuZ3cKOP4g/3l
	X+mjgG5zXfSjoY/82kOycMCHaJS4NYIuWYlswLtKqMEwNDzU+UghXyRk/JNZZgQVTvFio9JP6TV
	GJjIKy6L1Dvg79bweZlhUSCMd6XpJhicwbu2v1apdYSYIowXqs/PvHmJS2kmMS+nukhqV44qo=
X-Google-Smtp-Source: AGHT+IEfnk4GTW0fPGjR1ly8w6uxXo6CE+pC+PTgxzMGsUNFTO+UBw5m9ydAopd9uPCKd195u7YqWw==
X-Received: by 2002:a05:600c:1c24:b0:477:76bf:e1fb with SMTP id 5b1f17b1804b1-477c01be2b2mr42100525e9.16.1763741329491;
        Fri, 21 Nov 2025 08:08:49 -0800 (PST)
Received: from biju.lan (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477a9dea7fcsm89496195e9.8.2025.11.21.08.08.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 08:08:49 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v8 06/15] arm64: dts: renesas: rzg2l-smarc: Enable POEGG{A,B,C,D} on carrier board
Date: Fri, 21 Nov 2025 16:08:13 +0000
Message-ID: <20251121160842.371922-7-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251121160842.371922-1-biju.das.jz@bp.renesas.com>
References: <20251121160842.371922-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Enable POEGG{A,B,C,D} on RZ/{G2,V2}L SMARC EVK.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v8:
 * New patch.
---
 arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi b/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
index b76b55e7f09d..7648f0e96668 100644
--- a/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
@@ -109,6 +109,7 @@ &gpt {
 	pinctrl-0 = <&gpt_pins>;
 	pinctrl-names = "default";
 	status = "okay";
+	renesas,poegs = <&poeggd 4>;
 };
 #endif /* PMOD0_GPT */
 
@@ -166,6 +167,11 @@ &spi1 {
 };
 #endif /* PMOD_MTU3 */
 
+&poeggd {
+	status = "okay";
+	renesas,poeg-config = <1>;
+};
+
 /*
  * To enable SCIF2 (SER0) on PMOD1 (CN7)
  * SW1 should be at position 2->3 so that SER0_CTS# line is activated
-- 
2.43.0


