Return-Path: <linux-renesas-soc+bounces-30903-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ODpEAxfX02nUnAcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30903-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 06 Apr 2026 17:53:59 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB273A4F28
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 06 Apr 2026 17:53:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D3530300D32A
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Apr 2026 15:53:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C80592D594F;
	Mon,  6 Apr 2026 15:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="tQBtZ3+Q";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="DD/gq8Qh"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D39DC2848A7;
	Mon,  6 Apr 2026 15:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775490833; cv=none; b=T1Z5hRgFXRlE8JuPZbU8Ewu7z7wSxjfIb8jRLUJ1d7NuSLK+ZC1yClIWXA2L3KJOFGmxE6RwjLDTn0wpAjEVq3qvkNVAmHu7hv9gS5xJ/wxQxfEKYJao1sknUcEeNryfI/XggBMfMULLwuuMroto6ujQ8x4Bz9aZZQQ/NjlHrpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775490833; c=relaxed/simple;
	bh=ZOUU58cuPoDuZF3pxGlWzHNB2Ar1XmUFDmuQn4lOUmQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NmtKMZZA0tVTcbv9C4q7RBjOwZPXSmpeb0r2VA/lBrQ2op4Pse7vA2nudrhk/vNdTnqBG2dGkXwhwZljxG5Mb47NytquxB1IYDSCZBQ2QdRGWuBp5UuQ9JAJosPOg4yLpaOt9BPJfs8/1/lKXFOl4QVUqOX6728fLzcm+hmbeSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=tQBtZ3+Q; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=DD/gq8Qh; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4fqDQN3LNXz9tSw;
	Mon,  6 Apr 2026 17:53:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1775490828;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=CTIp6PYmhxw2yxDPfMwjhrEaZe3DIpYSpXyQJZiM6Bs=;
	b=tQBtZ3+QdFCh8HetGdgL7k6cbzkPLanUKpjTx6EjdXoqLqplLZTRD2PrWqVlztlcHdr62L
	r6pT5YlAznARax6qBNuDyMmKWmJugM93A/MOmCzq+Zyuh/DMEu77mBXekdsg/579blIxF/
	n0tlYFUNNlbw0xMj8HdP0Bi5yOd83RHma/S4EborSZcZbE5XmwqAGZERiK+K0vCDfinZii
	v7G6z0gBNS4xbkGXqf94PftQDzSBUXyQGHoc45oxuD1XoETqO8ipM8f8Ujt+UlMUI0qB0/
	Cam6xQ91elEtgHPqYE/nBjJluhBDjEClLBLsM0o904caQVqDpIjlsh7UV7n2rQ==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b="DD/gq8Qh";
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1775490826;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=CTIp6PYmhxw2yxDPfMwjhrEaZe3DIpYSpXyQJZiM6Bs=;
	b=DD/gq8QhbBEVad1i5qgLgyFF3vOOiQiJ19QZV6JAcDegCZLyGy7F019Qy0KNT7sFFQPJJi
	RswqdEslBP4j1vHEKbIN7UUnYI8bRqt71ChEx+8wR5bM1G+cAMj1/LfLB3JS6Y0Gxoqs1/
	FZPy2TuGDcUVxrljr2uUuT7texuDJsfFRv13AK6xAIwGl2OwmnWw77IYWDTAlR8OakboB4
	XSbod4LdYFnvrt2JKWClfnSTSHCQM7D5cq+YYYE9pUX9c7SLXzIjbGmFvV4wUsIhWSldkj
	r5eZPqes5VWHmKSSCcH9aItHiZcFA/9+n1OzpDNTJVEfGcKqYbB0LturWeVowQ==
