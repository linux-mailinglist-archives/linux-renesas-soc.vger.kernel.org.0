Return-Path: <linux-renesas-soc+bounces-8039-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E3695BA25
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Aug 2024 17:29:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 639051F2154E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Aug 2024 15:29:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDF511CCB34;
	Thu, 22 Aug 2024 15:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="mKqg1pt2"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D04DE1CCEDF
	for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Aug 2024 15:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724340505; cv=none; b=G78iN+Wk+Wgb4OTPmAFrMB0tyvLtEZf2zkpZMB8L27919n8j+VDozKy+kyqsRF3TOPuMGbONNLFboOE+3BV9D8tA48dCswp7yWOYS0yF2rrqi7w5J4X+d/MrQNakn3DQvXhaeGIU+NFp5OssHLtu5hO/C/BFIdKatLMKnEeG3Hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724340505; c=relaxed/simple;
	bh=oUH7C74aUXg4d9WGHoMwZhQPfePjjTPQlokmfgZcYd0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=o3eeDuiby6waaKb/JGoJFdF0TPUUoqc4W70v+E1ly51J6dwxaoWqsRudTsQd2yx1KVKpHw1Dps9hnRC57cwgNqSjvknmBAfa1CaOF2f2qBnITcN+k7ksyNJ3NrWFbOJvIu6gV5TcLrOUNWC6AwzyU4bj+2JPmBhGG5jXoLgWeZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=mKqg1pt2; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5bed83488b3so1412772a12.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Aug 2024 08:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1724340502; x=1724945302; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3txPUwxmR4fX7LzFPWhcfk9alhQ/U1SsqoBALbg0+o8=;
        b=mKqg1pt2CZoeMwJSMruM8a17QtgxTEL/9SW2A8WWiIiBytZ0TE5SJFBmXExsU4b4o8
         5Jj64i2giRaz7mnQdzHI09fR0Xud9AmUB/N9Y23AHXTLJm4K07WksJgUel67snJUyzGf
         6KQ2ZjTI/fn3x2zn0nopq8djlkXlLb5H6Auw/+qSBpCY1SpfggSL6T42xMfl6X3eQ2lj
         MPJrPPW/USTI1VdKjHYf8kqSwYKlLKK9W27sVOkrJd+O9RejkWYYd9W4Istu5XKEv2kW
         7KOdagtfDbjKhdOdPL9MMSGu9Kdnf/wIWHHo4XVXy+r2W/ZpgcXAelfUdATU+P857P1d
         9g4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724340502; x=1724945302;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3txPUwxmR4fX7LzFPWhcfk9alhQ/U1SsqoBALbg0+o8=;
        b=wfJwmiZ4bSHdiTz00EM0zVT07baf6UhRh+dYVn3mhjUZAjvtCrT7CGptwSNrXUTA/t
         Hm67hu8iUt31tlaeM6KqIF3pPwePWjDJG3oDlSEEikobbdljh3rYZhzKt06OPFpFoth1
         Bp+cV/13HhWFXhGfQnWF6iUSEMp4d/+9w3bTWJTHNr7rvNgp6Mt36RWAUcOvEacECg5G
         QOz1JVIQfGqyeDMkIhe5q5EexTD97Aen70MSVz1qJpQYnpNGWojLVSTNaZKQxuzhxS1R
         p00VVT/tKzxwqKOejhVMtotTxn0ag5Gto1+OOl7V5q1/LNzxqTSOLjrLubVYgJBs9P3r
         hKhQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/mLA0c8TDWyQgEUwPFp113CyuM8xsswW8JcAfwgdEmX3Wvh6oNrnOyUlp7dXTYnBnUh6X/98w5/olQ4pFkqGE+A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzDg9BTu/MzwlkOKZowCYIs8OkuFtJonRsVrXEjFRajus27kC8L
	RFGlzioyF/z4Ux1xKFXL4+JUTDw3h6s4EK4wPXXhs6AV3rkeYww1NpV9nONRQ0c=
X-Google-Smtp-Source: AGHT+IGwmGUufY0I/wXnuKumGBXx6MTOJSx969Oopy4E3RE8Z417JclZShJ68eMp0wCAWKbVhUr4SA==
X-Received: by 2002:a17:907:efd2:b0:a86:3c01:cf08 with SMTP id a640c23a62f3a-a866f705025mr477276566b.47.1724340502213;
        Thu, 22 Aug 2024 08:28:22 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a868f484dc5sm134189166b.171.2024.08.22.08.28.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 08:28:21 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: vkoul@kernel.org,
	kishon@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	gregkh@linuxfoundation.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	yoshihiro.shimoda.uh@renesas.com,
	biju.das.jz@bp.renesas.com,
	ulf.hansson@linaro.org
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 03/16] dt-bindings: reset: renesas,r9a08g045-sysc: Add reset IDs for RZ/G3S SYSC reset
Date: Thu, 22 Aug 2024 18:27:48 +0300
Message-Id: <20240822152801.602318-4-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240822152801.602318-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240822152801.602318-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Add reset IDs for the Renesas RZ/G3S SYSC reset controller driver.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 include/dt-bindings/reset/renesas,r9a08g045-sysc.h | 10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100644 include/dt-bindings/reset/renesas,r9a08g045-sysc.h

diff --git a/include/dt-bindings/reset/renesas,r9a08g045-sysc.h b/include/dt-bindings/reset/renesas,r9a08g045-sysc.h
new file mode 100644
index 000000000000..675872a32121
--- /dev/null
+++ b/include/dt-bindings/reset/renesas,r9a08g045-sysc.h
@@ -0,0 +1,10 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+
+#ifndef __DT_BINDINGS_RESET_R9A08G045_SYSC_H
+#define __DT_BINDINGS_RESET_R9A08G045_SYSC_H
+
+#define R9A08G045_SYSC_RESET_USB	0
+#define R9A08G045_SYSC_RESET_PCIE	1
+
+#endif /* __DT_BINDINGS_RESET_SAMA7G5_H */
+
-- 
2.39.2


