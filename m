Return-Path: <linux-renesas-soc+bounces-13259-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E89D1A39B97
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Feb 2025 13:00:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B279A3B67CD
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Feb 2025 11:59:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5670B241CAD;
	Tue, 18 Feb 2025 11:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kgKJ7kqq"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 874ED2417DF;
	Tue, 18 Feb 2025 11:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739879979; cv=none; b=XdnxkvTKdvSxLjt2eRN4qqAmzo1YonlC6QVnAxWe+io3alQ/u+04D0EwN5IfmiNwLtLK7oiUMODzqBV8xZfoOlZ35ktD6lwwLJv0hyxEQEqCzDEK+ioDk+Ua8BGyyid1yyb24GqEE/Cl+uBMjMlS6nxSjkueH4n7ff9pMays/xY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739879979; c=relaxed/simple;
	bh=mzFVl0txLHgbBiO8dAHNwlt3y0S+ytjAaWwNe3gm0TQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M4wjE+RQHwxKQxKxDClKYEpnvMKZiVXGlFny/b8cS7edPoNDvjbNCnzIbPZKHScbo44jp+1bRzXQKEiJXgfZ+NonJqrUIcxWm7CQaMPrvdusuPBLahX0S7DKDzdTM1ufeZKxMKXTWFgCZq55z05vwvi6YNgjmtsvBCoEix5g5TA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kgKJ7kqq; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-38f24fc466aso3836910f8f.2;
        Tue, 18 Feb 2025 03:59:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739879976; x=1740484776; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FZiOt1lRlot1BHFChoYwPIhNyiHDH8feLoQiFWYbmsI=;
        b=kgKJ7kqqSiFRfCM0vSMzJkhktRFmDIIJotpn6nx6t5okNWbG6sYzt7ZIZ7wHwYGvUn
         t4yxonVBIOT4ffpVf8YkSbzH/JISvbRjXh2f+BH4qF5CxSSGwfI24mbANNXPpBobYTPv
         mzxtBVS6XXkeEn9Ck1vTjr8zBJE4sKgiV2oYgtoF593jv5kMFEqWKqElSdqiq2dv3Z4s
         fxKzAf8L+eKm62KzOxVLS26ZG1ZAJhW3SiRYrEwIamrnKhVcVgVhgaHk0vg+CUdJEJzC
         DMV+8Mgicz1cI4/X9GOZfOsHABMMRrAqJRtoEZb9jI2Kc4IbkdVmrrqhiAq0BCSIyagS
         rw8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739879976; x=1740484776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FZiOt1lRlot1BHFChoYwPIhNyiHDH8feLoQiFWYbmsI=;
        b=QHJnh4zs5olH5SmP1U/Fu9WTZZ2EF8mhndHHoLvd8ZCmiYQF65IcbrThwDV3lQlows
         n/Jieuftn0G28IiKkcHuH5kKjOeEoLz5TaDgXfLPe6PDYCc8BX/hW9QZF4MvYp5FyH/E
         OYJFmVZRaYAEqRCcFpkf0kyF89POtCQLMquokXReJUeP8yRKwQmhz9dMZw/anAPpGQ34
         QKx/hmMYk6dcGj4/S4NCZC7GLqjFDTdU8v/XT3/0BYKzzlYdeEtG5IwA0lXiAa4lWd60
         EVB1AbsYkF5bcVKFAzdW1aH1A5xs7zy0C3UzBYqUDp0NMTpqzlPC2QVFtuZnXYjOTf0x
         +UWg==
X-Forwarded-Encrypted: i=1; AJvYcCUykpxNN9D20nMg61MED+7sVTjMSfDQY5rUtOs+q4JoQuZT8mNpcsaoviEzkTGxEFPy44hx/cBP1z0N@vger.kernel.org, AJvYcCXcmLr8rtW7T9K16UsDI6w3qCLbYFwzhLdH5GB52J7hhkG/DCdQq8j4lLks3yTb2g/wzpAElsWLyykHcDFplTuW2Rs=@vger.kernel.org, AJvYcCXlEPpLzVz/3hxBJkkI45Ecr7f6m8+loyJuC6lcZcVKrfgnIJ9H9kb+EDF9mPlK1Xl167jlmo7k6DTHzTUy@vger.kernel.org
X-Gm-Message-State: AOJu0YwGoeZejUIVsbryJzAHmfCk8/vZkMseATiFJJm2n1YIxymkP2ut
	LxMvd+jNSD3KurWcFdM2lMLwFLukI+WseHwM+xoTph0BAwEL4BTt
X-Gm-Gg: ASbGncuTiyUlj91OwKzOAjHyvdIuZq3qPTituynzY7OWVJJ93TTay0oQp8wOWcPh31o
	7sq78eCzMoksUiClquO/uBfetw3taLpSrjRm+jDYpqEGQrT8+8DIKXvoUBVdmdbgLFDqc1VeUQN
	zu3Kclh7mz71+8Qhsv2Fi+0FNMP/ZxbCszLoKLP+YnxdvnTHT/hqOwWRHupZON4GhP8EKArF/Ba
	stp51RBh3QOS5gVfQcgFYUaO09ynu0ZWRxDjqpDAVD6+ifPRq0az6pp8TRapCbB844e5PDeQeQu
	enugIPiD9fbNPDVGK/BmZqil3Yow8tzKN4ZRd5rE4FF6
X-Google-Smtp-Source: AGHT+IECB+4Nj3x0srmh79Ho2gtvdQ8hh//8sYwUbQaKdPmJsDnfYeBX7wxvKbP1TDMZ73eMzpnTtA==
X-Received: by 2002:a5d:5887:0:b0:38f:3b57:681e with SMTP id ffacd0b85a97d-38f3b576996mr8762134f8f.49.1739879975723;
        Tue, 18 Feb 2025 03:59:35 -0800 (PST)
Received: from prasmi.Home ([2a06:5906:61b:2d00:6940:cc67:5b00:b151])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4395cf084d5sm123873255e9.1.2025.02.18.03.59.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 03:59:35 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 3/3] arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Enable Mali-G31
Date: Tue, 18 Feb 2025 11:59:22 +0000
Message-ID: <20250218115922.407816-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250218115922.407816-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250218115922.407816-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Enable Mali-G31 (GPU) node on EVK board.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts   | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
index 0b705c987b6c..780823908bf4 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
@@ -43,6 +43,16 @@ memory@240000000 {
 		reg = <0x2 0x40000000 0x2 0x00000000>;
 	};
 
+	reg_0p8v: regulator0 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "fixed-0.8V";
+		regulator-min-microvolt = <800000>;
+		regulator-max-microvolt = <800000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
 	reg_3p3v: regulator1 {
 		compatible = "regulator-fixed";
 
@@ -124,6 +134,11 @@ &i2c8 {
 	status = "okay";
 };
 
+&gpu {
+	status = "okay";
+	mali-supply = <&reg_0p8v>;
+};
+
 &ostm0 {
 	status = "okay";
 };
-- 
2.43.0


