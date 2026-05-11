Return-Path: <linux-renesas-soc+bounces-32427-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MDFpIdVlAmqhsQEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32427-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 01:27:17 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E0528517472
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 01:27:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 23A9C304412E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 23:26:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B92AB3630A8;
	Mon, 11 May 2026 23:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="NpVEaZvQ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13CF736167E
	for <linux-renesas-soc@vger.kernel.org>; Mon, 11 May 2026 23:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778541974; cv=none; b=omQbnGSUnqtXeDti9NkNQBR9xRKPoKLITdnFDZFTE6CxW9nVXeEs360ND9PySuotVEWUF2hEP8FjOLSRB765egEEybZrrM9Zr9UryAyc3SKLr0+nbaAxCiOnIdOO5x5in207IK/myH8kE2PqZAAxwdCHSTkH0Jx4NcvvHBC6vSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778541974; c=relaxed/simple;
	bh=hfkQCByppKDryyzrL3jOmeTKr5xNyt0fd3LFVmQ+wB8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mzoDJzkhbRvLPehXaOXUd4npiS7LzJ3O4NjzEkRBWi666AxWfy37sXcOXWOEnZXRLo6GgHZGY4bP+ps8N+Nw7m9M6LLoswSk0lTLBjFbICh3H88/VaxP2gTou1WwNqBLjXXC9uU8Ib6jgMAtrdfh2P41Oj82BMOVlgZRgtnYpAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=NpVEaZvQ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5FE8FE0D;
	Tue, 12 May 2026 01:26:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778541962;
	bh=hfkQCByppKDryyzrL3jOmeTKr5xNyt0fd3LFVmQ+wB8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NpVEaZvQePsiGKVie6CESQrw2CjmdFvMK4UU2B9G3khmnD3IiMwKwvoCNtbKhj10E
	 NCGk24aWslDnooWqjn6iePvVsoP1OQwYvVJuZrM/y2CWSKhxvB+u7shXe5X62b4Bal
	 yKhDWIbnV0jg588MJgV98I7R96Ow3qE9J7Gwyx00=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [kms-tests] [PATCH 1/4] kmstest: Print refresh rate in addition to mode name
Date: Tue, 12 May 2026 02:26:04 +0300
Message-ID: <20260511232607.3464470-2-laurent.pinchart@ideasonboard.com>
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
X-Rspamd-Queue-Id: E0528517472
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
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TAGGED_FROM(0.00)[bounces-32427-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mode.name:url,primary_plane.id:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,plane.id:url,crtc.id:url]
X-Rspamd-Action: no action

Tests log the select mode name. This only contains the resolution,
making it difficult to debug issues where refresh rate matters. Log the
refresh rate as well.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 tests/kms-test-allplanes.py       | 2 +-
 tests/kms-test-crc.py             | 2 +-
 tests/kms-test-formats.py         | 2 +-
 tests/kms-test-legacy-modeset.py  | 2 +-
 tests/kms-test-modes.py           | 2 +-
 tests/kms-test-modeset.py         | 2 +-
 tests/kms-test-pageflip.py        | 2 +-
 tests/kms-test-plane-alpha.py     | 2 +-
 tests/kms-test-plane-blendmode.py | 2 +-
 tests/kms-test-plane-position.py  | 2 +-
 tests/kms-test-plane-zpos.py      | 2 +-
 11 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/tests/kms-test-allplanes.py b/tests/kms-test-allplanes.py
index 6a6f7e72ca52..03eb668acc6e 100755
--- a/tests/kms-test-allplanes.py
+++ b/tests/kms-test-allplanes.py
@@ -46,7 +46,7 @@ class AllPlanesTest(kmstest.KMSTest):
                 continue
 
             self.logger.log(f'Testing connector {connector.fullname}, CRTC {crtc.id}, '
-                            f'mode {mode.name} with {len(planes)} planes '
+                            f'mode {mode.name}@{mode.vrefresh} with {len(planes)} planes '
                             f'(P: {crtc.primary_plane.id}, O: {[plane.id for plane in planes]})')
 
             # Create a frame buffer
