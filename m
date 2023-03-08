Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E7B96B1177
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Mar 2023 19:55:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229747AbjCHSzy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 8 Mar 2023 13:55:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229653AbjCHSzx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 Mar 2023 13:55:53 -0500
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2100.outbound.protection.outlook.com [40.107.113.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D82CE4ED2;
        Wed,  8 Mar 2023 10:55:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mpx327/4TkLow+aZq7nIvtsKj/Sd5gVr4ynQ9AR/u6sKjzHvyvP1CLWXPN0S9+tffq2U7mIFg1CIbv1oW2HHWhCePbHMyAtoAMovTQ9+h9LjD2oF86JNYWpdD9o2GqMLMMSTLDs209MCgF6HOhrYnb8YllBRkan4hupcXxxKEu2s5bNYk43oUkQi4leOzCzXAFnICHz+MT/7gqtanqVcNG3j4LVw0u0EKnlwRZWre9I0Q5B35psNpwTQSHA0rH6SorqM0aaZhNu0LuMdeQMof4SD+dJ3WeetJldZ/SbznE+u/yBNhXdCQ7/dDxA97pfygQ7rgk3DWBY5ZnMIW/e7eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/ioyYJciMeZyv/o9Xfls6QZtMsCeoo7WL6tPmLjSz2U=;
 b=TUwmnures5DL2F1o7bIFNKfuOKe1NfHaqKMFDoRejUHB60xA8fbEwDuLBZv6l9PIq9Don1QtdneuaD7lV5C5Pw+GnONONx9cf6XOC5pHtVDOy/xcS2/QLsYNCg+PFUzQyRZF1gjjLb9VA3TiIw94QeHwS5dqb+gBqLP69yIgz8JozDINxsnXwK/bLOxtkU1FT1mnZH+MqJHqZOLxXrbmwxkSGL7S1XzbB4S+Ra866rsyQkZwkaHlglMgO7y/vsPxZsjtw+txI1ynQa9JbxHzqGyZwTV/jyS40/lyw0zidee/42HnhKm8eEtCJoqJRCKXi54WHB/JhCi+0isYZWlm8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/ioyYJciMeZyv/o9Xfls6QZtMsCeoo7WL6tPmLjSz2U=;
 b=DX3oaQ3rOtrosC6+dVXDQH1ZfEhbZSDdSSP6hAXeUXtF29cWntqCPV2zLN3YHeDB4f7sP94WUbwSqPJeUoQl2zR0Qg4+G4Z6Vwnff4/wzyHqbiW5EUy0Il3kOKzU0htsHLxt3GngqfE57z/xjWtRqxZoFuO9r9AArLq0KLt7zFs=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYWPR01MB8314.jpnprd01.prod.outlook.com (2603:1096:400:165::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.16; Wed, 8 Mar
 2023 18:55:46 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::f54c:4b2:9c7d:f207]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::f54c:4b2:9c7d:f207%7]) with mapi id 15.20.6178.016; Wed, 8 Mar 2023
 18:55:46 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC:     Geert Uytterhoeven <geert+renesas@glider.be>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Subject: RE: [PATCH RFC 1/3] dt-bindings: clock: Add Renesas versa3 clock
 generator bindings
Thread-Topic: [PATCH RFC 1/3] dt-bindings: clock: Add Renesas versa3 clock
 generator bindings
Thread-Index: AQHZRS0aT95BTvtLwUKgslaMkC+eWK7at0aAgBZQ9vCAAEpeAIAAAIEw
Date:   Wed, 8 Mar 2023 18:55:46 +0000
Message-ID: <OS0PR01MB5922BDA0632ACCCC0100EEBD86B49@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230220131307.269100-1-biju.das.jz@bp.renesas.com>
 <20230220131307.269100-2-biju.das.jz@bp.renesas.com>
 <e9e63c87-b491-b4d5-b226-0539ef0de2d0@linaro.org>
 <OS0PR01MB59221C8C937EF20347149E4886B49@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <36e06397-2189-4f1b-99cc-d39e720ebc71@linaro.org>
