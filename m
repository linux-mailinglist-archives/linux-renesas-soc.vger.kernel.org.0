Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BAB0A516FE5
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 May 2022 14:57:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349513AbiEBNAe (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 2 May 2022 09:00:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234640AbiEBNAd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 2 May 2022 09:00:33 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2111.outbound.protection.outlook.com [40.107.113.111])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB2AC15A23
        for <linux-renesas-soc@vger.kernel.org>; Mon,  2 May 2022 05:57:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QOqD3IkNCYW5Uj/M94A+TCsRebglADID+c//ZCIfmnzR8ffrYCVAiGgYqn/WD4zrA0zsbKFVvTofZvzeMsoxydfK/RqoCpdtujAi/Xq6gDGsx55ReDgD/Y8em/BQaR6ZeZnB9qOj+/lMcgcJLUZy6TF4kxDPu6WD5r95whYRMbE4b4dBqymR7rV+qJA5HnzUaOjH6ddvlFM6xws26Kg3kdWIhUfRtJ10y4ojpGkc4piQqvVLNbrcvObow6/tYqM5/CbBslQqogGoThvv9OJBrwWHWBISmAVuxw+Rzbcqdt23CtrZ8LgbHwM63Z7knAaUWfCHB2BpDI3zNyiy9aoIHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9rEeu6CjdIXOGsq9Z23sXOHAxT1lmDgU/qlcdWUJcaM=;
 b=SgjXXRgz/O5hgENs5zTprQmaPkZ/a6DugBYQpKpJxbkSWVYLT82YCX2dAopap3hf0WTFdjtne3XnA4dv8nFCqMBaFT514AAciDYXyj/r0aI/2Lmql2GfLSKt/zrJMR8h1ZDarD44yPQVVy00qt0RKJzPD0c3fcT98vZF6JNV8spKfsSSjngtUaqwV79AP4XTIwx2/d0Djaya9tqCoT2Kfzm8btQcerHkrtO6XW6N5Due1Ij+0E0mqzhWG8tr0P63saVcrIoEItX7kmJio63OOjnMMPhS+EkHtO9Bpz00IoJaLpLer5yw1liE9+Bpl2Rh46grfXKVJ6pi0LZDgHX08g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9rEeu6CjdIXOGsq9Z23sXOHAxT1lmDgU/qlcdWUJcaM=;
 b=sVejkNh8f7hTHQuf5mSpw3t62afeTD1BEKHkXFK0xdFht8CVU72Qh2ExxwZ9kmUCM7xHmy7hmSqlWe/PzMTX+LCpLfokSudDvrsKTJlGuHGnJIe6v8rgv/KJicPlkdTZb64rS6dMHTL6PHea8lHhaAIFyt4G9l+i7SDok6OCxro=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TY2PR01MB2268.jpnprd01.prod.outlook.com (2603:1096:404:f::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Mon, 2 May
 2022 12:57:00 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::3e:970b:c238:f57]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::3e:970b:c238:f57%7]) with mapi id 15.20.5206.014; Mon, 2 May 2022
 12:57:00 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Michael Walle <michael@walle.cc>
CC:     Chris Paterson <Chris.Paterson2@renesas.com>,
        "biju.das@bp.renesas.com" <biju.das@bp.renesas.com>,
        "geert+renesas@glider.be" <geert+renesas@glider.be>,
        "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
        "p.yadav@ti.com" <p.yadav@ti.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "richard@nod.at" <richard@nod.at>,
        "tudor.ambarus@microchip.com" <tudor.ambarus@microchip.com>,
        "vigneshr@ti.com" <vigneshr@ti.com>
Subject: RE: [RFC] mtd: spi-nor: Add Renesas AT25QL128A serial nor flash
Thread-Topic: [RFC] mtd: spi-nor: Add Renesas AT25QL128A serial nor flash
Thread-Index: AQHYXY0CUmqyBNs4DUuPavP17i/aHa0LdLEAgAAXYIA=
Date:   Mon, 2 May 2022 12:57:00 +0000
Message-ID: <OS0PR01MB5922313B200156135FC439A686C19@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220501185512.51158-1-biju.das.jz@bp.renesas.com>
 <20220502112934.2433516-1-michael@walle.cc>
