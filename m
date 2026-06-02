Return-Path: <linux-renesas-soc+bounces-33452-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id H+STImI0H2raigAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33452-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 02 Jun 2026 21:52:02 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E39FF6318DE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 02 Jun 2026 21:52:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=PNnZCnSZ;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33452-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33452-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8D2D23034661
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Jun 2026 19:50:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2020A372ECB;
	Tue,  2 Jun 2026 19:50:32 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E93C92853E0
	for <linux-renesas-soc@vger.kernel.org>; Tue,  2 Jun 2026 19:50:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780429831; cv=none; b=rtpvzyNfWgxUcLxvSpWGzqJyaxYKC1Lr9JmlVMvu0lz1oDBV7WmrGpTdNuZX9CpseuxD2nY8iPsK3T5+HeBX8b8EEQjE4DrFuOqD9E6UWfsNJRhysL1Xo0bzzMJC0HqpCRAN8iU30mBwcSHCB+nmQjAnkLe4Ad/lx3Lxt/zVt/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780429831; c=relaxed/simple;
	bh=ICsOPPnxezUsTeLqn0LswfluUIrWBBXoACSLyfd4mJM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IFlp/TdNOuFDUltBK+DMLOYwP+Kz7QT1Lj22FdB/dY5RjxaSu7+x8eR5qWLxdMdUkH9u+VMRT7iZhzabPsYE3M4mNSyvf+og4j+4CZFSF+aDw54O+YVI+6kVcZkmQYcNVnJKFdEHb9BQgerHIMgBOFxU+i7LNGMheZBkZLpTUdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PNnZCnSZ; arc=none smtp.client-ip=209.85.128.41
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4903997fcb5so120622435e9.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 02 Jun 2026 12:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780429825; x=1781034625; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZYXbG4suH7pFw0IrR422TpDoJXmZjD7Z4NW2wPRZuB8=;
        b=PNnZCnSZUZJCqguLnv3g3BQ4UAjf1JPFev/n5LqI2oKMFezB4q/wXw7sfvj0kLu2w3
         i9U8RrKJmFwkWncF5JMzWGwnRy5YM3sBnjay7cgqcuTW8BDA23MJILtG9PunEuct0uw/
         c4YGWB+zUS9ORS2DEXz7AX7odQaQeOn+RPqLHUD4TowKekH7UfW9bwn/2fq+r8guiUQY
         x66IayqvwyWy7l1t/pX0rSXTOhdGp264RV9p6mm2Xi7OAmC2kX2Yc4dTiRn7KVwThjxf
         SCGavamo2CGzFyT+UztAP1zLQsCn6kU9wqzcVCWld7ODRJU6WTnGqMi2nHGUpUNXbRr7
         c7aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780429825; x=1781034625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZYXbG4suH7pFw0IrR422TpDoJXmZjD7Z4NW2wPRZuB8=;
        b=DW2BwnUIRQy6ET69RfgoZWla97AcvbvVOv2HWjhdJO768V37QppHwmEgmSz+swC3al
         UmSdoDjuOlhJDe5f/+XqSDISfQUzeBNlCOAzGQ/uR+n96aQUyq5yMRIgt5b3qjMT+OeQ
         uDlz3MsO8uEcudJ8Z7wiTQQK+fs7Q0PYRS6mTKJYEC6PM0CQkDaqBbPEvP/OIlf7Vdj1
         KudqJ5hxmh1wRg5uquIeHznfxkgA944WK/FvcqgJFO+Rp1XILuQNzgQF74bGaQKGnqyP
         rstHC0OpyvLxJT8pFudu97lyRkI61ZiyUBElI+wY/b3oIyv/hvcVtrsR9wuqnzcmqBmC
         D78A==
X-Gm-Message-State: AOJu0YxooGagE1K1S9oBWqeRmvRDO09HdmhBDdcZ0E21gNO9urCmlfVE
	8ZokjkYkVOVbS8pmmrAA/GyUB65D33/6PKBxwz+WlKmDXdfE1N5FiQRt
X-Gm-Gg: Acq92OHnZn937sV8/lm4DJMEAmq8V2rMphBffEgYwXGdl9jjzd1ItySWoqu642FoOjR
	xtnr10psTVCl+Q5WPB/PUDtur0HjC13Fyp0dGveVQpfigw21pLQlgcibwyEXYb6lQPXuM0wk1nH
	S64eokRVnh5TxqAJM1Ssh9GV2BzELJvisimDynK+dePsOt8KeYwe2O/cGYyFD4PJ80IFN7SDnZh
	4ULTHkn+Or/ciAfvCdKxK73bJv+MIwl2q1CqSmS5s6qzx8wdMgxF0BU4Uwdjm7K1KBELvNxZ1td
	Yd4Q+bFPkJzPdfx7KeBU88F8NzOaJtYMrT6g6BtIcZL5/WXoVa6Z05s2bj73Y8OsVTVvzJUuRpB
	gpCwQ+i4bIx/7//MKAn789SY5ty1BJpIA27Dj+cdgWcUcI6UwcJoLEL1sAQxT/nZU4veZY7T2fT
	8W839r8CEqSNYygbgcdKZveQcl0Xd5gFqmvaua5h7+H6Xtv5uhX2kSa2TCICzIssNAzdVz+3nXC
	qyD7naDhTk0jB+r+m7Dadf0xmvM1rBIJBekpUfmCJE8yiKezqBau6v2
X-Received: by 2002:a05:600c:a49:b0:490:b3e7:4614 with SMTP id 5b1f17b1804b1-490b5e64ac8mr3939265e9.25.1780429825427;
        Tue, 02 Jun 2026 12:50:25 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:5ef:9913:4a77:3bcf])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b0e13eefsm87353395e9.2.2026.06.02.12.50.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 12:50:25 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
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
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v4 2/4] PCI: rzg3s-host: Use shared reset controls for power domain resets
Date: Tue,  2 Jun 2026 20:50:17 +0100
Message-ID: <20260602195019.1798126-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260602195019.1798126-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260602195019.1798126-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_MATCH_TO(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33452-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[bp.renesas.com,kernel.org,google.com,pengutronix.de,glider.be,gmail.com,vger.kernel.org];
	FORGED_SENDER(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:claudiu.beznea.uj@bp.renesas.com,m:mani@kernel.org,m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:robh@kernel.org,m:bhelgaas@google.com,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:p.zabel@pengutronix.de,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:linux-pci@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:prabhakar.csengg@gmail.com,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,m:prabhakarcsengg@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,renesas.com:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E39FF6318DE

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Switch to shared reset controls for PCIe power resets to prepare for
RZ/V2H(P) support. On this platform, multiple PCIe controllers share
the same reset line, requiring shared ownership of the reset control.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Tested-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
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
index d86e7516dcc2..a5192e4b58df 100644
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
2.54.0


