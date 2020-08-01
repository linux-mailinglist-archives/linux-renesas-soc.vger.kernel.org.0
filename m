Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E613323534B
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  1 Aug 2020 18:18:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727850AbgHAQSu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 1 Aug 2020 12:18:50 -0400
Received: from bin-mail-out-05.binero.net ([195.74.38.228]:11499 "EHLO
        bin-mail-out-05.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727844AbgHAQSu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 1 Aug 2020 12:18:50 -0400
X-Halon-ID: ab0d13bd-d412-11ea-933e-005056917a89
Authorized-sender: niklas@soderlund.pp.se
Received: from bismarck.berto.se (p4fca2eca.dip0.t-ipconnect.de [79.202.46.202])
        by bin-vsp-out-01.atm.binero.net (Halon) with ESMTPA
        id ab0d13bd-d412-11ea-933e-005056917a89;
        Sat, 01 Aug 2020 18:18:47 +0200 (CEST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v3 0/3] dt-bindings: adv7604: Convert bindings to json-schema
Date:   Sat,  1 Aug 2020 18:18:22 +0200
Message-Id: <20200801161825.96837-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Hans,

This series converts the ADV7604 bindings to YAML and lists the new file
under MAINTAINERS. I have used the schema to validate the usage of the
bindings and only found one issue that is fixed in [1].

1. [PATCH] ARM: dts: gose: Fix ports node name for adv7612

Niklas Söderlund (3):
  dt-bindings: adv7604: Fix documentation for hpd-gpios
  dt-bindings: adv7604: Convert bindings to json-schema
  MAINTAINERS: Add ADV7604 bindings documentation

 .../devicetree/bindings/media/i2c/adv7604.txt |  88 ---------
 .../bindings/media/i2c/adv7604.yaml           | 178 ++++++++++++++++++
 MAINTAINERS                                   |   1 +
 3 files changed, 179 insertions(+), 88 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/i2c/adv7604.txt
 create mode 100644 Documentation/devicetree/bindings/media/i2c/adv7604.yaml

-- 
2.28.0

