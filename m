Return-Path: <linux-renesas-soc+bounces-31732-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OCbECj4W8Wm6dAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31732-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Apr 2026 22:19:10 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B709448BA4C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Apr 2026 22:19:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 88D5F3088321
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Apr 2026 20:17:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 193DB31E824;
	Tue, 28 Apr 2026 20:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="ar26Xeqf"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F5923264D0;
	Tue, 28 Apr 2026 20:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777407433; cv=none; b=a80QDJFzSEbMFZKwMXzEnDh+VRhafeHyOpDK4NtXz39tNO27ujQKh9qn2lXpxzF4z1YuO4acoXhhLYrd9IIgWmvWkMJTop98Eo8lf4ZNxMCH8NtzNnIs6l22v8wfaO6h/dkHLNg0al4YfT9iJ+8i1vQLYcm7lN4KHsgSa+DGDGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777407433; c=relaxed/simple;
	bh=6nEFcFhdP808ZVtmXdMcMA3pZOK4Wb1QnGW2QZeFifA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DpTMZuY5R3Aa6slzVseTfsW1AB8kpNf4EYJyVW4SMec9+ududhTMk83YauPM+Ic0ADb260bmp72GJkM63mrtcX77ypApBJsmKztzZGlQoWgUSl7zwQVQ08Kqc1Fv6tcTpeRSll/IEeuRnYoR3w1wLWix4RUw7WqllQplUDYH8C0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=ar26Xeqf; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 546781C0A;
	Tue, 28 Apr 2026 13:17:05 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 10D3E3F763;
	Tue, 28 Apr 2026 13:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777407430; bh=6nEFcFhdP808ZVtmXdMcMA3pZOK4Wb1QnGW2QZeFifA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ar26XeqfQe/6RVcliRdSrSnj7NmY5hVXRpqHsifVOXS1jPW9CABFa6omEunngt+Nq
	 JNq0FAv/a97S3Ggrp7XEHuJKtGjsqoreSJ9tsiFIUTiZ5sIhxya4ZHSCsMqZ9Lecbk
	 g/yv+7IQWsLIec9WncInr/I/ZcbY1+8Mctb5fYaE=
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
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [PATCH v3 12/15] firmware: arm_scmi: Use proper iter_response_bound_cleanup() name
Date: Tue, 28 Apr 2026 21:15:19 +0100
Message-ID: <20260428201522.903875-13-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260428201522.903875-1-cristian.marussi@arm.com>
References: <20260428201522.903875-1-cristian.marussi@arm.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: B709448BA4C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[arm.com,broadcom.com,gmail.com,linaro.org,foss.st.com,oss.nxp.com,amd.com,glider.be,renesas.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-31732-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cristian.marussi@arm.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	NEURAL_HAM(-0.00)[-0.996];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,arm.com:email,arm.com:dkim,arm.com:mid]

From: Geert Uytterhoeven <geert+renesas@glider.be>

The documentation speaks of the "iter_response_bound_cleanup()" protocol
helper, while the actual helper is called "iter_response_cleanup()".
Settle on the former name, because the helper is only needed when using
bound-iterators.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
[Cristian: removed Fixed tag referring the same series]
Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
 drivers/firmware/arm_scmi/driver.c    | 6 +++---
 drivers/firmware/arm_scmi/protocols.h | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index fd031a8d40df..57785c0c0424 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -1875,7 +1875,7 @@ static int __scmi_iterator_run(void *iter, unsigned int *start, unsigned int *en
 	return 0;
 }
 
-static void scmi_iterator_cleanup(void *iter)
+static void scmi_iterator_bound_cleanup(void *iter)
 {
 	struct scmi_iterator *i = iter;
 
@@ -1888,7 +1888,7 @@ static int scmi_iterator_run(void *iter)
 	int ret;
 
 	ret = __scmi_iterator_run(iter, NULL, NULL);
-	scmi_iterator_cleanup(iter);
+	scmi_iterator_bound_cleanup(iter);
 
 	return ret;
 }
@@ -2078,7 +2078,7 @@ static const struct scmi_proto_helpers_ops helpers_ops = {
 	.iter_response_init = scmi_iterator_init,
 	.iter_response_run = scmi_iterator_run,
 	.iter_response_run_bound = scmi_iterator_run_bound,
-	.iter_response_cleanup = scmi_iterator_cleanup,
+	.iter_response_bound_cleanup = scmi_iterator_bound_cleanup,
 	.protocol_msg_check = scmi_protocol_msg_check,
 	.fastchannel_init = scmi_common_fastchannel_init,
 	.fastchannel_db_ring = scmi_common_fastchannel_db_ring,
diff --git a/drivers/firmware/arm_scmi/protocols.h b/drivers/firmware/arm_scmi/protocols.h
index e2ef604c16ef..15ad5162e37a 100644
--- a/drivers/firmware/arm_scmi/protocols.h
+++ b/drivers/firmware/arm_scmi/protocols.h
@@ -286,7 +286,7 @@ struct scmi_proto_helpers_ops {
 	int (*iter_response_run)(void *iter);
 	int (*iter_response_run_bound)(void *iter,
 				       unsigned int *start, unsigned int *end);
-	void (*iter_response_cleanup)(void *iter);
+	void (*iter_response_bound_cleanup)(void *iter);
 	int (*protocol_msg_check)(const struct scmi_protocol_handle *ph,
 				  u32 message_id, u32 *attributes);
 	void (*fastchannel_init)(const struct scmi_protocol_handle *ph,
-- 
2.53.0


