Return-Path: <linux-renesas-soc+bounces-27370-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2Ow7O7v9c2mf0gAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27370-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 24 Jan 2026 00:01:15 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC9D7B576
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 24 Jan 2026 00:01:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3563F303A241
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Jan 2026 23:00:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6C562DCF58;
	Fri, 23 Jan 2026 23:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FeZL4+oo"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0236E35957
	for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Jan 2026 23:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769209229; cv=none; b=hHY/L8bZJFd6EzpBRs6y/+KJ9VqHh7SkI6y4bNs1SSUUZVkojFg4V67ILmhjRfPSfXrU+8EEAXStRH+zRsj3UyiBcC0Bb4kJA7aeS0SeWDaZhJNGaPxd2+59gtINs722F+ajE+Smh/DkksGpAt0p/kl7gvL9mPVnNYNPee4Hqi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769209229; c=relaxed/simple;
	bh=i4uPDr+jc2Tq+qejoX8mlb7m46ogomId8dNchVLMVhU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I7XLyXtgTKCFvi614ZLnd0RSyG9+VdN358Dofk3KAuB+bY9xNkbdD+imwZY+OFHOojVKzh+KXmv8TxhpELnh69hlytcRXYeQDIfZubmju5auObLdP8lspCzncVKJX87UtM2QZWKhMae7apYLnG2sNtzplmK+/bUj+mrzji5MT2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FeZL4+oo; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4801c2fae63so21282115e9.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Jan 2026 15:00:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769209226; x=1769814026; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w7fqYakjEYyKtwTChdLB8pkFMt8fUfNxeWNMu0LHBXc=;
        b=FeZL4+oo8myPbSEQJ2+WoZ6xxA5+0mDFPd/WP/uHtZMPbc1BrhF8jGslUmN5Fabpns
         VxTVRbbCm9SU99K0wE4OHnTS2pDmaResstsykxsIiOduaeAhUGfoFtf29cwnemxJX9vs
         ir4BMj+kYpGvMdwwkCnCCpOOxQDeCKPVY487TuM1+Te4B7HBfHJ4W1l8FBTSXLjcBnyz
         5A6CNcSHpSaM1wvmyCLb4lKJdy70LS5+kEWUzHHobRlstTbKDDSTTQRFuUT/Luek6A3O
         WyblQulur8uVk3ZCCNxHptXwXl0SDk4wId/060xEF0loLQKgXS8Guv5hdImdzo2khnhK
         3qog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769209226; x=1769814026;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=w7fqYakjEYyKtwTChdLB8pkFMt8fUfNxeWNMu0LHBXc=;
        b=FxFE2J/W9xDBANNNuUCf5Xi6Vfmw9R5FLRgDknkAYQ/BJyyLNRDmCuSgyOXwJdkjLS
         ukdSyOO2MQ4ROSkrPAO/9Ubd+2DnBOVLzk0Pc5SEHqFu25jAuIL7V9njLrRArtBYTKos
         mrf/v5hpUTA2rjYY4PXXFoK7sO+Dpd14/GYYmFGcextFrDNTG+hyNgrygaPxqjzoUzIS
         CCEDbQzPqcNW4jeN1cHR0/woQRHZUgJnyr9rU9Wwgqy5eHQCIUKK/rKodcdPOVthFINN
         CVr0aS8LHTX1Qqlpa8Zhedgea9U/aLAvDmbs5DcWnjX1OBaGwsGFaAxg6FuH//sRix1z
         CxJA==
X-Forwarded-Encrypted: i=1; AJvYcCU/DVYhvLdwOE/aQLzqoB1gvjJ5Rlh+qSEqybXthyxISWpRNAJeuvPDWDcA7Tk8m/lWzdypccbETtEoFrDYpzj2Pw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/hUQNGBKoNsfrTGb6lDkmsegY6YO6emy/jqTfUn5AX6b2fFPq
	yacU2xJkf9ttMOIjwBTSEX/X01zGL7JQAD5juyHe72Eyf3LjNO0l2fKV
X-Gm-Gg: AZuq6aJQMnRlNg+/MlqHgSMOVyabsqHkSC+usPxOFPsoeaKv4cGUSSBIQ8GTtUrcEgB
	MNelT5YMc0GSZG5kd3zkK1JNo3Ba0JfKnrd4IsL6gPwqsv2VWw4e2ErdWPoGZ2w3Nw5wnlvfyjS
	FkstvUgjfMjLmQpoYM504kBzxH5v0lxw+XZl+iSequNylaSWL0BHxGEZbsj7Zi+9G4Kf3gJMUsy
	8eGvbvxqAsXz31NSkxzfnbTOLS2xRR+KihWaLML0ohXc8qMtTzbO3Vr0AgaXbHihrmMVOHniSDd
	zfojII2ISpd2QaHdm2+mRXOAHRYKgbtWjtWSn9s1WGjNEkA5gScR0wvKATX00Um/ikUcYC4Wt8f
	b8VWDb62di++G+nePv+1FyEQCXwlP8Tqlc0lpVGnd4EHLa5w9f4psZrXkdM8Qe/JskPA0LGGufe
	BqBCJG7wzlTg9nxpHXWAHPUM5E2Eenzjq+47713eKtEn4HoBp6t5aRR8XwHKgbELdbCrH45JfzG
	54NGGnfR/Z/1/Br0C5QC7Rl
X-Received: by 2002:a05:600c:c08c:b0:480:4d37:e742 with SMTP id 5b1f17b1804b1-4804d37e85bmr55750475e9.10.1769209226208;
        Fri, 23 Jan 2026 15:00:26 -0800 (PST)
Received: from iku.Home ([2a06:5906:61b:2d00:bccf:b3b1:e288:4e83])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-480470cc278sm157142665e9.12.2026.01.23.15.00.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 15:00:25 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-renesas-soc@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 3/4] arm64: dts: renesas: r9a09g087m44-rzn2h-evk: Clarify SD0 power jumper setup
Date: Fri, 23 Jan 2026 22:59:56 +0000
Message-ID: <20260123225957.1007089-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260123225957.1007089-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260123225957.1007089-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27370-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[glider.be,gmail.com,kernel.org,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bp.renesas.com:mid,renesas.com:email]
X-Rspamd-Queue-Id: 8DC9D7B576
X-Rspamd-Action: no action

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Document the required JP23 jumper positions for supplying SD0 when
selecting between the onboard eMMC and the SD card slot.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts
index 19f0a2c06753..4c0fe5c7e8aa 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts
@@ -14,12 +14,14 @@
 /*
  * SD0 can be connected to either eMMC (U33) or SD card slot CN21
  * Lets by default enable the eMMC, note we need the below SW settings
- * for eMMC.
+ * for eMMC. Also ensure that JP23 pins 5 and 6 are connected with a jumper
+ * to provide the SD0 power supply when using eMMC.
  * DSW5[1] = ON; DSW5[2] = ON
  * DSW17[5] = OFF; DSW17[6] = ON
  *
  * To enable SD card and disable eMMC on SDHI0 disable the below macro
- * and set the below switch setting:
+ * and set the below switch settings. Also ensure that JP23 pins 3 and 4 are
+ * connected with a jumper to provide the SD0 power supply when using an SD card.
  * DSW5[1] = OFF; DSW5[2] = ON
  * P22_6 = SD0_WP; DSW15[1] = OFF; DSW15[2] = ON
  * P22_5 = SD0_CD; DSW15[3] = OFF; DSW15[4] = ON
-- 
2.52.0