In-Reply-To: <20220502112934.2433516-1-michael@walle.cc>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2d1416b2-8242-4107-9c04-08da2c3b3f72
x-ms-traffictypediagnostic: TY2PR01MB2268:EE_
x-microsoft-antispam-prvs: <TY2PR01MB2268EC5162D18CF9C64C9D6F86C19@TY2PR01MB2268.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: I2/egyAP6Sm/eVqfaCfh6JIpMnvHlBZwLq6X7v6Jfyqco3sX6Qjvqm+J8HoyeM/QiQdLsR6eSE7T12dS9rFa7bKNiuqmVwQScDTZPkzc5ED2+oJu6iiZ7OIH6j5FHqylXQKd+lkRwu5MR9ffhUZ+EFD+GFcaMCuQi+yuuwVCbgn6Muo+08pPQHO9xyjALiyRRairF/X5dNKUOzPtfEsvFmeM2enxbzvxBr6wTzrLHqOLC51XlbBdc9mLso7eELtv6zu0UWHMwoALqFI9teTz9RYo/w/iHjSfNqCg1efzT8m63rMwVdPfkpiH0hfY45FAEGK5K8J1ciDZOIobDVz4pz+dcRQW3nj5SwgA1GY0YwdS88qZd1PgWDd2AbgWkovcpqvb2k1knbqPHz3KMOCDvC7yGwckBToqh5HVCRbe3C2jnSknjxs7oJ7q6saypv0rEPRthz92qC7/1abbICGEKw/QUdkiwzpqfXi7cr/N/IzYflffP7Yo21vSA62XpP2JHKRmXZA3o4lDPOk2V3/3r0MVvzJ+tinE29RmxRwWCN8eWJftqL1QIXSatjGLDR4FRZAQBx+LvsB2ixVMyAbiDW6xzaZZouU5CtmRqgmZqlyycNYiUt33N/ENdb8iG2igFcdmrlknElsxY16ioWPTRps5kV7mPhrg/MCuhOw0xX+VXyswqJvbevf8WOtkqzMdaiUYyMuh/9subH2yBpzKydl5rPFloiFvaY9smsDNSmvVngBND0NT2J5J/s/d+8PtxtmcyUjuBoP4aWiNDbmG4w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(4326008)(66946007)(76116006)(38070700005)(38100700002)(66556008)(122000001)(8676002)(64756008)(66446008)(66476007)(55016003)(8936002)(52536014)(54906003)(5660300002)(6916009)(2906002)(71200400001)(508600001)(86362001)(316002)(83380400001)(33656002)(186003)(7696005)(26005)(6506007)(9686003)(473944003)(357404004);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?gm/YLxOzt7iJTC0Wj9RXqFDisMaYNhUmKid7RibYngKqRno1Hmw/IQdvL5JX?=
 =?us-ascii?Q?/D6S+UujJx8rFu3G0XBSqrpv5fvYxSP2WmP8qpxxgOqQqDRnnXcn2bP0H8Nk?=
 =?us-ascii?Q?pTOhyqGXqnFUlAHN5Xmo0iMo6maSgO2zI3itM2zxTaqAUbpjxC2JQU20JFQ1?=
 =?us-ascii?Q?iXLyUXm88jrAY6BBJTEbuKGpxqobESCpXOW5UxcEAEY0gSvY4tSZTJf7NjbM?=
 =?us-ascii?Q?o3AjQEfIsBdKpUBzAnBhfj8mDh34DHwjQp5n8tT+ISAUcyJLoqt6UqYf470s?=
 =?us-ascii?Q?owMWSJSTDGydG8pVcQY5JIt/earC+6clEs4eFKm5qo19q9xAKMnv8toC8Mew?=
 =?us-ascii?Q?z3qC2OZAZ+2V/B4JybH4OWO2TbfrO6WQXHbO3NwIFqwO8ZBfpCcoythcj0DP?=
 =?us-ascii?Q?1qrcB7it9CXGdYQkE5HNvUfdfZ/EJar62/WdR/ayyrk8B2h+nix0VPhWSNKy?=
 =?us-ascii?Q?eTrIAYd9fO2hWEpVYQcIQ74WOfU9BlRJqXz0NPfFz+xOKvvYBxoOxDDz+lzm?=
 =?us-ascii?Q?uxDOad/EDcS1Io5ls0PQczaogDt958xYhg65T5QnnqXtOuNEy47G/sFBVLca?=
 =?us-ascii?Q?CrQCGvEHql97NDSSOBhGTg6Pp+JAsrdbCbq/P5okEhA++6KROTtsdrmG7GQQ?=
 =?us-ascii?Q?DdnWmyDWtECD1DUjckV1agQbKPTHd/kzb8wt7aodWIvpGRbd02ljI5ECCSeM?=
 =?us-ascii?Q?n3XE5WFtfP2OutxZ7kfv784Zz1Kpy2o4nFKjl6LaTJILgYynLZBHLGDKjl2X?=
 =?us-ascii?Q?OTNkX2uWtcZW6lhRlzD9Doyd0MuEG8p/gm7QkB8EwdO6kh/ALGmsqG99tkmA?=
 =?us-ascii?Q?RH4+PfFFonLGdEU7SLiMKuI+W/e8MHyyJfiD31e2KpVCIB1K8kqytrZSoe2z?=
 =?us-ascii?Q?oBhSchonshGiM+Uy3WFKw1/0C27VEy7N+5Q06ZruF8+QMafz4Tat1mgk6mF9?=
 =?us-ascii?Q?txH6aej53mliU3Tq1hsRmheOfV9MxQwWurAE+/2dERnxZVK6+cVdxmnJUiD6?=
 =?us-ascii?Q?1MstTlzi5Juoikvm+Gi1oXoAShxY+WXVigHht6IvHhKd93zAoYkBat4UIfyD?=
 =?us-ascii?Q?VrG58IshuBkL1DU4OdrEhmGR21kYU8AkMN5PuxVkf8TJNAB6Kr1lGU1SwLhm?=
 =?us-ascii?Q?RsjqdmnH4CVRXuCURclbIULyrYas1Kh9lDZWccH6lsmnQbGeFvse6x9InTPc?=
 =?us-ascii?Q?BULgCtwyhAyNL7bjhjFPM2sEHBTp0d35eJ9BaWQUnTj0iK76u0XnRmrWBv20?=
 =?us-ascii?Q?WdANbGCDLlTe4ESSAM7dEaZj1CIrhprfnZy+8OtZS6MTYW+BPsJEc+Cn8c2b?=
 =?us-ascii?Q?pU5iE/OVBfUdmDC7BIRBDNSyd0yRAOhqSoXJ7tsPv1W7Dd4YOhnEo5GblVO9?=
 =?us-ascii?Q?0JB9gaIjbssN5DnpjbF9347V2M2sU9hNRKY7aSEkfSQa9YHmcRMFHTaIdJL2?=
 =?us-ascii?Q?XRrOA77LICJL117A/CYzskrUKHqJyBC05mnQg2iedLXaXf42HpvSmj1JhWZl?=
 =?us-ascii?Q?Lg9o50n2CqiRmOYLsFIzvaHSMfPZumgH+YbrPZ+xDiCZt+hgYl4D6PmwWVPT?=
 =?us-ascii?Q?0X6ZdW7Pyhv+CYil0hPyv4oS9jZkjoNDSMsRgh7S8lQE9uMalMv9W8q/pUOc?=
 =?us-ascii?Q?GQ5fNf3k6oYnaQc3Ca1nHOISkLju0mrFghrqkKlaLxSTzzImPHwI1lMl2aju?=
 =?us-ascii?Q?lFl5dHG5248vOD6hHpf8zTIWzIWZTz86ivCRJ49Gnq3HEb8NpQNdWOIZnkxE?=
 =?us-ascii?Q?vZPw7fGLcuXlHo6ETlak93rkST4kkFg=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d1416b2-8242-4107-9c04-08da2c3b3f72
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 May 2022 12:57:00.5202
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: my5Phs5jSOelamevQpcEjb+ymzHVoZVfKU4EbQ5uwwdBH5ANWcCklOJ5hR+c2FUlEEGXA7fnYpf0GOmY0p10CTJQmki5SCgPSg4Mhy9jDXQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB2268
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Michael Walle,

