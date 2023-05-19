Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AEC6470900D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 May 2023 08:53:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230083AbjESGxO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 19 May 2023 02:53:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230048AbjESGxN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 19 May 2023 02:53:13 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2115.outbound.protection.outlook.com [40.107.113.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB530E64;
        Thu, 18 May 2023 23:53:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qvz8yjPJLpqOr4dINq1QG9Ir3UncbRU+WRhrSLwVzd1rWDKt087EBoVQEN8TD36AT1f6j0h6crskvsikNGcRvzXAoZsx3l9an+HGtnXvNv2addO42+mJ9kYN+GK55s4zzIppDPfoN1LOe3V+j37/DgxO0xBJoc+ngElZYkVWz0zNvHsPHc9AHIsBRejnJcM5mrDRW1GL2O+bfOPA9y76FQhXD9Jr46xpNonn5E87VNvR9USrsXfo6AzuCeFMWI1MlI4wH60O/Z6rlIwU+Buql3ebTxEqk3ZQLCb4f0v56c8uqI0Kz+Dro2d65Yid4O5eO398+NcAh0anJtfOUyD5FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DO/qofuUP8PNccituhPSHE3tkIY17FC+oQxTlY79bTg=;
 b=VlCvkbGCWqxcWD8Eq8cdRDhRe2G08HOx5ojqZF+srgXKDWCjmm11WloCmQQcHPUwMmpHwigIRZRLziAe5nOsnTSdGGu0OtX212NMv+86e8rZpVt7tY6v6KrHuMA2lXiZsvCjnZC3y/9kzVEoIP+I2KiUduQzdgcJ5OQyajlOrUT3K27cPtk/fkhXZRuqQwQ+EtGsVrtX0Je/WpWU3NeyZx0u3wzfVIw8+g1KSjII056Ke8dYpHWaw57pCLzdLP6dn1qzcZX02Q4UTGNZnB0n1VguFSeo9W6w/EikT7dYVvwahcg5yEgiUQ9b8yQ0M7TH9t0XbWDeiKweHhM4UGkpOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DO/qofuUP8PNccituhPSHE3tkIY17FC+oQxTlY79bTg=;
 b=gpUTlQnyukhTu5XI1DGbgCedJlVMw/7/CI35w8mYSjZKYJJjDbbFAbHGS1J0YjJrieBgBanTS2wZWRYB33sFKPxUmGkeS6TFOlCZ2FzHeD/3QymXZLZqUBw/wpcBRotfL5H4ZrvSFUc1vdK5frb33Srzx2gYbItCavIT6/ipYB4=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS0PR01MB5668.jpnprd01.prod.outlook.com (2603:1096:604:b8::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.21; Fri, 19 May
 2023 06:53:07 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2%6]) with mapi id 15.20.6411.021; Fri, 19 May 2023
 06:53:03 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Conor Dooley <conor@kernel.org>
CC:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Subject: RE: [PATCH v4 09/11] regulator: dt-bindings: Add Renesas RAA215300
 PMIC bindings
Thread-Topic: [PATCH v4 09/11] regulator: dt-bindings: Add Renesas RAA215300
 PMIC bindings
Thread-Index: AQHZiX0f8Q76HwTBKEKFLFKF5VU7o69gZsiAgAC5I9A=
Date:   Fri, 19 May 2023 06:53:03 +0000
Message-ID: <OS0PR01MB59226BDCD4D67430EC7377C6867C9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230518113643.420806-1-biju.das.jz@bp.renesas.com>
 <20230518113643.420806-10-biju.das.jz@bp.renesas.com>
 <20230518-prompter-helium-91d0139a61e2@spud>
