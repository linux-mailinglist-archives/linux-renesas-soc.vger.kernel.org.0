Return-Path: <linux-renesas-soc+bounces-31462-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yLdRFUe+52kWAQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31462-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Apr 2026 20:13:27 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C16EF43E724
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Apr 2026 20:13:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 52D7930555FC
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Apr 2026 18:12:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED2083A7825;
	Tue, 21 Apr 2026 18:11:57 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0DD235972;
	Tue, 21 Apr 2026 18:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776795117; cv=none; b=TtWj3PezT8QRBXdfub8agB0LYgKZfvr7gVv/YR/rlZWc4/oEi1xsN/hymk10C0GNHXj3qYk0VEek+aklwWo8LA3Nq8NoQnRlye/i/9ZjuGE16/mXb/XQhyre28I9/wLTeMGa1dzVhuA7f4cJZ5J/RfHLD6fFhezW+MuRBquaRbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776795117; c=relaxed/simple;
	bh=B9nFgKTWR6k7yI984BsM+U9VG2P9hLAU/HsWEzxO+xw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Wkmo0Lxiniyt9NvHPaGky2GOZjiGg3NJ3vbQ/lYzXx1jwL3DL6qKPTHxYU2y5gH4CPZx6mI2VHeYIaWJaZkNX5m34CGt7lci0g+KhfrBlypSeSOB0wAjdNNha2tWAANIYEkVGmkFqSJtGqj1Uc2VphYnWxngN2cyswLVFzligdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4D48C2BCB0;
	Tue, 21 Apr 2026 18:11:52 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Saravana Kannan <saravanak@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Ulf Hansson <ulfh@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC 00/14] R-Car X5H Ironhide SCMI CPG/MDLC remapping
Date: Tue, 21 Apr 2026 20:11:33 +0200
Message-ID: <cover.1776793163.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[glider.be];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31462-lists,linux-renesas-soc=lfdr.de,renesas];
	FREEMAIL_TO(0.00)[kernel.org,arm.com,gmail.com,baylibre.com,pengutronix.de,broadcom.com,sang-engineering.com,mailbox.org,renesas.com];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FROM_NEQ_ENVFROM(0.00)[geert@glider.be,linux-renesas-soc@vger.kernel.org];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.990];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,lpc.events:url]
X-Rspamd-Queue-Id: C16EF43E724
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

	Hi all,

TL;DR:

    Describe hardware in DT, and perform the mapping to SCMI in Linux.

The Renesas R-Car X5H-based Ironhide board is the first Renesas
SoC/board combination that implements the ARM System Control and
Management Interface (SCMI).

This means Linux can no longer perform various system operations (e.g.
clock, power domain, and reset control) by accessing the hardware
directly.  Instead, these operations are abstracted according to various
SCMI sub-protocols, and Linux has to send messages to an SCMI-compliant
firmware running on a System Control Processor (SCP).
More specifically, the R-Car X5H SCP FW SCMI controls access to:
  1. Core clocks and module clocks,
  2. Module resets,
  3. Power domains,
  4. System power.
The latter is not relevant for this discussion.

Using SCMI also has an impact on the board DTS: besides the addition of
a firmware/scmi node with protocol-specific subnodes, devices using
SCMI-abstracted system resources now have to refer to these resources
using resource specifiers containing phandles to the SCMI protocol
subnodes, and firmware-specific object IDs[1].

Unfortunately we encountered several issues with this:
  - The clock, reset, and power domain IDs are not stable, and may
    change from one SCP firmware release to another, causing DTB
    incompatibilities,
  - There may be different SCP firmware lineages, e.g. proprietary and
    certified variants, and FLOSS variants,
  - SCMI features and quirks may differ across firmware versions,
  - Not all quirks can be handled as SCMI quirks,
  - Some core clocks do not support the CLOCK_ATTRIBUTES command, and
    thus are not accessible to Linux, while Linux may need them,
    requiring dummy clocks,
  - Some module clocks are not accessible to Linux, or report a zero
    clock rate and have no parent, while several existing drivers need
    to know their clock rates,
  - SCMI does not support the concept of a clock domain, so existing
    drivers can no longer rely on Runtime PM, but need to be changed to
    explicit management of functional clocks,
  - Some clocks and power domains are critical and must not be disabled,
    or even touched,
  - Some module resets are reserved, and operating them returns an
    error,
  - U-Boot IPL (Initial Program Loader) needs a proper hardware
    description in DT, not using SCMI.

