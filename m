Return-Path: <linux-renesas-soc+bounces-34657-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AubyDm9gRmqOSAsAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34657-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Jul 2026 14:58:23 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A70176F8029
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Jul 2026 14:58:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ragnatech.se header.s=fm1 header.b=ZbXqHusT;
	dkim=pass header.d=messagingengine.com header.s=fm2 header.b="i 1HNlAJ";
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34657-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34657-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ragnatech.se;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 571D030B7E06
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Jul 2026 12:56:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91658359A6B;
	Thu,  2 Jul 2026 12:56:05 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh-a2-smtp.messagingengine.com (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B18FF481FA2;
	Thu,  2 Jul 2026 12:56:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782996965; cv=none; b=dOpz6k5zXoExrq/HGK5dQ0U2XocfCw1QZQxYvf9PHUOFiehhM4lPn1zKnBd34cPVNP8Cmxfk1DqhC2i595QgjTFbK/1MVPYEka0uXPtCcJZw1RhO+DrfYFXh/5RHNiNHa/bg5pNi2g4+a6x+SojsCiToe72gRZiyZo8oclaeRmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782996965; c=relaxed/simple;
	bh=8B4x3L1UzXIZTxflEg75/iQ4qbn0BP3Xzrjv213Cnxs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tmNBssVhbgbCNh9/8f2tKoK6NfD4CE+XskBh+1ODyhTouBenMuO/D/es32JncWmDlsV0yhFm34LNDDOtKTiNZuOsSnSqMJiMXJOi8PNoeujQG4DeMZqPyUxAG6N3V/M8oufxFmYMGm4TJRLAmB2fOVgw78u6cZWHXFOYvZgUH78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=ZbXqHusT; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=i1HNlAJk; arc=none smtp.client-ip=103.168.172.153
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id DDEDC1400168;
	Thu,  2 Jul 2026 08:56:02 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Thu, 02 Jul 2026 08:56:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1782996962;
	 x=1783083362; bh=4eiBSKFR+qrdfoUrr986jdhFmHGg5dByzgVLAqfW1Jc=; b=
	ZbXqHusTJbjsfXIrouaIOBg9r7sEI67aBh0r6GDh210RwGfpNT/eBK8Len9drCaN
	MkuLp/6G4XonTR34zmJgCo0zroxifwsm54sG3ZcKGYZ2F5LqKPn1FrZhOwLYXxQH
	hXE1vRysoLWMSl+3NPny/Kf/e2CKTLWuT081iixrOVPS8eQyp+hawzhd4qlLnoPB
	+u+CWPzEaMD92dbOfTKG2YQa7iAHKOxyrZuoEq0EC87dJDqPeQ2buNZ7uGCfPKwR
	abr9YDwspXDkrRfyUbJkbSq3fXipRMNr/jXPi4UCfkKQ8EavqfxqOjC10bdZrnCg
	XNJRyrUF9M4KpwGzMg+XBA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1782996962; x=
	1783083362; bh=4eiBSKFR+qrdfoUrr986jdhFmHGg5dByzgVLAqfW1Jc=; b=i
	1HNlAJkaXWdfo9GiAhThOSXOV4eT1aO3LxlGhV44vTrWm1XmjFfcU4AT/99/MHRB
	QwsTAWii3/qtgFFsHSjFwNH2vm3y6KvajmwklqMe9gVgTTkCqTIIN4RkMBfb48uM
	zXzYGqxxgMzSmf+6js2Cia88QDwQOLdyya3JD+xH2J2yl/VmLlj16i/IozHcR7Q+
	CFKT0Duj4nJ+18l1Ia8Chpzd+u5b1PkjTGDnKpif4zBmou7V0j5uZyfwq9WA9tjj
	7Vnnie4zYQzIiMwKnvi+Q0X8o66HZonCce5YcGmnTQGXLsNd6MGLkvpmxCMU5A+T
	nj0AgWx8bzXzukKwW8DOw==
X-ME-Sender: <xms:4l9Gal0cotl0YDhtIF8ojwx25qVnPPprcOoRfAzHKuy1Ia-jeMfJmA>
    <xme:4l9Gaqnfw_qA84WscdNeYPBIU2mIGc79_eZaKLePQMCvOnwjdws-8Rg-BNQg-V4CB
    fyy6nd_xc_AoG6sv06KttZC4AmkMIucOVWY0wALbGFCUqQzXxrodqE>
X-ME-Received: <xmr:4l9GasssIPTQuvpPevv-npwoGZWiQXHy_Tx8z1kCYnup0mvQpiu2Gg2eRCUu_9Sca8jrQFEIskv8k8ORu53DN8sTpSko1I0>
X-ME-Proxy-Cause: dmFkZTG3gIAfSXpiwv/EJIM2mp95pG7D3rNBF/GBs94p5O9yL5PNO9sSU7oVW+xHvuDSER
    r6I4RwV4hMpmZyTAFcuUB7f2HFNIhxvMvI5orGEtHUbMoqFsibnLn9w/b2vpKaWox8YvSZ
    1iu3Stwc5k8oQKbyRSv27SbnySlVl4L+dcxhDR/knaXlEtj6ZloLeVpzzSn03kJsLU6+1a
    dV8UA77NabL4Vc20cREdiN55u1MESA3R+B9aBv4rhlAym9k7fn2MmEwd9BKw1rsJR9RQY3
    3CMXMyRDqnbsMqCb8cUdwpytBzhEmbU7tSYrEQKTj6nDUSjUt1R57Wbw24giuEaPWratAE
    xrdK43XOuJpQh0a277ZvWPlWe0gIVJKXDNY3TsaUjRx3J8jQVR16oxkuxUnk0t046XdzA7
    8xgKGckppq/KKeLLbbSwhuP1I3dH5VnwEKr9KIhMWVSk+saVVd5pNZFkA1X3+oW8xAfPRn
    XV0/E5hvi+Shx39mPSrDC77Axshv6302G/aUbgcNol+VjZiPSC8fbeehGGu6Gql/W4XYnG
    J6qw2P4ZOj3ATmV4qDsYQuNu/TumC7CLsuuq/B6UWEZGRqvYmx7eegelfjQPppPSCAplpZ
    ZYbz/UeKh9CoQPVv1QnPVXRafnj2xEQbgr/jHLg9kUGk/K8AEB3RPu6X6YbQ
X-ME-Proxy: <xmx:4l9Gai3AewCem5IZfn7OiIwbTiJe6AoXs8YzgZfPu1PMETBvlhDVoQ>
    <xmx:4l9GagR_1GJgEsCFpUDgmqh4NI5osfT4gXeryiAebNgNQz7Lnd6BLw>
    <xmx:4l9GausqgMpQ2DRUuC3sqDSmw-r-AOSydQiEwzemlblqmLTAMFd6PQ>
    <xmx:4l9GauJtcpi-Xd2s1e1ZrIk1NPH9KLefPYkQG0La-pSC1zsID-BDKQ>
    <xmx:4l9GajTBt01PtglnxKLaZP-JPa4Ty6CuoGOKFEWEcO75NVNabVx9D7TB>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 2 Jul 2026 08:56:02 -0400 (EDT)
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
Subject: [PATCH net-next v4 2/3] ptp: Add driver for R-Car Gen4
Date: Thu,  2 Jul 2026 14:55:24 +0200
Message-ID: <20260702125525.2230427-3-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260702125525.2230427-1-niklas.soderlund+renesas@ragnatech.se>
References: <20260702125525.2230427-1-niklas.soderlund+renesas@ragnatech.se>
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
	R_DKIM_ALLOW(-0.20)[ragnatech.se:s=fm1,messagingengine.com:s=fm2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-34657-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,glider.be,gmail.com,lunn.ch,davemloft.net,google.com,redhat.com,vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:richardcochran@gmail.com,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:netdev@vger.kernel.org,m:niklas.soderlund+renesas@ragnatech.se,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,m:andrew@lunn.ch,m:niklas.soderlund@ragnatech.se,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[niklas.soderlund@ragnatech.se,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[ragnatech.se:dkim,ragnatech.se:email,ragnatech.se:mid,ragnatech.se:from_mime,mailbox.org:email,vger.kernel.org:from_smtp,messagingengine.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A70176F8029

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
* Changes since v3
- Clamp increment calculated to register limitations.
- Check return value of clk_get_rate().
- Disable PM if ptp_clock_register() fails.
---
 MAINTAINERS                 |   1 +
 drivers/ptp/Kconfig         |  12 ++
 drivers/ptp/Makefile        |   1 +
 drivers/ptp/ptp_rcar_gen4.c | 232 ++++++++++++++++++++++++++++++++++++
 4 files changed, 246 insertions(+)
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
index 000000000000..0d862849cd4c
--- /dev/null
+++ b/drivers/ptp/ptp_rcar_gen4.c
@@ -0,0 +1,232 @@
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
+	/* Clamp value to register limits, defined as in nanoseconds.
+	 * bit[31:27] - integer
+	 * bit[26:0]  - decimal
+	 */
+	addend = clamp_val(addend, 0, UINT_MAX);
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
+	unsigned long rate;
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
+	rate = clk_get_rate(priv->clk);
+	if (!rate)
+		return -ENODEV;
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
+
+	priv->default_addend = div_s64(1000000000LL << 27, rate);
+
+	pm_runtime_enable(dev);
+	pm_runtime_get_sync(dev);
+
+	iowrite32(priv->default_addend, priv->base + PTPTIVC0_REG);
+	iowrite32(1, priv->base + PTPTMEC_REG);
+
+	priv->clock = ptp_clock_register(&priv->info, dev);
+	if (IS_ERR(priv->clock)) {
+		pm_runtime_put_sync(dev);
+		pm_runtime_disable(dev);
+		return PTR_ERR(priv->clock);
+	}
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


