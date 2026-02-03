Return-Path: <linux-renesas-soc+bounces-27862-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OCy2IW2CgmneVgMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27862-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Feb 2026 00:19:09 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 33C53DFA98
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Feb 2026 00:19:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C14AE30C703A
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Feb 2026 23:18:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A50F327C07;
	Tue,  3 Feb 2026 23:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pg6jk0bl"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FA6331E10B
	for <linux-renesas-soc@vger.kernel.org>; Tue,  3 Feb 2026 23:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770160713; cv=none; b=V+cAmDuGy8vNcQYMiwlqhwqg38SsfoNSHyISxirHEXBIJM14mQUAZ0snonBpK+N4aLi4KAGuLETl4WbsR4NUBiEy4Wtf3o6CUvOt7YEa4hfdX1D9WHCIrc47iIKgjVym8GYa5DgsXleFRB1DSG9GjsOUg29wV47siwhywbB/n98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770160713; c=relaxed/simple;
	bh=Brp5qrTUAsCcym21xMYfoZJ4cOoimrBdqQAWm42fdC8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ju7IQ6C8sunzk1vVDG/kn72xpWbZDivsohEGIssFhkPwnde9Ee6eo5HxInTbi2jR5wWZuvc+0rGHeeWdfveGcOxw/xnOqtb4Y/nOVOjuo3wj9fMwtAudWK5Kpm5YXsmD+uWvIhtf7Rpl80GW+S+v/IFzbLwm57SPhjYoA7WY2S0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pg6jk0bl; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-432d2c7a8b9so5215274f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 03 Feb 2026 15:18:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770160711; x=1770765511; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CJhmxJ+KI+ZTVz7UVfJJ3AAKvigbqAtSvhVOs0qF4Uk=;
        b=Pg6jk0blnl0ypZcxqrSrY1Rr5XTnNY9xRgiIl/i+fRYTmxkDjoKP78nR5aV2jfmG2/
         NJzewdkgKT+2V0B9t+z98PyONWjKRtVob/rdJKTnAdlF+4xAKRn8OvpnYqc2CQ6iH/KX
         w2Cc8JcC+IidDxVm3x2LNmYgR0ifMRXmyewS6CPFRLfjB4qcili3skpDEhqYNmn4L+pO
         MMQ34mC+McrlgXONZOQik6muKgpP+p3zQGO9z6tB+E+HYzcMZJNg76U95IA1GKAWWcCi
         2FGqE8c531umK4CffbKjxoSCxG4mjw0oRgfqsrHfrE2qNogogS9Cqz2t26tL8M82+f3h
         bLRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770160711; x=1770765511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CJhmxJ+KI+ZTVz7UVfJJ3AAKvigbqAtSvhVOs0qF4Uk=;
        b=XrnswKVnAwNIIpPjaJvyR79GbFJVRs+35wepxkF1D/UiuICE+i7owVA49ySaIYGKoY
         WHIgJidtf1mWOkGf/ZmFGEw0xRPJB7KJyfXybIndJKtCgYy3TLZUL8/u6e8EKolNbNWR
         rL8+tZV0QliWwltTol7OVBV9UK6bMSqwfLGjkBb9WRm5vU97WZH1sdlx5ndwGS6pD/yf
         O4/ldlQToq6ZjrVfkb9W7+pQHU1pElJGdyoKCTwA0FkGwEoJdtTLIVrH8oCA7uSvTUiA
         ndrELvrlLi0LljvkFPHQSCTPdUDOvMaqS6rt1BfOYKGPBk33DJXc0ZvLn6i8X+/sA3u9
         Jc/g==
X-Forwarded-Encrypted: i=1; AJvYcCUhQnuStnZG+kID3NCtdZbbWy4DDrJmIA8Di17jq7/jToQl00FsHR9T5zowqWHMTNB3z9ovYMsOWjgOXSMisZDpRA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzgcDLAl+6CQzOg6FrDxCJBG8VZ2O6Q1d6aypSUHzhL7WGxPSB8
	mUGkbUk9qggv2rt9wAX2ulMOKiYfrJ/nF3xM/CE/S8kreOC9HmaCC30S
