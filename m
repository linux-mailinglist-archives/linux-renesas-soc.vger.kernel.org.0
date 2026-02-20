Return-Path: <linux-renesas-soc+bounces-28342-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8FTNC3QwmGkzCQMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28342-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Feb 2026 10:59:16 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 948DC1668EF
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Feb 2026 10:59:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E0D1430745DE
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Feb 2026 09:53:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63FA232E13A;
	Fri, 20 Feb 2026 09:53:39 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A5E1313555;
	Fri, 20 Feb 2026 09:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771581219; cv=none; b=nbXdP/sS37iK0pd0Q73WQ18bHqSiWqPXKCeWEK2s1qMZJPnRMIdmxyf7uxL1AHUEIrcOH7Re03SxH4vdSwE972upCwk98bcll9u3zIo5SOQW2erA3B4YJZKUusPN+SR43+88OXnxcLw9NzeRSPvUJQq6xnBefTBnVtZzJYpz5jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771581219; c=relaxed/simple;
	bh=JROdh8NkTFwLwYX8OH5YVR9U6FFJhnS2Gf94RcaA0KU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=A/5poVBOwnQCQS7BilulSSy1vW23l+rLUWoEv2bOddbq1p7SrwFJujBmL6uwFdLPZRyjHJGQJpNn4wO7TqnF/ZcXhK09yGsPwQZ4Gm0+mxv0y73vW+3qmF8cDXbCHC2NSW21eN2ON7IXPyVM0nbP54uJS+95sibi4cfr1SAC/Hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 109A2C116C6;
	Fri, 20 Feb 2026 09:53:36 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Etienne Carriere <etienne.carriere@foss.st.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Marek Vasut <marek.vasut+renesas@gmail.com>
Cc: arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC] firmware: arm_scmi: Increase SCMI_MAX_NUM_RATES to 64
Date: Fri, 20 Feb 2026 10:53:31 +0100
Message-ID: <bc2b9f5e361f1c50e661aa80fe1c2bcfd93c9c56.1771580928.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-28342-lists,linux-renesas-soc=lfdr.de,renesas];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,arm.com,foss.st.com,renesas.com,gmail.com];
	DMARC_NA(0.00)[glider.be];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.906];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@glider.be,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	R_DKIM_NA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,glider.be:mid,glider.be:email]
X-Rspamd-Queue-Id: 948DC1668EF
X-Rspamd-Action: no action

Currently, the SCMI clock driver supports up to 16 clock rates.
However, the SCMI specification v3.2 does not explicitly specify the
maximum number of clock rates that can be returned (the theoretical
maximum is 4095 in the first call of the CLOCK_DESCRIBE_RATES command,
followed by 65535 remaining rates in subsequent calls).

In Renesas R-Car X5H SCP FW SDK v4.28.0, some clocks have 32 or 64
rates, which are returned in blocks of maximum 27 entries.  When SCMI
firmware returns more than 16 clock rates, Linux ignores all clock
rates, this reducing functionality of the affected clocks.

Fix this by increasing the maximum number of clock rates to 64.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
This does increase the size of each scmi_clock_info object by 384
bytes, which is way too much on a system with nearly 2000 clocks.
As currrently all scmi_clock_info structures are allocated together as a
single array, the .rates[] member cannot just be converted to a flexible
array, without splitting the allocation.

An alternative solution would be to no longer store all rates, as
proposed by Étienne Carrière in "[PATCH v2 1/2] firmware: arm_scmi: get
only min/max clock rates"
(https://lore.kernel.org/20241203173908.3148794-2-etienne.carriere@foss.st.com)
---
 include/linux/scmi_protocol.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
index aafaac1496b06a6e..707f616d9fc9afbf 100644
--- a/include/linux/scmi_protocol.h
+++ b/include/linux/scmi_protocol.h
@@ -15,7 +15,7 @@
 
 #define SCMI_MAX_STR_SIZE		64
 #define SCMI_SHORT_NAME_MAX_SIZE	16
-#define SCMI_MAX_NUM_RATES		16
+#define SCMI_MAX_NUM_RATES		64
 
 /**
  * struct scmi_revision_info - version information structure
-- 
2.43.0


