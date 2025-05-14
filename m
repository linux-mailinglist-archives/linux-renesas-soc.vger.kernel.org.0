Return-Path: <linux-renesas-soc+bounces-17092-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F32AB68A3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 May 2025 12:18:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A5E694A5C83
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 May 2025 10:18:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3ACC6279788;
	Wed, 14 May 2025 10:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZnEpM1HG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73CE7277818;
	Wed, 14 May 2025 10:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747217751; cv=none; b=fCoQZfYPHeXb9nO1+ELFe0vIuwkOqi+C91RHRcelg4jY5r+BOr8g0bNznZinTJ6X8Izr/ht3G/W+NVULZj5N8Rxg+TTUxeymMYnfxJHpfyWaUYw6hN0LGYYPs0ZAsph9UZmrhbOL4AAh8QUi42uGpPkeUy8mw+yF50wf+tKN/LU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747217751; c=relaxed/simple;
	bh=cQGdt7Bm+oCA45OrDj/tyvOjEKvRxwuUaaTwuxv87fM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bP82OzEaXV6rzTDR7V9xAKt/K5XgLQYYObqx34UMr7n2a+UPNhw6E1SNmYF4LBUlwTTMxnSuJgPXGYcV8cbpUtMUdNkCXwJ4w9agua4YiNqba/NATf0U4Q6ScRf9nCl3Lo5USpy/D5q5B6LquztGy0qyYnHjcBD4wsmMTn3g4eY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZnEpM1HG; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a108684f90so4055232f8f.1;
        Wed, 14 May 2025 03:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747217748; x=1747822548; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pI3nqyB+c8lWNh8ROyF/TiOE8yTJ1KcZLq3G1bSkOZ4=;
        b=ZnEpM1HGfODCWjpoqOB3Xg3uFi/BWYaLtwi7f3Iysa+dlF5yKz1sDhiUPQzQVXcUl7
         xA8di5vucNdKKwBWeaK99S/cju5wCgBds3nNmmNqILhlr+fry6lsRh/VemITG73jwTiZ
         0bkH/x6iPBTSNRy121boBtAWPkUFcYA2vgrbSJqdHowcUgvYJTiciB5HXkY/S07eJkYk
         IeKUJ6J57sjlI9kRfUZ51h8/SolClkH53xolDknoIqD3vuntVsFMzLxCs0jZES3FlN6e
         3LymPU9rzOG/AFbb/3Jsf+ayw6X+Jjhc57W6irY4Qjz+3RQq+OHijV1d/jPOo3SxpmPn
         aO4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747217748; x=1747822548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pI3nqyB+c8lWNh8ROyF/TiOE8yTJ1KcZLq3G1bSkOZ4=;
        b=SlUYUQDiEO71HU/i4zcHDqDaBj7w3VwJn31wfkjZ97/dXAzvNgESSiDzX6XxquoYdu
         dyqflqGFBJ5Z+j+1yHYrUjBmp8XZBNc2vQyfdc+Z+JrblZnaKXUn/q1Hk8E/Lc8RaCfR
         9Q25KU8jEcED+keBgHzGrsWkSBqPbbTpkTkMrLk6CFwmpLRz7lNmW96yjLu9tTPrMD2z
         8J0t1BE2gstLe5adT9DnA1KPK5EEl3jKIHdGGcR1pnFenYBginvrjKPG3gfSj6aDdWFe
         ssYpmoSLy9UYNyqm1EYn5kE2c4CYnqwZ+XtlW1/UxdH1jqCPdKv8OFPqxB7Iw4ThYXfn
         P/Sg==
X-Forwarded-Encrypted: i=1; AJvYcCWrpQgNp8CFhobK//uvt/PrRryAx4+djOSZk8lDpYTNTrZQpHmXOYJykyxr/7OrPpxrR74+7qGnZSbwvt4=@vger.kernel.org, AJvYcCXSIuXowH8QmIfkp6niwT5J/4OwcnrzgGQDXTloox8iQA7wfpICZq6c2FJ+OvIKP7OSS8kMBeUJeijGw8iV7TICfmk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyjueyCsmCMXc03gNJ3SPCwUd6+X52hGbjUrlOSp14XNvbTTOaG
	ed3jgF+k8U4O8j0BnrrIO5zIT95Ki+Jxp4tfYb0wUxBd+GF8nsrM
X-Gm-Gg: ASbGncvNXQ2Pl0ye5s5kpofZJ7yUszwfWfzFaweKVcB45/7JjaflUpz7EM7g9JTn2Mg
	aqtHe+/aEB1rZqx+TyzivYnFgNKytiBWuAayKzFffCwW6dqSvndY4a9eshPtGIQvXYm/uBz4fC9
	daLQGQS8MZKT2u/Th7WUzu9kRGoqUqIPMzc8ukmxeaLdvpkMnXoOjkNUp1BaaqWgHGqNFgDi+Mj
	6R9+RFjM9E6artl5gvUgK3UIDJrr42In/svhR1rj7gdDu99F8NE6h3Il8lqstFco9nRXyMngQA3
	rf0s09Mibnx4c7RzphcZxlKGdY2aSc0uhNfKpbgsXSyNWGNCfmamC0WDWqq6zN8bMZGVniiXngP
	L
X-Google-Smtp-Source: AGHT+IF5iem/07wGGfQa7jBrISioiOryTVCpPwJFAUfTPbkxAOtzOjb0nhNqIVTUfIs7I/H8n5iE3Q==
X-Received: by 2002:a05:6000:2209:b0:3a0:7d15:1d8a with SMTP id ffacd0b85a97d-3a34992adbdmr2411525f8f.38.1747217747655;
        Wed, 14 May 2025 03:15:47 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:6140:13af:687a:7a66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58f3afdsm19530249f8f.60.2025.05.14.03.15.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 03:15:46 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-renesas-soc@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 10/10] arm64: dts: renesas: r9a09g056n48-rzv2n-evk: Enable Mali-G31 GPU
Date: Wed, 14 May 2025 11:15:28 +0100
Message-ID: <20250514101528.41663-11-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250514101528.41663-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250514101528.41663-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Enable the Mali-G31 GPU on the RZ/V2N EVK.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts    | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts
index c4f248bcada3..de5dce4514f0 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts
@@ -39,6 +39,15 @@ memory@48000000 {
 		reg = <0x0 0x48000000 0x1 0xf8000000>;
 	};
 
+	reg_0p8v: regulator-0p8v {
+		compatible = "regulator-fixed";
+		regulator-name = "fixed-0.8V";
+		regulator-min-microvolt = <800000>;
+		regulator-max-microvolt = <800000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
 	reg_3p3v: regulator-3p3v {
 		compatible = "regulator-fixed";
 		regulator-name = "fixed-3.3V";
@@ -79,6 +88,11 @@ &eth1 {
 	status = "okay";
 };
 
+&gpu {
+	status = "okay";
+	mali-supply = <&reg_0p8v>;
+};
+
 &i2c0 {
 	pinctrl-0 = <&i2c0_pins>;
 	pinctrl-names = "default";
-- 
2.49.0


