Return-Path: <linux-renesas-soc+bounces-32380-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aNvuHc3LAWqgjwEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32380-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 14:30:05 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D7CE250DCD3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 14:30:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D661930432E5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 12:22:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30E4C37E2E1;
	Mon, 11 May 2026 12:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ISer/pmr"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2A6B37B3F6
	for <linux-renesas-soc@vger.kernel.org>; Mon, 11 May 2026 12:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778502176; cv=none; b=BlRcKwNK5wx4zPEbfzZWv3X92n4KlEfxE4g2QGTPySqiauVPVy31x3UlOJ4Id4UCnt+t52Pb6lakVQ6u2YUaC99WSPQFGS6n3aBOBqnYf1EiA1pVzl3XWpqXqsIzgUbtXSG/hPebiiqcoR7sCI2IjYTVrl0gGr+E2efBw3bBwYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778502176; c=relaxed/simple;
	bh=KBUChl4XRf16bOkf6V6U0wsXT+WF9QFU7IYawomblPQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CgVEG6jALvXeEW5Sn1mJFT/6mv/dvzn4ik9NOcMdo0HJ8BS9fumNgtc1pufGv53iRoIxq+dBRq2qAIvkwm9MwBM0YTep4Cl37R9gBzewcNWnYsozDKywDkHuyi8nUfsezzJMLkpD5NQlIOjHVLfn+8FWKBCemYYjFRozsfLxNyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ISer/pmr; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0082D2886;
	Mon, 11 May 2026 14:22:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778502159;
	bh=KBUChl4XRf16bOkf6V6U0wsXT+WF9QFU7IYawomblPQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ISer/pmrlZP7CzFK68Kq7odAqiI01G3atW9dFRZCINrq+b2F14K2B3f9I3KbSVDeE
	 K18GbNWMM28+Re+3FGb5dQoQ0fNEdSmvJaAcnMZgocsvc2gJBfinve4HOwUEcofJeA
	 EWKR+ykawTrFAeWAEnfuIR5kjrjRKo/kbxV8Ljhc=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [kms-test] [PATCH v1 5/5] kmstest: Fix typo in comment
Date: Mon, 11 May 2026 15:22:37 +0300
Message-ID: <20260511122237.3084426-6-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260511122237.3084426-1-laurent.pinchart@ideasonboard.com>
References: <20260511122237.3084426-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: D7CE250DCD3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWO(0.00)[2];
	TAGGED_FROM(0.00)[bounces-32380-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:email,ideasonboard.com:mid,ideasonboard.com:dkim]
X-Rspamd-Action: no action

Fix incorrect grammar in comment.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 tests/kms-test-brxalloc.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/kms-test-brxalloc.py b/tests/kms-test-brxalloc.py
index 3ccd6995b449..04d4029a8c54 100755
--- a/tests/kms-test-brxalloc.py
+++ b/tests/kms-test-brxalloc.py
@@ -19,7 +19,7 @@ class BRxAllocTest(kmstest.KMSTest):
     def main(self):
         # This test requires usage of two CRTCs connected to the same VSPDL
         # instance to test dynamic assignment of the BRU and BRS to pipelines.
-        # This is only occurs on H3 ES2.0 and M3-N. Check the SoC model through
+        # This only occurs on H3 ES2.0 and M3-N. Check the SoC model through
         # sysfs as we can't detected it through the DRM/KMS API.
         soc = open('/sys/devices/soc0/soc_id', 'rb').read().strip().decode()
         if soc not in ['r8a7795', 'r8a77965']:
-- 
Regards,

Laurent Pinchart


