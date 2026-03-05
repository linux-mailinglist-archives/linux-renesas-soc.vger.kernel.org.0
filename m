Return-Path: <linux-renesas-soc+bounces-28866-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iBQZImpXqWkh5wAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28866-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 05 Mar 2026 11:14:02 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FA6D20F812
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 05 Mar 2026 11:14:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E9CBC300F50A
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Mar 2026 10:13:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD0B837B017;
	Thu,  5 Mar 2026 10:13:19 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 575F5375F96
	for <linux-renesas-soc@vger.kernel.org>; Thu,  5 Mar 2026 10:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772705599; cv=none; b=VDf6HR/2+fUBzkxYJM4ixzHOfk0enI191cdUPRq8fq4G4N03zZyp0PVDErbyg0c/j6iYTtjF4q3Nebo2oj2++w1GipZylgzn4T2i2UumPMETbqS6nk+Ho2s7KKl4FYQUWRg0nFFPhzxwnhJsKN7xI9EwTzwPqk3H44llqiH9tRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772705599; c=relaxed/simple;
	bh=I5jm2vbvlqMyoZLw8umeWGzTjvrs7DhcB9VwEd9/xdY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=t1lrJiOBrBl6JqKzJU+4Q+kBOEEU3rjwpE3RmjJvryhT4vZoxiltDEyb2dyt6Dsxvn62yv2uTZdEEHrNc3diYhKJoVsMEYbriGTU+jI7Od4tXCnV+4OrCpQGoLmtYY6LWpLUexOY1otiyINnbBkWZ9N8OSOFvFYLkJ3fKMg+Yx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B69A2C116C6;
	Thu,  5 Mar 2026 10:13:16 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Biju Das <biju.das.jz@bp.renesas.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] drm: renesas: rz-du: mipi_dsi: Convert to FIELD_MODIFY()
Date: Thu,  5 Mar 2026 11:13:14 +0100
Message-ID: <da7709d50894d422442401e6e3ff4c4715a33fa5.1772705564.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 0FA6D20F812
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28866-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[bp.renesas.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch];
	DMARC_NA(0.00)[glider.be];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@glider.be,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.906];
	RCPT_COUNT_SEVEN(0.00)[9];
	R_DKIM_NA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,glider.be:mid,glider.be:email]
X-Rspamd-Action: no action

Use the FIELD_MODIFY() helper instead of open-coding the same operation.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
No changes in generated code.
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index 29f2b7d24fe59717..a87a301326c7aa43 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -808,8 +808,7 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
 	 * commands payload not being saved to memory.
 	 */
 	dsisetr = rzg2l_mipi_dsi_link_read(dsi, DSISETR);
-	dsisetr &= ~DSISETR_MRPSZ;
-	dsisetr |= FIELD_PREP(DSISETR_MRPSZ, RZG2L_DCS_BUF_SIZE);
+	FIELD_MODIFY(DSISETR_MRPSZ, &dsisetr, RZG2L_DCS_BUF_SIZE);
 	rzg2l_mipi_dsi_link_write(dsi, DSISETR, dsisetr);
 
 	return 0;
-- 
2.43.0


