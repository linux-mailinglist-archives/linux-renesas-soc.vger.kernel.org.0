Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D25BB87066
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 Aug 2019 06:07:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726590AbfHIEHF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 9 Aug 2019 00:07:05 -0400
Received: from bin-mail-out-06.binero.net ([195.74.38.229]:8099 "EHLO
        bin-mail-out-06.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726204AbfHIEHF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 9 Aug 2019 00:07:05 -0400
X-Halon-ID: 0e4827b9-ba5b-11e9-bdc3-005056917a89
Authorized-sender: niklas@soderlund.pp.se
Received: from bismarck.berto.se (unknown [145.14.112.32])
        by bin-vsp-out-01.atm.binero.net (Halon) with ESMTPA
        id 0e4827b9-ba5b-11e9-bdc3-005056917a89;
        Fri, 09 Aug 2019 06:06:55 +0200 (CEST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 0/2] max9286: Add MAX9286 driver with single camera support
Date:   Fri,  9 Aug 2019 06:05:56 +0200
Message-Id: <20190809040558.10698-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi,

This series adds a driver for the Maxim MAX9286 Integrated Quad GMSL 
Deserializer.

This submission is the sum of work done by Jacopo, Kieran, Laurent and 
me over the last two (?) years. Our initial submission supported usage 
of up to 4 GMSL cameras attached to one MAX9286. That submission made 
use of out-of-tree patches to describe how multiple video streams where 
transported over a single CSI-2 bus. However these out-of-tree patches 
are still debated and not much progress have happened lately. 

This submission removes the multiple camera support and limits the 
max9286 to only use one camera and removing the dependency on the 
debated patches. Our hope is to have this driver merged with single 
camera support and extend it over time to add multiple camera support as 
v4l2 evolves.

This series is based on top of the latest media tree and have no out of 
tree dependencies.

Laurent Pinchart (1):
  dt-bindings: media: i2c: Add bindings for Maxim Integrated MAX9286

Niklas Söderlund (1):
  max9286: Add MAX9286 driver

 .../bindings/media/i2c/maxim,max9286.txt      |  182 +++
 MAINTAINERS                                   |   10 +
 drivers/media/i2c/Kconfig                     |   11 +
 drivers/media/i2c/Makefile                    |    1 +
 drivers/media/i2c/max9286.c                   | 1081 +++++++++++++++++
 5 files changed, 1285 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/maxim,max9286.txt
 create mode 100644 drivers/media/i2c/max9286.c

-- 
2.22.0

