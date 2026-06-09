Return-Path: <linux-renesas-soc+bounces-33749-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mKsjAIn8J2qY6gIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33749-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 09 Jun 2026 13:44:09 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D81465F95D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 09 Jun 2026 13:44:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=rp7hQDul;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33749-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33749-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B2AF530427FE
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Jun 2026 11:38:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E7C133F5A0;
	Tue,  9 Jun 2026 11:38:58 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B53B3B3BE9
	for <linux-renesas-soc@vger.kernel.org>; Tue,  9 Jun 2026 11:38:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781005138; cv=none; b=e7go9L+89BT3BZu4HyyWalkNPGWm3OIG+5HiPIq6Y7QL5fwa+Et2XxOCETE9L9/MQi0cKrkJ4vOL+aoIQ3FtSt0go+AFjksuYtaas16xlhZ7+NgFP19Yf7H8BXIkH3IFrRYFI6RVuCuoJ4DZqT8n/0YthwsuyV0u7MO0TeoO2to=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781005138; c=relaxed/simple;
	bh=mVw0y+bHtOArz6HJGNlsSNM7DFC9Jx00bD8nGe8taNw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tOZZCY5K3HoTFr2XKl4QHnkyjA9CwRV36Is6XVvjP2rpH6fgwjNqx3WWZTHjQfvMbXGZRGaCazq8gdpJKjHgsdtgrr2812nGYclj0DYtJapvvL1e3aDw46R7OLwPLzmrX3a1B7qDUfk9p95FFHIe7PBaGD7LxLTSAyI0MQNtCIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rp7hQDul; arc=none smtp.client-ip=209.85.214.169
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2c0c1e0d00bso52282085ad.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 09 Jun 2026 04:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781005136; x=1781609936; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Tv9NcVNNm5k10R2xclc5mA3XBryiKRvqVdDaYxEN+cs=;
        b=rp7hQDulYDFIYKZz90W5fbukaYy4kpE1mYZzytsiC3SgTxnfd2l4YgWFjSqds7z0Br
         QwkI8XGwNSEbE7S8A095ekWqk6H/Vd4BNMEr99IfKr1AUX9UXOnnjehkAGGiDevcI/kB
         RvFj0t0JzI1bycHera3QSAIOnDye0FfozdHl8r/rLT6FTgzfhaOMC4mgkhWTHc/AWmvo
         itXQ+61EHUt3ipEV4LY6hebZTxAxyV7yv83SXPl1Deavn1EYEJRJ6Cu8/sDUo0fFnMAU
         nIL0TnkpL/l6xl6Y+ravunmk7WFX5G/Ha6+TfDIbH3dGO1kYLc92vPpTcjG6noi5mFcp
         s6SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781005136; x=1781609936;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tv9NcVNNm5k10R2xclc5mA3XBryiKRvqVdDaYxEN+cs=;
        b=p1F4qwbx20S6hfR3Grqep2zgenK713FqSh6F9/N39xQS4Acp6+FQlIuS6CRJu8d+Z+
         3by6kOrqXhHGu55M4eK21xE9XWpOR4LUwhzjUjDrQq4S+WS2hVkOcJrbtCJjH4fxxFvP
         x21cGzMAakDLSBQVxHnk9XiTlUaNgqwfl8HypUL/2t3UGA3uEYknv7gQAmJGoLbfCErp
         M6tUM7639ba5cPa4kkaLquTnLkk1pd4ohTEUOUuAsRjaHiK28RIF+fJ6G0DaXbj9c4ho
         0ahBRMaJC6arXzchLra3Ye3+TKCBCeN90Xb0x69GvNCunRivMg+ji96x7Ia3/cAWeLp2
         UmXw==
X-Forwarded-Encrypted: i=1; AFNElJ91ae+oQoCWzI4oo3gnjz6YRRS6XGSyeVei1rVqAeKKeZBPv5ppf07SAAb4EyACwNSpC9EAvvyZrTyL/KD+bOMdDg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyS0/CRWmhH+zzbAlvunBUPH0snstZA7MG8IXS6RPo5OjlJ5e6B
	w91Kv76JzSOwHjkrwLZp7lPTCuAWaBQdP08AOIcfWLQYm6LE+cmwGl9H
X-Gm-Gg: Acq92OFi/GqWbCGVt5iTqJv0nM0G/VtbaLvmvvVz+Fz/nbEACaPQNcwhjfm/BD7PoNW
	CkRHoB3GYmuTonVmC9qPNZ+N4y0nJr/4UpgezU168kn0VdX7MmKnV/rg4uck4SkO+XANLgfKfy4
	nMG2rvFvZ/E2NWeba+Xz8ziFxzGOXJ3pthFrpBrJSmT9PFxvNOl8SQopREcVuHtN2CUue2wyMPo
	lX8WB4IuBdtzgWX1i9UAiq+M4I2Dt/P/5wfnQsKBPtqJ2VCKSVkfk9ZVQ6GcH/zGZST/fUG2D5w
	7o8RoUe92nJdPFoyOo7sVRILS5aIdICGNFEDt1RHCDON9EGyVf4xhCeo0hkg9KKt0YEKgYHsr9l
	Rkc/Ide51E2PhDO5qh35DIdM8qj6z8L6WwqmhJx/2x0/tSnJYBpOHjasoJj4Mp8pKv0yEpePpr9
	EPhUTlsBsRFTbARRo4Siq/9ZLYeEzUsffW/RWBXYQKZsJlXXUpTjQR0WlvXbBiH9C52t6Z
X-Received: by 2002:a17:902:fc50:b0:2c0:e5ee:f554 with SMTP id d9443c01a7336-2c1e80d29b7mr222699735ad.8.1781005136393;
        Tue, 09 Jun 2026 04:38:56 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f70660sm210755635ad.11.2026.06.09.04.38.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 04:38:56 -0700 (PDT)
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
Subject: [PATCH v6 00/11] ASoC: renesas: fsi: Fix system hang by adding SPU clock
Date: Tue,  9 Jun 2026 18:38:25 +0700
Message-ID: <20260609113836.45079-1-phucduc.bui@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,perex.cz,suse.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33749-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:kuninori.morimoto.gx@renesas.com,m:broonie@kernel.org,m:geert+renesas@glider.be,m:lgirdwood@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:magnus.damm@gmail.com,m:perex@perex.cz,m:tiwai@suse.com,m:linux-sound@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:phucduc.bui@gmail.com,m:geert@glider.be,m:krzk@kernel.org,m:conor@kernel.org,m:magnusdamm@gmail.com,m:phucducbui@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[phucducbui@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phucducbui@gmail.com,linux-renesas-soc@vger.kernel.org]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3D81465F95D

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


Changes in v6:
 - Add Acked-by tag from Kuninori Morimoto.
 - DT binding updates (drop uniqueItems, commit message).
 - Improve probe and clock error handling.
 - Small improvements in clock handling paths.

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

v5 links:
   https://lore.kernel.org/all/20260609013107.5995-1-phucduc.bui@gmail.com/
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

 .../bindings/sound/renesas,fsi.yaml           |  60 +++-
 arch/arm/boot/dts/renesas/r8a7740.dtsi        |  12 +-
 sound/soc/renesas/fsi.c                       | 267 ++++++++++++------
 3 files changed, 244 insertions(+), 95 deletions(-)

-- 
2.43.0


