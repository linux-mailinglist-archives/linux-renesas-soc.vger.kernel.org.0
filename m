Return-Path: <linux-renesas-soc+bounces-10952-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 170D19E5624
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Dec 2024 14:02:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EC1B618857B5
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Dec 2024 13:01:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51417219A94;
	Thu,  5 Dec 2024 13:00:22 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [195.130.137.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53BDD218ABE
	for <linux-renesas-soc@vger.kernel.org>; Thu,  5 Dec 2024 13:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733403622; cv=none; b=Lg6U9SnFF2Hh6/Zs75+2syTvdFD8ICHXKKzn1Y4KYRQT74CMAAIrSd+2Ao1G4mzda+S4zMh4Ui7LMHgWcKCpJit8Al4QggMunzAXHjpi8Dl9Ht/i5Os7Ry6Hq/GnH7RkWm3ICUsIRQFRMdtB61AzGKcN1yEea/rKzZQ6UJukzgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733403622; c=relaxed/simple;
	bh=3ljln5UJe9l7irWjhFzX4xeezfaZfOuGZXhOz28tv20=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=uWiLvHkUlQEHcI8Xko54m6fngzKk9M6hw3OrToCKGID9TySIqZIgF3uRN/kexnke2dCB90EN5aQ4VFLSNXco/usnQOg82YLAexCeySs3EFxlrOKQv3ZN6kkZqO12XI8XrK7FHD04yFVYd8Pl/pOhw1ztUj5Autolggg0B8GGKFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:b16a:6561:fa1:2b32])
	by laurent.telenet-ops.be with cmsmtp
	id l10H2D0083EEtj20110HeS; Thu, 05 Dec 2024 14:00:17 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1tJBSq-000LP1-AE;
	Thu, 05 Dec 2024 14:00:17 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1tJBSr-00EQH8-1S;
	Thu, 05 Dec 2024 14:00:17 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Saravana Kannan <saravanak@google.com>
Cc: linux-pm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] pmdomain: renesas: rcar-sysc: Drop fwnode_dev_initialized() call
Date: Thu,  5 Dec 2024 14:00:15 +0100
Message-Id: <087ef57d899c93f45ceffb8f9c5df3ad850b1e85.1733403513.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
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
2.34.1


