Return-Path: <linux-renesas-soc+bounces-20166-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE2F9B1F05E
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Aug 2025 23:52:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 796996232C6
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Aug 2025 21:52:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A539724EABC;
	Fri,  8 Aug 2025 21:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XUnDleBn"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3056239E7D;
	Fri,  8 Aug 2025 21:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754689938; cv=none; b=W5ZTCS17PQoRXRJnEV9syhogTCDkvT3CiDQCgHnHebTP+S6nXuDtmv0jXqihgu41VFV7zxO/sp1NTrvif60YIQ5+sQQFkPD4b1zrGQe+VWhTIOkHYlEmrG3C1WJi4kG5tUswmAFx6X+3Uergbs33QR12dsSwswESxwytsHCszHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754689938; c=relaxed/simple;
	bh=H5pzW4rK/0uIYhTCzeqxuz5Y61KB6aUnUoE/fLS3obg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CbVNpAKc8jvxTLd8VcRwHxlXkV30y6psIXqfoespgYWNH0sCSsaQrUY0jiRhkXK6V+uM9wWMIgn2Qqw7Yz2rbxxWgZBuAcLbUQjDabS3tZ/zyUXc8a+vDNzVAKAFgj/LfrmaYB2mHr2j8/mugCpGZV8p7QeXhUcm8WELFkzAIAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XUnDleBn; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3b7961cf660so2106786f8f.1;
        Fri, 08 Aug 2025 14:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754689935; x=1755294735; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HVP02hbYW/vVTkcNkglWVxJaQ42iTr0teA7c4lN/Vig=;
        b=XUnDleBn8+h3fw36i3TuJmM4J1xUxMVyqR5k6kqcEbHrdCcILhZ8v0fK5FrhoMkhxk
         zcDN+b5SZKuySgnr5fgV8vH1/VzGvz3hjmtdKJ4/GSO3a0AZe4WKJACtYduQKN1EBcxa
         JFWWnh/Dq1AkiLl3H8RDE/7CRAOKMChMcdUlKCah+2PU0gg6HNc3F5saNcgPXpBz9frk
         TjC1vXTTUsMEJwlDxBeY0H6dNd7hLpQydnyYNmBGH50Yv+nbnIug7KeWkrdmwixq834L
         EUc5jrU1OwsYmloFlG7bShAPZbreDkjgnehQD9rKxcZSMuJkf4UnZnw8dsa7UNuanSAP
         EyYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754689935; x=1755294735;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HVP02hbYW/vVTkcNkglWVxJaQ42iTr0teA7c4lN/Vig=;
        b=wzVX/4TAxKVSnLzLQ7RaIFqKyAnXXJkC1n2f/6yY0XPypC9P9VmEfdxzSgV6qzKmBY
         qkDs847mLHljEKHr9LV4L72D7foqnMm1i5s3HFPEdbqERheh4vbGjaQwOYmqfjXZc8bx
         phcLHHLtTKgNEUtAWrM4ctgcw5umXFvSTHAK6vMBwi+9xg43TAEK0dp1jBuE0Jmn2ix/
         LSo/16iqH8g0lq8X7qyFGkpYx6m+mUCYhnxGApZ1YeIngrK3aPfI93VLU9tscsrniVEn
         VEsVpoUFEAYHSWVIdAAOKiCKssItLkpNAHLyrbF6GaqKwpFVU7LDCWHfr5i787bHluNi
         aKPg==
X-Forwarded-Encrypted: i=1; AJvYcCU06kpRZv5Ri5NNwx1MsXeaOqdWcGdJJeJDzw511Cl/06td+Qx81g1mcYes+1FjAX0ZcewtF6Btje5eqxp9aOPQOMM=@vger.kernel.org, AJvYcCV7bJtTHZjYTYpzFPPGQWfxYsz1nUynIj77UQGq7rMRLK1BJQtV3gQ3UnHIXc+47+YFzRR5zayiG2zNkMw7@vger.kernel.org, AJvYcCVRsHlewWAtD2G5SKn0wzE58dBfgQF0ERnMyKbOfYUKzSwhoEqQDLIRFD5ZLA4xN3d0ItUlO5FITvfH@vger.kernel.org
X-Gm-Message-State: AOJu0YyZwMgZyMFGyxqqF5hTrTNuVUKxTYVZBkYYnKnjd5fJBBDZDFk+
	KhfT8KPCX3k1hrbV62J6vWgXjfCS++WwXUmF7zoo82uE4UFpgJ25NdYi
