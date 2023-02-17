Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C839F69ADB3
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Feb 2023 15:15:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229962AbjBQOPL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 Feb 2023 09:15:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229496AbjBQOPI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Feb 2023 09:15:08 -0500
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on20703.outbound.protection.outlook.com [IPv6:2a01:111:f403:7010::703])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7A3C6D7AB;
        Fri, 17 Feb 2023 06:14:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MMfPjGuXZ82gwOCE1BIxm+CIIUWTHJoNW92QD1j7GAgaWzhwrwFZdW4d5SgffN58U4bccbp2D96zRchGJGFQaqAd0jgv26MFrVTMjw+2T4rraKULjA6vi7UZ2Vh465AkadcenYDyIs7caD34Op/xW8Xg07mvzK0eFi7ShBSz5WdZhfp5Q6YnhSYw3dsB+49wIqq94gpYT6tuEuRh+qy4+r2a4qmryy3YwQ10o2JPXv4i7TnHfEcvJ5ppxFo9kxfC6B3pM5RU6JQ70kRck3KD+9PeB5S6HLFUfe3wEzByfHmE7yJ4g5OZkoA0TduGEhAttaKd00hMSXJRa4iqL9tPlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SJj4xq0YMtgGDmjrHiskM7DnzaTMWfCB1s2iwnJKfro=;
 b=AyGXG+NzqPu7y2tTjHdK+TbHn5xtqF6+rWNLNnDIEPErOZ48jnBWhNLxDjCA57s0uwIPx7TdiFSHv5GKQawXERU9e2oUlPVywG34rJHrlOXg7YSBX77U0nQLMDKqvBavAXkdY6aeMTYRqY8kWcsmmWjQHhva/KzEi13/6ybYL7DfiMXMuPTOWtRJlAehy4LHsxPT1SfrsQaWp0RnJ0cNcX3aLRkEPeq7Kq2okfkeFCNj66qfpZoDtorwbJVrt5fLSk1BMPS/9UzbNymwfbgjAKhCo71NXSE+QAzeArGuvyTgcc/G4frKmwWaK8GVjta4/pssVtpd5rRufVFWTj/38Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SJj4xq0YMtgGDmjrHiskM7DnzaTMWfCB1s2iwnJKfro=;
 b=iJSKXkb9jUumhRL1v9G38A/zDONcgmXJ+osOxWKEDCRZxo523FOA6c3K/ae8wekLwj7xdhb9TpAysp8hSPWdOCrpm0FukJmeuutdP4tb9UPcz+g7taSVH4qe6YNMc3OWaW8U6yxv0v0oO1GFbrPq7qRzKiEuR+TCxrQV9J21rOQ=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYCPR01MB11590.jpnprd01.prod.outlook.com (2603:1096:400:3b9::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.15; Fri, 17 Feb
 2023 14:14:15 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::343d:7339:78e5:a46e]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::343d:7339:78e5:a46e%8]) with mapi id 15.20.6111.013; Fri, 17 Feb 2023
 14:14:15 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Andy Shevchenko <andriy.shevchenko@intel.com>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        =?iso-8859-1?Q?Niklas_S=F6derlund?= <niklas.soderlund@ragnatech.se>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v4 1/6] serial: 8250_em: Use dev_err_probe()
Thread-Topic: [PATCH v4 1/6] serial: 8250_em: Use dev_err_probe()
Thread-Index: AQHZQsUAKkSIQYGSnEGedwNW61UBRa7TK88AgAACk0A=
Date:   Fri, 17 Feb 2023 14:14:15 +0000
Message-ID: <OS0PR01MB5922E88AFC665E18C3E1BACE86A19@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230217114255.226517-1-biju.das.jz@bp.renesas.com>
 <20230217114255.226517-2-biju.das.jz@bp.renesas.com>
 <Y++JTJwvWb5u3Wm8@smile.fi.intel.com>
