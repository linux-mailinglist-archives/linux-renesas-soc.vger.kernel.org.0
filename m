Return-Path: <linux-renesas-soc+bounces-31828-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uMvCBEhR82lnzQEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31828-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Apr 2026 14:55:36 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B9E64A2FCA
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Apr 2026 14:55:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 534A6304EA7A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Apr 2026 12:54:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A5C240FD9B;
	Thu, 30 Apr 2026 12:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CodCqSrD"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABD55410D0C
	for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Apr 2026 12:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777553635; cv=none; b=al+gEtXPIuBCkuUVyvd9WyqA/Dox1fsihO17Zrc1KjqcHtxFTgjcEPaYrbihVqFhu5leXrr73PCIbnAQ2mm3mJV21am63DwVc1BgrgJoa7CJHGPWJbgy/EvonyVS1hEA6IQyeLPyvX06VquyqWmeR4lGSk0bsVGO1/4IBw/e3VM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777553635; c=relaxed/simple;
	bh=G0mT1x0tDvGdPeonFeTbaQx9eBvyLg9Be12Sllr9F0U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=V+88RK6nlGUGRPHnf1MCTOXk2eJSnu6esgIoClAEdAiZWsvevUKxpk44wX7lHPmh36SFxC/8l46ueZ50/9QlapuVjT9+9JK4XairZGt3ujNhW7kLtMZwS6Q2/nhMRBcmqgjn46XMXkUWCLOyAlXWaIY8qIZAdJuaZwV0MdRuipc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CodCqSrD; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-488b8bc6bc9so5872615e9.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Apr 2026 05:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777553628; x=1778158428; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=q5/c8Ct83SJKpAdR0Bd4iD5LrQUgDQEBElFL+L+8Gt0=;
        b=CodCqSrDDCVmpEjssQS+NSU+PZgYJNjV9GkwOnHB1z7HlUKh9nn/rCDxfrfvY/OKD7
         qTxOmTRSGNnAjlopZqrtHR2/sYpGP1BWlag+p1FFaFRNkTtkC5bG2OOOXo+ipiQItKMG
         O6pTPzNbfFTwjBvNI67K3p28WfYct63ZCKrZ/vdl6pYXRbGmMrZ3XM1yU/A5EgiOnYWq
         FzmdQ3r4/oXW1950jzTnHiWAfI3mC9yeLT3cCWneCAbk59HEAroOOIJ8BoZ9pEnScDUZ
         PZ4mhGEXKTjWfuu1IyQtvyW8a5W9oHXU1mACwOeIBZxkBVWjAl1io63zSQmpQwKlsPTB
         1gSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777553628; x=1778158428;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q5/c8Ct83SJKpAdR0Bd4iD5LrQUgDQEBElFL+L+8Gt0=;
        b=tYeFZCPQeYvIjLgGKlpxVC5p8F42php75TKmVh6BRQ9Z9cIoPXbEIfaBNrc5QHvj+D
         zO20DQU2akThIJsOLxovW1nalMJyZCmVlYg5Km54yOLBMjMGGBbptX5Q/z0ORm6BM+Wq
         BVVhHzWxsf1DC7zvhDF6gbggKWBm+DDi6gs4Mjq13wbNxYVBf99NM7eudkmBAs/g8ZQt
         cOm8YadCxEE3LfvyLrHYuSl6PxLF1SDziVmIAVRuooSrowD+76oh2j4Off/fgExj2ExC
         fpqQ3BOTGd/leIBXThggey6Xg4cqIEsuvgbnrEQOr+W5FdILrQQ0cmuIMkLC+y+XiFPX
         +Fgw==
X-Forwarded-Encrypted: i=1; AFNElJ+IACruZaAJ1sEj3VismoHXDurBbC6r/1Z7tHPp5Asiuz5ShiKarls0UW6vg9O/j3M6v8weCmzYiSXDAufPnuu5Qw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0ZcIRQalJKhDZquq82hJPi97IOdMCkqS2RKVqt/fsCLJMA2Vi
	t9cc5xGI5fnJrEuSlPjSweMQHQmB+0sFoJP9UUYjlp1i4zu2Ff2UyB/9
