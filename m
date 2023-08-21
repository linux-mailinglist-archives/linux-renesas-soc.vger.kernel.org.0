Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 06B3F782EB4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Aug 2023 18:45:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236718AbjHUQpo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Aug 2023 12:45:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232912AbjHUQpo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Aug 2023 12:45:44 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2111.outbound.protection.outlook.com [40.107.114.111])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4ECB4CC;
        Mon, 21 Aug 2023 09:45:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QtDo6obnZRFyhfipHc9513KJcfC5+hfmEGrLuLFyjEwnNf7BHW7Jzf29IltOlCtDFC/R2AonViFzHBIwh3aNgdLGdsT3KSNW6lTlHnOrNFD8m0TujjkJj9FCUjgTToZu1dp0lFrHkCqPEtm14OWzIzYfnVYqe/Zjc8w+iA8AKQMkQFCGQwj7PPfkMYHiw0BHalw4MxgFMlLy8Q/B4UBAxlfRHcSuRwdzCy8yFMVQtv/fLSy6MPCEJRlPR3rj9ZpqqunrOttPUK5YevQCew6m93I28+bt+WMVOb6MKDs/n2PgmmXws4Kx/hFBK2qCf0Kq9u3nMURU1VFDGB5COhJXZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vd9IEUjV+25YL6nktDMqJa0WG1ssYNr65Mt7GQjH4FA=;
 b=Hauz6HVNZOYktSs6EhWunOUsrm7dOQPgte326FYtW3eLjjBggmS48Gj8XGj4gT/hqaWliOa9IWoP6pVc3RmIUYDkzPlzYPm0ymAy3RrVqhiR4Pa69/bN41JcWP4uIXScnCjmr4PnzpIyWxlEXYaKIDBKvdjapaZPpR0fTbY97rzDoUJ2aSLDgEoB0iw0eznqhKDIT9PBhv7KOtK+TelW2dEmY9ML5I/RRxChkB+C3u6fPXjnUaDoKzllMuMD4epBVPTfPO39Sc94u6QTGkG8xpsfTjTfYfmp6RMhKQmPCeChsFdVQ1Hck9Iv5vffPwTnjSwS0A4gyzLLsdN9eLF+MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vd9IEUjV+25YL6nktDMqJa0WG1ssYNr65Mt7GQjH4FA=;
 b=hr9cqu+/qvzYa/Q5s+Oe7yoacQizwvrWuP9R9n6J5rI3FlSaNfhqyPi3STMnBb6ptPmRpuWoJjUl/NKyYeZYk6JGeI/Pc2Gl379/L2gkU5pMgJcP5nnwaZbYz28UwCE/Yg6oiH9cRfkcW7IteFGLghAmta7fFcYKwZtMGF9q7Ms=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TY3PR01MB11481.jpnprd01.prod.outlook.com (2603:1096:400:372::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.25; Mon, 21 Aug
 2023 16:45:38 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::2168:623e:e186:4cf0]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::2168:623e:e186:4cf0%7]) with mapi id 15.20.6699.025; Mon, 21 Aug 2023
 16:45:38 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC:     Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 2/4] usb: typec: tcpci_rt1711h: Convert enum->pointer for
 data in the match tables
Thread-Topic: [PATCH 2/4] usb: typec: tcpci_rt1711h: Convert enum->pointer for
 data in the match tables
Thread-Index: AQHZ05ZTk3glzaSVW0+92976qL4cHa/0uMsAgAA73GA=
Date:   Mon, 21 Aug 2023 16:45:38 +0000
Message-ID: <OS0PR01MB59222CEB6A8EB0F44B87A80A861EA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230820184402.102486-1-biju.das.jz@bp.renesas.com>
 <20230820184402.102486-3-biju.das.jz@bp.renesas.com>
 <ZONgzqlS8bGP0umn@smile.fi.intel.com>
