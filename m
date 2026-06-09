Return-Path: <linux-renesas-soc+bounces-33717-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lCYvC7htJ2ozwgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33717-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 09 Jun 2026 03:34:48 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9259565BA8D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 09 Jun 2026 03:34:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=mw88FGxM;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33717-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33717-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 69C443028C6D
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Jun 2026 01:31:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5307330B01;
	Tue,  9 Jun 2026 01:31:33 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E45B431AA87
	for <linux-renesas-soc@vger.kernel.org>; Tue,  9 Jun 2026 01:31:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780968693; cv=none; b=MO25Dy0nD3WxRrOzXCO61B69B8xXBDK6wBBktrTxdG/aKeMTKN2OBn9P8WnhiKOxAtTJPVLpy6D9oVipUxDxGhYsSsYsk2u0oNVSWj+T7fww350mi5Fb9mvnl/QW7kiObAFKV2KJsHr5Vw8+EZd26oXDTR4/LdA+9ojhvYcVoe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780968693; c=relaxed/simple;
	bh=UBq/TfHyDSOxgJXlZFUCdop4eaB/vfrndG7P4URnSsM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=u5BGzBtzigi96UwaEZqeB1Uf0jwtCEr1AjPoN++TocSfkT59+XKJ/Vkdr7Pi1Nfu8M/+Jcu60QtL59iUB/+7i14NNwn5Gh8EN5aT7h464sm/tKLbhR+xcCBS9C4Olvtj712Iw47alcDt356QK5K4PxCyHZXa4hKV6IPHNoJRuCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mw88FGxM; arc=none smtp.client-ip=209.85.214.177
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2c0c20f0c0aso37424525ad.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 08 Jun 2026 18:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780968685; x=1781573485; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=02FJ6YGr3OixEk6iz8PM1UvhvRNKfCs847PeFoWoGHg=;
        b=mw88FGxM0D8YwrO27t8wG+B9Eu9iRdP1FvfTkU2RIr4ek9BFUi0dan1dPgeqJtj2KR
         UuJXrU6BQK7k3RyIOgKQBU92xLArKaQp95BrmuwUnrbtRDd8j88a80V21c5DJ7SCYxIa
         r02v0ZXtqGM1PhBlEKW+AtLUJTOyTLcoaLDUF3aO+Gqa3TnU8MllEDHzNOddiXjeaFm+
         nvT454C72cQpPfkguGW1PDc9/poa2SHcdtbSwwQUA/1MxbqudTUbRFLnRUppqNh05GkQ
         6xXoIrmycT+zur+0Zukl5RIpnGpsix7gyddtN4CmAxV9jA9CRuMxQSydaUX9ObuoJxkj
         Vi5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780968685; x=1781573485;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=02FJ6YGr3OixEk6iz8PM1UvhvRNKfCs847PeFoWoGHg=;
        b=BCDAauoeUB9m8GibwNgcehEm6XIcY5rmrCw4EbWXqldvPv8NsPfdTLGE7jZMdJ9o1d
         E+aF75yfl4Xo/YhM8qkAPb7N9y4GNQGMp/KULLSbIRHDVQTPkIHvPKVh8VQ9evdqXp+q
         Gt0ushQUQY6WKexVyYPrcNZFBgCQ0Jg46qZVujqlxnR39zSQxJK/DyCgFv8Pfnm8rxFu
         8V1MLkTshhlGGXGqsfzWwlbDMkAisxL+HZlnj+Ku2LPF3x+tbtU7BlqlqX2bgcif5aSk
         FKgV6GsPo8I2Q68H+LYg1xJtaE8HzfkVDQSAfKwBKYSiXhXcumG736BQ64GTDpyWSN9z
         sErQ==
X-Forwarded-Encrypted: i=1; AFNElJ/YGmY3yS3FZQSJcb7MTMHY796C2X1AgHRQbbII9cEmDeluElq5l64Xf8pMW40hUfW2nUVgEArBiUOiT1w/GXPpeg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxXzfWaEYcNt2mmXYQF/f4l9OoWamsTFapY79LyIdbf43G5+D9O
	1IwGlZOqXXcw2HDj8ZO3Au2wwCONm0DX7/yG1aL8pts8v4Z/AQEanDiK
