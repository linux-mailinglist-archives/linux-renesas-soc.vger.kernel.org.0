Return-Path: <linux-renesas-soc+bounces-6194-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E4EB90848A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Jun 2024 09:22:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 514312877FB
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Jun 2024 07:22:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C45D8187569;
	Fri, 14 Jun 2024 07:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="VCdJFOfq"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAC0818754A
	for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Jun 2024 07:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718349617; cv=none; b=c2TQoNCMHRXw3YDzYEoPG2sp78P+Inv4X8TIaeMO+rmpM3+/sv1fSEjN6IMN+GJSFvXJJMCAxKoqmBpxjjj6kNYLnFRQyWS8t0xVKzrrHpCAacevYMjqiQ6ZohWUmd0tHEt2PAYOO5jnLc6moIWV7hh2Cyu/zFzpBksNb3nmKVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718349617; c=relaxed/simple;
	bh=KAFnvdRq+2pR7azMtu2K0xo92UGOZLfO30BelL+InbA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Bo+PWu9puuOd0jZuPAMwwmu3S0Pxk0B5V+dWrCtkG39akdKe42T+fAHvCYo5rkR75Mhau2OtWqt1uD7IGcQJV+HL/ZSPoCGGzYHLyp/u1m6MsNGLdLCQ02MVNywYIbVx1GMsBvziplr2HZNWj2i87FXqV4Q7b+ilG0yMioi5gFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=VCdJFOfq; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-421cd1e5f93so13514255e9.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Jun 2024 00:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1718349614; x=1718954414; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bBQryArzwC0pcpfTb6INLK/D8vEzmJaod3AONhND7ow=;
        b=VCdJFOfqQgPTTiObcJs5/lSR5gIhPVm+FegjQBYw3EzGQXAKh5v3SkhcXxgM/K/hJN
         s4qhWo6ezeBjucmDZTgJor3ZbAPe7b1L5hYNf9l/mgbm5GrklXdDbadFl9r1anR8bcME
         a3uX0sgJIrVT1S3+i13ZbCCfps41hzJdp2T6vFyBaKKR2mDxJGTwnDe4x4Wtg+IENvpp
         w5QqnRDFii/fZMEaAxeNzfYZhJ61cWMIcKswoXNgyrEVqcIXbdlFymNnPW4QnlLEci9T
         iVT4wzPASbIpo/qf2K6VpcCbJG7Rnq65dLus4d6ZNBXuNunhWjGUO77kf4WSct6NTLVG
         wVPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718349614; x=1718954414;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bBQryArzwC0pcpfTb6INLK/D8vEzmJaod3AONhND7ow=;
        b=GQk4iTGgZiIwz36d2W3lkYDIFdK/sZbrB2pb/owm7JuxBlgly3YmneDH3f4ARZZc9v
         mrT8uuoeyj+sQgU4SBKUK+vGGeHVp9ZROJ/OmnwLGqtIYv/ye9Y7UNm/GHYO8Z6juBB0
         SKmBlbQznrPawNuFnDQJh5UTucrpIIqBcXKBzN2Zc/8KTxzeQ4pdVpN9d1hfRho+E+Xp
         z9/26EacNNjsfr+5r+vg/oqFbbgX1E78t1XXa9gqfrBLQ8bXhCngVPv6N7s1l9pv3sxf
         fKUsRV2g3DtU7dVprQ9H+v52tVJxz0eDtl4SyaFNAAKifVzweD9BoHRYtXW4g7nvQ8BH
         SJ2A==
X-Gm-Message-State: AOJu0Yz3TT0G2iJlFZbIIGevkXjw/NLWpXVZCl+uspPA1zI2+i21S7ET
	zDan6SNbSAi8JHsSqLGMwEL+fYQ7H99g3M+ATDwvdcnSYGY7C/3o2MoL7AWqvsQ=
X-Google-Smtp-Source: AGHT+IHPaQD10DLPhpZ7aY3WCufuA4Kxyjs3R72r9aYkAI7AVznPL9Zts5GX/ZtfATd4xeTNB6QBsg==
X-Received: by 2002:a05:600c:45c7:b0:422:727c:70b1 with SMTP id 5b1f17b1804b1-4230481f0cbmr18120785e9.8.1718349614367;
        Fri, 14 Jun 2024 00:20:14 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.189])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42286eef9eesm87272555e9.9.2024.06.14.00.20.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 00:20:13 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	lee@kernel.org,
	alexandre.belloni@bootlin.com,
	magnus.damm@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 11/12] arm64: defconfig: Enable VBATTB clock flag
Date: Fri, 14 Jun 2024 10:19:31 +0300
Message-Id: <20240614071932.1014067-12-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240614071932.1014067-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240614071932.1014067-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Enable VBATTB clock driver flag (CONFIG_CLK_VBATTB).

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 05abba0a0209..fcb0c7ee8769 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1348,6 +1348,7 @@ CONFIG_SM_VIDEOCC_8250=y
 CONFIG_QCOM_HFPLL=y
 CONFIG_CLK_GFM_LPASS_SM8250=m
 CONFIG_CLK_RCAR_USB2_CLOCK_SEL=y
+CONFIG_CLK_VBATTB=y
 CONFIG_HWSPINLOCK=y
 CONFIG_HWSPINLOCK_QCOM=y
 CONFIG_TEGRA186_TIMER=y
-- 
2.39.2


