Return-Path: <linux-renesas-soc+bounces-4000-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C62B887EDF
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 24 Mar 2024 21:40:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C717D1F20FA5
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 24 Mar 2024 20:40:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F388DDD2;
	Sun, 24 Mar 2024 20:40:30 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx01.omp.ru (mx01.omp.ru [90.154.21.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A5371426B;
	Sun, 24 Mar 2024 20:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.154.21.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711312830; cv=none; b=hmFqI5YAc4KG1XWQiWjRr+hJdGnq2gquM3K03H/OlwYqhFzlI78A/McTgY3UXrUK+EtYxzoTOZhrOdHZcax3Dp73rRF+AXu3E0URCM7zi7+6cs/UbNTBE5FA5ryGPjsThDEp3cTjkKtQXiLNnzgac7F22zKHCifIyirmCTxlJSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711312830; c=relaxed/simple;
	bh=eSkzbNcdxq5i+ZjblDTJMZq8oGFlJYYvqI2qfkQZXCE=;
	h=From:Subject:To:Message-ID:Date:MIME-Version:Content-Type; b=JWzoezMPKLj6uGbnuIuIF8u1CfJSJccXAMaCbjK3Z3gudxkKjWLs8TgdmM+1zcRPTeCrlsD8hFjg20GDf0fwHk7nX+JSEkmfCzIFhcH1SA8VXMDW59rRA5eL7AHHTkqY1tlSWzvjioBPS17qlvrCh+vpLBJxU2r7KR/RXCwZqq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru; spf=pass smtp.mailfrom=omp.ru; arc=none smtp.client-ip=90.154.21.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=omp.ru
Received: from [192.168.1.105] (178.176.73.119) by msexch01.omp.ru
 (10.188.4.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Sun, 24 Mar
 2024 23:40:10 +0300
From: Sergey Shtylyov <s.shtylyov@omp.ru>
Subject: [PATCH net] MAINTAINERS: split Renesas Ethernet drivers entry
To: <netdev@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Yoshihiro
 Shimoda <yoshihiro.shimoda.uh@renesas.com>
Organization: Open Mobile Platform
Message-ID: <de0ccc1d-6fc0-583f-4f80-f70e6461d62d@omp.ru>
Date: Sun, 24 Mar 2024 23:40:09 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 6.1.0, Database issued on: 03/24/2024 20:18:51
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 59
X-KSE-AntiSpam-Info: Lua profiles 184373 [Mar 24 2024]
X-KSE-AntiSpam-Info: Version: 6.1.0.4
X-KSE-AntiSpam-Info: Envelope from: s.shtylyov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 11 0.3.11
 5ecf9895443a5066245fcb91e8430edf92b1b594
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: {relay has no DNS name}
X-KSE-AntiSpam-Info: {SMTP from is not routable}
X-KSE-AntiSpam-Info:
	127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;omp.ru:7.1.1
X-KSE-AntiSpam-Info: ApMailHostAddress: 178.176.73.119
X-KSE-AntiSpam-Info: {DNS response errors}
X-KSE-AntiSpam-Info: Rate: 59
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=temperror header.from=omp.ru;spf=temperror
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 03/24/2024 20:24:00
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 3/24/2024 3:38:00 PM
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit

Since the Renesas Ethernet Switch driver was added by Yoshihiro Shimoda,
I started receiving the patches to review for it -- which I was unable to
do, as I don't know this hardware and don't even have the manuals for it.
Fortunately, Shimoda-san has volunteered to be a reviewer for this new
driver, thus let's now split the single entry into 3 per-driver entries,
each with its own reviewer...

Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>

---
The patch is against the 'main' branch of the Netdev Group's 'net.git' repo...

 MAINTAINERS |   29 +++++++++++++++++++++++++----
 1 file changed, 25 insertions(+), 4 deletions(-)

Index: net/MAINTAINERS
===================================================================
--- net.orig/MAINTAINERS
+++ net/MAINTAINERS
@@ -18724,13 +18724,24 @@ S:	Supported
 F:	Documentation/devicetree/bindings/i2c/renesas,iic-emev2.yaml
 F:	drivers/i2c/busses/i2c-emev2.c
 
-RENESAS ETHERNET DRIVERS
+RENESAS ETHERNET AVB DRIVER
 R:	Sergey Shtylyov <s.shtylyov@omp.ru>
 L:	netdev@vger.kernel.org
 L:	linux-renesas-soc@vger.kernel.org
-F:	Documentation/devicetree/bindings/net/renesas,*.yaml
-F:	drivers/net/ethernet/renesas/
-F:	include/linux/sh_eth.h
+F:	Documentation/devicetree/bindings/net/renesas,etheravb.yaml
+F:	drivers/net/ethernet/renesas/Kconfig
+F:	drivers/net/ethernet/renesas/Makefile
+F:	drivers/net/ethernet/renesas/ravb*
+
+RENESAS ETHERNET SWITCH DRIVER
+R:	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
+L:	netdev@vger.kernel.org
+L:	linux-renesas-soc@vger.kernel.org
+F:	Documentation/devicetree/bindings/net/renesas,*ether-switch.yaml
+F:	drivers/net/ethernet/renesas/Kconfig
+F:	drivers/net/ethernet/renesas/Makefile
+F:	drivers/net/ethernet/renesas/rcar_gen4*
+F:	drivers/net/ethernet/renesas/rswitch*
 
 RENESAS IDT821034 ASoC CODEC
 M:	Herve Codina <herve.codina@bootlin.com>
@@ -18840,6 +18851,16 @@ S:	Supported
 F:	Documentation/devicetree/bindings/i2c/renesas,rzv2m.yaml
 F:	drivers/i2c/busses/i2c-rzv2m.c
 
+RENESAS SUPERH ETHERNET DRIVER
+R:	Sergey Shtylyov <s.shtylyov@omp.ru>
+L:	netdev@vger.kernel.org
+L:	linux-renesas-soc@vger.kernel.org
+F:	Documentation/devicetree/bindings/net/renesas,ether.yaml
+F:	drivers/net/ethernet/renesas/Kconfig
+F:	drivers/net/ethernet/renesas/Makefile
+F:	drivers/net/ethernet/renesas/sh_eth*
+F:	include/linux/sh_eth.h
+
 RENESAS USB PHY DRIVER
 M:	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
 L:	linux-renesas-soc@vger.kernel.org

