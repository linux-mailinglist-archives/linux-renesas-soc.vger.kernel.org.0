Return-Path: <linux-renesas-soc+bounces-34858-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FqIsK/0kTmoVEAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34858-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Jul 2026 12:22:53 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4467072438E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Jul 2026 12:22:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34858-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34858-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E99AC30CA04A
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Jul 2026 10:17:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1228399CE9;
	Wed,  8 Jul 2026 10:16:53 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B2902ECE93;
	Wed,  8 Jul 2026 10:16:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783505813; cv=none; b=IbpdnhAmuWpur37pArSZCyOfiSulHAA9UVY2ggFfXZhbnfx/bofxfYkm51Tt1kso5a/oS/HtOxo6G+P2M5YZyhTZmezhkmB86l3oHWbGH+0mMbh3CEH8b8xIfxkZ/1rrcHVNilDgVKJbGDvLWIDBTdlPAnBG6AUoQYSc19bFA2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783505813; c=relaxed/simple;
	bh=wt6GXk70Rc+b6yaUY/nzgjsSh1CGA4YM7ORwU31YGW0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=u2AAsY/KHtr/okCG7yNH4HkBNGH/WZkL8NT67KRrIa4kZl3OgZsg4/4LbcdZ0yt4vKCGYJpILVyfi1+F/KyNg662VWRtdKhScMGkztYUbZvZsNGFEphxZbvWxmsMIZcjpzf0GgR6OcWjsHpgAYqlWvT+/gWhmwIajhI9+cl/B3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDF921F000E9;
	Wed,  8 Jul 2026 10:16:46 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Ulf Hansson <ulfh@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Vinod Koul <vkoul@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 00/10] R-Car X5H Ironhide CPG/MDLC SCMI remapping support
