Return-Path: <linux-renesas-soc+bounces-33926-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PsCxDyIYLGomLQQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33926-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 16:30:58 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id CDDEE67A30D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 16:30:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=H8OdHXyO;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33926-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33926-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4909F30039A4
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 14:30:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EEC4385D79;
	Fri, 12 Jun 2026 14:30:55 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4A0C2D3220
	for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Jun 2026 14:30:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781274655; cv=none; b=HRldxbDt40fC7na8cijLPa1T9NxJFdov7CN6LzG5xlxELdaq9tuyWyKMr1vE9ma1Ry65G1XTJ8EV5JNSj8e+bOuTC3rcnwgp3rQwRcjIYIFQcdFBCd5jpVFJGkcZAZYtGfOICXl/TwFaAQCxEKDg59fewxzNMvtTsytP2oVdxl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781274655; c=relaxed/simple;
	bh=yuMFmQ5MRWJeClwbnY3zCpvrJ03BA8VG6OH9X4U+owU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OKAyCu6NUgaD+rY13K7aRBCpD1oCvKi/WPE/mPu/ygBCdJm+qshEx09JQD8dslZndgspVdt8Wty7s4d09Gb/IOWruXNdeRK/xHOW1BuDACZqdsT6nhr4vEam6TOiZbYZg9KAB+p6Qcg9J/ySJ81E3JQsv3DtgJMgpNBDGNywOVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H8OdHXyO; arc=none smtp.client-ip=209.85.221.41
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-45ef1629ff4so719680f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Jun 2026 07:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781274652; x=1781879452; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sj5YLZXXcBmUxWzHptzfJghLh2vd+J2ccuESFm/Sbrw=;
        b=H8OdHXyOP2jx3b9qgnEFQx967A9FYE+GRupn+fIZzyGeRrHeDdhnw1VP7mXW01LVXM
         eyii53GRrsVmGx1lQKUqKRKwjIg8dQtT6dc6rJ6yKfvqs5xBQZr6jFAXQ/FLAcVtNF3U
         IYbX8I054wOCFM+mI9mjPLJJgvN4kkFDd7BQ+CXNmVhte7vwDYyNZEwb/4OF4eAIw2jJ
         gCf27DV3aAzGn43eqIpgclBVDn/a5INBa+2arSvCJgzJ9Uw0yp2/CQ9mYLZNG+eoT29o
         xz3A0yTUs2gp9MGv9Tn/DogNXfJIQlSg24xaCpQ4ByMAXS3vXVxF0v+y/2rSw1eTrIJk
         98Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781274652; x=1781879452;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sj5YLZXXcBmUxWzHptzfJghLh2vd+J2ccuESFm/Sbrw=;
        b=AQC4F2yHUDUOPIwPXNtgfQqhOqcEZiFMYvMhwwaExrOzUgHGICgBeUyKx++4ci6zCk
         KjKWHR9yv2A4telWP/pWflnRz9VYf4H5mtfXHsfkv3OmQGuDRAe+F7BXKHI/tB5qyJvx
         GLSDDoMBB4SePc7RuJ+jYlGABPEwwNTXgTXX50kfxSQxULvZyQc8MnrHoUmmyord5EwX
         ZS/zLRC+MyycwXwK0XoXoZ1Vm/hMh7eUv2nWDjDZpXyLkRTHbp7EHFzKcEtz9CGJ47Vk
         mlVgx8AoTEzJ5//185DkJXmkW4qrmOpxw+O9YPOl+nhtxZ+r3yWLrQ+9D84ZVe6hGLEp
         4+Hg==
X-Forwarded-Encrypted: i=1; AFNElJ+Ec7eWIVUILcvs9miPZoP6IlfBZdfN+x6m+O5OZpaUEiWzvMkZ7+ssf6Y1vuMjJFlD40xnp5tarx6MJANKXg+M4g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1Oyxt7r5YYfit+qUwJKW1t/DlZPhZSv8Ekno+v5ZjEz9p8WaR
	/bc20KxNeiSKp+qZWneCJuDgBRi4DRfVEs2Acig6hImcppZhN5kroFeg
