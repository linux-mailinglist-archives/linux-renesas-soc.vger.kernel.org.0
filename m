Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 946C52B15A3
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Nov 2020 06:53:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726163AbgKMFxn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 13 Nov 2020 00:53:43 -0500
Received: from mail-eopbgr1400111.outbound.protection.outlook.com ([40.107.140.111]:52659
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725962AbgKMFxm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 Nov 2020 00:53:42 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eHlc6JcnpH9PEQi1XyD0JvqBcADi7tn8iRb5Ubh41JemfVERYlypqQVkVPkXKIkp6oWTNvx+DwooCpZZUVfDiDHnINX7YK4StZa9jmo0pBV+PELETrHmK/WLQeIqeYcUO+4fGCUZE3FFJYVVixJuy83nSbdbJ+MPftaijYoxL5kNOBf36AUjju1beQiandwi0oYnV3H/107Q4dyfI9iuPr0jo9gpZDK+pTNTsrmjIgpW+KL5PXzDss7mPPZvtu+k840f6yZMf9TkDVptb3CaI4yi7sh1PTi17MLOmFLDVCURR+muGGncQI7l3+5FlM/BUDkPgn7fD5WORxpfPaXcog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fpIwkdqJVrcuKEfPBYqPhobiEf/Wm0aIfvD9rDiAQFM=;
 b=Qkc5FKnLW4OA1WT5zZUM9jwYpz/BO+Gbgvq0S9/pGdbyQozwzHRWw0l3ToWzhQOlHviOckY4y92pPE3x2AVoJ9Zi3GdEb1i3BOm1TP1Lddh2sU4IPvJdVLf+gtU5XnsPfgYTEGvZ938pgMlGJW6TrGHRtnGp4fLWmldFrCBfeoKXZDSgbChCZ05/2FCtdAsn1YImUAnma7D3eDFf47Dupur2WRDnjw8A/+aPMp/+f9TSjCyLVp7QRcq7hjkAgAggb7wLiuDDEiUjE4BwR4QHD3VNIe2NIv6sFy0tbKnlHoHc+aS6eU7v5xGnWdCAMtfaW7UM9/kep8CJeBangmSbhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fpIwkdqJVrcuKEfPBYqPhobiEf/Wm0aIfvD9rDiAQFM=;
 b=Y0G2Yjq+0Qfci4+1HyFSxktS0pzWtHr6gtiLd6PM4ZtZJ2hOze+FCDHjWE1kCvldtl7Z6pLoZ9dd7zTCkMe3iuKzah6Vy1wNkvEMDFhco3qvzGvlkPXulMi+HQ0L2Pe43Q5cq3DGLpffDKE4xDu7CbEzSKorpo60AjsQ82BV/wc=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TYAPR01MB5279.jpnprd01.prod.outlook.com (2603:1096:404:c8::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.25; Fri, 13 Nov
 2020 05:53:38 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::bcba:dccf:7d4c:c883]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::bcba:dccf:7d4c:c883%4]) with mapi id 15.20.3541.025; Fri, 13 Nov 2020
 05:53:38 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        =?iso-8859-1?Q?Niklas_S=F6derlund?= <niklas.soderlund@ragnatech.se>
Subject: RE: [PATCH 1/3] mmc: renesas_sdhi: improve HOST_MODE usage
Thread-Topic: [PATCH 1/3] mmc: renesas_sdhi: improve HOST_MODE usage
Thread-Index: AQHWuBHV8fJ5uNcikEOO7oep4YAkpanFklmg
Date:   Fri, 13 Nov 2020 05:53:37 +0000
Message-ID: <TY2PR01MB36926F9B70BEC3C4CD5A1F35D8E60@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <20201111100244.15823-1-wsa+renesas@sang-engineering.com>
 <20201111100244.15823-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20201111100244.15823-2-wsa+renesas@sang-engineering.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: sang-engineering.com; dkim=none (message not signed)
 header.d=none;sang-engineering.com; dmarc=none action=none
 header.from=renesas.com;
