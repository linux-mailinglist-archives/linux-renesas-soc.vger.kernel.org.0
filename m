Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 19A385F2C2F
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Oct 2022 10:42:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230227AbiJCImx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 3 Oct 2022 04:42:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230074AbiJCImR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 3 Oct 2022 04:42:17 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2135.outbound.protection.outlook.com [40.107.114.135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA3DA1A826;
        Mon,  3 Oct 2022 01:18:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T1RL5ORSOUBTaMlgZHDoSFZ/hU0++Spq9rG9NNbZyCc7KEvd8A/zlSPLhXdXT8YnUj+ACPhBJwnq1GsD1pnXPz3QDDzAGgextes33SCXk/BHJfpMYsyt/01EiH3VS3bVSPjlOpcrBcwHeHuHE/XDAj8L/pdhLRHhdhHAff/cONKXbVXSZaGwRfVuqtdyC9uL8He6PYZXlHZSQdYeAfxy6NNAz5+h07YOmxLbJP8K9dzGQ/m/wO+y/OZRzH7GIXZ3PdRuHZLNyq8mHnaO0/1SEdxbscFIUPbQzUO1ZjBPjlvWwuEtVXQ/rA4mAdX+GA9eLLYzW90+7JyCPeNVIn/LFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tTfxokJMO8DnXaVIW69VtVXamQhrA3Tntg9xLkFXTqY=;
 b=lKUVMd7aTv1BsG9ARNvGgw8CR8FnjlqscuXTZJ36FjtX2/Baca9Je6XNoNvo5NFOnE4eYXaL/Ae1dzDJSU6a5UQ5JYMLLUYNYs32i6FD269efO23eOaRyun2BE3OnoVkO929gYW1W37jLjb9RpYqnK4n+eg5eh00p8OPS/d3oO/dOa91wQVL9NTEXW6ei4ghP0MMWLdhMU9wBxTYd8U579i99aS+Pa5ZtCDywHbphKL9rmkt+bGwhDYIOT9OBOVRdzHiyQge4Y4hjomDTpgaTJvvW//hv+Sgj/afKrZKFxrM/7KGshwK/SDukrHIk7iBKRjlwfrgPsBHYuNqkvJUlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tTfxokJMO8DnXaVIW69VtVXamQhrA3Tntg9xLkFXTqY=;
 b=te+pNlebDYC3l0iZqQEaInadICUhh40JZ6ZjNL1pNRTrg53yC4CWx3WL7lM0irACzMb2K9kcCFXKqt31SuX023qSMB67+XxhJfCghmIrb7TB4N9DjDsmxUdEQ5RRhY2Ij4Ko/m026PTrOFrj6PEuwhj6CsILqG4dgPpdOzYsqS0=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYCPR01MB8174.jpnprd01.prod.outlook.com (2603:1096:400:103::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.28; Mon, 3 Oct
 2022 08:18:39 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::73a6:588d:1198:7262]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::73a6:588d:1198:7262%7]) with mapi id 15.20.5676.028; Mon, 3 Oct 2022
 08:18:39 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC:     Lee Jones <lee@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH RFC 2/8] dt-bindings: mfd: Document RZ/G2L MTU3a bindings
Thread-Topic: [PATCH RFC 2/8] dt-bindings: mfd: Document RZ/G2L MTU3a bindings
Thread-Index: AQHY0arjAAY356X6PU29C+sfU1jRUa38VjaAgAAHgZA=
Date:   Mon, 3 Oct 2022 08:18:39 +0000
Message-ID: <OS0PR01MB592262FAA9ACBAEDD2AFF6E1865B9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220926132114.60396-1-biju.das.jz@bp.renesas.com>
 <20220926132114.60396-3-biju.das.jz@bp.renesas.com>
 <e44abdb3-b099-bfe6-4b5d-95dec0d4388c@linaro.org>
