Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 283C33CC86B
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 18 Jul 2021 12:25:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230457AbhGRK2p (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 18 Jul 2021 06:28:45 -0400
Received: from mail-eopbgr1410118.outbound.protection.outlook.com ([40.107.141.118]:58235
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230446AbhGRK2o (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 18 Jul 2021 06:28:44 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IQZ3Yr35CvchuRft8jLbAoagRbpfaPKzl1sqNYYGSrG5IN8QxTPovlwwO+35fuahySKkB5WjeFSUfdhRAVnlXfHSKUCU2Ki+qclovD0wdgc1Iu7ilclfxGCX52X3aXh5v/XeYGqNOy5dYjG5Db6KBgcaiU6ag5vudWpMBP2HN3f8y3QaC8PMRu/YouSU9Q42IlSPqeSjTW98vUndnrtCMEYUyNp4cpIP/BtVXH7xvmuIWKJBsfj8BwohcIXQr3Wo1TDHzLksYtCRL4Rdqf1JGkuxH9owRhqm+JqlPCks2xSTTypKOW8/05sDZyK4RHEYJnbhp1uq1gALg66DK3+3Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cby6qU17p/vQ4wwXECGrLirqQkVMZ2ZE/PWLID8k2jc=;
 b=P9r7rJx2MLl0TCWDEjkvtowsZkT1f+Ncs+i8mAewTm5npeuw4zTLVddqgXl2LKE+0HdOMDsAoxqyrZItQOi+iB4xGJ67Tu8Ze/k+rhJEW/b9EKteYkqfoImvBbxH9y+LAelqs2/y0y5s/e1B2IWtgmQAdTA3P//XtJ88h4zphOHzi+DxnIbKYGo9YE8pg2zuMuy7j7lqfT+FpmpNZDfoAYzwY12lpy649UiSJ9duUj0E86Ndw9wtTpEWAnOZhY/f3vnGwVg8B+6kyVsCh6GqguvhsEyfiSdZSrsHl8nvTdzmkvbRqSWKxCBdnyiDiEVLuLbaTgvDVct+g4L04VlCeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cby6qU17p/vQ4wwXECGrLirqQkVMZ2ZE/PWLID8k2jc=;
 b=rlAw5XjXgFtoOQag8IvpFf+Mx1fkk1LsW3xoMTMxGp3LgXEnrNw92/VH4tYZA11D8j4lDt7LVWYmv3QdKwjx5Q8V5Z0f6C0KoyoE4wuiz/7lnRb3Rerd+jR8G1Gp/idq1oq7A5iNMp2+XZ0J0i58cDyZvNS3coEgrBqwLU/oLnM=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSAPR01MB4451.jpnprd01.prod.outlook.com (2603:1096:604:37::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.23; Sun, 18 Jul
 2021 10:25:43 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c6f:e31f:eaa9:60fe]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c6f:e31f:eaa9:60fe%9]) with mapi id 15.20.4331.031; Sun, 18 Jul 2021
 10:25:43 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
CC:     Phil Edworthy <phil.edworthy@renesas.com>,
        Chris Brandt <Chris.Brandt@renesas.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>
Subject: Regarding SDHI clocks on RZ/G2L
Thread-Topic: Regarding SDHI clocks on RZ/G2L
Thread-Index: Add7vsI9+kXhl+CeQLOqy9wopCg2QQ==
Date:   Sun, 18 Jul 2021 10:25:43 +0000
Message-ID: <OS0PR01MB5922386AFB9BBEF95626761C86E09@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: sang-engineering.com; dkim=none (message not signed)
 header.d=none;sang-engineering.com; dmarc=none action=none
 header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0a388d42-72ef-480f-3d3c-08d949d6661f
x-ms-traffictypediagnostic: OSAPR01MB4451:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSAPR01MB4451AA8D36FF7A5718EB422386E09@OSAPR01MB4451.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QkXRFhZwbANnCiMKxe3zILJQsBRBOKJTLI96+ZPE0eco8RdjyLKxweqADA+z+eS5YRH1NwyWkFV1VHR/dSI94jPxtAUIq4HGAUDXpwf3OtOcCNuoaqiVkYpybentLWkubpxAI5jCq0oSf/QcyNEsWCxZaZG6hhCjed0mZv1KgTAVaTnwMOgrgxEwAz0tVJHINHClwHOI4IlSclKQtJ24Bmn/nv6YizKOkDQ3HLz9TD54PO6sUmRyZhO6IHPsxQ/0JLjA9hQxtgBPRMQ083fKMLARLNEYOioQqDSMP/3rksOqJBaN5IWXCFa58AC8ifR0V+uh6qlgYuiHVUjtNOtDMI17z9zpMvVVBj58lZQt9MhD3+sTFGnNB5nChzlwMmPUuSPtsDwkhDhLPH1GkBu80jlfTlualnCwfYIfAEk2WVpSuoRnqoDgdcde1vHsgOYWVNiPEIMezzl+GVJmFmg9QTmFrQFOa/yQ0VoJU1Qx3bWoSuaU4QO+Wbt5/+B0jaZrg3O/FeRy04KaCdveK1vcLEkypJd6AD59aYMi7cg68tyN9f28QDnqiB5aNf9Kf+TYGF8x9zGg5LPEK6GrXELoezCzrkGhHnq3vIKKxRrDcfiI/X3FRmkFv9qB0C2WtlgxBJU/x7N7BSZV/VC0RCcKelsBajetATk/mxpCNZ84wCnhg5dvlZnJ68eFYXVn9E/zXVcDHcjAaKhhT6mYIOeF9g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(54906003)(38100700002)(6506007)(4744005)(122000001)(110136005)(7696005)(83380400001)(186003)(2906002)(9686003)(55016002)(5660300002)(52536014)(86362001)(107886003)(26005)(64756008)(316002)(8676002)(76116006)(4326008)(66946007)(508600001)(71200400001)(33656002)(8936002)(66476007)(66556008)(66446008)(38070700004);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?VxaqeAEsniCILJiYPDK1ap419LZBW8XuLAePyWuaCBC6sjIhj32m/YpzDDUM?=
 =?us-ascii?Q?+91pI0k8xrajKeK7aTtTMpe0gexy5vNKQSOnjhpD3Dk0oKSHFe1ZKoWhxjbi?=
 =?us-ascii?Q?x+Il/acq9jQeGJetMdynjrURDRdSXmmVbBwLch9Zf83JHVm82zHeew8+X75k?=
 =?us-ascii?Q?vlqLHdJg1HZqAEXrpVJdqXMlzTKgO8VAd1d3BC//2WIcH31ePt/Rcvks4CFu?=
 =?us-ascii?Q?vOMtALCN0aAVpArT5b5chwkwjlKaN0DaXTT+5w4wCr6ho8Hq50cAEUHwHjQT?=
 =?us-ascii?Q?HHSX0UhwekD3/T0EeZu0OWjnEtaVEIiwH1Wt2NEpPLXjbuKCHsWSZn8ALYyi?=
 =?us-ascii?Q?IhKnaEMKvPhwPrJljPsHlYbq+KoT8c7P35itAKi6Psinsb0lMvTAIbelEd0A?=
 =?us-ascii?Q?U2+24QqNO5gf2zB0S4RLpBX1ovORMZcMsjuMF+AUC5NzZF6AkuXEeHYgh0CW?=
 =?us-ascii?Q?pxPZaiIsvP2mlFmR8tWIWOMcBGMnjJ8xu06SRVExXcpJVA3ds49/mtwVpgVG?=
 =?us-ascii?Q?yuLxz6ldEZdbBA7qV6S935ZozMDIa6D+5rsh0SMnDlAHD8obVlaZvQ4I8g2z?=
 =?us-ascii?Q?URSrV32uVStlorkaejsQqphS7AJjjyIhEgn/dzwS+eOeemZ7DkQW/QWMJC84?=
 =?us-ascii?Q?+qpWCiEiNgnBPEUerA2EvAyMiNB0/Wc/Ez7dSeDIfcXC5sjbkxGGxgQnH/MM?=
 =?us-ascii?Q?PfQzAqsPHKPZ8tFZNzeP1vUzz+gKj3+/msAvai6xiVVB6J/jNKH9AAw9rqly?=
 =?us-ascii?Q?L4jwIOiWwzEBdK/nNFET3v+i7v84Pvir1TS7jdafyeriq/9CW7cza4MZoP58?=
 =?us-ascii?Q?JKnGL04TwUs/2OguLYGleaQoX6AQ+8CaZrrp0CTLkUyxylQBa1XI8ppe+5BN?=
 =?us-ascii?Q?tj9JoAZYoNGAJduhZBXa4hbWdkVGFYH7uUYkkchuTI25t6ohfmwc8SHI/MZE?=
 =?us-ascii?Q?mGK9UpmUJ5/U7QlAwPMQgb1Q2vIH9isr38GMWfaIpQocV99nrYfBSrUWdBuX?=
 =?us-ascii?Q?Khh5pVAfR1gRUUejAdH+yITi9700K/zwfWW52DvZM8032BhSibgV3Fp2Qyux?=
 =?us-ascii?Q?PtSz43202mtGNnMgXKZpF45jPjNL70Q5JZLnq8NEXPVNxbGy2CuNvCeZedod?=
 =?us-ascii?Q?pll/Z/LOcY6zOeIgK/yU0H6KTocDAJYHCFwqa52zuibzo16pxiyDUPq+c0jd?=
 =?us-ascii?Q?zIVT2LOJzCIde09R2ZYbMBf8KWjg/k2B7kRPUWaX2JoweFowbYszPpBtFVZk?=
 =?us-ascii?Q?4PyGbCDdAMfxbfuzwgfJ8zaYMKFIObu/QEXVTR12sSKz3WlTMMp4Kuwt7hm1?=
 =?us-ascii?Q?sDuBrxKAF5UAi6BG4pV3evUo?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a388d42-72ef-480f-3d3c-08d949d6661f
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2021 10:25:43.0556
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oB49QH+3YSJHFyFZ5HYu081U8VbsBElKYrMmiREoB16Zpu6M8a7w9YzDbkxZ+L+uHiW0nRGF+nds9mYDCx0pIkjs24v8Pt/EAuawvzNqops=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB4451
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi All,

As per the RZ/G2L clock list document, SDHI has 4 clocks and  IMCLK2 should=
 not be turn off during suspend.=20

1)IMCLK  Main Clock 1
2)IMCLK2 Main Clock 2, this clk should be not be turned off during suspend =
state, otherwise card detection won't work.
3)CLK_HS High speed clock
4)ACLK	Bus clock

Multi clock PM domain support for SDHI is available in RZ/G2L and we are fi=
ltering this clock not to add
PM domain.

But on the SDHI driver, we are handing cd clocks for RZ/A devices. Unfortun=
ately we are turning of this clock
during suspend state.=20

Q1) Is it expected behaviour for this device?

Q2)What is the best way to handle cd clocks for RZ/G2L?

1) Handle it in SDHI driver? ie, enable it during probe only once and avoid=
 turning it off

or

2) Add this clock as critical clock, so it will be turned on permanently an=
d don't handle it in SDHI driver?


Regards,
Biju
