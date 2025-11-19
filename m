Return-Path: <linux-renesas-soc+bounces-24785-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D9BC6E5F5
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Nov 2025 13:05:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 059B53653AA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Nov 2025 12:04:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16A8E3559CC;
	Wed, 19 Nov 2025 12:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="BwBD5Q78"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 780EF3254B7
	for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Nov 2025 12:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763553866; cv=none; b=ULBEk3hhJEINsRICfJ1UcwlyP2FkqR1OC4L9QZZze3bRB3IxB2caNi9ydBc9FkQRIdDXXO5W3QMJR83Q+IAZDezqMNMsfwVLH0+un8edxlgXhgIxq0smV263YVSXHmtXNMDWzirbXf7C90bbuUQqxugDnsbC9vai++MOPh9nlVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763553866; c=relaxed/simple;
	bh=F7DxkrTNy6jV1xc4KSU8Xe9T/Dkro79Nf50si2G5Pl4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Lu4pJ2gJfMljYUUjhPQ4OBZCQ22gpjbyZNbvbmRiuncC39nYGCQQFSC1//M8Nn6FY7GrLpnmxunJ1ijhiOQG4UcGr57/IiR8HSre/6qH+0acagnON60nqoE1HV4SkPhiL7iKBho+LvwfVZ3XCJGlEpNbYWtF9uxYdD5EdYohSck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=BwBD5Q78; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-42b3669ca3dso3340006f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Nov 2025 04:04:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1763553861; x=1764158661; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rnwi3hxPgLaT7fwS78Sg25bBZLOYpJ/bNpPRyg6chqY=;
        b=BwBD5Q78uszvpK0jhB+J+wElI3TPg99HC1GkF7SfAnlCrOq9D92eU7YQGkI2sMLFXm
         Y1RwI7Oa1SP7Ojp9ZRhkPSkBLneHrkEDdi3VFHwTOIkQ9mHR9mkbkihxoZye8BBNOACr
         Nl0h6k+L/UkA9gaZ+IsVo6SOhb0+cspoUl0u7yCOvjNlIZq5vXPwb0csZO7EIzewgz+o
         kVwhtXNPJWgjmn1fFQth/8J0zVHjfiRDb4iVrNxrIcQJqx8hTCuIqPuwGhCJHBUOQVan
         nD/bRImgD0VipOpes5biokh0u/46wqzSzdK2Yx+PwC0tQTvs+B/z8NPzBZvSI65CIXcC
         PLzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763553861; x=1764158661;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rnwi3hxPgLaT7fwS78Sg25bBZLOYpJ/bNpPRyg6chqY=;
        b=Nj+0WWL6bekzeI+bYmyukjW+PYoISqO3EjKl66lUliCa6VwFiXHJd6v3PpIckwncfx
         viGnIzEyU0tjcRijAViFfjUnQMy81ss1LsHJCWSxQYlGa6yrLk0dd8vjLyEpoaxp7diP
         bHwiQsB7RcWNAS8eouDNDIlVZDw9ygXuYi98NrapZ6SoV8d6sWOEJT6mkhEQcIQWkxeo
         15fftMbJQ5He7MHYbRBzqX9mG4A059taO+d7uoO61R6DmJcMp8QMsuE9kFijdXISHkhI
         n59coHhprq6WRihoIajjYWQUM4lm4javttuN5FUEVu+n1hqJrEN0mu9oKcmP/SphxzVU
         bZ0g==
X-Forwarded-Encrypted: i=1; AJvYcCUQsUVuMvz6/4YORY7Kn0H7+NeQOALZQ7lyGJJAj1P63ImAlymqXJvro8w2nFwvSeFPaRYm/gR3IKk92PMqUFtWUA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwbvezJNMa4N1f166KfJaCqLHnMh+RMHtvFU7ohspx4CeK2dt1G
	RtkjuOtNjUwN5z0loExOFfp5BjqPwgY7sGkOhK1KrRl+s8gkgmvDWGn1cNiOuyx/PpE=
X-Gm-Gg: ASbGncvH2KqJUn0x/RFZ7G5bjBnvZbLG0b/hUXRlWCFyws/Zv28UBv2M4JG+u7+yarZ
	IMr1Tkil45GO5wUU+cyVZDK49FSulmEXYNL+IVo1/1WF1MkrKZsJTgd9IU3s/3NhTGGZOse1Hk8
	hgQnokdO8hqbOHWSKjoY6pf7Xuw7Df6vCHgtv1Mo3McuO8uvXjs1u665Ci0RdeyoltNVwcx8AQM
	6u1acfuUnRgNadQp/vkWlNoOaRcXYqmlLZhADCFSrd/SBQPBulCVytUVCHz5ON1obHwi+0en7yl
	CiWM94jbOykxZ/vHnl59peSl0fHZK5NWy5O2olF6mndA2oJ2rmHpsGROGwDYbLiMSsLJnrB4ijk
	kbT7Ychi9d2uQytAyu+KwrudQMD5YV0WN0xfHVRQxtYDS+bgxEVdS0IW19KWnbbT0qNSpaLlx8R
	IMb7IXy+dO+FMfXZtKJattIpEjmmcwwqmXzT1Adg70z+iOAxGQqAE=
X-Google-Smtp-Source: AGHT+IGkGo4aCle/4SU9mLoLvq2s+j/Xoht3I9410x1lkX+uBg2DhRd+83qLvaEMvdhA8OqjMnnNmA==
X-Received: by 2002:a05:6000:430e:b0:429:d41b:9fe5 with SMTP id ffacd0b85a97d-42b59367b08mr18325024f8f.24.1763553861556;
        Wed, 19 Nov 2025 04:04:21 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.134])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53f2084dsm38431132f8f.42.2025.11.19.04.04.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 04:04:20 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: yoshihiro.shimoda.uh@renesas.com,
	vkoul@kernel.org,
	kishon@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	p.zabel@pengutronix.de
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 0/2] phy: renesas: rcar-gen3-usb2: Add suspend to RAM support
Date: Wed, 19 Nov 2025 14:04:16 +0200
Message-ID: <20251119120418.686224-1-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Hi,

Series adds suspend to RAM support for the Renesas R-Car GEN3 USB2 PHY
driver. Along with it, a preparatory patch was added (patch 1/2).

Series is built on top of patches 1/7, 2/7 at [1]

Thank you,
Claudiu

Changes in v2:
- added patch 1/2 which was initially part of suspend to RAM support
  patch

[1] https://lore.kernel.org/all/20251023135810.1688415-2-claudiu.beznea.uj@bp.renesas.com

Claudiu Beznea (2):
  phy: renesas: rcar-gen3-usb2: Move phy_data->init_bus check
  phy: renesas: rcar-gen3-usb2: Add suspend/resume support

 drivers/phy/renesas/phy-rcar-gen3-usb2.c | 66 +++++++++++++++++-------
 1 file changed, 47 insertions(+), 19 deletions(-)

-- 
2.43.0


