Return-Path: <linux-renesas-soc+bounces-35162-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id E4LkKGQmVWokkgAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-35162-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jul 2026 19:54:44 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BA36C74E2FA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jul 2026 19:54:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=A5VKFW1r;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-35162-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-35162-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6DFAC31177B0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jul 2026 17:52:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A266353A92;
	Mon, 13 Jul 2026 17:52:16 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD0CA3537D2
	for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Jul 2026 17:52:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783965135; cv=none; b=q7V2CLzQil3UTHGdTYPoHEQbu0XxhypU4X+vTimRHDDaoU/yPSjQpgZSwuIXVYEKj2IcnfYhElzz97+eGea2+Wwh+4bPRgEiygqqODhVOCqHlgQ2c7cYRqDZoZ7RufgAXf0O1MQ0tIN8Ophw2fxO48W8EWGIZGnDy0JN7Gl3EJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783965135; c=relaxed/simple;
	bh=HbW5N3phPFJJMjdweeAACfoi+lvBLPALP5Jt5/2V3eg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lOsGZ3c/yazXUJc4mGw5cvTC7TcupWeiz5LjINN99ANGD3OMsY/EhZoVWBgCvSJuPjLKMpUTvPuM6/0lLbIrSs9gW1lqSQZo6bAX2DwqLTq6zCA7dQQN0MSoxrOOVsx3Oh34dGD272Vzn0u8o2TPLDx2IcPsOpMsaBAF31SGSDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A5VKFW1r; arc=none smtp.client-ip=209.85.128.49
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-493f4638f4aso1521585e9.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Jul 2026 10:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783965130; x=1784569930; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CMabxijrPdjD148L5yvur0WhCfh5+SdQvtGwbs6Bgv0=;
        b=A5VKFW1r0JlBKKKSoeBGgriV5RRByQMUsGOvuT+cy+0mSrDnAB3mT3an73xXs5lU6i
         BtdpGW+nhzmbPOa1Sw9HRi1a5rOWsI0BArD+ZU4ClWUYJN/6tjQoJqePNvwwAcicOohN
         uKoJJrUrOwkvJb80RpfFOz/pyn0Oxv0HOZc39n7Oj6t+IDixbclh/Eu2NIyKW+tUvYYR
         4/kxAAiW8gPCXXRQQje25ziAI7CPK6qCqqVP5pJCQHXwa16dciw/cTHhvGziK87L62mD
         9zoWEaigvvqdF24u+59Lck/KjeQsySbVATk7DfvmnyPPe0Yjq8rCMSDOvlWd+0EpeQZt
         zEoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783965130; x=1784569930;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CMabxijrPdjD148L5yvur0WhCfh5+SdQvtGwbs6Bgv0=;
        b=O+IUAJY2iAUTAgrbAIbwpk8S8IyWeKcjc7tPchJHmojmm9+Mf5h4/9oGQbXabwlF6T
         GLfElvzaVqRjwmh7rYMJOK74B2nifPfHeE3odz519isVERPBOPVgqvOPhoiPkNg+6nah
         jptpWduDFniX0903QhufOSTJqh/uXtXZGPuU9j7vy+JDSBXtJi0YokrZi7Iy4U17Iv9S
         WMMp5yww2FsVelk0lAX6F0TRkkBBJSKhaQd5F6RKovDX8HphFfQ91bhlGu9qYuZpoQwt
         iiyZ+f2fRPw5dvCWkRT0vd1F2paxOZMfKC+z9dYmf5OIkAqeB29hplI+sF+mY0dEUlU1
         t7UQ==
X-Forwarded-Encrypted: i=1; AHgh+RoV5plT5ipHSdi73u4P3myJF0knDYCJavvyyW4GocjZv4ZFgIFqs723VSuZxaN23EgWo9LOeVWXCj/wq73vweMXWQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwiHdZ8xuUnhiPe/e4dwNwAQXUN9VUv/4FJsO6TtJRuSAogFG8j
	msr2bCQxy4kiRssvI9HVbGmXTQ7tf4QZ9e7/HyCMpy0pn2JJATxp+MXePgfiK5z+
