Return-Path: <linux-renesas-soc+bounces-32313-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AGX8OEJFAGqgFgEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32313-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 10 May 2026 10:43:46 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 42564503217
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 10 May 2026 10:43:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 13C95300A12B
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 10 May 2026 08:43:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6551135F172;
	Sun, 10 May 2026 08:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dyhBAe5o"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40DC136AB47
	for <linux-renesas-soc@vger.kernel.org>; Sun, 10 May 2026 08:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778402622; cv=none; b=S6Tx1vBylPxbhrAHg4UcyASKTBqBCfBw5VIKZpdZHJvEAahsak8OxK6WN5Df2HsQTqldX/ap9S8nL5wQ+bNuZ4A62n2tWPHHkUHJ2fGTpUll7Q0u3fP0i8OmPcSOJvGAK8fPMv5JIyQ3srnOIUIN0VLJvLt7EJQoun5Ge2SlRfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778402622; c=relaxed/simple;
	bh=QT5v84YT0gPkdJLU3al2+Bl4V5DWyS5LuIxcIGWNNNk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=n4Lnw7whCaw/4VEaI2u69iCLqkj2GUjA1JtmE0x2m2k1mG+gGrVH97CYz3e61/YYDyp23JJnOTfRw9XSCZIpuFr7R3qt7tqHDCUEEKEFpCvXNRYUXiNoHRFZARCs5QsbPFPaVuZudPOeVYRyc+jgkBtzAZ/NAfVQdnYr9J+vWlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dyhBAe5o; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2bab82d75fdso17924965ad.2
        for <linux-renesas-soc@vger.kernel.org>; Sun, 10 May 2026 01:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778402619; x=1779007419; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ditQC+yU7Iehjh68zsCFLD1izvDINyIjYsF2jxcFgoo=;
        b=dyhBAe5oNqZVMF/7N/3hgieTnNl4WdQzW8VNmeJSu5JcINRlPRSY7ZdOOuJb3J8gL1
         oE9jfX8FLEl69vC8xB6ED3bNUlZjsvvVwaZEtNRigSiQLo6Pd6I3nGcPudGu9QaIA7aI
         RlVHFRAz+MdFtziW1h4xgkTazp7PPyCJLa1/hTaXzaYGBiLZcWbg3LWQfPKbps7lThlt
         dNOLdf2WekH0/izItuorRd4fpBS9KWCJRkv6U/JQqqVX8na1TxqrE5lVo+fMac7JsFD0
         /7ftBIB4R2WaTq/7VgIUbAv266/W5WbEXOMN55LOz6ylJatR0Pqzc4JawVMML6AQDaJv
         8FKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778402619; x=1779007419;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ditQC+yU7Iehjh68zsCFLD1izvDINyIjYsF2jxcFgoo=;
        b=NksuyHx+vaAA2ilmBvLzmT2z1s0fHChSK5wfCR+f6I4R6OIwFxWd46eWI+1Fg7wBu+
         KUTLRfjlpjcRwoVLd7nMxDdfeOdraEKGPkmzz+93b3kzEpmsJz84nWhYmsOQn12fiOgJ
         IUoGxhaStmkuqZeQK6u8KCEiMFjA227XYvVJWykv6HiXJsp2YhNE9EzH4bujd35JJIvD
         vjlszlkKYhBnsMM/jrFmtUmBZBkiGQ2QQ0YC7kUzMnqOlxicSxi4VU4ohrydOBEqS47x
         wccJ1rvnH5mMjtN/N98CNVZoed1lOekeugGkqK5KzolkhU/Pjr/nFdM/m9Z/+YlajALz
         xX8Q==
X-Forwarded-Encrypted: i=1; AFNElJ+xS6c/ZaCwMMux56U3vA8Mf8WzliURbIn5+R2os6XqsrsnIQ4t57TGP/2ezdcTLsbpHToxO6cl1BqeBsXb8GC3iw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyeqilXP1AQ693q+Gn06Pa7z7sU2p4r1w4X5bL1MbkYGn25saZ3
	QkJAC/dKNH05LsdYou/Brj+ecqJynLGkxJF3HpEVh0uz35yAHyvrfssP
X-Gm-Gg: Acq92OEV0CCPTSUnurIb7YJcBhaTFB/LhOw20vtwT/6AErp3oq8XSwzJUsWEQWdPHJo
	zNpWLlQrLCRg7DytmV76Tj6egoaDnl0HpxhusGavmjDbqODgSTfxB+NVeBXLq2HPpeaZRNbxCyl
	tue4hCUntAGS4ZbVr1M7OjqsC0mtTvfFHJr0DXqXs/MUvz+/YuajWkXbJkrzTVIXLJIs7ICaIGX
	uSdLUD49mWenvQJ5e3mWtpu68oMKsUPGN1Md+Ow2a/jIAZ9zUEcf/+NYUx1wAayjyhAZHSdSIBf
	2wbb9iJ2+GckpcCG1XQ3gwe3k5riHl2MCuvsBoB92ynoWwH/YOiZwXR6UxX73MBogUtTDR7HmhN
	gAETC9smZ76Nbtx0J/PlOASxguZkOdusY+yNxt7SDXrATn62M15kRuMPOMVhUectB/mdN4QN0Cc
	N+wU1FCw/sT7iO3JBnVd7xvaJzKeHjoXbQNlsrSthXK3assd1z338QljCSaw==
