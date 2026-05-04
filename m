Return-Path: <linux-renesas-soc+bounces-31925-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OLG7GapT+GnSswIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31925-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 04 May 2026 10:07:06 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0625F4B9E33
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 04 May 2026 10:07:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 11919303DA9F
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 May 2026 08:02:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EC7B314D1A;
	Mon,  4 May 2026 08:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UtZcfJ5g"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 595DB314A82
	for <linux-renesas-soc@vger.kernel.org>; Mon,  4 May 2026 08:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777881734; cv=none; b=Y1+CLHZbktoG6g3jKHFFNQdc2hMXt8fJLiUcsQASmwnfYpJDESYq8mCLi9Yw37p8LWkY29o/U7ya8gLw7zmYmhh9bfPA54VRvKgPJo4Aqtx+tE9iFsRTqBzfmnuz3jEWHzCG+4mFdl4PtrgFKLos4Tb+nKbzUuB+iuFcAxAg4vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777881734; c=relaxed/simple;
	bh=JaQLph1fDFoND2GO0hCL4fd2O6UsqhltUs4hWnc5M5I=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Wp8d4qfdFH01qtdU14oMeSSfrHmOsxDvFANXpq3jhekqAWDRpIgCvMvkWyNt7Zg30Gidod1JczU/pmON31+UUZPlnYKjXyGSZHOTiP9cz75Ye9tfZj4h+LpIjYf0trNt/JTApKmYf5wovdlpPZmQDZDkNLLDtQTBdfb8fWlRvHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UtZcfJ5g; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-44dd5cb0f81so346797f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 04 May 2026 01:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777881731; x=1778486531; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Rg5udYoZeehjUQryzul1N4fTdsRztvPb50rKAHLeaoE=;
        b=UtZcfJ5gBdFnPSfzK/L9gSmAwWLKkxV10qgwjDNN29gYkiYyr/FqKoPxzIvsDb/G0z
         b1QeUBDXRKQ1CWQwAPXSvctOUOIGFPMG6ZSBUpME6I0n4Qjk/NkORqfLGzFSdZkxnsYq
         G5zH7J2ou1BM4ZTn0PdhoA3MoyksXOEaY3PeMDbBGcXWwPj/Bxm3txnLEpflllQdssQ+
         Zre/aeKW3uKtmpZopkgJYj8Ehf0EmiD2k4wXG55pukbMLcmRISxCMeSXlBXNwU7Pa39d
         0bKyOEJx1cN2COuchb2EMY9n41VUBlHneN87SSBqIGKvQyqX0RhcBoaGV3LO5C3zRhn3
         j3qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777881731; x=1778486531;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rg5udYoZeehjUQryzul1N4fTdsRztvPb50rKAHLeaoE=;
        b=Sf0Mlx661NlFl73rBT2FM5AEyBLDJGLnYnK9PjZvrIZzV78ihmd337AZmRzKvpeXEf
         6yj3F1huOaT0VdeGUYSjrrqG1SU/GPXIf/Ptn9Tou1/oZA35MwV26cGuAR97033R6GO+
         vJW1Jq5d7E4o3cadygxMzYi3UJee3sc8mHn5Z9xjsIkKfULAz6PjD2VG+5c9QAgbTYSg
         SWmy6tGznnxW3Bp7n9kfQtNkBYPGwLLWUEufptGjLU7e+fsbs6l2QSqVAGZh+GxFbp1P
         W0kS9379pOnqiw7MucWWVmYZdyopHUayXQl+paLswlsM3HN9eU9PKWF1scIZRDU1pYLx
         XNog==
X-Forwarded-Encrypted: i=1; AFNElJ8sQ1LP2Mn6pJWDIkjTcU1dGzUIthfcU2Udjt5q4XeVP0jlhmR3CKa3Xybsyok0u4ZrWJEeedgFDXDEsMvy4Uy7qQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzMgLeQXBOScS31/AkBWTp/ED/pcEV2hKVG6CzqeKMik71Qf4Y+
	qTp7WkiO7ZU6MMwrpArZQKF7YKdlUHzwpm3jK0demDRpo6oymqY4HpT7ebFUKltAD94=
