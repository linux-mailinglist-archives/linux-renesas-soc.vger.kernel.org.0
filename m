Return-Path: <linux-renesas-soc+bounces-27605-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WLRTIi5Oe2n9DgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27605-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Jan 2026 13:10:22 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E3260AFEB8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Jan 2026 13:10:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 958543017C3F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Jan 2026 12:08:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B023385EE1;
	Thu, 29 Jan 2026 12:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="epJ26tcH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6F15289340
	for <linux-renesas-soc@vger.kernel.org>; Thu, 29 Jan 2026 12:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769688530; cv=none; b=pPu8JIfuZl6sIpSnKd1aWCz/zAA2ZlsfXrGWu+W+5bG402gHKPa6HESagRzy7Wc18G4dJkOb1k9Bco0of9Ig2p/kSj12pIPKNcdh9w8+GWBoqI8hf8oCVuwb+O01ZsP1WxTGDgWQMmlDkeU/rbyJVlRJhoy1nZH+MtvIJvwmGTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769688530; c=relaxed/simple;
	bh=I38MUjkcoH9V79CpUKSDz1OC341UmQxGErHv0ex1jmw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=NrTlQ9vgUDZg/Zgq95mqe47OnNbHmviEfrlElwA8Njl51I6xhDxDFpePf2aG85PNAmMQOKS7287s+h/M7SCmT4/ixDAkDdAMntDqBc0Xa98tPeZU33U1+UkhkfdC9nBSm5qvDL7OU4kdirhh/sNVl0PMbCy7voPNzXV6vtPrgM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=epJ26tcH; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b8710c9cddbso116858966b.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 29 Jan 2026 04:08:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769688527; x=1770293327; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CkBngwJnmvxY2ZcqFRWqtKhnXiiLbRs1c6I12xgJLLE=;
        b=epJ26tcHggyTlU8R6TMVJ4WArMsFYykTq1nH40QcpDuv8MesUuqUguagFnL+UYZJ+D
         LRNyLWk0q22kwdgyiq8SRro57Cg2AbocoaYu4cGZe8N+teof2U4rU/PTekTTVI3vT+HY
         7kzBTuuShrHH8E127RHB5zExI+5mKhm1TeFzOK4p8Tuw0CECS95f4FhWx/FMHLXCXOoB
         fEicCc2ieowoKjRWxBI0RxcE3D+UktOJyLzO/wTIXXnz3G9ITD2x+wSxs13K3nXUUhgv
         mA1XomsO6GSFw7YdyBVDNh84A5RNgMxmRj9olsaQPN+kp1Z8QjML9X8/Ul/kLA2H4YJR
         BuYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769688527; x=1770293327;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CkBngwJnmvxY2ZcqFRWqtKhnXiiLbRs1c6I12xgJLLE=;
        b=LaFc13jLjZ4Q77AUfH4WJXKBEh9qAceWdrEwOJSWo6p8iwq2yQvgxJJWnb0cdu1if1
         JRtF/dJj35WNcPlMzYUoozuUtjw7POkDTeiuLkfaOrzUSTgClyRdrD0M2h/hUWXqm+sn
         cBSrrvu7gNpdt3Om9ugu701F234LmewSLu8wKfWkCncgnLlDfeqLQ+qXIBUkNuWzEQq/
         C2iHPj9In7XveS/cVelmfFQj8HUWVNCZDA2DJHDXdXdqnflNP+Sslm65P1a5+7cV3ph7
         QLCLMbuE/JNiBtDwZBNy8xTU9+gcM/YoAjU1l0+XrwyIC8U6XnlXMSW9z99Dc4yXk2U8
         bKlg==
X-Gm-Message-State: AOJu0YywVN+OumtAxjssgws+V84vs31OAyLx70XqQBehFbuDMtOe97GI
	L+D2J6d0sZR7qxgQSYw4aMn+pbWrNQACTcud4FNPvVMuE9OoNY5E3ORIq2LluQ==
X-Gm-Gg: AZuq6aLuvPreMklnkMEukzyE4J+/sShnE6OxMaHXN+8imRbkO+575Wq69FUc3tVTlaU
	Afhy4EZZL4pDA0bEOB0wL2nOSI8Uo2lrWNhsFCqSpvDdu8PT1Kh7425+wEUNnzXW4GUCdk+W3vQ
	gaDCD6UidvrVpxeao+Cmhr/SzPnllRLJ7KBz7UQhCt0OQoj4Vn+ftZKB/bkqs/CAK8q/WELUaAV
	2WsJ7IVpmNB8ocVoyKGk/i8rvINxzbWUNpFvaaxbPhznfKjfVnx0BsYq739Zzhky0WFJSvzhyr6
	pl78W3OqYDPjEZLS5a+oU0/35wRe4+0oTA7fDuuSnneakGJeKMrzNREOIcDOKPIKenWnzLHceIY
	GpjA86D0Gaw6RbagEriYz1FzHsz31iStC1+cBqxEMAcKSRpFVNV2zxJy8q9NZYMqKVTW4Hn+S9s
	sKeRtofhMqvX+mkir1
X-Received: by 2002:a05:600c:3b86:b0:47e:e5c5:f3a3 with SMTP id 5b1f17b1804b1-48069c5414fmr115342325e9.24.1769681810702;
        Thu, 29 Jan 2026 02:16:50 -0800 (PST)
Received: from biju.lan ([2a00:23c4:a758:8a01:5792:2065:403:a80b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066be77b5sm178642065e9.2.2026.01.29.02.16.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 02:16:50 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: biju.das.au@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH RESEND 0/9] Add Renesas RZ/G3L PINCONTROL support
Date: Thu, 29 Jan 2026 10:16:35 +0000
Message-ID: <cover.1769681553.git.biju.das.jz@bp.renesas.com>
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
	TAGGED_FROM(0.00)[bounces-27605-lists,linux-renesas-soc=lfdr.de];
	RSPAMD_URIBL_FAIL(0.00)[renesas.com:server fail];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,glider.be,kernel.org,gmail.com,baylibre.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RSPAMD_EMAILBL_FAIL(0.00)[biju.das.jz.bp.renesas.com:server fail];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	FREEMAIL_FROM(0.00)[gmail.com];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: E3260AFEB8
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


