Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 380BC74753F
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Jul 2023 17:25:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230129AbjGDPZB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 4 Jul 2023 11:25:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229469AbjGDPY7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 4 Jul 2023 11:24:59 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2094.outbound.protection.outlook.com [40.107.113.94])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B43BBD;
        Tue,  4 Jul 2023 08:24:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kToyjDPhndQZ0k2zq3SOZQS1cEzJ4tlGAKjypgmLnLyPk+qYr8GpFIM/eSJPf/wjCOxLBk32X7Yk3hn5Ch6mFchiI72+5zto8v/Jd+Sk4MrlrCvXw9kANPZpNj9gbbLG2lEai10cgi5kg2TML7H1sZ+VvlMLXcqvVn2IUn5Bsy/ryLB2OI3dCASym6TYXAbM9cp9+gciDfZCh/t7ypMPcRbEjL8Y8AKbhQDKFqo5MxqrSdtqSXZlGRDP6oRPYTjpKV1cYFaM9eK/YlUO9OK3cMXr/XMCRJfcLqKP42ubVExKP4199mxgXYcWlc+hCpgM6ObjCb1v5w870UGdkbWTAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bTwQO5nWkA6G97bhkXhEZY8UIyQbQ7PM/9DS+tWMKxk=;
 b=fO9XFSiKjHDviTq97gu7QUX794qZLEhF3+pCO0f0ZM44GzabBqAoMqhfmkyM6Hnw2SATcwn7L5+iqXZONAZFW8uwNU8TTQ80UVO+EFpPaUGmY+S22PX/YizbD+r2Ko5SUdCQGedcNJacAFxNOU9BbDcSNPkwqXN9t0h7stmi6WSBHq7OzWnRY/qgO6+7c9qiNwnXYhMIsN2PUnykdnDxUxhh3WAod7Ld9l1mcPiRoY8KNMmx8R5XeTfx24AernoBMrN231UKfPcWQKlYw6QtOA6sj4JLNbqvTaJAdk7mKId06ouK80d+q9Zo1/XRmD2o68xrvKCFSI61C7CFrlPx1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bTwQO5nWkA6G97bhkXhEZY8UIyQbQ7PM/9DS+tWMKxk=;
 b=dFa3/go4WLpnhPV6rUCfIvw3/V6k50uH3/FSoKdbjoJe8Fw687soVvibZfj2usfbHXRqy2zrjZV+6+ikZ4PUsjXy3hA1+eN7VXfvg3SC/BktaBaFF6dJTzpkrazZFJ6oe2HgS9q4IWJzZOVB8a6RSfbd9V/HrAUNm50N668jskw=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYCPR01MB5583.jpnprd01.prod.outlook.com (2603:1096:400:40::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Tue, 4 Jul
 2023 15:24:54 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::fc77:6148:d6a:c72b]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::fc77:6148:d6a:c72b%4]) with mapi id 15.20.6565.016; Tue, 4 Jul 2023
 15:24:49 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Dan Carpenter <dan.carpenter@linaro.org>
CC:     "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [bug report] tty: serial: sh-sci: Add RZ/G2L SCIFA DMA tx support
Thread-Topic: [bug report] tty: serial: sh-sci: Add RZ/G2L SCIFA DMA tx
 support
