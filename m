Return-Path: <linux-renesas-soc+bounces-33879-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CkHvHNmyKmpqvQMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33879-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Jun 2026 15:06:33 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D4D1E6722FF
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Jun 2026 15:06:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33879-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33879-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1D94D309C9D1
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Jun 2026 13:03:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 086C2402B99;
	Thu, 11 Jun 2026 13:02:45 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE6CF400E18;
	Thu, 11 Jun 2026 13:02:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781182964; cv=none; b=E+nk9pB7zyVgs+w5QGNkaJ3obLqE5/bdf5CNm+Pc7KreTAcDjjxU4B91IxSmkx16ZGHsuOa7WPiQa6G8EDFI8JuWRVBFRaeXAA6TCBKjpNc4Q0HJqbA9YUpe0RHcb36fZ6JK3X8HT7ztfz62DenN9dZ4UKRLz2fIDJonRc5a2pU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781182964; c=relaxed/simple;
	bh=bTMn1lXLF7MPlr9ABR3fwfDJcpm1iEASOCMJWI2Zay8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oeHe5obdjZde6jmgoRPNCKhyH/Lor2fTx30/kI0LpEKujszMO3K2QXIhzNEhBsD1pOo9evUoWF7+Ln5j1TWTsWUOh6Px7N/el0K5IYYGVC7fmnvHBFbRVaaKApeJFlcmiyfDjTVSXFiYZFenHvHJ5m9pCjKKlEwCv0z3bDIfJmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 461651F00899;
	Thu, 11 Jun 2026 13:02:37 +0000 (UTC)
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
Subject: [PATCH/RFC 4/9] firmware: arm_scmi: Add a flag for power-management clocks
Date: Thu, 11 Jun 2026 15:02:08 +0200
Message-ID: <9f632656c2f8311192efd23761307a1fb671e6c2.1781171705.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1781171705.git.geert+renesas@glider.be>
References: <cover.1781171705.git.geert+renesas@glider.be>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[glider.be];
	TAGGED_FROM(0.00)[bounces-33879-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[geert@glider.be,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:sudeep.holla@kernel.org,m:cristian.marussi@arm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:ulfh@kernel.org,m:arm-scmi@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:geert+renesas@glider.be,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,glider.be:email,glider.be:mid,glider.be:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D4D1E6722FF

Power management of on-SoC modules is typically handled through two
methods: module power control and module clock gating.  The former is
exposed as an SCMI power domain, the latter as an SCMI clock.

Add a flag to indicate if a clock is intended for power-management of a
hardware module.

As the SCMI clock protocol does not support advertizing power-management
clocks yet, this flag can only be set by a quirk.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 include/linux/scmi_protocol.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
index 1d55374bc8cdcc72..c98e0add25f0c6c6 100644
--- a/include/linux/scmi_protocol.h
+++ b/include/linux/scmi_protocol.h
@@ -55,6 +55,7 @@ struct scmi_clock_info {
 	bool rate_ctrl_forbidden;
 	bool parent_ctrl_forbidden;
 	bool extended_config;
+	bool pm_clk;
 	u64 min_rate;
 	u64 max_rate;
 	int num_parents;
-- 
2.43.0


