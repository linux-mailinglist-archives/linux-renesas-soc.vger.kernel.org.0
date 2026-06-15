Return-Path: <linux-renesas-soc+bounces-34012-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id A5gQKlHpL2qpIwUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34012-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jun 2026 14:00:17 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 011E6685EB1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jun 2026 14:00:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=ekkZjYzB;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34012-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34012-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8211230F56C7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jun 2026 11:55:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37DF13E558A;
	Mon, 15 Jun 2026 11:55:04 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EE4B3E51CB
	for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Jun 2026 11:55:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781524504; cv=none; b=pz1bQM/vfvQFz8epckTnmJBPctNweUSBBzs15ZOwJgXiUyKQObxIUgbOCTL2rTMwhidojiilRA8lIssJ0PNDpkPWmU8D9jYufap75omylXciQBxHaB4Ij7NOBXfni/y0Zx+b+fl1RATaK7o1ShE9gqNL+9nkvT7cbfcGbsYxxkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781524504; c=relaxed/simple;
	bh=8LT7af1gvzlV2+WXjAvarECgjW4NHzj9sQOqC8g5KNc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UR++Tepb+AjlpeI/ynY6vrH6IxcFPi4ME/lukv/Osxi2rtRRXKaup6IRoRMAM1iTzIahEK4pMHvMiQk+Q5As2S3ufS7m9mXT0tSC8pKhbosI9pAEMKf+JFoq5JceufMgAHih0GVLoyME7jMj2R0wd14rOK7eNzGq3IEOgwnRaJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ekkZjYzB; arc=none smtp.client-ip=209.85.128.43
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so22156885e9.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Jun 2026 04:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781524500; x=1782129300; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uZKtPG2Rsu8KYTHm+d7DqMiooUqTh41VK800SmJxLJs=;
        b=ekkZjYzBuCWWthQyAGE2N9MIXEWntFE1lPeXnPlgpiCWGkFxRT1CScI9Ng04oIbUkZ
         I+0V7keGQ0uuPgYu1dXZtPkaiHbHQnbWheQ4xGpKrnS2RU4WLbaE3/gbL8XxLLmk3CKU
         rpqBId90wwwlXsKZ5FsekyG7yLdPvu18C8S5LRm9mSoJYsCFq4y5foF54fzdCBHC0XZG
         vxGJ2/rBjW31mpKJZGjMQajDn119qDImMwZOO1y7Mebol9B96i6s82MyonGGl7Al/MzW
         QQChnw7NzS4LIp3PgDYiS5AeL1/uxA+VBvFgS1F44IiKNYqCBBTTJSiB7y4nO0htkPA3
         0F5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781524500; x=1782129300;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uZKtPG2Rsu8KYTHm+d7DqMiooUqTh41VK800SmJxLJs=;
        b=s1+hZZ6MKqHSRndvtPexlsd/dDt4a/ZmAUTtkAiK6Rbusqd0r1+k9wQSEsOSTC4Pty
         JR1nkaD9G74dJjzwmIsdEe4xwHw30MEHr+BZWp6kWceDezp2xEWnW/kjyRRzOf9CRq0n
         65h/EGpebwhfwDTwgHtVb1XtZV812RcEgpHFMqrYW/rKavQUGmCg77Sue47KY7TE+cXg
         GNcIcmXCveZrjGnVGAqol4CrzXvXdmldM1wp7VFBpfr5kek1+eAjmHtRcyu7//M2aMWq
         5XDH//f0GnNDiSex6cWmNVYA8a/CRLcBRYsbVdJTpSGK1asqwUSOky3R/EMT9MVBXwec
         N4pQ==
X-Gm-Message-State: AOJu0Yzl77h65RbkPtIx3ja3WQLDjvlKgh5RybDIip7lgB8Vx/ESvk17
	2bp60lGDwxv1nwHdipH1fULiJIVo4ezniQ3MOGW/eNHuHlOQCcPNgned
