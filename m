Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD40636061D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Apr 2021 11:47:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231791AbhDOJrm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 15 Apr 2021 05:47:42 -0400
Received: from mail-eopbgr1410104.outbound.protection.outlook.com ([40.107.141.104]:41088
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229537AbhDOJrj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Apr 2021 05:47:39 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OycMQSUSFVYUmhUyxRhqyeD16Em3k1aeiTcejKsEfmCmb3ZCO0tV5apY98wuhHZ63sG2d/JSvNqUo6LTCsnslCQfMop0npSSfp5UW1iN1D+2ad+phtCArJ1ONZ8g5lr66SEbanXT+4WOAX3Z3pFK1qTahS6tztKUI+VdnX8XVyJaesvepwDObp0NnVqovXv2t7zfP1cvvPBS5teA/N1Vhu2X/mZBnIICYTCaWSrFJG+KJmBa9zFOSgDmA60VU2N+uOfGTKLkNf5Fd68Vnx/akdkiP1Ai+Q5PSF998tZp4FehlXRf7ObcHQ5Gf1QQPGrcPxBZ8awns/3PgE0T3aVehA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SmcXrKzKV3QIdtbSz54BW+uSJQaQcutzLDZdOpeUiSw=;
 b=UrL6HbsOX2shlqmZ7nL2Og3uy66TFw+5JYB4XaJAd2Zp4qpZg5MbYRbuneCyFXPPWPFe4wnOdfV1LpUnBuJTPmiCHLNQnFfUroc99mU9iIY4hev89z1NTcvuwpXFIjK6a3AkG0SbJkxlx/ONwAONbe8a3JcWMVrhlOWXIAAt+01Il4e9illgGy+nZSoPmyRd/tfuGnpOp5HQKhk493ysxF1bgTqSh/vXQE26jPv8Ry5g3bBRie4SVI9iJ6p8MKnZxKw7Hk4Xz3zYx2zpfv+7HHSz547MADDoRHm7avihHaYSr3SYB9sga1x2e39DQX7GuxVqsNIicwOwx/cNw1QH/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SmcXrKzKV3QIdtbSz54BW+uSJQaQcutzLDZdOpeUiSw=;
 b=ozVdRhk+XDlTz9lzNXQ0XypUQyqiHbjvAcCTui+KNojuXlWULCCAu+9UqExCoHJLDUEZ1ffNfyxPUXwFMgw1STwLLnZ5OlIgGpwgj4Dekiddiwp6Csr5P+p8NsLPJmN9us5xEt42qb6Bc12T78/wL4/GF1urwi61jEqUpHKGbmQ=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TYCPR01MB6429.jpnprd01.prod.outlook.com (2603:1096:400:92::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17; Thu, 15 Apr
 2021 09:47:15 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::e413:c5f8:a40a:a349]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::e413:c5f8:a40a:a349%4]) with mapi id 15.20.4020.023; Thu, 15 Apr 2021
 09:47:15 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Ulrich Hecht <uli+renesas@fpond.eu>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>
CC:     "wsa@kernel.org" <wsa@kernel.org>,
        "geert@linux-m68k.org" <geert@linux-m68k.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "jirislaby@kernel.org" <jirislaby@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] serial: sh-sci: remove obsolete latency workaround
Thread-Topic: [PATCH] serial: sh-sci: remove obsolete latency workaround
Thread-Index: AQHXMdq/NRT4CJ3LNkOhbWAbrzYf4Kq1VKuA
Date:   Thu, 15 Apr 2021 09:47:15 +0000
Message-ID: <TY2PR01MB3692CE159063FCA98400E971D84D9@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <20210415093547.21639-1-uli+renesas@fpond.eu>
In-Reply-To: <20210415093547.21639-1-uli+renesas@fpond.eu>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: fpond.eu; dkim=none (message not signed)
 header.d=none;fpond.eu; dmarc=none action=none header.from=renesas.com;
