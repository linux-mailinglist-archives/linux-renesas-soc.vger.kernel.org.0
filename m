Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 009C157C86E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Jul 2022 12:01:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233005AbiGUKA7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 21 Jul 2022 06:00:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233029AbiGUKA3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Jul 2022 06:00:29 -0400
Received: from ssl.serverraum.org (ssl.serverraum.org [IPv6:2a01:4f8:151:8464::1:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 355D395A8
        for <linux-renesas-soc@vger.kernel.org>; Thu, 21 Jul 2022 03:00:28 -0700 (PDT)
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ssl.serverraum.org (Postfix) with ESMTPSA id 900CE22248;
        Thu, 21 Jul 2022 12:00:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
        t=1658397626;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=v2W2nucsH56c4FQn1IU47owA/fk5A66k5whSo+WIdAY=;
        b=slgCREFYcphjLyvOjX8eVrfmuGLiN6G7rE0oz0OJbd7Zw2JikGjiahDnH5964u1QhMU3TQ
        EzeMVKc9GUmdv57TREX8SLj14bVxKJ+WC87V8jROkZqr6j9YYX8bPy/ZWaJJwMX02ovf4u
        ntd31h3jagxxEpTWqtrw83khUKb3hQA=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 21 Jul 2022 12:00:25 +0200
From:   Michael Walle <michael@walle.cc>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Tudor.Ambarus@microchip.com, p.yadav@ti.com,
        miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
        Nicolas.Ferre@microchip.com, alexandre.belloni@bootlin.com,
        Claudiu.Beznea@microchip.com, linux-mtd@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, geert+renesas@glider.be,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        biju.das@bp.renesas.com,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 2/2] mtd: spi-nor: Add Renesas AT25QL128A serial nor
 flash
In-Reply-To: <OS0PR01MB59221FE257A0E06F225AB6B686919@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220715105716.2415068-1-biju.das.jz@bp.renesas.com>
 <20220715105716.2415068-3-biju.das.jz@bp.renesas.com>
 <7aa7de93-23f0-c94a-bfc3-e79321cdc1f9@microchip.com>
 <OS0PR01MB5922F0D52EACD4686768117686919@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <785e50c4-3c8c-a1a6-de60-4587aef820a8@microchip.com>
 <OS0PR01MB59221FE257A0E06F225AB6B686919@OS0PR01MB5922.jpnprd01.prod.outlook.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <dbf2931656904b9b5e18702f27a11b1a@walle.cc>
X-Sender: michael@walle.cc
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Am 2022-07-21 11:46, schrieb Biju Das:

>> > root@smarc-rzg2ul:~#

nice a smarc board :)


>> >
>> > root@smarc-rzg2ul:~# cat
>> > /sys/devices/platform/soc/10060000.spi/rpc-if-spi/spi_master/spi1/spi1
>> > .0/spi-nor/manufacturer
>> > cat:
>> > /sys/devices/platform/soc/10060000.spi/rpc-if-spi/spi_master/spi1/spi1
>> > .0/spi-nor/manufacturer: No such file or directory
>> >
>> > This result is not matching atmel-> cat:
>> > /sys/devices/platform/soc/10060000.spi/rpc-if-spi/spi_master/spi1/spi1
>> > .0/spi-nor/manufacturer: No such file or directory
>> 
>> here we could introduce a generic name as well.
> 
> OK.
> 
> Michael: Do you have any plan to add generic name for manufacturer
> as completeness?

Why would we need that one? There is no manufacturer. So I don't
see why we should add a fake one. The partname is debatable, too.
IMHO if we really want to get rid of the "dummy" tables in the kernel,
the userspace (mtdutils for example) could parse the jedec id and
sfdp and find the manufacturer and partnumer. But TBH, I don't know
if that is really an important information.

Implementation wise, right now, it's quite a hack how the
manufacturer is set. It gets already set early in
spi_nor_match_name(), while the actual flash info will get set
later in the call chain.

-michael
