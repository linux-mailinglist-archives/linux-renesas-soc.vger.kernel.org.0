Return-Path: <linux-renesas-soc+bounces-30564-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QCmFL8RVymn27gUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30564-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Mar 2026 12:51:48 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C504359B03
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Mar 2026 12:51:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3B91530071C6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Mar 2026 10:44:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F20D33BE643;
	Mon, 30 Mar 2026 10:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rj5IQZNH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A063B3BE15F
	for <linux-renesas-soc@vger.kernel.org>; Mon, 30 Mar 2026 10:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774867495; cv=none; b=XDZhShHgpi/kQQIeBOsdDqPPTLCn3HHDCJn05eH0NHfD37WOGW063H3guavlTcbxaEHHuCVnMUhuVkIWvfI1grzts3K4ASEPnvo7862P78mbyOpdS8VSumpy8gtNoMWgVswgmofRvQIOiTGe2x/a1bLM+J+qkPTP3kBZr7C4SG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774867495; c=relaxed/simple;
	bh=qly5vLYU8cxXp8vltM+i9p9TqXEzr8A/kvll06hSEAg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MLeV+xE/1zy51bGN7FYeCA+E3bBkOn+sw8ZxrZh46J2f72cLWpxbMrPjmCQhrfCWmAAy6X3Rcs/AeQGiM9N9nUR8eEfmLbTPUq3mg/I2vTZGi6H+pgopAB3H5vMKmh2q6T5TtTyS14wu7H3tl7puj1AT+kOIlR9oz00xDu+jkow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rj5IQZNH; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4873ce69ba9so8124555e9.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 30 Mar 2026 03:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774867493; x=1775472293; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Nqv4AprnwJimRofV12+nm6wKeoECG68gUH8nOF/KtJQ=;
        b=Rj5IQZNHAWD0FUgvqmV/l6fGXaM4PxXOxKJUGAQj9Ur1EHfftgidhicwb+i3dY6s7z
         ZuLK2Snsld+yE9gkY2wq+EEbHuiXk+volM2RARnaWIIzVAgxYrTAgayuWzefbhWDJdNQ
         38AWcazR070JTX/VZbwO4o8amXwV2QYNUvIGcZ8Bci9ufxEkaZ2sUM5tfNDbiiVQBG2Z
         XZGvgL7RBlb/ufNshuFNP8ruit1eO/vrngXr8Rne7SJrEugWJkBro4fvr0bZ3UVD5lrb
         7CZL8uwZgmwj/fg11YK7HA/V0lR0xL5TdYwh8sBlh98G7QOkLV99Rbgqmmjk71OltjOI
         D0ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774867493; x=1775472293;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nqv4AprnwJimRofV12+nm6wKeoECG68gUH8nOF/KtJQ=;
        b=I2wQ9WXOVK7tid0ms5ZeTpwAsvuoeTfQbNgFtfj5Rrli2vreC2ZAsxyykvpDTrIi+x
         IsZe5Gq8PLlTn6aQsmdoFrmTSz4NC5AQIvkurkYGbLpGItW6rSf71KrGkafrcIworCcH
         YbFjNVkDwvz93Enfrcp/mJbv+jVVNPBcFWlaoIByf0H84nnzPb+39cijHXCWGKwb8Vl8
         kcjTuDr5NzJSOyZRE0ufcApPJoC/IhmXTwpj5uaXVJLuDbU4snqHoNKeKa1OOrA0Tqja
         V1waqK/AhlYFfV4Sk0z1mlB4O3ijc2jRMMnRqNiAaf1D2OghFJPGtOft5tkeiY1lJIns
         LtaQ==
X-Forwarded-Encrypted: i=1; AJvYcCXLXXN2T5qrz9bHb585o+LC04nnocdwG/trNJhSSNphHQLQ5ha9kcs9DwAVqsTxXlsmO+fF98IHnAyxF/LPJznlsQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzsR8Gcx3bQG+dVbBlofxUTtnABZRrmotkV4IZbfDlYshwJ1NeV
	jY7l9gT8z4Tqc3wiaL13QXJYc6biaS7jMak/NOjPRfuTbDDHXdyzWMb2
X-Gm-Gg: ATEYQzxBd8QVf4TT1fLy8g0ipazsVsxcSAzmbDqzga9SVsI1k4lOrHGdlSBpmwtLeCJ
	ZV291ffNSxsyv+0AKnZm2oaCHMv6/RWRTYeIq41k3UmZWmZ+6bWieHmQXo4SBO4JCCuN8fTTLD6
	47hD+qy35BetrtKC4zpMkPjuJrU47UGihbAJCpNqQH4DsX14jJNnxo0qFj0F03BDibWMaTnWZo+
	ZambEgn7/E3YkzVFwpVZt35lT2aqIU7+0BM+/eEfOtgognXB1SPwf61yjmE4krXLhOq0vXh9sAW
	jjB8auPajN5x/JCiHFQwwczvtkhV/DZ3kDlwM3HAxryebgSTL5gfjLdrBdfxtfBMZXvmHimVeqA
	++JZmp/X4fZq6SMi/7Kxb/KGLYSmEXJDvHQJmZlppjinebIixcb4b+h1FTXUJ7pCyYGwR0ufjdy
	TffvMrGQ++swOgUo3tYrkdY+RDrE8Pcw==
X-Received: by 2002:a05:600c:c493:b0:487:338:b4f3 with SMTP id 5b1f17b1804b1-48727efad7cmr190825115e9.17.1774867492664;
        Mon, 30 Mar 2026 03:44:52 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a758:8a01:e60:2c8a:54bb:d692])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48727bfc5ecsm185842685e9.1.2026.03.30.03.44.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 03:44:52 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: Chris Brandt <chris.brandt@renesas.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v3 0/3] Improvements on RZ/G2L MIPI DSI driver
Date: Mon, 30 Mar 2026 11:44:43 +0100
Message-ID: <20260330104450.128512-1-biju.das.jz@bp.renesas.com>
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
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30564-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[bp.renesas.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_CC(0.00)[renesas.com,ideasonboard.com,ravnborg.org,lists.freedesktop.org,vger.kernel.org,glider.be,bp.renesas.com,gmail.com];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Queue-Id: 1C504359B03
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

v2->v3:
 * Merged patch#2 and patch#3 to avoid breakage.
 * Moved the patch from patch#4 to patch#2.
 * Added fixes tag for patch#2.
 * Updated commit description for patch#2 and patch#3.
v1->v2:
 * Updated commit header and description
 * Moved the code from rzg2l_mipi_dsi_dphy_init() to rzg2l_mipi_dsi_startup()
 * Moved the check before calling reset_control_deassert(), so that it will be
   skipped for RZ/V2H SoC
 * Added fixes patch for moving rzg2l_mipi_dsi_set_display_timing()
 * Added fixes patch for assert of CMN_RSTB signal

Biju Das (3):
  drm: renesas: rzg2l_mipi_dsi: Move rzg2l_mipi_dsi_set_display_timing()
  drm: renesas: rzg2l_mipi_dsi: Increase reset deassertion delay
  drm: renesas: rzg2l_mipi_dsi: Fix deassert/assert of CMN_RSTB signal

 .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 34 +++++++++++--------
 1 file changed, 19 insertions(+), 15 deletions(-)

-- 
2.43.0


