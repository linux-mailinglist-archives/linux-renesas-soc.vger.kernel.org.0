Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CCF05A18FD
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Aug 2019 13:38:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727161AbfH2Lin (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 29 Aug 2019 07:38:43 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:5115 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727176AbfH2Lin (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 29 Aug 2019 07:38:43 -0400
X-IronPort-AV: E=Sophos;i="5.64,442,1559487600"; 
   d="scan'208";a="25249611"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 29 Aug 2019 20:38:40 +0900
Received: from fabrizio-dev.ree.adwin.renesas.com (unknown [10.226.36.196])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 2C7A94002C30;
        Thu, 29 Aug 2019 20:38:35 +0900 (JST)
From:   Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        xu_shunji@hoperun.com, ebiharaml@si-linux.co.jp
Subject: [PATCH v2 0/2] Add LVDS panel support to HiHope RZ/G2M
Date:   Thu, 29 Aug 2019 12:38:31 +0100
Message-Id: <1567078713-29361-1-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Dear All,

the HiHope RZ/G2M is advertised as supporting panel idk-1110wr from
Advantech, but the panel doesn't come with the board, it has to purchased
separatey, therefore this series adds panel support to a new DT.

v1->v2
* fixed a space according to Geert's feedback.

Thanks,
Fab

Fabrizio Castro (2):
  dt-bindings: display: Add idk-1110wr binding
  arm64: dts: renesas: Add HiHope RZ/G2M board with idk-1110wr display

 .../display/panel/advantech,idk-1110wr.yaml        | 69 +++++++++++++++++
 arch/arm64/boot/dts/renesas/Makefile               |  1 +
 .../r8a774a1-hihope-rzg2m-ex-idk-1110wr.dts        | 86 ++++++++++++++++++++++
 3 files changed, 156 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/advantech,idk-1110wr.yaml
 create mode 100644 arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-ex-idk-1110wr.dts

-- 
2.7.4

