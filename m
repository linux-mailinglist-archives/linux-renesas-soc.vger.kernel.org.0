Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B28845C89D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Nov 2021 16:28:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235427AbhKXPbb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 24 Nov 2021 10:31:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235265AbhKXPbb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 24 Nov 2021 10:31:31 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E1FFC061574;
        Wed, 24 Nov 2021 07:28:21 -0800 (PST)
Received: from Monstersaurus.ksquared.org.uk.beta.tailscale.net (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8F57A92A;
        Wed, 24 Nov 2021 16:28:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1637767698;
        bh=xeHGpCfeHP659Mrk09NQ8LS4JBZZlw2+CvqeH+Jh7VM=;
        h=From:To:Cc:Subject:Date:From;
        b=vQHAXhCExBN8f1ujtPmuFbIC4XdB68KqdMhHxXuJznQinysadE/B9I0K7nQv9yZSz
         LPJlcc0+8Qr+aqNV42vjHeJGmXSn0f7VwjQZTVMvMv9Rwv0k1h0GswVAgLz2TcAaPZ
         1mbpjuF00GqqlDhb9+WYUvF4pmUKEAtgndPOj5Gc=
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Geert Uytterhoeven <geert@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH 0/2] arm64: dts: renesas: Merge hdmi0_con
Date:   Wed, 24 Nov 2021 15:28:13 +0000
Message-Id: <20211124152815.3926961-1-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

These two board files have created a reference to the existing hdmi0_con
node to update the endpoint.

I found this extra level of indirection confusing while parsing the
file, particularly as the node is in the same file.

Remove the reference node, and update the endpoint directly.

Kieran Bingham (2):
  arm64: dts: renesas: ulcb: Merge hdmi0_con
  arm64: dts: renesas: salvator-common: Merge hdmi0_con

 arch/arm64/boot/dts/renesas/salvator-common.dtsi | 5 +----
 arch/arm64/boot/dts/renesas/ulcb.dtsi            | 5 +----
 2 files changed, 2 insertions(+), 8 deletions(-)

-- 
2.30.2

