Return-Path: <linux-renesas-soc+bounces-33630-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Dw2aBvrlImrMewEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33630-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 05 Jun 2026 17:06:34 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BCBC6491DC
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 05 Jun 2026 17:06:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b="SJ/Or5HF";
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33630-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33630-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BC39D300A10C
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Jun 2026 14:50:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BA5F3D0916;
	Fri,  5 Jun 2026 14:50:55 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 021D03CF057
	for <linux-renesas-soc@vger.kernel.org>; Fri,  5 Jun 2026 14:50:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780671055; cv=none; b=SCkRiRIyOUStej0Wexfuo2k0eTEJrRui20nW6uzOblbWLOo7qiHchiH8JIFOICPpVgbS8QypmTz/6swXEq105CH72pEzSglQFDBYWYZXmpdo46x0/cViakJbQz8SH1W1pH3whfPtLVvw7zKlTLryJ+y3ZjGJJJAWRfxJ3JgHUcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780671055; c=relaxed/simple;
	bh=noLWCZ7k/hogDRaJM1qtY69Rcq9ht/JpS1l/lTFXwLs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=WE3XKLmgdvl637pcCCHkFo0UIAp1cWrhoLqUc0bVwZzE/lXJQ/YrtF26aHZzU4iwSsBil91b9D4OshSMbffYHe4nJOixeclWCPW014fn/7D5WiT68DjBbbIBgmhcKPGXpicl52tFeC4t6+BcylXknjk+9mX6HqXdZBB6RmyxXPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SJ/Or5HF; arc=none smtp.client-ip=209.85.128.42
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-490b1bbcf3aso16450895e9.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 05 Jun 2026 07:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780671052; x=1781275852; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=V0j4B4g7G9TNgdgRoQeZbJsIdkpUUijRXOBtL+WYeVA=;
        b=SJ/Or5HFnolqnGOOaD8aDRtpUJ7UnOgr/HxKnBZRDwNpNPoFsJgMYQNVld/H0GpC1U
         kDHpBYItNLI30paJ1iVCMCBcEGu4VznealEx+h2fa5tR64UYVJCYP3rf1q33LyCRFghA
         qmwPHnXZAynzt6v3gc4d7XqM7gC62rpbbnBrl/CxrP/j+cH8KxX9SDdQPejFD4+xaPK6
         864dCKEd7ZRT3pVcpgijwYZAyL5VZdK1bDemAROFgnS/oRGVNJBOy27qWcnutOVHK0UK
         z2Y7TvCOR5o8cFYjhrucecv5f8hLf/rDN5lxq6D2bFBSIeZYW4A7G5vCQavTbROPlLdJ
         lnhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780671052; x=1781275852;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V0j4B4g7G9TNgdgRoQeZbJsIdkpUUijRXOBtL+WYeVA=;
        b=cL6HQEpxBOsrFbQ2HP/47THWAozS4NebZIhx4Y3ro4A56tnQG6rYlbGxByWKUUBzpE
         Kfm4+PzaYGByMdB2xJXN5fw2I9GvAJ9L73FahgxQqW+g2cUp0/wQZuf3FXbws2L8XSSd
         lewydekKD4f7NeAnpD88hO3ljwwX7QDaEwWmjBANNif8qtuI/eaXcZKBIKJ5PJS5F4mV
         ctP4YXVhcdBvWdYnn3CkYPPaZosSwFUuMCcwrVHUfjXEKjULSH+DeCdc5iG3jzVZi9QE
         QVWPCuqACoyEnXNzBDDaAcOVNp6jr38Yl5JJc1hV8TdZg8vxoIfYSA08MaPu8yUtXoNh
         30yw==
X-Forwarded-Encrypted: i=1; AFNElJ/n0dhsIoN0SxkJwPGq5UTRb8IQloe9PJUbVTtxL7ABEw7Bph+OhWKmAGe9cy7QnYs0g4IQ3jhmcg7/FnzYMegnNQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxO1Rt1Ty51TdkaOguoNTGXjKGEzU1hgx1Gne/0IncCn7juHATY
	+hJdC68ppH2YtTHpr3yHW/qOOvoZ/biaamu4m6AxbgE7gqDA2isAn1v+31xjwcDB3DI=
