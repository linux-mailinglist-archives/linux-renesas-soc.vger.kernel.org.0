Return-Path: <linux-renesas-soc+bounces-15613-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 352E2A81A09
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Apr 2025 02:48:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 15F8A444F09
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Apr 2025 00:48:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C21426AF5;
	Wed,  9 Apr 2025 00:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="G0ti2c/k"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 667FA4C80
	for <linux-renesas-soc@vger.kernel.org>; Wed,  9 Apr 2025 00:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744159709; cv=none; b=qyiVDgiEzSvnGnuXVb0iIhMVzy3CjZhCSgNNF5NgWPVPbUDP2TFNXA9UbzVsl3OSfZVPVKiQSYo4p9RyGO4SU8jDHilQLagENvVM2gbOrK1rSUtgudZVdZqwmjPtydCPXsxP+bB5MxATlXGJPLFtf32/6KuVqKxZbC06H4mqBPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744159709; c=relaxed/simple;
	bh=R8K/2v2kmOdNSN3bjDCEgDtnK7X4aLzqbLS+KDdvCJQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HXNXKPSkVir4ckxRjyanVRgAkQpT7maz0rwLU/LiAg8zCXer7N4+2vCjzZrO1pyypbxqX7zjxlgrIGuzEkHNsk+YQ/hGTC7PaqRFLFxichqbAyTqAm1IZ5rtQoxmTUASY/ZdtiCO2egKtnr/xpQyQ8cu/6X1HznWfJl5vLtCQsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=G0ti2c/k; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B342C83D;
	Wed,  9 Apr 2025 02:46:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1744159587;
	bh=R8K/2v2kmOdNSN3bjDCEgDtnK7X4aLzqbLS+KDdvCJQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=G0ti2c/k6DTCU0M/ohszQKFF8MtkFjP3g5YYCs9csbbFIUouZRDvY/bC7XeDLBoIR
	 4M55xxetM5qBTYjoEnpiP5jAoYSPlvQdxOs+sI8Ho5slfBNhXhRfb4ojf3VHDvdOg2
	 6yLVlzpJ7cxs3YvENSCIk/ImmPHRrpXaDK6eE8uI=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: [vsp-tests] [PATCH 01/16] gen-lut.py: Replace tabs with spaces
Date: Wed,  9 Apr 2025 03:47:43 +0300
Message-ID: <20250409004758.11014-2-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250409004758.11014-1-laurent.pinchart@ideasonboard.com>
References: <20250409004758.11014-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Python source code is typically indented with 4 spaces instead of tabs.
Update gen-lut.py accordingly.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 data/frames/gen-lut.py | 100 ++++++++++++++++++++---------------------
 1 file changed, 50 insertions(+), 50 deletions(-)

diff --git a/data/frames/gen-lut.py b/data/frames/gen-lut.py
index 335b9f1613bc..c3591f90c2d3 100755
--- a/data/frames/gen-lut.py
+++ b/data/frames/gen-lut.py
@@ -6,79 +6,79 @@ import math
 import sys
 
 clu_configs = (
-	('zero', {
-		'scale': 0.0,
-		'a': 0.0,
-		'freq': 1.0,
-		'weights': (1.0, 1.0, 1.0)
-	} ),
-	('identity', {
-		'scale': 1.0,
-		'a': 0.0,
-		'freq': 1.0,
-		'weights': (1.0, 1.0, 1.0)
-	} ),
-	# Keep the three weights different to generate an anisothropic
-	# look up table.
-	('wave', {
-		'scale': 1.0,
-		'a': 0.1,
-		'freq': 3.0,
-		'weights': (1.0, 2.0, 3.0)
-	} ),
+    ('zero', {
+        'scale': 0.0,
+        'a': 0.0,
+        'freq': 1.0,
+        'weights': (1.0, 1.0, 1.0)
+    } ),
+    ('identity', {
+        'scale': 1.0,
+        'a': 0.0,
+        'freq': 1.0,
+        'weights': (1.0, 1.0, 1.0)
+    } ),
+    # Keep the three weights different to generate an anisothropic
+    # look up table.
+    ('wave', {
+        'scale': 1.0,
+        'a': 0.1,
+        'freq': 3.0,
+        'weights': (1.0, 2.0, 3.0)
+    } ),
 )
 
 lut_configs = (
-	('zero',	0.0, 1.0, 1.0, 1.0),
-	('identity',	1.0, 1.0, 1.0, 1.0),
-	('gamma',	1.0, 0.5, 1.0, 2.0),
+    ('zero',     0.0, 1.0, 1.0, 1.0),
+    ('identity', 1.0, 1.0, 1.0, 1.0),
+    ('gamma',    1.0, 0.5, 1.0, 2.0),
 )
 
 def clu_value(x, y, z, scale, a, freq, weights):
-	x = x / 16.
-	y = y / 16.
-	z = z / 16.
+    x = x / 16.
+    y = y / 16.
+    z = z / 16.
 
-	dist = math.sqrt((x*x*weights[0] + y*y*weights[1] + z*z*weights[2]) / 3. / sum(weights))
-	offset = a * math.sin(dist * freq * 2 * math.pi)
+    dist = math.sqrt((x*x*weights[0] + y*y*weights[1] + z*z*weights[2]) / 3. / sum(weights))
+    offset = a * math.sin(dist * freq * 2 * math.pi)
 
-	x = max(0, min(255, int((x*scale + offset) * 256)))
-	y = max(0, min(255, int((y*scale + offset) * 256)))
-	z = max(0, min(255, int((z*scale + offset) * 256)))
+    x = max(0, min(255, int((x*scale + offset) * 256)))
+    y = max(0, min(255, int((y*scale + offset) * 256)))
+    z = max(0, min(255, int((z*scale + offset) * 256)))
 
-	return (z, y, x, 0)
+    return (z, y, x, 0)
 
 def generate_clu(config):
-	clu = bytearray()
+    clu = bytearray()
 
-	for z in range(17):
-		for y in range(17):
-			for x in range(17):
-				clu.extend(clu_value(x, y, z, **config[1]))
+    for z in range(17):
+        for y in range(17):
+            for x in range(17):
+                clu.extend(clu_value(x, y, z, **config[1]))
 
-	open('clu-%s.bin' % config[0], 'wb').write(clu)
+    open('clu-%s.bin' % config[0], 'wb').write(clu)
 
 
 def gamma(vin, gamma, scale):
-	return int(255 * scale * math.pow(vin / 255., gamma))
+    return int(255 * scale * math.pow(vin / 255., gamma))
 
 def generate_lut(config):
-	lut = bytearray()
-	for i in range(256):
-		lut.extend([gamma(i, g, config[1]) for g in config[2:]])
-		lut.append(0)
+    lut = bytearray()
+    for i in range(256):
+        lut.extend([gamma(i, g, config[1]) for g in config[2:]])
+        lut.append(0)
 
-	open('lut-%s.bin' % config[0], 'wb').write(lut)
+    open('lut-%s.bin' % config[0], 'wb').write(lut)
 
 
 def main(argv):
-	for config in clu_configs:
-		generate_clu(config)
+    for config in clu_configs:
+        generate_clu(config)
 
-	for config in lut_configs:
-		generate_lut(config)
+    for config in lut_configs:
+        generate_lut(config)
 
-	return 0
+    return 0
 
 if __name__ == '__main__':
-	sys.exit(main(sys.argv))
+    sys.exit(main(sys.argv))
-- 
Regards,

Laurent Pinchart


