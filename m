Return-Path: <linux-renesas-soc+bounces-19167-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D9694AF8498
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Jul 2025 01:56:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 20D623BF6DA
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Jul 2025 23:55:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44C482DCF6E;
	Thu,  3 Jul 2025 23:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kz/ts2Bs"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 861832D94B5;
	Thu,  3 Jul 2025 23:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751586956; cv=none; b=TrwgoYGItpH4S/oiAprkKuB4GGWItxfFF6jXeGkLj7LU5NTejmp6rppcc8OyniLQhrqxxfWQZ85lVPC0MwmNt4dRCTNQgAdL7OOuMfm/uYilJ8+7VwWlmaTMDv2QT9wJGMQ6Ec0Rxh79/TrDZiP9PHEh8XfyAeABB6O1qqmQofc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751586956; c=relaxed/simple;
	bh=u0ANpC16B14FJ0MBF9cnVDGrHEU/D3GBctgg8DSWQqQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fDGBdEcOh24cWw7r0wVCNEwZtFGgtyJkl9kQxhO9CSWVUcqPbcv54BwwA8qXfabXPebkJ11iXbx6Wjk2nc8udykyzWAnvVoTJv89g8EVyOBJ024LQxg/0QAIsASkfUo5G9A0AzwDyzR5TrwhymiVr71x6AHuFGqr7uDQFW3RZ80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kz/ts2Bs; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4538a2fc7ffso10668815e9.0;
        Thu, 03 Jul 2025 16:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751586953; x=1752191753; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+wqidWqIfOoA8OQeeV49xJDBAiz49nIOR1nc+UTiq1g=;
        b=kz/ts2BsSVpno9yAvqF+la5igjH+zLzntuLgNNIpPPyNr6wwqc7/4CdhJatYUgJhi2
         ICOtbmdSod/FKruUmwbtK9FsWYc2PfcRI0fWRkjd6yf+2hMrdbqdCbQVOLUZAE3qYVRE
         rQ3e92fYYj2Qm5WovSRjBHmonOOo8RPnc1qe540wlJ9Sjz5mgR0GPdIuqlglKs0Px0Kw
         E7/UVGNTzSQ6h4iq6ZvNK6m6iZX/aja12ohmX++WKQ9Kda1zSlTsSKBn1G43nYgZfehS
         +u8I2VbKnnm3LolBjCYQuBaJK/XAwRA/N92p5sPLbsvcYhXCzgS9iTAxHDsInGm4KyNN
         15lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751586953; x=1752191753;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+wqidWqIfOoA8OQeeV49xJDBAiz49nIOR1nc+UTiq1g=;
        b=FSlfqLPyBW3Tc+kQ3d5N4FpSSHgfdgRuJCSZI9TZavXH6rPHVaycuQw9LbNgfpjZgL
         LJPS+ezMoPa2O7c572Wx8Z8lqJqG4/KgoFDnSk241UMvK1t8YlxrlLzyQLtsffrpyWcU
         bFh0kMvHlD8GdrqcKdgbI6Nh6wkxisEY7Mdxd1ynYCVmA3tBdWTQGx5EOfKPZ/luVedb
         2UmW9agZ2V4lqqhfoGhvcM6zasIvVzHt9KBJ0Ah7s+J5sjuKYk2vuFnZ69cAC7tJE3i5
         6bQjmiNm1Y1NW/IWHnF0nfP/vLEHdg9noOtDN44GFCRIhooCahFV+MYY49u2pnWv86eK
         ogRg==
X-Forwarded-Encrypted: i=1; AJvYcCUSF+cwCiv4l8H+M3vHgVHxM+LpjQ3BIKPzbUuadfoDr1Zs732cP2XBFp1iJeRy81Jdp5VY4tgn7vG96cnJ@vger.kernel.org, AJvYcCXXqoMDhJR9o4+tYAiO+IBcO1C54HvQrOPu2wGZ6lzokZVqRq82WumJSZMv3HyYKZZfGJ5RU9GiVSiC@vger.kernel.org
X-Gm-Message-State: AOJu0YwfN0SdkN5vYbNy7pR/xQKAmqICnzfbiuT2Jzbv+hlKOPD3birU
	Y7HmUT1ki6OddQsoWaWaNccl4L7VgFZMi4lLgMiTcErkvdVMng7npZId
X-Gm-Gg: ASbGnctk+r18gcIpzs/3wfIeumxRyVqlc0KZ2Pp6EGCzbRS4//tIwmxu1AE4qVgKxmx
	qyO3ITMiLYIm3bbp0st8jtwPK6BuPj5MgtaFx5sVFgik4snbGpBL5BC1Xojd6CTQlUiRAknJUeO
	C3Lcvj5ediGq2wdcTvZs101OavHCoqsYWoMJ510L/SB29rMqt5YTLNk5mY+XK5xW9GLln03sLza
	DssrvE8ok4+iPcreO4XvA4REo7qImdc/8MpM3gThYEQIN3XnLXbndeJcggMon36zeX1/V8jhMnd
	0fL7vRiDaFChoDLVskEXeizAwn6cPlV4cwhiWnSU+Yrapc4UeJEs/wJL15K0dTx9MLA8hZYl6My
	vW+opvlzxH1s=
X-Google-Smtp-Source: AGHT+IEhNhLFwtoERvqR4wwIzABw3n2OOlNv4OV5lL7WaKkPa5Z+UnEUJfje79VBNaD3WpA1dHlqtQ==
X-Received: by 2002:a5d:6f02:0:b0:3a5:1241:afde with SMTP id ffacd0b85a97d-3b495b9446amr673335f8f.9.1751586952791;
        Thu, 03 Jul 2025 16:55:52 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:5f46:9d65:6ef9:1650])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b47225b5cdsm932436f8f.85.2025.07.03.16.55.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 16:55:52 -0700 (PDT)
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
Subject: [PATCH 2/2] arm64: dts: renesas: r9a09g056n48-rzv2n-evk: Fix pinctrl node name for GBETH1
Date: Fri,  4 Jul 2025 00:55:44 +0100
Message-ID: <20250703235544.715433-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Fixes: f111192baa80 ("arm64: dts: renesas: r9a09g056n48-rzv2n-evk: Enable GBETH")
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts
index 8bce7398c2c4..910679dd1b23 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts
@@ -327,7 +327,7 @@ eth0_pins: eth0 {
 		output-enable;
 	};
 
-	eth1_pins: eth0 {
+	eth1_pins: eth1 {
 		pins = "ET1_TXC_TXCLK";
 		output-enable;
 	};
-- 
2.49.0