X-Gm-Gg: Acq92OEuJrwOrv8AK/RuBNF3fqZvkqxZpCLjHakCO3Iir1AHBpMC5HwrKrhY6a8anFK
	JpnuEKvV1X11OUwzVK6E2367HkRtbEmfhlKHZOGyJuB82aGrxYgI5HVd5QcXsBDVRt3VOSeVSng
	rYZKZUI1bPKeimg2OBqmb5pKY1jdWFrprn7Auv4pk0NNdrXwSk8fDAZZtUuLDScGbRgoaZGKwtJ
	lM++88M2fdpSUB1n8iovGIMx6v3KJKm3XlQ0W9T4mDuwXPD4DhzsqrHdhDf08sICJ6n5v8k3zS/
	11J7jbjxBcZwQP67LfRZAem5Vst9Ig0o3Y7Hg3PF3lyaHvr9TNgE4CdWjWYw68btf3fzDccyhIs
	0+nyoIKK9Yxui4QCjIMbDh+xmJn2DUbbI9v7jteRJkBW/WuDkAlSEriJKCHLV3uE0xfpIGJgVLZ
	gCQelBtqfJGmr0/1pYDLy/e/WJJCX74XG4UM7jQjEnyOkJxtNz
X-Received: by 2002:a05:6000:428a:b0:441:1cf8:ca00 with SMTP id ffacd0b85a97d-4606db9f17cmr4752008f8f.26.1781274651930;
        Fri, 12 Jun 2026 07:30:51 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a700:7301:c72c:50c4:8b28:9a3a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f2c3782sm5850016f8f.25.2026.06.12.07.30.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 07:30:51 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 00/11] Add RZ/G3L USB2.0 host support
Date: Fri, 12 Jun 2026 15:30:28 +0100
Message-ID: <20260612143048.317907-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33926-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:p.zabel@pengutronix.de,m:vkoul@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:magnus.damm@gmail.com,m:biju.das.jz@bp.renesas.com,m:neil.armstrong@linaro.org,m:yoshihiro.shimoda.uh@renesas.com,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:biju.das.au@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,m:bijudasau@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[pengutronix.de,kernel.org,glider.be,baylibre.com,gmail.com];
	FREEMAIL_CC(0.00)[bp.renesas.com,linaro.org,renesas.com,lists.infradead.org,vger.kernel.org,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CDDEE67A30D

From: Biju Das <biju.das.jz@bp.renesas.com>

Add device tree binding support for the RZ/G3L (r9a08g046) USB PHY
controller. The RZ/G3L USB PHY block is similar to RZ/G3S, but each port
has an OTG controller, unlike RZ/G3S, which has an OTG controller only on
port 1.

Biju Das (11):
  dt-bindings: reset: renesas,rzg2l-usbphy-ctrl: Document RZ/G3L support
  dt-bindings: phy: renesas,usb2-phy: Document RZ/G3L PHY bindings
  clk: renesas: r9a08g046: Add USB2.0 clock and reset entries
  reset: rzg2l-usbphy-ctrl: Introduce info struct for match data
  reset: rzg2l-usbphy-ctrl: Add RZ/G3L support
  regulator: renesas-usb-vbus-regulator: Introduce helper for regulator
    registration
  regulator: renesas-usb-vbus-regulator: Add RZ/G3L VBUS regulator
    support
  phy: renesas: phy-rcar-gen3-usb2: Add RZ/G3L support
  phy: renesas: phy-rcar-gen3-usb2: Fix devm action registration for
    disabled VBUS regulator
  arm64: dts: renesas: r9a08g046: Add USB2.0 device nodes
  arm64: dts: renesas: r9a08g046l48-smarc: Add USB2.0 support

 .../bindings/phy/renesas,usb2-phy.yaml        |   2 +
 .../reset/renesas,rzg2l-usbphy-ctrl.yaml      |  20 +++-
 arch/arm64/boot/dts/renesas/r9a08g046.dtsi    | 103 ++++++++++++++++++
 .../boot/dts/renesas/r9a08g046l48-smarc.dts   |  49 +++++++++
 drivers/clk/renesas/r9a08g046-cpg.c           |  15 +++
 drivers/phy/renesas/phy-rcar-gen3-usb2.c      |  20 ++--
 .../regulator/renesas-usb-vbus-regulator.c    |  72 ++++++++++--
 drivers/reset/reset-rzg2l-usbphy-ctrl.c       |  44 +++++---
 8 files changed, 291 insertions(+), 34 deletions(-)

-- 
2.43.0