X-Gm-Gg: AfdE7cmtDkZS3DzeDkrtScEGLD8cxn2rOrE2QIhEdCCD9doky3PHMXsoCcZJPCeBxs+
	Be336TcDi2ySjwklhaU6s84p7f4sp/0w/LCn+HGgC5VQMuCR56r0VZMcjP6Tx9CXQvSUcbfGg+Z
	fbV2UpFIcYUN0oqr/B8awQWhWDnfmkx0L84u9fkpa+R8pIUuR1mMEBesz3XpzQd01a/HpYfsyFT
	1uOY6BNRAT27ZWpovMCnJ2YHbIEj3DCrL1sS4LIWtufm18y/PAf3Bry1sDDNl6ZIMgQ1u0A9RdH
	nFQK4F1zA1VxsUdnj8OLyxLKDkCvK0fTMr/I1iG38WsCwckrNTtNjHzl+z4/IFWYceAa4aBgut/
	M617fZGcSkG+4L5DpIT+bRIe/rTPdr7UoX8VWV5abou9haUjYzfPgnC+kN0el+xO8RmOWdKFut/
	KGuwpHtYBcEechdDndWhYXY8TXEzY8WAexud0/kw==
X-Received: by 2002:a05:600c:8011:b0:493:c0ec:9a5f with SMTP id 5b1f17b1804b1-493f8818045mr110615525e9.19.1783965130307;
        Mon, 13 Jul 2026 10:52:10 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:c899:4fec:2bdb:b719])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f464d6fa7sm1011037f8f.37.2026.07.13.10.52.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 10:52:10 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Ulf Hansson <ulfh@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-mmc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v20 09/12] mmc: renesas_sdhi: Save and restore IOVS across suspend/resume
Date: Mon, 13 Jul 2026 18:51:50 +0100
Message-ID: <20260713175159.138334-10-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260713175159.138334-1-biju.das.jz@bp.renesas.com>
References: <20260713175159.138334-1-biju.das.jz@bp.renesas.com>
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
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-35162-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:wsa+renesas@sang-engineering.com,m:ulfh@kernel.org,m:biju.das.jz@bp.renesas.com,m:linux-mmc@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:geert+renesas@glider.be,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:biju.das.au@gmail.com,m:wsa@sang-engineering.com,m:geert@glider.be,m:bijudasau@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,glider.be,gmail.com];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BA36C74E2FA

From: Biju Das <biju.das.jz@bp.renesas.com>

The SD_STATUS register, specifically the IOVS (I/O Voltage Switch) bit, is
not automatically restored after a suspend/resume cycle, causing the
regulator to report an incorrect voltage on resume.

Fix this by caching the CTL_SD_STATUS register value in the renesas_sdhi
private struct at suspend time and writing it back during resume. The
save/restore is only performed when a regulator device (rdev) is present,
as the IOVS bit is only relevant in that context.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v19->v20:
 * Updated resume() with scoped PM runtime call.
v18->v19:
 * Updated suspend/resume with scoped runtime calls in suspend.
v17->v18:
 * No change.
v1->v17:
 * No change.
---
 drivers/mmc/host/renesas_sdhi.h      |  2 ++
 drivers/mmc/host/renesas_sdhi_core.c | 26 +++++++++++++++++++++++++-
 2 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/host/renesas_sdhi.h b/drivers/mmc/host/renesas_sdhi.h
index d46598190004..39d915da6f38 100644
--- a/drivers/mmc/host/renesas_sdhi.h
+++ b/drivers/mmc/host/renesas_sdhi.h
@@ -104,6 +104,8 @@ struct renesas_sdhi {
 	struct reset_control *rstc_axim;
 	struct tmio_mmc_host *host;
 	struct regulator_dev *rdev;
+
+	u32 cache_sd_status;
 };
 
 #define host_to_priv(host) \
diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index 42548f5fa2f4..861fa83b9980 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -1403,6 +1403,15 @@ int renesas_sdhi_suspend(struct device *dev)
 	};
 	int ret;
 
+	if (priv->rdev) {
+		PM_RUNTIME_ACQUIRE_IF_ENABLED(dev, pm);
+		ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
+		if (ret < 0)
+			return ret;
+
+		priv->cache_sd_status = sd_ctrl_read32(host, CTL_SD_STATUS);
+	}
+
 	ret = pm_runtime_force_suspend(dev);
 	if (ret)
 		return ret;
@@ -1432,8 +1441,23 @@ int renesas_sdhi_resume(struct device *dev)
 
 	ret = pm_runtime_force_resume(dev);
 	if (ret)
-		reset_control_bulk_assert(ARRAY_SIZE(resets), resets);
+		goto err_assert;
+
+	if (priv->rdev) {
+		PM_RUNTIME_ACQUIRE_IF_ENABLED(dev, pm);
+		ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
+		if (ret < 0)
+			goto err_pm;
+
+		sd_ctrl_write32(host, CTL_SD_STATUS, priv->cache_sd_status);
+	}
+
+	return 0;
 
+err_pm:
+	pm_runtime_force_suspend(dev);
+err_assert:
+	reset_control_bulk_assert(ARRAY_SIZE(resets), resets);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(renesas_sdhi_resume);
-- 
2.43.0


