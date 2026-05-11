Return-Path: <linux-renesas-soc+bounces-32429-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UX/aDLdlAmqhsQEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32429-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 01:26:47 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CB9151744F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 01:26:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BC3D3300A658
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 23:26:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFC6136166F;
	Mon, 11 May 2026 23:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="VQeVShtt"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3012F363C75
	for <linux-renesas-soc@vger.kernel.org>; Mon, 11 May 2026 23:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778541986; cv=none; b=MqxS6oyx86KhG04eJEzl0PHyL6DFjceOBmn1Ow5zH6lD4vH3cxxwU361q/5rijI9GfoWAkBmMT6SLepfRIluVLNyjoWHE7N/TDVJ+ZlfYq30jnOzPRJMYrHHtGRkskN1LAr9xbeNw+lycWa2b/G7Tqt7n1Fy8YPZY8CtvsGTFpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778541986; c=relaxed/simple;
	bh=8+8tcDt7bf0a+GhKqWsfDPxC6ooalhXmW3+3OlpznBQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RYhSfA94EkiLzNscW4s6/xnpIaP9xjnwS+3eaRpKaLMlPLixbapzQIWIUhRwvstE4+XKv3Sve9FVyhEWC9VlwWwhy88h1TSwIO1vlRBWUw2WmnIVy97A2l/u2igsO7izKXk/jaZUdNgyoVl9NChXp4sR51epVv1VTBjzlLq9O1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=VQeVShtt; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 01C2CC59;
	Tue, 12 May 2026 01:26:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778541965;
	bh=8+8tcDt7bf0a+GhKqWsfDPxC6ooalhXmW3+3OlpznBQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VQeVShttCrfd7OOTjmGD1EIgaxAMAjurOIMzwEYhYAECN854c3LBQ3Ndmc0ZXCKOe
	 wNP81vFU+yl1k76r6KqQaZAxZscZE9qJilsX9pTEar7y1Plp7K20aTCfo9Ym9GKYze
	 TDeaASlSf37YMVrON/LsOpykWI8cGf+eb4mkEsvc=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [kms-tests] [PATCH 3/4] kmstest: crc: Don't stop on first failure
Date: Tue, 12 May 2026 02:26:06 +0300
Message-ID: <20260511232607.3464470-4-laurent.pinchart@ideasonboard.com>
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
X-Rspamd-Queue-Id: 2CB9151744F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32429-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action

It is useful to test all CRC sources instead of stopping on the first
failure, as it gives more data to diagnose problems. Do so.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 tests/kms-test-crc.py | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/tests/kms-test-crc.py b/tests/kms-test-crc.py
index ace2e0d134ae..1815c29a5c1a 100755
--- a/tests/kms-test-crc.py
+++ b/tests/kms-test-crc.py
@@ -203,6 +203,8 @@ class CRCTest(kmstest.KMSTest):
                 continue
 
             sources = [crtc] + planes
+            fail_sources = []
+
             for source in sources:
                 if source == crtc:
                     crc_source = 'auto'
@@ -221,9 +223,10 @@ class CRCTest(kmstest.KMSTest):
                 crcs = [c.crcs[0] for c in crcs[1:]]
                 self.logger.log(f'CRC value[0] 0x{crcs[0]:08x}')
 
-                failures = 0
                 ref_crc = composer.crc(source)
 
+                failures = 0
+
                 for i in range(len(crcs)):
                     crc = crcs[i]
                     if crc != ref_crc:
@@ -231,9 +234,10 @@ class CRCTest(kmstest.KMSTest):
                         failures += 1
 
                 if failures:
-                    self.fail(f'Incorrect CRC values on source {crc_source}')
-                    break
+                    fail_sources.append(crc_source)
 
+            if fail_sources:
+                self.fail(f'Incorrect CRC values on sources {fail_sources}')
             else:
                 self.success()
 
-- 
Regards,

Laurent Pinchart