In-Reply-To: <e44abdb3-b099-bfe6-4b5d-95dec0d4388c@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYCPR01MB8174:EE_
x-ms-office365-filtering-correlation-id: a1cd998b-54bd-43a0-8808-08daa517e044
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lNPu07fb9bK7fuX2JagCQ1x8obuEveSv//95dGZIpeXqLYVlhW5xISnUXZ8R5qoi0pCWoROtQMfyR4j1PdPtEYhgGNuQP3zCnz+UJtYg2pSLYlREk3UEWKtkVYOjVqBRTn+RtWSDQqvsntI4agQXmY9YUkZBfF9G0rchiKfhgNhgKt6zo1zGKomzopMSdT8M+caLWlArxq8BPFioANy/8SZeEAJgDyhtzVmocvsBWB+lsedHJdNThJmwTom+LycQXyVxkR3WFs6N4LHQDD6BaF+uhZhd0bHyu3MiQUiGHbf4O9in5/UcfL48/a33JXjQ1WEC7p/296/Fc/eCE1vxiJngu7LcTVOOvn4B8bMQNowxyM5o/9HuC8cb8853Xbav2Et7oW4XIEH55VcTSXWVpL1ZN+eIHbCjGta+U7K2KyGsCybq2mv3G1VeOjATe5c4U7GNmlp0AO1IDL5ovtOEQPLTOaxvyN8nQ0Awn/0jq5nKBaTLSFrehbJhpau+dTJBWzELFAz/LzRfJFmd4BhuMj04OQeexEV39nGoiApcpTyyJglAmD62450RsSGEhozLoJQhvzYZgAzK4GqfKRl+8V+7LM/VuhC6X6VIItr7kX+RpEfmzr3ViDrXDQdNh06l89wKnVK2c4X7M1oCKqMkIS94HmQRH8p5xptveEmatCDQhZRn7ipc3hLjl+m09l4pnljnsSJM1Wi7C90lUjM3TYORe0m6+KXkLTaZlamcrDveGjvn4i8dhxwtlv7pqktrwYZ22HHyfr9iNYte6W50WE75RqTnegc6Pty0jI4zfIA=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(366004)(346002)(396003)(376002)(136003)(451199015)(64756008)(66556008)(66476007)(4326008)(66946007)(76116006)(66446008)(41300700001)(38100700002)(122000001)(8676002)(186003)(33656002)(2906002)(55016003)(83380400001)(52536014)(53546011)(7696005)(6506007)(26005)(86362001)(9686003)(8936002)(5660300002)(38070700005)(71200400001)(54906003)(110136005)(478600001)(316002)(32563001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?CKls3qKyibn6EKI4YvqObW1N5UbST9ZjtehP1oaH2nrPE91uyQ+W5ggkhOiL?=
 =?us-ascii?Q?H40EdsILrwYbVV7obgWl4qsE6SeyvbHa2W3XB2Fb3HXqlwicOOHv51EWC1G9?=
 =?us-ascii?Q?fUe1W80d1tVPSNNgKQ+dirGWuRbolUJGsgJsGYLmkPNLuNlL37WCDh7Oi1lY?=
 =?us-ascii?Q?i6NbakmT7Xc5XMFfUnV5zxd9D7PdhHo0iyBXG1f42iwzapFI2gwQVF0X/zAX?=
 =?us-ascii?Q?apXbIkTziOxXSsReMfiJ7G4mm92AtRLdBuyIy2rs+rgFD2H9A+F2FQP/X1EQ?=
 =?us-ascii?Q?t+NBxe2hAHHAUKTfjrOtZOepBZuk44drWQAOMm/OMyA0+c8UGda7dO/+vuzL?=
 =?us-ascii?Q?kAhAFFs3j+/1Ra+mOG3Z6xHOabuTspzjGrGfpY+WzjsferGBck5Z3KZn6vEl?=
 =?us-ascii?Q?TQZ4gczQGFV7hi4OKfQ60QbSAB6bUwEmcmQogNOzgSgBI1qqYv9UfPsxaQqz?=
 =?us-ascii?Q?bKO1RSxm8+kOBSsz9/ulbQpquypX2pqTX1eiwHHN9nZZx3muTapw/DD3zCKp?=
 =?us-ascii?Q?7iXmEavubjLaFC+5JzxXXbMW32SH0mEkK5QXKy1v8gzkeGPCQBpfCjyrUBQ4?=
 =?us-ascii?Q?tHAJuZsacSboSNt+yqazHsdIHhmvkj/UzvZ3Ij1HkL7iBkLnKZ+D3Ydl7+El?=
 =?us-ascii?Q?9IJTs6E3QbkLA3iEO9LkcWFG/AyLTbETezNny+C0cQPzlEVZEEG2nr8bzREm?=
 =?us-ascii?Q?uzHTsnn0vMimT6S/WUWoEaQ8tEueYWATuo7hsA2Da9isnwxeDPrTxqSdxpUO?=
 =?us-ascii?Q?nUq1Id5TKwOZHj84LT6GNEENoc+QaQrBuIM2PWZGVy8NuIBL6ceTKaKSzYF8?=
 =?us-ascii?Q?gQz333Jerb59PhB0h5QlelJzlgwSO4FByVD5Se9kxoHnHNtGkCNmskbeQpyd?=
 =?us-ascii?Q?34MdadorRqFvHkmi4+t0XQBPOkdScq9SeuJvm6fOMZ4ur3MpFczp3F3TqXGr?=
 =?us-ascii?Q?vjQva2DGszGKvm11BzS8vJSEqdSl+z8UpVpFFnW23Jid38puy9I85Ohw4uPC?=
 =?us-ascii?Q?NQuInzH99LRqWMD/E1S21/Y7ZIwaGDjoWxIxKo3vHJHBVZ6eeaERh1mHLgDr?=
 =?us-ascii?Q?FL2xbjFjrEVJFqKZg9tA++yPkn1utOgNgTYU+3d51d58G/ECco+EVRFs3MWc?=
 =?us-ascii?Q?ygKpcBOkca1jUoM6+t95fNBalKmEfAifoOOYEgkt4q3UuhnF/HUOlRMUV9eJ?=
 =?us-ascii?Q?048IE2Uj5kek9Z3f6gV47etakBLZYiWsz5rKhxuseiWnj0jmSFX/ohhiOWME?=
 =?us-ascii?Q?4vJ8YW5/voz8cd7O4h6L8CYPLhmkeqsmhLX/KuhmdA++ECmTX/9cDmMGnXps?=
 =?us-ascii?Q?w/9+NFMmu91tVIVA9Oz6nE1n4wU3WiQW0Fp8gO7uES/gFj78lPibiDrFzZCr?=
 =?us-ascii?Q?I6WWdGdYcOBSrKbmDw4wiAkpS0IILcRphgLjB9h2gusr7ddtRYOmja63TocF?=
 =?us-ascii?Q?QkAT++en9hQkBd0cU9VMAtCCjtXHI72bYtzShiLJBRXc75T0dUzCXUpu8a69?=
 =?us-ascii?Q?IpcaNqum6xEEjWgb5f6o0DyVsDzxi/ZLDqOjWGV/TfzPyG9Wvaql6DWnf+b4?=
 =?us-ascii?Q?jPEhowywCTu33vHjnFZhGBl2mTOFmFdR/CaI2+O6?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1cd998b-54bd-43a0-8808-08daa517e044
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Oct 2022 08:18:39.1452
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZazdlU4+d4YM6N3J4vfV5j+jdGVyVp1fwspnMvl+1AB3ZPmxVs8vdD6rsAEhMgnknpdKfE2dkXN+nGz/NDoqtsvnFm8700rmJlvlR6S0erM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8174
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Krzysztof Kozlowski,

