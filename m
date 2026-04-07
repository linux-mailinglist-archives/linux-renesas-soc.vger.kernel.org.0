Return-Path: <linux-renesas-soc+bounces-30937-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ODAgLEwd1Wnr0wcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30937-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 07 Apr 2026 17:05:48 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 106F13B0A11
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 07 Apr 2026 17:05:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EA6FA301E20D
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Apr 2026 14:58:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59E142BEC45;
	Tue,  7 Apr 2026 14:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AcGu+MWK"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C57C733CEA5
	for <linux-renesas-soc@vger.kernel.org>; Tue,  7 Apr 2026 14:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775573880; cv=none; b=AbL4MJNXqA2rW5Y9f5eOX5EHnxh89PazES9RoPo9+HpQWd2CLMOQ0ADx1I1E3Z4oQxCyJyeNPlSFEFj5pf9eEw8AK+7hTi9nSbx4zHfWnD6n0F2NZmaPzRP7uHm/oCJ0UIsoykIjUfdkIHBHczoo2BYKqo4XO9JzAn1OtWkxmEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775573880; c=relaxed/simple;
	bh=cyqmsmFaUhWO0usCsRhXLb1p8EfZ2EfkZtfAQtdHSG0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FMcV8hEyoCxsE/4lqNvK5+BtHVma7jw35vbCQMchUnRTsP6oaGZxF8MK96ocWS20ciicerpMAO/f8Yxwr24bunPJzZXt+sEm2CcmbsvBFYO0sGLUbluZs/syo8kqJZHRZDGKfmp+YLnqXl33vBew8iN1ARhMDhdIp0S6tGNq4z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AcGu+MWK; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-43d01d6b50cso4871238f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 07 Apr 2026 07:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775573877; x=1776178677; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2khtJu6y4LBtKzkynEVHeXEXsp2G3dQZozt2yDEDQ5I=;
        b=AcGu+MWKaxBlR9OCuaRg/7FY7dedBby8JeBdw3lXPsl+7J9IQeRFcI96xzHyd3rbOX
         Sp+Pp7Evcke/1ZnhMNLq1M8hAe6jD9GZb0N7uqHadPus/OspDp4N/Vj3Lsl7famsIb8q
         tln/3snA0MZJVlTfzmYD33emyfNcZayHPSVrLHhywnNGFOgkB0pZOSoUHzNtdWiau+iX
         s6KIapwhGmoJ387YqVtSmoY9PuhBp49gmdTBZQ60PWS/zN09gXYLySbmHmqLmxJLQ8E3
         ZOX/38psK82LqIUX+JPUDocBMNY5ESGhIbjmkEbL6AUA0qaneI70yFhjUJI6zmD8O6mp
         89vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775573877; x=1776178677;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2khtJu6y4LBtKzkynEVHeXEXsp2G3dQZozt2yDEDQ5I=;
        b=LEOnyHQpr4fzEr5gRrYrOpOnKlGJ/DnUSgHEGDV6xMhmbBfrTv3oP2K9iIZ74OkZoP
         uNag3cZXPa6aT0z3MMA71MBqz/igJJX6gvbt/XjKI+4V8BoofVa2+gGi67mDDKANPsAq
         2YljhQsqR31y2qgKXWl1lQLVpZvFsg9BJBTA1cwL/77/9iMN31lh5xNXRGL+SSYXkbmK
         S8FkbaZFmDSpYfR5ZO0ozp4bnLrmoQmL7tNQrGxpD+C/qwMm4C8AcC6aY6Sfu+52kv/a
         idnnAnVb2ddTj2c5KQ5hx7ZkZTBmetsZVLuVLGZ9Z4lQs9VxnqMFlxRjMH8sPRUF15zA
         VgcQ==
X-Forwarded-Encrypted: i=1; AJvYcCVyFtRRrh6a8KHe/ykZTdEQTs18kz1QNVCXdO1mk8Og41Z/qR+8ug3Ey7kUudXwpP5oG9Oz2nSwMfRqQ5mrH/d59w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwA9MyeT3z3Q7pv/kUB3+FeQ5IWLt29EGWLUO3P9vekKptnqikV
	dwa0h1jPBjYT1p+c23CyWIklt1L99BOpgcZRQJbozR6INUZXSmK/ixD6
X-Gm-Gg: AeBDietgCq0TUHd6Rabc2HuTYOO4cmAAKbXcpqJNpTsEcB0uBKA70KrkbHYpXvzAxJL
	QrqlTTEWfWmljrk2+6E5d+qibV1UtPqtghf4oWouevkDknz/eGMaq1yga8X7/gWNgeGb6vQ75W6
	h04I1FlSyF5S4eiGOjsadOeMR7aaRyOPW7kpcXGUY5+Oal8UPUQXN8yCF7Uh/c+mPkQG6kWf7Pr
	QBYuwmUWyVrKopWzHZ5X0nsrAXpD8IxdW0xdx2fO9SQOgbNGSJb3v8YAwhiImyjQnjaMCcJQG2B
	I1Q6XGbbBPh+Hu0j3+TKLiky/dE2Q+ookdiqksKbz/isSu97ieSRrfg34ryCsZ4EsALpV7nMt1Y
	qXWT6if1IXpds5EwXoVEEw3I0gvRjIcXLCoiURvl49V1gqg0YCHMsQnxImlVdfqsPKk9ZUnKWtE
	wwFdfj58bm0+EzoHiBXwEq2fpMw3eDwvxrf1dNe4JHUP1gQWeV
X-Received: by 2002:a05:6000:401f:b0:43d:2be:e4e with SMTP id ffacd0b85a97d-43d292ff520mr25307993f8f.46.1775573876941;
        Tue, 07 Apr 2026 07:57:56 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:3f9a:11a8:20c3:fe58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2c5253sm45207018f8f.9.2026.04.07.07.57.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 07:57:56 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-spi@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v3 0/2] Add Renesas RZ/G3L RSPI support
Date: Tue,  7 Apr 2026 15:57:49 +0100
Message-ID: <20260407145753.101840-1-biju.das.jz@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30937-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[renesas.com,kernel.org,glider.be,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bp.renesas.com:mid,renesas.com:email]
X-Rspamd-Queue-Id: 106F13B0A11
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

This patch series adds binding and driver support for RSPI IP found on the
RZ/G3L SoC. The RSPI is compatible with RZ/V2H RSPI, but has 2 clocks
compared to 3 on RZ/V2H.

v2->v3:
 * Added ordered DMA names for the dma-names property.
 * Dropped the tag from bindings as there is a change related to dma-names
   property.
v1->v2:
 * Rebased to next
 * Collected tags

Biju Das (2):
  dt-bindings: spi: renesas,rzv2h-rspi: Document RZ/G3L SoC
  spi: rzv2h-rspi: Add support for RZ/G3L (R9A08G046)

 .../bindings/spi/renesas,rzv2h-rspi.yaml      | 28 +++++++++++++++++++
 drivers/spi/spi-rzv2h-rspi.c                  |  8 ++++++
 2 files changed, 36 insertions(+)

-- 
2.43.0


