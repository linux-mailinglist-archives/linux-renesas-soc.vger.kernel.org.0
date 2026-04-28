Return-Path: <linux-renesas-soc+bounces-31708-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4KVfGsa+8GnSYAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31708-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Apr 2026 16:05:58 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id BCCEF48686E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Apr 2026 16:05:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0586A30010C8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Apr 2026 14:05:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03FE443E49B;
	Tue, 28 Apr 2026 14:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cb4edd6M"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD33943DA22
	for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Apr 2026 14:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777385153; cv=none; b=MlhHQ2M3CIiDsYpr3oFWrAHXD215nAPxm9QDJzBBuhuSqQBbGZrHb+WtbmotstYoozoaUMTrkCkcWJXZhr4AhQ6YRko1u3x4l6BYvUZ8pMt71Mumr3HG4sMsMbmAwHBGhfA6U6EVO+cJfsB2ZGzptB0nNQZhHWd1hBI2Gn+Ax0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777385153; c=relaxed/simple;
	bh=88pgZhsc8E1YwM4QVADZ+eYx9jSwGydBUbXrq3neU5Y=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=dH49/40QRuCwyD7slCj92xO44oBZksKT0aJNVWBkCtzAG4nBXa3m23nuz7YRxaNb1Mg4G78m0NTdUOSciFdiV6jVV32/veeX1x4w1TLafsrgVTDw1Y8/m4yVLcgkAPpSlM3i0dJWkGRYAZlgX0FbvOJO4sUC4WrTW6IrlTjn+8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cb4edd6M; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-43d76dd4ee8so10197723f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Apr 2026 07:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777385150; x=1777989950; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bRQEHJ1gmgZAbyT1I/zyFm8qCQLY2gss42m4vu095n0=;
        b=cb4edd6MBJmAPx0kxGpXN+wdJocDy8YldqgnCt+f3FGM6amTmjtR2/NTissDmtDd+F
         iFZBQQ4OouLD5btENufq6drSl1GF8sNcV14+kKvfhsUml8w6L5AeS9x75YqXtRjB/k3X
         vOU75ujsha14Ldf5MfcjxG2rO4gjtD6HB3A7+S2aJ01VCcUCOC3bAJtoOFL6pSRo58QR
         7fV8xlftDHbUioApeIEFzbvj8WI2B1isF1UH9B7DxtmUK0ijL3t0ssEOXvj8Rt24ksF/
         ah/tbwzWqqXAqfMkqJz4XyxpmtBHE9xBRfGh4GH9KaxL+GSzrZwR1vhGhy9VEhsUd85x
         ch0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777385150; x=1777989950;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bRQEHJ1gmgZAbyT1I/zyFm8qCQLY2gss42m4vu095n0=;
        b=rT3128D77u0yg5lLIYGqNv/Nym4uWsc1fBDN2G+yA5+3qP4z+W2lOPidBXVbNs0ZhI
         asqmWhiry67iIvYyfR6re6WlbeW5L4rzx+vFukzcAWLclM4ljqSe7Lg4gy/WIoGCZXJx
         oFR4fOAKG9+nt+/MY/bhGhEbMgEweTWpooVKmCmtSxExoGbqHp6sn/ulb5/UIlJsJypA
         pGa0KnUIqMv9Vs0sZN6s+jOgiG8C9qMXHLat3mln3LZypJ6DSkuwMj3grAJoGZOPLfw2
         V9dLiOXqr78Mq/As9iim0krNBZ1S8Tjtd3o/og6xhH/Q7F2u9hGEmMcltuFCHoCrucgw
         tN/Q==
X-Forwarded-Encrypted: i=1; AFNElJ/lGXiMSVoXnV9AXvtU0woyAYe58blVgUMDpBni/pmer2cA5Wj++UjpTc7kS6Mjz2XXRnAfjM3mmDINkzFh19oZ2A==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywvez7USjWZAxM4S9akG/SycnUJWzY+GdfwpDbEdlV/dSy2LGch
	YM8NX87Ex7CP9mns9mjt4kEK2GVJdypzlHEEqjgH2D0sckjod9bw/p5DeJjB/nlDXRk=
X-Gm-Gg: AeBDiestbZur9CNUsnLxytn0xx3qKyLF4QAjxFUf56j6xzKPLNgzsiPRC2o4zeDKAlJ
	2kGVL1e9jtWX9prW93a+E7tyTiOuhVopJsRSbDEXisURofl3SrdEq2TfeFRrh1zto/+J6cIqz3Z
	awbTpBVjBJ+0Hrrz9VakRnUUre7kqBuL+MNSNNGKeDz49wGrxszludH7EB25HnmTIdR8pK/XExB
	CeTqcby1A1iI1gAcPxuKeXfFrr82oxd0KsDCrBr9cCHv2xstmmuDTJlKmdmErXFfQUvcR6yDEtF
	/Y4cynfFRq2xRb+UejgtRlWMFPYo1nA1NKUSakqIVUuf5xZPc8ls43+yyBkzYf2N9pFzmYGQ9gw
	yD/11rn1TYov3G54v1U2kx7REOo7veqxLbXVZ+mbyQXotz/tMvSHF+hehtI8EeQr+TJFSv9tyt1
	A9VM2dT+ZZIYWTDTHIFRA20yklEE8lbODduKcM2Fp8O/7IJgnGZ8e27l4=