> Subject: Re: [PATCH RFC 2/8] dt-bindings: mfd: Document RZ/G2L MTU3a
> bindings
>=20
> On 26/09/2022 15:21, Biju Das wrote:
> > The RZ/G2L multi-function timer pulse unit 3 (MTU3a) is embedded in
> > the Renesas RZ/G2L family SoC's. It consists of eight 16-bit timer
> > channels and one 32-bit timer channel. It supports the following
> > functions
> >  - Counter
> >  - Timer
> >  - PWM
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
> >  .../bindings/mfd/renesas,rzg2l-mtu3.yaml      | 275
> ++++++++++++++++++
> >  1 file changed, 275 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/mfd/renesas,rzg2l-mtu3.yaml
> >
> > diff --git
> > a/Documentation/devicetree/bindings/mfd/renesas,rzg2l-mtu3.yaml
> > b/Documentation/devicetree/bindings/mfd/renesas,rzg2l-mtu3.yaml
> > new file mode 100644
> > index 000000000000..c1fae8e8d9f9
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mfd/renesas,rzg2l-mtu3.yaml
> > @@ -0,0 +1,275 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML 1.2
> > +---
> > +$id:
> >
>=20
> Drop "bindings"
>=20
> Since this is RFC, not a ready patch, the review is fast and not
> thorough. Please send final patch for review (when ready).
>=20
> > +
> > +maintainers:
> > +  - Biju Das <biju.das.jz@bp.renesas.com>
> > +
> > +description: |
> > +  This hardware block pconsisting of eight 16-bit timer channels
> and
> > +one
> > +  32- bit timer channel. It supports the following specifications:
> > +    - Pulse input/output: 28 lines max.
> > +    - Pulse input 3 lines
> > +    - Count clock 11 clocks for each channel (14 clocks for MTU0,
> 12 clocks
> > +      for MTU2, and 10 clocks for MTU5, four clocks for MTU1-MTU2
> combination
> > +      (when LWA =3D 1))
> > +    - Operating frequency Up to 100 MHz
> > +    - Available operations [MTU0 to MTU4, MTU6, MTU7, and MTU8]
> > +        - Waveform output on compare match
> > +        - Input capture function (noise filter setting available)
> > +        - Counter-clearing operation
> > +        - Simultaneous writing to multiple timer counters (TCNT)
> > +          (excluding MTU8).
> > +        - Simultaneous clearing on compare match or input capture
> > +          (excluding MTU8).
> > +        - Simultaneous input and output to registers in
> synchronization with
> > +          counter operations           (excluding MTU8).
> > +        - Up to 12-phase PWM output in combination with synchronous
> operation
> > +          (excluding MTU8)
> > +    - [MTU0 MTU3, MTU4, MTU6, MTU7, and MTU8]
> > +        - Buffer operation specifiable
> > +    - [MTU1, MTU2]
> > +        - Phase counting mode can be specified independently
> > +        - 32-bit phase counting mode can be specified for
> interlocked operation
> > +          of MTU1 and MTU2 (when TMDR3.LWA =3D 1)
> > +        - Cascade connection operation available
> > +    - [MTU3, MTU4, MTU6, and MTU7]
> > +        - Through interlocked operation of MTU3/4 and MTU6/7, the
> positive and
> > +          negative signals in six phases (12 phases in total) can
> be output in
> > +          complementary PWM and reset-synchronized PWM operation.
> > +        - In complementary PWM mode, values can be transferred from
> buffer
> > +          registers to temporary registers at crests and troughs of
> the timer-
> > +          counter values or when the buffer registers (TGRD
> registers in MTU4
> > +          and MTU7) are written to.
> > +        - Double-buffering selectable in complementary PWM mode.
> > +    - [MTU3 and MTU4]
> > +        - Through interlocking with MTU0, a mode for driving AC
> synchronous
> > +          motors (brushless DC motors) by using complementary PWM
> output and
> > +          reset-synchronized PWM output is settable and allows the
> selection
> > +          of two types of waveform output (chopping or level).
> > +    - [MTU5]
> > +        - Capable of operation as a dead-time compensation counter.
> > +    - [MTU0/MTU5, MTU1, MTU2, and MTU8]
> > +        - 32-bit phase counting mode specifiable by combining MTU1
> and MTU2 and
> > +          through interlocked operation with MTU0/MTU5 and MTU8.
> > +    - Interrupt-skipping function
> > +        - In complementary PWM mode, interrupts on crests and
> troughs of counter
> > +          values and triggers to start conversion by the A/D
> converter can be
> > +          skipped.
> > +    - Interrupt sources: 43 sources.
> > +    - Buffer operation:
> > +        - Automatic transfer of register data (transfer from the
> buffer
> > +          register to the timer register).
> > +    - Trigger generation
> > +        - A/D converter start triggers can be generated
> > +        - A/D converter start request delaying function enables A/D
> converter
> > +          to be started with any desired timing and to be
> synchronized with
> > +          PWM output.
> > +    - Low power consumption function
> > +        - The MTU3a can be placed in the module-stop state.
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - enum:
> > +          - renesas,r9a07g044-mtu3  # RZ/G2{L,LC}
> > +          - renesas,r9a07g054-mtu3  # RZ/V2L
> > +      - const: renesas,rzg2l-mtu3
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    items:
> > +      - description: MTU0.TGRA input capture/compare match
> > +      - description: MTU0.TGRB input capture/compare match
> > +      - description: MTU0.TGRC input capture/compare match
> > +      - description: MTU0.TGRD input capture/compare match
> > +      - description: MTU0.TCNT overflow
> > +      - description: MTU0.TGRE compare match
> > +      - description: MTU0.TGRF compare match
> > +      - description: MTU1.TGRA input capture/compare match
> > +      - description: MTU1.TGRB input capture/compare match
> > +      - description: MTU1.TCNT overflow
> > +      - description: MTU1.TCNT underflow
> > +      - description: MTU2.TGRA input capture/compare match
> > +      - description: MTU2.TGRB input capture/compare match
> > +      - description: MTU2.TCNT overflow
> > +      - description: MTU2.TCNT underflow
> > +      - description: MTU3.TGRA input capture/compare match
> > +      - description: MTU3.TGRB input capture/compare match
> > +      - description: MTU3.TGRC input capture/compare match
> > +      - description: MTU3.TGRD input capture/compare match
> > +      - description: MTU3.TCNT overflow
> > +      - description: MTU4.TGRA input capture/compare match
> > +      - description: MTU4.TGRB input capture/compare match
> > +      - description: MTU4.TGRC input capture/compare match
> > +      - description: MTU4.TGRD input capture/compare match
> > +      - description: MTU4.TCNT overflow/underflow
> > +      - description: MTU5.TGRU input capture/compare match
> > +      - description: MTU5.TGRV input capture/compare match
> > +      - description: MTU5.TGRW input capture/compare match
> > +      - description: MTU6.TGRA input capture/compare match
> > +      - description: MTU6.TGRB input capture/compare match
> > +      - description: MTU6.TGRC input capture/compare match
> > +      - description: MTU6.TGRD input capture/compare match
> > +      - description: MTU6.TCNT overflow
> > +      - description: MTU7.TGRA input capture/compare match
> > +      - description: MTU7.TGRB input capture/compare match
> > +      - description: MTU7.TGRC input capture/compare match
> > +      - description: MTU7.TGRD input capture/compare match
> > +      - description: MTU7.TCNT overflow/underflow
> > +      - description: MTU8.TGRA input capture/compare match
> > +      - description: MTU8.TGRB input capture/compare match
> > +      - description: MTU8.TGRC input capture/compare match
> > +      - description: MTU8.TGRD input capture/compare match
> > +      - description: MTU8.TCNT overflow
> > +      - description: MTU8.TCNT underflow
> > +
> > +  interrupt-names:
> > +    items:
> > +      - const: tgia0
> > +      - const: tgib0
> > +      - const: tgic0
> > +      - const: tgid0
> > +      - const: tgiv0
> > +      - const: tgie0
> > +      - const: tgif0
> > +      - const: tgia1
> > +      - const: tgib1
> > +      - const: tgiv1
> > +      - const: tgiu1
> > +      - const: tgia2
> > +      - const: tgib2
> > +      - const: tgiv2
> > +      - const: tgiu2
> > +      - const: tgia3
> > +      - const: tgib3
> > +      - const: tgic3
> > +      - const: tgid3
> > +      - const: tgiv3
> > +      - const: tgia4
> > +      - const: tgib4
> > +      - const: tgic4
> > +      - const: tgid4
> > +      - const: tgiv4
> > +      - const: tgiu5
> > +      - const: tgiv5
> > +      - const: tgiw5
> > +      - const: tgia6
> > +      - const: tgib6
> > +      - const: tgic6
> > +      - const: tgid6
> > +      - const: tgiv6
> > +      - const: tgia7
> > +      - const: tgib7
> > +      - const: tgic7
> > +      - const: tgid7
> > +      - const: tgiv7
> > +      - const: tgia8
> > +      - const: tgib8
> > +      - const: tgic8
> > +      - const: tgid8
> > +      - const: tgiv8
> > +      - const: tgiu8
> > +
> > +  clocks:
> > +    maxItems: 1
> > +
> > +  power-domains:
> > +    maxItems: 1
> > +
> > +  resets:
> > +    maxItems: 1
> > +
> > +  "#address-cells":
> > +    const: 1
> > +
> > +  "#size-cells":
> > +    const: 0
>=20
> Why do you need these two? There are no children here.

On the next 2 patches children added. Good point will move this to next pat=
ch.


>=20
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - interrupt-names
> > +  - clocks
> > +  - power-domains
> > +  - resets
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/r9a07g044-cpg.h>
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +
> > +    mtu3: timer@10001200 {
> > +      #address-cells =3D <1>;
> > +      #size-cells =3D <0>;
> > +      compatible =3D "renesas,r9a07g044-mtu3", "renesas,rzg2l-mtu3";
> > +      reg =3D <0x10001200 0xb00>;
>=20
> Order of properties: compatible, reg, then the rest.

OK, will fix this in next version.

Cheers,
Biju

