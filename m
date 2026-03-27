Return-Path: <linux-renesas-soc+bounces-30435-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CCp9D1+fxmnrMQUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30435-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 16:16:47 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F533468B4
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 16:16:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CEA1930FE6DD
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 15:11:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E7213126C0;
	Fri, 27 Mar 2026 15:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="G1YtZqRV"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7D2930EF84
	for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Mar 2026 15:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774624290; cv=none; b=NNJYx0CIkws6+feKeXvoddtrK6o1R/jaRxpblrZMCLQ3QixVE7hah1JNXbzog26F+bH0Z3z5OKpj2PcvpPDfuMCUEMas3mUZjFh1ICkNOulqRkGZ/TozCVWUBCV150nE8r61/dvdkX7vVkk+PkSG5l3DJj23RTmsiL8T7na4iwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774624290; c=relaxed/simple;
	bh=NB2iamtpP2XDsxs3VWRXl8P+a+DsKSP3dvELi8FMAHk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HqNGwqS5ZM1CCEnY3ZDfeDCwIkmUf0LJdaGW34PI5Bg6+oA4JrEcy/FKzMu0pv/+gk6rTB2Xvha9vF3E+LlpgVkdE4PK8F602e+AwRKOM4qppiIFDc9tarZmHShEr2fj7Ooq39hvF+Sb7+6JMYhRCUSbYZ2IOCl1Ypt5zVfO758=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=G1YtZqRV; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=hvrILReaMQTkxj
	Ib7eTUOZLrycZQTQ1ic1L96eXKTHI=; b=G1YtZqRVu/1j4oG+Ud0ZMA6/neP8na
	A7VPNHe6N+kQq4TGawL1HmwWSpgVRiK3/+W5QxXN1qKh975PHbR8N5nD+lanI/f1
	pP8nVb5OkN48/axumgnNv1Sp3v/opELMO0CWqiqkc++IzvFlDNRjI/tKV5loIqA4
	EbxtF5hG0gUV4IOpRBBFu1cWd8cybewJyoJK0jO9DDE6mdnrCKZJojZn4uTbTbaC
	OhWnboxZ5n/QFjLHRYV9VsNnFNsg5bqs53Q5AB2rWxpFBAsMomsaXHl78oYrC7Pp
	7a/gb6OsPSJrOrrkwjPyiahBTXC57zI/+6syhG2BIe8VXNM1vqWsG15Q==
Received: (qmail 234809 invoked from network); 27 Mar 2026 16:11:21 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 27 Mar 2026 16:11:21 +0100
X-UD-Smtp-Session: l3s3148p1@hB3i6QJOnDRUhsJN
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Peter Chen <peter.chen@cixtech.com>,
	Fugang Duan <fugang.duan@cixtech.com>,
	CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-acpi@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH v3] mailbox: remove superfluous internal header
