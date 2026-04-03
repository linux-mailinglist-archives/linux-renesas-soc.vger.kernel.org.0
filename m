Return-Path: <linux-renesas-soc+bounces-30838-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gKgcKVOPz2mmxAYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30838-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 11:58:43 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A6C4393119
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 11:58:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 54A8E3120310
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Apr 2026 09:53:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D3D839DBE5;
	Fri,  3 Apr 2026 09:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zm6gx65V"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7E2E39D6ED
	for <linux-renesas-soc@vger.kernel.org>; Fri,  3 Apr 2026 09:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775209816; cv=none; b=cwJ17H0Woxo3I5qDoNbIGOtUJa//EOKlKm9czI/gTJknAt1zJ54q2Vaat+fY80Z4ck3syR72PdJzPHwqLggRWqBIV0XSMRPUiI56LjRvr3646OrUlLT77dgUc6qNsE2XTYuptKEnF5VDH8+Cexvyd423/svV8kGpYG7sYUMhWHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775209816; c=relaxed/simple;
	bh=G/XTTldBTOOM0QMK0+ZZGC/DPdHMFsB/H2fYQDGye4g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fMLhXo8cSSG8aaPSIxsHwY5F/VVD5fflp1i+eYrYgOXudzpn/AfcxIrYJb2/Z4tYZmG7ktWe4OB6wv76Z6jRpvdUkWj8o35Whf+btvPJjs8D/HS8lNDVKMel87HaW3mKpYQZQ/1tQUL9G/Ys/ABkqgfDJR5G0FOlaHxUabdLB1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zm6gx65V; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-488a04f39d2so992325e9.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 03 Apr 2026 02:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775209807; x=1775814607; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=J2ExhCCG/Ktc9lkeQiNOn03CChrBuSwykagKy2evogQ=;
        b=Zm6gx65VX/5Kx7BRz3DgbZPzZ1VlCFHrIScUrpQUjYouEnWqOyl3/sfq65rGuNpeM4
         SvBKoVhOR9vdDvGuQ1F2xIdQKk8lYqot5enZ+f8IEAs5u5DB7uPlUtonl5XsFOkhtEGz
         tln8Rq9iR1fdTU5mieM8Xrg3T0R+Hq8fA+Ym+VWu6wh3m2hpedhZjPPEbKF2I4611mos
         1AqIL8oPmDmvlKIUkitjMpqvHNm4s0W0+AUR9Q/MR852OPUQ99INU2gznEHoU4X90Omy
         a3U/+p4fbGzDbo/Ttw4psIr6hmGweY7UI1XzNXrqK9qYAa1xkPF5BUkGwdcS2vgW0nBr
         1SJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775209807; x=1775814607;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J2ExhCCG/Ktc9lkeQiNOn03CChrBuSwykagKy2evogQ=;
        b=orzkD8WryfPtSv89gvj/vTvhVJWhHAXRxRCrfyC2m8aNzn/Z6ZY6lL36aaIpfkYa39
         IF4MMRddXbXT4SJ7XoxAbXA7aOB5AEsZy8u1RRx4Cn54CnGpwN5qIe08YjhqBC+GMTkf
         GorLzwJjwRgN9VT8lgYPigL9kir1mitNG0f6AoAxsAABKihg99ByMgpU2wkzzAZI33SA
         Cn6sQHZURwsD9BzxOogX8hy8JAQQQ7ln+3BfFtfWWyvWfZA7RQQwMYuHSriab1CVUGn7
         uxPBy202xewoq6xYu5aSv6MaEehMouPlZ0k4LaxXkQ+IoUhn7Kz6bzRJrnJ2Q5+DvX35
         lPbg==
X-Forwarded-Encrypted: i=1; AJvYcCVlVG7ifP3Ps1T8HwJQIVwKpx4uKnBcuL66SfjeBY7we7OxhErhyiJwXBewIQpIbJJlNrBlTh9IVHV4tz3BUZH6mg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyQeTIJ25phg4UQ6pYwEOsCiiXsEhFm5qcdKK7jtqP0TIt5r5c1
	nOQmaoWoTiIGxZvOyNcVUHDSO2FKNNZ0XJibwrf8mC7iaEvMPcskIrlA
