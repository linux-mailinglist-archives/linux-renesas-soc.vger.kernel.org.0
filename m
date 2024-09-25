Return-Path: <linux-renesas-soc+bounces-9033-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E6CBC98513E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Sep 2024 05:11:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9F470284BE7
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Sep 2024 03:11:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FA53149C57;
	Wed, 25 Sep 2024 03:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YqW46Se6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF0DD148827;
	Wed, 25 Sep 2024 03:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727233903; cv=none; b=pa2vJhgLPzxyAuMdjB02jH0TP2bYu/+HRIwdytJDBroLngnJWacrmPnvaFqbAxvOTE99Y6Qp/UcwfvR2WJmW7hSmUM79rTzVLtINBuVts+HaSoU+oAKqB05y7/WOG6k76AHJMuIYOLEVVSdHMme7D508GNdkVwINrq7SsJcFeOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727233903; c=relaxed/simple;
	bh=gCBGuzSl8cBmJxH8mzZ3ckkNIaz+0nxbWmCKeTi9DLY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=BtY9L4eaLgc/UcpghFVjYZMNrY5MikiM/ItnWFuItMlBsvZZP7KAB83Dfd9wO5BE0sKWcO8YCE4GNWeX+t0dmd1sJCozMchNXji/xJxfT3s0cnz78rI2O7pzLviSw+6FyeihgZ/PSfsee89AEQJS3f3jdZjxTEe3Gr64pgqbWFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YqW46Se6; arc=none smtp.client-ip=209.85.214.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f195.google.com with SMTP id d9443c01a7336-2068acc8a4fso57925355ad.1;
        Tue, 24 Sep 2024 20:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727233901; x=1727838701; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=auEqSUiyFPZDvz0xrjANQSiS2t1vbnL0bLMHfAJAGi0=;
        b=YqW46Se6Y2R0PeZwOC2iPLpdHllB0Gr7MzIvm/kS+saDVD/qfxClhq5GHVdDjbAGz4
         wFyc7DDiDmJmZzhGu7mgGhivQzIOn2QvrR6GGWUqOHecwDwUv+vfXgBYEDfQF4CDeHBs
         +wai6UWNWEPPKsdZTNq/shjFu7DOYgN/arA1tWc1FwclMMLC+zr38HCgTx1Fiq/qoJnB
         qDpoRBg4erUHQMy+/MjTgRFyEmtk3AOoY2hkQ7Fz+9auQZKmaH1hNW4MHEhBuPkKubJl
         zCTm1GmIdTMQNk0sX4LAE/hnfX00GhloYRM/U1TwdXjRFXDZ3aDrCyM8YSAoeg7S8JmN
         U0YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727233901; x=1727838701;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=auEqSUiyFPZDvz0xrjANQSiS2t1vbnL0bLMHfAJAGi0=;
        b=TonA+eK1255Pjr5CAI7TGvneI3MF6/wTdbwx7qE6BHwR3RU7dkjVRQNGVXkS2vaxxI
         xtxi3EETOC04XakSWLdVGiU0WMxTL0hXK43OuddV4gvFXtxI/jTNUYbkoHgS1kjVsNKs
         qW+iSnomHlhgSCulJnZioCmDlgQnHyBRHbGRtRcFQGhT+2MtfvX/etn0jh7RynKqKRep
         fuMoOTYGse0NFc4nbqvC6olRV6yyGBzfoUOsGZDcOFp6El9trO2f4sKEg5SPOdcUBTDC
         UMIfC+fqvS54B9ofLAdw5AjeNSos5nayARRtyPOX6qhIktVkFK9SyONxj/bpUVViAO/u
         enJg==
X-Forwarded-Encrypted: i=1; AJvYcCV84crYCttIGhjp0Quv7rXnRFpnbDOHhXS8m5brCPm65o3/RUGuSU1Fci26jy+4KID11PfUuRqQ+VA2@vger.kernel.org, AJvYcCVtaog40bD24dJRTjMf6RRsRZtr85cS5zYfMTtO0csowTW79BCwe/QGeA1A1u+8i4da6jQ83enFDh+2@vger.kernel.org, AJvYcCWB3tgu8f+OcBH98PMhlkoAF/uTvPd3HLVSLOdCTT/19UVhtSV2qQUZMaZcu1HB+IAiNVT00rI3q8jw5qMa@vger.kernel.org, AJvYcCX9JbT0KK1rX5SOXnQUeqVYELYlTUpy7zXNodd/kk+To2na60Fz7oLWQIlS0b5hqM99VEjh0tKrWGTxphA=@vger.kernel.org, AJvYcCXMOQuYfzEm8EQlYNNP7WkG0Vg2l8uxz89ZdZWKPW/CIrn399rquQuJCy3ipL4lo7V6A2E45PlMj8/sVJ3z0Hel4SM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxa7VJdSS7ArOs9jlvpNTGwit/1hZgVAGOyrLU2YFSzuQhWHX7M
	N4RIAbQ3I0L0r9vV6JkqnqwwFB3pTIA/s1wayP1w45maBdvSuk7M
X-Google-Smtp-Source: AGHT+IHMx3tZCW7JCMLZSzE6kI+6VCIyxhtz77AJNoj5eY752D2n0Ig3kEes6medKPqvrvFWBlGC2A==
X-Received: by 2002:a17:902:e5d1:b0:206:d6ac:8552 with SMTP id d9443c01a7336-20afc5f9e64mr18069905ad.52.1727233901090;
        Tue, 24 Sep 2024 20:11:41 -0700 (PDT)
Received: from localhost.localdomain (27-51-112-33.adsl.fetnet.net. [27.51.112.33])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20af185be0csm16054755ad.294.2024.09.24.20.11.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2024 20:11:40 -0700 (PDT)
From: Yikai Tsai <yikai.tsai.wiwynn@gmail.com>
To: patrick@stwcx.xyz,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Yikai Tsai <yikai.tsai.wiwynn@gmail.com>,
	=?UTF-8?q?Carsten=20Spie=C3=9F?= <mail@carsten-spiess.de>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v7 0/2] hwmon: (isl28022) new driver for ISL28022 power monitor
Date: Wed, 25 Sep 2024 11:11:26 +0800
Message-Id: <20240925031131.14645-1-yikai.tsai.wiwynn@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Driver for Renesas ISL28022 power monitor chip.
Found e.g. on Ubiquiti Edgerouter ER-6P

v7: review comments and code refactoring
v6: shunt voltage in mV and revise code
v5: review comments incorporated
v4: property compatible fixed
v3: changelog added
v2: properties reworked
v2: calculations fixed
v2: shunt voltage input moved to debugfs
v2: documentation and devicetree schema reworked
v1: created

Yikai Tsai (2):
  dt-bindings: hwmon: add renesas,isl28022
  hwmon: (isl28022) new driver for ISL28022 power monitor

 .../bindings/hwmon/renesas,isl28022.yaml      |  64 +++
 Documentation/hwmon/index.rst                 |   1 +
 Documentation/hwmon/isl28022.rst              |  63 +++
 MAINTAINERS                                   |   8 +
 drivers/hwmon/Kconfig                         |  11 +
 drivers/hwmon/Makefile                        |   1 +
 drivers/hwmon/isl28022.c                      | 533 ++++++++++++++++++
 7 files changed, 681 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/renesas,isl28022.yaml
 create mode 100644 Documentation/hwmon/isl28022.rst
 create mode 100644 drivers/hwmon/isl28022.c

-- 
2.25.1


