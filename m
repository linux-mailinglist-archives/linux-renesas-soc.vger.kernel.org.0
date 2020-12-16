Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB90A2DC4E4
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Dec 2020 18:01:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726891AbgLPRBJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 16 Dec 2020 12:01:09 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:42612 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726745AbgLPRBJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Dec 2020 12:01:09 -0500
Received: from localhost.localdomain (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8B3E32CF;
        Wed, 16 Dec 2020 18:00:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1608138026;
        bh=yZL0DyWJOFKmp+oJ58wF7wCJwbgK0S/M83eTOfB2I3o=;
        h=From:To:Cc:Subject:Date:From;
        b=KBGpo54OLS6NWnXZj1IEmpYkTPKvgdnz2yC4RT25k+1i+1iqF96RQBPpop0FutDsI
         IPPkZJoS0UBYsiiafn4vyQeXoIEwnKb5DibQqGavI2EMJTSPowuAl9fnHOOwFpzgO9
         zT96qo1RJJyl5V0/FfsU6xIAXxHMfFHYEwv4mClc=
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert@glider.be>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Rob Herring <robh+dt@kernel.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH 0/3] arm64: dts: renesas: r8a779a0: Add FCP and VSP support
Date:   Wed, 16 Dec 2020 17:00:15 +0000
Message-Id: <20201216170018.861710-1-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Provide DT nodes for the FCPVD, and VSP on the V3U.

Kieran Bingham (3):
  arm64: dts: renesas: r8a779a0: Add FCPVD support
  arm64: dts: renesas: r8a779a0: Add VSPD support
  arm64: dts: renesas: r8a779a0: Add VSPX support

 arch/arm64/boot/dts/renesas/r8a779a0.dtsi | 74 +++++++++++++++++++++++
 1 file changed, 74 insertions(+)

-- 
2.25.1

