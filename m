Return-Path: <linux-renesas-soc+bounces-33249-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8EYKHjv0F2q5WAgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33249-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 May 2026 09:52:27 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF035EE00E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 May 2026 09:52:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9B4263161D9C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 May 2026 07:46:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C929E352008;
	Thu, 28 May 2026 07:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DZrQeRsi"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BEFF31195C
	for <linux-renesas-soc@vger.kernel.org>; Thu, 28 May 2026 07:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779954382; cv=none; b=LxXtg/I6XbAnfVYNamgGMctRbumQk10WNYxKgtFDeYHqhcxfc3mK1VuKn4ebC/llDTKelCuX6Yde0e0xm5eU19i3wMrdIF6rMhOGWD5kOoZjHCbzMX16tQ6t9VOlt3141Je5mBnGK9rzxo7+YhGsE1svsBT7XJQGYwsbFIvMECU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779954382; c=relaxed/simple;
	bh=wGHS/8ybc7EUGv5Q5/UTplRynVKohqZBmV4QNAVOMyc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Z2Mx2VhiWpgYve5RthwQZZT5xf/oHxxplxwWT9qXuD1nOdQFmugeky46lXrDnTeH4BSFwxIy/dSBGk2AVdXzlT1c14hdzLFg7Yl77fU+RF+zKj+xdwBVbWTSv2nQykqaMzo59CjcUTckd62sVGTye8Wdp73G8A3MsTzwnL+ZXcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DZrQeRsi; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4903d730b1fso58312785e9.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 28 May 2026 00:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779954378; x=1780559178; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qlAhB5peqR2hJifZRkRvRE+msKrpP2rntacMYL+q5qA=;
        b=DZrQeRsiZeu9QcG58tIEEqO7wHLetX5rLUsHq3MtM6XD8CvYg1CTBZ809m9uupoDdV
         rrqtSocv2ZXTihxWbAYeqi98HXByCVAOuab6xStno1PB1sDN6HVH5nyPGctznYQoXHrE
         hTAB4cJUKNQzz1GEWBiH1PlmG8b8/6IWu9YiAoNWRhRlP1bBWPQiW4ZNF1eUU+FOICZV
         y0X6JjTK3tVuFE/RfcgCpsygDU87vVUIxpN/WYljTtICdlnah0DCI/07JJA3Ndh9cdeA
         /Zko0w0HqBmCXrhrEHaeRUVXn/HH6ZmYJz9Xs+TLJ57F+OSD87gC73tizthJWc/ysaWU
         Qzcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779954378; x=1780559178;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qlAhB5peqR2hJifZRkRvRE+msKrpP2rntacMYL+q5qA=;
        b=b/tTjoolNUOzv94dcmcMBx4h4Nm7BMombg+is/dEKEmV2AqWIubeXdLsANJyofVnW9
         fVo1HXIvOfK8NxNFdtAEt4LGSKo8cSD4FWh+gmt50SNF7gcSwwzxJ+q0DSTrfDNUFdag
         vRd7q2psBDQMnRSZavO6fnZ3h2TEHbi4UivvUl5X+bbTtHciniCfcNp9EUp1RdF4nSnf
         YKTNnAilooXgwyqzRLfhLFipfk2/RdGe5KX1KjRUeI2QQZ3qMM3urSXJHhXzzTi7PrvA
         fWXNZvWCm5uJaJCSa7T/swoN6Wl/MKbNd/aUFYxySLkQl+jZHbBH1mdeMjIz9aWDDkpF
         YdIw==
X-Forwarded-Encrypted: i=1; AFNElJ8PzzX19RX5nKm8aql2lwJ+UmhI8kjjmYE6L1vYsLnFIdbLqYh3A1p85sDVf2C/6shMumXLqRPsk3NsBMojvGh59w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyG6oxyj3GlUUz6YRA4bItOjSHsWRlz1R9FgLCsj6fsh2WC6VZz
	Foj1mfh0O4EgU7hZaxpvEUqaU3pvGdIrh7lKxEqDj51/L8AcfWOA9OKQ
X-Gm-Gg: Acq92OGf4bSk5VocFu7e4I6JFMD6TmsyveV8CVXmfVsmvohinidPuhYZ+3X6txBreFR
	BNXw7HXgdorf9cawDns32Y8neijvCiqYx0PLrgNAbsek7NhCMY6hfqrHk7ctqluQWtJJyJznZ/n
	snnBUO6jUwH3/ppQq4n7wByT4vC35J/uEGlMT13HvB6oDnzPi0hjmDeR+/BFQFaNOKs2MI0c5Ap
	Ra+CQiQoc1sruT3bYCur9OWn7Av6oc04B9tZ45cBB7pnhVB6UvVXaebiFgWSy0SHJArHi16I1qH
	43NQBFVMsIZXdTIRdyL4YLNvCfmaf7W2uR9WEfJwuO4uuqIVQ5lv6okJviyXz0xf8N2IY9ijKHS
	xTbTsiD6dEjrhcBjOr6EVIYgSqpM+TeeS+3ribycz3xAuA1aCHvO+g+kHLZXE5cJ0GKZvg0RoQB
	JsBSxPz7P+/wAq/p6cc0qbeBFvX71yOWhdsd86S/4boaNCHpL+vsnQ3ya02iY=
X-Received: by 2002:a05:600c:83c6:b0:490:5872:e641 with SMTP id 5b1f17b1804b1-4905872e758mr343078605e9.18.1779954378306;
        Thu, 28 May 2026 00:46:18 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a700:7301:c724:a823:10ad:6b85])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4908f0a3c2dsm10865885e9.31.2026.05.28.00.46.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 00:46:17 -0700 (PDT)
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
Subject: [PATCH v2 0/2] Add audio support for RZ/G3L SMARC EVK
Date: Thu, 28 May 2026 08:45:43 +0100
Message-ID: <20260528074615.91110-1-biju.das.jz@bp.renesas.com>
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
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33249-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	FREEMAIL_TO(0.00)[glider.be,gmail.com,kernel.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-0.996];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,renesas.com:email]
X-Rspamd-Queue-Id: 0AF035EE00E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

Hi All,

This patch series aims to add audio support for the RZ/G3L SMARC EVK
platform using the SSIF-2 interface. PDM/SPDIF support is planned for a
later date.

SSI0 signals are connected to the DA7212 audio codec on the RZ/G3L SMARC
EVK. These signals are muxed with SD2 signals and are enabled through
the SYS.4 switch on the RZ/G3L SMARC SoM board. The audio clocks and MCK
are provided by the 5P35023B Versa Clock generator.

This patch series depend up on [1]
[1] https://lore.kernel.org/all/20260528070239.33352-1-biju.das.jz@bp.renesas.com/

v1->v2:
 * Dropped patch #1, #2, and #3 as they are accepted for renesas-devel for
   v7.2.
 * Updated commit description with clocks arranged in clock output index
   order.
 * Dropped assigning clock rates of the unused outputs (ref and diff2).
 * Added guard for snd_rzg3l with the SW_I3C_EN macro.
 * Sorted ssi0_pins.

Biju Das (2):
  arm64: dts: renesas: rzg3l-smarc-som: Enable versa clock generator
  arm64: dts: renesas: r9a08g046l48-smarc: Enable audio

 .../boot/dts/renesas/r9a08g046l48-smarc.dts   | 72 +++++++++++++++++++
 .../boot/dts/renesas/rzg3l-smarc-som.dtsi     | 40 +++++++++++
 2 files changed, 112 insertions(+)

-- 
2.43.0


