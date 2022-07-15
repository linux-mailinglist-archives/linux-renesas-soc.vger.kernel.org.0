Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CBF1F5760F1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 Jul 2022 13:55:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233039AbiGOLzI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 15 Jul 2022 07:55:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232868AbiGOLzH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 Jul 2022 07:55:07 -0400
Received: from ssl.serverraum.org (ssl.serverraum.org [176.9.125.105])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FF418AB20
        for <linux-renesas-soc@vger.kernel.org>; Fri, 15 Jul 2022 04:55:06 -0700 (PDT)
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ssl.serverraum.org (Postfix) with ESMTPSA id DDB2022175;
        Fri, 15 Jul 2022 13:55:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
        t=1657886104;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=fRb53X/3H9pTGrZR3Wr9D3CxPqoLp7Qch++gntMyFrE=;
        b=ZKRetVKvef9+IXF2xQDMQj8Cc7Ws5KJtlVlXzApqRHnp1lf+Ll6jW2WAD1livRVE9boXeJ
        RdP3/o7MsDGCC+csmToSecv3PTEvOwAS9SFUD1x4L/HKAwIifR2BdCnlZ/7dAlG9wtkC1m
        sUCa0xYbShoMiA74fyPNuAChmY1Pc1I=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 15 Jul 2022 13:55:03 +0200
From:   Michael Walle <michael@walle.cc>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Tudor Ambarus <tudor.ambarus@microchip.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        linux-mtd@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 2/2] mtd: spi-nor: Add Renesas AT25QL128A serial nor
 flash
In-Reply-To: <20220715105716.2415068-3-biju.das.jz@bp.renesas.com>
References: <20220715105716.2415068-1-biju.das.jz@bp.renesas.com>
 <20220715105716.2415068-3-biju.das.jz@bp.renesas.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <fed53ac13bea15d9d9dbeca40983c823@walle.cc>
X-Sender: michael@walle.cc
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Am 2022-07-15 12:57, schrieb Biju Das:
> Add support for Renesas AT25QL128A serial nor flash.
> Details of flash chip can be found here [1]
> 
> [1] 
> https://www.dialog-semiconductor.com/sites/default/files/2022-04/DS-AT25QL128A-129F-022022.pdf
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks!

Reviewed-by: Michael Walle <michael@walle.cc>