Date: Fri, 27 Mar 2026 16:10:21 +0100
Message-ID: <20260327151112.5202-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30435-lists,linux-renesas-soc=lfdr.de,renesas];
	DMARC_NA(0.00)[sang-engineering.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[sang-engineering.com,kernel.org,nxp.com,cixtech.com,gmail.com,pengutronix.de,nvidia.com,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,sang-engineering.com:dkim,sang-engineering.com:email,sang-engineering.com:mid]
X-Rspamd-Queue-Id: C1F533468B4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Quite some controller drivers use the defines from the internal header
already. This prevents controller drivers outside the mailbox directory.
Move the defines to the public controller header to allow this again as
the defines are not strictly internal anyhow.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Sudeep Holla <sudeep.holla@kernel.org>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
---

Changes since v2:
* rebased to 7.0-rc5
* add tag (Thanks, Daniel!)

 drivers/mailbox/cix-mailbox.c      |  2 --
 drivers/mailbox/hi3660-mailbox.c   |  2 --
 drivers/mailbox/imx-mailbox.c      |  2 --
 drivers/mailbox/mailbox-sti.c      |  2 --
 drivers/mailbox/mailbox.c          |  2 --
 drivers/mailbox/mailbox.h          | 12 ------------
 drivers/mailbox/omap-mailbox.c     |  2 --
 drivers/mailbox/pcc.c              |  2 --
 drivers/mailbox/tegra-hsp.c        |  2 --
 include/linux/mailbox_controller.h |  5 +++++
 10 files changed, 5 insertions(+), 28 deletions(-)
 delete mode 100644 drivers/mailbox/mailbox.h

diff --git a/drivers/mailbox/cix-mailbox.c b/drivers/mailbox/cix-mailbox.c
index 443620e8ae37..864f98f21fc3 100644
--- a/drivers/mailbox/cix-mailbox.c
+++ b/drivers/mailbox/cix-mailbox.c
@@ -12,8 +12,6 @@
 #include <linux/module.h>
 #include <linux/platform_device.h>
 
-#include "mailbox.h"
-
 /*
  * The maximum transmission size is 32 words or 128 bytes.
  */
diff --git a/drivers/mailbox/hi3660-mailbox.c b/drivers/mailbox/hi3660-mailbox.c
index 17c29e960fbf..9b727a2b54a5 100644
--- a/drivers/mailbox/hi3660-mailbox.c
+++ b/drivers/mailbox/hi3660-mailbox.c
@@ -15,8 +15,6 @@
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 
-#include "mailbox.h"
-
 #define MBOX_CHAN_MAX			32
 
 #define MBOX_RX				0x0
diff --git a/drivers/mailbox/imx-mailbox.c b/drivers/mailbox/imx-mailbox.c
index 003f9236c35e..22331b579489 100644
--- a/drivers/mailbox/imx-mailbox.c
+++ b/drivers/mailbox/imx-mailbox.c
@@ -23,8 +23,6 @@
 #include <linux/slab.h>
 #include <linux/workqueue.h>
 
-#include "mailbox.h"
-
 #define IMX_MU_CHANS		24
 /* TX0/RX0/RXDB[0-3] */
 #define IMX_MU_SCU_CHANS	6
diff --git a/drivers/mailbox/mailbox-sti.c b/drivers/mailbox/mailbox-sti.c
index b4b5bdd503cf..b6c9ecbbc8ec 100644
--- a/drivers/mailbox/mailbox-sti.c
+++ b/drivers/mailbox/mailbox-sti.c
@@ -21,8 +21,6 @@
 #include <linux/property.h>
 #include <linux/slab.h>
 
-#include "mailbox.h"
-
 #define STI_MBOX_INST_MAX	4      /* RAM saving: Max supported instances */
 #define STI_MBOX_CHAN_MAX	20     /* RAM saving: Max supported channels  */
 
diff --git a/drivers/mailbox/mailbox.c b/drivers/mailbox/mailbox.c
index e63b2292ee7a..9d41a1ab9018 100644
--- a/drivers/mailbox/mailbox.c
+++ b/drivers/mailbox/mailbox.c
@@ -18,8 +18,6 @@
 #include <linux/property.h>
 #include <linux/spinlock.h>
 
-#include "mailbox.h"
-
 static LIST_HEAD(mbox_cons);
 static DEFINE_MUTEX(con_mutex);
 
diff --git a/drivers/mailbox/mailbox.h b/drivers/mailbox/mailbox.h
deleted file mode 100644
index e1ec4efab693..000000000000
--- a/drivers/mailbox/mailbox.h
+++ /dev/null
@@ -1,12 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-
-#ifndef __MAILBOX_H
-#define __MAILBOX_H
-
-#include <linux/bits.h>
-
-#define TXDONE_BY_IRQ	BIT(0) /* controller has remote RTR irq */
-#define TXDONE_BY_POLL	BIT(1) /* controller can read status of last TX */
-#define TXDONE_BY_ACK	BIT(2) /* S/W ACK received by Client ticks the TX */
-
-#endif /* __MAILBOX_H */
diff --git a/drivers/mailbox/omap-mailbox.c b/drivers/mailbox/omap-mailbox.c
index d9f100c18895..5772c6b9886a 100644
--- a/drivers/mailbox/omap-mailbox.c
+++ b/drivers/mailbox/omap-mailbox.c
@@ -22,8 +22,6 @@
 #include <linux/pm_runtime.h>
 #include <linux/mailbox_controller.h>
 
-#include "mailbox.h"
-
 #define MAILBOX_REVISION		0x000
 #define MAILBOX_MESSAGE(m)		(0x040 + 4 * (m))
 #define MAILBOX_FIFOSTATUS(m)		(0x080 + 4 * (m))
diff --git a/drivers/mailbox/pcc.c b/drivers/mailbox/pcc.c
index 22e70af1ae5d..636879ae1db7 100644
--- a/drivers/mailbox/pcc.c
+++ b/drivers/mailbox/pcc.c
@@ -59,8 +59,6 @@
 #include <linux/io-64-nonatomic-lo-hi.h>
 #include <acpi/pcc.h>
 
-#include "mailbox.h"
-
 #define MBOX_IRQ_NAME		"pcc-mbox"
 
 /**
diff --git a/drivers/mailbox/tegra-hsp.c b/drivers/mailbox/tegra-hsp.c
index ed9a0bb2bcd8..2231050bb5a9 100644
--- a/drivers/mailbox/tegra-hsp.c
+++ b/drivers/mailbox/tegra-hsp.c
@@ -16,8 +16,6 @@
 
 #include <dt-bindings/mailbox/tegra186-hsp.h>
 
-#include "mailbox.h"
-
 #define HSP_INT_IE(x)		(0x100 + ((x) * 4))
 #define HSP_INT_IV		0x300
 #define HSP_INT_IR		0x304
diff --git a/include/linux/mailbox_controller.h b/include/linux/mailbox_controller.h
index 80a427c7ca29..16fef421c30c 100644
--- a/include/linux/mailbox_controller.h
+++ b/include/linux/mailbox_controller.h
@@ -3,6 +3,7 @@
 #ifndef __MAILBOX_CONTROLLER_H
 #define __MAILBOX_CONTROLLER_H
 
+#include <linux/bits.h>
 #include <linux/completion.h>
 #include <linux/device.h>
 #include <linux/hrtimer.h>
@@ -11,6 +12,10 @@
 
 struct mbox_chan;
 
+#define TXDONE_BY_IRQ	BIT(0) /* controller has remote RTR irq */
+#define TXDONE_BY_POLL	BIT(1) /* controller can read status of last TX */
+#define TXDONE_BY_ACK	BIT(2) /* S/W ACK received by Client ticks the TX */
+
 /**
  * struct mbox_chan_ops - methods to control mailbox channels
  * @send_data:	The API asks the MBOX controller driver, in atomic
-- 
2.51.0


