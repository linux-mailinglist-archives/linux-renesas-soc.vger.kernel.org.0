Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E6CF666C0B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Jan 2023 09:03:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239591AbjALIDx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 12 Jan 2023 03:03:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239703AbjALIDN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Jan 2023 03:03:13 -0500
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2103.outbound.protection.outlook.com [40.107.113.103])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A46848CC6
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Jan 2023 00:02:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I5acKcmTTWmNfoZsTUFQzOUDgXrkk//GSHbQ+Q98iIyqp2n3vz9FAw6UKnKxN6zzltzsSCTKhK6KPS9uv4To8TE5rPUMTnqZvdK3SaxEnaxnlC9zoV1pw0NFTl/HTopiAl7w6IPipHmn8tjkqtmrsUi3mu+mHsLkcSZwWgd/I0JlBV66yv/v63oeSY3eK8oUVbmLuYQk9iTvA/GIjGi8Mt2mZwtdr0UNDhru35J0aXzup/ykhEAbcADIirPF4n9HIoRR2VELwCoZyG89taLqq7psIKPdSgKz38tKTMFrPkrsdUbbi+q5MS3xthQk7Espk90dqjs5rQ4KtIw2jvq/aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n4qNFRQ9Ov0krlTIabHpEHh9u3OOvUKhvZEkzSxQq2c=;
 b=gTdV0WSOp0AtonFrLWwaXfrE2/ZeEtGXG9Q2Q+4lKGBi65AJJqz7u4uXQ6SqlPdl+D7YVX5pfKG0Z5bXEiVTDRDxZmIXQxC5fTchvYs65awgI8SVkrPdDtHdP1Z40Jw5d6zJ30IsR78uGzSWfoVDOpRxOXlPKRzdpzii6gnsjau2DCg3eJpcNJyg1y712FFEBzMc5UKRFz3j8nuQ+OpSW4q+apQQx3XwjOh3bPx/mcez+eXK1XYfdCW7yUNX2D8Uhb92dmNX4LP0GRVVxdI6PQ9p7azYOCQ+8IJf1ofzjLYZKlAsfTf6mUgGQg+VUXqUbwOMRz7jJGdqmIMlTrJRFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n4qNFRQ9Ov0krlTIabHpEHh9u3OOvUKhvZEkzSxQq2c=;
 b=j23I19PZ+CEQAUwxnZa8qq6EJFGKiFjyzgvv/c76HNlodL+wvjj+rzhoLtB3auHtUBVylkiGyPiEGQOOdy6QJ3lxRsZGyr/lB4jFLk2A90aoa54y7LYRoITq9XEchK7lG1Ufh6rFSKzd6O6AdVDBq8Hkco6U+C0eejPFLKdgY/M=
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 (2603:1096:404:8028::13) by OS3PR01MB9415.jpnprd01.prod.outlook.com
 (2603:1096:604:1c6::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Thu, 12 Jan
 2023 08:02:09 +0000
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::3e61:3792:227e:5f18]) by TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::3e61:3792:227e:5f18%8]) with mapi id 15.20.6002.012; Thu, 12 Jan 2023
 08:02:09 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     "magnus.damm@gmail.com" <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] arm64: dts: renesas: r8a779f0: spider-cpu: Enable UFS
 device
Thread-Topic: [PATCH] arm64: dts: renesas: r8a779f0: spider-cpu: Enable UFS
 device
