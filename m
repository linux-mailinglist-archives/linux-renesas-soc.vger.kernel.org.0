Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2D30AE41B1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Oct 2019 04:46:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390630AbfJYCqM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 24 Oct 2019 22:46:12 -0400
Received: from mail-eopbgr1400128.outbound.protection.outlook.com ([40.107.140.128]:2304
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728416AbfJYCqM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 Oct 2019 22:46:12 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RUOHBL8Y8GU++4OZ6kRxMnBafhd6D65cl78gUF637cnMJ8tHACWgy6dZxLMxR4EXqJblpxQ3V7V6TUJfOAJd1Y+DDb59/D6Xqw5QIaNl7lMujyOkVM+YK9XZvM0AgyEpUU1r6wSMwxvAP570EhY52KDO58nMmP/Rw4te5N1rG9f9hKEK+qA8Ac+ZZG3VbfjJ539SUcMzEwg7s3l9MduT/6sa9MtBuiKzU8RhOpzgIHmlYxDMXJAxSEjMvr55oNWGNziJ30TWTcfxQBKxNeXoFZBolgsz4EedLZA6NJOcmSx5XHeS7Ou1yxFqfCwo2Y2znF35ZTyT+JQtiYmK8dFJUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iJdOjHu1MxcVuNLbS26qcefoccsAhwYDFfmRIFcX/PQ=;
 b=GlaEm5h316vEenGAuXPXaV4i5DeKpsk+u11FrqTtdmZJJ0L5LWtfA+Dak+DfzeSSup7IOVkeZH7hxuDE8HULvcqlPlgaxim/sOW8MbSyiImt1CkDG9xlzOVDrWhXZthMOVcXO+IaOcX+BY0prrjR/qJ9U0YnE2uk7oEQC39A+chSAY34Cv6T5uPT5x2OmHEUQq1YJpi5hcaVbXt/ec6x2+F3fE/vtJHQ+qoidI+l9Z3tzc2a6mKBbjM+aC2TUUjh3DptYfJV+fdHRb2nTtmVl0mWmIDSTtdp2eMtvWBtk0+GHJhQjVMfdVIiwGGp9Dn6MsytAiSXtfFTgXMnipk9Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iJdOjHu1MxcVuNLbS26qcefoccsAhwYDFfmRIFcX/PQ=;
 b=LrmMY2a2z2r9Bkvt/nbcQDH2G9bKxKMc86TZPHcga3r36JfIBPLVhJ0TnmnTZcxAeqI5FN5Vz0c4n5jMuBRrNqudoTjBcsnQlKTiBNIbGnGozM/KsjrZQ6FA40gZS2OKtS+iis2Ik627Iw1tb3PncOPgBlwwnbAvjTK+FHglZ5M=
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com (20.179.175.203) by
 TYAPR01MB4381.jpnprd01.prod.outlook.com (20.179.186.79) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2367.21; Fri, 25 Oct 2019 02:46:08 +0000
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::548:32de:c810:1947]) by TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::548:32de:c810:1947%4]) with mapi id 15.20.2387.025; Fri, 25 Oct 2019
 02:46:08 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
CC:     "REE erosca@DE.ADIT-JV.COM" <erosca@DE.ADIT-JV.COM>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH v2 3/4] clk: renesas: Rename CLK_R8A7796 to CLK_R8A77960
Thread-Topic: [PATCH v2 3/4] clk: renesas: Rename CLK_R8A7796 to CLK_R8A77960
Thread-Index: AQHViZ2QPj47CPoPEkeWRHPs/UrVI6dqqSwg
Date:   Fri, 25 Oct 2019 02:46:08 +0000
Message-ID: <TYAPR01MB45448A23F203788F69297A63D8650@TYAPR01MB4544.jpnprd01.prod.outlook.com>
References: <20191023122941.12342-1-geert+renesas@glider.be>
 <20191023122941.12342-4-geert+renesas@glider.be>
In-Reply-To: <20191023122941.12342-4-geert+renesas@glider.be>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [150.249.235.54]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: b7edc19a-74a6-4c16-c0c3-08d758f57d24
x-ms-traffictypediagnostic: TYAPR01MB4381:
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-microsoft-antispam-prvs: <TYAPR01MB43813AF2E6845DE5540F68B4D8650@TYAPR01MB4381.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 02015246A9
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(39860400002)(366004)(376002)(396003)(136003)(346002)(189003)(199004)(64756008)(76116006)(66946007)(256004)(66476007)(5660300002)(486006)(25786009)(74316002)(11346002)(71200400001)(71190400001)(316002)(4326008)(66556008)(66446008)(66066001)(110136005)(54906003)(476003)(14454004)(6246003)(446003)(478600001)(99286004)(86362001)(33656002)(7736002)(76176011)(7416002)(8936002)(2906002)(9686003)(7696005)(6116002)(3846002)(55016002)(6436002)(102836004)(4744005)(186003)(26005)(6506007)(229853002)(81166006)(52536014)(305945005)(8676002)(81156014);DIR:OUT;SFP:1102;SCL:1;SRVR:TYAPR01MB4381;H:TYAPR01MB4544.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vpIKqz8Y6mpfJf32WaDCgElBsh+AfEiNVc2Ubbqgc1xEayZmbMrcyiCtcSJok4vXFaerzU46u934jOjjqLiW5jauh/0YG6G/E8SrFr7rpEDYK4xgy8OSluItwMI316KH0uzwNcsR5yt7l1UNBKcbPBg3yip1JYnE1I9bLGPuMXJHDzUvLgCPmBl8UVh09cYnM0E3mPVBu32QtOuoWpBmuEzBX5JDeuh2fqOcvKHtVe+2oHme7kbjGjuOhATxEovEDFTSTWxQjB8cfPZBaBIoeUHb8tYDrSjOcgX0kG2HiUCVxi2ZpFCRuwBKena+9NzGWL5jIs+O1yuysFdbR+7vUCPGbbQ+zXWUBa1wKtk+Omwhj74H9JpMHieTte5hrrvsGuDkaG0MYB1jcsL4Ij4YpMoCsb2q310y0536yC7q7xQpEScQDTWuCpdA1aBY3QAC
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7edc19a-74a6-4c16-c0c3-08d758f57d24
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2019 02:46:08.2119
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 26pwIg5M6kLZ6/Kjbo3nkUTMgUeZ3+sEhWBV7WrE+qYQ5rxyVC0ykoG4CJXDF6gbyEmN0JEoIKjSDFHkHZOLMXhPA9ZZeRb0E7bF+VmqDUbsLg4m0MAxkK7olZ5vErnK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB4381
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert-san,

> From: Geert Uytterhoeven, Sent: Wednesday, October 23, 2019 9:30 PM
>=20
> Rename CONFIG_CLK_R8A7796 for R-Car M3-W (R8A77960) to
> CONFIG_CLK_R8A77960, to avoid confusion with R-Car M3-W+ (R8A77961),
> which will use CONFIG_CLK_R8A77961.
>=20
> Extend the dependency of CONFIG_CLK_R8A77960 from CONFIG_ARCH_R8A7796 to
> CONFIG_ARCH_R8A77960, to relax dependencies for a future rename of the
> SoC configuration symbol.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thank you for the patch!

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

