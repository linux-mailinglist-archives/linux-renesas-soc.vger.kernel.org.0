Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 88C835DFEE
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Jul 2019 10:35:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727179AbfGCIf2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 3 Jul 2019 04:35:28 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:57666 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726400AbfGCIf1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 3 Jul 2019 04:35:27 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 1AB2125B833;
        Wed,  3 Jul 2019 18:35:23 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 22A099401DB; Wed,  3 Jul 2019 10:35:21 +0200 (CEST)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>, linux-usb@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH v2 1/2] dt-bindings: usb: renesas_usbhs: Rename bindings documentation file
Date:   Wed,  3 Jul 2019 10:35:13 +0200
Message-Id: <20190703083514.32385-2-horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190703083514.32385-1-horms+renesas@verge.net.au>
References: <20190703083514.32385-1-horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

For consistency with the naming of (most) other documentation files for DT
bindings for Renesas IP blocks rename the Renesas USBHS documentation file
from renesas-usbhs.txt to renesas,usbhs.txt.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

---
v2
* Accumulate review tags
---
 .../devicetree/bindings/usb/{renesas_usbhs.txt => renesas,usbhs.txt}      | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename Documentation/devicetree/bindings/usb/{renesas_usbhs.txt => renesas,usbhs.txt} (100%)

diff --git a/Documentation/devicetree/bindings/usb/renesas_usbhs.txt b/Documentation/devicetree/bindings/usb/renesas,usbhs.txt
similarity index 100%
rename from Documentation/devicetree/bindings/usb/renesas_usbhs.txt
rename to Documentation/devicetree/bindings/usb/renesas,usbhs.txt
-- 
2.11.0

