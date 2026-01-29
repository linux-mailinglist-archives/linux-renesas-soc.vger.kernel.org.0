Return-Path: <linux-renesas-soc+bounces-27599-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yMMTH6NAe2mNCwIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27599-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Jan 2026 12:12:35 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D2818AF7BC
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Jan 2026 12:12:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B612B304FC1D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Jan 2026 11:08:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58BC73859EE;
	Thu, 29 Jan 2026 11:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HVfrA038"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD28833BBB8
	for <linux-renesas-soc@vger.kernel.org>; Thu, 29 Jan 2026 11:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769684889; cv=none; b=K0aNB9EJXOsNRJAi7Vb2nhKxxoVA/KTB1FT8h8YSm70t9UnaGi4JegPHvfQr8BM8gFGMvdSae9VRitkaG4tL1joF2zmKDVIwZSoqmE6SmeOvM07GYwLCC6IIy8kNAwIB5NPCfnZSHu0abBLsqcTcyQsstAw7y5hh2mJhB5NQYGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769684889; c=relaxed/simple;
	bh=I38MUjkcoH9V79CpUKSDz1OC341UmQxGErHv0ex1jmw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=F34fFWZb9ScXAGxoRrvFgsD0inrMjQmPHxXnINDX719mZW2sYW+WuNip2canyI5eckzwvtb14zxpBKEzYz8oegOq+u+ASqSyik8yEicXRkkPAQko7DL9dwJiOQ6p4lE+/rolxJuOJcd71Jb0c3dz1x7ntJ81kkwcoM6hJD9zwsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HVfrA038; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b883c8dfb00so193871366b.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 29 Jan 2026 03:08:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769684886; x=1770289686; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CkBngwJnmvxY2ZcqFRWqtKhnXiiLbRs1c6I12xgJLLE=;
        b=HVfrA038PozhAJE6DsMhh09CjrGmFY/jVAfSxHFHuhoMwGhUSBP8QYuUTVyZ6Pt/Vm
         soAAcX1MalPgLMFlw5ZhINXYMbkd0Ix+7MYl9X3hyk9Ta1joeK2nXswXGVqo34c3DXuu
         UYpHbN/sMAh1mf/Y9sVRFd4eC/7wpXsbbn6zbUJM8i9y4btiZ9bX/sPkszvAsh1lJMla
         48VOd61pF6NPj2TYNvnWYP8DjGqy6VBnmrVO+BDpD7ALq9yGOCaJxWjgBEAbFs6auZL1
         iFrzHK6bubQds2juZquNphmqXBy/ev6QsrKDjoU1hDXrDHXFDu+v57jI21k0PTmau8Vw
         VGaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769684886; x=1770289686;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CkBngwJnmvxY2ZcqFRWqtKhnXiiLbRs1c6I12xgJLLE=;
        b=d8xqy1d8R/0Sp+VKOM7yfMs7qIfFhg4gjiR44NB1vqqvQikRKJme5cJ4rmFHqJYSY6
         QgS9eOYqRvWvmB8aoNuWVfPVQoFX3nvkSFhYiKH0XbS8d33SFMZ29nHWzL6llEbSZLNB
         +V75DURxZB5y+hjKdGXOFiUKNmQ5s1zrkyMShRQ7j3Kjv6JJMFhVp7GSqUmMuzIs6Thn
         o7TtwZYvLxO+m2P3y0mPbkQ0BMfxmZP94+iMyDw8e1mUEpYtbrJP6deX3u2zWXPp+Msy
         IWa45FXyiDV9OODBRDRDJbPDBkYMH0dAR1cdFUekqUVVSHovnUx/B3rFLo1eHhjd0RHd
         u5lw==
X-Forwarded-Encrypted: i=1; AJvYcCWKOtTtwnHV63YHQXWoDcCkQwyv5PjXhUDotNp1jkVm9dLig+mlsi0AHbg51klLAof1sbCRTfGqX5o4FDcesBWZFw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxoCg4fqIeoNOn5xLATqfvEuZGdz+4qOBkXV0iyknOf6l9xBspW
	YRkbEP7BQmUnnXCNyqcnXScdkM/h6qKvOZWMNOKYuZFQKiT2Fh7rMDsQDb3NaQ==
X-Gm-Gg: AZuq6aJ02n/Gqj6GGvNnQlwnM81A1yalGdPkETJ2gyvYa3jhbpU2sPvocqMaypdJXLm
	B3RBWpotTSS43RgujRkiwkPLcfbfjGuqlfonWa6wrmSSP7U9Olvcv0V51IZjcP7YbMGjj5POa24
	uHa8LrHskuV1hS6n+CxxwS3MQkq0imuytM0W5E/0Uo4bILV04YCYhN2oUEB1fomLZ9xAFJH3L6f
	YY8fO6EarN0sLP/zL+kz4Dg3YhMJ4c565Su6NRzhCQMgNhECwVJriZaxGAgzcyzubDBFhJHbG7T
	KWcYgTaWQVs9UnclrWkmYlXjVGGn/SfOJ5FZSJbAuwX0UuXs4HC+xllBQQJKNIgSRH3If2cT6mZ
	d8/1o8QNrFhT5db+VF4JMbEonT+1zA5BxTGtc8a1Fn/CV5vDIfh6AzeE+y/oJFFA8SbD63WjV3E
	VRY4uQzkMhgMK5ShCrt3RhobBwUSo=
X-Received: by 2002:a05:600c:468f:b0:477:a9e:859a with SMTP id 5b1f17b1804b1-48069c6948fmr113671415e9.22.1769678710765;
        Thu, 29 Jan 2026 01:25:10 -0800 (PST)
Received: from biju.lan ([2a00:23c4:a758:8a01:5792:2065:403:a80b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806ce56068sm109580735e9.13.2026.01.29.01.25.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 01:25:10 -0800 (PST)
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
Date: Thu, 29 Jan 2026 09:24:57 +0000
Message-ID: <20260129092504.95418-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27599-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,renesas.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D2818AF7BC
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


