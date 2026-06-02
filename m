Return-Path: <linux-renesas-soc+bounces-33449-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pJEOCiM0H2rOigAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33449-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 02 Jun 2026 21:50:59 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D856318B4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 02 Jun 2026 21:50:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=EhfMz0yV;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33449-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33449-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EC3AA300B475
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Jun 2026 19:50:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB8C536D51B;
	Tue,  2 Jun 2026 19:50:28 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D347B3016E3
	for <linux-renesas-soc@vger.kernel.org>; Tue,  2 Jun 2026 19:50:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780429828; cv=none; b=nv09V0AQwDpCG+kLUDvGFlLE4vOg5IxfwDxhyVndhd4DRkAhYzjWJ7dpB6/eHp8/TMizMM0JxOFno2ZdTvChk7dSie+5wB1kWkZ8XqNCstGb77V3LWYfdpOWyrGdtd3Mi4+g8ChKIqc0euujilnt6ZKY8BtUm4rgCRqfjMkui7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780429828; c=relaxed/simple;
	bh=wQyQbCXJyDcxuF7T/MfPTZburTY0O5Do2c1AzrMLeKc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=r388zpkWb2YQReKRrUK+++F8xbwdCylmv7gETOdXyOMEomWzHYRmHwT1GkLTYnxHXexv6/xqgmdCgScM0xs5r4A760hvG8wykqACBB5NqYybSmaHKh7kSXN/X/5R4bsN8yibJH4vDc9olZvCfqdiYqXNbPzFAcFzL5CmCul/hNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EhfMz0yV; arc=none smtp.client-ip=209.85.128.48
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-490aebf33e9so12948555e9.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 02 Jun 2026 12:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780429824; x=1781034624; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZT80MAX+bO9RoRC5OjSLZM3wOHAxfoWPS2zpj0XDIqY=;
        b=EhfMz0yVXQFyZBia98YnCSqkZIwDEozMM+GzthUQybr1FySOyuKxKV0/T/0dkHuQ4b
         WasqgoUdtpKDCxcKcsuCrCDIT8HUclWJEBPitKRTFqRxREJFmKX6VkehfzgQP+Uo5cY1
         45LS22UO/1Llrec9bGkhnYVJP4n+btzSnEGBNhpe7D8KO/gOCZeotl6NG9k4lgjePObU
         ifprfnjKy9oOqSdC3k5Z7EsVT28OaXQtvDAJoI4QK3AZTR8MsapIl9gHyTumeJLnDzG5
         28MiNMCpqVOAGwac5Cbp+8FiGNYzQ1+VWJEFAER0jX0IQmfWAdp2piqdvMjGxcCoUsTK
         zRfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780429824; x=1781034624;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZT80MAX+bO9RoRC5OjSLZM3wOHAxfoWPS2zpj0XDIqY=;
        b=tOl1p4A2zv1g7l6iAn+b2pzkBQ8W/D77OMVAowaRbEBmZLwPey65HVdpsuv6pD9rn8
         7Xap8zIrzK1qFUm+sHxCUVNchpnfH18ALR2F7poLL/nDYkdvIdnwTgwiofo7DqBC/alY
         AFUWO+DVN6goct7cR2hsApr3jWxRsK+OIOoYgZIkJz/jGb6Zab06Ulhfq2zf5EfGvZut
         LuMV7LMBTsUn1nqfenfKPap7GABinu+Q06vutKGfPlKWP+Z9erDxEYsVnIfD0UwZWOAw
         xJhLKweW1f1tprfkLyr36J+VEMubj/kVi0Pou9EafqoYJAqSV69QewzT0Iw+zIBlcBpT
         hU0g==
X-Gm-Message-State: AOJu0YxB8N0NHXeCMl5cxv0b4fkPUj79zDLLuJANUlZ6SGokd8LEYpnT
	XWCHJSmvC8H2xVzVrqhQ3Z/QGEDHggMyU0A+ifGtavSB2pN4Ibidps7b
