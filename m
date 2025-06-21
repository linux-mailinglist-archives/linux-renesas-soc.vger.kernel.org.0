Return-Path: <linux-renesas-soc+bounces-18598-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E17DAAE27D9
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 21 Jun 2025 09:51:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6AD1E189F7E0
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 21 Jun 2025 07:51:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07C5B1D6DB9;
	Sat, 21 Jun 2025 07:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ef9DDYfl"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DEB5196C7C;
	Sat, 21 Jun 2025 07:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750492292; cv=none; b=VeN9utHadGHfUYGh88vXlMsEhu8vA0CJ7nGjOTOOEXpZtatPcDzZrhNsCiuXSNiWwCHfvWwJbO9HVjFt74jDkY4mDALRBPMj6IErPhhboj+JuoVRVQCEbRQmRJWCaIy/UrTwhHQPaQScvqaNDahh/Q/vOnBZk54HmzzYDfG94mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750492292; c=relaxed/simple;
	bh=N2liG/VEGn1zE58WPTY+qTYBZrxC0ajqZccxgE1zYhE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=nuPA3otU8MFm/WiDDiDgsjy7a+UIvqbJ1AaYy2V4643/plAb7ykrMxausme37KlC68gEk3IROAwjLXSZAxgvS9jLg9hVeDFu66me9V2m+/Dn2n1cfkiP2JaTrqv8VS5/ccZ7kzXo3qnK+DmRWD7Qgz/GY17x4wR0Sipk6AFoFzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ef9DDYfl; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-b31c6c9959cso2739960a12.1;
        Sat, 21 Jun 2025 00:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750492291; x=1751097091; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QjH3SClgXI+/6Dzi1H3p1vPtwWYmzgf9jmyxigyRNKs=;
        b=Ef9DDYfl3ga2FVyggSxWSVmIOodYFddKkFKneC5PqkvrmdrEmqGyT417fDZYiJd+9l
         1jeAlg4W6typKl+wXqp8Vdu/N9QUUSlMoW2DogvVyWJK5CFAzZ3Nk5zl94758v7sS/7u
         zFk03XIDTRXMCmEGosCZU8ciW6VGyVCi2kCCB+/O5kMwF+mLwM5AfKzg1CCCcmnCMmY3
         IEuxBcwePYJsFMbnh2Pe0noc+z2wRGL2RJzDrOn5gcqkVmfEcqpRaCwL5JcH+PqUhphX
         ZKfUKRUVhQm94GD23qV3qv/0NoqP8EVli92iCKUbCIGERRStxAiw8PcwdPdd6koiuAHa
         56QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750492291; x=1751097091;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QjH3SClgXI+/6Dzi1H3p1vPtwWYmzgf9jmyxigyRNKs=;
        b=ZIHeFTW33/gMuT3JyGazBozMMd66XRiW232e9CuYSs1/zsykjOihtQ1n1TAKGLUz41
         0to28S5NgpE54grKPOLrxInbDMjiX+DMfhfLe8O3kf2Qx1V1ZvsFQgX1L5kR6GoZI4h0
         EIBoJT1BLkuij1q68d1c8Zxfz4V/ypRMZYbNXSizxG29qx9ZRu1Z4vaYXu4uAzRqumGt
         PSDLMaNsx+3zsQnEqhL5ap6tDyvuMdTBA3Wubf21jdDEvJXGwAFWIOK+XyvOMnqonNW3
         Ngg5uUZEkqTTr3ZbFXDIyhk9LOjFW2AD/7wn0ydWUf2B1OjuQ7IkquAd8ixUBichtVTG
         u6lQ==
X-Forwarded-Encrypted: i=1; AJvYcCXGRXjixwPzpeYdE47VLQEy6gqN19cSpUfb4UoZYxROmsbl5f9wWfp43SXTP6w+WCi6pm2OCZ7VNS/qoV7wFzc=@vger.kernel.org, AJvYcCXWVhtRIEStkp7iURvrLIQNMhq+nTK9VC8JHOEqpqWNXSG95QU63OO69rOXElpwrOSocw4wJhuAy1aCABp4@vger.kernel.org, AJvYcCXXINcLINMW0RYE6xKxxH5MbO0+BLSXMz8p+08D8SHdlLrMx9vL1bIZUWNZgFhLcoEIYgZollPKT8M95ForJVHwk5s=@vger.kernel.org
X-Gm-Message-State: AOJu0YxtrjHhgnZ/hKMr4VhMOwPVfcGP3Of5Pxnx1lsAKbh2wfd0j1ne
	5o9x8nhO1CyXKwAvcvlo9o4NLA2cCkJP69l5Wsi50PIRurPeTJJNDDyv
