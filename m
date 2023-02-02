Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2EC9F688442
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Feb 2023 17:23:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229667AbjBBQXv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 2 Feb 2023 11:23:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232360AbjBBQXi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 2 Feb 2023 11:23:38 -0500
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2091.outbound.protection.outlook.com [40.107.117.91])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81D465898B
        for <linux-renesas-soc@vger.kernel.org>; Thu,  2 Feb 2023 08:23:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hst/y2/KpXQQqRgBmZ8xPOmqCjBwL/HwkVzo1TD/G27jLadP6S2LC+zmVAifWx1phv4g0MWffYk21QviW+/rTye0EUBmWgVFGiO05I7jB4wZGainCirrQfbV6mvPu79N/wCNFgNHLE3GvvBJWOEz8N6QKxgHk6eVPEdFokk83j4lC8BBWJk09m4+YA5xq/ui3OSa9LT8sNWUVQVQzgRdYK3Q0zYuD6pu5mGthUd+mxm1AbQpKXhrSKWqnKHT+Q7ThFtSDvEVArxyLos7fN+Uy9OUIah0cdOsAwhwPv1puzFKXS92zdABWYJuhjAYNwo1qEohB5Pj/3ofp4m+v1Aq2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+mE+0DLOf77jPkyAmFlVjjUxtR4nD8arjBEpOlbvaxM=;
 b=gvr2mh3hz7ecqCUJeLFjeFI2TvFAr6Y1NT2FIMso4j9qB7ZFH6U0GnRrV3mxzWxg5diArtpHEx3oIiPJrf4ylzd8stnJlg0bF68dQpfhZ7UBi7UDI7OKLCrGCSPfEZFlxgUt3X2RBszC/36mm9mmtoTV+F+HahnoK6Z55T/bPNWHdKHa3okBjzw2TMK2qhV4LinWcechShFGpdU3j12TyuO+7rdeV2VQt6oQ+bFOGW2PNcaqqeMmJS08pinBY3mdDTqELzPyHN+nfgydoxWHjbrZ7UUaMq+HDkc0824Hddq0N8KvLh8wWn+BOnWdDXF6Qmg6XDpUkAAQ9mG9zFjJng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+mE+0DLOf77jPkyAmFlVjjUxtR4nD8arjBEpOlbvaxM=;
 b=djaSy/N7IGUbIeynJzBrxP8fC08yHM8sh5q7yxJfZxwiyaoPZq9bYK86cKteleUdDYHb8JlJYjMYaW4Wlngq0+bwkAn0ipcYq0NbnQ4V0oEweUV92kmfjXbnaB8IPEN8S/X/MRfKd1rlX2nHPoqkdIulDBtf1x12ozt3AlMTLa0=
