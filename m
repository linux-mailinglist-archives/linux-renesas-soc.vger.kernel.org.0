Return-Path: <linux-renesas-soc+bounces-7800-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0236594E319
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 11 Aug 2024 22:52:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B804428193F
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 11 Aug 2024 20:52:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DBF916D4D6;
	Sun, 11 Aug 2024 20:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WOqI+6A4"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7B7316BE34;
	Sun, 11 Aug 2024 20:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723409423; cv=none; b=eUPlBv1t5NAThPYxKR7raA/fXzOxfCv5rbQfp6HH0bg61eYOu2WaCG0k/MK143ZfligEPG+DVcDSu96oIq1zH/wtpv5s8AEVZkL3JmQ5m9b+hwxt6W2XJxuwzqMj9mUeTNFRFH/GA6l6RLjTl95likZYnpRakt3jEZycOT+uKj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723409423; c=relaxed/simple;
	bh=k+LuW2jix8C9ALAH8r+ZDqmCmnEdomjVuKAg1UT6bns=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HJka4menvf3OO2DSKL4NXMkp4/nCrABEDfQLmc8iNBpWOCcXgEfnME2uZyfnUQKHc+SjUnAa7kZyVgIPHGwQ5ANmwvYzBo9wK1elw/GA90QUnY2SXGJQdedSCXRDpFcz/BIGuPhPQ0Ujj/JnB1qtCCclBTSEvZEIloo6HY6dSmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WOqI+6A4; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-36d2a601c31so1801962f8f.0;
        Sun, 11 Aug 2024 13:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723409420; x=1724014220; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yX+p4plukCITJXE/k7HSYAByQT3b+AjRufiywHMOVVM=;
        b=WOqI+6A4SLOGTBtQdvApykbQ0SMIWmSnIdfAqJT4PoUkxaCwG5lJgOdPnszr1QbVsP
         LP+QnxouZXuNblOdd9/EdDczjuvkl1bKe/U14bLffuU6495aqFJKodnWSC0Cg/onvis4
         qfEDV4WdQR2JrsnLxH7A/idoKCzLC77q7fkXuqiAaj1o0x9tM+0e7ybPQE08uDsjlyLh
         PiWaAkyoKsT/t37LoqnPIZPFRQ+yRa0rJTKA/uVn/E5hNjWsADbCIVCmafzglGkZSHSQ
         JlLHQk09NP8LD+IFCEUutvSktI5qL5HLNptYYT0F383gQfDCYUtjTSMqYVGzrseKFvsU
         eKrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723409420; x=1724014220;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yX+p4plukCITJXE/k7HSYAByQT3b+AjRufiywHMOVVM=;
        b=Lh6Cgptwb/gNXyzE6kCcJ2uvq8VXnXu5k/OOOVTLEgzzudyLUQXQdrlzh5ylc/fNVD
         /UgCh1qiclhCtIISvihB5hj1CwfUM2x81zr8B61wkbNIxONbvTH7YdrNtnWn/Kr9PFZv
         45yIwtlTM3wQ2tgOcYqBYMUO6YNmwImjiVtwxwPPeZGOssrVKsZvx7b+C2v2OIzstU4I
         T0lxsLysGbN4/wMTYu9LIl/4fLR2M3EHzidmsP9E9E3mITBr9IxatAZpyAWDs3PabvYg
         o9dUmHhGfzhgSeVffox+dokYoiAhXQaNKYY/52ZveVrsHXdwF+mhruxGgDf5OgMQO+3B
         7yjA==
X-Forwarded-Encrypted: i=1; AJvYcCWisFqJjhzbN1SuwrlPnrg6MI5FC49bQan7VpgARVe7bxEloh0/IkCUSmZBR8slkLxYsv/Ka6LorALrBIHhmfiI/cN2ca4/ItDWA6xCFMk82t6hNS1oz6JvTyfD6/qhkbxOj/FgSvp8yw==
X-Gm-Message-State: AOJu0YwxqkIeROmoOR6Ykt9CXFpdnDhh4kGhJkixwmYsyBa0BpHbO5dR
	Xuw5EkjfJBS578j+l8uh8T9r3vfeUMNi6zlzTsVANJbUis0fy26h
X-Google-Smtp-Source: AGHT+IEiShrFMLtPIYNFYTHpcx3NFME1sfPtRzMz7neNVO1HvK8nk4I/PKJIoxILZPfOTkWSjnasnQ==
X-Received: by 2002:a5d:4204:0:b0:368:41e0:16c0 with SMTP id ffacd0b85a97d-36d5e3c2b97mr4053855f8f.22.1723409420162;
        Sun, 11 Aug 2024 13:50:20 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:2595:4364:d152:dff3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429c750f0absm76421845e9.17.2024.08.11.13.50.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Aug 2024 13:50:19 -0700 (PDT)
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
Subject: [PATCH v2 8/8] arm64: dts: renesas: r9a09g057h44-gp-evk: Enable watchdog
Date: Sun, 11 Aug 2024 21:49:55 +0100
Message-Id: <20240811204955.270231-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240811204955.270231-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240811204955.270231-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Enable WDT1 watchdog on RZ/V2H GP-EVK platform.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2
- New patch
---
 arch/arm64/boot/dts/renesas/r9a09g057h44-gp-evk.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g057h44-gp-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g057h44-gp-evk.dts
index 11c13c85d278..e6befb1d638f 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g057h44-gp-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g057h44-gp-evk.dts
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


