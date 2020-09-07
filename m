Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17D10260393
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Sep 2020 19:51:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729273AbgIGRv0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 7 Sep 2020 13:51:26 -0400
Received: from mail-eopbgr1410103.outbound.protection.outlook.com ([40.107.141.103]:6784
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729112AbgIGMIw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Sep 2020 08:08:52 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pg0DQKCbxrrNzB/RQdGulQ6GsyaKjJ8bpUhtUP/LFFTzyOTqXLQjPGsWNXNEIv5Co0GQ9pQrveO6KKHnaeXeqD2ogkCXWUtk+4FclLpiCub9bKDVZPe+eNULiLQReZvZWdCdB3JvherjjmuiPvffVEIsYltkpNyPEiPN6cWQdMJwrBSD/DT1Ok2hwCtMFYhtL7INve5ooC3kR65u29V0pY9lLqASAVvW57o83MJ5LO+0IDGZK6yCr29GsgDnZUWV7DQ4LMBpLKcAogs65GWFJzucwCLhpSjeSI7eMic6uYWZY0HwHvFusI4Sg2PxopaEDB9wIswmiaAHuPvDWRIkfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s9WAEjBp6xZZNu2mai4sy6HPFGyDvcFPWUsbU4LDHyA=;
 b=hNRK1J1DijN6MfAsllBjFy8XuCd+mLgrr/ol7I8zaxtOIVy6QOO2EAZvG8uNB0nWccE82Tqm77q6mU8wI7xdwJv4Gt/Zc5G8MNe25oquoJQEeZB/X8d2wPToZYOgWqNyGvwachdf+P1mvxw88els3fyO0+tTQMx0twM+hPjnTbTEcYOLPjCVQngcBtQTfTJYIQqf5J7MJyFDWu7aAc+rrYome9PfTgE7lqNKjw3cFQPfOGnfSEoxf+d+VIavUox3otZuEGF7Xn6cQZjfD0U16E9yflnvFZiiJfJrlMOe5NOFBgQkpQ+MaqHodD5AeNyZd1TPWw1G7QB70Aar4FyW+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s9WAEjBp6xZZNu2mai4sy6HPFGyDvcFPWUsbU4LDHyA=;
 b=WNx+K41OIHs4RsC5SnWdv1SHaMdEzIkbzqfLrgzWYkfcFlhuLB3CCJQl3HVO+mCI7F4IVc8SMqauolLgeIEadRZbX1UX9PH+DzIoqT9DZtRRnNC54r204d4dj2WOT71b1bV0jydN2AYKmjVHMmDRF7GqRxryULftOat1q0DZoMk=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TY1PR01MB1740.jpnprd01.prod.outlook.com (2603:1096:403:3::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.19; Mon, 7 Sep
 2020 12:08:47 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::9055:525d:2d64:b625]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::9055:525d:2d64:b625%5]) with mapi id 15.20.3348.019; Mon, 7 Sep 2020
 12:08:47 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2 0/2] mmc: renesas_sdhi: support manual calibration
Thread-Topic: [PATCH v2 0/2] mmc: renesas_sdhi: support manual calibration
Thread-Index: AQHWgQGhmNA3uc5sWEKwdse5k1apwaldHPfQ
Date:   Mon, 7 Sep 2020 12:08:47 +0000
Message-ID: <TY2PR01MB3692D0AAB86939131315EF9CD8280@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <20200902081812.1591-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20200902081812.1591-1-wsa+renesas@sang-engineering.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: sang-engineering.com; dkim=none (message not signed)
 header.d=none;sang-engineering.com; dmarc=none action=none
 header.from=renesas.com;
