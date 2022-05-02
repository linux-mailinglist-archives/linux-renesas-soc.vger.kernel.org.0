Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D25B551700E
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 May 2022 15:10:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1385197AbiEBNOG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 2 May 2022 09:14:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1385181AbiEBNOD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 2 May 2022 09:14:03 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2104.outbound.protection.outlook.com [40.107.114.104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 232BC6154
        for <linux-renesas-soc@vger.kernel.org>; Mon,  2 May 2022 06:10:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ibfC+HbMm7sDEwVLRLjl54ndiAYA6oqdJJqhshct4YYb7u6JNYiYlVNDjlCc/IpwheaelkFxz3uTBsq2F0tYlAoTC4Cw+eLo/AAu8DFDm4tvQ3nH3ls61F2yGoUcyIHDZ0UmgI1bqhcQInYzpVZVbXSR9BntAfXrRoEeFv87fp0ZiEadZ/qQ7IugrkuS/seUQeE2mtIKtOfz0K3U4fbtBikxmG3/x5JqSawCNAz3Tl9Ny3AzWQ76jnBP2eePz51i5BtUP1SY3oELUaKmHKwBiwpCR5dyqo6uD0SQemeiIDRxDL3rATV4SHXT7cex1n8HqKDwm5JIZ/ai/c9EA9/KHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wjbJW5fE6n6XIt4VPeqaCzPFljRB2j6MepeloUHEDSs=;
 b=Tr7vggD0jUL6pupVqjffh06N4GHW86iYyLY1iTcnzwgAuIgMsdr8TM4Wz7ESc5NEtUN9yqZUrv0Ccs4jI8mw9JZa8kd3GMJ+InuWrnUZk5pUpGcGYcHaA8q4e9dICuqlpr4l7KovlbTfkprNEyP/eqhbqm43rs75oDDXViCF8u3taySBvicBlzcfCmiPLyoXxbNCVOPBbhafq+PW/a3azlAgebMCmjBxPj7DnIZMAFwNpEvUon5f1qtZJXC8GAtgLGtHB1jJi7S6TJ8s6t6iN0gNLVDTgTdLKmWi4AseYWhOBYSPBHOOHoOKpmIgP5FSGMje7kBs4Aj7UHrsOx9vNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wjbJW5fE6n6XIt4VPeqaCzPFljRB2j6MepeloUHEDSs=;
 b=LmWiclxTm2+rPCfr9GIjv0v4/aiKMFlK3iHSdK7iLwwHtDFcvU7lsUJY4oDYAG7as7MOjWRa06OkBLi5zBcdqK5Cg3vDQ0TVxsvckyb2j+3HIWsFsoPylZ78ZWgfv6T5HxVSL8JszLZs97VAI/TnR4AkA1WKjU+SVoMRUCbhGps=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TY2PR01MB2938.jpnprd01.prod.outlook.com (2603:1096:404:70::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.17; Mon, 2 May
 2022 13:10:18 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::3e:970b:c238:f57]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::3e:970b:c238:f57%7]) with mapi id 15.20.5206.014; Mon, 2 May 2022
 13:10:18 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Michael Walle <michael@walle.cc>
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
Thread-Index: AQHYXY0CUmqyBNs4DUuPavP17i/aHa0LdLEAgAAXYICAAASW4A==
Date:   Mon, 2 May 2022 13:10:18 +0000
Message-ID: <OS0PR01MB5922A6C8B1587BB67A1A484486C19@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220501185512.51158-1-biju.das.jz@bp.renesas.com>
 <20220502112934.2433516-1-michael@walle.cc>
 <OS0PR01MB5922313B200156135FC439A686C19@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB5922313B200156135FC439A686C19@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 995ffb32-9615-4271-b39a-08da2c3d1b48
