Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F36F6525143
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 May 2022 17:27:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355945AbiELP1k (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 12 May 2022 11:27:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355939AbiELP1f (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 May 2022 11:27:35 -0400
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A8B66D38C;
        Thu, 12 May 2022 08:27:33 -0700 (PDT)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 4B979FF80A;
        Thu, 12 May 2022 15:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1652369252;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=0jukDAbwzYSWdiOPQ0S4TYjlu0C4+K1D88a+eyX0k8k=;
        b=TvEpQLCeK9xIbPmHfjanIb5faJSs8CvJ1xFKcZAH2RgxqWqIH3/tvMskKK59xJuC12S/i4
        SfZbkxqJ2jsmnSZxwmUmHDtfACmvstEKib9+JgdzMkVZMKdbXTK9HA+oWd4XhhijGhRsws
        uF3bfXJ/D9nYdkAhFCC+uBNLm43yMuMKMtU+PdWFLQIqDIbzXLSbJ/b0NlNqjgXrjCgNCr
        1SwAYC280rolWSqVS69XnYco3cxAO3s7cDnrMSgG6XCnD5mSXdfA4ONWqScF6MoNRUl+/6
        WpMGHQj0iazYQaDJ/N5L4XAAQl3K75Ymb+mLW2zjXaRu+PxlBl6RETNCGU5aFQ==
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tudor Ambarus <Tudor.Ambarus@microchip.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Michael Walle <michael@walle.cc>, linux-mtd@lists.infradead.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Gareth Williams <gareth.williams.jx@renesas.com>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        devicetree@vger.kernel.org,
        Milan Stevanovic <milan.stevanovic@se.com>,
        Jimmy Lalande <jimmy.lalande@se.com>,
        Pascal Eberhard <pascal.eberhard@se.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Herve Codina <herve.codina@bootlin.com>,
        Clement Leger <clement.leger@bootlin.com>
Subject: Re: [PATCH v2 2/2] mtd: rawnand: renesas: Use runtime PM instead of the raw clock API
Date:   Thu, 12 May 2022 17:27:29 +0200
Message-Id: <20220512152729.244940-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220509154943.25422-3-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'7363d3efa9da88ba9ddf4fed660d72499e86dc26'
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, 2022-05-09 at 15:49:43 UTC, Miquel Raynal wrote:
> This NAND controller is part of a well defined power domain handled by
> the runtime PM core. Let's keep the harmony with the other RZ/N1 drivers
> and exclusively use the runtime PM API to enable/disable the clocks.
> 
> We still need to retrieve the external clock rate in order to derive the
> NAND timings, but that is not a big deal, we can still do that in the
> probe and just save this value to reuse it later.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next.

Miquel
