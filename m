Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 82FBAC46C4
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Oct 2019 06:50:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726740AbfJBEuQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 2 Oct 2019 00:50:16 -0400
Received: from mail-eopbgr1400103.outbound.protection.outlook.com ([40.107.140.103]:21760
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726457AbfJBEuQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 2 Oct 2019 00:50:16 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YgUT/T7LohngmRw50kRurBeWTv42W4+vyi028CeEc/txR7uFyWYFgmPZuLLqkuISzR+Sk+Eo2miAGKFekt1Ba7ADGD0OCQf9jp5y+Noz5w9jy9z+xdd00XLXpdiMwqrF5U5vYCImI97nX0LVG1h3NEAzPd5f9ZjtsBm0wjAMm+1j6DlaA7LxxHOSpRnVHBvgjfs0VUKgnox0ac0bvC8wCiJ2dIjlhICTVieuCrJSn3D2Y7+59DNoTLBH2JJU08AE3nrjCFxFFvrgiaPels/0EuL9uZpsyJxkSxS/zsF4MTgDkVdnCr1dWoByIdIG+oT2ebbze/DmtYrLe6uhlVo4uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GtMvtdAxSN/TsD9ptmb5UsTUszvbHfK/c4Df3aFt5+w=;
 b=bO1waeBiHOIG76s5usxIPV1UksyYkkjWHaMg8n05aA5LMECJIgmUib+4l3a/XhbWSXjXVrd6kkKe3nIqEEclP6URFmVrxBImROZMyqsDs1jakXaoWUasonqNyyF4b52A8cv8i5ZZUj1S4kL7+PN9L3yVAuTfV3zyq4Z1S3a6XQyN2sfDf8uku7cspXlZZZTS/Gpuiwi3YTFus2OqZZYB0kvgVlVWnHSQefpYojRAYX2kqMZdhVDXgurst7SMu0wYdwFGasJ1pbCFfdm0OWXTdIyFvQBHLl9c4MZ5bKKKCGuy5Qshm520wx1Abw8/WohTGoFu8E7Ty+T9cLGbkGC2Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GtMvtdAxSN/TsD9ptmb5UsTUszvbHfK/c4Df3aFt5+w=;
 b=gLAfVl6qYjFGXTluDlc5dzsGBVSjoUpY/R0QXWSJHe2dW2PINZnUlAtXLaV18Hes5nRJWH7ruNbxIVl4akVNVYEZmI+whu1zzceKAo2cMzJRIepfuWofb7HfWowKKnFhNKgBMp+qz8TcP/k5OnLJUgH1/S3ld5tPw23s/sKKxx4=
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com (20.179.175.203) by
 TYAPR01MB4880.jpnprd01.prod.outlook.com (20.179.186.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Wed, 2 Oct 2019 04:50:13 +0000
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::548:32de:c810:1947]) by TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::548:32de:c810:1947%4]) with mapi id 15.20.2305.022; Wed, 2 Oct 2019
 04:50:13 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     Stephen Boyd <swboyd@chromium.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] phy: renesas: rcar-gen3-usb2: Use
 platform_get_irq_optional() for optional irq
Thread-Topic: [PATCH] phy: renesas: rcar-gen3-usb2: Use
 platform_get_irq_optional() for optional irq
Thread-Index: AQHVeIOewimUnab5bUeUXUI+wtgUzadGyDEA
Date:   Wed, 2 Oct 2019 04:50:13 +0000
Message-ID: <TYAPR01MB4544AB2F6D2A49FCB0160893D89C0@TYAPR01MB4544.jpnprd01.prod.outlook.com>
References: <20191001181109.1355-1-geert+renesas@glider.be>
In-Reply-To: <20191001181109.1355-1-geert+renesas@glider.be>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [150.249.235.54]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c1b14cba-bf3f-497c-8aca-08d746f4034d
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: TYAPR01MB4880:
x-microsoft-antispam-prvs: <TYAPR01MB488081BE78C410E4DA7F0AEBD89C0@TYAPR01MB4880.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-forefront-prvs: 0178184651
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(376002)(346002)(366004)(136003)(39850400004)(396003)(199004)(189003)(14454004)(229853002)(81156014)(476003)(86362001)(76176011)(8936002)(7696005)(8676002)(2906002)(186003)(66066001)(486006)(6506007)(14444005)(33656002)(102836004)(6246003)(26005)(256004)(11346002)(99286004)(446003)(6436002)(305945005)(54906003)(52536014)(9686003)(4744005)(5660300002)(74316002)(55016002)(7736002)(6116002)(71190400001)(81166006)(71200400001)(66946007)(66556008)(25786009)(64756008)(66476007)(66446008)(478600001)(4326008)(110136005)(3846002)(316002)(76116006);DIR:OUT;SFP:1102;SCL:1;SRVR:TYAPR01MB4880;H:TYAPR01MB4544.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fU2lnZ104LtJ1OiO36oQU4MGxOcQnMkToW57EnaB/fzE5AGBmJrk1vsRIGYawJ9brIPYz6QfqiV3c12IDivQjtOUhCEZOMiyeIPfxPBm8JH61SfCyal1zjLCWBYJSCXtXH9dqaMplnGBp9ULz4zFQSvAdY9h6zD0OLx+gOry8GEunhR8pLIKhfSFsgkCorjLb+XNqnFMlIeCwopyXgsbeIDG01khDW5LfhmdyARotprMgcl80EyMKm5Z+oMbIKl7zU2S2jXU0I2azPWwCVAFNpzYIcMTlGWI5P6wFddNbxC+WPPhW8PSMDPDGhU7OhECpIz1d0RIJm7rV4gB0EO4f/Cu7t/nca0/K9jExBUukGmFgs9Qt/AjrBKLwbCIhwpgl6AdvRp+t7XKSs6oR3gtHIIEYi05BKrv2psRjpnauKs=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1b14cba-bf3f-497c-8aca-08d746f4034d
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Oct 2019 04:50:13.6063
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yGPMAB/ijJi4iCz3JWBAxel3SVelCriZm0F61ZwEyK6ViFy0kEWpUQ+tXDAcdlR/whUHIlnBKXlSa05xK6F2mylMYQMFQj4OsIOo7FllLT5jvlWK9aX/DY1/CqVuuhBi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB4880
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert-san,

> From: Geert Uytterhoeven, Sent: Wednesday, October 2, 2019 3:11 AM
>=20
> As platform_get_irq() now prints an error when the interrupt does not
> exist, a scary warning may be printed for an optional interrupt:
>=20
>     phy_rcar_gen3_usb2 ee0a0200.usb-phy: IRQ index 0 not found
>=20
> Fix this by calling platform_get_irq_optional() instead.
>=20
> Fixes: 7723f4c5ecdb8d83 ("driver core: platform: Add an error message to =
platform_get_irq*()")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> This is a fix for v5.4-rc1.
> ---

Thank you for the patch!

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

And, I tested this patch on R-Car H3. So,

Tested-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

