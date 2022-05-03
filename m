Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 66F44517D34
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 May 2022 08:12:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229537AbiECGQH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 3 May 2022 02:16:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229447AbiECGQH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 3 May 2022 02:16:07 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2116.outbound.protection.outlook.com [40.107.113.116])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD60835DF5
        for <linux-renesas-soc@vger.kernel.org>; Mon,  2 May 2022 23:12:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EFb7wnH0Uv3zOJUQ03AG6VLF8YQ/mt+GI0Q+asQUDFsQLQmCjot40VQGKurmMJ72T/8X/k/IatVk2b4TQQ29xJ/ZaU1rHraT2aVc62o5ZQJq461/RnPknjqpZJSpuD0n8biJOCx6qsLlmrVxG/y5NVElOaYaPdWY2nyNMVLQbK8xWubXRRShj3WBc5O23bdnk+c+jUDFTDvdblHbi2Vvx22HsvBFbZclztK3K6ZhuK9XTn6BZcirt2nOxm6Ux66/CPCieProa555Q5mEDj63dJrdyNbzOS3rsIak5q/ydEQT+qWX2c3y18Lv5n4K+mSQcS20K7XIolN9GAxFlnAJOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O5SIBANM+yq4pTkNEcBsec+PRn+SbgFnOV2o/9zt868=;
 b=XoCk9hnTmmzi2mzSk0q+a4aVkiJI/rOxEFW4cWS9yvs7jTeMsldIdEIQ1BaHdsmTPvi2Od8RM8TY7tN1KYP6g8/53FvXgrVbQ/J01YZ6lFvirwUGJP6k40O2McRqeLxxohnma9SH5y5L1nsigX2HHyb2UMxSOaE5ioLBOGKVbhcTCVLPkGAj6FR5WfAvHA7PP/3YOvYFC4N2oKGrldbHOpaGGSYgoyS6TJ/qPX/eosR640DR1xHIRGgfaluOCWsFV0W6rqaqJPNeDnLN6cRaSw2dqhhZElHPF5w4vW4+w9Sujbyj93I2DImj639h/zqPFmzFjvzBYh2kVPg9mkLzRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O5SIBANM+yq4pTkNEcBsec+PRn+SbgFnOV2o/9zt868=;
 b=GubwyDebvRlB7V1gHEr8Y7kDguQzKpliu2IX3YsVcMrCuaq6FX4pcB5SSrhStVqfEy2qdkpMOqHnql5Ge5kfl+Z8ndlmY/TMkR8ymBkoSc+/YWfNVepzwsiy08CZmleBjC9VtCcGfUeTgdiOrrgb0fCQmG8ev9ONqCtMPHlgVCc=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYCPR01MB8520.jpnprd01.prod.outlook.com (2603:1096:400:13b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.12; Tue, 3 May
 2022 06:12:31 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::3e:970b:c238:f57]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::3e:970b:c238:f57%7]) with mapi id 15.20.5206.014; Tue, 3 May 2022
 06:12:31 +0000
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
Thread-Index: AQHYXY0CUmqyBNs4DUuPavP17i/aHa0LdLEAgAAXYICAAASW4IAAV19ggADDZiA=
Date:   Tue, 3 May 2022 06:12:31 +0000
Message-ID: <OS0PR01MB59224A6733975F4F4B95512386C09@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220501185512.51158-1-biju.das.jz@bp.renesas.com>
 <20220502112934.2433516-1-michael@walle.cc>
 <OS0PR01MB5922313B200156135FC439A686C19@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <OS0PR01MB5922A6C8B1587BB67A1A484486C19@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <OS0PR01MB5922953CE1777950ACA2832D86C19@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB5922953CE1777950ACA2832D86C19@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1cae03d1-1b98-4242-92ea-08da2ccbe837
