Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F98B6F8891
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 May 2023 20:21:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231611AbjEESVo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 5 May 2023 14:21:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230473AbjEESVn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 5 May 2023 14:21:43 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2128.outbound.protection.outlook.com [40.107.114.128])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D8D711D90;
        Fri,  5 May 2023 11:21:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=leG52Z9CcuEO1Qi5/ECbyDc/f5KxjSacvS9eYBP4mtSFKczEiL9/vRUY6x95UBkoJdGB9kF0qnjRVRRS9dnoifwZb5PMInxnkv7WpWHbRRuiLClsJNub7zc105TQ/ZyRWvFKIqaBJaPoRm5Xyv4scqLoqGnzlAO8iwmgLH+JNev+zOlayoboeX0Jjq4fwzU/lfGPK8VujzpaZcvOoRwN/sDpUuoOy//PuiHRvOej8mVl35/4o2nhOP0r0uiJMZLKLvrtcXMJ40oKuu4rJyz70yo2Gq5vvoANtH7dz109hLenZdzueH8q1nBkciWX9Hsi0DsEmUtRJ9VZxZBdR5ETPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FE2JDiobppSCMI/I2nOGhg5+H/9oTQYS2fKSfM0jmRY=;
 b=R/kn295iCt/Cd4Wyeev5Ru14anx6vXKvnq5cToMTcfP1o0YiikQSqdkY8m5ta5pFhSxiTcz+QvXNwh6cFvmOfJsZGgW197N+PHIaFzafT+yOS1jmvlH+P95zJB82YaoJwnJZwH2gTllbh68pbSgJ+7QkSOHynXrFw7DzX2JcrMm/Ljhev9MqrPzOXt5rmCSIXf/rqDoZzvIvO19zZSHMbnRXo2Ly1ZGpJxbJ6AWGW4WCMGAtbh8XLfld8G/3Qbdx/zHykOD0zUMrAVtxvR4weGy5CGVt5MFF5ZLoPCdH9B68vAIAWL7E7TPP/8QmofZoUknt5p8WyZCg/lEb8Uh5Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FE2JDiobppSCMI/I2nOGhg5+H/9oTQYS2fKSfM0jmRY=;
 b=uBifouaZt2z5QSTDcuyACj3PTH6sNkVbEOWjKRKuEwiV5yBrS6EEonJe2iu7Bslw37lfd7IJQ39b7jQzSB2QSZMSWbgg+w95+05yzwGdYuFgWf24zS9CK0faaH637e84moHugLT8aRC/Oq7EnPQDRl1Q2qjpSlk3nvoR+YhKids=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYVPR01MB11183.jpnprd01.prod.outlook.com (2603:1096:400:367::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.27; Fri, 5 May
 2023 18:21:38 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2%6]) with mapi id 15.20.6363.028; Fri, 5 May 2023
 18:21:34 +0000
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
Subject: RE: [PATCH v2 1/5] dt-bindings: mfd: Add Renesas RAA215300 PMIC
 bindings
Thread-Topic: [PATCH v2 1/5] dt-bindings: mfd: Add Renesas RAA215300 PMIC
 bindings
Thread-Index: AQHZf3aejB91VGFKJ0a6jUxtT8S7PK9L+iaAgAACpAA=
Date:   Fri, 5 May 2023 18:21:34 +0000
Message-ID: <OS0PR01MB59226713E010AF3F9030052B86729@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230505172530.357455-1-biju.das.jz@bp.renesas.com>
 <20230505172530.357455-2-biju.das.jz@bp.renesas.com>
 <e2393abc-53a2-4216-cd85-1033560421ee@linaro.org>
