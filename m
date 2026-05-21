Return-Path: <linux-renesas-soc+bounces-32897-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UGyqLxG/DmrXBwYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32897-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 May 2026 10:15:13 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F9F5A0DE2
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 May 2026 10:15:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7A02830451EB
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 May 2026 08:14:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE0953A542E;
	Thu, 21 May 2026 08:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uZF1b3f4"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E250C3A3826
	for <linux-renesas-soc@vger.kernel.org>; Thu, 21 May 2026 08:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779351265; cv=none; b=X8Kk4IJjE9H0y0SdcWLkGMtE1EZ5EQq9l9k+mWvznSI5mAip0SN09lq+LD0EUW37yF4ulc7E2HkX1lGal2lqiVGtV8fWcW9b/rklfTa8AJvKnJnD7hideilp9e+XAgSXOP8Lt0JvP8lLw3e2R6T8vKFmub/mUIqYVXy1IBz1lBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779351265; c=relaxed/simple;
	bh=0pTdcu/kVI+eVxLSPSl8lJa1+3nzA1VclyY+DaWoszU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=B0UE2Vdq7c3Q0CccDVW5Dq0SGqwHQdiUUdq711djHN1c2PbdHM/nYAMaI0hHAGVYCEIvTggobcNA1oz9nuBjyJCrJJ3Df25rGe6yokbxqWd9o/bLwKdUq3w2VSNGU1MbEXkiSAXNPV6gjzbhMu7ixsbOFCqy8u+ZZr7ZzKIOv9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uZF1b3f4; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4526a8170ceso2791197f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 21 May 2026 01:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779351262; x=1779956062; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pGOnSJlvkub39LzIjocgenS5JEKrBfHwIH34CbFHt/0=;
        b=uZF1b3f4OEj8KtUnePsop7PrV8mevXnfmVuAWLl3wDSG0Kc0xTd23mu4QUGyCYtW4x
         wuStMZy41z4/rUfXm37ZCEn6L1D7f6OC85yjUytGMe4Rj+dHepb1V+/2EgooZIcNYsBA
         ncEcXtCRCVQPmBVC7wqFFdXharn15gG1KRWLgpbVqWsGKY5nftiMicqgk5tVX9jC+rzO
         ofoRUI4RVya6gwFyzi/XyM4dsOuW8OlvO4cAw4cmnTQweXG/a9nr+2JLBncspNAqDtX1
         t2+UbEGPnnWGBiA5J/mbw3rZPByxTWSmR0OKXl/Vxpvfm5oSenLQgz9NUnU59gnMlUUx
         VIWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779351262; x=1779956062;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pGOnSJlvkub39LzIjocgenS5JEKrBfHwIH34CbFHt/0=;
        b=SdDuNmP4p7PJElXudmQzFL5wBsAdkFhxKhilzBH7qIdGiVucKlDyo4lkBc8ULJ3Xxn
         /zLyJBNmxcrXE0nzeZdTS+FzabG3dzxAgNpHRBjChNrAlgx5Po8XlkVkimkUDJmLr09V
         nsLbQ5DRKzK/Vzun9Ga7+tfpxI3m31rcfZopQTfL/iSPUDl+C2zz8QdUQn/KvuCSA/oY
         KVNKWwdc2oCX5vZd2+n6gX80sn5QmwpgkHy8+81izLGZ2kH+p7RT+Y3YhFCQ2Ij7xABL
         8ccFja8PGDoysu5y96UGOfrpgyrRXp2ukTm9w5Gk4+LBmWir5jQjOY/RfTwq7qBrtbvv
         aptg==
X-Forwarded-Encrypted: i=1; AFNElJ/YEQZDxl4rNoSFTjcvn6ue/avCwFd9FVmBuCZU34UzcoRVzSvU8YXYwzcqbIJfRqtfObhuUxmh7QxpN0GwXBnBJQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2JdXgiSrPEbr5Bto13VxKcOCz9uBgqwXw6FH0xkkWzYTNJ55X
	b5VD2I5bGCRAigL0IRONmAksmm+TKjKwhnoBdhsbraH2HxdxREDhqFq19UQhMj2AmDA=
