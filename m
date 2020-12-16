Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 901C22DBC63
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Dec 2020 09:01:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725806AbgLPIB1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 16 Dec 2020 03:01:27 -0500
Received: from mail-eopbgr1410120.outbound.protection.outlook.com ([40.107.141.120]:52192
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725766AbgLPIB1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Dec 2020 03:01:27 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UcDiKbwdoZ7/Lx596E21YPdu8pM5gou49Y8ZKdJdWv+5oMKa3i1xMfO69ct8+UfIrFF1cJzI4Qegg+Tz+XdLiEfPfXTfBdQ9jgaQsS/vihbYVZJD0E8ltOWjap3Gbgv+Rz/aROrWniseY4EpohLCGBGmloWYsCOCND7eeCRntiKlHPOeUPd0CTWQeVv8A4h29Hr1+nHwqofjxalgkbl/J/hzlnRiK7IId4lrEgwhIONOQpuuBeYylDaj0GgglcIBK4qKePRvZIMZBWA75vm0VhvR3sui1Fea3+40m5lx0o/mT60OLH8pAeOPX1WgLxcxayvW5T7VL0fIVMNLEOxvsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8jR2XgcD7DflSf1va5Q+zmfnoz4h8mmpAl8/2YAUqgs=;
 b=DVnQiPERWHcLoI/r2KtjAVyKZ8mkxJ9D9ZeWKoUbaBaUUZM4ZBbMDZVIWeZGLsyhSZTrRKUbGqx10d/Mo+DMxtDdCYHpeHK2fjxHkpFYqhZD/frJ4dJFhDci46hS3bTbYo2lBRgl/BN3LULNNYEDDZLdkwoRsx64kWU5zssJ3GdsKcn52sVW9kEbTH4UNXiTiZ8M9cpZDOyfYTC0GB7z89Sk88OfN7Z2wx7vskuTuhsdYPfWNfXj+weUU2o4goO0QR6CVCS0G1eWsYaeaBOrx9Hq9Fo4gMtbXzj9lYAi6bmMtvywNCbcc4vX25z8YUxCBtjP4CRvGGavjEnnC34Baw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8jR2XgcD7DflSf1va5Q+zmfnoz4h8mmpAl8/2YAUqgs=;
 b=HvO8/oKsLaobtbIZ7cals+85iID7hR6BQv6Wgg3//ooYznMEBG02um/lrDb6rLJjLDdBT29ZziXvPuMWb31wG6UfQ7f335TZz5wSBaPxcPRbGNb3kW0jyxG+VsjdRwzlI4KTHxnd5n1q/JxTsV87qsC8wBWpAPYXYnjl0Xfav2o=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TYAPR01MB5340.jpnprd01.prod.outlook.com (2603:1096:404:803b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12; Wed, 16 Dec
 2020 08:00:39 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::2023:7ed1:37c3:8037]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::2023:7ed1:37c3:8037%5]) with mapi id 15.20.3654.025; Wed, 16 Dec 2020
 08:00:39 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
CC:     "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] mmc: host: renesas_internal_dmac: add pre_req and
 post_req support
Thread-Topic: [PATCH] mmc: host: renesas_internal_dmac: add pre_req and
 post_req support
Thread-Index: AQHWyj/XFRA8x/qYgketk3GLo6qcL6n2zRCAgACZ/JCAAB6QIIAAJDvwgAHC8lA=
Date:   Wed, 16 Dec 2020 08:00:39 +0000
Message-ID: <TY2PR01MB3692DA2619361C6A23838259D8C50@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <1607087853-6570-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20201214155001.GA950@ninjato>
 <TY2PR01MB369299EDBA25C39E5B4FFBD4D8C60@TY2PR01MB3692.jpnprd01.prod.outlook.com>
 <TY2PR01MB3692AEAA842555886E0517B5D8C60@TY2PR01MB3692.jpnprd01.prod.outlook.com>
 <TY2PR01MB369240E88E0629EDC140D0A1D8C60@TY2PR01MB3692.jpnprd01.prod.outlook.com>
In-Reply-To: <TY2PR01MB369240E88E0629EDC140D0A1D8C60@TY2PR01MB3692.jpnprd01.prod.outlook.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: sang-engineering.com; dkim=none (message not signed)
 header.d=none;sang-engineering.com; dmarc=none action=none
 header.from=renesas.com;
