Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BB0C4AF706
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Feb 2022 17:42:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237377AbiBIQlZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 9 Feb 2022 11:41:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237389AbiBIQlU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Feb 2022 11:41:20 -0500
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C1D5C05CB82;
        Wed,  9 Feb 2022 08:41:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1644424696;
    s=strato-dkim-0002; d=fpond.eu;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=GWoW+C14An674JYgH1kVI2DMXd0W/O9lGw79zuetDYY=;
    b=jbDOrriwEGEuai39q/GjMKSBj/3M+zTQTKyMexAp4JH3DfVQH7HZilCdVPk99yWC3y
    gaffGex0k1uwW0IPLL+U+jG1/5lN2RZLeoNTAevVfw3xq0dgiVljaydU53VH5/uZ5nsG
    mRy92TlQwQot2qgc02h3pzWhzDfu2ZIBDEIIFW8pneZerZLq7HyelUqFJtfy/EynPW+E
    PCjQLn/nOGjY4Q8jh1CT7VLTubBFxdIo96m4khgtjqOAjW4oMqxvf+u9R9XmL8prX64r
    rJfXarNw2NS/fW/oq4luix27hXSdv8XHklKbZftkmyJq9WVrwXGVB7vPD8n4YAkA//5H
    TJEg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73dmm4I5W0/AvA67Ot4fvR82dfdzLc5sE="
X-RZG-CLASS-ID: mo00
Received: from gummo.fritz.box
    by smtp.strato.de (RZmta 47.39.0 DYNA|AUTH)
    with ESMTPSA id ufcb0fy19GcE7bt
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Wed, 9 Feb 2022 17:38:14 +0100 (CET)
From:   Ulrich Hecht <uli+renesas@fpond.eu>
To:     linux-renesas-soc@vger.kernel.org
Cc:     netdev@vger.kernel.org, davem@davemloft.net,
        linux-can@vger.kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com,
        biju.das.jz@bp.renesas.com, wsa@kernel.org,
        yoshihiro.shimoda.uh@renesas.com, wg@grandegger.com,
        mkl@pengutronix.de, kuba@kernel.org, mailhol.vincent@wanadoo.fr,
        socketcan@hartkopp.net, geert@linux-m68k.org,
        kieran.bingham@ideasonboard.com,
        Ulrich Hecht <uli+renesas@fpond.eu>
Subject: [PATCH v3 0/4] can: rcar_canfd: Add support for V3U flavor
Date:   Wed,  9 Feb 2022 17:38:02 +0100
Message-Id: <20220209163806.18618-1-uli+renesas@fpond.eu>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi!

This adds CANFD support for V3U (R8A779A0) SoCs. The V3U's IP supports up
to eight channels and has some other minor differences to the Gen3 variety:

- changes to some register offsets and layouts
- absence of "classic CAN" registers, both modes are handled through the
  CANFD register set

This patch set tries to accommodate these changes in a minimally intrusive
way.

This revision tries to address all issues raised by reviewers, and drops
the clock patch that has since been picked up; see below for details.
Thanks to Vincent, Marc and Geert for their reviews and suggestions.

It has been successfully tested remotely on a V3U Falcon board, but only
with channels 0 and 1. We were not able to get higher channels to work in
both directions yet. It is not currently clear if this is an issue with the
driver, the board or the silicon, but the BSP vendor driver only works with
channels 0 and 1 as well, so my bet is on one of the latter. For this
reason, this series only enables known-working channels 0 and 1 on Falcon.

CU
Uli


Changes since v2:
- dropped upstreamed clock patch
- replaced bracket/ternary maze with inline functions
- improved indentation to better reflect the logic
- removed redundant CAN mode check
- replaced strcpy() with initializer
- minor refactoring
- add Reviewed-Bys

Changes since v1:
- clk: added missing CANFD module clock
- driver: fixed tests for RZ/G2L so they won't break V3U
- driver: simplified two macros
- DT: enabled devices 0 and 1 on Falcon board
- DT: changed assigned-clock-rates to 80000000
- DT: added interrupt names


Ulrich Hecht (4):
  can: rcar_canfd: Add support for r8a779a0 SoC
  arm64: dts: renesas: r8a779a0: Add CANFD device node
  arm64: dts: renesas: r8a779a0-falcon: enable CANFD 0 and 1
  dt-bindings: can: renesas,rcar-canfd: Document r8a779a0 support

 .../bindings/net/can/renesas,rcar-canfd.yaml  |   2 +
 .../boot/dts/renesas/r8a779a0-falcon.dts      |  24 ++
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi     |  56 +++++
 drivers/net/can/rcar/rcar_canfd.c             | 219 ++++++++++++------
 4 files changed, 228 insertions(+), 73 deletions(-)

-- 
2.20.1

