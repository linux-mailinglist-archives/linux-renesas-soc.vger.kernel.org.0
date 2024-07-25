Return-Path: <linux-renesas-soc+bounces-7519-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB2D93C329
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jul 2024 15:41:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9EED5B22A24
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jul 2024 13:41:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E81FA19B3E2;
	Thu, 25 Jul 2024 13:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kR3RSDTz"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DADE19AD8A;
	Thu, 25 Jul 2024 13:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721914878; cv=none; b=D5bSXEij74erXkYRkuQ3sdhS0QjLeO0rnC7d64Vug7G4pGmu0S3SF6pFSMZ7x1qJ2z87c9v6iazrvCt/8zyxaBG43IXMXm91uw8s1X4eGwCQBwxGUhV9b8KFYPMVQvDngHe8PUeEub1z+KjClp95zbH3ZnD4V3SDNo00Qn0zIPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721914878; c=relaxed/simple;
	bh=m2WJgGRqgJ2lT/sYsnOMcXQl9Z6sB9K9mR3uB67NdtQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sgUNMjMFB3Eu6fTNNsdNiDrI68+0eO1VjO7KduDyylcPxazCo2tV5+pOdtqzB7hh/hCOOURhJOOGKOTMXW2nNxRkee2FElPADAda7rS//FEy/xmjUwI+d1Q4p5D+1B5MR2JJ96rsjqH6bAe3vAZFm4NaDp50y76CS9kBqRoLWAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kR3RSDTz; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-428085a3ad1so3481835e9.1;
        Thu, 25 Jul 2024 06:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721914875; x=1722519675; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8qS6lA1nNGdplV4y/ewW7Lco6fbdCpIrDIP4fiQLWzY=;
        b=kR3RSDTzaDYhGMrN0cw5sXNUgHdzFFFqgzUGkPnJTW6dtyLMcClH0H1DPWplekf80C
         rqCg2AlYMWekojCDXjIaGEn7bIFrSHMAmn7vXOTreOcO3eg0xLnCgIVlDwIYu1q3cFA5
         Ugsq/jFRHe7vKStnev9R89ohLsfIyC+9KicbW+AbRNwwIZ1qgwmu2nYTWtZnDT779cOb
         XBfa8dEJSdFC0Sh76fGxaC1glnB3N0MlwD/hqOIk6l+pnUtztLNGM04E4XA0GJkF3KrI
         uPQ8Wys0oGm9p6Y+RHJoNmYf8hpQWGV0opPyKitzdJeRM62aAe+r/HLw4oGJF5ffpEQ5
         ZK8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721914875; x=1722519675;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8qS6lA1nNGdplV4y/ewW7Lco6fbdCpIrDIP4fiQLWzY=;
        b=Vxs1D1tMkj3x2pymGY/vkmFxC1nxLJy4tYN+WdfCQ1yuDYRl1lzCJ4K+SRQP7jND54
         sRjG1W/y54Xn8QOMriF11hY7pqf3TDi5450Yox0vpL35EYH+EZyrCLpvpmOsSCNmSpoY
         8J8OWLpEyVD3fDDohz9b5Ct2Uszd+VPoHS/iSfKa84TWL5OtO9QCtLO5+if732aCLwYA
         m9n6/JDfoVDeMKz6JqhKNfpY6rBAbx7zJrXPsYP0k1ZPZqgkFiP10ToDl9mpbPz2qBzB
         aA0NDV7UXK06LRf/bn/pVrFI1fQqFh7hWmHdV1vt2zPULF25CyqAiZtQghT0WoL+v6W4
         +IYw==
X-Forwarded-Encrypted: i=1; AJvYcCXrMoCY8YjDCGHbPlbfrOra+uZFDuWDJ89zpgyAztOAKulfX80Y9bu0wC1eik5Nfazvfs9zvLja4C87eP5ekkaHabUoZjrDxHf4cZMNe3iu+8dlUGGyRdMU+iMr5AkRCXG7kN9JuXIB9w==
X-Gm-Message-State: AOJu0YzKE/+Qdny0ZSCHNxwmLKn210GxAQar2J/qvYqfu/g4Z+LIzPUF
	SpeOcvkTfUm62rECE5Rh4qf33eKrFuq51t2nCgoxNR4T9bwKvOiu
X-Google-Smtp-Source: AGHT+IH4IrFAC17tSQ2N3x5QnoOQbu2eAhg+5TpsQJ73TQhBuQ9SJ/zF58XvuzITOhUP2oY8S1FtZg==
X-Received: by 2002:a05:600c:a4b:b0:426:4f47:6037 with SMTP id 5b1f17b1804b1-42805711e0dmr16603505e9.19.1721914875214;
        Thu, 25 Jul 2024 06:41:15 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:2595:4364:d152:dff3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427f93e605esm80447085e9.34.2024.07.25.06.41.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jul 2024 06:41:14 -0700 (PDT)
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
Subject: [PATCH 1/5] arm64: dts: renesas: r9a08g045: Correct GICD and GICR sizes
Date: Thu, 25 Jul 2024 14:39:28 +0100
Message-Id: <20240725133932.739936-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

The RZ/G3S SoC is equipped with the GIC-600. The GICD + GICDA is 128kB,
and the GICR is 128kB per CPU.

Despite the RZ/G3S SoC being single-core, it has two instances of GICR.

Fixes: e20396d65b959 ("arm64: dts: renesas: Add initial DTSI for RZ/G3S SoC")
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a08g045.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
index 0d5c47a65e46..34e29463a672 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
@@ -269,8 +269,8 @@ gic: interrupt-controller@12400000 {
 			#interrupt-cells = <3>;
 			#address-cells = <0>;
 			interrupt-controller;
-			reg = <0x0 0x12400000 0 0x40000>,
-			      <0x0 0x12440000 0 0x60000>;
+			reg = <0x0 0x12400000 0 0x20000>,
+			      <0x0 0x12440000 0 0x40000>;
 			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_LOW>;
 		};
 
-- 
2.34.1


