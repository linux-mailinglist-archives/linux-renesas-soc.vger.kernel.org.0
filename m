Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3DB45516F15
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 May 2022 13:49:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350655AbiEBLxH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 2 May 2022 07:53:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1384750AbiEBLxH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 2 May 2022 07:53:07 -0400
Received: from ssl.serverraum.org (ssl.serverraum.org [176.9.125.105])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BFE917051
        for <linux-renesas-soc@vger.kernel.org>; Mon,  2 May 2022 04:49:38 -0700 (PDT)
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ssl.serverraum.org (Postfix) with ESMTPSA id 86BC3221D4;
        Mon,  2 May 2022 13:49:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
        t=1651492177;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Ur3rUNf/yoe4JhaC+IZGMN+I/fhpryB36fehxJDdRUI=;
        b=KeoN5UY1TpDVl7T8/Z1miaHUQsxGs+/mOAcde+TCdCxH3N2nkMOZoTG/ICrBv/f1cWU0Ld
        R8BRS1u9Ef9ZMBJXAVYMnP+E6Gbu3DareURlaQDAGvt5Y+eejpURdhQ4tY6UxKT6cUN2Ut
        rTC8htdVYSkZej1MGFHJFY1I7HjG4Ss=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 02 May 2022 13:49:36 +0200
From:   Michael Walle <michael@walle.cc>
To:     biju.das.jz@bp.renesas.com
Cc:     Chris.Paterson2@renesas.com, biju.das@bp.renesas.com,
        geert+renesas@glider.be, linux-mtd@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, miquel.raynal@bootlin.com,
        p.yadav@ti.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
        richard@nod.at, tudor.ambarus@microchip.com, vigneshr@ti.com
Subject: Re: [RFC] mtd: spi-nor: Add Renesas AT25QL128A serial nor flash
In-Reply-To: <20220502112934.2433516-1-michael@walle.cc>
References: <20220501185512.51158-1-biju.das.jz@bp.renesas.com>
 <20220502112934.2433516-1-michael@walle.cc>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <b6bbfbcaf6b278112d1f713849460089@walle.cc>
X-Sender: michael@walle.cc
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Am 2022-05-02 13:29, schrieb Michael Walle:
>>  drivers/mtd/spi-nor/Makefile  |  1 +
>>  drivers/mtd/spi-nor/core.c    |  1 +
>>  drivers/mtd/spi-nor/core.h    |  1 +
>>  drivers/mtd/spi-nor/renesas.c | 57 
>> +++++++++++++++++++++++++++++++++++
> 
> Please put the flash in atmel.c. There are all the Atmel/Adesto/now 
> Renesas
> flashes.
> 
>> +static const struct flash_info renesas_nor_parts[] = {
>> +	{ "at25ql128a", INFO(0x1f4218, 0, 64 * 1024, 256)
>> +		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_QUAD_READ) },
>> +};
> 
> I suppose this flash supports SFDP. Therefore,
> 	{ "at25ql128a", PARSE_SFDP },

The id is missing. Sorry. Seems like we need a new macro.

#define SNOR_ID3(_jedec_id) \
     .id = { \
         ((_jedec_id) >> 16) & 0xff, \
          ((_jedec_id) >> 8) & 0xff, \
           (_jedec_id) & 0xff, \
     } \
     .id_len = 3,

Then it would be
	{ "at25ql128a", SNOR_ID3(0x1f4218) PARSE_SFDP },

Now we'll get bitten by that missing comma (or the additional
comma in the defines).. I'd love to see that one removed, so
we can have the usual declarations:
	{ "at25ql128a", SNOR_ID3(0x1f4218), PARSE_SFDP },

Also it might make sense to have the PARSE_SFDP in the
SNOR_ID3() macro, because without SFDP, that macro cannot
be used. Tudor, Pratyush, what do you think about:

#define SNOR_ID3(_jedec_id) \
     .id = { \
         ((_jedec_id) >> 16) & 0xff, \
          ((_jedec_id) >> 8) & 0xff, \
           (_jedec_id) & 0xff, \
     } \
     .id_len = 3, \
     .parse_sfdp = true


-michael
