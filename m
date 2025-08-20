Return-Path: <linux-renesas-soc+bounces-20789-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 99FB0B2E61F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Aug 2025 22:08:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 80DBC5E3FFE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Aug 2025 20:08:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B90622D24A1;
	Wed, 20 Aug 2025 20:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GvBndy/1"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 013922BE7D2;
	Wed, 20 Aug 2025 20:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755720433; cv=none; b=IvbhLMPWplMFbP4i1VVCIwSH4WKotZWwMJ8BTwj/dGBsMBVpHezWt4jxGk1NrPIxNfcJHlSJFaSEHAYJV25jd+6mM5XK/Hz2QViZytZAtlFA+cwLfuCYj1jBM0lPtnNU3EFu5Y8MrfFvVSOsdcrltsNApQCTGVJWf/rMUSxmKYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755720433; c=relaxed/simple;
	bh=FHP2Jj45q/eSQTJEcb4pV2EQdIEcHTEZ2C+MkRwemrA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DzSwvNqJtUsVqLq6tl0/ZgM7aBk8mKeulfugTw9WWEUVpXhhHrjIvF+JMCUPbo4LlQMTdTx7yH+RNi0NBibH57B+V7u4B0ezW+sFvMfxYWI0Ne3rQfF7wxY/zDFmMOXR51iVRdFBGQnEA9GQLqjshKEsTXN5FmaSC23IShoB08Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GvBndy/1; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-45a1b098f43so1997395e9.2;
        Wed, 20 Aug 2025 13:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755720430; x=1756325230; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QVHsY43BuW1uq95kcaMoczcAg6K01mjwis4ngDr2H9E=;
        b=GvBndy/1mpYP2hqr58rf9/vDJnTVvYbfwUw1+7pTIcMr8r1Nfd1ELHAJGhmZRInnZH
         URIrfyfsNzmO4cGYTr6SME1Q//9hyKxXkqJGsNnqov1a108jmIlVPBaoOEjkt0j5z2YG
         BM/zXb1juJ5Yzh+G/jzQx21dbzd8mAwvxOTx0PFiAU0r5vKQBZNR5nfuWo7ZwiMK8QD3
         j+MTHjwG29JqPcRxagwA8vzdOkMCATA8MiGnqAxp2OaYCKdt/BBTcf4TY/oojXbk+mRR
         5wR1AZAJWhEHrro+YybOtn+8rlvaDkUQGZ2T/7V0LaNXWdKAsHLG7Vxx7qObfXr07OyN
         YErw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755720430; x=1756325230;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QVHsY43BuW1uq95kcaMoczcAg6K01mjwis4ngDr2H9E=;
        b=K62KklTKqyytAtXuRloZs6wwWDjY1sJB8d1eZqBHdhHr66E1dyzWQvoe915oeAH3p7
         CTkwRj9WBVwnGwQLRnH77JN8iRkCMXyOdYLQVpaRtvgJDEFjBx7zHQBWv33da7/6AT2t
         gOEoCE3yxc/Lbzkgj5aKyDsIk6w1Wo8T1QIXExnY6rcXFeSo7nsho1ZwK6pG5I+7cOSI
         LsYpOLb9lHFplJkkuXyxsNWRTGmkLms72UfKvPv8wB7T6SD4lILzL1HAb8895D4K9tHv
         +IQuYRDx6/fVmh2jWjklw2T7bX3mRatY2fUXQ5OK7M8nNFwNdZPOGNz6nPZnu1vvH4LI
         odQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPyR1ThromSf5T2kDQ+8RuSHgphU0SnZyVwhMxORV9LiQnueHhmPgqx0kQZebbxIsItC94A+dk5yb4KMr/@vger.kernel.org, AJvYcCW+JOYZEqKhe/Z1NqvSzrAGGaLyvnwgWg9w5F9Rinx5jWIVPabckwXw2FssO/koahUKa/ToV9Ug83HN@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/I0yh1jMk3fB3zIZm1/m5/mHKmA7X0g+p5Ax/x3de9yi3cJaN
	7Ah9B3wmMmtvb6PObdpAlA5U0JtYWMYhxfL2/SfvuAxXitg88BkigTwdGMye2Fgm
X-Gm-Gg: ASbGncvZQBseqE53CpJiF+xmI5s4/Zq3kgWonHOcuhyyYFZftGN/12LIHuNQhh/dGW5
	4ljNy6MyJE0enlYxDl7FAJtwCS1CN94qogkf3kPYZ86YmtqzNbrEwSaOSyQlp9DLUK/uyPnmoPu
	WLo0oRGfQLhEE258NHpeWQYmUMhhBqEAxFdVgeHwpzWm1W8bayu51uFtBYhGN77d8jz+PjYbsMk
	lW0yr+AukY+/VgIQs6YRyEJ6No4g+vB4B9HbvHNbmMyapDUBgbbrCb+7CwpnGWr7bvHmpsQ77o2
	HSYAsvobsPLwltvupgkrz/LcaGnwdiMbGq1gOfWQyC2S4d6cGcuIh06M4s2GRJWup0bA8gerHWG
	H1muiIreZznR+sWnjM3Fs7FZ2RoWnUfZe9QtL7DXYJYACLcoeWKrR1mPhHwaMiCe1GFY=
X-Google-Smtp-Source: AGHT+IEoueA2EbiwCAgDcmzffuZQLCzqryTd2IsFyiserNj20GoH4sV3aVsLGXOb9fZTjQhQw/v+Aw==
X-Received: by 2002:a05:6000:2c07:b0:3a5:298a:3207 with SMTP id ffacd0b85a97d-3c4972747fcmr58567f8f.48.1755720430273;
        Wed, 20 Aug 2025 13:07:10 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:9b1:f84b:89f6:b00e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c077789c92sm8810302f8f.52.2025.08.20.13.07.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 13:07:09 -0700 (PDT)
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
Subject: [PATCH v2 6/9] arm64: dts: renesas: rzt2h-evk-common: Enable EEPROM on I2C0
Date: Wed, 20 Aug 2025 21:06:56 +0100
Message-ID: <20250820200659.2048755-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250820200659.2048755-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250820200659.2048755-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Enable support for the R1EX24016 EEPROM connected to I2C0 on the
Renesas RZ/T2H and RZ/N2H Evaluation Kits.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v1->v2:
- Added Reviewed-by tag from Geert
---
 arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi b/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
index 06300f806685..1b7e16ffe6b6 100644
--- a/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
@@ -25,6 +25,14 @@ &extal_clk {
 	clock-frequency = <25000000>;
 };
 
+&i2c0 {
+	eeprom: eeprom@50 {
+		compatible = "renesas,r1ex24016", "atmel,24c16";
+		reg = <0x50>;
+		pagesize = <16>;
+	};
+};
+
 &pinctrl {
 	/*
 	 * SCI0 Pin Configuration:
-- 
2.51.0