In-Reply-To: <36e06397-2189-4f1b-99cc-d39e720ebc71@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYWPR01MB8314:EE_
x-ms-office365-filtering-correlation-id: 6bb37e8d-5cb0-4fbb-3a61-08db2006b9df
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GeShaKlg5O6z/WXkmxRTvjxX0c+ISsUlzCkOAIa/y7jdtdxcMsepYy6iq00bjS1J0lB+xO/YJ4lCIn56YOvE4is5AcQRnKw0ETOd3ztwVMg6ABxxYyP8MPpmov+h3x+c66krDwQCh65wLWnT3ckLRRZfE8yTlp0LuDJzQYR7UHxy3nfkMEN2/o1i0//fVxfelP6/nO7uXvpyUETXe1bmyMbeRlhSfuScIet3Twg6PiwxgSDI/w9zrAzGxJXauJfwGymELIcqltcA/nHBm7uGpg02c8AV/2faVhMjkWGNVHtT/6PZnmsb118SnwiFcOOCVkv3A7e5b6mY+iS7GCI4KswYuyyBn2RUTeJ/Iz+tVyl46zCLljGCXuXUz40VcLNKXid0Mv+ad61WPOKpmQm1R+nuXF4YNeO1mFed15A88rh32CfZHv8gYWGYOSJHti73AiFMhEpS4ZaA4kdxa6L0ilEChV+L/yCqwsq+njpzt/4cfDyqWLxJReEiNTS8J8yaWK4jatvP6q31OZkpQV1FSvO5Ve0MX+C5vIwBGLvjptzlIpsow8cOUfMSbyIy3qb9EtQl46m63kLPYxh7V88nX7c0rriQVPKDYETvYuVbLlfjBitJyoavAf8pLVxE9lnZu0IPMddzLG0UHE+BAA7Mg+cpiO5FnFAhidqSFl12+B/Xfob6vm3A5DwQqiLqCekmM20li41kt3xDgnIDCqctEg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(39860400002)(136003)(346002)(376002)(396003)(451199018)(9686003)(38070700005)(55016003)(186003)(41300700001)(122000001)(316002)(110136005)(26005)(8676002)(66556008)(66446008)(64756008)(66476007)(54906003)(66946007)(53546011)(76116006)(6506007)(7696005)(83380400001)(4326008)(71200400001)(38100700002)(86362001)(33656002)(2906002)(5660300002)(478600001)(52536014)(107886003)(8936002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?aH2pKLl4FgwUSdKe5bUgBiiVorLdArfbiqmZubC6/9coxnMAOv0uY+OMbHmg?=
 =?us-ascii?Q?RaEi4z8iZxP6gySTZHCw5Zt3Cue3hr00TEL2o70qjSNw0t8WUoU7Nr65Lrp+?=
 =?us-ascii?Q?UoaFhi9jkk0dMCX26plKBBfp06Ew8cz1vDlUUXBbvgzoceXvx4LWOet3kj7B?=
 =?us-ascii?Q?8X4IYHinINzPv150I5QLSIvLLao43U36UDVD7oHaOJu9H3DtkbqLUK/8cjbq?=
 =?us-ascii?Q?94Sq1fleaJSvZmYhTrNUruB5Zwr2S2Y8oXprM+F8WO3SPun03AzeUd8REyZT?=
 =?us-ascii?Q?a301p2DepVMgg6Msps5sa/wHM2LoPczZ3WHyrWN7iBHWtvW0w/t+Zn6MRZ19?=
 =?us-ascii?Q?rD881FJTt1d6PxeadnAbahKsbqyCEl2Vz8SCem8uobwqWKLsM+5aYKXWld2p?=
 =?us-ascii?Q?weZxwuZolpAPKWzdFafztZID0cv1sUpO4MErxViWzGyz+PcNcbsCz0Yr9jp5?=
 =?us-ascii?Q?TUGWVYTB5w6VxPMxdPq3iqIJwYb56R7vQCypVMct/RJLkmKS/zCLP4olH/EF?=
 =?us-ascii?Q?WGAkOlEpsdM35ph8fjSn33RtQsUyZ2p/OeMPhp79VTr1ZqOP+eVqi5LoV9hi?=
 =?us-ascii?Q?2bCj/Ulz9D69rr/AocFk0dI3dH2+cmSh07btqJI89+5x0QyPFPVfb1e1DuKg?=
 =?us-ascii?Q?A2yaiE2amf30DDh5QyeCYO5d/2mzSHVQi77IKXLInIJCxKmmwNiliZCmvB1J?=
 =?us-ascii?Q?TvbcMPnsgkyxNeAjrWdxDhYoaTTisW2QcPS5+RNFBRPRNpp8QE2YXbe9qL+6?=
 =?us-ascii?Q?CUz/HcwddnUR650dI4sIJArr0q4Ltao5PwwNsapPMzswaBraRDRgS2xBvcjU?=
 =?us-ascii?Q?9HsBwDBVB2Qmgp5SvvrLede5e6MtyVF7z4XuAAgMwqswxJB724/5ZPXo+xdC?=
 =?us-ascii?Q?txkDwMuI7SvrahHxcxcr4l5L6BXL7OROEKgkFAJCHG9ZktophUc6iFosWhtL?=
 =?us-ascii?Q?g34RMbbTxBAXHsV8Fq2Ah3ZcX81inQIJBM7SdgbEFUFVCOfCJ8tnAgP+YU6q?=
 =?us-ascii?Q?scuJC8jrlN5yGYunwEQSGrgYoXNXEElH8VF99CHs1gLTLItaM+Yg2WTvP2xa?=
 =?us-ascii?Q?3Vpdinl0zHmF2jC/3RG0fK5s2DXzfHd6BHAlxRHx3S9/s1kF8g0BIWLAL8w4?=
 =?us-ascii?Q?55E1RAOSve3B7qgrsaZL6H2r719p8CjcPtOrHmfRFkxsG8NCTORGLQhQMj1W?=
 =?us-ascii?Q?0uK6fhv+uNC4LnzcdWTabCpFADS+cj4gdLgn7tFu07gI/L9LMzcc5CteK23c?=
 =?us-ascii?Q?6WpOgo4kmxSAWTsQX1opNABCjTEz8Hmb6g8D5e++3cyuG+mVLs71V8iznMwh?=
 =?us-ascii?Q?b99duTKw5zVqRlRW+Wj0PIt+spJOkckIVaRhzd6mrJc8hyDRCamfZXQAnN3u?=
 =?us-ascii?Q?bDYhKxNYyK8fwyvtJ1RkXzT0gl3mfGZSKE/gsQyJw5HetcYsIXP8hJBYQ0mQ?=
 =?us-ascii?Q?4AqkKlJOQEiT+Iig5hOKnsmjbrabVHcbdO49LG6kg99/RkgjgPNKMVuupzRh?=
 =?us-ascii?Q?lfSxu3X1njZ/HktQm+u3S7w588JKgJVSlwyKWJsjOHz3wANY1pK0TJurXzrA?=
 =?us-ascii?Q?pt5oVQWGBxFSq9qKbgWKj5KKilsCm+8M9jaTg0mqe26jpPoyksKCKLhM07AE?=
 =?us-ascii?Q?IA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bb37e8d-5cb0-4fbb-3a61-08db2006b9df
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Mar 2023 18:55:46.3051
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nL3WS9RWjEFhcklnqj/KzkelxuxW9wd4VQjQBB2lX+B6xdAWxxklm6W5wrgfuk4hIOOYrDVC8wrTTA/u3kabDNYpyWfuXhChXYCGjoEp/dw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8314
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Krzysztof Kozlowski,

