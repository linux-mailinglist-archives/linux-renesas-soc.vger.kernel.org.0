Return-Path: <linux-renesas-soc+bounces-14562-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5952EA66F26
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Mar 2025 09:57:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 95DA119A1767
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Mar 2025 08:57:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33CEF1FF7DD;
	Tue, 18 Mar 2025 08:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="XwDvRBkh"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 117E7205AD0
	for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Mar 2025 08:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742288258; cv=none; b=uKfyEPRtmkZXpJuER8iVdq1pPrUOH99u03l0KvnnnrTGlg8D+yP1cQPV95//FdrxSOJlYF4eT46mZLmreN7CLA1Jd4tgy0KWgRDJiOOu6zzMMUrKjCD/d72uQw6xaMiSmk5p7f/W1J00wdu5Rqtk1Nt1DMiccOBO23UmORzJn1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742288258; c=relaxed/simple;
	bh=L4ipmjPvkxp1Cv27fEnm2byaxBOYYkeas0niOYJt8aI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jaMRVgzRtRGUFueGFYnhh2ASGk8H8ZejN9EreUZdmqiDOfbORyEBBmxlqmAJridEgi5a9guuCv2cMZ+ub39PUO7XiMGR5iEfHA6vIexnk/CD4PIbCpU1QUy47Q6NT0+FvD/7GTbK4NV9lhw7vQAq9nf+z+SAeGhKUHO4eLbSzNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=XwDvRBkh; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=Lmd699ehV1Rp2n
	uPHJpTcKwu6PpAaHMhWiN7Bp+Zft0=; b=XwDvRBkhmsIoCWX5NX13yvhp924zRt
	vW01EWsDaXEW/WB4M4deM8A5s80jRJ1f0gljNU+nc5bwweHpA2YOyoIoPZlZBP8X
	1tqwY4YVCAMCKs7gagHk5JZeqg9WH9fPNTnWUlfgAlqsXLyCnF2UJUFw/jyEAsg+
	FkHvq3haJXvqjQVYBsD1S3NqiV0fy/JjJWg2+XLFk27vNb2D64HZfdU6elisEcjn
	6dU9bV6PkOspK1RHFR14qb701f1ZsQBIIm5Swsm/AzjkztRfBzhDLltXHeb6cXxA
	JaTO4JQhoePYNtNr2oju+k/c00DDD7l/U0igXe6qgRU7ixHs6nkU01aw==
Received: (qmail 3652369 invoked from network); 18 Mar 2025 09:57:34 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 18 Mar 2025 09:57:34 +0100
X-UD-Smtp-Session: l3s3148p1@Rft0GJow3MggAwDPXyTHAJp038nK7dx+
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH] misc: eeprom/idt_89hpesx: use per-client debugfs directory
Date: Tue, 18 Mar 2025 09:57:28 +0100
Message-ID: <20250318085727.20748-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The I2C core now provides a debugfs entry for each client. Let this
driver use it instead of the custom directory.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/misc/eeprom/idt_89hpesx.c | 75 +------------------------------
 1 file changed, 2 insertions(+), 73 deletions(-)

diff --git a/drivers/misc/eeprom/idt_89hpesx.c b/drivers/misc/eeprom/idt_89hpesx.c
index 1fc632ebf22f..60c42170d147 100644
--- a/drivers/misc/eeprom/idt_89hpesx.c
+++ b/drivers/misc/eeprom/idt_89hpesx.c
@@ -60,11 +60,6 @@ MODULE_VERSION(IDT_89HPESX_VER);
 MODULE_LICENSE("GPL v2");
 MODULE_AUTHOR("T-platforms");
 
-/*
- * csr_dbgdir - CSR read/write operations Debugfs directory
- */
-static struct dentry *csr_dbgdir;
-
 /*
  * struct idt_89hpesx_dev - IDT 89HPESx device data structure
  * @eesize:	Size of EEPROM in bytes (calculated from "idt,eecompatible")
@@ -1324,35 +1319,6 @@ static void idt_remove_sysfs_files(struct idt_89hpesx_dev *pdev)
 	sysfs_remove_bin_file(&dev->kobj, pdev->ee_file);
 }
 
-/*
- * idt_create_dbgfs_files() - create debugfs files
- * @pdev:	Pointer to the driver data
- */
-#define CSRNAME_LEN	((size_t)32)
-static void idt_create_dbgfs_files(struct idt_89hpesx_dev *pdev)
-{
-	struct i2c_client *cli = pdev->client;
-	char fname[CSRNAME_LEN];
-
-	/* Create Debugfs directory for CSR file */
-	snprintf(fname, CSRNAME_LEN, "%d-%04hx", cli->adapter->nr, cli->addr);
-	pdev->csr_dir = debugfs_create_dir(fname, csr_dbgdir);
-
-	/* Create Debugfs file for CSR read/write operations */
-	debugfs_create_file(cli->name, 0600, pdev->csr_dir, pdev,
-			    &csr_dbgfs_ops);
-}
-
-/*
- * idt_remove_dbgfs_files() - remove debugfs files
- * @pdev:	Pointer to the driver data
- */
-static void idt_remove_dbgfs_files(struct idt_89hpesx_dev *pdev)
-{
-	/* Remove CSR directory and it sysfs-node */
-	debugfs_remove_recursive(pdev->csr_dir);
-}
-
 /*
  * idt_probe() - IDT 89HPESx driver probe() callback method
  */
@@ -1382,7 +1348,7 @@ static int idt_probe(struct i2c_client *client)
 		goto err_free_pdev;
 
 	/* Create debugfs files */
-	idt_create_dbgfs_files(pdev);
+	debugfs_create_file(pdev->client->name, 0600, client->debugfs, pdev, &csr_dbgfs_ops);
 
 	return 0;
 
@@ -1399,9 +1365,6 @@ static void idt_remove(struct i2c_client *client)
 {
 	struct idt_89hpesx_dev *pdev = i2c_get_clientdata(client);
 
-	/* Remove debugfs files first */
-	idt_remove_dbgfs_files(pdev);
-
 	/* Remove sysfs files */
 	idt_remove_sysfs_files(pdev);
 
@@ -1550,38 +1513,4 @@ static struct i2c_driver idt_driver = {
 	.remove = idt_remove,
 	.id_table = idt_ids,
 };
-
-/*
- * idt_init() - IDT 89HPESx driver init() callback method
- */
-static int __init idt_init(void)
-{
-	int ret;
-
-	/* Create Debugfs directory first */
-	if (debugfs_initialized())
-		csr_dbgdir = debugfs_create_dir("idt_csr", NULL);
-
-	/* Add new i2c-device driver */
-	ret = i2c_add_driver(&idt_driver);
-	if (ret) {
-		debugfs_remove_recursive(csr_dbgdir);
-		return ret;
-	}
-
-	return 0;
-}
-module_init(idt_init);
-
-/*
- * idt_exit() - IDT 89HPESx driver exit() callback method
- */
-static void __exit idt_exit(void)
-{
-	/* Discard debugfs directory and all files if any */
-	debugfs_remove_recursive(csr_dbgdir);
-
-	/* Unregister i2c-device driver */
-	i2c_del_driver(&idt_driver);
-}
-module_exit(idt_exit);
+module_i2c_driver(idt_driver);
-- 
2.47.2


