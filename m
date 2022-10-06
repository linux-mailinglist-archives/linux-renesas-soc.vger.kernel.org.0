Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 585EC5F6B3D
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Oct 2022 18:07:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231512AbiJFQH5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 6 Oct 2022 12:07:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229454AbiJFQH4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 6 Oct 2022 12:07:56 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2137.outbound.protection.outlook.com [40.107.113.137])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 213AB6C128;
        Thu,  6 Oct 2022 09:07:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dVdU3Vyn/3g423oI+UuYMtdfB9VV6Sbo390P4quOAAxVaR4D33lCy2uc7feO/NgXFog1pXKAFZvnD5NSjWw+4ivn1S3+KEpwRZSotOJb8cua07w5pt9u0zg/NQeF9YZ64Ag02RZhNt/WQyksTUtGjPdpEVdrnMnFA2qWD8qtp/wRLYT3v36uU/UKbVSK14uwc1yaq2lpmmj7DFTNEZI4np72Zq4uz9asO+gixhmCfHHFoakHKwm4cU1V9auD8HpjVZx5mKfHful7wwuvTkLQYryTGcjVRKfvWzV0GYBzesL0zKmQUSt5ea2pHdNRZaaVXelUTTDW/zTMwhEV58zBTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bKuvK8suroD6Wl+TomfKV265aPzxs/xZzxHMwij5ozA=;
 b=hiQVb+wnooXoXLp/YcSKhEbbgmLJ/5ougtGuxesAGohOtMq/vKLj9qAJwGV++5CId8Fk34j7y40bArW3+m4sWktSP6qZ0H3Ne1ZLCdYJzRWX1fsOCgnSclnF54GxuoudaKvgAhIBPye1UrmCuZBlvvqsYrhevztjYziWx1mSVuKybYoAkc17lrRR+rF1w9tEAhwyUJ2J1Vvmq9t3AYHrH0mRbyezGN7SgYukN5v/1IpSBayZL3Wxl6xeww7JjAfGeiAhZ4mRhxLJxclDbNHTsXF8UqiARJMHK+Fph7Xy+c8U2bRnlNE1pAt5A7gv7F+dvlv4wjq7vscfl2EukRAwBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bKuvK8suroD6Wl+TomfKV265aPzxs/xZzxHMwij5ozA=;
 b=JpcA5q1m9BzXoO240ZaIZ5LH1bH8tq95zXAkpROPwul+R5VGWWKvz6MSr6jzlY+7WhJy6ZQ0dpcro+ANCNbKxPnLqgM27t+YgY8MFS94RpVKiRBqPYJaLzrqJGEYf8f4jhwjWLFqRm5np38+qAnDW4l6tK/dohjZwOgo6KkfHfg=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS3PR01MB9412.jpnprd01.prod.outlook.com (2603:1096:604:1cd::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.31; Thu, 6 Oct
 2022 16:07:50 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::73a6:588d:1198:7262]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::73a6:588d:1198:7262%9]) with mapi id 15.20.5676.036; Thu, 6 Oct 2022
 16:07:49 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>
CC:     Biju Das <biju.das@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v5] mmc: renesas_sdhi: Fix rounding errors
Thread-Topic: [PATCH v5] mmc: renesas_sdhi: Fix rounding errors
Thread-Index: AQHY0yqTXmgs2B43N0GAEep7oahxVq389P6AgARYAoCAAD5MgIAACFeA
Date:   Thu, 6 Oct 2022 16:07:49 +0000
Message-ID: <OS0PR01MB592243C904D5BD74BD9B2C2D865C9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220928110755.849275-1-biju.das.jz@bp.renesas.com>
 <Yzsb7SCkNDyCghLg@shikoro>
 <CAPDyKFpkfr9Rtrz6DF1zYxEypTYqyJyRsTyxHToBJu+1AFB+Hg@mail.gmail.com>
 <Yz71AT6MbgrTPP6X@shikoro>
