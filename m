Return-Path: <linux-renesas-soc+bounces-31959-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eCxGOH+1+Gm3zAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31959-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 04 May 2026 17:04:31 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B5954C05F6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 04 May 2026 17:04:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9B447302AF30
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 May 2026 14:59:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2085037881B;
	Mon,  4 May 2026 14:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Re3Ku3cp"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A56203DE42C
	for <linux-renesas-soc@vger.kernel.org>; Mon,  4 May 2026 14:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777906751; cv=none; b=mu30c0wdkHVEKmQ1hBn4Zr6qXqtUTyypNQ0BwfxFG/oUpmREcmLExXbj4Iz92mCgkMJYlWtjOmYk8QbJYARXLw9MBZLSVdtiRiCgPnPvq05+sL/N2xnLRwBtvyGXoDtbpLksWX0mMPaB8grHQxa5rrkQI1+QuBlxsJS1idkCN5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777906751; c=relaxed/simple;
	bh=s1lj0MJrcU15ZqwEYs08OzDLrHfbNbhDbs/t/S0DVpI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lmmqyXRoGJLH8cOcutN7b3lUY9MpnM6aO7zDmnk2odaUmY1qFmmUJiN469/jABlAk9Pk/ebO3llp5/N8xcqNSg1JlJYPHbro+t2LlBKSgNaBc4xF48CM3329qF/8jqXbIuz+bLpp9qnq3ZVRqfuffuf9xAhLi/nlEABkfS1K6Jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Re3Ku3cp; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4852b81c73aso30088155e9.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 04 May 2026 07:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777906749; x=1778511549; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hQdlPNCTbv6uJb78SK3ljaR8gX7GI26O+ePLCgSshWk=;
        b=Re3Ku3cpaJ06nF3b/z0zxkSW+CedozXNm47plMwZc69+4sU2ifm2OBnvfXWMuT5lNX
         oN5c8QCvj/VkLEgLA7R/QtNHGk5+Wdr4fQ50NY5QyNxjN1dKQycpa/Lt6KJZRPXKBL+W
         sTYubnAcQ2gG+MLmwk0+XhWHd3Btv9r2LAcUPpLsLoMbri6xR0QPEfD5GIE8uyWS9Q2n
         z/6X/rnguFFtPhTpMZPEMWDhc834p4A00IodRSdwqUKgKyDQ7GE9d8P8eiANxNVofynr
         Q1o8s0wso2MxVVlvKFG2is8p9ZZSon5rx5vmSMKM5CPZW3z+IvmCpq1qzv/uiOL4sTTE
         6U3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777906749; x=1778511549;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hQdlPNCTbv6uJb78SK3ljaR8gX7GI26O+ePLCgSshWk=;
        b=gfVj7AhL2L4aHoNt4GW9Kf4pMwrEpMs1ISwTyrtFBFcqL3yPRJ1K8ExcckbY/30WWt
         S1l8pNE2+tcgbhTxBj4rxullH4b94KAxTBpOR5mKbgx4hdncRGczOlS6gzfys+HMkk/6
         3olzjdXGwaDjp17ISXmUDHSK86gQFHnK43Q44qYJP2ZlIJekwmBoh6c3R+W2iLNi/xBp
         07Rxcd01cqsiaU3qy6K2V+PvdrT2nZACKDLuyRfizn3gcnyjQv+wJk/PGFUSjK4+7lUY
         XDmJlLtFq93ZnSaT1GJrMXJ4LNAiU8OPwigLaOAS2vh3DLc9u1OenedrpA0goaIQzAmx
         P8Bw==
X-Forwarded-Encrypted: i=1; AFNElJ/veRnYephW5PMhixzVejI2lQfsoFgyrs6rMvwj5Lw/rDJ/H4KX6Dw4Xxi7AilLwm2tl7U5Lq5UIs8g7w/i5pp8eA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxjY0nr+k157vrgxbH0mzijJk9EToqVCyEopEVQ3KxBmf80x6Ce
	bWIfjDelXbJZSOq44/xVu3H/HS4B/CyKucjpHQjjm3zjltWeDcKbdlzX
X-Gm-Gg: AeBDieu6owJsMwla5ojoWcDL3QDoS2dqLlMzUaEeJKIXgC2SK/40ER5Ebu5lybdlwVf
	ttT88VxAt4jPa3OjmsZebVe+Qclf0eKKYdJtPpK/KxsjmbNiBf3TdGe6UQ6CVpqKbRpNIUxc6ii
	eTDkL2zTOKf0yfkemrgP4CZoZ5As0+VpQXRb4+PYAEm6mR4EPJqAQVLU2aIWvFv14+oOuL5bfgI
	28BON1boWVu7nlAwdIxhPdLsRIWgc9lmKGzjjkQKvMrpszKLZTT8icQMdoJgxuDWFnl/8GTlb9q
	BDzY13yfBjufElcV/EKfrPigxL78eR/OCBw8gNkFbNgRS4RIuVKetvm6+A97cccuYutnXWl26s1
	mVz+Cl30l3k7A4L0TLmFPzI1ET34YY93+LJcy+DXSTCNR9iU5V+F+K6ULArB48LpggpHrPmAeNZ
	sI/60RyPO6DBs2Wyzo/pAD6RWVg+TSIhFwCATesI8bwM2NeYSBrQ1YOvPihNI=
X-Received: by 2002:a05:600c:a316:b0:489:1aed:1658 with SMTP id 5b1f17b1804b1-48a9866e6eemr119176125e9.23.1777906749088;
        Mon, 04 May 2026 07:59:09 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:6444:b23f:58b2:338c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8eba6f83sm270015255e9.9.2026.05.04.07.59.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 07:59:08 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Liu Ying <victor.liu@nxp.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH] drm/bridge: ite-it6263: Drop unnecessary blank line
Date: Mon,  4 May 2026 15:59:04 +0100
Message-ID: <20260504145906.155198-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 7B5954C05F6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31959-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,ideasonboard.com,kwiboo.se,gmail.com,lists.freedesktop.org,vger.kernel.org,glider.be];
	FREEMAIL_TO(0.00)[nxp.com,intel.com,linaro.org,kernel.org,linux.intel.com,suse.de,gmail.com,ffwll.ch];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	NEURAL_HAM(-0.00)[-0.997];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,bp.renesas.com:mid]

From: Biju Das <biju.das.jz@bp.renesas.com>

Drop unnecessary blank line in it6263_hdmi_write_hdmi_infoframe().

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/gpu/drm/bridge/ite-it6263.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6263.c b/drivers/gpu/drm/bridge/ite-it6263.c
index 4f3ebb7af4d4..8a7fb5b2ef07 100644
--- a/drivers/gpu/drm/bridge/ite-it6263.c
+++ b/drivers/gpu/drm/bridge/ite-it6263.c
@@ -815,7 +815,6 @@ static int it6263_hdmi_write_hdmi_infoframe(struct drm_bridge *bridge,
 	regmap_write(regmap, HDMI_REG_PKT_NULL_CTRL,
 		     ENABLE_PKT | REPEAT_PKT);
 
-
 	return 0;
 }
 
-- 
2.43.0