Thread-Index: AQHZFehjzUyxezh+wUaozJDZb2c0uK6ZhSyAgAEDAgA=
Date:   Thu, 12 Jan 2023 08:02:09 +0000
Message-ID: <TYBPR01MB5341E6C6A0FF0D2B69B879BCD8FD9@TYBPR01MB5341.jpnprd01.prod.outlook.com>
References: <20221222093252.3613915-1-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdW7LT-JNH-iPACLQfdS=oh_g-y2OXW-1R4xM5s+jWnUUQ@mail.gmail.com>
In-Reply-To: <CAMuHMdW7LT-JNH-iPACLQfdS=oh_g-y2OXW-1R4xM5s+jWnUUQ@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYBPR01MB5341:EE_|OS3PR01MB9415:EE_
x-ms-office365-filtering-correlation-id: 08d939e1-0533-4498-d1a1-08daf4734de3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IaJ8UARpXd81H1s+cUMP6Ok2VvS+x1iwCQSpxHk1Qgs6iByrxD7904x+xI2s4osWc6wmX0MmzllpiDDHhkLyQqxj69sQqP4vPqJQladEF9Q7nyf4trLuvsr62dGKQF2fXFh1HYQ6t7kKCHRAfqDaRv5EFWySEGmgW6aUpXL1CwjIgBIFjRTqKyzp6UvamiLBptmi2cJ0eLdYOa0SoJjwcEKer/Y0ra4kHC0ms0UzEPe4CmylZPbZPIfuJwiaLvfi7CDAu7kb1r25DaOwRN7aCvbUX2iqoQOMy+ZFOvHhNkCKYEjDJeINH1CCivULESCfCzMAkx+OC5UevMHuA3SvyIkBAf6CBt+RlY98qbSceG7cVCl7+wbSKkQl66EFTUyonOP6d+hTG6U5lqk6zc8lymHmNr1IcL58UKYbrc6NWRJarWSXccxJbm9GM8ZULJg7OsvP3CaI4mIJrdeA6ltizJIZAoEiOgO0NLONKdmuNcFspVR2MUsM4TrXwaV7lpZMzXWHKS8hrVOyEJu6y+Up1Dkc13Tdm6EKVNDUbtw+AeF7Xa3/wlccquGRsuoh5sGaX1ydJz/ubOxzFvLHOwwq88dSaqp6mRYbwjoK9WdYFQUEu8VZ3YxCkW5KgxWAulx/hM/TIzEfpj5PQ5zun3SY4YcZtaYx84O1Fma7FcE5k2mSWr63A1bD3BN284GqcHYZ
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5341.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(366004)(396003)(39860400002)(136003)(451199015)(2906002)(83380400001)(33656002)(478600001)(9686003)(66446008)(66476007)(64756008)(55016003)(66556008)(66946007)(5660300002)(52536014)(8936002)(53546011)(122000001)(26005)(186003)(6916009)(6506007)(7696005)(41300700001)(38100700002)(8676002)(54906003)(76116006)(86362001)(38070700005)(316002)(4326008)(71200400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?SGcL8mBb9Va3IRAnWQhFRVuFacZohhqaKmGxPiXyc/jSNYuaf5wcVwGI+bNO?=
 =?us-ascii?Q?suD5l3rdjcNAIdl6SEZtmb+aI4hLw8KckM3GIQO6DQ2rW7EijumcSWeBLSEg?=
 =?us-ascii?Q?dq9yqG56hKhusGwBEQNBuwS3DQ+XnoQT087Ueck0bdjevIfRw2eQMg/e7RWx?=
 =?us-ascii?Q?baoY40E0wQ/99G77rtyPUBTyvEL4MKMyZ/GybDd/4HSYUH9Xu/ycChuZ8AwV?=
 =?us-ascii?Q?YZMh6rTswgLINUIW3ZcTh/QodiP5SkXB7yYhWKaJy+V/a6Ld6iTpBUu4tsga?=
 =?us-ascii?Q?DEu0dagsvIEeU003bT3XBxqQAiSTgFmfEx4sAOt6rcQ1m/QTtrdCq8QRke98?=
 =?us-ascii?Q?y88o1N2ITpNTGAGXNV144VN1aVPlc65KWqV1KgglL+SfdVP8c1qrONYhrekW?=
 =?us-ascii?Q?rR3pDWKCeYLkS4aVQnDHGGL7OL1hpUOQn7XW0PVlgFmBGEUWNoZDNSPMgoy2?=
 =?us-ascii?Q?j+OKRnX8w0EE/6Di0ufg2qSBZlIdYYGhMHiUFqPGsy1UK4CJBYh3yixeIwmm?=
 =?us-ascii?Q?4CrhfE6QeeihBAcabx4V2YS1X3erENlsNgjzbgU1NUtoxNfc3sTIYxLQj0h4?=
 =?us-ascii?Q?LG+kJIItxJwawNczoiKXjXYBRSt6n502BF55qwxJs1ohOLIAGz5kxNlzWSIt?=
 =?us-ascii?Q?57kIRbdMqyljdO0wKjcweyHQIJ4ANtq4tf3YggQvlbW1sJS2saJLbww0Z6O+?=
 =?us-ascii?Q?Cv8znY0DyywtnMdWS6TguIIGjdejuZuiWvBbCv/5C0IfS5Wy7ViRCAJ/LtXs?=
 =?us-ascii?Q?SOdINOElV60ar01te9PwzQZPHrer+i86YSvf/38es33CuTIOgToQD/onMXCE?=
 =?us-ascii?Q?d1vInQOzhH3/H0gyTy5euMjYPO6nCdsAzHsX9um1c59AWUEVfy30Ua5zriGn?=
 =?us-ascii?Q?3LG9/Yk9fJ1GufFOdM4ebY7yemcVG21z3Sn9sdHjLm6xpgJdJLFicP1xRDBI?=
 =?us-ascii?Q?J010AfOBU7XPMHdkY+CM+D7DLuk4JL7fQzSwQ84CPt4+NncrnT1Lav453iLk?=
 =?us-ascii?Q?E2K7J0+RoNs365jIFnWFKNsx5hHVIIdeV1GFCoiKc5d9Jnvti/hqjcC64BGx?=
 =?us-ascii?Q?avQD2wSE8tPt3ztS2QBmwuSkWKYm0fGJmJ0p82bo7Ewq4BPHrcD2lbPgdedd?=
 =?us-ascii?Q?UiA1aG8CXE/JHJGNsznEKe8beqSzdgN1MmUqqy8CwDYAb1FgdwA8+HcDkouy?=
 =?us-ascii?Q?camfb4fKlr2v/CBYuO1bAKvMPvFeQRcJHfYLXXRkjxPxK7kQWALItbIIU5eJ?=
 =?us-ascii?Q?NtUrz7gYo6Vn3E2XmAxLHM9Jh0oMKDJv0CY85tZ4R0RnWaXC0NIi2KQOUThZ?=
 =?us-ascii?Q?QLO4nmgUyYKxZfspGF1vw6cudk0EMunTn+I5mrw3kXJpaR/Ei28ea6aq0xCN?=
 =?us-ascii?Q?RgA9xYmgWyaTEu3rJQArkp3fOdVb5xVwJlGxi6DVh92CJmsYeRTM/3oLCK6L?=
 =?us-ascii?Q?hj2ygGd+rEQPXG8WmbIDAvGx55pga2Sy4p9RBSV6COT/yeUBoRzJvDcY/UH9?=
 =?us-ascii?Q?VE0SPSV7/IV+In7CpWL5XIXdG2rmFj6P8XPIuHwg/gJgxq0uBdTevqXP2Ui8?=
 =?us-ascii?Q?ovuwp+FYSM7DOvE8+4tVWxPIAu3nxrs4IQaHT57ia09EGftUXcCwoe/iEcTB?=
 =?us-ascii?Q?+A=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5341.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08d939e1-0533-4498-d1a1-08daf4734de3
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jan 2023 08:02:09.1382
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: psfaDd+jUzjTsBdZMzS9MLCLIRNxirzses9N8/Bxb2IjAImJjvH2zCOKEkwyIg8iRB4SKveYmaY4G0KzXacoHnudG2E2ES04A6ZcHdu0+suPaR+jocaiuKgWMdheuXrY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9415
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert-san,

> From: Geert Uytterhoeven, Sent: Thursday, January 12, 2023 1:20 AM
>=20
> Hi Shimoda-san,
>=20
> On Thu, Dec 22, 2022 at 10:33 AM Yoshihiro Shimoda
> <yoshihiro.shimoda.uh@renesas.com> wrote:
> > Enable UFS device for R-Car S4-8 Spider CPU board.
> >
> > Note that the conditions of RC21012 on the Spider are:
> >  - OUT11 (for UFS30_REFCLK_V) is disabled as default.
> >  - OUT11 is controlled by GPIO0 pin.
> >  - The GPIO0 pin is inverted sense (low active) and pull-up enabled.
>=20
> Thanks for your patch!

Thank you for your review!

> > To output the clock, pin 4 of TCA9554 on the Spider board needs to
> > output low level so that using "gpio-gate-clock" for it.
>=20
> Does this mean the GPIO setup was the only missing part,
> and the i2c commands from [1] were not needed?

You're correct.

> I wanted to give this a try, but the remote Spider is offline.

IIUC, Morimoto-san is preparing a new remote lab now...

> > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > ---
> >  .../boot/dts/renesas/r8a779f0-spider-cpu.dtsi | 37 +++++++++++++++++++
> >  1 file changed, 37 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/renesas/r8a779f0-spider-cpu.dtsi
> b/arch/arm64/boot/dts/renesas/r8a779f0-spider-cpu.dtsi
> > index 25b34d66061a..32625afc74bf 100644
> > --- a/arch/arm64/boot/dts/renesas/r8a779f0-spider-cpu.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r8a779f0-spider-cpu.dtsi
> > @@ -5,6 +5,7 @@
> >   * Copyright (C) 2021 Renesas Electronics Corp.
> >   */
> >
> > +#include <dt-bindings/gpio/gpio.h>
> >  #include "r8a779f0.dtsi"
> >
> >  / {
> > @@ -32,6 +33,12 @@ memory@480000000 {
> >                 reg =3D <0x4 0x80000000 0x0 0x80000000>;
> >         };
> >
> > +       rc21012_ufs: clk-rc21012-ufs {
> > +               compatible =3D "fixed-clock";
> > +               clock-frequency =3D <38400000>;
> > +               #clock-cells =3D <0>;
> > +       };
>=20
> So you're modelling the RC21012 output as a fixed clock.

Yes.

> I guess that's acceptable until a proper driver is available.

Good!

> > +&ufs30_clk {
> > +       compatible =3D "gpio-gate-clock";
> > +       clocks =3D <&rc21012_ufs>;
> > +       enable-gpios =3D <&gpio_exp_20 4 GPIO_ACTIVE_LOW>;
>=20
> Perhaps the "clock-frequency" property should be removed using
> /delete-property/?

I see. I'll fix it on v2.

> > +};
>=20
> Alternatively, you could have kept ufs30_clk as a fixed-clock, dropped
> rc21012_ufs, and added a gpio hog.

Yes, I had tried using a gpio hog, and it also worked.

> But I do like your description, as it clearly shows how the GPIO interact=
s
> with the RC21012.

I got it. Thanks!

> The i2c part LGTM, and is identical to [2].

Thanks!

Best regards,
Yoshihiro Shimoda

