Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 97F0979397B
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Sep 2023 12:06:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232252AbjIFKGe (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 6 Sep 2023 06:06:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238568AbjIFKGc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 6 Sep 2023 06:06:32 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2103.outbound.protection.outlook.com [40.107.114.103])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E50F11986;
        Wed,  6 Sep 2023 03:05:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W/ijDuVt47wJ7QaBjXo6fNuuvqXFW33Tps/rqDQCVDoHeQrs5HjqVscne0Fd8QrQTPzFLYjKoxKZk86c98upMpsSsz1yN3ShuV0SXtRWetvGVrB3UwLxm01AlHVEEk4HXNhQGRcXlTH7cspxRDMSaBVkSRACSrO/mf7HElQ7kset9/PcSFm5xMjs8Owupokaf4gH9J/qkjaU01I9+CZ3teyCqPNmdrtWTaiHllufPNberKm1VGSQB6vHJulb/PnC1r81nn3noG7imQqt+wb43wR+7Byi7wiWyrOFALQ+I9PGHdpWHRk6OzAKlZbJy/6U7X01BM8j6CjxAjWHgyKLPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CVQ+5HD9quvDjAVNzhd/zcL5Ag/dzpX9fTAT7ybe6iA=;
 b=H+eybk5ezKRocKjDvNLzH17hdL5pt+b/m7Nfl1nBjF86hDzaeDlJ1qLnFuH+5wz2UZClQ+YA9Hwyyj/ngXrOMsJ0K1GUlS0TYXHH+s0yVzW713VKckKYA/iyHPoerlxjUsu+YhRU6RVDQxzeN0RuRxmI2e+im34YTONPTrReC/ey78N1I37l+ituS3KUvdz2JbWzEnq49D611acHaQ7hh+RssCQXEkC7tZKrNEt4yjLLNBg8XST2vjq3Dnrb3BK4875C7vyMdtPhrDGUZbf79/mn/oXcaj0BnL9VaRnpqwpAXCDL/fgkfw5gIFppnTnPWVnHGJTwmrZ5bNyFnPOKXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CVQ+5HD9quvDjAVNzhd/zcL5Ag/dzpX9fTAT7ybe6iA=;
 b=M69ctuSJujhQflhyMc1w+xXrnDVzuEWTUnu3cqbvPCpvQV8oKR9r39hpjEH3IJjzfn4X2yiHQHzdxBwQYqHpMiDJcYpaNWehBFB5XAm+nJeBrbnvxChqIB8ygerAIgjyvTXWDXYsvVr3U86QbBgu9Q4+NzxnbOb7vHaI+mlP20A=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYAPR01MB5513.jpnprd01.prod.outlook.com (2603:1096:404:803f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Wed, 6 Sep
 2023 10:05:18 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::9d23:32f5:9325:3706]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::9d23:32f5:9325:3706%5]) with mapi id 15.20.6745.034; Wed, 6 Sep 2023
 10:05:18 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
