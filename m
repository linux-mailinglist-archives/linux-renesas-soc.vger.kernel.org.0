Return-Path: <linux-renesas-soc+bounces-32986-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6F0sCyhaEGqDWgYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32986-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 15:29:12 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D7A35B5295
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 15:29:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 35C27302E8EB
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 12:51:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A91B379ED6;
	Fri, 22 May 2026 12:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zzHtKu6n"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B64020B80B
	for <linux-renesas-soc@vger.kernel.org>; Fri, 22 May 2026 12:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779454293; cv=none; b=Zujq1feckanucWcOr6YzVry6tpwxFoZADKAfkaRzPdHyvrug6i9i1ZdQfiT8veu3+MCkZR73yteVxZboK3BMXW1c/4U6jXk42We7//5Q1FonLYos6mdhXJwqGmsd4hZetiJW8C/wKONMbRFOgohUgclImtGRgkukBoJblHUpCF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779454293; c=relaxed/simple;
	bh=yu5kbiZ7RSpkU9DZCpgGVCTo6zTSxkQHUhlI1OpeSZU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=A1FFV9PonReXVEfadgMFhPEbpaNGntv0zi1W8Dt2pR8CKP/q0xUV2JUCBFF5sGQZwRBCfqdWPNZGzQE5kqyaMS6uKtQQtY02xh4o5qo5mFkpkTVO2x3DZdbF2niSGMxTL5KhPnQVcmlBAnzvPm5nodTTnUG8/JDUkp0+niGlnKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zzHtKu6n; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-490388fd0dbso17571735e9.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 22 May 2026 05:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779454289; x=1780059089; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qITjIxKdpi1UQe1FdVWE4w1z8BRh8hFPuNNNTfo269A=;
        b=zzHtKu6nh4XBf7tGVPLn6SGBjaZrPlDygaPeZU/Sparb2vEo9dhwIZyjg4ozIx+7Iz
         qVMoPa4m4vFa0B1nYKcDEQmzG4XudSBuQmzDg1mRDMVCKQ6iiO52unaSOqpM0kQVpkQv
         w78tFJidUlrilT3UQEx1/+bKlptU508scx2luSsPCoy46SEcIKsVev5AcUwLOvIKikyG
         S+0ukGpcSRONEoOCTyOZoVFRCm5hn7+9+jOir0m8G74CTtX/QNZ0hrc+QyHHj50HiWq2
         9uSc5Y/Uy5cQ8eexofeaB6xAk37HI1zVx0GmT7eUl3AQUyn+pc57uewYusM8hvrhGt2H
         Wykw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779454289; x=1780059089;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qITjIxKdpi1UQe1FdVWE4w1z8BRh8hFPuNNNTfo269A=;
        b=ofHX7nes7bkixKfVV/zaL0DauZT+7H5JxvHpbb+oq3XI/eu79grXIw/nnE7ViLPyDf
         MTa10avtNFU9bXueAqOXVr1stDHTtVpBLI7Pv+KGTWL+7wQIlaldECX2OnO257BhrcG2
         ZAy2y68oVulTIHXZCLeS/BBRXxx6bCqQmUnxSX/gndQ9Pwltk9gY6X/LVNLmMU11ojXK
         qR7fyWo7P4HTXdSxL8Ts6K4QtlR2T7HGRAhh1NluOLlMChWAZqE+3rOgd0pgRoXeym7c
         i8Crtk2LLxkvBO9PCYddmHnpLjOac78LziQ3yNlWhdwhjvI+T2K0N4GKLxgBH+ycA6K7
         cPzg==
X-Forwarded-Encrypted: i=1; AFNElJ/hrfDBXnXPUmvV3szLojFM0mDo7BmBFKpu+cGV5adPvMp/BCdsrjnCZbnPSeF6X0ZJa/+TKOvWk9vW9HgvvANeTw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyavz5px/42eGz2Ri+ghadA4II6HJvYzX00sQZnd8wE1ewO5Sxt
	ngriwss5zKPpWL7nGgqS7f6yMN2TZys010uPsDoffDLd+PudnSXm0eyHGjEpJI4dMaw=
X-Gm-Gg: Acq92OG7KAcYUByQi8TQIKupyibpPXkIdmxJVxf0micV+UvQd835TaYLlPQI9nMWGgt
	bCGtr6m1ZuAYA8+0KaxkHLkXsXMlkS03N/WvT6sOa8vO1j46za2qXEtEpjYDcCLuRyqGK8h+76a
	xh5SBkHeCd/EklzmJLjYt+Q8NHIM4+h3qfisBUgSts/EXUpCKJcO6Twy3dtzOfUyesz2CdFob+q
	p3a4flxbhzrmc3gOhw1nfwyYVq9GLu+9eWaaZXOsYJN+cGw5I4aATBWwDxmkrT7pfrmOsR/4qKT
	mDdwKrZVctIcKCKyiIY6wvJ7ODhMGM7xUXVxcdAzI7HasPIfbeZ496d12nuSBSdqHGvIuDi05LZ
	35dptH099kvXF5EROjJhKNPpwwqJSkDipLIhZ8ELzkh3nG9GBWEAmTPELyS9Loo3mS2CzA4CatJ
	RmO7u/wi+VcEPANsb8GELh1EQCutjy8JwnJJx7NiiNBG/WKH0WiHbZF1s=
