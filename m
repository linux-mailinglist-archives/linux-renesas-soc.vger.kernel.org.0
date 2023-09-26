Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3FC547AE6AE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 Sep 2023 09:22:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231908AbjIZHWK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 26 Sep 2023 03:22:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231653AbjIZHWJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 26 Sep 2023 03:22:09 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2102.outbound.protection.outlook.com [40.107.113.102])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CC4F11F;
        Tue, 26 Sep 2023 00:22:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JeLkVDz3VmYeu6v7FwsWGdVZkELnuWrRbFab/mqwWFQveIsqUD+JGVZbr0gsmy5V2f2L5kM/Xf1HVfNk/B7njZUs/RFRUZjXQnTBJ/zlSVLpj2MSEEuFvTEKhxR5JgAWUobwxDWN1iI7qJxJhinI8T9S8SpxZYctlcv+vTdrzEurVR8L3HLkIJg1ZDhkEhREPxikZ8rBanS4tl+xKvxN0x/vtqITy8GSWc530+COHDWE70czxibgMY1dZZDEMPVZkVa7JQ2Txea2+7zR9oKfILUEkq/3naibC8aIkRvvFvFjnuJEsmkn1I0JeUatBdkTlmLlXPH95DtlR7oBx8qNgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NLHBlbcXcbCo0fX1FjgDBTSvJYLwG3aDy54qcd35kVg=;
 b=ZS/q0/oWJHq3bDRKBaA7FAcC+oFkdhhLIEIsfufBvcBOYXFoXW+Wd+aasgr3PRWlxelEB4oq2+HgnC72bSaryuViuBPReV0ti2IhPhe2rhFgL7as/10MZT61wMnht+VsjXBcfxmlJ96uwAmpgFl3xujMDftps45aGiX+ib9o6RdqVNe/Ua1nCBEm4DH7+DrZBgWI9fa1JsvTCnl5b8eBHE4E97J5mMrPzlGmkkJW7MTL0YU4vakEQeYytCFduKdNadtYp7QJGmRk15DNILJWwd6rjwLJ0oE0XknCFAJyrP8xA9f7OUGdwqJoEs8S4tycZK9FGBa01MP1hP5W0a+BDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NLHBlbcXcbCo0fX1FjgDBTSvJYLwG3aDy54qcd35kVg=;
 b=flxv1lo57aveunDNibJCT+6I/QDaFGh/35FpgOZYpkP34AVBlqZhTONqtRORSPWGMdmrYmcRIA2UN8yvvvInEiNbZR3KSf9tSXVwh7nq6LAS5Jhry9/Jr0/gHPonaqdlfVK/Ov/S3qD1yuCW6qY012k75IAJ/WIwzCRl5CUnh/Y=
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 (2603:1096:404:8028::13) by OS3PR01MB6007.jpnprd01.prod.outlook.com
 (2603:1096:604:d5::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Tue, 26 Sep
 2023 07:21:59 +0000
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::1dc4:e923:9916:c0f7]) by TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::1dc4:e923:9916:c0f7%6]) with mapi id 15.20.6813.027; Tue, 26 Sep 2023
 07:21:59 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Andrew Lunn <andrew@lunn.ch>
CC:     "s.shtylyov@omp.ru" <s.shtylyov@omp.ru>,
        "davem@davemloft.net" <davem@davemloft.net>,
        "edumazet@google.com" <edumazet@google.com>,
        "kuba@kernel.org" <kuba@kernel.org>,
        "pabeni@redhat.com" <pabeni@redhat.com>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Tam Nguyen <tam.nguyen.xa@renesas.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: RE: [PATCH net] net: ethernet: renesas: rswitch Fix PHY station
 management clock setting
Thread-Topic: [PATCH net] net: ethernet: renesas: rswitch Fix PHY station
 management clock setting
Thread-Index: AQHZ70gLPZK+4KBkgE+5y4WMpBuX/7Arl4+AgAEbrPA=
Date:   Tue, 26 Sep 2023 07:21:59 +0000
Message-ID: <TYBPR01MB534186322164085E74430B4BD8C3A@TYBPR01MB5341.jpnprd01.prod.outlook.com>
References: <20230925003416.3863560-1-yoshihiro.shimoda.uh@renesas.com>
 <7156d89e-ef72-487f-b7ce-b08be461ec1c@lunn.ch>
