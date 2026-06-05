Return-Path: <linux-renesas-soc+bounces-33610-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QDZOLHLAImrEdAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33610-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 05 Jun 2026 14:26:26 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C9296481D2
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 05 Jun 2026 14:26:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=rQwYiDBA;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33610-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33610-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 651AE3064CE8
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Jun 2026 12:20:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C28C337F8C9;
	Fri,  5 Jun 2026 12:20:17 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEBFD309F00
	for <linux-renesas-soc@vger.kernel.org>; Fri,  5 Jun 2026 12:20:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780662017; cv=none; b=sWn0B3776zCaLT2B+4qM2Fi/6dAZd6hYNflxaMwvPz516i0WxYT1hBJ1+tfeCwkNIY+kQiXZgT7SexG/NARXu4xe/UHY1VOoRDakTON3bJlPOb0jjuQEMPu6gTHovrecabgKGMq4plFiGhgR2G+ef1DKvojtcBEsubF0fPDY9R4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780662017; c=relaxed/simple;
	bh=4fqm41jFg92gyqFNJrCUrFZlM+usXbmuU/UIVhRwMzo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AA0oNr8ddcPAaDxlx2sYqEzUV7oTpIg8YjCcAQ7vnsHArITa6wNax+Ya3aFVkWO/+UiBVWg0b8RKwsjJkRgd8rhTiihgUW1gdIZYUa0paEjPlrR7IHUpJq9G+QfyLLfFBjsArn6AOzrHTkdAe0ao5cBGzUBXUl6ScDR0esIvROM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rQwYiDBA; arc=none smtp.client-ip=209.85.215.170
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c85ba774551so693021a12.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 05 Jun 2026 05:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780662014; x=1781266814; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hEMew3UN10dz8c+0NrezgyqXaJn7p0nQbi3hUDkdphs=;
        b=rQwYiDBA2v1cp7ijR7UaPzj+O+UiK1Jr4EWeNEt4EE+2swB8DTID5yxNDsa05CcXvC
         tcaihovzlOML0L20FXote2nlqRrePx5EEf7QX59ijlFbKjmm+GBPffApDGL3AZplwMWh
         HlMONwFkxzFrOQMoomrrFYaHzk70LE+3QnUE7D4pmcsOzykvG0rWkNUFqy0xNVeqDR/l
         pfTYfzjqiykQ+IYEXaZ1JzYhkkfAv76c+c0NyL90zGqZLl9xDqCHRR5bf4Gvf2wmX9KB
         YgvbStlZsxaSPnMeA1idd8+l6W21eRH+gWN8a3vfb50oEiwWK+ND2fyuPMxyFi1VkkOu
         4OWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780662014; x=1781266814;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hEMew3UN10dz8c+0NrezgyqXaJn7p0nQbi3hUDkdphs=;
        b=Yyvt/O3zq41zaqyVQQsLOpmf1X63WPK0a8cCjt1Kb1cvhdwuwlSK2WJr7QdHE4XD55
         0UmTxpfJBrG8SoSFImRhDOJZ232lqfnFyMIr81RzYgzKgoVbCfhNmTNrMOrGFldpaU7w
         KykDq1cMHLbsAfzfshbvndUZtRD2ZW3tQk5NEc6iFXhYi9fA/tA3+rEyJKHWPbqvaqmO
         6rCUZN74GNzpnAboSxFbs5Zt6SC33QXWC42XVzk+N1yr9YMdxNS8Y59FxPjYW/7wy0Xp
         bY9f6qOYYs1+VRikoeTYfjqw5r66pmCurXFsCIVg2HZJvVfwUOaqCI68XQ0lPKqsUhzS
         Katg==
X-Forwarded-Encrypted: i=1; AFNElJ9047cp1JLfe6I5FI1deXcfOJnfT1IcObnwbqaV+30YwqJCjP+aQeRu+omXpnkN8G+rpRSwPuE1GgLF0luPpGO4ag==@vger.kernel.org
X-Gm-Message-State: AOJu0YzHQJlkbPp0MQz2dA8GoKIPP5a19Ur+RUB4T9UeGrV1kWbbCgxV
	L0Lp9kug/P6x4vJG9k7dF9z2A9e6sHXm1det/qZVuDKI0EhmssNJvKVa
X-Gm-Gg: Acq92OEBepn8k5NpIfrDptDrh4NHbJ8RdF7l9Q7pAollrUTiunEume1cSUSZlnrhEXd
	TBhheRie0/IwlzxXOq3icwb5FZXXd6q9BEIi9sEShTpi8p2nBuhukE1t3aFeNzpRVJ5Wp8hj/IA
	l0PpAyJYnzzPPyjr4YPQLN8TQMoAK2ptjVIGATr+FrgXFWZIuRvR8NVUf3uSx+q+EH1AIrkYqXG
	GUB1OO63sLu2eqIIGB4SyP2LDeURGV5dQNqdU5xF5mwyfMx3nLAFQ+JIIgAF3JYcYpcOoUasfIe
	+OE+J/rNWwO9necPKQjlfd5Bz2dzKvRIMcGkjO+xUMcJvK1ipJ3K6ce+VEQG1ff4ZwrNYCVpxmH
	2TDlT1bMOzedJZMECZ+VP62d9NQHS4SUq1lwrQSGt06w3Mr9br2/IO/yWEpWekleHeED7XnMAXJ
	vPsamFCyTVwRIfQmHTDuO6yjeNL/LNKgoicYfTy7Uss/zsEoryf3gRQ/tWA6o5C2MdnW0z
X-Received: by 2002:aa7:88c1:0:b0:842:68d3:e29f with SMTP id d2e1a72fcca58-842b0e14e3bmr3304903b3a.3.1780662013791;
        Fri, 05 Jun 2026 05:20:13 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282221059sm8594381b3a.7.2026.06.05.05.20.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 05:20:13 -0700 (PDT)
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
Subject: [PATCH v4 00/10] ASoC: renesas: fsi: Fix system hang by adding SPU clock
Date: Fri,  5 Jun 2026 19:19:44 +0700
Message-ID: <20260605121955.105661-1-phucduc.bui@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-33610-lists,linux-renesas-soc=lfdr.de];
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
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,youtu.be:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4C9296481D2

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

bui duc phuc (10):
  ASoC: dt-bindings: renesas,fsi: add support multiple clocks
  ARM: dts: renesas: r8a7740: Add clocks for FSI
  ASoC: renesas: fsi: Fix trigger stop ordering
  ASoC: renesas: fsi: Move fsi_stream_is_working()
  ASoC: renesas: fsi: Fix register access from in-flight IRQ after
    shutdown
  ASoC: renesas: fsi: Move fsi_clk_init()
  ASoC: renesas: fsi: Use devm_clk_get_optional() for optional clocks
  ASoC: renesas: fsi: refactor clock initialization
  ASoC: renesas: fsi: add fsi_clk_prepare/unprepare()
  ASoC: renesas: fsi: Add SPU clock control in hw_startup/shutdown

 .../bindings/sound/renesas,fsi.yaml           |  61 +++-
 arch/arm/boot/dts/renesas/r8a7740.dtsi        |  12 +-
 sound/soc/renesas/fsi.c                       | 272 +++++++++++++-----
 3 files changed, 260 insertions(+), 85 deletions(-)

-- 
2.43.0


