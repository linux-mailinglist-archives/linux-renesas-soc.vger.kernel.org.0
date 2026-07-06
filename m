Return-Path: <linux-renesas-soc+bounces-34768-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id R5PeGKrtS2pwdAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34768-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 06 Jul 2026 20:02:18 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D05C7143A6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 06 Jul 2026 20:02:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=H28pe6VE;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34768-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34768-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9632D3010CF0
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Jul 2026 17:51:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FE193D810F;
	Mon,  6 Jul 2026 17:51:50 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E37783B776A
	for <linux-renesas-soc@vger.kernel.org>; Mon,  6 Jul 2026 17:51:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783360310; cv=none; b=aE7GP/xuMHFecRyIjuziH+HzT6Ykr9KlDHKr9xP7jDo1Ch042Q5LzTztLgv9ZIYXnbNKdbMIcXnPeRIjL9r/CD3DKCos1uurgiNlNwSPTL2UgBaMdlsw7UHLPrACBjiKI3nN2wPhJNu+9UDpO03X+1x5aZU2JB6l9pvnqQd2Mzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783360310; c=relaxed/simple;
	bh=K89syd3g6tBclCMV6bI9+wkGYB7Ri8EqjsqIU7uC7FQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ASiHNOL6Lh8qSfD4puKMvfHAU22ibpRQ7x6QCxsBb45cxNMEGUommbxr+2Sjakl69yMbnleDbmGNmdaKf3YJ4Re/Be+nwmZ3aweXzjJq3sTTA6ZOE/Q2wRyaCFrVVJk0JjyyOEp7eQReAvPvii5df30RRei13RtqZFLezviP5vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H28pe6VE; arc=none smtp.client-ip=209.85.128.53
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-493c1950518so377535e9.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 06 Jul 2026 10:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783360307; x=1783965107; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lerme4TogeB5JN8nH5z+DAPP85cQrCMzcy5A3WRT738=;
        b=H28pe6VEgxuuFE5gLSk/NsuExJw2o8oGKG1HVC1IZEGH3fRb3QOoXk3eHlbB5fRDoA
         WKa54c8huZhTvaLOkdF4IkYsHQBfeE2VqanqrGe30HksG2wo3vx/HmgxvFGnXBJ8s5S9
         RtnWKBqSx/fV4ztcnFPGxzcLzELxr/oKt6XI+ePSxiTJUKoiNEQtPLuf1eO9bwZ3HJpx
         sViG+uR4hPGmY7zsMBIf5vzJulRM/C+/JP1hBw/2QDFbzLEdrJc2d8uVBDIAxGb8UD9c
         WDi845bJlbNgeHdsfQc/c1Tv7Qs+DfOruhydgaPL4PRzwaJXdOJk1SAp7kVIxoAWaSau
         LX+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783360307; x=1783965107;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lerme4TogeB5JN8nH5z+DAPP85cQrCMzcy5A3WRT738=;
        b=pXGvWotARxvIT3le6ZJwdO/1z+ZKZJ8KpCuuogWCYHqiUiMZ8s0hX3yrYQudfvo5iy
         H35BaaImFdjXTG3uOvbg8pmdvqZi4ysEX9/8s10FOQ1Lvj5c5MK3WC9+dxmQAN+OcVON
         P3s1fKPu3B3/hydM4v1NOtUeGpizZhmkz4qlHvOJNHGyyg44YqmAIz5eD3XQT5dLGARV
         YHPKuS1H2eOOZm8i92tpuVW8rUWBS2GfdI9ZmtH0WrjUkQxQd+yCloZ6yCKqiZb4OoB1
         cBpwG2C0tt3yLK0xkNDY8gkHEPryLXN0nJw34uUTi4CBYAQ5oGOQdUMPNu8VlX3vxazF
         nb/Q==
X-Forwarded-Encrypted: i=1; AHgh+RphmqnFYhPZqDS17ku5c/2siu2a7QibIyL4KtHed8hAiAzWkPbfyAijuXQ3RLru8xzU3aFBh6Lrheh5OqUzIctPMQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyfKv5YeQV2OLESAE9izjeL9EjhPiYVtPrbIJw0b4X1UI5Gdjrn
	QXLmbdviCqbDFFGU52Wx7Q5aAySYQxIBgG8tD5BnrVzZdLQXhd4/NKLy