x-ms-traffictypediagnostic: TY2PR01MB2938:EE_
x-microsoft-antispam-prvs: <TY2PR01MB2938E8B4556E1DEB053B6B6586C19@TY2PR01MB2938.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: a3wVfdr+ZNkOSSdFX+15jM0qm9KCv0kifLwuFq9BQzUPJcxOVVqRTvr0cswmnnxdj2tzr/HJkmKv3+1SeHnMG2S6Dzdc1F5qHcCmabrq90VcxSvsYMCuYKIhc7ET9HFWLd+2ZJOP1/W9RKJav9dIJPQQ08Lxm6KX9/dq+gqthRD1wPLr/02veobpAKJUle5FNcmVuJ3yGk9AcSflcmcahowuBttGHxuaxFKQetl7ISH8ocTxiYLifwk2C16hdhRmzdfCroT+EO8gj7pgl1IDUV5QeDjDab1XVRI/6J+DSTQtBpk2BtNyUOJkx3lHJ6I3SRahGc5XT1tci9zzFDrgZ2Pmi+R27UkM2lkNWBzrpO1hheXF1kbKVECciPx94zVHJsAEey+AowFbPOInbRfFn+HraTH5fpIDj0E6KwbcqELyb2hIcmtICo7R8yr7P087Wmtp9Xx/93mAOMQT9zDhcez+sMAdSmg720C/HALwJlNcG4UpXloqKPa6upI6e9TudTFiReCPdwJlQjwC+s9oqSZwiD0vU2swR8DCNsQ4dQ+B3IBa6MNRFIIwKfmPPzDxMzhFP0J6yCrZpy5713c4vaRgvK8LteFfVErOz9guEzugP2QDJxyukpQqohjt+vW/6Aq3TdGB9c+cpA8h9HwfuOg+CZb0xPQdNjfxdHR0DPpMhm5DeJmKqeiKtSXXyAhkLLFqR04Ps1Ux+OzlhHoRqSQF261lrzqYhrVq1UlS0yCx7/DB8y9L8Adwgj1TKZZQa/aFYV5qwINPtdPAPuqwDQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(76116006)(66476007)(8676002)(64756008)(66556008)(9686003)(55016003)(71200400001)(4326008)(66446008)(52536014)(8936002)(86362001)(110136005)(54906003)(316002)(508600001)(66946007)(38070700005)(6506007)(5660300002)(83380400001)(38100700002)(7696005)(122000001)(186003)(33656002)(2906002)(2940100002)(26005)(473944003)(357404004);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?+DA4iLZXbhlroeEK3AHWKJy1mGtQJHzAEuytgT49eoPZlzDa+IOH5trbhbnR?=
 =?us-ascii?Q?4dqbNSen2N5JgGGodSE+bv+XBr6Q0rMLeZTE8dGBvhdP2aB6p190GRUprQS4?=
 =?us-ascii?Q?8Y2kPFpbgjNu1YOvAbQadEuIvslQz6GjU+nYbx/oeTJsytPgHjzebmHbhJIp?=
 =?us-ascii?Q?pxb+eqfqKY5vxd8PUgMZwJmkOA7BvRYK/iCH7CeKm9eGxhxKROdrNiryHDt/?=
 =?us-ascii?Q?X/W667cWG25Zl8zZpbX68OtRVDCzqA4RsU5WKR80DX9z7yc5lXubXdER2Mo0?=
 =?us-ascii?Q?SrsHdL33gMLI4j8Wvkzi8L5WKYgTmRENiBNKc0FcK0NzFgz51LXI0pLS38To?=
 =?us-ascii?Q?64H3K7NeGrUv2DJy1OzmECjv9UlPcoBZ0WhJsf2EAKfpzTq5xmlkfN1cFM1f?=
 =?us-ascii?Q?PCefHp7Xsmclja2dYMBx/L4uK+tYmRzA4OxZTgcrb3QocsW5vi+Nsp+tbKak?=
 =?us-ascii?Q?VUnwc1+ysVKArKEkO5ofJZtWavHcM5LA4JK1w961sKnhFbadpM1uSTgqSWQ+?=
 =?us-ascii?Q?mmUYvmk6RVGc1wH0St2wVCHXFEEkGekAogBc6r+TmTIa2emc0ipK9xH2ZXY+?=
 =?us-ascii?Q?ZzfXXBCluZx9u+vBXSvBUY8mjb3f+CG/QoEkrdFC15cDAOrqjmeEk0SQY7fE?=
 =?us-ascii?Q?VwzGa+Xe/aFP0J2iOzUUq7PIXY064M23KWgm30VT2tBBotvV4527J5XNGPaP?=
 =?us-ascii?Q?h+bcx1GnCFzSmVIBYPZucgL5jQQf3c+B1L8W6tlB1NevH6h2qejffYq99vTy?=
 =?us-ascii?Q?f8dvEqBMHrq2yoof6tGEzwAg5kafaOEoFFQ7pB/eCVUCLcjKIaPiI6qDWub4?=
 =?us-ascii?Q?efAR16i1cscslHyUxALaglX6RBniXNLsd8k26jVklcw49YqWZHbE+1p/xwN4?=
 =?us-ascii?Q?mSggYVaUT8uXgqTQ6HDvM14y++mxYJNNjl8WRWOSI4FxMkvMN0VX/5229idP?=
 =?us-ascii?Q?GFhY95oYJAT13DeUu0XwhFd56ApUop/8crCXIcZsXc+ZQ8oZ8A/3LOUXmTwC?=
 =?us-ascii?Q?8lSAdRXHRavtgRY6XguA16yhNu93EvKVnp3sdWm9fuEwLai9hJSJ9qReQpbF?=
 =?us-ascii?Q?60jbf10Y+PXSQXhnf6k1IiPGRfK225075DHDWnlVUCVyZ6agyldJpSdUCvsK?=
 =?us-ascii?Q?boh9T8BZ7nYXOgKz4S+CUKlSxU0u+QUpexCS7xEVO+7jeU4EmkoWhQkT69tC?=
 =?us-ascii?Q?xsQidIEm4lhogpxr12YsyCp1+U8vd3yPynIpkeDF2xkzhzduV1Ypor2aZqRr?=
 =?us-ascii?Q?Pj27i8rxdewXnDRFWHDvANHUlZcJofiI90JluwSjxsUA2SFE4jc0cAVi+9b+?=
 =?us-ascii?Q?3n4chKRXNHGUDF6nrPv5scv38B19/G8p80hakG90+SPPuLWsXaIRpCFuG37F?=
 =?us-ascii?Q?twXUiuBABIJ85+dF1PPkttBZTbsDKTDo32QWy5npzRU7ljGmcTB1hoexFCt4?=
 =?us-ascii?Q?Ln1g/JbPRmhkPT7nrBPfQrPawylHWGwhe5FPwAnf542CpUjCv6fQ52ILWYg6?=
 =?us-ascii?Q?TDGZ2px3KcDx+TvpDH+in2fP5TrzcWdi51JyLHYoUSuw7H731t2LkhU1yTZ/?=
 =?us-ascii?Q?oDFmvil1fJnr6jQxF2xbpt8hvrYgy+z9v2nlhoe56wIvc9TLpy+0dklpAbSZ?=
 =?us-ascii?Q?OMZl3DVu0Cu1i9ogceSKiSnatt/xeNrSmpCckxMDRH0ZW+yDcAeYRMrCrv0I?=
 =?us-ascii?Q?J2CgoStCSjZ7DIn7UIRdgSwG8tLJOUqu3auD6j+w+/PkVPWLhrUv12hmA3G0?=
 =?us-ascii?Q?fi6+dk4ShjmZ1pJJ3cO/isp/PlYfwuo=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 995ffb32-9615-4271-b39a-08da2c3d1b48
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 May 2022 13:10:18.8566
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qVtd0x6OAQ4R+fmhOzwNxd3OgruIW0DTXyWQZ+sWkvW2KrXmyVlnXYwqoYE3CZp4neZ5A3R0DFhhSafJLOOynJBcocaMddQt9bKRbp4Ggz8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB2938
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

