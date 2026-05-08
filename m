Return-Path: <linux-renesas-soc+bounces-32297-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iA7eK/EC/mlYmAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32297-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 08 May 2026 17:36:17 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CC1354F8CCE
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 08 May 2026 17:36:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3557B301C89C
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 May 2026 15:34:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C7003FF8BF;
	Fri,  8 May 2026 15:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Yz/qTQTK"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D3CB3FA5CD;
	Fri,  8 May 2026 15:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778254438; cv=none; b=P78TjkjHUcxueYMxxFlQj/1SA79GDyFXeugKL1e8AfnDFQ3Y/5SezXtH8G735cfTLTn8Tc0mi6zBalwwFxxJgiGIR3Y6LLH40LL7FqbrV/WhzvNGFTD8riQAqbY61y3tNQYXgFLAHfcEJYgUxZaGWjL6Pq51UppLSvvGVqHct4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778254438; c=relaxed/simple;
	bh=ydGSxVs7029/nGMXlye2/Mws9V6mzCtDA5RxCjGimS4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ph5LMmEcP4aFq6oVhH3ECNeoH3/+LMH/U7i63LtV9fOKQ1+eFUEuLoU2QRwIBO4hKDroAGK2IDLBamR9yRQTxZJkg9VTT6GDFdqN5MhOowOlxKC0kwDTcBWZE9H+bVVZ/iDZADhTyD+VfHDMoZsVTiaDMWRB9TeFAryXm27AZTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Yz/qTQTK; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9E0E135A1;
	Fri,  8 May 2026 08:33:50 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5E6263F836;
	Fri,  8 May 2026 08:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778254436; bh=ydGSxVs7029/nGMXlye2/Mws9V6mzCtDA5RxCjGimS4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Yz/qTQTKDRhTDFIc+YzNOod0joPX17wVBI60FSc6Jv0ijYAoeY/ZASEY/vu4eLhSK
	 y3svLpyl56vJ2xw0x32YOeoeOAcG/FtIy2jnlhwtb8iNGyu21t7QpL6mMEfb0LHWJt
	 Kyy91DOG3iLTocJHV3C8vogOga67rh4iKj1ZpDuQ=
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
	geert+renesas@glider.be,
	kuninori.morimoto.gx@renesas.com,
	marek.vasut+renesas@gmail.com,
	Cristian Marussi <cristian.marussi@arm.com>,
	Peng Fan <peng.fan@nxp.com>
Subject: [PATCH v4 09/15] firmware: arm_scmi: Refactor iterators internal allocation
Date: Fri,  8 May 2026 16:32:54 +0100
Message-ID: <20260508153300.2224715-10-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260508153300.2224715-1-cristian.marussi@arm.com>
References: <20260508153300.2224715-1-cristian.marussi@arm.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: CC1354F8CCE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[arm.com,broadcom.com,gmail.com,linaro.org,foss.st.com,oss.nxp.com,amd.com,glider.be,renesas.com,nxp.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-32297-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cristian.marussi@arm.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	NEURAL_HAM(-0.00)[-0.998];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,arm.com:email,arm.com:mid,arm.com:dkim,nxp.com:email]
X-Rspamd-Action: no action

Use cleanup handlers to manage iterator data structures.

No functional change.

Reviewed-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
v2 --> v3
 - collected Reviewed tags
---
 drivers/firmware/arm_scmi/driver.c | 35 +++++++++++++++---------------
 1 file changed, 18 insertions(+), 17 deletions(-)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index f167194f7cf6..66cb64c8ed3d 100644
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


