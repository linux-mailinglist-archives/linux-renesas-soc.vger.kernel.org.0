Return-Path: <linux-renesas-soc+bounces-8450-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 502E9962785
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Aug 2024 14:43:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 05D751F263FB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Aug 2024 12:43:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DB3D1898F1;
	Wed, 28 Aug 2024 12:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KP4vUdry"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99CD9188CC9;
	Wed, 28 Aug 2024 12:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724848921; cv=none; b=s8oNXz4XjbhU8cALUc/kaLwdDK344nk+K5wsgdvYA1G7b4ULfhE3RK2iNd1YHtZGgtsSiCafekAY6e1O0pbpzqqd8aKEv0MnmnIZhzoe6TR2tO9Qzbo7zJ6bth8wBEzsV5jOwjVIK1X4Efv2fi/T/rzN8XPXuAPxLm1ohLRsuBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724848921; c=relaxed/simple;
	bh=gzvDMcRQOuakaufWEOv8VbgQoiHtHODupg2yBMLwOJw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hvrB0utw3NV+D3OeJZNkfzCvoVorJyQC+tJZl9Cp4q1hcsXbz8qeNSZx/s/h0it+clzEYSwqneQhXUuu8UdKQqhxGc0rLiR4Sa9wKGI4/AQZUWdyXqgERnxxdBCrlmggQmNeEbZnyfO9RNLB4xu01XYbXRc5xtlZGc8klwnyVQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KP4vUdry; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3719f0758c6so3916740f8f.1;
        Wed, 28 Aug 2024 05:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724848918; x=1725453718; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hV3maIOUiAVpVMeT8DkAWhcGnrPsZPskyWJo0AA0Igk=;
        b=KP4vUdrywVRORBX0GSEOCA3TS96gGvm/B2Z7AHwbcnVZ2vGPvOl7eC75Umo4l8jEvz
         W7WtDEHURyzX2Dd5YtVeNEZBgv5OIeDSoH166fIWeRYDxKULujtiX8Ex1Ijjr7slDIuF
         Mzuk/waSOBT9fmBtfSSksW2xvQgpyLBueqQLVZY0a9j3WYn25oRI409jVT90syas+gpM
         1MJ11IwY08rpoh3egeB0Hd9iahHD82FAaYFdBajCFxhZvZPJ/ABzEIhkRcM+1lRwIG5J
         08h2VGnM9tXG1N2QAiphitdrBgMvCrUNoYxch6sf09pLtGrUIqHv2BI5Fi7n2CWMrysk
         H7lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724848918; x=1725453718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hV3maIOUiAVpVMeT8DkAWhcGnrPsZPskyWJo0AA0Igk=;
        b=nZFSy2VSIHZI+peH8sGg88C0vOdWlD9DzecgFmV7keEgQIDwUr+kg/g7Ps7PQ5Z+ld
         ZXfWBBtsdYwpF/isDpGzdCdbhrhn0QSCmtuF+6ka3ePZEeOKR4oLL/No+pyvNrqMgMHO
         1+o+12Whianoj4vsAZ/gO14bsFqHbMtrzVZn3KbNwt5eVBXYq5hYTO3S3ZayNbYYriEk
         S6v3PTUFpXbjvF/MGWms283/YXxTcnLDLKuAwoWp2jE7aHk3Q/9aT/Yim/HwaxRe88K2
         RA9k25i/ON/PLaHVoeV+l3fGa2nkYorK9aJr60fRVMD2tBa5Ksqp+8PiSU71WgMuYoi4
         oI9w==
X-Forwarded-Encrypted: i=1; AJvYcCUVZUEDEr/M1Cgauy+RDRPddtUK5T5lfavOgS4QO0nSqBzhB41CHXCUigF6whWg3NuuQIcq+5JJwNwoPdoo@vger.kernel.org, AJvYcCX/uH9hG8P2kJSDA4eEoO5uOAJHZt14IuGCImvduRE/A8+wk0wqQrgl6uL2+0nyM6NMY+8bkhk3OKvK@vger.kernel.org
X-Gm-Message-State: AOJu0YxVYC1xwNNAC/vkiKJvDsor4+fhDPIzGAmblOy1mUDaS/juZeqS
	e8K9fgsULlladGLV5rodlG8lqSxC5/oQWBLyQOeueMiTEbBVllu9
X-Google-Smtp-Source: AGHT+IG1f2lzieyUYat4LAGqQCGrxSpo5w24EyJSAnGsMGYS1ui6p2BduXgWnK8q0DGmNIzOY6StkQ==
X-Received: by 2002:a05:6000:1f89:b0:371:8ca0:4d20 with SMTP id ffacd0b85a97d-37311862ce1mr13328072f8f.27.1724848917830;
        Wed, 28 Aug 2024 05:41:57 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:2595:4364:d152:dff3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3730813c5edsm15508226f8f.31.2024.08.28.05.41.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 05:41:57 -0700 (PDT)
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
Subject: [PATCH v4 9/9] arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Enable watchdog
Date: Wed, 28 Aug 2024 13:41:34 +0100
Message-Id: <20240828124134.188864-10-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240828124134.188864-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240828124134.188864-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Enable WDT1 watchdog on RZ/V2H EVK platform.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v3->v4
- Included RB tag
- Updated commit header

v2->v3
- No change

v1->v2
- New patch
---
 arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
index 18f3fb33439a..4703da8e9cff 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
@@ -250,3 +250,7 @@ &sdhi1 {
 	sd-uhs-sdr104;
 	status = "okay";
 };
+
+&wdt1 {
+	status = "okay";
+};
-- 
2.34.1


