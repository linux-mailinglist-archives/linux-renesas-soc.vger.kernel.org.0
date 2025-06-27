Return-Path: <linux-renesas-soc+bounces-18823-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 481DBAEB016
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Jun 2025 09:31:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4B22B1C201F9
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Jun 2025 07:32:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2200021638D;
	Fri, 27 Jun 2025 07:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KSlQgiBh"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1CDC339A8;
	Fri, 27 Jun 2025 07:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751009497; cv=none; b=HumRjWSL6eCYXZlzxRWtY0nFxhU+N3UjU2BHv34xcahVkeMfYdUBRBGmzLQIw9mh0mmFzCGx0SQXipOSSEiuPNcYu7IiK4haExsK9Qvx28ie71KhduAQFzarNHciFzNshkBjZ8Mc+P0yraU/A0QRe0XIMW8s1HNI1JPI2WnHOU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751009497; c=relaxed/simple;
	bh=9fRWkgV+8VP7UmRHkuiRfuz5hfvvERiwtk8L614dD50=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=br+ohkAuCi14X88cnKvWYLND5boTVui0hY653b53LXsAiVP4VeBR7AiDSRSzGyDATHdcjrP4rVPeAmwZjlynOpZpO88dVITGNLCQJgXl6DCwpdSKrmfFmewxA+V5Aj8u5d5mjoBpay0WtuIhuQ8iM//KV/YXrpEkuLkOxV5NciU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KSlQgiBh; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-74931666cbcso1742807b3a.0;
        Fri, 27 Jun 2025 00:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751009495; x=1751614295; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9Ulo2IqCqK6lmTR1n2ctrbmpkiinWsFuA6QDYyT+/w0=;
        b=KSlQgiBh5Wrs1PB4IvFaDIwzP0uL0ce+b1WSCkaoEE6WOALgks5FvfRuObD6J9HUkv
         WIF7YlWrDDt9Uw2SEjp48MJ827SM9pZ8hwn+MzSxrXdaoEuh2mi8FSg94N48iM2Xkha5
         Xlgwhv//sfqESxAx7/s8F8iMUveNKbNE7YFcWa8zM5Z+/EHEambV6Qp9NhDY9Z7EerOF
         K1IGmpz5r+NOcXJcwojIqqUhWgR0AkJSXA/sTOMwh5ndbbBdg2tevHof/CKTI8WFcx3E
         ZQD6Yud14Jgheqdv/1iNz+4EnRf//CAsPGUvaD/+b/wGlY4gahdf6n7IzfvqzS+a9jlf
         nTnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751009495; x=1751614295;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9Ulo2IqCqK6lmTR1n2ctrbmpkiinWsFuA6QDYyT+/w0=;
        b=rTdfc42Jf4zwXcRUwORk88M0DFty+XGf/BmJV8MuVr6zpjyRMMpzeie0w5k1yjZj3n
         eOj9MXxyFZ2bvG0ChioB8d1YdpyY1iSMO9SnWY9vnuO8A+7W9UYNun2V4UL02QETL9ax
         nN+U1ksY5KMKHmrwl0U97gICKeOhAvklyhuMMRsoGWb/NMGtOqXwLPPkfXkFCyocKdff
         erPYePeseaU10IuJ3gp0lmWAa0bFldsxLP5H32qIQGJ+MmREZXQVqKMNUMmPeeMMA71z
         Ve4oNzupntJ/hTTd96/APWXzyn2/k5qLz5+zi5fHo/gvvgtvAk6YVUMy1Bp53/WZrGEe
         oafA==
X-Forwarded-Encrypted: i=1; AJvYcCUitTm+DXIntx8jtOLIp56/V3MwC+13ZlkvbOkWDXtqVjnjtPHLL+GBYGujOOSoJveCdcE0+YDZ8O8K46fj62NK/H8=@vger.kernel.org, AJvYcCWR15cRrIr8oXiy/UQDmpmulxhVkznDvY25wK1kA9bODxhp+1cWZbMlbTMbcyR0uRWPcDgeBqr5gQkaRPzd@vger.kernel.org, AJvYcCWpOKagm436bKHIsk0dFFTOC1NxOMCF0IyevVWd8YlVs9d91BLwf793Q1Y7BiejuxdwiwgGa/IquD2P1w0Hxb4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxeLRpH/15ODMkJoG85LvBL8oFDKsiwCR23Ux5pGi9J4Mp8KhhH
	XzaIFPJOt2XFpDEb5dKVeoOsSSmhKrgs25tcEBj/xv9ys05xhL2xqse0
X-Gm-Gg: ASbGnctbb5XDxRPM963WiOKTwDW1ywkHF2rFZ6NX3vq6ibroCrYOzLehfdTHGwA7hnA
	yq0nwJ/QYpFvCOxOOTgamhLwIEyte8uHI5NIB2s/1Q1cGVQZuB7Ceo/LTw9682WF9m+Xi21qEcT
	aikCCgVERJ+p9JYnOH9YCY+QhtnvTWSS43f99cp9ry06E4eliVPKoEkp9fN5yiUxDsqCxF0pWKX
	/MB7IS7CMLtcOZTFuDI9ed8mWR9x/I7CZZc68Uf8I0gCkIgl9DoT6CDirL6vqXKjnd874qN1Pg2
	Tz2qQo+5vzZQ9H4eZwtOo5KaIbFAsSw9Y6U3jv+EsNBx9FWjNWK/SWUrIDDcNVZ12TlsrrAuV90
	M+g5ao3y4y8I9z8DHk5I0EMnGUQgpn5A=