Thread-Index: AQHZrno6nRI6qiRCQECzIqqYtUuqXa+pudHQ
Date:   Tue, 4 Jul 2023 15:24:49 +0000
Message-ID: <OS0PR01MB5922C5F6705FA3AD8E2FBA17862EA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <427f194e-d8b6-41de-a1f9-6bec4a9ef057@moroto.mountain>
In-Reply-To: <427f194e-d8b6-41de-a1f9-6bec4a9ef057@moroto.mountain>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYCPR01MB5583:EE_
x-ms-office365-filtering-correlation-id: 5433fb99-db3f-4b64-8d53-08db7ca2cebf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Q/r/iywPfu51U8f5LCpxSUI9eQP0iZqti6JIjlcoLKpXnVyXyx2dwAXaSPqf1kP7EX6otHn7oJoDccyHqeCqvTIcNtnwHfI1Z+HjcH2HWS2EL2secrko8ImzOsyDMfn+11EJy6AaqwQ5IGGmlKY2jJ+ChIrtzGjf4xqmy1zBTR+t8W9oz89juWgZDVZe8A20xgjtoTJcMVueXK0w6mCfjuddgTb7uZwUN41JYZIi4I64I4nqN1XXsVFLT6/r5IooohL5kaGBX5j1Y3U89S7PNVI+7rtIV6UGYs7ue0lbDCtV11tgosO+CKXnbqY28jscmUQSnD6FRNXIFWdofUxegtkwh4/BXk7tCXKF2A+cF8y4E3B9yaEV2XYjokhOXLejfiRgbWE0tqiU78tOXCWZwwOmbHmNGkBd2iQFWL70Dt9RmBHe+Dq5sfQr/8oUBMBjSdViWJb7PksDZVdIH3aeQvo+bq1jANdmD06mNzeUne8OWmamH4cWLSV1rm5CP2t9b3ZnfrCbKDDeZ7j3coSQZI3QUOI42dhRr/Pg+XQlwJ5TaPeWOzIfoo1fpiAeeYMFQG8WD6I3iojBsBTDIQJerRIsRIDDD33YB85wpjKocAlIl75wnInyWhp1VGVdqfBN
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(376002)(136003)(366004)(346002)(396003)(451199021)(6506007)(53546011)(76116006)(66476007)(64756008)(316002)(38070700005)(38100700002)(122000001)(55016003)(4326008)(66446008)(66946007)(66556008)(6916009)(83380400001)(186003)(9686003)(478600001)(54906003)(2906002)(8936002)(8676002)(52536014)(5660300002)(71200400001)(86362001)(33656002)(7696005)(41300700001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ppmSwAoK4sA4UN+LoyEeKbPGamlfIdeIfdoOJitsMR6HnibqoxhIPP4dBu/k?=
 =?us-ascii?Q?mqql/GTwE1eGs6lZUWg/d09daQ0aQNbAshXKWOlUCB+/FG/YoFQAfGaX7LS2?=
 =?us-ascii?Q?bSUlBWg+Fsef4zlKcnj/HM9no5xobviqPHiXa2dsWw+rEPdk4oWhVJrEY1KW?=
 =?us-ascii?Q?Ds3Mmid5FYRqN/vaBj9/fE3+xKcASi3fSdW+kXYQzjY0P0f2FJrcp/W1JiAH?=
 =?us-ascii?Q?+yzRoCPoKvJepgpYhao+e0e+uhO5A5ukTjkCoHQm9mhGTtA84Csb+EawZxV8?=
 =?us-ascii?Q?GiTO/rgJ6nAEYOAiaNsucajT4CB+aJ/6jPG4+DblIrWS05Jty11tcPngjhEg?=
 =?us-ascii?Q?EA5oDv6b51w7bbi+ASq6TTRJWJ0IplwksAh8VWukCVfEgTgecuf+km83+kw3?=
 =?us-ascii?Q?jm9417WzT0Mm/z/paaUxMTzx4iUEhNIS2Zjt0wYnoNAhgZ2BHwXYcZhYgBx7?=
 =?us-ascii?Q?p8GQaRsPU6Lhcs63BgG8amLwHHlou8g+iVvH8Jbwn0QH/6D9dUn+CfG38Y/T?=
 =?us-ascii?Q?GinKpLkyLcRgbFx9LrR7pom3MjFpNDWUtNGWZWhl4/8eduCqwcO7kqK3Mm7p?=
 =?us-ascii?Q?aDapshh+umV+jOQTFRy3hEsTf1iu6n8aPBCkqIxD9L+vCzl89Qg8KuCEjmdv?=
 =?us-ascii?Q?pwjAWtVADJrdc0zwq4d9+NzOGrna4h5IggaBrqzrxwDJbzF8wc+ETX7QQ56F?=
 =?us-ascii?Q?hrL5vBI+ea1wWGDPfIrE+ZEo2mawSxZjJ39o/+hO95I3RexEavWH7mruhJGw?=
 =?us-ascii?Q?moGh0y5pKIT+3dagmf8v/jBnq8jEZCtC9FJvaeyl974qYx1AxWoFpJiGU+1i?=
 =?us-ascii?Q?Xar9cvnUQe0I5cD5fklz9hvLpdWxSzTkD53Qiqu9/R3+3SVH9zcTPGli1qG2?=
 =?us-ascii?Q?g1ngaMq2ukrkk0/fVE95U0OF6k2ee35TZXKKhPNiSu4IpZ2JpTY3hX+FAvzp?=
 =?us-ascii?Q?HD9xbGw7WyHJ47+TkW7lzoLkd6Mz7G64uYZUgUdzlvMmuBtpR9VzUFgwyS+r?=
 =?us-ascii?Q?YnPH3AgDNvLFlePgHBfSvouYEfDUuqy1aQMop1/oiuAHTyb0e+F7MK3n6tYa?=
 =?us-ascii?Q?/1BTwab71KOOU7rszDcewa6VYyr2Yw0rPx4DE+meCxWmPfoEer5+RgAqAYFn?=
 =?us-ascii?Q?uo+1TpVBfHvyGSyC+0qn7JpeBlvNqsJcPKaTxL+8r86HISg+Hh9saahgiYDQ?=
 =?us-ascii?Q?8D3g4uIHcnhdDDCyRH5EQucWpKy/LeeSO2jsIOuh5ryBiNo3p3BOEPKZQjq3?=
 =?us-ascii?Q?R+TCRujVMWG1eOGHrJBZBGx625NYncTbgIPXEfJ3jg7Him61mFYWP4EEht6E?=
 =?us-ascii?Q?IV7z4vmwzABy2b6IYf/8XO0DNu9BgSTiOjwdsKmRmMflID1FGO0bS1Vb6rTa?=
 =?us-ascii?Q?78lJfXZgkdWj0CS2vOQ1oTJPzwekxnUZ+QWyKm0SxOEkEaSyuAOpaUei60cR?=
 =?us-ascii?Q?JMlNwaKappQEkZfSu6RmRj+LfLAtnTYW3p/yJtp53nZWVNmq38VOW6kJvIet?=
 =?us-ascii?Q?Go1Xa+/YSFg0SGUbjHq30hDXDpo+svWj1xNYl+23RkB1ceq670HSRoW3rCW5?=
 =?us-ascii?Q?sgC4nBIc3t5PA/IrnNs=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5433fb99-db3f-4b64-8d53-08db7ca2cebf
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jul 2023 15:24:49.8181
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oZ+RmvjLomP+Kt4rR/UTW+rYkBk8894PFDtCADGpf+iE4iZPFk9x/0MhklEZMU2HLku15XSeVEoe2btQ+VTRRHRU3sRS2j4qe0OIBHY2c6Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB5583
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello Dan Carpenter,

Thanks for the feedback.

> -----Original Message-----
> From: Dan Carpenter <dan.carpenter@linaro.org>
> Sent: Tuesday, July 4, 2023 2:20 PM
> To: Biju Das <biju.das.jz@bp.renesas.com>
> Cc: linux-serial@vger.kernel.org; linux-renesas-soc@vger.kernel.org
> Subject: [bug report] tty: serial: sh-sci: Add RZ/G2L SCIFA DMA tx
> support
>=20
> Hello Biju Das,
>=20
> The patch 8749061be196: "tty: serial: sh-sci: Add RZ/G2L SCIFA DMA tx
> support" from Apr 12, 2023, leads to the following Smatch static checker
> warning:
>=20
> 	drivers/tty/serial/sh-sci.c:593 sci_start_tx()
> 	warn: sleeping in atomic context
>=20
> drivers/tty/serial/sh-sci.c
>     573 static void sci_start_tx(struct uart_port *port)
>     574 {
>     575         struct sci_port *s =3D to_sci_port(port);
>     576         unsigned short ctrl;
>     577
>     578 #ifdef CONFIG_SERIAL_SH_SCI_DMA
>     579         if (port->type =3D=3D PORT_SCIFA || port->type =3D=3D
> PORT_SCIFB) {
>     580                 u16 new, scr =3D serial_port_in(port, SCSCR);
>     581                 if (s->chan_tx)
>     582                         new =3D scr | SCSCR_TDRQE;
>     583                 else
>     584                         new =3D scr & ~SCSCR_TDRQE;
>     585                 if (new !=3D scr)
>     586                         serial_port_out(port, SCSCR, new);
>     587         }
>     588
>     589         if (s->chan_tx && !uart_circ_empty(&s->port.state->xmit)
> &&
>     590             dma_submit_error(s->cookie_tx)) {
>     591                 if (s->cfg->regtype =3D=3D SCIx_RZ_SCIFA_REGTYPE)
>     592                         /* Switch irq from SCIF to DMA */
> --> 593                         disable_irq(s->irqs[SCIx_TXI_IRQ]);
>=20
> disable_irq() is a might_sleep() function so it can't be called while
> holding a spinlock, but the sci_dma_tx_work_fn() function is holding a
> spinlock when it calls sci_start_tx().

Ok, will change disable_irq->disable_irq_nosync, so that it can be called f=
rom atomic context.

Cheers,
Biju                 =20

>=20
>     594
>     595                 s->cookie_tx =3D 0;
>     596                 schedule_work(&s->work_tx);
>     597         }
>     598 #endif
