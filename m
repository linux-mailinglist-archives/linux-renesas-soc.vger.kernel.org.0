Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EEFFA63ECCB
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Dec 2022 10:46:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229612AbiLAJqB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 1 Dec 2022 04:46:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230198AbiLAJpm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 1 Dec 2022 04:45:42 -0500
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2099.outbound.protection.outlook.com [40.107.114.99])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6637E193;
        Thu,  1 Dec 2022 01:45:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FbMpTRXVaxzlqy52s43bZHkSyzI3RzGarDwOxvwkhBUA2EzZLGP2DZY/Y/VI14FwF04cxTxKLyIQn4jD473VuqY6TSxJzXqxYMArPdeojfZhN5a8XFZcVyQKQiHtjVu3jBaaLFsaiIWO7Z14ABMqvVVP/Q+BPgFCdtM6spJJseVfbH5su8FvfcBL2mQBydX4Ruc9qqYahbgs86dBW36NeHAtOduHJBMwZS+lW/pM1fIgvjshYkCgK7IsdbPpVWO8Hb8KK3DH3O1HRDJU9ks8oFZEei8Nh5wv8ES0+wVVGVEthMFCdQlT3OOzu6hCCfrsBWrfVrFhdtjdMefJHLp73A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y4RLY6+NeEE/eUe5Kb4FhcZ4r9CMnudJu8kQOMm03rs=;
 b=XRg3Qgv02Vody7JBfoqgJI+F7xBht2HqO3rM/aqgrfcOH1t51/Ths5BEdHuGBF1i6+mVVPbaeM3e9HPUeXaalK9YTo2twnVUUFA1srNmmsn42SPt6D8exDfSnZEVaQgerrGDXyk48O13cUvc2YCZSANX/XyKy7vrcMRWjRqImyvIUhUQ51A6Nq9AMsgKQJ18yVv7ciTz5MTni0hFKUzx47S8sAxdNCkf1oVUO38L69kplf275pfke+7CI4XtIEQ2VnFVVf+KBqHoIaYQg6yVxMZPvb8UE9sS5owvEZ+CiYkhNBArEKLNYnHvyGz1UL+I1EoUGugGDQ+v9p5PJjceUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y4RLY6+NeEE/eUe5Kb4FhcZ4r9CMnudJu8kQOMm03rs=;
 b=TqYphFU1Tg5fHoGZTQlmC66Gip9yC1S9CLNslesFiIB7PnMrNHbrNHQ6xx6bOcMg0RpR+MjUST87gLrAeABepfSa/tZCvA4ZbQp1fVoysyhGVdyBCVll2Jy5AzRqc3RKFC4pyXqNi0Plp1kXSW02b2aEqcIeWw7rjkAz2rDhWfM=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYCPR01MB8756.jpnprd01.prod.outlook.com (2603:1096:400:10f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.8; Thu, 1 Dec
 2022 09:45:39 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::2cfb:38d2:d52e:c8a3]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::2cfb:38d2:d52e:c8a3%5]) with mapi id 15.20.5857.023; Thu, 1 Dec 2022
 09:45:39 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Rob Herring <robh+dt@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: RE: [PATCH] arm64: dts: renesas: rzg2l-smarc: Enable ADV7535 on
 carrier board
Thread-Topic: [PATCH] arm64: dts: renesas: rzg2l-smarc: Enable ADV7535 on
 carrier board
Thread-Index: AQHY/qRdHnnq9f6Pjk2Z6VVJLbhAZ65LVS6AgAAAlfCAAAWZAIANbl+AgAAAwQCAAAdKAIAAAoBg
Date:   Thu, 1 Dec 2022 09:45:39 +0000
Message-ID: <OS0PR01MB59225B4A413B6977B67CF97F86149@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20221122185802.1853648-1-biju.das.jz@bp.renesas.com>
 <Y30j7Q6Jc/y8mGTu@pendragon.ideasonboard.com>
 <OS0PR01MB59224A76B83B9A2318A8D4E9860D9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <Y30pHOylptuMxFgX@pendragon.ideasonboard.com>
 <CAMuHMdUjibk0FO0+Su5NbV-pgBhiYqVsjX6XM5Sg2nXyybA3YQ@mail.gmail.com>
 <OS0PR01MB59227AF03E84568B443C053286149@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdXL1pN6mhpYctsS+Kc8HUe=HCTn3yTxgmujOMNyxGBm8w@mail.gmail.com>
