Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F00936089F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Apr 2021 13:54:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230056AbhDOLzC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 15 Apr 2021 07:55:02 -0400
Received: from mail-eopbgr1400103.outbound.protection.outlook.com ([40.107.140.103]:8292
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229943AbhDOLzC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Apr 2021 07:55:02 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C0mU0TA+2K2AunOp3Rzqf2FNiWKtUxVzfohM7lgDlKJxkhYaYAm45Qufdi4yw6+cQfvmSPPEI0QF6nHI45W2mZ2WDhmPnhwJ7MSoLNdY6v3KH9A/B5UWL9w6QaLOAAPQOInAEdSF2CZMpC1FFsbZOBJhyz9WlNf4tPbvj82Kj6nJu1/Wpi7W0QuuFLrlcSwlCMCwriMt6sBSkvE8TB3wlsH70TUE6R8LydGtiplTV7r0up4YWMhLJJ5upq6qQ+y8kh1supIpRygscAia2RTdVj673hMZmDKZrXMyZs3cF/ngvkCUrs2dnZJXrYTYvurqdnciYq3Te66yn79f3F3x+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eZTCS0epOydhrHsGVTCzZsVE1gd9yUiRqyHWBNBGUxM=;
 b=kC4Nn7gn0ti3li3VY1qNtYfMS1qSMuEBNGTIDT2VSPDa5au6u6rgbXFY8Sa+7B0awvlHiUGsdU3PODnlrSFdZ1W09RQ7GNXas8UMHJq2Vzg3nW7Z6isd6jubtP/sKEGbJxMIu9p0t76yFSxupvhDsX8JmKvOa9h47yM/2UyKF2Enbmgn3Y1ua/nzYIes25uXNOurUxOADo2A4r97L6+YCXqtBShFzfj6eDg2nDeN6/bURnutGuF+lMvgs95p38LL0X/+/12S+4dIpcr6fNRv5Rfo5PHitV2R53NBPgJXoL+ih6QFAyXyq/Ut4X1r81YEwOZ1Xy2sgC+F33U5PGCynQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eZTCS0epOydhrHsGVTCzZsVE1gd9yUiRqyHWBNBGUxM=;
 b=n4iTuod3MGmReIhTyAP/0zdNS0sWNqe70V9nEHlyR3IUol9yV8gm1rFbz9LAcQI9z7f3YDYo+2NRAt3hyFjo/2ulKSujCg/2KP6TQrLzV86egBjQnTRsL3SeSNrEaHkVJ8E5YG0S1Pc1teANnLPIg1ik2LJ4SPUzAalaLoIPKHQ=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TYAPR01MB4079.jpnprd01.prod.outlook.com (2603:1096:404:bc::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Thu, 15 Apr
 2021 11:54:37 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::e413:c5f8:a40a:a349]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::e413:c5f8:a40a:a349%4]) with mapi id 15.20.4020.023; Thu, 15 Apr 2021
 11:54:36 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2] mmc: tmio: always restore irq register
Thread-Topic: [PATCH v2] mmc: tmio: always restore irq register
Thread-Index: AQHXMD9wAhm4FLaGeU+PLzAooKgQQ6q1e1WQ
Date:   Thu, 15 Apr 2021 11:54:36 +0000
Message-ID: <TY2PR01MB36929D80E62B2C1563886C74D84D9@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <20210413083137.11171-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20210413083137.11171-1-wsa+renesas@sang-engineering.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: sang-engineering.com; dkim=none (message not signed)
 header.d=none;sang-engineering.com; dmarc=none action=none
 header.from=renesas.com;
