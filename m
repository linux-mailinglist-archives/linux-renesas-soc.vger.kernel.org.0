Return-Path: <linux-renesas-soc+bounces-28547-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uLtROsa6oWlhwAQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28547-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Feb 2026 16:39:50 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B8B21B9FE6
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Feb 2026 16:39:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 77E88301CA96
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Feb 2026 15:33:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 411C4407561;
	Fri, 27 Feb 2026 15:33:00 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBA0F329C79;
	Fri, 27 Feb 2026 15:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772206380; cv=none; b=OhjPZLTOTIoc906vT2KieWbq85ZEaMLdmkA8x71waYj/1+GK9TRZ9rJRBJ3SHTmZJO+DvY9TC3ltgCWMvqfyaJ8mJ0IqU5v2aR4YXakQfh+57eyCC+mEnxiumKFIa9GbN59sXVC55VBVU/yliGT/U9voDBNWCsJxpn60fuiAhrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772206380; c=relaxed/simple;
	bh=xumQY2GmeX+e+h1qGvPlEkunN1ywqsvRmbzDWfAA7n0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eH6G0ny3RT0lk+d3nw9vV/U4El3dE7dPWtv1jfhBjItcCfepaBl34yX5ymEsoPaP5TV5QylVZttog/Os4ExW0iqrNwUFRUOavlBna6+jXk0ILzYBdwi+AoO2spJPSuOosGamEwSaewbrJDLjXmRkV3M4tQB0mJzq0ZjRfOikia8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B55C7339;
	Fri, 27 Feb 2026 07:32:51 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BB1203F73B;
	Fri, 27 Feb 2026 07:32:51 -0800 (PST)
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
	dan.carpenter@linaro.org,
	geert+renesas@glider.be,
	kuninori.morimoto.gx@renesas.com,
	marek.vasut+renesas@gmail.com,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [PATCH 00/11] SCMI Clock rates discovery rework
Date: Fri, 27 Feb 2026 15:32:14 +0000
Message-ID: <20260227153225.2778358-1-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.64 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[arm.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28547-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_CC(0.00)[arm.com,broadcom.com,gmail.com,linaro.org,foss.st.com,oss.nxp.com,amd.com,glider.be,renesas.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.772];
	FROM_NEQ_ENVFROM(0.00)[cristian.marussi@arm.com,linux-renesas-soc@vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:mid]
X-Rspamd-Queue-Id: 1B8B21B9FE6
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

This is done in patches 1-6.

A further bigger optimization suggested in a past series [1] by Etienne
would be, whenever allowed by the spec, to limit upfront the number of
queries in order to simply retrieve min and max rate, that are indeed the
only rates needed by the CLK SCMI driver.

The approach proposed in [1] was open coding and duplicating some of the
functionalities already provided by SCMI iterators, though.

Patch 7-10 implement such optimization instead by:

 - reworking core SCMI iterators to support bound enumerations
 - use such new bound iterators to perform the minimum number of queries
   in order to ony retrieve min an max rate

As a final result now the rates enumeration triggered by the CLK SCMI
driver, while still allocating for all the existent rates, miminize the
number of SCMI CLK_DESCRIBE_RATE messages needed to obtain min and max.

Finally, patch 11 introduces a new clock protocol operation to be able to
trigger anytime on demand a full enumeration and obtain the full list of
rates when needed, not only min/max: this latter method is really only used
currently by some dowstream SCMI Test driver of mine.

Based on v7.0-rc1. 

Tested on JUNO and an emulated environment.

Any feeback welcome.

Thanks,
Cristian

[1]: https://lore.kernel.org/arm-scmi/aZsX-oplR6fiLBBN@pluto/T/#t
[2]: https://lore.kernel.org/20241203173908.3148794-2-etienne.carriere@foss.st.com
---

Cristian Marussi (11):
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

 drivers/clk/clk-scmi.c                |  48 +----
 drivers/firmware/arm_scmi/clock.c     | 296 ++++++++++++++++++++------
 drivers/firmware/arm_scmi/driver.c    |  73 +++++--
 drivers/firmware/arm_scmi/protocols.h |  13 +-
 include/linux/scmi_protocol.h         |  29 +--
 5 files changed, 314 insertions(+), 145 deletions(-)

-- 
2.53.0


