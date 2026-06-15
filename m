Return-Path: <linux-renesas-soc+bounces-34041-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cMUFBxwfMGrKOAUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34041-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jun 2026 17:49:48 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3520E687E26
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jun 2026 17:49:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=qRhQtzFL;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34041-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34041-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 88E30301020E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jun 2026 15:48:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AFBE40758F;
	Mon, 15 Jun 2026 15:48:28 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D611B407593
	for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Jun 2026 15:48:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781538508; cv=none; b=sw1guoOPR/kuw38bZtwDDjm0eLX75OniPTB7Qdcrak8DDgQ9j7asmb6jd5O4Cq4bNLP9iG/e4z3Q5ps3ZbaM2jrSGTWXKmdOiORI1Zgs1no8rUj9kk7OfIfpq+qVaC7DITx/lE2pCK72Xy1K2lvD8LvB0jxZcOGMsnDOdvD23pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781538508; c=relaxed/simple;
	bh=CiDfEf26POXCK6sG7bX8RsZVbR23ICwwiGimYQovRxM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mGN3CJEu5tRlEfqn1SmHXd+4fHR4GIRe18YugmceVhZ5j8pkYiWJcKZlqTgkRoM+yWaK3fYnNn3Ca8sNf0jIPjNeuAF1uG9DEAjEkcHXiPS0oh8ugMBuNKN8wZSETHTv4oK0Natbd+h3dyxe270P9adynDzBpcmWVDqwqlDzgAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qRhQtzFL; arc=none smtp.client-ip=209.85.128.46
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-490b211ee6aso26268885e9.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Jun 2026 08:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781538503; x=1782143303; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C3xnMJuXedyX5T3l32zr6oLIOA7EY/mLz+x92qm9VdE=;
        b=qRhQtzFLLgd+BfIxcPNvMKLplR4bfYk2iF0HFq9yHlFFfjLZMulTtIIJ1C9FWSHbxd
         9N6gXdMuuxfe6hV/QpTOBnLn/oeOQQkusM8EYloTSkISf+qGrZ5XorIiwC++mO5T5Mu3
         KCKTskt7D6mLpumwiPk3AQHGjWHGdHTprOgxkV8N/9LSiWEyLamO/Vf+yHVmU5+VRWP9
         PX15YLap8xCHEFXemcnEghG0zQf36gJnpgdH6chvOb6xEr9tK6b10FblMWP4I4R4lXmQ
         iQCD7CwifFmQiAWTLrjml1EYp0cvsyRI4q2bBMduepJiYlLrxH2RaIcWvxn4rJelDBp2
         66Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781538503; x=1782143303;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=C3xnMJuXedyX5T3l32zr6oLIOA7EY/mLz+x92qm9VdE=;
        b=NUyjg9SoXPvQDBlZH64nRWEMiuHwlYIParqJT1Nr0m/iCN84+kxaCJ6ITS/bLLu7nk
         ml/qmgfNdVgluQS9KGLeRC6YxpQ2K1Sdvr/okj5yfncLn6BfXs4mk50rwBei7QBPk44C
         95DtK65lYri8V6SLQGpaLn7fOxF2bd7KxAm+mACihEdBpWVq1ufDn0CQ96lYqFVizHvN
         ryvCvxl+8eB7miKP0JupLQawu5hDH9+/Rg80u106GGOf0C/gqgjRDqxnxkkpDq0KT+KK
         awoZ7mEvOqdJI0h/DGNuF3/q5A9x0Cb7/lqRTk+E8g6xvgPHQq05AI1e6ZXoP5oYxVC4
         ZaYA==
X-Forwarded-Encrypted: i=1; AFNElJ/iLyfDJ4fZ3CKdmC5INOYJ9CYatzCq5/bV0jzWWh/JS22E42JAc9n/XnNykFNXx6gjUB7waYxsdAlT3fdaakPe8g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyOnSvz/GeJusCzxnSkLXDOJObPz3iuP0eU5rcHZ1TrpJoz1qP1
	h80sY1hZpYCRMyi6EXZ6VpXF279bXv7sdHEOb4TbbwlrCZrKPGrd9h27
