Return-Path: <linux-renesas-soc+bounces-34931-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5dNgEopcT2rOfAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34931-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Jul 2026 10:32:10 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D663672E511
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Jul 2026 10:32:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Ln1pGnKi;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34931-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34931-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 80F6E301255D
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Jul 2026 08:31:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 388D63F54AB;
	Thu,  9 Jul 2026 08:31:19 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CF803EFFDC
	for <linux-renesas-soc@vger.kernel.org>; Thu,  9 Jul 2026 08:31:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783585879; cv=none; b=GRUIfV4w8slpOaIYLFD+CBkrBBzgE5xMcxp/WEYrF9OurM7+4GasYAICmRZj4RllXfiTDamyIJN16y5cXoQf5wRfPnCcojmD3EXEZ6qUd5Rs10vyBSNAt3WYGnyLKov+3WWZxCgU3YGENf2sHZykqu5aQARNHlD2WSrpfLCHzWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783585879; c=relaxed/simple;
	bh=fwqJ+MOFi461Q9J+k7BMEOgoUulJPfihxnN1g/em4uQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Li8Z+JxyGv7lSyNVpu6nHP1+0yuyjJHkt3dbnEImiykFYr2ARIO15wT7hkM4DlCcBuAmbZqCsywOe0Xsw8dsabtcb422CKyzp/MW7GYZYqHqCTZnK1RwDkUIhN1zmDXykxDLckkmDHBeWsCpwnShNMEm3sw0b0/GEO0fk9pp+kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ln1pGnKi; arc=none smtp.client-ip=209.85.221.51
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-471eeac43bfso1494439f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 09 Jul 2026 01:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783585875; x=1784190675; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8oU/slL1LUhhKssMFo9c65Mvkq9gbcpoewuG6Qy0ARk=;
        b=Ln1pGnKipAP9Kn/5U3JvXZ7sWzKUUMvuiEryq2GjLm9RGn7rlQYEPGzDIIZ+b6eOE0
         f3ib2gmZ0aAyTMXSwgryTMokydawFtgWM04gGIeaKOIANv6IlVgQPhzqPWKC5dxl7NJy
         0LFavLZr8HQmnyJzsnHYPMQQ4Mc/BzOQwnJbgY7mZN5i9iIYZZjgKewe8pPiHt3D0TOT
         9jW8HsnqFcjuARPtWfjEMn58/ag8VqT1PC07H7LaOaxCJjQcJNp/8tz1csZytwGmBs74
         7Q5KeSkqnyYxTFBxPkBZz+/qRxWF0tHm5aqy1i1WK4TPhlHFH7joZgIh28gAqdLry5Ak
         /mZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783585875; x=1784190675;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8oU/slL1LUhhKssMFo9c65Mvkq9gbcpoewuG6Qy0ARk=;
        b=dl4/vbyUUFCob5v4RoEyvvfZp0/wJJOr1/N/UUEx4N2SvRwbvYGhYmw/4GkUqHMPwD
         f6deoRcSU9Mzx/B4U2TaJKm1KASy7NthPuj3QQhNbPB+qnPDEV17Fi20di6qBbHOMmFB
         s5BA3z2BsbZTynm7D4fM6aNtfFQPzkmQgLOZyWPR7H/aZLHvwrRTn9rh1o1lCJOgS9+B
         8aPpewA50hM4rwjG8N7QJLYLQd9qYkPMCBdfaA7nLzREz3BjQaPoJH4AXVvJ263/edJc
         jQUDdEXnJ0gizm3U95U03s1OXoa16V4U/499qDNs9MDTcn/sekcEGLaTeH9OwbPr4RZH
         TAeg==
X-Forwarded-Encrypted: i=1; AHgh+RqTPc03qOervEFFwt8yMxOL/hI4uYtDtfXoJAyhhKUd7SyAB/Y5vKEME2xD2FtfKTJZNKUimm4vGcS3Mn6J+Wzzhw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwAcyPmmykeyx3EBqFXUPkW/E+6E0KBl0zgH202Ch2m+iV8VdQ3
	IW73atZ6E7Mm+ak4taYCVu5sLnqgPsOKbpDvoPZpYXlBpaMe9odz617O
