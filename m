Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F2573DC14B
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 31 Jul 2021 00:54:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233643AbhG3WyV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 30 Jul 2021 18:54:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233540AbhG3WyU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 30 Jul 2021 18:54:20 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7E31C06175F;
        Fri, 30 Jul 2021 15:54:15 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3E87E2A3;
        Sat, 31 Jul 2021 00:54:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1627685653;
        bh=oV7XLKF3R2uq+EwOeQ5Rkz+JnewE7G1kQOsSxISQsXk=;
        h=From:To:Cc:Subject:Date:From;
        b=E2CZROdlqShM/tdMvGznoUfFkBrS9+xaCGpCpYwLvD/0bSxQlkfEyH6iv+XxxAhho
         nCmVHFreXNcGoGLk7Ubn+OSBquJrqomp8GmUIKyWkX9IN6TduqRwoPZuupbyBUrj+2
         sdEy5JO+g+xpCwoQ7yH7LkcepW3+26LIQZcr2+2Q=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     linux-doc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Randy Dunlap <rdunlap@infradead.org>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH] scripts/kernel-doc: Override -Werror from KCFLAGS with KDOC_WERROR
Date:   Sat, 31 Jul 2021 01:54:01 +0300
Message-Id: <20210730225401.4401-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Since commit 2c12c8103d8f ("scripts/kernel-doc: optionally treat
warnings as errors"), the kernel-doc script will treat warnings as
errors when one of the following conditions is true:

- The KDOC_WERROR environment variable is non-zero
- The KCFLAGS environment variable contains -Werror
- The -Werror parameter is passed to kernel-doc

Checking KCFLAGS for -Werror allows piggy-backing on the C compiler
error handling. However, unlike the C compiler, kernel-doc has no
provision for -Wno-error. This makes compiling the kernel with -Werror
(to catch regressions) and W=1 (to enable more checks) always fail,
without the same possibility as offered by the C compiler to treating
some selected warnings as warnings despite the global -Werror setting.

To fix this, evaluate KDOC_WERROR after KCFLAGS, which allows disabling
the warnings-as-errors behaviour of kernel-doc selectively by setting
KDOC_WERROR=0.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 scripts/kernel-doc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/scripts/kernel-doc b/scripts/kernel-doc
index 7c4a6a507ac4..cfcb60737957 100755
--- a/scripts/kernel-doc
+++ b/scripts/kernel-doc
@@ -329,10 +329,6 @@ if (defined($ENV{'KBUILD_VERBOSE'})) {
 	$verbose = "$ENV{'KBUILD_VERBOSE'}";
 }
 
-if (defined($ENV{'KDOC_WERROR'})) {
-	$Werror = "$ENV{'KDOC_WERROR'}";
-}
-
 if (defined($ENV{'KCFLAGS'})) {
 	my $kcflags = "$ENV{'KCFLAGS'}";
 
@@ -341,6 +337,10 @@ if (defined($ENV{'KCFLAGS'})) {
 	}
 }
 
+if (defined($ENV{'KDOC_WERROR'})) {
+	$Werror = "$ENV{'KDOC_WERROR'}";
+}
+
 # Generated docbook code is inserted in a template at a point where
 # docbook v3.1 requires a non-zero sequence of RefEntry's; see:
 # https://www.oasis-open.org/docbook/documentation/reference/html/refentry.html
-- 
Regards,

Laurent Pinchart

