Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 42033648700
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 Dec 2022 17:50:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229604AbiLIQum (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 9 Dec 2022 11:50:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229512AbiLIQul (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 9 Dec 2022 11:50:41 -0500
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2112.outbound.protection.outlook.com [40.107.114.112])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B812B9419A;
        Fri,  9 Dec 2022 08:50:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iObKKH9Em9ISGnJ7LGWux5Na1fp8VXHaaq33g8Qszh1OFa61Notx4oq/l9wVwaXzDADbfsyaybWOjE7eezYnyypnn+qcjqpv4VjdItUhJ4yQGivkgHPsBtIZ8aYOTOdqveFEMBtKxNmpdUXttZtnY4PToQ0X8CMdVlmCFPn7gS3pSXs8GhepZrtM+BW1ASNIE6t7b76HVkrFLZzGB2l2Z90GwUhkZbbajPO9WfEfqXF4NK92+rSIoOPJ2RCvRRGly6Po6v73bGKweEF87hsnjZ0COgbVP1rMHKvEMrnfiXe9cp46MvuPZss8G8V5zN0zsvgPIEQKV0aZRgLZx4bu5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=baBejPcl3t5Ac1XgO5lrzW59M/IJtDKNW1ePP7ceDFc=;
 b=iKcNDHXe9VwJfk9b72r3aAr8O/ZJ9zDYxbzukl92c37uW2/SVXwHHnBotXGLZJdYw2ZpVSdL5NadFVaJmWXtqVFKHMeBftteQsUGYaQmqqMs9CdEvDQfOznBnqZeVBUzqUpG+moIP6IUS5G3wV2+JQNCAD6wBWVwnb2qiNcTbuKYGCP/nFmkUe3hTQJdgl0Ka8fA6nqhVHgorKji/skVn8SS7P31HRK6xGUkLBfwr1f4j6wW5IA09TuAB4aU1M5rxagy0oiuNQgLU8EaB3VL2EmyDwrpsvSYFBeiYYCAqjTfbVkUBxAQJpf7wjN9dvBRPR8kNb4k4depAJulELQbmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=baBejPcl3t5Ac1XgO5lrzW59M/IJtDKNW1ePP7ceDFc=;
 b=VcuhngJU1tRMo61pI9ROViTGR2jzJM2OIJdQ1C6erlQt9m1j3vT8Xfe8Q1RviLxuv09+JywDMxFZQfc2IsOoRn8lK/08uJJiZfFk3yMKVj2+Xq1nFaenQGJNszTf7H63UkYeT85/9MJ73F2yHOsaxumYYfoB3AyRdmai3j+2jDE=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYCPR01MB8015.jpnprd01.prod.outlook.com (2603:1096:400:11c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Fri, 9 Dec
 2022 16:50:39 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::2cfb:38d2:d52e:c8a3]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::2cfb:38d2:d52e:c8a3%5]) with mapi id 15.20.5880.019; Fri, 9 Dec 2022
 16:50:38 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Biju Das <biju.das@bp.renesas.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 2/4] usb: typec: hd3ss3220: Fix NULL pointer crash
Thread-Topic: [PATCH 2/4] usb: typec: hd3ss3220: Fix NULL pointer crash
Thread-Index: AQHZC+bSxWDj3Ma2fkSDHnqSz1/vCq5lu4iAgAAJCCA=
Date:   Fri, 9 Dec 2022 16:50:38 +0000
Message-ID: <OS0PR01MB592266C502C6BDBE063EE881861C9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20221209155623.29147-1-biju.das.jz@bp.renesas.com>
 <20221209155623.29147-3-biju.das.jz@bp.renesas.com>
 <Y5NfffSLz7DUgF3b@kroah.com>
