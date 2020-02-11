Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 95877159861
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Feb 2020 19:21:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728715AbgBKSV2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 11 Feb 2020 13:21:28 -0500
Received: from xavier.telenet-ops.be ([195.130.132.52]:45376 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730058AbgBKSTc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Feb 2020 13:19:32 -0500
Received: from ramsan ([84.195.182.253])
        by xavier.telenet-ops.be with bizsmtp
        id 1WKW220055USYZQ01WKWw0; Tue, 11 Feb 2020 19:19:30 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j1a8A-0002ol-5L; Tue, 11 Feb 2020 19:19:30 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j1a8A-0003zB-3z; Tue, 11 Feb 2020 19:19:30 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Gilad Ben-Yossef <gilad@benyossef.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        linux-crypto@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 23/34] crypto: ccree - remove bogus kerneldoc markers
Date:   Tue, 11 Feb 2020 19:19:17 +0100
Message-Id: <20200211181928.15178-24-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200211181928.15178-1-geert+renesas@glider.be>
References: <20200211181928.15178-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Normal comments should start with "/*".
"/**" is reserver for kerneldoc.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - New.

 drivers/crypto/ccree/cc_aead.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/crypto/ccree/cc_aead.c b/drivers/crypto/ccree/cc_aead.c
index 78afa753b44f2dba..be26aaf75e1fe9ea 100644
--- a/drivers/crypto/ccree/cc_aead.c
+++ b/drivers/crypto/ccree/cc_aead.c
@@ -1223,7 +1223,7 @@ static void cc_hmac_authenc(struct aead_request *req, struct cc_hw_desc desc[],
 				 req_ctx->is_single_pass);
 
 	if (req_ctx->is_single_pass) {
-		/**
+		/*
 		 * Single-pass flow
 		 */
 		cc_set_hmac_desc(req, desc, seq_size);
@@ -1235,7 +1235,7 @@ static void cc_hmac_authenc(struct aead_request *req, struct cc_hw_desc desc[],
 		return;
 	}
 
-	/**
+	/*
 	 * Double-pass flow
 	 * Fallback for unsupported single-pass modes,
 	 * i.e. using assoc. data of non-word-multiple
@@ -1276,7 +1276,7 @@ cc_xcbc_authenc(struct aead_request *req, struct cc_hw_desc desc[],
 				 req_ctx->is_single_pass);
 
 	if (req_ctx->is_single_pass) {
-		/**
+		/*
 		 * Single-pass flow
 		 */
 		cc_set_xcbc_desc(req, desc, seq_size);
@@ -1287,7 +1287,7 @@ cc_xcbc_authenc(struct aead_request *req, struct cc_hw_desc desc[],
 		return;
 	}
 
-	/**
+	/*
 	 * Double-pass flow
 	 * Fallback for unsupported single-pass modes,
 	 * i.e. using assoc. data of non-word-multiple
-- 
2.17.1

