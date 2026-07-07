Return-Path: <linux-renesas-soc+bounces-34817-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id T/qqBGQPTWqUuQEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34817-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 07 Jul 2026 16:38:28 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D790771CB9A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 07 Jul 2026 16:38:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="KCRFzb/7";
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34817-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34817-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BC9EC3013BAB
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Jul 2026 14:37:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FFA1430CE2;
	Tue,  7 Jul 2026 14:36:58 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DE2742F70B
	for <linux-renesas-soc@vger.kernel.org>; Tue,  7 Jul 2026 14:36:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783435018; cv=none; b=ZNdGRvEcc6l/3PVCWMXXdpB7RRDLT28hyZ6XIp8zQtzikIRCJ2MYDoLJzsUPxToDmKbjmS/N04u4sfORm9rjHx67w0YnOR/ex2t+5bA6Ppd4TRsj4bIj6OGr2qNeSJM6eXaHJUCC57TpEBBc4zaWwd90HtPNpaHF8AEKto9L5hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783435018; c=relaxed/simple;
	bh=tTWsR1dcX2Sx2hfuZqCAoyTVgkz+twFGsirehBNh8eI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ofZX/KLCxwx2U40CJRzwZunrYiKzYsH4tJSB1OJ5eTGJ2IK/O2uND+S9nOYpU7nWA+1UmSuNSjjvRP6jNQsrG6BpfGhO02iFpdSq5LU/qOLTsKsw1X0ICfvsCziMhqWMBHKg1Xz/2BmAhkGL6R2QOIynh3V0NIuW99Ck9O1LCAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KCRFzb/7; arc=none smtp.client-ip=209.85.128.53
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-493c2b3dc8bso29439045e9.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 07 Jul 2026 07:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783435014; x=1784039814; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cdRXTcMj4Onw1pyuyV/CzNlqHWy4qmYuUhikQS8dT2M=;
        b=KCRFzb/7ATsk12cCzrNRsuKASy62ewbZVXbANCK+uJxNaPlnEwuX/Kl7U5gOMoW/yY
         +Pej15qsvU0UjC0Dv9X4EY3IRZekRk6P/+jGnKSvKsoyWH6/icN2OzKgIubYUnFM5Hzq
         FsfncnYroC+6tg80+Fo6YBKU9uBMLfdf/1ua7+JBUt9TesH+7jzbXSv+Ufeze2VYm8kJ
         DUQxIiiZ7EeaJd6GKQV45CSvIrHlHNgwlgbyvlhVm8fRM+GzWQw1Rtiosi+SpFFPDYBa
         0Sm9YpgIe5+2xjXwCSwzhxTDESoaOKdDiO5ttucfeE3LUcyyjypW2hnBuGj0dBqe7K1a
         zf1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783435014; x=1784039814;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cdRXTcMj4Onw1pyuyV/CzNlqHWy4qmYuUhikQS8dT2M=;
        b=qX8ZNo5AbJOJ1KonTssWgiRAihg78f5c2dKp1yE6fFzFff9Mf/Q0VqHhRfYv9ZI3QH
         t0hsSA/AVRD6eAkA2lOVHPoux8Lae7U0y/9jTOY2vBjcBLynDRGUd7zwipn2ANhOVz6e
         uIyZuwIUn4tLlv2/1B54Y5NXleKzJa8HkrVFK9Y5Md2roAmwk0olwrK5E3KncbrEfQsS
         69n4i63+A7VvpqCqYmGqNOVW6bAQ4sman+TQLGuRlfa5uMNrN6hZoNZ6x/Jam0tqjjqJ
         XUmlZ6mrUOrYE1RCQp31/LVZ6emTgN3mk2TzrpMEizgiOsfn97blKrIWEoyU5/N5GbPG
         GNzA==
X-Forwarded-Encrypted: i=1; AHgh+RpZJhejzwiV9BiZK7qCojXiYk9aduReg6V03HNZKCUIkEa0/5LdmdXZac5vzci/aD4ldcqpOF0EHABfH3qpkSsxqw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyPMxBxTKDYfOeU3EYgQsCF/GPK5yI+vd3X8+aRphtow4qyZbDS
	eCP7CV4/MzHF76Otsf9qX6Ki/GuF8LRkao1lA7V3gF7jUg5Z2BUIQM5P