X-Gm-Gg: AfdE7cmCaMXZ3fD3v0iZIIRJeB+NnzyP4EGv/5jdx+MABztzCt3be7dfqipRU1mgQB6
	/eI+Zd2g42FMkkdrBbnF5NSnv0m4Dm+mrp0TK3l41lsZnZwYzg8PC2gSLKo8LEy9yJJ3k5Ym9xI
	XVNeOorLvbjcw5isGbP7VAJTIbaHw3B5K9WRr4iGJTur5DOsQDGjDC5P/b/5Cm3ROkRZMWirn1J
	VPCGfVjC8i/j2ryLl1Qp8bUT8HtrNYilrwAJNqucLGY4QzdiotEgPE8+S620xLE9JKrHzrMcTqQ
	n3aMJmZYDdQzj0Miq3NzjruuJMpdLr+jaAYZD52vvtzR1A01AHSmYXbXLsL65anblj+WgZjh+iK
	9cUBEIg0tbihLsC5PNbe3RCXNqrt6jDAZP161zyxMk3z5CvmVaHkDTldr2WRWR5KV9biehb27KP
	p82Aa88z+yrpilVzhb6O55xYvNR9XtJxOlKZdyRVXhLqA0Utvzv/E4wUjAhampn11Y16b1nuldx
	hEiUOD11zv/6c6EF0kODv9EQMc=
X-Received: by 2002:a05:600c:811b:b0:490:af63:2cb1 with SMTP id 5b1f17b1804b1-493decbf15dmr20138875e9.7.1783360307120;
        Mon, 06 Jul 2026 10:51:47 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:8e02:886d:c345:c5e2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0078d49sm1263145e9.0.2026.07.06.10.51.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 10:51:46 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-rtc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 00/12] Add RTC support for Renesas RZ/T2H and RZ/N2H SoCs
Date: Mon,  6 Jul 2026 18:51:26 +0100
Message-ID: <20260706175138.12587-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34768-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:miquel.raynal@bootlin.com,m:alexandre.belloni@bootlin.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:wsa+renesas@sang-engineering.com,m:linux-rtc@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:prabhakar.csengg+renesas@gmail.com,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,m:wsa@sang-engineering.com,m:prabhakarcsengg@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[bootlin.com,kernel.org,glider.be,gmail.com,sang-engineering.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp,bp.renesas.com:mid,renesas.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5D05C7143A6

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi all,

This series adds support for the RTC IP found on the Renesas RZ/T2H and
RZ/N2H SoCs.

The RTC block is closely related to the RZ/N1 implementation and can
reuse the existing driver infrastructure when operating in SCMP mode,
which is required on these SoCs due to their 195.3 kHz RTC input clock.

While the RZ/T2H and RZ/N2H variants do not implement the RTCA0SUBU
register present on RZ/N1, this register is not accessed by the driver
in SCMP mode, allowing support to be added with minimal changes.

The RZ/T2H RTC variant also supports a 1 Hz output signal on the
RTCAT1HZ pin, controlled by the RTCA0CTL1[RTCA01HZE] bit. This bit is
marked as reserved in the RZ/N1 hardware manual, making RZ/T2H a
distinct RTC variant despite its overall compatibility with the RZ/N1
implementation.

Patches have been rebased on top of next-20260706.

v2->v3:
- Added new patch to fix weekday underflow when alarm crosses month
  boundary.
- Make use of devm_add_action_or_reset() to simplify driver teardown
  and remove the .remove() callback.

v1->v2:
- Dropped wakeup capability support patch.
- Dropped header sort patch as it was already fixed upstream.
- Updated commit message to drop reference about RTCA0TCR register.
- Added Acked-by and Reviewed-by tags.
- Updated Kconfig help text to keep it generic and not specific to
  RZ/N1 SoCs.
- Initialized rate variable to 32768 to avoid timeout_us of 0.
- Made use of RZN1_RTC_SUBU_RTCA0FX mask for SUBU register access
  instead of 0x3F.

v1: https://lore.kernel.org/all/20260615154805.1619693-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Cheers,
Prabhakar

Lad Prabhakar (12):
  dt-bindings: rtc: renesas,rzn1-rtc: Add RZ/T2H and RZ/N2H support
  rtc: rzn1: Handle EPROBE_DEFER for optional pps interrupt
  rtc: rzn1: fix weekday underflow when alarm crosses month boundary
  rtc: rzn1: Fix malformed MODULE_AUTHOR string
  rtc: Kconfig: Broaden RTC_DRV_RZN1 dependency to ARCH_RENESAS
  rtc: rzn1: Fix alarm range check truncation on 32-bit systems
  rtc: rzn1: Replace remove callback with devm_add_action_or_reset()
  rtc: rzn1: Dynamically calculate synchronization delay based on clock
    rate
  rtc: rzn1: Use temporary variable for struct device
  rtc: rzn1: Consistently use dev_err_probe()
  rtc: rzn1: use FIELD_PREP/FIELD_GET and GENMASK for register access
  rtc: rzn1: Add support for Renesas RZ/T2H and RZ/N2H SoCs

 .../bindings/rtc/renesas,rzn1-rtc.yaml        |  35 +++-
 drivers/rtc/Kconfig                           |   5 +-
 drivers/rtc/rtc-rzn1.c                        | 159 ++++++++++--------
 3 files changed, 116 insertions(+), 83 deletions(-)

-- 
2.54.0


