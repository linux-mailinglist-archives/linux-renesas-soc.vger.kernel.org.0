Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F90E6922E4
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Feb 2023 17:02:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232906AbjBJQC5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 10 Feb 2023 11:02:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232398AbjBJQCz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 Feb 2023 11:02:55 -0500
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2122.outbound.protection.outlook.com [40.107.117.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EED7978D77;
        Fri, 10 Feb 2023 08:02:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CncS5SCUk3E1/McCZvU2gJRem1aNzgqq6zXkMOtTOdPLiDL+MTPNvq4SbkM0a5fjSZMiZP4qfWpL/tQeypSqgUY6AGOjTlHJ870UGf4lAuoer4ByRBG8l+QUN26tELbAlbw5ZQ7pwE02U4hX2RaqiSDdGmQLMXIAhThpz00Q+zLYFcqvPXIoZqVtr+UCxjBvpnAv1W2DQG8036jmtR00AubYqWdu/EhCirz+ytTFL//+BnAlxLMRISN1XuOSP8linnq0f3ccfkSb6ieYI/aWRuidNu3H/AUEPqZW6WweF1BtLvZymNH+qtqpcIt9mWO6spsoRQ+QNuG+CyOVkIyc4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4NJ1pj7EwlLwU6wbmm38sdWXr3qfQH7p8I4Y/vfVyMU=;
 b=RAG2B5bFDQL2FfEfkieBN2l5jE8HWF3fYOBYEKyFyBWZOu9snmPtFQpU4a2FnUhiSnZCfBxFUWq/J0Z9kxDhuC0DiXRT/qT/voPS4Hk/I94o9CBEdDhKGdOGM/Qz6dac71b2s0ZjiovRr+Aco364haYOSP1mZ9IXd+0qD4lCd7PssASjUOQDd5niOgF7d7WV4qTX2HXQVgahsp9rqefSNQyh9pUtfjcGtjJXPlkJ5pZ2VKxRynCcctcsx2nxgsRyMcVvzbA1sQ737Tb7GU1Hue834wlKf3Eo1UB/mP01iLlRL9kShQQUYalclb0oypn/a+IiKqbWis8VH9Zy5eFybg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4NJ1pj7EwlLwU6wbmm38sdWXr3qfQH7p8I4Y/vfVyMU=;
 b=w525b7tl2+tsywmrxnswZOGpPkgeQD/x5F7V5710MEBcZzcbVFGLF8nSxarcwj5OA5BmzczlUuWqG7KcuAkR0udmDO2Dt1pXRywLXsPi3UIQh1LCRiYiEiIgPzDsitbTGsriG8WEJfLxdTon3AtLc/08Cy6PXOTQyPTH7lTyoZw=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYWPR01MB8673.jpnprd01.prod.outlook.com (2603:1096:400:13e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.18; Fri, 10 Feb
 2023 16:02:51 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::343d:7339:78e5:a46e]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::343d:7339:78e5:a46e%8]) with mapi id 15.20.6086.021; Fri, 10 Feb 2023
 16:02:51 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     =?iso-8859-1?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-serial <linux-serial@vger.kernel.org>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2 2/3] serial: 8250_em: Update RZ/V2M port type as
 PORT_16750
Thread-Topic: [PATCH v2 2/3] serial: 8250_em: Update RZ/V2M port type as
 PORT_16750
Thread-Index: AQHZPWYzeQsp1F3f9kS2usAbL+gOlq7IVhkAgAABJDA=
Date:   Fri, 10 Feb 2023 16:02:51 +0000
Message-ID: <OS0PR01MB59228C3E1141E9083DB1B67186DE9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230210154140.338352-1-biju.das.jz@bp.renesas.com>
 <20230210154140.338352-3-biju.das.jz@bp.renesas.com>
 <e1db071-963e-926-9119-9b405a1812cf@linux.intel.com>
