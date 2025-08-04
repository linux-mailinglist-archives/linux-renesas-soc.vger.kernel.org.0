Return-Path: <linux-renesas-soc+bounces-19977-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C6B7B1AA13
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Aug 2025 22:27:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 49C663ACB06
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Aug 2025 20:27:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60E0F23185E;
	Mon,  4 Aug 2025 20:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IGsRYCZ4"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BC312163BD;
	Mon,  4 Aug 2025 20:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754339223; cv=none; b=XWvHlZ3qM8P3PaP3uIab7dNYUj72gpMdQ/6xDJVuw/d1lLegvnNyJZ0eIFm5T5yhv2qbN1ETDIE4y62u5jlj/Wa4ZfAnutlwEni0rxiePWBRXwhBFQjZq7SszTRp3o0tnQYTx1S/aaVffjhwkYpptatj7rsXJJqlC8EXLxoQl9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754339223; c=relaxed/simple;
	bh=AVZ5cWwmmKxWRYia2g6nLKo1V9s3qTxYu9H0oRfSQDM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=me1QTHy1049S8U7dDPWiCaKLT99sL3V0Gj81obn28F4YbVmfHbmY5eXOUXikzv5Hh1aSFWJvKP82irSapehL6E9B+T0fJTSrwYpDgd/9PbpXAK4FGSbyz5dLGYl5k7hLOqx/HzIl/qDD4QkQviXrDY2WByJlcs4RLvHAwDbk+O0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IGsRYCZ4; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3b7961cf660so3697725f8f.1;
        Mon, 04 Aug 2025 13:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754339220; x=1754944020; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VT9RRdG3IpHbGaM5xJRmWa+81aqfU4CvAY6XlD+iIJw=;
        b=IGsRYCZ4d5cGUXSFh8WTyj/+gYAzm+65Huz3fqo25rjoS4YIogNEosm8eBJayL9gBh
         I8XwsJ+/4XAV90qh1TK2s3A1fJGjz4ZK7fxsTppYt7oUilU7jXuD2N55v3I5FY41u7L+
         M/nL1WrTZX5W/7AxcN8jDD96B8iGWrOZn090pqA+XexaTGrkY1H4PiGWPyNLLPfuOsyf
         D4qkbFH3X0DeFba/WWDUVcj/iwBxR1sSj7a7H4Q7HDTgog5X0ZwRnmOqGZvNtedK4gFY
         KMEU7lar2ZhRwRoKmsG2GWnckYalBs7m5cuuagFOz20tMXjstbSo0umoU8E6lNZetJsI
         sJ+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754339220; x=1754944020;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VT9RRdG3IpHbGaM5xJRmWa+81aqfU4CvAY6XlD+iIJw=;
        b=v2rq4gcGdTow2RSo48pzESErEFp91Rt0JRAIFfveLi66y1ISkclKmCk1WcYJES0Cea
         mJXSNTyWuGV3mOSX8d7aMcIazsKN3pY6tFt5nvf+s7tVu5HytgMSCms8Iz6fkhLgDe7/
         BajuPft2M0GwptoGGSwITPx6CpuYjPltE4WHR04IiyOOEBVP4ECRN3icYM5twpcJkFjL
         qPMPkoJxfI9Md3JvnRW/acs2I423/ATVtooO6QCJl4kTeZRBzxZgLmjQ7VXVmTPr6zKH
         UQCJykp8Oqikh07GiElBaUuxQy0a/ZAMB2YPwJw7NON9TyHQerz9AFcwQvTlMx3R8NQy
         RVBw==
X-Forwarded-Encrypted: i=1; AJvYcCUzZhobtQYS8r/kQZsIazlpxHRgbzrPKcnmsa9Pby40ptNIKeTPZ/OK+028+2A6/KrM5naryYCE5/v6@vger.kernel.org, AJvYcCV9nwgt2YOZmQRh7NovDtNPZAd4aE69TwA9vx1rFmj0mYwVhgi/3q2envIVfSjbgt3/eqD23uFaxg4i@vger.kernel.org, AJvYcCXOrX5BK6XsFcvZ7cMG1e6Z472pRGsVeS/oXNO318zqHuid/dEuX3VMOndjsSdYbAmQpuIdqcnVrKNMm3ph@vger.kernel.org
X-Gm-Message-State: AOJu0YwY/maTXwAc+63R29V/k+UtPXrehPwhh+tChz3G4BlzjywA1+BD
	Dmx3Zj7INI4mI+gZdvim83BHka/JglG8KSMjizsd6K1l/LBzmf77Vrg8
X-Gm-Gg: ASbGnctS71jYSiQtENlZ1Xqq6IbtMbuZcUNxZPYnpIwK30YMDZPhaghigB5R9TFVQML
	jbVeDn7rfe3GlJXkIF/Z68yqvx8wzjR8LtDAP2L6O3WZymNCwrcG8bIttF3NE77tAVVXdF+2lzP
	34qyHfGEZouwzJ83NiieVujR0OM1J36mDx+UcttVH9ge1JbsWsPTdjVRZNAQSCLjYhOOIElmb3w
	THVT/rrr6xv3WxrWRSjDFld6ZKF1iQuJsjubDD3TM4ZM3Y+gTOLslX1KRWnC0qBBcy+48QzteyG
	rTt9aNpTIue/pgLJyqYqrmikEbeLnbQ88dZWS48sTVVKGBLIRbLssIL7YMmvL0S7h9BZKn+1O+K
	nCNjIgP66Lckc3BUY4GrWwscU+0ORBSdZLDHUXBKNLQVwGRPPWuM0cCm8otH3Ddz9DuVi1V3Ycg
	==
X-Google-Smtp-Source: AGHT+IFdPuNukp9fxbUH9P0wAm0r0/Wv6zrwnI5JgGBUPs6APV5Pnq2QTM8LT9KMMyVUqap86jE5Cw==
X-Received: by 2002:a5d:5f8b:0:b0:3b7:8b1b:a9d5 with SMTP id ffacd0b85a97d-3b8d94cf6c0mr7091481f8f.51.1754339219667;
        Mon, 04 Aug 2025 13:26:59 -0700 (PDT)
Received: from iku.Home (97e54365.skybroadband.com. [151.229.67.101])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c469319sm16396126f8f.54.2025.08.04.13.26.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 13:26:59 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/2] Add USB clock support for R9A09G077 and R9A09G087 SoCs
Date: Mon,  4 Aug 2025 21:26:41 +0100
Message-ID: <20250804202643.3967484-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

This patch series adds support for the USB clock on the Renesas R9A09G077
and R9A09G087 SoCs. The first patch introduces the USB_CLK clock ID in the
device tree bindings, while the second patch implements the clock in the
clock driver.

Cheers,
Prabhakar

Lad Prabhakar (2):
  dt-bindings: clock: renesas,r9a09g077/87: Add USB_CLK clock ID
  clk: renesas: r9a09g077: Add USB core and module clocks

 drivers/clk/renesas/r9a09g077-cpg.c                    | 4 +++-
 include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h | 1 +
 include/dt-bindings/clock/renesas,r9a09g087-cpg-mssr.h | 1 +
 3 files changed, 5 insertions(+), 1 deletion(-)

-- 
2.50.1


