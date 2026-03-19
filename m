Return-Path: <linux-renesas-soc+bounces-29942-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sA3CBwkqvGn4twIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29942-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 17:53:29 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 981122CF2BF
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 17:53:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C2D383045021
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 16:48:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E3DE3EC2E4;
	Thu, 19 Mar 2026 16:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kqq6sncR"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2011E3603F3
	for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Mar 2026 16:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773938921; cv=none; b=MZsHaugfi6wugI4U35QP/9CU8pkfGYCAJabkS4V3Bc959GGOxWOlCJeN/23yQSCm3s1Aeh2Fh5H3Pzym4TowlABFFH9ml5AzWT/D2fE7ASOgv2gG/NwJEpKt0NLp5MmkiINzKs2rp5RiNlPkZDn+sGGLbKV6ejn1cZlQwfZWt0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773938921; c=relaxed/simple;
	bh=NGZQCdIu6ONtdXuL9FAnlKV2896T7RTXMk65Kpsu9Nk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UqGxB94sjwaLXrkQ3/y3o69Ndc1yBWG83M2AP5twttAEI1Yg1Vd8CvJvp4kAj/EGzkmhiMrOkCvf/JkgrVjOfBU/QyQO4gTcxrAPXr8gT2U8t7ftUzXyw/xqmkg6xLsiATXDZdy5xHsKLdCXt8LQXEij3csWhlp9kqzBDI2HxX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kqq6sncR; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-486fb439299so7662315e9.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Mar 2026 09:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773938916; x=1774543716; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=67YBzLgJpm+jWRJhQmLmU0eKJxzFoUHQUOznNZxFkEg=;
        b=kqq6sncRDiZ/XFpwZNiKUarIyzhwEoS5dROhU+874n4yfTnMNndT74zPWxJaAWLvsY
         WnhbtXMYZg9fpwGgt0n5FyG3z8ljEfjjZQEw3yhpl+ZuHUaG6A6IHRdpNdywZqzspvzy
         j/8mJAkeUHhBtZNeGHQVuI5zM9KaQvqa2Dc2RTfWen1ZD4Tbf0JUluBT83vy8fN5mfTo
         GMuL0ABaXzGEP90CtWbhmJzsFcq+L946J2ZewHEXFswh5PvueWf7TUFsqx6CsSemIdGV
         Dk1yTxb8j7KIDVaQR62xFjkHlqWzrVYP7h9quJujEGunjl6jmt6SYqHc/8SNrm4YIv9D
         C4iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773938916; x=1774543716;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=67YBzLgJpm+jWRJhQmLmU0eKJxzFoUHQUOznNZxFkEg=;
        b=kBGxfyOtDFb/RYn/nhng5bFv7evv1FMGTOaIphbgjG0OFKAeV3SLk90Xp51ZcM3glT
         F2d980IQB7XajNxZPiyiNMcKKzIq+NnewmcHAhLKrjFBMKXqqkGUlZ9Y5McLQGxU5SGM
         dh+vq+Js2O36jmbe38V9Y74tpGHpNv9wu7Ku5+2nZKqZ5Vk0+5GwfKLIgwrv/iXHdjvc
         VJGYiKzkKPRib+qIZRTPTU05GBqeye1PLoSQwq7MkjMSZFRSXfKqwDzASeHxIK2vqBj0
         CWJe4mZ53cLcvTtg5vaZmz4mdhCuF+v7GE21hGnNck9soTFiGrn+mfOw7d5CBeWBFh2t
         msKQ==
X-Forwarded-Encrypted: i=1; AJvYcCWsjX4vwRWEuXFcLAyaoe+zPlweTd6Ew1QoHUNz+oAkEEyLlhq1DkMktZvi/rpUaWnily/uG+bYd6bsrJZPFuq0yA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2dyIJ4BW/COPTP2YBBXtak9yqdpzFfl4jj0iJuov2EFgRkGke
	5RlpCFUiNJCNU7ax0PJhyi5DDv8OQYY+hSkXgCVjwL+Y13X1M38pKiLP
