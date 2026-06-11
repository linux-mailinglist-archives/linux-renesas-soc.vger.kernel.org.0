Return-Path: <linux-renesas-soc+bounces-33875-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6E4rCLayKmpJvQMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33875-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Jun 2026 15:05:58 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 09C246722D2
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Jun 2026 15:05:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33875-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33875-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 61664300F628
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Jun 2026 13:02:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9660C3FC5AE;
	Thu, 11 Jun 2026 13:02:26 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B74E3EFD03;
	Thu, 11 Jun 2026 13:02:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781182946; cv=none; b=XK9uEilWlU8IrQtkAt+ll6SFdGswTSZr0h9J9kXKfPAyzzhIN9Ek8k3BqwXs9rkdzMfbd/cKPLPJB3HllhSjDEPy+pjF4nzpvJiamrv+Zy38VsehyHafyRyrqJmoTLM/CAO9BgOnki/vuzrgcCNbhRGtm4ifAWPPYTYcyOMZqs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781182946; c=relaxed/simple;
	bh=yUuZmWqRcOoWdR7s/LK4gYFZEOygcUHazqZpj0G5qY8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mxOXcBnUBCA1QdAFPHwOqJZoZYZvp58Nmb7gzr6/hbuZzn3SevXbIfFzG/NzQW+3odPtvxZjdDPXMX8Po83RbOpWFeaN88T2df5oeEWN5tCpLZ/8n+IJy9po36bbfkA4LIgZLJ5yrB90K3zBWeQqOxrqu2XVMRUonU7NmOEc9bI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77ED81F00893;
	Thu, 11 Jun 2026 13:02:21 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Ulf Hansson <ulfh@kernel.org>
Cc: arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC 0/9] R-Car X5H Ironhide pure SCMI proof-of-concept
Date: Thu, 11 Jun 2026 15:02:04 +0200
Message-ID: <cover.1781171705.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[glider.be];
	TAGGED_FROM(0.00)[bounces-33875-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[geert@glider.be,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:sudeep.holla@kernel.org,m:cristian.marussi@arm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:ulfh@kernel.org,m:arm-scmi@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:geert+renesas@glider.be,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@glider.be,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,glider.be:mid,glider.be:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 09C246722D2

	Hi all,

As promised[1], I tried handling all issues with current R-Car X5H
Ironhide SCP FW SDK v4.28, v4.31, and v4.32 as SCMI quirks.  This helped
identifying missing features in the SCMI drivers and/or protocol:
  - The SCMI PM domain driver does not support always-on domains.
    This limits the ability of the Linux Power Management core to
    optimize its decisions by taking into account which PM domains
    cannot be disabled,
  - The SCMI protocol does not support clock domains.
  - Power management of on-SoC modules is typically handled through two
    methods: module power control and module clock gating.  The former
    can be exposed as an SCMI power domain, the latter as an SCMI clock.
    Currently, the SCMI clock protocol does not support advertizing
    whether a clock is intended for power-management of a hardware
    module, so such clocks can not be managed automatically through
    Runtime PM.  To solve this in general, the SCMI CLOCK_ATTRIBUTES
    could be extended with a new flag in the returned attributes (which
    is not done by this series).

Series overvies:
  - Patch 1 is a preparatory refactoring,
  - Patches 2-3 add support for always-on power areas,
  - Patches 4-7 add support for clock domains,
  - Patch 8 adds an SCMI quirk to advertize power-management clocks on
    R-Car X5H,
  - Patch 9 switches the (still minimal) Ironhide DTS to SCMI (this
    needs manual configuration for the actual SCP firmware version, as
    the SCMI domain IDs differ).
Note that other SCMI quirks than patch 8 are not included in this
series[2], as IMHO the original issues must be fixed in the SCP firmware
instead.

While the result works, and we might get stable SCMI domain IDs
(eventually), I still prefer the approach taking by the CPG/MDLC
remapping driver series[3], as:
  - It describes in DT the actual hardware (which is needed for U-Boot
    IPL),
  - It does not depend on SCMI domain IDs defined by firmware that is
    still under active development,
  - It lets us keep the DTB stable, while SCMI domain IDs may change,
    depending on system partitioning (i.e. software policy),
  - It allows us to support (in the Renesas LTS tree, not upstream)
    firmware versions that already exist, but need quirks for proper
    operation.

Thanks for your comments!

[1] "Re: [PATCH/RFC 05/14] firmware: arm_scmi: Add scmi_get_base_info()"
    https://lore.kernel.org/CAMuHMdWJvMH+a1RqozbaCxxH_8M569JcruTFa8PW+87FysnjHw@mail.gmail.com

[2] List of SCMI quirks which are not included in this series, but are
    needed to boot on R-Car X5H Ironhide:

	firmware: arm_scmi: quirk: Handle critical clocks on R-Car X5H
	firmware: arm_scmi: quirk: Handle bad power domains on R-Car X5H
	firmware: arm_scmi: quirk: Handle bad clocks on R-Car X5H
	firmware: arm_scmi: quirk: Handle wrong clock rates on R-Car X5H
	firmware: arm_scmi: Add support for retrieving rates from another clock
	firmware: arm_scmi: quirk: Handle zero clock rates on R-Car X5H
	firmware: arm_scmi: quirk: Add always-on power domains on R-Car X5H
	firmware: arm_scmi: quirk: Handle broken HSCIF0 reset on R-Car X5H

    With diffstat:

	 drivers/firmware/arm_scmi/clock.c  | 2555 +++++++++++++++++++++++++++-
	 drivers/firmware/arm_scmi/power.c  |   83 +
	 drivers/firmware/arm_scmi/quirks.c |   12 +
	 drivers/firmware/arm_scmi/quirks.h |    4 +
	 drivers/firmware/arm_scmi/reset.c  |    9 +
	 5 files changed, 2655 insertions(+), 8 deletions(-)

[3] "[PATCH/RFC 00/14] R-Car X5H Ironhide SCMI CPG/MDLC remapping"
    https://lore.kernel.org/cover.1776793163.git.geert+renesas@glider.be

Geert Uytterhoeven (9):
  firmware: arm_scmi: Replace scmi_power_proto_ops.name_get() by
    .info_get()
  firmware: arm_scmi: Advertize always-on power domains
  pmdomain: arm: scmi: Add always-on support
  firmware: arm_scmi: Add a flag for power-management clocks
  clk: scmi: Add scmi_clk_is_pm_clk()
  dt-bindings: firmware: arm,scmi: Document arm,clock-domain
  pmdomain: arm: scmi: Add clock domain support
  firmware: arm_scmi: quirk: Handle power management clocks on R-Car X5H
  arm64: dts: renesas: ironhide: Switch to pure SCMI

 .../bindings/firmware/arm,scmi.yaml           |  7 ++
 .../boot/dts/renesas/r8a78000-ironhide.dts    | 44 +++++++++
 drivers/clk/clk-scmi.c                        |  9 ++
 drivers/firmware/arm_scmi/clock.c             | 15 +++
 drivers/firmware/arm_scmi/power.c             | 21 +++--
 drivers/pmdomain/arm/Kconfig                  |  1 +
 drivers/pmdomain/arm/scmi_pm_domain.c         | 93 ++++++++++++++++++-
 include/linux/clk/scmi.h                      | 17 ++++
 include/linux/scmi_protocol.h                 | 12 ++-
 9 files changed, 204 insertions(+), 15 deletions(-)
 create mode 100644 include/linux/clk/scmi.h

-- 
2.43.0

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

