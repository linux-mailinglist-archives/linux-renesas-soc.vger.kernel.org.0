Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 045B2E41BE
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Oct 2019 04:47:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390778AbfJYCr6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 24 Oct 2019 22:47:58 -0400
Received: from mail-eopbgr1400109.outbound.protection.outlook.com ([40.107.140.109]:12720
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728416AbfJYCr6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 Oct 2019 22:47:58 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LWmh74jeA4m+oDNZ2pHfRXeiET+u9fi++aorzubWY2KIiBbkYI3Vl0ECLjMaU3UJ1dY0q65p/V5tfdsLBrYmvcxicENkfq8AhOXiofWX+B9B5CpcUBAif23XxzrIez2Zs3Q2o4yUxobPsnMoR2PIrCtC0yahw+38lPO9QAEmugIU7MafxTVU5eMsMYqd8MTtD5R9pJYnQnDy1lUu/759sd1clvfAiIDh94gFTpf03L8u7QHoWV7BIw30EVvn43by4YdbdUVrucgh9X4xKFYPaG/eTsoNGCMuvhG5b7Fp24YcbDnMmu6jrW9iqkKF7Eyqv8YL93JcKRta47nNuduroQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=av1jNuMHbxXcMObTGyFo1HdeFU6fu8BlWUMCnW9puUs=;
 b=e9IsO4Z7lrvqHB+fWGe/e6aBErAAbE3kkCSzcH+SwQReVX9TpYmgYChxIu5K3fyg3S4qBk6tGvSnSww7Olmuw6d+LIzZMUOEbkMz5XX9jIPycY67+gDlY/8QSeCQrxSy9EMKbvK1KYjkljKypDYBfWal2zPTV+smXmSDbcVdqB1BBsOYVBNLE+Fl+vV60b2WQcrmLWj3tbWsz4UUFqRQUCFigyejvRTnJJcWq+lefbMNOJwwg9uSyHzJZ+JPc0yVJ2nD1+pdvYyIp2URy9OQn8rUzBTGQmJqM22TDzmeKv3cwU04BN4VyWT3hTgGhfp9PQE/5jGB3pfGifR7ZJ5VVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=av1jNuMHbxXcMObTGyFo1HdeFU6fu8BlWUMCnW9puUs=;
 b=p7nv22SiHn+WiNrepp+BgYzOLXSPx7VI+x/XlyEAlrTDiXIntOFLf2NeIbrqYiyM13+gj73wAmNcu402N97bUCSIlLT8VFxRaoArvHpNQzJI8NyKFpmTnRxF/80yRu332gn+PhrLI1KG1O+RlgQV1YuDxA4QfGHxtM0DFfweJ8s=
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com (20.179.175.203) by
 TYAPR01MB2847.jpnprd01.prod.outlook.com (20.177.105.82) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.22; Fri, 25 Oct 2019 02:47:55 +0000
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::548:32de:c810:1947]) by TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::548:32de:c810:1947%4]) with mapi id 15.20.2387.025; Fri, 25 Oct 2019
 02:47:55 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>
CC:     "REE erosca@DE.ADIT-JV.COM" <erosca@DE.ADIT-JV.COM>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: RE: [PATCH v2 01/11] soc: renesas: Rename SYSC_R8A7796 to
 SYSC_R8A77960
Thread-Topic: [PATCH v2 01/11] soc: renesas: Rename SYSC_R8A7796 to
 SYSC_R8A77960
Thread-Index: AQHViZ4kD8vHtMSr70arGVjkn2d/Xqdqqduw
Date:   Fri, 25 Oct 2019 02:47:54 +0000
Message-ID: <TYAPR01MB45445B654E998FF48324A37CD8650@TYAPR01MB4544.jpnprd01.prod.outlook.com>
References: <20191023123342.13100-1-geert+renesas@glider.be>
 <20191023123342.13100-2-geert+renesas@glider.be>
In-Reply-To: <20191023123342.13100-2-geert+renesas@glider.be>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [150.249.235.54]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 157548e9-0d96-4a6f-cd82-08d758f5bc92
x-ms-traffictypediagnostic: TYAPR01MB2847:
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-microsoft-antispam-prvs: <TYAPR01MB2847D9C4D3256E939C0E9987D8650@TYAPR01MB2847.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 02015246A9
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(396003)(346002)(39860400002)(376002)(136003)(366004)(189003)(199004)(446003)(9686003)(66946007)(3846002)(6116002)(229853002)(478600001)(6436002)(4326008)(55016002)(71190400001)(6246003)(11346002)(5660300002)(71200400001)(14454004)(4744005)(256004)(2906002)(7696005)(110136005)(54906003)(102836004)(6506007)(99286004)(76176011)(305945005)(66066001)(7736002)(74316002)(52536014)(8936002)(33656002)(486006)(476003)(25786009)(316002)(186003)(66446008)(81156014)(81166006)(66476007)(66556008)(76116006)(26005)(8676002)(86362001)(64756008);DIR:OUT;SFP:1102;SCL:1;SRVR:TYAPR01MB2847;H:TYAPR01MB4544.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QizEFl6EEaLkOc8951XCKs/Ju2Bx4u9pAVD1GIv4F3SexZbBR/DaTNby9QwafHXJb20eUKyIOFz0dh1VdRYGwOFdD+uLGDVnL1jlUjX67qG5Wz7fuRz/Yg4DzxrOEPSabCrtS+SBA7Q/STaofS9QN7YlD57JD2428BX8cYvWMZ60S207xx0mdRSQ8ZTmMI3VrY7MEiP47WNEJdlR68ehTFAG1lqZxqEc0avOPUh0mRn7bbyojwu6b8WukcsthSOPGD0X9+dKEkYEgSSsygymsqRbwzl6/FFmmSOb2QLJQgWu3ys36COHLuO+G42HpI7mHtcvTCTb68GzlJmvc7FXbIkjuUgCuoL1BHK+Wc1lP/7FtlI1FS1KfBKqcz5zJ8jxzxqVCHQbYJFU3jYCpiKwUc9jpGuj+BnwUuhEL0A/nHKCgNEhdA44F//aJdVCbTKa
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 157548e9-0d96-4a6f-cd82-08d758f5bc92
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2019 02:47:54.9194
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mR2HBcVSJZ9KjaAQ20OC1BoO8TLOO4yNFrqTmykvh1vnkG2KIzJh75qu7CBkhphny/4E5JpDYTpORw2FMNwQSHrlDrSChRkVL8E8E5uLCAXGzMK6FridelVVmqdzKVsk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB2847
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert-san,

> From: Geert Uytterhoeven, Sent: Wednesday, October 23, 2019 9:34 PM
>=20
> Rename CONFIG_SYSC_R8A7796 for R-Car M3-W (R8A77960) to
> CONFIG_SYSC_R8A77960, to avoid confusion with R-Car M3-W+ (R8A77961),
> which will use CONFIG_SYSC_R8A77961.
>=20
> Rename r8a7796_sysc_info and r8a7796_sysc_init for consistency.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thank you for the patch!

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