X-Gm-Gg: ATEYQzwQwMxwVilEjiQ4h17dENHfPv/KuMEEHJb7pQ4/3xTj39Lse3uRW648leILzyr
	+u4NKuRyFeQrn/1772qYuEoiRD7nfmMmBG+6OhvGggYzdhP8zD8XB/pLRoY+bMtg0hDFChqXToS
	KP0hHqKRiHYRzffp74tJcYkFVU9ptMydFCf6rZ75JXwjjqcTKPZ5bbGmFrNtp0N975FiUTN3WZ5
	1f2516dBrO56ssxezYntSINLKWkHTAIXRWohc30WNAx6PIXOYH5QABBjJ7Xf+iXa2D4+r4ZMda5
	zlVgT8M23sEvBn+ZsiSWu7GDTdpftUB4SS6MP3Gfr49nb7z961ZtkqWAjRraFCUyXIC+cf9aQsR
	jQMppUOPGVTXJMHMkwP7aaQ3Nvq79F8M1klumgV9lnH17esgguPIwsppBvPFrA4oQG+0DFS4n+z
	/6F8oOCKzz1xsinvs9H5stWPZvdhu/P8avbwgS1z1Yfw5DkY1+
X-Received: by 2002:a05:600c:34c8:b0:485:3b00:f92e with SMTP id 5b1f17b1804b1-48899715377mr39107515e9.2.1775209807303;
        Fri, 03 Apr 2026 02:50:07 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:58b8:b4b6:c8e1:8690])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48897fc89c0sm25965355e9.1.2026.04.03.02.50.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 02:50:06 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>,
	Vincent Mailhol <mailhol@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	linux-can@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 0/3] Add support for Renesas CAN-FD Bus-Off recovery mode selection
Date: Fri,  3 Apr 2026 10:49:57 +0100
Message-ID: <20260403095003.104542-1-biju.das.jz@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30838-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,renesas.com,vger.kernel.org,gmail.com];
	FREEMAIL_TO(0.00)[pengutronix.de,kernel.org,glider.be,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,bp.renesas.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0A6C4393119
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

The CAN-FD IP supports the below Bus-Off recovery modes:
1) ISO11898-1 compliant
2) Entry to Channel Halt mode automatically at bus-off entry
3) Entry to Channel Halt mode automatically at bus-off end
4) Entry to Channel Halt mode (in bus-off state) by program request

Add support for Bus-Off recovery mode selection via the
renesas,bus-off-recovery-mode device tree property. If the property is
absent, it defaults to RCANFD_CCTR_BOM_BENTRY (entry to Channel Halt mode
automatically at bus-off entry) for backward compatibility.

Testing:
CANBUS-OFF trigger on RZ/G3E SMARC EVK:-

Enable
CONFIG_EXPERT=y
CONFIG_GPIO_SYSFS=y

echo 556 > /sys/class/gpio/export
echo 557 > /sys/class/gpio/export
echo out > /sys/class/gpio/gpio556/direction
echo out > /sys/class/gpio/gpio557/direction
echo 1 > /sys/class/gpio/gpio556/value
echo 1 > /sys/class/gpio/gpio557/value

ip link set can0 down
ip link set can1 down
ip link set can0 up type can bitrate 1000000 dbitrate 4000000 fd on restart-ms 100
ip link set can1 up type can bitrate 1000000 dbitrate 4000000 fd on restart-ms 100

Set the switches SW_GPIO8_CAN0_STB and SW_GPIO9_CAN1_STB to STANDBY mode

candump can0 &
cansend can1 123#1122334455667788

This will trigger BUS-OFF as CAN is in STANDBY mode

Then, Set the switches SW_GPIO8_CAN0_STB and  SW_GPIO9_CAN1_STB to
NORMAL mode, the messages started receiving after bus-off errors.

With BOM=0, after bus recovery, Bus-Off recovery interrupt is triggered
by CAN-FD IP.

Biju Das (3):
  dt-bindings: can: renesas,rcar-canfd: Document
    renesas,bus-off-recovery-mode property
  can: rcar_canfd: Add support for Bus-Off recovery mode selection
  can: rcar_canfd: Handle Bus-Off recovery interrupt

 .../bindings/net/can/renesas,rcar-canfd.yaml  | 11 ++++++++++
 drivers/net/can/rcar/rcar_canfd.c             | 20 +++++++++++++------
 2 files changed, 25 insertions(+), 6 deletions(-)

-- 
2.43.0


