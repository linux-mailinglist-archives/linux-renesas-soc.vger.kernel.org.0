Return-Path: <linux-renesas-soc+bounces-29768-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cNGAJCCfumkkZwIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29768-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 13:48:32 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F3EFF2BBCD6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 13:48:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DBDEE3059F20
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 12:45:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA1D23D75A9;
	Wed, 18 Mar 2026 12:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GKNM7hP+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A2E43D6CC0
	for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Mar 2026 12:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773837918; cv=none; b=nAZsiljFdOYVC2ha8acoStCnnDKLovefwoWwifCuaXe0fwiYiflVhZF9cCZjEkhHc43eyshzPN+dlstBgKAOU4CR7sHKGkXAslqysLQz99hyox5Do06ySQHm9/z7f4wIpFIWlg8OfZIdnWVwrOCjPy8WQGCp+UlGFz4mdJh2bgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773837918; c=relaxed/simple;
	bh=y/c7YJ4/WBiR1is5iKdiPia7zTBbuMjAOEBqoP1c5EM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YAEWgJeQH7uhg+gNdinCIEmUZAIc9fWLR3m83rXD/aFX3bFJ/sjrZRT8A2Yx2QwXsGGNNGoL8f96ChxoHDLlM5XBceF+MNaJVb5l7FqDJgNhXh0B1MZdBMvLEXbBWuMZVv5aXIZJaO8UkRNDKm2bcLFzOqtmGmVNQTppkEFXeaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GKNM7hP+; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4853aec185aso56284735e9.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Mar 2026 05:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773837911; x=1774442711; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yDiUi7ubyDY0I4Yajxf6etnCfMlRy3CfGIC+JcvXXq4=;
        b=GKNM7hP+oEv8kRCRntSmAPteez9fNj4jOJ9PsocWzGRJ7U6//qz5LyCyfWI/QadSMd
         GeQWYR1b0fKnbHbuly006OWdY5j5NQSxqKqUp/igy0rgDAByDyzNKsB30igR1tZnRdg8
         Um3+MQnk8jupI81kGWHHq3MK5pxTNr3KJAKNDgXR8J86Cw2tZKun0s+pDWDjwGc+bs+E
         6kU2cFDAWKxOHCSwair4+NMqtptdNnVpPiwwxMh8tZIf4mBaqwB6sHnbSlojTb70IWlH
         YXuF4qMdYyrqGh3TtRYicPKoGQfxi4f7t1rg/QTY5KJ77JSfFOF7DXpSuF6LRRl1dc8x
         4OKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773837911; x=1774442711;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yDiUi7ubyDY0I4Yajxf6etnCfMlRy3CfGIC+JcvXXq4=;
        b=JtQ80bqZJUFOP//ZYReXVzcJnpuQiDpode32wA1a+E2RJ146NX0JJyRPkJl3TFHIwQ
         g2IpFSnNP2ffDp9laY9WRw/8RNTAavZ6z+JP/L5INs2t2oWox/hdP1p9h5X3k2c6KhDR
         TJFkuoW/eljGmwGUyT1XQRtqMDd5qX91Ev0HRJp+fww23L75I2E8P/Hvq2ubwHEAyh88
         Q94WBrgfLgQ7ZBfSyHx9jBZ+A7eEr9ps9kRySHwb/t3IDjZjZnTqtibiNDltnto6TgAg
         d4FTPm6Cl7HY6OmC18WoqQqYwYFRuvccDJRiKW4tOfI7IwPjx1relHLeZn+v6HjJ56Cy
         tt3Q==
X-Forwarded-Encrypted: i=1; AJvYcCWftWOIb1FHYMdBHA1msCoKYGm+r03XZ9BrtfA/01MQFzmG0E9GSVqQRFiEbwKwWO061+lhB9hhNo+8u6Cpen7xsA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzHIAh/XuFDN/bgQt8NqhnkvefKmTINaB3MHdP8E33366UG+VgD
	x2YoMiOAh/M+K94UvQ8u1tXNDduiogj95qhSCw+BgSpFgyLDAPlosdWh
X-Gm-Gg: ATEYQzz/udoYJ8R1a/G2S9VzJkJ+u4pmk+EcEN9RpuQCdZKilNlMZccIiSMTdEJZGdQ
	erRwKdoPfrXsHOnwNchhFlxsZMeYqx+aX+YeuY55kbSKdtQC++oa/7DpXh09XAdLOMUt08QiM8l
	VKVs4mZBlUllVi9whQNUaiGNKIt9k892LP+euI/9I6AgxogbYJTtyGdoPqldyaqi9+j8rI35fp/
	GHVoyBYu6KAWRI5y7ffZLzntOzuJAce5EGQw2ASPu61J5oJn4pJvIChPIRfnfnbPY1rmsRzp4bP
	P1jXZstaBLxQrXrbe77Z31mqqJ05B2ClpJAlPEhimLr5hFa5zEqVzNHbhC+m/fQMpRE4jU+OIG7
	nbzvw1nwZAKZynsTvXwyauTcADRb78ax9rojmfGgIp2ZNFtxufQntCmSQzDIaUZHemAwzXglR/s
	3kUboiCQCYcEGOw/eaUNVc5wHNrBEgl207oSDdTptvTl2YQoeEmjs7vrw8aJdqnZqJsBMTVbcqN
	Yh0U8WhPqp0X+3LpbQm6SZSIBfNcsXon7ydlKgPJbxv+oU=
X-Received: by 2002:a05:600c:1f95:b0:485:2f4a:6ae6 with SMTP id 5b1f17b1804b1-486f441fc07mr51141725e9.6.1773837910464;
        Wed, 18 Mar 2026 05:45:10 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:5f14:a98b:b4be:efbd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b518985f6sm7888162f8f.25.2026.03.18.05.45.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 05:45:09 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: John Madieu <john.madieu.xa@bp.renesas.com>,
	linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 3/5] PCI: rzg3s-host: Use shared reset controls for power domain resets
Date: Wed, 18 Mar 2026 12:44:48 +0000
Message-ID: <20260318124450.163471-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260318124450.163471-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260318124450.163471-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_MATCH_TO(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-29768-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[bp.renesas.com,google.com,kernel.org,pengutronix.de,glider.be,gmail.com,sang-engineering.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com,renesas.com];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bp.renesas.com:mid]
X-Rspamd-Queue-Id: F3EFF2BBCD6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Use shared reset controls for PCIe power resets to prepare for RZ/V2H(P)
support, where multiple PCIe channels share the same reset line.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/pci/controller/pcie-rzg3s-host.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/controller/pcie-rzg3s-host.c b/drivers/pci/controller/pcie-rzg3s-host.c
index bfc210e696ed..c61e011f8302 100644
--- a/drivers/pci/controller/pcie-rzg3s-host.c
+++ b/drivers/pci/controller/pcie-rzg3s-host.c
@@ -1276,9 +1276,9 @@ static int rzg3s_pcie_resets_prepare_and_get(struct rzg3s_pcie_host *host)
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
2.53.0


