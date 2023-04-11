Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B09456DDDAF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Apr 2023 16:24:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230148AbjDKOYj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 11 Apr 2023 10:24:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230124AbjDKOYi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Apr 2023 10:24:38 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2105.outbound.protection.outlook.com [40.107.114.105])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC33F44A5;
        Tue, 11 Apr 2023 07:24:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mLZFYscJ8ftaEP0o0FuzCX5eeyi+tyIFW95UnwWDnrflfdnuX4iEjxc6DAfwqEu1KperAtaI4e9K91u+0L4vbzGRdW/7IuBEYILMBJI/krNpfmz5Zkvthque1DQTC/6CyQYCez98fCjF8uMm/82g8UaS4pGJlckNAeQkvx/Rqlz09eFUHsh9F+vXpKZIasiNAWf2OeFNovMzi2fzME9oCzMQb7UtkSQWDTzXQYuPiUkjmCpF/+tsIC7IxFQFgbGZsX/V3FsdxxUNxPmpxgjfN2NpCMFjf350THWGdXD1OgQHHF59on2Ikc00nwAsGOb+THrr6O4pLQIX8XwK73MtEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jrBZzA63e+rl+ZJ/7AnVtyMFd3rV8FHOPmr04CR84kE=;
 b=USqCh5krMNqWOQhXACwRKIqSPxetDAFAQo+/rU84cIaYTNeoe1jVC2f2VtR5iC37wtR3tFWyTcAOLinjMinYWDeDzPV8ZM6m8PVQju5fcHXqqjqAIoRZUOQ0I6UHZvOO6Kgowwv3o/eIqzQUlASdBw1A/ODqTQgakevg7NHJ7ijLzcVQ73oZY0kBA1EptTar/TVoHY1C2V+3V5M6dGCTYcMgHk8QLv+JmLeV2uV0q915as2azBZVmqPdOlzwWTZ+RMI2xI+7kireD+Izp0Et47ybkfUBV8AgzQsRLBKBAYox5kaUhJ3eRP3jXYHClNmVPW4TVVIxx1VdS0p6n9BUJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jrBZzA63e+rl+ZJ/7AnVtyMFd3rV8FHOPmr04CR84kE=;
 b=NcWyKNq5hN6XZoSoS2atpTLHP8SSTBhauZuOzHMEtwQbFkajQ5CfVNo37ejgVEEKRSuz/zaTbPcufRgXTDCfxpK0bl8W6l44Ua+JW7OmlU5MzonGsXWTXDlt3iK3YT5gSHe976yOjvXpeiSDs6JBhfw71eq22NYHApWrOEPXQrU=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYWPR01MB11830.jpnprd01.prod.outlook.com (2603:1096:400:3ff::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38; Tue, 11 Apr
 2023 14:24:33 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::e521:994c:bb0e:9bf6]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::e521:994c:bb0e:9bf6%8]) with mapi id 15.20.6298.028; Tue, 11 Apr 2023
 14:24:31 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     Jiri Slaby <jslaby@suse.com>,
        "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        =?iso-8859-1?Q?Niklas_S=F6derlund?= <niklas.soderlund@ragnatech.se>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>, stable <stable@kernel.org>
Subject: RE: [PATCH] tty: serial: sh-sci: Fix transmit end interrupt handler
Thread-Topic: [PATCH] tty: serial: sh-sci: Fix transmit end interrupt handler
Thread-Index: AQHZbF2mA9ahXV82QUyTHfzm1I9HqK8mJzOAgAABW7A=
Date:   Tue, 11 Apr 2023 14:24:31 +0000
Message-ID: <OS0PR01MB59225DFD2073B3A6C8249104869A9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230411100859.305617-1-biju.das.jz@bp.renesas.com>
 <2023041129-skeleton-nursery-f9b0@gregkh>
