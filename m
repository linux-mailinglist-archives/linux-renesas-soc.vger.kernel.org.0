Return-Path: <linux-renesas-soc+bounces-12854-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A928A286E4
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Feb 2025 10:45:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0EC973A80F7
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Feb 2025 09:45:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAFE3218AC4;
	Wed,  5 Feb 2025 09:45:46 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from gauss.telenet-ops.be (gauss.telenet-ops.be [195.130.132.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDFD4155300
	for <linux-renesas-soc@vger.kernel.org>; Wed,  5 Feb 2025 09:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738748746; cv=none; b=JjfUEaFIfEqnUBLg1igkTM+0ClbC8vV89GfZW62Ss9ZDB30GMiPgrdTORLDSMWfIzrhUUgXB51dFDTfjCy6EoJUxTWdiQKMOw72Jz6nUENoZ1Atph627LC6B9IemK8HZyVPYjsKb1E4vWUZ8Jp/kcFK2WHBJaTbrvX9mVw89DVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738748746; c=relaxed/simple;
	bh=GCOpWK6GXL7mrtPD52U4EunVLUVNpoq2eo5GgeDd31o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=H8ehE8EHs+vgV5+DP3aifXaziwgalhzN+ddoYL86UCMZBAIuLfcufqA8VEqQsWusH//uP6L21uluSK1q68qHDJeHDPEFXIxcsAyONXXCzLhurPah3nzloz6mIpd070ziPsq2sl0xekvCmGCpjXaaHeeOBVzIOrVso3T7w83YXQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
	by gauss.telenet-ops.be (Postfix) with ESMTPS id 4YnwMh3fVlz4wxr1
	for <linux-renesas-soc@vger.kernel.org>; Wed, 05 Feb 2025 10:45:36 +0100 (CET)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:c448:5c9f:5d50:ad45])
	by xavier.telenet-ops.be with cmsmtp
	id 9llV2E0075P95W301llVqD; Wed, 05 Feb 2025 10:45:29 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tfby9-0000000Fsdg-0FV9;
	Wed, 05 Feb 2025 10:45:29 +0100
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tfbyL-00000006KEx-0aUG;
	Wed, 05 Feb 2025 10:45:29 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Saravana Kannan <saravanak@google.com>
Subject: [PATCH v2] pmdomain: renesas: rcar-sysc: Drop fwnode_dev_initialized() call
Date: Wed,  5 Feb 2025 10:45:28 +0100
Message-ID: <05c2ef630694a28b560426d8c426881cc14e8f7c.1738748678.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As of commit bab2d712eeaf9d60 ("PM: domains: Mark fwnodes when their
powerdomain is added/removed") in v5.12, the pmdomain core takes care of
marking the fwnode initialized, so there is no need to repeat it.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Saravana Kannan <saravanak@google.com>
---
v2:
  - Add Acked-by.
---
 drivers/pmdomain/renesas/rcar-sysc.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/pmdomain/renesas/rcar-sysc.c b/drivers/pmdomain/renesas/rcar-sysc.c
index b99326917330f5f1..dce1a6d37e80127d 100644
--- a/drivers/pmdomain/renesas/rcar-sysc.c
+++ b/drivers/pmdomain/renesas/rcar-sysc.c
@@ -434,8 +434,6 @@ static int __init rcar_sysc_pd_init(void)
 	}
 
 	error = of_genpd_add_provider_onecell(np, &domains->onecell_data);
-	if (!error)
-		fwnode_dev_initialized(of_fwnode_handle(np), true);
 
 out_put:
 	of_node_put(np);
-- 
2.43.0