x-originating-ip: [240f:60:5f3e:1:2449:5b7b:35e4:e270]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 57d325bb-3d62-4453-425b-08d85326c696
x-ms-traffictypediagnostic: TY1PR01MB1740:
x-microsoft-antispam-prvs: <TY1PR01MB1740F49D50DB613C892B1678D8280@TY1PR01MB1740.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hqj55kSE3TIX2t/0z3CMPD7eoSX5LXWaykuhbnR3201uTpb9Qo3iiJfeH00gm6SEVf373YqoQvQGX3uTYVsQ2/SIXDbgvsaXRj9EB/2T3uAQ4ZUeaEq7uzoWBYKiYdyFKS2i8hYc4gTKlhtFTfgXYmy72KHliTFqxBhquCtPJ/u8X+yayJaiPuRXlQiyCsEwBfQm30FCG+9o9rmWunnLq7156ka9T14EnNY7G1ciIVsV52h/vRHWNWvIarZIM+WncPoH/kKx5kdwctmk5A6q33GsN0HWjdizpW+zn7kNmbrAow2Em5R3laxRU5MMS0rW7H3g1+RB67eWivWaO8gjmQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(136003)(366004)(376002)(39860400002)(8936002)(6506007)(66556008)(64756008)(8676002)(66446008)(186003)(5660300002)(7696005)(66476007)(316002)(4326008)(66946007)(71200400001)(478600001)(76116006)(110136005)(86362001)(9686003)(55016002)(52536014)(33656002)(2906002)(4744005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: y2gEXnlZ96pyCUzfGNr8+A1ZVX1hOsA8P70cwBRbPmc7+k6l2ThOQJ0OvdgPfz4mPph22GwUgee/ekAqmVEyV6Q3YYujAtoJ2LnVmeKKIsiR3WVpP+y2+43qQu6bmYtcdkU5lLVT68BosRKdUSJJ6Y3uTGPmnwjaFqxCPGfSLjYk3cuJabck8Mbt/kqPPoePPaKw4lM42Oz9mUqgADet5OnbOyDfLkoxLoaycEfhH5QiB9LJzffHebjKcT4p/jd45Hz/LiVqBxHn1FlZxLxpkSHGe12Z52H47aCgi++zw+XfWIfUXDyCG/GpiRYa+KQzAf57a4a8uhglFLZMyK6kNxjruPfEACgMTFw+cRHb+ped6InG8SjHVgaoRrAJJyLCkSJJzA6ONvnlMkST7sxdA/Knyb1vv4FvNvFCLHXOyGPc908ipksLmegtqcjSTGn5ooB87HwOj6hSEvzduvaaf3BtuhaFGvUJb0xQPLfZBrJHxFWcyzl6qpCiJ3rXHSMWu4Ma8Lo/Zp17Njz1Dva6T++REKYFyze0bl+KNcwM49GZHkDbkDmHir9WiPId6cYxP/FdvpXSrlKUsR3MqQwD+L80EnumVxjprT9agsnXBEgjzknn+d7S9tz1P+gVCKUxOZ3zM3TgrOMyHofpUJR0qncUJbuY44c1gK5bXW/zggruXpwDPcy48D1rM4r6xSEhY0yoqx2D/Xbd6DQJbVtStg==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57d325bb-3d62-4453-425b-08d85326c696
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Sep 2020 12:08:47.6804
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zZzth+1rDQST6PLobl2/g/hBIwv/thqSNQTNWthKMSORyjhJHBIHvyMwPo1cFGW+M+PHZKq8QwDwY7lNY5RueMr/zS4lUNvVmKVgjYY8Z4wZfkDs2CwEKBWgaJO414WN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1740
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram-san,

> From: Wolfram Sang, Sent: Wednesday, September 2, 2020 5:18 PM
>=20
> Some R-Car Gen3 SoCs need corrections after they tuned to HS400. This
> series implements that. Please have a look at the patch descriptions for
> details. The origins were patches in the BSP from Takeshi Saito.
>=20
> Changes since v1:
> 	* correction is now enabled after tuning is complete not when it
> 	  is initiated
> 	* rebased to new version of "fix stalled SCC series" which is a
> 	  dependency for this
>=20
> There is a branch for testing here (with the debug patch on top):
>=20
> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/sdhi/=
new_manual_calib-for-5.10

Thank you for the patch!

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

