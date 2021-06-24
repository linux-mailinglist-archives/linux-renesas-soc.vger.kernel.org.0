Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D9B43B325E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Jun 2021 17:16:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232038AbhFXPSx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 24 Jun 2021 11:18:53 -0400
Received: from www.zeus03.de ([194.117.254.33]:46210 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232118AbhFXPSt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 Jun 2021 11:18:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=zLhZ5XhmpaK6vn
        Q2F6ioAJSqoOMCa/VxjSTgAYsZUAo=; b=XZQ1rC7CxTP1fStMePf2kjNoHV3EEg
        93q6fYjtPC7AZ7Hbep7Yfy7u2tVNkStcNYncDBlv2Hy1ecK5/d9Y2qxBV4P+2P/R
        0VcUrDUqX3xllV89niqm9i+ZT7RMld3e5hDaG9Wgn+opE80bdm4BcpRqH69EyQpK
        /kr7igigz+wsI=
Received: (qmail 3016692 invoked from network); 24 Jun 2021 17:16:26 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 24 Jun 2021 17:16:26 +0200
X-UD-Smtp-Session: l3s3148p1@3OC5gYTFVMkgARa4RWOqASgLlirhLBBp
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Adrian Hunter <adrian.hunter@intel.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 2/3] mmc: host: add kdoc for mmc_retune_{en|dis}able
Date:   Thu, 24 Jun 2021 17:16:15 +0200
Message-Id: <20210624151616.38770-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210624151616.38770-1-wsa+renesas@sang-engineering.com>
References: <20210624151616.38770-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

I wanted to use it in a wrong way, so document the intended way.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/mmc/core/host.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/mmc/core/host.c b/drivers/mmc/core/host.c
index eda4a1892c33..0f084c9b2684 100644
--- a/drivers/mmc/core/host.c
+++ b/drivers/mmc/core/host.c
@@ -95,6 +95,10 @@ void mmc_unregister_host_class(void)
 	class_unregister(&mmc_host_class);
 }
 
+/**
+ * mmc_retune_enable() - enter a transfer mode that requires retuning
+ * @host: host which should retune now
+ */
 void mmc_retune_enable(struct mmc_host *host)
 {
 	host->can_retune = 1;
@@ -126,6 +130,12 @@ void mmc_retune_unpause(struct mmc_host *host)
 }
 EXPORT_SYMBOL(mmc_retune_unpause);
 
+/**
+ * mmc_retune_disable() - exit a transfer mode that requires retuning
+ * @host: host which should not retune anymore
+ *
+ * It is not meant for temporarily preventing retuning!
+ */
 void mmc_retune_disable(struct mmc_host *host)
 {
 	mmc_retune_unpause(host);
-- 
2.30.2

