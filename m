Return-Path: <linux-renesas-soc+bounces-34583-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id u1c9HbnYRGoH2AoAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34583-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Jul 2026 11:07:05 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 09BF96EB73B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Jul 2026 11:07:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ragnatech.se header.s=fm1 header.b=w6cvLzi+;
	dkim=pass header.d=messagingengine.com header.s=fm1 header.b="l PAiLgl";
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34583-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34583-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ragnatech.se;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7285130066AD
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Jul 2026 09:07:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 777043F482F;
	Wed,  1 Jul 2026 09:06:42 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout-b5-smtp.messagingengine.com (fout-b5-smtp.messagingengine.com [202.12.124.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5F043EFFB3;
	Wed,  1 Jul 2026 09:06:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782896802; cv=none; b=l0DVwlMN10EjnOOOg3/9UIiVFI8qCn8F4YmCuqexXEUcLVkFbGG+S7BZe0Z+aFzUGBgZUjkVgQ+vyExUyUriXL7zvMYuasrTxZ5/Nt3NilU3EfgliOc+01Z0+N/tD85dQRcdjxJwNGox1ho/b3t5SqxYKgkQe4d3TqZpEmxTvBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782896802; c=relaxed/simple;
	bh=9j2HfF87mlL8vSz5gvFZPu0SkwteG9SqXSUsF5Hcka8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XnRsxhfTrsv1+HkrpFkJ2ofIyhlBe/sSHtFo8HKzYzi3EjlyiTTnYg6ZkbeRCo8E7m4yLWJbYUT/d78MAeOytPBN3u6ivT2b7BHHk9TtDsSfxBadbatQnPI0eqel/dTJZlu4g+LdWqy35zaYH1FolYc5DZh6OsIBHG+mA3QeMSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=w6cvLzi+; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=lPAiLglz; arc=none smtp.client-ip=202.12.124.148
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id 710551D000E2;
	Wed,  1 Jul 2026 05:06:35 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Wed, 01 Jul 2026 05:06:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1782896795;
	 x=1782983195; bh=XDTvEllEPWVm/gik++JXvpL1mzDo8DBqUmXiYi8jEho=; b=
	w6cvLzi+kBFX4EOBth6XklCSqofHLRdphTG5rd5W440Tre4H8oLn6V6b4HSFfRUZ
	lfnpwTR1SgyMY5u6UgUcLtnGFnBDxEcNf/XWQA3B1C9FoTE60jn0SH8t6xlCGpiB
	QmkPPuPbKHqWHakhCI79s2sTwLoPPrdzevI0JqHgINPcryC/iuRUZHEkSLZJU1fZ
	9NYMACY2kFw5KYhYDT2G547QxCUctqIJrd3PoID114lJiF2F2G084NxZBhisJelh
	NUqO2qGpEB249xq5yaz4EhFTYDpM+nSxKGgpONkhxkliCEWRKsuC7p6W5Q+8FD2m
	yU4edwna+qMR5nPtAp5iBw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1782896795; x=
	1782983195; bh=XDTvEllEPWVm/gik++JXvpL1mzDo8DBqUmXiYi8jEho=; b=l
	PAiLglz+1EBGWM8F9A3Ltb4wyjJffFxfWIhOOp1xHgBgDpocOdWaXui1dgb/OvoC
	xL0ZrrMUGwoFOE3ptkI31uiyu5qVc1+yOSBT9FrP2wSurq3LlFPRwlrMu/x2p0xA
	yGCDiii4o04e0AuTH4rO2gDhF45oSSRrNGC4cGXxRQEF9jU2BTwxfmkLdiO3ke/6
	vuA92N8A0aKKf2PFuT5qbkFx1uGlBKHGLJdFo+JCBJQofDc5oUBBzoLkELHL8CPc
	Yb6no+3cZYUc6/NY5858q6t2EPHQrmzBBM245jv9Unav1Q8y8XlKV0u5J/pgIE9P
	+R+WxwBa4AE1ZH9jX0mpw==
X-ME-Sender: <xms:m9hEahUexYpRDJS3ELM4Mv2wclL29qgbtC5oHnaVf9oZliDMamG8fg>
    <xme:m9hEagHr1v-xlzKOo-Huvh332Ak618fsHjcm1JC2jYI84m6PpYzEqEDNcsh7XM1my
    wOsEvl7O3wLpJcDeKfC8SIwNAwkDLtXFuuPU-Qe3dwKZFdA3s8Yoxw>
X-ME-Received: <xmr:m9hEakMRjf70EPxY-PS8ii2_yqLlRto99cB8EITsWhVwFG1Ye2ZRpXKHI81Vdh5hH_RUh_sH52TctqGa82eWBEgH8HUEs3g>
X-ME-Proxy-Cause: dmFkZTGLViesrOAS/qMDczJ1Cu5DJWxKFKIHccNraeZqPY+BBYuwLrma+1q7wt1BWlIrwv
    CBv3Xvjlfdj8iC4dzhKZUEw634yO8CVvaYs6bycJCs4+LqKHIl/H4ye7rh+H0JwHavwjE6
    zW2dxlyGJ8SE8FCXjd6WSHWtX4NryA8aSO57sQ0Z8tv+3M79xAktad9ZIMUs6ipUnrGMYu
    0p12Lzp6tZy6TzzKkxmmr2wztjP7EQO6aHy2qYqwXEqeK3AX1zsykviQb+GpDMf3ORCTK7
    61dM2NLJ1OwiKBtHYz/x9tbwUj7yMKd9K3w2rZWz6EYaqRY4vF9bDqSULPPX7aM4B7JmpZ
    W3LeQF1mN7mcciqXYOns3cgeHy4/9DWoxNvb2P56WAevEnQxkNb0jPlrgQDUF53EQ6geKi
    RhLAqgEAQRRDaE00sVnaa8HNShku/UdYdzM4WMQWpixQc8kkUEa2HBbFvWO9YZabNWwwI5
    ULfSkepQlWiVvEPd0vLn7WORQ+/nOkKu3+ZfUtEvvAcCGyicrBVZ6DL5+e1AYtyi7DGxgf
    glySJbAjEFKh2k7hXLWeQalszp3QT1db5GIUQvd0FtpQtBIn0b+LVm7xvXyujdvDOTZRC5
    pwn9LhkqaTKmB5xXE2CKPn44OM04TNyptEubpuSIGWwVCTx4tfeEs9Z7glMA
X-ME-Proxy: <xmx:m9hEakXXvPTQ9WWfyg8vfytAu3hKaH7EbQcPwaqUnvAUc6ip9BI0lQ>
    <xmx:m9hEajzkavdjgmBf1bHkom3vcsbSxj_R7SIEatDl8MyNqPbyLweuqA>
    <xmx:m9hEasOTGQ0Tfw1J7LYohNdIu9CJcdMHN5iZ6g-fyC5xgN3MulA5VQ>
    <xmx:m9hEatohFr_imkjocg42mF2VVhDZpQQVcIe6IUXC-AO65eNxQp5QXQ>
    <xmx:m9hEageH0A3n_38swsSYuXAFymsIaWtSXliVSnfYtouUEwla_m9mH-Wf>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 1 Jul 2026 05:06:34 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"DavidS. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH net-next v3 2/3] ptp: Add driver for R-Car Gen4
Date: Wed,  1 Jul 2026 11:06:06 +0200
Message-ID: <20260701090607.1108208-3-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260701090607.1108208-1-niklas.soderlund+renesas@ragnatech.se>
References: <20260701090607.1108208-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ragnatech.se,none];
	R_DKIM_ALLOW(-0.20)[ragnatech.se:s=fm1,messagingengine.com:s=fm1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-34583-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,glider.be,gmail.com,lunn.ch,davemloft.net,google.com,redhat.com,vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:richardcochran@gmail.com,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:netdev@vger.kernel.org,m:niklas.soderlund+renesas@ragnatech.se,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,m:andrew@lunn.ch,m:niklas.soderlund@ragnatech.se,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[niklas.soderlund@ragnatech.se,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[niklas.soderlund@ragnatech.se,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[ragnatech.se:+,messagingengine.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[messagingengine.com:dkim,vger.kernel.org:from_smtp,mailbox.org:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,ragnatech.se:dkim,ragnatech.se:email,ragnatech.se:mid,ragnatech.se:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 09BF96EB73B

Add driver for the gPTP timer found on R-Car Gen4 devices. The timer is
system-wide and shared by different Ethernet devices on each Gen4
platform. The operation of the timer is however not completely in
depended of the systems Ethernet devices.

  - On R-Car S4 is gated by the RSWITCH Ethernet module clock.

  - On R-Car V4H is gated by the RTSN Ethernet module clock.

  - On R-Car V4M is gated by its own module clock, the system have
    neither RTSN or RSWITCH device. But the module clock is the same as
    RTSN on V4H and the documentation referees to it as tsn (EtherTSN).

The gPTP device do have its own register space on all three platforms.
But on S4 and V4H it will share its clock and reset property with
RSWITCH or RTSN, respectively.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 MAINTAINERS                 |   1 +
 drivers/ptp/Kconfig         |  12 ++
 drivers/ptp/Makefile        |   1 +
 drivers/ptp/ptp_rcar_gen4.c | 219 ++++++++++++++++++++++++++++++++++++
 4 files changed, 233 insertions(+)
 create mode 100644 drivers/ptp/ptp_rcar_gen4.c

diff --git a/MAINTAINERS b/MAINTAINERS
index ef17128d6f3f..4a387623409b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22906,6 +22906,7 @@ M:	Niklas Söderlund <niklas.soderlund@ragnatech.se>
 L:	linux-renesas-soc@vger.kernel.org
 S:	Supported
 F:	Documentation/devicetree/bindings/ptp/renesas,rcar-gen4-gptp.yaml
+F:	drivers/ptp/ptp_rcar_gen4.c
 
 RENESAS R-CAR GYROADC DRIVER
 M:	Marek Vasut <marek.vasut+renesas@mailbox.org>
diff --git a/drivers/ptp/Kconfig b/drivers/ptp/Kconfig
index b93640ca08b7..3593fd9da92a 100644
--- a/drivers/ptp/Kconfig
+++ b/drivers/ptp/Kconfig
@@ -263,4 +263,16 @@ config PTP_NETC_V4_TIMER
 	  synchronization. It also supports periodic output signal (e.g. PPS)
 	  and external trigger timestamping.
 
+config PTP_RCAR_GEN4
+	tristate "Renesas R-Car Gen4 PTP Driver"
+	depends on ARCH_RENESAS || COMPILE_TEST
+	depends on PTP_1588_CLOCK
+	help
+	  This driver adds support for using the Renesas R-Car Gen4 gPTP timer
+	  as a PTP clock, the clock can then be used by Gen4 Ethernet drivers
+	  for PTP time synchronization.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called ptp_rcar_gen4.
+
 endmenu
diff --git a/drivers/ptp/Makefile b/drivers/ptp/Makefile
index bdc47e284f14..0464a586bed2 100644
--- a/drivers/ptp/Makefile
+++ b/drivers/ptp/Makefile
@@ -22,3 +22,4 @@ obj-$(CONFIG_PTP_1588_CLOCK_OCP)	+= ptp_ocp.o
 obj-$(CONFIG_PTP_DFL_TOD)		+= ptp_dfl_tod.o
 obj-$(CONFIG_PTP_S390)			+= ptp_s390.o
 obj-$(CONFIG_PTP_NETC_V4_TIMER)		+= ptp_netc.o
+obj-$(CONFIG_PTP_RCAR_GEN4)		+= ptp_rcar_gen4.o
diff --git a/drivers/ptp/ptp_rcar_gen4.c b/drivers/ptp/ptp_rcar_gen4.c
new file mode 100644
index 000000000000..ab0be2431be8
--- /dev/null
+++ b/drivers/ptp/ptp_rcar_gen4.c
@@ -0,0 +1,219 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Renesas R-Car Gen4 gPTP device driver
+ *
+ * Copyright (C) 2026 Renesas Electronics Corporation
+ * Copyright (C) 2026 Niklas Söderlund <niklas.soderlund@ragnatech.se>
+ */
+
+#include <linux/clk.h>
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/ptp_clock_kernel.h>
+#include <linux/types.h>
+
+#define PTPTMEC_REG		0x0010
+#define PTPTMDC_REG		0x0014
+#define PTPTIVC0_REG		0x0020
+#define PTPTOVC00_REG		0x0030
+#define PTPTOVC10_REG		0x0034
+#define PTPTOVC20_REG		0x0038
+#define PTPGPTPTM00_REG		0x0050
+#define PTPGPTPTM10_REG		0x0054
+#define PTPGPTPTM20_REG		0x0058
+
+struct ptp_rcar_gen4_priv {
+	void __iomem *base;
+	struct clk *clk;
+
+	struct ptp_clock *clock;
+	struct ptp_clock_info info;
+
+	spinlock_t lock;	/* Registers access. */
+	s64 default_addend;
+};
+
+#define ptp_to_priv(ptp) container_of(ptp, struct ptp_rcar_gen4_priv, info)
+
+static int ptp_rcar_gen4_adjfine(struct ptp_clock_info *ptp, long scaled_ppm)
+{
+	struct ptp_rcar_gen4_priv *priv = ptp_to_priv(ptp);
+	s64 addend = priv->default_addend;
+	bool neg_adj = scaled_ppm < 0;
+	unsigned long flags;
+	s64 diff;
+
+	if (neg_adj)
+		scaled_ppm = -scaled_ppm;
+	diff = div_s64(addend * scaled_ppm_to_ppb(scaled_ppm), NSEC_PER_SEC);
+	addend = neg_adj ? addend - diff : addend + diff;
+
+	spin_lock_irqsave(&priv->lock, flags);
+	iowrite32(addend, priv->base + PTPTIVC0_REG);
+	spin_unlock_irqrestore(&priv->lock, flags);
+
+	return 0;
+}
+
+static void _ptp_rcar_gen4_gettime(struct ptp_clock_info *ptp,
+				   struct timespec64 *ts)
+{
+	struct ptp_rcar_gen4_priv *priv = ptp_to_priv(ptp);
+
+	lockdep_assert_held(&priv->lock);
+
+	ts->tv_nsec = ioread32(priv->base + PTPGPTPTM00_REG);
+	ts->tv_sec = ioread32(priv->base + PTPGPTPTM10_REG) |
+		((s64)ioread32(priv->base + PTPGPTPTM20_REG) << 32);
+}
+
+static int ptp_rcar_gen4_gettime(struct ptp_clock_info *ptp,
+				 struct timespec64 *ts)
+{
+	struct ptp_rcar_gen4_priv *priv = ptp_to_priv(ptp);
+	unsigned long flags;
+
+	spin_lock_irqsave(&priv->lock, flags);
+	_ptp_rcar_gen4_gettime(ptp, ts);
+	spin_unlock_irqrestore(&priv->lock, flags);
+
+	return 0;
+}
+
+static void _ptp_rcar_gen4_settime(struct ptp_clock_info *ptp,
+				   const struct timespec64 *ts)
+{
+	struct ptp_rcar_gen4_priv *priv = ptp_to_priv(ptp);
+
+	lockdep_assert_held(&priv->lock);
+
+	iowrite32(1, priv->base + PTPTMDC_REG);
+	iowrite32(0, priv->base + PTPTOVC20_REG);
+	iowrite32(0, priv->base + PTPTOVC10_REG);
+	iowrite32(0, priv->base + PTPTOVC00_REG);
+	iowrite32(1, priv->base + PTPTMEC_REG);
+	iowrite32(ts->tv_sec >> 32, priv->base + PTPTOVC20_REG);
+	iowrite32(ts->tv_sec, priv->base + PTPTOVC10_REG);
+	iowrite32(ts->tv_nsec, priv->base + PTPTOVC00_REG);
+}
+
+static int ptp_rcar_gen4_settime(struct ptp_clock_info *ptp,
+				 const struct timespec64 *ts)
+{
+	struct ptp_rcar_gen4_priv *priv = ptp_to_priv(ptp);
+	unsigned long flags;
+
+	spin_lock_irqsave(&priv->lock, flags);
+	_ptp_rcar_gen4_settime(ptp, ts);
+	spin_unlock_irqrestore(&priv->lock, flags);
+
+	return 0;
+}
+
+static int ptp_rcar_gen4_adjtime(struct ptp_clock_info *ptp, s64 delta)
+{
+	struct ptp_rcar_gen4_priv *priv = ptp_to_priv(ptp);
+	struct timespec64 ts;
+	unsigned long flags;
+	s64 now;
+
+	spin_lock_irqsave(&priv->lock, flags);
+	_ptp_rcar_gen4_gettime(ptp, &ts);
+	now = ktime_to_ns(timespec64_to_ktime(ts));
+	ts = ns_to_timespec64(now + delta);
+	_ptp_rcar_gen4_settime(ptp, &ts);
+	spin_unlock_irqrestore(&priv->lock, flags);
+
+	return 0;
+}
+
+static struct ptp_clock_info ptp_rcar_gen4_info = {
+	.owner = THIS_MODULE,
+	.name = "R-Car Gen4 gPTP",
+	.max_adj = 50000000,
+	.adjfine = ptp_rcar_gen4_adjfine,
+	.adjtime = ptp_rcar_gen4_adjtime,
+	.gettime64 = ptp_rcar_gen4_gettime,
+	.settime64 = ptp_rcar_gen4_settime,
+};
+
+static int ptp_rcar_gen4_probe(struct platform_device *pdev)
+{
+	struct ptp_rcar_gen4_priv *priv;
+	struct device *dev = &pdev->dev;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, priv);
+
+	priv->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(priv->base))
+		return PTR_ERR(priv->base);
+
+	priv->clk = devm_clk_get(dev, NULL);
+	if (IS_ERR(priv->clk))
+		return PTR_ERR(priv->clk);
+
+	spin_lock_init(&priv->lock);
+
+	priv->info = ptp_rcar_gen4_info;
+
+	/* Default timer increment in ns.
+	 * bit[31:27] - integer
+	 * bit[26:0]  - decimal
+	 * increment[ns] = perid[ns] * 2^27 => (1ns * 2^27) / rate[hz]
+	 */
+	priv->default_addend =
+		div_s64(1000000000LL << 27, clk_get_rate(priv->clk));
+
+	pm_runtime_enable(dev);
+	pm_runtime_get_sync(dev);
+
+	iowrite32(priv->default_addend, priv->base + PTPTIVC0_REG);
+
+	priv->clock = ptp_clock_register(&priv->info, dev);
+	if (IS_ERR(priv->clock))
+		return PTR_ERR(priv->clock);
+
+	iowrite32(1, priv->base + PTPTMEC_REG);
+
+	return 0;
+}
+
+static void ptp_rcar_gen4_remove(struct platform_device *pdev)
+{
+	struct ptp_rcar_gen4_priv *priv = platform_get_drvdata(pdev);
+	struct device *dev = &pdev->dev;
+
+	ptp_clock_unregister(priv->clock);
+
+	iowrite32(1, priv->base + PTPTMDC_REG);
+
+	pm_runtime_put_sync(dev);
+	pm_runtime_disable(dev);
+}
+
+static const struct of_device_id ptp_rcar_gen4_of_match[] = {
+	{ .compatible = "renesas,rcar-gen4-gptp", },
+	{ /* Sentinel */ },
+};
+MODULE_DEVICE_TABLE(of, ptp_rcar_gen4_of_match);
+
+static struct platform_driver ptp_rcar_gen4_driver = {
+	.driver = {
+		.name = "ptp-rcar-gen4",
+		.of_match_table = ptp_rcar_gen4_of_match,
+	},
+	.probe    = ptp_rcar_gen4_probe,
+	.remove   = ptp_rcar_gen4_remove,
+};
+module_platform_driver(ptp_rcar_gen4_driver);
+
+MODULE_AUTHOR("Niklas Söderlund");
+MODULE_DESCRIPTION("Renesas R-Car Gen4 gPTP driver");
+MODULE_LICENSE("GPL");
-- 
2.55.0


