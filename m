Return-Path: <linux-renesas-soc+bounces-34771-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id O2YSJ74ATGrxeQEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34771-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 06 Jul 2026 21:23:42 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E589B714EA4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 06 Jul 2026 21:23:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="Url2/NhP";
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34771-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34771-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4B5FE3411160
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Jul 2026 17:52:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DBF4422537;
	Mon,  6 Jul 2026 17:51:53 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D5643DF019
	for <linux-renesas-soc@vger.kernel.org>; Mon,  6 Jul 2026 17:51:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783360313; cv=none; b=K2evw4pOg7j6Du1NO3v/tBZhLrkf9fArM/d/VjcAOuW7YLEhpdUOh3POlXvCIQ++nc2uUku9e58plfOVXJ7M4fv6xDZ2etoh2GNTSLeKkTaywvUR2MVYRBAz8FLtjvGCGWaUHZIi9nEPgWY2ZkoseAyKABDD+uGrJU4l+wxfy40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783360313; c=relaxed/simple;
	bh=6Sjgo2jOp18Djngxf7/ipFFmJe+Fa9xcZITBuXHAxPA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UPM2ebkGPpJngYyBNJTSc6lMXmHA3AKBhhOTtNo69jS6TNN/DdXAcoOEzgoMkY7LWafPk7bNQOsiJp/W5fMmAsjTkyMrmDXM82te8Z5Iq7G/wAbnF1av0I2HFHgAsxKwPGkeW+Oxo+/VCN9ieKQYNt4cSGKIlhvwN1WWH4DE8ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Url2/NhP; arc=none smtp.client-ip=209.85.128.46
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-493ae59eca6so24202815e9.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 06 Jul 2026 10:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783360309; x=1783965109; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hh5vS2RRIIEr3rSaPu1c6fxxyM70bAInUDVodaYtikc=;
        b=Url2/NhP68+7Kzsx2oCp8bbxPPTL8huP0am5rnW1PinIcoL9qPAaJdXD+D/COx5LPX
         X88w85pnWB1AB8j6AmlRHZX859Dw5wzcST2gYKVhpcHJoM9ZxkdJqpffpFrVh2+z6r6F
         lyPoVwmgRrjBONsEvcjtF6WMiRDs9dedqucBQuC/vjaX0DFM4iVhaYn56UAB3lg11CZV
         2KbQTMNxH/ZmFAWM0H7p087aeL7FGl9JDOQvVbrTM+QzPcLTejeRxEKRkCzSLM23rHTy
         PBQlULSIyqi2M4IAygVBYYlAnvYGJc5gM3FRzdccKaFAz45nLVi//Q+yNRqDLSpeHN9U
         GkNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783360309; x=1783965109;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hh5vS2RRIIEr3rSaPu1c6fxxyM70bAInUDVodaYtikc=;
        b=Us2JynPgNauiIrne/fCL48df12ZjcXY1EzuFqbpbKiVEt6FuDPm7FeMGJ7N+rC5Ld0
         Jd/KrWgX8+KJrKfMkMWPg9XS6nhTMb6rIl3whN/aYmPWRihztX6NYgo1tNCwMPmQKadK
         Un+4OyOhcLatOVMVsrfMvQ8NiT9h02ptlSK1pKDr2mOvdz16TNj8W2Nl40QDzKaHMhIG
         MIMjmWLaY9Khb3GysAzw7NSdWCUO+taysOcXgazdiU0B7m0H3bHcSt6kMwUB48CWYDXI
         K5CZPVyPGoOONVpcHSKkhRxXnnDvXM43n0Fdg2b2PRTBzri8JZFZY7yGQgrCol6zEoVm
         f7tw==
X-Forwarded-Encrypted: i=1; AHgh+RoIs1lxFaplYQAfRhCSzmVcEwVN/B9VFa0f3vhaF+X9NEQqI6Xi9/k5DiLtcZR8X3iKl1MZwDdBcW8CKQoCPhoCBA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7GVJTLDcL56tDponmIq9cFdXF5a2lMRBouOMUFFLRma5mWGtA
	1IGVILj3zDnmOSFpnh7KpmVZ1wmvtqZNwpEYc+Y7lh+yh260+SgIk3St
