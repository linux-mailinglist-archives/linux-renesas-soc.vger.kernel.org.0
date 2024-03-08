Return-Path: <linux-renesas-soc+bounces-3611-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 189E4876A7F
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Mar 2024 19:09:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ABAF81F217BF
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Mar 2024 18:09:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35AFA50251;
	Fri,  8 Mar 2024 18:09:36 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CD0E36D;
	Fri,  8 Mar 2024 18:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709921376; cv=none; b=P524bAlty+5B4J4TN7ZA4Qjd2Wq6E//EaVFl9eGHE9qGKszT3l2khEILGZ+YFnum+EuDsCpBZqQdNT9wAN0SVQo7NeRkre8D6+6QDTtUtmH6uuOIXS0yocBk9BNkKeSCaRr+3nmsEEyujlk9/u1yTsiTr8hehu5SFoT03SwiYpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709921376; c=relaxed/simple;
	bh=aXymyymSYLuzBbeJcCp1m7Gd501leCKKmuIOTBAl+1A=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=VAjVMHNXhtajHya2pVXSofBlw7i3M++nAXsC6lUnM2+aL3zw0H351H0w7abKH0so5gWVuIGENgu1HDcts5NvhOCVkDMVKMNwQFx4uZ/LYpd9NT8Hc8/bmQ+Y4gqnxcyhWQyvDZkoOTrcR+oUE6+WRx9i9k04gG/OdKqHJ522ZqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.07,110,1708354800"; 
   d="scan'208";a="196951375"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 09 Mar 2024 03:09:26 +0900
Received: from localhost.localdomain (unknown [10.226.92.24])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id DE49340138F8;
	Sat,  9 Mar 2024 03:09:22 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 0/4] Fix USB pipe configuration for RZ/G2L
Date: Fri,  8 Mar 2024 18:09:15 +0000
Message-Id: <20240308180919.6603-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The USBHS IP found on RZ/G2L SoCs only has 10 pipe buffers compared
to 16 pipe buffers on RZ/A2M. Document renesas,rzg2l-usbhs family
compatible to handle this difference for RZ/G2L family SoCs.

This patch series aims to fix the USB pipe configuration for RZ/G2L
family SoCs.

Biju Das (3):
  dt-bindings: usb: renesas,usbhs: Document RZ/G2L family compatible
  usb: renesas_usbhs: Remove trailing comma in the terminator entry for
    OF table
  arm64: dts: renesas: r9a07g0{43,44,54}: Update usbhs family compatible

Huy Nguyen (1):
  usb: renesas_usbhs: Update usbhs pipe configuration for RZ/G2L family

 .../bindings/usb/renesas,usbhs.yaml           |  6 +++-
 arch/arm64/boot/dts/renesas/r9a07g043.dtsi    |  2 +-
 arch/arm64/boot/dts/renesas/r9a07g044.dtsi    |  2 +-
 arch/arm64/boot/dts/renesas/r9a07g054.dtsi    |  2 +-
 drivers/usb/renesas_usbhs/common.c            | 33 +++++++++++++++++--
 5 files changed, 38 insertions(+), 7 deletions(-)

-- 
2.25.1


