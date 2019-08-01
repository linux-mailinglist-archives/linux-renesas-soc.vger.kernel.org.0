Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 96D487D848
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Aug 2019 11:13:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730890AbfHAJNr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 1 Aug 2019 05:13:47 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:59628 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726799AbfHAJNr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 1 Aug 2019 05:13:47 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id F135425AD84;
        Thu,  1 Aug 2019 19:13:44 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id C878E94035F; Thu,  1 Aug 2019 11:13:42 +0200 (CEST)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH] dt-bindings: usb: renesas_gen3: Rename bindings documentation file to reflect IP block
Date:   Thu,  1 Aug 2019 11:13:37 +0200
Message-Id: <20190801091337.27786-1-horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

For consistency with the naming of (most) other documentation files for DT
bindings for Renesas IP blocks rename the Renesas USB3.0 peripheral
documentation file from renesas,gen3.txt to renesas,usb3-peri.txt

This refines a recent rename from renesas,gen3.txt to renesas-gen3.txt.
The motivation is to to more accurately reflect the IP block documented in
this file.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
* Based on v5.3-rc1
---
 .../devicetree/bindings/usb/{renesas,usb3.txt => renesas,usb3-peri.txt}   | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename Documentation/devicetree/bindings/usb/{renesas,usb3.txt => renesas,usb3-peri.txt} (100%)

diff --git a/Documentation/devicetree/bindings/usb/renesas,usb3.txt b/Documentation/devicetree/bindings/usb/renesas,usb3-peri.txt
similarity index 100%
rename from Documentation/devicetree/bindings/usb/renesas,usb3.txt
rename to Documentation/devicetree/bindings/usb/renesas,usb3-peri.txt
-- 
2.11.0