In-Reply-To: <20230518-prompter-helium-91d0139a61e2@spud>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|OS0PR01MB5668:EE_
x-ms-office365-filtering-correlation-id: c565777e-08d9-4378-4366-08db5835b181
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2l0dx5K5beQL1lfwCzSwKGIYaA5VWociQ+VbQYdhpyMfKITTQRqinepWmIDvY3YJcyuUe11Q6FOlqZUd7v8AHjQRpIIYwT5iPEVpuJ0w1LaZJrOkPQ0hYWSP5k6gGTGmpVi+sHpQczOcoosUrtf5/SCsyU+gWFqeXOTjkLGQPg6f7g2W/YNpSXQ3uZ46WwHy/UGwWENApv20u8RgxydIZrX1IDMNWN9YJQgh/cNRRllWmyFcPqI8T7USYKFH7LRKwoC3Q61GpBVpqlxm415BLqY8Dit73FTKir3jVePXbWp7x94g2u8PvzLfPtVUIpiE8ypCyJv7VJ+pBIck5TjcYu3IyJuG24xJhq3YA2dl0DX4iJmzkbve4CJYQB+ioVrnEP8RZrFNBTKd6h/lQ1ICAGkGzHtPAkHSEloNUR33QXxYN9ldDSSs0Dpfj8YT7Jz/F7fT6jpsqeyCbZno0SBZCQc4ZSgUfeOMbwTRI7GBgppW8BksRTJCXGDNoFy8e1N0m6R7aAMloXTuyQtBlJR1G93YdEswFjhfH3t1p8R8rDuba3Fk4D+T44e9voPgfgND05uCLdn9NMm62lrWn0hhzfi4N7C0CCzSmdrOVv4ANBhxQmh9j0EZq9H38SS9rF4H
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(39860400002)(136003)(366004)(396003)(451199021)(8936002)(8676002)(7416002)(86362001)(76116006)(64756008)(2906002)(66446008)(66946007)(66476007)(66556008)(38070700005)(316002)(6916009)(4326008)(478600001)(66899021)(52536014)(5660300002)(41300700001)(54906003)(38100700002)(7696005)(122000001)(71200400001)(55016003)(107886003)(26005)(186003)(9686003)(6506007)(33656002)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?GC6S2UNvZXD8JlsUhZG/c2Fq7FR/mi8dy6MpiRCpfeMNx9kjAD9Ve8nq6ugM?=
 =?us-ascii?Q?BIRVc1j1aNdz36cv9Ue5FFNUlYwQcI+g6mCkagapAZAfMbibM2sv0iULh2f1?=
 =?us-ascii?Q?DoYW3QEjxDzIvwr4WubeMIyaZACxX06svH+NQ5k2Xorf3tiRVljPlUrGY8g7?=
 =?us-ascii?Q?gEqI7GVlzyM1APrN3JDbbWNjnZyjeUypB2j/Bfvi6VNYtQyCkrRwglvVk9kY?=
 =?us-ascii?Q?KM64l+EGKDyntcSAh5EhIvUUvP2Z1twuTpInJZgrWY7Zb7rvmf6sImP4seOD?=
 =?us-ascii?Q?OkPgMesuSgTUmEeGPwflPkesbs2b2AfSbpkwKULqXELQ/zpjcGovCE3E2Vnv?=
 =?us-ascii?Q?6Ak/N3gXl3V7uZV9YqKyikTIRDpTNNSynIkbUF9dBzVXgceUqLbxmRySEuy8?=
 =?us-ascii?Q?6fuofHqEd/Pd0vfoPbNLpz8YwA1QboNQGrK9Bpuvz937cF+6JfX1IXN2W/qL?=
 =?us-ascii?Q?RY0kqMx7klH59J6/ka+7XgB4OGkfh2/LJTuWUhhkdw3e7uUOWSWimg4HMjGA?=
 =?us-ascii?Q?Ow+umeJLKdaxuGl58pXoHDkAgumAAFSbq9zXsizurveWdnY/7VPqzl0Z7v3Z?=
 =?us-ascii?Q?wsW2ErlOYH3jCOAhpTQu/O1nqGhGiuj2VAtoAzYQ/o88vOKlfSh8N6NExhCd?=
 =?us-ascii?Q?+0RYozt5gD+y8rXX4TS+bSps6y3r7rcBpLieHaIoG1r/b8F7V+ofKT2XsX5S?=
 =?us-ascii?Q?fUOHvXqoV2cauqu+uIKTI6CTLhjUtSjyZJaDAVzDhyv7vPhXvApCrcebdYbx?=
 =?us-ascii?Q?qnseD6cEl4EPMl3kbAmv8mYisqNNP/wTWK/CfEkpgJdh4VeKFYwP44LdFVpb?=
 =?us-ascii?Q?IhJHD1fmdMep481fS5uopU2tDPyifIBgbmnDqKpc7dNMydwNO7a8ZjaNa8Lj?=
 =?us-ascii?Q?OPmtGkOnPeSFdbn+LaIXYJa0EGU2y5ZqndJ9MFq9EjhN/sSDqYLdaMXR5urR?=
 =?us-ascii?Q?6c0e/LizCjO70pzA/Tb7sC7/AWw2BBWesfwzKdY/wjguEHklIVG/zFPgBBYu?=
 =?us-ascii?Q?K+8BdvzWjD0hyL7f4u2rR7j6ViViQVE5Mz0rKoIRmUlgItJ/DNwtoJKh8KAG?=
 =?us-ascii?Q?X1ia3ts4tAte0D+R93UgGTnwrSuuQHU3vvZj9j9uVCGWDS5WpJO+R9J5FX9Z?=
 =?us-ascii?Q?VB2RDh9OP5TZk5B1GvVPTFGgNh87CYYFhTxG0cjh6L8crVwW1XiF5g/06gbm?=
 =?us-ascii?Q?A9EJdQ8Qm6BP/4BO+p8y0SLaWjWxNVYID0U7nnEnLYXqb+7zKPAGft2d4Cgd?=
 =?us-ascii?Q?qfONukGTuhMnHfqHT8uk3UahBKhep1m2oOiHoyF6mVC4UNEGnSEuTYuEPhYM?=
 =?us-ascii?Q?DUNyYpYS9TI0R5Ek7YHV9Ukmy33n+IybQFAkhKIpTbFQo0x03qwFCxpGOFFi?=
 =?us-ascii?Q?RkY5hOvKDRTUawttsVpbbgbgUXm7r2FXvRzI4BUr7XEr313+CwNWyVVZO2jF?=
 =?us-ascii?Q?OOGyOM3rqTNpi9GYlCDgrfjy2Y09Ex1YD2C7mpoBD9UCi8WyPDPgHWuppbFB?=
 =?us-ascii?Q?shz8hpEb4og2TpGOoCnsIxBX3TTzQcO3eRJ5BBQflVpkrJ7w8VBvvAqTW9SF?=
 =?us-ascii?Q?FlnPQ0y3sokZSmZCaQwXXuL00L1DWa7+2sCFbgYx?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c565777e-08d9-4378-4366-08db5835b181
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2023 06:53:03.7552
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4UEJSUKmS4VrLtqJJwe2BrtoLn5yn/jy7am85IMdB1toi4Xb0VtCKbI1RBndkPc+d+NjhQoJIku1jEyHNXFL1aoe2kpeyzmi68kPPghcA7o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5668
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Conor,