In-Reply-To: <e1db071-963e-926-9119-9b405a1812cf@linux.intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYWPR01MB8673:EE_
x-ms-office365-filtering-correlation-id: 68a06caa-4c27-47a2-7af7-08db0b804310
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: M5jGQLATVLeVVWXQfaEvPPrtX5rEJPstb2WMcua1rtDcffwPSk0SrqDGKD6t2pNfyLEuyO4L/sFz5JGsm9+K8Vzilptktpy6svgkRlxoVvegmA/2ThadD551G+gVlrkdPnjVtmcPoUFQ5tw/R2/MW87G6jyMSbZahlCtwB4ttGQ17hczBmVMA2BKnZZKJNNhtQZ/rjk6EYa4dIil1Qi3q0B0Ip//Tfh9tCdcr7Lob6bOcjA7Na2IR/w2DQZVBKQxIR/7tBvvXOCXH1S23YUgEeGEaUbeLi18fLujOi8meb3VlCqU705oTucnwmnTLYyNY8Q6vFuQ3DpBKuiFgS2RqtlLgeItPpVFboOeVpIXNdf0ErckLbWhoMLMEvGDjLkKvSJ94lFeyc8r1kRsuBhAayGffn26N2ZpBXWHkzZbAW/DBzctEjVZwf4lpK8mSi4dawjwuJmxPxvVdSDD0K2NChksm3eJjmsCPwbcqZ2Zr0EpzX0u3i6T2ZEnKDZI4IKmqhSatSsLEDRGc43zSK1yJVRDSnoai34tNSGwLlarJSJccw1Ny5nNxzc1rbN+dSZjS8uvPNKs698A9dU/lvTiZ856nv6NtGHq3s5r+MKw32MXGH6uwMQVOFg9FAHDO4c6lNyraQ88sqsd1JBcv3xKYotlpA7n5TM0UCyJfGvZo5YxN6yy7r+/jtEnYUheIB1peVOXw93WBLoOSD4n4fnBXA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(376002)(39860400002)(396003)(366004)(136003)(451199018)(15650500001)(2906002)(186003)(86362001)(122000001)(8936002)(5660300002)(38070700005)(26005)(55016003)(6506007)(7696005)(478600001)(52536014)(71200400001)(33656002)(6916009)(83380400001)(9686003)(38100700002)(64756008)(66476007)(316002)(4326008)(66946007)(66556008)(8676002)(66446008)(41300700001)(54906003)(76116006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?sGrGefrmoR1D9Wb6mZorSxZS5JtK6qR0THSZTB875gxQcArhT9HJyfRgqo?=
 =?iso-8859-1?Q?AUAzVTppZ3p5ZepzKtQHLR9MosYQk1blnoLAb+wSo5tV47OM27y9ZlOhMv?=
 =?iso-8859-1?Q?JzD9JQlyfeTpfuktk0aqlZFs82R/M6ZntJb9Zu8Pjhy5lRrSNBNQ0hsUvE?=
 =?iso-8859-1?Q?qRxy9E+eREhfaxaZ+pCk8G5sKWMS+MmE1eho2Bwm0tpS4Opjyoa74vtnhV?=
 =?iso-8859-1?Q?0fIaJ5lIqZc3ZitHG4Os3/HvhfJBvfr9ONn00veuJAe7OU2kiq+AXgCw0K?=
 =?iso-8859-1?Q?QQf7jt7I+LRZl4B/oI8BjmFmjHbBc17eqP/nDT6yAc6Qu8qE+Es1Q6uo8W?=
 =?iso-8859-1?Q?26aGSf9eDjIxhauPJ1NxTod696jVBQsrHQ+A4Qx1mRyVs3xy2w8NIqsrU8?=
 =?iso-8859-1?Q?ipeeycwFBn6Jsug5BIBc/JFNELN6KUgPGpcWmZbKA7IFjQW+iwkbDhY8rT?=
 =?iso-8859-1?Q?H+XDPsghXcaVx2CplP/1Cxogzi5a6X3U9oj9IcV0ccLhLckYQS//dMlrSl?=
 =?iso-8859-1?Q?0J1xnh35E4Ma8w0hlmWuD5/TWbPRnFrl2XGAIml3e0JZgDXXaOeCWakkC7?=
 =?iso-8859-1?Q?Qah4iO3u5neFHWBB9yNM2iAP/khmYl/uhG1GTwAfAVpo2W6cy5g8LBXEi1?=
 =?iso-8859-1?Q?inrQy7ED64i0uz1z/xt8dtSk9okFigFBDIuBb8luKJLBiVPG6eStufGans?=
 =?iso-8859-1?Q?XhmTlqjX3E9QkznAav+50rC/cLH5EhE7mChNQGYXcA1fO6ArNZ+jQAW+Tv?=
 =?iso-8859-1?Q?HjqvDE3Svmu8ICHRsXZGckcgnPVaZTXFnqbfwgzVtYrfpTVadDVJEhnjo7?=
 =?iso-8859-1?Q?V299Zi7k/lOep31dghrofyBeKH5c1kCnJSe/UOtnULHlHdW9JEE0nfcVL2?=
 =?iso-8859-1?Q?arjOg2m3yJIh1CZaLgP7rbkr8js0mDQ6LILbujqI4kmnEsWzHLafSVDWAG?=
 =?iso-8859-1?Q?aQb1NxF+OpPK5TB4cJoSxLDGsuwgUqEMb+HKODAZ7vw9OEabU6alFy2+Un?=
 =?iso-8859-1?Q?1oT//AfDnK2fnvAA4VNibgE6VsiNacRudPszBSFwPxJ3642s3a+d7C0vm4?=
 =?iso-8859-1?Q?+EPV1/Xiqx6Ww9WHW6BJRKlAahHdKrLeAnovXVpy1/QgKJHJvCeWPS3IN9?=
 =?iso-8859-1?Q?BPNMUS1VdynU42jETOHS8xTR4YtEIp/2rg4ZCjBWQcP5wAUuM6BEMjFrB3?=
 =?iso-8859-1?Q?8J+39k0RA/wf9mGbJy0BJYtiCjZScWzG9ib6xaSK4Wi3pl8049NFUslT3h?=
 =?iso-8859-1?Q?yBpS7p0zGMZR2CDvj0hPq/OWqoIAO9EaFNDi02L15YzhS+o54yjkhZbZTY?=
 =?iso-8859-1?Q?LYfibfqQCumGO/qA2A/u5FVayDgUn/JucyDERXh9gfYgTZ1++n7esIjdZP?=
 =?iso-8859-1?Q?9SCbwAVbzd38yqPwt6bg66dKi5K33Mr5SSwEwYDNK6tb4L9U4+l6cwUKg4?=
 =?iso-8859-1?Q?q5A5bu2DJ+X8k3n499mid7/dqyFKBdeUx8R4fdb9rCDXQCOhZ3rW9Nl41V?=
 =?iso-8859-1?Q?4oAydK2GnxUoggxUQkzm5o9Nm6019pY19U0EPACFqxGG5CRfFmvuorNp+2?=
 =?iso-8859-1?Q?GBxttzK4xUGjY94J1DKpdFFvo56IuFJ/2EeatVXoLbC+nEsE+OS3HzXxf7?=
 =?iso-8859-1?Q?FbttjzQ98DWIS6w3Yr4x9CvmkmglpZ7UfQUGQXKTniZ8dxiHiMhK8A2A?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68a06caa-4c27-47a2-7af7-08db0b804310
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2023 16:02:51.1617
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sLKLbEzeXoMDIL/tkxKij+cMUVjXCsW9MErwn4yr25j8L0lKVHsyFFmchPRmkLwcnLQnFWJSHjxdJkO8Wa7vM22hBTkxUyF1gQRUBBuRcJA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8673
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Ilpo,