diff --git a/tests/kms-test-crc.py b/tests/kms-test-crc.py
index b1af65d5256d..18e7cee928b6 100755
--- a/tests/kms-test-crc.py
+++ b/tests/kms-test-crc.py
@@ -149,7 +149,7 @@ class CRCTest(kmstest.KMSTest):
                 continue
 
             self.logger.log(f'Testing connector {connector.fullname}, CRTC {crtc.id}, '
-                            f'mode {mode.name} with {len(planes)} planes')
+                            f'mode {mode.name}@{mode.vrefresh} with {len(planes)} planes')
 
             # Create a frame buffer and draw a test pattern.
             fb = pykms.DumbFramebuffer(self.card, mode.hdisplay, mode.vdisplay, 'XR24')
diff --git a/tests/kms-test-formats.py b/tests/kms-test-formats.py
index ceb20cb0cd94..db3d38a9bc9b 100755
--- a/tests/kms-test-formats.py
+++ b/tests/kms-test-formats.py
@@ -20,7 +20,7 @@ class FormatsTest(kmstest.KMSTest):
         mode = connector.get_default_mode()
 
         self.logger.log(f'Testing connector {connector.fullname}, '
-                        f'CRTC {crtc.id}, mode {mode.name}')
+                        f'CRTC {crtc.id}, mode {mode.name}@{mode.vrefresh}')
 
         failed = 0
 
diff --git a/tests/kms-test-legacy-modeset.py b/tests/kms-test-legacy-modeset.py
index 4082093ab985..67a58d43a595 100755
--- a/tests/kms-test-legacy-modeset.py
+++ b/tests/kms-test-legacy-modeset.py
@@ -37,7 +37,7 @@ class LegacyModeSetTest(kmstest.KMSTest):
                 continue
 
             self.logger.log(f'Testing connector {connector.fullname} '
-                            f'on CRTC {crtc.id} with mode {mode.name}')
+                            f'on CRTC {crtc.id} with mode {mode.name}@{mode.vrefresh}')
 
             # Create a frame buffer
             fb = pykms.DumbFramebuffer(self.card, mode.hdisplay, mode.vdisplay, 'XR24')
diff --git a/tests/kms-test-modes.py b/tests/kms-test-modes.py
index d857dd6e6f05..9e42415987d0 100755
--- a/tests/kms-test-modes.py
+++ b/tests/kms-test-modes.py
@@ -13,7 +13,7 @@ class ModesTest(kmstest.KMSTest):
 
     def test_mode(self, connector, crtc, mode):
         self.logger.log(f'Testing connector {connector.fullname} '
-                        f'on CRTC {crtc.id} with mode {mode.name}')
+                        f'on CRTC {crtc.id} with mode {mode.name}@{mode.vrefresh}')
 
         # Create a frame buffer
         fb = pykms.DumbFramebuffer(self.card, mode.hdisplay, mode.vdisplay, 'XR24')
diff --git a/tests/kms-test-modeset.py b/tests/kms-test-modeset.py
index fd0c4acb91de..f7f2f6a36694 100755
--- a/tests/kms-test-modeset.py
+++ b/tests/kms-test-modeset.py
@@ -37,7 +37,7 @@ class ModeSetTest(kmstest.KMSTest):
                 continue
 
             self.logger.log(f'Testing connector {connector.fullname} '
-                            f'on CRTC {crtc.id} with mode {mode.name}')
+                            f'on CRTC {crtc.id} with mode {mode.name}@{mode.vrefresh}')
 
             # Create a frame buffer
             fb = pykms.DumbFramebuffer(self.card, mode.hdisplay, mode.vdisplay, 'XR24')
