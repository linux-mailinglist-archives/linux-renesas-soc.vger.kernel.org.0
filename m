Return-Path: <linux-renesas-soc+bounces-31720-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GO34CwAW8WmDdAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31720-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Apr 2026 22:18:08 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A217148B9FA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Apr 2026 22:18:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DBECA305A5EE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Apr 2026 20:16:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D3D03148DD;
	Tue, 28 Apr 2026 20:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="iSU33CVN"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B0D27404E;
	Tue, 28 Apr 2026 20:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777407393; cv=none; b=OIzyt25hfE0iJkcGNFX35IlRofBJZUqqeTiyfHEQEWrvA1kn3PjgM6LBzgL5J/AuwX5XJXtIdOubQsVY9KBw4qIlwaQlav2aff5HHX9hDWG8AkUHZpXSXeSLChIHt6N170KpR1zjF8eyx9AdgOYkqHXk7Nt4pz6QSMw5deVHZ58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777407393; c=relaxed/simple;
	bh=uTKbKl30bgDu2zqJF05DsLcaVd61v3Wew2eLkLzCPkM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZxdshuFK65nF72Zt6XRzh/Q1KIxPMiCEOv6B2R/EANcpZNrqa1IgE4/S+3XOBvBR29IPctetaWa9hP2FWfUqfOm0IF7IGwaAqnFs5TZ5B3XmjnankQv/sEXpWkITXzF0dB5DFBMRZXVK3MYNXDBT8wIQyhQgnJfUh3bBn43VMPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=iSU33CVN; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9AC3C1C01;
	Tue, 28 Apr 2026 13:16:24 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1FE423F763;
	Tue, 28 Apr 2026 13:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777407390; bh=uTKbKl30bgDu2zqJF05DsLcaVd61v3Wew2eLkLzCPkM=;
	h=From:To:Cc:Subject:Date:From;
	b=iSU33CVNona6WtvoAAbVTfZRptHIEUnlrnZLUWFWlEAhFAv+IUHcGFtDgAVmVk/r/
	 Q4BF+GrxQNKJvhIt1yAuTLDlTtN3GRStQvMh8DZDuT9HEERKNoMrwViePFiAg9yl/H
	 gIpWEVqwg7OevKs4WycGRMESLApqu6E/uatmFj30=
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
Subject: [PATCH v3 00/15] SCMI Clock rates discovery rework
Date: Tue, 28 Apr 2026 21:15:07 +0100
Message-ID: <20260428201522.903875-1-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: A217148B9FA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[arm.com,broadcom.com,gmail.com,linaro.org,foss.st.com,oss.nxp.com,amd.com,glider.be,renesas.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-31720-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cristian.marussi@arm.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	NEURAL_HAM(-0.00)[-0.989];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,arm.com:dkim,arm.com:mid]

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

Most notably in this V3 I had:

 - picked up Geert fixes on V2: these could have been squashed in the
   original series while maintaining proper Geert's authorship but as of
   now I have simply picked them up and changed their order to be near the
   commit they fix

 - dropped the "Harden Clock protocol initialization" patch that caused a
   number of out-of-spec vendor FW to break

Based on v7.1-rc1. 
Tested on ARM/JUNO, RADXA/ROCK5B and an emulated environment.

Any feeback welcome.

Thanks,
Cristian

[1]: https://lore.kernel.org/arm-scmi/aZsX-oplR6fiLBBN@pluto/T/#t
[2]: https://lore.kernel.org/20241203173908.3148794-2-etienne.carriere@foss.st.com
---
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
 include/linux/scmi_protocol.h         |  29 ++-
 5 files changed, 324 insertions(+), 147 deletions(-)

-- 
2.53.0


