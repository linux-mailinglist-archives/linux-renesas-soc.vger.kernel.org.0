Return-Path: <linux-renesas-soc+bounces-34051-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id u31ZOs44MGqIQAUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34051-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jun 2026 19:39:26 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8995B688EA0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jun 2026 19:39:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=XJCtHaUq;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34051-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34051-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7D8FA3011EBD
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jun 2026 17:39:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3799C413D95;
	Mon, 15 Jun 2026 17:39:19 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED0E640B6F7
	for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Jun 2026 17:39:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781545159; cv=none; b=hSujKxazK09uz00lY4HygNrsWkmMxWwbRBV273ym+4L7fN8aY+UH3cB9XY1ZHlH0MSCPo1mKJwwdG1DpvwAKBYYvSHrbDlYCmusMru5ROJvpKsPUCBdadtTv3PcHdHzJc+t9dNw1h0yL6uaHwwe17Zi/Qum4C0Ce3NlbMSMjT0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781545159; c=relaxed/simple;
	bh=b1KQtTshbtili0wyZAgkxDnKPTtj3bS+cOTRQEQ2T4Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iIx/owMDJaswFQuPP6WVSY65Spg4yGFmtk4cxKT/HmTSnrXYLC07l39Rj24LtocJeFz5gcu7CYgPhnA3Zi/Ui/FF2cMGL8dMklWwa1j96Vza4hqEoa6b3KgjCxHRKVPcEbp/Zylg/kHRNu7R9gprv1O7tBRrLbnlLCNno4Yu7Uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XJCtHaUq; arc=none smtp.client-ip=209.85.128.51
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-490ae94a89eso32597165e9.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Jun 2026 10:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781545155; x=1782149955; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wUS4w+g3WwlW2RArtbPlHwbcMKiF74iqmdmNoauqTDo=;
        b=XJCtHaUqk1fhdWGM5IIT4iTKEjCQf48ZN6kmr9rx3MYMduetlH43oZTHVx84icba2Y
         66jGICMBt14tjCHl1l2UcDEWAWDIAPsmxL6HdKkhJmdt8ww7lvGgOEYauhWOvoD+piYz
         1c4HOGnLHcjexP4vZjH43e2yN8PlIEkziFQ8FiBOPoPknCyUPhT+dMLYGXnW3ov6QJ9E
         lCre6zuy5zX12Eal4xp9/HURT/qhQWXtnffcmZ9xZnMeZ+uYqVe7nYJrF/1mcgKmgoJS
         WmVVLXIVGCB8ZNZK4kexVO7wapNE2e6Y1JWymnue7pcQ1mHCv9Dmeti3iM6DaQUzA3OH
         hdqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781545155; x=1782149955;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wUS4w+g3WwlW2RArtbPlHwbcMKiF74iqmdmNoauqTDo=;
        b=OKiPvr6vLxwkoUc48iw6NPnjc4K2VQxr5iIlaXnEgJ2k2sYESaoIS0ZcflxDjW/3dn
         iLoc9rTLXYD9tsLpQMFgqRYjsyw/2oVJ91pZ+xeV+shL3tsfHc+FnCCMmFjAiTLXPe+c
         aGhWfk6RVu09tt0c9spgo3fI96WGUQ/Pw9fJ+GqU1Ot81Wd2ys/7+QrxAxF4mtOWSiCd
         FiYTAw5o16xO9feQRgpVLBf1W9TX68cCEf9wKUVcFVVfelMTpvEAqC0vjCISUADq+f/Y
         hRNlvTwhMvusoujUbPiDz1ktlL46mL8//1iSgdF36tH3sdFQCxrvNuUorJMf4spXtx6L
         WOFQ==
X-Forwarded-Encrypted: i=1; AFNElJ8YrBcJRubsaeb/90ywOlIkhQ1iLNA60CuLGbKtD7yDQQUoteAK6wUG4k2BVrfypqFdieFHlqS2o5v0GBJWN+neeA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0PtoN1vvttkdjQW8lNmhtlgMj30H97Hw1XuRvetP6wA/RRude
	FCbh4ADWqBn8bJg8Dw+nUDwrPnaE5/rFXvZTOJu+3zZiRXpWlpOI1TSk
