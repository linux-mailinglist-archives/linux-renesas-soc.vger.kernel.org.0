Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CDBC26C957
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Sep 2020 21:07:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727512AbgIPTHW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 16 Sep 2020 15:07:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727378AbgIPRpB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Sep 2020 13:45:01 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 120BEC00217B
        for <linux-renesas-soc@vger.kernel.org>; Wed, 16 Sep 2020 07:44:07 -0700 (PDT)
Received: from Q.local (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D080B276;
        Wed, 16 Sep 2020 16:43:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1600267432;
        bh=tQYjFCCN8ddzM6Kx7mSraUhUsSEme+lC3H0Pj6RtIi4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=fb1AO2a+G+GhHaKP2/JuS8UysSKCFqT4hrKyazGS/EX1yqzHF3jkrf6Wpj0fPhmQu
         y0iaEL8KA3PzuVKnfd25lutgMt2zLaEi22lhkGP5WQa5abXbvWDFbBzZAVBNOGl4/q
         R02rwfUtAbf5h5N2P1oB7AKeMxIR2f9FNP4WgGRc=
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [VSP-Tests PATCH 1/3] gen-lut: Update for python3
Date:   Wed, 16 Sep 2020 15:43:00 +0100
Message-Id: <20200916144302.1483470-2-kieran.bingham@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200916144302.1483470-1-kieran.bingham@ideasonboard.com>
References: <20200916144302.1483470-1-kieran.bingham@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Python2 has now gone end-of-life and is discontinued.

Update the gen-lut utility to use python3 directly, converting xrange
usages to range, and using bytearray to store the tables and write them
directly removing the discontinued file object.

Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
---
 data/frames/gen-lut.py | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/data/frames/gen-lut.py b/data/frames/gen-lut.py
index 07889b11f4ac..335b9f1613bc 100755
--- a/data/frames/gen-lut.py
+++ b/data/frames/gen-lut.py
@@ -1,4 +1,4 @@
-#!/usr/bin/python
+#!/usr/bin/python3
 # SPDX-License-Identifier: GPL-2.0-or-later
 # SPDX-FileCopyrightText: 2016 Renesas Electronics Corporation
 
@@ -49,26 +49,26 @@ def clu_value(x, y, z, scale, a, freq, weights):
 	return (z, y, x, 0)
 
 def generate_clu(config):
-	clu = []
+	clu = bytearray()
 
-	for z in xrange(17):
-		for y in xrange(17):
-			for x in xrange(17):
+	for z in range(17):
+		for y in range(17):
+			for x in range(17):
 				clu.extend(clu_value(x, y, z, **config[1]))
 
-	file('clu-%s.bin' % config[0], 'wb').write(''.join([chr(c) for c in clu]))
+	open('clu-%s.bin' % config[0], 'wb').write(clu)
 
 
 def gamma(vin, gamma, scale):
 	return int(255 * scale * math.pow(vin / 255., gamma))
 
 def generate_lut(config):
-	lut = []
-	for i in xrange(256):
+	lut = bytearray()
+	for i in range(256):
 		lut.extend([gamma(i, g, config[1]) for g in config[2:]])
 		lut.append(0)
 
-	file('lut-%s.bin' % config[0], 'wb').write(''.join([chr(c) for c in lut]))
+	open('lut-%s.bin' % config[0], 'wb').write(lut)
 
 
 def main(argv):
-- 
2.25.1

