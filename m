Return-Path: <linux-renesas-soc+bounces-31226-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4OnKKcbB3Gn5VwkAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31226-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Apr 2026 12:13:26 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A0A83EA6E5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Apr 2026 12:13:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 201E03030B03
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Apr 2026 10:07:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB54E3AC0C4;
	Mon, 13 Apr 2026 10:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Puu4Oz87"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 797693A544D
	for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Apr 2026 10:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776074840; cv=none; b=BzJFWLtr20MF5pAouVPzrRQNnlF+XjYdJXoHf9brAksRvo6SDkhebcD45CfFNosCrpJ7S6o8ms2vrEUNTzejeM1AYIOANSrboC4dzQsNRTgN2Rm2crS1RQIaFsTLV8YXZ6ZMzfe+uoNE0hwEgtZmerV/30QycopgfIBg0TTER/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776074840; c=relaxed/simple;
	bh=UxDiNz5aVAd8jaiS8WbKwd6IwvkgGniodqaG9fbAjlc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ztzu5b2nyjCsBx8+RtKW9XZ1AYSbW3/6nUiW7QkXDsRvfj4KhWJR9J4kK0rlaTJzikMJa1SgrCECndXcBjTq61EPUkFOeTAAnqQ3F98xJwfQyQcmmt7ji0eMPnFpR+DV3coJopQGcG5fmZvbXo+B09d9F4dnGIqcumUKmQsob2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Puu4Oz87; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-82735a41920so1369088b3a.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Apr 2026 03:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776074839; x=1776679639; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qz15EdajgaOwwJlVpi9rRF2MEm37YEfE9zUFEPe5XVQ=;
        b=Puu4Oz87KxIsta5K9aTtHoBxLJqMIHgxrKMkNcJfIFa1QeLxPIkM3xIf6Co+94yJnR
         B2SA0FVv1tHVujw9PCbOHKa7Si7dJDhX37oTVqy8/hERVJL6CO9YoxYilbtWh9X7PoDN
         Vi/jTwa7Wwk3Cuk7ZllmWJC3/ttettDJPwotnis5LYNrMlHYSvjWhXHqsYuWal+Xys/N
         5SSM7jHqHJc4yDTlIOJj4NUhRKdQ6vqVu702C1mY9WESenHvaN/Lpt2eO0hZ7tXIPLXL
         IRb0f5f5YG7Xicvnw0de54USHo3fw6BHdpJFneiP56IFc/2NTvpmm7mHFtzWGSESag3u
         SC8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776074839; x=1776679639;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qz15EdajgaOwwJlVpi9rRF2MEm37YEfE9zUFEPe5XVQ=;
        b=ke1QhaKb6Y6O1Oha2nbsyP3KRlSnOt0OE1/B7cJd1fwQot85olockCK3H4O2X39b6E
         Nxqw4wVVRKVfK1waM5OVkkOvLV736nYajxRYBwd7MxdeIDXGJg98Is8rbpySMVnBIfz0
         oajCbSTPdS0EL9vOfYC1nbLT9fUPsjBUQa3qEfHb/FmwCSZDl5mPs6VLECsZpedT3C3N
         y6mfbPuU8xzS5RJ9Uuga85dA3/u8Sn2Lz5xjF7mxPGzLFMSuCpgQOsxsEdRXGHeYYkOA
         F3z8GojqUJFLD8A08um+KIQe2fefluSeJ1zNnwDqHc5vRvTjfgP/aZA/PWi09C3/TDDF
         55lA==
X-Forwarded-Encrypted: i=1; AFNElJ9Egbh7PxyCN+TaIVMgmkh+92gIvuae53ZiltO3uxOzqb6doZl/F7gavUuzQHKbJnGt2RZf28fQU1EFP4+0UILjIw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx59qKsKkGXIepHltP1M68rIxgCUeK/K3mc7Mnj/hmcmY+1Zoqk
	kF5HhNEVr1CLdRW/oVEsNBkwkBLl9b3pYSgsArONu0c9rg3DZaneBZfz
