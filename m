Return-Path: <linux-renesas-soc+bounces-11891-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F72A039E2
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Jan 2025 09:37:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7D06C163FDC
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Jan 2025 08:37:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DE6A1DE4F6;
	Tue,  7 Jan 2025 08:37:36 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from albert.telenet-ops.be (albert.telenet-ops.be [195.130.137.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B5D518DF62
	for <linux-renesas-soc@vger.kernel.org>; Tue,  7 Jan 2025 08:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736239056; cv=none; b=WDJcEIdj+WI0MHAGJchs87nQsRwXvp71p3/uzuljw3jsh579ol/A/5hYI0+pj+qWLXom2quF43CI14DXNHQJwbUylSX88anKNmvoqUpmGzzcGMdvEWwMnmjcv5QYryCgrldq8O4Lo7aUrW5woVY1CUq4lxrtxw+Hw3PuT1eIiUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736239056; c=relaxed/simple;
	bh=576Z3BdIFkrUpPRj2zAupcaLoZyj+oKEt767R9W6uYE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IU6zCn0w3NcQwnR7hDfSYEZREdeHiLHy9X5buus+mxgSVa7bA0oxDMuEvcih83cW0FHumTuQh8Mf1eMSA0F6rDpIlGytZ0m90q4HYP8iwsbuvFs6t7c8MbOmkyYYtAG9vmEsEw/bODLOvko2ChYQRR92QfIzyvB/YuyeYH6a77g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:39d4:dc4e:b4ce:1377])
	by albert.telenet-ops.be with cmsmtp
	id y8dW2D00U3AZZFy068dWCD; Tue, 07 Jan 2025 09:37:31 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tV55b-00000008ZYn-0Ray;
	Tue, 07 Jan 2025 09:37:30 +0100
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tV55e-00000004lLB-2iLH;
	Tue, 07 Jan 2025 09:37:30 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] dt-bindings: clock: renesas,r9a08g045-vbattb: Fix include guard
Date: Tue,  7 Jan 2025 09:37:29 +0100
Message-ID: <34953d1e9f472e4f29533ed06cf092dd3c0d1178.1736238939.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the missing "RENESAS" part to the include guard.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-clk for v6.14.

 include/dt-bindings/clock/renesas,r9a08g045-vbattb.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/dt-bindings/clock/renesas,r9a08g045-vbattb.h b/include/dt-bindings/clock/renesas,r9a08g045-vbattb.h
index 67774eafad06268c..4cc8fc34b23ca336 100644
--- a/include/dt-bindings/clock/renesas,r9a08g045-vbattb.h
+++ b/include/dt-bindings/clock/renesas,r9a08g045-vbattb.h
@@ -2,12 +2,12 @@
  *
  * Copyright (C) 2024 Renesas Electronics Corp.
  */
-#ifndef __DT_BINDINGS_CLOCK_R9A08G045_VBATTB_H__
-#define __DT_BINDINGS_CLOCK_R9A08G045_VBATTB_H__
+#ifndef __DT_BINDINGS_CLOCK_RENESAS_R9A08G045_VBATTB_H__
+#define __DT_BINDINGS_CLOCK_RENESAS_R9A08G045_VBATTB_H__
 
 #define VBATTB_XC		0
 #define VBATTB_XBYP		1
 #define VBATTB_MUX		2
 #define VBATTB_VBATTCLK		3
 
-#endif /* __DT_BINDINGS_CLOCK_R9A08G045_VBATTB_H__ */
+#endif /* __DT_BINDINGS_CLOCK_RENESAS_R9A08G045_VBATTB_H__ */
-- 
2.43.0