In-Reply-To: <2023041129-skeleton-nursery-f9b0@gregkh>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYWPR01MB11830:EE_
x-ms-office365-filtering-correlation-id: ab6fc41d-1a25-4a06-22d8-08db3a987762
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KWWla/eiVt2RaNJyU/pKlQbxQ6U4vP1FWTRUuQ3Bq2TSDOFRUOiFcB/53qEmcwNeHJKvhTAb/DLsf0zVyM5hCAuMceWgTbgDoHEA98pQikf5Lx6JpVX3TUGk3iShC4f8frDbVgMrVfxPw3B2Tf8OHvwd1tDuSxLGz3y4kSvbZQJhNRYFWgBR+zO9box9s8DG0V+wh+/YnvYD9sqwcfgq2Q7PI65DnPbsTzAKpDpB8rlkdpgU7daxIA0rq/vjgKKPrNyERUUIAuHeAtKduEPYoLcYm6cvVtWhky5VVh9DZ8cn5yIhEan/SU2IwhqcHYOAfTDEdRo9rB36I+kqx+3Hmkb/vZcaNPnV/ahGLCSU+YyJ0JpGDc1ZkHWwD82whNgYoAfTIkXq0fR/jKIgA/mC3vLzvRNxkCKqWrzjO5w/hTecjUKg0zcJpXpuPYcJBJrufxZPki2muMu23Z0lzT6pkXzMzGvmsB/kj14/7rdww2NQYgAvgD/pnTjT5k5nb/dBLPHMSTukd/QA4QScn7ahVovf2zCpnZk/22tV457PV0wfBnd25yswVx7N1ElEYobtfFCJuogZ9NEuabSzoLn5LBvZWsYx7+qPDUwkwlslnntoh/n/iAf3OqRwiPg7IqlV
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(396003)(376002)(346002)(39860400002)(136003)(451199021)(71200400001)(7696005)(478600001)(316002)(26005)(9686003)(6506007)(186003)(54906003)(2906002)(5660300002)(4326008)(66946007)(76116006)(66446008)(41300700001)(8676002)(6916009)(66476007)(64756008)(52536014)(8936002)(66556008)(122000001)(86362001)(83380400001)(55016003)(33656002)(38070700005)(38100700002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?5SsN2epNwCJMV6gQnbOqKHDL/OeSKr9NM1elBTnFlClHF5mWcf1i+sbFRh?=
 =?iso-8859-1?Q?r7HYvoD18h0oC5D69aFV9b3ogD8o0OWAPNgt7zaq0swtfXfgTnEPvdfg/y?=
 =?iso-8859-1?Q?hSGv9HTtZW2ObhStOsu8zo0qriuQj3TtbkC0wspeBTHwCHPgcq8/1bePHm?=
 =?iso-8859-1?Q?UGsl4RBZZulytkMRvbjUbOB2vL55EWwDfvPOqLxNsuujUIEfQqtlc7Bqhv?=
 =?iso-8859-1?Q?binHu1clNEo6Ubgm+KcilkD4axWPlBKwON12u8fDpwwCC3JNDO2NamFQJO?=
 =?iso-8859-1?Q?7di6mi5RMi+/QVYLuDK7uMlVkI0fXOoTtBJyFy59WiOdcmYyUQUdqHxl5v?=
 =?iso-8859-1?Q?QWdCx/H/xq/pQEl3KXNaM1ZGX7B+06rLzPIFGGqRUFVmik4TZc0Ouz20Vn?=
 =?iso-8859-1?Q?NbVGWylc9lXrueX+07JAthuofaWytBXf9AllYY9443hJwODxDEAruMw8cL?=
 =?iso-8859-1?Q?LS8RliiLx/BgHIaK8NjA6XEtuCWU4r41v0BZiNMrAMA7ekT9U8SleIHC/e?=
 =?iso-8859-1?Q?S5rIA/Mqq2qjC9LKhHAJcEh20kVlaf9vT09BgVRCwDY6GtFkodH+OvSRpx?=
 =?iso-8859-1?Q?ewm7u9evr2gM6C6jSms+cTJqkuiaElBJ6DwUQLj1U6cc7JT5mKLLZX9FSI?=
 =?iso-8859-1?Q?ElHoeEJsBL5uk3IjzaStDZbWP384bYRDO+Bz2M9Bh/sYeASPD5calgZDSK?=
 =?iso-8859-1?Q?hcd22BioLHHEn5t8CclKaO+18YBlTw+Pp22XUVhFndUX72x7DX7cC3x1Wq?=
 =?iso-8859-1?Q?2hNJc5b2rSGBOYYOB5bpjG+NiXDxSv9S/xRDDPD8fPxm0Z75UUC0WuGBjs?=
 =?iso-8859-1?Q?Ee7SyaEpud10IaJhT8FZLfgJvbjR6UXKZoFtt8moehqLBjDadrPyS++fGP?=
 =?iso-8859-1?Q?O1vHw/voBs2wGeaIpDgQwgA3MOydy9uuMuu+jMCLip2491CIL/09Zu8UBY?=
 =?iso-8859-1?Q?XE4l4M7xCH5TT/ZFgwLhTcbRS9Z0ZCv8ecGSCwSqtitzLevZtI2Jfz3S/1?=
 =?iso-8859-1?Q?aIn28wvVOsBLdj+zwMLT8mVWBnpxwgZr2ALkxwCBGeltNBL+biCM05Uhkr?=
 =?iso-8859-1?Q?u0Yt+kUApJmghQ235BdejyOmELp43oarw+9DBBJkFVJZxrmtaQpqAu8b6R?=
 =?iso-8859-1?Q?8fmeixyDy8jtaxUX6VmdrO2bXjasrulTbryEfV72otC0SH0JGCOaV7xpUw?=
 =?iso-8859-1?Q?OT57M5pFabUdXRLIMaaD4ZDOx4i522bc85d6RHg/1ESpD62MPd5kHi6Ads?=
 =?iso-8859-1?Q?xRq+PhgKMGy4w4FLNGoH3ldWw2On7C4EsbeWZ9hPn/C5eoMIk7vg5AcDJw?=
 =?iso-8859-1?Q?LM2g2aF6s++UkOnlQ9hv/MWkMOUeyeUGMoFDfS2czKNU2e+GIUtSlW2xOh?=
 =?iso-8859-1?Q?2Fz7lizO7Ij+uR49j2JwsX1r/mKTbgSXDd89Uq6RDtjYVEdnOZ3iHJq9FO?=
 =?iso-8859-1?Q?ddoZaeHCISx18+0sQ7WlNNkoy9SjrQHlopBLr5hreJDjqcSm9TFelM621o?=
 =?iso-8859-1?Q?rp1eUE8Eofd6bsCv3C/mjdTFEWjxYjPRD0QKhzN2/W6kbcuNXSvMnLXLry?=
 =?iso-8859-1?Q?oYZ20v3hKLegbGYUME5xwFB8bWrlFh3rUj9+8kauzpBZxPJfT0kfKtui5c?=
 =?iso-8859-1?Q?PIHPQkJAE+8tewsUN8g5CbjRFHiW0gl+fuISHiGKaNvwnEyQ75PHH/Lg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab6fc41d-1a25-4a06-22d8-08db3a987762
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Apr 2023 14:24:31.5253
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TiUAQng25cDlPRaflSlhZ3zs2kOCbEn9GFOp1Yud9kcJt2Q+Cz9Qj6l+77zY5k8te31urqKVD1FGG2+erLAtEp27RjAp1p/OJGI1yoKq8M8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11830
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Greg,

Thanks for the feedback.

> Subject: Re: [PATCH] tty: serial: sh-sci: Fix transmit end interrupt hand=
ler
>=20
> On Tue, Apr 11, 2023 at 11:08:59AM +0100, Biju Das wrote:
> > commit b43a18647f03c87e77d50d6fe74904b61b96323e upstream.
> >
> > The fourth interrupt on SCI port is transmit end interrupt compared to
> > the break interrupt on other port types. So, shuffle the interrupts to
> > fix the transmit end interrupt handler.
> >
> > Fixes: e1d0be616186 ("sh-sci: Add h8300 SCI")
> > Cc: stable <stable@kernel.org>
> > Suggested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > Link:
> > Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > [biju: manually fixed the conflicts]
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
> > Resending to 4.14 with confilcts [1] fixed.
> > [1]
>=20
> You did not actually build your patch, as it breaks the build :(

Actually, I build the patch, but did not test it on target as I don't have =
the platform
to test it.

I got some issues while building modules which is unrelated to this change.

Anyway, I will double check again and confirm.

Cheers,
Biju