diff --git a/tests/kms-test-pageflip.py b/tests/kms-test-pageflip.py
index 1bb1214080ff..89de7cddfa57 100755
--- a/tests/kms-test-pageflip.py
+++ b/tests/kms-test-pageflip.py
@@ -78,7 +78,7 @@ class PageFlipTest(kmstest.KMSTest):
                 continue
 
             self.logger.log(f'Testing connector {connector.fullname}, CRTC {crtc.id}, '
-                            f'plane {self.plane.id}, mode {mode.name}')
+                            f'plane {self.plane.id}, mode {mode.name}@{mode.vrefresh}')
 
             # Create two frame buffers
             self.fbs = []
diff --git a/tests/kms-test-plane-alpha.py b/tests/kms-test-plane-alpha.py
index 7caf864f05b8..50fb31e5c7ee 100755
--- a/tests/kms-test-plane-alpha.py
+++ b/tests/kms-test-plane-alpha.py
@@ -22,7 +22,7 @@ class PlaneAlphaTest(kmstest.KMSTest):
         mode = connector.get_default_mode()
 
         self.logger.log(f'Testing connector {connector.fullname}, CRTC {crtc.id}, '
-                        f'mode {mode.name} with {len(planes)} planes '
+                        f'mode {mode.name}@{mode.vrefresh} with {len(planes)} planes '
                         f'(P: {crtc.primary_plane.id}, O: {[plane.id for plane in planes]})')
 
         # Create a frame buffer
diff --git a/tests/kms-test-plane-blendmode.py b/tests/kms-test-plane-blendmode.py
index bfefe6324380..b14744be710b 100755
--- a/tests/kms-test-plane-blendmode.py
+++ b/tests/kms-test-plane-blendmode.py
@@ -22,7 +22,7 @@ class PlaneBlendModeTest(kmstest.KMSTest):
         mode = connector.get_default_mode()
 
         self.logger.log(f'Testing connector {connector.fullname}, CRTC {crtc.id}, '
-                        f'mode {mode.name} with {len(planes)} planes '
+                        f'mode {mode.name}@{mode.vrefresh} with {len(planes)} planes '
                         f'(P: {crtc.primary_plane.id}, O: {[plane.id for plane in planes]})')
 
         # Create a frame buffer for the primary plane
diff --git a/tests/kms-test-plane-position.py b/tests/kms-test-plane-position.py
index d80f91657397..bedc8eafd98b 100755
--- a/tests/kms-test-plane-position.py
+++ b/tests/kms-test-plane-position.py
@@ -20,7 +20,7 @@ class PlanePositionTest(kmstest.KMSTest):
         mode = connector.get_default_mode()
 
         self.logger.log(f'Testing connector {connector.fullname}, CRTC {crtc.id}, '
-                        f'mode {mode.name} with {len(planes)} planes')
+                        f'mode {mode.name}@{mode.vrefresh} with {len(planes)} planes')
 
         # Create a frame buffer
         fb = pykms.DumbFramebuffer(self.card, mode.hdisplay, mode.vdisplay, 'XR24')
diff --git a/tests/kms-test-plane-zpos.py b/tests/kms-test-plane-zpos.py
index b87ae041936d..750cc4d90643 100755
--- a/tests/kms-test-plane-zpos.py
+++ b/tests/kms-test-plane-zpos.py
@@ -22,7 +22,7 @@ class PlaneZPosTest(kmstest.KMSTest):
         mode = connector.get_default_mode()
 
         self.logger.log(f'Testing connector {connector.fullname}, CRTC {crtc.id}, '
-                        f'mode {mode.name} with {len(planes)} planes '
+                        f'mode {mode.name}@{mode.vrefresh} with {len(planes)} planes '
                         f'(P: {crtc.primary_plane.id}, O: {[plane.id for plane in planes]})')
 
         # Create a frame buffer
-- 
Regards,

Laurent Pinchart


