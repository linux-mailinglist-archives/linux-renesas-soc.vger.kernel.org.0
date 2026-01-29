Return-Path: <linux-renesas-soc+bounces-27604-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2HaeEoFJe2kdDQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27604-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Jan 2026 12:50:25 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F9CDAFCE3
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Jan 2026 12:50:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 61F8B30071D8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Jan 2026 11:50:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1E9E27D786;
	Thu, 29 Jan 2026 11:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="biWaVUHC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF05218592
	for <linux-renesas-soc@vger.kernel.org>; Thu, 29 Jan 2026 11:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769687422; cv=none; b=cQTLKokOvKK/+iwWNbamGA9duy2S+/BDos/BrPrXJ987FIkfzin0AgDcV+2NkthZKG7U7ymPT+YOhOw697g5DaY9gtTJ2T29nMlKM/xncImd0EiiR+cuA0rle5vLdJwuHnBOy9lGgBw8OWruruNVoxSLEhXTSQMmQ14Gbp80JYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769687422; c=relaxed/simple;
	bh=I38MUjkcoH9V79CpUKSDz1OC341UmQxGErHv0ex1jmw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CTLiYXZBMd7SbhMQ8bx/xD32MPrZAQpFkbRyhIntXsoVwlhMfE8AxuiYqLZqyAQ6dPNizfUoXyWxW2t1AmNoEmuUEontDTzMA1S96B0uMrBi9vq37WlfxRgq/ANLi4jEOdeH9W6D2LaPNWYEl40q0XSa39gleUQh8mag8QPloOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=biWaVUHC; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b8870ac4c4eso139849366b.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 29 Jan 2026 03:50:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769687420; x=1770292220; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CkBngwJnmvxY2ZcqFRWqtKhnXiiLbRs1c6I12xgJLLE=;
        b=biWaVUHCrLxTABTzRtQn22qAaPqYQSXzExHTWoKE7N8Y/YDf3moJj60FMHxQHiChRo
         is2lldXf6OPKYrGPNuWDFVBXfz0XbLEm0E1sIqNZ9DjycBkC+Hl/DCzusG+LzuqXLEBt
         dvtQyGOV2uURhw+UGv81qxy66bRkvNIxJV6vddsv0bK9+eHog24EDiIM+FyfJr1REQiR
         xLvjumq6pAL954kWICaeVRpTD0JYSTaItvFSQlqa8bBvlqSyrxrSuLWmR/RRqs33Dj2K
         6IGli7gvaUKb4fL1RN6lZbBgCjKwhYCvXE9rQAT7Ly+eEsMxiF076IDSgYCRBpOhk/DA
         dUhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769687420; x=1770292220;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CkBngwJnmvxY2ZcqFRWqtKhnXiiLbRs1c6I12xgJLLE=;
        b=gXf0tFkZ2+ba7VRCmhzNbrd2gNB7wYsWGmPJOzkh95eTON0hZQeRwK1QEPakYkxa/E
         rrHBQh+Tc9lYVGhg/zbBPfeK3G7P/hyV8uAKT9UBA5lLx90ndpGrfXPfs6a2JGEUiPxm
         h4RmoThgUiJFQdsLDJthUFNQEgvoE6EBu6ohETR8AtR1++LpuYnsqr3N+VhYZfCJsQBi
         ZtMwl4yNpBqotldttl6nkMmQwjuk+GPDyT6Cyyazfk7Cyr+u3hgdzlZoAcAj70Q0BByJ
         r4KxfXCn5ZsfSEtvJDZFpQ2pWxYqHXFL7RzrwM3XCHW5a4nqVWN3ih4bZP38N5pNzJdM
         GXeA==
X-Forwarded-Encrypted: i=1; AJvYcCX02uE2PyS6eo08K8vfWDrF/dWF5BulVq70mP2cen7D7QTQr7mOPn7+cc008OnNi2iJmBBeqLUBDSWqwjGwkWeo4Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/qnhO7Bc8lxmtfXTAeHJvDdIFxCnzKkALJkWjxFcyu7ontI7l
	6D+HwNi6V/cUn8UDLM4yahHqQPQsDccwdxrMInNhvzeb1PFdiPN1ZgxRbRfZFg==
X-Gm-Gg: AZuq6aLzNCSR135i8KAJPA6V4DZ61xsTF0jO33EV8Kk8M7v4tKGU21zSkBUaVbWVuSW
	fSSYv9hzYOfEgx5tJAoybeUwHNFbq0c4xrFImRLeyz/fDsedP1BNx3J/ljWXD2SlNl1Vq2P48Hl
	Y0avc8eLbe4ppQMEjpYkgZ2h7bjh9boB5f6rrHx36E8TE+yRGaKMsAVRCutqbWf5aWe2P/p4oLB
	j7yQhJmRPJED+nhYcMybAU1KTK9fVyi1P9aXYvWYZiI11YFxUJDov518egT16Ek5abaNjyjHs9X
	8uBLhyiqmKNEWXhaPUn6uB/bSf9hoqWT/cGSgI0nj5C/DaUpyT/cdhQ8VVBplBgWDMn1TlZan3e
	Z9KYkrqaOS7bnuUOKgqf+OP8PTSQLnGLc+JbJF0nWPbHBIYTZTU5i64DefBIC/QrEoVCaxsOp57
	yzptOyZDgTq9fB0bG9Xa9+1veswF0=
X-Received: by 2002:a05:600c:524c:b0:477:b0b9:312a with SMTP id 5b1f17b1804b1-48069c2c45amr116529645e9.7.1769680895603;
        Thu, 29 Jan 2026 02:01:35 -0800 (PST)
Received: from biju.lan ([2a00:23c4:a758:8a01:5792:2065:403:a80b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806ce56068sm111543005e9.13.2026.01.29.02.01.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 02:01:35 -0800 (PST)
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
Date: Thu, 29 Jan 2026 10:01:31 +0000
Message-ID: <20260129100133.95711-1-biju.das.jz@bp.renesas.com>
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
	TAGGED_FROM(0.00)[bounces-27604-lists,linux-renesas-soc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,renesas.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9F9CDAFCE3
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


