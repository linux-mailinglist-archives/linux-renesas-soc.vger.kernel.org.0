Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5EFD12553C5
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Aug 2020 06:31:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725849AbgH1Eba (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 28 Aug 2020 00:31:30 -0400
Received: from mail-eopbgr1400139.outbound.protection.outlook.com ([40.107.140.139]:56497
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725846AbgH1Eb3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 28 Aug 2020 00:31:29 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oMahK9f8U5WSst8eefAmU8m8GkkMDucBbwlfRB++FGy8uPbNjW503mHrEG0vuz6ZaBfJyyJD1jaTridpyjzkA3bbsvxPB/rZJgHxkNgtolqzZFvK4P3eipgo0WGDHuW6fcyvKt8pUHeVpwT+42coRGU1rX/LpdAjVvinojAEGjOtN1xr0F4iccf5HDzEiuv30u74zBROVyB9oE8RmuEtzhPveZYmGS97OOzcbyCVr+76D2+d2Nw1FrqVMB4eTLpesZ/cTj0O7lJ25O2pXQwajJ5h61bHb3s2VYk8Ge5NhzSVM5a1H4mQBtunY6LHFciKMk2YEKkDnSogomTYfH7FQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=viXwzRGAAMHEpNkJpjQX9LrSNhEP6fQUInYIiUCM2ME=;
 b=J3gJ/gDOQJrleGwxvh7CK2QHyBWxKVs4tNBqjn6kz2ysmQs+a9Xy6YMpUsxOrbltnm2mEGfrG1hrk78TnKGl7m4Vu/7YH14BI2ZltKqUXJ7VpndnAA/GxzkTNn5wUOvtnhvzAnuXKrLhPPc0QXxjKvkECm7EKnQ8Dpy0I5m23ON9GUCmeYYq0qGq9lbRWiBJzLrfIY/nsu0ZEiyahHLvBVoJQxmJ4OMqQ7IPQQiJ02lSBuVpX4QPEv81ruNdiL1FtTksLCKApfO3AIJjETiFxLBmkPyfJ5zYStrivjsH8J7yvf0gWvTyYjvd5pr73fNhZ9Ti4e43K+NLxwVjESM0Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=viXwzRGAAMHEpNkJpjQX9LrSNhEP6fQUInYIiUCM2ME=;
 b=CrsQrutrGuFBNo+HqZChqf4OsN8AnOfuEHlH8jTUOQ7HJ7254P8TQhX/KQj0kyYEyj9Wv7BG5nfcQgvGXQEj4/gkB5Lp6LxNY64+Oc7TEYn4VHs8Odyi7bCyRj8615AW013OXu5CIeWiqDBBmHvmr56lnwG2RjSYGLmpoPIGEq8=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TYAPR01MB4541.jpnprd01.prod.outlook.com (2603:1096:404:123::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.26; Fri, 28 Aug
 2020 04:31:26 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::9083:6001:8090:9f3]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::9083:6001:8090:9f3%6]) with mapi id 15.20.3305.032; Fri, 28 Aug 2020
 04:31:26 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        =?iso-8859-1?Q?Niklas_S=F6derlund?= <niklas.soderlund@ragnatech.se>,
        Masahiro Yamada <masahiroy@kernel.org>
Subject: RE: [RFT 1/6] mmc: renesas_sdhi: move wrong 'hw_reset' to 'reset'
Thread-Topic: [RFT 1/6] mmc: renesas_sdhi: move wrong 'hw_reset' to 'reset'
Thread-Index: AQHWdvVt09dyPjOX/EKSPLUzzlKUOqlM+KoQ
Date:   Fri, 28 Aug 2020 04:31:26 +0000
Message-ID: <TY2PR01MB3692905B1ADEC92B4464AF4AD8520@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <20200820132538.24758-1-wsa+renesas@sang-engineering.com>
 <20200820132538.24758-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20200820132538.24758-2-wsa+renesas@sang-engineering.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: sang-engineering.com; dkim=none (message not signed)
 header.d=none;sang-engineering.com; dmarc=none action=none
 header.from=renesas.com;
