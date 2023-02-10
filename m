Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 72486692637
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Feb 2023 20:20:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233077AbjBJTUj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 10 Feb 2023 14:20:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233216AbjBJTUh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 Feb 2023 14:20:37 -0500
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2121.outbound.protection.outlook.com [40.107.117.121])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A08E17DD25;
        Fri, 10 Feb 2023 11:20:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TT3qgOacLdPJGcWbLt9DgP8XF98T3L//HQdbC4+VEwpe5lUxJ8UIFlO4jn70cjecsaovBVVLaHcGoi0MYsXwfsUkIz/fIlX4CGrniX94GMfuCz9nmQ18XBKPJZYc2JivOCgd3LqVmlFquJzL36UYBfA5kDsukw56z86bGQXAx0qE2tSDm8XV1wGaDjWw3hEmiTXsNo66Vr7nFBoP9Jp3y/H9G9NgtZ6kJW/VL30nnG/9BR+Zr+DWaZLwillSu6cHOg0z/eY9lT7X2AX3mn1G8KmsJSDVJRR4WoNSFxGbvZUVEkYZV8pOD4YVnehkvnoUSY7KpzwLh5DwbYF7YSekHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lr1uqF8dk9GC0ybk7uPELDF7nxAvVDb9sXGuf4Bi8z0=;
 b=dH8BEntuoKNIYSF0BZV3l1SbmGXxvf2omV31s4qvE0NpoVDPwg9aTAlKHVK1ed/AHHprO6egr0x/w2y1h3oLKb/z9AtbbEaLFljMkIw3/njod13CNd7KECQUYCHrmmdsy0ODGkrLgNhfNckb8hSi6FytQDlao2KoUjqpy2F7kJehSfcRDQTyFcBpcMnINxpQgtI+qLiw3BOpk+U4mlQVRGWIYY71oS27Nv3SW+P13F7ym+osoz+2hHKsAIvPlczSd0NbpJziztpG+a2tuswMF7MXaYOvSnS5LFtVP24W2ERb/RsqN+SBmfU0BkEch0dLW6xe1iWtGXX2op6+pkE56w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lr1uqF8dk9GC0ybk7uPELDF7nxAvVDb9sXGuf4Bi8z0=;
 b=RQmOTP3shyB2aATwzihMenNZc6hWXLk3Xc0Ppi3c+pG0lEVOnRq6hxdsu3kB57uQ8fiutfdfUwPICarMlKRic4ipS3d/G5jwU+taepyihd7zfNgV0MhvVNHL6Tpe5B/ZuaSVPC0FtUUYR0GxDeMSGtFtLPtG4o+zyMKB0nJ0gYw=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYCPR01MB9307.jpnprd01.prod.outlook.com (2603:1096:400:198::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.21; Fri, 10 Feb
 2023 19:20:27 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::343d:7339:78e5:a46e]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::343d:7339:78e5:a46e%8]) with mapi id 15.20.6086.021; Fri, 10 Feb 2023
 19:20:27 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Andy Shevchenko <andriy.shevchenko@intel.com>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2 2/3] serial: 8250_em: Update RZ/V2M port type as
 PORT_16750
Thread-Topic: [PATCH v2 2/3] serial: 8250_em: Update RZ/V2M port type as
 PORT_16750
Thread-Index: AQHZPWYzeQsp1F3f9kS2usAbL+gOlq7IZHeAgAAp4jA=
Date:   Fri, 10 Feb 2023 19:20:27 +0000
Message-ID: <OS0PR01MB5922524FE840E83E791B3F9C86DE9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230210154140.338352-1-biju.das.jz@bp.renesas.com>
 <20230210154140.338352-3-biju.das.jz@bp.renesas.com>
 <Y+Z1lWnUNWC0IJFz@smile.fi.intel.com>
