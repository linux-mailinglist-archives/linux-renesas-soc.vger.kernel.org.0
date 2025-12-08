Return-Path: <linux-renesas-soc+bounces-25656-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E788ECAD8EF
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 08 Dec 2025 16:21:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 61EBA3019B71
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Dec 2025 15:21:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8AD42D7DFF;
	Mon,  8 Dec 2025 15:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jWvmYVxO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 782F92C11D3
	for <linux-renesas-soc@vger.kernel.org>; Mon,  8 Dec 2025 15:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765207300; cv=none; b=L9kfqz9gJMDxt8TngCEaRA18UOw7EnBtRtqPRWPG0iAfGkd2HS4Ssaab+MotppdXCwmudU77Q+Du4h8/nHSwTwZCie7ik/UacgDqX7ZpIIu/fYv4S3ogTsdx+xVgYqYBfLHsymgNj7QltLhD+HHpmJmwB3qk4WsMpdB4DHeqiFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765207300; c=relaxed/simple;
	bh=JP2fz9Dv4DJWLvkYoNe7H1Oid5YvFT7CctbsVz7dpSQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qgnwVC/BisQeWwxGz2Hop3PGWPhxSEOtiAdChfzhAXsek5k0s5HFusdZgBeXTyWXL8y8LJxvBB03y6C+SuWJZhblFrW2bp9L9e0zXEgwNgxTGhYk17hMdg06icyHYNi89qfVA5KwLkLoOhvBn0eDgj9TbcMnhQl2ZpFcK3PxJXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jWvmYVxO; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-64951939e1eso874063a12.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 08 Dec 2025 07:21:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765207297; x=1765812097; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B4/wvP35/1XunlBudfWVzFMdIF32aFpqLyJzIThUjSU=;
        b=jWvmYVxOcwGMAruzdYSPMnTY0VSgS6VlcC7Y/ppUuJhwDez++ykh7TEPIPJCNn94h0
         DyjxUh5/7GzhQuQYCHYhPmgnrhaK4CIYD5wrngRymhkeZYkaW5kJS6m0q7BNTNw6ziUs
         5nDDeYf7yiEo+v3HjzTF/yp+xx+ms+83Odmrm0VNDQcYQAb9C2yvZPuPhvqeyDl3Exhz
         EAox1p4Za2ta40H5+z1p5dw3s5KaluCLre9f1RxSUlIU1b3f2idNxbPmOUwQcksDq+JG
         nfI2VylMsFS+bpe8AoQfVt0rqBgxZ0rR83qV229Oee8I+ssZfdcOwt9CnWphSmMhNXOO
         OXfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765207297; x=1765812097;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B4/wvP35/1XunlBudfWVzFMdIF32aFpqLyJzIThUjSU=;
        b=RLn3tmWxXhpcP6820jx7Mg/WcukcW+dYuv/sR14aYz4POVkWxr/qWJab0og042+weI
         NtVH/dDkgHvBXKUM/g4QA2K5fXwM22N2YVNB6LuKhEJ6lW6xJvOXyJRseO0ISK3JUczh
         mFhcSSvp/U4jJg8FlBy8ZTP65PgOzVoNNBmR6oPb8fhYfmaduV/wfOCdbJGDWWWJW69I
         fJaUuInbSVDqXzB26WXvLODxXJbCrt4gmNIUb24pd3Qg3rOgwAg7TLLngscEAmFskdCx
         4wo82JqfjP7h2lAC8dIqd7Q9csI1kJKRFxXuoesJBGCd986fOegj7aa/9kxRVfF0gqaO
         ekTA==
X-Forwarded-Encrypted: i=1; AJvYcCXhHXU+qf8tj2WhUcJwMgosoxSi0jHgpnZZ+7hGoaB8u+a/EJDA7X30a0bL1iaaJ3LhSef6jdR8KHKzgJwXhHQgvg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwnMpc776388SUGCWkjrkanInfBCZIHQRSG7yvvRvfn8YOnf9J2
	TiNnAGTX6e5QHe2WaE16xCYFBEajJ8xiQgfbhsi3CqMbWIYCkTV63NM1