X-Gm-Gg: Acq92OGilzcOiW4T90MR9wtsPd3peZqIzyc+ssBlg/x9iPxH3T/dXEV6RIfjD2Hk26C
	0w1nY7xr6nASMzTeKS1YOjt1ga+t+oImASFpPZCNUs6hXIeluSW2ud4Ppyl3nG59cgZ78kDzk1W
	1lm4SlzGOQ2a2apc/TfX6XUCzwYrMeX73sV7xVYdtQVcs/bTIP0ncV504K+XXTqqSYticxpdsLG
	U1pKJvjABlxyvnO1ov8oEBMnqZrN5iED71PXkJSeK8XELgGcZtO/sWmEAdOKSxF4l/kdpsp0DK1
	PQZk6Yw5Rpy7h6VcPY4RWC056kDwBCxSAjdVKm8nPWhHzJd/MVXF+x73GbulaCwoByKpJNWh7nH
	9AZURU5+L6aTwAm95VbOvJidmIi5SjHwLt3UeiOJm0do7uq+AdQcVIygu1uOY4ZsEr9uZ0dP7yx
	7NmBOP9CL9qHRIlPcRIiSkZ1AnwGTrlabF1HUf8gZhbwWk
X-Received: by 2002:a05:6000:430c:b0:45e:9417:556f with SMTP id ffacd0b85a97d-45ea3ef385amr3051597f8f.39.1779351262175;
        Thu, 21 May 2026 01:14:22 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eaa7dab28sm1056384f8f.12.2026.05.21.01.14.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 01:14:21 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v5 0/2] drm: panel: support the R63419 based dual-DSI video
 mode Display Panels
Date: Thu, 21 May 2026 10:14:18 +0200
Message-Id: <20260521-topic-sm8650-ayaneo-pocket-s2-r63419-v5-0-dd5700299390@linaro.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANq+DmoC/5XQTU7DMBAF4KtUXjPIHv80YcU9EAvbGbcGGkd2i
 Kiq3B27LKjoJkizedL4eyNfWKEcqbCn3YVlWmKJaaxBP+yYP9rxQBCHmhlyNFxhB3Oaoody6oz
 mYM92pART8u80Q0HIRirRA+1RmT3h4HhglZoyhfh1rXl5/cnl072Rn5vdNo6xzCmfr3csou39s
 3IRwKHvBDlt62jx/BFHm9NjygfWOhe8USXfqGJThfWCKy0H7u9U+atqrjaqsqnBCB9QWXLhTlU
 3an2wTVVVdV2PvQ2a+j8/sK7rN/SMXTDtAQAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2346;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=0pTdcu/kVI+eVxLSPSl8lJa1+3nzA1VclyY+DaWoszU=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqDr7belusu44FW5o5tWy/5pavxW0qYJXy2xYOIk1N
 HIk0ojeJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCag6+2wAKCRB33NvayMhJ0RDtD/
 4nwtOkEETae9L29EDFr5Wp/CKfD0Q2rJQfvKzuHuQuZRXnUtbvuAFS1DzjpvSP+5avgjgZcXY5dIyu
 jtIOugjYR7reb8kOwLGlOIYGeKRzy0JjyBd7bQD/GXustifK3ssc1GvpWR2Ia2YduINdoocLpJFIJV
 ELnklONOBnw/egakFHLU/dFewh2Yx54p0m9w/HcgiXmlhw2HDv8d6v0+5AiotFEjOUFQiFOAcHxN6k
 hhTU9tc/zuA3SWcz0e/hyiF124Br7ZMvxwq+/j2n3Dkq5UEUJWD31NnyWUbFKxFHh1w3pxlXnl9Mrl
 GycqiUzdWenWAPjmcLLHD7UjdlNTvGTFpSrGcOTBgJJE2qDA8Hvi/G1zteT+gj2DDzNM0rv7eO/4DH
 FXTa1RLmljGt+4lxh9tevxfQmO6q2kzfgMHxsPjiQvEi0EgPLGUPydlOi2BL7dklwWtVwaCNJeUOHR
 U9/aOEyaPKdjloZjebasc63GTtE+GyS6fkeNEGvcpYG75l7zXTwRhLA5GyDURLV4vrQJVgQP3q8HYp
 YNhXpDtjZ2hvfgk19/bLqbaxlY+SudP5q4Tv81vyDUbwbSEmgQv/28bTo1x1ooO2c0X6uJnCdq8QOi
 Jvh2KODE7B7fi3/mmPgaUt8AAtKZvHG8p0abKkxpWXQlY9jczpIJQBHQEbxA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32897-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,glider.be];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,oss.qualcomm.com,linaro.org,outlook.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,msgid.link:url,linaro.org:email,linaro.org:mid,linaro.org:dkim]
X-Rspamd-Queue-Id: 59F9F5A0DE2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add support for the Renesas 63419 based dual-DSI video mode
Display Panels found in the Ayaneo gaming handled devices.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
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


