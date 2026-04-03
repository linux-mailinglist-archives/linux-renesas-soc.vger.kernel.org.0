Return-Path: <linux-renesas-soc+bounces-30819-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qKAcBC5+z2mvwgYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30819-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 10:45:34 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A508B392484
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 10:45:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7710330900B2
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Apr 2026 08:41:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 979B937B023;
	Fri,  3 Apr 2026 08:41:41 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CCCB37B015;
	Fri,  3 Apr 2026 08:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775205701; cv=none; b=lHuGyzGaVYSZIAbLOXDCVoSEGqWYraYDWwIWLiprMIBpGIBsysjDQzwFXtYZw9g0P2BbpGMBjB39KVqPUEXj6CHtraXtXz1oySNdaGkoy8tmQc89YdeN3WlAgGPiRNUIKsS0JWjJECTB4zPT7Hawb2hds7suIrecVkiPiOt1zkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775205701; c=relaxed/simple;
	bh=7wjxYJzwscJWaUI33eJgaxfLaeMOwgiru0820OAGtP4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QysKL/oUo7ak09mwag5vSB5zWv2QErt3Pmdi8GMYNIrR3p4HXRckEQuNmqZUcjNGvh3Fv0MhvXwXb+IqCYvnXQiGPi1lqMsb5DswjrizgbsyXHDICPU8PoAVr/O/Ql2qSztuYAYhsgZHVzDNFx/GUHvsNZfDSFn3LLlh+N5B2Qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6D9FC4CEF7;
	Fri,  3 Apr 2026 08:41:39 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Marek Vasut <marek.vasut@mailbox.org>
Cc: arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/3] firmware: arm_scmi: quirk: Simplify quirk table iteration
Date: Fri,  3 Apr 2026 10:41:30 +0200
Message-ID: <8577f4b103cf04420c3b67dcaad528daff867287.1775205358.git.geert+renesas@glider.be>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30819-lists,linux-renesas-soc=lfdr.de,renesas];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[glider.be];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FROM_NEQ_ENVFROM(0.00)[geert@glider.be,linux-renesas-soc@vger.kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:email,glider.be:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A508B392484
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The current table entry is assigned in both the init and loop
expressions of the for-statement.  Merge this into a single assignment
in the conditional expression, to simplify the code.

While at it, make the loop counter unsigned and loop-local.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/firmware/arm_scmi/quirks.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/firmware/arm_scmi/quirks.c b/drivers/firmware/arm_scmi/quirks.c
index b1d9cd9fa2427879..2b38ba3f59a13c9e 100644
--- a/drivers/firmware/arm_scmi/quirks.c
+++ b/drivers/firmware/arm_scmi/quirks.c
@@ -258,10 +258,8 @@ static int scmi_quirk_range_parse(struct scmi_quirk *quirk)
 void scmi_quirks_initialize(void)
 {
 	struct scmi_quirk *quirk;
-	int i;
 
-	for (i = 0, quirk = scmi_quirks_table[0]; quirk;
-	     i++, quirk = scmi_quirks_table[i]) {
+	for (unsigned int i = 0; (quirk = scmi_quirks_table[i]); i++) {
 		int ret;
 
 		ret = scmi_quirk_range_parse(quirk);
-- 
2.43.0


