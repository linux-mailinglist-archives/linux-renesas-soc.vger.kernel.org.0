Return-Path: <linux-renesas-soc+bounces-28051-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0Hv3IEm6iWlwBQUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28051-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 09 Feb 2026 11:43:21 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2118110E3CC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 09 Feb 2026 11:43:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D4DB1302B3AC
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Feb 2026 10:42:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4369936827A;
	Mon,  9 Feb 2026 10:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gTYN87vk"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAAF136826C
	for <linux-renesas-soc@vger.kernel.org>; Mon,  9 Feb 2026 10:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770633729; cv=none; b=MR5b6V1EsDBnibYslUJzBq9CN1uApHGk5wHEWKgynfQo8MXZCHCEM/xh8lhTKe5pBOVACamttBIgzq0k/XdKV+PnlpUxfRV8saXabWcMfKX49DgQbMuNqC47rxDPwk0ciftv74wpxRCxVb5/PoAxN6doydAjyHhF9kUnS4kTZ4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770633729; c=relaxed/simple;
	bh=YYEYs0OVa9JHUJNAgRxGuS/RThNKiarmRH+qNjJAqGw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BJNha1TAXyqYX8PGqqWPg3dviTtjPuTi7qZp8fJTLfG8617i/xcTPcLzWp0xMRhBGAsNbanQ+gC/lwe+zREzVC4rGIZdCk4hxDYgGLI9jO7pnmTtXUpzLd1Mf0ymm7zjAdNZQgMEbKsbPvkXyVFvl/zq6LNa7IaHtOsBgk+kOPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gTYN87vk; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-48327b8350dso22835335e9.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 09 Feb 2026 02:42:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770633727; x=1771238527; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7lS5nOyECwdNHUk0qKYzMpv/hk9cm/TFVPk/DA1BNXw=;
        b=gTYN87vkfEv0I9VVpsd43TNFUQvVxGwA/FRLO1s5y/cGks2sg+u0nDA5LIvJWMeK4n
         SvMZzBoiqeP7ehwJJFQfEexbke2fCzsiBvVM357srQa2ADbCR4QIAg3Hd7Ls5SPqjv4H
         M+HNs5JofVAID1cBOwZ9FMtCSWTUbHByDTa6IHEaP83SQMvBQv2sKR61B0A3yeLBpnZJ
         nVruS+swv5G2tGLfYpkLyIPHjtYPG2b4WZcTxyB32o+Tph86Mu5mFc0aijraQof4f94a
         ZJFln5h1u4uAbpavz9SZgbsZk/hf4x1g71YBYXu92dH0xzKQfcwK+fombcAZJAkedzmD
         rKxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770633727; x=1771238527;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7lS5nOyECwdNHUk0qKYzMpv/hk9cm/TFVPk/DA1BNXw=;
        b=tAqN2hVGkMHLMKadbnuazYnxqOHZTDMPrJ+2a2P/n9R2cIqrRZT81UWRaEXCCn92pC
         L1gEbiwKbjlKqSQuCJnJosW1SLbIsVVKtMWGzxTXkVucyDlpMvjC28DhuZDhHMTZRfOp
         56ICAYcgZUC+jcHDYI6yvjQ0oFEZRf5AFaCwQk5fH49+HpJwQbP6Enw5sZXH3KlQjlDn
         rtRpimQ0cx+feBPEY5racJSwFzr4c/MB7lJghFWj/PmKLG87v3N4moUNRKnePR0QTQ/W
         dxuNWtryubv/d5wjpQimj3bb5pPN1f+rgshtzeTawdwlRYNljACfnMlPCPYQRYipwpTr
         t7qg==
X-Forwarded-Encrypted: i=1; AJvYcCWbmqcQwN+n4p03UlPNALvwziU1Gae3VUJrxRH6LeEpWFsPdpyPa5rH3uljA21wBdWzGemYztJF81NJn+sKpct3yQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+MKta0z8lQFHFQbiyxogWXkQTxKfZWgWe1fLlV+K2zQ2de3s6
	9K3di7YR42WH9YBxKVH5daOm5JUYGvZxNGM0AqhNKGfMtRT4n3WV/r/r
X-Gm-Gg: AZuq6aL5tCDiNXespSCvRad5yfTFY7YBvIY+/xGU+LCBvHOUjKFBtRRvqZz9btQ8MNJ
	pb3WTiKA9veBxfhhXJCT6xIOSZEMXnjz+5UPUcuxSi2X87gitfybL+a6Tcb/o8sNQRckR+N7cUK
	x5cYXgptvm6KZ5D74HHZdFbevFA3XrMimeI+SHD1ELjIi4XFoNRrdnJlPq8Gm5yG0f0EhnM5xdh
	/G009x18WJCxq9F2fdacmzF6glqYpM3PzEtsHbswIZ32BJFBWeZZvGcP9PXmCpDsMWR7b0sqkN4
	9gOsDW2zjDfyIy0T8RdN6P6AyAFcv1lkQjGPtcGlSLFmuz+TfKXbdPsB+uTMwrY0wktM78Stn6t
	Uf3VrHctF6PUfHE1lcuSDfj9AeFMRR29+3xY6sINaCp4nESFNL7wN/+Euh4RH84dox0+soKwKDA
	BFSdAzhy4FclK0e3sWgp68D4CqCvH93OcaIzbMIxNp3RbSsetEBp2y2fLpgpZnlnqOMk7yHS5q6
	Y2GKBwCecgH/9IMZ4RlF5WkpHOiqXf2oq0c
X-Received: by 2002:a05:600c:1d01:b0:480:1a9a:e571 with SMTP id 5b1f17b1804b1-48320213a37mr162115645e9.22.1770633727018;
        Mon, 09 Feb 2026 02:42:07 -0800 (PST)
Received: from iku.Home ([2a06:5906:61b:2d00:436e:8b6:a7da:63b7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-436296b20fasm25962211f8f.6.2026.02.09.02.42.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 02:42:06 -0800 (PST)
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
Subject: [PATCH v3 1/6] irqchip/renesas-rzv2h: Use local node pointer
Date: Mon,  9 Feb 2026 10:41:15 +0000
Message-ID: <20260209104121.26172-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260209104121.26172-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260209104121.26172-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28051-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,pengutronix.de,glider.be,gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email,bp.renesas.com:mid]
X-Rspamd-Queue-Id: 2118110E3CC
X-Rspamd-Action: no action

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Avoid dereferencing pdev->dev.of_node again in rzv2h_icu_probe_common().
Reuse the already available local node pointer when mapping the ICU
register space.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v2->v3:
- No change.

v1->v2:
- No change.
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


