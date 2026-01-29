Return-Path: <linux-renesas-soc+bounces-27598-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wFzHDHU8e2kRCwIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27598-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Jan 2026 11:54:45 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B363AF335
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Jan 2026 11:54:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D7C69300B468
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Jan 2026 10:53:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D48DD2D12F3;
	Thu, 29 Jan 2026 10:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mn8vf3Si"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D655352F9D
	for <linux-renesas-soc@vger.kernel.org>; Thu, 29 Jan 2026 10:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769684019; cv=none; b=Ss8FZ+CB6+U0JZUY4T92lZ8Wmm5UEKqqXBx6fIYpY5tyQO4qPJv2AN+8U7rBjn6VhN0czgIpn0aV34tLUfordVoeSmIzSTFj+Y2XyoxE/Rrsb4VDpUiAIpzDeH+5qvUpyKaEqIprc1mUEE/6rNWHLvLv7ZNmHjgL3Dfz2JSG9PM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769684019; c=relaxed/simple;
	bh=I38MUjkcoH9V79CpUKSDz1OC341UmQxGErHv0ex1jmw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=T/0iCtbzhIdIvUCIpwFjrFWEwVfT5aO2/BTJqlHNXSA9bnx5n/D7ehKrXBOpYGWBT21QO7YKoJcZsmTbMirhh/NVQ+FWgLhrC5L689bwJNpg3KhZdu3RJbK++WajEE/ex/16CMmJeKWhvFUXlDVapbC74fPkt8EqRbOhEnkGPEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mn8vf3Si; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-59b710d46ceso732390e87.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 29 Jan 2026 02:53:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769684016; x=1770288816; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CkBngwJnmvxY2ZcqFRWqtKhnXiiLbRs1c6I12xgJLLE=;
        b=Mn8vf3SiHayg2lJoEIzFKBkvEcj+k11Fm9gMDI7qjsb1o73GvZpo3zLqCONgsn30kr
         Xf8x0LVZef+QqP01n2wJTQ0KK8N9KX8WJ3gkQDU8vaWpjdlhm4CoQOh08s/Hgl1rKAN6
         QsK/n6i5AnwK+lgpyWmCiGnQ5QTi2mFVBEIYtQhuYQ9MezwX5J7gEkVpvfxHzQ8NQXbc
         n+HI4S7it5mWmlzVtkfD6g+R1gXVLzdm5u/fsEYyFBP5C7mMeOPJKVVV82vmx2eLlpgy
         nSGpV3LfnOWh2Dl2nJYKtvTDOJwwpYCjGhWOZ6WkVj6/6o1OoghYoZvyewmcO+yLcBCa
         9fxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769684016; x=1770288816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CkBngwJnmvxY2ZcqFRWqtKhnXiiLbRs1c6I12xgJLLE=;
        b=MrHjHmNKil2hR6o4rZ/PZPX5XVcv997eS3b48W6wYLUTeOZi1J/4UH9/QXddXlqAKV
         UjokQxigwxDcxB6+356kpTZYkZWTryeM8NjeSpLiWnqCIjT+B4TkB4GagOaFfGgmHXw2
         2MXr8W09nw35MPeajUOP/sfAQIJzlMkpq+9GYA3ch5DacHS4Y8r0U+FuskWEaLU0nWbJ
         KFJ1UKNamnpUkj6o/98oElUe9WdFVWwT/SuE/Q9gKlKgpaN5bpd1qNk9t63+GMaF4sOG
         oGj/UAD9/Lk4gH6V/KGEBQdcPYkl6WgUG0uWmzxjx38CyrPzircfWYjG5Qiid/Kb3UND
         /UMQ==
X-Forwarded-Encrypted: i=1; AJvYcCWzTUSVxk48kFFLsBBQ5UIIHwTav5NmBCqia31ucNcR4RY6j/UfbwzeTx400+Dkj5yvpMn9WY392bFACPoFBtb9zA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzxU/RhVoEgV2HAmUgGbchX+b19wu3oXdZ9u/NSZ3/fZAlNWmwS
	rrIMF/OL9pwciIGGRbp11AEDPfx1in9ZTxW6eF8B2vy2xMT5TZN5bTw3KREbtQ==
X-Gm-Gg: AZuq6aLHmVC5j+e/VEhlxDJ9EhBvhbmkK5soW6PWRYGZho5A6U1ONXndQNataoIrnJ8
	ilySXZ94TJBjzWV4nvf2c76o3Y8qUZRUvoc7Eua6PH4g/2ElH7O61B3CrWKXwq+AmTSw9+aEvOD
	SvcPPjQyThv82McPJpO251Ff4yj+XhopdAiH1t/jCkobh+k0Z8g+gSBBCOwigYC1qd3oX7G1Mak
	8PB8vQlyiyQrTMFLquUBAbLL4Qt5H8cZil/GRTbSaPJWRfAtLyWUX3Cy3bWeQGGQmK9+5/6wyKV
	bD/zJOOwTz+2CH8KVAE9xUAoI4URcg+B3Q5riKqXsHO4e11nFGotwmp6zEd+LdykWdYdWzZlNiT
	vzklgq+BFuc8ysTiZhdgE/S3PsxX65J/5VI8SpgXG2L+ZSz7ilZmm/ReJxNUHp3Q9/b5S1Uz/iH
	ttxJ1w9V962ixwdUAcoEl9OqW3Kms=
X-Received: by 2002:a05:600c:4689:b0:477:9574:d641 with SMTP id 5b1f17b1804b1-48069c5bd29mr110958455e9.22.1769677870614;
        Thu, 29 Jan 2026 01:11:10 -0800 (PST)
Received: from biju.lan ([2a00:23c4:a758:8a01:5792:2065:403:a80b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066be77b5sm175338875e9.2.2026.01.29.01.11.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 01:11:10 -0800 (PST)
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
Date: Thu, 29 Jan 2026 09:10:51 +0000
Message-ID: <20260129091108.95277-1-biju.das.jz@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27598-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8B363AF335
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


