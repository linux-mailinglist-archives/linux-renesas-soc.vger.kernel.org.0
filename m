Return-Path: <linux-renesas-soc+bounces-33366-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +NabEkAMG2q/+ggAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33366-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 30 May 2026 18:11:44 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB3760DFA5
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 30 May 2026 18:11:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8EF5D307AF1A
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 30 May 2026 16:08:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C85933F8D6;
	Sat, 30 May 2026 16:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="caOKB6ur"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 946F13246E8
	for <linux-renesas-soc@vger.kernel.org>; Sat, 30 May 2026 16:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780157312; cv=none; b=BW6t+s9hUon0SmPOucTMJZuO20N+zjxcz84dqbQu3+uiQHaXQzeIGAPY2wug/iv/jksmEGzAdKRsfoyPICKZgJkYbBLT+wJrt1nOi5HnF/1GSvKCb1qFVuhI/vEZmX0agBb8oZL29iOx9u5PaD1ILqqQl6xNESCEJlTT6WXXLao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780157312; c=relaxed/simple;
	bh=k02EvHB7w4mp/39BN6OIKPWUtaD9jb72GfIkSX9v8u0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=knHlkYcaN/eG/cywvS/e/fGH35YRxecInN8W/bkLBDlEmZNt5/nR2imj+q0yl6DwrU+1MxvRMs/Q70uZS0y+Mzl5W8yXrpK99AtIajAeQWCUe9qqH9ZwTRoGm4+1RGOfB+BXHK6/TrQJOfw0pvMHBlLpNI6sRHTrTwrxTZ5BeRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=caOKB6ur; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-48d146705b4so156801355e9.3
        for <linux-renesas-soc@vger.kernel.org>; Sat, 30 May 2026 09:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780157309; x=1780762109; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pM3VMI0Nk96qve2GMnnDFvM6zt47jLzS2qbppbdzoHw=;
        b=caOKB6urCsNmod/bPS97mvGALKmuN8W+2Z/lhs3AE7eowPkWTvKuYSi+A6mZgUjQJH
         oz8+1/4S1kMI1DUOYGeaiLwGjNw9Sb9ETxHCEHblMyFaOwSZn9ISq6Ts9+cta8FpVL/9
         K9UP0kWgphYu01IEKzKPfPIERtyRMGtEUyStUQCyh10crTZj1N1PNHaUqWU038Ysg+zX
         QJl/VqnnnRHvtI+MjoSPJcPemEjnUlNfDDH/d2nsuPQq52WCfYq9l2DklJFuSzSPJzpw
         CYwedUb0Jy4HgIILGIGwyNK8qcE/3KlnnoOiGqAY/PS3KFv6GjBepvcZnOzXe3ePueo3
         GRDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780157309; x=1780762109;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pM3VMI0Nk96qve2GMnnDFvM6zt47jLzS2qbppbdzoHw=;
        b=BLeE2MRlV9IS6u/oNRNHj8Tu971OHKUWxpte/Qp6Mogda4pJ5lxvBVWThg0nrmec0f
         1RPvJUf4vflVtYA1Pe8Bnh7Q6+7ujHrvaPyaIdVKO2Bmk0HcU+n9MkrbuSMJ63qf6J2/
         z4+knouhAREvX9In3WwGSUUmvEN8HcFsYseOIgAnYaw4c7g//m7ulKo61RL7fXLtlSXP
         F7rg4Ilz7uaFfiYTY7rgbXg4sYjkRBCjh3peQBIZ17WIaz2WztVEo/WSuPwpPCYtwulu
         Tbk5YjPF/ykaE90sRQk66o7iZoOIQdGzymfsoS1MkuDU4/SOZLSLCNSIJBS71QuknrXT
         4yMQ==
X-Forwarded-Encrypted: i=1; AFNElJ/el9zXkc3xS26zyJqjDMTzeDcEKT568IymzaS5lpuL7E8ENmenD+j95eww8kfrMR1jxe4+2FawBfnOz5QWb29McA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzJBB41aWqjDKMBJpeM3RG9EyuR2q95m0cpDBOqNzLX9sKe2Q4g
	5TXFsRTOLfAi/OiZMbqjUiW2JhLMZ5PhRHx0bSI96c85PHW4uSDdl2iD
