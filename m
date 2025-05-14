Return-Path: <linux-renesas-soc+bounces-17086-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2024AAB6890
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 May 2025 12:16:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4CE764A5882
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 May 2025 10:16:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A1322749C7;
	Wed, 14 May 2025 10:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jT0cwtwX"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A9E92741B7;
	Wed, 14 May 2025 10:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747217743; cv=none; b=W+Ov75/T8AYD3w/RL2DrD3Q81pZl3kivHhaXxM5sSxp73vlatZHV7bgaiAMFjhCqL94JqTxSfMKnF+mcQQup4ek5o+tknDRiw2AGFcUJy4Qhxc/7w6wPrCdltrbnZRM/c1NOcrRLjlKbg5E+XKDfnXJSTknl76YB68eyUJUPLVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747217743; c=relaxed/simple;
	bh=mnqbtbW+dLWKpWpD3Oeu46dRApO+L+xS89W5ndhjlSI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AHNdaM+8UT4esHywFHOyZNuREXZJMMS7ID/UJOrHX83Bh18SwMoxvr6NcXC9qC0eq05VdxQkOdNSSge0o7r3zwahdcJCaURBaDpw4N22JUqUftg7uWMDhBmrHBfrdzuwVT2iUt9Xkzo5tzAuN6Mt0mnbnsfOqlLcN+QNm6KOMUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jT0cwtwX; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a1f5d2d91eso3824981f8f.1;
        Wed, 14 May 2025 03:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747217739; x=1747822539; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gHFTNofL5aafinMdCSrcIJpTz1DT13JMHNYYEMN4izM=;
        b=jT0cwtwXcF6d+uYrSXM6XU2KFCX1aZTzh1XWxy8N1cmEGssnj3Xj2OSt+qRZq97qup
         N4V3Vqw5nDomwGAKG2wUk4dWzjMWgGkY1w19TIFs9f2gkX+m8oCQ7wQ1tHPdrrjciX9A
         vPPgFlwGj+8Yqjq93TbKXPFLv8VRyOfBjlGxqdWxHpC8UoM975csNWWhxZo3Nj1xYdbL
         TRq1j8QZ+wuPk3AAGwngHS74hvtsVE46u9gioWEHtL8RdHcHyaRAfErqBD6GzfRXAqAF
         LwaBbDZCY1ETEaW+qjmg18O0BKgSzodRk5h9n0td0IUvZRbDcBYRwabbqOPsgXH/4vbk
         M0Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747217739; x=1747822539;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gHFTNofL5aafinMdCSrcIJpTz1DT13JMHNYYEMN4izM=;
        b=WIScuevr1puqoHeU/cwix56kAxWFpdFJ0THXoe38EAsSBPSMB5ftzQlov8AjeNWEBG
         YocFG3ACAwzw2GQcsBDncLal13DPYoLCP6xDCYvcLeTfLB6vClgdjTxjyAEfQyWhQ62C
         avwBA545fAG4aJ1uCBzObHFSxqGrYW8R6ELzqdnN41mn1DU6bpX2dkG06PYhQD87ScI1
         6IMNYzCrB/Yzy4ThwHmKC/ki9BsYKqD4amkZIXq8kdmUdFjBjgcx4ZE+NcOeS0EByB2t
         VrdIEt2qA6s65SFyiXLQoUgMenZykKnjg6QZDTkrPzIKA0CucEOZrHQj2jZEWzH4MnVH
         vvWA==
X-Forwarded-Encrypted: i=1; AJvYcCU9aWdVxGFnZC+E2+kMsapa6AYaKzcuVTgLhYKNO7Ln1bVBKSjJe2023ktHid3EQeraqTCkawf+GbiYduA=@vger.kernel.org, AJvYcCXx+CBvAjMF0vBFel2iKBE/2fg17h4pU3WU/HDMjA3llr2GHMM6s1vZVPbmtHty4Yb3jYmUvw8BO+PWMVI1ilfxQEg=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywju1TkKDKkCX6uoXVrHQVze/KzcPm002GAPp0YAHHdPGJve1Ib
	wbOaPIJ/g0s8mlAVaXWq8J2gY1d4QvPFcyddJWAHaGgX0IEwXviR
X-Gm-Gg: ASbGncsTia6kKUHPAVmaIZN5Fzf8JOAJjzHIJTS6cPpy0mK4B5WrH1tEm/uUw9Z/2SX
	r9t87YeAdkj61tev3MoSjaszllAxG7HUJTzj2WVXT39XvfsO2sWDanMtbppEflestgYTckxnvWy
	m/7YQxrBWhQO5WejN2TO3Sah5RPfb2Y0LQcc7LOmqOtifO4Kj0PoOh3qqmuU6+28BnwhTUGe8So
	mEmelpFpgsgC5sg9INesv5gK9bcQLO1WgJyiLTmZv5SqiWTkr36bBgnLF/ek9+I3BLrQY2JBl7V
	MbPO3jU9ffMzSpwNAtoio7mPfiwDWj7z8KxiSsbP2uqI2R/hWWstjWdXcaURLHSutGB5C0R0NO9
	+
X-Google-Smtp-Source: AGHT+IECKmmSaYbWXHLI10tP3yB8YXndrtYtHhrgnf0sQYHpNwoQxFxt1WoWZX5nOyPdu8XE+ObUxA==
X-Received: by 2002:a05:6000:2a6:b0:39c:1f04:bb4a with SMTP id ffacd0b85a97d-3a349694b08mr2326672f8f.10.1747217739242;
        Wed, 14 May 2025 03:15:39 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:6140:13af:687a:7a66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58f3afdsm19530249f8f.60.2025.05.14.03.15.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 03:15:38 -0700 (PDT)
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
Subject: [PATCH 04/10] arm64: dts: renesas: r9a09g056n48-rzv2n-evk: Enable OSTM timers on RZ/V2N EVK
Date: Wed, 14 May 2025 11:15:22 +0100
Message-ID: <20250514101528.41663-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Enable OSTM0-OSTM7 instances in the RZ/V2N EVK device tree so that all
eight OSTM general timers are active and available.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../dts/renesas/r9a09g056n48-rzv2n-evk.dts    | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts
index b72574dcc209..518426dd624c 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts
@@ -110,6 +110,38 @@ phy1: ethernet-phy@1 {
 	};
 };
 
+&ostm0 {
+	status = "okay";
+};
+
+&ostm1 {
+	status = "okay";
+};
+
+&ostm2 {
+	status = "okay";
+};
+
+&ostm3 {
+	status = "okay";
+};
+
+&ostm4 {
+	status = "okay";
+};
+
+&ostm5 {
+	status = "okay";
+};
+
+&ostm6 {
+	status = "okay";
+};
+
+&ostm7 {
+	status = "okay";
+};
+
 &pinctrl {
 	eth0_pins: eth0 {
 		pins = "ET0_TXC_TXCLK";
-- 
2.49.0