X-Gm-Gg: Acq92OEJQjBwM6p5g1py8suBU0tikAa0B7P5UHZi94CgM5MtsSigZ5Lpefgsz6FrD1X
	j1rdSHxXzC/ie8j7txLLo76dv7/zdfnV30wwOdgmkeneYNY/nJVare+V8rfOBVicn6yK1rQGG8n
	1f1mnzMdNQJG3Sm74ewgjK8mFrvOyZpbUiYC0nTVJ7itE1s8wbVKN7lctvix5lh+/rNcP/vD7Uq
	qkmDNJ3M9RxD1woYffNEvw+nqmLbvBr0K9wVSz8cGCkhC2XKP4iHHAUmZnL+7Y1GMEOGDki6ZdE
	imNpRM45wMQ++3dDm9MzvNUf8DlbPtX513nO3EPeQI6VYPHdKOeoq7XaxdKR2/UyCzhJWs6ncAP
	scDgqTTCWnpDrQgCwnZ5EufD7c1rFfeatjO7cq8RwtOnZeVs6SA+pfVnvGLnI55xqm+OmZB4IOW
	+dU0EvJVca7p8s3sHCvhPYChFZjjY7kMtUT0/W65yIy91lv7ax8fZgF512MdO6zKPSNb13RLEz2
	8ymPDdSWFm95s95PPmgA6DeKB3oRxWTQcto
X-Received: by 2002:a05:600c:820c:b0:490:958c:46dc with SMTP id 5b1f17b1804b1-490ec4e75d9mr194107115e9.17.1781538503048;
        Mon, 15 Jun 2026 08:48:23 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:1e4:992f:3ad2:4f2b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f26434dsm36010995f8f.1.2026.06.15.08.48.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 08:48:22 -0700 (PDT)
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
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 04/12] rtc: Kconfig: Broaden RTC_DRV_RZN1 dependency to ARCH_RENESAS
Date: Mon, 15 Jun 2026 16:47:57 +0100
Message-ID: <20260615154805.1619693-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260615154805.1619693-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260615154805.1619693-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34041-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:miquel.raynal@bootlin.com,m:alexandre.belloni@bootlin.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:wsa+renesas@sang-engineering.com,m:linux-rtc@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:prabhakar.csengg@gmail.com,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,m:wsa@sang-engineering.com,m:prabhakarcsengg@gmail.com,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,bp.renesas.com:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,renesas.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3520E687E26

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Replace the ARCH_RZN1 dependency with ARCH_RENESAS for the RTC_DRV_RZN1
config option to make the driver available across both ARM32 and ARM64
Renesas architectures.

The newer RZ/T2H and RZ/N2H ARM64 SoCs integrate a closely related variant
of the RTC IP block found on the RZ/N1 SoCs. Update the build dependency
and expand the Kconfig help text to allow this driver to be selected for
these additional platforms.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/rtc/Kconfig | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 364afc73f8ab..764f8b9ff742 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -1635,10 +1635,11 @@ config RTC_DRV_RS5C313
 
 config RTC_DRV_RZN1
 	tristate "Renesas RZ/N1 RTC"
-	depends on ARCH_RZN1 || COMPILE_TEST
+	depends on ARCH_RENESAS || COMPILE_TEST
 	depends on OF && HAS_IOMEM
 	help
-	  If you say yes here you get support for the Renesas RZ/N1 RTC.
+	  If you say yes here you get support for the RTC found on Renesas RZ/N1,
+	  RZ/N2H, and RZ/T2H SoCs.
 
 config RTC_DRV_GENERIC
 	tristate "Generic RTC support"
-- 
2.54.0


