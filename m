Return-Path: <linux-renesas-soc+bounces-20422-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 50EAEB2399F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Aug 2025 22:05:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4805A18908AA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Aug 2025 20:04:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A43C82FFDD6;
	Tue, 12 Aug 2025 20:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X3t1FLqn"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD4572FABFC;
	Tue, 12 Aug 2025 20:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755029033; cv=none; b=TqgB0hhdaLFq3bAsE4IQxT07qJGgrHtYhynk5zrQnIWnOGsLzk7IvmP3QpgRAL/pS/q0oQo9y7Q3HMbcxUBIPy+WHYSaKYnyK12BR14PqhQTFiAG4rJU8qSM+rYWjX9VRhkS1tGhqzG7JVlBz+YorpPcUKJu0qv0EFgX45FAnHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755029033; c=relaxed/simple;
	bh=J0RylzijUT9V40zvrVdPi776Kkp078DqARxYZ9YaDoA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nHnqCl+LO7eOtABwkq105TbqqB6wAFpKGJiPT0WX5qoVZorV8404xunHwZ4Y216Z9jPRNU8CIwGAJLfTZp/HybZaApC/z1qGBY4Lt66ZEAGFkLP/LF2U06LeLjEUa9Ahh0zEL4nmM3UUAvQBGYGgaGet2wuyEbZY1/kER7opF3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X3t1FLqn; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3b9163ac059so275526f8f.0;
        Tue, 12 Aug 2025 13:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755029030; x=1755633830; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hGgCAhB5h5Jm9VKBto/jY7dngbWyzoiurFWn7gGY44Y=;
        b=X3t1FLqnOGYcrGNgmFy1RchyW6C6/ijpXzTeE+sZj6e+mAY7o0e4+85mZ8lg5rF2Or
         W8DLcAXgdwuAeUaqS/hGZQ3rCw4HGrJXIkXwoscAQ3/4osTtLUWZ+QlIiOS/lOxcw4Jy
         yexTQvN+z7EmRV0jxplKeC6Huvz0Ha1oP+ft2/f+OxYNpAeL5VhMRSpavt68PwNrYBMw
         2Dlkec3e5UAr4ct6Gp59hiOfvLq65oWCt1egzNnBDuWBOb6xjLnWEgeaFTuzPFA4BD7z
         P5Mw0kdALQbRJsYD6sek+wdT3Fj9ytt+zRipQ9qOj64SC6dmRRcQJ2uQSB9tJCn4Juil
         1YLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755029030; x=1755633830;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hGgCAhB5h5Jm9VKBto/jY7dngbWyzoiurFWn7gGY44Y=;
        b=tDQ0/DV2gpiXeGmYBI3foxiS9k2MwKG5mpUvNblgB6D8SnMZOlz5m8V9Wue+4pFG/y
         RBuis6H1QWFvJjUgQdnLNTeHey0ZukThfQPJXumm2YIK4fEDiM0yDPtxT3UxspBOQQlR
         RrufQ3Vf60nE6HhiXKu7RNtDHor+Sd6Y4bf3CLX7DdUDeChJV6bf3o17T1YJhG2yXByg
         50dteQgrQmzmjs47gq59wc9Yncei+xkhwGd/G9RJGuN3HCXSN8Mho801my+kYH1hnzzz
         i0nVKJKUJOIqua4uZlVvcVQRO/abMVeh77TvICClkxYIIIvPAUIKmkfPPIWjbkB9L50i
         6bHA==
X-Forwarded-Encrypted: i=1; AJvYcCVCr0qEwHXJIoVyHjCnQH7gQIqIyYjecnHu8OVc8HshLtahw7s/2bmwhmZ7oKlpR9vVCRv4k5a8G5hbOUfh@vger.kernel.org, AJvYcCXA7ecx5rwWiOeVed9QDw7+K7zJWdaJXtKy7+oXvm+xOuihyJpnGJfa8ba/zctF9fUflI/pMnfi35HS@vger.kernel.org
X-Gm-Message-State: AOJu0YwIChWEDejq9K67867tNAgAykSRG9EOTSkRZTf/ldBaYqe/kbQ7
	y7DblyBb69FQGVdGJQSRD044p601UPWWwX7+Qxtqz1jT9xJTNMj7dqnxEBCfyQ==
