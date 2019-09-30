Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B5ECBC2026
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Sep 2019 13:54:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729337AbfI3LwZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 30 Sep 2019 07:52:25 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:39682 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726314AbfI3LwZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 30 Sep 2019 07:52:25 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id CF80525AD50;
        Mon, 30 Sep 2019 21:52:22 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id BF28B9413EE; Mon, 30 Sep 2019 13:52:20 +0200 (CEST)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Andy Gross <agross@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Kaneko <ykaneko0929@gmail.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH v4 0/3] dt-bindings: bus: simple-pm-bus, renesas-bsc: convert bindings to json-schema
Date:   Mon, 30 Sep 2019 13:52:02 +0200
Message-Id: <20190930115205.25204-1-horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


Convert Simple Power-Managed Bus and Convert Renesas Bus State Controller
(BSC) bindings documentation to json-schema.

Based on v5.3.

Changes since v3 noted in individual patches.

Simon Horman (3):
  dt-bindings: bus: simple-pm-bus: convert bindings to json-schema
  dt-bindings: bus: renesas-bsc: convert bindings to json-schema
  arm64: dts: qcom: msm8996: Update simple-pm-bus node name to 'bus'

 .../devicetree/bindings/bus/renesas,bsc.txt        | 46 -------------
 .../devicetree/bindings/bus/renesas,bsc.yaml       | 60 +++++++++++++++++
 .../devicetree/bindings/bus/simple-pm-bus.txt      | 44 -------------
 .../devicetree/bindings/bus/simple-pm-bus.yaml     | 75 ++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi       |  2 +-
 arch/arm64/boot/dts/qcom/msm8996.dtsi              |  2 +-
 6 files changed, 137 insertions(+), 92 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/bus/renesas,bsc.txt
 create mode 100644 Documentation/devicetree/bindings/bus/renesas,bsc.yaml
 delete mode 100644 Documentation/devicetree/bindings/bus/simple-pm-bus.txt
 create mode 100644 Documentation/devicetree/bindings/bus/simple-pm-bus.yaml

-- 
2.11.0