Thanks for the feedback.

> Subject: Re: [PATCH v4 09/11] regulator: dt-bindings: Add Renesas
> RAA215300 PMIC bindings
>=20
> On Thu, May 18, 2023 at 12:36:41PM +0100, Biju Das wrote:
> > Document Renesas RAA215300 PMIC bindings.
> >
> > The RAA215300 is a high Performance 9-Channel PMIC supporting DDR
> > Memory, with Built-In Charger and RTC.
> >
> > It supports DDR3, DDR3L, DDR4, and LPDDR4 memory power requirements.
> > The internally compensated regulators, built-in Real-Time Clock (RTC),
> > 32kHz crystal oscillator, and coin cell battery charger provide a
> > highly integrated, small footprint power solution ideal for
> > System-On-Module (SOM) applications. A spread spectrum feature
> > provides an ease-of-use solution for noise-sensitive audio or RF
> > applications.
> > +  reg:
> > +    maxItems: 2
> > +
> > +  reg-names:
> > +    items:
> > +      - const: main
> > +      - const: rtc
>=20
> > +required:
> > +  - compatible
> > +  - reg
> > +  - reg-names
>=20
> Out of curiosity as much as anything else, why do you need reg-names if
> the two registers are always required?

The device has always 2 address spaces and "reg-names" provides a means
of clear differentiation compared to indices.=20

By enforcing "reg-names" as required property, dt can do some schema-valida=
tion
forcing users to specify "reg-names" in device tree.

Implementation wise, we use "rtc" for getting resource details while
creating the second i2c device which overrides the default address.

Strictly speaking reg-names is not required, but from a validation
perspective and since driver is using the same "resource-name" it is
better to have it??

Please share your thoughts.

Cheers,
Biju