In-Reply-To: <ZONgzqlS8bGP0umn@smile.fi.intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TY3PR01MB11481:EE_
x-ms-office365-filtering-correlation-id: 1d6d04fb-f890-4cf9-4e42-08dba2660c5b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CAKD15GZ13fyRjc/5uFgseFyi9g8URVixj+nE6XYueU7EL0KmbqwIILXJBx9px5k4T0RJEWXPPzlIJGeBRDspfg6JXVhp4JI1MDuT4swnzeXHkDlBQi3d5O5whSiOa6Tv9HG7s21NuzZl/YcXqvzJcrtuKXnr0RFw7pSIyBaQQlJD5pMsTwpBziYXf7xGYOnmZJ4RVG9amYjTSh9dvTW7fMnDtMWEFmwIVKGwssWHv4Cgb+NJCO3/c/LoZLFzjmGZw/AQv8UmxC+smM+k7I7quQ0glxMqYgayDbiSSLmsBcLmI5H82QvFowF0GmbcmCLWbHcHCmD4Yd378/NSpmY+ObYN8LW2nnHakRabKtNUr3SWCjqWq5P89mCwt6E0rHjY8sBliZsqy+4ThIRdqVH0zffncI9nhHQQCWU47SWkodmvS2LkIQOq5ifwSlQxYhiFVOmzIth4ZPZc9pW5TfHavD+QjMypXR96Uj6MpA1gVSTvIXyC05abRDt/cUEgnMVZ6/u6xtCedElwtd/o9sPHgaGGJMYHjJJbGsaqmGrwQs3Dcj5HdlRycoTee+hdOA5oQeMaNEJTGTYdChEADdYEuGadsWC0xOScPfu7ALOR1b+EIUBCMWbTzodkYih70ET6ycbBbqQLkrffwajsOqMFA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39860400002)(396003)(376002)(346002)(366004)(451199024)(1800799009)(186009)(52536014)(2906002)(64756008)(54906003)(66556008)(66476007)(33656002)(76116006)(66446008)(6916009)(316002)(66946007)(8676002)(8936002)(4326008)(5660300002)(6506007)(7696005)(26005)(9686003)(41300700001)(55016003)(38070700005)(38100700002)(122000001)(71200400001)(83380400001)(86362001)(478600001)(21314003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?D6bYaMeq73b+N0OCUZau3Xs6+h6Ehw2T6ieYgd4O+ytWO79TDlu2rV0NhtSz?=
 =?us-ascii?Q?xJM/Ge8I2AasW8Ba5tCGuYQ3ODc4tMCSBFuiLz2MqA1xMzX4zernnfHvbqWp?=
 =?us-ascii?Q?eunQWNmGNAe2xv0jBoh2Zohu6PIoLB6eH9+Wh0LcJvSu65v2UR3WEmZ2wcYn?=
 =?us-ascii?Q?dULwNkFpMBFsUqBmC14BloCE2LFNlzZDmgBZWxJlnc1D+k/w34Uw8EsP2EBC?=
 =?us-ascii?Q?qMi/ne4duzegks1l2G+ammvr7fy7om+rEbDQKYCmbixlxKd2P6STPyoltLB/?=
 =?us-ascii?Q?Mrlg6rt7qxkgyzpa0/C24TikpN0Ew5pliMjzVKWGoW6XYdaOInrLiPrVVw5z?=
 =?us-ascii?Q?/CucvI7ToZ5NsW94OZIf6On8RtruP7cezh9TtKor7tfipyD/UL3OcgCZ+I3I?=
 =?us-ascii?Q?DYYs3VshA8DLa71P9MD5gfxNu7Dxk09s3HbILzSe3yEuoqRvu6yX8oMbzMI+?=
 =?us-ascii?Q?y8N2e5HGn9nB3ZAUl2Ke4z0vgRejwsT6M0jSam+Gdj5cOOl/Xh1xQ1pwF1Mc?=
 =?us-ascii?Q?2lba+C6TszxmF5+FW1RBe2zYhnEL/Mt6QTa+vWPTLIUnCu8DlAGMDMYIpwLy?=
 =?us-ascii?Q?u3csGVd/y46slLpaGph4Sp+wHYl6g52i6VOKLatxLt4MF2P0TEJ6F2+qUmDt?=
 =?us-ascii?Q?ab7ln3V4zlBY/xy4PkHbDFnQBwPIWecbt+2gJmbMOWfMhmV+ihT+sLKziW4h?=
 =?us-ascii?Q?U7LKXMXB9EIV+5/1RmhcyF4mPs9Wk1p9COHKQFPvT1SkHCk86Sm9djBTsXF6?=
 =?us-ascii?Q?yLOag1VEh7wWjFDj3mSL6ZYUs6/C6W9Kvv5o7YRdqUq94eC+CvEOh7xHlYUL?=
 =?us-ascii?Q?FmS77/bi6Wal45c7PbBOotoNQNK3TsnxNotevFA1uZbkTatfYBc6Kls67TTp?=
 =?us-ascii?Q?GI0XaiUEwjuARzYU9lIc47cEtMmPV0YTassV42nxpO1/zy+7e7OC4naZqh90?=
 =?us-ascii?Q?FXOPYBbCjkIskIoWQGNHHGSIO9TBp/o2v7gAEG4ITav6xuEjoPvexYB3b12r?=
 =?us-ascii?Q?WwfHkitvV5Xtf4/Vj7BjqusoNCX1vmskR2ULjISzm/diI+OyuheZTqnj/vzS?=
 =?us-ascii?Q?1mSjOw0tnh4E6Pn4UXHeSJWG2rXjUiE4ZvrUdLyJ2qMk/wZubWGpK+U2XmMu?=
 =?us-ascii?Q?Yf1wUzq8I2LnGq6FBnq4QCdPEn7mmXWzGeh6ocNHPVfw31awN90xoXuxOljz?=
 =?us-ascii?Q?yrary1sfl8LarC9ybjIlrX0ZMYJDLaQLVj4KzF9YqK0okQ5Jzg0WjrA3aFkX?=
 =?us-ascii?Q?RbL4NjBrxYydrBrZhOpgWCR0aR07bQ5oY4H8xgMzuaCstjAQo+I9DtdMzSKt?=
 =?us-ascii?Q?Kc0DRpNrF6UdZ80Godnb65ghE3HutoybxcG6LEGaviuZ5FdyNdkuK1iVfzLX?=
 =?us-ascii?Q?cJ9wHPhw9/CeMqvlnkCzWOCAfXxD1RsapnMMVk4S1EI8Ozp/bMFgHI+rGhSU?=
 =?us-ascii?Q?8PEWOJb0QeMYohXM3Fc/MPp+vn5NalUWM/22sj7EqES2BAZoWxh1ByQknhy2?=
 =?us-ascii?Q?LbUj0n3y24UF3MveM1N4isxrNImEnAxNjQ/P7+bXYhiQODc8zbAQPnjscaZF?=
 =?us-ascii?Q?XEuL8CODh2sF4FPBw5H84m6Od2jVp6mF7ecVhrWixDx9HQovI/VGIWykhQOJ?=
 =?us-ascii?Q?EQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d6d04fb-f890-4cf9-4e42-08dba2660c5b
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2023 16:45:38.0532
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: db1Sg1OsgiXAIUhcDVGuFMn6fkB0rgtUDfXb9AiS3yPxkfY+s2CV/gm2woiIk9WuPql1OxXhSLb11Krl1/4Po113Cjn0tNSFNZNklPuPF40=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11481
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Andy,

Thanks for the feedback.

> Subject: Re: [PATCH 2/4] usb: typec: tcpci_rt1711h: Convert enum->pointer
> for data in the match tables
>=20
> On Sun, Aug 20, 2023 at 07:44:00PM +0100, Biju Das wrote:
> > Convert enum->pointer for data in the match tables, so that
> > device_get_match_data() can do match against OF/ACPI/I2C tables, once
> > i2c bus type match support added to it and it returns NULL for non-matc=
h.
> >
> > Therefore it is better to convert enum->pointer for data match and
> > extend match support for both ID and OF tables by using
> > i2c_get_match_data() by adding struct rt1711h_chip_info with did
> > variable and replacing did->info in struct rt1711h_chip. Later patches
> > will add more hw differences to struct rt1711h_chip_info and avoid
> checking did for HW differences.
>=20
> ...
>=20
> > +struct rt1711h_chip_info {
> > +	u16 did;
> > +};
> > +
> >  struct rt1711h_chip {
> >  	struct tcpci_data data;
> >  	struct tcpci *tcpci;
> >  	struct device *dev;
> >  	struct regulator *vbus;
> >  	bool src_en;
> > -	u16 did;
> > +	const struct rt1711h_chip_info *info;
>=20
> Have you run pahole? I believe now you wasting a few more bytes (besides
> the pointer requirement) due to (mis)placing a new member.
>=20
> >  };

Just tried pahole for the first time.

$ pahole -C rt1711h_chip drivers/usb/typec/tcpm/tcpci_rt1711h.o
struct rt1711h_chip {
	struct tcpci_data          data;                 /*     0    72 */
	/* --- cacheline 1 boundary (64 bytes) was 8 bytes ago --- */
	struct tcpci *             tcpci;                /*    72     8 */
	struct device *            dev;                  /*    80     8 */
	struct regulator *         vbus;                 /*    88     8 */
	bool                       src_en;               /*    96     1 */

	/* XXX 7 bytes hole, try to pack */

	const struct rt1711h_chip_info  * info;          /*   104     8 */

	/* size: 112, cachelines: 2, members: 6 */
	/* sum members: 105, holes: 1, sum holes: 7 */
	/* last cacheline: 48 bytes */
};

biju@biju-VirtualBox:~/linux-next-test$ pahole -C rt1711h_chip_info drivers=
/usb/typec/tcpm/tcpci_rt1711h.o
struct rt1711h_chip_info {
	u16                        did;                  /*     0     2 */

	/* XXX 2 bytes hole, try to pack */

	u32                        rxdz_sel;             /*     4     4 */
	unsigned int               enable_pd30_extended_message:1; /*     8: 0  4 =
*/

	/* size: 12, cachelines: 1, members: 3 */
	/* sum members: 6, holes: 1, sum holes: 2 */
	/* sum bitfield members: 1 bits (0 bytes) */
	/* bit_padding: 31 bits */
	/* last cacheline: 12 bytes */
};

Currently size is 12 bytes, it can be reduced to 8 by adding bool.

biju@biju-VirtualBox:~/linux-next-test$ pahole -C rt1711h_chip_info drivers=
/usb/typec/tcpm/tcpci_rt1711h.o
struct rt1711h_chip_info {
	u32                        rxdz_sel;             /*     0     4 */
	u16                        did;                  /*     4     2 */
	bool                       enable_pd30_extended_message; /*     6     1 */

	/* size: 8, cachelines: 1, members: 3 */
	/* padding: 1 */
	/* last cacheline: 8 bytes */
};

Cheers,
Biju

> ...
>=20
> For all your work likes this as I noted in the reply to Guenter that the
> couple of the selling points here are:
> 1) avoidance of the pointer abuse in OF table
>    (we need that to be a valid pointer);
> 2) preservation of the const qualifier (despite kernel_ulong_t
>    being used in the middle).
>=20
> With that added I believe you can sell this much more easier.
>=20
> --
> With Best Regards,
> Andy Shevchenko
>=20

