Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EA56325EBF
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Feb 2021 09:16:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230006AbhBZIQa (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 26 Feb 2021 03:16:30 -0500
Received: from mail-eopbgr1320103.outbound.protection.outlook.com ([40.107.132.103]:34448
        "EHLO APC01-PU1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229482AbhBZIQ3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 26 Feb 2021 03:16:29 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QhqsyCJCccES7dwSOdbeTJgAvnGLsrgxXxQuIuqZq8yXqJzEy9Yn2C3kjfjtD4AsTL0mwXtUy4Lcjlqx+XNnypet+L6bozWv+FW/yqbOYRw21jefU9NHSVBNfkDvrso/EtMG9Bl9zhD1WV5QB+aBoZOAfEba9lZJufZP5kcsJposCxmKNiN+OqMyyKLivIjQTe5LQU+HPTJdQWD2JKxrEeuU7/E5i055yLLEkcUoLWJ+P86We7eADWEMoCO63hghBvPStGDqAkrcvTdeG33f/UsVyvn+vlUTby8Wrnc02G7283Kx4oFMyUeOVrqvqUEjAD7EelkXke5YAHcgZx3d+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ztSlyjyvhttitog3B9fd3yfrSZwq1Crz4H+arWmJxyY=;
 b=hTS9jU3U38WoXG8dOeQDAQ9AmvUNd2X7IgrTmvwI/XqrxgSDNBMrwJtqqMzoXe35FFDwuHRvcXUbD2v+ce2Is6AWq3s9vq9UYIgSe5qDYfMfIeQ49PaEdxda5G6uQajua+v0k0vPpcIx7SUKraxilv9eyvFl6tNs1ZiLh/cFNuSJUQ9np4qFhRlo6OtiCzUrC2zOjcByWIvkhUZXWqqdZyUJwJhoUm1yfifZnq3vIhuqGnsMz8adu3Ph3F+smubIwKdLpQhpT8XDGsJWf5wqVQ7mf8UXzmVkEJf3Yq0im/EuyUW842UzZWQ4RIZU2/Cmyo79uKr9udA74YXvXlg3Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ztSlyjyvhttitog3B9fd3yfrSZwq1Crz4H+arWmJxyY=;
 b=JFIxeOCbiV3jCRgfuKy4M1KoPbLpQpLgMw6tIfyXyUQu1QcsBuHTUUKGawbuL50o7Go33IXHriw0mWvMG3HZkCL53p60ff6zaMN3uocXG4alxBacISS6uolpWE26BVlB4IN6PWcdUPbncEnsHsv1V+I+/vx2TO0gWBsKCaXI+Aw=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TY2PR01MB3436.jpnprd01.prod.outlook.com (2603:1096:404:d7::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.27; Fri, 26 Feb
 2021 08:14:55 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::cb4:9680:bb26:8f3f]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::cb4:9680:bb26:8f3f%4]) with mapi id 15.20.3890.019; Fri, 26 Feb 2021
 08:14:55 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 2/2] mmc: renesas_sdhi: use custom mask for TMIO_MASK_ALL
Thread-Topic: [PATCH 2/2] mmc: renesas_sdhi: use custom mask for TMIO_MASK_ALL
Thread-Index: AQHXCcveaLPfZ3Xi4UiJohEfEKt1MKpqGavg
Date:   Fri, 26 Feb 2021 08:14:55 +0000
Message-ID: <TY2PR01MB36926EB1E0E6C0BE6978E725D89D9@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <20210223100830.25125-1-wsa+renesas@sang-engineering.com>
 <20210223100830.25125-3-wsa+renesas@sang-engineering.com>
In-Reply-To: <20210223100830.25125-3-wsa+renesas@sang-engineering.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: sang-engineering.com; dkim=none (message not signed)
 header.d=none;sang-engineering.com; dmarc=none action=none
 header.from=renesas.com;