Thanks for the feedback.

> Subject: Re: [PATCH RFC 1/3] dt-bindings: clock: Add Renesas versa3 clock
> generator bindings
>=20
> On 08/03/2023 15:39, Biju Das wrote:
>=20
> >>> +++ b/Documentation/devicetree/bindings/clock/renesas,versaclock3.ya
> >>> +++ ml
> >>
> >> Filename usually is based on the compatible. Why these two are so
> different?
> >
> > Versa3 clock generator has the following variants.
> >
> > 	5P35023, 5L35021, 5L35023 and 5P35021
> >
> > RZ/G2L SMARC EVK uses 5P35023. So I used generic one as file name.
> > And added compatible for specific one.
>=20
> And what about other devices? Since you do not add them, just keep
> compatible as filename.

OK.

>=20
> >>
> >>> +
> >>> +  clocks:
> >>> +    maxItems: 1
> >>> +
> >>> +  renesas,settings:
> >>> +    description: Optional, complete register map of the device.
> >>> +      Optimized settings for the device must be provided in full
> >>> +      and are written during initialization.
> >>> +    $ref: /schemas/types.yaml#/definitions/uint8-array
> >>> +    minItems: 37
> >>
> >> maxItems instead... but I am not sure that we allow register settings
> >> in DT in general.
> >
> > Agreed. I guess it is allowed [1]
> > [1]
>=20
> I don't see Rob's review on this, so what do you prove exactly?

