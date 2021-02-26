Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F752325EBD
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Feb 2021 09:16:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229526AbhBZIPk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 26 Feb 2021 03:15:40 -0500
Received: from mail-eopbgr1400137.outbound.protection.outlook.com ([40.107.140.137]:49073
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229482AbhBZIPh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 26 Feb 2021 03:15:37 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CG+/ZA5tXPqekzxHbU8cPF2p8rOEtw7Gg5/INKqDpLtRj3opy3p2L2cytVezDwx+aPTpzg6lsC8iEJyCUL5A2SUfvX3XyLMqUnEY+wKsIro10W/hT76qz28mI0s1wPsoHFPqPOPmnJJrJ+DgVtkVYOudSawy5gH2llxaHXYST9rQ79jO4dbNwkV7SfvcFMG6mIHOhfT6I3MpVFt75E0hX9z/V1yZ+RYLd+nx2t3oqkxTw5rdiN6J+GuTrKyAGDcL6HUIl7w7wPlGK3R5daNyQA+g+PUIUGu8SHvRzmYNN8CQ8CmH1EIhicK6tiUHqi7vbFa2tObHRA5FbvzAFG5Oyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FIS0w8tgouK1wwu4Hh9una79vseadx1Ix6bu8WydBYg=;
 b=mVwz3c4zSkxhB/+FTucUwt0jQbNNp+Are01ktK8EjkET5JlMCzQXalQIUE3XS3/lq4bnUwgSXnvQZtNHCbZw4+4AGDf+cPiNBDfcUa3VwCuM8Ff0lCDOijQLTnswF/4PQVx+PDEYKqLBRVRdNQqotnR50FzDl8MEjHfUHmFOkawIjyjKr3hbuf7clzZNyFYzHzSBuCrbhWiK4Lsfk+MMMa3KL2kA+rVNlR8R4mOz1atGYO871QZyrf0c/RaYeSbLxI+XMd2enCucFxvVtiF0LFTMwkRdhrG6XAafALtDo74kHJdUxbUXLpaWfN2yJAzdTmNVDBq0BOoSBS7ZRJZW5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FIS0w8tgouK1wwu4Hh9una79vseadx1Ix6bu8WydBYg=;
 b=EXOOXngE56L3rpx3R+lqQI6McAkMSHUXmR5SIrQTeeu+zvhoPmNgzl7Gf+s2TMdGlvICbUA4b2NQTOnIYN1zJObhZu8lEi6Nlchga9oUt+i4fF3z15TkYHSpCQZWJhu4W/nJmbc96bHm+lWxwHPvRanmlQaCOAb/WBT9hfgCXgQ=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TYAPR01MB6363.jpnprd01.prod.outlook.com (2603:1096:400:a2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19; Fri, 26 Feb
 2021 08:14:47 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::cb4:9680:bb26:8f3f]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::cb4:9680:bb26:8f3f%4]) with mapi id 15.20.3890.019; Fri, 26 Feb 2021
 08:14:47 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 1/2] mmc: tmio: support custom irq masks
