Return-Path: <linux-renesas-soc+bounces-30102-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6FlyN/w4wWm7RQQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30102-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Mar 2026 13:58:36 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C9AB2F258B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Mar 2026 13:58:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3F0F8305DABD
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Mar 2026 12:49:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CD593A1698;
	Mon, 23 Mar 2026 12:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BRTluIWq"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04F4C39659A
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Mar 2026 12:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774270162; cv=none; b=DBjdiTW4bAQ4kpEGMPvlBdnt06v76YunWnQT3Rp0ZmZiQbA+qeK4Ye90NYUxc6d1FJaDeEy8Zc6p12jHvS7KZIISOu/8XlUxZSEliDY6TEc+DiZ0Xi1bm3cSPNpKhtWuwXItqyIR63ONhLCw+DfcD20T6gvMRdMtziqKC/Y5g84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774270162; c=relaxed/simple;
	bh=rrWNi/xNJnsSR6A8ignp7z7Dh6rsilj94gZ31wSf2cI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DAMlmM5dEesp2o/wnocoMzdfPz2BTtDp7OGHhtkX663F6DxVCFzHP2+ac6HucdXFp3n5bi50lRfy83cqc4ZckbAvy52CtWSxv7lLvjS1AHMhFy0zHwDkBGg5QvOHrC4qiJxuT/C1sJSsur9K+IsVOQrOusv4q0VWUjkr6PaH3Qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BRTluIWq; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-486fba7ce4cso677825e9.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Mar 2026 05:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774270159; x=1774874959; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/h14p7w4yNFLxJSIoydmoqwdeJV+j9qvjwD5SXjzhgM=;
        b=BRTluIWq3WIItrQPlFF8v6kSX9MrHyaMMG+MIGdWB7aoL3xtVCUuqp2L5QR50XauNJ
         LPMGvYI3TucfiNckAIIFqXRefkz22XLplkeIffH+xyKfDyEHBztwATwt5rCvIJCRHs0i
         2q8Ea1xmvq6t5V//j6xzRfQf+VtFW5CC/qpG5UpBa2d/jfiRo3g5lENOoAbj8QoXgcWQ
         tVGVpJVP46oEiGRPuT6gTPcQM0oxz2Ag8X7trj57X/E4tUqdCVFhN0Dmv3d0LluMqt21
         TMa2wpi2UN1ufQjNtoDFE3U/xXq69tlsZmzzfwauIS8PRWuFoSjLvhB7jJSA8d4+wHI6
         sadA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774270159; x=1774874959;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/h14p7w4yNFLxJSIoydmoqwdeJV+j9qvjwD5SXjzhgM=;
        b=RfXQk1ePj3/skfGT3ha8aFBa6cIewqoz+LJPBbln2N1YBMZa1nNAkr/6Z71+EVdUkh
         KSiOvEPDUQZ1VCQaj1g/NxGE5D+K8oCvHdFeGGG/ZX9v/q47YR7Yse6V7mo2EJk5On3J
         OI5qqyPXf2JJ7JSReiizePh+QqQSywuHbjsl3nLTW/LBtadNXQfeWkMMXvfQoO1j73Jk
         oHrU9zSO1TfL0cskeOMvjVBDJq2DkJJXbf1Ja128U/RhJODLJ28bmdkN0Zxy0k1xJb+w
         Mbjw+MhMWPq5EjbLd9bLxAqzhr7dF55yP9EFBMtn+6AFWn+UH4OaCxusydYcRb9+1h3r
         HzWQ==
X-Forwarded-Encrypted: i=1; AJvYcCUBSkln5SvFxBzIm7wLCN5qLmK6zMLFc6+PRA9dFiK3Yo3JJWwLRyn+HbzCKPKH8CQaG6YJ/ersJHsV+JFulKCZng==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1x0PmDV1t3EB2v1WLdAkdaGcUGL5RarsMFT8GLn3YJc6PaVTO
	UF7+OjClt02159395MVKDVCXlOtH4KGmE8EvvB1wjnbSl5t2ZKMsHHe8Jd4QKw==
X-Gm-Gg: ATEYQzwd26klJ3thGtVa+6J53hHn48qZX+JJfj8CewifBEQ4mBVrIoAwwRN2/ltuC90
	wyPxGVBGcmn7xxGLTLTASbVmIGY+uqm1td8Id0SKp41EDqL3PCDkt5ka77I3KTfU30d/FIhehpL
	IM77xdnOxhA2LYfu25G16BJbuAuj5LBR/pzaN1uVWL9H2uaS97Aq7hPD37sskOMuFtmYE+0aRdz
	Rh7rewn4rKjMgvD640jlqAtqoM82+Gf2gnO1K9xTXpBDJHJbq15agHUAqPUHXNGMz0HwcJHsVzS
	qGDj1fecgZ6XxnTOWFiCtm9t/K95SbceWmZZ9nbjqg0FniM5OiKXMRtfswLYZ//CJXldkQ1Katc
	Pc9BBifohL4n1GJmIjBJF+kNPiJjLK8cRVZBz+TPKnsRyZVj9/gVNJJrKhzKZjYiKCE2RcQ+CFr
	2yTatwVcyykK+AiM0NXEZV51fqaF5EOA==
X-Received: by 2002:a05:600c:828d:b0:486:fe39:28b7 with SMTP id 5b1f17b1804b1-486fedf8fcbmr177887105e9.9.1774270159153;
        Mon, 23 Mar 2026 05:49:19 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a758:8a01:d51:b85b:21f5:4b41])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fe836784sm254365855e9.13.2026.03.23.05.49.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 05:49:18 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH] irqchip/renesas-rzv2h: Fix error path in irq_domain_create_hierarchy()
Date: Mon, 23 Mar 2026 12:49:14 +0000
Message-ID: <20260323124917.41602-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-30102-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[bp.renesas.com,pengutronix.de,glider.be,vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email,bp.renesas.com:mid]
X-Rspamd-Queue-Id: 4C9AB2F258B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

Replace pm_runtime_put() with pm_runtime_put_sync() in the
irq_domain_create_hierarchy() error path to ensure the device suspends
synchronously before devres cleanup disables runtime PM via
pm_runtime_disable().

Fixes: 5ec8cabc3b86 ("irqchip/renesas-rzv2h: Use devm_pm_runtime_enable()")
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/irqchip/irq-renesas-rzv2h.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-renesas-rzv2h.c b/drivers/irqchip/irq-renesas-rzv2h.c
index ce790590f7ca..330c6ae87d71 100644
--- a/drivers/irqchip/irq-renesas-rzv2h.c
+++ b/drivers/irqchip/irq-renesas-rzv2h.c
@@ -884,7 +884,7 @@ static int rzv2h_icu_probe_common(struct platform_device *pdev, struct device_no
 	return 0;
 
 pm_put:
-	pm_runtime_put(dev);
+	pm_runtime_put_sync(dev);
 
 	return ret;
 }
-- 
2.43.0


