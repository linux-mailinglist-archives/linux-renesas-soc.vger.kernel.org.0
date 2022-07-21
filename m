Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EBA4257C219
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Jul 2022 04:09:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229515AbiGUCJJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 20 Jul 2022 22:09:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231543AbiGUCJG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 20 Jul 2022 22:09:06 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2090.outbound.protection.outlook.com [40.107.114.90])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E20EE255A0;
        Wed, 20 Jul 2022 19:09:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k/YezJm0LZpDGqkzaPqW3wm1z7zzqP+SItUldHwJcgjlVRH63WLFcoF+Q/bO2r0Se/JCPlkL+mJdJaL+hIGeZaLkVblh9SVDBzhtDhImOcUiGk1OY5BWssbbCUTTouiNQO6aN5bky88Cp14P9W/GX74nDWJsOjCPglrMVEFMDghTgohdYrGjwRHizauqzSwgrqd4OdpDex28YETF2JLx/ABdKzRSTWVJAASfJfvlYMwLByo4RXl5TuJZYQPwTu5+/lP+8CBiOuGMTL/wzNaEsRiGTSPc6sAlHF8wboeU5irO69VNIYuj0czngp9Jj5DVDjTbDhzD3lFvlCia0JO7JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0+zNu/8AHsBkswhcLmSdCW9XQoNu60ByvSQFviqlrj4=;
 b=km32u2qnOozgT6dXI0i8FiC6kbKc41Q7Xk2z9dOlQr64oJ410LHIgrrJqVmIP1hz9ryF64jmLgALP7ABM3IJVo2Ni9zzOOo38daXMNyq4uQAabtZ7sHB+IMGvrEL79OJ70UjqGVdZ45ODAZuysyyOpe7Wlzs6CFe0wB55PRNR7m7hlCuuq/EKC83rLXRiZ78yzdlYV7v4P28aD3Z7gWCVe9I1mdxyM/Tf9rP0wHkUcaTZqleoaSfT8Dq96Jy4uhsweLE0NGYfKHq3rHgHDt5kZjikr5HkGA5pnWyu0LWhgYK+O1D86ODPL0tE1j0qh8jhFRVUmxxqKVHo184zc5DCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0+zNu/8AHsBkswhcLmSdCW9XQoNu60ByvSQFviqlrj4=;
 b=XB9hvJyA6XyT1Jxgs57ehl5vkpLVNPHW+XytHP5O4MwJ0ymvhu3KRJ8Z/s/JfhqMGxm05jXJHxUBSpcPMvFLYYgnvnJeEJelf3jmCS1NUFsv1XQFPgOBnNciSIzSPz4hrVv4rpsKFtdZZmUvABieSKysBf2GBY9eJ8amuoZVy/U=
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 (2603:1096:404:8028::13) by TYCPR01MB9941.jpnprd01.prod.outlook.com
 (2603:1096:400:1d7::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Thu, 21 Jul
 2022 02:09:02 +0000
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::307d:7cc:2021:f45f]) by TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::307d:7cc:2021:f45f%7]) with mapi id 15.20.5438.024; Thu, 21 Jul 2022
 02:09:02 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Takeshi Saito <takeshi.saito.xv@renesas.com>
Subject: RE: [PATCH] mmc: renesas_sdhi: newer SoCs don't need manual tap
 correction
Thread-Topic: [PATCH] mmc: renesas_sdhi: newer SoCs don't need manual tap
 correction
