Return-Path: <linux-renesas-soc+bounces-30818-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ADyoDB1+z2mvwgYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30818-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 10:45:17 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 81DF1392457
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 10:45:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AF216307C489
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Apr 2026 08:41:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BED6F37B023;
	Fri,  3 Apr 2026 08:41:39 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A596A221F1C;
	Fri,  3 Apr 2026 08:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775205699; cv=none; b=LWxnapjU5nERNCbpcPAwBNy6XCobTB/45ywwg0YRnmmj3gKvL/PpShNPuRWXEv/IhGn5poN1P+GP/AI5YR2yBBj4Uu+jv8m2/liOR9q4ZKKlhGG8l+LlgRTAX7fnn3LMD3kwmYTFx3C1gz9LEWAG6aMelwGhvjjs4gFEs8SRGrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775205699; c=relaxed/simple;
	bh=GJCjT7eGZY4sK0vCjxgZOtBBvIPmTND+u7YkTQZbDpA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CBmBo3B+RZ5mlBcWEbZYoj3li9O5kvti4/jxaDlGHB5sfq1sHtA11H+73nub81lTva4emGc1Iu7TCFWNd3pYM757ma7bB1AU6LhLJ12G6jfXCT9qZaqUausBDAjkuQiwu29Vh26J92DE6wegzKSAkE2a9fUmtWMKIO4I3uW/yzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D21C1C19423;
	Fri,  3 Apr 2026 08:41:37 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Marek Vasut <marek.vasut@mailbox.org>
Cc: arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/3] firmware: arm_scmi: quirk: Improve quirk range parsing
Date: Fri,  3 Apr 2026 10:41:29 +0200
Message-ID: <fe257b3b7b7b5c17fd0e5727bb9746c731bd7e3c.1775205358.git.geert+renesas@glider.be>
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
	TAGGED_FROM(0.00)[bounces-30818-lists,linux-renesas-soc=lfdr.de,renesas];
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
X-Rspamd-Queue-Id: 81DF1392457
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

When a range contains only an end ("-X"), the number string is parsed
twice, as both "sep == first" and "sep != last" are true.  Fix this by
dropping the superfluous number parsing for "sep == first".

This does have a harmless functional impact for the unbounded range:
"-" is now accepted, while it was rejected before.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/firmware/arm_scmi/quirks.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/firmware/arm_scmi/quirks.c b/drivers/firmware/arm_scmi/quirks.c
index 03848283c2a07b72..b1d9cd9fa2427879 100644
--- a/drivers/firmware/arm_scmi/quirks.c
+++ b/drivers/firmware/arm_scmi/quirks.c
@@ -238,16 +238,15 @@ static int scmi_quirk_range_parse(struct scmi_quirk *quirk)
 	if (sep)
 		*sep = '\0';
 
-	if (sep == first) /* -X */
-		ret = kstrtouint(first + 1, 0, &quirk->end_range);
-	else /* X OR X- OR X-y */
+	if (sep != first) /* X OR X- OR X-y */ {
 		ret = kstrtouint(first, 0, &quirk->start_range);
-	if (ret)
-		return ret;
+		if (ret)
+			return ret;
+	}
 
 	if (!sep)
 		quirk->end_range = quirk->start_range;
-	else if (sep != last) /* x-Y */
+	else if (sep != last) /* -X OR x-Y */
 		ret = kstrtouint(sep + 1, 0, &quirk->end_range);
 
 	if (quirk->start_range > quirk->end_range)
-- 
2.43.0


