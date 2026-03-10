Return-Path: <linux-renesas-soc+bounces-29155-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kNKXCohmsGloigIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29155-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Mar 2026 19:44:24 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id EC14C256970
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Mar 2026 19:44:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1DEDD3029A86
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Mar 2026 18:44:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 612D83DDDA1;
	Tue, 10 Mar 2026 18:41:32 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0A8E3DCDB8;
	Tue, 10 Mar 2026 18:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773168092; cv=none; b=hUc/26v5HIhF0oLM+m0C7fRxxhq2EGjgBfaraxgfGfNCZaN2OL2akWG0X2fIjnjvXZMPsueGDztYg3H/kl+bZVetPL8bzuigAE/nASViNd2PQ/v81mX4lyvOutLHQwBvGPs3y5hDNRJmDyQkg510PRaQ8F8Z2xigo9cTH+v5tKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773168092; c=relaxed/simple;
	bh=eL8cNPPMXiZclbubgOaXwi19oqnawiSQo1n5NvEj14Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ShemV3rDUlxcXPY6KLBfZBq6rdUtK1xCp+j9pw4UI9iUZMqd3J41pYuwNAqhdQ395GPkriOs+XmFJLnfC0CN+gHiHKQH+P+ls5kUpP20rJlwENPBw/GxPYcHwVlcGYh8QUU/b58zHrXX65zXn1gtlDR67jQrKu0pz8aYCqv3tqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ECDE81A00;
	Tue, 10 Mar 2026 11:41:15 -0700 (PDT)
Received: from pluto.guest.local (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F0DF73F7BD;
	Tue, 10 Mar 2026 11:41:18 -0700 (PDT)
From: Cristian Marussi <cristian.marussi@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: sudeep.holla@arm.com,
	philip.radford@arm.com,
	james.quinlan@broadcom.com,
	f.fainelli@gmail.com,
	vincent.guittot@linaro.org,
	etienne.carriere@foss.st.com,
	peng.fan@oss.nxp.com,
	michal.simek@amd.com,
	dan.carpenter@linaro.org,
	geert+renesas@glider.be,
	kuninori.morimoto.gx@renesas.com,
	marek.vasut+renesas@gmail.com,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [PATCH v2 10/13] firmware: arm_scmi: Refactor iterators internal allocation
Date: Tue, 10 Mar 2026 18:40:27 +0000
Message-ID: <20260310184030.3669330-11-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260310184030.3669330-1-cristian.marussi@arm.com>
References: <20260310184030.3669330-1-cristian.marussi@arm.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: EC14C256970
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.64 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[arm.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29155-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_CC(0.00)[arm.com,broadcom.com,gmail.com,linaro.org,foss.st.com,oss.nxp.com,amd.com,glider.be,renesas.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.968];
	FROM_NEQ_ENVFROM(0.00)[cristian.marussi@arm.com,linux-renesas-soc@vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:mid,arm.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Action: no action

Use cleanup handlers to manage iterator data structures.

No functional change.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
 drivers/firmware/arm_scmi/driver.c | 35 +++++++++++++++---------------
 1 file changed, 18 insertions(+), 17 deletions(-)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 3e76a3204ba4..4bd069da879e 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -17,6 +17,7 @@
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
 #include <linux/bitmap.h>
+#include <linux/cleanup.h>
 #include <linux/debugfs.h>
 #include <linux/device.h>
 #include <linux/export.h>
@@ -1789,39 +1790,41 @@ static void *scmi_iterator_init(const struct scmi_protocol_handle *ph,
 				size_t tx_size, void *priv)
 {
 	int ret;
-	struct scmi_iterator *i;
 
-	i = devm_kzalloc(ph->dev, sizeof(*i), GFP_KERNEL);
+	struct scmi_iterator *i __free(kfree) = kzalloc(sizeof(*i), GFP_KERNEL);
 	if (!i)
 		return ERR_PTR(-ENOMEM);
 
+	if (!ops || !ph)
+		return ERR_PTR(-EINVAL);
+
 	i->ph = ph;
 	i->ops = ops;
 	i->priv = priv;
 
 	ret = ph->xops->xfer_get_init(ph, msg_id, tx_size, 0, &i->t);
-	if (ret) {
-		devm_kfree(ph->dev, i);
+	if (ret)
 		return ERR_PTR(ret);
-	}
 
 	i->state.max_resources = max_resources;
 	i->msg = i->t->tx.buf;
 	i->resp = i->t->rx.buf;
 
-	return i;
+	return no_free_ptr(i);
 }
 
 static int scmi_iterator_run(void *iter)
 {
-	int ret = -EINVAL;
+	int ret;
 	struct scmi_iterator_ops *iops;
 	const struct scmi_protocol_handle *ph;
 	struct scmi_iterator_state *st;
-	struct scmi_iterator *i = iter;
 
-	if (!i || !i->ops || !i->ph)
-		return ret;
+	if (!iter)
+		return -EINVAL;
+
+	/* Take ownership of the iterator */
+	struct scmi_iterator *i __free(kfree) = iter;
 
 	iops = i->ops;
 	ph = i->ph;
@@ -1846,12 +1849,12 @@ static int scmi_iterator_run(void *iter)
 			break;
 		}
 
-		for (st->loop_idx = 0; st->loop_idx < st->num_returned;
-		     st->loop_idx++) {
+		for (st->loop_idx = 0; !ret && st->loop_idx < st->num_returned;
+		     st->loop_idx++)
 			ret = iops->process_response(ph, i->resp, st, i->priv);
-			if (ret)
-				goto out;
-		}
+
+		if (ret)
+			break;
 
 		st->desc_index += st->num_returned;
 		ph->xops->reset_rx_to_maxsz(ph, i->t);
@@ -1861,10 +1864,8 @@ static int scmi_iterator_run(void *iter)
 		 */
 	} while (st->num_returned && st->num_remaining);
 
-out:
 	/* Finalize and destroy iterator */
 	ph->xops->xfer_put(ph, i->t);
-	devm_kfree(ph->dev, i);
 
 	return ret;
 }
-- 
2.53.0


