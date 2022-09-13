Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF7625B6BC9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Sep 2022 12:40:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231653AbiIMKkl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 13 Sep 2022 06:40:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229729AbiIMKkk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 13 Sep 2022 06:40:40 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2108.outbound.protection.outlook.com [40.107.114.108])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E50F20192;
        Tue, 13 Sep 2022 03:40:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zu8o2n81Wp73KSURmzRALQzbL8JKytraMqiJ2tja0tRGSJdkPa3siXUyJ6mGl9QZNS10EpGR5svlC1jFilNBdcmZGxRW/RiEZwnZYjmpyB2TO9Hvjy8tHlV6+1AGHq/QmRLH8p0rhNK5Q7OJtY/0gVULInFb9EN5PYMFkGX9bt81/S8urKqVFpgU3tZc+01m+6SpkwAmHAEqtvV1punDbmXTJBu3bKP7AIr6h67kfDH0nP/yVploXpTJDQ9QrgirNAo8qvpEpg/yloucUV8zCmzkMVAac55idLSn9q6KmnphAXVMIHiyQBYz0nQhHfsN/mdYKy/1lJ97iZJ7S5GOGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eNaopnhIocTWdfztPgdouy7sDuMRq1bV64zyBUt8o8M=;
 b=McK2bwf3jhhBq2DU+lh0+k3ULOYxSawzwJrBa/9jd2fmtB2y7imwcJwAPJN3klHcckF4oa4HfCnT3JpN4mFyhY6MPE31V6dKu64MrdnQrFHylPGFpZI/v42xPUXQPLlB9CYleV7EhKzbwJGWVQFd5FmDG4x6pMHRpQR3EYQgPdtUcX6dlpQsQKKIj1xA0dXPCt9An3TV3OrSIuEw+hIUvRku/3brDXEDUoYW0/TkpQp66AR3jZbEMHWEYIwtFeitSsKbWi1LQMYMZ1oAnI3jTdzlkd1yqAryfMf8V9KuhzhMebhjqtHTmpWNHWOB/zkE2QTAMfQI4Bg0XlpkeRAUdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eNaopnhIocTWdfztPgdouy7sDuMRq1bV64zyBUt8o8M=;
 b=BmrqpN9bLaWU4JF+nmgW7lG/B395CDd7sdxrVHCrMPK1nW4f7RISPWLOnaLCGZbJ7qEkkYfPXkgDc2V/K2+U51qpXonU1TCS8Ee871KilMSPekE7ii3vdivBUF4cFxQ2lwzMjlhFRY1wQv1Y5sxatpWSdpozPVFApXYDvM47cg4=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYBPR01MB5549.jpnprd01.prod.outlook.com (2603:1096:404:8020::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.12; Tue, 13 Sep
 2022 10:40:37 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c502:8f9f:ec5e:8e3f]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c502:8f9f:ec5e:8e3f%3]) with mapi id 15.20.5612.022; Tue, 13 Sep 2022
 10:40:37 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
CC:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Subject: RE: [PATCH] clk: renesas: r9a07g044: Fix 533MHz PLL2/3 clock
 multiplier and divider values
Thread-Topic: [PATCH] clk: renesas: r9a07g044: Fix 533MHz PLL2/3 clock
 multiplier and divider values
Thread-Index: AQHYx00SZzRJbu1f4Een84uOmb7F263dDxQAgAABfCCAAArXgIAABpuAgAAGFLCAAALogIAAAMqA
Date:   Tue, 13 Sep 2022 10:40:37 +0000
Message-ID: <OS0PR01MB5922DA0589EE8678C47B7FB386479@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220913084434.1191619-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdX9PCdTFsY_H6dqPVFs82HGqWzydhBaFNmL3_YR6vvWzQ@mail.gmail.com>
 <OS0PR01MB5922F5F3302A3AF05820229186479@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdXdAt5kfgPbyY-ragOL=abS_GUg4U_E1ovA3Ps0sZqHhg@mail.gmail.com>
 <YyBV1VDQZkyZ6Sq+@shikoro>
 <OS0PR01MB5922B00508A1F6F1B409AE2A86479@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <YyBdX8Bsp9cnuZ9e@shikoro>
