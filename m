Return-Path: <linux-renesas-soc+bounces-19998-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0718DB1B2B9
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Aug 2025 13:47:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7A7217A0F76
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Aug 2025 11:46:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5580D24503B;
	Tue,  5 Aug 2025 11:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HJUAfxuQ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 942B23FE5F;
	Tue,  5 Aug 2025 11:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754394464; cv=none; b=pRakfDr8FkKIccv1v7DE/Nnrdt9XC3bbmBRIQ32mAVCG8LOVEPv5WVQ4GEoAqrg0/dS6fE8hJjn/ytvRy7rWra49sIdG4VsIaLQmeWF09rI6aM8j5KSO+LmIiB2IfpdDT2VmZOev1Giz8kH6t2EWPb5TKulxK6zxLZ51u1Dhvx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754394464; c=relaxed/simple;
	bh=6Ulxc18Rejt2tbnEykzRhkxktWHCMzeW1Hjxvu6/zL8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bG9cw0aT354GJe4VDpkGeBF62oGAcnZa96WrAyUIfwlOOhFB2w5276HZw5hp6fBRLO8hoLb6o3tX1ftet3hbSCw6ofYdOixqScsRnBSUTx6Oby/Sc5XiP5rToQ9NZyoetm5IE2r4gqgU5U/X7ndqOTcT5ms79ozmNNPcjk1fP0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HJUAfxuQ; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3b78d337dd9so2752449f8f.3;
        Tue, 05 Aug 2025 04:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754394461; x=1754999261; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=maoFJVEW9ssKmjyU8Wkqc3dGANom6Pn5g1YVcQUrT7o=;
        b=HJUAfxuQuQcc870PitVTmRbP6et3ZNCTjpXcj2EJZ+crl3DqVi7U5jIn5k92t4zfk/
         sROKOpI+X5xvj0b7GHt6oWgoGpHMrCi9Ajg2gkCdzUVBy9xTsgzSLnO9naorhLyOsfLw
         GEJVel28lsdyMwx3GlvGfwwFE07zNq+LgMG+KrE2HU+9StyNEm8hk1fsCgJpCWDng4IV
         LLu9FS7Ks1SusH6Alqbnt3y8jfQPW+xQh4+whcmlfBbp26YiX4uN63ZqryJSmvnrhFhZ
         797D8iZmCnwCz7f5yLBSY3pClO/pAaC4nWbsbXhnwD0bHKHrHbZe3DeL7eyKGq3vVrsm
         nUZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754394461; x=1754999261;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=maoFJVEW9ssKmjyU8Wkqc3dGANom6Pn5g1YVcQUrT7o=;
        b=heVBbGhiPQiQlMGamyJeDcunp2Ab7mK9s1DqRScYzZaJu9uMm6Xtzeo/VlV4hUuJ9f
         +3f7CwZrJqnzzb/qd3AhSoGqU/2WNtaFSy6E5lTP8ICa3kSFvlhpHVArhgWcz73cxgLh
         2M3t1XbMoAz/ppl9+iIMeOFy/pnVS3kAcaX+wbVif88kSJhLpeR2DRdg2+zqRbTS/Qby
         Kf3xSoOeS3OXgDOhgcgMMrDyhkEJcM0Z03XwyS9+ZJxpQCy9dVuW5xBkBGU6RjPIDUPT
         xs+pGuQS/6h5FR/PN45ZuhwrbsLaT+TIwYhcPF4//Swt6ibyff5KWWtP2LpV+R1wxHBR
         7y9g==
X-Forwarded-Encrypted: i=1; AJvYcCVSzfY3Y9XC9rKjRgVM6DPo8HFu76nk/0Hn5V0MBikZA04N6KNY4ug4X0+1HyEfPqMGEutCK9qxkwcsBTxrMUGplZ8=@vger.kernel.org, AJvYcCWa5n/F7xVXRpNsHikE8W8jH5qCK1X7RFvko08SomyO4EJ4x1zo5maVm9lLaKk0j2E81HDoBF7uM9r6Ml2h@vger.kernel.org, AJvYcCWnhU9LO7z1okLVHIjhZ3ICyO1vLP6OmWoSoL51AT4ruRatRr6n19/11YFFv6C5Xq9qb4K0ilFxJU8S@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7stA7tpdv7Jz8maN+PqxlMx0PszlEW0+Z0Otva0jl8G+T0tGB
	erNCCREupOYXETdcjtOzzvqVJhIgIvunElqCVR5Gny4ikaKA+3nqv3a3
X-Gm-Gg: ASbGncs/7gEv3EuepJa4ZGlfT5sSk36+5HlR0R3IeFhNy1DbprsXd5Vev2OHaTTxFlU
	rhmGiX1jK04qMO76WwVABrkr6u1CptoTiYzu3p/Kh8t/ugqTBWk5/ou15INpydT44qmrjq+YLBG
	HhdrOW0DGlpOcKr5sUIpM7ANipzBwE/3olJ91vKUMzeQ3cNOoAsoUTE8ViXe1ogVMG1av6pldQ2
	bN4bXJ/n8I++vbCK4mI/gmdQiENv5JLkJKqvIcgKOXpeiE9nTAzymUdlZigXtTQhx/DfKyosc4A
	KfPA7NMmVmSdEDtTEJBeXsue/MgvXzSyDzFO5yqe8SqkwyLS4i9bktZNjIg0IGwaF0k1ZFf9FWl
	C7owvgMtqDekNNKJp1PubLuUsHPQGdVMKRuQkTCIsoIIjXFiU42fbBmtX9dLH2t1eTxwA+/tAdA
	==
X-Google-Smtp-Source: AGHT+IGt/bUrKs8uhXIj2/PGpHQB9l5MDY6J0LmmhB9bhruimqSDBnCqONUNAc6UwmHxYz+XFLZAag==
X-Received: by 2002:a05:6000:2287:b0:3a4:eed9:755d with SMTP id ffacd0b85a97d-3b8d9464dabmr10172225f8f.3.1754394460484;
        Tue, 05 Aug 2025 04:47:40 -0700 (PDT)
Received: from iku.Home (97e54365.skybroadband.com. [151.229.67.101])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c4a2187sm19593597f8f.70.2025.08.05.04.47.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Aug 2025 04:47:39 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/2] Add USBHS support for RZ/T2H and RZ/N2H SoCs
Date: Tue,  5 Aug 2025 12:47:28 +0100
Message-ID: <20250805114730.2491238-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi All,

This patch series adds support for the USBHS controller on the Renesas
RZ/T2H (r9a09g077) and RZ/N2H (r9a09g087) SoCs. The USBHS controller on
these SoCs is functionally similar to the one found on the RZ/G2L, but
there are some differences in terms of interrupt configuration,
clock/reset requirements, and register bit definitions.

The first patch updates the device tree bindings to include these SoCs,
while the second patch modifies the USBHS driver to recognize the new
compatible strings and use the existing platform information for the
RZ/G2L.

Cheers,
Prabhakar

Lad Prabhakar (2):
  dt-bindings: usb: renesas,usbhs: Add RZ/T2H and RZ/N2H support
  usb: renesas_usbhs: Add support for RZ/T2H SoC

 .../bindings/usb/renesas,usbhs.yaml           | 28 +++++++++++++++++--
 drivers/usb/renesas_usbhs/common.c            |  4 +++
 2 files changed, 29 insertions(+), 3 deletions(-)

-- 
2.50.1


