Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7AD9A519B23
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 May 2022 11:05:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346784AbiEDJJK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 4 May 2022 05:09:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347121AbiEDJJB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 May 2022 05:09:01 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2126.outbound.protection.outlook.com [40.107.113.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD24E12610;
        Wed,  4 May 2022 02:05:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K3koLwfzhQ4TDqF++6fsD3U7zsBgZaNNZyqhglclcko6MbmrUsk9fKVslWkg3pSyZOr1oDz20JlEsu2WdJk7CCs8mFbWGOgCLwuNeqlBgDGCNFdsBfcLji5AltvtxmJ/PDN06e6qxl1FNsJqGY15gr2wHVtBR4k4hPdsiteT9HdBBiz66MKnc2JS9gUciAM3dpSNN4MR8Xx8oQTyzaIjZ9AnefrQw5cv0Fxr1Ko+MYuDGtFIlIqxks7PYKx4ObspHaZ303kHoJmJZgRX8AoCZaXnrqWGgrdi0Nc6DIcqF0eTQvISXIc+D7AUAqoWYUCkCOJFk9mVwh2Z4lX2ezeW9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vxSwXCmuUll9fh5M1W44b1Dy7i3TyzDQxOZfwmS6VgE=;
 b=oa0jqyUCv+/AK/8NdV0XLkuKtmfnXm8k/7yJBAyBIu6yPfYm/voXuB+jDHoiI/v8g0MZbMzNEJNip3Rsjmypu8noG+fwwvBR60gw+4y6EgrXbTpaYf63q5ncsFQkr1w60sO3Kt5kn9jRzPqG219BHQ2azVJdPzEijvepApCZZqxxIgI2QHlCM2+GzJalEQ8+OFxn9Xw707HBDN4kmVSNpYXH4G7hqvaAWRxdSX1ZhjGPRn0+KGj/B8XfDYyVRPjT27u41zC4Tbv9V/i2glj7eKsSYOA96umL/JAOTZtBtwOnsAAm53Xl73Nwtmb7cMLUkngJwmvuQMIsZuvKaMBQ7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vxSwXCmuUll9fh5M1W44b1Dy7i3TyzDQxOZfwmS6VgE=;
 b=mt0Qinp/Z/gRZUw/RlyxRFb8bp0XjOFxRSGAUarjWqMkt1CN4ry6OcI+AInmPT9XzPeB9d4PxDj5Yl0htlR3xUM6Sg3BE9kbtdx8/gkmN0Nws+qoQAZN39y7pqTr38I1Bs3BpXcY8XFzbpNmf/vaavox8/I3TnJpmAoaBhQdLsg=
Received: from TYYPR01MB7086.jpnprd01.prod.outlook.com (2603:1096:400:de::11)
 by OSAPR01MB3411.jpnprd01.prod.outlook.com (2603:1096:604:31::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.12; Wed, 4 May
 2022 09:05:22 +0000
Received: from TYYPR01MB7086.jpnprd01.prod.outlook.com
 ([fe80::e180:5c8b:8ddf:7244]) by TYYPR01MB7086.jpnprd01.prod.outlook.com
 ([fe80::e180:5c8b:8ddf:7244%6]) with mapi id 15.20.5206.024; Wed, 4 May 2022
 09:05:22 +0000
From:   Phil Edworthy <phil.edworthy@renesas.com>
To:     Marc Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>
CC:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v3 04/12] dt-bindings: timer: arm,arch_timer: Add optional
 clock and reset
Thread-Topic: [PATCH v3 04/12] dt-bindings: timer: arm,arch_timer: Add
 optional clock and reset
Thread-Index: AQHYXvlGk2V1ml/rgUy8vyXtNawbhK0NTtaAgAEeoXA=
Date:   Wed, 4 May 2022 09:05:22 +0000
Message-ID: <TYYPR01MB70866F41FD4933A4E52A1DD6F5C39@TYYPR01MB7086.jpnprd01.prod.outlook.com>
References: <20220503115557.53370-1-phil.edworthy@renesas.com>
        <20220503115557.53370-5-phil.edworthy@renesas.com>
        <6fb57bcc87e091d6e88217d2b82af9da@kernel.org>
        <CAMuHMdU4j=Uaz5fAODFrPud0i40TdHUo6bYq0YpdnUzWaM3-Og@mail.gmail.com>
 <87bkwe8v9c.wl-maz@kernel.org>
In-Reply-To: <87bkwe8v9c.wl-maz@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 607b9ddf-859b-4626-93b7-08da2dad3862
x-ms-traffictypediagnostic: OSAPR01MB3411:EE_
x-microsoft-antispam-prvs: <OSAPR01MB341195D594962C3267BDF168F5C39@OSAPR01MB3411.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Af3bnbL2Z4Omch95ptoUtKmWIDmUlu+ZlcLyelwugWjEc9MU6Zr9z+nonmR70ceS/0iVFF4UsUgsPm44U4I49dzr5BjTeL49UIt0Jmhr6N1Fg+EZsgwAbFTuIy8hOuQ5AqSyp4DHHMtBBIie71MWwqzHUkiQ/Ei60R41WEdREjbbAkg6R+CIrt6BCMUBifYdkKXxWG8gRu9FuyP1b8cClL+DsaKDhIZDR2s0htadM/40lrwTjIfxHpIyUHgbZvp57iE/G3reAN+ImmcIH7CpBSf3jp2gEPSITFt7/xQYHmWVD5mralrFMCncUMdyVPMDHk4KxFH2ojOiS0cKXAQVPZ3mJj1elZRBeSeO2WAAc6I5FQBWXkzEAxiHEy4cZUopQ6i2Tk+8M2wzOlchNtpH5PJOWX9vFDg51BPDIZcE6mz9kU3M+NTdmyHmSCm2ZUMMffeoG9FYyZu+sEtXs56akj7NbTEjX9mETJFTMP3aYhzwU4JmnABdW6QiekM7yEN3yfSKVjuBKVTF5TwrRNTLUZT1oJseIEkW3XoPhYuyIytuqRt7sfPVUtfY/scmVrIHtXSu1sJKrAap4az37aTh+mntGCOCYiZPaaslkysF8NUekJvhDnGAo+x7PJtMZtpWx1jTUmHj6K5F8wt4OEbv3TJ/SqkUJJNhpyUMzADwHICpGIaNfk+5Uz7AK59kEDrDJOlfDBvcGyuiQAunfhKpag==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB7086.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(110136005)(33656002)(8676002)(54906003)(4326008)(55016003)(64756008)(316002)(86362001)(53546011)(44832011)(2906002)(71200400001)(76116006)(66946007)(5660300002)(8936002)(52536014)(66556008)(7696005)(508600001)(66476007)(66446008)(83380400001)(26005)(6506007)(186003)(9686003)(38100700002)(38070700005)(122000001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?rSb96JSxqp/PlVHFDUZDSFBDn/kL/LH/bdWYqDW+jm5VzELtifyzh91yTQq+?=
 =?us-ascii?Q?s5l10Mt1rYP7b9kN3AjEFQuMMSOKH0ZBAz5hxOtNbUWLVsl33A0ViINYViU1?=
 =?us-ascii?Q?YaQ48nj2D5wWrFgqdS3f8m2wdiWCqmaJeXEp+OoZP0K2tQxpTetSMWCvTSzL?=
 =?us-ascii?Q?goKqjN5fqC3rjzCFHhoPjyr1N2ZbAqiWTptUq+U1rLa55+WRvd1JUP0KTVor?=
 =?us-ascii?Q?n3KzvKEN+g7tw4BKg05Ya1epjuPYOUVFdg7wLMyEWmfCdjBz33EksEhGnSd7?=
 =?us-ascii?Q?rgKqwALeCofRjc/E3bW7ERHxFPHGTg9LwAFoT+r59aSnULoiB++9/6oeqnk2?=
 =?us-ascii?Q?Lig9uMsefadTBTMWQizAq5lNqjPIVhVRaG6NIlaCABYerqMMqIjVAZSDfbT7?=
 =?us-ascii?Q?SALY2vIYN78vAkUJ7tcAjfFNeWMsunGZEyLQRcXBiIKrqGLV/dh0KLebNp30?=
 =?us-ascii?Q?FMncRf1WJ1sOKyTkQ+l7IAd6NHHM5WM2dyQmY0PDO8dzh4F39vstLoEsapZY?=
 =?us-ascii?Q?4GAtM8omzz8P7swaSeCn8SFGhCN96FuxINKNATxPiZCgFcqAaQo0e6T13aMk?=
 =?us-ascii?Q?V5+BKO5FzEZ/76kALS7Yy4bzPSJ5BUlFEVqyTTKhMV9vOn7FLcIX2jSq2GnT?=
 =?us-ascii?Q?TMs+GI/BlGUmZe0alVb4b9DvVPfXlO3sDmOVFv3kJ/1AsvYO109A0VJqPNbK?=
 =?us-ascii?Q?MX/tKsQdXvGmxbYMrEyaIaOKcdlUy3X5Dto0/hm+p/K2KuafhVvLfjbPNAH2?=
 =?us-ascii?Q?Il0blhGr0MUaOoM0c3jshMyDwKnk526yWfQI/2pre083AiWzMESe+jKEQtPd?=
 =?us-ascii?Q?DYqilwYuuQCxWJdA7bKDeybEHQ2poTKj7YS1FTh/MISgN1T8kdQXd7+nIihX?=
 =?us-ascii?Q?Sk04yG8AgCkdQipv0882qMOy9l6nHfAaKVSSnpm8+Do66wx23TtioQ5Iym98?=
 =?us-ascii?Q?jYjQO3RNLp7SVp7OtURffwGtkXQ9ZFnsQ4fVFYGSNsHVTPnaOXAhVr+rxG8w?=
 =?us-ascii?Q?8KoGtbiVag3y8SQhhG9MZcEK9slRtbSbBhFaF7zLqLb4tjrca6n3hHSyrDEu?=
 =?us-ascii?Q?17/Up42JU1MsA33GaudNrjQvkarxlrHhy7oOUE7oMWNB456+ls62Sf0+5OH8?=
 =?us-ascii?Q?vkCt5m5CAmhcGd07PVAN7stXH+CbXMgujiZUUXcUPPlHpjRcksk5ZxGZP1ix?=
 =?us-ascii?Q?M9g/lLgcvNSWj3Co10UmceQ5/FpThUIy5bPgay1L5mqlj9AUq30JRe91q6EH?=
 =?us-ascii?Q?nx1+pL5kotBgmMej3sAjS9htPpxtK4RwuBPzSa9NXstVoM0nMm+pUrwq81/I?=
 =?us-ascii?Q?XNhcm9qbPqOYf1Nqlz3SNoxw4uKkqj2HEqNvElCm4mbaYEvrjgqnmmT4esND?=
 =?us-ascii?Q?ubfv4gB7X9EQpX7gnDTrGbbXaLTz/zm5xxnxY175L7TSMG7FNGQ+4RhmJFZX?=
 =?us-ascii?Q?/tECRbo/8xsSN3muGiribIS0DkazlK44IjH6i4Ra1HC0RL7VTj3yb+RovatO?=
 =?us-ascii?Q?ZP4s6ZHbwSs36bC928rlwFucOiTkKbCCU11gfUwu0OnZZTPuG+HkUKIDsaWm?=
 =?us-ascii?Q?B2Rwl966joAwGMqKUy3KlZCqRMGZPybLXaVpfIeb27sCoJA5BG/AoJJwnEZE?=
 =?us-ascii?Q?atdtroXU1gUuCvNAeydf5AqZO/cUz2ytxrhgoUMC2EMZV2PZnSC1iRS2XHRx?=
 =?us-ascii?Q?GMcn7fzANrZat4O/sLONGFNdvzjcrlGUTpZg27gu8AJhAZv35ZeOnnyiqCi1?=
 =?us-ascii?Q?9yi/Kwa4qvcRKlIbIvk71pkCj4mMBn4=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7086.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 607b9ddf-859b-4626-93b7-08da2dad3862
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 May 2022 09:05:22.4610
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: c8ycxpN9CmrBOY5nTdwoDCJoxdRVnG6cMFsag9fnwcDKON1eb7e07rlAXTrkI8xPcbkYAlPABjxKQ2gprynMEqUBHcrVpg6gCaouujBnu0g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB3411
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Marc and Mark,

On 03 May 2022 16:57 Marc Zyngier wrote:
> On Tue, 03 May 2022 15:22:35 +0100, Geert Uytterhoeven wrote:
> > On Tue, May 3, 2022 at 3:12 PM Marc Zyngier wrote:
> > > On 2022-05-03 12:55, Phil Edworthy wrote:
> > > > Some SoCs use a gated clock for the timer and the means to reset th=
e
> > > > timer.
> > > > Hence add these as optional.
> > >
> > > The architecture is crystal clear on the subject: the counter
> > > is in an always-on domain. Why should this be visible to SW?
> > > Also, reseting the counter breaks the guaranteed monotonicity
> > > we rely on.
> >
> > The DT bindings do state:
> >
> >   always-on:
> >     type: boolean
> >     description: If present, the timer is powered through an always-on
> power
> >       domain, therefore it never loses context.
> >
> > and (surprisingly?) the absence of this property seems to be the
> > norm...
>=20
> *timer* is the key word. And counter !=3D timer. What your HW has is a
> gate on the *counter* which is illegal if observable from NS SW.
Ok, thanks for your feedback. We'll pretend this clock gate and reset
doesn't exist and drop this patch.
=20
> >
> > And:
> >
> >   arm,no-tick-in-suspend:
> >     type: boolean
> >     description: The main counter does not tick when the system is in
> >       low-power system suspend on some SoCs. This behavior does not
> match the
> >       Architecture Reference Manual's specification that the system
> > counter "must
> >       be implemented in an always-on power domain."
> >
> > So there's already precedent for clocks that can be disabled.
>=20
> No, this is only the case in *suspend*, as the name of the property
> vaguely hints at. And that's a property for a bug. In your case, the
> clock can be controlled arbitrarily, which is even worse.
>=20
> >
> > > Worse case, this belongs to the boot firmware, not the kernel,
> > > and I don't think this should be described in the DT.
> >
> > "DT describes hardware, not software policy"?
>=20
> I'm happy to spread "always-on" properties all over the shop, but
> that's not helping. The HW spec says it in bold letters: the counter
> is always running, and doesn't jump backward. I can't imagine how
> secure SW will behave when you reset its counter... :-/

Thanks
Phil
