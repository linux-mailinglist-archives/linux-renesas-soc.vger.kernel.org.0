Return-Path: <linux-renesas-soc+bounces-30116-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eFKlNXl0wWkQTQQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30116-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Mar 2026 18:12:25 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DCAD2F9931
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Mar 2026 18:12:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D64843069642
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Mar 2026 16:45:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F8B83C2798;
	Mon, 23 Mar 2026 16:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="PqiWYT13"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE5D138229C
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Mar 2026 16:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774284331; cv=none; b=JbGCHYeP2dJism0QiCpp3vsqNVluoX883o8X+17p/1tDNQOK98FpZUHkT4z2Tqou0F4D+SP6lI8Cp9MmNqazEgNoNq3C6xxeONwhbEjx/LxTOvNy+eK2Pk1ILNC7i1DOHnpMJ1E9y/c44mmG39GcJSzCMbTqPVTJ3h4r8XOdxvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774284331; c=relaxed/simple;
	bh=8BGEngxkySkyTKbeo/i0cTwWlKEY2Zfak/ZeMwY7f+s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=O+ORzSbMpS9lCdmPQ/4vX7Qc9FYETMJVWh1GYoo3pjnLAXa1QY/eeR1eROYwJgu7ORfVPg9+ZOLWmX1RnOh2tUmmyP3g5KwXf7nGxA2CBPR5LXW4byyUVAwS+vlHDGt4kjzv+PJuHZp9b4c5pJppQm0RVoIiOOG78RFDPFfSecQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=PqiWYT13; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 76D34189C;
	Mon, 23 Mar 2026 17:44:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1774284251;
	bh=8BGEngxkySkyTKbeo/i0cTwWlKEY2Zfak/ZeMwY7f+s=;
	h=From:To:Cc:Subject:Date:From;
	b=PqiWYT13ST/GepdD8rGmo6BD2AAP1JLQe4wSeSNhjx10YlGJuz6c/AGVb/hPDs7sa
	 ItYJVrKK/XDaWPoVUFrzIpC5oK+8KMUSGiItm8m+ViIa2F8j329LPD2r6fJpHBSo40
	 GSUchT6n2K8Z8JkdkEUf7lOvjqjbZQW+kC1Tv3h4=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Biju Das <biju.das.jz@bp.renesas.com>
Subject: [PATCH v2 0/4] drm: rcar-du: Improve device_link handling
Date: Mon, 23 Mar 2026 18:45:22 +0200
Message-ID: <20260323164526.2292491-1-laurent.pinchart+renesas@ideasonboard.com>
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
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-30116-lists,linux-renesas-soc=lfdr.de,renesas];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 9DCAD2F9931
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello,

This small patch series came out of the review of [1].

I noticed that the DU driver enforces suspend/resume ordering with the
CMMs but not with the VSPs, which patch 1/4 fixes. This in turn made me
notice that the driver leaks the device_link instances to the CMM.
Patches 2/4 and 3/4 refactor CMM handling a bit, to prepare for 4/4 that
fixes the leak.

Changes compared to v1 are minor, see individual patches for details.

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


base-commit: 25854131c04a5aa25a41cf527aab269aadb86699
-- 
Regards,

Laurent Pinchart


