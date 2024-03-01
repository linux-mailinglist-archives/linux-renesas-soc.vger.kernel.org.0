Return-Path: <linux-renesas-soc+bounces-3388-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8479386E85A
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Mar 2024 19:25:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3DD4F284F4E
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Mar 2024 18:25:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E6C92943F;
	Fri,  1 Mar 2024 18:23:59 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from andre.telenet-ops.be (andre.telenet-ops.be [195.130.132.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83E6425622
	for <linux-renesas-soc@vger.kernel.org>; Fri,  1 Mar 2024 18:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709317439; cv=none; b=F19q/henguDvQj8jaXJCZS+0o/Acx3VTElkK7USiMaX8aEzN+3kLpHsUVgfZfCdvIk1BUUj0qNji3mTHYHJHn4ROu7sAi99ZJm6JpvnYyMMvCJl8h1lGmn9gXS+GiDybXyezJw8bLCSKVgWgtA46sOX4FH+luqzPmtf8RfU5V/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709317439; c=relaxed/simple;
	bh=bmwPRgDlfJslVOGxU6L3xDunk3J/J+bYcnJTBGOUmaQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=Vjn1aM8JCI37GdN0LJqiC6UqSp/7YoWGbo5Y5OpcN0DB1rRK7R2PAwCR48szIKeSr/S225ALgGE3PJxCpzcXOKFEaj7pG9cHk+NywoWoOLan+chYr1bNO5BnVbO/XmMiG+bLX5xGDcCa9tJTWPiipd8gRqxNpitylN/hGq/GIIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:db22:6af9:7d18:6ee8])
	by andre.telenet-ops.be with bizsmtp
	id tWPn2B00H1TWuYv01WPoRr; Fri, 01 Mar 2024 19:23:48 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rg7Xl-0024Pj-14;
	Fri, 01 Mar 2024 19:23:47 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rg7Xv-00BnmX-Qd;
	Fri, 01 Mar 2024 19:23:47 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] pmdomain: renesas: rcar-gen4-sysc: Reduce atomic delays
Date: Fri,  1 Mar 2024 19:23:45 +0100
Message-Id: <77f150522096d55c6da0ff983db61e0cf6309344.1709317289.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The delays used with the various atomic polling loops are already at the
maximum value of ~10µs, as documented for read_poll_timeout_atomic().
Hence reduce the delays from 10 to 1 µs.  Increase PDRESR_RETRIES
accordingly, to retain the old (generous) timeout value.

Measurements on R-Car V3U, S4, V4H, and V4M show that the first three
polling loops rarely (never?) loop, so the actual delay does not matter.
The fourth loop (for SYSCISCR in rcar_gen4_sysc_power()) typically ran
for one or two cycles with the old delay.  With the reduced delay, it
typically runs for two to 17 cycles, and finishes earlier than before,
which can reduce loop time up to a factor of three.

While at it, rename the SYSCISR_{TIMEOUT,DELAY_US} definitions to
SYSCISCR_{TIMEOUT,DELAY_US}, to match the register name they apply to.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pmdomain/renesas/rcar-gen4-sysc.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/pmdomain/renesas/rcar-gen4-sysc.c b/drivers/pmdomain/renesas/rcar-gen4-sysc.c
index 728248659a97e8cc..66409cff2083fcd8 100644
--- a/drivers/pmdomain/renesas/rcar-gen4-sysc.c
+++ b/drivers/pmdomain/renesas/rcar-gen4-sysc.c
@@ -50,13 +50,13 @@
 #define SYSCSR_BUSY		GENMASK(1, 0)	/* All bit sets is not busy */
 
 #define SYSCSR_TIMEOUT		10000
-#define SYSCSR_DELAY_US		10
+#define SYSCSR_DELAY_US		1
 
-#define PDRESR_RETRIES		1000
-#define PDRESR_DELAY_US		10
+#define PDRESR_RETRIES		10000
+#define PDRESR_DELAY_US		1
 
-#define SYSCISR_TIMEOUT		10000
-#define SYSCISR_DELAY_US	10
+#define SYSCISCR_TIMEOUT	10000
+#define SYSCISCR_DELAY_US	1
 
 #define RCAR_GEN4_PD_ALWAYS_ON	64
 #define NUM_DOMAINS_EACH_REG	BITS_PER_TYPE(u32)
@@ -97,7 +97,7 @@ static int clear_irq_flags(unsigned int reg_idx, unsigned int isr_mask)
 
 	ret = readl_poll_timeout_atomic(rcar_gen4_sysc_base + SYSCISCR(reg_idx),
 					val, !(val & isr_mask),
-					SYSCISR_DELAY_US, SYSCISR_TIMEOUT);
+					SYSCISCR_DELAY_US, SYSCISCR_TIMEOUT);
 	if (ret < 0) {
 		pr_err("\n %s : Can not clear IRQ flags in SYSCISCR", __func__);
 		return -EIO;
@@ -157,7 +157,7 @@ static int rcar_gen4_sysc_power(u8 pdr, bool on)
 	/* Wait until the power shutoff or resume request has completed * */
 	ret = readl_poll_timeout_atomic(rcar_gen4_sysc_base + SYSCISCR(reg_idx),
 					val, (val & isr_mask),
-					SYSCISR_DELAY_US, SYSCISR_TIMEOUT);
+					SYSCISCR_DELAY_US, SYSCISCR_TIMEOUT);
 	if (ret < 0) {
 		ret = -EIO;
 		goto out;
-- 
2.34.1


