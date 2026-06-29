Return-Path: <linux-renesas-soc+bounces-34538-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id N+0lICTtQmqAIgoAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34538-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jun 2026 00:09:40 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C4E1A6DEFBB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jun 2026 00:09:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Nfyv7T2a;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34538-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34538-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9DDBE300DD52
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jun 2026 22:09:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EAA2386C05;
	Mon, 29 Jun 2026 22:09:37 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04CF3287268
	for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Jun 2026 22:09:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782770977; cv=none; b=jHkIFVLUKXKw8eM/z0XPqMrAcOM997qVKP4iztq6FfoJZiD2pEFbIxhl/CUiY9IRE8vvQQ+5ejxWs6O0hHbcMgTpm6cw7pSLHLvOpRIyh0YjKajNaPdZa2m+yiZH350TW71Xfd8P+X8VglIGzDwHwHXuNutoRKLpb5bsiKsm8II=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782770977; c=relaxed/simple;
	bh=3ZvgkqijbuMRZHZyVD7vTyjiiO3/fzLq7IsUEDeI/EI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fPG1iUUB2dWB3nOeKI6WGPQbBxMpX63wsTpKyEXz65iVDwiVQs+wFAJTmnmsWfmVQLmFAfFKZKR4G0E71JPGSCvo/+EF9DVSPCCrnNY2AeR5LyRW+k0biSKSJrF57wkip0OzqXSYN/yBUCwHwwCY13jydn5p71mSLBVAv1UiXT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nfyv7T2a; arc=none smtp.client-ip=209.85.221.43
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-475881b9a4bso67949f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Jun 2026 15:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782770974; x=1783375774; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eWtjIYRwzsZNUE+tnUUrysdcLHF0sFz6gPY6Xuye6sY=;
        b=Nfyv7T2anmPIoTxMsdqt6/qvJe2Z0w1nuGNBBMDfI7Tj/Laacjf84nwbemPcE8xcS1
         lDCsvWFTAztPRcjGF1lfnVEn6qRcEGcr395/RJzQcTvjqexHyy76ZFzCsyBUZTPt3AmP
         cdeClix+O+3EXoyKDyIihifyOflHujd9cjD1WIpGCBiRkciOmAybz8k1GMe0670ayxIN
         kB0PFwOj39YiZNSjjrGS/XoB3R7ysQZlGOnF4V0v4yLEG8HpVlZ3MocYGDVZgcXeeewP
         WeeXr5uUI1fD3rWFRguueXv+z48MVq0zLRUxpbgUaBWLtOM9j/MBdw4QeznMrWAoRHHW
         UuSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782770974; x=1783375774;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eWtjIYRwzsZNUE+tnUUrysdcLHF0sFz6gPY6Xuye6sY=;
        b=Jpm3otS1beVyAe2rf7/W3njfr9SwSC3qAdn5g59Jag2Dvf5b3CnM6JEn2XOG5r8RWA
         +iZmvLH+CKECyy6ldGwVGmk4vaFZ3p2+Lj0VZ/tVTpCT7ap4VP5qTCi7yP/z5CtRWnHX
         kWCYXIY2XkksIYpCsMyhEo5hU1Rw6Vf1mCTsDkqsgc2Xz95R6M6o+mBenCCBTdiKGnIt
         gsPvEvYAoSYlBgpYcKbW0plAyxhP1Z6SiAGuDPeZHApWhGvaeCgp1cnyxuVGHTTXGxGa
         dBMHdJN9+b4gPiAjISSYtNzuh38i+rmvjz4Hs8qZp3L/VjKxITxkdAkK148988BxqdFY
         vGdw==
X-Gm-Message-State: AOJu0YwN4s2RpF9Gca73g4dOqgmA4vmJDs0jX8h/7UJOTpIF8JBKL9t0
	1zXLenWJcwolMu6hfG0puL5/jgPLfazkBQnNAUbUCgtYmY2SoFX3Cu+a
X-Gm-Gg: AfdE7cn8DdszjcKC4D4kvAy4eooE2AyQBRk1s0clD87gW/9CvVVC8nMiw6MPavE3ShU
	JiAf6197S1xlJXZ+DAuThYCyQZaK9/2KCvvt5/ADX05Q3DvDhmYGeEk0UlwrYLr7BfA/uojJS4S
	ifUx39dRoyxjnAOxsWu2JUzUg9FWR8wVEww+uKmp8Gk0py/ZfhewNdiTX8puNnZLCh1B1gaAsZX
	VDvjY4S3zX0nlFxeHU7r7oN2prbWfgU5f6GS+QPC86viR3yM6n0ruZeddRusQmnY7S2txwLojkw
	FLMI6wW6ilAgyQosePPArLfnHnmwh2p6J1THjDr3CvVWWOsM5mnTKiuxZn9DVEbTFbDp5RtIO4u
	VRD9XzCkkYTjXUGbXQ9JhFK37g7+Am47tvvNAQCsCUcHADVICqAwg4zCF12PC9NyS2g+DD+7GUo
	lE0Mk2vX+yWqrGZ6Krow9gedV6qpaEOHb/OliSUi+Oy7h0Xy3cpsZ26SGSAdYlzDWd8/amGI5u7
	kZ2iUP8yTLTaQpA4EL/XfA7xTJhOS+RCY/g2Q==
X-Received: by 2002:a5d:5d04:0:b0:460:1301:dec6 with SMTP id ffacd0b85a97d-475506e994fmr1291051f8f.10.1782770974226;
        Mon, 29 Jun 2026 15:09:34 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:dfcc:acfa:dec0:e556])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47563d195b3sm1644670f8f.8.2026.06.29.15.09.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 15:09:33 -0700 (PDT)
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
Subject: [PATCH v5 0/4] Add PCIe support for RZ/V2H(P) SoC
Date: Mon, 29 Jun 2026 23:09:28 +0100
Message-ID: <20260629220932.861445-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34538-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,renesas.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C4E1A6DEFBB

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi all,

This series adds support for the PCIe host controllers found on the
Renesas RZ/V2H(P) SoCs. The RZ/V2H(P) controller includes additional
features for PCIe lane control and supports multilink operation with
two independent controllers.

v4->v5:
- Rebased on top v7.2-rc1

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

-- 
2.54.0


