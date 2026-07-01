Return-Path: <linux-renesas-soc+bounces-34612-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id oREQIRkmRWpY7woAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34612-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Jul 2026 16:37:13 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D43826EED52
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Jul 2026 16:37:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Eu7Ho0fj;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34612-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34612-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D2FE23016505
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Jul 2026 14:30:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44C23349CEF;
	Wed,  1 Jul 2026 14:30:13 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81933348C5A
	for <linux-renesas-soc@vger.kernel.org>; Wed,  1 Jul 2026 14:30:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782916213; cv=none; b=Df3F+uYuRFHnoXK3JhYHE30wsKOpJTLDmB1yL+66RKNZKSKzEUqaYh1SXSjz/a3IPf7Vik0y+Z/aHHfCQbV+VZlX4CXknnT0rvhiNzg80YOE+jAipBt6fKPKOZ9iv4isn5kdyG8CbhzKXgAsEWg3GxEHhbaJolXDsvGHE19azFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782916213; c=relaxed/simple;
	bh=mWMP/xdPSFDaOWdYX4G9vsqs+NvHwtQ1rzsSePjmtQk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MWEhsfvyfKE/q68cbWpOvoMn9cqbkP78tzI9wv8psEuTx1s1+9swOCV5bqldic31QDMva8PMNnt0fthEhYORH/WWpNkGUakk1SYKNfNSXnJ9rRzqm6Rm+49WGH6iifpG8yDu42DIvZkBATSOzd/ribo4WS02gesmlNFNcFlnsJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Eu7Ho0fj; arc=none smtp.client-ip=209.85.221.45
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4763b0c1dcdso838984f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 01 Jul 2026 07:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782916210; x=1783521010; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o+UunQnZVp8S6m9pUrNYyzpfVfChMooAV6SEFAVDXiA=;
        b=Eu7Ho0fjbcZZyBGocFM8zMB8Mtf+0YojHIgkw/ZDlPQVOB6jHNOiBjTMryVtO5ZznP
         P7AuAY57GTS96/dDZpvQ3Hz8SxoqDRqCkTdv8vpPcenM3NuOb3z9L/X0iBm9+8Oq3lGG
         Wczu7oP8hK22QqXOpIwoEugVCZB6AwmWXPbBOpTW4PYIeJuP0drmnLe2ul8Tiqt+jxHa
         KiA5eLJuVyD0ZhICiNwKLKiYyr0U8WZsDmmMHAOkcRjUXKNlWYnhA23kudzNdGE23RVp
         n+igv/75C23V/PUvOveSuswLD+5tbOy45mxHk5+VNGj+RDJaB7AtluDlXPOSB3NRbhjo
         2jMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782916210; x=1783521010;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=o+UunQnZVp8S6m9pUrNYyzpfVfChMooAV6SEFAVDXiA=;
        b=pgaNx3zzP1boXrA90u6DUP07JUdL1EtgZFXXoCTiX+PoAd4qG9shfuaIKgVFtzJpqP
         5owtFft1WgWiZjcDWo8RQ4FNKFfcnYRgohw2B9bEKvn3XaCJi5audlIlWSK9OBhIfPau
         EcV/BkTrazfqRQVQd+xUHSdSgxMlzKl60uHfG7D/xhUMQlq7EKafNWpmISW/wj3lAJwR
         iVGibTr9m1tDeWha/e/7WqSIBNJ/g8fdAMUnTJ0LQ13KOH07J/1/k4AMeGHrTWO6gphn
         R4rKLyE/X6GHKPxFJ3DMpGQpY0OjJ+Hh2Sc4UUe5reHkt9Mq1th+Og0C2vYAs0OC59gw
         nNNQ==
X-Forwarded-Encrypted: i=1; AHgh+RoT8S8Owtlventw0y65E1egRaAq0kmQrjMM0q1QXrDsvFrekq+kIqfVjlUYEC8c9al1aPg/+8x4T6NSg2Y/5ERpjA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxghB970avEeN2MVYaReJXuhsUfvQ1LvWsiX0HKrVbC9wOlIO/k
	qTwA+P37Tnyczaq93xh/0RHJTMJfj5x+/miaF6g6VWFEEMlKxvHGEgEzvThg5SC/