X-Google-Smtp-Source: AGHT+IHWPxrtW7uCSMjhE308lVU3QsfpWpHidLpZ/iou98J5zU0NWKBg4cfBpKfITecjKJM3Ydlp0Q==
X-Received: by 2002:a05:6a00:18a7:b0:736:4644:86ee with SMTP id d2e1a72fcca58-74af6f4078bmr2943654b3a.14.1751009494749;
        Fri, 27 Jun 2025 00:31:34 -0700 (PDT)
Received: from [172.17.0.2] (125-227-29-20.hinet-ip.hinet.net. [125.227.29.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af540a8f6sm1628646b3a.12.2025.06.27.00.31.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 00:31:34 -0700 (PDT)
From: Leo Wang <leo.jt.wang@gmail.com>
X-Google-Original-From: Leo Wang <leo.jt.wang@fii-foxconn.com>
Subject: [PATCH v5 0/2] ARM: dts: Add support for Meta Clemente BMC
Date: Fri, 27 Jun 2025 15:31:20 +0800
Message-Id: <20250627-add-support-for-meta-clemente-bmc-v5-0-038ed6f1cb9f@fii-foxconn.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMhIXmgC/5XNTWrDMBCG4asErauif1dd9R4lC3k80whqyUiuS
 Qi+e+WsDM3CXX7D8Lx3VrFErOz9dGcFl1hjTm3YlxODS0hfyOPQNlNCWeHkGw/DwOvPNOUyc8q
 FjzgHDt84YpqR9yNwb2QwzvdglWbNmQpSvD4an+e2L7HOudweyUVu1//oi+SCo4XgnEc0Xf9BM
 bbfK+SUXiGPbGssaucqecRVzXVgkYT10nh47uq9q4+4urmglCYCMg7ouWv2bnfENZuLHZHSxgk
 wf911XX8B8kX8AOABAAA=
X-Change-ID: 20250618-add-support-for-meta-clemente-bmc-941a469bc523
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 linux-hardening@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 bruce.jy.hung@fii-foxconn.com, george.kw.lee@fii-foxconn.com, 
 Leo Wang <leo.jt.wang@fii-foxconn.com>, Leo Wang <leo.jt.wang@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751009491; l=1868;
 i=leo.jt.wang@fii-foxconn.com; s=20250618; h=from:subject:message-id;
 bh=9fRWkgV+8VP7UmRHkuiRfuz5hfvvERiwtk8L614dD50=;
 b=0XsbKwFEd4w+7PzCss2Nmt2rO/8TFCmbSJs+qdTQwzawMciw4D7RjYyp2vdqVWZKISYobWBP4
 UD6tzE6U0MHCxtObyeLMadTp/GYPRXTWeuWWAPR/jwtI7cNH8Isi1zI
X-Developer-Key: i=leo.jt.wang@fii-foxconn.com; a=ed25519;
 pk=x+DKjAtU/ZbbMkkAVdwfZzKpvNUVgiV1sLJbidVIwSQ=

This series adds initial support for the Meta Clemente BMC based on the ASPEED AST2600 SoC.

Patch 1 documents the compatible string.
Patch 2 adds the device tree for the board.

Signed-off-by: Leo Wang <leo.jt.wang@fii-foxconn.com>
---
Changes in v5:
- Remove accidently pasted texts.
- Link to v4: https://lore.kernel.org/r/20250627-add-support-for-meta-clemente-bmc-v4-0-ce7ff23460c4@fii-foxconn.com

Changes in v4:
- Move properties of nodes defined in the same file from label ref back to where they belong.
- Move pinctrl default configs for ncsi3 and ncsi4 to aspeed-g6-pinctrl.dtsi.
- Add properties to i2c10 and i2c15 to enable MCTP.
- Link to v3: https://lore.kernel.org/r/20250623-add-support-for-meta-clemente-bmc-v3-0-c223ffcf46cf@fii-foxconn.com

Changes in v3:
- Modify leakage sensor to reflect current design.
- Link to v2: https://lore.kernel.org/r/20250621-add-support-for-meta-clemente-bmc-v2-0-6c5ef059149c@fii-foxconn.com

Changes in v2:
- Fix patch 1/2 subject line to match dt-bindings convention.
- Reorder device tree nodes in patch 2/2 to follow upstream DTS style.
- Link to v1: https://lore.kernel.org/r/20250618-add-support-for-meta-clemente-bmc-v1-0-e5ca669ee47b@fii-foxconn.com

---
Leo Wang (2):
      dt-bindings: arm: aspeed: add Meta Clemente board
      ARM: dts: aspeed: clemente: add Meta Clemente BMC

 .../devicetree/bindings/arm/aspeed/aspeed.yaml     |    1 +
 arch/arm/boot/dts/aspeed/Makefile                  |    1 +
 .../dts/aspeed/aspeed-bmc-facebook-clemente.dts    | 1291 ++++++++++++++++++++
 arch/arm/boot/dts/aspeed/aspeed-g6-pinctrl.dtsi    |   11 +
 4 files changed, 1304 insertions(+)
---
base-commit: 52da431bf03b5506203bca27fe14a97895c80faf
change-id: 20250618-add-support-for-meta-clemente-bmc-941a469bc523

Best regards,
-- 
Leo Wang <leo.jt.wang@fii-foxconn.com>


