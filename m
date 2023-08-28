Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0BBC778AEF8
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Aug 2023 13:37:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230323AbjH1LhC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 28 Aug 2023 07:37:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232521AbjH1LhA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 28 Aug 2023 07:37:00 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2134.outbound.protection.outlook.com [40.107.114.134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F39EFE7
        for <linux-renesas-soc@vger.kernel.org>; Mon, 28 Aug 2023 04:36:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OmGfgZq+caTef39EXmmnrrooQbIOX9HvEggusvEiUSI8snA0PGj5Twd/uy0kkr+IR3GIX+8fD0LWLGfGDfdhzMKViS9zJYRGS9BeZMWs6tIVJhqG7JI7rUglwzxdXpKewKADp2sNWFWAsKP8RQZoOAvSyuLaJpI5FonOnoCPFwDbINBj042UDOAzRXEaYrG4GvwMv7bH2FdXwG0rhHiT0c1PZhZpTuWq3J/tKjQuP3evYjVBiZyeiGIdZz6ceYotRbNmXdwe5PtXl5cAPWxWV7A1hS6HmbZjzwChQJNRBgxczcBVmjTCWcI5NLZFOdRW2LZQwKGsoHO1vHB+4x1HBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/RjKcIefNEqPJnD3/TJX8LAqBg1BHqfRxqGBeeMlPWY=;
 b=NZrwK3OrcjF8MDspF21Cs65duU9bZv7SUy+metkXj8KOY3+/4JIoewkjemjBPm7oPFbzdilAFk4sxqt5XsbF9KBfNo6FICWmiJ2U7AaloBtrsxMQQiQI512/nIqPywXW7Vxo1OYkwB3XPNyh76f5UGEJPnKLKJ2Dwsci41HurQP/V8wEwRhg2G6yTHSlgwxkYF7BXruEPYvfWOQTBPNTsXdXXPFUxGTvWObaJ4exmd43yMDszud9TTqUdOKBL7kb2iQB132ht5t0VgUUcvC/a1lyLhDateJr78nmLZKooDhimsxAQH6+Vbfu9eY/5E6cKtWumQ8QyzLmEzJSqlJHkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/RjKcIefNEqPJnD3/TJX8LAqBg1BHqfRxqGBeeMlPWY=;
 b=B8M4aoeWPq7LGCZoX394NocpRiogmCdUl62nUTGc+FGiyCPH5WteZ9DqLV0u2IzIfAKy13NtCo2VUtXpWo2kqZdq5ykks0mVQmdijyhkSKCRLWzCjvc/xH9KKcux6le/3spMpNcTuEaNW/Y7E7xqbwT+Bwwy7AFosHWDz5LntRg=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TY3PR01MB10189.jpnprd01.prod.outlook.com (2603:1096:400:1da::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Mon, 28 Aug
 2023 11:36:54 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::9d23:32f5:9325:3706]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::9d23:32f5:9325:3706%4]) with mapi id 15.20.6699.034; Mon, 28 Aug 2023
 11:36:54 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC:     Lee Jones <lee@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] mfd: max77541: Simplify probe()
Thread-Topic: [PATCH] mfd: max77541: Simplify probe()
Thread-Index: AQHZ1/0naK4s+y9ZQESRYhHg5pvjla//k1CAgAADc9A=
Date:   Mon, 28 Aug 2023 11:36:54 +0000
Message-ID: <OS0PR01MB592265EAF67FDF987675630A86E0A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230826091020.45621-1-biju.das.jz@bp.renesas.com>
 <ZOyC++vjeg4TGCpx@smile.fi.intel.com>