X-Gm-Gg: Acq92OFJa5R1JP37bs7EyXNns7V5iI6efT0HHHEBT3PPJ11CZ3TzBeHwB8q3+BYeJs4
	S5NLAtEyAMCtb60DCjtNeGUzMhN+TwlphZf42nPmMnsw05fhnAwlqcXoG+sxStdVQnSEiEDLWju
	/ORaWZPBU1PcGRcIEWwqPWKXJmjeL5IYWcmYUWUmMCXQ4W3XlztHmr5gaxykuS1ZzyCR5USqAlK
	PtzJLSljiNQZUnbRjU/B75dseCgHQoadyNAGfDYivLezzW6+mu/SmEo/aRgPYfNRLRBXN+iled8
	JcSCG/x9uiTRE7PgnzoLbPBRjDjVGLXnrOjolOUSsWJCo9LAOFQVekxgC0q940h2sry5uvtJOLq
	paBCc1mVrxFkP2tgEpyYuPuYPa6XVny7dkO39pHIfO1785ijMbivXCtRJrj6Oc+aOMPU9nQog9T
	hP8m4k/JXOlDBC/3eUrPmT0sWY+4utDZCbpEoRCPUw8VsC9CKJXyPSGVieM18JqEO1I+ercw==
X-Received: by 2002:a05:600c:4fc4:b0:490:3890:605b with SMTP id 5b1f17b1804b1-490a29637dfmr74828605e9.31.1780157308915;
        Sat, 30 May 2026 09:08:28 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a700:7301:5db6:a512:6ab4:aa07])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef35874b7sm12170799f8f.35.2026.05.30.09.08.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 09:08:28 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Ulf Hansson <ulfh@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 00/17] Add Renesas RZ/G3L SD/eMMC support
Date: Sat, 30 May 2026 17:07:54 +0100
Message-ID: <20260530160823.130907-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33366-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,glider.be,pengutronix.de,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_CC(0.00)[bp.renesas.com,sang-engineering.com,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-0.999];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,bp.renesas.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: CBB3760DFA5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

RZ/G3L SoC has:

Channel 0 supports SD and eMMC (including HS400/HS400ES).
Channel 1 supports SD and eMMC (except for HS400).
Channel 2 supports SD.

The SoC supports a maximum frequency of 150 MHz. The SD0 interface does
not support IOVS and PWEN in the SDHI register (no internal regulator),
unlike SD1 and SD2. It has an internal divider for all modes except HS400.
It also has a 2048-bit divider compared to 512 on others. Moreover
RZ/G3L supports HS400 enhanced strobe mode.

Biju Das (17):
  dt-bindings: mmc: renesas,sdhi: Document RZ/G3L (r9a08g046) SoC
  clk: renesas: r9a08g046: Add clock and reset entries for SDHI
  pinctrl: renesas: rzg2l: Add SD channel POC support for RZ/G3L
  mmc: renesas_sdhi: Fix whitespace alignment in struct
    renesas_sdhi_of_data
  mmc: renesas_sdhi_internal_dmac: Fix whitespace alignment in struct
    initializer
  mmc: renesas_sdhi: Introduce renesas_sdhi_hw_info to abstract clock
    mask
  mmc: renesas_sdhi: Add max_divider to renesas_sdhi_hw_info
  mmc: renesas_sdhi: Add tuning_delay hw_info flag
  mmc: renesas_sdhi: Add internal_divider hw_info flag for clk rate
    adjustment
  mmc: renesas_sdhi: Add optional axis/axim reset controls
  mmc: renesas_sdhi: Add RZ/G3L SDHI support
  mmc: renesas_sdhi: Save and restore IOVS across suspend/resume
  mmc: renesas_sdhi: Add RZ/G3L HS400 support
  mmc: renesas_sdhi: Add HS400 enhanced strobe support for RZ/G3L
  arm64: dts: renesas: r9a08g046: Add SDHI nodes for RZ/G3L SoC and
    SDHI1 pincontrol on SMARC EVK
  arm64: dts: renesas: rzg3l-smarc-som: Enable SD/eMMC on SDHI0
  arm64: dts: renesas: rzg3l-smarc-som: Enable SDHI2

 .../devicetree/bindings/mmc/renesas,sdhi.yaml | 101 ++++++--
 arch/arm64/boot/dts/renesas/r9a08g046.dtsi    |  73 +++++-
 .../boot/dts/renesas/r9a08g046l48-smarc.dts   |  89 +++++++
 .../boot/dts/renesas/rzg3l-smarc-som.dtsi     | 199 +++++++++++++++
 drivers/clk/renesas/r9a08g046-cpg.c           |  92 +++++++
 drivers/mmc/host/renesas_sdhi.h               |  25 +-
 drivers/mmc/host/renesas_sdhi_core.c          | 226 +++++++++++++-----
 drivers/mmc/host/renesas_sdhi_internal_dmac.c |  71 +++++-
 drivers/mmc/host/renesas_sdhi_sys_dmac.c      |  67 ++++--
 drivers/pinctrl/renesas/pinctrl-rzg2l.c       |  74 ++++--
 10 files changed, 889 insertions(+), 128 deletions(-)

-- 
2.43.0