X-Gm-Gg: ASbGncvNdcLGNY2R52rje9hFAaqkCKg6gC5Q2jdyuwuwKnnwhcDVBHegARXtuzgDrXe
	P6DPu4Fz9mgSm3tNaSq3vqtV6/frTDpWvhF0tXSQG1fNsCqltwqUOLznIHP9fDuYiJPHAW+MgDf
	z6OH1Xo7iUnbRGV3EXm4PKnf2MgABhG6zbtAj6xFmt5aL96QZB6gJ4NZS331yZUrI3XsE+42dQC
	W38wsgmHLxrP5wK2DLk+FD048lZ/asE5HK0odjDcxBwd455pBxy41W1lXtpcQEvdZYeBK3en8YK
	Yekd2+IOWbdZvzOOMBe0xbRl7lOPwBF52CxGi6Mk5OuZTVWPzDgaZMUFb0uc9qlVUZa1Lb1nB2M
	US+BtzU3+q6kYx3dYkBYttp9Xo50MhTk=
X-Google-Smtp-Source: AGHT+IEyGXu1Hnb5EyVdRM7a2b3XmM0IodUz97aojyFKVoSTQ6nDz9nCL93hZ+xKfu3PXPQjvFm1Xg==
X-Received: by 2002:a17:902:f64a:b0:234:b44c:d3c8 with SMTP id d9443c01a7336-237d9a74415mr71122785ad.37.1750492290735;
        Sat, 21 Jun 2025 00:51:30 -0700 (PDT)
Received: from [172.17.0.2] (125-227-29-20.hinet-ip.hinet.net. [125.227.29.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d83ee9f6sm34823025ad.73.2025.06.21.00.51.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jun 2025 00:51:30 -0700 (PDT)
From: Leo Wang <leo.jt.wang@gmail.com>
X-Google-Original-From: Leo Wang <leo.jt.wang@fii-foxconn.com>
Subject: [PATCH v2 0/2] ARM: dts: Add support for Meta Clemente BMC
Date: Sat, 21 Jun 2025 15:50:58 +0800
Message-Id: <20250621-add-support-for-meta-clemente-bmc-v2-0-6c5ef059149c@fii-foxconn.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGJkVmgC/5WNQQ6CMBBFr0K6dgytUIWV9zAsyjDIJLYlbSUYw
 t2t3MDl+/l5bxORAlMUbbGJQAtH9i6DOhUCJ+OeBDxkFqpUdanlDcwwQHzPsw8JRh/AUjKAL7L
 kEkFvEZpKmko3PdbqIrJnDjTyejQeXeaJY/LhcyQX+Vv/sS8SSqAajdYNUXXt7yNz/q7onTujt
 6Lb9/0LFAttqtgAAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750492287; l=1084;
 i=leo.jt.wang@fii-foxconn.com; s=20250618; h=from:subject:message-id;
 bh=N2liG/VEGn1zE58WPTY+qTYBZrxC0ajqZccxgE1zYhE=;
 b=fCy/a+Emc3jwuaGbTCnI1u0J6Q4wpXHsYr7ABj3llz3y/iKtON9QG4+bPd2oXl0lGKNnIwxHG
 1cKF4oLZlwrADnOQp+1mn6tAnP3IjZ8Ko7b/XEx7cz9N0S9VWrlOWg9
X-Developer-Key: i=leo.jt.wang@fii-foxconn.com; a=ed25519;
 pk=x+DKjAtU/ZbbMkkAVdwfZzKpvNUVgiV1sLJbidVIwSQ=

This series adds initial support for the Meta Clemente BMC based on the ASPEED AST2600 SoC.

Patch 1 documents the compatible string.
Patch 2 adds the device tree for the board.

Signed-off-by: Leo Wang <leo.jt.wang@fii-foxconn.com>
---
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
 .../dts/aspeed/aspeed-bmc-facebook-clemente.dts    | 1254 ++++++++++++++++++++
 3 files changed, 1256 insertions(+)
---
base-commit: 52da431bf03b5506203bca27fe14a97895c80faf
change-id: 20250618-add-support-for-meta-clemente-bmc-941a469bc523

Best regards,
-- 
Leo Wang <leo.jt.wang@fii-foxconn.com>


