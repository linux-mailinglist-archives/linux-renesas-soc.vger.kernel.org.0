Return-Path: <linux-renesas-soc+bounces-28564-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cAZkFjm8oWmswAQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28564-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Feb 2026 16:46:01 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F6BD1BA308
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Feb 2026 16:46:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BAA9C30B21B9
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Feb 2026 15:34:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E39543DA3C;
	Fri, 27 Feb 2026 15:33:58 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 824CA3290A1;
	Fri, 27 Feb 2026 15:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772206438; cv=none; b=BwXy/0UEzf0ew+Y2hGgAUMy9cfhP9wqGMyeROoVlYfmEyfVVJaEkMhTG50Bn40gY/jzAEHYOOBCYqvB2fBcjBjkipgpkeN5uNrzmRJBdph8HqNmC9oyxyDV9qRvwo8R3OZFpYt69Diya58NN++1dS6nxLmu3KefcD4NIwKhmGbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772206438; c=relaxed/simple;
	bh=t6Hj+PFhx1Jd+Y7VMJSrSjsEfVZ19zlNTAlw4Q7T+LQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u2eIS/dowTVV/9TOcQiMgs0nCzSIAk2kd/+wwPr/vtPp6Ye5E8KsDTmUQAZclyy+oxSuNxwNVhRr24xTHzs+rhX9iNn88sauAAU6OtXMb7fU3kLbwBpfEux0PWtZD/p71JUHV0YwxQEiw+v1B668wCNABeKYTGNScknPxSFtD1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AF99F339;
	Fri, 27 Feb 2026 07:33:49 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8F8923F73B;
	Fri, 27 Feb 2026 07:33:49 -0800 (PST)
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
Subject: [PATCH 08/11] firmware: arm_scmi: Refactor iterators internal allocation
Date: Fri, 27 Feb 2026 15:32:22 +0000
Message-ID: <20260227153225.2778358-9-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260227153225.2778358-1-cristian.marussi@arm.com>
References: <20260227153225.2778358-1-cristian.marussi@arm.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.64 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[arm.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28564-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_CC(0.00)[arm.com,broadcom.com,gmail.com,linaro.org,foss.st.com,oss.nxp.com,amd.com,glider.be,renesas.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.908];
	FROM_NEQ_ENVFROM(0.00)[cristian.marussi@arm.com,linux-renesas-soc@vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,arm.com:mid,arm.com:email]
X-Rspamd-Queue-Id: 5F6BD1BA308
X-Rspamd-Action: no action

Use cleanup handlers to manage iterator data structures.

No functional change.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
 drivers/firmware/arm_scmi/driver.c | 35 +++++++++++++++---------------
 1 file changed, 18 insertions(+), 17 deletions(-)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index baefa7d43c00..d9d6edbc1275 100644
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