In-Reply-To: <Y++JTJwvWb5u3Wm8@smile.fi.intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYCPR01MB11590:EE_
x-ms-office365-filtering-correlation-id: a92055bb-f170-40f1-b7db-08db10f1402a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yz7usNUGt5y/+kBJ2Q0U66L7WVM+qjc1uwaSf/bF7hrfX6KicsItqZfxJAwCfJXvyWiONhyI8G+NZkPUeehcJrQjOMeTlUKAzDFl08JqABFGgzqzUJ4XfYBGG9zAdNx8Z/4xadJPds1m6kIUWvmDFYHy+2lYglOOeEXlzASoo52nB6r5wZrFCgfbEqoa+UJKHf+nIy1h6wuQfoYKd+DNo6qirmHb2MRbSPKBjUsh1HksSQUL/5k/7bFPusJ0UjDADgzR+Qrqa8+WGJs43n5OrGYdIKlwFStiokZ83n/rHpyAlIui/bz4m5CZgMrnoZ7b8Z/OmDl2m3atSrSMisAcw5QkuOJCKIIZyTr2smD2jDYwRCl1lTt7w8FcM0vh8LPnNol409U8VN5wz7kJcIBw4RuCueyRXRo1xMvzGa2zCg+Z4Ftwu+rLAR44JniOqkOXa1q5JWYju4qdl+lepgVVM5JAvTIdqHTibmj+Z/TUvK7T15/h/rWceISOJPPP9xzmQG0HSCGa6DXogk12QOS67QWOWjA7oZwt5obaRZIZ/M4Mdag01MvXIbq7Ji2cOb8gGMV0Vq6VjMneYKJHzH04I41uI4IhCsp1BjWzmHBiJZRUAojd0jGPy7TbPDizN0fEtHxnpCcBZL7CXyaC6AoMMvn7R0kMprDDp7kECmE0rPOFzKzArKDCgyBJ31H1uqu2iD+YE4fwzJ3FceamBGjF6w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(366004)(346002)(396003)(39860400002)(136003)(451199018)(6506007)(186003)(26005)(9686003)(8676002)(41300700001)(8936002)(316002)(76116006)(66476007)(66446008)(66556008)(64756008)(66946007)(52536014)(4326008)(6916009)(478600001)(71200400001)(7696005)(2906002)(54906003)(5660300002)(38100700002)(4744005)(122000001)(55016003)(86362001)(38070700005)(33656002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?jFgxTDozLiqCTcxvUFVGf6t04mf0qXFUZhfcdrWJi0yCCh+L/hAquazEPB?=
 =?iso-8859-1?Q?xArVaYRBd8IBu3xrS2s+cE2XsnYjSSAt1ZwvZ9fcm20LuvE9g9lfbLbWgU?=
 =?iso-8859-1?Q?PpT/qFkO3iSrabN86FYGjnUim+0Ho7hrv1R6ZpwiAuEEO0FcsgFOLDjvDf?=
 =?iso-8859-1?Q?pZeS1ooYcD64/tNtQkFZJOUx4IlngSC/oGQ7A+XLGJp0RI21DtS9v4uvL4?=
 =?iso-8859-1?Q?AmnlSHSK5/vcIRbAYkwtphyHziQLubymANht1oHVZTWmeJAo12sJwqPDMS?=
 =?iso-8859-1?Q?kb76lOhzfk4gNdPUv0sdKctnb0tbJr+2WWXwIw3ixY/WUGZynfLvrdCW/I?=
 =?iso-8859-1?Q?Z9k0qUyI0bIjeYSRebyAeGPAssaC2gShWblJcmcNieIziInwX/8CJnATFk?=
 =?iso-8859-1?Q?Ad2Cq03H2sm8wde5jV+oHmDudzd1UnJkIGGLoSOxBUYdvZx4427lt/bnWM?=
 =?iso-8859-1?Q?hWE3Wc0W7DvqnxtcR8PcQgNc/Dy6dR9BEceLD6tpneBYv/9xSdrgi45A0Z?=
 =?iso-8859-1?Q?Q+6gFCgDh+UikaOfE7piKTTqWnk81Xa3stMG4hrB0ao24B1lvP/RIqgjPL?=
 =?iso-8859-1?Q?KX/4IhRs4e4Xg6RQXc1tfNXJY3yyxUXWgdy4q0dShk5OPw5zCnnCCPXAPH?=
 =?iso-8859-1?Q?GpjDStoXOfSMW/ISS9MfrOQ6CRmB2o75vaU5syGwI1MhlxOAZdM+REzr3K?=
 =?iso-8859-1?Q?HhkTvcJYjLgSmORqQctXANtW5a6u/wV5UgIVOI+/5yQ0BCNNxSM1hp/UEZ?=
 =?iso-8859-1?Q?hwfU8eW5rDg4CxhOVJwaOPrx5N9/AaWi20y3SuB1cApDrXqpEco/V51YjB?=
 =?iso-8859-1?Q?3WEhIM+c6OkbG+uEkY+I7/l9tMuyJ6VkIWjBYUHZ0uz87/Hk4vaybxfkLF?=
 =?iso-8859-1?Q?jZ7cfLUouEfpOF4DaMdGq66yQbpYyHVA6mH8Vellbvqtm+p3MRy4FlZpYS?=
 =?iso-8859-1?Q?NX2cXKOnOS51pI22LEv157yuWcf+gGBsv7R3jHh/t95b6u1ip2m9e/EZtv?=
 =?iso-8859-1?Q?9laqv8KVJq6flBvj3RflsXrf0NL4tOZ0A7ARsLByBavg+zlrMjLMEablHn?=
 =?iso-8859-1?Q?fU/lCFGPiO8YujW/mpi4GiYL/+5evhu45kx8uelqj+MkVmMpVnNkhe5V0m?=
 =?iso-8859-1?Q?4zKmr8ZduqHeQCoy/C7YMwQthB09q1UQIUruwdDQckBfTvIDYFE77t4VCF?=
 =?iso-8859-1?Q?8QiMBDFs1MHtNMa2rvd2OiQfHIS6pPsPS68kBojFBBxyiXpzev+Wm+aWBB?=
 =?iso-8859-1?Q?MXbtjKbBYnTCwgW8koxTVsjF3AdBkW3HlOnP9vBhGVSQ8cQ3aICKw7jI5N?=
 =?iso-8859-1?Q?7eismIzn9mfUV7tijYSmTaRotUZy3PK/t8U8a6Jcl2VRyliT99UvtVnW3X?=
 =?iso-8859-1?Q?lHIksjYzG5M+sIom/+Kvo9mK2Lr5Jh7XWfYkxZ49KAQiOXWfMNE/fckDUq?=
 =?iso-8859-1?Q?BGp5y9PmfgSG+jRp362GpHP1CKtgLa4KFZi1c9OXhNub2SGjYmRK6qE8Jy?=
 =?iso-8859-1?Q?xjyT+Jm4KfcyO3M79TBaKQ3XENq/IAFf1XtK914OI5OGbs16LHXpgEsuL0?=
 =?iso-8859-1?Q?O0LPniFOsqB3qlyye1p8EtFD0OD1+UkiM7/AmbGGsAaiMc2CLGXiguwqBE?=
 =?iso-8859-1?Q?Db4dd0v71EdIEHbliA9cEdtUYHA8pXgYjiK//1RzHe+A8Ho6HKACQyBA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a92055bb-f170-40f1-b7db-08db10f1402a
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2023 14:14:15.2605
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mhasZQfgtwmy1Pd/h3FLl5HbKBJb5Tnkj1k54tRag4/iSZQ1yq5EMDuTPrfHGSErE83idJ5BDj4gaaHhIgQ0QGHvm2yJDn/Y8wGgzT4l08s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11590
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Andy,

Thanks for the feedback.

> Subject: Re: [PATCH v4 1/6] serial: 8250_em: Use dev_err_probe()
>=20
> On Fri, Feb 17, 2023 at 11:42:50AM +0000, Biju Das wrote:
> > This patch simplifies probe() by using dev_err() instead of
> > dev_err_probe()
>=20
> The patch does the opposite AFAICS.

OK, will fix it in next version.

Cheers,
Biju

>=20
> > and added a local variable 'dev' to
> > replace '&pdev->dev'.
>=20
> --
> With Best Regards,
> Andy Shevchenko
>=20