X-Gm-Gg: ASbGncstVtPjuBAlHFaHQybc1rj9GT3HgjY1d8rdq9sDni+myIeEl6zz3Q1PlOKlTeT
	VZ0sNqoBZtr0UpAZKIG42uTEAZD9/YVjSa5L3NSx5bkL9LMz0gDnQo5KwXsm91Uu/X/l+RFVTtd
	AfrH8GTxsxUqJbwPBm5K8Lt3f/oxzYWQnX/du5ikdT8SyhtGpQ6KzkSQI6zkXxTItJUPbi3TaHO
	V7Vw/WNqXKjrmfJjB18Pf8Q/ScDtqAM57SS+RVq8G2NzYEy0CLpqAm57rRwwwYHttsTHwNf6NJz
	crfiIgMKBVlAFvfECUwQ7gVTFKhh2vkjEQxmFkFzORZ/c4OiDtVN5Lx6YDjjrjdk9hL9AjyzH4y
	kDJaxZ3L0J16PfXoi+3XobW7I9iGeqAm/XTDue0Uz68PUO0OwkVVXoz3WWY7MNhQ0kRm8UYyXy1
	SQIYtCtd/0
X-Google-Smtp-Source: AGHT+IFyLa5uZO+p3z82X4hjbPuZRp1J1Qv9MC14du80jmD5OFZhgz+9ZxWmw6qrjNMf4S7tn5m+Nw==
X-Received: by 2002:a05:6000:2dc6:b0:3b7:b3f2:f8c3 with SMTP id ffacd0b85a97d-3b917eca9d0mr180088f8f.57.1755029029971;
        Tue, 12 Aug 2025 13:03:49 -0700 (PDT)
Received: from iku.Home (97e54365.skybroadband.com. [151.229.67.101])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a16dde163sm297645e9.12.2025.08.12.13.03.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 13:03:49 -0700 (PDT)
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
	Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 04/13] arm64: dts: renesas: r9a09g087: Add pinctrl node
Date: Tue, 12 Aug 2025 21:03:35 +0100
Message-ID: <20250812200344.3253781-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250812200344.3253781-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250812200344.3253781-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add pinctrl node to RZ/N2H ("R9A09G087") SoC DTSI.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g087.dtsi | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g087.dtsi b/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
index 7dcaee711486..3d243096b04c 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
@@ -5,6 +5,17 @@
  * Copyright (C) 2025 Renesas Electronics Corp.
  */
 
+#define RZN2H_PINS_PER_PORT    8
+
+/*
+ * Create the pin index from its bank and position numbers and store in
+ * the upper 16 bits the alternate function identifier
+ */
+#define RZN2H_PORT_PINMUX(b, p, f)     ((b) * RZN2H_PINS_PER_PORT + (p) | ((f) << 16))
+
+/* Convert a port and pin label to its global pin index */
+#define RZN2H_GPIO(port, pin)  ((port) * RZN2H_PINS_PER_PORT + (pin))
+
 #include <dt-bindings/clock/renesas,r9a09g087-cpg-mssr.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 
@@ -216,6 +227,19 @@ cpg: clock-controller@80280000 {
 			#power-domain-cells = <0>;
 		};
 
+		pinctrl: pinctrl@802c0000 {
+			compatible = "renesas,r9a09g087-pinctrl";
+			reg = <0 0x802c0000 0 0x10000>,
+			      <0 0x812c0000 0 0x10000>,
+			      <0 0x802b0000 0 0x10000>;
+			reg-names = "nsr", "srs", "srn";
+			clocks = <&cpg CPG_CORE R9A09G087_CLK_PCLKM>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pinctrl 0 0 280>;
+			power-domains = <&cpg>;
+		};
+
 		gic: interrupt-controller@83000000 {
 			compatible = "arm,gic-v3";
 			reg = <0x0 0x83000000 0 0x40000>,
-- 
2.50.1


