Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4622757C96A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Jul 2022 12:58:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231225AbiGUK6L (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 21 Jul 2022 06:58:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230149AbiGUK6K (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Jul 2022 06:58:10 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2090.outbound.protection.outlook.com [40.107.114.90])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1CF47E808;
        Thu, 21 Jul 2022 03:58:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iWDtycTH7DroLKGEgS4Qowe8ksSSx0kADVjompv2YXQphSC/Ingbhhcbl0HYzM6J0DTRcshSUqL369jFgusG/KLzxmY8wm8ymM3dsDKbUbcpNUHXTaoX+A7uGzfBsZSXyJEgN4X0gujkNBOqUYTk+ytKgQ0IO/0tMbjWjD9NXSFKW6C761Pf8C4c02DuwldsY9BzoE3OlbuonEC/p7wZwqY6WRUJoxgorTw/1KQn2Xl3iePR3DgYduB8q+/+c8wWr+bFOfSmBkuSrVFIKTXHnrVqG0qM+YTBWOs0TAVgD+vnCK4EHKJXhRXk4fQPPn59PJdgogks84xS2tK6t67Spg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wakvlYgBpx21wSdQ0j6cuptM8oSzt7hx87cmOBYiMr4=;
 b=GvO6M7s6FaB5KV3KIsjKriAm5f1eLxPlI58mYKLprjmD1S25/5fSo5elan4iidCdt9ejSjEzfGmeSmjJNNco9eJm28P7mWCQ9Vz9wlHvFIJAn4RYMR9wmb+fbL8AqOYoy2jUYb3Kc6T4llms+zPhWzrTE52nyfmP1nqTaLmHLh9HDIDZ3/VlTaeGjYTkjgBwhsaQ2C89hCkvJZualZCLF6UDa6VYfhfVy9iq6oCy97fBW7E8+FTQ4Gzl9r04zyPWj7GnVaVTS99m+BZoUzttT0L6C/DkBDt0ccYN0t8fQ1+c7apvaK+LLTvn4msUY/s6ntj6kcsIOU2kN8ze0Kue4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wakvlYgBpx21wSdQ0j6cuptM8oSzt7hx87cmOBYiMr4=;
 b=V34FbOa1aQXmV7qCyjJZfC+jg8H6n0a47P+p8N6/lsInUHyUv92l4dGnIhDbkTR4r1HQ0booVvqrWU7dZpQ0bq4dSuja1PZ0+o0BWg3qo8i/8t/REFxFuTnnWNdECrTK32pXfUS7ZIHtf6lhOFJSbP2Tx4V1DLoVIKpr9GGPEXA=
Received: from TYYPR01MB7086.jpnprd01.prod.outlook.com (2603:1096:400:de::11)
 by OS0PR01MB6116.jpnprd01.prod.outlook.com (2603:1096:604:c8::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Thu, 21 Jul
 2022 10:58:05 +0000
Received: from TYYPR01MB7086.jpnprd01.prod.outlook.com
 ([fe80::3c36:680f:3292:4a79]) by TYYPR01MB7086.jpnprd01.prod.outlook.com
 ([fe80::3c36:680f:3292:4a79%9]) with mapi id 15.20.5458.018; Thu, 21 Jul 2022
 10:58:05 +0000
From:   Phil Edworthy <phil.edworthy@renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>
Subject: RE: [PATCH 1/2] dt-bindings: usb: renesas, usb3-peri: Document RZ/V2M
 r9a09g011 support
Thread-Topic: [PATCH 1/2] dt-bindings: usb: renesas, usb3-peri: Document
 RZ/V2M r9a09g011 support
Thread-Index: AQHYmqydoo0CM3aRukCI8TxnX3l0a62Iq2SQ
Date:   Thu, 21 Jul 2022 10:58:05 +0000
Message-ID: <TYYPR01MB7086C4389AFC26C87D1C402BF5919@TYYPR01MB7086.jpnprd01.prod.outlook.com>
References: <20220718134458.19137-1-phil.edworthy@renesas.com>
 <20220718134458.19137-2-phil.edworthy@renesas.com>
In-Reply-To: <20220718134458.19137-2-phil.edworthy@renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 54d6f6c1-0f4f-46e5-ccdc-08da6b07e3a2
x-ms-traffictypediagnostic: OS0PR01MB6116:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vjdMUCdj7t6gM+LU6+XV5v+KLbwPaSLwQmoHovdhkflhLrh4wwXz/zKDg+amvvf7BayjxDe7A3lGv7d9Xt/TiciFoQ8u+8pS7ZwSwSV5kwoipNdjuO4OvnkXK+SvtIRgSHoeXFIq1xx1HIgWK1aNUryc2GjZ2OLy4oraAEA/lGY75zja3PKiL0WN5tbuZP2AuPJKFiPgtKn9Nzu8BzpleaI26DT0OPUQ9hKbfixioKLKWa0pJg13HZGbxQqh5Uh+9SQfxnmhWdeackTDUAfqrI7KzckQsrwBgBLgJ92e8Wv4wE0mPXsSfAFrzhQ2pkU8wkikyng3iFxPx+CXzHTN5j8rScFjSx2SsrllLG7RVLK4I0UTq9MqMvc5AtZ6xcPvbeo+GUc4dCL/W2c2xWKny0lZIiBh0gjSxCN8mpzY4mDPBdhPBQENyNyi17onWtzO6sYqdmnX4gZ952drc1zzEX4/rxTAtmC04ddYEIR2LQ81u4I/91wxRPYCVYfme1uDE8CAhQs+6QsM3K5E9KetaKcR4fpVmiOdsCu7pS1QjtbqJvd9+usUq17XI0U7zpwr93lDGYBkucE56Mpk2kLKZUNP4FMRgOyvn8tbKV20zXYdiC+SAYgk81Cs/tsDXIt3m56hNT+2P3cR3JAtw4TwII186wPoQLtVoxY14Grvp8oRQzzyDSwb0Une9sLiO8ZtSwfVDrhEKVIrX2f/UXo9U9Jo2lq6j0+BQafPesPJ7HooQZNSkzOkwj5EZZzMbr15viwU/n5dA9KcGm9wPT966mYDIRY8NdnAJskC3FahXk3FjJ8f3ueUwb9W2RjEm/x5
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB7086.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(366004)(346002)(396003)(39860400002)(136003)(8936002)(5660300002)(4326008)(76116006)(66946007)(52536014)(66476007)(64756008)(55016003)(44832011)(66446008)(7696005)(66556008)(8676002)(2906002)(54906003)(83380400001)(38070700005)(33656002)(86362001)(122000001)(38100700002)(71200400001)(9686003)(110136005)(26005)(316002)(107886003)(53546011)(478600001)(41300700001)(6506007)(186003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?zLUnuyKROJ0h4ahhL9acCYAmRsWwonRiJvda3AqI6DSMAvAieDAU7SGGF5FC?=
 =?us-ascii?Q?eUU1udL3qLg2syz9IgL0UJH7rQ34sHC+XK+p0XjPoWfhZvOVr7NRovb7u9f8?=
 =?us-ascii?Q?bJU1tR8/YUOR8nS+brWrtHfm5RdWj2SnZjUa7eBeI9WzwBPltgMi/8jUsBcl?=
 =?us-ascii?Q?Jf4w0pTrRjR5CpJIGln1lwtSxVTuAQbXn64wolwbseyqtZdSCWaAJTjNS1tO?=
 =?us-ascii?Q?mgk5XcA5eJNQK2/W4H9cDN0tasCCVEbcOrWxPPs0KO4JG7HS3SoSdWhP7jKY?=
 =?us-ascii?Q?Q8zTLR4KKQc1A74sJ3CsnR5DVfyP3qLbRoY9C7gQ8BA6JdM4dXcm3rbGjvV/?=
 =?us-ascii?Q?jfLoaTQfHWrMcvymSnLtvCvYgXwIUqzxvRzdiYLmnExj7YaNh3j4wNzLoE/S?=
 =?us-ascii?Q?zoGcijov5Eijk/fsqHNcVSccTFMA1RBO8jSoPO++803VLSjM5bqj1FKSft8u?=
 =?us-ascii?Q?i4LuS5YfY++fFTyqd84em08MZTR0iWTnGRAC/3drFzBk3Df2Giaoy/bNJ3qr?=
 =?us-ascii?Q?5gobTRWET5y/8O2gTPMO3M9Z3/dGhjsUuyYa+zS2KEtXVb2s6NvefprOvUJZ?=
 =?us-ascii?Q?Jx6IntpabQasDwSIm7cqSI2Oia8KOW+1A3aHLftmkHEuFWdYbFoatt1LALHO?=
 =?us-ascii?Q?6R9LEFObE0tbR2ztmvMlDngXtu9sW5OABZsOI4E8moY4KZvmrP8cYb9llFga?=
 =?us-ascii?Q?NTBZgI8/1fJycx0UELzto0d5Xuf0iwh7JLaQRVo8UrTaTwpGDM2PXTysaGUT?=
 =?us-ascii?Q?3eZvWJcu1quUf0twMXBfzthZ/rXL0h8wscuTKTTMpNeRzV+gOp3/+uc+jjMV?=
 =?us-ascii?Q?cmhl/kisgF4JIlLIBdRRMwuvp9WxJ424r3TKmmvCYdz1HdVl1P8iAE94NSSC?=
 =?us-ascii?Q?OxAC4fRWmEvypxNEAeLCxpJKgOxI7yeoyFV55xcEB7CYdtzvOcMCT/xeP5M9?=
 =?us-ascii?Q?bYhiY6alXYyCk5G16igsDU1UMLTKEtloxKF2odPVBCUGhCIUchpD/Pp5bZxq?=
 =?us-ascii?Q?rgc05CThmVgVlD+Vn8Pyjra3IJwGt+CehVVn5XsiachI+gpapg1ZS4qVHdzG?=
 =?us-ascii?Q?PILhBJTj4TgHaBx1m6tNUYEyJmGDDOiilAQ7GP+WhN+JrUVh0ncU/GPXjGcZ?=
 =?us-ascii?Q?5jsxg9bFy6Tm21RvrwXioO8dzbhQEHz02NRUpeWpB9q2lZw5nwBUJ4M6rOu3?=
 =?us-ascii?Q?8CEetI8ppHQf9iifedvASfzYJfnH+IM6dAaTWSS+Z4xyRLUr8MlmsnWVO5on?=
 =?us-ascii?Q?GYF8DfZOBWg/afPXrT6AWlZACb8Rq/j0UcWm9hOmZcop48AGnOg0J75WXzZU?=
 =?us-ascii?Q?G5ueAZJ2Dly+LRc5VoO1uNky/lxae5fiz6EaJh9u+KNRbfydTNG6cyAMg7+V?=
 =?us-ascii?Q?ywP2OnmY6IKJhNMDbaWiPrnglZgQZwOot1lHvrPjw1mRQZ4DytiK3kaKSP5I?=
 =?us-ascii?Q?JyTrEbecgX10kN/jt5oXFEct3ctmzq6epix3zqwtoZtwOMbTptiASlJIzKOP?=
 =?us-ascii?Q?F+IS2mVH34J/IY0PLo33+PwO8rdZ3eFadojm3MEhJT6Rw7T9iNXQXZFICuA2?=
 =?us-ascii?Q?UxM6LkLRtzv1q2QLAQmAXXwDqObWtOHFJND9qmfiIhowHUvpAgAJ5nwQT5U9?=
 =?us-ascii?Q?iA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7086.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54d6f6c1-0f4f-46e5-ccdc-08da6b07e3a2
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2022 10:58:05.3918
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DxFuCk7IsfcpW3/QVZeQ9Y1SfU41hULBcCERZx6/BY77WA7xftn68Q7nB1jf4sMTkjy689X+94T/OWqxH9694CAf0AA/GBPRGV2k81HxSEk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB6116
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi

On 18 July 2022 14:45 Phil Edworthy wrote:
> Document the RZ/V2M SoC bindings.
> The RZ/V2M SoC is a little different to the R-Car implementations.
> A few DRD related registers and bits have moved, there is a separate
> interrupt for DRD, an additional clock for register access and reset
> lines for DRD and USBP.
>=20
> Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  .../bindings/usb/renesas,usb3-peri.yaml       | 81 +++++++++++++++----
>  1 file changed, 66 insertions(+), 15 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/usb/renesas,usb3-peri.yaml
> b/Documentation/devicetree/bindings/usb/renesas,usb3-peri.yaml
> index 9fcf54b10b07..28f785dd2012 100644
> --- a/Documentation/devicetree/bindings/usb/renesas,usb3-peri.yaml
> +++ b/Documentation/devicetree/bindings/usb/renesas,usb3-peri.yaml
> @@ -11,27 +11,49 @@ maintainers:
>=20
<snip>
>    interrupts:
> -    maxItems: 1
> +    minItems: 1
> +    items:
> +      - description: Combined interrupt for DMA, SYS and ERR
> +      - description: Dual Role Device (DRD)

Note to reviewers:
I have found two other interrupts related to DRD that need to be added
to the bindings: "Battery Charging" and "Global Purpose Input".
These will be added in the next version.

Rgds
Phil
