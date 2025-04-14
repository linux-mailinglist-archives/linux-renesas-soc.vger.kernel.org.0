Return-Path: <linux-renesas-soc+bounces-15910-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CD062A880FA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Apr 2025 15:00:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 982043B50DC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Apr 2025 13:00:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDADD13D531;
	Mon, 14 Apr 2025 13:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ELapdiot"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AD3345C14;
	Mon, 14 Apr 2025 13:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744635630; cv=none; b=GG91N2fuNI+FeCeyIK2ezOWVeqTp5KIRSScVbeEk3ZefpUW7fHFHjcPP2ci039/4BN/Jahj6UNr91l67I3YsHxmN7SfV6VVO7kIeDPd2dLtu66I1Bf6kwQJHjsLsddv7DfYwukPC0/E8WhYA+h8zKLcy+cULSkHpsQMgcc+nHdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744635630; c=relaxed/simple;
	bh=Ez/UPR4HSb5TIHx/JJX8f0N7DcjAQFyn3Ic8w/YWy8E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BMKY9dRz03W5+h0AVKptZk07vD4aea0h1B2nszlnNtMbyF5xyi7a0jzTi09ShUCLqstDUuDfRNJ7JFeH/QJBbt/cqCHQDT87v/zF7JWTNiA/GCeX6t/Zr9aRXRbn8E9WUxU0gBiiJpjnICzlWsNfew7FeVZ3hFoe3iB0zWclJDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ELapdiot; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3914aba1ce4so3634958f8f.2;
        Mon, 14 Apr 2025 06:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744635627; x=1745240427; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/2427Gt32tJZ/eAtKR3IoeTfqSzJgoxatQqsLi3aD1w=;
        b=ELapdiotMw8ubGXbrvWPSj4Da16helJ9YamWHW2GK6K0ZFAldBWPCzRKX7bH9x5zAW
         vKkWWON0jEz8JfN/KpbIIXrDbJfvhWvKpi8ny0fuNpYjuBsLQJTJn61rP2CpWjg/2qDb
         lrzS99UoFwe8GNAL7kjrlKavdsz9SAxTDVf/NFFHbsLFOvdVKXQ93zYzNc9ZdmL61vdQ
         8/PjC43nOakbu2+Hp5Kgpnhc6cYgl3WF1Y+GwAbPILx6B/FR1ZuTapBH5wIXvQEinHf0
         VIxeB/NOLcjpu0+Hb7GEFJKb3gt5odBkdOiyLQXw7l1GVu5HIS61ARKcvRWbTkZ6RKrK
         2qVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744635627; x=1745240427;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/2427Gt32tJZ/eAtKR3IoeTfqSzJgoxatQqsLi3aD1w=;
        b=ZcktI19eHgJoBNuhh0kfOoV+ZtWxRBcl5jRobJPZjYVw8OC8i+KwWtlxBxhhaThhZ1
         XK2+rZy+0Bgs5+3k2UntYUGVi0hzMJ7rrYbHnmq9UArDr8z1f7OVcaVoX1G+vWnqI3Kb
         ZI9tTaZ6BNDMTfxL0WUe64o/LQM7+B0RnLdmXpAuU0grdkgDhv8WvxsoykFOoeJJMwPC
         xlgevsuN1fGns8TmCsLXImBljQcJzJrnh64ePDlZhclO1IH85PA+ZqAxuyE+i5zT7eG4
         n5xdCZxJ814hhPGHdVLHY+MB+MoGRFl8ja0SzOdJ717BPnoo7j2nF49GJYGblkupdIN0
         eoRA==
X-Forwarded-Encrypted: i=1; AJvYcCUs2WpqE/XNAztgrWNwem43/H0KAsLtpB2rkP5CS8jrSvQZjcKRAEIpCxo26zlU9TBGDJ/MLr2yuzbP2sSF@vger.kernel.org, AJvYcCXQ1FtrU1J1Pkf5MjCWePkGxZIPiBubKIemhTZekvcDhoWtkek8pY7CWlvLozOpqs01JAmUE+bHwwys@vger.kernel.org
X-Gm-Message-State: AOJu0YxUOofYjKfuX/7OMqHPtAPFriG7hACxkfehku0IxA1FyPEeGjS3
	Wg+rojW6HxyNYfs5zEgIxUVcadfFTCKRG3UxDTiMOf97nL5WfVQY
X-Gm-Gg: ASbGncta+lgS34tcavpL96RYbZK4vcYP1dyBm1QvBySfs6Zm3t+bYC6jv3XKF7ItL4h
	5Iqo4vAofoUQS+fA1EqIUKqxIpXHcimivsgAQFCYOpVsWzrNcQK2YUklqnQWiqxJSAeR/ipxKEU
	HAnE/Ef1xTsd8v4pp1vdgLEDbn536jZXCDNukNiwC9Hh/mlgjVq1tEm75ovcnK3fP3DRuZoAirZ
	vigUKQom5TL4A35yNz+9kP75kcyapL9EL5AdR8XRgKjNiBe3gFbm0hBEqSXJC1SOuK8sNgl3Uhe
	E424gSozrQZRH8eQTghuhyDgyW0c4xXte69d4uSgomqFtak+WPLjzjCtnJrPHHum
X-Google-Smtp-Source: AGHT+IGt6CFoV6kYc1oA0gav70B3lraHCV6cPJ5lCOXquAVMEOKF33QQLauUeTQaI1Xv0ehjKBe+uQ==
X-Received: by 2002:a05:6000:2481:b0:391:2bcc:11f2 with SMTP id ffacd0b85a97d-39ea51ed3ebmr10642258f8f.1.1744635627040;
        Mon, 14 Apr 2025 06:00:27 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:eb55:397c:6c6:e937])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae979663sm11214681f8f.51.2025.04.14.06.00.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 06:00:26 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v4 3/3] MAINTAINERS: Add entry for Renesas RZ/V2H(P) USB2PHY Port Reset driver
Date: Mon, 14 Apr 2025 14:00:20 +0100
Message-ID: <20250414130020.248374-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250414130020.248374-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250414130020.248374-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add a new MAINTAINERS entry for the Renesas RZ/V2H(P) USB2PHY Port Reset
driver.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 207ed66ead11..39adc1decb20 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20609,6 +20609,14 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/usb/renesas,rzn1-usbf.yaml
 F:	drivers/usb/gadget/udc/renesas_usbf.c
 
+RENESAS RZ/V2H(P) USB2PHY PORT RESET DRIVER
+M:	Fabrizio Castro <fabrizio.castro.jz@renesas.com>
+M:	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
+L:	linux-renesas-soc@vger.kernel.org
+S:	Supported
+F:	Documentation/devicetree/bindings/reset/renesas,rzv2h-usb2phy-reset.yaml
+F:	drivers/reset/reset-rzv2h-usb2phy.c
+
 RENESAS RZ/V2M I2C DRIVER
 M:	Fabrizio Castro <fabrizio.castro.jz@renesas.com>
 L:	linux-i2c@vger.kernel.org
-- 
2.49.0


