Return-Path: <linux-renesas-soc+bounces-34416-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7eqLFu/0PGrruwgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34416-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jun 2026 11:29:19 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EA3986C439E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jun 2026 11:29:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=uNft3tnY;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34416-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34416-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D980B30332DD
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jun 2026 09:29:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D273385D89;
	Thu, 25 Jun 2026 09:29:14 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABC7738654F
	for <linux-renesas-soc@vger.kernel.org>; Thu, 25 Jun 2026 09:29:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782379754; cv=none; b=fo6YyFU7nhzoxO88+Sh3j6qMQoygKy6m3INcUpemgbuU0xNlleyH5bE2b2XwDOvTQ6H1+ox6q8eVYJ3/Cvn7Tf+MCk8k8QpHoClxDjN+wLhVduSPXfRLlwuHtNfdd2Y60VL7JHy62skcNN+miEYdsrNRFscDat916vAyS1F++gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782379754; c=relaxed/simple;
	bh=JZ6x+4HXQCf0qklTwQbSEog/fEcbxqfwTfTEQH/gfao=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=A1DE3SWTC0hRDQRO+diEIg34EzOGCVpKscVTDn6ByoW3I17kkaWoHcALf2TtrtcGbIsg6Mb57Cjzxa7KdTgVV+BpcpYoi9fmm+qJSgKTVWMKj1Ow/HZVTi1c9saZqnh/qoBM6GeqoSAob2JgXeti0Z98+CCF2jOcA0SpzaYYDbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uNft3tnY; arc=none smtp.client-ip=209.85.128.44
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so14321725e9.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 25 Jun 2026 02:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782379751; x=1782984551; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1qmqlBS+NOvUVwDO1d/d5gRMpOTlf6GDJuFG270RH6Y=;
        b=uNft3tnYw3aY47amy7tKi4aTTGB/Y8XazZ4w3BpCxLgScriZAk35TlzkOqXh2FR+aT
         wvx8/BJaYD5BNxDHTA9g3y+VZg5vEmkOfyZcB6Hgt074RQIz64j4ZTYEkmBCwyw4/0dM
         7Zbb9G4aTH6/H6dZt258q608/OI5H3XdnlAYBjU/7D5D1kDKlQCfPjnghPy/Yh2VXhMj
         IS9BSpsIn2Sh0Yv82NjqYYzillwVXJe90EObqUEFeCAOj30h67t+revsZ9czI4w8wJQs
         J8c57W29vVTCKUnCrVcnNRBgMo391xEEdjRkkU+bIxs7fnmv2l71qPhwoDnYisJWp4J+
         B4ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782379751; x=1782984551;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1qmqlBS+NOvUVwDO1d/d5gRMpOTlf6GDJuFG270RH6Y=;
        b=HoO8Ro7p9HpFoPPA06h9Wg8oqrNJfl0uo9xYdcRZWW+y782M0Pr9F86c4AJU8y/4Lp
         gw/NffXdEbG3cxM9jSuTs/xJ6ytvKIOwMm6xIa5s7a5kuos9+b8hE5vI60JU9xcW7rbg
         Xi06uh9vcihZKV3ks3ByCGfrVV7ykbxxMYhPizQXyAYA1LO13mNB38OL4JZIYj4BHZut
         fa1sIiQSOJQ9EhvSt5hVMiU4lI8veAXyvwdowrO63pw3tatVZElF9Fhw6ZHlgWgjq7w7
         wUlxV9alouzUFu3FDzQTkBXwVocUIaz0lzmJAxXYYzZVq8buDgZZTsShi+JS5aldcAih
         96PA==
X-Forwarded-Encrypted: i=1; AFNElJ8urCaYQIR+S/VhQdC1Ms0AkROJzt9lOKgdSQ3GjV/35ENTu5+SjBpzPWDmUoEO2OlSz6eF+HB24Sn1LyBp0CJy3Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyTraTV4A1FVAhj+MxXL4Jg3lTJcWv7hee9g9f1vqQ6RACuAP1g
	lKVOVlozCaSKl+wVlVrq+SRKP1HhtfFfgvDgf2IFJTk51LtNpWOud5JtzIEPi4z7Yas=
X-Gm-Gg: AfdE7cl4t1qkB1mIwpVOMtYuJcJ095OMO/ES1cfN1AAtGsa3xx1WuI5vLbWni8FlxlK
	IMH7TNKWZ5Crpa5eEev1Nc8sZry4FJu7yAs1YTizygXeGcSlb/FGySeqsoXBh7RXfiMxWM2+KzK
	gHMkT7lNIVgfpdYoK2kH1PnglwyFQ9HMjiNHUZ9JsPsl8T2Qd1672sZKBCUBK13VA0eg7H5n75E
	1eYQYsX5blepOcFPhDgeLljgR6rvDGMKIfII+PKOvoEY8lyAPXl19AsxpIthtjGHfjK1FKtntDt
	TV5NTaUCCvxrg9mjBusvzXc0iRZUq3oTqJSiekRuih7i6hZpVS6QQcCtHxNRzVDLPW44rf/aH8+
	xPC2G8mbReZgaeImyvNbvnC+WSgQOZsbHpmCH5XIHHIz/eJg1egGb7tiO+mMJnAzT2AkuXIhs7y
	Pj4Mr7e98ao7tSulszrkVypXXN0W2WiRZNsQ==