In-Reply-To: <Y5NfffSLz7DUgF3b@kroah.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYCPR01MB8015:EE_
x-ms-office365-filtering-correlation-id: 0ff9b03b-532d-452c-3849-08dada05805c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1jV7ecMoMsG3x/tdGOmHU118fX4eqK7hz+8RhPCbsyBrjOuutBt9IRwbkl+AoGvyQTgqz9XY+UQJnY32+wcSHXeh7gpF6XKsf7SxbEhIG2IFy8dravsQWLCQuQY3atiAIhStcoUKphAdHx34zxXj5PLkBRyhN0lECtO1FDAF09C3vL6SoICN0QChJOmrAPFrp2i8ZzrYUIJxaPeVBiAHDbzOHTDdl/xZWEV7m6mIz+vXYNaRWrofJQ1wze9b5cKKzhd1hfHakeMlDdXYwaE4JwWVphqXMtHA0PJ59maO5rEQijqKYOBjZvuiwNcC/KqG4UPzEqbK1Hyre5+YvYZ4bcTiY6RcDTFzqPOZaIEg1+jWwpTtyaJc3MfN79NxxYAzo8qZ67n7S45rM6t7GHbSKjKEecqK927UvGx9auMAW+3mWrtTkiPDWCwf+0/Jczj8oP8nVGCzGO3c68L4howRoshJ2A+dtOSCk4xdknEWphg1zr3E6bILLcHlzTLctc13ULFGCObXok/t1pWvD9abEFR5pw+g4YtLaCjh4B25nnUXBUnT7qqYGl4Jao6cm2lCv7yVV2pp+UiKl5bQT+mPYoFBaAqBmZhvkvqRjtM3M8WfdzPx4IUeAduPLe61G4gePi5oX1jWMOrPdHopPYlWTTmSGoo8MFDLUd7qfw4J4a6fUUjl5eNHUK6b8vSB6a4pSwCy8RSeL9cD0I3e/W9Tnw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(376002)(346002)(136003)(366004)(39860400002)(451199015)(33656002)(38070700005)(86362001)(38100700002)(122000001)(8936002)(8676002)(4744005)(52536014)(55016003)(5660300002)(2906002)(66476007)(66446008)(64756008)(66556008)(41300700001)(4326008)(76116006)(66946007)(26005)(9686003)(7696005)(6506007)(186003)(54906003)(6916009)(316002)(478600001)(71200400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?jhxC7uhr1pVufBsn7pYvbbqR4jC5w/LM1uAjwxASbUWyYcW7dl4nMyl3YWZt?=
 =?us-ascii?Q?F7gy85ER2lxjniH7BdqfUkTOyxcN49DZPIdQMQuGnUIIlJ9Knnra6KcNOXyZ?=
 =?us-ascii?Q?v+rKCpxEc1UM8Ybv/oJzuICNFGnYsWsD6oChaFF3OkR/kRrKaYaWvqJzHE3t?=
 =?us-ascii?Q?josWUzGPsEtiIw7HrTXbxoG2YJmb+Wnjoip8t1aFYCWIR1ec3LpO0uYQDckb?=
 =?us-ascii?Q?8Lpd6bcSk9nAXpT/qUoa9wz1IjlXBNhpxDDG5iOG2hfpDCapsqSf1p3R8ZRJ?=
 =?us-ascii?Q?+xV0qQXrs2PWHmhAT/U6XIn4KMDrs4wVegdpQHPx0Zin15gjtzxlrROL1vJ4?=
 =?us-ascii?Q?Flhd5Upx/v8+ySXV/HuiFww6sleLmHT0sOcApf8XoFyntXRoQEBvIq2fJ23p?=
 =?us-ascii?Q?8FPtVp0PYjiLsgEnZ1XWnKXgBvLKt5hM+hsqNiWKYzmuVWAUx6s+ivZOY/Oe?=
 =?us-ascii?Q?kDKnSoPM2ODOxV4cc7Y2PB+x5xiKDewLuAsXDUd2rJSicmUXkj+nF2y6OzqF?=
 =?us-ascii?Q?7irdvxV3c+s9pmpODEc6YTc7dpcqTI8GQDYwhu7Qp0/CDBnDS/Y3mCcCqRSU?=
 =?us-ascii?Q?dheiRqAiCZj7DEpmkVmid8Nnq9HXdKmu1dVuW7vJNJ7WILlG2tHohObwzQHC?=
 =?us-ascii?Q?F+3YnbNdjyoQW2RgNS7vVnd9+uxA7nUm4HGHDPVrRRszJHKutUo1GYnxrfjE?=
 =?us-ascii?Q?wtdhY6bqscGVx+rEWCZd/kNbPlYA0UY/1bmTCi0JZ1f2ba1RXL3XJ2jBZGrG?=
 =?us-ascii?Q?JS+adYoN2FYedCluNrUe/CtJ34x+fOQiad08D2NvXbDQXHzaOvHmc6D1tbZw?=
 =?us-ascii?Q?lAC82Om8szGB+ZtexhBKGXhqqRuyuIYd6ccE3TBexiWkWiyIuE+w4wDUiymG?=
 =?us-ascii?Q?GlqPlciY6W7ToAppb1bXnMWBcAHb7DVAfy33bcURKZN630thiufCEbTCy3zy?=
 =?us-ascii?Q?K5cjxmquT2jhYCSQYwgbxY3QvglEN/Obf6Y36eEhgn7uEJEcGgbzGyw17aJp?=
 =?us-ascii?Q?Xnq/lv0Dx8Q2729XHlK7EfwnlnFYs9J3uAQjv3I5kx0sOme5qJDFKemIRbeR?=
 =?us-ascii?Q?6l++fevqWi+2cpmG6/Zq/JQ7o6MotDJ8I26eGymmnYWReWqu4/jJ4G2ssnyf?=
 =?us-ascii?Q?MglXksYxgdWO1MppPQdvpBlR4907+Upy+QwThnNgsdpbayzuPcOyKtLH0fF4?=
 =?us-ascii?Q?2Auk42JLbzkDt30KL+JKNXiODn+ZMnN0CnwhikX0R4R566AXu1tknoPqyd8V?=
 =?us-ascii?Q?fIAhReplKr8nXrRTlriSs4CaYS0UHYoc49zMKDAebeGewbmuTkrYW92ZbdqC?=
 =?us-ascii?Q?FU+UDReYUaqEakiFGyTpVwT6jwN9/JN1f7xEeZmF+ZLwxqtECTYVG0iJTbYa?=
 =?us-ascii?Q?817fVB0pOQuFwoo7LlCwUfmlHMIlvB9mtNs2dQfm9ktJvEztu/M/g/MjUMCw?=
 =?us-ascii?Q?pyq3j22U8xkGd6RUPyLaYOvzGOIK66OF0PeVJHltulvLUb0LpZ0cveujC9J8?=
 =?us-ascii?Q?6sYvlJ2nCDBgsuHj1YrxkMyvl6yA5uImm2QMOleRb7yuwUqpnwIgLM4xAkdz?=
 =?us-ascii?Q?TYnPnMInRriyGzeispRzoxdxWBMN4MLAxWk8uOQaUV6LVC/EgarGeFqFnX3u?=
 =?us-ascii?Q?vQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ff9b03b-532d-452c-3849-08dada05805c
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Dec 2022 16:50:38.8940
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ty3zSd3Yuz0a7db15J6hko9FSr2hyaAqdDZPNl5TF69QCRIxpSgpzoCkNiQe5cpkBKSJBp2d5neXVc6uIBzeMEjEYLT5UoPl8RSVCBwV+tw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8015
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Greg,

Thanks for the feedback.

> Subject: Re: [PATCH 2/4] usb: typec: hd3ss3220: Fix NULL pointer crash
>=20
> On Fri, Dec 09, 2022 at 03:56:21PM +0000, Biju Das wrote:
> > The value returned by usb_role_switch_get() can be NULL and it leads
> > to NULL pointer crash. This patch fixes this issue by adding NULL
> > check for the role switch handle.
>=20
> Why isn't this the first patch here, and cc: stable, or just as an
> individual patch that has nothing to do with the other new feature
> patches?

OK, I will send this as standalone patch, cc to stable on next version.

Cheers,
Biju
