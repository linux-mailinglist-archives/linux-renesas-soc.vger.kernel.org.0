Return-Path: <linux-renesas-soc+bounces-32172-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OFRuHiNx+2m7bAMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32172-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 06 May 2026 18:49:39 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C4B64DE486
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 06 May 2026 18:49:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 75FCE3007B8A
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 May 2026 16:49:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FE1144D031;
	Wed,  6 May 2026 16:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iSxO92UI"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A028248BD2D
	for <linux-renesas-soc@vger.kernel.org>; Wed,  6 May 2026 16:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778086176; cv=none; b=UbZ5ToNDWbg+3h/wg0Y4V/9wWpAwZ0ZzIjcrDxE/JCIuNNvx1HZh0xYnnhthnOkQC84imjuKvZm6/RiR9lx+u7rDMKiXlNvuQ3AcccA3DC20rO0JYeJT3CzGH6L5Z2lqXK2P6sQtjc7j4yFxuu33IiNHhtNHNnAhheBoFqHrb/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778086176; c=relaxed/simple;
	bh=XbIcmfBPvdUsZgt8hYQuWguV5+dMEMnvfD1TFRjc7zA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BFu8uhJJqMmwbJwAk8+IOO0SNxQP2ZlLYjRmUP0wgU4srehphxBhQFMokfYH+dn1aEcJmX64j/CA2XcrOl/sk2ioiEWfKceoKP7O9XwSYXGbbrXJKTiX+IkMVGE43IkidqPnQ4hY9SevTUKs65eqGO5vL4ib3u3Q7V+64i6oVHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iSxO92UI; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-488e1a8ac40so65903725e9.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 06 May 2026 09:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778086162; x=1778690962; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H/baJx7mBsqKytKYQaKxdbG5hOnnWG1GzcGphYV5dXY=;
        b=iSxO92UI/pfpIBIpTJ9pEJUCdlNSyr0yOGYRhFT/a6aw3U3MeI+j6WsEzabt4mutsn
         pGxUvVLeFuNoziE+Y2xx7grQfRM8/fyyIJiRfTVfraS06toRB0xgx1EU1n0C7B3Ss6TZ
         fOXTaK/pKgUv2Eiv2x2HrO6rEVex71viiy+gNmK8sy0RtVzoUaRjbpVC6Gb7j4uYEH5z
         KSajT9+1fX1wrtWwEuxZ1oneybAvflnHUT1+g/1+ObW/rWaD2M9o5iUo33QlLDgY8xk9
         HoXAsm28mVZ6vwTfqU8TxcE1+AWbVGHdIhWDv/5p/Apt8svqEheAQspvcE19Pc4subeh
         dgdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778086162; x=1778690962;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=H/baJx7mBsqKytKYQaKxdbG5hOnnWG1GzcGphYV5dXY=;
        b=lYv/tYgDV0FIGxQI3ivqhoavw++URr5wZbazNEQ0Y23MgOO/YBMz6AHZAQgjcWIUB0
         P8akAfhlXlZRxc6KiEzlgnmIUsQhX9RRmLaVUntUpUWlted2Iihjk4jrWs85s/LvHSO9
         fqXhN4oTqPj4zFxiVomEAQG/CoTSYy4JkrWWrQ20baoMKFAfiJZXgoHADS8JJLUesD84
         z+JIMGLiIh86DQ76jDg4JF2TfOCBqMsD+htUqEqien8TQ6hX/FO101FBp3UTqlFWcmMr
         ru6c5JsjbipkR43UVsV95DuZUAYgnlTdHVt0IdM7uqrNTNEMw/18nYCCMHyCX7jUdXpg
         W9Ew==
X-Forwarded-Encrypted: i=1; AFNElJ+mZEnxB7F0ajnS6yCsiXwF6nGtd11xwLpedzgCprZtuuZXX37vP/w5WW/jp5oyM02eFz2to5XV5UVCYPAr7ckwVg==@vger.kernel.org
X-Gm-Message-State: AOJu0YywCcOAm+1LGm1DqUb0JGeU70pS3dRAh5aAtNJ29edJ1ClhfdsF
	/gf4mQOtw/dB8ERwgNEuCIUat/6RedgRbzdD9S9iBeAwdBy++yN5pf9w
X-Gm-Gg: AeBDiesNLVDg6H2kP8AW1s+NSpa2f/gdGZy5QXclIsZyCF5Gav/swWDyj/zw2jC/N+x
	YZC7T0GW8JkJm7T8R78+UxOUDBCgwkA0ePgZrbgUzzRB8Kdht0w6F9LkoINEp8aq76osx2tSdLf
	+e27tbpKs+ejwkk9zuOjFd5QLwwqNNh/0VmItn2KhIMatym/k/NQM0wWFm4HxdwiKUe9yaM8uoV
	/Yl6Wv32lWLgxt9z8X8Lwyg8zxsz3iIJtt77oohqoEj7GPbXpGABfRJFx5hJ+AIeE9LTj5UvI3X
	aEXkplo6xIULYMS0e0rYgs4hdj/hsi+AyCsDNXx3HXf4g52cugZK8L3Fmh8RK/n7iltj8drIBs5
	zex5W6SC0Lk5S5F8lSrvhx2L2igD+6eZ6pQouiHfdXCc+PouOaAzNeVjCS6FQ/LmH8mit0mvmmh
	+QURqMQNKvMLVVkFSZjbHmliXIR0lPaNgZ3O5RwKg8AioRfVXdUW979AHBnv07iEjioL7GO60xZ
	fmMkrsPBaJ83Wv2kxmbR0xqVh6jaxxBqvZVtZribfUKmjVcV4U0MoHEXQ==