During last OSSJ/LPC, Marek Vasut pondered if we could keep our own ID
lists stable, and perform a mapping to the IDs used by the actual SCMI
implementation running on the system.  This was also briefly discussed
at LPC[2].  After some refining of the initial idea, this series takes a
slightly different approach, by:
  1. Describing the actual hardware components in DT, plus a minimum
     SCMI glue,
  2. Mapping DT hardware descriptions to SCMI-backed objects (or
     replacements in case they are unusable), in Linux drivers, based on
     the detected firmware version.

This has the following advantages:
  1. The DT ABI is stable,
  2. Current and future firmware quirks can be handled in driver code,
  3. If ever needed, the Clock Pulse Generator (CPG) and Module
     Controller (MDLC) drivers can be extended to program the hardware
     directly if SCMI is not present,
  4. U-Boot IPL can use almost the same DTS; it just needs stripping of
     SCMI-related nodes and properties.

This series is based on renesas-drivers-2026-04-14-v7.0, which includes
a.o. the scmi/for-linux-next branch.  It consists of multiple parts:
  1. Patches 1-3 add various quirks to the SCMI driver code,
  2. Patch 4 enables more SCMI protocols on R-Car X5H Ironhide,
  3. Patches 5-8 add new interfaces needed by the remapping drivers,
  4. Patches 9-10 add DT bindings for the R-Car X5H Clock Pulse Generator
     (CPG) and Module Controller (MDLC) blocks,
  5. Patches 11-12 add remapping drivers for the R-Car X5H Clock Pulse
     Generator (CPG) and Module Controller (MDLC) blocks,
  6. Patches 13-14 add DTS description for R-Car X5H Ironhide.

Dependencies:
  - Lifting "#define SCMI_MAX_NUM_RATES 16" (e.g. scmi/for-linux-next),
  - "[PATCH v4 0/3] soc: renesas: add MFIS driver"[3],
  - R-Car X5H MFIS and Ironhide SCMI DTS enablement (not yet posted).

For testing, I have pushed this series and its dependencies to the
topic/rcar-x5h-ironhide-scmi-cpg-mdlc-remapping-v1 branch of
https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git.
With this, Ironhide can boot into a serial console shell from a ramdisk,
without needing any of "clk_ignore_unused" and "pd_ignore_unused".

FTR, alternative locations to do remapping that we considered:
  - Inside the SCMI clock, reset, and power-domain drivers,
  - Inside the subsystem driver core (e.g. of_parse_clkspec()),
  - Inside the OF driver core,
  - Inside the DTB.

Remapping inside DT is usually done through a nexus node (see Devicetree
Specification, Section 2.5 Nexus Nodes and Specifier Mapping), using
"<specifier>-map", "<specifier>-map-mask", and
"<specifier>-map-pass-thru" properties.  Linux has support for e.g.
remapping interrupts (open-coded in drivers/of/irq.c), and gpios or pwms
(using the of_parse_phandle_with_args_map()) helper.  So far there is no
support for remapping clocks or power domains, but at least for clocks
patches have been posted[4].  Then the remapping can be done by adding
e.g. "clocks-map{,-mask,-pass-thru}" properties with translation data
to the CPG/MDLC DT node, using a DT overlay.  The DT overlay could be
applied by the firmware or bootloader (e.g. in in fitImage script), or
even by the CPG/MDLC Linux driver at runtime (based on detected SCP
firmware version).  Consumer nodes do not need to be modified.
Note that such translations can only support simple cases.  If e.g. a
workaround is needed to map a single DT clock to multiple SCMI clocks,
this cannot be done using a simple translation table.
While a DT overlay is quite flexible and can also do other fixup, it is
less user-friendly than doing the remapping in a Linux driver.

