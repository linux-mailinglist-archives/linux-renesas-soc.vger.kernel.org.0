Return-Path: <linux-renesas-soc+bounces-13365-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B41CEA3C477
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Feb 2025 17:08:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A3258188DCA4
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Feb 2025 16:08:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 393C21FE444;
	Wed, 19 Feb 2025 16:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="LqSHTHpe"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9E381FDA97
	for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Feb 2025 16:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739981283; cv=none; b=IC7g7O+Lf5YIpNp5cCvyJAd3qkPWIxRZs3kpoV65U/dsjfI8ByYURzuHpjrTyIwdCpYeIWWu3ruBzz1Rv6awp7GtoG0o60+u+rczyQ+dzkRvW8NzXe9TKVcZ5NQFpCgP33niPP8T0Hj5TroN3LTYbQVKv/hULQU5ALBBlVdK8H0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739981283; c=relaxed/simple;
	bh=kudtpuxsWTIFCFoKJSMw9KCgS0xd5Fcnm1gsja5/LfA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JAELbp5sMjmpaPqCvhvaAcNSXgNG87flkz+3Va+CASz2QN/t314SqF7qZ+ZkMMPId9wtqY5xtkXNOddV1unUh5IH9TpB+cmV380aSrSptCO7x9sPeNFj9JPvNvZIlP9Ug/ovU+q2DdkSwR5XLncTuiMjS/jhnBMPwSACgHqSZXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=LqSHTHpe; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-aaf3c3c104fso1163537166b.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Feb 2025 08:07:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1739981278; x=1740586078; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DwMMGNmWOuotqPv4IxkXyX8g8+4F3yGXxMrg8cS3U8o=;
        b=LqSHTHpeck28688smqBzzVnK+ow4sAKr/DVBi/7QsTH9K/Ha5EC3/cYKEpp1jIHm30
         4ABE7l/DQBRPzmkgXFMfcERNrPfR/VDV28UCxKo1jOeO81IJBU3fQt0Id+VaMIt/RPBC
         iO/7vMQ+i1tXcWjmEVMYC1UwnQtkHhohHA2/VllDtGihY80f9rCCmyrvNH1ldk0OdKGi
         YAroX78iM4F97B//OxL9ZYjnDpMvHKmnlogxFbcxl3j+vgxDHAuKM7/9yLbT6vPD2Xnj
         m2ksoUlxdVhg/+21VklB+6H3bX+dsxJ13Q0t69Q5gzYSNZrtFD58iBJTToZX/DGkSwTF
         gW8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739981278; x=1740586078;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DwMMGNmWOuotqPv4IxkXyX8g8+4F3yGXxMrg8cS3U8o=;
        b=UOwbzz6yjPSC2Hu/Dy6AfNiulBVlMl2U2jy/lMxLZMK99L+0nw/XuUFuHEA6Y9e3Vi
         9b1xm0NQv7HjoFVUjoS2AcbZ7wBlEULVv9xCWJ9cqY/NWFNg3Qzlf+5CY01Rqp5ym50r
         erTcBXshf0Ces23OGTXPIBoXX9FjUDGYyEtK7/Fejpqf8Djrn8EJwdxHsQy9Gay5VSn5
         yfoUgRntjdx41nptBiAE/xNnGYQx4Xk9KLK3k+SS3CnXWucSZTspz4Wnykj4el7/hpZY
         NzP257Ye4qhc6drDVFPVOUFuy51fV+yjKtuBXpKVW1c97mVN3RCxKmyYwjIa7tZBX2la
         eHEg==
X-Forwarded-Encrypted: i=1; AJvYcCWY0/rHLMjljispb2uf+VgHz8W8LMU0rjkO9zosX1fBx1h/jHp/EjK+EAIf8a1kXF5MFybg5swCvi7BqXFzyaR9jg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyyBqdIQBo7LYkOeDxxqQO4gZQDddHnXEiEnzKelN/w5aIIDByL
	LhIvMYV1iZm7Gr7Brk7Qyqkpb09BJdj2QzRae5xs+00lzlzKnZv+KqJoqyBxW14=
