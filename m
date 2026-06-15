Return-Path: <linux-renesas-soc+bounces-34033-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cY+tGssOMGqHMgUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34033-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jun 2026 16:40:11 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 08ED0687431
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jun 2026 16:40:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=DJvUK64C;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34033-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34033-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2EFAF300514D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jun 2026 14:40:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 466703F88B8;
	Mon, 15 Jun 2026 14:40:04 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7D603F484A
	for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Jun 2026 14:40:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781534404; cv=none; b=PLRVk9uBAouf25hxGtwcNNl9/cbFgsHW6/YiUrjjVra6YCXE/wXiIgPb8WGXUA+JLoFxLKA9gI8lLf3tuMO/8kSQ6//sJiqxkF8dG6251dlYYIkWV8EsfPw420CCZbu4LYIL9L/Bw8oSbxntempzsLjqvOeAlkW3Epx3xLILEVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781534404; c=relaxed/simple;
	bh=JXBb/DENU8GdVa8lZmTQYk1UttH8sfz6FuqA1SD1a0U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hGHUKFKheRuUGsWPVQJIh3CVBz5IsjHNe6qxiZNTrDt/HhXDAtILzxRcFPgbbD+l+fo9AH4YzDGY7yqPiO9bSdDkpRqt81366KKPdag5jRgHNsed9bmx2R76Jgzx4QdYn68uS6X2/UWMP97WzDodBRDXVTTV6HyRUBhoR4At4o4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DJvUK64C; arc=none smtp.client-ip=209.85.128.47
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-490b4a8e28bso24291615e9.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Jun 2026 07:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781534401; x=1782139201; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NgHUqEX4YwadNzzP4twhRjf8gxLZ7z91CpvZQHdgg4A=;
        b=DJvUK64Cl1g1OFjWsh9HOh5rN4q/FD73LFc5436a9jsEEg6Nrs+z7SOopKVFBS5JP2
         nszbIbKUPdUuFm0VMNhcbEiXmeyEoGEasdtGyVVeeScsI/pAQEBBH/wqYX8nf8XmzgV7
         riv+vyBs/OeTl+AP/1bj9sPbwAeJxvm6qt/jEy40/ssm/uyW/3L+LtfVz8mZg/YDyey4
         SbsORcu722XjbkzhXS3ZATFqeVTPstcDzEF66Z4On9Z+ymrjhiF4qr/rndzEPyhMKnVH
         z+Obfwsdve13hzKnl2E0kf4P93gK1k+soNEnmsyBNXG9s+Vme/MTWOP0fJfJR2yZB7O0
         almg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781534401; x=1782139201;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NgHUqEX4YwadNzzP4twhRjf8gxLZ7z91CpvZQHdgg4A=;
        b=Al8hHoHP5xSM++BhG7o6FwnSukKvUVWfXkPvuGgmCEOpLsZQgIP4k2xhp1Cw6vY9Vz
         GN4uGVCZWiRboRw1eB8e7Y9x4hyAuukqaszrsdcz0bH+bpfQOFB5tL4FkD9DqWuGpovQ
         AxjY7BI2AExBkxVVrc7ZI5YbnS4zFm49INgoGLxqyGCuQ6xR00udY86Bl+7DrB+vfRxH
         VvmH1S/7t1Ed3lwNlXpmywa3T6XSaP1dxhKPuZMes0+ivfb7SXYRZu/lnIW7mVxRQnDY
         a/ox9UJMTEN2Zmqlx8+xVUBVSHfkYI4zSbZEeKHQhURk7KBwNp/qMH5bogJx4eQ8jPP5
         FQMA==
X-Forwarded-Encrypted: i=1; AFNElJ/afqIVt6JTX1Cs6tAgB0/3SW2B4z1KPgzsbeOHZAzQTUf7gjSQ7jdebPD774VWXmJtzjud2YlCjKrC2k/Oou2RBA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzHS9s9MAFMo30duyy6kDLDiJdpNTBOBXS2bCl5NXp4RueRW7dj
	w4et80Y0SgL0f6dOGXyomsNmM5rFfY2x4VcnO7qxlp9+7lQfE4rb1IkX
X-Gm-Gg: Acq92OG/LsukL7uDs7eA1U80b25c+o9dZtDcjN9Z2onj2eJ+sEYNo3vtr9qjK114O+D
	9LDyUGLsfoKjrmG71ewFIwldh13LH5tkVm8e0HJGZ+t+wg3slFownU8Dx2dbLSwP3ucK5kQa6bs
	S2nqKAOqeEBJBkvRgRonbV4uz6NvTz++PPG37aBS3skcsGhkOpiWgod2lsyBIsBBcmQLY2rRBn3
	9l43M23ooA2QSms85hqePR4wo8W37YquvyVEb6Tg8+4XWD9lcJBk7S9SojQJwvLa/4oSeGf00tR
	PssFKfpaDwU3jNcKygpf9V6RzGSI6loA5FRIhA/IE23UfC7/fKkZS79Q12usHgR5FolMPgFAHYc
	BSB6XgqU8PAeLCAjIyqL9LsJBZfyQtA+eazskVsTFo0P5KBnsVnamNsT+bRWKaJbmmm6v63OVhX
	+mskM1HuQZdv4mbG64hsuYTWNm1Zut9RnZyHAfBeib0baLpJrzAufHe51qolJEcScHeyv45qtA7
	23dnDxXImSqGVcNxZdVv1EZa76hJhlp+XnI
X-Received: by 2002:a05:600c:214b:b0:490:bd1d:472a with SMTP id 5b1f17b1804b1-490ec4d7879mr140056475e9.15.1781534400816;
        Mon, 15 Jun 2026 07:40:00 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:1e4:992f:3ad2:4f2b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492203c05ebsm256627915e9.9.2026.06.15.07.39.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 07:39:59 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/2] Add RTC clocks for R9A09G077/87
Date: Mon, 15 Jun 2026 15:39:41 +0100
Message-ID: <20260615143943.1610095-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34033-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:geert+renesas@glider.be,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:magnus.damm@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:prabhakar.csengg@gmail.com,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:geert@glider.be,m:krzk@kernel.org,m:conor@kernel.org,m:magnusdamm@gmail.com,m:prabhakarcsengg@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[glider.be,baylibre.com,kernel.org,redhat.com,gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
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
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 08ED0687431

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi all,

This patch series adds RTC clocks for R9A09G077/87 SoCs. The first patch
adds the PCLKRTC clock ID to the device tree bindings, and the second
patch adds the RTC clocks to the Renesas R9A09G077 clock driver.

Note this patch series applies on top of the patch series "Add PLL3 and
LCDC_CLKD support for RZ/T2H and RZ/N2H" [0].

[0] https://lore.kernel.org/all/20260615104845.4122868-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Cheers,
Prabhakar

Lad Prabhakar (2):
  dt-bindings: clock: renesas,r9a09g077/87: Add PCLKRTC clock ID
  clk: renesas: r9a09g077: Add RTC clocks

 drivers/clk/renesas/r9a09g077-cpg.c                    | 4 +++-
 include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h | 1 +
 include/dt-bindings/clock/renesas,r9a09g087-cpg-mssr.h | 1 +
 3 files changed, 5 insertions(+), 1 deletion(-)

-- 
2.54.0