x-originating-ip: [240f:60:5f3e:1:68c8:85be:c13a:922b]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: af81a110-1c44-4311-2554-08d8a198ad97
x-ms-traffictypediagnostic: TYAPR01MB5340:
x-microsoft-antispam-prvs: <TYAPR01MB5340C67766FB0459E74AA15AD8C50@TYAPR01MB5340.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OSagkkbxicCP36Df1eoNEwTUDDYY7SVHFC6Muaiy/Bzx4dzaextY4raTX3nFAHtBZFCwNrijL+HNVmm1MGmmrnajQHKntQQBz8x8tGaTui8GCBoI8i4Exbcw/NyYaHRmGC0Y/ss00lme+DwKUvbdd0YWyb9DUOGH19f3nj5Vj8FjqHiD58vY8qJ++qXJA4FJaOvaLEtLQzhm6pxgHn4J153K9eArWT9fcNUyrvswJs+t7uZmZ3bCgXkUf0M5Js82Ow+eE/U6pd43GbVSbplqm8NaVjs57098GMVSer9VAmRoafE4M47FN0ntMwTMNvoqAA6dBF2dUxT5TCtA27k5lw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(39860400002)(376002)(346002)(396003)(7696005)(9686003)(478600001)(8936002)(55016002)(8676002)(66446008)(316002)(4744005)(66476007)(4326008)(86362001)(6506007)(5660300002)(66946007)(2906002)(76116006)(54906003)(33656002)(52536014)(66556008)(83380400001)(71200400001)(186003)(64756008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?XTOUYD/DL+UzgTv3wJ8z2xgKS/doVXCfALRhBHPC+5j/jsyFRyDaC4jx+bNZ?=
 =?us-ascii?Q?FvLbJsYpdhPQ+aYUzFq80XOSZPk98kB96y9AV8jtJ027ujZCEgzHvJW5Zvli?=
 =?us-ascii?Q?w3ZOaQ0qYCRUiQsQBTXgcwqYXbTXWw1jUI8zgXvumu8hjHaoQ+brrv/nzti7?=
 =?us-ascii?Q?AByaqZb0ZvSYFcSSbkFrIS2GmNy3xAnDr6ml9iIpBsgjvR7DT30gS1fBjctD?=
 =?us-ascii?Q?AMIN/OJnkbvknKZjLkkMCfnt8L3wmfORyyAhnormpTVmlholjRN7PnLImEsw?=
 =?us-ascii?Q?/E4QZAtGYh9F62OKMjU+D2hi6zbAVeqXNsX15zR8FxGjV9GvWq0taRa9IH8J?=
 =?us-ascii?Q?adV1acFl2WNVluB3935BlHG1FRsiivEwfRckdDf7e5rQxVm89QHMcX4EJ18J?=
 =?us-ascii?Q?ttuFUgcc6nWWI7ikRyG+8Ef7C/ThiMdxMKM0u6ZyGbOgwH2lo2iyTIirr4Z9?=
 =?us-ascii?Q?+fFUaiffuBDEEcU55OYHFo0T59kqcFmuxXM9RW9H4VL34/5P1F8cQZyS6Cmb?=
 =?us-ascii?Q?+9t+jWFDRlYvo1b3VlEeTQ2XrcsAbiV2K8LiomZeHG4YDEfSc/fp7yHYnuow?=
 =?us-ascii?Q?Ly/p5q9HJdlz5oXBmMiJq4O0svWeCzkBptocMLFqkGk867xou2p7snZ5R96a?=
 =?us-ascii?Q?5xE+vR6VwUO7WHxwMi/ZbxagCMkhDvx/jEx7crR9QaJv8Vl/O9JrnPXAfCR6?=
 =?us-ascii?Q?6vLYC5c7We6s+2No5O/FUOB3+LK0LAEukqldcYe0woZ3tRQFFoKcK6I+9fG7?=
 =?us-ascii?Q?Zgwi3+ZdBJ4xu5M4f99y8saLS0OW85sq7Uan3shvwtFU0QfgMih+jD+CUk6e?=
 =?us-ascii?Q?EvfQXf3i79g3qgIzCCmZIJO6mwrlCGTbx42hKj3fkVPjVWJPqLJEHayoqVY5?=
 =?us-ascii?Q?a+MEHbbo8keXLfRCLb4vGW9i5CsqElErYOy8gd9c/mtH77WlZ35wHlipqjR0?=
 =?us-ascii?Q?Q2ZNdEulMmrXH59IPaVFJdDUsxzZ9nAcBORftqz1uxvo6jHBzqiSNd0OfSdr?=
 =?us-ascii?Q?7G3JO/kuthcU0ofADQUKAgHzus/BVF3pyjkZjJIJWuj0KDM=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af81a110-1c44-4311-2554-08d8a198ad97
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2020 08:00:39.1490
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tJyP5cXzX/D/9IE/GYZ2JhRq5FONOY6YJuYMLAL+vf2NPdAVBhQ7zE2wwhO8LR3sur7fD9XtpjSElAytn8ZoPJax9r7PqRF7Ys9aQcLULE087dg8zJMyM9Rb8hVV5L4U
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5340
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram-san,

> From: Yoshihiro Shimoda, Sent: Tuesday, December 15, 2020 2:03 PM
<snip>
> I'm sorry again and again. But, I realized the current patch breaks
> "force_pio" mode because tmio_mmc_pio_irq() doesn't take care of {pre,pos=
t}_req.
> So, I'll try to refactor tmio core to support {pre,post}_req().

I'm sorry. My fault injection code is bad. In other words, we don't need
to refactor tmio core.

I had added "goto force_pio;" in renesas_sdhi_internal_dmac_start_dma() yes=
terday.
However, I should have added "goto force_pio_with_unmap;" instead.
Otherwise, the driver unmaps the buffer after pio finished so that reading =
data
by pio was invalidated by dma_unmap_sg().

So, I'll submit v2 patch later.

Best regards,
Yoshihiro Shimoda