Received: from TYCPR01MB5933.jpnprd01.prod.outlook.com (2603:1096:400:47::11)
 by TY3PR01MB11177.jpnprd01.prod.outlook.com (2603:1096:400:3d6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.28; Thu, 2 Feb
 2023 16:22:56 +0000
Received: from TYCPR01MB5933.jpnprd01.prod.outlook.com
 ([fe80::9eb:3c9a:c2bc:af06]) by TYCPR01MB5933.jpnprd01.prod.outlook.com
 ([fe80::9eb:3c9a:c2bc:af06%6]) with mapi id 15.20.6064.027; Thu, 2 Feb 2023
 16:22:56 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Lee Jones <lee@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>
CC:     Philipp Zabel <p.zabel@pengutronix.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        William Breathitt Gray <william.gray@linaro.org>
Subject: RE: [PATCH v11 2/6] clocksource/drivers: Add Renesas RZ/G2L MTU3a
 core driver
Thread-Topic: [PATCH v11 2/6] clocksource/drivers: Add Renesas RZ/G2L MTU3a
 core driver
Thread-Index: AQHZJ2qh0xCJ0ka0qkO8eIRJwRDaI66wmfQAgAACtkCAAD/3gIAAAymAgAAZVICACvySAA==
Date:   Thu, 2 Feb 2023 16:22:56 +0000
Message-ID: <TYCPR01MB5933577B72FE9E63362FD76F86D69@TYCPR01MB5933.jpnprd01.prod.outlook.com>
References: <20230113161753.1073706-1-biju.das.jz@bp.renesas.com>
 <20230113161753.1073706-3-biju.das.jz@bp.renesas.com>
 <9f722f37-15da-0384-c059-a4af0f1dab10@linaro.org>
 <OS0PR01MB5922F1D5EEBE6D5B24F1820B86CF9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <Y9KTi4TYjh9qwBPE@google.com>
 <OS0PR01MB5922046617C1C9461DEAA7A786CF9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <Y9Krcd6tPI2jdYfd@google.com>
In-Reply-To: <Y9Krcd6tPI2jdYfd@google.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB5933:EE_|TY3PR01MB11177:EE_
x-ms-office365-filtering-correlation-id: 3574154d-a831-4a25-4fb4-08db0539be2b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CGBRR2pM+z7Jv/27leGi4amnaMdiGjplJOgX7IhGxuihRYVDbKHlDJ3WzE8eAXHT5jEAtAaHE8eJrDChSdEBDkPQrTvb1l5xGULY8Z9/HDs7HfxYZ0CMuXLIDfkEkyPDVwre0xl6TGz9l4c3UdapLSkUbPsAXo3mN2p11K854MESQHfDjafCHA+uQCRNN7/2dtLnf97SToFIW5JorKGk2g4Zp/fvmT2PY9MoK/vdyIpjRDDf4Hi47YRl0kKc3L9dwMGA0yDFXuXWq67zUmR5EJNBUGSEUOFh48lcaUjxqMwfuxI9hNPyJl7TBromKCuRvnN1nJ4w6cJqpo4+VvHOF9k8ZvD9S6+CvlhWVAM2P9gNE3Y5j4+PY3wjISsvvF2yee9pte6aBAckyC9GOOamAViv8zt8oFKFFon3JRjB9eev3GCfBXXL7SyDbcsqpEjcx9CraMPouY7TVSsh7GQBndzw1eywk1sSnYlNvK+LgSoydvsfyI64QYmfy/lVZdG4C2cSni86P8osy7HuEQCw23y24lM1VOxNYrixcf9jpl/9+S6rHySnFxeAcXgrjLkNaiPLKZxZS2OhbU1/4IlutnTKTFoKSC1K5Z4NFz5ltTqzzFkgpS3qQ446gzRzkglBgXHAjCKfCgghRdI1X3Yf6L6BZ6f52xWNcozcXPdCCv470VvDFlwKvYILqKv4ylEJrd8fLPzBASJ5pxBc7Vb1Qwc3lKHPfNpK55LzKblhbGs=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB5933.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(39860400002)(366004)(376002)(396003)(136003)(451199018)(316002)(71200400001)(83380400001)(54906003)(110136005)(33656002)(2906002)(38100700002)(122000001)(6506007)(53546011)(64756008)(66476007)(66556008)(66946007)(66446008)(76116006)(9686003)(7696005)(186003)(26005)(478600001)(52536014)(86362001)(8936002)(4326008)(41300700001)(55016003)(8676002)(38070700005)(7416002)(5660300002)(32563001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?WDrpdfcSEvsN7zaxk5PIkVust/+Ckx/3qvt48IiMBUOPIhJb/RWdYcA9DckU?=
 =?us-ascii?Q?En4ATxkQ2iUF2M3C7ocMspMCdV8zYGEYwJNU51GsRYeQSJc9mxfEStfxt4tX?=
 =?us-ascii?Q?S2mJf+2+bz1LlxtoS68uotu9Fv9sth56mdsEiaD5g5U9vSwxLf2oL/hYz+f0?=
 =?us-ascii?Q?z+T+8sdiHmVkfh1gmEdWXYQPsvRzgz3M0+tFck0YgOVTwuXr/2lie5g2zqcn?=
 =?us-ascii?Q?HmPS7u71V1GyMHO1THbezorKi7L3l0GcCOGvgkGq5S9IZLuhiIUG8t16pqmE?=
 =?us-ascii?Q?/eTVfGU7TohrQ7sewYYfeepvK1zkY/YEB7TATjsC6V+R7pEvIYLadzU6xUFE?=
 =?us-ascii?Q?YnlxuDXwqCEtywsdpDiRh/25Hdw1T3gUm5xq1/A9anfW73eY7rPxK2WMLpYO?=
 =?us-ascii?Q?DwNfwVQKTuWjzH76oXlLeeIb/k9IkOxUI7RduE8S7GlPgcLaox/JR5ArwuQV?=
 =?us-ascii?Q?zne+f6taSYZ8gWBunpW8FZqVkxUUW9k8frAIJUboaY/gcWbGvFJOP9Gl+AJE?=
 =?us-ascii?Q?87YYdws7E2ko+5et5Gk2fuXKYGPF47F72g8Y8gZomSQdaICboRRj+/YNf9ps?=
 =?us-ascii?Q?LzsO4Z0sQEwxzLmcIp60LR/7kZ7DoZBSryDx77QyPfW4I8y3t/Rg04kVDzba?=
 =?us-ascii?Q?aw0zXAsD5WO9spK/hYT9BpAdRCKfcRlcC0QnrgNDyo4+PjoBTRPcrdcodejM?=
 =?us-ascii?Q?KhJQ1BSa7RC73wjr/bGpYd3nP5ckb5PGu8kD4G/ZHukuP0oBdjnGPlhNa1SI?=
 =?us-ascii?Q?hC+Nxdwf6cF3AAfkYcusTAHI4oMdpkXbTxL6xhiuqaW+2PLN6GHRB355i0qE?=
 =?us-ascii?Q?WG4qvXzZIaDB6zXeCKnzNsSOlZnz6eYVZzapmGVyo3fE6yFwE/jWEgMRW1+g?=
 =?us-ascii?Q?4m7n78xDWbdHSDVl8r428PYG+bQF5KSe2GAR7rvKyzCAoCeZHIwu92u6RI/z?=
 =?us-ascii?Q?lYQyKStIEN3exAthERmdGr6B3CKQwPPNN30mLUUrLhc8uZBtDpEVtorysYTS?=
 =?us-ascii?Q?6Bj2oB1lihH5Y923Jnsi3Vaep0kELDwqDwkSVw0Wjmqr5/a2f1weseH1xBzU?=
 =?us-ascii?Q?kCiTfqT5n4qqLUWHzQK4m0UCUMi7zrpBL2FqemBchoLBi8YwF2jd98hyNwUz?=
 =?us-ascii?Q?/nVdIJ/b9E93wNOCEWtPN4kW22tE7uwp/veEA0k3OYmNXsAh46MqdjtyhVQZ?=
 =?us-ascii?Q?lUCgHr6KuOECYWH0lMGcMmcRrPY+Ob8TJs+d/939kThvQsl6ly/ElHu/wzWZ?=
 =?us-ascii?Q?wVKQiNYBtpCBFZ+X17eioO7KyX0KoBxBzisabG0sx4fG9hbnloAE0fekXuDU?=
 =?us-ascii?Q?xDbGqOmr3aVwLQ3SwHANvaW5m4bAVegKDE36L7ZW4DeQJMwvz1AGYVatbEbY?=
 =?us-ascii?Q?FpT07N9HcwKBFv8guu452M2f/tIzrZxrUtJGWoiNurSEMtnMfQ/On9MSiwNg?=
 =?us-ascii?Q?YpSumQ25YtAQ1MWRTySlBYqKaO7AnDH4xsLyDvzV5FPrcxRCyhYBoO3PJwHD?=
 =?us-ascii?Q?jRjO87gUdy2QYlGcaEQPSTJXoajM+S7+aADzihswiUnspyNUGK4pQ1YQdMcZ?=
 =?us-ascii?Q?s8EKhwguqxMAiG35tBF+ENpHz7X2PeTiu2dNkiM6WYjkrON4vBftqn5d3+m5?=
 =?us-ascii?Q?SA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB5933.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3574154d-a831-4a25-4fb4-08db0539be2b
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2023 16:22:56.4216
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PMfsL9jKcOVKPePdTEQ14UTSddO+cDPg9eUma+vqZE4StXB7dZcloR6c2zJiBk+cuYK9EE2EUCLWr6SyMQbuFAz63tLtgekbiIu9MAN8ers=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11177
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Lee Jones and Daniel Lezcano,
=20
> Subject: Re: [PATCH v11 2/6] clocksource/drivers: Add Renesas RZ/G2L MTU3=
a
> core driver
>=20
> On Thu, 26 Jan 2023, Biju Das wrote:
>=20
> > Hi Lee Jones,
> >
> > Thanks for the feedback.
> >
> > > -----Original Message-----
> > > From: Lee Jones <lee@kernel.org>
> > > Sent: Thursday, January 26, 2023 2:52 PM
> > > To: Biju Das <biju.das.jz@bp.renesas.com>
> > > Cc: Daniel Lezcano <daniel.lezcano@linaro.org>; Philipp Zabel
> > > <p.zabel@pengutronix.de>; Thomas Gleixner <tglx@linutronix.de>;
> > > Geert Uytterhoeven <geert+renesas@glider.be>; Chris Paterson
> > > <Chris.Paterson2@renesas.com>; Prabhakar Mahadev Lad
> > > <prabhakar.mahadev- lad.rj@bp.renesas.com>;
> > > linux-renesas-soc@vger.kernel.org; Rob Herring <robh+dt@kernel.org>;
> > > Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> > > Subject: Re: [PATCH v11 2/6] clocksource/drivers: Add Renesas RZ/G2L
> > > MTU3a core driver
> > >
> > > On Thu, 26 Jan 2023, Biju Das wrote:
> > >
> > > > Hi Daniel,
> > > >
> > > > + Rob and Krzysztof Kozlowski
> > > >
> > > > > -----Original Message-----
> > > > > From: Daniel Lezcano <daniel.lezcano@linaro.org>
> > > > > Sent: Thursday, January 26, 2023 10:53 AM
> > > > > To: Biju Das <biju.das.jz@bp.renesas.com>; Philipp Zabel
> > > > > <p.zabel@pengutronix.de>
> > > > > Cc: Thomas Gleixner <tglx@linutronix.de>; Geert Uytterhoeven
> > > > > <geert+renesas@glider.be>; Chris Paterson
> > > > > <Chris.Paterson2@renesas.com>; Prabhakar Mahadev Lad
> > > > > <prabhakar.mahadev-lad.rj@bp.renesas.com>; linux-
> > > > > renesas-soc@vger.kernel.org; Lee Jones <lee@kernel.org>
> > > > > Subject: Re: [PATCH v11 2/6] clocksource/drivers: Add Renesas
> > > > > RZ/G2L MTU3a core driver
> > > > >
> > > > > On 13/01/2023 17:17, Biju Das wrote:
> > > > >
> > > > > [ ... ]
> > > > >
> > > > > > +config RZ_MTU3
> > > > > > +	bool "Renesas RZ/G2L MTU3a core driver"
> > > > > > +	select MFD_CORE
> > > > > > +	depends on (ARCH_RZG2L && OF) || COMPILE_TEST
> > > > > > +	help
> > > > > > +	  Select this option to enable Renesas RZ/G2L MTU3a core
> > > driver for
> > > > > > +	  the Multi-Function Timer Pulse Unit 3 (MTU3a) hardware
> > > available
> > > > > > +	  on SoCs from Renesas. The core driver shares the clk and
> > > channel
> > > > > > +	  register access for the other child devices like Counter,
> > > PWM,
> > > > > > +	  Clock Source, and Clock event.
> > > > >
> > > > > Do you really want to have this option manually selectable?
> > > > > Usually we try to avoid that and keep a silent option which is
> > > > > selected by the platform config.
> > > >
> > > > For critical drivers like CPG, Pinctrl we enable it by default by
> > > > silent
> > > option in platform config.
> > > > For the others we add it to defconfig, once the device tree
> > > > support is
> > > available.
> > > >
> > > >
> > > > >
> > > > > [ ... ]
> > > > >
> > > > > > +
> > > > > > +	ret =3D mfd_add_devices(&pdev->dev, 0, rz_mtu3_devs,
> > > > > > +			      ARRAY_SIZE(rz_mtu3_devs), NULL, 0, NULL);
> > > > > > +	if (ret < 0)
> > > > > > +		goto err_assert;
> > > > > > +
> > > > > > +	return devm_add_action_or_reset(&pdev->dev,
> > > rz_mtu3_reset_assert,
> > > > > > +					&pdev->dev);
> > > > > > +
> > > > > > +err_assert:
> > > > > > +	reset_control_assert(ddata->rstc);
> > > > > > +	return ret;
> > > > > > +}
> > > > >
> > > > > I'm not sure this driver falls under the clocksource umbrella
> > > > > but under mfd [cc'ed Lee Jones]
> > > > >
> > > >
> > > >
> > > > Please find [1],
> > > >
> > > > After a long discussion with dt maintainers, counter maintainer,
> > > > MFD maintainer and PWM maintainer, it is concluded to Add the core
> > > > driver to
> > > timer subsystem.
> > >
> > > Which is fine.  However, you cannot then use the MFD API.
> >
> > Is it ok to keep the bindings in timer subsystem and move the core
> > driver to MFD as it is using MFD api's?
>=20
> Sounds reasonable.
>=20
> I guess we'll have to see what that looks like.

As discussed, I have moved the core driver to MFD and keeping the bindings =
in
timer. I will be sending next version based on this.

Cheers,
Biju
