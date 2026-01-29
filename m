Return-Path: <linux-renesas-soc+bounces-27601-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sM1qOntAe2nECwIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27601-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Jan 2026 12:11:55 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 62EE6AF778
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Jan 2026 12:11:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C4A6B300AED3
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Jan 2026 11:11:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2113B356A2E;
	Thu, 29 Jan 2026 11:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q+iPOTOS"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88A6C37418B
	for <linux-renesas-soc@vger.kernel.org>; Thu, 29 Jan 2026 11:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769685112; cv=none; b=gDHe++T1NFQZAxn8LVC40HzS+R59xJsW2ybKWODR93RH1NX+eUT4JBkSsvIrtLEdmrSEnLT0iwSOF21RTTx744EhG3gGdnoAxvBNxgnO8xldeqxLkMjnHkclK6v+5SK3/5N3y4fX2TcELx3JjZNE0Y8ap5tjM8OHcHI5JaKVm2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769685112; c=relaxed/simple;
	bh=I38MUjkcoH9V79CpUKSDz1OC341UmQxGErHv0ex1jmw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=KEFm9w2qpdzFlK2Q11RtUWewgJdZtjt9ww6ON1Yul5dKUfB1h/Kr6TWFJTqojzQSRq+LW8JplV8clOFr3v5uGLjCm/hs/iB8RMoGHGgYuAbKLCpZZ+Yah6fze4Dz8yOO9hEeDCY9wMfGRV/l1y8+1z6fMp4biuKN6eGrGL/bTzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q+iPOTOS; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6505d141d02so1356114a12.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 29 Jan 2026 03:11:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769685109; x=1770289909; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CkBngwJnmvxY2ZcqFRWqtKhnXiiLbRs1c6I12xgJLLE=;
        b=Q+iPOTOSHbg6InitYBaEJnqrdm9WzpqbYpFUTVS3+dI4k7DhjuNzDKeogPonX1NWah
         9mZ7QhGTNTRoNz/fu/liz3oBIPdlHyxVav+TTpX2NQjfQZAp9/PZuoVl1ai19vmteYM+
         FRXE7HtTzTIhO7GcRzRwU8F73t2KpuJfT0OBn1b311dSlHKNZf4Go/VKlqqpja+pd3Ud
         Qu+Mpmn3sDjpxyF5vvonYnPPQG0GRrj2FeJ8pcNjGl+f601ihqL466EpfM4HdVu5MXyr
         0D7QhQiHZ2TWWebcKwkrvyumEGesZY4TaGwNX0mUfDMef38DPhhXgHJPXwq5fygNCnCo
         Q1lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769685109; x=1770289909;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CkBngwJnmvxY2ZcqFRWqtKhnXiiLbRs1c6I12xgJLLE=;
        b=TCUN0OeO/aTnCI83EU1c6e1mtGgKVJUPZktH2u0+F8PwMEX7IVo1jBe0AKBKMcbiYX
         9yf1T/UDfw2gQZmAUI3oQkMFkz//mE3VpapA2tUMeODqGFoSxRGjd5CCJ/fKP5RI0vPA
         oCcxVhh786IPgEVbAiEYlGDfO6GgHkhl4idwiFki7XHnR/gD6i892T+OgeCV1kyv5BVB
         7yDc2kc5o3YdFIs32MGPSRJ7Kjbouv4k1PhgmhTCtHlJtQdbtqpFzPyobQ7JhHfJSU0U
         l4Jyim6jIN/Z3hCpkD4KftcnePZ1iXzJY3KRAaXLK5FpEEpOfaUPXgocVbMT7rkGuQ/e
         A1gQ==
X-Forwarded-Encrypted: i=1; AJvYcCVLLVIl5zZFzDbkNfn884vLYR8wEL7wyL2EQNKZnx20DXwICEkdzJHyPXcvZIRzqC23f09qOPNa2ZmgpUTaDvR7iw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxxpc4Q61H6Us49LhnaZ5tNStnRjjb8GtqluDiZ9QPGufL7p0R1
	atVjUYU5Gqn6fpve+31xyv2xsQyeGwGTWpsyrWk1uhdEPvzRi8CMFeq1yv0Lbg==
X-Gm-Gg: AZuq6aJzoHXcd+0Tiz/pfiZWa8ExhAmAOnYOZee3z9+P1bxAF+CIbJD1oY7a6nKbdpz
	Lw6O7p0ys+NPWP6qIabGhzsNk4FZLIsE8h+g/Ib+EN/anoSfEWgjtzGoPHBopUKmWLKx62P5UjW
	h7a8/1LzoijZUndosLRbXViyIVSHkkjRQR+5onf25zibiydTxcJrk7WtFuh1ZAmm3RrNHhfVy3E
	kcN5XvdRvtlDY2iCRbZ0FoNlQsONgxHIn/6zNhos/hVbUh3KDA7NRxQwovj1FJgK69DTgtSgZ/g
	mnZbLFbfTwyfjl/p/HYXKVzgvlm5HzYl9ixosHDh1xdG4VlsDD5rOYUCE0F4qv+HRwgMBfxJIG0
	W1N1wrUqT7R3+CmN7kfc+7iK56uhXknQsdjACQcO8rbazv0r20Cmnr2obcp868AwyEWbH0gDpDe
	2Qm66TiqqZazPI9Ccw
X-Received: by 2002:a05:600c:8b61:b0:477:9a28:b0a4 with SMTP id 5b1f17b1804b1-48069babf02mr104749815e9.0.1769678490897;
        Thu, 29 Jan 2026 01:21:30 -0800 (PST)
Received: from biju.lan ([2a00:23c4:a758:8a01:5792:2065:403:a80b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e131cf16sm13999753f8f.22.2026.01.29.01.21.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 01:21:30 -0800 (PST)
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
Date: Thu, 29 Jan 2026 09:21:24 +0000
Message-ID: <20260129092127.95378-1-biju.das.jz@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27601-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,renesas.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 62EE6AF778
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