To: arm-scmi@vger.kernel.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Subject: [RFC][PATCH] firmware: arm_scmi: Rename struct scmi_revision_info to scmi_base_info
Date: Mon,  6 Apr 2026 17:52:54 +0200
Message-ID: <20260406155343.72087-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: csqpo6g64h8qr9irwbwzpf9dqam9ghtb
X-MBO-RS-ID: 38eced4b8dc950e2456
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30903-lists,linux-renesas-soc=lfdr.de,renesas];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[mailbox.org:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9FB273A4F28
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Rename struct scmi_revision_info to struct scmi_base_info , to
accurately represent its content. The scmi_revision_info is no
longer accurate, because the structure now contains more than
only SCMI base protocol revision, it now also contains number
of protocols, agents, vendor and subvendor strings. All those
are fetched from the base protocol, so rename the structure to
scmi_base_info, to match the other scmi_*_info structure names.
No functional change.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Cristian Marussi <cristian.marussi@arm.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Sudeep Holla <sudeep.holla@kernel.org>
Cc: arm-scmi@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-renesas-soc@vger.kernel.org
---
 drivers/firmware/arm_scmi/base.c   | 10 +++++-----
 drivers/firmware/arm_scmi/common.h |  2 +-
 drivers/firmware/arm_scmi/driver.c | 14 +++++++-------
 include/linux/scmi_protocol.h      |  6 +++---
 4 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/firmware/arm_scmi/base.c b/drivers/firmware/arm_scmi/base.c
index cd1331c2fc403..4df2620e3c5d0 100644
--- a/drivers/firmware/arm_scmi/base.c
+++ b/drivers/firmware/arm_scmi/base.c
@@ -69,7 +69,7 @@ static int scmi_base_attributes_get(const struct scmi_protocol_handle *ph)
 	int ret;
 	struct scmi_xfer *t;
 	struct scmi_msg_resp_base_attributes *attr_info;
-	struct scmi_revision_info *rev = ph->get_priv(ph);
+	struct scmi_base_info *rev = ph->get_priv(ph);
 
 	ret = ph->xops->xfer_get_init(ph, PROTOCOL_ATTRIBUTES,
 				      0, sizeof(*attr_info), &t);
@@ -103,7 +103,7 @@ scmi_base_vendor_id_get(const struct scmi_protocol_handle *ph, bool sub_vendor)
 	int ret, size;
 	char *vendor_id;
 	struct scmi_xfer *t;
-	struct scmi_revision_info *rev = ph->get_priv(ph);
+	struct scmi_base_info *rev = ph->get_priv(ph);
 
 	if (sub_vendor) {
 		cmd = BASE_DISCOVER_SUB_VENDOR;
@@ -143,7 +143,7 @@ scmi_base_implementation_version_get(const struct scmi_protocol_handle *ph)
 	int ret;
 	__le32 *impl_ver;
 	struct scmi_xfer *t;
-	struct scmi_revision_info *rev = ph->get_priv(ph);
+	struct scmi_base_info *rev = ph->get_priv(ph);
 
 	ret = ph->xops->xfer_get_init(ph, BASE_DISCOVER_IMPLEMENT_VERSION,
 				      0, sizeof(*impl_ver), &t);
@@ -180,7 +180,7 @@ scmi_base_implementation_list_get(const struct scmi_protocol_handle *ph,
 	__le32 *num_skip, *num_ret;
 	u32 tot_num_ret = 0, loop_num_ret;
 	struct device *dev = ph->dev;
-	struct scmi_revision_info *rev = ph->get_priv(ph);
+	struct scmi_base_info *rev = ph->get_priv(ph);
 
 	ret = ph->xops->xfer_get_init(ph, BASE_DISCOVER_LIST_PROTOCOLS,
 				      sizeof(*num_skip), 0, &t);
@@ -377,7 +377,7 @@ static int scmi_base_protocol_init(const struct scmi_protocol_handle *ph)
 	u8 *prot_imp;
 	char name[SCMI_SHORT_NAME_MAX_SIZE];
 	struct device *dev = ph->dev;
-	struct scmi_revision_info *rev = scmi_revision_area_get(ph);
+	struct scmi_base_info *rev = scmi_revision_area_get(ph);
 
 	rev->major_ver = PROTOCOL_REV_MAJOR(ph->version);
 	rev->minor_ver = PROTOCOL_REV_MINOR(ph->version);
diff --git a/drivers/firmware/arm_scmi/common.h b/drivers/firmware/arm_scmi/common.h
index 7c9617d080a02..07a127dec0319 100644
--- a/drivers/firmware/arm_scmi/common.h
+++ b/drivers/firmware/arm_scmi/common.h
@@ -138,7 +138,7 @@ static inline void unpack_scmi_header(u32 msg_hdr, struct scmi_msg_hdr *hdr)
 	xfer_;							\
 })
 
-struct scmi_revision_info *
+struct scmi_base_info *
 scmi_revision_area_get(const struct scmi_protocol_handle *ph);
 void scmi_setup_protocol_implemented(const struct scmi_protocol_handle *ph,
 				     u8 *prot_imp);
diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 57785c0c04241..00329935926d3 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -134,7 +134,7 @@ struct scmi_protocol_instance {
  *	       usage.
  * @protocols_mtx: A mutex to protect protocols instances initialization.
  * @protocols_imp: List of protocols implemented, currently maximum of
- *		   scmi_revision_info.num_protocols elements allocated by the
+ *		   scmi_base_info.num_protocols elements allocated by the
  *		   base protocol
  * @active_protocols: IDR storing device_nodes for protocols actually defined
  *		      in the DT and confirmed as implemented by fw.
@@ -152,7 +152,7 @@ struct scmi_info {
 	int id;
 	struct device *dev;
 	const struct scmi_desc *desc;
-	struct scmi_revision_info version;
+	struct scmi_base_info version;
 	struct scmi_handle handle;
 	struct scmi_xfers_info tx_minfo;
 	struct scmi_xfers_info rx_minfo;
@@ -266,7 +266,7 @@ scmi_vendor_protocol_lookup(int protocol_id, char *vendor_id,
 }
 
 static const struct scmi_protocol *
-scmi_vendor_protocol_get(int protocol_id, struct scmi_revision_info *version)
+scmi_vendor_protocol_get(int protocol_id, struct scmi_base_info *version)
 {
 	const struct scmi_protocol *proto;
 
@@ -304,7 +304,7 @@ scmi_vendor_protocol_get(int protocol_id, struct scmi_revision_info *version)
 }
 
 static const struct scmi_protocol *
-scmi_protocol_get(int protocol_id, struct scmi_revision_info *version)
+scmi_protocol_get(int protocol_id, struct scmi_base_info *version)
 {
 	const struct scmi_protocol *proto = NULL;
 
@@ -2095,7 +2095,7 @@ static const struct scmi_proto_helpers_ops helpers_ops = {
  * Return: A reference to the version memory area associated to the SCMI
  *	   instance underlying this protocol handle.
  */
-struct scmi_revision_info *
+struct scmi_base_info *
 scmi_revision_area_get(const struct scmi_protocol_handle *ph)
 {
 	const struct scmi_protocol_instance *pi = ph_to_pi(ph);
@@ -2408,7 +2408,7 @@ scmi_is_protocol_implemented(const struct scmi_handle *handle, u8 prot_id)
 {
 	int i;
 	struct scmi_info *info = handle_to_scmi_info(handle);
-	struct scmi_revision_info *rev = handle->version;
+	struct scmi_base_info *rev = handle->version;
 
 	if (!info->protocols_imp)
 		return false;
@@ -3203,7 +3203,7 @@ static const struct scmi_desc *scmi_transport_setup(struct device *dev)
 
 static void scmi_enable_matching_quirks(struct scmi_info *info)
 {
-	struct scmi_revision_info *rev = &info->version;
+	struct scmi_base_info *rev = &info->version;
 
 	dev_dbg(info->dev, "Looking for quirks matching: %s/%s/0x%08X\n",
 		rev->vendor_id, rev->sub_vendor_id, rev->impl_ver);
diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
index c710107c2120a..49cc39e0cbca5 100644
--- a/include/linux/scmi_protocol.h
+++ b/include/linux/scmi_protocol.h
@@ -17,7 +17,7 @@
 #define SCMI_SHORT_NAME_MAX_SIZE	16
 
 /**
- * struct scmi_revision_info - version information structure
+ * struct scmi_base_info - version information structure
  *
  * @major_ver: Major ABI version. Change here implies risk of backward
  *	compatibility break.
@@ -30,7 +30,7 @@
  * @vendor_id: A vendor identifier(Null terminated ASCII string)
  * @sub_vendor_id: A sub-vendor identifier(Null terminated ASCII string)
  */
-struct scmi_revision_info {
+struct scmi_base_info {
 	u16 major_ver;
 	u16 minor_ver;
 	u8 num_protocols;
@@ -906,7 +906,7 @@ struct scmi_notify_ops {
  */
 struct scmi_handle {
 	struct device *dev;
-	struct scmi_revision_info *version;
+	struct scmi_base_info *version;
 
 	int __must_check (*devm_protocol_acquire)(struct scmi_device *sdev,
 						  u8 proto);
-- 
2.53.0