Thread-Topic: [PATCH 1/2] mmc: tmio: support custom irq masks
Thread-Index: AQHXCcvfz+AR7jGLlU+ZuaMIgxk2eKpqGQ3w
Date:   Fri, 26 Feb 2021 08:14:47 +0000
Message-ID: <TY2PR01MB36920AF027AA8B5F25F0333DD89D9@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <20210223100830.25125-1-wsa+renesas@sang-engineering.com>
 <20210223100830.25125-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20210223100830.25125-2-wsa+renesas@sang-engineering.com>
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
x-ms-office365-filtering-correlation-id: d6c2b801-0e93-47f5-f1b5-08d8da2e94e5
x-ms-traffictypediagnostic: TYAPR01MB6363:
x-microsoft-antispam-prvs: <TYAPR01MB6363D46442B558115E02A27DD89D9@TYAPR01MB6363.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZJHA2j6tSmFgTQGjStd/rfskIafoe/UIz9/fDpSD/7AfAkj6MDO++qwmNBhsdXUlYPr3V53w5vdiEsN8EnLOU/qEMb3uNgbiBPwKwngRAvadTlXD3Q1pvBAjAQxMPN+O6Uz0aeLt3qBW5fBtCDik9lOY9xBaK/5MyzRJid6AsvN6UpejdA/mK+k6tfHxYwQKUIgEMqbbw1CciRLlrgwNUEOG3hjF9+E6kT4IGsjlNEmphDDr/opSZGWoMK7TLSF/SzDpzKZwKdIhekhHvvk6ib/rZL2TBn8IU5Ngpd7ElF8NT5tDJujJrQ/C1pwK0CXi5p6QOv5GIdbYyTCTQ3MdmSACB1nSMt9jeOq3d2Ps/RLTOgO1ewloS+G+fGwZ2/z0CVeQqhao/stQU30m4v44pa6mPBpYXJkNNO/WesdHDcsYfHkqzhGVTrOAVdc55FuMr9R7k2D+BJxu008qBkJpXZHTCDLtHIxUOTk3H9dNyFCZCOb2rnVa2/KyJd1ZdcYIiDvNlSpSB+Xo9htSE91sEQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(39860400002)(366004)(396003)(346002)(4326008)(8936002)(2906002)(8676002)(316002)(7696005)(86362001)(55016002)(33656002)(110136005)(9686003)(66946007)(66476007)(4744005)(66556008)(5660300002)(52536014)(66446008)(478600001)(71200400001)(76116006)(64756008)(6506007)(186003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?dLJDDpCiKyKsMCafdXuDFgGVokmqHwLHzRTKKoCln5FB9h3RvOjGWjMJAl9/?=
 =?us-ascii?Q?UThdHy4H93+POo6OIv5MGpeZJ4TmzAkP2MoFr2WA/R/wfK6runlzHsVS0Dw8?=
 =?us-ascii?Q?y/E8bQNKIj899V/gpBAAZGRFRXilhKg7HaO3LQXBzL0cLOezXHZ57gwY/B9F?=
 =?us-ascii?Q?kSKrY7IKDwbl2QZZWIg9fMZwPcVG0SzPvHq7W1C7Cnx6bq8E643X6hBHma4w?=
 =?us-ascii?Q?TZ3XTrAqlD2vF3Z+SE+mWGIwRr5m5PR4C+zlDcsN3JCuYyctySoifqfuhiu3?=
 =?us-ascii?Q?7Nvq1bMQI2aBkjFhWA1rnrTCYKmUBneLERQfZjB/L/vAE/XZGXYljjGLzgDe?=
 =?us-ascii?Q?+pt0zYIMOrPi2W+taeN9qKmf85KsiEEjXF2jBMY2AuhxOB786jxgaoG3e0FU?=
 =?us-ascii?Q?eiW53omhTYFb/hAFrxgeB6gIBziygZ2d6cFfQnZekrD5xbe0w82mrSL0DYSN?=
 =?us-ascii?Q?OOaNJhSSYShaAePWzUarbkt6i7Ex5GvP5jH8R8jyqnQuGeUNqJg2e7p6lgqr?=
 =?us-ascii?Q?3Zz1lZZOkfJOfQCeNNqUYx1DwUAGpTGb9/FdwDHmH4nBfyfCh20zS4q+y33c?=
 =?us-ascii?Q?ZLYO7t/Ovp6WbOdhXkrGGDH7j08ntRvzLhtliK7/R8YxaUprVItm9Fls7wQD?=
 =?us-ascii?Q?mjWMVzK16HRyKRhUDtIwne61jRGwkbApVZuPVOApTLMZ5u7GTjMjyvU68EO+?=
 =?us-ascii?Q?gEz153NAm5K0u9yPGgqH+OtgA4PrQlDrTqxf8Y3jZSKNaI899pSujAiBCMtm?=
 =?us-ascii?Q?cubt9WlMaojSIm2kuOBh5vUnhzwPa8KvgjOS9rxBTNB8myRyfKuahfXdNzwz?=
 =?us-ascii?Q?fkhneVbdNH91FUISMAj5aI+dMLFunS1K0cxr4u/hrFQf6Y3KGEybKrSeEiaA?=
 =?us-ascii?Q?akX9V/pOm2r827/WQTb6xGhYzQ8b6o9MHDQvDEIgArTDW5pSddU89w1KBYoG?=
 =?us-ascii?Q?9gW0gJzgWDPdYK2zB3ztnhVpHalwgmwwXE2KXiBwmvm/HDP1Lvzs8iorHVzU?=
 =?us-ascii?Q?Kk9f2NDTM+QJ1CSWlTUbPCG2NjR0Bdpn9z+1ZF8LPWHonN/nMWmNYLtSfa3T?=
 =?us-ascii?Q?lE7b3g382qPS3TdXjOnh3vdV3Wa/zwWMiJeg6mxhAttap5sosgezvQyWNofc?=
 =?us-ascii?Q?InBMud198A3HuzVyu68ULYK5pDuiFIiaOWDl73qniPZjumE4NgXU6aUjuaJ0?=
 =?us-ascii?Q?r1aBt0iCYc7m4g0pv4K2A7POZxY6inp7d9JpjZvJgf8xDIx7JnJLIBxanHf/?=
 =?us-ascii?Q?prKYEWQr4/bJyzlP0kzGi9exkerXgL6Qa9vueYTxwCvfQ5QR9hdWsK/hcMfT?=
 =?us-ascii?Q?1/GUwvnrDFVd6WxeYi0oC7hDYVjK9XyEr+evUZptPpjPGemQJoEN7VRVdxhj?=
 =?us-ascii?Q?59UXGi8=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6c2b801-0e93-47f5-f1b5-08d8da2e94e5
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Feb 2021 08:14:47.3394
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Tan4PKea2JN60NZ3m0N5ZyCiDdbi+ZTqm1aFjT6sWe59szEyPupAB71HKzMHqI5qldPWase8ysw9XJ0cTARJYvdjZr6e7B9U3wtjumN6oMHVrlOpXnBJ0LhDTvjTQ3Vp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB6363
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram-san,

> From: Wolfram Sang, Sent: Tuesday, February 23, 2021 7:08 PM
>=20
> SDHI Gen2+ has a different value for TMIO_MASK_ALL, so add a member to
> support that. If the member is not used, the previous default value is
> applied.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thank you for the patch!

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

And, I tested on my environment (r8a77951-salvator-xs.dts) and
I didn't observe any regression, so,

Tested-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