Thanks for the feedback.

> Subject: Re: [RFC] mtd: spi-nor: Add Renesas AT25QL128A serial nor flash
>=20
> >  drivers/mtd/spi-nor/Makefile  |  1 +
> >  drivers/mtd/spi-nor/core.c    |  1 +
> >  drivers/mtd/spi-nor/core.h    |  1 +
> >  drivers/mtd/spi-nor/renesas.c | 57
> > +++++++++++++++++++++++++++++++++++
>=20
> Please put the flash in atmel.c. There are all the Atmel/Adesto/now
> Renesas flashes.

OK.

>=20
> > +static const struct flash_info renesas_nor_parts[] =3D {
> > +	{ "at25ql128a", INFO(0x1f4218, 0, 64 * 1024, 256)
> > +		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_QUAD_READ) }, };
>=20
> I suppose this flash supports SFDP. Therefore,
> 	{ "at25ql128a", PARSE_SFDP },
> should be enough.

OK. I see some changes related to this in your next mail.

>=20
> I see that the 0x1f42xx IDs are also used for the at25sl series.
> Could you shed some light to what the differences are? Are they
> compatible, do we have to distiguish between them?
>=20
> Last, for a new flash submission we require a SFDP dump. See [1].
>=20
> [1]

Please find the output, I did n't have xxd installed on my rootFS, so used =
hexdump.