X-Gm-Gg: Acq92OGz4+vRFGGFlISb+Et5svxpqPeCNP7vZgyJSMXWkgZy4kUgbUsObJAJT5dHXR7
	NnBqWvwIfWJ5lwWYSha8siXRjZ++UGa6S7JTpjTopTOQSbl1nqGapyqu0reJNRJ850RvHD7p79S
	NOlbYLW9WDz1RZvPJLsLF7cq8fSYnIln67errH4rxUPx673iKbi7A5JRyhgR3trtWukLaIzHsaV
	OVeDg9upSgrs1mlHAn6JAuGBKXbhMu+Ew8aV9awdV+SGGgcvBz/pxaeZqGh8vde3m/3XQIwCcS7
	MwYcf88KN7Jph0hjpP73Jb1nniZDuRgK537OSZdP0ynm/zG33eOoI4sW9kbu7NH9Z6BuJWA4RBG
	Qxd3RUR+809J4h3Kku5zwIZIy7ONh41R14atb7CZu1F7LUTQ9gh6U4zbmToTHbfsbH8F6WLmZ7V
	jVn6Hujm5R3D9XnAzrEJGxIkrcroup8qYNW1a7oh57rHIg0YxGl7ORL20x70SZ5iR+B4SXw3Z+6
	yTiRQD7t6H4JKSNFX8XbqCCUFJj7KwmNXTx
X-Received: by 2002:a05:600c:628f:b0:492:1e36:85dc with SMTP id 5b1f17b1804b1-4922017b005mr122122595e9.36.1781524500002;
        Mon, 15 Jun 2026 04:55:00 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:1e4:992f:3ad2:4f2b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492203dd0b9sm240455485e9.15.2026.06.15.04.54.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 04:54:59 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 0/5] Add DU, VSPD and FCPVD support for RZ/T2H and RZ/N2H SoCs
Date: Mon, 15 Jun 2026 12:54:50 +0100
Message-ID: <20260615115455.1412098-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34012-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:prabhakar.csengg@gmail.com,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:geert@glider.be,m:magnusdamm@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:prabhakarcsengg@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[glider.be,gmail.com,kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,bp.renesas.com:mid,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,gitlab.freedesktop.org:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 011E6685EB1

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi all,

This patch series adds support for the Display Unit (DU) on the RZ/T2H
(r9a09g077) and RZ/N2H (r9a09g087) SoCs. The DU is a key component of
the display pipeline, responsible for driving the display output.
The patches include:
- Adding VSPD and FCPVD nodes to the SoC DTSI files for both RZ/T2H
  and RZ/N2H.
- Adding the DU node to the SoC DTSI files, including clock and
  interrupt configurations.
- Adding DT overlay support for enabling the DU/LCDC pipeline on the
  RZ/T2H and RZ/N2H evaluation kits when fitted with a CN15/CN20
  ADV7513 HDMI transmitter.

Note,
- DU driver patches have been merged into-next.
- FCP/VSP patches have been posted separately and are in Laurent's tree.
  https://gitlab.freedesktop.org/linux-media/users/pinchartl/-/tree/for-next/media/renesas?ref_type=heads
- Clock changes have been posted separately and are pending review.
  https://lore.kernel.org/all/20260615104845.4122868-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
- Patches apply on top of renesas-devel/renesas-dts-for-v7.3 (e0c6913891b1) branch.

v1->v2:
- Fixed typo in makefile for ARCH_R9A09G087
- Explicitly disabled the LED7 and key-1 in the overlay
- Dropped comment about DSW5[3] in patch#5
- Updated commit message in patch#5
- Dropped internal RB tag in patch#3

Cheers,
Prabhakar

Lad Prabhakar (5):
  arm64: dts: renesas: r9a09g077: Add VSPD and FCPVD nodes
  arm64: dts: renesas: r9a09g077: Add DU node
  arm64: dts: renesas: r9a09g087: Add VSPD and FCPVD nodes
  arm64: dts: renesas: r9a09g087: Add DU node
  arm64: dts: renesas: Add LCDC overlays for RZ/T2H and RZ/N2H EVKs with
    ADV7513

 arch/arm64/boot/dts/renesas/Makefile          |  6 +++
 arch/arm64/boot/dts/renesas/r9a09g077.dtsi    | 46 +++++++++++++++++
 .../renesas/r9a09g077m44-evk-cn15-lcdc.dtso   | 40 +++++++++++++++
 arch/arm64/boot/dts/renesas/r9a09g087.dtsi    | 46 +++++++++++++++++
 .../renesas/r9a09g087m44-evk-cn20-lcdc.dtso   | 50 +++++++++++++++++++
 .../dts/renesas/r9a09g087m44-rzn2h-evk.dts    | 12 +++--
 .../dts/renesas/rzt2h-n2h-evk-du-adv7513.dtsi | 50 +++++++++++++++++++
 7 files changed, 246 insertions(+), 4 deletions(-)
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g077m44-evk-cn15-lcdc.dtso
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g087m44-evk-cn20-lcdc.dtso
 create mode 100644 arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-du-adv7513.dtsi

-- 
2.54.0