X-Gm-Gg: AfdE7cmkBckS25Vk2Vp/M5S3jti6HWaSPbvf9yx06K4eJaOBku7kAiObHP3pk114bHO
	Ip4e3AqgM8Tvn5tdnJtrjma7oNtAywA28RB80qTGzuq476yPlAoE8w1As2d6+VhUgdA44FHh4uo
	zceU7aK/Eot9e2uvzy71eSjZ8tkltCMjLOkGTTGin9ocuER663uZzZ0R97p1SFk8uC8/bWMMU95
	Jh5i6PLR+VGDBw8hX6yJ8KBwPdgqWAFqoVGmF+O42lHr4yS5p98KRTsae36fA6qSJO1lVyKdC03
	xvhOaobnD1++4gzrgt7wsLXMdMjF/mIgFDLENY2UihE4CPWpP7wTGk2/+u4hB00CoJvxQcvHyi7
	Fsj1qFtdWFJG+znZh4TKeuWTA1APrtdUCcSdhJyW+w+j1onCEiSQlswoeS2hiLrqruc+EQynqD5
	I3DmCWDL6t1D9iwWHAqI/CQ+EIEZo0fAqgb4dekO0sVroLlE6knh+0PqFCJ4CpcszilaLhAslIJ
	WS+ElKFhDjyOay7anPIumSfHXzswQKthXrv/g==
X-Received: by 2002:a05:600c:698d:b0:493:a613:56b2 with SMTP id 5b1f17b1804b1-493df038708mr18885645e9.8.1783360309480;
        Mon, 06 Jul 2026 10:51:49 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:8e02:886d:c345:c5e2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0078d49sm1263145e9.0.2026.07.06.10.51.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 10:51:49 -0700 (PDT)
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
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	stable@vger.kernel.org
Subject: [PATCH v3 03/12] rtc: rzn1: fix weekday underflow when alarm crosses month boundary
Date: Mon,  6 Jul 2026 18:51:29 +0100
Message-ID: <20260706175138.12587-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260706175138.12587-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260706175138.12587-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34771-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:miquel.raynal@bootlin.com,m:alexandre.belloni@bootlin.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:wsa+renesas@sang-engineering.com,m:linux-rtc@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:prabhakar.csengg+renesas@gmail.com,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:stable@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,m:wsa@sang-engineering.com,m:prabhakarcsengg@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[bootlin.com,kernel.org,glider.be,gmail.com,sang-engineering.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,bp.renesas.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E589B714EA4

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

In rzn1_rtc_set_alarm(), the driver attempts to calculate the weekday
for an alarm by computing the day delta between the alarm time and the
current time:

    days_ahead = tm->tm_mday - tm_now.tm_mday;
    wday = (tm_now.tm_wday + days_ahead) % 7;

However, if an alarm is scheduled for the beginning of the next month
while the current time is at the end of the month (e.g., current day is
31, alarm day is 1), `tm->tm_mday - tm_now.tm_mday` results in a negative
value (-30). Since `days_ahead` is an unsigned int, this underflows to a
large positive number, leading to an incorrect `wday` being written to
the RZN1_RTC_ALW register. As a result, the alarm fails to fire.

Fix this by utilizing the already computed `alarm` time64_t timestamp.
Convert it back into an rtc_time struct via rtc_time64_to_tm(), which
automatically handles month boundaries and correctly populates the
`tm_wday` field.

Fixes: b5ad1bf00d2c4 ("rtc: rzn1: Add alarm support")
Cc: stable@vger.kernel.org
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v2->v3:
- New patch to fix weekday underflow when alarm crosses month boundary.
---
 drivers/rtc/rtc-rzn1.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c
index aa27ad7f5941..3c83f95c18c4 100644
--- a/drivers/rtc/rtc-rzn1.c
+++ b/drivers/rtc/rtc-rzn1.c
@@ -260,7 +260,8 @@ static int rzn1_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
 	struct rzn1_rtc *rtc = dev_get_drvdata(dev);
 	struct rtc_time *tm = &alrm->time, tm_now;
 	unsigned long alarm, farest;
-	unsigned int days_ahead, wday;
+	struct rtc_time alarm_tm;
+	unsigned int wday;
 	int ret;
 
 	ret = rzn1_rtc_read_time(dev, &tm_now);
@@ -274,8 +275,8 @@ static int rzn1_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
 		return -ERANGE;
 
 	/* Convert alarm day into week day */
-	days_ahead = tm->tm_mday - tm_now.tm_mday;
-	wday = (tm_now.tm_wday + days_ahead) % 7;
+	rtc_time64_to_tm(alarm, &alarm_tm);
+	wday = alarm_tm.tm_wday;
 
 	writel(bin2bcd(tm->tm_min), rtc->base + RZN1_RTC_ALM);
 	writel(bin2bcd(tm->tm_hour), rtc->base + RZN1_RTC_ALH);
-- 
2.54.0


