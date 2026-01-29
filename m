Return-Path: <linux-renesas-soc+bounces-27603-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wLZ1LPVHe2mJDQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27603-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Jan 2026 12:43:49 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B43AFC1D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Jan 2026 12:43:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 72E4F301369D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Jan 2026 11:43:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4254338758F;
	Thu, 29 Jan 2026 11:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iAGsGsgI"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EC703793AC
	for <linux-renesas-soc@vger.kernel.org>; Thu, 29 Jan 2026 11:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769686997; cv=none; b=RwqtEjHgrDjbONhVzf3p6FSrLDRVDEur7kselLAZ/ZjzsFTfFc7X6js7bqj4Q0R2vDe7mY7Fd4W2BGBfM6JQSgVznTIOrqiAEaARBk52oEUkvLPrUp0zXk0tpvSV1NhANdHbTvWM6H8KsVQHFAPdGTa1DF3cDNIWqBxKbOBxXUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769686997; c=relaxed/simple;
	bh=I38MUjkcoH9V79CpUKSDz1OC341UmQxGErHv0ex1jmw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=j2RqsXO7RiO1f9BcMMAWApPyWHEvneo+a0tNin9M0O8CW40crvdyfza4UPSN0zt/xfpN0y+lnNH/owv+mI6E1Tn6k1we9Pdq1EdZCiZMJiSIKSUklIG3s0ydBSWd7QtXg9ClRAMKdpGRohw7HT2OW1y0JMY7htLrLfw6I1DWYTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iAGsGsgI; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-59dd490be5fso1032820e87.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 29 Jan 2026 03:43:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769686994; x=1770291794; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CkBngwJnmvxY2ZcqFRWqtKhnXiiLbRs1c6I12xgJLLE=;
        b=iAGsGsgIjOQ1CeWPFSnWFKItx34jX8iWK8EQZDn/+GLnjOHmoGQm6QxU2jVEdw6MN3
         SOoPjtlVxiYFExQRvsYXHeZ1pvMEsi9WeHsb2IztpleorLhGAvd0FshpC9zsTmuqDswk
         5cwEeXbfS7W84wcnKogxmX60MeE+qkZlQbvBJQ/RYawlu8SddPiobvkZ8cV1MpfytylI
         04R1MMmmqxkOpSkFNxHHpVol3jaE5oE5WELFPKJ/V9VfPs+bQyMNBgKfJfKHI314F4Yq
         s5gH4eTbWXXzfUtyCq/9cD5Qd7CsKJGtzEswZHYCKGT3LFfAtGfheJsMWTDWdhnLIyil
         XakA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769686994; x=1770291794;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CkBngwJnmvxY2ZcqFRWqtKhnXiiLbRs1c6I12xgJLLE=;
        b=Hyh7siCAHBCicqRBqJrmegrvyCRkPkFZ+LGbWAKvMyurRCCXWTTQoipVWDaFAI37Sq
         Get975v6/pWDEJ5+7d9TmmwolaSbr3CggUHFOBmO7x4SxOcYoDtOHrHYZfAwcRQb+V+P
         2Pxsw8vCUXGPUTpKigbE4sEZ+qqgjguQg20STgzPoAdbK3xVofDapBvyRAo4LW9yWgG0
         qj3vKyXcHD8Ekb0MFyr9azkxB5tPrwyxnpcUeofChqRrSiytNv2g5+Y/JExGn5oxS4+d
         8/VHrgxY/4kmxP3SXp40WGufKxD/Va1uuJqrL7qj4wuwrj+qJZQyvp+PsBa2ybQIi31g
         NnPA==
X-Forwarded-Encrypted: i=1; AJvYcCU1AFJ1piawtc1L+pBt219Dwm+zqEuG6+QGf0TlkaQSMq0gJGz5pUztnJx37gDUcIbIcHfBWOxWWJzYey4jt4z5YA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwYgmeM//lXWMxcWOSPNA+1beJ7Wxge9v6Bns7MViVJaInZSgKK
	aWO9QoS1ME89d5dkNyteal8x30bIn/qW+EVdf96TzOLdeXFYSBuv/8mL54L1TQ==
X-Gm-Gg: AZuq6aJL2ft33G3ynf+c7HDXjeAwEmrt1kWvrxoXAo/w7zUZAXvj/PQ2ylB6ow6G0Pu
	FLfjuEMKpZnj+WHqkGGhN5CglXIXo+S6yH/E1cYRzfQX//r7mlj34Rsqo+uDJj6vwufnR5bxcHs
	upvmLMbwd7kSxeeqFRA7AQQpUyzrHfpCCtGe2UvobMSEWmjp5hjreYaPE4Y3BJLqybC3Z74rqZ7
	3GnmqC1N/CM24ABZpaJLMGhEEhXRnEKzZdEHOOWJKjiMnUMFWzUOakG3y63nrutGWnZbuXZbfzb
	v4caUkbZRLdNxWOmizWIe17f0IRLlYaCqbDiajTI7CwXUjLYCGhd1vEs5QRkVQrbcsYsLbT00uv
	5vv9+iDMj2msTiLIww2XT5c7haI+8kukJ8P0c6xVLdTTQgeAkJK7VBbH38KAPVETzr+qgW2ksyi
	bvPzlS1t0L74M2PTg7