X-Received: by 2002:a5d:5f54:0:b0:43f:ea25:20ff with SMTP id ffacd0b85a97d-4464a1685e0mr5748911f8f.29.1777385149896;
        Tue, 28 Apr 2026 07:05:49 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4464004ed80sm7143264f8f.34.2026.04.28.07.05.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 07:05:49 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH 0/2] drm: panel: support the R63419 based dual-DSI video
 mode Display Panels
Date: Tue, 28 Apr 2026 16:05:45 +0200
Message-Id: <20260428-topic-sm8650-ayaneo-pocket-s2-r63419-v1-0-981eb5ab5a51@linaro.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALm+8GkC/yXNMQ7CMAxA0atUnrGUmpAWroIY0tQFg2iiOCBQ1
 bsTYHzL/wsoZ2GFQ7NA5qeoxLmi3TQQLn4+M8pYDWTIGUs9lpgkoN57tzPo337miCmGGxdUwuy
 2tt0jd2RdxzQOZoKaSpknef02x9Pf+hiuHMq3Dev6AauhPEeIAAAA
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
 Neil Armstrong <neil.armstrong@linaro.org>, 
 KancyJoe <kancy2333@outlook.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=910;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=88pgZhsc8E1YwM4QVADZ+eYx9jSwGydBUbXrq3neU5Y=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBp8L67GKe5ofqeuJ8rIeXlAFfbCbEimZSktcmLWvLR
 D/De/gKJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCafC+uwAKCRB33NvayMhJ0XEED/
 9TvNeA+di5MIBpxZOFwW2ddOJGqL9cu9ZgKv3w4xNlVpaHUT8LbdEOIlMdap8lo5IqfjLNWPRncIUQ
 2Ysxv57Wbaun6wt6puSjABTBM9Mwvy2mUSakseGinNp/H5MLiWA1KEeGiuTRYFxPcR/3k0jGL7zA5C
 7SQXTAB8gaWht1BEncZATE0aRWC7hAFpUI0JSFGt55DsT0QlBn6gn9rcPtyfyOG+tx1SrlN7Rbj5wu
 X7+Gqn879GevK01/3ya/ZYUCqYBCiWtwEVrsYYFQkgwWDFakW0j0P22pyO0I9B4vOXoGPGTJ0wD1wM
 5rTGVDjbyiSz0ekhf/GdoTuyfmAyvLYxVs6ReDyJBFQEF1CxuLi7SDCYYx8iSFYodwim39AIo+PQHA
 LiNbIjs6jzeOFKPL5eg0qnfyagytd/oN3+asZ32kz8I9MNdgefR/bcAdW0bRdX1qSX9Wly0lEdJW9v
 qLC4MFho2/9M4LMvXI5RJNIwG4brTBJPFsaIi3A8DHjkkuGpIu7orqW10CBc5byuxsje9aSR4Lj7/e
 R0mgURJOPoHxURxjUELThRgvvUv50RogkbXyMvhKnSPBtUNMP3QvWNmqEWDe8SrQ5YkhV3zNy2rVqf
 DvPzltxQ6MqwjP3ff4LHpLBIDj/PKtYktZ2V5BELAqnzArsj1IxhhfXhrbyg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Rspamd-Queue-Id: BCCEF48686E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31708-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,glider.be];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,linaro.org,outlook.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,linaro.org:dkim,linaro.org:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

Add support for the Renesas 63419 based dual-DSI video mode
Display Panels found in the Ayaneo gaming handled devices.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
KancyJoe (1):
      drm: panel: add support for the R63419 based dual-DSI video mode Display Panels

Neil Armstrong (1):
      dt-bindings: regulator: document the R63419 based dual-DSI video mode Display Panels

 .../bindings/display/panel/renesas,r63419.yaml     |  92 ++++++
 drivers/gpu/drm/panel/Kconfig                      |  12 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-renesas-r63419.c       | 356 +++++++++++++++++++++
 4 files changed, 461 insertions(+)
---
base-commit: 39704f00f747aba3144289870b5fd8ac230a9aaf
change-id: 20260428-topic-sm8650-ayaneo-pocket-s2-r63419-e72467e2db0f

Best regards,
--  
Neil Armstrong <neil.armstrong@linaro.org>