Thanks for the feedback.

> Subject: Re: [PATCH v2 2/3] serial: 8250_em: Update RZ/V2M port type as
> PORT_16750
>=20
> On Fri, 10 Feb 2023, Biju Das wrote:
>=20
> > The UART IP found on RZ/V2M SoC is Register-compatible with the
> > general-purpose 16750 UART chip. This patch updates RZ/V2M port type
> > from 16550A->16750 and also enables 64-bytes fifo support.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
> > v2:
> >  * New patch
> > ---
> >  drivers/tty/serial/8250/8250_em.c | 27 +++++++++++++++++++++++----
> >  1 file changed, 23 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/tty/serial/8250/8250_em.c
> > b/drivers/tty/serial/8250/8250_em.c
> > index b78c74755735..628a6846bfdc 100644
> > --- a/drivers/tty/serial/8250/8250_em.c
> > +++ b/drivers/tty/serial/8250/8250_em.c
> > @@ -9,6 +9,7 @@
> >  #include <linux/io.h>
> >  #include <linux/module.h>
> >  #include <linux/mod_devicetable.h>
> > +#include <linux/of_device.h>
> >  #include <linux/serial_8250.h>
> >  #include <linux/serial_reg.h>
> >  #include <linux/platform_device.h>
> > @@ -19,9 +20,15 @@
> >  #define UART_DLL_EM 9
> >  #define UART_DLM_EM 10
> >
> > +struct serial8250_em_hw_info {
> > +	unsigned int type;
> > +	upf_t flags;
> > +};
> > +
> >  struct serial8250_em_priv {
> >  	struct clk *sclk;
> >  	int line;
> > +	const struct serial8250_em_hw_info *info;
> >  };
> >
> >  static void serial8250_em_serial_out(struct uart_port *p, int offset,
> > int value) @@ -95,6 +102,7 @@ static int serial8250_em_probe(struct
> platform_device *pdev)
> >  	if (!priv)
> >  		return -ENOMEM;
> >
> > +	priv->info =3D of_device_get_match_data(dev);
>=20
> On second thought, do you even need to store the info beyond .probe()?

OK, will use local variable instead.

Cheers,
Biju