X-Received: by 2002:a05:6000:428a:b0:435:91b6:f53 with SMTP id ffacd0b85a97d-435dd02450fmr10964058f8f.8.1769680573611;
        Thu, 29 Jan 2026 01:56:13 -0800 (PST)
Received: from biju.lan ([2a00:23c4:a758:8a01:5792:2065:403:a80b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e132303fsm13285141f8f.36.2026.01.29.01.56.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 01:56:13 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 0/9] Add Renesas RZ/G3L PINCONTROL support
Date: Thu, 29 Jan 2026 09:56:09 +0000
Message-ID: <20260129095611.95622-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260129091108.95277-1-biju.das.jz@bp.renesas.com>
References: <20260129091108.95277-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27603-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[glider.be,kernel.org,baylibre.com,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,bp.renesas.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 11B43AFC1D
X-Rspamd-Action: no action

From: Biju Das <biju.das.jz@bp.renesas.com>

Hi All,

This patch series aims to add basic pincontrol support for RZ/G3L SoC. The
RZ/G3L pinctrl has OTHER_POC register compared to other SoCs for setting
IO domain volage for AWO, ISO and WDT.

Document the reset-names as all SOCs has multiple resets.

Document the bindings for RZ/G3L SOC and add pinctrl definitions in
driver.

Add pincontrol device node and add pincontrol support for SCIF0 and GBETH
nodes.

Note:
Some IPs needs to set the register IPCONT_SEL_CLONECH in SYSC to control
the clone channel of the IP. Plan to add clone channel control support
later. The IP's involing clone channel needs to do the setup as per the
below flow

(1) Set SYS_IPCONT_SEL_CLONECH register as necessary
(2) Set the PWPR register to allow writing to the PFC_m register.
    After setting the PWPR.B0WI bit to “0” (initial value = 1), 
    set the PWPR.PFCWE bit to “1” (initial value = 0).
    Select the required function from Functions 0-15.
    (Hereafter, Function1 setting example)
(3) Set PFC_m = 0001b and switch to Function1.
(4) Set the PMC_m register to “1” (initial value = 0).
(5) Set the PFC_m register to write-protected. After setting
    the PWPR.PFCWE bit to “0”, set the PWPR.B0WI bit to “1”.

The clock and dtsi/dts patches depend upon [1]
[1] https://lore.kernel.org/all/20260128125850.425264-1-biju.das.jz@bp.renesas.com/

Biju Das (9):
  dt-bindings: pinctrl: renesas: Document reset-names
  dt-bindings: pinctrl: renesas: Document RZ/G3L SoC
  clk: renesas: r9a08g046: Add GPIO clocks/resets
  pinctrl: renesas: rzg2l: Add support for selecting power source for
    {WDT,AWO,ISO}
  pinctrl: renesas: rzg2l: Add OEN support for RZ/G3L
  pinctrl: renesas: rzg2l: Add support for RZ/G3L SoC
  arm64: dts: renesas: r9a08g046: Add pincontrol node
  arm64: dts: renesas: r9a08g046l48-smarc: Add SCIF0 pincontrol
  arm64: dts: renesas: rzg3l-smarc-som: Enable eth1 (GBETH1) interface

 .../pinctrl/renesas,rzg2l-pinctrl.yaml        |  16 +
 arch/arm64/boot/dts/renesas/r9a07g043.dtsi    |   1 +
 arch/arm64/boot/dts/renesas/r9a07g044.dtsi    |   1 +
 arch/arm64/boot/dts/renesas/r9a07g054.dtsi    |   1 +
 arch/arm64/boot/dts/renesas/r9a08g045.dtsi    |   1 +
 arch/arm64/boot/dts/renesas/r9a08g046.dtsi    |  10 +
 .../boot/dts/renesas/r9a08g046l48-smarc.dts   |  13 +
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi    |   1 +
 arch/arm64/boot/dts/renesas/r9a09g056.dtsi    |   1 +
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi    |   1 +
 .../boot/dts/renesas/rzg3l-smarc-som.dtsi     |  92 ++++++
 drivers/clk/renesas/r9a08g046-cpg.c           |   6 +
 drivers/pinctrl/renesas/pinctrl-rzg2l.c       | 285 +++++++++++++++++-
 .../pinctrl/renesas,r9a08g046-pinctrl.h       |  39 +++
 14 files changed, 465 insertions(+), 3 deletions(-)
 create mode 100644 include/dt-bindings/pinctrl/renesas,r9a08g046-pinctrl.h

-- 
2.43.0