X-Received: by 2002:a17:902:c950:b0:2b2:b117:1e1b with SMTP id d9443c01a7336-2bc7a9d07bdmr54491825ad.17.1778402619187;
        Sun, 10 May 2026 01:43:39 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d3ffa0sm70471005ad.25.2026.05.10.01.43.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 01:43:38 -0700 (PDT)
From: phucduc.bui@gmail.com
To: kuninori.morimoto.gx@renesas.com
Cc: broonie@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	geert+renesas@glider.be,
	krzk+dt@kernel.org,
	lgirdwood@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-sound@vger.kernel.org,
	magnus.damm@gmail.com,
	perex@perex.cz,
	robh@kernel.org,
	tiwai@suse.com,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 00/10] ASoC: renesas: fsi: Fix system hang by adding SPU clock
Date: Sun, 10 May 2026 15:42:53 +0700
Message-ID: <20260510084303.122426-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 42564503217
X-Rspamd-Server: lfdr
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
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,glider.be,gmail.com,perex.cz,suse.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-32313-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FROM_NO_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phucducbui@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.993];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[youtu.be:url]
X-Rspamd-Action: no action

From: bui duc phuc <phucduc.bui@gmail.com>

Hi all,

The FSI on r8a7740 requires the SPU clock to be enabled before accessing
its internal registers. Without it, register accesses may hang the system
even when the FSI functional clock is enabled.

Previously, the SPU clock remained enabled because it was left running by
the bootloader. After adding the SPU clock to the device tree, it is
automatically disabled once system initialization completes.

This series adds the missing clocks and aligns their names with those used
by the driver.

Following feedback from Morimoto-san, the driver is also refactored to
improve stability. Clock initialization is moved from the runtime path to
the probe function to simplify the flow and avoid redundant setup.
Additionally, the shutdown sequence is reordered to ensure the stream is
stopped before the hardware is shut down.

The driver currently uses clk_enable()/clk_disable() without matching
clk_prepare()/clk_unprepare() handling. This series adds the missing
prepare/unprepare operations and moves them into startup/shutdown paths,
since clk_prepare() may sleep and therefore must not be called from 
atomic contexts.

The series also fixes a race where in-flight IRQ handlers may continue
accessing registers after the SPU clock has been disabled during shutdown.

Changes in v3:
 - Reordered the patches following Morimoto-san's suggestions
 - Updated the DT bindings based on Geert's feedback and renamed the
   "own" clock to "fck"
 - Added fsi_clk_prepare()/fsi_clk_unprepare() and moved them into
   dai_startup()/dai_shutdown()
 - Fixed a race where in-flight IRQ handlers could continue accessing
   registers after the SPU clock had been disabled

Changes in v2:
 - DT Bindings:
   Define "own" clock and add "spu", "icka/b", "diva/b", "xcka/b" to the 
   clock tree.
   Use YAML anchors and "if" rules to enforce clock-names and r8a7740 
   requirements.
   Relocate allOf block and update example with full 8-clock configuration.

 - DTS:
   Rename "fsi" clock to "own" to match driver implementation.
   Add missing clock names: "icka", "ickb", "diva", "divb", "xcka", "xckb".
 
 - In the driver:
   Refactor clock initialization.
   Reorder shutdown: stop stream before hardware shutdown.
   Move SPU clock enable/disable handling to fsi_hw_startup/shutdown.


v2 links: 
   https://lore.kernel.org/all/20260413100700.30995-1-phucduc.bui@gmail.com/
v1 links : 
   https://lore.kernel.org/all/20260403112655.167593-1-phucduc.bui@gmail.com/

Testing:
  - Verified on r8a7740 (Armadillo-800EVA): FSI slave / Codec master mode.
    The system no longer hangs. aplay works correctly, while arecord has 
    some noise in the recorded file (this likely needs further tuning, but
    it is not part of this patch series). 
    The test video link is provided below.
  - FSI master mode is currently compile-tested only. Full verification
    requires a dedicated HDMI driver (FSIB) or hardware modifications 
    (resoldering board resistors) (FSIA).
  - Kernel config gist link : 
    https://gist.github.com/BuiDucPhuc/fc9e5c3ab7a14766eecb4ce568f1cf17
  - Youtube video link of the test process
    https://youtu.be/w3H4v5djr7M

Best regards,
Phuc

bui duc phuc (10):
  ASoC: dt-bindings: renesas,fsi: add support multiple clocks
  arm: dts: renesas: r8a7740: Add clocks for FSI
  ASoC: renesas: fsi: Fix trigger stop ordering
  ASoC: renesas: fsi: Fix register access from in-flight IRQ after
    shutdown
  ASoC: renesas: fsi: Move fsi_clk_init()
  ASoC: renesas: fsi: Add shared SPU clock support
  ASoC: renesas: fsi: refactor clock initialization
  ASoC: renesas: fsi: add fsi_clk_prepare/unprepare()
  ASoC: renesas: fsi: Use clock prepare handling in startup/shutdown
  ASoC: renesas: fsi: Add SPU clock control in hw_startup/shutdown

 .../bindings/sound/renesas,fsi.yaml           |  27 +-
 arch/arm/boot/dts/renesas/r8a7740.dtsi        |  12 +-
 sound/soc/renesas/fsi.c                       | 268 +++++++++++++-----
 3 files changed, 235 insertions(+), 72 deletions(-)

-- 
2.43.0


