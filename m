Return-Path: <linux-renesas-soc+bounces-22499-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF68BAFB7D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Oct 2025 10:48:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DDB8A189B378
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Oct 2025 08:48:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E785427B33C;
	Wed,  1 Oct 2025 08:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W0yINqV/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F0472494FF
	for <linux-renesas-soc@vger.kernel.org>; Wed,  1 Oct 2025 08:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759308484; cv=none; b=iT7GVx1Kx9U2ZSRHvsYHc8wfSfUI6J5hZI3DAS9Ja/+muiZBaQ1GCyULQQUhdd53uecH2NjUreXaamTeSlEkabPjFl3y52n/rcGFjtukRBrRJZbvxLdxbkSfFyn1P87eA+M0fr0rzEF+ie/yn9Osgqv3LIxY8J3vdC7E55+m7+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759308484; c=relaxed/simple;
	bh=QvD/ud6DrodRNKqUA2m4nL+/50pX/gxXw21okP8DcUg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=e6HlnsA4RQkYZ9sOZcZMb5EbjfzCSBG+hiN5NTBJS7HRlwQwZNcqDKHjf+imT4UX0UXaziuqV8gWU3x7EOi8kGuySFgHFNtBeniJ4Nek2WQDBe0tE0IhuYgwPt7+tRdKxIw+oKMhqbT+PC1M2RYBVTKUHC3C8gA7yvoHPeyptJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W0yINqV/; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-33255011eafso7031633a91.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 01 Oct 2025 01:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759308483; x=1759913283; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XMfpQioL9qF93r02i/m3R/Lc2dj1xsmt2jY1yN46fE8=;
        b=W0yINqV/RRy+v0Z59VIdukLDb7SpqZ3WwXLqb5/ndWmZKUj1jaZ0bQFdS56EhAsPVc
         qWWA6j1fJsG5tKY83+DgLQDApU/XKgf2Km/1xsLKp4HB1geG5UP7Q2rgwcS3zcQNPk5p
         By2/igLAR0PQ/idOSMIBDCsi5C/1+cjovLzIzwUWQ0enD/V7YfYVjTaIQU/H2r4FELA3
         u8/dEklXfE6iRvIRsJ1jPduYNGwjwKMvdIH+ToLoci+LOY/dDYN/l7G3nt71yHXIRKt+
         XTKAG5EXBr/vkBXqYxqLB3xNzm2nXMgd8ZRgR6/sI6VUcB1Xq6NHCl9yPHcsRtmQEkt4
         2mxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759308483; x=1759913283;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XMfpQioL9qF93r02i/m3R/Lc2dj1xsmt2jY1yN46fE8=;
        b=Gg12ItcKJ7GxQQwcCgF0Hj33iN+BpDce+GIFICDIpxywgLenjOUZzWTQOdNjEecNuM
         uR9EkASaE4uo9w+mw1fmdVhOywwqkqFtc2qPJg4iHtExQwOSyupDYEqwQBx/mnqngWVp
         Mhr0lyK37AW7uGjUUouGsvk86Jlhan/1AOYKjFdVyeazm6EMBrMUvMKl4M8onT13Y3Yr
         UPNJWCipzET7odrNyG+mBq0xA5flekfQ089uPmvuM2xXXG5R7hLTRT8vKs/oU2pfDGsh
         ZELDQro5xoj7DQvqYRM5GxJaytTG8hkxchFm8xfsibItQY6OPdamKaO0Z/aQdmRLW0KH
         1q/g==
X-Forwarded-Encrypted: i=1; AJvYcCXDo2TS9qcAQWQvqsmMX3IzN5TGiVmO9I/KDqh3X/zhOZyAqbJSSXXO5IzrnReAzuei57lgz+cqDtYxhc9MmsKU/A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwbgkzcSjCe1vCesxTU6hG0fWhnVxViZODZSeOaccNn0N/YvWbn
	Z+iOYcm9GFSrB7A39a0guGJ9ovxSdEC79WJpHTXYw59BZWZrlJEV7IHd
X-Gm-Gg: ASbGnctde/BmWW3LPSzllFCpUyNYeewB6CwFvDfNhKB9vaOFpUndumL1m+WzSB3v8P6
	Em7+8VdNSj1bGSxSVuJlDFfYwnxIxmO3hJJfG5uyL3GOoY8PaaDAr4p+2HgDgsWmf9+R/7Dz70P
	pigmLI3OvQAOK14/jNgfjbO94R1LzJfuPE2ZBccPDhj21PKZQ4CtG1cPtuOTRByyDcjWcjdBHSl
	bBAvFsVA9fjRStdQNWT3sWdgXZbORjMIaEWWObQOEGfDBB2kEZAXT7nLAoYmNLWZ3+GYMl/ZsMq
	9nccAQ7KAMNVdfNM5IphO1447Hh8GJyAEIMQRgUAzXSxyCtrG6JIyOrXEqicIwnyAv3bVi2Bftv
	tJicq28Nbjxl6XM7a9CAevLakDicXZvraGFBXrpIjuU+xoGhWXmDiRE65klqTPBEUOeY5riqoAd
	dLwWH7L8q2mztHCYVc7AFgi+jw6+0FeZHzISQ7TaL9P5/ez9mma0V/TfsaKCwZ6N9KBftW764xV
	hsdKBAdtsb+T/xdXunYV8I/rbHuPWkyGlWv9yBW1XSkwTs=