X-Received: by 2002:a05:600c:e557:20b0:490:a1dc:e542 with SMTP id 5b1f17b1804b1-49266862d71mr14954775e9.6.1782379751095;
        Thu, 25 Jun 2026 02:29:11 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4926544dfaesm33846195e9.2.2026.06.25.02.29.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 02:29:10 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v8 0/2] drm: panel: support the R63419 based dual-DSI video
 mode Display Panels
Date: Thu, 25 Jun 2026 11:29:06 +0200
Message-Id: <20260625-topic-sm8650-ayaneo-pocket-s2-r63419-v8-0-8570e692143e@linaro.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOL0PGoC/5XQS27DIBAG4KtErEsFw8Omq96j6gLDkNCHscC1G
 kW+e3G6iCtn4SI2I818/2gupGCOWMjT4UIyTrHE1NeifTgQd7L9EWn0tSbAQDMJLR3TEB0tn61
 WjNqz7THRIbl3HGkBmrWQ3FBsQOoGwXcskEoNGUP8vsa8vP7W5at7Qzcu9tJximVM+XzdY+JL3
 z8jJ04ZNS3HTtn6FX/+iL3N6THlI1kyJ1ipgu1UYVG5dZxJJTxzG1XcVMXkTlUsatDcBZAWu7B
 R5UqtA/tUWdWuNWBsUGjuXECtVOA7VVVV71XDGBgjDNuoeq3CTlVXlWv09Vlzb9fmplZ3p9pcL
 yA77W0rwYg/6jzPP1dCtSPvAgAA
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
 Doug Anderson <dianders@chromium.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Conor Dooley <conor.dooley@microchip.com>, KancyJoe <kancy2333@outlook.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3109;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=JZ6x+4HXQCf0qklTwQbSEog/fEcbxqfwTfTEQH/gfao=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqPPTkU0lwl9mndInTTxFKj3+RDBDu6m+62iBo+2Vt
 hlUQGriJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCajz05AAKCRB33NvayMhJ0d+KEA
 DNc7WttevYyJv35sE13rnt1FLMVAaXNcwOD6iRizL406fRZlqAw/PMLkxO1cNCzpqbE5zDQ2B+MAiB
 D2c5fT8KFdlfX2F6djJ9lu7UooNnfu+PFHlavPwdowmB8sk+q/LNOHg7QsInGdfdWBkUsyXVaqEBkU
 98qC1EZybMaQSxiqL7F5fmhuMt9GOO1vbtK87qQ8D/5PL3qyEswP2gaBHYbo+bvfw/68Rer8erU5qf
 b/E27zRNAmdYOkmXgaq13OJ+gb5n3/rqOtNMvYNtN6xKoxsrBCpdK7jh4ENvj/fu86NehhUKLfl12P
 TMkPBAjGmtxF7FTJwRwfTPYXY0wi95w1ONgtLrYAF9JYi7H7/KUTxsibp3Q1Sdm2ZjfbcKjkDCxZQi
 E0jdsQIjFRM0PoPobzpPUbOgA/C9s67nBBwo2IMdcFgNx6782jXkBfnro/6iRA/CgCaQsCYIQCy2bU
 zY0EWYTykKCiQ9OYB0BD1qkD8tZ9KydQGHyZs/ag0DPTKxZbkQ3TuEp3ixXA3NOB/dLI6XiQ0S+pRa
 q0F4LG1aLGvtS62uC1gDhqR8Z+FV8GoNbd3gNTkB9ppsPUHbv14NTwibSxcbtpsHEEN75ZvWgSVcl7
 y9SpnMGYL0AkSZOWZViH4j/PkSavgA2UJYlNBDrleAp5AYz8Co2CUUWYSk+A==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34416-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jesszhan0024@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:dri-devel@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:dianders@chromium.org,m:neil.armstrong@linaro.org,m:conor.dooley@microchip.com,m:kancy2333@outlook.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,glider.be];
	FORGED_SENDER(0.00)[neil.armstrong@linaro.org,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,oss.qualcomm.com,chromium.org,linaro.org,microchip.com,outlook.com];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,msgid.link:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EA3986C439E

Add support for the Renesas 63419 based dual-DSI video mode
Display Panels found in the Ayaneo gaming handled devices.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v8:
- Use mipi_dsi_dual instead of helper
- Revert to recommended prepare sequence from DDIC spec
- Disable VCC after gpio up
- Remove drm_connector_set_panel_orientation
- Use 2 params strscpy and make sure mipi_dsi_device_info is cleared
- Link to v7: https://patch.msgid.link/20260605-topic-sm8650-ayaneo-pocket-s2-r63419-v7-0-b84b6da84293@linaro.org

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
 drivers/gpu/drm/panel/panel-renesas-r63419.c       | 350 +++++++++++++++++++++
 4 files changed, 461 insertions(+)
---
base-commit: cdeb2ccd993ed8647adbbda2c3b103aa717fd6f7
change-id: 20260428-topic-sm8650-ayaneo-pocket-s2-r63419-e72467e2db0f

Best regards,
--  
Neil Armstrong <neil.armstrong@linaro.org>


