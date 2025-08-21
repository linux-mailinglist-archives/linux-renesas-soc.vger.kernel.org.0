Return-Path: <linux-renesas-soc+bounces-20877-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E6445B2FFDD
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Aug 2025 18:22:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C2FF7189D311
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Aug 2025 16:20:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18B5C2DECA3;
	Thu, 21 Aug 2025 16:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zu81HOjx"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6518A2DCF62;
	Thu, 21 Aug 2025 16:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755793197; cv=none; b=aaDQcD6sT4JmM1dRsuRS7KaLxCflQRhtHIqbGrU6TvI3yZ/B5wXEiPSKCgmF38QRgG4mWhVdmMBLQRN3LijGc65hh0/t0Q0WJFJqnNavxgnASlYpvOHOVa2AiRixC8PGF21vdH0rnOM/lqn5L7riRvgLa5xtKaYfoaPmi9j5Ln8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755793197; c=relaxed/simple;
	bh=1OlaPpjOFZjAhsbWJEWrEHLw81ohwq1CkB+/Cr7FEz0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qZpdZNkpj/zkKBRf/cY/oLjrKO+O9u9HkBwnL0/27FW1gV8DEiYrK5rfY2bChkHEns6jg56Z+m9aT5FGSSQDtALS2tGZ9BVHtPO63lN71/dp/VNCF/mGC0G4/2CANsbim5nJHM/gCm3QMN3YALnU+n0EcwuvpwxMd+LlpH80GQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zu81HOjx; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3c4e9efb88aso544419f8f.2;
        Thu, 21 Aug 2025 09:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755793194; x=1756397994; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VTx+acWZZ86nTcWXKNIUIwpMQduf+oEagjPt00pAbdo=;
        b=Zu81HOjxxUpz1NqMrRCKb5DHJAlfA7pmP0Wycl5v59lDMicJi/sgEjuFq+Pr7tanNI
         tmHubLKHhuCsYwx6o8LgHBYQCbM3iRd83/SDj3HNEqGc+tIBZQc0E67+8p//708HOLd3
         exP1d6NqrMHQr6BfQIOkBcLv+SdVzfC4ElpXxcmoOmANy+moSAsAEfAY0//L0Q1tTMBV
         FM9uVXyTxz7XdxhUHIkSIVmTuYXuN9Rfavmqw8y/GZzA0/GZefp4DGYiUq3QAKSbeQru
         HlUXpmEN5ONIE+VE8UGDIX06gGeEK2FVS0PykdTbGLef1x+INxNJYFwBMNNijmrwXdy/
         FALQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755793194; x=1756397994;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VTx+acWZZ86nTcWXKNIUIwpMQduf+oEagjPt00pAbdo=;
        b=PDZf3RVyTLLWM13RRSqNFf50s3o7c5NHGwsSllkHKh98jhNMUkn/tYNAbLgQf9w/ye
         1Lj+RqRxQuK4GcUcbTGaPnvlqh1PMIAEAZKVxX3NvrgnHQfAbUYGdHhSsaEcrccjmZmv
         tbcJx35V8+xqQbNE79OwICN1hU9WebfGyu55ZPYYcm677cWqaq5tZuQ4tgkmtxaahwWI
         fvLyDv0u/JMu32IrkpW/c5Z7gG+moX2OrtZpD81NChOrpDnVVNiqH43vCVdZ2mqiaGKE
         rltD1mDpaAG9L9isQVjRjzxFnT7YQV1yITiXTUkI0J0oxcofk4YpaWa2deOIDt410TVg
         k5JA==
X-Forwarded-Encrypted: i=1; AJvYcCWP25sWGNPKbuXlIB3ByNlUCpeb/NxJho9xH3qt9hKy6vkWbsGpR2PCKIPWFt7CMj+e5edIeflt45An@vger.kernel.org, AJvYcCWWh2LE4ZEz10DQj4/cKoIm8qjjoOlruFNf4q7jSHkuaQGlpOvO//2/52HfUlZHgbFFTJLbQPUVteAhRghS@vger.kernel.org
X-Gm-Message-State: AOJu0YymjYOv8PpEJ4oy9gzXlA/TFSfVIPwn/sLGmip2mojQgCUSZQbS
	5P+tLK0UwGiqBOEgarNO6eCQgpijQ8Hl7ih0/vntB0vuCrfNPqYy2h+E
X-Gm-Gg: ASbGncu17s0/96Ti11WM5cENJ/pG0eJLxML0HM7rnBZCCPt8lFFtGTXJGneF5RGYA8S
	HZuOtGHvi0wJW2wB7/vhc28v6GXjKdSpzRjXEwXg0iSB4K9CdBKZDbNEOM9rukdZQGm5wjc9nJj
	vn3su/cmLMy0V1XXEBkQTDtghfTvdyenYWH8ryfrofcmjZz5jOAqbuXeueisbYWytiVDL4aEwq2
	FQHf2s06idi8MT/a3tyewh1QOCGswfW3/iDQBF0mCOBbnossylnKsvzhc2ejn3PVKlQ7rqyfgPF
	fGcw7oTR4zwCctM/xQFROsXrZVzbPgGEsSFzcWoICgMjdQnyZSiQ0OwrfLyo/O4VX7C/HZ4mCe/
	uTbqk9WDzIDQEiAV4m7fgLLAp9+OD6JT4B17rGf2rScvpOfNhho1iQ/X0
X-Google-Smtp-Source: AGHT+IGMz3qTyLJnMpivxXvfpuTj3quAYpgu/FRA5Z2TGXdzwZRkX/3Wa1tShneCQXQG56i1bs/7gA==
X-Received: by 2002:a05:6000:2302:b0:3b9:1056:dfad with SMTP id ffacd0b85a97d-3c494ddc858mr2745329f8f.3.1755793193596;
        Thu, 21 Aug 2025 09:19:53 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:9ed2:95cd:69a:8d10])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c4f77e969asm2316464f8f.20.2025.08.21.09.19.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 09:19:52 -0700 (PDT)
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
Subject: [PATCH 3/6] arm64: dts: renesas: rzt2h-evk-common: Enable WDT2
Date: Thu, 21 Aug 2025 17:19:43 +0100
Message-ID: <20250821161946.1096033-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250821161946.1096033-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250821161946.1096033-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Enable watchdog (WDT2) on RZ/T2H and RZ/N2H EVKs.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi b/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
index 8b9d04dce8ae..91068042bec0 100644
--- a/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
@@ -217,3 +217,8 @@ &sdhi1 {
 	status = "okay";
 };
 #endif
+
+&wdt2 {
+	status = "okay";
+	timeout-sec = <60>;
+};
-- 
2.51.0


