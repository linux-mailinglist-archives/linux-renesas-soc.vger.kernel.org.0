Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EB1521140F5
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Dec 2019 13:45:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729165AbfLEMpH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 5 Dec 2019 07:45:07 -0500
Received: from mail-eopbgr1410101.outbound.protection.outlook.com ([40.107.141.101]:38350
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729117AbfLEMpH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 5 Dec 2019 07:45:07 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CzfmCbShM4fLb/D4mZ70YYtGV4xLPEfuSYKSj3jdOu3So8xrgOJqLCYVFaxFTdn2Y/tHQp9SR5GNmZ8h+uL/WvrqF2TDS9muu8sDTvgj1b4cxenpLLNbsOXJDUxwzW46xftFhvkieQFw0ImEfOj4+aH57RSgCJN+IQqYaaiu0V6KLz9dDUGKVEBsABt7nyLrDKMtXtTCRYv00tM6nYBYQUp+5OEb4OQ0BnVVKiZ11ndWpOuNQ3nXeejehCHXgykYRY2gRMiP5wO9pMyjgKe4qvt/S6BajCZfVREhMisvbKv11G2sc93nxrCFQJoevGUJ4hlmcdmCRvB5TU9qQzLNAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VELKZAWPoEa2NWIX5XuynO+bn5v6ewmLbrz1eE4Unn8=;
 b=DRdgrzePA9zAozjC2HeDo7gBRx+BOncLuCg70QD24IfSHysM2bZ31bkKeZjgIwYJmZ1GH9O+Y0YHNUOIhXDEYaydLXW1s2TB8FpqI/Xra/Ytab0RlLUpSAyNnp2dpanutraOswkW/cZajVXlQlDhgJCTNerYe6IuoXBH2qK5x73obSM8QIXPoFFV5htXYm2QD24bR5HJlBSdDOTGkw6loj5/GsUFw3uQsZRxF8QsKj64hToWW72GwfcxzpLCpaGzxoG0kP48G7GywaD7tFLX3iDBRED4cEKDOZ20XDaB3xLBlFmX7uBPGZks8ZKWLZew4DJjF3ps0UDAhj0ZnUsn1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VELKZAWPoEa2NWIX5XuynO+bn5v6ewmLbrz1eE4Unn8=;
 b=GPa/Aerl56NyMet65EmvpFprveHGZiq6RtwSNmsecUIhHxG8oGSyYimyvarl174ITzGnQB7G5V1BLgIEnffZqFq+aQaz1B+iWQgv/fPv136EDx9iPeT877GucxFJHsZGoErr1Cl/BwDxIw/6BJ11Iqg2QMYXccn7zOPZK5V2roo=
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com (20.179.175.203) by
 TYAPR01MB3791.jpnprd01.prod.outlook.com (20.178.138.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2516.12; Thu, 5 Dec 2019 12:45:03 +0000
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::7d2d:4b8a:a48e:d84c]) by TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::7d2d:4b8a:a48e:d84c%4]) with mapi id 15.20.2516.013; Thu, 5 Dec 2019
 12:45:03 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH/RFT 5/5] mmc: renesas_sdhi: use recent tap values for
 HS400
Thread-Topic: [PATCH/RFT 5/5] mmc: renesas_sdhi: use recent tap values for
 HS400
Thread-Index: AQHVqhT/LbSkkdbBwk+tG2pJ+x+0gKerd5Xw
Date:   Thu, 5 Dec 2019 12:45:02 +0000
Message-ID: <TYAPR01MB4544A990DBA29EF62ADE90A4D85C0@TYAPR01MB4544.jpnprd01.prod.outlook.com>
References: <20191203200513.1758-1-wsa+renesas@sang-engineering.com>
 <20191203200513.1758-6-wsa+renesas@sang-engineering.com>
In-Reply-To: <20191203200513.1758-6-wsa+renesas@sang-engineering.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [150.249.235.54]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: caa1c394-112b-494e-512b-08d77980f2b9
x-ms-traffictypediagnostic: TYAPR01MB3791:
x-microsoft-antispam-prvs: <TYAPR01MB37917596CED2CE9F88ED9F9ED85C0@TYAPR01MB3791.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 02426D11FE
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(136003)(346002)(39860400002)(366004)(396003)(376002)(199004)(189003)(86362001)(71190400001)(7696005)(2906002)(52536014)(102836004)(6506007)(33656002)(5660300002)(71200400001)(76176011)(14444005)(99286004)(110136005)(316002)(4744005)(478600001)(229853002)(26005)(4326008)(81156014)(81166006)(8936002)(8676002)(66446008)(64756008)(305945005)(66476007)(66946007)(66556008)(11346002)(76116006)(186003)(25786009)(74316002)(9686003)(14454004)(55016002);DIR:OUT;SFP:1102;SCL:1;SRVR:TYAPR01MB3791;H:TYAPR01MB4544.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dNmLjpYSzuwOjwT614k1b4wBWgWUIQC1uG6pxdBtrb/ZjLvZvi3BLNd1KOO3yc9c5s9CNPLit6mLTbvZ8bbb6DF6TFo0To3QnQYnxaWImUe9lQ+9y8OxWluSU78n3DnRZr5s3JM+zvym0ZSVk2vietsT0KENuUO3OI2SpvVdt18EtZTqt0tDtryV4fle9y6MLcRc/whfK2gn06tESgSbiiYij5urmdeWozLCCP0+30CFsrtolFhmAiI0/RYjlb2VClI3QfpzBg67Z1QWsv473KNmFswCqMRjFXEc7yyhEmoCiA0YClqlvIhCeRwBPFIvMP+PW1jsgF01+H07G/NCIveHozoQtlbmlvpmyOwd3LKx8lwJzcQsh4sjV7a1HyR4AJNIDlZhGKplFtHWTkFSUvZLZ0sKi/lyzuLwgNsl4aioHp+5VqDjUXiWCN7OBW4G
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: caa1c394-112b-494e-512b-08d77980f2b9
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Dec 2019 12:45:02.6203
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kea3r1yYU/aZyNohW9TDA83p5R+omOQ/AKmGaTpFFJ+ZoDt8z5gsPLE634g/wv8R9fIKa6em3njBcobFfdZUERgLlwTExLJ2DSsZgwGwbXqEoahCPZDceIPhzrBYPIb8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB3791
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram-san,

> From: Wolfram Sang, Sent: Wednesday, December 4, 2019 5:05 AM
>=20
> New datasheets require different and new values for HS400 with 4taps or
> 8taps.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>=20
> This patch needs an ack from the BSP team and/or Shimoda-san. The BSP
> code uses this only for M3-W ES1.3 which is not supported yet upstream.
> However, H3 ES2.0 (which we do support) needs the same fix IMO because
> it is also using 4taps with HS400. But that needs confirmation as I
> can't recreate the error case here.

Thank you for the patch! I also couldn't reproduce the error case, but
I confirmed the register value was fixed on H3 ES2.0 (as 0x00000100)
and H3 ES3.0 (as 0x00000300).

So,

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Tested-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

