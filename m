Return-Path: <linux-renesas-soc+bounces-27207-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gLWlONfzcGmgbAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27207-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 16:42:15 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 583E35960A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 16:42:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8A26C7AEA69
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 15:22:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F91242315E;
	Wed, 21 Jan 2026 15:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FoZSqAPW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE33838734A
	for <linux-renesas-soc@vger.kernel.org>; Wed, 21 Jan 2026 15:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769007714; cv=none; b=PDWiiMLPPqZ/9FGvCtQoY1N/zxRbeKIV0hjcj8SQwaZIv4YV5NYEZDCblEWFet3nc4N0fa8HutLCTqfEysCrp/yJ02ph4Dl/xLlHnz/oYVOuGgF7WacZY6FQlTMtc70Lrz6a5bZTrrOIkW500JjhozX8XNgBmULVNO4WLts2ehw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769007714; c=relaxed/simple;
	bh=uyjlaXBsSm3MW1cFwkZZp1jtrBZptSnPJ581K8zPctY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c7gUbo5pi2J0Vq9pqUCv88VoGrftFQlFw6xha+CQJl78BLQhxKeb6wqzGTeqYmPh8wVVZlxhE8/9nEHggZK9mAbQYnwO+TJi+YJMrQkXst9xA9HtkMSkEtb+cZtvyVg5JJfW5D462PZZnAwuGVljCz8nGpxeTdoTq20gfyFIxSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FoZSqAPW; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-47ee76e8656so79792465e9.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 21 Jan 2026 07:01:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769007711; x=1769612511; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M9hWGmkV6vaCU9hAVbMVl24UbbTqYot5iTkixcF395c=;
        b=FoZSqAPWaTyJIYD7uxWTCytBb1nB7bSiEUZti0aOWykMgB08LzfQmbMZyA9QKHo/rQ
         y9/GawHJYEo64u1/XNnWhygHsiZaO9owDqthgbAd2fvwpVfFDGzGLjic4LTx2YxMxnk6
         +x6UJ4bixl2bb+Hljgvz5fDM0S7ICGXnWSf9LM77ndpFTgf6yKu42K2lGyN8sH9we9ae
         JsUrpjTuVCNqlzU3RSZqZGzBnLqNGpLuAsKDkWLyBqRuOoAl3+B0aLaloSzUxMAVvgbH
         4WJA6bDUHI8lxKIrZxU64MDdLl5B3ahS7dQxskwR1oCNgpmjRO1xULF1Lzu+bh5uV/y3
         nJJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769007711; x=1769612511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=M9hWGmkV6vaCU9hAVbMVl24UbbTqYot5iTkixcF395c=;
        b=Z9KYV/G5m+V0DKjdJtJctLTnhv4NIxEemBLakEZnmOaKqsIO2oMg9eaB5s/bTc474w
         573vdKmqew44CZZuTIEGsjG1RBDRX+JsK81g2k/urY8vL5SYK52m9lxRBIWjYySb2fCh
         XRVAxFEtdS/IQKEABnpqJEt0BIgCQWugWJBm18fiGNyFsW6ggL2+b1jsYV2IwjGtM588
         UsVFjLrGr7BgPNWTu3/YvD7hYOBb/HOpJhaJREaiGlkxcnvjtDfF5Qe1xIOghhNJMZgs
         ioNI1ehEElboengQy2NpcImCdqzGIuSYE+Xo8o/XK+NhFBmYgahLpdB8I/Lx+fqv2AkJ
         awWg==
X-Forwarded-Encrypted: i=1; AJvYcCXVMOK5+XZXx0R2MChAaIZMDLVCPr4h6+z3T1Jd94HtZ9gNjDn5BZw2xnzr0PXe8/BQdJmlQXa/qNJzcAmvYjxMdA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyCTjau2SJOaxPhKUy/JGB18BBLUkaBFQKJRCjJ27HcVPqHPxij
	1f4jM/9fHbn65B4FpHaAUxTb6Hpmva/3BXy85NcnacbQNH3koRuVd73z
X-Gm-Gg: AZuq6aKWE6cBBP50d/sDjJ18hui7Xw8Y5faWMZJOOs8HEhBSC4TaWCSeZ5t4e/RJWKb
	oVPz51wTKFeUMgmYyckXKy4I9pVsRzw+CGnWPMe24HXfvXX88bojB4w6MXBc6jFkSeV9hn+ylKT
	WOdY+Cez12e/U0NXlOcVE6gYcAFwbIbTqdg8z6I+jSEQQvyMzSExBGoM4Qu78NoqSroZqmjQxbl
	YCgQqf5x0tuEJF2/CFQJd9vTyVBrxwABlA7mEg/hTxXws/0DhtgnCJ82pXXlxY7oa2c8+33ZYvJ
	zLNgcboOzRvqZtXmJpumec1bniTXzVcsxL8O6hl+m1mIWl75iVGbqZjXxg+p/TJvuVp8wv1h576
	EfCFIeEed2DEt321lK+wGc8eGFaQqx5kXtvK5NsrNdLNlh/OCfL6cMay5Hs6unADde0UTomWwFx
	hh3G6LEP6Vt6s9e0pcDteFdGTsecezoUfwiwI3mdYVXoLIe7Qlu4DgySGmLIFspdvRpFh4wW/ey
	hnptxRgVqEW1fWC2twAhE41gBw+dneq
X-Received: by 2002:a05:600c:34d3:b0:479:1348:c614 with SMTP id 5b1f17b1804b1-4803e7f03fdmr82912505e9.26.1769007711000;
        Wed, 21 Jan 2026 07:01:51 -0800 (PST)
Received: from iku.example.org ([2a06:5906:61b:2d00:3190:c653:bb13:4ca])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48042b6a3e2sm24787585e9.1.2026.01.21.07.01.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 07:01:50 -0800 (PST)
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
Subject: [PATCH 1/6] irqchip/renesas-rzv2h: Use local node pointer
Date: Wed, 21 Jan 2026 15:01:32 +0000
Message-ID: <20260121150137.3364865-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260121150137.3364865-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260121150137.3364865-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27207-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	FREEMAIL_TO(0.00)[kernel.org,pengutronix.de,glider.be,gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[gmail.com,none];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,renesas.com:email,bp.renesas.com:mid]
X-Rspamd-Queue-Id: 583E35960A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Avoid dereferencing pdev->dev.of_node again in rzv2h_icu_probe_common().
Reuse the already available local node pointer when mapping the ICU
register space.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/irqchip/irq-renesas-rzv2h.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-renesas-rzv2h.c b/drivers/irqchip/irq-renesas-rzv2h.c
index da2bc43a0e12..20c0cd11ef25 100644
--- a/drivers/irqchip/irq-renesas-rzv2h.c
+++ b/drivers/irqchip/irq-renesas-rzv2h.c
@@ -570,7 +570,7 @@ static int rzv2h_icu_probe_common(struct platform_device *pdev, struct device_no
 
 	platform_set_drvdata(pdev, rzv2h_icu_data);
 
-	rzv2h_icu_data->base = devm_of_iomap(&pdev->dev, pdev->dev.of_node, 0, NULL);
+	rzv2h_icu_data->base = devm_of_iomap(&pdev->dev, node, 0, NULL);
 	if (IS_ERR(rzv2h_icu_data->base))
 		return PTR_ERR(rzv2h_icu_data->base);
 
-- 
2.52.0