X-Gm-Gg: AfdE7ckXA3FW3uAYgVQw4IZ9s7BZBNf8uJYy+2MmVyeaT6NBBc0sD3fpqX6wv/uLW6z
	XxdTiVmUHFXoZawj4XNIO3UJpfplYUAsXP88Ezk0KDnMiFO3TNFxgZbFyP+7YSHkGgxNlGrjGs1
	two2pTFtrxWzhvG026A93/caIZrTUwN+9otJfpYk/FJBEuTOg4wlYrRK/oU4+cxzOanmu9NUo4n
	7wlyHNQEFXkKA3XNkc4R2HKQTDSB1154q1L+6MvJEJ4gCzlP6HgPS/KP1N8uLUXxa4nHqqImOD/
	C8VVOlwH6bOcwvEC4BylhfuhLgf3rvfR1zAJzhuBcg8FOCUidkwIeKaus/HOOo5BNhlVSVweIn7
	Bl6pV49wqEZuDEjx4BfM6CZCXByAaDaeirBIWXxcAFEHKWdJ30C+mjChhvdRxSbidBv8phXKx2f
	wlcUtlj3Upw4/WGtdE7EnGt9bIoUdTWyr2qEJd2g==
X-Received: by 2002:a05:600c:3b0a:b0:493:c8c6:4989 with SMTP id 5b1f17b1804b1-493df062bb4mr55744275e9.6.1783435014215;
        Tue, 07 Jul 2026 07:36:54 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:a4ac:4e7f:194a:852e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039ae44sm33228611f8f.23.2026.07.07.07.36.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 07:36:53 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Vinod Koul <vkoul@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-renesas-soc@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v3 6/9] phy: renesas: phy-rcar-gen3-usb2: Add RZ/G3L support
Date: Tue,  7 Jul 2026 15:36:38 +0100
Message-ID: <20260707143646.245177-7-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260707143646.245177-1-biju.das.jz@bp.renesas.com>
References: <20260707143646.245177-1-biju.das.jz@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-34817-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:yoshihiro.shimoda.uh@renesas.com,m:vkoul@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:biju.das.jz@bp.renesas.com,m:neil.armstrong@linaro.org,m:linux-renesas-soc@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:biju.das.au@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,m:bijudasau@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[renesas.com,kernel.org,glider.be,gmail.com];
	FREEMAIL_CC(0.00)[bp.renesas.com,linaro.org,vger.kernel.org,lists.infradead.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,renesas.com:email,vger.kernel.org:from_smtp,bp.renesas.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D790771CB9A

From: Biju Das <biju.das.jz@bp.renesas.com>

Add renesas,usb2-phy-r9a08g046 to the OF match table, reusing
rz_g3s_phy_usb2_data as the PHY configuration is shared with RZ/G3S.

While the PHY data is shared, RZ/G3L differs from RZ/G3S in that it has
two OTG controllers, OTG interrupts on port 2, and a controllable
OTG_PERI bit in COMMCTRL for host/device switching on the port 2 USB
controller, which is fixed to host-only on RZ/G3S.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * No change.
v1->v2:
 * Updated commit description.
---
 drivers/phy/renesas/phy-rcar-gen3-usb2.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
index 9a45d840efeb..d06fb52ed5f1 100644
--- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
+++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
@@ -721,6 +721,10 @@ static const struct of_device_id rcar_gen3_phy_usb2_match_table[] = {
 		.compatible = "renesas,usb2-phy-r9a08g045",
 		.data = &rz_g3s_phy_usb2_data,
 	},
+	{
+		.compatible = "renesas,usb2-phy-r9a08g046",
+		.data = &rz_g3s_phy_usb2_data,
+	},
 	{
 		.compatible = "renesas,usb2-phy-r9a09g057",
 		.data = &rz_v2h_phy_usb2_data,
-- 
2.43.0