X-Gm-Gg: AeBDietFX+SgaeItfrGrLp6r+mStmekpEmQxMfejQp/+Twy0lgxX4v+4npTPfWGCvTb
	ECaAs31kU9P++SJU0luK0OeGzWgUe6UnjnfOAnLj9X3oWa+ovxbpZS47gWskEgDVsLeGJCfGAip
	g+nEA8xTPtIdAp6VsLOeQ6JeZP+4bW40hn9EpyiUuRzTqDO6MNe9GEuxVzFTdOAMpbQlL3J4jaJ
	66QBnhRfuNjRrb4MJoT1lY9snZzbGQommcsCtJT7tAQRqdq1n/SHzR5R766LnvPbRbKUFGSaIzp
	qL+3ZE0bAkEF5LyXyX4R9oH5aDyfMVceLBn9gXk9QwfIADHFSPqz/X9z742zXLyPS+VnwQdcm/h
	NN+8Y29ZF8We/PyfuPZicV99dtGhlMNTa5UATtbGk6i6fi+SYnZeb0FQpcRsZH8soeM7wonxWJN
	mCZUJWETyGjjQBUh+p9qVhfNoo23MuHnGXQwXiIoktcKhRHNnXe40TpmY=
X-Received: by 2002:a05:6000:440c:b0:43f:df55:fe5e with SMTP id ffacd0b85a97d-4494aad7a40mr17780464f8f.0.1777881730057;
        Mon, 04 May 2026 01:02:10 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a981defb3sm32255216f8f.20.2026.05.04.01.02.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 01:02:09 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v3 0/2] drm: panel: support the R63419 based dual-DSI video
 mode Display Panels
Date: Mon, 04 May 2026 10:02:04 +0200
Message-Id: <20260504-topic-sm8650-ayaneo-pocket-s2-r63419-v3-0-9f61cf24aebf@linaro.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAH1S+GkC/5WOyw6CMBBFf4V07Zi2lJcr/8O4KGWA+mhJi0RC+
 Hdb3OhOk9mc5OacWYhHp9GTQ7IQh5P22poA6S4hqpemQ9BNYMIpz6ngJYx20Ar8vcwzCnKWBi0
 MVl1xBM/B5algFWDBRV4gb2rakqAaHLb6uWVO5zf7R31BNUZ3XPTaj9bN2x8Ti7s/kxMDClXJs
 M5kuIwdb9pIZ/fWdSQ2J/5hTemPVh6tTCpGRZY2VH1Z13V9AUR6s6BBAQAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1459;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=JaQLph1fDFoND2GO0hCL4fd2O6UsqhltUs4hWnc5M5I=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBp+FJ/GtTpEfBWK/iVdg99R5G8MciUcSEu9ztDdWnn
 JBoNdUmJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCafhSfwAKCRB33NvayMhJ0Te8D/
 416er81uookd+JqHcJ1mDZw/9ZVUHbRTK1DxF/opxsUlpRtaeOWQhloEJ1h2th2A6t5ZWH1UVIJ+51
 PpS81eccdEL+2+XKBJi3MkyQCCznSHLyA2sOPct0dD6J68ShRR9Aox2kygusVBtyeo6myM/7PBE7PY
 umXlnSsjYkR4pkFOR7k8XSStrNlK5gzmZvXdgd2wgFav6qwSinlKksqGy0uLxOqeueDBaipUGVimeN
 NpMYeXE3sJW2AV0x+w/MYbatsj3DZdJh7w9jYYd1x/9HL7oxkDtndWL1Ov6MWD9WSPZ3EhJ0bLqEAG
 IyqpEC7oOPOyPOnySiq8YoJwjBKMNMFfEmAoB+grcNGycR+rReRrgh0SztHk/HsJAJ0/V61xXpzMGa
 NpPUgLz41Q6+S5JLvlv9LMqlax5Y/c35FnxhwQG0uN6SP9erV17UquIi4+SbZ+6QStZvrvKmZJ9RVw
 oC61mXlhcRGJ77dkHLJPHpMGxMBTxTQCyOiXl4FUBqOa424ikqUmEG8QEfzu/Vt36OZjEmRiw28hOy
 +m3KfzhMhA2H17Zkdcofma2AAY4bbFa4MuxHDX3xIBjF64+Em36zcUqiUWg4Dpwd/YhVwD9lBbvbYZ
 D6AcDSavs1aATRCxMWSUZ+ayuJ4tyCjVeDGM+LEZzMZxkYF1wkA43WNZRNEQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Rspamd-Queue-Id: 0625F4B9E33
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31925-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,glider.be];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,linaro.org,outlook.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,linaro.org:dkim,linaro.org:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,msgid.link:url]

Add support for the Renesas 63419 based dual-DSI video mode
Display Panels found in the Ayaneo gaming handled devices.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
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
 drivers/gpu/drm/panel/panel-renesas-r63419.c       | 357 +++++++++++++++++++++
 4 files changed, 467 insertions(+)
---
base-commit: 39704f00f747aba3144289870b5fd8ac230a9aaf
change-id: 20260428-topic-sm8650-ayaneo-pocket-s2-r63419-e72467e2db0f

Best regards,
--  
Neil Armstrong <neil.armstrong@linaro.org>


