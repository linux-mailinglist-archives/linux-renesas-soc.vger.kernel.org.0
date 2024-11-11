Return-Path: <linux-renesas-soc+bounces-10442-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8222C9C3B90
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Nov 2024 11:03:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 480CC2813D4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Nov 2024 10:03:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC16F17838C;
	Mon, 11 Nov 2024 10:03:42 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from michel.telenet-ops.be (michel.telenet-ops.be [195.130.137.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC29C1474B9
	for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Nov 2024 10:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731319422; cv=none; b=usPhVIKSXAK4iXWQGfToedAhMc0i4jaYTPiiXj/zv00LWQPtmpMWVHyLnvEY9NDtsaqXYQLRN75Xf6ameV8dYuTHKbWFlDFuiIVXqsi4uMk5Zl5I5ikENEBetg6gsfZGPgcSgdqN9xh4K9udslRR/BwpT4QMRbyz+m93ifCjMRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731319422; c=relaxed/simple;
	bh=zpXE75j5SXUrQS7NbSN689rmukNp/PIZOEBLiTEyfeg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=lfmnWHeeROmqAZYd0CYOA3XCoq17ryfPJ4NqEIgryKeP5Zl1zgpgGtgTpBJ+1hCQW+iASyrMtFx1RVfKuT/CuEuZLpDXZyzaLMnw5VYKwKiakEbeydyXKOuAwQx17fGBkNrz5ac0zjjMtrZMe5Q5FBTbd3ZMzdYKfoaWQHp1JoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:1112:af69:5261:dfff])
	by michel.telenet-ops.be with cmsmtp
	id bN3P2D00R4cAbg906N3PoA; Mon, 11 Nov 2024 11:03:31 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1tARG9-006haP-VQ;
	Mon, 11 Nov 2024 11:03:23 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1tARGV-00AwGA-Ey;
	Mon, 11 Nov 2024 11:03:23 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Paul Barker <paul.barker.ct@bp.renesas.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Sergei Shtylyov <sergei.shtylyov@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-ide@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Simon Horman <horms@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v3] MAINTAINERS: Re-add cancelled Renesas driver sections
Date: Mon, 11 Nov 2024 11:03:21 +0100
Message-Id: <4b2105332edca277f07ffa195796975e9ddce994.1731319098.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Removing full driver sections also removed mailing list entries, causing
submitters of future patches to forget CCing these mailing lists.

Hence re-add the sections for the Renesas Ethernet AVB, R-Car SATA, and
SuperH Ethernet drivers.  Add people who volunteered to maintain these
drivers (thanks a lot!), and mark all of them as supported.

Fixes: 6e90b675cf942e50 ("MAINTAINERS: Remove some entries due to various compliance requirements.")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Simon Horman <horms@kernel.org>
Acked-by: Niklas Cassel <cassel@kernel.org>
Acked-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Paul Barker <paul.barker.ct@bp.renesas.com>
---
To be queued in renesas-fixes for v6.12.

v3:
  - Drop "+renesas" tag from Niklas' address,
  - Add S:-entries,
  - Add Acked-by, Reviewed-by,
  - Drop RFC status,

v2:
  - Add Acked-by, Reviewed-by,
  - Add M:-entries.
---
 MAINTAINERS | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e9659a5a7fb3347d..f232a48a6cf4e64d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19518,6 +19518,17 @@ S:	Supported
 F:	Documentation/devicetree/bindings/i2c/renesas,iic-emev2.yaml
 F:	drivers/i2c/busses/i2c-emev2.c
 
+RENESAS ETHERNET AVB DRIVER
+M:	Paul Barker <paul.barker.ct@bp.renesas.com>
+M:	Niklas Söderlund <niklas.soderlund@ragnatech.se>
+L:	netdev@vger.kernel.org
+L:	linux-renesas-soc@vger.kernel.org
+S:	Supported
+F:	Documentation/devicetree/bindings/net/renesas,etheravb.yaml
+F:	drivers/net/ethernet/renesas/Kconfig
+F:	drivers/net/ethernet/renesas/Makefile
+F:	drivers/net/ethernet/renesas/ravb*
+
 RENESAS ETHERNET SWITCH DRIVER
 R:	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
 L:	netdev@vger.kernel.org
@@ -19567,6 +19578,14 @@ F:	Documentation/devicetree/bindings/i2c/renesas,rmobile-iic.yaml
 F:	drivers/i2c/busses/i2c-rcar.c
 F:	drivers/i2c/busses/i2c-sh_mobile.c
 
+RENESAS R-CAR SATA DRIVER
+M:	Geert Uytterhoeven <geert+renesas@glider.be>
+L:	linux-ide@vger.kernel.org
+L:	linux-renesas-soc@vger.kernel.org
+S:	Supported
+F:	Documentation/devicetree/bindings/ata/renesas,rcar-sata.yaml
+F:	drivers/ata/sata_rcar.c
+
 RENESAS R-CAR THERMAL DRIVERS
 M:	Niklas Söderlund <niklas.soderlund@ragnatech.se>
 L:	linux-renesas-soc@vger.kernel.org
@@ -19642,6 +19661,17 @@ S:	Supported
 F:	Documentation/devicetree/bindings/i2c/renesas,rzv2m.yaml
 F:	drivers/i2c/busses/i2c-rzv2m.c
 
+RENESAS SUPERH ETHERNET DRIVER
+M:	Niklas Söderlund <niklas.soderlund@ragnatech.se>
+L:	netdev@vger.kernel.org
+L:	linux-renesas-soc@vger.kernel.org
+S:	Supported
+F:	Documentation/devicetree/bindings/net/renesas,ether.yaml
+F:	drivers/net/ethernet/renesas/Kconfig
+F:	drivers/net/ethernet/renesas/Makefile
+F:	drivers/net/ethernet/renesas/sh_eth*
+F:	include/linux/sh_eth.h
+
 RENESAS USB PHY DRIVER
 M:	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
 L:	linux-renesas-soc@vger.kernel.org
-- 
2.34.1