X-Gm-Gg: ASbGnctdxKbNvNMG2KrcwLGEvZp5wEBwCzDKbT7NvYZ1A8Q2tsuG6ki3/shsHIiyNAd
	245vXhvTN32Wjf/YE7By89Zmu8kAuGyyGd6lpDkV8W6hcMxDMB+g1ztlSYJGTXmKF4XTUjvQMgC
	1xU9TkN4EGq2uk8Rk7FC+vI7zM77XQJRRJ7Lu6k/tr1kw1sy2qGF73txOGtaYCqA3KpTd6xhdDg
	qu6vjXxy+m5RZYmeMNCvjf1AxDTRq5yl580pJeHx2ObEFZKD4o4Ey8e4BpDweyCPpQSj0Z0XQal
	TaJhZsDdPh6Fgh3i8tgpd0BvxDfCdZP0e998hjjjyQpnOIdkVKc4b2Lrsv2Hk2ABUqwHJWhO1hv
	8+YI6XzA6fo3N6b1Jg66w8wah/wNiZuJpDkGW7b0/fpSrGYRFSgsM+kWoplWTkMQ/2Rf/GXNpsn
	vWTDBYUUk3Mlf/lho6WAaXohfip9XlT+0n92K4LmGorlbTq7X4yxHOiP5ey9sZhv0h4VIUXKS1s
	WFd9UdhBUL60yN0
X-Google-Smtp-Source: AGHT+IHxdWJsw1kNb8reJw7JSoI2S/TXuOuDjwZ2NsDuaPdfwtLRf7UY3wFExCIiplYPXHFP+4litQ==
X-Received: by 2002:a05:6402:3485:b0:63b:ef0e:dfa7 with SMTP id 4fb4d7f45d1cf-64919c043dbmr6304762a12.6.1765207296481;
        Mon, 08 Dec 2025 07:21:36 -0800 (PST)
Received: from localhost.localdomain (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-647b412deddsm11547484a12.31.2025.12.08.07.21.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Dec 2025 07:21:36 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v4 0/9] Add RZ/G3E GPT support
Date: Mon,  8 Dec 2025 15:21:17 +0000
Message-ID: <20251208152133.269316-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Add RZ/G3E GPT support. It has multiple clocks and resets compared to
RZ/G2L. Also prescale field width and factor for calculating prescale
are different.

v3->v4:
 * Added wave form callback conversion back to this patch series.
 * Updated rzg2l_gpt_is_ch_enabled() fit into 80-character limit for
   consistency with other functions.
 * Dropped field_{get,prep} as mainline now support it.
 * Updated commit description for patch#3
 * Retained RZG2L_GTCR_TPCS bit definitons
 * Replaced gtcr_tpcs_mask->gtcr_tpcs
 * Updated commit header and description for patch#4
 * Renamed prescale_pow_of_two_mult_factor->prescale_mult
 * Added RZG3E_GTCR_TPCS bit definition for RZ/G3E and added to
   rzg3e_data.
 * Added error checks on suspend() and device set to operational state
   on failure().
 * Added Rb tag from Geert for SoC dtsi.
 * Added SW_GPIO9_CAN1_STB check to gpt0 node.
v2->v3:
 * Added Rb tag from Rob for bindings patch
 * Dropped wave form callback conversion from this patch series as
   it is covered in another series[1]
 * Added suspend/resume support.
v1->v2:
 * Created separate document for RZ/G3E GPT.
 * Updated commit header and description for binding patch.
 * Added waveform callback conversion to this series.
 * Collected tag.
 * Added link to hardware manual
 * Updated limitation section in driver patch.

Biju Das (9):
  dt-bindings: pwm: Document RZ/G3E GPT support
  pwm: rzg2l-gpt: Implementation of the waveform callbacks
  pwm: rzg2l-gpt: Add info variable to struct rzg2l_gpt_chip
  pwm: rzg2l-gpt: Add prescale_mult variable to struct rzg2l_gpt_info
  pwm: rzg2l-gpt: Add calculate_prescale() callback to struct
    rzg2l_gpt_info
  pwm: rzg2l-gpt: Add RZ/G3E support
  pwm: rzg2l-gpt: Add suspend/resume support
  arm64: dts: renesas: r9a09g047: Add GPT nodes
  arm64: dts: renesas: r9a09g047e57-smarc: Enable GPT on carrier board

 .../bindings/pwm/renesas,rzg3e-gpt.yaml       | 323 +++++++++++++++
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi    | 184 ++++++++
 .../boot/dts/renesas/r9a09g047e57-smarc.dts   |  13 +
 drivers/pwm/pwm-rzg2l-gpt.c                   | 392 +++++++++++++-----
 4 files changed, 819 insertions(+), 93 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pwm/renesas,rzg3e-gpt.yaml


base-commit: 82bcd04d124a4d84580ea4a8ba6b120db5f512e7
-- 
2.43.0


