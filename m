Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ECE3E7E9302
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 12 Nov 2023 23:55:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232448AbjKLWzE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 12 Nov 2023 17:55:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232389AbjKLWzA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 12 Nov 2023 17:55:00 -0500
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE700258E
        for <linux-renesas-soc@vger.kernel.org>; Sun, 12 Nov 2023 14:54:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        sang-engineering.com; h=from:to:cc:subject:date:message-id
        :in-reply-to:references:mime-version:content-transfer-encoding;
         s=k1; bh=XC8YsfMMiUd864T9XeDfh0Xs7Tr7xTQBx6wftM4oyK8=; b=fiXE8h
        9bgU2A21sHc2ICA3FMIRxHdjqb7nCRkYBdsFdslu2fEpMdPZBj7BNig2PxgE0u6U
        tF0JNKe/AowZf/mt76oTyLddSHIqw2qeaA+dkxJZW4nGDoUiUVsmEC/R1mHlhp8v
        /jim/HJhAn4gfRhi+/sGscTV8p/YwdPksRPzyM1S5mIng8y3XrPPTvpLXWMKLg8V
        3o6Ydjl9YbfziTTsD1q/MhHjGt8kLSSvmzg/z7ol/4EE23/RPaROcxvaTQiUK0b+
        8lZ14uO5avj37zD/hAX3TlcFI3DyuXNlZXsh9wLJjiGCS4LfJNH/lioz5nCQRAdL
        9HpgZ60c9UmQU+Ag==
Received: (qmail 4066264 invoked from network); 12 Nov 2023 23:54:54 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 12 Nov 2023 23:54:54 +0100
X-UD-Smtp-Session: l3s3148p1@2QoVcfwJ+bcMv8XD
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-i2c@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Wolfram Sang <wsa@kernel.org>, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] i2c: create debugfs entry per adapter
Date:   Sun, 12 Nov 2023 17:54:41 -0500
Message-Id: <20231112225444.4487-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20231112225444.4487-1-wsa+renesas@sang-engineering.com>
References: <20231112225444.4487-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Two drivers already implement custom debugfs handling for their
i2c_adapter and more will come. So, let the core create a debugfs
directory per adapter and pass that to drivers for their debugfs files.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/i2c-core-base.c | 11 +++++++++++
 include/linux/i2c.h         |  2 ++
 2 files changed, 13 insertions(+)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index eac90a3cf61a..f6c828bbd166 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -16,6 +16,7 @@
 #include <linux/acpi.h>
 #include <linux/clk/clk-conf.h>
 #include <linux/completion.h>
+#include <linux/debugfs.h>
 #include <linux/delay.h>
 #include <linux/err.h>
 #include <linux/errno.h>
@@ -67,6 +68,8 @@ static int i2c_detect(struct i2c_adapter *adapter, struct i2c_driver *driver);
 static DEFINE_STATIC_KEY_FALSE(i2c_trace_msg_key);
 static bool is_registered;
 
+static struct dentry *i2c_debugfs_root;
+
 int i2c_transfer_trace_reg(void)
 {
 	static_branch_inc(&i2c_trace_msg_key);
@@ -1524,6 +1527,8 @@ static int i2c_register_adapter(struct i2c_adapter *adap)
 		goto out_list;
 	}
 
+	adap->debugfs = debugfs_create_dir(dev_name(&adap->dev), i2c_debugfs_root);
+
 	res = i2c_setup_smbus_alert(adap);
 	if (res)
 		goto out_reg;
@@ -1563,6 +1568,7 @@ static int i2c_register_adapter(struct i2c_adapter *adap)
 	return 0;
 
 out_reg:
+	debugfs_remove_recursive(adap->debugfs);
 	init_completion(&adap->dev_released);
 	device_unregister(&adap->dev);
 	wait_for_completion(&adap->dev_released);
@@ -1764,6 +1770,8 @@ void i2c_del_adapter(struct i2c_adapter *adap)
 
 	i2c_host_notify_irq_teardown(adap);
 
+	debugfs_remove_recursive(adap->debugfs);
+
 	/* wait until all references to the device are gone
 	 *
 	 * FIXME: This is old code and should ideally be replaced by an
@@ -2061,6 +2069,8 @@ static int __init i2c_init(void)
 
 	is_registered = true;
 
+	i2c_debugfs_root = debugfs_create_dir("i2c", NULL);
+
 #ifdef CONFIG_I2C_COMPAT
 	i2c_adapter_compat_class = class_compat_register("i2c-adapter");
 	if (!i2c_adapter_compat_class) {
@@ -2099,6 +2109,7 @@ static void __exit i2c_exit(void)
 #ifdef CONFIG_I2C_COMPAT
 	class_compat_unregister(i2c_adapter_compat_class);
 #endif
+	debugfs_remove_recursive(i2c_debugfs_root);
 	bus_unregister(&i2c_bus_type);
 	tracepoint_synchronize_unregister();
 }
diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 0dae9db27538..cb93a054cdec 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -746,6 +746,8 @@ struct i2c_adapter {
 
 	struct irq_domain *host_notify_domain;
 	struct regulator *bus_regulator;
+
+	struct dentry *debugfs;
 };
 #define to_i2c_adapter(d) container_of(d, struct i2c_adapter, dev)
 
-- 
2.35.1