x-originating-ip: [124.210.22.195]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b218b207-842c-4169-5ff7-08d8fff3738f
x-ms-traffictypediagnostic: TYCPR01MB6429:
x-microsoft-antispam-prvs: <TYCPR01MB6429B1AAC3C1350272074B96D84D9@TYCPR01MB6429.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BKpJ9njYrr8Ks3isHjiRSg4+BkxnDgyCWl/3m1lAi53eAtg66lLfOijxgsC1pWaMnkN4YQvBnVkxmrqYwyvKDrnnBUSk5+3QVH6vgb3bcJopY3ZHGG6C1D7Kgn6qfx7O/3qCVDZmz+A5dnvKc7D8hSysol+4nSiHSOlxJqu6QJOnH51RSvXW5YiHUaeZ3v+kRFR0V0NZFHT4rfPjP4gSxoPmIeyYbXwfziDHXKd/zpV6/ihVUPC32TfNGYUzB0I+ydNUdiazKpc9aDlePIjTPzcw+FZTd7sRLmXIg9s2qYgVWHQK8+LbatwjqUuQutovHDPRO8k/EZfILJ/F9Gj6lp5PCBTTzEfwHGBdU2ck66UUIZhkbIcBRjrCrDJQag+58HAqRG6Vy4tMkkDjiH4CKtEvzLBacSzpN3BGT3aTK8aTJbMi0sT/05cp+WHe5IzgSIMoJKEW+2G015RBTl+VwhiNd/AEpJv+B/FXtJFE1YTY/ifT7cBZ42H2HrA8Id+wcnS2P3WLOxoI8qrSxX0Tue/FdLVcD9UuhlzAE2kxZTps5LlyW3V8e3EFkdtuZge/PF1aO/X+F+aEqJyGaDvGsDUAxdtcS1NElapC2vP0Gu8=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39860400002)(396003)(136003)(376002)(366004)(7696005)(8676002)(71200400001)(26005)(66556008)(66476007)(54906003)(2906002)(55236004)(186003)(86362001)(76116006)(66946007)(66446008)(5660300002)(478600001)(8936002)(9686003)(38100700002)(33656002)(52536014)(4744005)(4326008)(6506007)(55016002)(122000001)(64756008)(110136005)(316002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?kRriRFY+dtAO7s1bWiR/KJIWJUJ1EszrDBGACkXBt1VrdJ5kThKg0TmSUcx0?=
 =?us-ascii?Q?EdC9zjzDE9yNOCOpWjGi9pvPLcaaaiDstuwLqKJNAb5uzUTJR69BIMQ9PB+w?=
 =?us-ascii?Q?6UMQnt92WzwE+hjtwVDu7e8dHLuSbuIgj2n7dhUV5mkH5xxfuc3vLrjUPoiq?=
 =?us-ascii?Q?ch0oePvV+3tvDchuaKBZdzgHCEMKTpBSt9Vrc4GaX6QUmEfMgJbV6/mgjXSW?=
 =?us-ascii?Q?44Fa/inhJrMX2hswkKJ0l3wKook61e65DiyLVNITQmE3WZ4SxYiDNlEQiSGl?=
 =?us-ascii?Q?197sdgI4CRavIxoV6p2ZOa3OZ5t3mittMYC6Skpo58HHHdBW/8PbzMJTkZ/S?=
 =?us-ascii?Q?4yrnsknTmf7a2TfhrIojFcs0b6sfZjowOU17jKH/tQAo75/lmCF040imCzOj?=
 =?us-ascii?Q?uk7HHMhoyc10XFKJSzvZE5T1Ly5Kyr9cdxtowAWlflJRIZo2z0nhg7xw2iWT?=
 =?us-ascii?Q?D493vd5RN/9r9rOZ9gUIVmPKMKubbcTqA8OqJGjq20HEFJ76BumAO2IVfJIF?=
 =?us-ascii?Q?QcyzVqtAqIATaHe6TDyhKBPKdihNOto9iNmZH30eJ5uc6NEkIBpm5cgTY/aA?=
 =?us-ascii?Q?P4l6vuihiLMZhewu7oeatdUipu3QRPNCzDMjdSKigs6O09nqtsKYBlsVxHiJ?=
 =?us-ascii?Q?X8xcFDjJy66rIF57zmaJx459GB4ZTdifYOZum7/ugWvW3e5/0MVmohpxaBQe?=
 =?us-ascii?Q?prmcstiFdvMRI5789XJ67u5+byscMFe1+wSNQXywxlZUOB1zyytwBtL2cBXi?=
 =?us-ascii?Q?Il6ZD4hjr5Q+lNJfD2uGOE8uZoAqVumuUXqLsIEAg2ds10ljTlktJvJ2IUt9?=
 =?us-ascii?Q?Jr563SXwMqEsh/bIAIEU0jj0EcCVl5iw5f9fTBxT+NU5u1afVxkbAwM2fdDA?=
 =?us-ascii?Q?1IjxGnm44zTSFHdO1ocSUz4PKYbodqMr018CvjzWHYPQ0Gkj6lXCxNQnd9Y6?=
 =?us-ascii?Q?fGr194qtcgGRrRP41vRX8RoU2hqNDy4PE6wK6ZEHhGGLcNI+973vvfJLijVX?=
 =?us-ascii?Q?muvShgZ726UFdlvDEsvYMscgyLKpEWUPUf851KW8Pn8H2pDb6WudJMTJvkRF?=
 =?us-ascii?Q?k+8ljMl5pLyrd16x7i9qD/cKIHK4QOSl3H5WHXW6NnT88KDkp/Z3Scl0JkmQ?=
 =?us-ascii?Q?OxS80PyJ2QT3DNmpfKuF1My3MI2oiuuPemKgGzPVI0foXTJII+6DiSG6paWA?=
 =?us-ascii?Q?XPkf4pzsv3HtY/w01uQXqCKvCXFD3+LJjOuG1V8Tixyx5lZktAn+kRZo7SHJ?=
 =?us-ascii?Q?6f89iIPNn4zrkHMdPgOsAgg0MwjoDrOnSh0rqCRK5B746lBjhcoDs8WkYRG4?=
 =?us-ascii?Q?W9knpbY6PhnxkJ1KVoIIMA+c?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b218b207-842c-4169-5ff7-08d8fff3738f
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2021 09:47:15.2437
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dYgrSfZ6/XSYh2UiOejWef7ewPrqSW6cD2xXbEcRjsaml1g1StO3ompQqQvPawBcVfeUuztTNtfBQDAhp4g3oBRZna/LaoV6i8+3qpYCmSk3x6Xpd3fn3LMTjrb/vxR5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6429
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Ulrich-san,

> From: Ulrich Hecht, Sent: Thursday, April 15, 2021 6:36 PM
>=20
> Since the transition to hrtimers there is no more need to set a minimum
> RX timeout to work around latency issues.
>=20
> Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>

Thank you for the patch!

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