x-originating-ip: [240f:60:5f3e:1:19d0:b06e:df1f:82b6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 76a3ee6e-5ec6-4a8b-75f4-08d887987765
x-ms-traffictypediagnostic: TYAPR01MB5279:
x-microsoft-antispam-prvs: <TYAPR01MB5279F10CD06701896E22A40AD8E60@TYAPR01MB5279.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TT2XoO6mB//I37ufUsESoqF09zotq1sJIUvXRZ5clFqQfZb9wSsGHl+O2GBi9n9NX7z3xJhIXBSDXTUcAA3guYM99C/tOe6SNym2HnICo/RFNDe7BVwnhCPvB1PjLvG/maNcfYJlL83OoC1rjXXoSOsaWYUPdSb+xP29twjc3VtVn+8YekrN4FPaD/hVGqKj97aPFJ1BpA/PJ1gKjLgWkUA5VdYounf/mE/4NBqnBWf5z4/g5vopn7IF0RwVqaMJ+H8+bXAznSg4ni/+/PKYVfk/cJg8jVpvUVSoVhO7lwatQych0iHQGUisBCmepMuyoS3xRwaotWt0aIrXQ0yfcg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(376002)(396003)(136003)(366004)(346002)(64756008)(54906003)(66946007)(4744005)(110136005)(186003)(52536014)(71200400001)(66446008)(76116006)(33656002)(66476007)(8936002)(4326008)(66556008)(7696005)(8676002)(478600001)(83380400001)(86362001)(6506007)(5660300002)(2906002)(55016002)(316002)(9686003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: HrohsHkRUAX4itdcwGCff8QuhZGGBCsaLJ+3a6frh4DXOLGG4RWSyqy/6hJhX1KK/PXeFY2kFROcY77edr80WoDWfdwq1q/+McBrtW1u5SkLXb4kNEUiNqQWT03pDldFwvoibGxLTbBwOcOZ2aVx9+NWZ7yWPZ+P/Z5BoPXHLyGnfeTgC+Pp7rkxpxRse49e7Sh2+2sTkzsaIEhLB0uVmW9GBFDPH0Cmu1L1jpRf4TFvum08s0rl0G8fdsQOlfEbgCOXAwmxsEZ4CbLpj+RgmwWSi4wGpCz4ptFCioIdhGsX7bCpp40zqXtRKLhU9AqUDkUuc5lY2Y23WcPWKiBg/NuTyLwcez047h6j7k/AhR1a47AbBpmamUXrarxb6CFnt28o+VZiOiQOAjNOiIwQn2VlN6NQWQisiCdwqucyaOSf2Nzqv/H7bP3iRaG904L1hFh+GAtsYlOTKeaw86gnsvLTxuVZBYp0RfHpwAvHQeZDBXbccMhWFcg3HwmT1zAJ5qaMg261CRohqd2JEdxf065rMJdGvhz5QshpbNAKtgOkKJj+seCL4x0TrW8nmyfuaefhsweimXJR22YnYBOzRJRE4zoBvtoQ8WNHt9ejwH+e8945R060Su/5iZUJ7uqrTyUqfjjlgFxt8PL2xe52OnguVcP0JrBI4q3bTMj7F5ahiQb7yY8kM7HKjYNGna7NoydU426h3j1oO2CuZRCHqg==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76a3ee6e-5ec6-4a8b-75f4-08d887987765
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2020 05:53:37.9672
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NDwjQEYDVuG82AfMUT1Kzsopy5jlswlO5ftxCuclcdxZsFhz6iA+JwL+l/XtswESQIxM3XLBSHn3D+tlbIHaYEEgs5uuYNW991Gwf0RdzZDvn2qTdsr3J5mJcjBvbZy6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5279
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram-san,

> From: Wolfram Sang, Sent: Wednesday, November 11, 2020 7:03 PM
>=20
> HOST_MODE should have a CTL_ prefix, too. This makes the code more
> readable because we immediately know what it is. Also, remove the
> hardcoded values with something readable, too.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thank you for the patch!

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