X-Gm-Gg: AfdE7ck8WS3Q0YNXtr6vYUvWyR0/pS5z4C9LqA7MBVZYSwQq003pRTk2EnA1DaojVHA
	6pP2GeDD0IpfMaMAmUYjND1ZfUcc/dCc05nNjFPLnrpiMkMQL1ydX8qAEwsBsJXGBQVOpjCWHay
	SKLvdmZxjsgIklGe9kyX/l4dli1e2bbfz+/eJLZI29g0ELk46kHklZ1Cmi21kv99cbJ790UtI1P
	OVrwOZEhZnaD0S3fxbgVQ5P+DLF5L7wzCQ29GfP/YC4bEFqdtzZV/UGRJG/yZo3n6572p0axrsF
	DmH4kYVN1OiY+AVueca89XiZrUcP+tvNgp72e7/cVqhLRygwWiEvKejVZMTDynn7GIQjspdFrA0
	+TMAg8XFyuDReD3THS28Z4mqtjsMcvguJKmHIz0CvhA+5wALykQl/s/KdDNy1eisDl6ngOkvAhl
	u9DY86/hBOuQBONhzdRyjN
X-Received: by 2002:a05:600c:1395:b0:493:a435:d870 with SMTP id 5b1f17b1804b1-493e68ce31cmr60669485e9.27.1783585875389;
        Thu, 09 Jul 2026 01:31:15 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a702:d301:8fb6:1d85:3dc1:42ab])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9e4d780csm50316543f8f.11.2026.07.09.01.31.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 01:31:15 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Vinod Koul <vkoul@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-renesas-soc@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v4 7/9] phy: renesas: phy-rcar-gen3-usb2: Fix devm action registration for disabled VBUS regulator
Date: Thu,  9 Jul 2026 09:31:00 +0100
Message-ID: <20260709083108.108370-8-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260709083108.108370-1-biju.das.jz@bp.renesas.com>
References: <20260709083108.108370-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34931-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:yoshihiro.shimoda.uh@renesas.com,m:vkoul@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:biju.das.jz@bp.renesas.com,m:neil.armstrong@linaro.org,m:p.zabel@pengutronix.de,m:linux-renesas-soc@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:biju.das.au@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,m:bijudasau@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[renesas.com,kernel.org,glider.be,gmail.com];
	FREEMAIL_CC(0.00)[bp.renesas.com,linaro.org,pengutronix.de,vger.kernel.org,lists.infradead.org,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,bp.renesas.com:mid,vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D663672E511

From: Biju Das <biju.das.jz@bp.renesas.com>

devm_regulator_get_exclusive() initialises the regulator with
enable_count = 1, requiring the consumer to disable it before release.

The devm disable action was previously only registered when the caller
explicitly requested enable, so when the regulator was left in its initial
enabled state without an explicit enable call, the cleanup path skipped
decrementing enable_count, triggering a WARN_ON during regulator
release on device removal.

Fix this by always registering the devm disable action based on the actual
enabled state via regulator_is_enabled(), regardless of whether the
caller requested an explicit enable. This covers both the explicitly
enabled case and the initial state set by devm_regulator_get_exclusive().

Fixes: 24843404efe4 ("phy: renesas: phy-rcar-gen3-usb2: Control VBUS for RZ/G2L SoCs")
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v3->v4:
 * No change.
v2->v3:
 * No change.
v1->v2:
 * Updated commit description.
---
 drivers/phy/renesas/phy-rcar-gen3-usb2.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
index d06fb52ed5f1..ef38c3b365d4 100644
--- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
+++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
@@ -905,15 +905,17 @@ static int rcar_gen3_phy_usb2_vbus_regulator_get_exclusive_enable(struct rcar_ge
 	if (IS_ERR(channel->vbus))
 		return PTR_ERR(channel->vbus);
 
-	if (!enable)
-		return 0;
+	if (enable) {
+		ret = regulator_enable(channel->vbus);
+		if (ret)
+			return ret;
+	}
 
-	ret = regulator_enable(channel->vbus);
-	if (ret)
-		return ret;
+	if (regulator_is_enabled(channel->vbus))
+		return devm_add_action_or_reset(dev, rcar_gen3_phy_usb2_vbus_disable_action,
+						channel->vbus);
 
-	return devm_add_action_or_reset(dev, rcar_gen3_phy_usb2_vbus_disable_action,
-					channel->vbus);
+	return 0;
 }
 
 static int rcar_gen3_phy_usb2_vbus_regulator_register(struct rcar_gen3_chan *channel)
-- 
2.43.0


