Return-Path: <linux-renesas-soc+bounces-32787-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eNBbKdoaDGpJWQUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32787-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 10:10:02 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CE6D579B3C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 10:10:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4A1F4303DC73
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 08:09:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AED9D3E00B1;
	Tue, 19 May 2026 08:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pZ0t2SFl"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEE193DCD91
	for <linux-renesas-soc@vger.kernel.org>; Tue, 19 May 2026 08:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779178153; cv=none; b=WdneuZUEOGUHAGw/4IteesjVhhG3ZfASoQaPNF3qUcxMLrjOTnT4s07t3HdrBJ8s/EHPHt7gEbu0sqVTfYFIlalhTzDT7fABCFG8q5z9kkQ4S3UTwPQEULRInysAfbpest4WiNHPZMFvVgZig7rXvNT6dS3h+Kh07ScOrsYhhws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779178153; c=relaxed/simple;
	bh=r+//7BfKRoExdLXAW6UsFKJGqyUKXjQDp+OkD+3h78A=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=tHFZaN3V8xTMJFDOGKfUVTHvMcUmSfeGLl/5sRv5yFlR8BJX5a6rrqPuhGLc8Y7WofLgToQ6On5ND5ZJ4piEzh/rD/Q8hi7aVFjMa3CBnyLsJpLKFBsXehs6AetRs68nk25c3AV+7GqJlwUPa7CFVWCV+DcMcO5Fu5B7s9XOa3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pZ0t2SFl; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-488ab2db91aso33137935e9.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 May 2026 01:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779178150; x=1779782950; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iMQHjSEfbKROtejUXhzBkZMB9GHzcTlY7ZdrFaIuvzs=;
        b=pZ0t2SFl8NYaLIRxl6UjyH7b6cvK92Npl9JYB2kEmtimyWQfTez5Jkw0Zyr+k9D7mg
         FsdJzanH0XlYvw7gwpL6TfT5ALMx1i1zstrUqGMQacrF0kCswm4ps6A25YHW0UjMeDEK
         lO1HUgbQpASqv0o1DzCZSawbMwwzeBwxYZVMhid7qMH8HKzLdNnkg3B+9VImP+LEKLzB
         k2vxP3UVinwbePhgdNZJ7VP7wv8deMl5zvUpiASHPqlbJB17r6vpFT4SAvXIls8MMw+E
         NH/GBoPdWgIpn2Af5nnGRQkWQB1v49AhRgFxwPEnk40X6q11l4xPhBlLTu2NH03w6JC8
         FfYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779178150; x=1779782950;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iMQHjSEfbKROtejUXhzBkZMB9GHzcTlY7ZdrFaIuvzs=;
        b=qJqWp/o4unonilUTKJMmEHo8t7mgoV81vgcK3PqNRcTEBGDayc9sFHBjG4OMLOnMRr
         h2Ld8AAiZ0bFYGndmlLraj202kLTyp1yzv6/FAzHElkGVEqfg//QR6gd9hrbLaS0B2gw
         1im7blGI+HL3JNCjqKKc08ELXUzq78VoPPW1DmARiu0xY7ipq55ZuRDeXDbkk3d/fq1l
         magK9Yl92+YiT5mu9fvqB2GAvxx2L4HVbgauS4UHqSxX8jVAvRNM/sOjxb8B1F9dIzl9
         LrqZ3Vv/3kv+P/YOT/e85qJuJVO1HegV5/1aPnqyqbnkpxAfZUfweM9ahQaflY/0fXyh
         TdMQ==
X-Forwarded-Encrypted: i=1; AFNElJ8IOhBb/D7P6qFVwpICxM0ntXH0bC5DSIhy6oMTRaUqYiaXqrLJKvfn9wED0VtPxb+tsO4fufbp0LyHVh24PV3+3Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxy3nz6Y9Q9Rq/WgppLSRpSmcL3FolIeUFPtS+0gPFySNOCCZvW
	nHi0d/HGNwWRQs5YQKnzrTgakgVQW7v+DK0LWzeHV09T/IaYZhVhwOmPHXC81OLNzBY=
X-Gm-Gg: Acq92OFvUxUQI3LEF39om1aiBnsbRLiRA4NINNCtzXxrgnDRXCG9BzBRjRsXuso6+jO
	P1BP8seXi8X/XvAas2XkVi3fgMn8MSZUpD1ckFvJ69Ecrc/4CpTJRyYxr6X3hvo5sapMtZCmpHl
	DzwQblsMBH5mXf/cPLYwt8r9tvPTSwClxGH5XIOROXA28LnCnN2EYQfpM566OIH3RPUbYPm8F2f
	13232R0ZL0t8pIVkU3WcloIoNSCJcMLJh2P7AeX6ss/e6vdvKoMm2CtGk8Xoc4VDDU3hlW8G2P3
	ugICKCRaBUuy2EtQ8ICAHyaLuvNS0p9PkfipAKRZeXz32QA/Ypbr2teWt3RnT6gifSkxw7biZ6f
	9OOYX4r7FkJoWpwDq8fLhvofiJ10CGdAkS/LQbQRTl6IR6AMje7NDRHiRk6lv/xflBenEZuv3BC
	oKaYANZGaAJPFqyxs5ApK047vdcCOThoUyMAdWubZHlD+e
