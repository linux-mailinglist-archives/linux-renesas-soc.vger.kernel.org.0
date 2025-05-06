Return-Path: <linux-renesas-soc+bounces-16705-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E73AAC166
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  6 May 2025 12:32:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DD5033B4486
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  6 May 2025 10:31:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E03A2278742;
	Tue,  6 May 2025 10:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AvOufdCu"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AA1C277013;
	Tue,  6 May 2025 10:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746527521; cv=none; b=G5LV/i0hncI/7gjfrJxsY8AZaUrYoxsR/eZiOP2NsuvZROeZGsoDiLGrMjIARxZlS+F7z8b+5nUehaFyYCOn5xfScAqBSpDW7Fii6QtK8rArZyUM6xAI7QIqTHXzSA9/5OYk0R+OuyVvkjLCI/Mh1B9TtXf+aX+STsH704DB2U0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746527521; c=relaxed/simple;
	bh=lhnv40esCz1FiYndyj/R/gsGzq0csbIm8ebf+TghkTc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=js4HmFWkQldL9aH3id3F401tNj/hRfuWM4pSeO5qc41Eef7D2Yins7DXJerDP6yQAB3w4Fec+rhiDAjGsAlnSKPBuMj6lAGZt+9uV0GEI75kjzjE+aAdxKKccdDQZMbt4eqDTXX4YW37kFrLFQRtM3EKwOOFNcTVObv+H0kxzbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AvOufdCu; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43cebe06e9eso34352295e9.3;
        Tue, 06 May 2025 03:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746527518; x=1747132318; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ea2yeqyCln5YmQUlQrOfEBlQkw4IJEtC+0ef1Pufbzk=;
        b=AvOufdCuP9m2GflHlAHmTLQofSIhkMBFkUDEpHZIiVbbfFhdm3raOE1iWxgmPksVN2
         0kpNjEUgt0SY3W5u1Y/R/3o5I4yiGyytfVAV2Cqg6hMS9F74MRa8/zUlr1RcixMWbb9E
         dcTiCFCq0xc3t39epcY1ZabskAyJPUmTc6WSEMn1zrSShGC9E8Q/wht40OevSDixgWAN
         5svFIkuU9XKOWJavgKs/jpOpXstRbmn7gpaSd2seJj3dQBWqcrJ1xoNFFpBbZ2OWpJmC
         vzSNeLi7ZaNKluLNplcQLQjmfj/eMm5Rz2yzipvI+mEezzCOPisFkrbNFpz0jZ5zL8bw
         TRNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746527518; x=1747132318;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ea2yeqyCln5YmQUlQrOfEBlQkw4IJEtC+0ef1Pufbzk=;
        b=bf+h3gkCmV5IgUyM9X+nYadA9acKRB02rguy+O4kBOi54Q3O1hf5ix+f0EGGI6xd+3
         nZP956bPZr+p4Ba3t7q45ZRT5qc2bDaeOWTRMwLH1XcGDdZH6ky/0C0MKhf2lYxNsxYc
         NE4aHqIeXlGe0FwoH0lDinFzYiIsWC0zaM8quw1CAFjgOEkxZe6toe2PxBEAIHHon/06
         X2eJTPEl6deFg28Vf3y2CVcncz5ONYMdi9cQAtW5Jf298ATi3dUYtR5brs8Fo17QrBp0
         lPn8mP/3oaZz9n6p44txoKiO3KVQ59NJP5pA0a9ycGj9eeU/2ZjL47j8rYyUSojrMle0
         CV3w==
X-Forwarded-Encrypted: i=1; AJvYcCUKO/F0s1LAApPZVNkzSeLccDsJZjLkHSo0Oa5LdaKEbEKOtQjxP5yqDRWz3T0V95gi4LHEJkhkFeKtSYs/cOD7+sA=@vger.kernel.org, AJvYcCXbnvJnSN0mQcXPCGBl+hvLlwCUdqoaPvLng9fdKDrdi31f426+HUial0gZ2mrg5ZzO7v5J+DpMMNN8@vger.kernel.org
X-Gm-Message-State: AOJu0YxmVKtNfYNNZslL4Tf2+NUvyS0lghBD/JInyczEv2TibLfP+F+J
	eMm81SmCI/A44OTPURe7ANyhTPR+O217kF2dlxKJt3jKXRyn1N3K
X-Gm-Gg: ASbGncuU569+9uBJm36WFeCNGAkAPED1D4cJcCxrAZ+TOV1QhUzN+zvGKM/8WdLg9tK
	i2Gxdjyx0zfrYPflsKsHoyntLyMwuIBCfaFpcC9p5NgEbpeaAjNmOzxiS03auHadn9drHEXche4
	/HCROI0mIqQMzyk1mT2+yeyitHsIXkjZZ+iNVAv8F4ii6db83ZqJVmqOaxvDuzz7PbDKSX6OnOH
	kxKrSHt9Bzd9pKehO3BsATRyLwGZjfMA3yruSDmFb90CXGmfWTfqClGhbI9zQOD12DWLwxd+0UW
	XWwnT/R/yrdhZF+xw7b5aXpylOd6s3VwtQhubjwc/dgsATaJEAGRkzcowH7aRGpOuQ==
X-Google-Smtp-Source: AGHT+IFlaL3zlxfWhU9eMQsd2gakbJ4MFYO8Vvi3cHZ3L2dU+abGaPcYIyJZw9nvTDrS+u/WlfaH6w==
X-Received: by 2002:a05:600c:8212:b0:43c:fae1:5151 with SMTP id 5b1f17b1804b1-441d0531289mr19620165e9.25.1746527518190;
        Tue, 06 May 2025 03:31:58 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:26ec:c7bf:3d4f:d8ea])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b89cc469sm166148695e9.6.2025.05.06.03.31.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 03:31:57 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Chris Brandt <chris.brandt@renesas.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 0/2] Add support for Renesas OSTM on RZ/V2N SoC
Date: Tue,  6 May 2025 11:31:50 +0100
Message-ID: <20250506103152.109525-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi all,

This patch series adds support for the Renesas OS Timer (OSTM) found on
the Renesas RZ/V2N (R9A09G056) SoC. The OSTM IP on RZ/V2N is identical to
that on other RZ families.

v2->v3:
- Dropped config check and unconditionally enabled reprobe support for all
  SoCs.

v1->v2:
- Inveted the logic in the dt-bindings to require the "resets" property
- Instead of adding config for new SoC, changed the probe condition to
  `CONFIG_ARM64`.
- Updated commit messages
- Added a Reviewed-by tag from Geert.

v1:
https://lore.kernel.org/all/20250501123709.56513-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Cheers,
Prabhakar

Lad Prabhakar (2):
  dt-bindings: timer: renesas,ostm: Document RZ/V2N (R9A09G056) support
  clocksource/drivers/renesas-ostm: Unconditionally enable reprobe
    support

 .../devicetree/bindings/timer/renesas,ostm.yaml      | 12 ++++++------
 drivers/clocksource/renesas-ostm.c                   |  2 --
 2 files changed, 6 insertions(+), 8 deletions(-)

-- 
2.49.0