X-Gm-Gg: Acq92OFw3IPwyVBLhhxX2PfETr7snhjpVxBKPlHPDp3+7GJAM9YywZ3yDHOAhtPiPFX
	bZqzy9XaFpiYK8mwCqu4Iuv5preb1rlPXHY6LHeLIrMFfTDnh/PZSDW92cbnO9YFeRWTIOu1Wrq
	bjOuLZ3uoXT/Kcofb3pAlPBV/M4IXqjo/rA2vFDf8LoCC3cXZpkwNDF0OcmsNvFOvfmyiLGsnz3
	IlvdNEeIeuhlcREd5LdY7zzFBqsvC/swker0dm1yJ94UIFvHuySmvOtFU7X8QEED6GmxjR2X/fK
	w6O0af3Jr4SBjWlygY7aJlw8C4GMXbUhjC/3BpatEQDwcciOfCwVtIBGYbUm1yuu1/HtdMrZDUj
	Edu6TCU19falHmv8V5+RqAQraosVykjMHzDowxhaxqM/Y8mxLL3Zhj+sjsSechLCFcnOtUQaBJz
	2Bb6cBgfGjW1ntoXaJwepyES0tsr4nrCu3LRoPX9TKnjBqy2zXNtlTb9mc7/B+7tYjsQ==
X-Received: by 2002:a05:600c:1c1e:b0:490:44eb:c1e0 with SMTP id 5b1f17b1804b1-490c26056a4mr68528555e9.21.1780671052262;
        Fri, 05 Jun 2026 07:50:52 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3d663csm176178315e9.11.2026.06.05.07.50.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 07:50:51 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v7 0/2] drm: panel: support the R63419 based dual-DSI video
 mode Display Panels
Date: Fri, 05 Jun 2026 16:50:47 +0200
Message-Id: <20260605-topic-sm8650-ayaneo-pocket-s2-r63419-v7-0-b84b6da84293@linaro.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEfiImoC/5XQy07EIBQG4FeZsBYDh0uLK9/DuKBwmMFLaaA2T
 iZ9d2Fc2DguKmHzJ4fvP+FCCuaIhTwcLiTjEktMYw3d3YG4kx2PSKOvmQADzST0dE5TdLS891o
 xas92xESn5F5xpgVo1kJyQ7EDqTsEP7BAKjVlDPHzWvP0/J3Lx/CCbm52mzjFMqd8vu6x8Db3z
 8qFU0ZNz3FQtl7FH9/iaHO6T/lIWucCG1WwnSo0lVvHmVTCM3ejih9VMblTFU0NmrsA0uIQblS
 5UeuDfaqs6tAbMDYoNH/8gNqowHeqqqreq44xMEYYdqPqrQo7VV1VrtHXY83vXdd1/QLqdF0Mm
 QIAAA==