In-Reply-To: <Y+Z1lWnUNWC0IJFz@smile.fi.intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYCPR01MB9307:EE_
x-ms-office365-filtering-correlation-id: 0e480c2f-88ca-4cf7-7cfd-08db0b9bde18
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yYNRUeqBki6h8FkZ5WF1ym66lp9/Ej6n4lsHhQElRc91sbS0eAmyK6EsGMY2ZQRK62wndHZ63clWR6XgixngcR4gIzYd2LmVS/1aWw85h7oy0Y/M6ORlOevNapRJzAbfY3xnoIFsoimjtbu9zYxnRcej4wONggpJsMJaD0tFatOZW3X2pR/zAhWl8YhdyW6NM7+ISODaZ71mqtf5MmcD+3joFpF7YF/fxp3Rn+/2+27RusrEnIcwzsqYdY0WeSaXsnHD6DvFrf8lcm7d9h4UpJUaHsevP/yAjdgmvpg+vHs8ESmxId+jASfndMYQKG1Ai8J+5we8AepJZUOBd3gy0lXW/0gQvD1DFE1z0egXn6CWeBZ2K6IjMpG6/zLTyb50a9aUCWaBbh3hENIp7axtNRczrwID2oTbPpKrnXpFCVnjVYpl2sVIDohIwa/69iTyPGx651fe3NJ6o3uTUO3NHeV24f+UvQOzahKpZyu+CpZc9aC/4NgYTsgIFneBvYBks8610TRy5vYHLG/eGxBlnlATz+NTAUOxX+eEX+g7XxQUX5s3rBL0LGTf+NAnqCjgS6AIw74EjhfHiyRubbUDtXiDBIHzAbJHHnHkB+nAyOUC3i7lwYMvnddLzwA8Tlf0USA9QApXUaNBdP03NcKcbwt8P8EhH8gmdUotPeLs3BEOVzrwYShA3AQDZOOrlX7V1Hx6UE3mWxQoRtAmoDnNBg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(346002)(136003)(396003)(39860400002)(376002)(451199018)(76116006)(7696005)(71200400001)(33656002)(478600001)(83380400001)(316002)(38070700005)(15650500001)(55016003)(186003)(4744005)(41300700001)(38100700002)(52536014)(5660300002)(122000001)(8936002)(6916009)(4326008)(53546011)(6506007)(9686003)(66446008)(66476007)(66556008)(66946007)(64756008)(8676002)(86362001)(2906002)(26005)(54906003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?nPJeL0Zla31ouSBIz5k1VmoRANvpYVCebxxIqPjdrIfnwrL4XJJOIRoNvWy7?=
 =?us-ascii?Q?6cUqTbBDA3dfT23v8uZccBivUUliSZkZJkpxXPUUHdusy0oFC5BKupCBKOpd?=
 =?us-ascii?Q?Ep0SHJDwfrudCryD4i4/er4Bmw7gqLvohFWfx+UmJqJcxkgG1+mxOLz71cGN?=
 =?us-ascii?Q?vIFIdiMRN+IDbUd4HeXTDinmabsBzK/lp6Sitvgc/t+MagJgoXC0RhMVFKFp?=
 =?us-ascii?Q?/gn3nln7hb97l513ykpC/MgUr4yVO+vhcsh9EYmTEAtGLgiozCDR8XuZfVo2?=
 =?us-ascii?Q?OXvF7hF/UQ2BLo5IdIhEd0Zj73VdO+Zrn132vhed/IRUFbBWwsAH9QhlmiEs?=
 =?us-ascii?Q?DI2voiy7YlXTfQzj/3ppvKVMIrdiqTDx37xNTgc3xHrGc+G5X7kh49F0omUf?=
 =?us-ascii?Q?xVls8cJ6c/1y/FFHGB9pH7JFNsXU4r9ds0OYsdMdOB6UaQ1rBI0yZsSpbmbM?=
 =?us-ascii?Q?FRUt+iQACmsGwq/ig6LK0tClAOIeP0QSqG/4M2OHzOlxZrtIMJBEsKM05dzT?=
 =?us-ascii?Q?lV/VDRDgw1B9oDkM6Ox3iQtleIs4t30Fya734zbt9IqrXeAnCd85i0pOm+ef?=
 =?us-ascii?Q?kxdMgEEpRfml9kG0QcqlXLwtpOifsIjtPRVnPztyP0IZGLfOr7gjhxFEycRE?=
 =?us-ascii?Q?1M7Hoy+zHl8/C3adTgYD8EPYYyb4xlrEJbKUZxmbpp8uzX3wcqmG27w920tc?=
 =?us-ascii?Q?O8wEEVIWE/3NlMAcer2WvDZsyaPqMwhFspobjSDyeshyYuhA90r2mrPNi0X4?=
 =?us-ascii?Q?BvXz7DYym/zraeNL/A7W8rVo8PSXTmBaK5XsCJzW/lbQvuJKifb1XLisQCGu?=
 =?us-ascii?Q?sFJPia5bXNQWO4QrRESVCIhcveq5lsRx6m8KPZ3o9IIROohY/jps3YycVunE?=
 =?us-ascii?Q?Hn7+1OfjAuX+IxqOLnHHkJQ780GdtHM+yNj+cNGBbpWDwswDOYvzRmfXTplq?=
 =?us-ascii?Q?MaH95HPVTw0TmfOpdiaHopspt/i0II1CsbJyhq7HQLEvB8QnMlA1nlreUFUD?=
 =?us-ascii?Q?MylXPRvPR/d/gqV15rPC4jQZlUvuQ4purM9pOEjoylfN8a56Fj8T80rpg0dO?=
 =?us-ascii?Q?AyS5j1m5BaTOPInbNtw/XcJsnNpBk5hEvxayTishOnRqHjmcrZfHxoCb4A/o?=
 =?us-ascii?Q?rq80ZQrsy3KsGogNebZHqfh6X3smBfTtCEPV3H3B1fZE9LfOlq6L19N85+mQ?=
 =?us-ascii?Q?vRDNG9NYMFU+FUfgWoJes5BMSpVln9WTjfsZw/KZPBH0bdshV9p+wSDmEHOA?=
 =?us-ascii?Q?QQO/kwVO7ES8FeX0f9IK6b6SmYaAeokTJ2+5KXclIN/RQ1SztZxsIERbdl3Z?=
 =?us-ascii?Q?2wk5r3OLIqNoI0ccWX7UysHpUSo2+XGiPv7E9sn/Q+2nnPZBpr0v6yyX9yRl?=
 =?us-ascii?Q?HVGT6dD1fw4vrp9i38Xl9rxnui+V/8M/XI3S4qUm0kbMWIK+e9aJ9P66KEkR?=
 =?us-ascii?Q?gyHAf209vvaUVgIksSMhLA6dePJh3CJlU8LO7yVqun6HvYZq1a1xNTBIStdt?=
 =?us-ascii?Q?kWAQ1qj1ihE0xzL7aJJ3TYmveT2oxRt4FxIfTUGOzFuJb18SvKnnBGMWikmg?=
 =?us-ascii?Q?qNljs8NkcDETqWQBTjzmz8QXYZxS/XvxEXfFnaMhThy8UBmdQu3StlzqDKok?=
 =?us-ascii?Q?ZQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e480c2f-88ca-4cf7-7cfd-08db0b9bde18
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2023 19:20:27.6728
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZcviNC+Lbq5zhw9vsYelE8KIQXdxWYpnUdjbeaiXrgKN9HE9xB+KjTEOG7u5itIHl1R0iqDUn/IKTi96zNnO0JgJA0vsv4aI3x/ZurVi2cc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9307
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Andy Shevchenko,

Thanks for the feedback.

> -----Original Message-----
> From: Andy Shevchenko <andriy.shevchenko@intel.com>
> Sent: Friday, February 10, 2023 4:49 PM
> To: Biju Das <biju.das.jz@bp.renesas.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>; Jiri Slaby
> <jirislaby@kernel.org>; Geert Uytterhoeven <geert+renesas@glider.be>; lin=
ux-
> serial@vger.kernel.org; Fabrizio Castro <fabrizio.castro.jz@renesas.com>;
> linux-renesas-soc@vger.kernel.org
> Subject: Re: [PATCH v2 2/3] serial: 8250_em: Update RZ/V2M port type as
> PORT_16750
>=20
> On Fri, Feb 10, 2023 at 03:41:39PM +0000, Biju Das wrote:
> > The UART IP found on RZ/V2M SoC is Register-compatible with the
> > general-purpose 16750 UART chip. This patch updates RZ/V2M port type
> > from 16550A->16750 and also enables 64-bytes fifo support.
>=20
> ...
>=20
> > +#include <linux/of_device.h>
>=20
> property.h
OK.
>=20
> ...
>=20
> > +	priv->info =3D of_device_get_match_data(dev);
>=20
> device_get_match_data()

OK.

>=20
> ...
>=20
> With Ilpo's comment addressed this looks good!

Will send next version with above addressed.

Cheers,
Biju
