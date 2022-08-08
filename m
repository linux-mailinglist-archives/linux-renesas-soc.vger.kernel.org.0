Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5012C58C3ED
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Aug 2022 09:27:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235172AbiHHH1L (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 8 Aug 2022 03:27:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235068AbiHHH1K (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 8 Aug 2022 03:27:10 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2139.outbound.protection.outlook.com [40.107.114.139])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 996965F67
        for <linux-renesas-soc@vger.kernel.org>; Mon,  8 Aug 2022 00:27:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YoLXJDE9UIG772kRG9pWijqjB7cTwk+H4FVKhxXqbivyi9tCdlGcbl3TZgmOJNFlQg6dBtewHUdv7plXu1giAXskRlGRzv4Rrr1CNOzwPd8nyLg381r+LBdBZe+oHZZ/LvMNpINN2aLOJwx+soMKcqcLvB0KA5aeztUOZisM8LveJgAwQODXSQcKtY17J2GruuaIH+IbZ51+Bf3ywrHkPePmWYkwAeZBfUQ6VI1QGTeSIzCqYcbZajODnO5b6RUFyyEgxWQJLqkUAEGNPs/FjmDfyPz3SlBezoANgK0ad/2AfBNit3W1x4K3z3puzxqdy3B3on+B02xFgM7WquzeLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=39uGnZqApVjBgT992aFXp2pAZzVSRtz2/L30MbATFVY=;
 b=XZjrC4gVwEaElBdAm+HrEBJW3kxmxVwcqAgLalAZ2VCBtcMmxs3y6f6gciAA8EEqqChUXEqN7dJlYOyZTl7BC64hrBGJvzn/WJCq5EfXJ99cPZfyODGZsq8NaZ7UdgzrKqKKiYIUPoU93DQvb9sdhgydmrNIAG8ri0jLKX7WnSj4IeRsgL0FDDLxQNKEFMFn1cIsKFJX1Y3DXqUbGblgZFiRRRKVtWZ6UDnF8gxJsfA4RM9SFTXlaWbZs4mCqKxSAsW9rnv1njHnlBNGUrYdwtcGgDOTVLzwhOmA0D84x4EGg2w3Y0GWvYSG5LZYW7Y0JtWmUZ2JcCoZbX5wfFJVyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=39uGnZqApVjBgT992aFXp2pAZzVSRtz2/L30MbATFVY=;
 b=m6sP7vDJ7jLhroH/IVGdVJqQthNzeeT0BYJK3k4UQa+Y191EiG4Q63riaBLMyrHVVm7+KfwtLcSjM1NVn0nzCxMbs9n3cBROyoucIYjHEDThreDZrzWYGSGFhddG9+QOhUMNqE92Xz5zY3qWMytOhP+X9930Axhe1IWH1Dj5Yb8=
Received: from TYYPR01MB7086.jpnprd01.prod.outlook.com (2603:1096:400:de::11)
 by OS3PR01MB5766.jpnprd01.prod.outlook.com (2603:1096:604:b4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Mon, 8 Aug
 2022 07:27:06 +0000
Received: from TYYPR01MB7086.jpnprd01.prod.outlook.com
 ([fe80::3c36:680f:3292:4a79]) by TYYPR01MB7086.jpnprd01.prod.outlook.com
 ([fe80::3c36:680f:3292:4a79%9]) with mapi id 15.20.5504.020; Mon, 8 Aug 2022
 07:27:06 +0000
From:   Phil Edworthy <phil.edworthy@renesas.com>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>
Subject: RE: RZ/V2M USB
Thread-Topic: RZ/V2M USB
Thread-Index: AdioxJFO3fqPouQQR2WlJ+Xylqw1MQB8JF5gABB/tRA=
Date:   Mon, 8 Aug 2022 07:27:06 +0000
Message-ID: <TYYPR01MB7086B4D90C7BCA36E6EF156AF5639@TYYPR01MB7086.jpnprd01.prod.outlook.com>
References: <TYYPR01MB70863A585C9F2B2B4ECE85D3F59E9@TYYPR01MB7086.jpnprd01.prod.outlook.com>
 <TYBPR01MB534150654E57593E823F0C2DD8609@TYBPR01MB5341.jpnprd01.prod.outlook.com>
In-Reply-To: <TYBPR01MB534150654E57593E823F0C2DD8609@TYBPR01MB5341.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7578501c-928b-4b1d-7d36-08da790f65a1
x-ms-traffictypediagnostic: OS3PR01MB5766:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eqrJzqUV79HFgSMuzIZRW/9Kxk9vB2LAq/5Ouvb3Az92rfo7HzfcYp9AlhGIfh/wdFSHrpC5GGITJGA3E1kSOUIAjD9vIuthmqfRgHYEZq7zcrjePjwYZNRJrysoYu2nlaGvW/VCKYDpJkOff+1lvbkIFcAv3pR8hPna8qpkTMCmcC58GoyErw7t8h52zKzVWUEYMmF7ja+bsdEhveU4dS467M0Rl2yhquTG3qHWkEz6YRkU2xpLPoodZ1I16jDmQheMzNA57j9JVr3ZxItw1e/os899EGNqykBekg949kalr6b01uLJWJgMf29tyAvN1bh3J+09fqH1fT2OVYa3kKDvEbvzj0iyVga1qhU2jfdf7nDrLiaqenwV0H2OoiA43uLEM2m86OtrOp31lGU5aM/bJV1DrHNjJ790GdxtDVDDbnVmsnPv3XbkfbSGdgmHaND/Ay8EPOpQK0U7E5wucwTpSWCc4OY+cNALRrfeEzJxmQOL05ECUzZ+oy8sj4gIOisVqB+RDkzwmyqctT8FKh3DEczHbzhO4w24cjwK/UzjS3zGd+wURblIkGO6rs7djHvNbBwXODEMudQou1yZFCZHPaq+lSbZvMO1Pm/14MnWjX4c3PGXg7RBcWfwnO8DE+GQwVUGS3aZNi+qgkQjMdyZ3imzPlAELD3UmYIU4NrcUpd3NKj5ahSTl7aJkgEYwT8DIUhS392KqVYmtOwncKuAHsC8DManimgOjsKm0gUzuG22d5Sbka7rDXX6JYM30v9IzprtKPFZ4C1cyS0ZkMnh4AtJXFS8h5UXO8CuYPwydy8gfdCRENfjwRuDIzrd
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB7086.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(396003)(39860400002)(136003)(366004)(346002)(2906002)(38070700005)(9686003)(26005)(41300700001)(7696005)(53546011)(6506007)(83380400001)(55016003)(38100700002)(107886003)(122000001)(186003)(478600001)(52536014)(33656002)(71200400001)(4326008)(66556008)(8676002)(64756008)(66446008)(66476007)(76116006)(8936002)(66946007)(86362001)(110136005)(44832011)(316002)(54906003)(5660300002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?0ERYX/w7BkEv4w9MBFVzB7G4+au6dmYsBwFlqtwUjRp7IG5DnjbCtbGIxhgd?=
 =?us-ascii?Q?NUNp2qM9GYvNvhs4ppezyTY2GltU0VE345OlidJMwn8XiAO0mtkIWAqNaQ6x?=
 =?us-ascii?Q?viujOAFmY86tB6FsdXVJ+QiuWEQWOWLPzWBCMximbX2xq+Ngcf7Rb2u0O64u?=
 =?us-ascii?Q?vjR3QnAO4t9ST17hFwVxi99Hzw10yxEW5elEkfdES8nEIw0GTFFjOJk2aYyS?=
 =?us-ascii?Q?WB76n8aIWPsaOHFrwzmbAYB4GYc3zEHBPxGQSQobLScAax2oNmCXBWzoHbOD?=
 =?us-ascii?Q?CE+p6QpCh6wnZpF8U/YrlK8dOjSLwePTwDtJvZf1IrvZU3szYCYfo+qz9/mD?=
 =?us-ascii?Q?XPDPKeh5PswEHUO6WxhVwpHOmh4EUaH2RQYhrS8k1s42pPEU3JsfNGNTOKlZ?=
 =?us-ascii?Q?smWFqGMgNRJc960b2MO7xyKCXLyb1jjipGfopOZ0ErkTCU2kzuzGt0pQgrl4?=
 =?us-ascii?Q?qI4Gt04hVq/SkavWtd8x6ecu8wtiY+D2zr0Tabd4sePsFzixFgXDj8fpf4m4?=
 =?us-ascii?Q?4yy/2pDSKm/emrAaVWxAzON20RwNHzOosapkQ7qLa2lccYcJ9438USTKuEwS?=
 =?us-ascii?Q?jQDRjA9rnrtrxrM4S+i/UKEcAV3eZbtQ8C8zEg0tlqHSG372EXKdsxSIXwv4?=
 =?us-ascii?Q?rD4X54Yn3cXvwlTeOdoIIactFavzzyx3hDHRqXy6UGil8xPDT7TqZOIfW9Gu?=
 =?us-ascii?Q?xJZ6P/mJXmCopnYBbFhyR3tP/17jhKQ1Icun9LWCwAT4gm9lXk4wi8nXgJVL?=
 =?us-ascii?Q?MS0cCElI61LUqwRdsiPwYc7WknHlyXbB1DiWURWdabs/jNJmVVxl0ijEAXJf?=
 =?us-ascii?Q?3st4j2FVfE5iNYKSLL0GaCcVDj8x9DgIeL8aU1BqrhlgVtTHEs7zzubS5e12?=
 =?us-ascii?Q?NRDZxpkExSEilg5WJJiU/5Bav2p1JaZ5arPXhU6eak13jLvvCU9EXB9vinV2?=
 =?us-ascii?Q?L7qIzo+m9/8pn5urHVU9drjuzaZICR67CJYXcphL9RzVbatm3JLEBOhXEd8l?=
 =?us-ascii?Q?Dx5p7THjiy9xpwdpCuD4y48UDqzvqj/pPb+0IjddWLxGmlCTjXVepE/dAzcr?=
 =?us-ascii?Q?2G1zTIcEy1K5eOOK2TtvzNco7rcNRCtyav+M10Bl5ZC77Houtw4ODDvV/6xh?=
 =?us-ascii?Q?GxIUop4OaTWW18nONItpYqmT6DC/f7hkrPv1XgGCpGYYejljnstIM0focthx?=
 =?us-ascii?Q?Wxxfiso/6vNm9Z79CKtbbFr2yzlVN4KP6tlHXqjvLt6gfL4FFxm2LoySYOdr?=
 =?us-ascii?Q?a97noLYAo7mAfP88BalJnMeIatX1R4YL1UaQnqMUGgwYVezVxssgmH4pVN/k?=
 =?us-ascii?Q?1hdK9Rw6xeKHtxpUTIb/hLeF7Od0U+BZSDcSSx89aHnWJolk269uyuNAdgKK?=
 =?us-ascii?Q?tOxNItTGN6nho4gpbWa1ICvzAJzXkTl2CZ4Qt/WYVLw6FNUWvE049MN5m7If?=
 =?us-ascii?Q?3+iS8boZZc5QQQVysPAAooqFlV8ALrScBTWYXhHOF7vDbchMq4DeUE1kZN/L?=
 =?us-ascii?Q?pQ0GsRXuGpapE2RcQI+YMCIGgoMJbs19wf4QKCvjz/wUvPcThNH+pWsZVTKI?=
 =?us-ascii?Q?7cBDmOj9rOL8+YJRuW/ZPa8qa8jxCIUjFxizmSggjJlF90QU+SELeXXSGcEe?=
 =?us-ascii?Q?tg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7086.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7578501c-928b-4b1d-7d36-08da790f65a1
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2022 07:27:06.2586
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /TKgoQAm7Zv3fBCrMfYtiunDKAvC1bxzsndP8dhu0uROXRQ1zNyou6LSoxMb4Pb7LgZeoErbwk5jeNY3yJqziJplh66P5NoLsnyqZA/NPxk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB5766
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,SUBJ_ALL_CAPS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san,

On 08 August 2022 00:47 Yoshihiro Shimoda wrote:
> > From: Phil Edworthy, Sent: Friday, August 5, 2022 10:10 PM
> >
> > Hi Geert, Yoshihiro,
> >
> > I'm a bit stuck with the usb3 drivers for RZ/V2M.
> >
> > The RZ/V2M USB3 is very similar to R-Car Gen3, the main difference bein=
g
> > where the DRD registers are located and additional clocks, interrupts
> > and resets exposed. The DRD registers are still part of the USBP addres=
s
> > space, though they have been moved above the other USBP regs.
> >
> > There is however, one big difference. On RZ/V2M, you can only access th=
e
> > corresponding registers for whatever DRD mode has been set in the
> > DRD_CON register, PERI_CON bit. That is to say, when PERI_CON=3D1 (peri=
ph
> > mode), reading from a USBH register will cause an abort, and when
> > PERI_CON=3D0 (host mode), reading from a USBP register will cause an
> > abort.
>=20
> Thank you for asking me about this topic. I have a question:
> Can the DRD register be accessed from both PERI_CON=3D1 and 0?
Yes, that is correct.

=20
> > This makes role switching rather difficult in Linux as the usb host hub
> > code does some work in a delayed work queue, after role switch.
> >
> > I am therefore advocating that users can only enable host or peripheral
> > in DT, and role switching is not allowed. Is that reasonable?
> > How can I ensure only one driver is enabled?
> >
> > This unfortunately opens up another problem... So that the USBH driver
> > can set the DRD mode, it needs access to the USBP address space. Could
> > that be just be additional reg entry in DT for this?
> >
> > I'm not sure how to go about this, any advice appreciated!
>=20
> If the DRD register can be accessed from both PERI_CON=3D1 and 0,
> I have an idea how to handle this.
> # However, I'm not sure whether this is a correct way or not though...
>=20
> My idea:
>  - Make a new role switch driver on drivers/usb/roles/ or drivers/mfd/.
>  - No describe any xHCI and USB3 UDC nodes in DT.
>  - Describe whole USB3 registers for the role device in DT.
>    (Or add sub nodes of xHCI and USB3 UDC into the role device.)
>  - The role switch driver handles the DRD register at first.
Ok

>    And then, the driver adds xHCI or USB3 UDC device somehow.
The role switch must shut down the USBH driver so that it no longer
has the hub event work queue running.
How can we do this?

Thanks
Phil