X-Gm-Gg: AeBDieu1SXsydmf2//JgJ0KULoZlxngjT9azm3N4iLFi2AlP2p/7ktpjIftpKOknc7F
	eMlbL72xqXqFbulR27aHt8v1RqbxI/LJ+5bFGSLuFXue034VfvKMxtc0l9pobWJBIToR1XdG9K7
	kPq8ygezHNLh+dms8TiI+0tBX8eEU0mly2h5L52XRTk/LSTxl7x8pcz8dVtkIGIN9UTXW62RsqV
	WfnIQw7oqXPY5CYuVo9GfHjTYlyG19ZxEeiJxTEgips/DFhA46oNJsr4yLijGCoVZuylBE6kf1y
	UI6XlKYCt6zwQ9flqiNDpCtuewjLRdqV2hCaHnalyMdli0yEPsgfML1XSNGoNhsw3zJuA5cSYEo
	QZ4jBGDuYsKw2RtfdAsL2ntUWfUziGjK5CekS8A0up48vN0VjQJ838IbVm3WHMVVP/3EaUNQrO3
	6qgLaJkW+dMzX5WZsSjkkYI/zQ4IlBE3/q3BjGv2hVGTFoBxKib1dxJLiYlg==
X-Received: by 2002:a05:6a00:aa85:b0:829:8942:2c93 with SMTP id d2e1a72fcca58-82f0c1cc16emr11475540b3a.9.1776074838631;
        Mon, 13 Apr 2026 03:07:18 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c50a8f7sm10232140b3a.56.2026.04.13.03.07.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 03:07:18 -0700 (PDT)
From: phucduc.bui@gmail.com
To: kuninori.morimoto.gx@renesas.com,
	broonie@kernel.org
Cc: lgirdwood@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 0/6] ASoC: renesas: fsi: Fix system hang by adding SPU clock
Date: Mon, 13 Apr 2026 17:06:54 +0700
Message-ID: <20260413100700.30995-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,glider.be,perex.cz,suse.com,vger.kernel.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-31226-lists,linux-renesas-soc=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1A0A83EA6E5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: bui duc phuc <phucduc.bui@gmail.com>

Hi all,

The FSI on r8a7740 requires the SPU clock to be enabled before accessing
its internal registers. Without this clock, register access can lead to a
system hang, even when the FSI functional clock is properly enabled.
This series adds the missing clocks and aligns their names with those
used in the driver.
Following feedback from Morimoto-san, the driver is refactored to improve
stability. Clock initialization is moved from the runtime path to the probe
function to simplify the flow and avoid redundant setups. Additionally, the
shutdown sequence is reordered to ensure the stream is properly stopped 
before the hardware is shut down.

Changes in v2:
 - DT Bindings:
   Define "own" clock and add "spu", "icka/b", "diva/b", "xcka/b" to the 
   clock tree.
   Use YAML anchors and "if" rules to enforce clock-names and r8a7740 
   requirements.
   Relocate allOf block and update example with full 8-clock configuration.

 - DTS:
   Rename "fsi" clock to "own" to match driver implementation.
   Add missing clock names: "icka", "ickb", "xcka", "xckb".
 
 - In the driver:
   Refactor clock initialization.
   Reorder shutdown: stop stream before hardware shutdown.
   Move SPU clock enable/disable handling to fsi_hw_startup/shutdown.
v1 links : 
   https://lore.kernel.org/all/20260403112655.167593-1-phucduc.bui@gmail.com/
Testing:
  - Verified on r8a7740 (Armadillo-800EVA): FSI slave / Codec master mode.
  - FSI master mode is currently compile-tested only. Full verification
    requires a dedicated HDMI driver (FSIB) or hardware modifications 
    (resoldering board resistors) (FSIA).Full support for fsidiv requires 
    additional DT bindings and a corresponding driver.


bui duc phuc (6):
  ASoC: renesas: fsi: Add shared SPU clock support
  ASoC: renesas: fsi: Fix hang by enabling SPU clock
  ASoC: renesas: fsi: Fix trigger stop ordering
  ASoC: renesas: fsi: refactor clock initialization
  arm: dts: renesas: r8a7740: Add clocks for FSI
  ASoC: dt-bindings: renesas,fsi: add support for multiple clocks

 .../bindings/sound/renesas,fsi.yaml           |  61 +++++-
 arch/arm/boot/dts/renesas/r8a7740.dtsi        |  12 +-
 sound/soc/renesas/fsi.c                       | 181 ++++++++++--------
 3 files changed, 171 insertions(+), 83 deletions(-)

-- 
2.43.0


