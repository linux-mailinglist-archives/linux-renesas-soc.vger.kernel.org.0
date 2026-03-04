Return-Path: <linux-renesas-soc+bounces-28755-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oAnRB68YqGmgnwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28755-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Mar 2026 12:34:07 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A5AD61FF071
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Mar 2026 12:34:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E5DC230805F2
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Mar 2026 11:33:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2A0C377EC7;
	Wed,  4 Mar 2026 11:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="by2PchZa"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FBC936D515
	for <linux-renesas-soc@vger.kernel.org>; Wed,  4 Mar 2026 11:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772624002; cv=none; b=PFbEflAn1U2vPU7s7ZKIlAISxKaE73HBVXPjDWiNDEM1zJZdPYOkpHiCSUzr/B4Na5ALYIxMhmYfEHK1tNDamlJyZFFkQbJmyrjK1l+DCa00oYp2cp226xLb3G3//OJ4hXeRgfgMS9cmm/d3HotsmxTtUm4RqMI5DK5CtcuoFAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772624002; c=relaxed/simple;
	bh=l65YrjWfnzVqjLUJqgoB839k2YCbavvG1M0FVtjIv1A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xm24x4prHEVN+yzT5UvyHKXvboNKuCON2XdlvfqMHGEn+C7hh4WrPKkv8M45DpbY19RjVHxMWsfbtcxYKfn08WJQmowgEleuyeoSVIkcbQOK1EZx65ZaLyymALTZw1EEJttuXz2XPTtGzFCqBC9NGhmYWs4s+WNeNu5LHRN6eZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=by2PchZa; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4836f363d0dso59686475e9.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 04 Mar 2026 03:33:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772624000; x=1773228800; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Zd3jIzHzz21AHgX9eoicCLchGwYYyNKAYVckUex35s=;
        b=by2PchZaO3nnuwR+Xs0XXYofpb0NiFWOhh7NOOJgh0b3KRZimm2WetQBRi+p93pxGn
         vXj5jz+wJSfwoLnqOUoQQUrqCWk7rSeKdbE2334YdcE63mDJ/KbUzuDzTaSl1KIJS/+z
         b7KCMqiI4BaFV4xPjoi4mbtr0S60ocI3NdhVfATbHbz4yXQYqGNE2eahzt1qTGkkOQnP
         jhppeD7DIH539kYLp72nbX6IOutbe93s+EdQ3WchZEkwkkC4+SmxwmYSRLHM1Du0G6kB
         Di+UVhxFHI1Y/kaNGXWKz19d+xCceDZZTKh1UAduU+B0Xkyno4z6cteQL5J1IjXhxuIK
         Kanw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772624000; x=1773228800;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5Zd3jIzHzz21AHgX9eoicCLchGwYYyNKAYVckUex35s=;
        b=DdPvYOKryyCtUsiW+HGMjLXTMgS+dXseOHlqC48XyKtPCR6u2bxftjvdvkfCrPFc+E
         4No1kvCcyE22KSQ3XC+sVGnHJtI29ZQ4b8QKhFU7HS4jewL9bpubA8NjKhnMoWy1IiEX
         E5Hhe5Z53Q6k4CoZez0++ULnccJHwpddloP24LS1thGOaGd3MyJrmfvKpQAuRwEFBli0
         QHj5LhsB6/OYWdZxWm8wqxmZa9FNzloF7CLjpcYOVGokr0RZ9h1okdad7/75Hjjl2kNA
         zUFgssuuX1di2I4dCT/3iEdUrbJWQWAedwDr0h3jRUS0Upukf2mKh0G7KeNdabYShPrn
         l6hg==
X-Forwarded-Encrypted: i=1; AJvYcCXdG7lFPMNJKQT0vCGE8e0Z/OQW88Bt4SOWpdJ6bkloqDv4i8XGW2Bi1eDy3VglzA+UXqDuFgnxeDx/KKjI1y4xQA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx76gLGgds3ckX/UHvFypPfRX20fZBW1ACdvk0j/tVCn9xSwaMG
	rJtzd4CdGB4wQ+br269IE0ou4SMemv97QqXB0D+x2RXzmxj2chEjFqNH
X-Gm-Gg: ATEYQzzo2fofTRQ18RQ2ot9a6IOFocXj2qVv7YmLDszrmpsAPFkLOO07e9Mbqu/N9T5
	NtPgmborA6fsYB8Z8/uCmCiyOxfTLwvgK9XtVXlUxZwyL0phLOqJ/XtuXdYRfwyTTLonzWSEO+V
	lIhKnzAmEg4YfBeQeE9mbt2dcXG2lv2IQo8NEZW8vN7JY60jqm5k9ziJC3eoV/V+rcnBN59O+gD
	dj9LfR+1wc3cMGnKoDihxWIBCuQr/QsbX2FnBxTdNKitsGOGjPv9DYBh6H/0QLke4KMFadrpJVK
	bnh7gakDI+JG0jeMJrAM0Fh6UkMUZnyBhtYVWdz1VA0pTl/mZWVjEQqE18BM89xzmziLad16ob0
	Q1T5qs9jbExBOl0ZqLdqt0djvaZoBuYC972sfjbbPBEy+2yQruN4S5MttFKkbJhSm9+Xvxl6J1T
	YjcbCqY2MJorc9BWFZHP7bhFQnpcX6ivi5pPxlbSrXB7g7vd5r9VFa19O61mPyna4R8Fzpy0S/s
	6xyYev6vuq6puJZri1J23imcCK+goHF5nteWWXLTiPxN4I=
X-Received: by 2002:a05:600c:83cd:b0:477:2f7c:314f with SMTP id 5b1f17b1804b1-48519846ca8mr28410085e9.10.1772623999709;
        Wed, 04 Mar 2026 03:33:19 -0800 (PST)
Received: from iku.example.org ([2a06:5906:61b:2d00:bddd:d1ed:d1ee:a876])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b03db76bsm27345379f8f.18.2026.03.04.03.33.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 03:33:19 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Thomas Gleixner <tglx@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v5 1/7] irqchip/renesas-rzv2h: Use local node pointer
Date: Wed,  4 Mar 2026 11:33:11 +0000
Message-ID: <20260304113317.129339-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260304113317.129339-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260304113317.129339-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: A5AD61FF071
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
	TAGGED_FROM(0.00)[bounces-28755-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,glider.be,pengutronix.de,gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,renesas.com:email,bp.renesas.com:mid]
X-Rspamd-Action: no action

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Avoid dereferencing pdev->dev.of_node again in rzv2h_icu_probe_common().
Reuse the already available local node pointer when mapping the ICU
register space.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v2->v5:
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
2.53.0