X-Gm-Gg: AfdE7cmbE+dFOOvYk/Hu4v0mNN7cB5rWZ2gfJ3voM2w8K+YnNbwQ2iPWMh9Pg3GefaF
	IhFPvzpJpsaS9Iigns3wmhZ/mssrryiQasiI5GBTPGx4A+o/NpYs+ihT/iuFjpRUXbADCvxLgJ2
	u4ZfgnigUVDWKk1Ug/prA43ar2OcPeDxOp/X6CAMLebFCRHyttytwKjFN0VedDpbsMYpitePYtE
	i/b6PMEk8kgDlLmRPvI0NL9+LtQ8tz5LVcAJ0b+7U4hgzvyuGRI+8F6lZtoSzUzpW9hTNlpQbER
	VjJ2Eeb17QOa3Kh9u32KVBzASO8vCcqpPqUNBIA/0OX2fm/r3+t+XT5AOrPEmYAKk3dyYtXeOBQ
	HVOHiAKhcZCxL4Vq5vHvuAb3Hxcb4W2p5GfnRpjY1uCzzzg2x1LrvSmJreEOBJW54eRGoLv/Rzi
	4eNXuBIGblTqdlFARcmo4BldeWui+AFUBAyG7YJzJWY5N0X8nGUE10QIrWVLY65cujwMUo5vvTD
	yWPaPoZ96JVaFcukqNjPq5H3fU=
X-Received: by 2002:a5d:60c3:0:b0:472:d154:facf with SMTP id ffacd0b85a97d-477b5677a8dmr1049369f8f.42.1782916209676;
        Wed, 01 Jul 2026 07:30:09 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:5353:5ce3:a6a2:3b98])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477dd94c829sm184902f8f.24.2026.07.01.07.30.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 07:30:08 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-rtc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 05/10] rtc: rzn1: Fix alarm range check truncation on 32-bit systems
Date: Wed,  1 Jul 2026 15:29:48 +0100
Message-ID: <20260701142953.2014895-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260701142953.2014895-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260701142953.2014895-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34612-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:miquel.raynal@bootlin.com,m:alexandre.belloni@bootlin.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:wsa+renesas@sang-engineering.com,m:linux-rtc@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:prabhakar.csengg+renesas@gmail.com,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,m:wsa@sang-engineering.com,m:prabhakarcsengg@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[bootlin.com,kernel.org,glider.be,gmail.com,sang-engineering.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,renesas.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D43826EED52

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

alarm and farest were declared as unsigned long, but
rtc_tm_to_time64() returns time64_t (s64). On 32-bit systems where
unsigned long is 32 bits, the assignment silently truncates the upper
32 bits of the timestamp.

Fix by declaring alarm and farest as time64_t and replacing
time_after() with a direct signed comparison, which is correct for
time64_t values that will never realistically overflow.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v1->v2:
- Added Reviewed-by tag.
---
 drivers/rtc/rtc-rzn1.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c
index d56be7314a91..a82f2d7f7a2f 100644
--- a/drivers/rtc/rtc-rzn1.c
+++ b/drivers/rtc/rtc-rzn1.c
@@ -20,6 +20,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/rtc.h>
 #include <linux/spinlock.h>
+#include <linux/time64.h>
 
 #define RZN1_RTC_CTL0 0x00
 #define   RZN1_RTC_CTL0_SLSB_SCMP BIT(4)
@@ -259,8 +260,8 @@ static int rzn1_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
 {
 	struct rzn1_rtc *rtc = dev_get_drvdata(dev);
 	struct rtc_time *tm = &alrm->time, tm_now;
-	unsigned long alarm, farest;
 	unsigned int days_ahead, wday;
+	time64_t alarm, farest;
 	int ret;
 
 	ret = rzn1_rtc_read_time(dev, &tm_now);
@@ -270,7 +271,7 @@ static int rzn1_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
 	/* We cannot set alarms more than one week ahead */
 	farest = rtc_tm_to_time64(&tm_now) + rtc->rtcdev->alarm_offset_max;
 	alarm = rtc_tm_to_time64(tm);
-	if (time_after(alarm, farest))
+	if (alarm > farest)
 		return -ERANGE;
 
 	/* Convert alarm day into week day */
-- 
2.54.0


