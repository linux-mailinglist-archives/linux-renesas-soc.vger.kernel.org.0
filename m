Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A6FE57C7E5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Jul 2022 11:43:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232582AbiGUJnM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 21 Jul 2022 05:43:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232529AbiGUJnL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Jul 2022 05:43:11 -0400
Received: from ssl.serverraum.org (ssl.serverraum.org [IPv6:2a01:4f8:151:8464::1:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BB6580F6C
        for <linux-renesas-soc@vger.kernel.org>; Thu, 21 Jul 2022 02:43:10 -0700 (PDT)
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ssl.serverraum.org (Postfix) with ESMTPSA id EC82122175;
        Thu, 21 Jul 2022 11:43:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
        t=1658396586;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=mNJ/p8jstTxRfpudoG/DkUzSGNs3GG/SV5IaUBqPKco=;
        b=oChbOp8IDGLYp+le+G8yPLjmys+doZglgTbQSSXwBYM3+slfcXilJbDVwSB6gSQ4jg2qbF
        vM1l9Bp3Z5oTq4AaKmZUxvNbbHbPpZQ+MTyGkLqP781GQ8xayg+ijNBgchJsfPYZen9Amq
        sMH9sFmjL8evbIGuem1J+tVt+GAykKM=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 21 Jul 2022 11:43:04 +0200
From:   Michael Walle <michael@walle.cc>
To:     Tudor.Ambarus@microchip.com
Cc:     biju.das.jz@bp.renesas.com, p.yadav@ti.com,
        miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
        Nicolas.Ferre@microchip.com, alexandre.belloni@bootlin.com,
        Claudiu.Beznea@microchip.com, linux-mtd@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, geert+renesas@glider.be,
        Chris.Paterson2@renesas.com, biju.das@bp.renesas.com,
        prabhakar.mahadev-lad.rj@bp.renesas.com,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 2/2] mtd: spi-nor: Add Renesas AT25QL128A serial nor
 flash
In-Reply-To: <785e50c4-3c8c-a1a6-de60-4587aef820a8@microchip.com>
References: <20220715105716.2415068-1-biju.das.jz@bp.renesas.com>
 <20220715105716.2415068-3-biju.das.jz@bp.renesas.com>
 <7aa7de93-23f0-c94a-bfc3-e79321cdc1f9@microchip.com>
 <OS0PR01MB5922F0D52EACD4686768117686919@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <785e50c4-3c8c-a1a6-de60-4587aef820a8@microchip.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <2335e23aff8406e959d1d14cecb2d6a1@walle.cc>
X-Sender: michael@walle.cc
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Am 2022-07-21 11:39, schrieb Tudor.Ambarus@microchip.com:
>> cat 
>> /sys/devices/platform/soc/10060000.spi/rpc-if-spi/spi_master/spi1/spi1.0/spi-nor/jedec_id
>> 1f42181f4218
>> 
>> This result is not matching 1f4218->1f42181f4218
> 
> here it looks like the ID is sent twice.

That is expected. We don't know how long the id is so
SPI_NOR_MAX_ID_LEN bytes are read for now.
Some flashes will send additional information, some don't and
just repeat the pattern.

It's up to the userspace to interpret that.

-michael
