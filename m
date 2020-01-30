Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D6C9314D893
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Jan 2020 11:05:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726932AbgA3KFB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 30 Jan 2020 05:05:01 -0500
Received: from mail-eopbgr1410094.outbound.protection.outlook.com ([40.107.141.94]:46711
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726873AbgA3KFB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 30 Jan 2020 05:05:01 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XYldmrXwkcWVg8KWf2IJDrs2o2d2bK6c3ikM4a7g8PlnnNrbKPcc17UlB0GLeGf5dI9Lg0v8wlorRN0DJs4geIElrZkXGMGzA0derSGu+tPm9qYYfXBahh4SmOaQM0awvSQNHWqyLNzE8Te27o5hBvD76Iu0vGbmL1RaBa47zGGYeRSUn23Y4tYMSwWes0b4qMW1I4bG/FKZdazzN4rrJhdZrMK51lqfshPOhLcmX9jYpexZwQtpyQcOF62+4eYknCGLK0COSAdK10FNk7GwBR8ztyS+aQCzGv2y9QN3dskZsxeNrr4aUiMEGjMCKtA411KnfwAGBH4WPYoGDCm5zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qT9CsoSxCHxR3FD5wMSz+YFAidTFSqN4+KWmglvuUBo=;
 b=Lybz9Dr0UAuctBnt074ZHRiQz2Wd7uGZTS8iObFdZB9K+OJ61xvTVz1AYM8HXUhHgigYdH/p8UckFSSr3Gz28x42F6APoIZvZmvuuswzGkTjNr2L+W0m3KCDgeVF0NCxUW/8+8ETNiE2zI50idD+Ei714m8qBKNTeDBKfIvLLk3rgh+d0n7VZQg2qLv3MRasmB2JpACHhOGrwkmBO7mSGkR5MeT5x/1zOU23C5jYydcee1ukPltJadwx57iKFZp5Xe1o3m3q+pxzRX9ELRLCA0m7xPfM8w0gr39FIUSLjppv+56PMU19Cj1vV1tSXQ27rj2CdbNcRb3TqpgMgWYXSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qT9CsoSxCHxR3FD5wMSz+YFAidTFSqN4+KWmglvuUBo=;
 b=GxD9iz4oN5P/E19jA4nrfZ1CKsIJ9q2WPDdspwLaiMft27iJYT1AXdLWYwLkin4sNNwBpkWVh53wD5EXzSq8woPHyKoL9q4a30t0JX2Bi9lF+qIBPgmoATMYC+XFZ6FuArPUOskl3EthcZzRne8kZYkL32bcIo/bezAA0VFhg8U=
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com (20.179.175.203) by
 TYAPR01MB3390.jpnprd01.prod.outlook.com (20.178.140.86) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2665.21; Thu, 30 Jan 2020 10:04:58 +0000
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::318b:31aa:4212:bd49]) by TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::318b:31aa:4212:bd49%7]) with mapi id 15.20.2665.027; Thu, 30 Jan 2020
 10:04:58 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Takeshi Saito <takeshi.saito.xv@renesas.com>
Subject: RE: [RFC PATCH v2 3/5] mmc: renesas_sdhi: only check CMD status for
 HS400 manual correction
Thread-Topic: [RFC PATCH v2 3/5] mmc: renesas_sdhi: only check CMD status for
 HS400 manual correction
Thread-Index: AQHVtM7UXpTEE7bYvUGzLNyzZTZ2gKgDP0WQ
Date:   Thu, 30 Jan 2020 10:04:57 +0000
Message-ID: <TYAPR01MB4544629162BA30B0DB6FA903D8040@TYAPR01MB4544.jpnprd01.prod.outlook.com>
References: <20191217114034.13290-1-wsa+renesas@sang-engineering.com>
 <20191217114034.13290-4-wsa+renesas@sang-engineering.com>