x-ms-traffictypediagnostic: TYCPR01MB8520:EE_
x-microsoft-antispam-prvs: <TYCPR01MB852020455B179F1D904248E086C09@TYCPR01MB8520.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qvXHI+S5rD9311X/THJWSY6bGzDIgKxuobAqK4N99nh7/KDFQalpXhsyB+653Fgm2p1ZkscgqAQyW7V994AtnYQrRdkagQrGf0IwxYNvEX3AZngnQZX2qX5G9yCd8BnKGTAp0uzBBQAqE4VhH0br1p+ddRwTqLzzAMpoeiU8iK6IsUaHEAh9OoT1c35iKpsQ5NpFvup5C5/LPku6mpoIV8H18UwmmmDNCSpp/YUUXbeN0VdURk6xfRTfPOg0tsI2Dtxrp5D/nR3q9rw5Y7L+C1bVhG+73x/5C6hF5BQVmriX4a58vSRMI0B/Yt7MPgeOU0ChAAb7s9Jy6ksp6DrX7y76KPRDN598wFPAn/vCEhmH8yuvHvsoUHXL5aIXO/3tOY6Ndf/80xHOSVr3hULgp/hZVAmDScWTJ3IvResUGstav+0+7l03+m7q9U6cW8cUTLSrdw8/w7bq3OU3S7mXddu0upFm3TvrCnQ5ciFQMU9xRlo5Hptk4/kVEzbijdzwk7oQOl6GBenzn1KreB+E11zCnb3p7QrxuxPyKKVHx5KdY6k+Od0Smr60DX7RvO4Wn41eBY56ppvSDyZR4398qRUjUWMolsKKAQptu9fVOfSRY85TZH26TvK82mHAWrvba4zK55W7vUbsyTjGqB6NxsIKq/fagJ+xwg1S94NHD/mHDgj9XwQechgpqesJ7kwuohxe6+CzgGdD483vYMg1fnkNzLIxmLZQIWx1paz1a+dtb/k/+NoKKZakHwtlBu8ReqVO0EYubKUy9dFfzongsQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6506007)(4326008)(316002)(7696005)(508600001)(26005)(52536014)(186003)(8936002)(8676002)(66476007)(66556008)(122000001)(55016003)(9686003)(64756008)(66446008)(33656002)(83380400001)(5660300002)(66946007)(76116006)(38070700005)(38100700002)(54906003)(6916009)(86362001)(2906002)(71200400001)(473944003)(357404004);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?vpC6gtqq/I7i4vsff0DdF/O2t3sDLf2Sox1Cw/gcknAYzw7dv5qqDo49iqQB?=
 =?us-ascii?Q?zaRBQFa8WQn4jzZ3LShkkoNizPdLf9XueSZlGinBejficKN7r4tdrfogZS5L?=
 =?us-ascii?Q?dOS9im23POHYzooFHE+33Lyp9GnyIANg99mklDcdiCEgwF20Hd6N+C9N4Ole?=
 =?us-ascii?Q?gQ+aVLkD8xfpuxHBRJkNW1IDG1sRM004LTz6EjbunugCJNKKAiMnWtwTlq5V?=
 =?us-ascii?Q?CEGx8q+WdNcyA8m8JdAI+uM1OLrqi4NkzkQAfi83fvLM6ZpS8DXydswiJroi?=
 =?us-ascii?Q?HSNXF6BjbgXxB2WNBAbdR6M5p/wmsGrvgRTm+N987Mxle+ZvPy5Fo5jwISZ+?=
 =?us-ascii?Q?kl7L0bdSRlOFqxhnIqgyL7+em1IbE8gC6Tehsvewzm6BaBIR79zWEVYQbuxE?=
 =?us-ascii?Q?MD8zd++IXMBQAnX9/VX8Vi6EJ16jwNyiW+oR7LVPbmzXVnwGHQ+2J0+GZmws?=
 =?us-ascii?Q?wJvse2x46twMiQJM6Q18ag4r/nSa3H1IQzLvxC2D/ZvE8FzOJlNmI19VoJNe?=
 =?us-ascii?Q?at1nYZBVA61PjuEZ/OcKIWPWhM/WDFBSWgxKhkz/R8yKyZ+W1qtUv9MEeBEw?=
 =?us-ascii?Q?AH+6kSaTlMV+F7KxsT8HHL42bk8hpmcbx0nNNeKzm7OiKIxPXldK6/h63SGh?=
 =?us-ascii?Q?ss8ipWVro0cKiXFI2pp7eKAtgbNICdX4D92M8iBHBOPYDfyNocRexQ3K3ph0?=
 =?us-ascii?Q?jz4EFxcYCpzE+yNJROPgyzf8xJ2fv2mh/Y2m1ekmQpWO8+Q0JZH0n00ckmzV?=
 =?us-ascii?Q?SQvXyciGXJ52PA06pBMJ8XRonmgTNh5CxZ9wn5JWzv0OatDTcD/n0znpgLiN?=
 =?us-ascii?Q?ednrC8r2xXX9DZ+b8+3ZO8h/8fAEA7WvI/MZKwdNBMjkx5Y7okFzB69/4qfy?=
 =?us-ascii?Q?O4MmxL+OeWiyOppnRkZvUjdn4Pd4jZcn3W5lnQJ7Fch1z8czVy3e9E3xE/g6?=
 =?us-ascii?Q?D6uAJUSONIx5e1UhzvfoVpoI+mDM2f9oIH9knQK8LRwQjFQHRiIBU3xgr1fq?=
 =?us-ascii?Q?NTemkJt54Wyrp4Xz68wbalUKZAJR2qvwktPGVa5pnhcRwgHEhYX4ZRlx4sXu?=
 =?us-ascii?Q?zQNrb64hxkijmzChpWfSRybb7XKsywVJLQiQHibMHBFYwUtRwsVUDJEQtMkz?=
 =?us-ascii?Q?ufo03/MqGAliTN/gt1jwYUlhYxOBBCFsMFZ8opf3jD/6aMdMwcRGPt8hnbR+?=
 =?us-ascii?Q?Hw6GvRXYk6LjKms3v3vpZwh45XXZyAeBnBZLnQq1FW7D/GjGVHsyjHu7kW13?=
 =?us-ascii?Q?SnR6OUjFyF80XTbsLtnDUNLjKcMsPWk73yTbotBcXFoiHGOZtiaysQoZ+AHf?=
 =?us-ascii?Q?FBPRUrc/Wnko/iny6jrBpBusj+MmKYDg7TUih7jlBR9125D481hQ5cauIwue?=
 =?us-ascii?Q?rjd7GDqwSqAQ8q/eyQ+WDNzLAogSR4Pe318YnZGl9aZ436cAVXemGX+f2tM5?=
 =?us-ascii?Q?W3rpULXER7rO2kLQ51FZsafYYIt1hY4bdtuO7+CqB19meb+fjr2IN8QXGcWM?=
 =?us-ascii?Q?lcRBmImRtHWaqSu/QFgd7rnuCLFlMtmAnQG7HNf7CLU3zgG0ILyaseJzshNf?=
 =?us-ascii?Q?a2PJpS0MAkws4gkYjTSzt9mKl9Gw6HGgIKHuFI7H2zD3vHcSLUgUlwNmTCxb?=
 =?us-ascii?Q?9IIKa3skHNp7a/a1u7pUYAKdOhIIiRwuZJGnBAIrXtyNQ2m6E18H2t2BU2jb?=
 =?us-ascii?Q?CsmhYeRqWuSBg/zWBq8/t40DvRUpXEPwOM+9NTaQkIL7heIuXe1KIEhTxb4+?=
 =?us-ascii?Q?PqOo8EbdF31l6A3Ky5w92w6DLuV+ZYs=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cae03d1-1b98-4242-92ea-08da2ccbe837
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 May 2022 06:12:31.1972
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QQ6yIGc3y3I5s1EghMpkPoZuF7chD1mMeFGXpH2eQDE9JlwHqMVBuQJoAG1fjUvHatfddRA0UR6EaRbXTZAahZuo367368j++bJGl/HjiWc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8520
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

