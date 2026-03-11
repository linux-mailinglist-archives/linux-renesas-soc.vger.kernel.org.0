Return-Path: <linux-renesas-soc+bounces-29219-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OMWaFyyHsWm4DAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29219-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 16:15:56 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C687F26640F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 16:15:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1B9093020844
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 15:14:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7E973DD50A;
	Wed, 11 Mar 2026 15:14:18 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A2443DCD80
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Mar 2026 15:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773242058; cv=none; b=WnQ/b2J6okK5MZrtI5Opc+tM2lAt0zgPJUl9LEQX+o8pX1NLIn0VsAKhvxeoehTwcG6nRaric8niqNESBdC1Kg7sATFSB72+UY2/doZPiaGL3b4J846XoW9eSrs3iFbVcg7Fteh6NRLN4M7he9tu3ZdOfRtlUXO8ocufWZ7i1IA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773242058; c=relaxed/simple;
	bh=czQIsGvAJU2cFrCQboLa9WvC+VXj2jyb3FQ3SSnaPL8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AmtHa6exGSkpR6KAW6pOritBydLblGRzhOM9wDePgGTmYSlK9Bjc61B1wUfq64s9DJzjdKbjK/cSmvor8FKlr8E2UOb61NgXUPlbKS8fNW0Zl+0g8dlr7KZatBF4+5YIvSbzf7z2nf9ZI11GAhs83toS7WL0U/UeQt34ljjOGDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DE44C4CEF7;
	Wed, 11 Mar 2026 15:14:16 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] ARM: shmobile: rcar-gen2: Use of_phandle_args_equal() helper
Date: Wed, 11 Mar 2026 16:14:14 +0100
Message-ID: <d8338ff1fd795912b466ccf55b49dcd6885b6925.1773241833.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29219-lists,linux-renesas-soc=lfdr.de,renesas];
	DMARC_NA(0.00)[glider.be];
	PRECEDENCE_BULK(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FROM_NEQ_ENVFROM(0.00)[geert@glider.be,linux-renesas-soc@vger.kernel.org];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.991];
	RCPT_COUNT_THREE(0.00)[4];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,glider.be:email,glider.be:mid]
X-Rspamd-Queue-Id: C687F26640F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Use the existing of_phandle_args_equal() helper instead of open-coding
the same operation.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
This is an old patch of mine, and originally used of_phandle_args_eq(),
which never made it upstream.  Only recently did I notice the existence
of of_phandle_args_equal(), so here we go ;-)

To be queued in renesas-devel for v7.1.

 .../mach-shmobile/regulator-quirk-rcar-gen2.c    | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/arch/arm/mach-shmobile/regulator-quirk-rcar-gen2.c b/arch/arm/mach-shmobile/regulator-quirk-rcar-gen2.c
index 4277ba5b3ae052bb..747a96c58df15075 100644
--- a/arch/arm/mach-shmobile/regulator-quirk-rcar-gen2.c
+++ b/arch/arm/mach-shmobile/regulator-quirk-rcar-gen2.c
@@ -141,7 +141,7 @@ static struct notifier_block regulator_quirk_nb = {
 static int __init rcar_gen2_regulator_quirk(void)
 {
 	struct regulator_quirk *quirk, *pos, *tmp;
-	struct of_phandle_args *argsa, *argsb;
+	struct of_phandle_args *args;
 	const struct of_device_id *id;
 	struct device_node *np;
 	u32 mon, addr;
@@ -171,14 +171,14 @@ static int __init rcar_gen2_regulator_quirk(void)
 			goto err_mem;
 		}
 
-		argsa = &quirk->irq_args;
+		args = &quirk->irq_args;
 		memcpy(&quirk->i2c_msg, id->data, sizeof(quirk->i2c_msg));
 
 		quirk->id = id;
 		quirk->np = of_node_get(np);
 		quirk->i2c_msg.addr = addr;
 
-		ret = of_irq_parse_one(np, 0, argsa);
+		ret = of_irq_parse_one(np, 0, args);
 		if (ret) {	/* Skip invalid entry and continue */
 			of_node_put(np);
 			kfree(quirk);
@@ -186,15 +186,7 @@ static int __init rcar_gen2_regulator_quirk(void)
 		}
 
 		list_for_each_entry(pos, &quirk_list, list) {
-			argsb = &pos->irq_args;
-
-			if (argsa->args_count != argsb->args_count)
-				continue;
-
-			ret = memcmp(argsa->args, argsb->args,
-				     argsa->args_count *
-				     sizeof(argsa->args[0]));
-			if (!ret) {
+			if (of_phandle_args_equal(args, &pos->irq_args)) {
 				pos->shared = true;
 				quirk->shared = true;
 			}
-- 
2.43.0