X-Received: by 2002:a05:600d:8:b0:48f:e6b9:c740 with SMTP id 5b1f17b1804b1-48fe6b9c811mr246894415e9.30.1779178149915;
        Tue, 19 May 2026 01:09:09 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0a1a22csm42856373f8f.19.2026.05.19.01.09.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 01:09:09 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v4 0/2] drm: panel: support the R63419 based dual-DSI video
 mode Display Panels
Date: Tue, 19 May 2026 10:09:02 +0200
Message-Id: <20260519-topic-sm8650-ayaneo-pocket-s2-r63419-v4-0-b8929af5e951@linaro.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJ4aDGoC/5XOTW7CMBAF4KsgrzvVePxDYMU9KhaOMwa3JY7sN
 AKh3L0xXRTUDZVm86Sn781VFM6Ri9iuriLzFEtM/RL0y0r4o+sPDLFbsiAki5oaGNMQPZRTYw2
 Cu7ieEwzJf/AIhSBbpeUGeE3arpm6FoNYqCFziOfbzNv+J5ev9p39WO3aOMYypny5/THJ2vvn5
 CQBYdNIbo1bzsjdZ+xdTq8pH0TdnOhOVfikSlWVzkvURnXo/6jqVzWon1RVVYOVPpB23IYHdZ7
 nb/uU/D6XAQAA
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
 KancyJoe <kancy2333@outlook.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1832;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=r+//7BfKRoExdLXAW6UsFKJGqyUKXjQDp+OkD+3h78A=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqDBqjPksCUJBpAkQN0vRqVxP5ps61f3y6/oQfjDEd
 WxqwaMmJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCagwaowAKCRB33NvayMhJ0UI2D/
 9AxRUbzdpr2LRnJ2bsf6wCQIm6ZrAGfggKvRBW4nMkCyC3jDxQZ+3pPtYmCwsOTG+sRRzXfJ9TkWJv
 hPoehKgbxptxj3jhHCcwa/Bd4gM4BT52sS2yjZwvvajj9yB5I0RQqPb95RDge+DKBlgnVtMSHCXFuZ
 ypP3V2sfqVa/9wnzGMYx37swFXS3iXc6pMyn1UHOuRv/oe7LnhwSLyLokeasrTpe8aqmWSwtOTjEay
 U9eG0MpDp4vW7XKpE7FymZkIOy+95T3qp+Q2IEgIecTMCvgL036JdgRqVRbln296y9Da+Rjr+6g7MD
 dZp/eR75T+OvW+5g0QzhEPZp+ZJrUE6D5yGpGXTd6rQLoajl7tQuEHV3vxD5sCIjgxYahXYcg5rb4I
 y0I4UuCzdTad/ZXoo/gBQTh2uV2visyvKbBUlIyFUfQnUWWjmEfZelGBeufQ+kpbYzsRD4lwWGflK5
 T68KhqG/PsDDKfKiPD5QFopRzHTY+dIKCAddsMm7WsyVUkAWXY21UCIFSvBGDO/ylhxAyIMaGtgaVw
 GwSVNtD2xM4OgAHBJS38/JXbBHwbtvXnliF3SxfnhoAm79ssTibbgNa+XBWEyd3phv6+wlXl0PBcPU
 zafXsjmp/11cbHpDHjF2gN7qoETlvubnt5/15o0RYNFlrLAVB8bUVqy+C/eA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32787-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,glider.be];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,oss.qualcomm.com,linaro.org,outlook.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,linaro.org:mid,linaro.org:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,msgid.link:url]
X-Rspamd-Queue-Id: 4CE6D579B3C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add support for the Renesas 63419 based dual-DSI video mode
Display Panels found in the Ayaneo gaming handled devices.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
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

 .../bindings/display/panel/renesas,r63419.yaml     |  97 ++++++
 drivers/gpu/drm/panel/Kconfig                      |  12 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-renesas-r63419.c       | 341 +++++++++++++++++++++
 4 files changed, 451 insertions(+)
---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260428-topic-sm8650-ayaneo-pocket-s2-r63419-e72467e2db0f

Best regards,
--  
Neil Armstrong <neil.armstrong@linaro.org>


