Return-Path: <linux-renesas-soc+bounces-32379-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4DeyK83LAWqgjwEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32379-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 14:30:05 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A93B50DCD4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 14:30:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BBDAD30427CB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 12:22:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C239937BE87;
	Mon, 11 May 2026 12:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="o60OWSO3"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF87E3358D6
	for <linux-renesas-soc@vger.kernel.org>; Mon, 11 May 2026 12:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778502175; cv=none; b=S3n95Q8S+Htrhyjzoc3G8VsCwHdJj/UqmV6y9eaC+b5dDXVteTtf1Ss2Nz6B/NH8GNlJlYaqcr9G7uPJKEsgXMSdc8G2aj1M+7j27XzKvMtf3b8oZQex73ut0oNQ+HsKFJbDRLn5xSlvy2mMlj45j7QxV1+9MslwHlsWHPbYw7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778502175; c=relaxed/simple;
	bh=efRCOrQ5qtp9RVK6l2cZIMfXlpIZ/vFL03AdX+MQNBU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HkDv+N6SuToty8F0G43SkIR82vkiJLxLQ7D81M25NuehFeoyD/pKCCTPHFmb9lgv7GSvTJUW3R7J5E3yy6DkkxaI/MaMVACEu5wwy+0W387ABXa05TZyu7rsadybDhiNXZ6aKFXMEpPtrObdKpAl8HGsY0YRYp2zOHx70xjs2gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=o60OWSO3; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id AE7E412EE;
	Mon, 11 May 2026 14:22:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778502157;
	bh=efRCOrQ5qtp9RVK6l2cZIMfXlpIZ/vFL03AdX+MQNBU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=o60OWSO3yyNEvBe7OrfuAPBDfmCa/Ud7jLRJ4JddlVSttrLe4f+B+J9dJmJO2vMeN
	 tjSaFwsfcHJ+bhzmEfATusAjLZkKT+LbkvI0ogsMA3NsPmIJp16U+f/D8dUZbVIBsv
	 I8WYx8Cxg7XBwhEZ+HVmuvy/yr+BQfxgNXEeEhf0=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [kms-test] [PATCH v1 4/5] kmstest: Prioritize connectors with accurate connection status
Date: Mon, 11 May 2026 15:22:36 +0300
Message-ID: <20260511122237.3084426-5-laurent.pinchart@ideasonboard.com>
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
X-Rspamd-Queue-Id: 5A93B50DCD4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWO(0.00)[2];
	TAGGED_FROM(0.00)[bounces-32379-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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

The find_pipeline() function picks the first connector that reports a
connected status. On most Renesas boards, the VGA and LVDS connectors
don't provide hotplug detection, and report a connected monitor or panel
if indicated by the device tree. This can lead to tests running on a
connector with no connected display.

Fix this by prioritizing connector types that provide proper display
detection.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 tests/kmstest.py | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/tests/kmstest.py b/tests/kmstest.py
index 490083aa0e08..2b60a77280e1 100755
--- a/tests/kmstest.py
+++ b/tests/kmstest.py
@@ -481,7 +481,12 @@ class KMSTest(object):
 
     def find_pipeline(self, min_planes=0):
         """Find a CRTC that has a default mode, is wired to a connected
-        connector, and has at least min_planes overlay planes."""
+        connector, and has at least min_planes overlay planes.
+
+        Prioritize connectors that report accurate connection status (LVDS and
+        VGA don't provide HPD on most Renesas boards)."""
+
+        selected = (None, None, None)
 
         for connector in self.output_connectors():
             # Skip disconnected connectors and connectors without a default
@@ -505,9 +510,20 @@ class KMSTest(object):
                         planes.append(plane)
 
                 if len(planes) >= min_planes:
-                    return crtc, connector, planes
+                    selected = (crtc, connector, planes)
+                    break
+            else:
+                continue
 
-        return None, None, None
+            selected = crtc, connector, planes
+
+            # If the connector reports accurate connection status, return it.
+            # Otherwise continue searching other connectors.
+            hotplug = connector.fullname.split('-')[0] not in ('LVDS', 'VGA')
+            if hotplug:
+                break
+
+        return selected
 
     def output_connectors(self):
         for connector in self.card.connectors:
-- 
Regards,

Laurent Pinchart


