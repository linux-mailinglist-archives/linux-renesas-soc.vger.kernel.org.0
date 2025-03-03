Return-Path: <linux-renesas-soc+bounces-13935-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B3133A4CC7F
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Mar 2025 21:13:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DAE1A1889760
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Mar 2025 20:13:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB4602356B7;
	Mon,  3 Mar 2025 20:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d5V5z4uU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26696225390;
	Mon,  3 Mar 2025 20:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741032776; cv=none; b=m6vDTyluI4nfEvD6YNWmKj2zX8LDFQrJjCMqv/ley7GvVq9ePZK9YH2RNw/1wCNjPbTfPy9DR+yH475E/joi392QjWQtCjJ92insss2B5yyQufL8Qeh1YQAur21sTbXMU7NEgWcSfXtp/N8JxpxAIpamcRVMEoQe7mTkNvvLhPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741032776; c=relaxed/simple;
	bh=wyeNoJ/S7yAO/056HpVUSbgq3wYTF4Mxs81+zJvuVj8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=D9cyn/rFN9VxkbzMm8stQbtFPLYDkTaieYJwoLAlaGnQVIY8zsyACkSGvjvDUoVgrObJHjly/ccuaoh2R6uzJOaVvC2E/hG6jGKVj1iYf5c2QcjV078LXXEL2E2M2/FvdnuEBaRElaK+gGsFGQEiNRGRn/Y2CHcqFC4e4aajkIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d5V5z4uU; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-390d98ae34dso3986004f8f.3;
        Mon, 03 Mar 2025 12:12:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741032773; x=1741637573; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qGTA+U5HhKzN80RFoOnuSr6R34O1fhnC4wKLLZvlQoQ=;
        b=d5V5z4uUQ90sBtLYnO1vv9RDUuVDHLLOcp2mGSMKFxCbMX0YnEfuIH/i+jV2x2tahw
         hTd5b1DCeX/ICyF5E6ZvjckaNtP6Mj7FwIVSpRBNC3Hb9h45BlPZTqisxz1u1kfSKF+2
         x3TkB5uiPWoe94DePvhuYlxFuNtv/HVk8RkILNLzOC1sWSmXhryu/izwmhgV+9mFvtRz
         44eQHD85yEEwpfOuJbqySthc8Kxm799YVscrR8slh0aZiLRXR+dYEaeKkzVPvuM0qz+9
         B6JQNzvMkhGopO8H4oj7Gv6JyUUs0EGlzhKzQgQ9FtUpK/V/yjm/Ln3sjkJ4pQplLkAt
         HmLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741032773; x=1741637573;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qGTA+U5HhKzN80RFoOnuSr6R34O1fhnC4wKLLZvlQoQ=;
        b=D7F9vCL1ZkcCycXBV+InBmA/+QE12n/tb01wUWvJA58XwE4BNzg95boqNBFkjEVv7F
         e+f5324h+yHF/lrOaUNXwVVf6i/nmEAj3fdri7FG3opTlMgZpz//4FzHYOJl08RycnFd
         I16wZDijbCa8FBEPKNcpsVZwCCzWxtFvJxXHam1W6cxLmVMnMuGckVFO3+MuCMo8/Fty
         GufLAB7l+tomZT9gyfsGCOihwxMtqneQ3bLvTZnbkYnutCtfpumnXaOWugbeb1JMHfTF
         mdXV9tNXoGuzZB0mXfaGfbZHR6IiDijRA7t22sv4aPXcjAH7TPUiStpiWW8xdQTlTUoN
         0Gqw==
X-Forwarded-Encrypted: i=1; AJvYcCVXloasDtTpQN71zqOP26rhpA4n5BeLg9ryINC/UUmbukaiOF6ONqZyjDz3fh7WxnIT6NM/PocBJg5vjNmSNDNmog==@vger.kernel.org
X-Gm-Message-State: AOJu0YwWXkN1Rac+V8RwcfQes/UWY/2+Fw4EnpJq9AxluDmk3D8bc2lA
	ncpqm3wmTQeC9QN2Ty+WPaLVz3NGXnn9L0iKEOC0ct2up+gMm23C
X-Gm-Gg: ASbGncs5wmsb9D3naIXUj0I4EJmHvuhynecLfvDGyQClNIV0JoqsniI7fzxxrv1IgH4
	SHkZhHrvU8ec8qYrWWLcgTtagAFjn4V82mhcfSrancVIQIPR1BQvxC7mZPxSG0lfwo9CXeOOsNy
	HL1yrx+7ifCKzY5EAY7zAwD8hMvkIWeecBUT9ANQ4+h1TQqedFG0NlyR0rnSeT+5cWHW7/f9IQr
	9iHdAmYER9V0OIksQceBlP5nOWI7VTT2dCZL/bWcQe/Otk5GDsltyIf+FCQtD2QvHmOMnke6pmQ
	inCbMFXTTGL5jAEoVvIJ2qUfJlbFB8GcIkoPurSkGDsC+qswbwk52Dhkn2yGFonyqNfKf/As
X-Google-Smtp-Source: AGHT+IF1t3LA/tsHuWibDS6SllIq0wDLWhsE4UbFBcpiBQjeV+GswzLF8gEdw7H/psEfufp8ka1Baw==
X-Received: by 2002:a05:6000:2cd:b0:390:ed0a:cbf7 with SMTP id ffacd0b85a97d-390ed0acc5cmr11270676f8f.46.1741032773252;
        Mon, 03 Mar 2025 12:12:53 -0800 (PST)
Received: from prasmi.Home ([2a06:5906:61b:2d00:5c8:2ec7:65d8:a3a5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e4844a16sm15447752f8f.79.2025.03.03.12.12.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 12:12:52 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/2] Add USB2PHY control support for Renesas RZ/V2H(P) SoC
Date: Mon,  3 Mar 2025 20:12:28 +0000
Message-ID: <20250303201230.186227-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi All,

This patch series adds support for the USB2PHY control on the Renesas
RZ/V2H(P) SoC. The changes include documenting the USB2PHY control
bindings and adding the USB2PHY control driver.

These changes are necessary to support the USB2.0 on the RZ/V2H(P) SoC.

Cheers,
Prabhakar

Lad Prabhakar (2):
  dt-bindings: reset: Document RZ/V2H(P) USB2PHY Control bindings
  reset: Add USB2PHY control driver for Renesas RZ/V2H(P)

 .../reset/renesas,rzv2h-usb2phy-ctrl.yaml     |  56 +++++
 drivers/reset/Kconfig                         |   7 +
 drivers/reset/Makefile                        |   1 +
 drivers/reset/reset-rzv2h-usb2phy-ctrl.c      | 220 ++++++++++++++++++
 4 files changed, 284 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reset/renesas,rzv2h-usb2phy-ctrl.yaml
 create mode 100644 drivers/reset/reset-rzv2h-usb2phy-ctrl.c

-- 
2.43.0


