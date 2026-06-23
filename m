Return-Path: <linux-renesas-soc+bounces-34371-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SZAVBbmQOmr0AAgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34371-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Jun 2026 15:57:13 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 631896B7AA6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Jun 2026 15:57:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34371-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34371-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8ED5B3059336
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Jun 2026 13:54:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53CC637E30F;
	Tue, 23 Jun 2026 13:54:44 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1588237C119;
	Tue, 23 Jun 2026 13:54:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782222884; cv=none; b=kuVhmh0m4PH5VpVQP+ObsFlbKjWq6winXXdwo3de0oWhUMbW1Qgr7DqwXWraff5If6PcK5PZ1/HdCR420fbhl7z5lA6Tc8rSeVEhdiwLtR6F/vKv/5qaa7adh6MABn2J+5DLH4V1cgx0wVjvV4QQwltjC4bVgkx2xD+0V4rGaU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782222884; c=relaxed/simple;
	bh=b1YDX8YbvwUW+4wYX4y+rGL39S6KFxAwLx+KgjJx6ZA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RNGwC6a3moWJyplVm4Qm3hRIW8Rlelg26IJ7bcMI9I0NJ7+RDw1Vc9ZrOO/NAYNa6DU+/7rNMs8ru2CPqzob2v8D5m1icV+Veorq63VVY/2AABY5Bbffdpjsjuitshofnzx6GaCfmt/A2RhV2knOJ1nuxc+qb2R0Wm4Ps/s37B4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.25
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-05 (Coremail) with SMTP id zQCowAA3nN8fkDpqxzDYFA--.5356S2;
	Tue, 23 Jun 2026 21:54:39 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Ulf Hansson <ulf.hansson@linaro.org>
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>,
	linux-renesas-soc@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] pmdomain: renesas: rmobile-sysc: propagate power-off timeout
Date: Tue, 23 Jun 2026 21:54:39 +0800
Message-ID: <20260623135439.44970-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowAA3nN8fkDpqxzDYFA--.5356S2
X-Coremail-Antispam: 1UD129KBjvJXoW7WF4UuFy5tr45GrWUtF13urg_yoW8WF4kpF
	4kCr1FyrW3AryDJF4UJF1UuF98GasFyFWxurWkGw4xZF93XF1DCFyrWaySqF1rWF1IqFyY
	yF43Aayrur1DuFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkG14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v26r12
	6r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI
	0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y
	0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1l
	IxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUhtxDUUU
	UU=
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-34371-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[iscas.ac.cn];
	FORGED_SENDER(0.00)[pengpeng@iscas.ac.cn,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:ulf.hansson@linaro.org,m:pengpeng@iscas.ac.cn,m:linux-renesas-soc@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[glider.be,gmail.com,linaro.org];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pengpeng@iscas.ac.cn,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,iscas.ac.cn:email,iscas.ac.cn:mid,iscas.ac.cn:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 631896B7AA6

rmobile_pd_power_down() writes SPDCR and polls for the power-down
request bit to clear, but drops the poll result. It can therefore return
success to genpd even if the controller did not acknowledge the
power-off request.

Return the poll timeout just like the matching power-on path already
does for SWUCR.

Fixes: a00d47f7645d ("soc: renesas: rmobile-sysc: Convert to readl_poll_timeout_atomic()")
Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 drivers/pmdomain/renesas/rmobile-sysc.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/pmdomain/renesas/rmobile-sysc.c b/drivers/pmdomain/renesas/rmobile-sysc.c
index 93103ff33..9abf60ea0 100644
--- a/drivers/pmdomain/renesas/rmobile-sysc.c
+++ b/drivers/pmdomain/renesas/rmobile-sysc.c
@@ -48,6 +48,7 @@ static int rmobile_pd_power_down(struct generic_pm_domain *genpd)
 	struct rmobile_pm_domain *rmobile_pd = to_rmobile_pd(genpd);
 	unsigned int mask = BIT(rmobile_pd->bit_shift);
 	u32 val;
+	int ret;
 
 	if (rmobile_pd->suspend) {
 		int ret = rmobile_pd->suspend();
@@ -59,8 +60,11 @@ static int rmobile_pd_power_down(struct generic_pm_domain *genpd)
 	if (readl(rmobile_pd->base + PSTR) & mask) {
 		writel(mask, rmobile_pd->base + SPDCR);
 
-		readl_poll_timeout_atomic(rmobile_pd->base + SPDCR, val,
-					  !(val & mask), 0, PSTR_RETRIES);
+		ret = readl_poll_timeout_atomic(rmobile_pd->base + SPDCR, val,
+						!(val & mask), 0,
+						PSTR_RETRIES);
+		if (ret)
+			return ret;
 	}
 
 	pr_debug("%s: Power off, 0x%08x -> PSTR = 0x%08x\n", genpd->name, mask,
-- 
2.50.1 (Apple Git-155)


