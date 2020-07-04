Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 951F221473E
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  4 Jul 2020 18:08:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726703AbgGDQIb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 4 Jul 2020 12:08:31 -0400
Received: from vsp-unauthed02.binero.net ([195.74.38.227]:12533 "EHLO
        vsp-unauthed02.binero.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726897AbgGDQIa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 4 Jul 2020 12:08:30 -0400
X-Halon-ID: 926b1813-be10-11ea-933e-005056917a89
Authorized-sender: niklas@soderlund.pp.se
Received: from bismarck.berto.se (p4fca2eca.dip0.t-ipconnect.de [79.202.46.202])
        by bin-vsp-out-01.atm.binero.net (Halon) with ESMTPA
        id 926b1813-be10-11ea-933e-005056917a89;
        Sat, 04 Jul 2020 18:08:28 +0200 (CEST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Lars-Peter Clausen <lars@metafoo.de>,
        Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 0/2] dt-bindings: adv7180: Convert bindings to json-schema
Date:   Sat,  4 Jul 2020 18:06:42 +0200
Message-Id: <20200704160644.3040636-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello Lars,

This series converts the ADV7180 bindings to YAML and lists the new file 
under MAINTAINERS. I have used the schema to validate the usage of the 
bindings and found some issues with some Renesas boards [1].

1. [PATCH 0/2] ARM: dts: renesas: Cleanup ADV7180 bindings

Niklas Söderlund (2):
  dt-bindings: adv7180: Convert bindings to json-schema
  MAINTAINERS: Add ADV7180 bindings documentation

 .../devicetree/bindings/media/i2c/adv7180.txt |  49 -----
 .../bindings/media/i2c/adv7180.yaml           | 184 ++++++++++++++++++
 MAINTAINERS                                   |   1 +
 3 files changed, 185 insertions(+), 49 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/i2c/adv7180.txt
 create mode 100644 Documentation/devicetree/bindings/media/i2c/adv7180.yaml

-- 
2.27.0