x-originating-ip: [240f:60:5f3e:1:e5f7:ee15:e4ae:ce73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 023db428-525a-4e70-b8fe-08d8da2e9986
x-ms-traffictypediagnostic: TY2PR01MB3436:
x-microsoft-antispam-prvs: <TY2PR01MB3436EE4399F6B03E90F010CED89D9@TY2PR01MB3436.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: N/knB7oXMAPx9+fkHKq9bzxkgoFjYjeA/UY9LTkFh1v48aaYtLLSDVGZldIbyMJNkDd0TvyT5LsxgAqahf+GIcsIAYJ53492gpKeS+j1YjUwM9fcWJ/VdFe3pOl2p2HxgFNZ2voyALe/l5q2A6pcYC7NWNWvGmYMsQ4Du/1+yu9GzLXxxb1ds2j42Uv2q37aVlNAipmoWsvlFU5oYf5VLtp/kywnNfwCcd0TQB/LkoKrafxoq3cjf8xF+1i8CXbR2U3LLbo7LtkfwvDEDDwK30MyByGvqVPGWXbWMfDZImSRNY0o79GYHfHSc7iHmB+Hj+5+dG9NcwC4Rm/JOm79GDO9CVCE72IAxYcfkTirBdQChqCTZnJAdEgQFgurytjUv5GJG1bD/VxusCBGGsuybGh223usTMtaV3WcdgJMrndtskUIKgUv2WRaKnn2X24DgdMYntbX35VfadrQWnEIkgtRwKNYUTTLuFMc51V49qOlK7814B91BhXe9c7lTh28doitOW6oXZW+fy3njihVDQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(136003)(346002)(39860400002)(396003)(64756008)(4326008)(66446008)(8676002)(55016002)(9686003)(66946007)(110136005)(76116006)(7696005)(316002)(66556008)(66476007)(4744005)(52536014)(478600001)(86362001)(6506007)(33656002)(186003)(71200400001)(8936002)(2906002)(5660300002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?j0K1uatlaoyuW950+UgjODe5wnbmssxuHC8Rz/MnkvSTzg4tHcdk4ed7/pvz?=
 =?us-ascii?Q?Nma8dpK3OSPRwPUPwMA3z8ZNKP+oZGwsBknGmOaks+WsOrTGTsTXCrUT2AQf?=
 =?us-ascii?Q?4nMPHUHxOx8fHTkOi/t/+55muadPZr1ggEEvymuo9O/ZyGf73+ExhIzzWJEW?=
 =?us-ascii?Q?0bknw9SHW75iV7b1OPtb3gUWJuDUMlYfZkO6ie3uGivUdL2bARN35dWLO08k?=
 =?us-ascii?Q?cSgSNkX9ZtFVawM8rmch/YjKK2T5ujR+N1TSxL0OHyC73EIC816YVNWiZgZh?=
 =?us-ascii?Q?NZWqZIh3bTTsIwEz3wLxQq9O5zI4lS8t3K0PqXtrLv2rsxIjNKXcTmpwVw29?=
 =?us-ascii?Q?9VjhzgVEMM7/0r664BkO3iaiyU2ZPFH1ndISpckLWvWreyccnBr+TNN/9V+f?=
 =?us-ascii?Q?XiZ8F96HssYoJ3H7BGtliln17UHyB6JKRdERQWSlNn85UxY728UUqBF5e+d9?=
 =?us-ascii?Q?NokTJjnCrp/8xnESI4aEE9l6LEj5Aq3Slutw3RUmBDPEya11dnBBjCuoxh1J?=
 =?us-ascii?Q?1WwVVW5a0FsI3SgmreDbKlptyHWvsPcXmyLNBkhJRymCbOY4gcz9PLXVMF4O?=
 =?us-ascii?Q?9saEw2MkS3rYP7Y7kRoUxGi2g/fYWQSkehF7UdZETQm1tEmXOQGgJZg3Rp36?=
 =?us-ascii?Q?4XC1jrEKlazgIJYjx1EMYPJy1FZT/D/3y4SBWOf60BT3fi9OYmY5gEsi1TFA?=
 =?us-ascii?Q?IV9sZMOYA8cquL2gxtVD7o8bJFde27cmgnmsvJUiWdpQC8bC4qGDyq0BK7ud?=
 =?us-ascii?Q?ebraWDhkLn/RawK4d/lA3kA3m6SlI+y0GWtyh9s/kNTzsU+XrAYitceydQXm?=
 =?us-ascii?Q?L3AIE19az+j7oIWwxA4G0gfhXlhamoCz/9kHsJcOIsNTyRs7BVfSMHpdG3ia?=
 =?us-ascii?Q?PFAjiK7YFKN+qS+hfoGfAEXrRWChty62tVnJFgzU693Cjvgzg0vxGn1pqwbO?=
 =?us-ascii?Q?mIAzqyl6Jg8YIpIeAWDhrFqzLBW1taowJhcrcw6oPqdPlM9NnIMHRgGUl3Cd?=
 =?us-ascii?Q?HLpO65VrluCQVdw09TOpipXv0zd7qUvR9qkpabOotLtl/Ab6vWcFdzGIhb73?=
 =?us-ascii?Q?apaNMX4KbeFwSVfr/2YODW8ye7Uczqjquuk7F4hsFS61p8gIRYeIkUq0e5Vs?=
 =?us-ascii?Q?0jpPjC1fWcnXXUu6eVHuA70wYPDwDAb5fBTl+dl9fithKBT9TqJs4gw6EFcG?=
 =?us-ascii?Q?h+8I5iCErIiNh8G6KKUxC/FdOOSj24fJGIvrvtZVBQLHlihHM6YZH2uVnu5m?=
 =?us-ascii?Q?OZ7yUa2B8nC/mcNro/xsTyT/SkvPVeXnq9eDT69kg6DEEEJ2/TE/xCwOJO/M?=
 =?us-ascii?Q?hLLzZf0DXvPr+atwn8Fz+ZX+7e1Cbb+DijksfMBxXzCabqxnOHO3NtIhxjHI?=
 =?us-ascii?Q?nboYVTo=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 023db428-525a-4e70-b8fe-08d8da2e9986
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Feb 2021 08:14:55.1289
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UHr+rWs5vGIcU4UVmyhbNdV0f2WWWrVBS4U0ahyq4bhC+hmNWL9Rzx2N84PXdap2WwnUHvIL+5N/9ZR+gGbHvF7hef4AkfFdGsK5s9K0hHGYVlc4bX4qooufAw+e00W6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB3436
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram-san,

Thank you for the patch!

> From: Wolfram Sang, Sent: Tuesday, February 23, 2021 7:09 PM
<snip>
> diff --git a/drivers/mmc/host/tmio_mmc.h b/drivers/mmc/host/tmio_mmc.h
> index 7d5201d6a006..3b242f2e2c98 100644
> --- a/drivers/mmc/host/tmio_mmc.h
> +++ b/drivers/mmc/host/tmio_mmc.h
> @@ -100,7 +100,7 @@
>=20
>  /* Define some IRQ masks */
>  /* This is the mask used at reset by the chip */
> -#define TMIO_MASK_INIT_RCAR2	0x8b7f031d /* Initial value for R-Car Gen2+=
 */
> +#define TMIO_MASK_ALL_RCAR2	0x8b7f031d /* Initial value for R-Car Gen2+ =
*/

nit: Perhaps, we also have to change the comment "Initial value"?

Anyway,

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

And, I tested on my environment (r8a77951-salvator-xs.dts) and
I didn't observe any regression, so,

Tested-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

