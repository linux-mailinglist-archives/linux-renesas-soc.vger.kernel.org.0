Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D74CE3729F5
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 May 2021 14:17:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230310AbhEDMSd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 4 May 2021 08:18:33 -0400
Received: from www.zeus03.de ([194.117.254.33]:37332 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230188AbhEDMSc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 4 May 2021 08:18:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=2yyPH8se0+nZ6UbxlCbOuNBeCyT
        1VfdEGO0/Rfn1+qg=; b=mg0cGIDNFEcN4pT7dU/bz4dBMh0S9LiKBCzdfA/hjsK
        +ufW3tbvlzqhIVQyLYQcVzgp2d/IR2N56shr+N/Odo1PYijxOBKOSRxur1iz+sDu
        743jJG6gUkDAvDFQiKm/K1Cbnatdvt6vnjx5FoipsXBOsp2+4u5bXyYnCJD9VIzw
        =
Received: (qmail 1352815 invoked from network); 4 May 2021 14:17:35 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 4 May 2021 14:17:35 +0200
X-UD-Smtp-Session: l3s3148p1@n3zPD4DBqIsgAwDPXxOMAJUzfx/HAvHg
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-kernel@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>
Subject: [PATCH] debugfs: only accept read attributes for blobs
Date:   Tue,  4 May 2021 14:17:20 +0200
Message-Id: <20210504121721.43385-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Blobs can only be read. So, keep only 'read' file attributes because the
others will not work and only confuse users.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

I was confused for a second, thinking blobs can be written to. I will
fix the few in-kernel users doing it wrong seperately.

 fs/debugfs/file.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/fs/debugfs/file.c b/fs/debugfs/file.c
index 686e0ad28788..d6aa6e04b7af 100644
--- a/fs/debugfs/file.c
+++ b/fs/debugfs/file.c
@@ -890,7 +890,8 @@ static const struct file_operations fops_blob = {
 /**
  * debugfs_create_blob - create a debugfs file that is used to read a binary blob
  * @name: a pointer to a string containing the name of the file to create.
- * @mode: the permission that the file should have
+ * @mode: the read permission that the file should have (other permissions are
+ * 	  masked out)
  * @parent: a pointer to the parent dentry for this file.  This should be a
  *          directory dentry if set.  If this parameter is %NULL, then the
  *          file will be created in the root of the debugfs filesystem.
@@ -914,7 +915,7 @@ struct dentry *debugfs_create_blob(const char *name, umode_t mode,
 				   struct dentry *parent,
 				   struct debugfs_blob_wrapper *blob)
 {
-	return debugfs_create_file_unsafe(name, mode, parent, blob, &fops_blob);
+	return debugfs_create_file_unsafe(name, mode & S_IRUGO, parent, blob, &fops_blob);
 }
 EXPORT_SYMBOL_GPL(debugfs_create_blob);
 
-- 
2.30.0