Thanks for your comments!

[1] Documentation/devicetree/bindings/firmware/arm,scmi.yaml
[2] "Firmware ABI stability" at Linux Plumbers Conference 2025
    https://lpc.events/event/19/contributions/2153/
[3] "[PATCH v4 0/3] soc: renesas: add MFIS driver"
    https://lore.kernel.org/20260402112709.13002-1-wsa+renesas@sang-engineering.com/
[4] "[PATCH] clk: Add support for clock nexus dt bindings"
     https://lore.kernel.org/20260129201003.288605-1-miquel.raynal@bootlin.com/

Geert Uytterhoeven (14):
  firmware: arm_scmi: quirk: Handle bad power domains on R-Car X5H
  firmware: arm_scmi: quirk: Handle bad clocks on R-Car X5H
  firmware: arm_scmi: quirk: Handle critical clocks on R-Car X5H
  arm64: dts: renesas: ironhide: Enable SCMI devpd, sys, and reset
  firmware: arm_scmi: Add scmi_get_base_info()
  of: property: fw_devlink: Add support for firmware
  pmdomain: Make genpd_get_from_provider() public
  reset: Add reset_controller_get_provider()
  dt-bindings: clock: Document Renesas R-Car X5H Clock Pulse Generator
  dt-bindings: power: Document Renesas R-Car X5H Module Controller
  clk: renesas: Add R-Car X5H CPG SCMI remapping driver
  pmdomain: renesas: Add R-Car X5H MDLC SCMI remapping driver
  arm64: dts: renesas: r8a78000: Add CPG/MDLC nodes
  arm64: dts: renesas: ironhide: Add CPG/MDLC firmware properties

 .../bindings/clock/renesas,r8a78000-cpg.yaml  |   62 +
 .../bindings/power/renesas,r8a78000-mdlc.yaml |   63 +
 .../boot/dts/renesas/r8a78000-ironhide.dts    |  130 +++
 arch/arm64/boot/dts/renesas/r8a78000.dtsi     |  300 ++++-
 drivers/clk/renesas/Kconfig                   |    4 +
 drivers/clk/renesas/Makefile                  |    1 +
 drivers/clk/renesas/r8a78000-cpg.c            |  335 ++++++
 drivers/firmware/arm_scmi/clock.c             |   37 +
 drivers/firmware/arm_scmi/driver.c            |   31 +
 drivers/firmware/arm_scmi/power.c             |   20 +
 drivers/firmware/arm_scmi/quirks.c            |   12 +
 drivers/firmware/arm_scmi/quirks.h            |    4 +
 drivers/of/property.c                         |    2 +
 drivers/pmdomain/core.c                       |    4 +-
 drivers/pmdomain/renesas/Kconfig              |    4 +
 drivers/pmdomain/renesas/Makefile             |    1 +
 drivers/pmdomain/renesas/r8a78000-mdlc.c      | 1021 +++++++++++++++++
 drivers/reset/core.c                          |   11 +
 drivers/soc/renesas/Kconfig                   |    1 +
 .../dt-bindings/clock/renesas,r8a78000-cpg.h  |   15 +
 .../dt-bindings/power/renesas,r8a78000-mdlc.h |   16 +
 include/linux/pm_domain.h                     |    7 +
 include/linux/reset-controller.h              |    6 +
 include/linux/scmi_protocol.h                 |    8 +
 24 files changed, 2068 insertions(+), 27 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/renesas,r8a78000-cpg.yaml
 create mode 100644 Documentation/devicetree/bindings/power/renesas,r8a78000-mdlc.yaml
 create mode 100644 drivers/clk/renesas/r8a78000-cpg.c
 create mode 100644 drivers/pmdomain/renesas/r8a78000-mdlc.c
 create mode 100644 include/dt-bindings/clock/renesas,r8a78000-cpg.h
 create mode 100644 include/dt-bindings/power/renesas,r8a78000-mdlc.h

-- 
2.43.0

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

