Return-Path: <linux-renesas-soc+bounces-31821-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yLm7JoVJ82kMzAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31821-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Apr 2026 14:22:29 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 280F34A2B36
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Apr 2026 14:22:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8EAF23004DE3
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Apr 2026 12:22:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 522B3402B8D;
	Thu, 30 Apr 2026 12:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rKuJQkqN"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B3D234B1A7
	for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Apr 2026 12:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777551745; cv=none; b=cgq4BhSAGgQKYtlfRthuHfQO73ku+Arjzlz9Rwgy3HdSnF5hhcshDt20RxeCqPCusIebBZKze/t1Xob0Pv7Ll4UsYRmXXLcQXmqP1lF+DDcspDzwcQ5GNE89CI25QT/2let36lVJ3VCXbU5JE1V5+1q7dCqegI2g0i51S36Z/jU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777551745; c=relaxed/simple;
	bh=DBmrIk2P2SCzJFS2zeYznzHxjTl1f4Qtg2F+1FDx08E=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=spCKQrlRxTNiCugr4j/2J+bTVJ3cDbmzy1EzNZ8fF1Bf3Ysaq/WL0WiWKtQ/RVh7cTBTze0zCEQF7vVHT2kycfu5zY7kKVD8tMvSMkm5CytoGQa68BIMI8oMetc94ZJbRUGccMN9WZ0zN6GT6dX9WAK/X7PhcWoMLBRml3XQjDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rKuJQkqN; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-43d76dd4ee8so709870f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Apr 2026 05:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777551742; x=1778156542; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RqyMbVlgU8cqot3Hcxn2iVprpaqj6ssogqlpcrZk9L8=;
        b=rKuJQkqNVh/VL/0XCMc6UlCDB394Aue/05snI/T9qFAkNJrRUqk9vvveqrVAmqVqMu
         +u1zaJP74cup9mS0Ov52qfFekvHFfvUuHJuc+joOLkg9oPjDC+lZtmeLaHeNupqQ3VIv
         DYpSqK/e3n+YzkR4AWlRk1xZJ5TTEmE4HTSigSq0m3P3JiHUID1mAnzksXUcoF45/oSy
         ZscYa+uTQpeq/fmkwUv+zcurNAaZcdvoTE7kHI45N6CdUxjEGUgHP8eLlf/2ix/qFWK9
         Q9cbt9Mgi8u5+uyphfLy4d9yvQ+6XS2wBwXG9IrJ0rf0KeDhGhdaO7qdtycvEO7lNn1J
         BXTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777551742; x=1778156542;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RqyMbVlgU8cqot3Hcxn2iVprpaqj6ssogqlpcrZk9L8=;
        b=EmnIWmDkUN5bIAXCnW87oR3Xnpmi/t95VgasPAz6KVSlB6Fam0K+JITJWZu6invwYw
         ruTyvN+UV99v88aSqYzx+wYrcHM1QFVBbUingknGEHSSF1Am0qQfRPzcHY9AKJudC3It
         FQmM/5GpCc0uwc9wAGZfviWhsT76icJqEFJlS+6r1d8UdkpN+5QKNQ19qgLxcZeD8bIP
         kOTWBZKFu0iZMEUK3b0xn5KXlRd7nOfQC6Yv7GxMaTh2G+W3lNG0EDC9A+gs3NepqBWU
         8dL3QYaroqNxHW3QVWMeBImyp4bjQcXXoaBVlDHDAuSzfvV5VnL/oGtU0PdHPpyq7Qbe
         o0Nw==
X-Forwarded-Encrypted: i=1; AFNElJ/9IhQgeYujDzACp1tKLDUDjPyP0MH3zbD36UZQN5qkg/FYdg5rIyKVko2IcpLjNNpwaC3IQespTMp3BpsCN/GQOQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwUWeHmkuUL5WQPyH1qIvFUIdGltw5YGOaBL6mbCh1m2+fDt12W
	3nT4ql7RDdMyUMGFLRuDbJs9J9ESJBYTXweXtuUqV0J6MJo4yD3Ou61bWXba+jrOw7Y=
X-Gm-Gg: AeBDievCNLsVloc/ZaRUGkWvDbdsZgWATWCZXGXvaYtf3XQz79oEquZgdQcMckoUgkd
	sBBH6VN7A+qshz4Yovz2Cxo2TCyrhNhZ4K2liMJrUcujeQvlJ5x8KDsRvqe2Xup/GKiVsqjL3af
	bLYd4ij8iJgjTclAVYD7R7PO/kAUc29glrPs2k4NmL5xdqTfjLxe5a1wlkdFDCwEwYZdaitG9B+
	s5WbOecg2ggIus5Zr3b853xBRrBCZ2oKqJIwQIkcjjHwnj4DEOv1sC92r4/wxCtUbdC66Q1oyA3
	V+h/ywHlXm9GWHTkZQ/r/roKn1JcS+DHog7n7SOeyp907EqFlcrlc0mTcX0rlGceqrVEYzOhnLo
	ftzP4T/2PWgWbR+Ww55uSHJ46KMvsyg8cP//1NmqfZmDyTiO0Xr2FWVIxgQJunt0T/l9VE33kzX
	2Couh0/mO9atMJFN1ssUYA8+v1/1n9tYeLS5bulU8/aDwjMzAQjTGpeHs=
