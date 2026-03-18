Return-Path: <linux-renesas-soc+bounces-29765-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QH7JCfGeumkkZwIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29765-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 13:47:45 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F35D2BBC9A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 13:47:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B3F1C3015CBE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 12:45:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 159533D75B1;
	Wed, 18 Mar 2026 12:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C+q2969g"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11A9B3D6CDE
	for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Mar 2026 12:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773837913; cv=none; b=mi0vzYOWv4j3riVEwrmv5nbeqA1eRK3WIDdN1GbqvssRYHndE33oS3jg5HHiIGcn84JGWEUESPA+hWFcgiO74dohX1vZXSFEc15lUrslphqHIQfb6RNvPSs9KvJYpELC5P59c4NdKUHq3U/5m2AVv+o6kVYuZroB7LTXx2jAjdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773837913; c=relaxed/simple;
	bh=7h/HGlld4QUZ8/6amWHzk8Y1v7CTpf+63EYDdvnKPsc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=h85G5Ku9uUNjO+z/wXi9f7mwYhe05GVOC0KdwBWNyc39t1Ika/hqLH8+cPySbp//WUEddoeocemnN24MVUwnmJ7P32OR0p3zq2DLCVFWeYrTvf1x8rxAAJCk15q7i0Xerwi3u2b7o/lsWfHf8yJWeesqfenLCzd0GT3Wo8yON4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C+q2969g; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-485392de558so5297005e9.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Mar 2026 05:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773837907; x=1774442707; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8uibrI3W9d4RMuqjhPjL4rWVHNQ9ZJs9HJd7qxmHcrQ=;
        b=C+q2969grF5WkLXMY13vy1mjIpwQybgMCbfp87o88Ot1SK+kaIe9V3vPYrDdinRg8a
         gwpvZoFUeIBI2vrFi2BHtQnmQRuMT//5D+evRX/CP1qclJqfipf6zN59C1TLLaGo48Hp
         HCHwkuZK5pHL86gdTf1cZGExJXz5Rc6xz073GUNfpTpDt3CPSTQ3AFXD1CF/KbwUgsiH
         EhdCg/Xg2pky15tDkJEFqOXAgKgL8QzjiSQ71Kr5/hghHxAVwtWXDnA7DnqaMXC8gVy+
         topYdfrpNIvsHKLYiYtle+LNXy0cx13OX+w0aqb6NnV8Bc6E7jyrNEB2UQSl7g5UOsxZ
         K1Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773837907; x=1774442707;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8uibrI3W9d4RMuqjhPjL4rWVHNQ9ZJs9HJd7qxmHcrQ=;
        b=a5wT+oYSVAt7vP9eClRYz6Fc5kaTaPpuXktotTvjLmXHgY9szzqsfosFjileQvIdCv
         4MBA5tuo83Uv7JZ7nJzBXiGtRdNwVOuA25j0XG/8beSU3pmU2E+9BD3l0TfOU1mQebBf
         gK/KtaXzX6wGwgLS5TtVCVuvpi+p5ZAdIVTy+58bkw9EorQT4HF/31HESOf+vBypEQYH
         w5yI8HdZIyBqLAgJMXS36pSRyACQ9mf+GzM1MJ+X0afE79Of1YJy/y+eTpf+5CXjtenE
         j4d8KlSDoGA+xgG8o5sFKdpwxLNviRTpJyN02hzRiXNHKn7FMti/nlR2xABReogo9Dyz
         bJEw==
X-Forwarded-Encrypted: i=1; AJvYcCXRv1Hm3abBqwNCTSz4m67T90AfeGBkmaLAt8ZrIqOGqNsG4lphoNZI6fWPINvr4dHWg6mB6VKmUVErx4Ot86O6Xw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxst6Oha9PMXfCes0YteorsqqzJkjDWg0S/LtfUtGPLEkwyay98
	Og9/lvewn/QZb5WelBh05iZ3+roiHfumADO5z0aKLGAJSJVeO/lpjr42
X-Gm-Gg: ATEYQzy6EY3k0N2asGp4+IwowyIsH6beqq6rAuUjk2jsCju3yZST3KzUOJ26vY6OmwB
	fL+VTCCaZ5Ek9H7VD2oBSyAz+Kam9AYtU8BZvYITfpswMTVMGxKCpX3nQ2hoHhmbmwXQU5pOycM
	y0WKCw0Q61ufT5HazTsXBblxzFOM+9KSJFZcp8jhf2z82v7+tMUOSIe/hcuhunl1A6p64GuYRIb
	QzBVjJjt3PSiOXzznyr3d4o03fqqaFBzBBcsr7u/IuxuwK7eU7UL76KRJ1zx0Y8ni5S2+kz6hCP
	hUdpC3FwIZIob08hzXNRkZFBC1kQk8wr3UcHmfLrRtwjIxdY27Nnve/im7/0HrfHpx5GqW+Wuq6
	wiPsk6TGYFgC6pQsRd0oTJBuqada0ia/zQ+AE+SEwXUo6pSETB5qm6AeYS2TSMkOZw8yL7TwW+w
	1L/6VmCBTNClGpCFVHaWDA7tUNAF3is1+qPKJixRrtvuppxVzLOkTDV1pcnD2c4hBYk01y4AAFH
	bL7VbuxptpsDEXs2vNooO/TuByX1z3+2hcAEBTN3meq+HY=
X-Received: by 2002:a05:600c:c8d:b0:485:2fe9:336f with SMTP id 5b1f17b1804b1-486f446d88bmr53075075e9.30.1773837906381;
        Wed, 18 Mar 2026 05:45:06 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:5f14:a98b:b4be:efbd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b518985f6sm7888162f8f.25.2026.03.18.05.45.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 05:45:05 -0700 (PDT)
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
Subject: [PATCH 0/5] Add PCIe support for RZ/V2N and RZ/V2H(P) SoCs
Date: Wed, 18 Mar 2026 12:44:45 +0000
Message-ID: <20260318124450.163471-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.53.0
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
	TAGGED_FROM(0.00)[bounces-29765-lists,linux-renesas-soc=lfdr.de];
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
X-Rspamd-Queue-Id: 7F35D2BBC9A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi all,

This series adds support for the PCIe host controllers found on the
Renesas RZ/V2N and RZ/V2H(P) SoCs. The RZ/V2N controller is similar
to the existing RZ/G3E variant but uses a different device ID, while
the RZ/V2H(P) controller includes additional features for PCIe lane
control and supports multilink operation with two independent channels.

The series includes the following changes:
- Add device tree bindings for the RZ/V2N and RZ/V2H(P) PCIe
  controllers, documenting their capabilities and requirements.
- Update the rzg3s-host driver to support the new SoCs, including
  handling for multiple PCIe channels and shared reset controls.

Note, Ive created two seprate commits for bindings file for easier
review if these needs to be merged into one please let me know.

Cheers,
Prabhakar

Lad Prabhakar (5):
  dt-bindings: pci: renesas,r9a08g045-pcie: Add RZ/V2N support
  dt-bindings: pci: renesas,r9a08g045-pcie: Add RZ/V2H(P) support
  PCI: rzg3s-host: Use shared reset controls for power domain resets
  PCI: rzg3s-host: Prepare System Controller handling for multiple PCIe
    channels
  PCI: rzg3s-host: Add support for RZ/V2H(P) SoC

 .../bindings/pci/renesas,r9a08g045-pcie.yaml  |  43 +++-
 drivers/pci/controller/pcie-rzg3s-host.c      | 194 ++++++++++++++++--
 2 files changed, 211 insertions(+), 26 deletions(-)

-- 
2.53.0


