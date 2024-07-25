Return-Path: <linux-renesas-soc+bounces-7520-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1526193C32B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jul 2024 15:41:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A36DB281F28
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jul 2024 13:41:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9816119B5A3;
	Thu, 25 Jul 2024 13:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IRCIEzF9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE0EC19ADA2;
	Thu, 25 Jul 2024 13:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721914879; cv=none; b=nk8qfeMa84lZnkZSJXKMTkLULKf8sMU9LQTaspgOfveKHiHqS16zzeNBkgrfj6Lk8BqYS+cPgLmxTWYN9Ln4mrtg3hIDWa2IxpwYfTL4EtP/1YZo88mYEVCiUWFAlIKPrYPRrS/3Dr7aUYG3sMeVO3nVPhjbj/MEBRKC7hlqHYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721914879; c=relaxed/simple;
	bh=CVrgd3M5EJTmBjj83oNI/90EWEctSX8ssikl2vBV4xU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IXP/AlIN+6NZg6dFppwl2pYo9ugKLQ24maS7A4I9ux/o7Qaa7Pm7dTMZfSrRWo7H33Tl8oisrj4yjRtlPofU2nJMxU6vhXSJx0OA6nE/zFWGU8peFX746yIK4VWtFDSUciE2UnkAIO+LKLKYdfLcLJhXq4R/XzfpCH1PZ5ub+mQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IRCIEzF9; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4279c924ca7so6729765e9.2;
        Thu, 25 Jul 2024 06:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721914876; x=1722519676; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kC8fYZcysGgQdUuFm6U/kjaajNVDNoqoByF12bTLpho=;
        b=IRCIEzF90aD7rS6ZFj3GouL1PHhfzkaXdkieTANiTNbIWfHy723K2LN7waQ6JrjdZo
         qxEE+v7onm/oRX4KIDvbW3hMzRtIT2oW2McrvlKhU4kkId+XUSEV0YbwZxwqkAqrE0FQ
         oP0KV3J6ut5Z9gXz1g8N5A0i6bkirTLkQj6pNL420u9PLdpGvpEcL0T4kpaakmAhElxF
         LFms6mwxAfIPIAYTuqg3ySmO7Vny9onIBB3zS0fRxmUw5dIXwidBXV/dx99wX5JBHxXF
         3r8F6BrtoG+83aLdtogGBNZj79j8mvAaZU4OcvFZoilmXTUWIu6MNHybwjfkIBUCJ386
         Iz5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721914876; x=1722519676;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kC8fYZcysGgQdUuFm6U/kjaajNVDNoqoByF12bTLpho=;
        b=RWYQcybOT5gNjwnv8aKn6j8uC24kB6hZlC+1PJRN3zZmRWg+NyiazFeIo4KQ3szzpq
         7jGWxfcgPgkbf0lIkDG2OlT8BI63Qagl9NaByFcCWNeGfZ0zNaa+Dqx/XWPexZh1J0uV
         NPhYEgEru1lb+znoJXzG1M8onf0pJ2eFc6i7YwDRcLAQ/uAsneHlSvxeTGuPCcqwszTu
         lrFVJZ2WdYWg0h5yf4QZV6Ky9I0qdqNFJnl7VMC0bA+s/Z2njPyLwbcIluMMi0a5KvXt
         nHYTCBzC3ALO7v1U++U3Y5d7aDrvxmBMJT1Z12MDYWP/VTCE5Ak3qu0stus3bHIgjBSC
         8vgA==
X-Forwarded-Encrypted: i=1; AJvYcCUY+b4JuiiVpIgcPf38H68SBlG1tgcCfLIN+EVDwxccwwCVaAmKjgVxfNzEnqfJpCCMIitfJlSQke2EXyKCpXBn99UTIx6brAJfKo0bN/RHKiIm8uE8PtBm5OIoZXWHxFeBdM1y1PCp6g==
X-Gm-Message-State: AOJu0YxFqM3vs+xBWO/JWh9xE1HzvOL9GwNucSmQDLvQU5IaHfkK+2kV
	NScLLcU4DTR+7rq6u+C+AHUoUtaV6lSSiBJA8Sdp6SdLtngbS1Zr
X-Google-Smtp-Source: AGHT+IGlb4dOk4VzLZpSpenlo4xJtSsrZhsMz0LzrfYMp9ZmU6SV5UV02yJzGqiPIIectoxSLQHThw==
X-Received: by 2002:a05:600c:4fd2:b0:426:640b:73d9 with SMTP id 5b1f17b1804b1-42806b7e3bdmr16723795e9.10.1721914876213;
        Thu, 25 Jul 2024 06:41:16 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:2595:4364:d152:dff3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427f93e605esm80447085e9.34.2024.07.25.06.41.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jul 2024 06:41:15 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Marc Zyngier <maz@kernel.org>,
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
Subject: [PATCH 2/5] arm64: dts: renesas: r9a07g043u: Correct GICD and GICR sizes
Date: Thu, 25 Jul 2024 14:39:29 +0100
Message-Id: <20240725133932.739936-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240725133932.739936-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240725133932.739936-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The RZ/G2UL SoC is equipped with the GIC-600. The GICD + GICDA is 128kB,
and the GICR is 128kB per CPU.

Despite the RZ/G2UL SoC being single-core, it has two instances of GICR.

Fixes: cf40c9689e510 ("arm64: dts: renesas: Add initial DTSI for RZ/G2UL SoC")
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a07g043u.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a07g043u.dtsi b/arch/arm64/boot/dts/renesas/r9a07g043u.dtsi
index 0a4f24d83791..3bc3b7bccda7 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g043u.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a07g043u.dtsi
@@ -259,8 +259,8 @@ gic: interrupt-controller@11900000 {
 		#interrupt-cells = <3>;
 		#address-cells = <0>;
 		interrupt-controller;
-		reg = <0x0 0x11900000 0 0x40000>,
-		      <0x0 0x11940000 0 0x60000>;
+		reg = <0x0 0x11900000 0 0x20000>,
+		      <0x0 0x11940000 0 0x40000>;
 		interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_LOW>;
 	};
 };
-- 
2.34.1


