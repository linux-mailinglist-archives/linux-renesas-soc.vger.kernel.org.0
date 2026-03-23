Return-Path: <linux-renesas-soc+bounces-30123-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kN/GKNp1wWkQTQQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30123-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Mar 2026 18:18:18 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F61E2F9B57
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Mar 2026 18:18:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0F3B631393D7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Mar 2026 16:56:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49E493BED75;
	Mon, 23 Mar 2026 16:56:22 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C69D3C1410;
	Mon, 23 Mar 2026 16:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774284982; cv=none; b=u6DuABwoB5ov4WzXlSsWgHJjDZtP8/OAoU4RgQKOCyLLtn4YLcrhIQ3Z9+YLvuuZ3GWhPLAKGZ+lXfGYiY8yYX43nT2PC/B8+a5i6vFXg/APJZZKjPk8xa7RdJ3+CbzFqlfMwidY033EKMNlWeARARsAbLlbcdlpsXf8xSsrxyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774284982; c=relaxed/simple;
	bh=y1/A89083KM2LkOVz+hiOs3Z+ZSJaIXCcI9AB7ibEHc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ilpKDjD0TflVBwghugLBoe2yzGAE3pVX6bcWyVBCqMflRDbF0KN8U7GRp86HDnmS0e4bDmSZXuV0LiOuS9ZlERdjQRESHE1oQLbfcjfAW+Pdp9hPGgCiruwmodgNIbb+x7Y10jcpB2+3MN9lt1+FBg3hx94Ubl0UdPRkYZqweZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C011C2BCB0;
	Mon, 23 Mar 2026 16:56:20 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/3] firmware: arm_scmi: Fix bound iterators returning too many items
Date: Mon, 23 Mar 2026 17:56:11 +0100
Message-ID: <8d9f0630e7ef2e3415df9800b6d9459063034977.1774283748.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1774283748.git.geert+renesas@glider.be>
References: <cover.1774283748.git.geert+renesas@glider.be>
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
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30123-lists,linux-renesas-soc=lfdr.de,renesas];
	DMARC_NA(0.00)[glider.be];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@glider.be,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	R_DKIM_NA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 7F61E2F9B57
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

When using a bound-iterator with an upper bound, commands are sent, and
responses are received, until the upper bound is reached.  However, it
is up to the SCMI provider implementation to decide how many rates are
returned in response to a single CLOCK_DESCRIBE_RATES command.  If the
last response contains rates beyond the specified upper bound, they are
still passed up for further processing.  This may lead to buffer
overflows in unprepared callsites.

While the imprecise bound handling may have been intentional (it was
mentioned in the commit message introducing the code), it is still
confusing for users, and may cause hard to debug crashes.  Fix this by
strictly enforcing the upper bound.

Note that this may cause an increase in the number of
CLOCK_DESCRIBE_RATES commands issued, as retrieving the last rate may no
longer be done inadvertentently, but require its own command.

Fixes: 13289addf5a52e1f ("firmware: arm_scmi: Add bound iterators support")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
This caused random "kernel BUG at drivers/base/devres.c:135!" crashes
during boot on R-Car X5H, as lazy clock rate discovery does not handle
correctly receiving more rates than expected.

Example for a clock with 8 rates, which are all returned in response to
a single CLOCK_DESCRIBE_RATES command:

    scmi_clock_describe_rates_get_lazy: Grabbing rates 0..2
    iter_clk_describe_update_state: Returned 8 remaining 0
    iter_clk_describe_update_state: Allocating 8 rates
    iter_clk_describe_process_response: rates[0] = 33333333
    iter_clk_describe_process_response: rates[1] = 66666666
    iter_clk_describe_process_response: rates[2] = 133333333
    iter_clk_describe_process_response: rates[3] = 266666666
    iter_clk_describe_process_response: rates[4] = 355555555
    iter_clk_describe_process_response: rates[5] = 533333333
    iter_clk_describe_process_response: rates[6] = 711111111
    iter_clk_describe_process_response: rates[7] = 1066666666
						   ^^^^^^^^^^
Rates [3] to [7] are received, despite being outside the bound.

    scmi_clock_describe_rates_get_lazy: Grabbing rates 7..7
    iter_clk_describe_update_state: Returned 1 remaining 0
    iter_clk_describe_process_response: rates[8] = 1066666666
					      ^    ^^^^^^^^^^
Out of bounds access! ------------------------+    |
Same value as [7] ---------------------------------+
---
 drivers/firmware/arm_scmi/driver.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 2a9183686203b4e7..03fd7caa8b42a12c 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -1820,6 +1820,7 @@ static int __scmi_iterator_run(void *iter, unsigned int *start, unsigned int *en
 	const struct scmi_protocol_handle *ph;
 	struct scmi_iterator_state *st;
 	struct scmi_iterator *i;
+	unsigned int n;
 
 	if (!iter)
 		return -EINVAL;
@@ -1852,13 +1853,17 @@ static int __scmi_iterator_run(void *iter, unsigned int *start, unsigned int *en
 			return -EINVAL;
 		}
 
-		for (st->loop_idx = 0; st->loop_idx < st->num_returned; st->loop_idx++) {
+		if (end)
+			n = min(st->num_returned, *end - st->desc_index + 1);
+		else
+			n = st->num_returned;
+		for (st->loop_idx = 0; st->loop_idx < n; st->loop_idx++) {
 			ret = iops->process_response(ph, i->resp, st, i->priv);
 			if (ret)
 				return ret;
 		}
 
-		st->desc_index += st->num_returned;
+		st->desc_index += n;
 		ph->xops->reset_rx_to_maxsz(ph, i->t);
 		/*
 		 * check for both returned and remaining to avoid infinite
-- 
2.43.0