X-Gm-Gg: Acq92OHvOdSV8rdFNw79ODmloJlN3V1hc1JQ+rJUOC9cX5bJqZmclUrf3PNZtVAz/sW
	w2qgf4i8EfilPMwmjrdx6HcRxS08xdCtqElHabPEs5qCB3mP0Kdis2dWqwH3/nPdHO3gjqWzqBu
	OHliLCstqiIM3H8WeSIC/Wh8c9dwqaoFq5tUWpTuGClIAtb6XfG9RyEM0uE4V1gLhNtwReksK2D
	/bl6Q05SauOpK4/J6W2rgBGV671Ctho7+dgJFW/EzFSGJKrWZ3H1lBd5UaGedexX8h/CRVT18Vn
	N1/LzkwSiTKPev9eKJ4Ou1ah3vURCusGcuP+MHTJIQAyxsS4h6viv32EyMTdw52Cwqg53xIElQH
	87o8dPGhqH3kK23Lwznc/d4CDxMr3nVIVELTfWy80du+/9//DosdfTvOMiaT1KxL+z5MuB/fh72
	vV5IQEofdTF2rvVMgMEJpCYgPjxOrC1K2LaX+5k8BM5//76VZ4eALnIws1chAmuW4yoNXpliUA0
	cdjTy9J9Rehitl5YryXPkiukDxzBHPFGdZueiFvaflYO7wWYOOYGCDo
X-Received: by 2002:a05:600c:314e:b0:490:45bb:8dd9 with SMTP id 5b1f17b1804b1-490b5d2f857mr5228945e9.8.1780429824002;
        Tue, 02 Jun 2026 12:50:24 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:5ef:9913:4a77:3bcf])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b0e13eefsm87353395e9.2.2026.06.02.12.50.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 12:50:23 -0700 (PDT)
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
Subject: [PATCH v4 0/4] Add PCIe support for RZ/V2H(P) SoC
Date: Tue,  2 Jun 2026 20:50:15 +0100
Message-ID: <20260602195019.1798126-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33449-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,renesas.com:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A2D856318B4

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi all,

This series adds support for the PCIe host controllers found on the
Renesas RZ/V2H(P) SoCs. The RZ/V2H(P) controller includes additional
features for PCIe lane control and supports multilink operation with
two independent controllers.

v3->v4:
- In rzv2h_pcie_setup_lanes() returned early in case of error
- Added RB/TB tags

v2->v3:
- Dropped using linux,pci-domain property.
- Switched property to phandle-array for renesas,sysc
  to support multiple controllers with different SYSC register sets.
- Parsed controller-id from the "renesas,sysc" property instead of
  using linux,pci-domain.
- Updated commit message for clarity in patch #1

v1->v2:
- Dropped RZ/V2N DT binding patch as it has been merged in the
  pci/dt-binding branch.
- Dropped un-necessary new line in schema.
- Renamed RZG3S_PCIE_CHANNEL_ID* to RZG3S_PCIE_CONTROLLER_ID* for clarity.
- Added locks to protect shared lane configuration state and
  prevent concurrent access issues during probe.
- Added cleanup action to release lanes on driver removal.
- Reconfigured RZG3S_SYSC_FUNC_ID_LINK_MASTER in resume path.
- Renamed num_channels to num_pcie_controllers for clarity.
- Updated commit messages for clarity in patches 1-4.

Cheers,
Prabhakar

Lad Prabhakar (4):
  dt-bindings: PCI: renesas,r9a08g045-pcie: Add RZ/V2H(P) support
  PCI: rzg3s-host: Use shared reset controls for power domain resets
  PCI: rzg3s-host: Prepare System Controller handling for multiple
    controllers
  PCI: rzg3s-host: Add support for RZ/V2H(P) SoC

 .../bindings/pci/renesas,r9a08g045-pcie.yaml  |  34 ++-
 drivers/pci/controller/pcie-rzg3s-host.c      | 233 ++++++++++++++++--
 2 files changed, 247 insertions(+), 20 deletions(-)


base-commit: 3a97877d13e1a29c50ab15ed0a0aba87b75061dd
-- 
2.54.0