In-Reply-To: <e2393abc-53a2-4216-cd85-1033560421ee@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYVPR01MB11183:EE_
x-ms-office365-filtering-correlation-id: 6e4d8795-ad53-41c8-c210-08db4d958ef1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: aQEDiMfnGHIYnkFjQx7hXTndU2mmBom2dbeTfKCquvrQW1qJtPqisoSpzRTUlAmgt7dJgG3cCjN87CFV8PvXQKg+0jkEnI61q3WzyuiHNustywaYbIh/iQ3AbpGLThUx1Sv6AFwuY5yQ1Fr52O5hP2C17I3NZ+Wv9qdQ9vuNteOah6F9bDcSW5KPHitBIS3TZ16rcuEnB8d1O7cWNxutRxpTju5D67c1ZzlKrnULpfsBko8SLll1Nb/eAuUUDU7qD1g4iJJdeBTkGRxhicAglxC/AZ1dOICCQwJzxr5kx/nK7+gONBCoXFStuWOmD6dUU+6znPCFfmPFcY4aQkpprovyJ4jLHsVv2o/pEHkkTm47m7yQGTNVVReaQcizL+rOWu7nuSutovAMylBPBXRpSc4P5Egh/ZUsgWSnoy2K3RkUEggckldSN9WDlV3Swmrwzgu2bN69BWvs2McubpAaljrxP61MzOjSAhYP084m6AmIiCu8PUJGPoRf5GFmqgKofGrZNNwLN6ddLcSHzdZ3sQd0w9k5a2oCs6e7kk9YLoztUoWkWpQ7R9mD5VncoYYynSVJ1+Sr19rMASfHaAMmaAKgVHXCRUGQWU11dCo3OBI=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(366004)(39860400002)(396003)(376002)(346002)(451199021)(86362001)(33656002)(7696005)(316002)(110136005)(54906003)(66556008)(66446008)(66476007)(64756008)(4326008)(66946007)(478600001)(966005)(76116006)(71200400001)(41300700001)(55016003)(52536014)(8676002)(5660300002)(8936002)(2906002)(38070700005)(122000001)(186003)(38100700002)(107886003)(53546011)(26005)(6506007)(83380400001)(9686003)(66899021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Y78Q+FdI1/l1gmDCua9H4lPt+3t/ZB02SuB036X9msLSV6NRqTiBsFgI6h0a?=
 =?us-ascii?Q?ev6DEtHaoFq7/PDoUN5LeJyZ07mRdWZ5dtAjlRWCQ6BJdns/Va1iIdJD3gTs?=
 =?us-ascii?Q?AQi1cWR3eTJf3QFl7DOKPKHr57ma82ScCZpuNi6yuEXDN7Zin23YWaFGXTTU?=
 =?us-ascii?Q?5h0qp4IIbSBYPkgBKbuFsPucg8v6XFI9AAtB2WhvMdBZCeZd4pVeNHVyCuq8?=
 =?us-ascii?Q?Cy7PVuCJVNRVQmXtbvi8VwC1lxieKDpIvB91OuGgCHtENaPWaYLei48Q/my8?=
 =?us-ascii?Q?hlDsB8p66th2LMV1O6xrRfcajkzgezgUz45i7ovrzJQlcU8qd4Kf4tBxzyd5?=
 =?us-ascii?Q?BkGmL7aBdUHN+qEWq90umgjxrcgmReFp7oYbH0jvWQNpqccHdzLB5Sonl7j6?=
 =?us-ascii?Q?NlQB8fTJeyeRoAOWQINzkMnpqlTpG3e2B4FfRN9Ms0xnpgV/UuPULIRdOG8R?=
 =?us-ascii?Q?vVo99Nq/vOFELOt1p9FtKEvxQFBqkMTacJMu0gCauIvi8rDwb0F2wqFVY9Dz?=
 =?us-ascii?Q?GyzSLI0XHVfANsD1+0GtnjgDE8ZyMtvUCe9QoMFNnv7x8ehXoIp+mWYFBYnd?=
 =?us-ascii?Q?BYSe/2qOBP97CRn1Oo/45Kt20FQc/1PMxldOnNaJoYHLzSGE5o1FcnUImhJ7?=
 =?us-ascii?Q?0N3JY2rAeP895VdFZ7/pxLDOP/2mmurUyETwicmy3DBwiJCr2PHtWgg15fmY?=
 =?us-ascii?Q?172FipbHfU64mGuRyu/F8KCrVwUJsNJaKef7yFSkcMCw6ywWT+EyApRJkq1d?=
 =?us-ascii?Q?Jshhe+tybV1ybHg+/yG6oRvZxwvPQ7jkJKnUqcJgSlx3PfR4xCjU3xTt2V1S?=
 =?us-ascii?Q?fl/G7PA6STkFsU4vaT2y9kRxM2Y+DWoTSMjUHCR5sfL0LgLmaw63/vyTd9wm?=
 =?us-ascii?Q?yw129vWbCdtSMN/ELyMgs8sUPxUwAx4elXURf9VF4AgGxR1NbIZgK/PSdC6a?=
 =?us-ascii?Q?5thpV/0mngCTqgCu4pYsiaiJsMCeTPHWoiowY1HNPKoQ2Rw1EP2jdcdzRkg/?=
 =?us-ascii?Q?zdHQD0NWjV4kFO2tQ4hjYxNRKfd++fojfs/DBG7203eUYkYEDO4pIhwdUFQ2?=
 =?us-ascii?Q?FntbRiPW+1SfqsYhGL5SGm8Ru9lSvmvVXCJSXaVz1HC0fzwHjMNzvVlycGaB?=
 =?us-ascii?Q?Yv7ewB/V6MZXTNrtV+iM/Gq+gTCy8seKAtiIhQEKUEY3B+76mXM+isM+6o/v?=
 =?us-ascii?Q?gMaGmT4uOeXYNfTx8CnUB6VGbGiculVbOR4CQmQ8e308lY8b//HhA9+bK9S0?=
 =?us-ascii?Q?TSzcynrgQu+GZzjOwbNHX8j4Jm1PUNYerg3JhKRF7WYMtoafE7l5Y7xzRB4m?=
 =?us-ascii?Q?9XKBD6As1KP8LFJLaEfzADuZugOxJSmiDmY0hI5ESl8Cczds0RwQDHyFwoTf?=
 =?us-ascii?Q?h00xMFuRzfo7QiaEE75Ur1QHVTqyaYrX6L06npK8J837gMHup1PoByx/zz12?=
 =?us-ascii?Q?jOpemQZPl5IG+Si0MguHb09Y9IaZc75LUXq9+8Obl03HS8RacVF+CJHB2tMm?=
 =?us-ascii?Q?lBZotxW8QnzoIfPiNx3JmskYdUTJ0ZdQoM/T7rDjUDRNUtk/Rfzfzo2+9rb4?=
 =?us-ascii?Q?Z3xZKLqs2eHn0HWkN1/GWR0nRVN5Vy/6yCMPDIi8?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e4d8795-ad53-41c8-c210-08db4d958ef1
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 May 2023 18:21:34.6109
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4u8iGgk6KOx2bnJSX96xmVpNPNneLqKCWYtzhsWFH5kU8OaNpKsCEBF6pBwy4AuqJ4lQFfKcFMIIEHYVIX6aJN3UAq9+bE1xQYqw4WzbASs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYVPR01MB11183
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

Thanks for the feedback.

> Subject: Re: [PATCH v2 1/5] dt-bindings: mfd: Add Renesas RAA215300 PMIC
> bindings
>=20
> On 05/05/2023 19:25, Biju Das wrote:
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
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
> > RFC->v2:
> >  * Updated reg property
> >  * Added optional reg-names, interrupts and renesas,rtc-enabled
> >    properties.
> >  * Fixed the node name in the example
> >  * Dropped the cross link property renesas,raa215300-rtc.
> >  * Updated the example
> > ---
> >  .../bindings/mfd/renesas,raa215300.yaml       | 68 +++++++++++++++++++
> >  1 file changed, 68 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/mfd/renesas,raa215300.yaml
> >
> > diff --git
> > a/Documentation/devicetree/bindings/mfd/renesas,raa215300.yaml
> > b/Documentation/devicetree/bindings/mfd/renesas,raa215300.yaml
> > new file mode 100644
> > index 000000000000..85cb4f0b5711
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mfd/renesas,raa215300.yaml
> > @@ -0,0 +1,68 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML 1.2
> > +---
> > +$id:
> > +
> > +title: Renesas RAA215300 Power Management Integrated Circuit (PMIC)
> > +
> > +maintainers:
> > +  - Biju Das <biju.das.jz@bp.renesas.com>
> > +
> > +description: |
> > +  The RAA215300 is a high-performance, low-cost 9-channel PMIC
> > +designed for
> > +  32-bit and 64-bit MCU and MPU applications. It supports DDR3,
> > +DDR3L, DDR4,
> > +  and LPDDR4 memory power requirements. The internally compensated
> > +regulators,
> > +  built-in Real-Time Clock (RTC), 32kHz crystal oscillator, and coin
> > +cell
> > +  battery charger provide a highly integrated, small footprint power
> > +solution
> > +  ideal for System-On-Module (SOM) applications. A spread spectrum
> > +feature
> > +  provides an ease-of-use solution for noise-sensitive audio or RF
> applications.
> > +
> > +  This device exposes two devices via I2C. One for the integrated RTC
> > + IP, and  one for everything else.
> > +
> > +  Link to datasheet:
> > +
> > + https://www.renesas.com/in/en/products/power-power-management/multi-
> > + channel-power-management-ics-pmics/ssdsoc-power-management-ics-pmic-
> > + and-pmus/raa215300-high-performance-9-channel-pmic-supporting-ddr-me
> > + mory-built-charger-and-rtc
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - renesas,raa215300
> > +
> > +  reg:
> > +    minItems: 1
> > +    maxItems: 2
> > +
> > +  reg-names:
> > +    items:
> > +      - const: main
> > +      - const: rtc
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  renesas,rtc-enabled:
> > +    description:
> > +      To indicate RTC is enabled on the PMIC.
>=20
> "Enabled" by who or what? This looks like some policy, so Devicetree is n=
ot
> a place for it.

It is based on system design. System designers may chose not to populate bu=
ilt-in RTC by
grounding XIN and XOUT pins.

Do we need to add this info in description to make it clear??

Cheers,
Biju

>=20
> > +    type: boolean
> > +
> > +required:
> > +  - compatible
> > +  - reg
>=20
>=20
> Best regards,
> Krzysztof