X-Received: by 2002:a05:600d:10:b0:488:e7e4:8425 with SMTP id 5b1f17b1804b1-48e51f4ea40mr61630205e9.23.1778086161523;
        Wed, 06 May 2026 09:49:21 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:3dcb:40a8:a5b9:2327])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e530fdc50sm33060795e9.5.2026.05.06.09.49.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 09:49:20 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-rtc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 5/5] rtc: renesas-rtca3: Factor out year decoding helper
Date: Wed,  6 May 2026 17:49:14 +0100
Message-ID: <20260506164914.3987293-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260506164914.3987293-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260506164914.3987293-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 1C4B64DE486
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-32172-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-0.998];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,renesas.com:email]

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The logic to decode the year value from the hardware registers is
duplicated in both rtca3_read_time() and rtca3_read_alarm().

Introduce a helper rtca3_decode_year() to centralize this conversion.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/rtc/rtc-renesas-rtca3.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/rtc/rtc-renesas-rtca3.c b/drivers/rtc/rtc-renesas-rtca3.c
index 97e7e65f59a5..b3875d041de5 100644
--- a/drivers/rtc/rtc-renesas-rtca3.c
+++ b/drivers/rtc/rtc-renesas-rtca3.c
@@ -228,12 +228,19 @@ static void rtca3_prepare_cntalrm_regs_for_read(struct rtca3_priv *priv, bool cn
 	}
 }
 
+static u32 rtca3_decode_year(u8 mask, u16 year)
+{
+	u8 y = FIELD_GET(mask, year);
+	u32 century = bcd2bin((y == 0x99) ? 0x19 : 0x20);
+
+	return (century * 100 + bcd2bin(y)) - 1900;
+}
+
 static int rtca3_read_time(struct device *dev, struct rtc_time *tm)
 {
 	struct rtca3_priv *priv = dev_get_drvdata(dev);
 	u8 sec, min, hour, wday, mday, month, tmp;
 	u8 trials = 0;
-	u32 year100;
 	u16 year;
 
 	guard(spinlock_irqsave)(&priv->lock);
@@ -274,9 +281,7 @@ static int rtca3_read_time(struct device *dev, struct rtc_time *tm)
 	tm->tm_wday = bcd2bin(FIELD_GET(RTCA3_RWKCNT_WK, wday));
 	tm->tm_mday = bcd2bin(FIELD_GET(RTCA3_RDAYCNT_DAY, mday));
 	tm->tm_mon = bcd2bin(FIELD_GET(RTCA3_RMONCNT_MONTH, month)) - 1;
-	year = FIELD_GET(RTCA3_RYRCNT_YEAR, year);
-	year100 = bcd2bin((year == 0x99) ? 0x19 : 0x20);
-	tm->tm_year = (year100 * 100 + bcd2bin(year)) - 1900;
+	tm->tm_year = rtca3_decode_year(RTCA3_RYRCNT_YEAR, year);
 
 	return 0;
 }
@@ -354,7 +359,6 @@ static int rtca3_read_alarm(struct device *dev, struct rtc_wkalrm *wkalrm)
 	struct rtca3_priv *priv = dev_get_drvdata(dev);
 	u8 sec, min, hour, wday, mday, month;
 	struct rtc_time *tm = &wkalrm->time;
-	u32 year100;
 	u16 year;
 
 	guard(spinlock_irqsave)(&priv->lock);
@@ -373,9 +377,7 @@ static int rtca3_read_alarm(struct device *dev, struct rtc_wkalrm *wkalrm)
 	tm->tm_wday = bcd2bin(FIELD_GET(RTCA3_RWKAR_DAYW, wday));
 	tm->tm_mday = bcd2bin(FIELD_GET(RTCA3_RDAYAR_DATE, mday));
 	tm->tm_mon = bcd2bin(FIELD_GET(RTCA3_RMONAR_MON, month)) - 1;
-	year = FIELD_GET(RTCA3_RYRAR_YR, year);
-	year100 = bcd2bin((year == 0x99) ? 0x19 : 0x20);
-	tm->tm_year = (year100 * 100 + bcd2bin(year)) - 1900;
+	tm->tm_year = rtca3_decode_year(RTCA3_RYRAR_YR, year);
 
 	wkalrm->enabled = !!(readb(priv->base + RTCA3_RCR1) & RTCA3_RCR1_AIE);
 
-- 
2.54.0