In-Reply-To: <YyBdX8Bsp9cnuZ9e@shikoro>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYBPR01MB5549:EE_
x-ms-office365-filtering-correlation-id: ecaa28d2-2bd6-4c98-dd26-08da95746550
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 96hbBfJQCPqNUA5lzCeXsJeeno5RVCuQBIncXFMPGSJxJ5g8Y9pTngnu9gPTmTB8BNyjnXRmLVUZccpDYI/j2BP4lpKJxYiJW9+xz3YtHsczWhIZj0bBQpqQDPOPL3u9wU2TNeP3qo4sPPsO1LfPW8FH1gfu4rh63pGtIKNDW9VWgNKI+ZR8ZPxsbKpotcjXO1MP3eK2GYFdF3cEyTjPKQwy7h8ateYl5xN660cYwbMzvC15FnaYR8FmkcwDRQa4uaQB7x7EqbEsiUZL/D70YhNcEPHnMY2j7J+jw3vy22FKdfH6NQCHnXmjXyNkj4X3PeG2mQXx97mT+XP3oxEmBpZh2bjRx9U5s6cgBeJ5gbSEmCWUUkXtCC3kUk+CxL7WKpIt0Llx5xpmb1TQeIHYDYJ0JPI0/F5XBkmD3WaCfGwzPqINwRpJi+8j+0G1nAk6NAQS3fOAsZdXzZE7CJXNtzvbbBr6rpmk6zZnCXKx4a+/NbGxKaoJEDfw4F78AgxlROLpk2DvL+0CynkrXtmzZRVj7alKgVWJhRGbEkEqcQRzrCO79JJV/42ztVW0Zx2W54WXC0upoC/L65vzVKkJB8aPPK7ZtKtmoXma8uWXWcMuUzAz3OogI8RWj9IrwOOAU6C7gg4zvz1jP2hJEDEe2Fsh2LbzzEmqT9tDEj8kNQ0DGeAG0aw2MNuBdFQNRSKKOuVr++qCt3MGf1GefoimHffo4ctAV/abY+r7/Mrt72TRDP2w4LtvK2pxtlvtxPqVK4I/Ij6TbwgZpSkgx0AnYw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(366004)(346002)(376002)(39860400002)(451199015)(76116006)(9686003)(122000001)(8936002)(54906003)(8676002)(6506007)(33656002)(107886003)(5660300002)(4744005)(66946007)(478600001)(66476007)(66556008)(66446008)(55016003)(7696005)(71200400001)(4326008)(52536014)(83380400001)(186003)(26005)(41300700001)(316002)(86362001)(38070700005)(64756008)(38100700002)(2906002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ALrocQfozd5WbSO9l6kw7ubaiHuQfjyG1cWGX1x4ckavzdXFvYBhKrvMqqVl?=
 =?us-ascii?Q?OsW6Dq6qIMJB/zc/MZaaThX4XE9iOgwxa5R9YcAYbhR2zAEZj1IaPNauQJht?=
 =?us-ascii?Q?dc+wjZAQrnewRbvfbU5np/FUjvid/MehmuH/WM312pqoFAbEIzABnJNiA3Ef?=
 =?us-ascii?Q?cu/9pk0gAyzuQPBJ/BLfguSE+0NnqNJwzduHFZNtiiNmgyJAoF8uIMqauUka?=
 =?us-ascii?Q?H+NBj/KPUikU/whX+w/e9JKrgqjNj88AGoQFzThpiljpTYZeKVgkdgjHHwHf?=
 =?us-ascii?Q?1TBt24wG8AyQ6jRx7ainQ8UHyXRD3zdWa2UMwq+oNtI437J5GKOeSKAjuOG7?=
 =?us-ascii?Q?58lZF80gLLJqdJAt4qaCRSeTlimA1ZmDDF1Cci9CEMTDoe/grxzaglN0X0cl?=
 =?us-ascii?Q?dmeRQjLkpWofmNBY3Y/E+aDpD32849ATvV71ZROdPTuxN0WYQ1aN0MCoAOgy?=
 =?us-ascii?Q?QBinxCAwY2ULST2cqXw2IZRxVPAE727Hl+B+6KCMxoyKidftMKxxGsz+fZes?=
 =?us-ascii?Q?lD8INp4xJ8uWYEhFL6vU0W0aRvoTX7p8Gdzl0+PNvI1SbaqL1wLMH71DsIey?=
 =?us-ascii?Q?93awqyxyCCWSrp/hKL4TTwsTaKF4sauIRTKVbPCWNMlOpx1BamJqRF7tR7rF?=
 =?us-ascii?Q?dCBTSxwPLeE5U6fboe638TEzjNnFUyfKO/GSW6+ZBFSGMRsxX0hqK8Q1gJvR?=
 =?us-ascii?Q?GddAYJ+g8JMmR0iKt7oVFCrzsdh75TRRa9bXbrGuSBVrvbvq7AJY9KMUibzd?=
 =?us-ascii?Q?DXO8ZkqUlmiVZt4hCcSoiXJrUlfCdW/wy5grJ+cD+ZqOiPJZJfNj0L29tucs?=
 =?us-ascii?Q?lvBngchlirccqZhbyp3ayj4TD2l+qKQ8/exJlE6eMuwFKCbKD97knOEU9OaQ?=
 =?us-ascii?Q?euxc2bB1Z8KQ1wx5f8Kl0Gw8wGIZX++wNVA2MMtutecZhh5livZtLhg4pakb?=
 =?us-ascii?Q?6ZaILi7E0CR/pdAkeFmQ1kiR/ip5CCQk0zQy5YxztigEbuUFyeHcBUfOlzYq?=
 =?us-ascii?Q?kh7Yl1rOszxvC1M5vCrnt+3Bp/fuMJoa01quxX4YIU31bvBOtTlwfUdhorNG?=
 =?us-ascii?Q?Y/8eslLrXfRvIuExWZYfdwuK27YZPHY+U+HCk7VwTmQ0URBC4sfk6lD9w4vF?=
 =?us-ascii?Q?dbCzAOyUfLJvmeHzW8QI9Z+M5emN2nhK9nXxWaaEjLmLS43hSeoUeHiEzW/j?=
 =?us-ascii?Q?IkvHJLX5ipIRy8UwzV+s/34IBcyNWcNGGYtzN8mncNijc4H5soWJIagD6nAH?=
 =?us-ascii?Q?g6v9PEFtJDYmOf5ijsrFDmujd1nwJH1Ag1NghxacWaXjLiqIFJqXi4pQerl4?=
 =?us-ascii?Q?B/HRpJYTj93ytq2cOrEB8sZ+hWWjinW8mQ7FjmsOhJGTgFPMvVsSqN24Flhf?=
 =?us-ascii?Q?qOViaEoNYLmWTLPEmf1OxUkMci5cd0NfVOxsPCAnf4L8u0+hOtNjid4pGQqP?=
 =?us-ascii?Q?4K276QkBxu2dybWnJd0fPW33jVhMlqizYln6CRVaNHX52CdbscMXdpdGy4H1?=
 =?us-ascii?Q?LFxgqZMBXTPHuDstpkWPAY9WG9oQ3rag7Cdy1PHkqY7JwftzRz3a/ZTspGhr?=
 =?us-ascii?Q?qa997MFTpW8O39yRFGwnlA7mamyvRI7i4GuXRC5I?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ecaa28d2-2bd6-4c98-dd26-08da95746550
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Sep 2022 10:40:37.4264
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: h5BgAtrlVkgylgUQrCrGFy3qxZ2mjSiL9MmBwiAUw0hBiACtFfOSCFA4r0j32gFH2dQgfbihFWNBiOPJIdHqr5fw7OAesmXMXx+xUIRygSA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYBPR01MB5549
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

> Subject: Re: [PATCH] clk: renesas: r9a07g044: Fix 533MHz PLL2/3 clock
> multiplier and divider values
>=20
>=20
> > > > Perhaps the "if (freq > (ccccc))" check in
> > > > renesas_sdhi_clk_update() can be slightly relaxed, so it allows
> > > > e.g. a 0.1% (or 1/1024th?) higher clock rate than requested?
> > >
> > > Yes, we can do that.
> ...
> > This is how it ended up in selecting 400MHz clk.
>=20
> May I ask you to implement it? You have the HW to check which margin is
> actually needed.

Sure will do.

Cheers,
Biju

