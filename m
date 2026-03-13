Return-Path: <linux-renesas-soc+bounces-29372-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +Ej6FLBEtGk4kAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29372-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Mar 2026 18:09:04 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A58287D89
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Mar 2026 18:09:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3315332D86FC
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Mar 2026 16:57:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C1043CCFD7;
	Fri, 13 Mar 2026 16:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="oG71UXqY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 457863CAE91;
	Fri, 13 Mar 2026 16:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773421015; cv=none; b=G9wHj8uCVy8uKB3ykrjBXdU8hpfbx3BUFWA7NUNZh2SvS2preSUd9voQRYpJ3byBT/Lo9TXtQwSAwN64rdXYO3AlYz1Mqsd9ytpt6kTD27osp6AK8oRuEALjh5lTMvvN8sBFN42SZ3ai07gunuH4MQpv7q9xcg/TABdU/aCkP6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773421015; c=relaxed/simple;
	bh=G1AB0C3qS2kTKGH00VmTDcw0q84SibXoxp08vzs/DQ4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bhyd/DhvZJzAQ0fURxRMiPnOpt0/LWdQPbHbEsuDrOo0qHLd7QdgNaiEZbiKROVyyrAaUHx+2ijlgBkXTXNdWCiBxH1sCRTcRjkOaipxAK9zucTm2K63ZpdPp1txMoLVVdNsn7bGFvVfQXAFoDUUdGaGQsiE02/cdTvlf5fA6U8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=oG71UXqY; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=jj
	DNm/XzahkRhGQzN2/ls50FUOrDxUcWtH7f1FncHjY=; b=oG71UXqYCXt2nWkn/c
	ijnOrcy8X4LK/CHjGC54b+5PKvlRDgNV9E9rj2ho8TLda9metMKkvnc1Toglbwto
	OccRPnIDwOT+h1HWznW3/Y8s9c24oaIYJRwRzXUa2v7K+2D/iFH/Tnl/0bBrBEGc
	ueSXwsRlVKQTVrqH7D4L0spaM=
Received: from zhb.. (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wAX2JV7QbRpTApJAw--.54345S7;
	Sat, 14 Mar 2026 00:55:30 +0800 (CST)
From: Hans Zhang <18255117159@163.com>
To: lpieralisi@kernel.org,
	jingoohan1@gmail.com,
	mani@kernel.org,
	kwilczynski@kernel.org,
	bhelgaas@google.com,
	helgaas@kernel.org,
	florian.fainelli@broadcom.com,
	jim2101024@gmail.com
Cc: robh@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	claudiu.beznea.uj@bp.renesas.com,
	linux-mediatek@lists.infradead.org,
	linux-tegra@vger.kernel.org,
	linux-omap@vger.kernel.org,
	bcm-kernel-feedback-list@broadcom.com,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	shawn.lin@rock-chips.com,
	Hans Zhang <18255117159@163.com>
Subject: [PATCH v9 5/5] PCI: of: Remove max-link-speed generation validation
Date: Sat, 14 Mar 2026 00:55:22 +0800
Message-Id: <20260313165522.123518-6-18255117159@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260313165522.123518-1-18255117159@163.com>
References: <20260313165522.123518-1-18255117159@163.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wAX2JV7QbRpTApJAw--.54345S7
X-Coremail-Antispam: 1Uf129KBjvJXoW7tr43tw43CryDXw1DJrWrXwb_yoW8tw43pa
	y3AryY9r1DJr4rWr4UJF4rZa4jgF1rWrW8Kr15C3sruwnxXrWYqry2vF4aqFySkFykuF17
	X3WagF4UCayjkaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piWCJhUUUUU=
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbCxAL3m2m0QYLKGgAA3k
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[163.com,none];
	R_DKIM_ALLOW(-0.20)[163.com:s=s110527];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,google.com,broadcom.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[163.com];
	RCPT_COUNT_TWELVE(0.00)[22];
	TAGGED_FROM(0.00)[bounces-29372-lists,linux-renesas-soc=lfdr.de];
	DKIM_TRACE(0.00)[163.com:+];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[18255117159@163.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,vger.kernel.org,lists.infradead.org,bp.renesas.com,broadcom.com,rock-chips.com,163.com];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D0A58287D89
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The of_pci_get_max_link_speed() function currently validates the
"max-link-speed" DT property to be in the range 1..4 (Gen1..Gen4).
This imposes a maintenance burden because each new PCIe generation
would require updating this validation.

Remove the range check so the function returns the raw property value
(or a negative error code if the property is missing or malformed).
Callers must now validate the returned speed against the range they
support. A subsequent patch adds such validation to the DWC driver,
which is the primary user of this function.

Removing the validation from this common function allows future PCIe
generations to be supported without modifying drivers/pci/of.c.

Signed-off-by: Hans Zhang <18255117159@163.com>
---
 drivers/pci/of.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/pci/of.c b/drivers/pci/of.c
index 9f8eb5df279e..d645041f5125 100644
--- a/drivers/pci/of.c
+++ b/drivers/pci/of.c
@@ -875,24 +875,24 @@ EXPORT_SYMBOL_GPL(of_pci_supply_present);
  * of_pci_get_max_link_speed - Find the maximum link speed of the given device node.
  * @node: Device tree node with the maximum link speed information.
  *
- * This function will try to find the limitation of link speed by finding
- * a property called "max-link-speed" of the given device node.
+ * This function will try to read the "max-link-speed" property of the given
+ * device tree node. It does NOT validate the value of the property.
  *
  * Return:
  * * > 0	- On success, a maximum link speed.
- * * -EINVAL	- Invalid "max-link-speed" property value, or failure to access
- *		  the property of the device tree node.
+ * * -EINVAL	- Failure to access the property of the device tree node.
  *
  * Returns the associated max link speed from DT, or a negative value if the
- * required property is not found or is invalid.
+ * required property is not found.
  */
 int of_pci_get_max_link_speed(struct device_node *node)
 {
 	u32 max_link_speed;
+	int ret;
 
-	if (of_property_read_u32(node, "max-link-speed", &max_link_speed) ||
-	    max_link_speed == 0 || max_link_speed > 4)
-		return -EINVAL;
+	ret = of_property_read_u32(node, "max-link-speed", &max_link_speed);
+	if (ret)
+		return ret;
 
 	return max_link_speed;
 }
-- 
2.34.1


