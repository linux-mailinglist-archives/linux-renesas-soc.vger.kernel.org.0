Return-Path: <linux-renesas-soc+bounces-29600-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iG32E8RKuWnG/QEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29600-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 13:36:20 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B3DC02A9F62
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 13:36:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6E3E63030B25
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 12:36:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EB2B3BF680;
	Tue, 17 Mar 2026 12:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lelkNSAW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4DEC46B5
	for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Mar 2026 12:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773750977; cv=none; b=Pw3PuHwddKazDE2vEjF8i2HEAI4AN+4i2atohlb9oUMjn4k61up6BNHg/KxuGwlgKZU9HaPY5bxHps3Tf6M5IOHXsWHCOwHlRZRbeYu0FflrF/QBdGVU+hoYnAvJWSYBfoTvXIDhqzzxu2zEBSbqlr2yW3xpQjtKzUkLDvESBlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773750977; c=relaxed/simple;
	bh=MnbSk43OQWvfji4aRw2z7JT2rPoxRKDSBZ81cyjbVXU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uZbFXMWC2xfhiXwAHc3iWYGhAb8bQxx4hieWTZatBeggixgfRzG9fDJWxn/F2c8j89JX1Yb1YwhCUazmdki/JScI98eacCFTfrukWoxoL9bilX4iHfb3URgdra58Sh2X3WtnN9chq6eMMV0S1JFGpsdHBv9lYdfLqO+3lZVmTrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lelkNSAW; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-43b49819938so594250f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Mar 2026 05:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773750974; x=1774355774; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=M4lFHCL1tyYPIUcCrRlaru3igXJSxxHN0zRr+ZhxeaE=;
        b=lelkNSAWNH9QhU+9yawoGtO5vipNLTy6+EO1mNb3W1pSfnNyGRFIWIl2enYuYFFT9+
         Tiw5g3SkcO7DcfNNSWlUkLSFpw516+Z7ojo8AfzHIx+EsPbFMahQp6CR73R/pmnh3ogN
         jjSA28ywaX9npbyNcnDMQtCMhc68tUfGhZM+rz/LNhj3D3c0MAU79IC5CoAERROyM+Q4
         koi8dZFaWNhyaajT023eczOupN0ZbPspLfxh/anhgepxesmBJsbgD9j9i6tzqBUlMkns
         9ml6UQJE5B0TplUihFFD+64cX3X2gLs1INclv0CR4IxI6VTRxZGO9CTv2rhoxTbr5NMa
         iByg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773750974; x=1774355774;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M4lFHCL1tyYPIUcCrRlaru3igXJSxxHN0zRr+ZhxeaE=;
        b=skWb8QWkyagDry9GL/QGtfnabCFYVM8mjhzdsm2fiXV9YtlOKPPdGvr+VRGb4wHmuz
         bR8V/eL1SGsL1I945hmIxAfIUfYYkIvX85d9cR5+s1XbplXJIuARjwCO0nQgUmpmVfuO
         lnZFHfgjwq/IcmbPMU4Oo7Sxx90XhPrcW/CVFVQEWGSW8C8gRCNt4sz2j6NeOTT2ReCK
         84zEuKcXMuWzMz/O7Jr9WMi5vobw1DJMbleCO3YeVlYfKpftj4y52k14HpfeXAoOPo3K
         dk8+c+31Cm5Wcnr2qqGZ/z+Ucy7ejL1EKMD/+sIsDoG9rrLEk73LbFdGR2WVwzs9TNjE
         Epag==
X-Forwarded-Encrypted: i=1; AJvYcCXXEbxtnYPShzrCT8ZkfEXMaWPfTMZln/4X0ErQU1KNsrHK0y7B7Llqh7H3EYusSQMra8EZM/orMeKW/yxZXFb8tw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzb6ev0Hz2n9zwh3viceP8rcQTaqZ8uFxIizg9FI7uS7PprUKk3
	4a5ytULx9XtQrCFsvukpusOGNUKUE6kDAFTv9lmHvm/xb9oktIcaIbIt
X-Gm-Gg: ATEYQzz939nv1K4UQxXzUMsnDmZaHmAaiZq2pk0MECi2wAlhGyle20DptBmXHaUycdD
	LHUv1CLa9+v87PG8kgr9wQocm9fWmtCi67wZi6ijVBhzqliIUTk3odpU23BvDjVUL55qo60IPrF
	375gpw2lJfkPQJiS4e3dW9zPyuBBOLrLf7r2/PUxP76Lyg2fKGMjWsk8W4FNh2v+7M0uups3N+x
	56G1A67SdZUwF79UckCgHlkC/OpinUq5DDLh5bqcuxLH1Gp/T+22bWGIZSWtBD4urTRqthr2HYe
	zWmS+W2jPQq0h5LEH6qX3Nr2VjyN1pmp0xzfFQQz5CmbYsoVMS10mWt3/x6Flr6XOSKDilXMEy7
	tyGjrbX8xkhhZMxt7Ryo2857VIPk3BtvvRJc24ttuR+0BUvc4Pwj4b5rreAEGGWsiGWpj5zthKa
	JUrwj3adVNZ1oLAl9C4bwnw3udcsAFrV3Tp8LoiDJJcSy7bck/
X-Received: by 2002:a05:6000:2003:b0:435:9cd5:bb2a with SMTP id ffacd0b85a97d-43a04d8736fmr29772032f8f.24.1773750973905;
        Tue, 17 Mar 2026 05:36:13 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:e16b:fc56:e220:9aa9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b4f845841sm3247444f8f.11.2026.03.17.05.36.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 05:36:13 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Chris Brandt <chris.brandt@renesas.com>,
	Hugo Villeneuve <hugo@hugovil.com>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 0/2] Improvements on RZ/G2L MIPI DSI driver
Date: Tue, 17 Mar 2026 12:35:59 +0000
Message-ID: <20260317123610.329630-1-biju.das.jz@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-29600-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[bp.renesas.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,pengutronix.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,glider.be,renesas.com,hugovil.com,bp.renesas.com,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B3DC02A9F62
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

Hi All,

Enhance RZ/G2L MIPI DSI driver based on "Figure 34.5 Power on sequence",
on section "34.4.2.1 Reset" of the RZ/G2L hardware manual Rev.1.50 May,
2025.

As per the hardware manual, it is required to wait >= 1msec after
deasserting the CMN_RSTB signal, and writing to DSI PHY timing registers
and few LINK registers should be done before deasserting the CMN_RSTB.

Biju Das (2):
  drm: renesas: rzg2l_mipi_dsi: Use fsleep() for 1ms delay in D-PHY init
  drm: renesas: rzg2l_mipi_dsi: Fix the power-on sequence

 .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 27 +++++++++++--------
 1 file changed, 16 insertions(+), 11 deletions(-)

-- 
2.43.0


