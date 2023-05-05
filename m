Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 687346F7CD0
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 May 2023 08:10:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229795AbjEEGKu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 5 May 2023 02:10:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229588AbjEEGKu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 5 May 2023 02:10:50 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2132.outbound.protection.outlook.com [40.107.113.132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BF301490F;
        Thu,  4 May 2023 23:10:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bd/F9oBdM2uJ973Uqo4MjFOzpkhR+4m2fQAMzLnLIWIBdMPCqhCqigTTwDQd/fE/FZ4MQc99muHZM9dIQl2XkjSN2OR7uU6M9XnyAaxrnmposJNFB3Jmy3LCwagQUDdyzgqyojzJ0MKt7TkykvIBNtGDBAPSGDJV5ThAyYPm0FLcJ1h8r5cE7YvAtp7DYgm9bpnlZZrBPNmL4ksC2avb33tAPlevM/ZJR7n5RRPswgRjKoYomkn7iVvg2JiHe4h/EBVyUNKop2geYA4yrE9vkVZ3o4mqi4oDQ8g+R60jutkKkStLdD9Xkh+w7v/ik8C8LyD/2oQ7zGzj0j9u1gs9ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5p3JG1m2MZFvzX5HmuccbfFaACxm841p/wLYHKAr5uc=;
 b=GmGKbDhKciYn9RW1sn0IpI6ur4VOX2DeT9y6oKxDQ5ic9VaOSWEZ0qBQAGsJBUGvY2uZPuTFu5EZ88e7vQ+hnjcRS6ttqWiJ6v9i7Q9W87ce1RA/RXYlbxau/gjp/8n+BGCOFEjsRuOH9ygaX8DftPZaugp0yrJzqytnNKpjG8SSM1M7daAVQ9B934aUWjN8VaOsCCnnE/TX6XZRpNIFutAGBdhDOdvHGP2GoT5Hrkhc6JGsiQ4irXMKmoL/ljLAOIot5pyZ8R0Cr/YVuyBDou2ntEjZsPQN0eAsSapGlRz3TBh/bZaTRCgLWonANo00EHWQzstDdhogyvRbfwnZCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5p3JG1m2MZFvzX5HmuccbfFaACxm841p/wLYHKAr5uc=;
 b=O0bJ+paS+dISq4QLJmqPR5Xy6Ybdwi4DS8yfR4dWa6iJaA6LQCm1MbX8WVuon6ZXMtCWrBWaSEO4X8ffW2qW2Fj9j8WYp4OF12GrIY+cAYJBf7OLvvj6zhTo/TMMncF3ERCnczNe7y1TO+dUtAmEX/UFxzU6sZEO7xQaHR0UtPM=
Received: from TYCPR01MB5933.jpnprd01.prod.outlook.com (2603:1096:400:47::11)
 by TYWPR01MB11340.jpnprd01.prod.outlook.com (2603:1096:400:3f0::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.27; Fri, 5 May
 2023 06:10:43 +0000
Received: from TYCPR01MB5933.jpnprd01.prod.outlook.com
 ([fe80::831b:77c4:7538:9f90]) by TYCPR01MB5933.jpnprd01.prod.outlook.com
 ([fe80::831b:77c4:7538:9f90%7]) with mapi id 15.20.6363.027; Fri, 5 May 2023
 06:10:43 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Subject: RE: [PATCH RFC 1/6] dt-bindings: mfd: Add Renesas RAA215300 PMIC
 bindings
Thread-Topic: [PATCH RFC 1/6] dt-bindings: mfd: Add Renesas RAA215300 PMIC
 bindings
Thread-Index: AQHZfZu8ZyJhHVfu6UKCJMS/J3k6Qa9JsxMAgACXqiCAAAe+AIAA3wdg
Date:   Fri, 5 May 2023 06:10:43 +0000
Message-ID: <TYCPR01MB5933BFFD4EB556F5FB4EA82186729@TYCPR01MB5933.jpnprd01.prod.outlook.com>
References: <20230503084608.14008-1-biju.das.jz@bp.renesas.com>
 <20230503084608.14008-2-biju.das.jz@bp.renesas.com>
 <ca926221-ffc2-8572-39ab-0f849ac91b5f@linaro.org>
 <OS0PR01MB5922B1520AF46095263BD74F866D9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <bce6cbcd-b693-4027-7d17-8e582b8fa2f9@linaro.org>
In-Reply-To: <bce6cbcd-b693-4027-7d17-8e582b8fa2f9@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB5933:EE_|TYWPR01MB11340:EE_
x-ms-office365-filtering-correlation-id: ff58984c-6f39-4217-0b6e-08db4d2f75c3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SkwMjqW6NVbgHpeQzHFpwClTGR6Wlv9UqPr7f3pDuucXwt8yuooqazwzQ6qtgB+VHRJEE8RxgISf7WffAo5GMBLGhhyxpa3eO2zpZOtkYn2ua0I9RUGrLm2OmyCG8j1I3owMTuY/pFfuvjcNuW7gAe8ora5D1o3A39nkATMXiyk5OdlK5oHcFpHlsUA0Yu2BPgw7dXdFtAHkFTyGRHal3d3/jCHVdVtvavrVuamoO99KMynDUjPyruyYXd5E8yog8ngX6x9kGcvQTV+zPsufgkQlHb/Qa7To9IFaNEgJ1RlfN5lg8HJ1nzpzaBspUSP9+iGYjFKY6u89VNVn6sE20CcJ3xfxV0T8xqeGRonFmFsufAvqX/IjrTW/jkLJjATxgqj71lxE8DD3XHtG3fWl5YkCk4zGlFNM+OiURSCjQKb6k8EySodxb0T/48yaIMqH6cp7ssnk3kBADbYtPxkihvCfw58U8YZerNQzLji8XHc2Ir9g7vsmqsWSqsxg46SHFjm3Cx4TBR/pgJNiDHHZqBhIpjJj7J883mMW3rMnpmYbALdp/Ex1jLR5T+hzowHt+ZD65wjC4cQoRs2Npg7nEHUIKFVs/ub7oEjvu8ROhHo=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB5933.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(376002)(39860400002)(366004)(396003)(346002)(451199021)(33656002)(86362001)(71200400001)(316002)(110136005)(54906003)(66556008)(66476007)(66446008)(64756008)(4326008)(66946007)(76116006)(7696005)(966005)(478600001)(41300700001)(55016003)(8936002)(5660300002)(52536014)(8676002)(2906002)(38070700005)(122000001)(38100700002)(186003)(107886003)(26005)(53546011)(9686003)(6506007)(83380400001)(66899021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?wXD+Zxizf+U6pUfTtp4wq6+3OCfI20c8lD7uwDmMr39aG5vooBC2/IXJG8/T?=
 =?us-ascii?Q?2euhekSPO1zZ6TojidlgQKZCr3YKMXrjccTMAAOodYS1lTAQG3JLDKpf797Y?=
 =?us-ascii?Q?CxWAcdrFbTh9d/PzFt6NtWy4JKNrs85Q4l0EvIce7amF38oQ9JUl5zfBM4uD?=
 =?us-ascii?Q?U2XzHKiKRuG3Zrgsd1tJoSQ1dQMjU60xyR4aRqUGJ+ZgA0UK3H78ovPHb7q8?=
 =?us-ascii?Q?4xnZ6RAIbe9KUvpVFQI6RPsO64eFXd1Uk0DsF61biG+TQdt5SpFVZUc9EmqQ?=
 =?us-ascii?Q?MOtOJrZnjhiR1f2FnIgCOhiQrJDW3Hpp244YdJ39kas6i9wgi/FKM9S7bV/a?=
 =?us-ascii?Q?mjBQOo9hmIGM01bIiInMjuZUaBYkGk6XVqA69HMMU6UVmEbU0FcVxe0g7sZF?=
 =?us-ascii?Q?37WExX1w0LPE6Py8Md6okg0S9mL7xHMu9ZLwRQDFR9MFMptL3kwCEKdo2k2O?=
 =?us-ascii?Q?QTQ8ELwyJnDrETeWKkU+4KqCwgK/Wn36vBhPq3yeZXUIjW7YWtxzE8fQaWV/?=
 =?us-ascii?Q?vlHQqXdJ2Q09hqsuxmX7eQAA/I4XVFEz7ZVT29bkq+ejnkHsIyH3VI72ykI3?=
 =?us-ascii?Q?sJfXgHOZ7AlvkuFW8O0stU6Crc6GrTqEDFwAHjdxJQcj9YBDebi+zOaGPKRq?=
 =?us-ascii?Q?H2DjGCYcgjjTKW5QBvVOh+VD7wm7vatmOfyXIaGY++ankL1Vd4+9442KNeMh?=
 =?us-ascii?Q?8iZM4x72DtOR2ZoJpsuufAC5lbE5fHtldT32tA9mz/0ywEPz8mw4objIYM0p?=
 =?us-ascii?Q?02cwBCkf0Ly63vLjEXG/5nBi2Y14FkV1UL0KWantfWf1Q1oJWPMO/kRJzjy4?=
 =?us-ascii?Q?vGfx+gQsnC7cMrOQVYgcCJetlEdq4n47VBYD5i1oRdZdzWlv3xtZjU5imz1n?=
 =?us-ascii?Q?6BNJRDglMSN0EdBa0S9z2B8LWxmPYyY7Em24m6F2JPPKIMOlqCB1F45HCm+5?=
 =?us-ascii?Q?Tu5WWnlywswrKtmjiIQmHhr97VfrLDFsB4ExLTQD59b3EbCVoYC3p7Afx/9H?=
 =?us-ascii?Q?jZDsH8X+W575BGNGH/9SV2lAnGD5CF1Ba0tLhOJdQfqrhi6eHmTHy6HYBOeW?=
 =?us-ascii?Q?dxKCygviMeK7eNLadqZrPh9bZFfAIwUrX0kNKzil6V+jAyM0JSpwWBAaOogi?=
 =?us-ascii?Q?VLFgyEXrOsEPk71evymCvj+aJ9x0/5DMyB5w0Ur/Sy4VhZv0OIQ/CEviQU4c?=
 =?us-ascii?Q?E49WGZlQlBN4s50v9MYmLM3YMjRgGPYqFm2qvkhmzRoqAjPkJ1PODmO8WMyv?=
 =?us-ascii?Q?RGCzNAlIj3bbAGY3F5A6JvcuJH27Y6S0iYpCq0Hwe9esZ07PEWD8O++iYIwb?=
 =?us-ascii?Q?hdL7jVpOq6Wgn3W5vnhwIxv8H1fTO0RzH6ma72ltIyHSXhZKSFrMCkBgB/Xf?=
 =?us-ascii?Q?tfcO0UWCi3+GfvvIrPn4HRPrpIPsfXjttP3ZwshRm6MpseV4DU7dYSsFQc8r?=
 =?us-ascii?Q?/mv5cHM7fEqD+kKmtLKmDMgNqxLC+bt3LCo4a67u2+ed4hlI2bJw7z0C7NFH?=
 =?us-ascii?Q?ehQ5ob+FWHaGmoWLrebAQnqbwaK3p/RxckGmHzbV6NMTdJfdedlcRDm8toIU?=
 =?us-ascii?Q?82bH+o0bO3QipHCr7Y7MPYEiVBhBu8rPPZA3fOKU?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB5933.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff58984c-6f39-4217-0b6e-08db4d2f75c3
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 May 2023 06:10:43.7262
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xGrqU5ggMzSkEfIQNgKhI8OSzS2Kxif01RGNhE4RFvXzVgmN6h5jqzNciAUdBSsNIziSl0VcBD1ErkGFV43+Ng1Eqd0CJqK5eQBkPpmOLxQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11340
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Krzysztof Kozlowski,

> Subject: Re: [PATCH RFC 1/6] dt-bindings: mfd: Add Renesas RAA215300 PMIC
> bindings
>=20
> On 04/05/2023 18:13, Biju Das wrote:
> > Hi Krzysztof Kozlowski,
> >
> > Thanks for the feedback.
> >
> >> Subject: Re: [PATCH RFC 1/6] dt-bindings: mfd: Add Renesas RAA215300
> >> PMIC bindings
> >>
> >> On 03/05/2023 10:46, Biju Das wrote:
> >>> Document Renesas RAA215300 PMIC bindings.
> >>>
> >>> The RAA215300 is a high Performance 9-Channel PMIC supporting DDR
> >>> Memory, with Built-In Charger and RTC.
> >>>
> >>> It supports DDR3, DDR3L, DDR4, and LPDDR4 memory power requirements.
> >>> The internally compensated regulators, built-in Real-Time Clock
> >>> (RTC), 32kHz crystal oscillator, and coin cell battery charger
> >>> provide a highly integrated, small footprint power solution ideal
> >>> for System-On-Module (SOM) applications. A spread spectrum feature
> >>> provides an ease-of-use solution for noise-sensitive audio or RF
> >>> applications.
> >>>
> >>> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> >>> ---
> >>>  .../bindings/mfd/renesas,raa215300.yaml       | 57 +++++++++++++++++=
++
> >>>  1 file changed, 57 insertions(+)
> >>>  create mode 100644
> >>> Documentation/devicetree/bindings/mfd/renesas,raa215300.yaml
> >>>
> >>> diff --git
> >>> a/Documentation/devicetree/bindings/mfd/renesas,raa215300.yaml
> >>> b/Documentation/devicetree/bindings/mfd/renesas,raa215300.yaml
> >>> new file mode 100644
> >>> index 000000000000..1e65f7618333
> >>> --- /dev/null
> >>> +++ b/Documentation/devicetree/bindings/mfd/renesas,raa215300.yaml
> >>> @@ -0,0 +1,57 @@
> >>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML 1.2
> >>> +---
> >>> +$id:
> >>> +title: Renesas RAA215300 Power Management Integrated Circuit (PMIC)
> >>> +
> >>> +maintainers:
> >>> +  - Biju Das <biju.das.jz@bp.renesas.com>
> >>> +
> >>> +description: |
> >>> +  The RAA215300 is a high-performance, low-cost 9-channel PMIC
> >>> +designed for
> >>> +  32-bit and 64-bit MCU and MPU applications. It supports DDR3,
> >>> +DDR3L, DDR4,
> >>> +  and LPDDR4 memory power requirements. The internally compensated
> >>> +regulators,
> >>> +  built-in Real-Time Clock (RTC), 32kHz crystal oscillator, and
> >>> +coin cell
> >>> +  battery charger provide a highly integrated, small footprint
> >>> +power solution
> >>> +  ideal for System-On-Module (SOM) applications. A spread spectrum
> >>> +feature
> >>> +  provides an ease-of-use solution for noise-sensitive audio or RF
> >> applications.
> >>> +
> >>> +  This device exposes two devices via I2C. One for the integrated
> >>> + RTC IP, and  one for everything else.
> >>> +
> >>> +  Link to datasheet:
> >>> +
> >>> + https://www.renesas.com/in/en/products/power-power-management/mult
> >>> + i-
> >>> + channel-power-management-ics-pmics/ssdsoc-power-management-ics-pmi
> >>> + c-
> >>> + and-pmus/raa215300-high-performance-9-channel-pmic-supporting-ddr-
> >>> + me
> >>> + mory-built-charger-and-rtc
> >>> +
> >>> +properties:
> >>> +  compatible:
> >>> +    enum:
> >>> +      - renesas,raa215300
> >>> +
> >>> +  reg:
> >>> +    maxItems: 1
> >>> +
> >>> +  renesas,raa215300-rtc:
> >>> +    $ref: /schemas/types.yaml#/definitions/phandle
> >>> +    description: phandle to the built-in RTC device.
> >>
> >> Why do you need phandle to anything else? This looks like wrong
> >> relationship described. If these are siblings, why do you need
> >> cross-linking via phandles?
> >>
> >> Most of PMICs are described with one node, even though RTC is on
> >> separate address.
> >
> > OK, will model like below
> >
> > 	raa215300: pmic@12 {
> > 		compatible =3D "renesas,raa215300";
> > 		reg =3D <0x12 0x6f>;
> > 		reg-names =3D "main", "rtc";
>=20
> Just two separate regs. I think this should work for I2C bus. The DT sche=
ma
> allows multiple addresses for children.

OK, I will add like below
reg =3D <0x12>, <0x6f>;

Apart from this, I would like to add below optional properties as the enabl=
ing is based
On board design.=20

renesas,rtc-enable: To indicate RTC IP is enabled (eg:Cases like both XIN a=
nd XOUT grounded)
interrupts: (eg: Cases like interrupt line is not connected to SoC)

Cheers,
Biju
