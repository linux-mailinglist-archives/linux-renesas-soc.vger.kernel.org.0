Return-Path: <linux-renesas-soc+bounces-29304-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WN82Nw7tsmnAQwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29304-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Mar 2026 17:42:54 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 746EA275C99
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Mar 2026 17:42:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7EE523152FBA
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Mar 2026 16:38:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4093D3932DE;
	Thu, 12 Mar 2026 16:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="S+iaI+j9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C577339022C;
	Thu, 12 Mar 2026 16:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773333503; cv=none; b=U2xz8GqX9D+LjkXFWnuGh0fZmKKLq/kNW2vn4EFJCJtNFtS0FuOvqpiRf0u1WsNDfjqp95IOUJSZEaNy2BkMpF8769mckyOH+MTD/6DnSfipxFyQQNxHhZhd3yiKbmM2GScTIlQXnZFzGdco29k1EF9Ou1h7Sox0UTokDsBWRUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773333503; c=relaxed/simple;
	bh=LtkwWx8TXzq6h4OVaKOfQQ3Q7iXxe5rKsjtz4sjr4ww=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iBuGkxzQa1ch6h8cV+IpeAesGSxM2230Qyucl3kuX/xzaz689LFROlK9XmzpXhg4Vpte7+fMfbQzYikzguUi0K3eMigWzd4vnIZ7NhDDg92yz6RD/uB7MtaA7SC4ted9KoI7++P3RTuOwFnTtLWBdkaaes2i1/LmkAfBkgOBUgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=S+iaI+j9; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=No
	z8BKpLkezZAolANRl1sFT+p7wODBoKnA2WzCpg5Ks=; b=S+iaI+j9W4rhVrnlJI
	SJ1/XJU0bpNQhkAu32wUNbBDfiYaK70uNZDsrlLFNWgDVBOd+N7qS8qeHY8qlm9L
	NeEKIIli08ntF6HJ6AudqbgQnL9G9qEXNIYlpOZO5L+Qw1ezY2PAhtVqytJGgXhy
	NylsYBkRvhamFNaKaKTKHKIxc=
Received: from zhb.. (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wDnN1Gl67JpMC_OAQ--.12929S7;
	Fri, 13 Mar 2026 00:37:03 +0800 (CST)
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
	Hans Zhang <18255117159@163.com>
Subject: [PATCH v8 5/5] PCI: of: Remove max-link-speed generation validation
Date: Fri, 13 Mar 2026 00:36:52 +0800
Message-Id: <20260312163652.113228-6-18255117159@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260312163652.113228-1-18255117159@163.com>
References: <20260312163652.113228-1-18255117159@163.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDnN1Gl67JpMC_OAQ--.12929S7
X-Coremail-Antispam: 1Uf129KBjvJXoW7tr43tw43CryDXw1DJF1DZFb_yoW8Zw4kpa
	y7CryY9r1rJr45Xr4UXFs5Za4agFn5WrW8tryrC3sruwnxXrZIqry2qF4aqF9a9FZ7ZF17
	Za1aga1UCayqyaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pidMabUUUUU=
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbCww8t0Gmy669rLwAA3q
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[163.com,none];
	R_DKIM_ALLOW(-0.20)[163.com:s=s110527];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,google.com,broadcom.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[163.com];
	TAGGED_FROM(0.00)[bounces-29304-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,vger.kernel.org,lists.infradead.org,bp.renesas.com,broadcom.com,163.com];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	NEURAL_HAM(-0.00)[-0.999];
	FROM_NEQ_ENVFROM(0.00)[18255117159@163.com,linux-renesas-soc@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DKIM_TRACE(0.00)[163.com:+];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 746EA275C99
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
 drivers/pci/of.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/pci/of.c b/drivers/pci/of.c
index 9f8eb5df279e..fbb779a94202 100644
--- a/drivers/pci/of.c
+++ b/drivers/pci/of.c
@@ -875,8 +875,9 @@ EXPORT_SYMBOL_GPL(of_pci_supply_present);
  * of_pci_get_max_link_speed - Find the maximum link speed of the given device node.
  * @node: Device tree node with the maximum link speed information.
  *
- * This function will try to find the limitation of link speed by finding
- * a property called "max-link-speed" of the given device node.
+ * This function will try to read the "max-link-speed" property of the given
+ * device tree node. It does NOT validate the value of the property (e.g.,
+ * range checks for PCIe generations).
  *
  * Return:
  * * > 0	- On success, a maximum link speed.
@@ -889,10 +890,11 @@ EXPORT_SYMBOL_GPL(of_pci_supply_present);
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