> > Subject: RE: [RFC] mtd: spi-nor: Add Renesas AT25QL128A serial nor
> > flash
> >
> > > Subject: RE: [RFC] mtd: spi-nor: Add Renesas AT25QL128A serial nor
> > > flash
> > >
> > > Hi Michael Walle,
> > >
> > > Thanks for the feedback.
> > >
> > > > Subject: Re: [RFC] mtd: spi-nor: Add Renesas AT25QL128A serial nor
> > > > flash
> > > >
> > > > >  drivers/mtd/spi-nor/Makefile  |  1 +
> > > > >  drivers/mtd/spi-nor/core.c    |  1 +
> > > > >  drivers/mtd/spi-nor/core.h    |  1 +
> > > > >  drivers/mtd/spi-nor/renesas.c | 57
> > > > > +++++++++++++++++++++++++++++++++++
> > > >
> > > > Please put the flash in atmel.c. There are all the
> > > > Atmel/Adesto/now Renesas flashes.
> > >
> > > OK.
> > >
> > > >
> > > > > +static const struct flash_info renesas_nor_parts[] =3D {
> > > > > +	{ "at25ql128a", INFO(0x1f4218, 0, 64 * 1024, 256)
> > > > > +		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_QUAD_READ) }, };
> > > >
> > > > I suppose this flash supports SFDP. Therefore,
> > > > 	{ "at25ql128a", PARSE_SFDP },
> > > > should be enough.
> > >
> > > OK. I see some changes related to this in your next mail.
> > >
> > > >
> > > > I see that the 0x1f42xx IDs are also used for the at25sl series.
> > > > Could you shed some light to what the differences are? Are they
> > > > compatible, do we have to distiguish between them?
>=20
> For AT25QL128A flash,
>=20
> 0x1F:- Manufaturer
> 0x42:- Memory Type
> 0x18:- Capacity
>=20
> I guess, if there is any at25sl128 flash chip, then the Capacity will be
> same for both the flash.