X-Gm-Gg: ASbGncsjRRrx3Yf0gHNwCh7a1BGW/m8iBqrbE7O6ST1K9oWfNKQPaeweyAzzbGnrNY/
	Y/6yiJbvULdKBM/jR9y3gqLaffookiFvycXbfo795yQNs19qp/MK8MdxvmAgCd9v5bS6fXz4B6K
	sHpEmlZ4wFFkwEF6gsWAt/aSWFAWqI1YjLi2g/Fye2ZjvA7tdo1lUxWnNstiFgXfv1w8TGniEh6
	/pwrMolTIXCgXL95MSk4rK/cXfx9GEsFkAGiKJCBFEcMBBwcCTfe+CX29HuuVu5662jbkaNwyK5
	icdmmegDIS3ZRh2KW5kHXaR1DakKt/rXSMHn/CiPQLrH7ws74BtPOZ/EImeeFOD0x7aRUzKo4MG
	7UhGQdSfYt4NGWIhTyCfv9OjVbALXeEydkVS9uHb3CodgtyYd2V1IHkqZGcvIN9DiV0c5DXVvqe
	84TJEH6KCzPSveIgLCYA==
X-Google-Smtp-Source: AGHT+IFLXJG1UWXu64/6QuxEeGQUc9b73CPorwG5UI9KRn7jfc1aE/OitQZkEGs5sNkLYf3q0ttWfw==
X-Received: by 2002:a05:6000:290c:b0:3b7:94a2:87e8 with SMTP id ffacd0b85a97d-3b900b4db70mr3408350f8f.18.1754689934888;
        Fri, 08 Aug 2025 14:52:14 -0700 (PDT)
Received: from iku.example.org (97e54365.skybroadband.com. [151.229.67.101])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b8ff860acbsm5326759f8f.51.2025.08.08.14.52.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Aug 2025 14:52:14 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 0/5] Add USB2 PHY support for RZ/T2H and RZ/N2H SoCs
Date: Fri,  8 Aug 2025 22:52:04 +0100
Message-ID: <20250808215209.3692744-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

This patch series adds support for the USB2 PHY on the Renesas RZ/T2H
and RZ/N2H SoCs. The USB2 PHY driver has been updated to handle
differences in clocking, reset handling, and register configurations
specific to these SoCs.

v1->v2:
- Added Acked-by from Conor for the DT bindings.
- Renamed drvdata to phy_data.
- Updated commit message to clarify the change.
- Dropped local phy_data variable in probe, using channel->phy_data
  directly.
- Included the necessary header files.
- Simplified device/host detection in rcar_gen3_check_id() as suggested
  by Geert.
- Added Reviewed-by from Neil.

Cheers,
Prabhakar

Lad Prabhakar (5):
  dt-bindings: phy: renesas,usb2-phy: Add RZ/T2H and RZ/N2H support
  phy: renesas: rcar-gen3-usb2: store drvdata pointer in channel
  phy: renesas: rcar-gen3-usb2: Allow SoC-specific OBINT bits via
    phy_data
  phy: renesas: rcar-gen3-usb2: Add support for RZ/T2H SoC
  phy: renesas: rcar-gen3-usb2: Move debug print after register value is
    updated

 .../bindings/phy/renesas,usb2-phy.yaml        |  17 +++
 drivers/phy/renesas/phy-rcar-gen3-usb2.c      | 132 +++++++++++++-----
 2 files changed, 115 insertions(+), 34 deletions(-)

-- 
2.50.1


