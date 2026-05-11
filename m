Return-Path: <linux-renesas-soc+bounces-32430-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2EgWIyRmAmqhsQEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32430-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 01:28:36 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A462517488
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 01:28:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CA4AD3022607
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 23:26:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9642335675D;
	Mon, 11 May 2026 23:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="YNzLLuNG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42B15361666
	for <linux-renesas-soc@vger.kernel.org>; Mon, 11 May 2026 23:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778541987; cv=none; b=anxcsj8hBiVwpWZPoLWlHN1O50DcZJaec0vpisSfwA0SGEBegNq/jHWC0OMm5DLzp7CayALe88UMGtUjpP7OutJwfB5QrbJZmBp5k+lNGDUo8H3Uex58HRczjKfXiV51FRl8b+Zzn9gL7qJbZ0hNaxgu7dVUSIaA5M0NI5iHess=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778541987; c=relaxed/simple;
	bh=aLjI856EbMDB2oir5hdyfDipu5KVvlLR8zYEScZhAXc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SWUn4QYFg2+jspkLnc8HRZITDT7mo5gS0D4yIZxUtCs6P5qPBDF1cZS0eqF5CNEoKOmNd7bg4Z7GL7FEr2kGB3gHpBe05t5KhmgfKaGbwM6HBN4QL3lO8jaXs06wzdjf6Qvsp69G8pajm1FG/ceW14uVIzbNV3kWreJIpsppvM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=YNzLLuNG; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 52A60145C;
	Tue, 12 May 2026 01:26:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778541966;
	bh=aLjI856EbMDB2oir5hdyfDipu5KVvlLR8zYEScZhAXc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YNzLLuNGndhDi6+8JmboyiwyfQ5OHgnjGrgrolGDcydZTqjfyN7vs7SIlTTNAbRoQ
	 xdov9EFx4KOkLCL27EswMMj4lO3re9szPGe3VUYymM0r1K1tN7AYvkm9hDxgxDZCT9
	 qVROgeH8hnstGP08U5M3J4qrjKK7yJ++NARjtEsM=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [kms-tests] [PATCH 4/4] kmstest: crc: Use AR24 pixel format
Date: Tue, 12 May 2026 02:26:07 +0300
Message-ID: <20260511232607.3464470-5-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260511232607.3464470-1-laurent.pinchart@ideasonboard.com>
References: <20260511232607.3464470-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 0A462517488
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
	TAGGED_FROM(0.00)[bounces-32430-lists,linux-renesas-soc=lfdr.de];
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

The XR24 pixel format is not well suited for CRC tests as the alpha
component is ignored. The value from the test pattern generator
(undefined) may therefore differ from the value used by the hardware
(set to 100% alpha). Use AR24 instead to use a known alpha value.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 tests/kms-test-crc.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/kms-test-crc.py b/tests/kms-test-crc.py
index 1815c29a5c1a..26dbf2465e94 100755
--- a/tests/kms-test-crc.py
+++ b/tests/kms-test-crc.py
@@ -149,7 +149,7 @@ class CRCTest(kmstest.KMSTest):
 
             # Pick the largest mode with a bandwidth that does not exceed the
             # system limit.
-            pixelformat = 'XR24'
+            pixelformat = 'AR24'
             mode = self.get_largest_mode(connector, len(planes) + 1, pixelformat)
 
             if not mode:
-- 
Regards,

Laurent Pinchart


