Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D2B216388EE
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Nov 2022 12:40:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229646AbiKYLkz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 25 Nov 2022 06:40:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229491AbiKYLky (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 25 Nov 2022 06:40:54 -0500
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2118.outbound.protection.outlook.com [40.107.113.118])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A8FA2C7
        for <linux-renesas-soc@vger.kernel.org>; Fri, 25 Nov 2022 03:40:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bpaaF67vNBJYYvqDxR0zc5O1DHLKvR8/GEE4DZF5TJVBDSlcXU1w8w5XluHQD1/Dnm6NkhmbRKjtlYzy1vCr8jNMSZNPi4Fxyvasyx/G7aPMqRMR2co+k3dwEL1jLGUlqevjDhdrYJ7yfrHZbjZW4kOUQGAB6RHnwjxciFaFfO9kpH91cyqvK8lwEnOi54U2xPT1bvDrri87aQooZmStoVdRiTJ4IaBZjwqvO7cjgW5uw3LilABKIz+U9HefN1BV0yw9X2S03lXIepzV8vPC8Udj2bHbjsh05UNQv1PIODVQe5tm9n+Ugib8Gw3FtjAsnz2HPCb4KLQ23I9ucFg/4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yi8QYQkAJ6zFrS3FLIBnGpI/HOnmz0ktHzMjb/sxVzo=;
 b=D8MFBl9dxu+Ho1VYCqRDe4JYyohSup5lauM2ZF5Gqm327CIw5YRGSRSSsbicLgXDSlpgjdwk1TV94267up6qkBuI6RD8Uwj5RmfClZNeyKytZe6WC2VxpqJdQEYP90g9AonvlXo9qwwR02csh1ElP6WgX3xa7oZ+xeMh/pkK5j3ZwZlxDdjKLN6n1dPj5ZsgF72xNk0tJr/IWfSCdpionQp6tF851E2EkvxLGI19X6VtsjXN+k9W16NNF8srintY7jP8IfgeHNGtdDeMzeuoDy+u5s4Yd6foANx4o3N5Pczlg6C5pQj7ypiDYk/Jk3fymbFqLPu4CWKJu5MB0QfglA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yi8QYQkAJ6zFrS3FLIBnGpI/HOnmz0ktHzMjb/sxVzo=;
 b=i+Tiz3PcLmJvsY6DYoawSkKhpCGZmbxM+DThsP8qaQa3e6h+9s8W1jlGu4ZjF8FK5ckmmLMaZjLiqrI4349W5jxbGIGrE9HibbfSGGE9Oyi2nrWkkJ1ciuqCDhTBQb1eSv1K/rIfs8rurO3DJml9bUAG35wVrZWKHqdjhCFqq/s=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS0PR01MB5587.jpnprd01.prod.outlook.com (2603:1096:604:b9::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.20; Fri, 25 Nov
 2022 11:40:49 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::2cfb:38d2:d52e:c8a3]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::2cfb:38d2:d52e:c8a3%5]) with mapi id 15.20.5857.020; Fri, 25 Nov 2022
 11:40:48 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: RE: Regarding clock event driver testing