X-Gm-Gg: AeBDiesbGCy6B7HrMRdqMD8y5Iw5vWP9o70NtV663Rk7qOeUAAAPQ/WXcUhAjhZIR3h
	Nc274eZ0lhqxAGX8BCxGq10r8c2FO3vxRA1bDJSNS3rTcPD+at5Mfq7K4hSMNwU2w0q/vwBWlw2
	2Ek3lBG0IIfjrF/l5YQpaEwI+IJCimMDwuCv8YbtQRXZt62vQ+rGptMlgsVtmj/dsdxDItKO/At
	gCbce3SNxhcMGYWb/XGQcuJWJ+kM4S5uWAqv1LXOZvKlXUW3PwK/sJNfwpUluUvGj0zEOcaOI45
	01XvzXxkgXyNNZpev/4vsHvBAAF+Bubz30NDEiGvdqZzQFXm3gseINE9n9rpgDtlgoRi40U01ie
	XUwtLMNFzt5s5viPkos9mJNzQktFshvLjCs6neP4n6y2uH/QQt1WvC2guIZZoUsRQAH3Wg3H/PA
	sF/CBhNxzk5eoZNiDhn7qXN0hJ22UX48+ZrBrniaH5/n1FLlzRtQ==
X-Received: by 2002:a05:600c:4e05:b0:486:fbd1:9dc0 with SMTP id 5b1f17b1804b1-48a84473724mr48644605e9.22.1777553627693;
        Thu, 30 Apr 2026 05:53:47 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a758:8a01:342:901:e785:f7d2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7c3057ecsm40995825e9.20.2026.04.30.05.53.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 05:53:47 -0700 (PDT)
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
Subject: [PATCH v3 0/6] Add more support to Renesas RZ/G3L SMARC EVK
Date: Thu, 30 Apr 2026 13:53:04 +0100
Message-ID: <20260430125342.439755-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 9B9E64A2FCA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31828-lists,linux-renesas-soc=lfdr.de];
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
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,bp.renesas.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

From: Biju Das <biju.das.jz@bp.renesas.com>

This patch series extends the RZ/G3L SMARC EVK platform to add OPP
table, IA55 and pin control support for Ethernet and SCIF0.

Patch 1 adds an OPP table for the RZ/G3L SoC, defining six operating
points ranging from 37.5 MHz to 1.2 GHz, and links each of the four
CA55 CPU cores to the OPP table along with their respective clocks.

Patch 2 adds the Interrupt Control Unit node to the RZ/G3L SoC DTSI,
wiring up the NMI, IRQ, TINT, and other interrupt sources to the GIC.

Patch 3 completes the pin controller node by adding the compatible
string, GPIO ranges, interrupt controller properties, clock, resets,
and the clone channel reference, and sets the ICU as the
interrupt-parent of the pin controller.

Patch 4 adds SCIF0 pin control configuration to the RZ/G3L SMARC board
DTS.

Patch 5 adds pin control configuration for the ETH0 Gigabit Ethernet
interface on the RZ/G3L SMARC SoM, including RGMII pin muxing and
hotplug interrupt support via the ICU.

Patch 6 enables the second Gigabit Ethernet interface (GBETH1/ETH1) on
the RZ/G3L SMARC SoM, adding its pin control configuration and PHY
settings mirroring those of ETH0.

This patch series depends upon [1], which has no further dependencies as
all the prerequisite patches have been accepted.

v2->v3:
 * Split from [2].
 * Added ICU node and set ICU as the interrupt-parent of the pin
   controller.
 * Moved ETH0 pin control support to a separate patch.
 * Dropped ethernet-phy-ieee802.3-c22 from mdio1 device node.
 * Fixed typo txdv-skew-psec -> txen-skew-psec.
 * Added hotplug support for ethernet.
 * Renamed SCIF_{RXD,TXD} -> SCIF0_{RXD,TXD} pins.
 * Added patch for OPP table support for RZ/G3L SoC
v1->v2:
  * Split DTSI patches from bindings
  * Fix typo maxItems->minItems in bindings
  * Collected the tag

[1] https://lore.kernel.org/all/20260326111953.31024-1-biju.das.jz@bp.renesas.com/
[2] https://lore.kernel.org/all/20260203131048.421708-1-biju.das.jz@bp.renesas.com/

Biju Das (6):
  arm64: dts: renesas: r9a08g046: Add OPP table
  arm64: dts: renesas: r9a08g046: Add ICU node
  arm64: dts: renesas: r9a08g046: Add pincontrol node
  arm64: dts: renesas: r9a08g046l48-smarc: Add SCIF0 pincontrol
  arm64: dts: renesas: rzg3l-smarc-som: Add pinctrl configuration for
    ETH0
  arm64: dts: renesas: rzg3l-smarc-som: Enable eth1 (GBETH1) interface

 arch/arm64/boot/dts/renesas/r9a08g046.dtsi    | 147 +++++++++++++++++-
 .../boot/dts/renesas/r9a08g046l48-smarc.dts   |  13 ++
 .../boot/dts/renesas/rzg3l-smarc-som.dtsi     |  93 +++++++++++
 3 files changed, 252 insertions(+), 1 deletion(-)

-- 
2.43.0