In-Reply-To: <ZOyC++vjeg4TGCpx@smile.fi.intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TY3PR01MB10189:EE_
x-ms-office365-filtering-correlation-id: cc513ec4-a93f-4adb-d943-08dba7bb142c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VTRy+oufrLWRvAqnytNZpXEiHPmiwWs6k0pMwE1M1Ya6DhTv3zlvuaCnB7kiLn6gPIa2xZ7UAMZIxx+UNu/9MtvhO/5PbCKVcAHivC/gWhr0mRJy2DW22+Riw/Co8k9U3LmEfb7ZJAB8AqJ6DC4iR5IzKxov6FJhqqL7y0thqkwm48aSGaZ5vB6ZeA7n/XDkLtmY/xQ9i261MDPAJ/8qUOm3RunipcgONCIpnKYTsJEFGZWOCjG1LW8fvVHPjAvO2MBgjbEjdJABFS1l+I7aT9ECW84TQKVgp2ec4HyukXnL4hrwihHml57hssnsd+V1rQD8Zaz0bmyI1I3d6G1Cr4+R9EiJLP1vjyh6SkJpOAGszFbmpaCgR3TusC07aCOR2yMtT41KBR87JYOP38GgOgwJWodvcpZ/M/rM248u0XBbEY5UVzPxt/49J33VdG6361LSd+hxJ26/vPVqyGHkLXx8JLNb6BPPaCcnnEfF/QYIuW3sz3UbpiiP940C5420flUKWK4Lim0Z6LL9cS05V2c1HjaIXYyZNSVRH1ZAw8smnBlJYZNUzX9S3QmmB9s+NM0+fkK/qn0E/DALWz5WvpZz7aTw122YToYaZcUjqN2fzuWVW4Ym4SkzRqT4wfD5
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(346002)(366004)(39860400002)(396003)(186009)(1800799009)(451199024)(41300700001)(122000001)(38100700002)(38070700005)(86362001)(478600001)(71200400001)(26005)(9686003)(7696005)(6506007)(4744005)(55016003)(76116006)(66556008)(54906003)(66446008)(6916009)(316002)(2906002)(66946007)(66476007)(33656002)(64756008)(5660300002)(8676002)(8936002)(4326008)(52536014);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?P9OabWFc5181U+M9+iHdOtVoRNJWt9kunlBWgEswYfvEFZu+ttN+M5FBjo1H?=
 =?us-ascii?Q?dOP4ztaqw50OB7Y38Cd3g9bMegouMarykWcq4vhIH3JUMVhi1W+uHvrNER4E?=
 =?us-ascii?Q?70/zYLwKf+3nL+5Zq95JWGt4YHbPNfpxjkaNmGpsg7wa28yA8iuZJTfoBgs9?=
 =?us-ascii?Q?84ZckBAsXFozCDgoOOOPJbc5LEi/1xF6dZnRxHm/CvtBVT/29LpBoJrKeAwd?=
 =?us-ascii?Q?j77KdCw2QFhOmcxmuWjgI5xer4KAgEj9OGESUK67H9eXQSv0wib+GIEFORn2?=
 =?us-ascii?Q?t9LR4gbC6f/fNtq7aER+9lofR4WxPdL3D0n915nbjoa1VYjQyEsnGLk3r5u9?=
 =?us-ascii?Q?48KiFPiDDRR91rpUCnBOOyHdk2s7xAkIR7eBPtp1FoQKcaOCv5z3xB8L/ky7?=
 =?us-ascii?Q?DeRICglRRk1adl2d4npEtrw0kQ91y4xR3e6dHs+jdc+SA8TfSnmAsEBz2bXq?=
 =?us-ascii?Q?2oseZoXHvPEPFBY6HVz6r1jKEQLJJGIDT0hJ8qm/PAA/F07s4Ax5fQv+h6V0?=
 =?us-ascii?Q?S0h+p0v2OYculAMfFbsrjGsa2EBbKUKvE5iDUWSMj9qCFYz0Uxeacfdq8tW/?=
 =?us-ascii?Q?sDUSB8X1nAvzhoBfZInfcpS3YLbcTMmycDvRViy8AiD28ovGU9i/q+2hFckq?=
 =?us-ascii?Q?b29ZR1gR80xL7//3AjYeeXzU+aX3fVHgArR3/A3rv7swKvZz+6495W9aiA7g?=
 =?us-ascii?Q?TbUI+wfHG3Zn4w+EGMk6wRmbt1qmHpTuYUH+kLViyVS8TR9OawocVndIfOZF?=
 =?us-ascii?Q?PUeS0xEwSUOV4s3QvYuPdpL4t/g5LCUeiVgEUJ9rdqnUraJTEe+aTf149YNg?=
 =?us-ascii?Q?3McUDKLuI2WFb5CrB5AYfqPhK4gmR5AFt/I8JSzqjwEal7tCaE/VHPRJjZO1?=
 =?us-ascii?Q?/bP9+NS39JwDa+fdUQ2Yt4nzNfckWYzoWWTbRtEzZQYSBjsxLoVsiO5gxWrz?=
 =?us-ascii?Q?gm4DoiS9LqTPPCzYwbWZYKCghCQhBYWUHdtlJkueFAT7znkBRwWd2tEqkj+W?=
 =?us-ascii?Q?CrZxudsnrZaf8PPGJOJq2mSPJ1IAwNRT+JH0VI2EzDOLQWUz7w69wi7cfTyw?=
 =?us-ascii?Q?914QdR2gsvbLB+YbfbyT87xsWUrhYA7K4Fjbdst1NJLRDwg0xHo5JOLUu1i/?=
 =?us-ascii?Q?ExhGLQec9WB5iY7/ve45rt+9rkYR8/fviIAE0KuJk/ZTpFnETSipubmsG4ak?=
 =?us-ascii?Q?KePEJGEp/IkfEFNSK5ThPBTuvm8wVY+Bz7bCTrsgJtHsA/rka2pNeltqbRCb?=
 =?us-ascii?Q?GJ3Wc6ptrvEFFFM/M27SU+Rieujtu8JMDMCOs+QCq5H1Sab59E7b3wU8y065?=
 =?us-ascii?Q?uMtxHNCVTXqfA2k/rGppKYIs35oBgxITE3UWdV9MhSOKJpparB028BC67W23?=
 =?us-ascii?Q?sZegCdAQ2+nl6Fhfug6djE1dA3BK5wRlM+o84RfHXBSpBMZ3sjDbfqUW/ezb?=
 =?us-ascii?Q?tipIlWd7ZLFCfOzax02yWglyASRbEzGCu9z6oMB4cz/fwd8pD+yTfFvZBF3K?=
 =?us-ascii?Q?qI1RENg/H98/xx8gfTLEyoYApuZRao9uUTdk4iTq9dSIiWYCO8j8cExzcqws?=
 =?us-ascii?Q?gUvRIQrnp2FKMaYJ448uVGFzgrCGZBzH1UfGsxF3CZY8rRRxY/7awtiJvg6d?=
 =?us-ascii?Q?tg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc513ec4-a93f-4adb-d943-08dba7bb142c
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2023 11:36:54.2128
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3h3/gqvV8gwjgV0phZv1+CqyrC478qbwaZ+gxnv5ViWu0WaFYCypy5jJHqqttIOBtliUOE4XTD4Ojp+lFu/96auY/TBuZmHA7jWWHbCFHwk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB10189
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Andy Shevchenko,

> Subject: Re: [PATCH] mfd: max77541: Simplify probe()
>=20
> On Sat, Aug 26, 2023 at 10:10:20AM +0100, Biju Das wrote:
> > Simplify probe() by replacing device_get_match_data() and ID lookup
> > for retrieving match data by i2c_get_match_data().
> >
> > While at it, drop leading commas from OF table.
>=20
> ...
>=20
> > -		return -EINVAL;
> > +		return -ENODEV;
>=20
> Why?

If I remember correctly, previously you mentioned to return -ENODEV
for non-match. I will return -EINVAL.

Cheers,
Biju