X-Change-ID: 20260428-topic-sm8650-ayaneo-pocket-s2-r63419-e72467e2db0f
To: Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Conor Dooley <conor.dooley@microchip.com>, KancyJoe <kancy2333@outlook.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2735;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=noLWCZ7k/hogDRaJM1qtY69Rcq9ht/JpS1l/lTFXwLs=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqIuJK66bVPMQ1g9Q/2C8MA7ktzUvGIRC7z+2QQSUq
 gLYjO8OJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaiLiSgAKCRB33NvayMhJ0e+CEA
 CRYThuOvq3cuir9RXhER/VOuVviw44dKQkZG9ueWjPmdbMF6QuWbXSPu0JGa+Ej4cpbtmbF6BZBu3E
 P8n+4qIjovTvcgaZ7+uuiiflqkgNl4zzmwykG5ZjWcwZT8RbLmT6LGt1S3BLnOXMju3TIKclRaAQsU
 Hoso5dtmjywHD5II3meXR7FZ45rJOIinR4/JR2L6hAvc+dyYZ5HzhWW/AdXV415orxIRytMxDVYzkS
 FbvDg2rEdgO7P9PNmBqI4rRxbF4LqNL9B/UUFzGaNeFX8qQci09hmuTyF0ZcjF2vMore1JOZOG5Pt/
 MfuLf+/Y058EKxVZAztViJ6J04k7depqEkoiqM82GpElRTIL9OSN1D2UlFJLJXO4SlQPFDNBC+1m5w
 ZX8Yt6t6doMXkYbvBZeL+0McML0MHCazZvlBUofZPicZunaHq1BrxruW3J4J2pfGqPzF/5IARdhrUG
 f3vqUZ0/+Okdn1xKj10pfJucrDJQHsyr3y/kL0WA4AXgzwM1HVyFOxbawyPS/6en8RAiA9dJsZxpwB
 eTRNIbTPsL5ulGwMhm9hEQx2LRSUvxUpEJWYKPOPhBEzvXZ1F8t/xuOCrijfWjVr82PeVgJaDhdMvO
 0TRH7Hr5fEuOd4ASp0+1yCvK3FNRdgVIrQyUfvdcgX/EgQyaprw5edOz36fQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33630-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jesszhan0024@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:dri-devel@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:neil.armstrong@linaro.org,m:conor.dooley@microchip.com,m:kancy2333@outlook.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,glider.be];
	FORGED_SENDER(0.00)[neil.armstrong@linaro.org,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,oss.qualcomm.com,linaro.org,microchip.com,outlook.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:mid,linaro.org:dkim,linaro.org:from_mime,linaro.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,msgid.link:url,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8BCBC6491DC

Add support for the Renesas 63419 based dual-DSI video mode
Display Panels found in the Ayaneo gaming handled devices.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v7:
- Reverse "on" command order
- Rebase on drm-misc-next
- Link to v6: https://patch.msgid.link/20260522-topic-sm8650-ayaneo-pocket-s2-r63419-v6-0-16edddda9951@linaro.org

Changes in v6:
- Get new dt bindings review from Conor
- Properly init dsi_ctx
- Link to v5: https://patch.msgid.link/20260521-topic-sm8650-ayaneo-pocket-s2-r63419-v5-0-dd5700299390@linaro.org

Changes in v5:
- Import panel-common-dual.yaml in bindings
- Set reg as required
- fix bindings example typo
- Add helper to switch link in order to use single dsi_ctx to properly handle errors
- Disable vdd supplies if vcc supplied fail to enable
- Precise the power off sequence is recommended by the vendor spec
- Drop passing of node to second dsi to avoid re-probing the driver twice
- Link to v4: https://patch.msgid.link/20260519-topic-sm8650-ayaneo-pocket-s2-r63419-v4-0-b8929af5e951@linaro.org

Changes in v4:
- Moved height/width in the drm_mode, duplicated modes to use drm_connector_helper_get_modes_fixed
- Create dsi_info on the stack with proper OF node and name passed
- Switched to devm_drm_panel_add/devm_mipi_dsi_attach & dropped remove
- Link to v3: https://patch.msgid.link/20260504-topic-sm8650-ayaneo-pocket-s2-r63419-v3-0-9f61cf24aebf@linaro.org

Changes in v3:
- Added DDIC compatible as fallback
- Added rotation in bindings example
- Fixed bindings subject
- Added second MODULE_AUTHOR entry and re-ordered signed-off-by order
- Link to v2: https://patch.msgid.link/20260430-topic-sm8650-ayaneo-pocket-s2-r63419-v2-0-91ac10453d0c@linaro.org

Changes in v2:
- Add missing rotation property into bindings
- Fix commit message & subject typos
- Link to v1: https://patch.msgid.link/20260428-topic-sm8650-ayaneo-pocket-s2-r63419-v1-0-981eb5ab5a51@linaro.org

---
KancyJoe (1):
      drm: panel: add support for the Renesas R63419 based dual-DSI video mode Display Panels

Neil Armstrong (1):
      dt-bindings: display: panel: document the Renesas R63419 based dual-DSI video mode Display Panels

 .../bindings/display/panel/renesas,r63419.yaml     |  98 ++++++
 drivers/gpu/drm/panel/Kconfig                      |  12 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-renesas-r63419.c       | 366 +++++++++++++++++++++
 4 files changed, 477 insertions(+)
---
base-commit: 640c57d6ca1346a1c2363a3f473b405af979e046
change-id: 20260428-topic-sm8650-ayaneo-pocket-s2-r63419-e72467e2db0f

Best regards,
--  
Neil Armstrong <neil.armstrong@linaro.org>


