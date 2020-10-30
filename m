Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70ECC2A000F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Oct 2020 09:33:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726003AbgJ3Icz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 30 Oct 2020 04:32:55 -0400
Received: from smtp1.de.adit-jv.com ([93.241.18.167]:56367 "EHLO
        smtp1.de.adit-jv.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725790AbgJ3Icy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 30 Oct 2020 04:32:54 -0400
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
        by smtp1.de.adit-jv.com (Postfix) with ESMTP id 7DA163C0582;
        Fri, 30 Oct 2020 09:32:11 +0100 (CET)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
        by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id dBtUJhKgMeXU; Fri, 30 Oct 2020 09:32:05 +0100 (CET)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by smtp1.de.adit-jv.com (Postfix) with ESMTPS id 26EFF3C0594;
        Fri, 30 Oct 2020 09:31:26 +0100 (CET)
Received: from lxhi-065.adit-jv.com (10.72.94.31) by HI2EXCH01.adit-jv.com
 (10.72.92.24) with Microsoft SMTP Server (TLS) id 14.3.487.0; Fri, 30 Oct
 2020 09:31:25 +0100
From:   Eugeniu Rosca <erosca@de.adit-jv.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        <linux-renesas-soc@vger.kernel.org>
CC:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Steffen Pengel <spengel@de.adit-jv.com>,
        Eugeniu Rosca <roscaeugeniu@gmail.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>
Subject: [PATCH v2 0/3] Add R-Car M3-W+ ULCB with Kingfisher
Date:   Fri, 30 Oct 2020 09:30:48 +0100
Message-ID: <20201030083051.18752-1-erosca@de.adit-jv.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.72.94.31]
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add initial M3-ES3.0-ULCB-KF support.

v2: Add "Reviewed-by". Update renesas.yaml.
v1:
 - https://lore.kernel.org/linux-renesas-soc/20201029133741.25721-1-erosca@de.adit-jv.com/
 - https://lore.kernel.org/linux-renesas-soc/20201029133741.25721-2-erosca@de.adit-jv.com/

Eugeniu Rosca (3):
  arm64: dts: renesas: r8a77961: Add CAN{0,1} placeholder nodes
  arm64: dts: renesas: r8a77961: ulcb-kf: Initial device tree
  dt-bindings: arm: renesas: Add R-Car M3-W+ ULCB with Kingfisher

 Documentation/devicetree/bindings/arm/renesas.yaml |  1 +
 arch/arm64/boot/dts/renesas/Makefile               |  1 +
 arch/arm64/boot/dts/renesas/r8a77961-ulcb-kf.dts   | 15 ++++++++++++++
 arch/arm64/boot/dts/renesas/r8a77961.dtsi          | 10 ++++++++
 4 files changed, 27 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a77961-ulcb-kf.dts

-- 
2.29.0