Subject: [PATCH v9 1/2] dt-bindings: Add binding for Renesas 8T49N241
Date: Fri,  4 Feb 2022 10:57:38 +0100	[thread overview]
Message-ID: <833d3837892f0879233695636291af97a746e584.1643968653.git.michal=
.simek@xilinx.com> (raw)
In-Reply-To: <cover.1643968653.git.michal.simek@xilinx.com>

From: Alex Helms <alexander.helms.jy@renesas.com>

Renesas 8T49N241 has 4 outputs, 1 integral and 3 fractional dividers.
The 8T49N241 accepts up to two differential or single-ended input clocks
and a fundamental-mode crystal input. The internal PLL can lock to either
of the input reference clocks or to the crystal to behave as a frequency
synthesizer.

Signed-off-by: Alex Helms <alexander.helms.jy@renesas.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Michal Simek <michal.simek@xilinx.com>
---
>=20
> >
> >>
> >>> +
> >>> +  assigned-clocks:
> >>> +    minItems: 6
> >>
> >> Drop.
> >
> > OK.
> >
> >>
> >>> +
> >>> +  assigned-clock-rates:
> >>> +    minItems: 6
> >>
> >> Drop.
> >
> > OK.
> >
> >>
> >>> +
> >>> +  renesas,clock-divider-read-only:
> >>> +    description: Flag for setting divider in read only mode.
> >>
> >> Flag? Then type: boolean.
> >
> > Agreed.
> >>
> >>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> >>> +    minItems: 5
> >>
> >> This is broken...
> > OK you mean maxItems. Based on Boolean type I will update this
>=20
> I mean, it does not match the description. Maybe I just don't understand
> here something, but flag is boolean. Anyway, minItems means you can have
> million of items, so was it intended?

It is a mistake.

>=20
> >>
> >>> +
> >>> +  renesas,clock-flags:
> >>> +    description: Flags used in common clock frame work for configuri=
ng
> >>> +      clk outputs. See include/linux/clk-provider.h
> >>
> >> These are not bindings, so why do you non-bindings constants as bindin=
gs?
> >> They can change anytime. Choose one:
> >> 1. Drop entire property,
> >> 2. Make it a proper binding property, so an ABI and explain why this
> >> is DT specific. None of clock providers have to do it, so you need
> >> here good explanation.
> >
> > I will choose 2 and will explain as user should be allowed to
> > configure the output clock from clk generator, so that it has
> > flexibility for
> > 1) changing the rates (propagate rate change up one level)
> > 2) fixed always
> > 3) don't gate the ouput clk at all.
>=20
> User's choice is task for user-space, so not a good explanation for DT.

I don't think clock generator HW has any business with user space.

It is clk generator HW specific. Clk generator is vital component which
provides clocks to the system. We are providing some hardware feature which
is exposed as dt properties.

Like clock output is fixed rate clock or dynamic rate clock/

Cheers,
Biju


