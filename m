Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 76DA714D899
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Jan 2020 11:05:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727036AbgA3KFs (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 30 Jan 2020 05:05:48 -0500
Received: from mail-eopbgr1410102.outbound.protection.outlook.com ([40.107.141.102]:8301
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727027AbgA3KFr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 30 Jan 2020 05:05:47 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ld13QiA5NUZFQqbkQBiFxFll5ZJobvpENpnd3Nly7QbOGzjNehmSgnkOXdvCVktfukeSmLRzgj0ns8tNEPKS97F1DVwKcsEpfPySc4VPy53WLrNW6CYhiUlk4dCy6Br5Rp83v5ZdTWaW7bhsDBuZVyQ8TapZ86jn7FmdJ24uU/q8is7BHeT9BxpP9XifbVXybtmClykJ8i86oJl3ufLzfB+0GDcWYvR0aut1OV1CW2L/EMrOB4K7FBCUXLWpiqcc2qyZeeKLVF07hRXL24ICXhO8eayt9MCUzJy8Sh4QJw6txn9UyeS85SIUkxrL1eiGE6cJN89HeZecVaO4ALm1cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jn5+leikvrKcmZ821Z2WOAKc341nmVW7g4CC2ySB4+0=;
 b=LRpm9B9XKpOwQz+ZLs9U4w8scYYPIbIlf/jNIU++0idVYL4CqfI1k28tbysMtrY4S4jGMI/aOYV8oZtjqosYOFk8vEvUww1gPZo6rw9Q4y/Zbr+BYuVstBbMUKjwfGHtj1i1/eQM2ynuQP3VO/Bwx4VGE3D7V48+HbP3BcfCpTK+0ZFXYyRiQzkw06TkbG9tLBk1Dt0VmbK5+9MWyf5O0evEg+2H/0YwHW8wIQNbvm2YfLBiCG2QHO+i48q68X9zBUAma/qqljfUzH6bPJUig4JtnyYj9+VL438o3B9930cDhGiXeqPzzejVrEIlpjtfNwNjm0i5GYhxO7jKvxdWIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jn5+leikvrKcmZ821Z2WOAKc341nmVW7g4CC2ySB4+0=;
 b=Tphpj0jr+yR5TtFEYP6rsMYcwKKSYSHF9NKG7q66E6RS9SR+qq48PJqnYfIhkD/jiX21GIsyJHcUigtKML1niMndu36Ez7OpsYjtkC517NQthIVwlTrVhFvwcSVafe5H7Xj/pGM6Rg1kOAaCvTriwitFOnWm/Ucr6AXEBKns8O8=
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com (20.179.175.203) by
 TYAPR01MB3390.jpnprd01.prod.outlook.com (20.178.140.86) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2665.21; Thu, 30 Jan 2020 10:05:40 +0000
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::318b:31aa:4212:bd49]) by TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::318b:31aa:4212:bd49%7]) with mapi id 15.20.2665.027; Thu, 30 Jan 2020
 10:05:40 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [RFC PATCH v2 5/5] mmc: renesas_sdhi: cleanup SCC defines
Thread-Topic: [RFC PATCH v2 5/5] mmc: renesas_sdhi: cleanup SCC defines
Thread-Index: AQHVtM7Vgp4j2fYRWUOgwYV0P7TevKgDP9uA
Date:   Thu, 30 Jan 2020 10:05:40 +0000
Message-ID: <TYAPR01MB4544745FB7765882F4EF5A2ED8040@TYAPR01MB4544.jpnprd01.prod.outlook.com>
References: <20191217114034.13290-1-wsa+renesas@sang-engineering.com>
 <20191217114034.13290-6-wsa+renesas@sang-engineering.com>
In-Reply-To: <20191217114034.13290-6-wsa+renesas@sang-engineering.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [124.210.22.195]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 16fc55a0-2f91-4489-d9a5-08d7a56bf5fb
x-ms-traffictypediagnostic: TYAPR01MB3390:
x-microsoft-antispam-prvs: <TYAPR01MB33901B6A6D5C8B97CD269E95D8040@TYAPR01MB3390.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-forefront-prvs: 02981BE340
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(39860400002)(396003)(136003)(366004)(346002)(376002)(199004)(189003)(4326008)(71200400001)(478600001)(86362001)(2906002)(186003)(55016002)(558084003)(81166006)(9686003)(8676002)(8936002)(81156014)(52536014)(76116006)(316002)(55236004)(26005)(5660300002)(7696005)(6506007)(66946007)(66446008)(110136005)(66476007)(66556008)(64756008)(33656002);DIR:OUT;SFP:1102;SCL:1;SRVR:TYAPR01MB3390;H:TYAPR01MB4544.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +53lfFxWSjvYnvp16lBHR6pV48DsOtzFKoMnxxOlnEiG9pWocPZVsO7TynKB74fzH+P0tnj4KY5K5TgClJMlMK/HN9H1Jtd+LlOEXaxM2Xclvv2lqokaNRh9OnMv3kh4HNrWEPmLPBtKyVeUgylE86VCmB8lB1IKX90WZg5+G/j0//JBxbUllIPDNTDZsHluLIOoXZyVAt0adfIUkYbay+A87Cqk+hwClFdJaqBBs/ohWR+uaWl+TwkuZw598kTt1xb8ffBmj52JJd3Dda/SDsVPumNX+IcFmaB7bW75wO0Wb6WICOodQwzLARqlx0FYIF1MAnTNW2KxXY6puZnzNfyhXwNKgNmt5lNrxvQ5AFzKj5ij0tyPhkRYyTe30AlwywtaoeH9NalgTg4JSJJDZqpwwYIyhXwvMxYHnaxI/8dbhF0aVymrKs+iObsy/Zm9
x-ms-exchange-antispam-messagedata: D89bsdY+jNRQV7td0GDP79yfU8VWe6+xnGrp/46+Ws68HiBPKBywjc4K3tjBxgUeWEHzLohNXJV3xnsT35wvaBSPX5yO2Jtg4sllNLppzHHkTiIfQwERkvHmCDCDrR3/W/W2xMY+hWPRSrDNG+yOoA==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16fc55a0-2f91-4489-d9a5-08d7a56bf5fb
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jan 2020 10:05:40.1472
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BMfSMyJsk6o1J20QgT9rr9krAibt7S/C7DR1WyDzaAmySvOnuLmlM2h2kOioVAms1bIqaBo5qtZ5LKS36Dy7Xa45qNn/JcBM+sfq6/VfNyogrEXJnqXwWb+hkpNIU91f
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB3390
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram-san,

> From: Wolfram Sang, Sent: Tuesday, December 17, 2019 8:41 PM
>=20
> Use increasing BIT numbers consistently and remove some superfluous
> comments.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thank you for the patch!

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

