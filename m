Return-Path: <linux-renesas-soc+bounces-16402-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 352C5A9EFD5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Apr 2025 13:57:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A25E0189E300
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Apr 2025 11:57:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51B9D26463E;
	Mon, 28 Apr 2025 11:56:55 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from riemann.telenet-ops.be (riemann.telenet-ops.be [195.130.137.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A992266F08
	for <linux-renesas-soc@vger.kernel.org>; Mon, 28 Apr 2025 11:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745841415; cv=none; b=Qa1GImwD4PxR03dYisIDrQJQTtjEk+DY1eqcUaBDI0Lf6jSLWIzYcpFbSYoHAIo044yo5It5nWLRhEuD6sezUZPDNSJT2PuHPqykM0nV6jmygXMANqbgxjCOYSlFv8DP9MbuOtO7hN9DGHIpsljp4O/yeMBI/XNUdEL1GZZluss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745841415; c=relaxed/simple;
	bh=1j9Q9kgQUWse/o+zJq0jmjKW3JS0XwJpa9IMv5SRAVE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KsBDX0cNH8zqzLiY8GPCDpq7oV85crRfBQ3CyJIjCNkUFDmJCLuk2o4NSLug0ZykkdyMdepWgjjEOCxoDLcXG7ygWlHRJPOhMhBb0n9wuf/of/4OXVeEWFjJGIki6odum+NQNJsGt6WY2cJ38sXTM9gxoEHQ2ZgyIA/Cz9vSJnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
	by riemann.telenet-ops.be (Postfix) with ESMTPS id 4ZmMP9150lz4x3dL
	for <linux-renesas-soc@vger.kernel.org>; Mon, 28 Apr 2025 13:56:45 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:b9c4:1670:abc0:a1fc])
	by michel.telenet-ops.be with cmsmtp
	id ibwc2E0084Aed8c06bwco7; Mon, 28 Apr 2025 13:56:36 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1u9N6B-00000000F7P-0oNs;
	Mon, 28 Apr 2025 13:56:36 +0200
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1u9Mxl-00000006xAj-2x3k;
	Mon, 28 Apr 2025 13:47:53 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] pmdomain: renesas: rcar: Remove obsolete nullify checks
Date: Mon, 28 Apr 2025 13:47:52 +0200
Message-ID: <107f2bf9f13b29f0f623d2959a5347ec151fb089.1745840768.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All nullify users and helpers were removed, but the R-Car SYSC drivers
still checked for nullified domains.  Remove the obsolete checks.

Fixes: c8d87704444a8ac7 ("pmdomain: renesas: rcar-sysc: Remove rcar_sysc_nullify() helper")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pmdomain/renesas/rcar-gen4-sysc.c | 5 -----
 drivers/pmdomain/renesas/rcar-sysc.c      | 5 -----
 2 files changed, 10 deletions(-)

diff --git a/drivers/pmdomain/renesas/rcar-gen4-sysc.c b/drivers/pmdomain/renesas/rcar-gen4-sysc.c
index 66409cff2083fcd8..e001b5c25bed0051 100644
--- a/drivers/pmdomain/renesas/rcar-gen4-sysc.c
+++ b/drivers/pmdomain/renesas/rcar-gen4-sysc.c
@@ -338,11 +338,6 @@ static int __init rcar_gen4_sysc_pd_init(void)
 		struct rcar_gen4_sysc_pd *pd;
 		size_t n;
 
-		if (!area->name) {
-			/* Skip NULLified area */
-			continue;
-		}
-
 		n = strlen(area->name) + 1;
 		pd = kzalloc(sizeof(*pd) + n, GFP_KERNEL);
 		if (!pd) {
diff --git a/drivers/pmdomain/renesas/rcar-sysc.c b/drivers/pmdomain/renesas/rcar-sysc.c
index dce1a6d37e80127d..047495f54e8adc0d 100644
--- a/drivers/pmdomain/renesas/rcar-sysc.c
+++ b/drivers/pmdomain/renesas/rcar-sysc.c
@@ -396,11 +396,6 @@ static int __init rcar_sysc_pd_init(void)
 		struct rcar_sysc_pd *pd;
 		size_t n;
 
-		if (!area->name) {
-			/* Skip NULLified area */
-			continue;
-		}
-
 		n = strlen(area->name) + 1;
 		pd = kzalloc(sizeof(*pd) + n, GFP_KERNEL);
 		if (!pd) {
-- 
2.43.0


