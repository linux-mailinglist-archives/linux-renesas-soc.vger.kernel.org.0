Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D50A0193972
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2020 08:14:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727611AbgCZHOt (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 26 Mar 2020 03:14:49 -0400
Received: from mail-eopbgr1400134.outbound.protection.outlook.com ([40.107.140.134]:43261
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726014AbgCZHOt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Mar 2020 03:14:49 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z/Cp9f+M8xCDu6ySJZ4Y7IJeMF+0FI5KZEM/1iANT0wiKAX1povjYLEu5pSQr+Kwn11upcntv53nIf5h2sxJDi2lrrgSPdboTI+BpUxkoBCT9tE6Kim6mqL6Wc+GVsE0Pjt4hBlIHyUq4BS0lr9MjJekPHGlf5KoUB23amVLsrBrg9givvhQjtdf628fijzL8+H1+JuYN49sSgKoFkLYLYFBaLfruQhsapYzZ9kUz8j1curNHSmrKT+BpkU0KCjd8+ezadasqB17oTRv/9q0VyVkpRzD8oQSjuLIzV7NhBFjB9XtzKgQHoL5MOjqaTYX7mNI1v3LBAaO6Pd4Z9VF8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F+AAfaVUc3SqL1tEnESGRAbnaKIA0WHFZPnBTUxlGTE=;
 b=OvWeyvwRczz8oluYSywOuLPJymSjvm39rgIhOIO4tVVRHK+FyocS3Jfn4nRhoI+fmp4Ss4oJeAuz0hvpCpi5lxhXU3LqLcSxbJkf0h9TkQkZiJ6+lf8yCsIG+MsZoRMWmnA9/gPQ+CfgoDJ+mS5x4BjP2b/YSCJL5sJmoyBP8Re4J6wrz+cTBcUSe1GU3KI377hLKylWJVYug5VPqHZxRWtHg3nYeybazKLLpVQcDcwtKFg0ZrZPIbgO7you9i8Z91Xorb0aVgX0Ww64xMVup1gxxt48ZEBgATO3mjIVEsj/UHMOycfRkVXciEdSqaGMt6aWulJiWDQHn53SLCZrvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F+AAfaVUc3SqL1tEnESGRAbnaKIA0WHFZPnBTUxlGTE=;
 b=j8f/NSIktPrhqv+1KOMwNvOPF4dAFPFt2wYz0B/PBENLjE+vHIKDPH8r8tvLIldOnn9ae3Ms+dPqgx96FQp8GHu2NlhXA597tBPTiPr7Kpe9jzwr6aPmb0LSCOf8/hVPBGHcLZ1Zkwo2qxkmzHSHYI2VdpBMnMH6YLp4JepPLrY=
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com (20.179.175.203) by
 TYAPR01MB3678.jpnprd01.prod.outlook.com (20.178.140.77) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2835.18; Thu, 26 Mar 2020 07:14:45 +0000
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::ed7f:1268:55a9:fc06]) by TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::ed7f:1268:55a9:fc06%4]) with mapi id 15.20.2835.023; Thu, 26 Mar 2020
 07:14:45 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        =?iso-8859-1?Q?Niklas_S=F6derlund?= <niklas.soderlund@ragnatech.se>,
        Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>,
        Takeshi Saito <takeshi.saito.xv@renesas.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>
Subject: RE: [PATCH RFT 3/3] mmc: renesas_sdhi: improve TAP selection if all
 TAPs are good
Thread-Topic: [PATCH RFT 3/3] mmc: renesas_sdhi: improve TAP selection if all
 TAPs are good
Thread-Index: AQHV85odr0ImgwdgDUWBHEt9LIl1N6halHyQ
Date:   Thu, 26 Mar 2020 07:14:45 +0000
Message-ID: <TYAPR01MB454452AC19B403C588D85058D8CF0@TYAPR01MB4544.jpnprd01.prod.outlook.com>
References: <20200306093159.6155-1-wsa+renesas@sang-engineering.com>
 <20200306093159.6155-4-wsa+renesas@sang-engineering.com>
In-Reply-To: <20200306093159.6155-4-wsa+renesas@sang-engineering.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [124.210.22.195]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 2d4ddd42-f3c8-4d44-e25c-08d7d1555cb3
x-ms-traffictypediagnostic: TYAPR01MB3678:|TYAPR01MB3678:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TYAPR01MB3678DF84FA1140DF719D4475D8CF0@TYAPR01MB3678.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0354B4BED2
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(366004)(39860400002)(346002)(136003)(396003)(376002)(186003)(26005)(6506007)(52536014)(86362001)(4326008)(55236004)(2906002)(81166006)(7696005)(76116006)(9686003)(81156014)(8676002)(478600001)(316002)(55016002)(71200400001)(66946007)(66556008)(8936002)(4744005)(5660300002)(66446008)(64756008)(66476007)(54906003)(33656002);DIR:OUT;SFP:1102;SCL:1;SRVR:TYAPR01MB3678;H:TYAPR01MB4544.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eiKVPUfbNO/gxjqYEjeN2rgY8HPeHJ2y2iIilJm8e9O9IMLHC2V1WsGL7bM7POy+xLvF1hRzD1ziZ27/jWnghuUzWenLDgH1NgAUDWzqqa9li78+/n9UJlt6YmL2zt+3KCZM+uWDzlVYaewWL37y/gXwwqPOj+fFr6cJ5srWR+GyAVpa3zP6LtinPztEd0A1tVVQmju6hfv5ac122bUAHLAw0iHDgWSrG+nmku6We/XRq08DcDmHUsKlwU4yP0TBQZ3J5QlywJF4++TFwCmYroUzCVQelT6wzyGDimLcKt7IzRlyYw3PvMFB4Sz5+kc8cmQK368ToEwBA6DQXw0+GTLkw971L17C06EXwYaFZUSYVKKcXbmX6tQRtMEXoqo1/sa3SQRDzzFc7SO+6q+UrojyYxa09kzA0EmDvEX2VHFbhndF8G8kLKgFgcvAX8TT
x-ms-exchange-antispam-messagedata: frMTpJn+BxxhbOstyGjdiQNz0mZiQQj08HoKR6CmhX+wV95mFmj2Hpn7vzAzmH9Eil7WQNb7FseV0yosXbi5VXjly2B09TbeZqjjXaUaaAmxkUuGgPprUQV/2aoq+2D6FPlAuKBG+XPuP/jn1rm0gw==
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d4ddd42-f3c8-4d44-e25c-08d7d1555cb3
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Mar 2020 07:14:45.2843
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LVeGYUX+yVnzHLMYeij9jzSLhPQIm0UkKU0mS7mEF8Q+xPip+SMGv9l2vsdWXzPxd3x9mbavmdEwhQxkY3kPPl892AhJsQwqY/rDAbxZAPUyCJLBLk8gxNChZULWZWCM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB3678
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram-san,

> From: Wolfram Sang, Sent: Friday, March 6, 2020 6:32 PM
>=20
> When tuning HS400, if all TAPS are good, we can utilize the SMPCMP
> register to select the optimal TAP. For that, we populate a second
> bitmap with SMPCMP results and query it in case the regular bitmap is
> full (=3D all good).
>=20
> Signed-off-by: Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
> Signed-off-by: Takeshi Saito <takeshi.saito.xv@renesas.com>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thank you for the patch!

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