In-Reply-To: <20191217114034.13290-4-wsa+renesas@sang-engineering.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [124.210.22.195]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 778160ac-0361-49b6-1329-08d7a56bdcd4
x-ms-traffictypediagnostic: TYAPR01MB3390:|TYAPR01MB3390:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TYAPR01MB3390C201A5C94C98DFCD0B05D8040@TYAPR01MB3390.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 02981BE340
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(39860400002)(396003)(136003)(366004)(346002)(376002)(199004)(189003)(107886003)(4326008)(71200400001)(478600001)(86362001)(2906002)(186003)(55016002)(81166006)(9686003)(8676002)(8936002)(81156014)(52536014)(76116006)(316002)(55236004)(26005)(5660300002)(7696005)(6506007)(66946007)(66446008)(110136005)(66476007)(66556008)(64756008)(54906003)(33656002);DIR:OUT;SFP:1102;SCL:1;SRVR:TYAPR01MB3390;H:TYAPR01MB4544.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qzvDTqW8JJSK5RH666/KymiYIeqmf45YlOtkz8F3IcLOnDMzjxHogAh9h3h0Xwd11xH9p/GapG7JHGUpwpN3qgdRxMKYduIKT91d1+L6N9NXKk0t+RBA4xPIHFUzYXyHoLya3KupUFYJywG/n3mamNKEhatR0rE5btf1libD9/FMM/bUScWV54IhTdF1+y5JPtgEGJFyEk5bqNCxWgINEMzFIbAaWFXlSviCkjGUU20ecqCUshv602cRY43UzxGIaYqwFee3/w0x0XSTlbal27O/BGnemZ25duvafc/K2tgGSXBP0yqNNzIPOdtNDBXGk/q6eFUd//Bv9fPzCjxL46bN1iWKNaQ65VcqT+Og88uMDWymWfrI82I/nqyyBPnt6lBE2Zkmtb8AoF7N+xrq4liYkjiRiib+By46NT/ZdXFqXTM99bjouNTtDXbwA95Z
x-ms-exchange-antispam-messagedata: gwh4MLumPGK8XKMXJYjVtyvbq1gWjnyMTohhIMsXJ3WxT7+xVMp2H+UvLLc+W9k+FPvGXAQzbzNUsN0mo3PzWrPQNeFRH4a84f0k/sS4HqjZ0Q8BqtRZVQc22obMvei+uiF4p20U+LAAAj/8/smXtw==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 778160ac-0361-49b6-1329-08d7a56bdcd4
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jan 2020 10:04:57.9335
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KEbmHFcOaTDwZSfR7a4qcd3kqH5UzdWVkGYWm5KZUS9AVDG2/T9n4aAtu1eqgjWcTVyegSIpwCBvvT+nS7MuuAfUuWsge06XPRLsBjitQqqNRE1JSIQuVnZGUAOxVIey
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB3390
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram-san,

> From: Wolfram Sang, Sent: Tuesday, December 17, 2019 8:41 PM
>=20
> R-Car Gen3 cannot use correction error status with HS400.
> HS200: CMD and DAT signal timing are based on CLK signal.
> HS400: CMD signal is based on CLK. DAT signal is based on DS signal.
>=20
> In HS400, CMD signal is 200MHz(SDR). DAT signal is 200MHz(DDR).
> Center position of signal is different between CMD and DAT.
>=20
> TAP position should be adjusted to the center position of CMD signal.
> DAT sampling timing is adjusted by HS400 calibration circuit regardless
> of TAP position. Refer to renesas_sdhi_adjust_hs400mode_enable().
>=20
> However, correction error status contains CMD and DAT status in HS400
> (DAT signal is not masked in HS400). Therefore, correction error status
> cannot use in HS400. It means that auto correction cannot be uses in
> HS400. Manual correction can change to the correct TAP position by
> ignoring DAT correction error status and using only CMD correction
> status.
>=20
> Signed-off-by: Takeshi Saito <takeshi.saito.xv@renesas.com>
> [wsa: refactored patch from BSP]
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thank you for the patch!

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