Thread-Topic: Regarding clock event driver testing
Thread-Index: AdkArJrKvDyZvzK5SrWcU5XSVDoKPQADzR0AAAGo0IA=
Date:   Fri, 25 Nov 2022 11:40:48 +0000
Message-ID: <OS0PR01MB5922C1D7276EFEEA753EA734860E9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <OS0PR01MB5922C23B892D938AD1675C9C860E9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <Y4CeFrBzfUkNiV3d@ninjato>
In-Reply-To: <Y4CeFrBzfUkNiV3d@ninjato>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|OS0PR01MB5587:EE_
x-ms-office365-filtering-correlation-id: 72bc7f3b-8959-4558-04d4-08daced9e610
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lcAD1I7NW4dohxAH6mn3GZN1WOugFUPyF0s6Z7JVXJQf3vWq1htS8NbmZoPw2Mos+3xbvSCaBYLcm/CnOpXjdlFor1jDwf+g5hgFImkkK08vQLDKGTIaUe1b23s1EYFTu7f/rJ31g3NHZzN17h7hbpgdNTuG0xFuakLPZWpVFI+saHi5l6P+2FXiAqZbLWBB98pofmKp2Z4YSD+D1CPRbHl2l+3GACsNMDNi12Wz0nJaGdzs0FYExnOD5qIty85V6d/DQrL3IpUKfFcEQrwC2dqm8N1GlC+sEcfYDGlcMBL8xWzQHHmOF/rgwpdlQ8jPt2UmA9o/4xxGOHUoGzfO+gQ1SJCDQ8wP3uY8UQniiKnIz0RZlFYuwpJtVcMRUbOONWJL8caED4q1amZtYevAOs+Bizy6skpVgURlPpDKk/jGfMC7qF90Gq0cYOU4TM3OXISGR3laVc2cvHqoeLjckVGoUmrLCnrs0Epjg+CADaqDsS0HWrbsLK/YLp1UTPlLgi306XR3wyW9qhM/8TUnsFBQ53d7BUU/H0Evrr38SgmVWXKQQpihuygSfx9LDw9wJyh6i+7yHsGYTAyCAk9cDea6DyS0DuPk5Q+f4gpe5XhgXtoeANlyZ5Tst39i64BZkp/Qfrz5YlWjCCHS4TFEz6aJ0calKqOBcY3RXpCYI5DupYJQEYCgiunMNl/wWlUDFWyzktSMOa5rjwDrTq0IQghvQN714h1oU0bEOJe/m+E=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(376002)(136003)(396003)(366004)(346002)(451199015)(8936002)(5660300002)(66946007)(66556008)(66446008)(8676002)(4326008)(52536014)(76116006)(2906002)(41300700001)(64756008)(66476007)(54906003)(38100700002)(122000001)(7696005)(6506007)(33656002)(316002)(186003)(478600001)(966005)(9686003)(26005)(71200400001)(83380400001)(38070700005)(86362001)(55016003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?fKbG4CEFtouFF+pZVHBZngE7HTiCJjBMe8CCritR1aJXzUJ5sNvQIbW7Xi18?=
 =?us-ascii?Q?RU+R1tji6MP1NAsQTS4zMlZoALMgKWHyxkcCCkUSloQpAihZYsjbeVyDPPvD?=
 =?us-ascii?Q?qqcDpZzydbyvprp/iyzYd0nMQNuXOVUbJvi5PJ/s9n4fhvQOMqzCnbK3GV6S?=
 =?us-ascii?Q?qaXHhonTRbLtZENl+ll3rqIYX9abghSnca7tjZmPnPvLMUuEOnyVmOIvOsIj?=
 =?us-ascii?Q?taspU047JmjTStAc7dkip09vHfnGwgKlafmz1bwy61nDihsQKh65LHR7QaIo?=
 =?us-ascii?Q?DvSB98FuBkwnYAkUd3Wee0reUEBKX6z74MrqjjXm5YeH6FEQzHn/F1D0KyTV?=
 =?us-ascii?Q?hRIfwaS1+xcmXdSTNAf+BMC72TaklR628/LqlLujvvk9u51/Rp0QW9VQSQNU?=
 =?us-ascii?Q?chAqnebmw7TRDx/qmnDQsQDxcKJnH/QigG1z1k6f12URz/JLCwS4ja5pOou1?=
 =?us-ascii?Q?NvCFy+N1kL1fu2KAtOpmXvSVY61XmkqXM5OHaZ4dav3LqQYBJrpkrqlVJ16Q?=
 =?us-ascii?Q?ggMY6f23/WCjHzy6mk7PyqXzAkYHqxkjVPSbv8jeGXqJfaFj3yLd4WhVkus8?=
 =?us-ascii?Q?kzA8Zlw4RM5+T8zjdla14rSQPDlNndb9jw7y8TnRx0r67u2GOuzZgq2kp3zc?=
 =?us-ascii?Q?owFnSVLEAKi0K6qFie0nUV8kHp6YaN0/pwoq9izwNhPIkc7zJNq9vGH2a2WS?=
 =?us-ascii?Q?7MMJqX5Qi2DhhKVB8LKLqpp8ZtyXjPciiQ3WHiVejtwd+NwEOBa/ti/vkpaL?=
 =?us-ascii?Q?lLGDVjMeDQKJJzN2ITzMnWqsgEEx7DxxbT2BUQi831f38jOkjDHOsbEBDpuV?=
 =?us-ascii?Q?63p06DsJywzBCQoQZcwJb5t3/jLIq1zNti8SFQ2XlXtGBuNvQ4q1Hc5+lUdW?=
 =?us-ascii?Q?6C0WipkK/GgWZEyjikY4+iKQaB00cDHymvEJRKlyxTU3dQ6Iq0BTO1BTaPKv?=
 =?us-ascii?Q?0vY17jpikH5jxEhp6mc0dj/6+S5OgQ2TSW+7GisvjRldk1NaTcI2HwjWvf/g?=
 =?us-ascii?Q?Wfu1ry7MGbRPYuvDY96yUK2Ku9TffD65WKYLWv7eSy8LiS08IXsnLkqfNRli?=
 =?us-ascii?Q?UnQ/MAFkLoLoSCY42PnlPUmPaQ2w7qtrMU3K7m5YU9HDgUp8A41ri7oPaBmu?=
 =?us-ascii?Q?gJY8V9x534EEe0hF7fyJc6cSdOoCf1q6+hwmrURkeBTl0S2cL84V6XuKwyKb?=
 =?us-ascii?Q?NXVJMVZkyatj5KXEx+PoNjmVPeS8bIo1I3jJSHGw1VBkBH0eztae9Qr8tywH?=
 =?us-ascii?Q?8dRyOokTqr5WviRf0bEWz47UqtqIVBuT4SGIvkKrXMKSj7rQ9ZIx0Up5tuV3?=
 =?us-ascii?Q?hvrdWVeR+iOss1ExZqntjsuaKkpSa/I09UIj/blUgeI47wuILF97GOPtYK9g?=
 =?us-ascii?Q?1FB6OO3TyTtnX5mSwrJ8HTSsGiRVsWRGCH+k3M8gCbMN4Xz+UCEQ3+cKA/Zf?=
 =?us-ascii?Q?A0YvHlSfnbYs7jxnETVv6VGCOC6QPcHWXVnGmHkCOUfv/ZJlLEAmDLaOwWo9?=
 =?us-ascii?Q?cFSdTgDX10Bd+ype74hiH4nkK6eg8NnPJ85x9k1jG7GX4iB+spey8u5c137Y?=
 =?us-ascii?Q?PHZgL64hPbN5rnS00Z6SNdv0EHpc1VO3E9GTxSw2M7aRj3t+Ch8E21+AcS6i?=
 =?us-ascii?Q?sw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72bc7f3b-8959-4558-04d4-08daced9e610
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2022 11:40:48.8755
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RlZ89F9M1t+E67IoUtHgK/dMOxf6lydIhEPzyaNpm+8ngIZ+M4/aYv/QDEOe0aP344xbcgUNJWnasU4iit2Zvr2Iu8XQ+L9K/LZhhUsI5V0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5587
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

Thanks for the response. I will check.

Meantime, I got a way to test clock event device.
Hacked the driver to make the channel as clock event device
rather than architectural timer.

+       ced->rating =3D 500;

Cheers,
Biju

>; Geert Uytterhoeven
> <geert+renesas@glider.be>
> Subject: Re: Regarding clock event driver testing
>=20
> Hi Biju,
>=20
> > On RZ/V2M, we have 16 timer channels. First channel we planned to use
> > it as clock source And remaining 15 channels as clock event devices. I
> > used clocksource-switch to verify Clocksource functionality. But
> currently I do not know how to test the clock event?
>=20
> I would love to help, but sadly I can't. CMT/TMU haven't been changed in
> ages. So, when I upstream them for new SoCs, I test basic/slightly
> advanced functionality with 'clocksource-switch' and assume the rest has
> been tested before. I didn't test clocksource events. Magnus seems to
> have started something, but AFAIU it does the same as your devmem tests:
>=20
> https://patchwork.kernel.org/project/linux-renesas-
> soc/list/?series=3D&submitter=3D19&state=3D*&q=3Dcmt&archive=3D&delegate=
=3D
>=20
> Sorry I can't be of more help.
>=20
>    Wolfram