Date: Wed,  8 Jul 2026 12:16:18 +0200
Message-ID: <cover.1783505329.git.geert+renesas@glider.be>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[glider.be];
	TAGGED_FROM(0.00)[bounces-34858-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[geert@glider.be,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[28];
	FORGED_RECIPIENTS(0.00)[m:sudeep.holla@kernel.org,m:cristian.marussi@arm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:saravanak@kernel.org,m:ulfh@kernel.org,m:rafael@kernel.org,m:p.zabel@pengutronix.de,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:bartosz.golaszewski@oss.qualcomm.com,m:vkoul@kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:khilman@baylibre.com,m:florian.fainelli@broadcom.com,m:wsa+renesas@sang-engineering.com,m:marek.vasut+renesas@mailbox.org,m:kuninori.morimoto.gx@renesas.com,m:arm-scmi@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:geert+renesas@glider.be,m:krzk@kernel.org,m:conor@kernel.org,m:wsa@sang-engineering.com,m:marek.vasut@mailbox.org,m:geert@glider.be,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linux-m68k.org:email,glider.be:mid,glider.be:from_mime,lpc.events:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4467072438E

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
  - The clock, reset, and power domain IDs are not stable by design,
    causing DT incompatibilities.
    SCMI requires that the ID space exposed to an agent (i.e. Linux)
    starts at zero and is contiguous.  Hence any change in system
    partitioning (Application CPU core vs. Realtime CPU core,
    virtualization, ...) may mean a renumbering of all SCMI IDs,
    implying a massive change to the DT.
  - There may be different SCP firmware lineages, e.g. proprietary and
    certified variants, and FLOSS variants,
  - SCMI features may differ across firmware versions,
  - SCMI may abstract the hardware in a different way, requiring changes
    in (possibly existing) DT bindings and drivers to support the same
    hardware with and without SCMI:
      - E.g. the number of SCMI clocks inputs to a hardware block may
	differ from the actual hardware,
      - E.g. hardware clock inputs may be abstracted as SCMI power
	domains (or vice versa), like on Qualcomm SA8255P[2].
    Experience has taught that not describing the hardware in DT may
    lead to major issues later.
  - SCMI does not support the concept of a clock domain, so existing
    drivers can no longer rely on Runtime PM, but need to be changed to
    manage functional clocks explicitly,
  - U-Boot IPL (Initial Program Loader) needs a proper hardware
    description in DT, not using SCMI.

This list deliberately ignores ID instability and the need for SCMI
quirks during development of the SCMI firmware.  While upstream Linux
must only support sufficiently mature firmware versions, vendor trees
(e.g. renesas-lts) may still want to support development firmware
versions.

During last OSSJ/LPC, Marek Vasut pondered if we could keep our own ID
lists stable, and perform a mapping to the IDs used by the actual SCMI
implementation running on the system.  This was also briefly discussed
at LPC[3].  After some refining of the initial idea, this series takes a
slightly different approach, by:
  1. Describing the actual hardware components in DT, plus a minimum
     SCMI glue,
  2. Mapping DT hardware descriptions to SCMI-backed objects and
     abstractions (or replacements, in case they are unusable,
     unavailable, or too different), in Linux drivers, based on the
     detected firmware version.

This has the following advantages:
  1. The DT ABI is stable,
  2. DT bindings and drivers for existing hardware blocks do not need to
     be modified,
  2. Current and future firmware can be handled in driver code,
  3. U-Boot IPL can use almost the same DTS; it just needs stripping of
     SCMI-related nodes and properties.
  4. If ever needed, the Clock Pulse Generator (CPG) and Module
     Controller (MDLC) drivers can be extended to program the hardware
     directly if SCMI is not present,

This series depends on "[PATCH v2 0/6] R-Car X5H CPG/MDLC support"[4],
and consists of four parts:
  1. Patches 1-4 add new interfaces needed by the remapping support,
  2. Patches 5-6 update the DT bindings for the R-Car X5H Clock Pulse
     Generator (CPG) and Module Controller (MDLC) blocks,
  3. Patches 7-8 add SCMI remapping support to the R-Car X5H CPG and
     MDLC drivers,
  4. Patches 9-10 enables more SCMI protocols on R-Car X5H Ironhide, and
     link the CPG and MDLC blocks to their SCMI provider.

Changes compared to v1[5]:
  - Drop SCMI quirks and SCMI mapping tables,
  - Move CPG/MDLC DT bindings and minimal base drivers to a separate
    series,
  - Add that SCMI may provide different abstractions,
  - Add missing asterisk to blank kerneldoc line,
  - Let scmi_get_base_info() return -EPROBE_DEFER or -EOPNOTSUPP instead
    of -ENOENT, and propagate these errors in callers,
  - Fall back to the default support when SCMI support or firmware is
    not available, or when the detected SCMI firmware version is not
    supported by the driver,
  - Improve error message on scmi_get_base_info() failure,
  - Check if SCMI firmware node is available,
  - Use reverse xmas ordering in r8a78000_cpg_probe(),
  - Replace the scmi_*_np members of struct r8a78000_*_priv by local
    variables in the probe functions, and pass them to the fill_*_map()
    functions,
  - Join split short lines,
  - Move check for supported firmware version up,
  - Fix DT misindentations,
  - Add scmi_clk node, as it is no longer added in earlier commits.

Note that in reponse of feedback on v1, I did try to use SCMI IDs in DT,
and handle most issues in Linux SCMI drivers and SCMI quirks[6].  While
the result worked, it did not solve everything in the issues list above.

Note that this series does not include actual SCMI quirks and CPG/MDLC
mapping tables, as the SCMI firmware for R-Car X5H is still under
development.

For testing, I have pushed this series plus additional work to[7].

Thanks for your comments!

[1] Documentation/devicetree/bindings/firmware/arm,scmi.yaml
[2] "[PATCH net-next v11 1/7] dt-bindings: phy: document the serdes PHY on sa8255p"
    https://lore.kernel.org/20260629-qcom-sa8255p-emac-v11-1-1b7fb95b51f9@oss.qualcomm.com
[3] "Firmware ABI stability" at Linux Plumbers Conference 2025
    https://lpc.events/event/19/contributions/2153/
[4] "[PATCH v2 0/6] R-Car X5H CPG/MDLC support"
    https://lore.kernel.org/cover.1783505142.git.geert+renesas@glider.be
[5] "[PATCH/RFC 00/14] R-Car X5H Ironhide SCMI CPG/MDLC remapping"
    https://lore.kernel.org/cover.1776793163.git.geert+renesas@glider.be
[6] "[PATCH/RFC 0/9] R-Car X5H Ironhide pure SCMI proof-of-concept"
    https://lore.kernel.org/cover.1781171705.git.geert+renesas@glider.be/
[7] topic/rcar-x5h-ironhide-scmi-cpg-mdlc-remapping-v2 branch of
    https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git

Geert Uytterhoeven (10):
  firmware: arm_scmi: Add scmi_get_base_info()
  of: property: fw_devlink: Add support for firmware
  pmdomain: Make genpd_get_from_provider() public
  reset: Add reset_controller_get_provider()
  dt-bindings: clock: renesas,r8a78000-cpg: Add firmware property
  dt-bindings: power: renesas,r8a78000-mdlc: Add firmware property
  clk: renesas: r8a78000: Add SCMI remapping support
  pmdomain: renesas: r8a78000: Add SCMI remapping support
  arm64: dts: renesas: ironhide: Enable SCMI devpd, sys, clock, and
    reset
  arm64: dts: renesas: ironhide: Add CPG/MDLC firmware properties

 .../bindings/clock/renesas,r8a78000-cpg.yaml  |   7 +
 .../bindings/power/renesas,r8a78000-mdlc.yaml |   7 +
 .../boot/dts/renesas/r8a78000-ironhide.dts    | 135 ++++++++
 drivers/clk/renesas/r8a78000-cpg.c            | 161 ++++++++-
 drivers/firmware/arm_scmi/driver.c            |  33 ++
 drivers/of/property.c                         |   2 +
 drivers/pmdomain/core.c                       |   4 +-
 drivers/pmdomain/renesas/r8a78000-mdlc.c      | 311 +++++++++++++++++-
 drivers/reset/core.c                          |  11 +
 include/linux/pm_domain.h                     |   7 +
 include/linux/reset-controller.h              |   6 +
 include/linux/scmi_protocol.h                 |   8 +
 12 files changed, 665 insertions(+), 27 deletions(-)

-- 
2.43.0

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

