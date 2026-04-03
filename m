Return-Path: <linux-renesas-soc+bounces-30820-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +AppIFF9z2mvwgYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30820-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 10:41:53 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B083923B1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 10:41:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 86F1C3004059
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Apr 2026 08:41:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93130221F1C;
	Fri,  3 Apr 2026 08:41:43 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79BA21D6DB5;
	Fri,  3 Apr 2026 08:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775205703; cv=none; b=OiVFVw06eDXkdd2wXSsEepKD42FA9zDANHLdw1TGWMZzjCD3Z7fCAmwCbCXxd7slZkwmj/Y2zM9wV+FQkrWcwnRDh9Q+6FHhF/rnB70WqrfWcyMNr/v/5F0cY7F6zF11T9zosulYzaaTJ3gFJrPa9UCRjQf8yUzww0eIxCC24nE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775205703; c=relaxed/simple;
	bh=yce0BsAQRk1038dJS4QatFy7z7YNE3a+MKkLLs7pfrc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nXWnnZAjfKZh4qfHmdfe2GS/S75IqEDXAChJNuuYEdmCxFkpX715JsvIbbremEzDAQpNfVRX+9n/PwrPkv8R4TlHnDTngfr5YVCs6ciyNt6QngusWapirKIWIfPAsGw/AdvUalbNyPjPQ6L8aLgdPtEbbnYuZ+Ejc67wLWkIUOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D1CEC4CEF7;
	Fri,  3 Apr 2026 08:41:41 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Marek Vasut <marek.vasut@mailbox.org>
Cc: arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 3/3] firmware: arm_scmi: Convert to list_for_each_entry()
Date: Fri,  3 Apr 2026 10:41:31 +0200
Message-ID: <bccbd4a64ef4619afd5454e9e533073b00aeaba6.1775205358.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1775205358.git.geert+renesas@glider.be>
References: <cover.1775205358.git.geert+renesas@glider.be>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30820-lists,linux-renesas-soc=lfdr.de,renesas];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[glider.be];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FROM_NEQ_ENVFROM(0.00)[geert@glider.be,linux-renesas-soc@vger.kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:email,glider.be:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D7B083923B1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Simplify the loop in scmi_handle_get() by using list_for_each_entry().

Suggested-by: Marek Vasut <marek.vasut@mailbox.org>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/firmware/arm_scmi/driver.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 57785c0c04241e46..b1bba2c61b728b56 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -2584,13 +2584,11 @@ static bool scmi_is_transport_atomic(const struct scmi_handle *handle,
  */
 static struct scmi_handle *scmi_handle_get(struct device *dev)
 {
-	struct list_head *p;
 	struct scmi_info *info;
 	struct scmi_handle *handle = NULL;
 
 	mutex_lock(&scmi_list_mutex);
-	list_for_each(p, &scmi_list) {
-		info = list_entry(p, struct scmi_info, node);
+	list_for_each_entry(info, &scmi_list, node) {
 		if (dev->parent == info->dev) {
 			info->users++;
 			handle = &info->handle;
-- 
2.43.0


