Return-Path: <linux-renesas-soc+bounces-34881-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JWjxAsF2TmoUNQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34881-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Jul 2026 18:11:45 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 578007287D8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Jul 2026 18:11:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=ORFkF97m;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b="X/ZugQDC";
	dmarc=pass (policy=reject) header.from=mailbox.org;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34881-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34881-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E90113031815
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Jul 2026 15:42:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B31037FF54;
	Wed,  8 Jul 2026 15:42:29 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20C8421D00A;
	Wed,  8 Jul 2026 15:42:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783525349; cv=none; b=nqWE4/OcV6Nn54bUacMBYvwdPPvUZ1RXfiyVrFqSmz6GGLCxT6lJPFWGI2uIrP9rGyx8bsl8roAeJkoj9rA7dz1Lh7JtV+mUIv2dOqI+jtzGYjRf1nDrQZDZ7XfePm1gIOiTGeT6EtCGJvMKNHxHPf/ZtZR1eomEu3GjAFpswH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783525349; c=relaxed/simple;
	bh=B7N57zJe8RtS9hxqIwHqhlyVzrbTJ2AFcGRv+fse1zg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JCGJ65hboQ25YOyhNmyALcRFUki0VTW/VPk5cjKizKPWSTHnhiLZl/LvPjmOURK6NqG+rOhZxfOkmPC2yNnSlfWUTJwC5iacLbf5HN9aZg/OIpOimSeMKWRDC1pyDYZF8grTy1TKeoeMIBrHA/5fgqr77EZK3bUtGQ9ylGa/YMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=ORFkF97m; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=X/ZugQDC; arc=none smtp.client-ip=80.241.56.151
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4gwMmH4qsqz8v4f;
	Wed, 08 Jul 2026 17:42:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783525343;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8WmHiOxhuGs7I/lBwa1gi/h+UWk+IKvtIxLv+PtiRgs=;
	b=ORFkF97mb77ztreAhZtYH0BKh9wJUNo+1KMGOOX/E3VZUR0UTqFffeWIQUIZPHeh5ZuL1I
	Tag5H1Q0VOzXJPaPTnSuEjYR0ChVU3dr68sKHk+Sv0w72xRNF9LXeYonc1tZ1z2GGxeSNl
	fFemno5RM5Zbut9zC/bXawSEske4z2fjb9eoOxdaYIjsHXRzoI00lS85ADeJdRxGpkE8Um
	9bwmlKdD1O1eYpUetBScwAK1HIGx3KTWHbrilTbWAW89MbNB6O9/WRbMnUiGNI51sgXZlC
	cbiQNH0xMsYkOEFb15JNQ8aT1pCxIfzzZKUZaJkau3eQ55kgDA2YDd9GF8NKqQ==
Message-ID: <3c76a2d4-a8b8-493a-9196-c5cc72958118@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783525341;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8WmHiOxhuGs7I/lBwa1gi/h+UWk+IKvtIxLv+PtiRgs=;
	b=X/ZugQDCEeNwelhI23TvYkqOuiEtjuS57oqNpPnJAlIATvvOJVdP1LtjfWdwJM/IN46MtG
	QH+R0UeZTQrzAjhnTrCyOKpTRfi7MomUgXpiJe59FfyiDlNzabK3rTTTODIEj1HvihSDed
	OYdr0Yztn5Tz9IJDqZvay+CwGY5F21w2WxTb7YuV92lmQLl/OTY51cohbuXtmpmD+Q2DCr
	IUeRB3u8HhC1n7GuTboEVbroXkKx2EZu7tUQh8WXljcXBtJp9h6GwXEgcYQpklXbRrXpV1
	Oa38KYHZO8AIOpFsYvq9TomeLMlVTNXAfETU6G+swujSAVwj9rp/hTxSUscTbA==
Date: Wed, 8 Jul 2026 17:42:12 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2 00/10] R-Car X5H Ironhide CPG/MDLC SCMI remapping
 support
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Sudeep Holla <sudeep.holla@kernel.org>,
 Cristian Marussi <cristian.marussi@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
 Ulf Hansson <ulfh@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio
 <konrad.dybcio@oss.qualcomm.com>, Kevin Hilman <khilman@baylibre.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <cover.1783505329.git.geert+renesas@glider.be>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <cover.1783505329.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 36fc94fa54e6fd61da0
