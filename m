Return-Path: <linux-renesas-soc+bounces-29506-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2AYuDKUkuGmNZgEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29506-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 16:41:25 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C55F529C9BD
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 16:41:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0F92C308F419
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 15:35:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 558983A257B;
	Mon, 16 Mar 2026 15:34:46 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E94403A1A58;
	Mon, 16 Mar 2026 15:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773675286; cv=none; b=FqLDKzqf5F6KdqyAzmWAdt/uHf+VAGHSywWNpyxNOQVc0WSWc+22szxwWFNpM1t2TGoC4wiENBahqZ/B+CJBYfJJ5UCaG5Vr3FUB2GblBQ5T4f6BkMl4ADScEs1Hvb4r0ibQ32mvZH0raKzHtrx+l7VDKqYnHmR0BouADzvhYuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773675286; c=relaxed/simple;
	bh=hgJeKgBY4U40ZkWG3ClIAvOZajorwkZCIEnPHGOxvqQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=k018H6AikXqtQW9Hv1mO82sqJ0Sv4mbUuQl/1NaGhdRHqdLM7q0MQDkPOgDzV9rmbLRjspLrWyfLE2oIxr54UdSEp6aEEDk+K4IIHkSGQeVGu2G69O6Wcan83ttRIL2iCQ2UGv+xaziv6L8ZEbCfBZDO89HwCIl6QbvCo3t6+II=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 011E5C19421;
	Mon, 16 Mar 2026 15:34:43 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>
Cc: arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] firmware: arm_scmi: Support loop control in quirk code snippets
Date: Mon, 16 Mar 2026 16:34:40 +0100
Message-ID: <51de914cddef8fa86c2e7dd5397e5df759c45464.1773675224.git.geert+renesas@glider.be>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-29506-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[glider.be];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@glider.be,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.922];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,glider.be:email,glider.be:mid]
X-Rspamd-Queue-Id: C55F529C9BD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Each SCMI firmware quirk contains a code snippet, which handles the
quirk, and has full access to the surrounding context.  When this
context is (part of) a loop body, the code snippet may want to use loop
control statements like "break" and "continue".  Unfortunately the
SCMI_QUIRK() macro implementation contains a dummy loop, taking
precedence over any outer loops.  Hence quirk code cannot use loop
control statements, but has to resort to polluting the surrounding
context with a label, and use goto.

Fix this by replacing the "do { ... } while (0)" construct in the
SCMI_QUIRK() implementation by "({ ... })".

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Example:

    #define QUIRK_EXAMPLE					\
	    ({							\
		    if (ret == -EOPNOTSUPP)			\
			    continue;				\
	    })

    for (unsigned int i = 0; i < n; i++) {
	    ret = foo(handle, i);
	    SCMI_QUIRK(example_quirk, QUIRK_EXAMPLE);
	    if (ret)
		    return ret;

	    ret = bar(handle, i);
	    if (ret)
		    return ret;
    }
---
 drivers/firmware/arm_scmi/quirks.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/firmware/arm_scmi/quirks.h b/drivers/firmware/arm_scmi/quirks.h
index a71fde85a5272aff..d8ba60b956522d04 100644
--- a/drivers/firmware/arm_scmi/quirks.h
+++ b/drivers/firmware/arm_scmi/quirks.h
@@ -20,10 +20,10 @@
  * named as _qn.
  */
 #define SCMI_QUIRK(_qn, _blk)						\
-	do {								\
+	({								\
 		if (static_branch_unlikely(&(scmi_quirk_ ## _qn)))	\
 			(_blk);						\
-	} while (0)
+	})
 
 void scmi_quirks_initialize(void);
 void scmi_quirks_enable(struct device *dev, const char *vend,
@@ -34,10 +34,10 @@ void scmi_quirks_enable(struct device *dev, const char *vend,
 #define DECLARE_SCMI_QUIRK(_qn)
 /* Force quirks compilation even when SCMI Quirks are disabled */
 #define SCMI_QUIRK(_qn, _blk)						\
-	do {								\
+	({								\
 		if (0)							\
 			(_blk);						\
-	} while (0)
+	})
 
 static inline void scmi_quirks_initialize(void) { }
 static inline void scmi_quirks_enable(struct device *dev, const char *vend,
-- 
2.43.0