X-Gm-Gg: Acq92OEZU2crqRUS1s/f5PVjbZ2HoO0fbEf5bN6PhECpOySYUdy0BwXiK1SupUl7X/r
	UVyxaIpMw7YD8byf3P4+u8rO2Pa8s4ttJfd0uvIevcXU/0EeYxGW/BX0RTWGt8pbSHZKysdWiZY
	N4JLM59sMyCJl8vemFDdeqzNC7tThOG07YgCaoOmnLHdahHCz3+v32kfye4nAmX7ZTSJg7n34UQ
	xcCy8OKHiEkKQDIXtgtkHkCGphw8ssciuRBjpzliHME9Ggu2n6QyJRQyeBiOK4S6DFqDeraFao6
	EI5jlnoU7wCpsDCaxXgme44fGd/TywWsMrrD3+WcSrvtwW/Y9Gs7XIu+rsxeA6Un/yW2MYHmQxP
	msbue5xMAIbIpTH8RupCBnZtbnVdtjcgeGQXt6UOnbWfeUXM6pe07LLIP5wo1bpM8vXV792XqRE
	chsLYyUCkd4bA3XeV9wm8WY0a99b8Q1X8KhGQiOw7o2XBQA6c=
X-Received: by 2002:a05:600c:6542:b0:48a:93f8:dd02 with SMTP id 5b1f17b1804b1-4922006283cmr105801505e9.14.1781545155201;
        Mon, 15 Jun 2026 10:39:15 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a700:7301:eeb:53f9:7d71:64c4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f2b0d4fsm39399894f8f.24.2026.06.15.10.39.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 10:39:14 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Fan Wu <fanwu01@zju.edu.cn>,
	Vinod Koul <vkoul@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH] usb: renesas_usbhs: Fix power-off ordering on unbind
Date: Mon, 15 Jun 2026 18:39:10 +0100
Message-ID: <20260615173912.336408-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
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
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[bp.renesas.com,zju.edu.cn,kernel.org,glider.be,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-34051-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:gregkh@linuxfoundation.org,m:biju.das.jz@bp.renesas.com,m:claudiu.beznea.uj@bp.renesas.com,m:fanwu01@zju.edu.cn,m:vkoul@kernel.org,m:geert+renesas@glider.be,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:linux-usb@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:biju.das.au@gmail.com,m:linux-renesas-soc@vger.kernel.org,m:geert@glider.be,m:bijudasau@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8995B688EA0

From: Biju Das <biju.das.jz@bp.renesas.com>

Move the usbhsc_power_ctrl() call to before usbhs_*_hardware_exit(), so
that usbhs_*_hardware_exit() sets priv->phy to NULL only after
usbhsc_power_ctrl() has executed, which controls the PHY power.

Fixes: eb9ac779830b ("usb: renesas_usbhs: Fix synchronous external abort on unbind")
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/usb/renesas_usbhs/common.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/renesas_usbhs/common.c b/drivers/usb/renesas_usbhs/common.c
index 8c93bde4b816..614b724a0e52 100644
--- a/drivers/usb/renesas_usbhs/common.c
+++ b/drivers/usb/renesas_usbhs/common.c
@@ -813,6 +813,10 @@ static void usbhs_remove(struct platform_device *pdev)
 
 	flush_delayed_work(&priv->notify_hotplug_work);
 
+	/* power off */
+	if (!usbhs_get_dparam(priv, runtime_pwctrl))
+		usbhsc_power_ctrl(priv, 0);
+
 	usbhs_platform_call(priv, hardware_exit, pdev);
 	reset_control_assert(priv->rsts);
 
@@ -828,10 +832,6 @@ static void usbhs_remove(struct platform_device *pdev)
 	usbhs_fifo_remove(priv);
 	usbhs_pipe_remove(priv);
 
-	/* power off */
-	if (!usbhs_get_dparam(priv, runtime_pwctrl))
-		usbhsc_power_ctrl(priv, 0);
-
 	usbhsc_clk_put(priv);
 	pm_runtime_disable(&pdev->dev);
 }
-- 
2.43.0


