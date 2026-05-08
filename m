Return-Path: <linux-renesas-soc+bounces-32288-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mD/FIdUC/mlYmAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32288-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 08 May 2026 17:35:49 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 018FA4F8C83
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 08 May 2026 17:35:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8D9843047776
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 May 2026 15:33:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9F6A33F8B7;
	Fri,  8 May 2026 15:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="IqqBuHvI"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BB732F8EB6;
	Fri,  8 May 2026 15:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778254410; cv=none; b=mzAvY1tO4wxV0dOUHu9zo50UkzCZbrdnuYulmTNek7S9WUXBdeRFNvalnIvYIuLaH9jIvTUsA7znRnzLj55ljGStGnj6wCB7X+ZPUfD+bXfbEMOkntUy/R1L3CIRnb+ANSjkKX3wBFoQUc2pvhC3TEte4KDRcDpMCqSCWMOqrak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778254410; c=relaxed/simple;
	bh=RAyfA1a0+zafxdRlyIeQqEZPVfv3656sUTL19grG05Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tzypnbmli6V7ivY7wxFLUsxSegTl8WtnGvJueuheXqynN6nqdmtZ/C0RR+NOkc1F7kdu2ch87Tk4CSM2DoBRVXnU1syFJEbxtqK5qFn1IGFmJgPlGXaJpznVlkCCwN+Iorc7q3sHyI58qZcE+vQowL+24NZkoZteiUtoBvigccw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=IqqBuHvI; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A0DC8359E;
	Fri,  8 May 2026 08:33:22 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 70A453F836;
	Fri,  8 May 2026 08:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778254408; bh=RAyfA1a0+zafxdRlyIeQqEZPVfv3656sUTL19grG05Y=;
	h=From:To:Cc:Subject:Date:From;
	b=IqqBuHvI4b5+qi2n3dGKN8uIazISFHwbiNFDcpQF9KsAUc5e0rXf/LFe/ZFwwFbhB
	 LPaUNOZLqdJMQSPX9uZ2xz6Okcx5mJ4DLMltgwAVRYS3V0JHVP+w+VAloSe3wVzc4Q
	 4fKbwNEwjS171QfPuNUZC9tEQmJAfZlOEZ+zU3eY=
From: Cristian Marussi <cristian.marussi@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: sudeep.holla@arm.com,
	philip.radford@arm.com,
	james.quinlan@broadcom.com,
	f.fainelli@gmail.com,
	vincent.guittot@linaro.org,
	etienne.carriere@foss.st.com,
	peng.fan@oss.nxp.com,
	michal.simek@amd.com,
	geert+renesas@glider.be,
	kuninori.morimoto.gx@renesas.com,
	marek.vasut+renesas@gmail.com,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [PATCH v4 00/15] SCMI Clock rates discovery rework
Date: Fri,  8 May 2026 16:32:45 +0100
Message-ID: <20260508153300.2224715-1-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 018FA4F8C83
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[arm.com,broadcom.com,gmail.com,linaro.org,foss.st.com,oss.nxp.com,amd.com,glider.be,renesas.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-32288-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cristian.marussi@arm.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	NEURAL_HAM(-0.00)[-0.998];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,arm.com:mid,arm.com:dkim]
X-Rspamd-Action: no action

Hi,

it was a known limitation, in the SCMI Clock protocol support, the lack of
dynamic allocation around per-clock rates discovery: fixed size statically
per-clock rates arrays did not scale and was increasingly a waste of memory
(see [1]).

This series aim at solving this in successive steps:

 - simplify and reduce to the minimum possible the rates data info exposed
   to the SCMI driver by scmi_clock_info
 - move away from static fixed allocation of per-clock rates arrays in
   favour of a completely dynamic runtime allocation: just allocate what
   is needed based on the effectively discovered

This is done in patches 2-6.

A further bigger optimization suggested in a past series [2] by Etienne
would be, whenever allowed by the spec, to limit upfront the number of
queries in order to simply retrieve min and max rate, that are indeed the
only rates needed by the CLK SCMI driver.

The approach proposed in [1] was open coding and duplicating some of the
functionalities already provided by SCMI iterators, though.

Patch 7-14 implement such optimization instead by:

 - reworking core SCMI iterators to support bound enumerations
 - use such new bound iterators to perform the minimum number of queries
   in order to only retrieve min an max rate

As a final result now the rates enumeration triggered by the CLK SCMI
driver, while still allocating for all the existent rates, miminize the
number of SCMI CLK_DESCRIBE_RATE messages needed to obtain min and max.

Finally, patch 15 introduces a new clock protocol operation to be able to
trigger anytime on demand a full enumeration and obtain the full list of
rates when needed, not only min/max: this latter method is really only used
currently by some dowstream SCMI Test driver of mine.

Most notably in V3 I had:

 - picked up Geert fixes on V2: these could have been squashed in the
   original series while maintaining proper Geert's authorship but as of
   now I have simply picked them up and changed their order to be near the
   commit they fix

 - dropped the "Harden Clock protocol initialization" patch that caused a
   number of out-of-spec vendor FW to break

Based on v7.1-rc2. 
Tested on ARM/JUNO, RADXA/ROCK5B and an emulated environment.

Any feeback welcome.

Thanks,
Cristian

[1]: https://lore.kernel.org/arm-scmi/aZsX-oplR6fiLBBN@pluto/T/#t
[2]: https://lore.kernel.org/20241203173908.3148794-2-etienne.carriere@foss.st.com
---
v3 -->v4
 - Rebased on v7.1-rc2
 - Removed unused info.rate_discrete [Geert]
 - Made dev_dbg() more meaningful by printing tot_rates [Geert]
 - Fixed build bisectability by renaming properly to iter_response_bound_cleanup()

v2 --> v3
 - Rebased on v7.1-rc1
 - Picked up Geert fixes
 - Dropped patch breaking out-of-spec FW (Harden Clock Protocol init)
 - Collected Reviewed tags

v1 --> v2
 - Rebased on v7.0-rc3
 - Added a Fixes patch to rectify bug in rounding algo
 - Removed useless parenthesis in macros
 - Collected a few Reviewed-by tags
 - Clarified commit message


Cristian Marussi (12):
  clk: scmi: Fix clock rate rounding
  firmware: arm_scmi: Add clock determine_rate operation
  clk: scmi: Use new determine_rate clock operation
  firmware: arm_scmi: Simplify clock rates exposed interface
  clk: scmi: Use new simplified per-clock rate properties
  firmware: arm_scmi: Drop unused clock rate interfaces
  firmware: arm_scmi: Make clock rates allocation dynamic
  firmware: arm_scmi: Harden clock parents discovery
  firmware: arm_scmi: Refactor iterators internal allocation
  firmware: arm_scmi: Add bound iterators support
  firmware: arm_scmi: Use bound iterators to minimize discovered rates
  firmware: arm_scmi: Introduce all_rates_get clock operation

Geert Uytterhoeven (3):
  firmware: arm_scmi: Fix bound iterators returning too many items
  firmware: arm_scmi: Use proper iter_response_bound_cleanup() name
  firmware: arm_scmi: Fix OOB in scmi_clock_describe_rates_get_lazy()

 drivers/clk/clk-scmi.c                |  48 +---
 drivers/firmware/arm_scmi/clock.c     | 301 ++++++++++++++++++++------
 drivers/firmware/arm_scmi/driver.c    |  80 +++++--
 drivers/firmware/arm_scmi/protocols.h |  13 +-
 include/linux/scmi_protocol.h         |  30 +--
 5 files changed, 324 insertions(+), 148 deletions(-)

-- 
2.53.0


