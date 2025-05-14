Return-Path: <linux-renesas-soc+bounces-17090-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B1186AB68A1
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 May 2025 12:18:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B44378C219F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 May 2025 10:17:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8E7F27703A;
	Wed, 14 May 2025 10:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I1kCnS3x"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D48DA27510D;
	Wed, 14 May 2025 10:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747217748; cv=none; b=rt+8FqBUlt0sjEynSaC9KASi6zFqY74tBcJi63BEC1zin5T0R3tGTw+iWLCczUK9xHFUnYb0Q7Ia7kKAcC69VPdyPQGFWYWNtoSVkFJ9SEZFhZUjMWyIuibCYggYLVgETC4Hx45c5YUIoqO/TIs4tBLueGxRE3EIf/JEXNUtuBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747217748; c=relaxed/simple;
	bh=F6Ju6U8chQdYIYp52AcmOzLLaiQtAjVSHOSSVNC8ulc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WpJMAIWBQA1hB+pikXFODGX80rcumf+QuuG0+ocPLSD9qqvhDJefgAtXuksoK9N2VB6J6/5SYZc9nZdT3RI2RONqPoIPkKySGMinCAJEPNy9uTlBodCTwjp+72dltzN5+9C1Dpd9Cs7qalVhICyOK3V2xEGAmK2s8PImIJKIc9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I1kCnS3x; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a0be50048eso5165985f8f.0;
        Wed, 14 May 2025 03:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747217745; x=1747822545; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p04CvBDTbFhjsehBSMPMxjuDEg4bAnBD544S/wb+Xc4=;
        b=I1kCnS3xOcZ2IAmDSFFXq+kBkCezc0w7zMe6tAbiE1ZL6i0d/F259Z7jV7iTv0BA5e
         U90n6ohme+kspb6nlflY1fffmXz6sBcRCSIKlbnC8LkJA7awVJzDaNGLjI8oRe+HcIuR
         gLXgILinTJoQhhmu3ytR5ymPFVtaKju91mVEn16QSK+3sp0DvLp2aaCEtY5QhtRZKFSY
         DtJx8NkLpn8ZACRBfmNRlcrCIaNUFbdIS9MhBu40Jy0fS7OK6vGsntM8I1WkST4PvVhB
         qTTq7C6CSc0JBKyWz2SMSBWNoTtax+MJtZq9ZaN1+4op7aLYO5SjuQWw4u3E4/OpzQuK
         zX4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747217745; x=1747822545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p04CvBDTbFhjsehBSMPMxjuDEg4bAnBD544S/wb+Xc4=;
        b=XRwdgdMjLMAI8LJSzUvA4ywMJgZ+thINswe0529gknV65TzqwV8M3apbg6qThlgHyO
         rCWtMCpl5gjBDZDRQx5QDPjuaIgc70SKTAS7m6EwzY/tESCJztS3b/deQvoI+EqlP5IF
         OhfuY6rXNSmei/unTl1PvlwO2o1YCpl9mA14yToAuAuxtYbcYpXRftEPjKpjfDcena7G
         6rwbiXhq03nqCyuKaCGtupvQB5ulNh+2Io3eWNetSCp3X+eQc5JrAuM2gTuXlQ4+DcQD
         9wSWgmCLEzw4+pP1S52icdWfRuUziL7p1/lvrXczl8qrlqWZcFy8P5tGLjNbWGPfpgQ4
         FR9g==
X-Forwarded-Encrypted: i=1; AJvYcCV85j48/fUOepQBOs3gSaDilCVaG3zoLblpzxy7G1b8heD2kDW/TcJtKLSjhCJ4EkFs1ukby33ALQIVF7k=@vger.kernel.org, AJvYcCVnYeXcFjlYtXAF1BzBsaql7CIXpSl983B39pxrvK4FwyphGF+2RUno18p4WuyO6KxhK5tvYGVSl5dRcuVAHSnj6eI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzrO3+C0rmjo7cnHk03MV0t63iAoQMvJ8rBCWZS9Y/nPy6iEf10
	uGnkFKTZ2zggJAcsqlztRJe5x4pIEL9bHBn8siKSBMvrKxkTC9GwMOPOnuwn
X-Gm-Gg: ASbGncuIKEzxeFTXgjDbP5xL9rku6bNviMf7G/BmcqK4qOQGMC6U1cGzdZL7HqohK2F
	LDwttDJWTUrgN6xF8MlXf+yene9kpg/vTuUu0VAmj7xyXoK7ePjIu4/Ttb2TvpIvOH2e/lGFb8d
	zJsl6KIxC4x9slRX1SmrB9RQrsUxbYJoyknPBtx9SDvcsZP0xMLM8gwdSGNM3J9CW9qv/+cDjhf
	IerENPxkeaoLH49JVJAPKrxcWNTF9Za6S9g/6DL2wHSEowKxMOL5eOmxjb2h/nXPqzR9uwxNPqn
	JAaKk5bmBYnlR2o2VZxMLZLDorMFT6TQNrqLyAqtUJZ/R7YJR+jrQrFh2BzWQ0PgfV5VxgBXT0M
	a
X-Google-Smtp-Source: AGHT+IE1WKs11o6BUxmcYPeX8pR+owfmTdt8p4SDAd7aiolk3VGNjwxLhknCFMNV+rlimWZa+3HFXQ==
X-Received: by 2002:a05:6000:40cc:b0:3a0:b1f7:c1da with SMTP id ffacd0b85a97d-3a349922585mr2514437f8f.46.1747217744837;
        Wed, 14 May 2025 03:15:44 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:6140:13af:687a:7a66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58f3afdsm19530249f8f.60.2025.05.14.03.15.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 03:15:43 -0700 (PDT)
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
Subject: [PATCH 08/10] arm64: dts: renesas: r9a09g056n48-rzv2n-evk: Enable WDT1
Date: Wed, 14 May 2025 11:15:26 +0100
Message-ID: <20250514101528.41663-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Enable WDT1 hardware block on the RZ/V2N EVK.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts
index 12de1c21fef5..c4f248bcada3 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts
@@ -305,3 +305,7 @@ &sdhi1 {
 	sd-uhs-sdr104;
 	status = "okay";
 };
+
+&wdt1 {
+	status = "okay";
+};
-- 
2.49.0