x-originating-ip: [240f:60:5f3e:1:b16e:b7b1:d350:3c9a]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 60b819d4-6471-4d05-97ae-08d84b0b3a33
x-ms-traffictypediagnostic: TYAPR01MB4541:
x-microsoft-antispam-prvs: <TYAPR01MB4541ED84C1E7C022F4236A09D8520@TYAPR01MB4541.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: opa8VL45sRhK0wtkjbuY4ME4XW1VTTiUzG2ybH2bKj7psV++7FpORuk4fvShnzIFEmc2Kt8xmK/xOqr1pgl0itqJSVvqcmnrkFKS7qOArw8wWeEc/jYHeUd2YmMQ8gssqLOWLzQFsvX2jVQilrR0m8TDxjb5FIPnzKmk4s0ITmY4lDOXSyAuKyfIIBJUKuJl/DMzIPRPrEtgTZVJ9iUSRY4tH4aFnASYRQX9AT61sPib6l/L1kwS0tJG26Up4CmPQxFRdbePxI4Pm4Xz8TuWhKzGbG5jtbfad0EbG1VOJ+0fcL3Ama+63e2wa6te6JsKQP5V+0uSFhdmXaPvDklw3w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39860400002)(366004)(376002)(346002)(396003)(7696005)(54906003)(110136005)(55016002)(4326008)(71200400001)(186003)(52536014)(2906002)(33656002)(5660300002)(86362001)(4744005)(9686003)(478600001)(6506007)(64756008)(66446008)(8676002)(66476007)(66946007)(316002)(66556008)(76116006)(8936002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: DaTnSPaRkK9m93pcZJ9gq/03ChYDe4nBQQ1vgQk/uOHcatcoCunxT/DMQtlVt5euT9ZtomaVYwx4y6l53GHNvpK53CQiMBzq/RVv0MbynBOUyVMSVjXhm2cnG31AYPaQGX1ZilAHXFqawmAiLL5YfsfnXQyO3mwZM7BJ9NwjubRIlNa37yIgd++TLfFHaIvIPb+TLhsM2evPxDdEw7lJYWfOay6sGpa8HWoGM3xXLC06P2B7feqrpBUIOz0hLQYVZD+suJ/zyYLLdM90PzBeUrGO7K6Ngz8nYadh1h0RF9YU5OZ4uKLcX8PVMFGa9AMz4rpNZYeALfyRoVxdHdreeGXEO4pB6gswVgNrLAsYFpwCb+A+8KrccgDzti0QIp8Vx0OsSH+WdJLeLHyLtEoAHqnxZxP0OZ1xQp2BWlAAyCpZpxwLqlm3f2eGRRmSQYdZshq/O263M6rTl4rqwnrUfj+9V9cqdaMBNSXUhe3JufXJmU5m+qYfeCoOOemmbM7HvlyD3u/Upsul7KsG2ScZLpflXMsVEiAlPjv1gxggkxBbzVQJHwu3akWg/pZTGTSKviK25ObpMSrMWWtjjuiqsQIo0DoZ4UHggxL+d3sRy/Fsc+0u+X5Wb5drCh6PPL7cIOZlDwRkNmtxQ0aS2YYMblATHYXFuN6fPMoe+EQxw2pU6mRqizil9ah4TmjhINps9+RnqVjtb2CS24Ny3+tvSQ==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60b819d4-6471-4d05-97ae-08d84b0b3a33
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2020 04:31:26.2690
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7QCCNcSEOTjRYONe3bcsSUkCnRgmk2FlO5KlnIDzHTp4nykXNtH7jeL9nQP8enuKF+NHRYt5HmIMODHY/xq2LzVuujxs9ZTzh2ybKyAahYAsVRgVJtkq1Tcscz4HGZLH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB4541
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram-san,

> From: Wolfram Sang, Sent: Thursday, August 20, 2020 10:26 PM
>=20
> This driver got the usage of 'hw_reset' wrong and missed that it is used
> to reset the remote HW (card) only, not the local one (controller). Move
> everything to the proper 'reset' callback. Also, add the generic reset
> code from TMIO, so we will ensure the same behaviour (it will get
> refactored away in a later patch). This also means we need to drop
> MMC_CAP_HW_RESET because this is currently not supported by our
> hardware.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thank you for the patch!

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

