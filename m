Return-Path: <linux-renesas-soc+bounces-9296-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 75BB198CDCB
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Oct 2024 09:35:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A7CDC1C2108D
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Oct 2024 07:35:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA1711581E5;
	Wed,  2 Oct 2024 07:35:20 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [195.130.132.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20866155735
	for <linux-renesas-soc@vger.kernel.org>; Wed,  2 Oct 2024 07:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727854520; cv=none; b=H8GauR/pCwiCKMmsk0vVOH7aRj8xlvkQYLXTNBZlv6cbQkeo25sKLEzIiteMf8FeS47tPZLcc5CEQE1cu9NaJPqsFK4WMZ0BE95jkzVZLuKtiPN36d43/eZiiGKNmrEDD5h6sbSMiMIOSkigSchlXhZGXSd/PmgY+lbBwtPuQOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727854520; c=relaxed/simple;
	bh=4XmCYMzrw/UcF0JJNZHFVpD3YUXK2utYW4mppMk8lM4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=D2ENZXWs+M5ipLFEKG+NsGUxbqymIaNKMZVAgCSkYi6ztJUt3NNEJE39qF3Uu9ocBPpAip8GhxOj1mbYcvmcs4sNLR6VTO+N2jrYKHfRXVIy2YeDvrGlVXU5WhN3clt2xpQPIHY4Mzfv8hoQggoHtX3VPTiKqM9R+BKbzj4nwkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:80d:3d68:c8fe:1932])
	by xavier.telenet-ops.be with cmsmtp
	id KKbF2D00L4Qoffy01KbFow; Wed, 02 Oct 2024 09:35:16 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1svtt5-0016yh-8Y;
	Wed, 02 Oct 2024 09:35:15 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1svttD-003tb2-GC;
	Wed, 02 Oct 2024 09:35:15 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/2] dt-bindings: usb: renesas,usbhs: Deprecate renesas,enable-gpio
Date: Wed,  2 Oct 2024 09:35:12 +0200
Message-Id: <e9cf476ffac794bad7b0860dc89afd62a9ebc812.1727853953.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1727853953.git.geert+renesas@glider.be>
References: <cover.1727853953.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 2071d0968e564b4b ("Documentation: gpio: guidelines for bindings")
deprecated the "gpio" suffix for GPIO consumers in favor of the "gpios"
suffix.  Update the Renesas HS-USB DT bindings to reflect this.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 Documentation/devicetree/bindings/usb/renesas,usbhs.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/renesas,usbhs.yaml b/Documentation/devicetree/bindings/usb/renesas,usbhs.yaml
index c63db3ebd07bd493..b23ef29bf7949ff9 100644
--- a/Documentation/devicetree/bindings/usb/renesas,usbhs.yaml
+++ b/Documentation/devicetree/bindings/usb/renesas,usbhs.yaml
@@ -76,6 +76,10 @@ properties:
       Integer to use BUSWAIT register.
 
   renesas,enable-gpio:
+    deprecated: true
+    maxItems: 1
+
+  renesas,enable-gpios:
     maxItems: 1
     description: |
       gpio specifier to check GPIO determining if USB function should be
-- 
2.34.1