I don't have the md5sum value for at25sl128 flash chip. I believe these val=
ues will be different for at25sl128
And AT25QL128A.

Probably we could use md5sum value, if at all we need to distinguish them f=
or at25sl128 if JEDECID is same??

Cheers,
Biju

>=20
> Cheers,
> Biju
>=20
>=20
> > > >
> > > > Last, for a new flash submission we require a SFDP dump. See [1].
> > > >
> > > > [1]
> > >
> >
> > Please find xxd output.
> >
> > biju@biju-VirtualBox:/tftpboot/RZ-G2UL$  xxd -p sfdp
> > 53464450060101ff00060110300000ff1f00010280000001ffffffffffff
> > ffffffffffffffffffffffffffffffffffffe520f1ffffffff0744eb086b
> > 083b80bbfeffffffffff00ffffff42eb0c200f5210d800ff3362d5008429
> > 01ceeca1073d7a757a75f7a2d55c19f61cffe810c080ffffffffffffffff
> > ffffffffffffffff501650190000ffff
> >
> > > Please find the output, I did n't have xxd installed on my rootFS,
> > > so used hexdump.
> > >
> > > root@smarc-rzg2ul:~# hexdump
> > > /sys/devices/platform/soc/10060000.spi/rpc-
> > > if-spi/spi_master/spi1/spi1.0/spi-nor/sfdp
> > > 0000000 4653 5044 0106 ff01 0600 1001 0030 ff00
> > > 0000010 001f 0201 0080 0100 ffff ffff ffff ffff
> > > 0000020 ffff ffff ffff ffff ffff ffff ffff ffff
> > > 0000030 20e5 fff1 ffff 07ff eb44 6b08 3b08 bb80
> > > 0000040 fffe ffff ffff ff00 ffff eb42 200c 520f
> > > 0000050 d810 ff00 6233 00d5 2984 ce01 a1ec 3d07
> > > 0000060 757a 757a a2f7 5cd5 f619 ff1c 10e8 80c0
> > > 0000070 ffff ffff ffff ffff ffff ffff ffff ffff
> > > 0000080 1650 1950 0000 ffff
> > > 0000088
> > > root@smarc-rzg2ul:~# md5sum
> > > /sys/devices/platform/soc/10060000.spi/rpc-if-
> > > spi/spi_master/spi1/spi1.0/spi-nor/sfdp
> > > 23e3ec56b5b8f986d0488ba4727239dd
> > > /sys/devices/platform/soc/10060000.spi/rpc-if-
> > > spi/spi_master/spi1/spi1.0/spi-nor/sfdp
> > >
> > > root@smarc-rzg2ul:~# cat
> > > /sys/devices/platform/soc/10060000.spi/rpc-if-
> > > spi/spi_master/spi1/spi1.0/spi-nor/jedec_id
> > > 1f4218
> > > root@smarc-rzg2ul:~# cat
> > > /sys/devices/platform/soc/10060000.spi/rpc-if-
> > > spi/spi_master/spi1/spi1.0/spi-nor/partname
> > > at25ql128a
> > > root@smarc-rzg2ul:~# cat
> > > /sys/devices/platform/soc/10060000.spi/rpc-if-
> > > spi/spi_master/spi1/spi1.0/spi-nor/manufacturer
> > > renesas
> > > root@smarc-rzg2ul:~#
> > >
> > >
> > > >
> > > > > +static void renesas_nor_default_init(struct spi_nor *nor) {
> > > > > +	nor->flags |=3D SNOR_F_HAS_LOCK;
> > > >
> > > > Did you test locking?
> > >
> > > No, I haven't tested locking. Will remove it.
> > >
> > > Cheers,
> > > Biju