X-Gm-Gg: ASbGnctDc3/aqZofomQdki+Y2HqeV2u+3L3zUfCgrOLPTWJAJXcIwhJRDkJGHRIO7Y2
	r4AjJ8OM/pWDWTawW9XlIvKxJazPHeYKQa+v34CwfrwiQevWUqVhvPXX9jxF9vkczFZizvYHSRl
	6JFzX7O7WjszF2SKlQpI6ugd0a+eS4ZF/GQThB1HGHcVD7P48nVGZmR8B9M6JqfcPAt5kUfDsBH
	Mx5yov86k5aYOXARGB6BJZoDsdhvjgbJnBRd7Qp9cf8Q0EBz649/Zm9QAS2NJDqlDhl108IRx3Q
	Z2mg0OV6X+p59mDffThq9cHSRgDaADIMvCFzoKcJ721D
X-Google-Smtp-Source: AGHT+IFb8j7IIkxOR/n0tzGJ+yjodWKnwFUug+Qx75yEhRVyIDQOoSAzY1twMqg5YS3jbZDvVYlQxw==
X-Received: by 2002:a17:906:9d2:b0:ab7:5fcd:d4e4 with SMTP id a640c23a62f3a-abb70d6b001mr1606723766b.41.1739981278058;
        Wed, 19 Feb 2025 08:07:58 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.25])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abbc0d0b882sm327791066b.109.2025.02.19.08.07.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 08:07:57 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: yoshihiro.shimoda.uh@renesas.com,
	vkoul@kernel.org,
	kishon@kernel.org,
	horms+renesas@verge.net.au,
	fabrizio.castro@bp.renesas.com,
	robh@kernel.org
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH RFT 0/5] phy: renesas: rcar-gen3-usb2: Fixes for Renesas RZ/G3S
Date: Wed, 19 Feb 2025 18:07:43 +0200
Message-ID: <20250219160749.1750797-1-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Hi,

Series add fixes for the Renesas USB2 PHY driver identified while
working on the Renesas RZ/G3S USB support. These changes are
needed for the upcomming RZ/G3S USB support (especially for the
power management support).

Series (with [1] on top) was tested on Renesas RZ/G3S with consecutive
unbind/bind and data transfer tests before/after the unbind/bind.

The unbind/bind was also tested on the devices with the following
device trees but w/o checking the data transfer (as I only had
remote access w/o USB devices connected):
- r8a7742-iwg21d-q7.dts
- r8a7743-iwg20d-q7.dts
- r8a7744-iwg20d-q7.dts
- r8a7745-iwg22d-sodimm.dts
- r8a77470-iwg23s-sbc.dts
- r8a774a1-hihope-rzg2m-ex.dts
- r8a774b1-hihope-rzg2n-ex.dts
- r8a774e1-hihope-rzg2h-ex.dts
- r9a07g043u11-smarc.dts
- r9a07g044c2-smarc.dts
- r9a07g044l2-smarc.dts
- r9a07g054l2-smarc.dts
- r9a07g043f01-smarc.dts

Please give it a try also on your devices with [1] on top as well.

Thank you,
Claudiu Beznea

Claudiu Beznea (5):
  phy: renesas: rcar-gen3-usb2: Fix role detection on unbind/bind
  phy: renesas: rcar-gen3-usb2: Move IRQ request in probe
  phy: renesas: rcar-gen3-usb2: Lock around hardware registers and
    driver data
  phy: renesas: rcar-gen3-usb2: Assert PLL reset on PHY power off
  phy: renesas: rcar-gen3-usb2: Set timing registers only once

 drivers/phy/renesas/phy-rcar-gen3-usb2.c | 134 +++++++++++++----------
 1 file changed, 74 insertions(+), 60 deletions(-)

-- 
2.43.0