> Subject: RE: [RFC] mtd: spi-nor: Add Renesas AT25QL128A serial nor flash
>=20
> Hi Michael Walle,
>=20
> Thanks for the feedback.
>=20
> > Subject: Re: [RFC] mtd: spi-nor: Add Renesas AT25QL128A serial nor
> > flash
> >
> > >  drivers/mtd/spi-nor/Makefile  |  1 +
> > >  drivers/mtd/spi-nor/core.c    |  1 +
> > >  drivers/mtd/spi-nor/core.h    |  1 +
> > >  drivers/mtd/spi-nor/renesas.c | 57
> > > +++++++++++++++++++++++++++++++++++
> >
> > Please put the flash in atmel.c. There are all the Atmel/Adesto/now
> > Renesas flashes.
>=20
> OK.
>=20
> >
> > > +static const struct flash_info renesas_nor_parts[] =3D {
> > > +	{ "at25ql128a", INFO(0x1f4218, 0, 64 * 1024, 256)
> > > +		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_QUAD_READ) }, };
> >
> > I suppose this flash supports SFDP. Therefore,
> > 	{ "at25ql128a", PARSE_SFDP },
> > should be enough.
>=20
> OK. I see some changes related to this in your next mail.
>=20
> >
> > I see that the 0x1f42xx IDs are also used for the at25sl series.
> > Could you shed some light to what the differences are? Are they
> > compatible, do we have to distiguish between them?
> >
> > Last, for a new flash submission we require a SFDP dump. See [1].
> >
> > [1]
>=20

