Return-Path: <linux-renesas-soc+bounces-27849-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6CoSMJIJgmmCOQMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27849-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Feb 2026 15:43:30 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE90DABE7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Feb 2026 15:43:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4DA18301874E
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Feb 2026 14:39:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 019143A6400;
	Tue,  3 Feb 2026 14:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jRym06Bw"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58A83EEC3
	for <linux-renesas-soc@vger.kernel.org>; Tue,  3 Feb 2026 14:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770129579; cv=none; b=WSdR4436HLdIYu5T1SPVCqSw4KTwdjzEqcfud40TonVzPrgFvk0qQdHZVTvSPk+ouo8iMTaV9DJSOfz3WG5lD8JKckTTI1dwqE+CxMM7TFU7klAl15s26r6+Ig8kQ2tMkDfrJjeSY89i8DNBg9v0wNXo9Y2sORHgUCnik4xjfg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770129579; c=relaxed/simple;
	bh=dVx/NTBKTBYer1sAELG6RU2I0c4yRgXuu2CweMfhYDE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ShhkKDcA1w6dsK5yUKRQXi5nni1uqdNiRqZ6bR/rRkOuQsIGPM7Zeeeeq3KnIOTJwcRrqy5rib90jgWK73ryDXu51QbWwbcppldaLb9HZo1ywNUNNB2ra/zvzqiuXt9Kvv157Ud0vezjlYwMEVPJa/pclyYJBumimGqtgHF0vNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jRym06Bw; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-435a11957f6so4473468f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 03 Feb 2026 06:39:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770129577; x=1770734377; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bfk7LFQnGB8edV2Pkyiykl2DNq5nGPoA5EosQF70rIA=;
        b=jRym06BwzroZGQUG8Fxs/IPBN0y5m+bnPbZGsQJBnLpVJXK0xG8snEdb+ez5aFpeno
         ZduymtZzN9OxAhzhEQxu5XFZYCRI2qIeKW2uQuIhgdcHIOpV19PyYyzw9tlVTcGvUNkD
         rcE2fuE/TLhOZftrASBtEb8WGqXDsOYhjdz9elmoMTGfvO8qvKYMYXd2IU8pz0FD+lvt
         sCvh6YrjbyKPP/pcue3OTAXJpi3a0sCzPgJhc7e1RceudaSzVdZrJRkwc9iOj0KWEKsU
         Ywpn/KUOEnps4uwNiyJc2WogXaUE8vWw4FvuMWc9iUDI4QuzbhivjBd2j1tR24Ey357h
         ovYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770129577; x=1770734377;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bfk7LFQnGB8edV2Pkyiykl2DNq5nGPoA5EosQF70rIA=;
        b=CMjN0wWrFyEGN/ff6UxWMRQKvar0lDUDM909tMUJGVcMqoQShtPT1f8+28nK+LkjX6
         EMm2quS/3XIaMxVk7AKCpzWq38Mf6vmYWvsZO6GNOL1gKKQmaMguslhIojgOkgjhYxzx
         GG7k5N0ifbpdMUT0nSwQ0iDd6fYqOp/o+qxp7p854z8NYji0XdNHSmlBkDPAaxsvA5XC
         WBu48aYALdl60NaBf1jNXpv7tqYG9nYUsrFCYpmniEVmmnbR+lecO+Ki6H+q2a3YmP7U
         KsNMelDPYzCeVZ7PGvHrcxROHlopdJ6J/tIx9kdCwD4eWpKXWqrJIYQZdFoEN0rUNwBZ
         RQNg==
X-Forwarded-Encrypted: i=1; AJvYcCWp1i9wNTxNFXwT1nOyB7flJiYXBh13+NKMRoo7aPwUJHH6fEHilYh1WS+4E1KdU9dYCDWxDHBscmn56BdyyiR8Tw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwnGLzc3ScT3/A69WzRl9lPrgspRfyI3Ra6aRx/sFn2TgxuGcn9
	9hRHs9RHIClfbLN1sgWk/cQA+wdrceGCYRm5v7XKIy+IY4FF7Q+ppViYfruUSSnH
X-Gm-Gg: AZuq6aK+XeCQb/RQq0TgBRg5XING36mSm9C2tTy/tgl754JOj4oq9c+6izON7cHLt/y
	Oa7mqAs3EulNGmq3rMugLoxvdU/1q+R8z4sRDccU+62JjlNNOnHLFuU2n75S2fktwbOsftShw9V
	B2ZDMIUhmsz/3Q7qeY+Ehzn5rUMliEwb2P9S4pqmJbFVeSVahLy9GdICO7i7wic5dPNeKUcN+Fs
	Cbt1L4mPzpco92urO9fWj65z2tRv3DwItqqpmekHaXe6Uc35bCGCqwcgtmtSiG8DKC5rhEzhBIh
	Rpbs/94GDgt7s6qrVlmD7tDU84dpuLnZU3Ur9nxde3YgM2dSAq0d1bDFMHizuWRNN5wZX7mhz+0
	egDbSDFPA48bqOLvvtzDA/W6MnnadLmeKL6r6qj89MqN3d8SFuS/tPhhXcG85L7Woo6tU1K5GmM
	J4AZ4kO5GGdIvAIUFxnA==
X-Received: by 2002:a05:600c:4e12:b0:477:c71:1fc1 with SMTP id 5b1f17b1804b1-482db481b62mr184164265e9.19.1770124252099;
        Tue, 03 Feb 2026 05:10:52 -0800 (PST)
Received: from biju.lan ([2a00:23c4:a758:8a01:9cd9:f748:166d:55fc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4830512ddd0sm63662185e9.9.2026.02.03.05.10.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 05:10:51 -0800 (PST)
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
Subject: [PATCH v2 00/10] Add Renesas RZ/G3L PINCONTROL support
Date: Tue,  3 Feb 2026 13:10:23 +0000
Message-ID: <20260203131048.421708-1-biju.das.jz@bp.renesas.com>
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
	TAGGED_FROM(0.00)[bounces-27849-lists,linux-renesas-soc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email,bp.renesas.com:mid]
X-Rspamd-Queue-Id: 3BE90DABE7
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

The clock patches depend upon [1]
The dtsi/dts patches depend upon [2]
[1] https://lore.kernel.org/all/20260203110220.265748-1-biju.das.jz@bp.renesas.com/
[2] https://lore.kernel.org/all/20260203123503.314755-1-biju.das.jz@bp.renesas.com/

v1->v2:
 * Split DTSI patches from bindings
 * Fix typo maxItems->minItems in bindings
 * Collected the tag

Biju Das (10):
  dt-bindings: pinctrl: renesas: Document reset-names
  dt-bindings: pinctrl: renesas: Document RZ/G3L SoC
  clk: renesas: r9a08g046: Add GPIO clocks/resets
  pinctrl: renesas: rzg2l: Add support for selecting power source for
    {WDT,AWO,ISO}
  pinctrl: renesas: rzg2l: Add OEN support for RZ/G3L
  pinctrl: renesas: rzg2l: Add support for RZ/G3L SoC
  arm64: dts: renesas: Add reset-names for RZ/G2L and RZ/V2H family SoCs
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