X-Received: by 2002:a05:6000:4284:b0:43d:71b:204b with SMTP id ffacd0b85a97d-4493ee4d3a7mr4784038f8f.39.1777551741675;
        Thu, 30 Apr 2026 05:22:21 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-447b76e5afesm11163639f8f.30.2026.04.30.05.22.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 05:22:21 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v2 0/2] drm: panel: support the R63419 based dual-DSI video
 mode Display Panels
Date: Thu, 30 Apr 2026 14:22:16 +0200
Message-Id: <20260430-topic-sm8650-ayaneo-pocket-s2-r63419-v2-0-91ac10453d0c@linaro.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHhJ82kC/5WOTQ6DIBSEr9Kw7muAKmpXvUfjAvGprz9ggJoa4
 92L9gRNZvMlk29mYQE9YWCXw8I8ThTI2QTyeGBm0LZHoDYxk1wqnskSohvJQHiVKuegZ23Rwej
 MAyMECV6dM1EBFjJTBcq24R1LqtFjR5995lb/OLybO5q4ubfGQCE6P+8/JrH1/pycBHCoSoFNr
 lNycX2S1d6dnO9Zva7rF5hfThnrAAAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1149;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=DBmrIk2P2SCzJFS2zeYznzHxjTl1f4Qtg2F+1FDx08E=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBp80l6ioUpRGgLOhdWf2OCm1AyXBCyDPSG01l5c3KS
 r3zvDKyJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCafNJegAKCRB33NvayMhJ0cLxD/
 9RN6EGHKiC0AXQMAK1thshpNMvYkLrE0lx2nhe1Ypeu/R0j4RFaWQUm4BhTodQUFgO43U1tUZc3GaS
 8ECanj75MWHPY/+ho1PT6uPS0DYLSL8PRC+Pn0REu60sucxglAgJmq35A0vecK0AFVhcT4Fhg0Lf4W
 5Nsw9Yi61yZxhEt9toNrnXw0bU2vuC3jyzgp+7+HGj4j4ORgEvT9PO44uMWPuOzdFYBlIiSGVqRyPp
 umnMF8HEzTgkNPfHgjdvmLS3nUziOkhyuadXOAlE23vsbOTdGBog+WEY4+fGhHRsFjVAtVIt2gnihq
 bLr31XGSkZAAww4/Osvqv+OIBh6G5k6b0z/OjU3H8KN6VZBe5bCTfm4x/U/19uz3snM+AGTPvWTsTd
 Qdl1mnq1g/gRp49rZxX/5tQGE7baztD4iyNJvf1REda7VBqiMj9IbEk6Gy3iJte1O3iaRL4VSR7uJC
 iBI0NYeUPVYW+3EQSCKbkvFVuTNevlW5Q/V1eC0bBytOcdXGX/f8/Bnzm9f09zlAihlsHGF72diLQj
 RjGO7uJ5Upe0ejKHbIJ3VVqdaXbOPp/fWuqlonRkAstRC56yo4hcdlwtopCdPInTw/J5m4JSSJ98S1
 Ox9ShYGeSN0lHfP1gXg4ddqfzfH45c9jmJnYE1GoPGMTLvEubp2hIXoBuGHw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Rspamd-Queue-Id: 280F34A2B36
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31821-lists,linux-renesas-soc=lfdr.de];
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
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linaro.org:email,linaro.org:dkim,linaro.org:mid]

Add support for the Renesas 63419 based dual-DSI video mode
Display Panels found in the Ayaneo gaming handled devices.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v2:
- Add missing rotation property into bindings
- Fix commit message & subject typos
- Link to v1: https://patch.msgid.link/20260428-topic-sm8650-ayaneo-pocket-s2-r63419-v1-0-981eb5ab5a51@linaro.org

---
KancyJoe (1):
      drm: panel: add support for the Renesas R63419 based dual-DSI video mode Display Panels

Neil Armstrong (1):
      dt-bindings: regulator: document the Renesas R63419 based dual-DSI video mode Display Panels

 .../bindings/display/panel/renesas,r63419.yaml     |  93 ++++++
 drivers/gpu/drm/panel/Kconfig                      |  12 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-renesas-r63419.c       | 356 +++++++++++++++++++++
 4 files changed, 462 insertions(+)
---
base-commit: 39704f00f747aba3144289870b5fd8ac230a9aaf
change-id: 20260428-topic-sm8650-ayaneo-pocket-s2-r63419-e72467e2db0f

Best regards,
--  
Neil Armstrong <neil.armstrong@linaro.org>


