Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 791B87BC73
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Jul 2019 11:02:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726779AbfGaJCP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 31 Jul 2019 05:02:15 -0400
Received: from michel.telenet-ops.be ([195.130.137.88]:46956 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726666AbfGaJCP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 31 Jul 2019 05:02:15 -0400
Received: from ramsan ([84.194.98.4])
        by michel.telenet-ops.be with bizsmtp
        id jM2C2000E05gfCL06M2Cqj; Wed, 31 Jul 2019 11:02:13 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hskUu-0007Jc-4G; Wed, 31 Jul 2019 11:02:12 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hskUu-00053m-1v; Wed, 31 Jul 2019 11:02:12 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Jonathan Corbet <corbet@lwn.net>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-doc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] docs: arm: Remove orphan sh-mobile directory
Date:   Wed, 31 Jul 2019 11:02:11 +0200
Message-Id: <20190731090211.19408-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This directory is empty, except for a .gitignore file, listing an
executable file that can no longer be built since commit
c6535e1e0361157e ("Documentation: Remove ZBOOT MMC/SDHI utility and
docs").

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 Documentation/arm/sh-mobile/.gitignore | 1 -
 1 file changed, 1 deletion(-)
 delete mode 100644 Documentation/arm/sh-mobile/.gitignore

diff --git a/Documentation/arm/sh-mobile/.gitignore b/Documentation/arm/sh-mobile/.gitignore
deleted file mode 100644
index c928dbf3cc8806e2..0000000000000000
--- a/Documentation/arm/sh-mobile/.gitignore
+++ /dev/null
@@ -1 +0,0 @@
-vrl4
-- 
2.17.1

