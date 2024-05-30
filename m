Return-Path: <linux-renesas-soc+bounces-5694-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 692EB8D4842
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 May 2024 11:19:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DEC92B24276
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 May 2024 09:19:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2269D2B9A6;
	Thu, 30 May 2024 09:19:45 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from andre.telenet-ops.be (andre.telenet-ops.be [195.130.132.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19B554D8B2
	for <linux-renesas-soc@vger.kernel.org>; Thu, 30 May 2024 09:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717060785; cv=none; b=TUzJROs0LnIoiLrCELVoDjJOWHUxgTxMRixCodrm1ZHxnZitXAn/T057TUSo1Aq3sh63avQQfOWsgQ2Tbc/sC/NhCKpPmv+GtnjQ/rs0Ywkv74e7JfADGjsvuIi70hXu8lr2DP7u6gFGO6lT7LoHHKDNbj5hKmSoRdqt6f5GczI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717060785; c=relaxed/simple;
	bh=T0jmtYHHSMPtDQE4PpIt/OUcXb9+vWLEEcBAfOJfEk8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=C61oF7K/sl7dmaL09dMffohZkIGZDFkbgqIoYkevaWrTjLn5PAqjNBdb3XI74f27VvS9UE/mqZ9Y996RbsQiVU+5gO/nLoOLIEUNBS5LrF4ZSIf27Hqci5G3vmHpQvaHWD/HnIt+NPaDAGdhq0voXFB/u0GunJ4t2rWYNGytFSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:d4b9:349f:44ea:8b43])
	by andre.telenet-ops.be with bizsmtp
	id VMKa2C0052Aokgh01MKajb; Thu, 30 May 2024 11:19:34 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sCbvf-000nZB-EY;
	Thu, 30 May 2024 11:19:33 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sCbwb-00ALoP-Pa;
	Thu, 30 May 2024 11:19:33 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] pinctrl: renesas: rzn1: Use for_each_child_of_node_scoped()
Date: Thu, 30 May 2024 11:19:29 +0200
Message-Id: <c0a28f466c42d5d59c7fadfa1fd05fd512d43b6f.1717060708.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the scoped variant of for_each_child_of_node() to simplify the code.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-pinctrl for v6.11.

 drivers/pinctrl/renesas/pinctrl-rzn1.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzn1.c b/drivers/pinctrl/renesas/pinctrl-rzn1.c
index e1b4203c66c6f836..39af1fe79c8462eb 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzn1.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzn1.c
@@ -737,13 +737,12 @@ static int rzn1_pinctrl_parse_groups(struct device_node *np,
 
 static int rzn1_pinctrl_count_function_groups(struct device_node *np)
 {
-	struct device_node *child;
 	int count = 0;
 
 	if (of_property_count_u32_elems(np, RZN1_PINS_PROP) > 0)
 		count++;
 
-	for_each_child_of_node(np, child) {
+	for_each_child_of_node_scoped(np, child) {
 		if (of_property_count_u32_elems(child, RZN1_PINS_PROP) > 0)
 			count++;
 	}
-- 
2.34.1