CC:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v5 0/4] Fix Versa3 clock mapping
Thread-Topic: [PATCH v5 0/4] Fix Versa3 clock mapping
Thread-Index: AQHZ1nh+NHF2xlaW+kizb3Zp4n0aULANpgwg
Date:   Wed, 6 Sep 2023 10:05:18 +0000
Message-ID: <OS0PR01MB59222FB9C553696FA8C2321086EFA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230824104812.147775-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230824104812.147775-1-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYAPR01MB5513:EE_
x-ms-office365-filtering-correlation-id: e2e1843f-31da-4261-570c-08dbaec0c611
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9SGsrC4G+lUln8ewwsMvHX0yhYfHIJ785iNDEdhQKzpIrDSz34ucMwvxuu0jV7QefnRFxipfmAT+qPWDOzc7ovnZ3gtNiCxlpDX1tmW6KM6Z6JHm8br1j97HlxB1MKOUhba7EXr97IW7LUI10TEBmPSheb9Fao9C7ke/A8Ds0Ct7cMTy6hvWRi+186mI9lalCq/Et7vZ/L/gyMJo4BrQ1qp4DWn7FpyYJ8oauQ9wO/ZNLnyF4KzI+CQUhs7JmyXcU/1Qw35DuUISgscRzQ8JrqjVSW1U6m8GvKnlYYgqi5cEL69MajafmzMPVCsba/tdI25TqONM9aLIcoRqEGlObXc2TIN2aCGWQsElKxidOAj+L3yrC305JvuFSjEn+CCp2kxMfG5bNPSU/S1p0SG7cHiz1Fza5pOsUEQUeYOQM3an/aelF5qbt3aNAms4ZyFGKKCtb4gE2phKOLULhe0GMARXj7dcgzL9L3oeSqAw9KGdoUgRSuU8q7XP6souMn5irN6stMyoyBYQPGo+aSG/b/ajCWN3g0JnQ1nJgVlZ/VU3wahxvWmXWmwN0iglIqxBaFjnvxZAVqtA1QP8uJoSlURTeqZ+U3YsP/rZul90WIdc1LQF4VFTVXlr3qUC+c2b
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(366004)(136003)(376002)(39860400002)(451199024)(186009)(1800799009)(122000001)(6506007)(9686003)(71200400001)(7696005)(33656002)(55016003)(86362001)(38070700005)(38100700002)(107886003)(2906002)(26005)(76116006)(83380400001)(478600001)(110136005)(52536014)(66946007)(8936002)(5660300002)(4326008)(8676002)(316002)(7416002)(54906003)(66446008)(64756008)(66476007)(66556008)(41300700001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?KQrcxlvnSEzKT4u96Yyfo3vfb24/WgoP+Y4OS0YWqpDlBntwmJwEQtVEraaA?=
 =?us-ascii?Q?9xuYgRi9lkONvU46oMZLH5lHkueTPO/Yly8Mi91Fl/vpXlnVP8iEZseaTvh9?=
 =?us-ascii?Q?EV2QuNWLifPs6E+kANNA9Vc+mDn+khdgdZy9JwvnmTKN7AuNDQ9u3Q5lfigi?=
 =?us-ascii?Q?fl3LKwAI0ZXXCDheUXo1/QlVtIDWpVwvDGaVscpK18W8bS3qSdoBi1w63UbN?=
 =?us-ascii?Q?W+4uul79V+RcFu1cY12ZLwdOh4u4hZ1p/KL9YpB2EUHOw/4I5VHrd5V3mZfu?=
 =?us-ascii?Q?s64GLQrbIabHvhd9a1/TSK2W76bx0HbQiKyZWhjX1hiyrFLpAbXvgLlbZ368?=
 =?us-ascii?Q?tCcnj5amt7olRh7O3NsNjar0EZ1KsoIf0SXTWxJn3oB+q+tE9jI7F2Q76g+w?=
 =?us-ascii?Q?5GfxGfkE23bM1WvfHe4X7CgG3bwEQ4cCGqcYd3GYRAovsy1+Ny5CNvve8bwg?=
 =?us-ascii?Q?vS16WXrQKig3pOAxNvKhz9H7HrTyFPK16HUlozc66nvu82SD+KZJ5Dn/EMno?=
 =?us-ascii?Q?+/N5aCXgqjiKTh/ykkPSED1xEWaYDYtsaKbwelBE+UhYm8N0dlZmf1Vz/67V?=
 =?us-ascii?Q?EWG/ctgNVzy8R+mzEwirOVK+mKLvp2RaDwFYURSMcKTyvbVUiEgI3tgjI3i3?=
 =?us-ascii?Q?MS1VUTuPLT7l6CGWVyXEONkHkEQht1OmEkni02ceoysN/fYQRZEfYOV2oquH?=
 =?us-ascii?Q?689g9KOMp/taXnV2lgTZAp9wcFbgRcltk4CrYUw1TwnWi0WrA3foR4IEU10M?=
 =?us-ascii?Q?aA9UQQRLFUa2YZBJEesWynFiU7ObtAY5slGMCBDBiGlec0HUxbvoG7L2KcL2?=
 =?us-ascii?Q?9CJ9WJ075cipSIc6QM4TGXu/WnKa4ogVaV1MPWcASpbJ0TZtFUKJXsFV/8Px?=
 =?us-ascii?Q?ZbwtU6E67Tn/9CO1ro/0EcnUta22kHcVGvyPQNhDNnIunbDAb1cRD6vbEBQe?=
 =?us-ascii?Q?r+JmvAJ3J8b+c3DCYhhyHB/IIYqUqJKFeweN2K6SBy0wfogb0OiV8lgKVEkC?=
 =?us-ascii?Q?s51RX9kkxPUQtH/6B2A9pxeIg1WNF+O0gnaQ2baAQwqBUc5nJ3Rhv5JffGWE?=
 =?us-ascii?Q?FnVnMIRaTm2MvXVMNDBs7QEKIFDj2p2Kk5CgtxI/5NAqHyA4CQk0VE+BLMGs?=
 =?us-ascii?Q?80AegT8p1yqgBDU2gtPseXF+KCaUQvISdh4bokQCuhqskmWKpVDdqmVcfYS6?=
 =?us-ascii?Q?eo+l/0ZSnCC2c4Gnn3JNPadxtcp4HPSFTl0A0+lSIc8jGy8Si/Jt3G7HSozf?=
 =?us-ascii?Q?Hf24VQZOpgzmqVmRKgxQE1rqnJFb7FRAPdIm++v+oI2Rgq5ezAheAMPKMLRD?=
 =?us-ascii?Q?Rq9Vla9pCHbutSRnu4xA8cHhHcypmnYsF+/mCq3bqHPUyDCeoI7f80owGFs+?=
 =?us-ascii?Q?nv9WbdwkeVRFsKlXDtsbRWgrmwtL0PyImw4fHEOCEndxzM+ZXlaDEN9ZCFoO?=
 =?us-ascii?Q?ZOmESM6xuHNY8G9NdxZ8e732wK9PXoh9Ps3aFgjLGev5OwuC8mER0mMekgdD?=
 =?us-ascii?Q?lDV3MgERGnlMjyoQ4VkyTYEuOg1/hzVaWX0hnLZfGp8X4AkUTvVJVg1mBCaC?=
 =?us-ascii?Q?8rybv5ZEB5UZ/s6AaCr9SoUl2G3CkK3jDlprzYQ2uuuNUd3jEjKgVBf6vXgz?=
 =?us-ascii?Q?ug=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2e1843f-31da-4261-570c-08dbaec0c611
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Sep 2023 10:05:18.3006
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HasXJ1MVXMmRy3yc5hHfnpkFtTZWEmxhQ5r+JrhKO42KnLaxBhdHhFWJJnsv8Zp7qUMMGg2x1fMUfCg56T1d5lj1XMH+vM38jlIF+Q+ZScY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5513
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi All,

Gentle ping.

Cheers,
Biju

> Subject: [PATCH v5 0/4] Fix Versa3 clock mapping
>=20
> According to Table 3. ("Output Source") in the 5P35023 datasheet, the
> output clock mapping should be 0=3DREF, 1=3DSE1, 2=3DSE2, 3=3DSE3, 4=3DDI=
FF1,
> 5=3DDIFF2. But the code uses inverse.
>=20
> This patch series aims to document clock-output-names in bindings and fix
> the mapping in driver.
>=20
> Also added a fix for 64 by 64 division.
>=20
> v4->v5:
>  * Added description for #clock-cells property for clock mapping.
>  * Updated commit header and description to reflect this change.
>  * Dropped fixes tag.
>  * Retained Ack tag from Conor and Krzysztof as it is trivial change.
> v3->v4:
>  * Dropped clock-output-names as there is no validation for it and people
>    can get it wrong.
>  * Updated commit header, description and example to reflect this change
>  * Retained Ack tag from Conor and Krzysztof as it is trivial change.
>  * Used clamped value for rate calculation in vc3_pll_round_rate().
> v2->v3:
>  * Dropped dts patch and added fix for 64 byte division to this patch
>    series.
>  * Added Rb tag from Geert for patch#3
>  * Added a patch to make vc3_clk_mux enum values depend on vc3_clk enum
>    values.
> v1->v2:
>  * Updated binding commit description to make it clear it fixes
>    "assigned-clock-rates" in the example based on 5P35023 datasheet.
>=20
> Biju Das (4):
>   dt-bindings: clock: versaclock3: Add description for #clock-cells
>     property
>   clk: vc3: Fix 64 by 64 division
>   clk: vc3: Fix output clock mapping
>   clk: vc3: Make vc3_clk_mux enum values based on vc3_clk enum values
>=20
>  .../bindings/clock/renesas,5p35023.yaml       | 11 ++-
>  drivers/clk/clk-versaclock3.c                 | 81 +++++++++----------
>  2 files changed, 47 insertions(+), 45 deletions(-)
>=20
> --
> 2.25.1

