Return-Path: <linux-renesas-soc+bounces-15059-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 35195A7598F
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 30 Mar 2025 12:24:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 57242188DFDC
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 30 Mar 2025 10:24:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 567E71B3937;
	Sun, 30 Mar 2025 10:24:12 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 247031ADC93
	for <linux-renesas-soc@vger.kernel.org>; Sun, 30 Mar 2025 10:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743330252; cv=none; b=Zs6JTCjdJks8uk+EQ5lHSakZK8PehysJRdh0sILW46hQw/kAGzwLRwTWm7jC7j9TslpF/HZK/UkcHg35mo2vHshL/n3EMu90crC6HnzdIXUPjpI3KtwBHaW98tAZdYzpYAnn4rZmjvgZ9gJ9EzrWWyktWfFZLwsQnKojxjXWH+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743330252; c=relaxed/simple;
	bh=CkXVc3Jiyhl2uSpTR5rhD3Iv7d3BBdISJdsiBC4I4aM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MOm455L9j/B55dcbkGpcxY+fvKcHjIa2crQ1zcQ2Wq+Djk7s3G4XDyxbOsBTRiwQJ3wF3LPlxYX16ljqtVI0I5VAekUxC1nwEeIPlROv2cMHlwLrxB1GEvHPzPS7itK9MrmjJyp7bPa7tEC5qU0CNYNRbGAL+QUxUnZHyQpiq4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: B5r/05UgQySkbdTFbpsU5w==
X-CSE-MsgGUID: M4xtPMwKTyCbtdmMMg94bg==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 30 Mar 2025 19:24:03 +0900
Received: from localhost.localdomain (unknown [10.226.92.49])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id E36B840078A5;
	Sun, 30 Mar 2025 19:23:59 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v2 0/2] drm: renesas: Extend RZ/G2L KMS formats
Date: Sun, 30 Mar 2025 11:23:51 +0100
Message-ID: <20250330102357.56010-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The RPF module on VSDP supports various format conversion and send the
image data to BRS(Blend ROP Sub Unit) for further processing.

The rzg2l_du_kms component lists a restricted subset of the capabilities
of the VSPD which prevents additional formats from being used for
display planes.

Extend RZ/G2L supported KMS formats. Also drop the unused bpp variable
from struct rzg2l_du_format_info.

Sending v2 as per the agreement with Kieran on #renesas-soc irc.

v1->v2:
 * Dropped the unused variable bpp from struct rzg2l_du_format_info.
 * Updated the commit description.
 * Collected tags
 * Dropped bpp entries.

Biju Das (1):
  drm: renesas: rz-du: Drop bpp variable from struct
    rzg2l_du_format_info

Kieran Bingham (1):
  drm: renesas: Extend RZ/G2L supported KMS formats

 drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c | 120 +++++++++++++++++--
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.h |   1 -
 2 files changed, 113 insertions(+), 8 deletions(-)

-- 
2.43.0


