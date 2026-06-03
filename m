Return-Path: <linux-renesas-soc+bounces-33538-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HlP6D4w9IGpZzAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33538-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 03 Jun 2026 16:43:24 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D557638B8B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 03 Jun 2026 16:43:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=QYKGB0pY;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33538-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33538-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BDF1F3031A1F
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Jun 2026 14:33:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFB3D33F8D4;
	Wed,  3 Jun 2026 14:33:45 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C35D339719
	for <linux-renesas-soc@vger.kernel.org>; Wed,  3 Jun 2026 14:33:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780497225; cv=none; b=SUK6cJ+HOpGwjZS5QaCPbf7wIwai+AVbZHEeglVfe8kcn1X1tlbVwiOzt0CxzfO+bh7xiKtKs8CDdWxqIIiAck95d6YjxSs9r+uN9VAIrLlYdBOVye9GGSDl23Z2DV1I7oDx4/qVqnyoJEjH0fVjQJC42KwVzvFAE1mPm8lSLYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780497225; c=relaxed/simple;
	bh=nvrltdpc60saNI7UcS08/7LPNY7tUi4OaUtWoXm2MHI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ao4cu27m07keS/mKk1kYiH4lyvaZVFfDXLB109T9RvK3SHxNNTlzZHL4P+zmx/iyyufna8FznNmx/IJxZsndySb+E7VaaL716T5VkoBb0EWLRm17Ku/Y5JiQeLP4pljac8IIiyKQ4i0X8jjX0hjvBuYndtJWoj2ygjRfv21VvMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QYKGB0pY; arc=none smtp.client-ip=209.85.128.53
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-490b1bbcf3aso19092685e9.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 03 Jun 2026 07:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780497223; x=1781102023; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XHnyZnS+fqlQALxl3qFob5dnW2yNrlaDTB0OvsnizSk=;
        b=QYKGB0pYnP/RyBr16ytWBAzcc5eZpwnE5MIXgTn92vkZMnaE8hjT/1oKT7dsMY+DGO
         BNY8WBdid0m4OKIiqhf1DQne/H4mbRPocIM9EjGpk4LKz3dxhAv+FbnPI8aFfEwZ62uX
         rZbKHjgesIUVE0qQxgenFzRWAk3eqUB1wkmToCbvGQL8faoPI/SJaGDp12hiZeyttrNb
         s7vF2ShmGZBp2BtdN88Q9UjbCNYIYwJ/6132XFULlrjd6ITmePuqMR7i0dXBVPyiFBXr
         60AziPbpHpdz54tdNG7moKivHUEF7KylTWy03u2d9rvy/bvHEIanm59lqWUsJRjk2LAt
         FxGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780497223; x=1781102023;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XHnyZnS+fqlQALxl3qFob5dnW2yNrlaDTB0OvsnizSk=;
        b=aGjZRDq8voX5kMsYjHNYPve7FgJZoNjlXGT/xRgcu22i3YVdaZiC5oStYcSYeEv6+c
         mZ1RKONa8HbQRlah5D8wjwWxZ5etu3j56i9hhNYGLY4n7QumidqGByJuQO+YOU+67iDd
         AY8XBrzL17ytxUzA+ypYyh3gCfAeUuTZApXERB3rFQIdCaYij2bmeJV7xZmVNhi6Q74/
         s633KheH510WYDFSLt6rnDfNy9wgo2AuDRDF4yzXtqUPNPC2x5bf2cq7kbz5WeiQKGuM
         HjB3E49R6BWO2w4J6x6oobsf5/WUnZVFNE9FQX5g1CKQJeZ+YdDgWCTkAQeqw2YvmCuA
         wc8w==
X-Forwarded-Encrypted: i=1; AFNElJ/IQt8oZJ2SlDBZaNcdUWN6RYnqpk6LllBAXdCo0ljkliMSNtVyjD0DHIMc+g/9OKqYcQ5M1m9mMp/UQux7tiJ2iA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxJ6wQKcUL8AKrUXo8NG430RnACboZzgGuaUMnvDbriQZdkhkYl
	+m0gwYU0bYIH1vFolYwknCsbRT6gNmYNnPyiVB5izjyxj2SCmWlVPHL6
X-Gm-Gg: Acq92OHOl2Afp62irJXqiIhk0PBTcXBUSNrf9hJrAjn2hHi7+gNmD2Xau4SSybDcEse
	T7Uc4Ldu7HQmQWiaIfrtvR/taq3Nqei4RCsIF+z7H6rXWdVXvL7K9Cy9dpuXQS+pb6Pfu3tFjrc
	mwLYGn9w8zvuBqXxL1P1saEogq6DhYC37AZ65jh+Hb3wquJi4QxQSaIdzXWDwWXcX5VkWAp0ICJ
	XV/HlvbvXyVDdMrc8HSC7S4gpffZzSbrE2Mt8IffPP1OMETEwJIn41dcM7YYisXWZD9C0jqX2zE
	z++/wBc4BNj1xwgyGwyaz+wsFqLONScFKZwndV2to5vZTOc+3FG8VmJoI8KpNGcauD2aOf1gZqL
	TvhgloCMQwnBwGkCbsWKFf+dREP/dfY6jwnYAnPFinqnBBzSJrN4Z9NVDqD/74sJA/x+EhoEq3f
	rJ/mG+3WVOiKKogM/SC+bJbE7u8tvrq0afr9+1/f1w7dAa8mnCnVcUn9G6t4g=
X-Received: by 2002:a05:600c:8b23:b0:490:b115:e03f with SMTP id 5b1f17b1804b1-490b5e893admr60436345e9.8.1780497222723;
        Wed, 03 Jun 2026 07:33:42 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a700:7301:179c:89ab:19f6:9ba4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b0e823f7sm160147395e9.13.2026.06.03.07.33.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 07:33:42 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 0/2] Subject: [PATCH 0/2] arm64: dts: renesas: RZ/G3E DTS fixes and updates
Date: Wed,  3 Jun 2026 15:33:34 +0100
Message-ID: <20260603143340.162457-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
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
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33538-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	FORGED_SENDER(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:biju.das.jz@bp.renesas.com,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:biju.das.au@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:bijudasau@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[glider.be,gmail.com,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,renesas.com:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4D557638B8B

From: Biju Das <biju.das.jz@bp.renesas.com>

This series contains two DTS fixes/updates for the R9A09G047 SoC.

Patch 1 drops the unnecessary SW_SER0_PMOD condition for rsci4 on the
R9A09G047E57 SMARC board, as rsci4 is available regardless of whether
it is routed to the PMOD or M.2 connector.

Patch 2 adds the max-frequency property of 200MHz to the sdhi0, sdhi1,
and sdhi2 MMC controllers in the R9A09G047 SoC DTSI.

Biju Das (2):
  arm64: dts: renesas: r9a09g047e57-smarc: Drop SW_SER0_PMOD condition
    for rsci4
  arm64: dts: renesas: r9a09g047: Add max-frequency for SDHI controllers

 arch/arm64/boot/dts/renesas/r9a09g047.dtsi         | 3 +++
 arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts | 2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)

-- 
2.43.0