root@smarc-rzg2ul:~# hexdump /sys/devices/platform/soc/10060000.spi/rpc-if-=
spi/spi_master/spi1/spi1.0/spi-nor/sfdp
0000000 4653 5044 0106 ff01 0600 1001 0030 ff00
0000010 001f 0201 0080 0100 ffff ffff ffff ffff
0000020 ffff ffff ffff ffff ffff ffff ffff ffff
0000030 20e5 fff1 ffff 07ff eb44 6b08 3b08 bb80
0000040 fffe ffff ffff ff00 ffff eb42 200c 520f
0000050 d810 ff00 6233 00d5 2984 ce01 a1ec 3d07
0000060 757a 757a a2f7 5cd5 f619 ff1c 10e8 80c0
0000070 ffff ffff ffff ffff ffff ffff ffff ffff
0000080 1650 1950 0000 ffff
0000088
root@smarc-rzg2ul:~# md5sum /sys/devices/platform/soc/10060000.spi/rpc-if-s=
pi/spi_master/spi1/spi1.0/spi-nor/sfdp
23e3ec56b5b8f986d0488ba4727239dd  /sys/devices/platform/soc/10060000.spi/rp=
c-if-spi/spi_master/spi1/spi1.0/spi-nor/sfdp

root@smarc-rzg2ul:~# cat /sys/devices/platform/soc/10060000.spi/rpc-if-spi/=
spi_master/spi1/spi1.0/spi-nor/jedec_id
1f4218
root@smarc-rzg2ul:~# cat /sys/devices/platform/soc/10060000.spi/rpc-if-spi/=
spi_master/spi1/spi1.0/spi-nor/partname
at25ql128a
root@smarc-rzg2ul:~# cat /sys/devices/platform/soc/10060000.spi/rpc-if-spi/=
spi_master/spi1/spi1.0/spi-nor/manufacturer
renesas
root@smarc-rzg2ul:~#


>=20
> > +static void renesas_nor_default_init(struct spi_nor *nor) {
> > +	nor->flags |=3D SNOR_F_HAS_LOCK;
>=20
> Did you test locking?

No, I haven't tested locking. Will remove it.

Cheers,
Biju