X-Received: by 2002:a05:600c:a14:b0:48f:99a9:bbcc with SMTP id 5b1f17b1804b1-4904249af8cmr43036585e9.10.1779454288848;
        Fri, 22 May 2026 05:51:28 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49042af0ac1sm15046735e9.31.2026.05.22.05.51.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 05:51:28 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v6 0/2] drm: panel: support the R63419 based dual-DSI video
 mode Display Panels
Date: Fri, 22 May 2026 14:51:23 +0200
Message-Id: <20260522-topic-sm8650-ayaneo-pocket-s2-r63419-v6-0-16edddda9951@linaro.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEtREGoC/5XQy07DMBAF0F+pvMZoPH4kZsV/IBaOM27NI47sE
 FFV+XecsiCoLII0myuNzx35wgrlSIU9HC4s0xxLTEMN5u7A/MkNR+Kxr5khoAGFLZ/SGD0v763
 RwN3ZDZT4mPwrTbwgz0YqYTk1qExD2HcQWKXGTCF+Xmuenr9z+eheyE+rvW6cYplSPl/vmMW69
 8/KWXDgthXUaVdHi8e3OLic7lM+srVzxo0qYaeKqyqcF6C07MHfqPJH1aB2qnJVgxE+oHLUhRt
 VbdT6YJ+qqtq1Fq0LmuwfP6A3Koqdqq5q3+sGAK2VFn6py7J8AU7ZUANDAgAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2545;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=yu5kbiZ7RSpkU9DZCpgGVCTo6zTSxkQHUhlI1OpeSZU=;
 b=owEBbAKT/ZANAwAKAXfc29rIyEnRAcsmYgBqEFFOKZN7cltSl4iY7VA4xytyu+IWa1ufwwM5Ync+
 21HH8U6JAjIEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCahBRTgAKCRB33NvayMhJ0f+dD/
 dluIr2VYAGxXnbAONds0fhFF5qTOghobJH9hzEpYHGTzmHnU93c27IYNjTSTC5QgO9/bWP9SB7UB/z
 ozJw9jZTuaNZSsAF1tcBr7mLUmHG3dY2DAS8qMhimo8RtjilNVKGW7vBmYiyCrFcACwltHKjSPYPHr
 C6UveKj5kVweeUdCj5guO+77zseBf/pQ4w+R7FV93drAT8NpmwpB++7PbzcztO5lmlxpGS1e4P/Cg6
 gOnaML1kYbcUxhF4evNIlUGY1bZvaxje6a5IcDcs0ZaqE+R0jPAYpKAeCn3owrb0tXQ+vXfY3f8R9o
 kzOfD3eDW8OO/DM1GSoNOXZgQmsfdF4JEu+GyCyVV+99PuQgFgIVqomxolGCFM6wUjHVrgVoVnQpkS
 G6EgrymFmO91ojg838j709OMdA86FDkLm7XugO2K717YVWaxUCKBy3ACYp5Eg1Wt9Vkns3Wj5nGQJY
 ttOb2su2YDgeVUEmoWwGrs4IQ6daGmERStSveu2TRUYCYW1n/XAOEOSZvpUOcpOL3t7EXtguZ5vBHe
 UTKDOf/SCe+SH3l7NMqGXmi+sgwteX/IoFH88Tiu6V8JXwayeudqE/umSKZz2hvMNTE4BCR97hyS2K
 a7jc+Klcg38Fa9i8mZq2Q3FC7m01clxHgBk2f13n0UfDRD1upullV+NCz7
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,oss.qualcomm.com,linaro.org,microchip.com,outlook.com];
	TAGGED_FROM(0.00)[bounces-32986-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,glider.be];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 2D7A35B5295
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add support for the Renesas 63419 based dual-DSI video mode
Display Panels found in the Ayaneo gaming handled devices.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
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
 drivers/gpu/drm/panel/panel-renesas-r63419.c       | 364 +++++++++++++++++++++
 4 files changed, 475 insertions(+)
---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260428-topic-sm8650-ayaneo-pocket-s2-r63419-e72467e2db0f

Best regards,
--  
Neil Armstrong <neil.armstrong@linaro.org>