X-Google-Smtp-Source: AGHT+IFnWYeRu9k4Oaa4bTAUDYxWIdWeHxGT4Bg1jpuCkukhqqyjsyyOYdJn3LPL9nXEE8BZUqnazw==
X-Received: by 2002:a17:90b:1e10:b0:32e:59ef:f403 with SMTP id 98e67ed59e1d1-339a6f2e80fmr3239453a91.17.1759308482433;
        Wed, 01 Oct 2025 01:48:02 -0700 (PDT)
Received: from 2001-b400-e387-f8be-46e6-cc88-b318-45e6.emome-ip6.hinet.net (2001-b400-e387-f8be-46e6-cc88-b318-45e6.emome-ip6.hinet.net. [2001:b400:e387:f8be:46e6:cc88:b318:45e6])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-339a6e9d22bsm1789250a91.3.2025.10.01.01.47.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 01:48:02 -0700 (PDT)
From: Kevin Tung <kevin.tung.openbmc@gmail.com>
Subject: [PATCH v3 0/2] Add Meta (Facebook) Yosemite5 BMC (AST2600)
Date: Wed, 01 Oct 2025 16:47:49 +0800
Message-Id: <20251001-yv5_add_dts-v3-0-54190fbc0785@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALXq3GgC/23MQQqDMBCF4avIrJuSTqKYrnqPIhKSUQeqlkRCR
 XL3pq67/B+874BIgSnCvTogUOLI61JCXSpwk11GEuxLA0qspUEt9lT31vveb1EYbFrrbtoPTkJ
 5vAMN/Dm1Z1d64ritYT/xhL/1v5NQSKGM1bYl5Qw1j3G2/Lq6dYYu5/wFm+YtzKYAAAA=
X-Change-ID: 20250924-yv5_add_dts-9268ac14dfc0
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, Amithash Prasasd <amithash@meta.com>, 
 Kevin Tung <Kevin.Tung@quantatw.com>, Ken Chen <Ken.Chen@quantatw.com>, 
 Leo Yang <Leo-Yang@quantatw.com>, Kevin Tung <kevin.tung.openbmc@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759308478; l=1447;
 i=kevin.tung.openbmc@gmail.com; s=20250924; h=from:subject:message-id;
 bh=QvD/ud6DrodRNKqUA2m4nL+/50pX/gxXw21okP8DcUg=;
 b=csBBxtxldogEQ8rY3FiSkJeHOhzuac4zcoGG5wphIcMFi6EvJcjhMsjESJ6SxzR6pTZfm9a2t
 NfCmbeaOchxD43dDjoBaxFLMKIIuBCb4bv9jKCT5u50KF6oapTWBuXE
X-Developer-Key: i=kevin.tung.openbmc@gmail.com; a=ed25519;
 pk=PjAss0agA0hiuLfIBlA9j/qBmJaPCDP+jmQIUB6SE7g=

Summary:
Add device tree for the Meta (Facebook) Yosemite5 compute node,
based on the AST2600 BMC.

The Yosemite5 platform provides monitoring of voltages, power,
temperatures, and other critical parameters across the motherboard,
CXL board, E1.S expansion board, and NIC components. The BMC also
logs relevant events and performs appropriate system actions in
response to abnormal conditions.

Signed-off-by: Kevin Tung <kevin.tung.openbmc@gmail.com>
---
Changes in v3:
- add missing dtb target in arch/arm/boot/dts/aspeed/Makefile
- remove unevaluated property `ncsi-package`
- Link to v2: https://lore.kernel.org/r/20250924-yv5_add_dts-v2-0-39a4a8e3c9e6@gmail.com

Changes in v2:
- send v2 of the series so that it's properly threaded.
- add idle disconnect to i2c mux.
- Link to v1: https://lore.kernel.org/all/20250917074812.4042797-1-kevin.tung.openbmc@gmail.com

---
Kevin Tung (2):
      dt-bindings: arm: aspeed: add Meta Yosemite5 board
      ARM: dts: aspeed: yosemite5: Add Meta Yosemite5 BMC

 .../devicetree/bindings/arm/aspeed/aspeed.yaml     |    1 +
 arch/arm/boot/dts/aspeed/Makefile                  |    1 +
 .../dts/aspeed/aspeed-bmc-facebook-yosemite5.dts   | 1067 ++++++++++++++++++++
 3 files changed, 1069 insertions(+)
---
base-commit: 30d4efb2f5a515a60fe6b0ca85362cbebea21e2f
change-id: 20250924-yv5_add_dts-9268ac14dfc0

Best regards,
-- 
Kevin Tung <kevin.tung.openbmc@gmail.com>


