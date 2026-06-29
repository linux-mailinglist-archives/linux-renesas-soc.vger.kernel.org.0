Return-Path: <linux-renesas-soc+bounces-34540-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UXG8FjbtQmqZIgoAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34540-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jun 2026 00:09:58 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E78866DEFDD
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jun 2026 00:09:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=OG3W4wj4;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34540-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34540-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 173CB302BDFC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jun 2026 22:09:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17DEA3CBE8F;
	Mon, 29 Jun 2026 22:09:39 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6935E349CDE
	for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Jun 2026 22:09:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782770979; cv=none; b=EJyK134TcPNTakNgE8hajlGraQJzeZ8sNC05CWX0NKKLlbvxm7SKanaJ0rsQmGRUiDn7TatDLdVfpRy1ouKktwQT9ypg6YN+FUQE7yU04VRHK76D4bjK0VEenViSWLVRsXymlSvobtuv9+6cN5tpgcQLqrLloVnYvphPmGnYc1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782770979; c=relaxed/simple;
	bh=dhQzi1x48ryD4rJL4k1XyVX85Y0JnOS0wR5MAkVSy84=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TXgMCcgARyJ9UNgrPMY/eUU5Cao4cfloHlRIhiqYs8MAoTcdNRsIyI2Cye3zaWfg4O/i1EokGs7wvaWBOsRuqoHQlzBetjcj7nm2hTvNy2hXSz++h1OyAam9l/FuGNJbMOjm05TMksQZqXIL720kVVy1OH02KM+r/6zE9Po+AwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OG3W4wj4; arc=none smtp.client-ip=209.85.221.47
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-473ba028d46so1466842f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Jun 2026 15:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782770976; x=1783375776; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iRJkjt8AickuNlQZaUOz1iy2SuKGb10tp5+3LWknCq8=;
        b=OG3W4wj4o2y27JcRQMqeS4mDgZZVuBSeJ+6VGDOc5oyd3MaicvdS3663pPq0nCZ7Vu
         93GGnQcfa9mchCdwe6Xebs0o9EqacztF8j9jzZhcnmxQ5NCsRbbV3xiHhcMaX16dxUcM
         PirTmu24GNxyYib2bEM13CckptUFb2HCjMinRUkrqEPCFEhNnZCEMRQ1+feKcfrRe6Zv
         OO6DjLBhqNhyY3K6mKYWA1zXGNtNcotBY6b8T3jehr90sw7DK6UOc20QhIS76aHlL9+h
         b+T7myqbJyErWo+pHzHXTvBE5io5XUpj6GIdtBUA5ugrD/W/ngOhipRfLRV/z5Y7c9/x
         inAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782770976; x=1783375776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iRJkjt8AickuNlQZaUOz1iy2SuKGb10tp5+3LWknCq8=;
        b=d66prsD3AhB/fGO7GPl2mBcwyDL96rCYMU+qm7EnnRuDcwefV6byQluzQ+Bwhp+lhT
         vTz4nGaxXRxp6aPIbHYdPwAbXrPigd6LRa+bynGnvyeQMveS49GcZiVINDCp9VVb2NYR
         XT2g+XPzk/FSTJzKjANrY3k4devpt7pNbzgYDIb3yKMU46Lx7gu3DCL9tTx7s+Sp7yAK
         9N9G362kRooTJNIz672bqlCRdXHbpZag4hw65Qjc0paKb2/Zq5mrhEpihVBrQ5rIdavk
         WI61+E+twFgB6Dm6SN6lB7GHJ0xzFbK8yJDT0cQTTlQXdK1sCKP8Y9HAfr5MakOMuXvx
         0uRQ==
X-Gm-Message-State: AOJu0Yzkr0hUiT2HuXRO4XKG3Pe1450PhTsi5BCnK+JbMUJErrepCZ++
	/tnEPty/h3p1P2nNubisD5F9A4Ge4NZnEPqsXm7boi1kdXPnEgSXRRvp