In-Reply-To: <Yz71AT6MbgrTPP6X@shikoro>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|OS3PR01MB9412:EE_
x-ms-office365-filtering-correlation-id: 83caa33a-60f8-4167-07be-08daa7b4ea48
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /AfzwsmmINVAjLjH5UPUewkT6mez0VsErD+o2d9q8oZR0ngt/zMaV2tDLJQd2pqu2dyhZeHNIAbLYOvHjBMi3z5cOxbuIJO5+EY3fNqF06g3FkcIJRKgP8C9+J1cpYdbxhNcxfoBYvnBj5l9iANk3q6fi5C686fZ+ToqI5ii5vawijZvRFsfq8Yb6kVUB+37y3D9Q8kdz0CtbAdn10y3bLyrTkCM4NjVjVqhEe9pgS+ygm6v+dYawW2MblHk4RVoZkHcw+G4ba9h7w8/D9hoLaJef7Pc9UljDrTDsSgFHIPKb/UWW8WLNPQRm9duxl4BoCK1YSEIFlyHx/ixTgQm+Kab8uCo/Tz2Pojm387Y46xGsvsQCIim1sxbl2glAReJvbV+cqibdUoRv/XNuPirx94oDxYyB0KDkIKjVS3Kce/CP2fV0T6LqSf3YQ84ZkGehF5uXUo1DgkG+DWKRbZDlD/IfLsWD4uAeR/IU+8b3T+fiaBSFHQzYnUy6DGVpvW+HjPzz8P/q69MUGYagM2Zea8/5hnaswP394n8y7N5kPwdxkUvxOyfQXrqVGPHKhTNo3fogCYU0h32u3S3sZ2h/XiUp7VHiEOsfRMdgxoClSthYMQBws5Y7ltP9fWqBa7o6hp7N/N4tPmwvdsDpR/1HZxP6Svz6mrH45qkdn+QouT9mENrXppxtyeCi2HAi2JOwnWZb8S6E3QCPK9YiWtBntrDjpwZSx1IK1JoZy5Twql5Vxlomw0+XyyPL7wJ4voRCzuoxBx1ehJcC/ZBzGkuLRJYqg7n3GpYCphq0buauttjrdeWkwFasa5quUPZHe/J36u1m9HheFZr746zRSb5Gg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(346002)(366004)(376002)(136003)(396003)(451199015)(4744005)(38070700005)(5660300002)(55016003)(52536014)(41300700001)(2906002)(71200400001)(66446008)(186003)(26005)(38100700002)(66556008)(66946007)(6506007)(4326008)(122000001)(76116006)(64756008)(8676002)(66476007)(478600001)(966005)(8936002)(7696005)(9686003)(110136005)(54906003)(33656002)(86362001)(316002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?TVSpa7UgcSktG3AIpGoXCYn+lgziTrUsZMb8ErYfqAf3CsdU0/nq8fBp4mpv?=
 =?us-ascii?Q?ewtXFrgUqSD3pTvyH59ndgIUqCz9yjl6UT4O/SUJeIbgcgsedMH3fp+YBk9s?=
 =?us-ascii?Q?xZLJumIoBn9/Ny7nksq5yBoVbiCer8O8j3Cn5JbzU0VBLFdQqs3UTPclIK91?=
 =?us-ascii?Q?6RU5yKgZqhYXhRwlUprFWcdiheFKTHT9Y9NekGvF9MS2STiVtHgqvnSg9oqN?=
 =?us-ascii?Q?Vu7NUhfHHRr3b8Nv2eylVQyjFpdKTgYiteQ5kt+vA19drLk/o1mmj++vsM8u?=
 =?us-ascii?Q?H04rT88/ZCZOQD6KZ2kJfHnpVDChZqIR1pljr0X9mEdWWmkmegaLse1LRIhD?=
 =?us-ascii?Q?8dI3pB3DmQDRIoXcNUMmvsp2U1Dmf6q42/PwhTxPnpEthMnZPQwZdaxMUd+T?=
 =?us-ascii?Q?eM2oVI2qHUM5voy0jU0ST78Y3fa8m/4TaMt1pwnKQRgjKAOSQtmD93dWFYQ0?=
 =?us-ascii?Q?057cu4YMOt8+xGsBAIf1A7sZyG9EfhyPouDBG+trRDg+TH30nMJCIiGxrqFK?=
 =?us-ascii?Q?+Am2LZOBrxG7amWM9bM9kl7tyyCvs8T6pXJ1Urwis/1WJxTDUghSWTLZETld?=
 =?us-ascii?Q?QusdShjX9nSYgEKWSDH3IPutbof2HtyQtzpgfr4GTvSWuAYH5ZoFvYUjGkqu?=
 =?us-ascii?Q?XClDEMQQqJ5Tg4vaNyaibXWrSWEiJduitbw7mQBRfP+4Bk4HekBDiuKrPq3k?=
 =?us-ascii?Q?0VO4Dd4QwI3kx90rjTK130CFyRPOnQu4ktfZsHynyReCU74NyNKdmd3q5pVh?=
 =?us-ascii?Q?6IeU/H1U51cVhxwTPigo5+ilYZWa3dYynBhiQOER9Cpoa9Yj3oyQD1hNtatg?=
 =?us-ascii?Q?D8PRneMzG3yreHnhp7IQuHephhltjWO3V9LkgYCd8GOS/47ClTk+WcnBhJ7C?=
 =?us-ascii?Q?BmWsoCp7P/PmUXHZPtLSg7GVIam25gX2XksJVn2ewlLTwF9dAIrCw3lAEECi?=
 =?us-ascii?Q?+8AYPLw5nDMBne5jhsaJFpNvfd5Vcdb0ZQqjmI3F8dIvK5pi4ZYGlvqNxRs6?=
 =?us-ascii?Q?ZCZDIAx/vn2z2j2q03p9bURggq6iQkfk/u5ulJIPyjPpZ/UUf7EK/CS5JupS?=
 =?us-ascii?Q?WHpAlcHnQV3h51RsH0tq8oKEioKFpInnKHfuTxgUpWTQgdqqzvK6K4zjuHOL?=
 =?us-ascii?Q?WI5VJYXmvAHEGlLZl76jMLpRyN14nAYi9ScZ66VpiMXPpzZ/npgRWl5CuLJs?=
 =?us-ascii?Q?2erxKFLLurr+x7SjGPFLJBCS82RJBTDKoJhu/Mm3RbhWMr+j01qbegiZNrFx?=
 =?us-ascii?Q?paozgGVT82UTNEjwO0g8dcNbiQ+ipKI119dgUcefKzPTgxvl7uwmtEbfBYCr?=
 =?us-ascii?Q?jh+/Dq7y4HuuRaEt1PSgmGVbkUkDBKnLf4E37qj8kYQw+GrzIDfSTb+CUvzu?=
 =?us-ascii?Q?Rqij7XmuKEW3TJiOPxasI/sVchv2QclQDk8w5FBtlc0ruz2KsMk8S9zSuHWz?=
 =?us-ascii?Q?1rJyqro9piBGzI6BDKGuOvQq0oVcCHleNYDTYp+T0PDf1gmPrXWPimn9c9mT?=
 =?us-ascii?Q?PURyn9IfD8pB26a9QBUFPZaFF26b/wl9VZNBDPRCZT03CZlEfbgFiNmGTpiM?=
 =?us-ascii?Q?Atvvdn+iZk8CVvjPjYVZ7+BNEj8OckI4dPFiMzaSBin9r03tnDROi0zsFbQf?=
 =?us-ascii?Q?2w=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83caa33a-60f8-4167-07be-08daa7b4ea48
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Oct 2022 16:07:49.2263
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TeiFbb+bQTAgwXo+PXn6zK1o3B2rWPvUUOuxZnxyTKa4znbPLGFC/ddPebWOPxRUoSLc+30058FXMYUcPHVKdY2oOCY9lFR7FcUKLjgZ9WI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9412
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram Sang & Ulf Hansson,

> Subject: Re: [PATCH v5] mmc: renesas_sdhi: Fix rounding errors
>=20
>=20
> > Or is this just a general bugfix that we should tag for stable?
>=20
> I'd think this because I assume there is no commit causing the
> rounding errors. But maybe Biju has something to add?

There is rounding error present since commit [1], but no HW at that time to
introduce the error. Then we added RZ/G2L support and we started seeing thi=
s
issue after [2].

So may be treat this an enhancement patch or fixes to [1] or [2]

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/comm=
it/drivers/mmc/host/renesas_sdhi_core.c?h=3Dv6.0&id=3Dbb6d3fa98a418b071c5f7=
35e75558604f5f4af66
[2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/comm=
it/drivers/clk/renesas/r9a07g044-cpg.c?h=3Dv6.0&id=3Db289cdecc7c3e25e001cde=
260c882e4d9a8b0772

Cheers,
Biju

