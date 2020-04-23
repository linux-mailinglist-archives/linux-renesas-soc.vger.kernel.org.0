Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 148911B5930
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Apr 2020 12:31:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726994AbgDWKbF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 23 Apr 2020 06:31:05 -0400
Received: from mail-eopbgr1400131.outbound.protection.outlook.com ([40.107.140.131]:28396
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726764AbgDWKbE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 23 Apr 2020 06:31:04 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fhshZhXRZdlzARO+Zp7lACWiYUc0BMkhw+oprG8AyAnI2uomyczkxIaUFu92xvFdmEQ8Xsr2Lo0Jw7mcO7Gwut3s6dij5R0bgtmHQNj4LVSK0nH7cVQ9C5sJcqlOCgbXC3SvoZa2gC/HJQD4FbVRDc2mXf6mHgTCf3GiXA4sUpgOUl5p6DnFhtGqbGO3XBtNq4QdRzr0HQJfq6BbS9yWUft3bnGq1K5A355VAH+iAU0Uwzs+KC4+l3+ZBzxLYLhuKjCIBIEp5xr1VStGXU78HbDff4QWyMga5x5jdi6biYxlWZ8Ng6yhhcq/sftBYknpQ7vspmEvri1qC9p412mV2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mZcRZr/2bw7QSOEfox28Kwm0YJhugriy/PDPN8yAuts=;
 b=N1ObkpIVO3/9jNkgwbiwqF6VjbSbGiI5DDh1p8JmPQZM9dYxmabJqC3Vpxu9vswcGScU87fkHeCoeFVphr7i8sLesk0JCdgfYrt5CQ0E4g3X3iVb8TNflZnJVakjc/yf8xeQL2QgrIv+skzr2QgYbJvc0JM6GXNmDWpbL48tUEIFlY3IO7HniqeW374KUsL9Mn2uS8F4Ni3DVa6KagK47s0JokPbTobyC0+CR4MGruoz6mnxYfFWm406CjiTA5d89YE/T5wZ+ivud7qJmNV/MmdZv+bwglIuuPitfd+0JkOiZixgLZ9GWazO74Df0cc7ABzEkV0m4MZmy+QZSw9H6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mZcRZr/2bw7QSOEfox28Kwm0YJhugriy/PDPN8yAuts=;
 b=JrpRtn2ZHhZqGdIj9+0rTspMfsDbLrGbAR4Z+KM/2ut+WYSQUccOu0dmKJAOej2NDb20jyRR0jnXzmYGvR/3ie+y1QlgmfHPDzW6Eej93S25NPboY2CKAWsHMuUYaXt6Zm/TMtC7ShLCod24zxEVK2A5ZoozyH2IWR35osemiOo=
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com (20.179.175.203) by
 TYAPR01MB4573.jpnprd01.prod.outlook.com (20.179.186.84) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2921.27; Thu, 23 Apr 2020 10:31:02 +0000
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::ed7f:1268:55a9:fc06]) by TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::ed7f:1268:55a9:fc06%4]) with mapi id 15.20.2937.012; Thu, 23 Apr 2020
 10:31:01 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 1/2] mmc: renesas_sdhi: handle M3-N ES1.2 and 1.3
 revisions
Thread-Topic: [PATCH 1/2] mmc: renesas_sdhi: handle M3-N ES1.2 and 1.3
 revisions
Thread-Index: AQHWGKXZQ7S2Ji38PUWmlijczhWmW6iGgtNQ
Date:   Thu, 23 Apr 2020 10:31:01 +0000
Message-ID: <TYAPR01MB4544560675F1D41DF8BC8DB1D8D30@TYAPR01MB4544.jpnprd01.prod.outlook.com>
References: <20200422125914.16590-1-wsa+renesas@sang-engineering.com>
 <20200422125914.16590-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20200422125914.16590-2-wsa+renesas@sang-engineering.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [124.210.22.195]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: d8cfba83-977c-4717-f3d2-08d7e7716ba3
x-ms-traffictypediagnostic: TYAPR01MB4573:
x-microsoft-antispam-prvs: <TYAPR01MB457340C9C993D892DEC662DFD8D30@TYAPR01MB4573.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-forefront-prvs: 03827AF76E
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYAPR01MB4544.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10019020)(4636009)(39860400002)(396003)(376002)(136003)(366004)(346002)(5660300002)(33656002)(55236004)(186003)(71200400001)(86362001)(55016002)(316002)(7696005)(76116006)(9686003)(8676002)(4744005)(110136005)(4326008)(2906002)(6506007)(66446008)(66556008)(26005)(64756008)(66946007)(81156014)(8936002)(478600001)(52536014)(66476007);DIR:OUT;SFP:1102;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cSSUbVnjaF8Qk4B+v13oF8EJPkYZMpOXMIz/uNNO+GSEZJufxpjVoPfR0WQvy7V3I/2GvBVXte1Syp7AphjwGiDDQPTkpX2vNsmTekcsm45hT0flH3Q1vqlUjuLxx3ikwAmvjqzlodgQ7Aj1UIjBBPpl9Nvnj5e51AGtLmPyjppyPT4EUqUx9KoZICnjrPXuSa9GrEaZnayd2CN/pWfmDDSynxcpmRI1qYV5aUHvo0dJexixO8a2/td/sxuuSyXSlhPchRG9CCouYFhyEpMvCh2nAWsU+x7zYB6W0KtOL91JRydHvA4dWXSdCwlU8JRyQ1dVlOvZxpyCjsidScumHzcDRw/IccRCdS0aqECZc4RPLGHL158/4fi745/9AhVwfu8wR33h3aZs8OhZ1A8//1DQlQ5Z82kRRK87gUhy1c+9jklvZgv5Yy1UXU7DCmmg
x-ms-exchange-antispam-messagedata: 58ESDCJXh0CdtPvyWYvRW8IdqGVmnhznwqDg7TCkvh+npfvcdmEK0jWsAa5LLZcpsyhYPgYMFwch42IjkqwsPlGRNTOS2dn6Jg0WJ5+YXRJj4NbFXvVle1fDYKyBaOD/20f0vndxPjsmFrTt9I/5eg==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8cfba83-977c-4717-f3d2-08d7e7716ba3
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Apr 2020 10:31:01.7803
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: k7yuMSij/oc9Bs54SV9MotUXIXcwqidDBdJF4JkdvhAcbqL0x0VjC/LNTE46XqJJzWtxzRKC1ornbYxxy432TdcKDTKDNRJDiw+l5UxadP5W79U3OkcioLOtMmlhrA6e
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB4573
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram-san,

> From: Wolfram Sang, Sent: Wednesday, April 22, 2020 9:59 PM
>=20
> For ES1.2, add a comment explaining the situation. For ES1.3 (and
> later, although unlikely), add a new entry defining it as 4tap.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thank you for the patch!

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

