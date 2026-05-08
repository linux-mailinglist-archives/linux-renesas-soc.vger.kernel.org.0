Return-Path: <linux-renesas-soc+bounces-32295-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KL3fHIsD/mlYmAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32295-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 08 May 2026 17:38:51 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E04C04F8DB1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 08 May 2026 17:38:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E84A430B3DBA
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 May 2026 15:34:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29CAF3FE678;
	Fri,  8 May 2026 15:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="fxsUPOFg"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83F9D3FCB30;
	Fri,  8 May 2026 15:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778254432; cv=none; b=m4XiCFSFxeLm4An9St67Wn9T2tqOdCretFI59dJ619APQIvogt2j/aJ3uXRx6X39F+KR6+szhzUmvAHEjMIUxlzBicT0/TbxyGXnzMugVbiPwbHyPVdCaR7Owrv4B3jC3rMSkoECzIsnhKqLmvmUc+CYX1I1LgUSYovfwz5XBaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778254432; c=relaxed/simple;
	bh=kM+U8v3f2McW8OM5ONalrhlXqiBSrlQSwzAp9yyXSgY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j7ChK2t6MQAnMnSgUerrS8RufO7Q08tgV5PZxDrXQJoXRDNrO31NZKS/ITHejlB1ap3HLwtGief8nkDgt4bwizpO3Ih/QrASJC7Lskxd/TJcvgqPdYcqAWso0mDvRZfx+LJWQ8u7TJlhZMGbyQsfGNMGnVC7pgsT4qvNyzq3868=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=fxsUPOFg; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9981F35A1;
	Fri,  8 May 2026 08:33:44 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8C70A3F836;
	Fri,  8 May 2026 08:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778254430; bh=kM+U8v3f2McW8OM5ONalrhlXqiBSrlQSwzAp9yyXSgY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fxsUPOFghTDuToJOqTOpKu4knl7XZGgMLInPrcTVOQcChZ64SAp5uO+NuHmz9yhuc
	 dn8mHWAVYwVBGU9Wr4TlBt6ADjNRMDVBvpi/onU6pOvNGbpzAMMzBx4AabhsmoKfUb
	 /iwszYNeKqYioM0MiuhtZVvJLNL3q6TbM/CvuWoU=
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
	Cristian Marussi <cristian.marussi@arm.com>,
	Peng Fan <peng.fan@nxp.com>
Subject: [PATCH v4 07/15] firmware: arm_scmi: Make clock rates allocation dynamic
Date: Fri,  8 May 2026 16:32:52 +0100
Message-ID: <20260508153300.2224715-8-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260508153300.2224715-1-cristian.marussi@arm.com>
References: <20260508153300.2224715-1-cristian.marussi@arm.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: E04C04F8DB1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[arm.com,broadcom.com,gmail.com,linaro.org,foss.st.com,oss.nxp.com,amd.com,glider.be,renesas.com,nxp.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-32295-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cristian.marussi@arm.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	NEURAL_HAM(-0.00)[-0.999];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,arm.com:email,arm.com:mid,arm.com:dkim]
X-Rspamd-Action: no action

Leveraging SCMI Clock protocol dynamic discovery capabilities, move away
from the static per-clock rates allocation model in favour of a dynamic
runtime allocation based on effectively discovered resources.

No functional change.

Reviewed-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
v2 --> v3
 - collected Review-by tags
---
 drivers/firmware/arm_scmi/clock.c | 19 ++++++++++++++++---
 include/linux/scmi_protocol.h     |  1 -
 2 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/firmware/arm_scmi/clock.c b/drivers/firmware/arm_scmi/clock.c
index 467b13a3a18f..c9b62edce4fd 100644
--- a/drivers/firmware/arm_scmi/clock.c
+++ b/drivers/firmware/arm_scmi/clock.c
@@ -161,7 +161,7 @@ struct scmi_clock_desc {
 	u32 id;
 	bool rate_discrete;
 	unsigned int num_rates;
-	u64 rates[SCMI_MAX_NUM_RATES];
+	u64 *rates;
 #define	RATE_MIN	0
 #define	RATE_MAX	1
 #define	RATE_STEP	2
@@ -480,6 +480,18 @@ iter_clk_describe_update_state(struct scmi_iterator_state *st,
 			   QUIRK_OUT_OF_SPEC_TRIPLET);
 	}
 
+	if (!st->max_resources) {
+		int num_rates = st->num_returned + st->num_remaining;
+
+		p->clkd->rates = devm_kcalloc(p->dev, num_rates,
+					      sizeof(*p->clkd->rates), GFP_KERNEL);
+		if (!p->clkd->rates)
+			return -ENOMEM;
+
+		/* max_resources is used by the iterators to control bounds */
+		st->max_resources = st->num_returned + st->num_remaining;
+	}
+
 	return 0;
 }
 
@@ -493,6 +505,8 @@ iter_clk_describe_process_response(const struct scmi_protocol_handle *ph,
 
 	p->clkd->rates[st->desc_index + st->loop_idx] =
 		RATE_TO_U64(r->rate[st->loop_idx]);
+
+	/* Count only effectively discovered rates */
 	p->clkd->num_rates++;
 
 	return 0;
@@ -515,8 +529,7 @@ scmi_clock_describe_rates_get(const struct scmi_protocol_handle *ph, u32 clk_id,
 		.dev = ph->dev,
 	};
 
-	iter = ph->hops->iter_response_init(ph, &ops, SCMI_MAX_NUM_RATES,
-					    CLOCK_DESCRIBE_RATES,
+	iter = ph->hops->iter_response_init(ph, &ops, 0, CLOCK_DESCRIBE_RATES,
 					    sizeof(struct scmi_msg_clock_describe_rates),
 					    &cpriv);
 	if (IS_ERR(iter))
diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
index 19834f85f5d3..0824a7dc4aae 100644
--- a/include/linux/scmi_protocol.h
+++ b/include/linux/scmi_protocol.h
@@ -15,7 +15,6 @@
 
 #define SCMI_MAX_STR_SIZE		64
 #define SCMI_SHORT_NAME_MAX_SIZE	16
-#define SCMI_MAX_NUM_RATES		16
 
 /**
  * struct scmi_revision_info - version information structure
-- 
2.53.0