X-Gm-Gg: AZuq6aICMjqnckS5mNqctX8HzP6Gffa7MVJqAqLPGB0i7P634aqqVoPCpSZ1+5fkbse
	hW78RvtsiQxLqc1SH05YlUW28i/GKWhuYU2DUyGhvRQln0mWLdFApQDt0LnEufCxYIqaWSEcSt9
	zllC8Idu7/Jw6jmtm2+ePXooLRVn56na39J6LDFsP2Tke/5HItnS51lsCoQb488yz4cLy3lkmsM
	ptIIEqiRBjQ8OhLdUzJwVJysO5mXYm6Jc9Tvv3pYI+1cf4vFqJbrJOONjyvL7t7D51hzZdA95NF
	fS3huJ/Rba3X9QskS3idS1vNyZJaoFLDd408Uoyjdc2lMY9Nw1vbF/EWThykLc118d08DdAp8w6
	EaGUTU72gr+50D+TAYj5BQmAr4CJ4ZGdYRlS4ps/zxV52KVI8DcXklL1NZldzx98ZMI8YK8AIsb
	ARFqnDUkMTc/DMPbkp7lYJAX+QyCHsjUZR16MDFMM6vAlI2gXZLi44XCbKlqvUc22uaMJ0bgPQj
	2uFQNEL8d4ZpPg4WgXRiEle
X-Received: by 2002:a05:6000:26c4:b0:436:173c:b8e3 with SMTP id ffacd0b85a97d-43618056bc4mr1401351f8f.29.1770160710658;
        Tue, 03 Feb 2026 15:18:30 -0800 (PST)
Received: from iku.Home ([2a06:5906:61b:2d00:2e50:5c7f:afca:5f9f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-436180647aasm1739832f8f.41.2026.02.03.15.18.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 15:18:29 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Thomas Gleixner <tglx@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 3/6] irqchip/renesas-rzv2h: Switch to using dev_err_probe()
Date: Tue,  3 Feb 2026 23:18:20 +0000
Message-ID: <20260203231823.208661-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260203231823.208661-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260203231823.208661-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27862-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,pengutronix.de,glider.be,gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Queue-Id: 33C53DFA98
X-Rspamd-Action: no action

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Make use of dev_err_probe() to simplify rzv2h_icu_probe_common().

Keep dev_err() for -ENOMEM paths, as dev_err_probe() does not print for
allocation failures, ensuring they remain visible in logs.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- No change.
---
 drivers/irqchip/irq-renesas-rzv2h.c | 32 ++++++++++-------------------
 1 file changed, 11 insertions(+), 21 deletions(-)

diff --git a/drivers/irqchip/irq-renesas-rzv2h.c b/drivers/irqchip/irq-renesas-rzv2h.c
index 766b981cf3d8..4aa772ba1a1f 100644
--- a/drivers/irqchip/irq-renesas-rzv2h.c
+++ b/drivers/irqchip/irq-renesas-rzv2h.c
@@ -560,10 +560,8 @@ static int rzv2h_icu_probe_common(struct platform_device *pdev, struct device_no
 	int ret;
 
 	parent_domain = irq_find_host(parent);
-	if (!parent_domain) {
-		dev_err(dev, "cannot find parent domain\n");
-		return -ENODEV;
-	}
+	if (!parent_domain)
+		return dev_err_probe(dev, -ENODEV, "cannot find parent domain\n");
 
 	rzv2h_icu_data = devm_kzalloc(dev, sizeof(*rzv2h_icu_data), GFP_KERNEL);
 	if (!rzv2h_icu_data)
@@ -576,29 +574,21 @@ static int rzv2h_icu_probe_common(struct platform_device *pdev, struct device_no
 		return PTR_ERR(rzv2h_icu_data->base);
 
 	ret = rzv2h_icu_parse_interrupts(rzv2h_icu_data, node);
-	if (ret) {
-		dev_err(dev, "cannot parse interrupts: %d\n", ret);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "cannot parse interrupts\n");
 
 	resetn = devm_reset_control_get_exclusive_deasserted(dev, NULL);
-	if (IS_ERR(resetn)) {
-		ret = PTR_ERR(resetn);
-		dev_err(dev, "failed to acquire deasserted reset: %d\n", ret);
-		return ret;
-	}
+	if (IS_ERR(resetn))
+		return dev_err_probe(dev, PTR_ERR(resetn),
+				     "failed to acquire deasserted reset\n");
 
 	ret = devm_pm_runtime_enable(dev);
-	if (ret < 0) {
-		dev_err(dev, "devm_pm_runtime_enable failed, %d\n", ret);
-		return ret;
-	}
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "devm_pm_runtime_enable failed\n");
 
 	ret = pm_runtime_resume_and_get(dev);
-	if (ret < 0) {
-		dev_err(dev, "pm_runtime_resume_and_get failed: %d\n", ret);
-		return ret;
-	}
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "pm_runtime_resume_and_get failed\n");
 
 	raw_spin_lock_init(&rzv2h_icu_data->lock);
 
-- 
2.52.0


