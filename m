Return-Path: <linux-renesas-soc+bounces-8303-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D75195F4B6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Aug 2024 17:10:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BBDC91F2427C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Aug 2024 15:10:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 900C41946A2;
	Mon, 26 Aug 2024 15:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="NyU7ZOld"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5228E194139
	for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Aug 2024 15:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724684933; cv=none; b=SR9FVmqkgNeDzcyvPc6Kg0G/zcPEaRqurI0Ke4zKlIrVdla75729wN3/gqHpmgR4NVBtGDo9jHD7jrsIwWLmBo0k2XRiUE/pBfZrlEtMEXiO6R3zD430BZXsdmchYDvbOhURVbS6lM/TjlJSXoEVJGvJFcwoif8I1fvnas9/KXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724684933; c=relaxed/simple;
	bh=c/N0QqxBEE1f5Fsv6SEaZObzV2DU/DBb6JIsJs4vdf4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=usOSj7FIPj7b6iFvBypDzhcwtQW0FKyH3mmvHB87hMSIZp1YtpF0j6vXnZDQQh8XnDvRlOdwR75KWRT/GJNmYJ8J8EjL84jjSnHmruRvUQTafAk/w4Cz+Ha5T9jZeTsdvFYPGDXu0LefuG4lLw8DSljp811KPLeSRlH75C0gQAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=NyU7ZOld; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=zVunHA97CMyoQk
	WVVVmlORBSF8QpaAwYjt3Zl5V3hjg=; b=NyU7ZOldWEuy0m/nqVW2ZoKxDEPanm
	okZzRRqctGVCjIQ1qbByevjQPqQeV57VXL43GKjU21CUhkDhRVzMUDqlpfy1zn1x
	ppCtRMN18+4fvEDE1j6uPLfdswv+odf9WlF0K4NbugRdU5FfiFFSlk//Fd/P2XHL
	B5Ws/oZer8jbwOCZ1sg3QMX44rYrT8RDXRCagylgSWWWq9ftyN1W2l5t6UCgbKeN
	OO3mv87nXVdeFbzYpam/LPJ3Xr1bl+cibmU8CFwaR+9tZS+bd4tlGB1GiPy+cshg
	QyVG0RM425IQsqTz6+fwfx1fW+hlARxpDGoNNRFpitDQ1o4hn6cmxIvQ==
Received: (qmail 2032408 invoked from network); 26 Aug 2024 17:08:45 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 26 Aug 2024 17:08:45 +0200
X-UD-Smtp-Session: l3s3148p1@HGdPgJcgRoQgAwDPXwdRANgvu6DX4+2c
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-i2c@vger.kernel.org,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>
Subject: [RFC PATCH 0/2] i2c: rcar: add SMBAlert support
Date: Mon, 26 Aug 2024 17:08:41 +0200
Message-ID: <20240826150840.25497-4-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series allows an R-Car I2C IP core to handle SMBAlerts using a
GPIO. It was tested on a Renesas Lager board (R-Car H2) and the bindings
were checked with 'dtbs_check' and the latest dtschema which also
include SMBAlert additions[1].

The series is still marked RFC because I have one question left, see the
annotations of patch 1.

Looking forward to comments! Happy hacking...

[1] https://github.com/devicetree-org/dt-schema/commit/c51125d571cac9596048e888a856d70650e400e0


Wolfram Sang (2):
  dt-bindings: i2c: renesas,rcar-i2c: document SMBusAlert usage
  i2c: rcar: support named interrupts

 .../bindings/i2c/renesas,rcar-i2c.yaml         | 18 ++++++++++++++++--
 drivers/i2c/busses/i2c-rcar.c                  | 11 +++++++----
 2 files changed, 23 insertions(+), 6 deletions(-)

-- 
2.43.0