In-Reply-To: <7156d89e-ef72-487f-b7ce-b08be461ec1c@lunn.ch>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYBPR01MB5341:EE_|OS3PR01MB6007:EE_
x-ms-office365-filtering-correlation-id: f576eadb-ecc8-4a08-0330-08dbbe6145b0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 46oXvpMdyAdQ+NL+3xw3kbDZN7Y0dlKo8Sr4wopehPgCMBz5PgfuR7Mj4W40jTDs4R3Ts63xW6+swkQ4tD7BlYH5fYLo3TWAuAbtTVo0Xcr9Ypgh1kTwh3Ueu7HV2egr/6sgj4z18mxFwvJLwOS70kEDPuoAMxwBoMmyq7P8EtmoPuThCzLg8hQx0oz4SGC4M5ioQoPmQqSlWvtWXZXCOUWP15Cs3kBuugIovRnbykihl0P0ik4ADqjsp83o+DdYDu3aYgGbgPcEeGUhp3IrYb9+c7c6QsCb4Yq7nPpkvH4GjR+JewNyGUH4E333D0TtfiJCChrqVQkNQHmFoosJG3uDbAMIju9SbRBi0HyNC9e3Roh4FpZa/DI/dzLKBA9x+IO8JLGRHsDDABH3TC9uYMyhZX1arrW3auGhzVVcX4lR3L8E52M0Sx4hRY+Y2S8NOEZfZ+ie/IOehYL3T6uuvKP2bvwp/RJ52XpmTpP8HG1njpRm0iCd1eeG+GFN+3MDaa2XZBjoghlacpAVzSfJIAqcgseee4o2DDQ1pfay0MYj/SwEnaZ+XyaVuVyNlJO2nFNxDJcOfJjcumsn9zRQiqfvYqlo7gHRQrthlchbo8zKJ571HXMRPCksFnZ3d747
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5341.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(376002)(136003)(39860400002)(346002)(230922051799003)(451199024)(1800799009)(186009)(2906002)(5660300002)(52536014)(4326008)(38100700002)(38070700005)(55016003)(41300700001)(6916009)(8936002)(8676002)(66476007)(107886003)(66556008)(66946007)(66446008)(64756008)(76116006)(6506007)(9686003)(7696005)(86362001)(83380400001)(122000001)(316002)(478600001)(71200400001)(33656002)(54906003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?e0oiEP8E4ZqoaTWEqM8DGBNR1ROwZ/uEfryL4hjl7kWUyBjApL0Rin1wu3pl?=
 =?us-ascii?Q?FgMT7DUkL85ktM5NK9e0mcsDeSG9tIw29HYkwMgzxGwppAZFL2LTl1TSPMJW?=
 =?us-ascii?Q?7fTWeJc74yyoq77AQr6lAueJQlQA/x+6yusmTx+uVW8PASTZ4YXE3zkOMGh2?=
 =?us-ascii?Q?scLleGEgG60Cw7jTgH4fazkwdKx8/qkePjsXbn4sxkeaSgXr5RWo85/UiUIp?=
 =?us-ascii?Q?OEIOUfKMUXXVGkbeQ5fG/X/ExF2v4x13s4XOmdeVJOs3cyU97dRVIz4R8xuo?=
 =?us-ascii?Q?RXaWrNTiDenPl9+ADc7iAIxVQNcaL3D0TWaVf60IZ0rJAeYXUsHjY+jWr60v?=
 =?us-ascii?Q?QJH83bfJY7QfncUQLyt0NaAbVYHkeVIp5Sgl0IioAVVN6R33vSEzB3CvX3ff?=
 =?us-ascii?Q?61+OoE0/sMSSUDJayO632dwwQvWYPBXl5pfqLVyBbH+EhbdvmNBGWjFNl/81?=
 =?us-ascii?Q?tgY7VzAAXVqkRAVhwbA1iFNH/hLHkuKOjLfJf8a7kXhWYHEdhOz1xohWRM11?=
 =?us-ascii?Q?g+wriPRL7wWt3T4DCl83Nucu8HBeoRMC+xSPK2ThL5B96QbJ/GiLo2NuX2Zg?=
 =?us-ascii?Q?a1GOX1kBQWkNUHh4YQIwfDweUo0QRwmh8A8CbF3EPTUThH1Wxz6wFIJs5QbD?=
 =?us-ascii?Q?IHJbHOFFtAnB5Bc4G7EtfjOzlU62sBbyCb+ipyOIQljrUHoE4QJwub5t2fWY?=
 =?us-ascii?Q?ZwrcDBXqwgFtdQ1NnfgavK308nethgmiP/VQNyaby5+ug+1d/mXZk3EqRWnN?=
 =?us-ascii?Q?259X4J32ECx87kik8j21yN5hGtSA0mipIAHblPCN66jt3KX06zJMd5nRLrk3?=
 =?us-ascii?Q?mEPrvi1nZ+GjCMh+qDj9oFNJKdwoBxuGUkfkoIxNdwA4BiMxPSCPEgU+pGod?=
 =?us-ascii?Q?YFR++YHQCbIxb29ktQirGjJzKbFw1e7E1WlXn1dnIbkv3r9ln/A+g4mbT9SV?=
 =?us-ascii?Q?2NKdJfnmapUPlA3W2Jbsn6HQ8J++sLXdFlaCZHOTQ6kjCGcNQV46Rb/a/xoV?=
 =?us-ascii?Q?UCKi2XGBlgdRxhz3HNRppNNwWf0G87yw3ZaYlfEw9LwvF0Y2sZOyOg18PR1c?=
 =?us-ascii?Q?5CFC/3FZ9qdvRSLhkJk5zBu0OHIp+VFMXeSYiYeiji563S5mkaoG8tGgZ7CI?=
 =?us-ascii?Q?Boa8fbVayxXSLQ/grhtPG6vix0OvyO8NvI2oC96JuGL5uQBriTVhMJSG1yDt?=
 =?us-ascii?Q?GkAf1b2wqmbpo1MvyJk0xpF8iE4+pvxrQnt9Q0wBO5gB3Ng7kr3Uz9WWCosK?=
 =?us-ascii?Q?T3AJfrt4nrI3jl2wt5IMqoLANLynyGUMe/RVTor/t8+Ey2qIdkPLIwmi99K/?=
 =?us-ascii?Q?hKMPIu9tihtu6YzHBbnyRR05k/qeC8O+FUkp+TQvx+ZB17nRWxaIQzGLGA27?=
 =?us-ascii?Q?mi436siRDEnDuGHnIfsHmhulpf58MtWeZIKIHkXFo1rF1DMYILbZEJoGLIn4?=
 =?us-ascii?Q?BfKFgX64tqwW+QTAzuKbXQLdMPrOGOE98UJVjqpOPzzC+FXVA3mhZAAFhf/a?=
 =?us-ascii?Q?CSpQCCggL7kPsQsiT3cgQWiME3eD/TjA3rY5734NkweApEdPQbZ+kpX4P4SP?=
 =?us-ascii?Q?R0Byw5+Ju0GIaEEs5jOvDQb+WWSOdWohcaS6hmMrJh9VEkWCP/i2ICsd4r5x?=
 =?us-ascii?Q?LIncHjA3WP+Sh63MudRQY76ULTp78gq9RPBf77KFLp9g3HO0emzzbk8Ywk8/?=
 =?us-ascii?Q?cHpS4Q=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5341.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f576eadb-ecc8-4a08-0330-08dbbe6145b0
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2023 07:21:59.2976
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TZJHLKJ2xJJLKdJLut+3eFrRbPOMiE4NNKMRPiqrMQV2AmHkEw+1sHlGHQHK2rygWa2FzSTKtMLMDOanOrspvdbwvYutS8Tvfm/UGWlVa4K6JubfkIQ6W4UVA8DxGlvE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB6007
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello Andrew,

> From: Andrew Lunn, Sent: Monday, September 25, 2023 11:18 PM
>=20
> On Mon, Sep 25, 2023 at 09:34:16AM +0900, Yoshihiro Shimoda wrote:
> > From: Tam Nguyen <tam.nguyen.xa@renesas.com>
> >
> > Fix the MPIC.PSMCS value following the programming example in the
> > section 6.4.2 Management Data Clock (MDC) Setting, Ethernet MAC IP,
> > S4 Hardware User Manual Rev.1.00.
> >
> > The value is calculated by
> >     MPIC.PSMCS =3D clk[MHz] / ((MDC frequency[MHz] + 1) * 2)
> > with the input clock frequency of 320MHz and MDC frequency of 2.5MHz.
> > Otherwise, this driver cannot communicate PHYs on the R-Car S4 Starter
> > Kit board.
>=20
> If you run this calculation backwards, what frequency does
> MPIC_PSMCS(0x3f) map to?

Thank you for your review! I completely misunderstood the formula. In
other words, the formula cannot calculate backwards. The correct
formula is:

MPIC.PSMCS =3D clk[MHz] / (MDC frequency[MHz] * 2) - 1

> Is 320MHz really fixed? For all silicon variants? Is it possible to do
> a clk_get_rate() on a clock to get the actual clock rate?

320MHz is really fixed on the current existing all silicon variants.
Yes, it is possible to do a clk_get_rate() on a clock to get the actual
clock rate. So, I'll use clk_get_rate() on v2.

Best regards,
Yoshihiro Shimoda

> 	Andrew