Thread-Index: AQHYnApwsqzl687X+0uHVGLtjQc8UK2IFToQ
Date:   Thu, 21 Jul 2022 02:09:02 +0000
Message-ID: <TYBPR01MB534126DDAD6CF2D937E2C844D8919@TYBPR01MB5341.jpnprd01.prod.outlook.com>
References: <20220720072901.1266-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20220720072901.1266-1-wsa+renesas@sang-engineering.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5bde27fa-5053-4f24-aef6-08da6abdfb65
x-ms-traffictypediagnostic: TYCPR01MB9941:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VXspP5OE0g69jXLYnHdx+D9Ny4xryVtFbLe/K1qKr/MVe7/EqV12PtFkCltvItUWRyFs5TlLKLK8wYzWMXgXslyMTVfm7HFRxKw2up9p4f54DNvT/Sjye2lbRYbOz0HcFiflxKYw/ywz4EzlW1afCtDjmiDOuxitwrv7CPLNVatMaFRXS3YK3uNyiGEh38pmwnVz0qod87Cxsle+0VE18NOub/IXuTVpa25B/tMzTT4UIgco5aZBS/Dt/SJceSf/fGG2D9Fg95I7Vp64n5P37Fgqg1xhbd7CIDTYY9l5YED46Upci/1d/AMRm3zL3igd6+vOw30kTfHpQCrQXe4+8Z1hj1MkjXUGVmfz6qCLDTGu8B8ITePgmYaw8lg8Z6KVkBp9swdaAOmLHxwwOJo0PjQoDgqF7nO/qdamY6yyVuV/zA8562nXEpaDZblpV9AUjOuPOTfYXUZx7xp0PeXZAmQ7mrtCZ6G/QYoUyFTQWvNzkXsYaCi7AwSzRkWqzRkYAe7wag9+JNk3JRCDRTmKU+PjIaMQuoe7gy0ggMihZIDbdGMkGNztDCK7hhezwOn029QdAUiI8j5SW9nDxqUq7GkgrLWZrHUgEyC9cP03TLoZ9rjP6E68Mu3vE13H/Qo3aqv0TCZzJrbWOlwi9CUq60HzgEFeyYlLAsA51PCL1KJUF4NC897x1zHSGJVTFdI/MH1ZebLH4tRA+6Grdn0grmaHeKNPqZmdSWt9+X/DCuXUU8K4d+oDkF1LptLy9r1R3esgMU2sF4FczZH6tSxYle4+NeoAGADC6FKhLN+zueQ=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5341.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(6029001)(4636009)(136003)(396003)(39860400002)(376002)(346002)(366004)(86362001)(33656002)(122000001)(71200400001)(38100700002)(316002)(41300700001)(107886003)(478600001)(6506007)(7696005)(186003)(9686003)(110136005)(66476007)(66446008)(64756008)(66556008)(55016003)(8676002)(66946007)(8936002)(76116006)(4326008)(5660300002)(52536014)(4744005)(38070700005)(54906003)(2906002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Uv1fmUuuO5bLawALuEE1R8vgiqgczRnBi1WIyrn24AhvVdrAV87h4z5bj+Dh?=
 =?us-ascii?Q?0azFMqpAIPAbLvVnV1cFDN2i+AVLsw6wZwLP4F8q+huUBjYY/afuRDFY0Fvs?=
 =?us-ascii?Q?IE3CDqD27mYG59tCWCuy6bpfid1EHBXfSKRarRuD40y4dnwEXyXEtDhiJA4G?=
 =?us-ascii?Q?wpkuUWT1aWdfJdJeyKnr7N8RSqS25HO0Sokbq7DFdHvjs+CdmnlZX/8X4GcK?=
 =?us-ascii?Q?Lr6W1RvquSWN+qucUmEql9uPLgk2YORWdOwiw31IZOPbizR/rg/X6wqJIDFt?=
 =?us-ascii?Q?mEK9tXgXD1fWrbWU7RmNIusGY0ev3mo13+aNNuDdgHpQgoEUKaiv28bR9Vyh?=
 =?us-ascii?Q?cnHowZ5ks3kJF01U8EA3YwsXlYag08IJxkphGmP09r3jTYsNvpADCdtrKAyp?=
 =?us-ascii?Q?NwrKBmO/8jzmV2wuvpjHwMOUr+bF4X7q+loB97fvdMtXYNxoJ90JbOW+pxGP?=
 =?us-ascii?Q?DQEGYJae4bFSgt7Pd/jmpMYZYqA5oMp6F8SFVKR+cyVaZgJ5YATfmGeLKm/J?=
 =?us-ascii?Q?0W102KTawH5dkA8VzydBbwjGy/VSfuVdvCt3HagVzfoCffBASGZWuMI7lYhS?=
 =?us-ascii?Q?I300W0qQM95fNThGGHAEkdK4KhJanqA08F3jEUconQ+A0VD4ah//QGiRmwLG?=
 =?us-ascii?Q?WJ5+uQOCYF2pRnFW7ZAz+OA6xXUcF9PLe7eWX9OA/xdyjpydkG4csj6ayX2z?=
 =?us-ascii?Q?1aZAymtNgnrSXLjhD+uxC8vawBVuWiNDodoGzZHeHFJNf+NvTjA3VCjcTWqb?=
 =?us-ascii?Q?+kjO+i2bx8V90oAp0h+bLEQftdQKRgPIgqHQ1zKL0riByYkAGpys4FZRyAdR?=
 =?us-ascii?Q?6h9CsB85arut+a2Bbt+kwCbfqfx9mdWKL4/DRFyvSWsFqrC8/6ZsSsGtiU3C?=
 =?us-ascii?Q?v7+dDzEvRcY6o5kbEqvGG6OhaVqjrWOG53+STCQOKQtkLkNhkMiDgQ0fKLaQ?=
 =?us-ascii?Q?8lT/FuKZ8kWh6WgYiZ3Dcezspc2rquUT6LFqAEiK6EbLvg/xR3EHJY0IhkbM?=
 =?us-ascii?Q?+9EVoVd7sDPQFZlRFYp0IV8OZ/YmzsULzBKpI6EFoUo/4z0ZjoT5qDeO5SwT?=
 =?us-ascii?Q?xpwaisDKhZTGPU/GrEK4nIhXXbP4kg+7nyCLIDjLvR/4ipbRDAhW1AxmOYLY?=
 =?us-ascii?Q?fhByLYDZEO0UIPuu0vPD77k7eq1I6mlStKP0GQtkNUodAPGxLku/76q3YMdb?=
 =?us-ascii?Q?67hBMsX2nmOloLYg0aY5eY5qjoQ0wuJ4kONdzUQ3fvtbZKt4LMvKtKZ3NRIa?=
 =?us-ascii?Q?5YjzNGDgsPmCqgxTl+Fb3YwFrAlWs40UYtMuUAHxj1ZjAkPv7KLJ46l4h9nD?=
 =?us-ascii?Q?CqXJ6mdfWtlfKPbj2ZdWueVPwtM8GllIK5Gk0wp1xk4GCCQl/e8L7VZylu5V?=
 =?us-ascii?Q?6jLQ0DDzsdvOwqGaPOPBwSZ+UqtBeT46E+z0FpawMCldbJBmtnxoTV/HFqtw?=
 =?us-ascii?Q?8qIgWbI97fZRaKPlxmzRvmbiGvKhyAhDorHfsh0jGuBhJ0XyBEhXiUY9A03C?=
 =?us-ascii?Q?bPozh2D64cL+x6XNLGR0KskDSS+0Zi1NOtck1ppuJR40/Pn/yVXEgEQBLfEf?=
 =?us-ascii?Q?m1MFk1FqWqPgRXpCN2XVRlEmHt4wLOw2EpUH+vEY97AZtkp6oSwfDoT9aMcC?=
 =?us-ascii?Q?kaEBq5FP4EsF6hDCkz2fwNSkPmES98VT5TSFXhyO58XeftJTmy1VjlIJRQhG?=
 =?us-ascii?Q?ausYZw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5341.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bde27fa-5053-4f24-aef6-08da6abdfb65
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2022 02:09:02.5298
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: e2ab6L9iEoPOkfH6fX0qKzR6S2ZbenltE0W0gfeFrtO/66w33THheO3wtlG4diO+Pt4HjFFEHsk4lrBSRYTfnAlSMuv+yupwwMX6gaWG7Z0/lT8LWEza9LbUv+FWLxsm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9941
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram-san,

> From: Wolfram Sang, Sent: Wednesday, July 20, 2022 4:29 PM
>=20
> From: Takeshi Saito <takeshi.saito.xv@renesas.com>
>=20
> The newest Gen3 SoCs and Gen4 SoCs do not need manual tap correction
> with HS400 anymore. So, instead of checking the SDHI version, add a
> quirk flag and set manual tap correction only for affected SoCs.
>=20
> Signed-off-by: Takeshi Saito <takeshi.saito.xv@renesas.com>
> [wsa: rebased, renamed the quirk variable, removed stale comment]
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thank you for the patch! It looks good to me. And, I tested on
r8a77951-salvator-xs and r8a779f0-spider, and it worked. So,

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Tested-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

