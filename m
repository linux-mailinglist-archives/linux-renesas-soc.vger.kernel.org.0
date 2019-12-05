Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F3E2711409D
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Dec 2019 13:12:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729187AbfLEMMO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 5 Dec 2019 07:12:14 -0500
Received: from mail-eopbgr1400108.outbound.protection.outlook.com ([40.107.140.108]:30816
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729146AbfLEMMO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 5 Dec 2019 07:12:14 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lhC92tV3NHItKAUFZ8dqMOkDQb9nxr+6aAC2lblHTmFu/mx0hzG8r8JBW+uRKPklxv/dudEoSBDRRuHENFqOei2y0HbR5L7Z0XFNb/kn9oVD2Jk0K10mtcqTCSXC9P5CYqcu76muvY3zy1ezKn4+cBMXd3Q21cLQYcozyb2rsGRvf/tz2MMM0UiwjU8WCkSGew62DoZkxVQBs3EDvAU5jlWxGeHjKJnm9wn0cJq1c0zyeKVqoW57KlxZqanQmM8ABy9UJH5zxhGSAiPJot1QYoFn0lJ0H4ezrC5Jc/KIH1NXUjnHW1exZOpyZ+sITrJ5jkvsTQf35Wl5fxIsBmH0Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mrkWZAhEEgi4FlEpd2fyj8J6majzb8p3o/A401wUnq4=;
 b=PWwzbmthp87S2MqWxgprhIYZ+vvCt7p1p8YtIT38ogxwDmQrz9Ej0blAWwJRopCokWMOtd5FQ3bo1XJb//kI7DIFjNz96j5nPqtSmXO33Q7E0YegYVV75HhXQI4xwYfJANbQOytNqWsPlfbBrxPlcYc/e+2RELWOVNgVOaWfJxIZCwOCsVG1eKZS9D3anUAAqBcm5qgRasezyYU31UDsNrOTFyNuHZz5l01V807N6QUlPkuMdg4Xoi6Ux1brrZG3yjfxKtSfE4mTVUKQ49Ix1iqIMvsbJ7ClK5AwsSkIFjVzgviYNGRvK8q8w0S/7dLx73bqJm6TlP8/55bzixjwIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mrkWZAhEEgi4FlEpd2fyj8J6majzb8p3o/A401wUnq4=;
 b=F0+FVLOXf8BGFQsQSMHAZfZt2VfvtI9jH+2lCWG72kkYJs3/dXlPbEKZF6o4OCO+ZJAlGMQZy1i/h4e6fVzXjzhsegGMPm+s6efI6Fa+3mD3nSgB/+Ll0F46wnAFDH7AJjD06742lmc+IEouxg9vXqVjfQQ+NhuIUJHQ4/CwkDs=
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com (20.179.175.203) by
 TYAPR01MB3808.jpnprd01.prod.outlook.com (20.178.137.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.18; Thu, 5 Dec 2019 12:12:10 +0000
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::7d2d:4b8a:a48e:d84c]) by TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::7d2d:4b8a:a48e:d84c%4]) with mapi id 15.20.2516.013; Thu, 5 Dec 2019
 12:12:10 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Wolfram Sang <wsa@the-dreams.de>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: RE: [PATCH] mmc: renesas_sdhi: remove whitelist for internal DMAC
Thread-Topic: [PATCH] mmc: renesas_sdhi: remove whitelist for internal DMAC
Thread-Index: AQHVqhK+Xv8lcx1xgkqFtcGvu79hWqerddsw
Date:   Thu, 5 Dec 2019 12:12:10 +0000
Message-ID: <TYAPR01MB45440D3149DE90B181B314C5D85C0@TYAPR01MB4544.jpnprd01.prod.outlook.com>
References: <20191203194859.917-1-wsa@the-dreams.de>
In-Reply-To: <20191203194859.917-1-wsa@the-dreams.de>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [150.249.235.54]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: f0cdfa47-712e-4575-76ad-08d7797c5acf
x-ms-traffictypediagnostic: TYAPR01MB3808:
x-microsoft-antispam-prvs: <TYAPR01MB38088630363121FF3323CB99D85C0@TYAPR01MB3808.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-forefront-prvs: 02426D11FE
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(366004)(136003)(376002)(396003)(346002)(39860400002)(189003)(199004)(66476007)(66946007)(64756008)(66556008)(316002)(110136005)(76176011)(54906003)(6506007)(2906002)(66446008)(186003)(305945005)(33656002)(4744005)(4326008)(7696005)(86362001)(99286004)(55016002)(8936002)(76116006)(52536014)(81156014)(229853002)(11346002)(71190400001)(71200400001)(5660300002)(14454004)(478600001)(74316002)(8676002)(25786009)(81166006)(26005)(9686003)(102836004);DIR:OUT;SFP:1102;SCL:1;SRVR:TYAPR01MB3808;H:TYAPR01MB4544.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QNo5GcaQPoNkx2e5DKt1Xakdq5Nocp0gsMkRAm5CQVO+861odvX4niA26MkmUpXVYsJ8NKBRDbuQnGyAunTP/Pmsxnz1oZAFsbUxcioAcekqMlDiAE6OL1gvdCENDg4uMQUztjtmjSrBQ9sIufrQw7IlvVUxcCLz7VClCE2wrbycMtlx0t4ykXAL0Q5UxylJUNoIcO2pG8B/guuTImkmOyzpfJ5caacuhhYnpMzYYnhzkqvJ7NNIghI30vOLtHwcDKX/Rz/xqxteMDb+k7K98wpOaKrjAoLlow3wG1q3Atv9n9Tv6vsxh4Q8WRIGNSZDB1gms1AnZ5aIpxV+v/R/ODATzn74dwmt9pZhVDx5HYif1cHIbYBM6qSo5hpIQPGtwV/IQYkNj2rKD/+nLnt6plaOyeWDPvc7uCGOe+XpKWUiJTltfetOQHwRtBOcbwne
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0cdfa47-712e-4575-76ad-08d7797c5acf
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Dec 2019 12:12:10.1406
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SknMXZSU4WGgw4LLP9ykuaKd5yuAnaYnOXVzXetOaCfjWBg6NlFmGPYSRyQ1SBZaP8Y8lBNXu43lk9mRR6GTsh4ZXp5+TNZdBGp+9QpJs6akJE5YGU1OBBP6wb2YT1b9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB3808
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram-san,

> From: Wolfram Sang, Sent: Wednesday, December 4, 2019 4:49 AM
>=20
> We know now that there won't be Gen3 SoCs with both, SYS-DMAC and
> internal DMAC. We removed the blacklisting for SYS-DMAC already, so we
> can remove the whitelisting for internal DMAC, too. This makes adding
> new SoCs easier. We keep the quirk handling, of course.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thank you for the patch!

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