X-Gm-Gg: Acq92OHw7hsU5Iyoe51lXWWhUiXjiGpmDTk90jgv9Io8ogoAFPi4njMYtPn18I2JBPS
	wqrAKtbSpxGpv00ynEnkxHqhmV3vfoSJubf6xJFhFTJa7wkHhBR/rJsfacAX9pPIM8qqfLX4LJi
	irpuCHa9NSGq7SUkTynDYQbxYVrl6q8UqWpOZ9+PvHOteRVFp8l8Fs0fiSQ2Hne2wexhwl4ezJQ
	asIxNTJWXGw8In0G3wHc6NaUicz3n/iRPrm770RTQ4u2yu0HAq2BdfMp5cy3pHYVMWWZCqA0JTj
	VpMZm1ewhKB2G3ETAIa/ajsK1LmZcWo21+bcJqS6tAuFPAtEbjRBPgDa9tFW+yJnV9AY1jAYLHS
	pIs87jX0HMAmRf3jV0C6SH/f9K6jJ6XA9RbqxFwwYNJWjG41jo+sbxqu9gYrwTn2hJRdm1N/qUO
	2+fAPuHrCwYTejIhM3cMWpCxF6hLkXAlUBFM+3Wqs3mG0Uv1f8OVm2Z8d/TssipAiBHyog
X-Received: by 2002:a17:903:46c3:b0:2c1:13b5:6c24 with SMTP id d9443c01a7336-2c1e7f922a9mr188591745ad.20.1780968684858;
        Mon, 08 Jun 2026 18:31:24 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16609e627sm198765335ad.52.2026.06.08.18.31.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 18:31:24 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Mark Brown <broonie@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v5 00/11] ASoC: renesas: fsi: Fix system hang by adding SPU clock
Date: Tue,  9 Jun 2026 08:30:56 +0700
Message-ID: <20260609013107.5995-1-phucduc.bui@gmail.com>
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
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-33717-lists,linux-renesas-soc=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:kuninori.morimoto.gx@renesas.com,m:broonie@kernel.org,m:geert+renesas@glider.be,m:lgirdwood@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:magnus.damm@gmail.com,m:perex@perex.cz,m:tiwai@suse.com,m:linux-sound@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:phucduc.bui@gmail.com,m:geert@glider.be,m:krzk@kernel.org,m:conor@kernel.org,m:magnusdamm@gmail.com,m:phucducbui@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,perex.cz,suse.com,vger.kernel.org];
	FORGED_SENDER(0.00)[phucducbui@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phucducbui@gmail.com,linux-renesas-soc@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[youtu.be:url,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9259565BA8D

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

Changes in v5:
 - Drop spu_count and rely on the clk core for clock reference counting.
 - Reorder the patch series as suggested by Morimoto-san.
 - Update the probe error handling path to ensure proper cleanup on
   failure.

Changes in v4:
 - use fsi_stream_is_working() for Fixed a race where in-flight IRQ 
   handlers following Morimoto-san's suggestions
 - Handle the return value of fsi_clk_init() to properly support deferred 
   probe, as suggested by Mark.
 - Split the clock refactoring into a devm cleanup patch and a refactor 
   patch, as suggested by Morimoto-san.
 - Update dt-bindings based on feedback from Krzysztof, Rob, and Geert.

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
v4 links:
   https://lore.kernel.org/all/20260605121955.105661-1-phucduc.bui@gmail.com/
v3 links:
   https://lore.kernel.org/all/20260510084303.122426-1-phucduc.bui@gmail.com/
v2 links: 
   https://lore.kernel.org/all/20260413100700.30995-1-phucduc.bui@gmail.com/
v1 links : 
   https://lore.kernel.org/all/20260403112655.167593-1-phucduc.bui@gmail.com/

Testing:
  - Verified on r8a7740 (Armadillo-800EVA): FSI slave / Codec master mode.
    The system no longer hangs. aplay works correctly, while arecord has 
    some noise in the recorded file (this likely needs further tuning, but
    it is not part of this patch series). 
  - FSI master mode is currently compile-tested only. Full verification
    requires a dedicated HDMI driver (FSIB) or hardware modifications 
    (resoldering board resistors) (FSIA).
  - Youtube video link of the test process (from v3 verification):
    https://youtu.be/w3H4v5djr7M

Best regards,
Phuc

bui duc phuc (11):
  ASoC: dt-bindings: renesas,fsi: add support multiple clocks
  ARM: dts: renesas: r8a7740: Add clocks for FSI
  ASoC: renesas: fsi: Fix trigger stop ordering
  ASoC: renesas: fsi: Move fsi_stream_is_working()
  ASoC: renesas: fsi: Fix register access from in-flight IRQ after
    shutdown
  ASoC: renesas: fsi: Move fsi_clk_init()
  ASoC: renesas: fsi: Use devm_clk_get_optional() for optional clocks
  ASoC: renesas: fsi: refactor clock initialization
  ASoC: renesas: fsi: Add SPU clock support
  ASoC: renesas: fsi: add fsi_clk_prepare/unprepare()
  ASoC: renesas: fsi: Add SPU clock control in hw_startup/shutdown

 .../bindings/sound/renesas,fsi.yaml           |  61 ++++-
 arch/arm/boot/dts/renesas/r8a7740.dtsi        |  12 +-
 sound/soc/renesas/fsi.c                       | 246 ++++++++++++------
 3 files changed, 228 insertions(+), 91 deletions(-)

-- 
2.43.0


