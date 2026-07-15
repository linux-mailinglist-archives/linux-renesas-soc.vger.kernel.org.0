Return-Path: <linux-renesas-soc+bounces-35259-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FJkcG+KOV2rGWwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-35259-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jul 2026 15:45:06 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CB9B175ED5F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jul 2026 15:45:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=WUG24UOw;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-35259-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-35259-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E28D030D6937
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jul 2026 13:39:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 492E32EBBB9;
	Wed, 15 Jul 2026 13:39:32 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 409B62EEE94
	for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Jul 2026 13:39:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784122772; cv=none; b=ROZ6Wh29jOHE6JzjUl6XXZVgK8nQjmA+OvsqkRjYJAQcQhnhvNQdbQnzsv9j4s4y6UOkr7qkH8RuJNUUPJxqbaNOb1s8qM0qBj1hS+c5k+jww6xB9E9+xkyQtkseK3wCuFrHzB3st3mcRLKF4u5trWajjyqM7znu1AHT14qx+7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784122772; c=relaxed/simple;
	bh=0mTF0HeekyGGYC4JPA4QUcc5bVo9wdGVAb6Ff+VtFAs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=q2NPFTR6wGsKJbp23ZVCunV4bggVZGxDqkHMIIUKBtAdlihCEuSWk6hi/R+YMhTVRZ1JOxrLWNhRSf4qF957M3w9vnzHxE52o61Mn1jTik+Ma7LboscDbUROCmAj8HcdSd/V3NBo5g3wYQmkWG15rQIJGP7LrS5XHJ3pxQay5+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WUG24UOw; arc=none smtp.client-ip=209.85.128.52
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-493ece78b0cso38663535e9.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Jul 2026 06:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784122768; x=1784727568; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8db6f/b29rlspzEm6qOKfHn59Vtz9L/QmnkbFCJSt8s=;
        b=WUG24UOwdsSvjeTuwyTiXR6zojEB9QyY36JtnL4dvrhHCKRawmRfrcI7CvuJ7Qxf1a
         9PX2C4zn9JBjOXnrBj+GidXwF3wsHIif3ygu5zPbkDE1oms2n+wVzvUHYU5+wm1AkjVe
         T4+3FP9fJghKgRpluoRHYimFeGUQjLm+2s7Zp3/0B37Qi9T5CdS1/0K0HEyyqIBJAcCl
         /gHOrrDOS2A8yJwts9iFySqP45gDtCT8HSEuiAEL8Z5285BwFFPU9tCPtXlGOiASPJXU
         jG7fnSRXJzeTFL+u1De2ao8xdVxxdUDzRSCrec6fyjimOwocjipcnqmh5tL+EIskwdSn
         aPuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784122768; x=1784727568;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8db6f/b29rlspzEm6qOKfHn59Vtz9L/QmnkbFCJSt8s=;
        b=TQaMKZeCpigxxqXZngEgoX12+OopQQSWJh4GX+6eDIt6aYgk1gvCSXAuITTFn5mL21
         Ot7Af2MYBre9ME9Qq+9ViqrpfB7Vc2jptjMWDbor+qFb8jR2tQvywLYHWUbBdDhe82/u
         9Nfl+atuV2fIk4g5gxXFfKdCCcXIB9nv1//+QY6VMlLaTHN21TlpOJEiozZ7+xxGdj53
         mnSDMbQTesRw/SWTziE9vPghWhqO0mDiTEVolSD3AY5TvYwAYKrpLnpFmwpn7B30qt6e
         J/WC39FQMZAonjOmJiacLgOA3LG4Cx3NLCO751MeRLH1Q7lCvQXPG+dAnE+TzoPfFd3Z
         NNCQ==
X-Forwarded-Encrypted: i=1; AHgh+RpiOXbNsu6xF+XhZjdrjfTACuZyJB2f+1We5ZQwnsut2tLVkMykA+NA03oR9vbThwXkQbauLWamlWNntqgv+Ei4SQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwddSnqFyXXj/R4QsF/v06lxngMlWYxo1G/ZdumDIGNBujp5Izm
	niGe/M/9DZcVOfaMamYI/WSmnQcdaTz3yPDUUVtzxcLltW4DgJ7HnJ4S
X-Gm-Gg: AfdE7cnl3gZwWgfSeI8awQr5vYb9gYzivHPCsFvu1Stu/oGHlgm16cY+AQERERIJF8S
	g3w7yiTalodge+wKmOdgq61QaKkB3Is6dvcvaFK7m3ujqk3VLRAgc4bA5vqP5RFVtk8eiq4TA4k
	eKwKiCR+HwDXBTO+h+ujylF1UwI8k6Vho3C//gxTCpfIdtmnQR4Xl1WbJ+PsjUmPZNL9E7biot2
	et9QdZYmyYhrBPclEdtObM0ifkwa0ahYH0LKav+9WkMV2zmuV8IGUT5XPPulmxNb9sS3XL/ifMX
	KUgxKo95fZiszW/9/gNCUyVmrIfXlWcvGPqdroggUDnF+aV3ijfDa9YzO7TQWKXCrUCATybxBCt
	Fpzm4NrSfAN81NpRrs4qKc+/TC2cbPAIhSxQPepyql+XSAgOJ2GJ0l6o04AXMCXtOzhhr6RmkVf
	mx8/swXTJbikpgJDk3IYGF1qfXSbzDJBR7CKJZIbm5JvVjJkJarTCdLjMU0H46dRr22aJkUvTQu
	csiUUtwc70MrWTLFFXImEnP3ZQ=
X-Received: by 2002:a05:600c:c87:b0:493:fd5b:2d5c with SMTP id 5b1f17b1804b1-49515904a8dmr86490105e9.22.1784122767750;
        Wed, 15 Jul 2026 06:39:27 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:6d4f:b160:7aea:9d1b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4953b35105esm79420195e9.9.2026.07.15.06.39.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 06:39:27 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-watchdog@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 0/2] watchdog: rzv2h: Convert WDTDCR handling to regmap
Date: Wed, 15 Jul 2026 14:39:20 +0100
Message-ID: <20260715133922.2129340-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
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
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-35259-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux@roeck-us.net,m:wim@linux-watchdog.org,m:p.zabel@pengutronix.de,m:geert+renesas@glider.be,m:linux-watchdog@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:prabhakar.csengg+renesas@gmail.com,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:geert@glider.be,m:prabhakarcsengg@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,bp.renesas.com:mid,renesas.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CB9B175ED5F
X-Rspamd-Action: no action

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi All,

This patch series converts the WDTDCR register access from raw
readl/writel variants over to the regmap framework using
devm_regmap_init_mmio(). This conversion serves as a preparatory
refactoring step. It allows the driver to subsequently support
syscon-based system controllers natively by passing along alternative
regmap handles without forcing messy architectural branching at runtime.

Note,
 - This change was suggested [0]
   [0] https://lore.kernel.org/all/c3ef312a-4c26-498c-90c8-118c6dc035a0@roeck-us.net/ 
- Patches are rebased on top of next-20260714

v1->v2:
 - Dropped patch #1 from v1 series.
 - Switched to use regmap_set/clear_bits()

v1: https://lore.kernel.org/all/20260702160457.1884345-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Cheers,
Prabhakar

Lad Prabhakar (2):
  watchdog: rzv2h: Convert WDTDCR handling to regmap
  watchdog: rzv2h: Drop WDTRCR_RSTIRQS macro

 drivers/watchdog/rzv2h_wdt.c | 77 +++++++++++++++++++++++++-----------
 1 file changed, 54 insertions(+), 23 deletions(-)

-- 
2.54.0