X-MBO-RS-META: mwanribk4pntqc6eesjb87bhecqsce6i
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34881-lists,linux-renesas-soc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:geert+renesas@glider.be,m:sudeep.holla@kernel.org,m:cristian.marussi@arm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:saravanak@kernel.org,m:ulfh@kernel.org,m:rafael@kernel.org,m:p.zabel@pengutronix.de,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:bartosz.golaszewski@oss.qualcomm.com,m:vkoul@kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:khilman@baylibre.com,m:florian.fainelli@broadcom.com,m:wsa+renesas@sang-engineering.com,m:marek.vasut+renesas@mailbox.org,m:kuninori.morimoto.gx@renesas.com,m:arm-scmi@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:geert@glider.be,m:krzk@kernel.org,m:conor@kernel.org,m:wsa@sang-engineering.com,m:marek.vasut@mailbox.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[mailbox.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,lpc.events:url,mailbox.org:from_mime,mailbox.org:dkim,mailbox.org:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 578007287D8

On 7/8/26 12:16 PM, Geert Uytterhoeven wrote:
> 	Hi all,
> 
> TL;DR:
> 
>      Describe hardware in DT, and perform the mapping to SCMI in Linux.
> 
> The Renesas R-Car X5H-based Ironhide board is the first Renesas
> SoC/board combination that implements the ARM System Control and
> Management Interface (SCMI).
> 
> This means Linux can no longer perform various system operations (e.g.
> clock, power domain, and reset control) by accessing the hardware
> directly.  Instead, these operations are abstracted according to various
> SCMI sub-protocols, and Linux has to send messages to an SCMI-compliant
> firmware running on a System Control Processor (SCP).
> More specifically, the R-Car X5H SCP FW SCMI controls access to:
>    1. Core clocks and module clocks,
>    2. Module resets,
>    3. Power domains,
>    4. System power.
> The latter is not relevant for this discussion.
> 
> Using SCMI also has an impact on the board DTS: besides the addition of
> a firmware/scmi node with protocol-specific subnodes, devices using
> SCMI-abstracted system resources now have to refer to these resources
> using resource specifiers containing phandles to the SCMI protocol
> subnodes, and firmware-specific object IDs[1].
> 
> Unfortunately we encountered several issues with this:
>    - The clock, reset, and power domain IDs are not stable by design,
>      causing DT incompatibilities.
>      SCMI requires that the ID space exposed to an agent (i.e. Linux)
>      starts at zero and is contiguous.  Hence any change in system
>      partitioning (Application CPU core vs. Realtime CPU core,
>      virtualization, ...) may mean a renumbering of all SCMI IDs,
>      implying a massive change to the DT.
>    - There may be different SCP firmware lineages, e.g. proprietary and
>      certified variants, and FLOSS variants,
>    - SCMI features may differ across firmware versions,
>    - SCMI may abstract the hardware in a different way, requiring changes
>      in (possibly existing) DT bindings and drivers to support the same
>      hardware with and without SCMI:
>        - E.g. the number of SCMI clocks inputs to a hardware block may
> 	differ from the actual hardware,
>        - E.g. hardware clock inputs may be abstracted as SCMI power
> 	domains (or vice versa), like on Qualcomm SA8255P[2].
>      Experience has taught that not describing the hardware in DT may
>      lead to major issues later.
>    - SCMI does not support the concept of a clock domain, so existing
>      drivers can no longer rely on Runtime PM, but need to be changed to
>      manage functional clocks explicitly,
>    - U-Boot IPL (Initial Program Loader) needs a proper hardware
>      description in DT, not using SCMI.
> 
> This list deliberately ignores ID instability and the need for SCMI
> quirks during development of the SCMI firmware.  While upstream Linux
> must only support sufficiently mature firmware versions, vendor trees
> (e.g. renesas-lts) may still want to support development firmware
> versions.
> 
> During last OSSJ/LPC, Marek Vasut pondered if we could keep our own ID
> lists stable, and perform a mapping to the IDs used by the actual SCMI
> implementation running on the system.  This was also briefly discussed
> at LPC[3].  After some refining of the initial idea, this series takes a
> slightly different approach, by:
>    1. Describing the actual hardware components in DT, plus a minimum
>       SCMI glue,
>    2. Mapping DT hardware descriptions to SCMI-backed objects and
>       abstractions (or replacements, in case they are unusable,
>       unavailable, or too different), in Linux drivers, based on the
>       detected firmware version.
> 
> This has the following advantages:
>    1. The DT ABI is stable,
>    2. DT bindings and drivers for existing hardware blocks do not need to
>       be modified,
>    2. Current and future firmware can be handled in driver code,
>    3. U-Boot IPL can use almost the same DTS; it just needs stripping of
>       SCMI-related nodes and properties.
>    4. If ever needed, the Clock Pulse Generator (CPG) and Module
>       Controller (MDLC) drivers can be extended to program the hardware
>       directly if SCMI is not present,
> 
> This series depends on "[PATCH v2 0/6] R-Car X5H CPG/MDLC support"[4],
> and consists of four parts:
>    1. Patches 1-4 add new interfaces needed by the remapping support,
>    2. Patches 5-6 update the DT bindings for the R-Car X5H Clock Pulse
>       Generator (CPG) and Module Controller (MDLC) blocks,
>    3. Patches 7-8 add SCMI remapping support to the R-Car X5H CPG and
>       MDLC drivers,
>    4. Patches 9-10 enables more SCMI protocols on R-Car X5H Ironhide, and
>       link the CPG and MDLC blocks to their SCMI provider.
> 
> Changes compared to v1[5]:
>    - Drop SCMI quirks and SCMI mapping tables,
>    - Move CPG/MDLC DT bindings and minimal base drivers to a separate
>      series,
>    - Add that SCMI may provide different abstractions,
>    - Add missing asterisk to blank kerneldoc line,
>    - Let scmi_get_base_info() return -EPROBE_DEFER or -EOPNOTSUPP instead
>      of -ENOENT, and propagate these errors in callers,
>    - Fall back to the default support when SCMI support or firmware is
>      not available, or when the detected SCMI firmware version is not
>      supported by the driver,
>    - Improve error message on scmi_get_base_info() failure,
>    - Check if SCMI firmware node is available,
>    - Use reverse xmas ordering in r8a78000_cpg_probe(),
>    - Replace the scmi_*_np members of struct r8a78000_*_priv by local
>      variables in the probe functions, and pass them to the fill_*_map()
>      functions,
>    - Join split short lines,
>    - Move check for supported firmware version up,
>    - Fix DT misindentations,
>    - Add scmi_clk node, as it is no longer added in earlier commits.
> 
> Note that in reponse of feedback on v1, I did try to use SCMI IDs in DT,
> and handle most issues in Linux SCMI drivers and SCMI quirks[6].  While
> the result worked, it did not solve everything in the issues list above.
> 
> Note that this series does not include actual SCMI quirks and CPG/MDLC
> mapping tables, as the SCMI firmware for R-Car X5H is still under
> development.
> 
> For testing, I have pushed this series plus additional work to[7].
> 
> Thanks for your comments!
> 
> [1] Documentation/devicetree/bindings/firmware/arm,scmi.yaml
> [2] "[PATCH net-next v11 1/7] dt-bindings: phy: document the serdes PHY on sa8255p"
>      https://lore.kernel.org/20260629-qcom-sa8255p-emac-v11-1-1b7fb95b51f9@oss.qualcomm.com
> [3] "Firmware ABI stability" at Linux Plumbers Conference 2025
>      https://lpc.events/event/19/contributions/2153/
> [4] "[PATCH v2 0/6] R-Car X5H CPG/MDLC support"
>      https://lore.kernel.org/cover.1783505142.git.geert+renesas@glider.be
> [5] "[PATCH/RFC 00/14] R-Car X5H Ironhide SCMI CPG/MDLC remapping"
>      https://lore.kernel.org/cover.1776793163.git.geert+renesas@glider.be
> [6] "[PATCH/RFC 0/9] R-Car X5H Ironhide pure SCMI proof-of-concept"
>      https://lore.kernel.org/cover.1781171705.git.geert+renesas@glider.be/
> [7] topic/rcar-x5h-ironhide-scmi-cpg-mdlc-remapping-v2 branch of
>      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git
> 
> Geert Uytterhoeven (10):
>    firmware: arm_scmi: Add scmi_get_base_info()
>    of: property: fw_devlink: Add support for firmware
>    pmdomain: Make genpd_get_from_provider() public
>    reset: Add reset_controller_get_provider()
>    dt-bindings: clock: renesas,r8a78000-cpg: Add firmware property
>    dt-bindings: power: renesas,r8a78000-mdlc: Add firmware property
>    clk: renesas: r8a78000: Add SCMI remapping support
>    pmdomain: renesas: r8a78000: Add SCMI remapping support
>    arm64: dts: renesas: ironhide: Enable SCMI devpd, sys, clock, and
>      reset
>    arm64: dts: renesas: ironhide: Add CPG/MDLC firmware properties
I think 10/10 did not make it either to my inbox or lore.k.o , but the 
remaining 9 patches look good. Thank you !