Please find xxd output.

biju@biju-VirtualBox:/tftpboot/RZ-G2UL$  xxd -p sfdp=20
53464450060101ff00060110300000ff1f00010280000001ffffffffffff
ffffffffffffffffffffffffffffffffffffe520f1ffffffff0744eb086b
083b80bbfeffffffffff00ffffff42eb0c200f5210d800ff3362d5008429
01ceeca1073d7a757a75f7a2d55c19f61cffe810c080ffffffffffffffff
ffffffffffffffff501650190000ffff

> Please find the output, I did n't have xxd installed on my rootFS, so use=
d
> hexdump.
>=20
> root@smarc-rzg2ul:~# hexdump /sys/devices/platform/soc/10060000.spi/rpc-
> if-spi/spi_master/spi1/spi1.0/spi-nor/sfdp
> 0000000 4653 5044 0106 ff01 0600 1001 0030 ff00
> 0000010 001f 0201 0080 0100 ffff ffff ffff ffff
> 0000020 ffff ffff ffff ffff ffff ffff ffff ffff
> 0000030 20e5 fff1 ffff 07ff eb44 6b08 3b08 bb80
> 0000040 fffe ffff ffff ff00 ffff eb42 200c 520f
> 0000050 d810 ff00 6233 00d5 2984 ce01 a1ec 3d07
> 0000060 757a 757a a2f7 5cd5 f619 ff1c 10e8 80c0
> 0000070 ffff ffff ffff ffff ffff ffff ffff ffff
> 0000080 1650 1950 0000 ffff
> 0000088
> root@smarc-rzg2ul:~# md5sum /sys/devices/platform/soc/10060000.spi/rpc-if=
-
> spi/spi_master/spi1/spi1.0/spi-nor/sfdp
> 23e3ec56b5b8f986d0488ba4727239dd
> /sys/devices/platform/soc/10060000.spi/rpc-if-
> spi/spi_master/spi1/spi1.0/spi-nor/sfdp
>=20
> root@smarc-rzg2ul:~# cat /sys/devices/platform/soc/10060000.spi/rpc-if-
> spi/spi_master/spi1/spi1.0/spi-nor/jedec_id
> 1f4218
> root@smarc-rzg2ul:~# cat /sys/devices/platform/soc/10060000.spi/rpc-if-
> spi/spi_master/spi1/spi1.0/spi-nor/partname
> at25ql128a
> root@smarc-rzg2ul:~# cat /sys/devices/platform/soc/10060000.spi/rpc-if-
> spi/spi_master/spi1/spi1.0/spi-nor/manufacturer
> renesas
> root@smarc-rzg2ul:~#
>=20
>=20
> >
> > > +static void renesas_nor_default_init(struct spi_nor *nor) {
> > > +	nor->flags |=3D SNOR_F_HAS_LOCK;
> >
> > Did you test locking?
>=20
> No, I haven't tested locking. Will remove it.
>=20
> Cheers,
> Biju