x-originating-ip: [124.210.22.195]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 31917b8a-107c-40ed-f208-08d900053e42
x-ms-traffictypediagnostic: TYAPR01MB4079:
x-microsoft-antispam-prvs: <TYAPR01MB4079FF651D624EAAE7E43BC8D84D9@TYAPR01MB4079.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eZDoCVq2eSoZpHZuMdQ2TUi9fJSpWYx/XMrtSdcKuFeeb+GY0aYjdeEjANm6yV0lp7AO909TnYfgSy/ZQBpYz3/4CRw+9rZWS7Kas6DtceFc+gg+ILslAScCDPixZIzIN4es11u1VNdo87mNSUyQYacHv7FyTM1zI1vd1Xv9CGE7IvMGGdnvjdB2Fhaa6spueUD8/5eQt5rTegg/lQZUVa+KYK5ulAgg3v+KUZx3vrMPn1gSWA488QuoQzQze4I1SuGi6GJZLnYGwu6JsoDiFuOLr88bLttRUqcooZvlPktexHr48l1JvHy3cjCLjch7W1M3Auk3/DJlu0KX1zWzv8ceIqiyMxYsKun3+J6WHbFjwv5sYLgI/wTTLw46cMtuNIfs99kFtNG6PZyzx8X5VqJlMB65nyBmnT0K8wAFBy2Kcr2xseuZyMo4mF05jUQWvRZQP0zzhkZviEUNYlb/QI/5rsGAHlYAijRUHuLpIt4wIU5nk95cXiVyyj1COvrkrxt65vJ37b3C59UU+rnUjke1HyBnd2R1+yMXp6cYDp286ylI7CJC1SLh/axHTYuMecccJTrmJsIoLon3CpopZ9AlvCiJOBp02qNHFjLgwkM=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(136003)(366004)(39860400002)(346002)(7696005)(86362001)(66476007)(76116006)(5660300002)(478600001)(66556008)(8936002)(71200400001)(186003)(66446008)(64756008)(6506007)(9686003)(2906002)(26005)(33656002)(316002)(52536014)(66946007)(8676002)(4326008)(122000001)(55236004)(38100700002)(110136005)(55016002)(4744005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?NYPK9yadRIXzuJnGgjq54gRaiNXiJ5ILGfLqBX8u/Sbk32B+SxvhO+/XSLot?=
 =?us-ascii?Q?GS8K0Wp9M/4m17llQBB+7tlVAkG2A31FSVrqN5Yxeum8LPw8nfTtWxDhahkU?=
 =?us-ascii?Q?FNB+D75TKEfG0Ygk+wqendnoZ41x7zoNPp7M682es7kcAlZEFX47dPcM2gBQ?=
 =?us-ascii?Q?kboB9ekX0eoyyS58ECfzpXNz+161GX7ZyOm47HNPQ0w3gZDlpOJk65Boqbsj?=
 =?us-ascii?Q?DeojrgRWTWjZTAac7QsbmfxCF16SXnyWyXpY757Nug/lBotSOLfr6FvsxhYp?=
 =?us-ascii?Q?NMEREWKuEb/KMVU2+UXRfRmjpg8pBYiufvCNtTVL3ZIejNaNWlGM7HAi4h0r?=
 =?us-ascii?Q?hsT69boyucUBlOeN72kqXXmuWh8z8ZD/CTbfTuugMdOviY+pTFA+MoyDgX4i?=
 =?us-ascii?Q?k3JaWD+VIJ8s9NsThB74kQDq/e6coiNWr3Cl2R33rOOvKjmKQ1cj+TDXsBvl?=
 =?us-ascii?Q?9LXGIxBrlRE3ZvD7oA0DpaD52yRfwhXPrMrysaqOSEKDGR1wgcdTu9v9wUHH?=
 =?us-ascii?Q?58CQPt7MEMboYzZo1H/Xq/hinQO8dLT3Ukdr2RoV5SqQTIg+vQ/a3AzQLVKJ?=
 =?us-ascii?Q?LWCLbV8mzermM3QncMOBZZp+uO8i26DhayrddQOYlhgvDleYWQNzvlDRr5+6?=
 =?us-ascii?Q?SLqIHRce91wT9Yf9s/zlklqpFUOLl4HGZxicStSh55dYOWT0eBSV6amHK+ic?=
 =?us-ascii?Q?NW18sUmwVy64ZBMpY6Lt5rKMsQ5z7ZaadFOuLjVtJEJyLFm1rIlvPuetgcga?=
 =?us-ascii?Q?VmOsz4SQ7dy0KHSxRkE25yYfsf2lAksWl/Y5b1MhP7W+Rx2nAqWt9vqgq1NS?=
 =?us-ascii?Q?kHZ3eDI+Sn9IYlh+Ru67d9ct1JiwxMfjh9dmhSS/iXVjF4FqqjQMdR3XeUyf?=
 =?us-ascii?Q?8nNikrRmuKO/m1H7pFl62a0cSMGF3byxIpGmYoxF8TQ0klbo3k3N2pQp94z2?=
 =?us-ascii?Q?4Jge8tcYYf8F94+p9PXZ/Hu1u+LAuQAotchLd8g1BLfxD4qGlNwCUGEuttG0?=
 =?us-ascii?Q?Bbr+lSZ7+kiedfvMclI1TRsfBliWYobSzFyjheognU4ReBOKHlwnEb1J6ocD?=
 =?us-ascii?Q?28n+d9lndGKxh5JWqOFRl+GU4ADRE3jjIbtTjZLutzodFZNqYiRU0juZBWIB?=
 =?us-ascii?Q?TpdPTvxmC6+1eXn1dTjquzKs3ua8uDJ9q7GbW1LuL1FgNh0MbO7h0spepn0h?=
 =?us-ascii?Q?I1ntN+yzBUGU2G/EKP3rLilzwnXNifRCV5JS5JSsMJx+afDrZqDnYfXGVqxc?=
 =?us-ascii?Q?5BscKhCYYv+h/PJJbA1QEPuYtfLJdMaWZjVPLx9KibduKFrEwnSuelWCwP6B?=
 =?us-ascii?Q?6YK/dF1gd3QcRMINLl64llYG?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31917b8a-107c-40ed-f208-08d900053e42
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2021 11:54:36.7288
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QHjhmex+WRcdydWdd9Tf0d8jxwcRixOqH1vfvCqOUU7EhbMQ3LDra75vkL8qM/Pf5cCz6Y2em3OM6ms4XZJ0WdbcMLQwpuvo0XxNkIWpXOM9Z2s43lkjzAPAhm97zZ52
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB4079
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram-san,

> From: Wolfram Sang, Sent: Tuesday, April 13, 2021 5:32 PM
>=20
> Currently, only SDHI on R-Car Gen2+ reinitializes the irq register
> during reset but it should be done on all instances. We can move it from
> the SDHI driver to the TMIO core, because we now have the
> 'sd_irq_mask_all' variable which carries the proper value to use. That
> also means we can remove the initialization from tmio_mmc_probe()
> because it calls tmio_mmc_reset(), too. We only move that
> tmio_mmc_reset() call there a little to ensure 'sd_irq_mask_all' is
> properly set.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---

Thank you for the patch!

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

I tested on my environment (R-Car H3 ES3.0) and I didn't observe any regres=
sion.
So,

Tested-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

