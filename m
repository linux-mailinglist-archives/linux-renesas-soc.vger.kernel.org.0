Return-Path: <linux-renesas-soc+bounces-29699-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +ImeJf/iuWmnPAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29699-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 00:25:51 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 04C8F2B4516
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 00:25:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8BC0930C8A20
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 23:19:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 266FC29BDB5;
	Tue, 17 Mar 2026 23:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="OwrK27ZH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EDC618872A
	for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Mar 2026 23:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773789576; cv=none; b=jVHjAvEGGxcxb7+I1aWrSuajWE6dEBOyGIuQxcS4xEU2DhnRf7p4gKwXNSwcD1j5sjSflZt1RavSqfW8/uFhfqYwCeUfFssWRcc4vj/VXI76dIPzMzju+8gIpNxkpWof4f50MQxvcqRFbrRBgybeEKzPZyUj1d3tqGl9efbKQwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773789576; c=relaxed/simple;
	bh=DrHNjKCY83c3T2yOBShpNx5lHPWPMdQOlezrNGqFKY4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BLY8EB/bQVN/3gHpyYSqBj1mVFs2UPDP8Ij7WaqYSFIS5smoc3hnc+RsBIdAMBGgMB5DoIXwaY/aGswCM7HjIsOvRLq8XsxVa4MmmJZZPzAwjs1myZMhgBz0a6DE1ipEg9sm2n6dN/cvc3qfQEzu57N7Q/sCo5h3v5pq3JiYWqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=OwrK27ZH; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 01A9F986;
	Wed, 18 Mar 2026 00:18:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773789500;
	bh=DrHNjKCY83c3T2yOBShpNx5lHPWPMdQOlezrNGqFKY4=;
	h=From:To:Cc:Subject:Date:From;
	b=OwrK27ZHN2o11kg2FOvYQePbHLRocas+N2RG8+SUzJsEPc3jB06h8M2yNBIKjrv8w
	 xbmYG7XGq6s24BMt7LzBHopN2jDrLHI9HHMmDEmy9d49YEi/q6HGDA/hAx/LUVTw+8
	 85WvYjnebDi6rkYYNCJhIvxdriRmgA0apdbAUcEg=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Subject: [PATCH 0/4] drm: rcar-du: Improve device_link handling
Date: Wed, 18 Mar 2026 01:19:26 +0200
Message-ID: <20260317231930.595719-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-29699-lists,linux-renesas-soc=lfdr.de,renesas];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:dkim,ideasonboard.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 04C8F2B4516
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello,

This small patch series came out of the review of [1].

I noticed that the DU driver enforces suspend/resume ordering with the
CMMs but not with the VSPs, which patch 1/4 fixes. This in turn made me
notice that the driver leaks the device_link instances to the CMM.
Patches 2/4 and 3/4 refactor CMM handling a bit, to prepare for 4/4 that
fixes the leak.

[1] https://lore.kernel.org/r/02669d4630e04fe24c17dd2576ec8b27ded458f0.1765541401.git.tommaso.merciai.xr@bp.renesas.com

Laurent Pinchart (4):
  drm: rcar-du: Ensure correct suspend/resume ordering with VSP
  drm: rcar-du: Store CMM device pointer instead of platform_device
  drm: rcar-du: Use __free() to simplify device_node handling
  drm: rcar-du: Don't leak device_link to CMM

 drivers/gpu/drm/renesas/rcar-du/rcar_cmm.c    | 26 +++++-----
 drivers/gpu/drm/renesas/rcar-du/rcar_cmm.h    | 18 +++----
 .../gpu/drm/renesas/rcar-du/rcar_du_crtc.c    | 16 +++---
 .../gpu/drm/renesas/rcar-du/rcar_du_crtc.h    |  3 +-
 drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.h |  8 ++-
 drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c | 52 +++++++++----------
 drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c | 16 ++++++
 drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.h |  2 +
 8 files changed, 81 insertions(+), 60 deletions(-)


base-commit: 3f071d00fc9478344f3231f585a5e39ceb6c63e6
-- 
Regards,

Laurent Pinchart