In-Reply-To: <CAMuHMdXL1pN6mhpYctsS+Kc8HUe=HCTn3yTxgmujOMNyxGBm8w@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYCPR01MB8756:EE_
x-ms-office365-filtering-correlation-id: 02ded5aa-7f9f-4118-f348-08dad380ce16
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yWxDDBgw3RFacf+62H8+NQ1rMuLao3PqCWBy8czSSGkz5k925EzradmAnL28ZUf8Yplspbo1CrSsKpqUEl1DHyW5eKcMmcB370b9su3ebJdojy/J0o1qYIjcHbV/hftm0eVdRDvwtCzDg3ZmOBD3+wG0grAhS78e42XFOkFxXV1H61U9Zr8MS/aS3CHvFta1Q7yaHXa+Jzn22clf+zY0kWoO8CoHWUI+3Ch9nSVMSEIzPWBbm8OHqoP6k5rwiG+LKVnxOUH5fkSSWrOaJe55DGBwxoX6DbDR4grwIddb67aUqSlGWsbfW20y0DkLXgDsKS9sjJgNRc8CnXfZADor/rxSeYTXAKGYu8RHWrwboylikoqpBRMHXkiAhooPEBp3mZAZaiQlM4N2iGssjB1qqL5oEx09MWMCtBk/6YSfhtcFIRBENL5yw0H4K6Eqkd79AT6Br8XL+bh0R6VxW1JXBrx6pWeQD2olbKfeJJ65OBbzt8L+/W14RyRXGuBStccNAT8652/y8wLFjaPTJo3LUxRnREl5S6B30G7a/Wo8O0PUvhkO+yQRnGRR75rGtwV6gar7/MKy6w3rDKltaeSQ/1CJ+yogyM4ZcZQVSB660LHuES/kqy8dn58mLAY7SYhLWjiSj3+yJPbsF2FxLfJzQ8ZDIyLcLq70zad5H8nH1HiacaKoLDQWeqrC5yqhlWLq
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(396003)(39860400002)(136003)(366004)(376002)(451199015)(2906002)(66946007)(66446008)(66556008)(66476007)(316002)(76116006)(6916009)(64756008)(86362001)(4326008)(8676002)(5660300002)(41300700001)(8936002)(52536014)(71200400001)(7696005)(33656002)(54906003)(478600001)(26005)(53546011)(6506007)(186003)(9686003)(55016003)(38070700005)(122000001)(38100700002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?vcjzVJmniC3aQhYV1IaB3//ReVgk/y6xh2lCfO5ZLo8i9d233N9domNQ7iwq?=
 =?us-ascii?Q?zGKNtWLlXOmUk/3oW4SZehro1WlDCP23y+S+GAmfEdM4fDrGCrgf8+10sQSK?=
 =?us-ascii?Q?QuWYQY9yHPxqb2G1k1kyUljyA21XuyJxRjmUbaT6nKACi/gEpP18s1qK9pTh?=
 =?us-ascii?Q?ddURuWXM+lGSuuvhUJ90FeqUymJ7W3i61Cc9QkrUHQlTSpQaJuQP2KVv9d1w?=
 =?us-ascii?Q?neVS/kKHaBNKh42vW1v8gvq5ctQX/XfE3u1X9cbq8NmMPBxxD529giF31r8Q?=
 =?us-ascii?Q?BIAD6gTpa+cYUT4YaBJgbDrZVKDm69oT/nVJF7LYOgaYeXPEMIYv+aReCax+?=
 =?us-ascii?Q?odI2TtEWMMA0AGW+glOsBPHQcmI5ydRF04dE1QsZJ4ujdiycau0xZ/7Ajrvn?=
 =?us-ascii?Q?Tk5yg0pZZTQWKWCbVIfe5gqoiTS3mrzVVvLVXsZkOv648VdmqoC8+1Z2ahpt?=
 =?us-ascii?Q?YZXoqbsLPvA3OYEOQbtDNHFFsx63IvwIvkXX9v9C2jfiQDPE2diTiJdDEZ7U?=
 =?us-ascii?Q?Se5MMtfGr5DGd/4ibSFQdPFKE0kgtRhbIjCUkIDziGC4pWCUYsb7lzjY3EB4?=
 =?us-ascii?Q?BAWnUjVbIenFuGviJ/JrKHfmxJWiZKIJuUoQ1Efe5SJW5EPT9TNa5oPJOOS6?=
 =?us-ascii?Q?d/0vj1I2CRRRHI8Da4uUQ4MGhhGTtX2PpUK+fF7KXLu20aNer1s8uT3Uw2fC?=
 =?us-ascii?Q?4RoazugbRotg2QURYLZX9byjDEHTaJv0azBxrFD9Z00IZHgS/e+bUGqGNq/2?=
 =?us-ascii?Q?6JAZ1DKCVqbW+nyqJUy1ImKDqWy+zFrNCniRMZnVufBzB7OdFsO/2cZl6EEA?=
 =?us-ascii?Q?pNH5sjGly6hNv7VAm4Gi0tOFiXnrxIZ1I5Y8hzF1mescfSF9ftN5ncxfZpMp?=
 =?us-ascii?Q?DiRwLLajR3qcL9MIcEXRaqe0avYZq9eNOGVG2mgl223zYHQDeLCzQchXLI6f?=
 =?us-ascii?Q?wbuqSPR2Y69xxGBjSFk9CUworkdyk9k2ZWluVAS7+5zqKxmL37HSfy91L98o?=
 =?us-ascii?Q?YBRS/UeuXAhkHt0hUPJDr0H2saYyT2jkwcVn+vRYJ8T+iU7XZW19okrfzHy+?=
 =?us-ascii?Q?CB4fFStKMIw3cTjh3vhog/BdOYIkzHKRY5WESp9gxKXtSD6wIMIELgAKx8rf?=
 =?us-ascii?Q?9ny2WKxfJFY9DMt1hrwyDJs5fopvaWNeze2YSe7qLMIS6Om+k22SRDiNWg0G?=
 =?us-ascii?Q?R/Ynvyy+lH5u64EEw72PTPdIg6xWqtKFhUJWuJnrAbdZwWTPNfnm+EcJUmPZ?=
 =?us-ascii?Q?fkbg9HwgpAt2E7jr0EfO3Nu0jJwbd6pWKRg1g4NeM2dKKVLG4yQJatuPAY6F?=
 =?us-ascii?Q?GMEzfmKB5v985uWqKx7A8uFdO9z4U5E60YofBJ4x6gUsv/jLiAl7T9+JGzHS?=
 =?us-ascii?Q?8KwJMG6wKpvOA63nVk1TUoxrgtqGwoijtjEoDQrp45At2ZyrCkXLRodVkdyH?=
 =?us-ascii?Q?Q0oF8Xle2Dq4cxDObHLqjYDM35p9HvBVT5sZYiSxmr/Xtd9RkTyxDN8l0uo8?=
 =?us-ascii?Q?ZZSVT5Guxo5/tR+/mnY/p3r1UBdv/joM+TMr6ZP3Wn8QEUXmBfm5umIIPdnE?=
 =?us-ascii?Q?vUrRB7nVH8qjdDrzyXJJSI9JcybnxpAcOLUq5d+N+kTSh/PYjfkWr6lH93MQ?=
 =?us-ascii?Q?Tg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02ded5aa-7f9f-4118-f348-08dad380ce16
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2022 09:45:39.2606
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WUO7qb6O3+/VCDLFTfIEMnNcjZi1h5kFLgTf5MOL6MLMiQa3dNaNKXgULtkDjJxST2M9B/0Dx0XhX1qvKDGq8nfH42HZj0scrcnjO6PCew8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8756
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

> Subject: Re: [PATCH] arm64: dts: renesas: rzg2l-smarc: Enable ADV7535 on
> carrier board
>=20
> Hi Biju,
>=20
> On Thu, Dec 1, 2022 at 10:20 AM Biju Das <biju.das.jz@bp.renesas.com>
> wrote:
> > > Subject: Re: [PATCH] arm64: dts: renesas: rzg2l-smarc: Enable
> > > ADV7535 on carrier board On Tue, Nov 22, 2022 at 8:55 PM Laurent
> > > Pinchart <laurent.pinchart@ideasonboard.com> wrote:
> > > > On Tue, Nov 22, 2022 at 07:41:13PM +0000, Biju Das wrote:
> > > > > > Subject: Re: [PATCH] arm64: dts: renesas: rzg2l-smarc: Enable
> > > > > > ADV7535 on carrier board On Tue, Nov 22, 2022 at 06:58:02PM
> > > > > > +0000, Biju Das wrote:
> > > > > > > Enable ADV7535 (MIPI DSI Receiver with HDMI Transmitter) on
> > > > > > > RZ/G2L SMARC EVK.
> > > > > > >
> > > > > > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > >
> > > > > > > --- a/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
> > > > > > > +++ b/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
>=20
> > > > > > > +
> > > > > > > +         ports {
> > > > > > > +                 #address-cells =3D <1>;
> > > > > > > +                 #size-cells =3D <0>;
> > > > > > > +
> > > > > >
> > > > > > How about port@0 ? That's the DSI input, I expect it should be
> > > > > > connected to the DSI encoder output.
> > > > >
> > > > > Yes, I will enable DSI node and link with port@0.  Since both
> > > > > RZ/G2L and RZ/V2L uses same Carrier board, I need to send
> > > > > binding patch for
> > > RZ/V2L.
> > > > >
> > > > > dts Patches for enabling DSI for RZ/G2L ready. But V2L there is
> > > dependency on bindings.
> > >
> > > That's just a matter of days, right?
> >
> >
> > >
> > > > > If you prefer both ports together, then I can defer this later.
> > > >
> > > > It could be easier to review (not to mention testing). I'll let
> > > > Geert decide.
> > >
> > > Is there any advantage in applying this patch now, i.e. does it
> > > enable any working functionality?
> >
> > Currently all display/graphics functionality tested with [3]
> >
> > The advantage is,
> >
> > 1) I would like to backport graphics and display functionality to cip
> kernel [2]
> >    as most of our customers are using this kernel.
> >
> > 2) we can test ADV driver using i2c read/write command
> >
> > 3) We can test ADV interrupts
> >
> > 4) This will reduce integration effort as we can test full display and
> graphics
> >   functionality with [3]
> >
> > [2]
> >
> > Please share your views.
>=20
> And all of that is working without port@0?

Without port@0, we can only test read/write from ADV 7535 device using i2c =
commands.

For full display functionality.

1) we need port@0 for linking to dsi

and

2) We need to link dsi with du.

Cheers,
Biju


