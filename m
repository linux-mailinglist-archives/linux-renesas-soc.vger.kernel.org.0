Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C2AFA47DDC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Jun 2019 11:06:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727901AbfFQJG2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 17 Jun 2019 05:06:28 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:36432 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725962AbfFQJG2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Jun 2019 05:06:28 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id ECDEC25B7A8;
        Mon, 17 Jun 2019 19:06:21 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 04DFF9403E5; Mon, 17 Jun 2019 11:06:19 +0200 (CEST)
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
Subject: [PATCH 2/2] dt-bindings: usb: renesas_gen3: Rename bindings documentation file
Date:   Mon, 17 Jun 2019 11:06:03 +0200
Message-Id: <20190617090603.8449-3-horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190617090603.8449-1-horms+renesas@verge.net.au>
References: <20190617090603.8449-1-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

For consistency with the naming of (most) other documentation files for DT
bindings for Renesas IP blocks rename the Renesas USB3.0 peripheral
documentation file from renesas-gen3.txt to renesas,gen3.txt.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 .../devicetree/bindings/usb/{renesas_usb3.txt => renesas,usb3.txt}        | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename Documentation/devicetree/bindings/usb/{renesas_usb3.txt => renesas,usb3.txt} (100%)

diff --git a/Documentation/devicetree/bindings/usb/renesas_usb3.txt b/Documentation/devicetree/bindings/usb/renesas,usb3.txt
similarity index 100%
rename from Documentation/devicetree/bindings/usb/renesas_usb3.txt
rename to Documentation/devicetree/bindings/usb/renesas,usb3.txt
-- 
2.11.0