X-Gm-Gg: ATEYQzyV8zYEv8hCdtENYJIIdVWOC5Ufjl4EzgQZVmH9XYy2EbsFgfcZAI1QPzRajdF
	sjFPpZsPpawfYV/hDbKHT4cW4IdO178p4qVPwPVyvBHHyBby+Blmdvaydc0bCjr/APqITUIgIx5
	cyr5Q5bYKf2Zbg+1Zriy8krghWsapnvr5KCKXSkYrmyKeCbkwIV5xTOvkF0adI/akFvtaLDHirM
	TDW+WvjYc3wuF3NznYtMldXOzB0/2z5Tb8+kdPxWhhrIig5W3LsCIz6MFchNk3RdoMOGwHCTUvh
	f4X/sSLq5sg5rcZUd90qas8fXPK1A1aiuR05OF01jSPy0PIPbxE/dKuJj+fYs00A+wTlgVwJpnm
	Jp/63Vla2SZKwNjXMQZMN5o4PC9l6y8F3mpagGZO95Ei7odDjXdNnnSuA8GUV1KsR9+cwJ9FIGq
	EHHboAEdXr+jC5sql8nwHXINEaGo5K/jk=
X-Received: by 2002:a05:600c:1992:b0:486:fad0:b166 with SMTP id 5b1f17b1804b1-486fad0b2c8mr46748695e9.17.1773938915746;
        Thu, 19 Mar 2026 09:48:35 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a758:8a01:8326:7b31:bf82:d2d0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fe68ec05sm5238505e9.0.2026.03.19.09.48.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 09:48:35 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: Chris Brandt <chris.brandt@renesas.com>,
	Hugo Villeneuve <hugo@hugovil.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v2 0/4] Improvements on RZ/G2L MIPI DSI driver
Date: Thu, 19 Mar 2026 16:48:24 +0000
Message-ID: <20260319164833.409126-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_TO(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-29942-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[bp.renesas.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_CC(0.00)[renesas.com,hugovil.com,ideasonboard.com,ravnborg.org,lists.freedesktop.org,vger.kernel.org,glider.be,bp.renesas.com,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	NEURAL_HAM(-0.00)[-0.820];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,renesas.com:email,bp.renesas.com:mid]
X-Rspamd-Queue-Id: 981122CF2BF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

Hi All,

Enhance the RZ/G2L MIPI DSI driver based on section "34.4.2.1 Reset" of
the RZ/G2L hardware manual Rev.1.50 May 2025. According to this section,
it is required to wait >= 1 msec after deasserting the CMN_RSTB signal,
and writing to DSI PHY timing registers and LINK registers should be done
before deasserting CMN_RSTB.
Additionally, the hardware manual suggests display timing settings should
be done after the HS clock is started.

v1->v2:
 * Updated commit header and description
 * Moved the code from rzg2l_mipi_dsi_dphy_init() to rzg2l_mipi_dsi_startup()
 * Moved the check before calling reset_control_deassert(), so that it will be
   skipped for RZ/V2H SoC
 * Added fixes patch for moving rzg2l_mipi_dsi_set_display_timing()
 * Added fixes patch for assert of CMN_RSTB signal

Biju Das (4):
  drm: renesas: rzg2l_mipi_dsi: Move rzg2l_mipi_dsi_set_display_timing()
  drm: renesas: rzg2l_mipi_dsi: Fix assert of CMN_RSTB signal
  drm: renesas: rzg2l_mipi_dsi: Fix deassert of CMN_RSTB signal
  drm: renesas: rzg2l_mipi_dsi: Increase reset delay

 .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 34 +++++++++++--------
 1 file changed, 19 insertions(+), 15 deletions(-)

-- 
2.43.0


