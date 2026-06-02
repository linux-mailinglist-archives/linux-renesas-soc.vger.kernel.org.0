Return-Path: <linux-renesas-soc+bounces-33446-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id srxrMy4vH2riiQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33446-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 02 Jun 2026 21:29:50 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 292BD631678
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 02 Jun 2026 21:29:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=LcNIGMvP;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33446-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33446-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 64F5F300FEF1
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Jun 2026 19:26:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 805DE3FD122;
	Tue,  2 Jun 2026 19:26:14 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF9CB3FADFD
	for <linux-renesas-soc@vger.kernel.org>; Tue,  2 Jun 2026 19:26:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780428374; cv=none; b=XoF2WHOr5gUGS36eudpvPpSe1JPKkJT6TxeP9tlnw7l2N7sM2oGPNYqmhTon9qlX8gdTtXbyWTwFC16haDzyg2wfG7ey2FN+fdZ+9V1WLK+EWOiQxjK5fzsp/GGx68tkVdn74QyCwHdGaW9JxXkTd318nWGiIR6zGJuYeOb65ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780428374; c=relaxed/simple;
	bh=Pq0svnGPa1u3UfwlKgWp463B8xAdVz9dn0+Hs3N2waU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IZkjkGRWi/1d4Hdrq/Rh101A1hkH09cH5pYu7e/CsO6nr5BJC+ybVnTjt10G30tqN4VpWA5vTbtdkpA/FADzLwdAQ2OL3VNMAwpq9OOyDkQM6jdblsR9WtZJ/ZNvMdYRxvnayqwbyzIohkZv83htW4nXwWr0b6uXt73DIHrpdV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LcNIGMvP; arc=none smtp.client-ip=209.85.221.53
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-45ef189aa1cso3959558f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 02 Jun 2026 12:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780428371; x=1781033171; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D1C75smfFsRKbCTgs6OXcvR1GgVjxJ7f2dUMhEZaFrg=;
        b=LcNIGMvP8AsP5B46MFNPvJ3RepFhX7A60l2PuXzptSyCbTjEDvTVayGcl85E938Mkq
         pr5rDfODU042i3CwCXIgZUv1eOquY15T2I/qSIGYU3UqvMwN2083SXec7vw8v2IcDWkv
         w3L2AZFadWmU3qZsIRojAKwkpWexas8W5z81XUCf0gg/bjbUi3fcvYcqsEFs4mPXS/NP
         BYE2Z8tVP8hvlDZJleYhOdHlRUHX7mVKjzcLI9ZviNIrqC+17XpKHde+jgOK5Z3qC0Yz
         iv4GwG65OM1QBDgeXXiSTPhtUb8J6rbPyGiWhPT3uA7jvrs7Z59BJboTo858UBIS/0m5
         dHww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780428371; x=1781033171;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=D1C75smfFsRKbCTgs6OXcvR1GgVjxJ7f2dUMhEZaFrg=;
        b=LmQ9KULf74fNrVellJMv9LMUoDC00xuh2eFhm1sLvs+jPziXKQS+9PdP4rv8Szj9SK
         NO7bT8P9WGhJwFgP0lbzsEcB/4CzOIrD0D997JmTdUk3OkS+9HspABZogtcMcmeKW87B
         YXp/B0wMQFZXfdrO703QXQT/L3BBQX5iot04GqUwy8C1RED9cMrMr0QC+49gDNG5ammL
         VKjoZKE6xjdv8RkEj8ZyC8ADj4gpUAj8sdAQM28bSSR5qk9oAABQ3CKA8cIvKceTmJrv
         /aebQ3aer6wIjoinHdqtZccYIPnTVZnaaTrew/+SadP6H8J3oS6qUlb1CtCvSZkM9z+y
         PaAw==
X-Gm-Message-State: AOJu0YxPSkCplwaGxF0Syxrt00PSf1HyhS7/qHewYV3/L9vZqVOJViB2
	+JURINeO9Gk+fxclGXUS7xTAhs4thrTYrEmL1hQT/dCqhkauGRc/muV0
X-Gm-Gg: Acq92OEu42+PNddkf6bMBZcEzOE6SpR+5uLhrb4YEQEyXzV0Pu6XotsJZ24y4eJ9SMR
	xreHkZ97I+28nSddUtblpxDgCIpIpCJKqSmL9udEj5gCiI9BmID1q5XbzkAqetKQ4ypgDNuYN8/
	k5iFnlv4gns/GLOeXXP4jgIOwAa3JzczRB8DMeDtWMTu/FVxu6WEPSIxoGReKMFdgD8fK0kSVL6
	31T8cT5j+42nSXRAjsJ117TT18QvCfbLdCbDNGNF4b2lzj9MMlclO7WdmfX2sLENoc1WwWRbrE2
	yxsF6mMIyZ9lMmdpm/U2zUy9RFLq7N3/X9CdKkCN+vzyp97cpGMyxNn6TwyMwnySRlGRtGiyqpi
	uWe+NI5G+TPVOGkplOH9h/RSJirJdlPr+wR4rNJc1izFt1uKM5OFUJvPa/I4gL6lxEAa6ecJ8G3
	AcVURGBIzdzsXrw2BbA3TerHfONj0TUyEHhwg0fhYnylfq7azvWet4c9TXGas2kBs8RN48F/XsS
	rgTu9OGsHKSYQTH0o97xgZ+3Uxxjgo1xA9/5xS1J7sd0MOBZZYl145JnPeQeccyjVU=
X-Received: by 2002:a05:6000:1a86:b0:43c:f90b:5668 with SMTP id ffacd0b85a97d-4601f6216b4mr1021407f8f.23.1780428371405;
        Tue, 02 Jun 2026 12:26:11 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:5ef:9913:4a77:3bcf])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dc577sm1473364f8f.3.2026.06.02.12.26.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 12:26:10 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-rtc@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 4/5] rtc: renesas-rtca3: Fix typo in rtca3_ppb_per_cycle documentation
Date: Tue,  2 Jun 2026 20:25:58 +0100
Message-ID: <20260602192559.1791344-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260602192559.1791344-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260602192559.1791344-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-33446-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alexandre.belloni@bootlin.com,m:claudiu.beznea.uj@bp.renesas.com,m:geert+renesas@glider.be,m:linux-rtc@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:prabhakar.csengg@gmail.com,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:geert@glider.be,m:prabhakarcsengg@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,bp.renesas.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 292BD631678

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Correct a typo in the kernel-doc comment for struct
rtca3_ppb_per_cycle by fixing "adjutment" to "adjustment".

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Tested-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com> # on RZ/G3S
---
 drivers/rtc/rtc-renesas-rtca3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-renesas-rtca3.c b/drivers/rtc/rtc-renesas-rtca3.c
index 8763745b9172..97e7e65f59a5 100644
--- a/drivers/rtc/rtc-renesas-rtca3.c
+++ b/drivers/rtc/rtc-renesas-rtca3.c
@@ -103,7 +103,7 @@ enum rtca3_alrm_set_step {
 
 /**
  * struct rtca3_ppb_per_cycle - PPB per cycle
- * @ten_sec: PPB per cycle in 10 seconds adjutment mode
+ * @ten_sec: PPB per cycle in 10 seconds adjustment mode
  * @sixty_sec: PPB per cycle in 60 seconds adjustment mode
  */
 struct rtca3_ppb_per_cycle {
-- 
2.54.0