X-Gm-Gg: AfdE7cmPIalv6q/E5+IFRVJTH/67OFvphrTVKfUGDtijUzEBRwvfBCVlTsf4l1den2w
	DzIjfnf6QAdesCNk7onl9W/ChY8qh393iKznQPt/ZBlSwvAjoyvqWhYvOgBarORzn1/wir3cbv6
	iZjFO/rkZYrcYZkFgLhjNuCnwEyVW34dVqgd9DJ88UFHIv1X+UYSpXxVHOOWkLICpAo88iGjH5H
	YI6CRwCXqx1/CUTN9E+DC55ee2t8vhBbcfnKB8SfY61NOKN5ggWoZTpoqDTVFVBQCzUtowJtqia
	hjOqzRtbOMwDpWHoIHG0bnd5ZlGyGcf3Uty/aCuCjuKePHcBDPB/rprAGkqGFB9zDa+Tcm+ZNRm
	yAjke6KCGCfjpr63gumhQSKx5QN0OUiLMIMoXRWHeFeuIzKRman4K5FMyNJ8L1LGPH/i29/dxtx
	MU60ljKtEv+l6f4F5E8wssG5xGmqHCm4/0AY+xbR9fmvRUxiAjKKqrM6NsvQU02xomcPreueTJ1
	0CYD3rh4YfifmHW7aH76pms7vU=
X-Received: by 2002:a05:6000:29cd:b0:46d:d90b:bbe4 with SMTP id ffacd0b85a97d-475524a86c7mr963076f8f.40.1782770975813;
        Mon, 29 Jun 2026 15:09:35 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:dfcc:acfa:dec0:e556])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47563d195b3sm1644670f8f.8.2026.06.29.15.09.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 15:09:35 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-pci@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v5 2/4] PCI: rzg3s-host: Use shared reset controls for power domain resets
Date: Mon, 29 Jun 2026 23:09:30 +0100
Message-ID: <20260629220932.861445-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260629220932.861445-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260629220932.861445-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34540-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:mani@kernel.org,m:kwilczynski@kernel.org,m:lpieralisi@kernel.org,m:claudiu.beznea.uj@bp.renesas.com,m:robh@kernel.org,m:bhelgaas@google.com,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:p.zabel@pengutronix.de,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:linux-pci@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:prabhakar.csengg+renesas@gmail.com,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,m:prabhakarcsengg@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,bp.renesas.com,google.com,pengutronix.de,glider.be,gmail.com,vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,renesas.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E78866DEFDD

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Switch to shared reset controls for PCIe power resets to prepare for
RZ/V2H(P) support. On this platform, multiple PCIe controllers share
the same reset line, requiring shared ownership of the reset control.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Tested-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
v4->v5:
- No change

v3->v4:
- Added RB/TB tags.

v2->v3:
- No change.

v1->v2:
- Updated commit message.
---
 drivers/pci/controller/pcie-rzg3s-host.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/controller/pcie-rzg3s-host.c b/drivers/pci/controller/pcie-rzg3s-host.c
index 66f687304c1c..cca2617f2915 100644
--- a/drivers/pci/controller/pcie-rzg3s-host.c
+++ b/drivers/pci/controller/pcie-rzg3s-host.c
@@ -1277,9 +1277,9 @@ static int rzg3s_pcie_resets_prepare_and_get(struct rzg3s_pcie_host *host)
 	for (i = 0; i < data->num_cfg_resets; i++)
 		host->cfg_resets[i].id = data->cfg_resets[i];
 
-	ret = devm_reset_control_bulk_get_exclusive(host->dev,
-						    data->num_power_resets,
-						    host->power_resets);
+	ret = devm_reset_control_bulk_get_shared(host->dev,
+						 data->num_power_resets,
+						 host->power_resets);
 	if (ret)
 		return ret;
 
-- 
2.54.0


