Return-Path: <linux-renesas-soc+bounces-28911-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eHKQB53uqWkBIQEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28911-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 05 Mar 2026 21:59:09 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 681A42185A0
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 05 Mar 2026 21:59:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ABC38307E843
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Mar 2026 20:59:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B146347FED;
	Thu,  5 Mar 2026 20:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="w+Fwnm7c";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="V8cmIE+8"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D117F2F1FE4;
	Thu,  5 Mar 2026 20:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772744345; cv=none; b=SAdxnqLV/Otej3mGW2+2S3EO81uTrn8CaQE3GsNILN4hNCVMPz/e8o/A5UgtJ642U14SOPKGUtyuX3DAHn/xDJhmUfvG3Wg5X5kubrMZZ5CMZ8cGMP3bd8Mp5ardI3c18CF5fWgDNxRK1spjpZClEj2VDPu6AWHHTG37J+nSKYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772744345; c=relaxed/simple;
	bh=jPBdXMqfUo7wwEIj2HJo9F19V8ubUhRdIXmXwoAiyZk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bjE6jCws1vfWLa2J1EtPUaf3vpCQaxwscWm7y8mtZ6UlA3l2hwukGYW8NmZERcH/K/f11bVNkeNnQmOly7qcCkPl0NnV9hjGk8Th+NmsFIOT18S/eIZpRWntIKnbrzz0mN1fPbB1lCffNuiytgUfmac5+edUZmNt61xBZHu0LIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=w+Fwnm7c; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=V8cmIE+8; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4fRhjC4z1Mz9tpn;
	Thu,  5 Mar 2026 21:58:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1772744335;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=GyEq1uEoXZyZP4GaI0/iSVZpkJoA/M6saV77VFx5CQ8=;
	b=w+Fwnm7c24w57/Q4ryyq7ifG3FvrjPaiS2hVmMzaEdL2aQPtUdI7PjUvEVjXR/CK4NE/lv
	vRgGTQQn6BZFYhSQL1Z5DgDHZBnXlGCbvhdgnEbYnUD0FQnAzj9gRjebmkuT0xW9MWvoZF
	Adl93Fl+vjEgdZTEbpZWeagSLNgFNCAj+2zXC+iksDOoJiV4dRDpYyeBtvWoJIvgxGkt+U
	PnJ+GbRovqRoPamKOscnmCuKF1M+jS0Cnyrn2bKqfl5SLlraXH1kcXPLO7KQ3lm1QfWpq1
	gSjICAcUoaORXh1KEd4V7ASMWLIdIzzq6/BKNZlyuPY50rhEZKVD/qJLInH+5w==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1772744334;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=GyEq1uEoXZyZP4GaI0/iSVZpkJoA/M6saV77VFx5CQ8=;
	b=V8cmIE+8z3iLHeLmaFrOPA9uUN/iO2VASNI24vgU08tnEeAsetQ27NoIzScNmRJ3XwlGPF
	oIsnE39PfWTI5Os1vfPu+R5xjd2f+4m4fittJaAzyOIqe0hZG5nf+zRJM2768Uzt840zYU
	jHxvwiWmtodMR0F7+p1m2hyiS3+w2BefduItjz9HKJT0TPNcCNDuKs3KPSIMf1GQ/OusBv
	woKG0drBW1/iAsCtG1lkLvUSh8W7FzNYpDZ83dHwEYlm0EljDwecuZvBy5dJfYAxk1eqcQ
	ngWBIZuMGx48MTg5ajYJ+9C7J3Zc+o+TMYvxc0FVUfGXuZhS1D5Dzwgg8nqbOA==
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	David Airlie <airlied@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2] drm: of: Fix drm_of_get_data_lanes_count_ep() return value documentation
Date: Thu,  5 Mar 2026 21:58:15 +0100
Message-ID: <20260305205840.95978-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: zkedbg6co371x7ef5sfns7p3bkmde69j
X-MBO-RS-ID: 6718394f5440abbd735
X-Rspamd-Queue-Id: 681A42185A0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[mailbox.org,glider.be,gmail.com,linux.intel.com,kernel.org,ffwll.ch,suse.de,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28911-lists,linux-renesas-soc=lfdr.de,renesas];
	DKIM_TRACE(0.00)[mailbox.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,ffwll.ch:email,suse.de:email,glider.be:email,lists.freedesktop.org:email,mailbox.org:dkim,mailbox.org:email,mailbox.org:mid,intel.com:email]
X-Rspamd-Action: no action

Update drm_of_get_data_lanes_count_ep() return value documentation
to match the drm_of_get_data_lanes_count() return value documentation.
The drm_of_get_data_lanes_count_ep() is only a wrapper around the
drm_of_get_data_lanes_count() and therefore returns the same error
codes.

Simplify the return code description of drm_of_get_data_lanes_count()
and drm_of_get_data_lanes_count_ep() to -ENODATA and -EINVAL.

Fixes: fc801750b197 ("drm: of: Add drm_of_get_data_lanes_count and drm_of_get_data_lanes_ep")
Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: David Airlie <airlied@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
V2: Simplify the return code description of drm_of_get_data_lanes_count()
    and drm_of_get_data_lanes_count_ep() to -ENODATA and -EINVAL.
---
 drivers/gpu/drm/drm_of.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_of.c b/drivers/gpu/drm/drm_of.c
index 4f65ce729a473..e99645103b23d 100644
--- a/drivers/gpu/drm/drm_of.c
+++ b/drivers/gpu/drm/drm_of.c
@@ -507,8 +507,8 @@ EXPORT_SYMBOL_GPL(drm_of_lvds_get_data_mapping);
  *
  * Return:
  * * min..max - positive integer count of "data-lanes" elements
- * * -ve - the "data-lanes" property is missing or invalid
- * * -EINVAL - the "data-lanes" property is unsupported
+ * * -ENODATA - the property does not have a value.
+ * * -EINVAL - the "data-lanes" property is missing or invalid
  */
 int drm_of_get_data_lanes_count(const struct device_node *endpoint,
 				const unsigned int min, const unsigned int max)
@@ -539,8 +539,8 @@ EXPORT_SYMBOL_GPL(drm_of_get_data_lanes_count);
  *
  * Return:
  * * min..max - positive integer count of "data-lanes" elements
- * * -EINVAL - the "data-mapping" property is unsupported
- * * -ENODEV - the "data-mapping" property is missing
+ * * -ENODATA - the property does not have a value.
+ * * -EINVAL - the "data-lanes" property is missing or invalid
  */
 int drm_of_get_data_lanes_count_ep(const struct device_node *port,
 				   int port_reg, int reg,
-- 
2.51.0


