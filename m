Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4787E69AE23
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Feb 2023 15:35:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229673AbjBQOfW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 Feb 2023 09:35:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229475AbjBQOfU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Feb 2023 09:35:20 -0500
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2135.outbound.protection.outlook.com [40.107.113.135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34252644FB;
        Fri, 17 Feb 2023 06:35:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j96FDepDgXlTOCcoUGnFJGK7PwYrLyAX6Q5yCvBJ5UmUc2ZhM6VnRyIcpQOqv9JaSqvflhl5fwnFj2aRgIMJnL1nTGtJIhNNOsrMNnujR2yuvvJvJCU+vi+kFAR+vz7nmI0+G8JsBxWfh0v+zLYXWkmo1ZzRF2uuKo8ue6DvENfR4NgFBgiPfHBLSVhHvoVoojcJWcapzEWPV4kuro+XTEiqYcrvTEjrdLA3RSGYr9yqiE3Bspzzf3ngPStoj/grTDdLyoJlREogTol3Ce8yFTMaMO61TcFiQDho5J66608T38x7r6hlevxOWwI3hUypaQlMcz8vHFYnoH6IIN69Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=13zRq7Ud5hqe/ARsGjnW6gAYEPlwG2YW/VtZhRSO/Ec=;
 b=WuDAgVySE5yEXE7rLDNhOu0uFFihz8y/Pw645cObnPY9DgmHOF8RlgmaHV2sB4Mduoewb1Y6zqsM7nJ0h9gbvANqypb6uzx3539cq/qGXuz0Q12Aq+fpWzkFlfKg44YyCvfIa37PRaBQ2MPlV5Te7yJmH0DnskFhpVdQWFaSEzDksmbsMvbmllMd/zWTFQUOwGR9AUY3B7eNdZBw2qA+fclE5oOrg6ou/btwUMbAlfQ/rWQfyOHvwWKwrAVCa8y6qAAPLZCGSx0jT4jGSjPoLkjMvvJAOj1F32tTesUMRYOik70Qthui5Q2VSNyrSv2n1RPg+tRfCW88RmGl1O0n+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=13zRq7Ud5hqe/ARsGjnW6gAYEPlwG2YW/VtZhRSO/Ec=;
 b=Gnb03dTwruY/ptDGSJxLCCobHFMgT6Bu9UH9DmLoc2Ru6AaYzc1lBx5OSarUgH3KkHir+1gJv6FrG3ltuDcgFd7bfmRnin49z5wcYRIGPlXk9n+GI6+ILSWeBy+S6HMl9g+sAMhd2zSDR3MYS50EPbKuFytVG/3Xygf31bRn8Gk=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS3PR01MB5928.jpnprd01.prod.outlook.com (2603:1096:604:c3::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.17; Fri, 17 Feb
 2023 14:35:16 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::343d:7339:78e5:a46e]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::343d:7339:78e5:a46e%8]) with mapi id 15.20.6111.013; Fri, 17 Feb 2023
 14:35:16 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Andy Shevchenko <andriy.shevchenko@intel.com>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        =?iso-8859-1?Q?Niklas_S=F6derlund?= <niklas.soderlund@ragnatech.se>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v4 6/6] serial: 8250_em: Add
 serial8250_em_{reg_update(),out_helper()}
Thread-Topic: [PATCH v4 6/6] serial: 8250_em: Add
 serial8250_em_{reg_update(),out_helper()}
Thread-Index: AQHZQsULLWkrxmHF5Eim51yNEnh8Oq7TLqCAgAAFCsA=
Date:   Fri, 17 Feb 2023 14:35:16 +0000
Message-ID: <OS0PR01MB5922982DB09B8F1DFD70602186A19@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230217114255.226517-1-biju.das.jz@bp.renesas.com>
 <20230217114255.226517-7-biju.das.jz@bp.renesas.com>
 <Y++LqQIHuO8BGTm2@smile.fi.intel.com>
In-Reply-To: <Y++LqQIHuO8BGTm2@smile.fi.intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|OS3PR01MB5928:EE_
x-ms-office365-filtering-correlation-id: e5d33251-22c9-496d-d102-08db10f43018
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GvhzeoAynm6426HiuA+Slis9FwK5DTdrsb0FfFWEvgJSazRE340zfXmTua5zIt8pKh8aDjac2QTssRckB1vCNHzFYU/o3k4FvHam2d4HxnZxQdg9BXkJLqrZHigq5ds9rxHpUsG/cW+2bZI++27QRgtdpPwFENMxfhDcF6hJzuq2uqjVA4bkVNGQpBdFh+B2DnjrEkl+IGxo//CfciZqOIMiaRqeH5Tn3OpFimcfkgVooxOECPe8TA4ylehlTQ2uaJ5TUNZ+hKrhss2MvM8sUTRF3tZLtHWBNIU7VVjD7aGYLeGpnxvzO3TscQVboiWu5MTq8wa67E4sZRTT9OSsPIYkI9JFSx2oIRBrPi+Z6nq96fuVpTU+M/ecRI/ona407b064Fd7We0aVtio8grTqU6Xt+QmJAszTP9gz6tZ/uW+EJGarKAaH+JHX4JxObX+xtnA14dqAnbaixANOgw7xx+HxQ0crfXAruhBPYUX2dClK925Z13yCSFUXc5Z3XW6gGpiNtWAmUyhWXNBAUIOZFN8EnoRLQa2O9qbwUfaZ2u4qP1TariQXmDG9rSEjIH1SgIS7FIHreTQKHw4JkDxjQZBBFaKZOQ8uOHdJGItYqGQC5oI1TsppEDKSSZqB5xyAYwMYie0Con6W0Hu19MxkbTWJepgJ9qf7N4Mup/5peVO19zNxtYeP0ZXl5C+RaHq
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(346002)(136003)(396003)(366004)(39860400002)(451199018)(33656002)(122000001)(38100700002)(6506007)(9686003)(186003)(26005)(4326008)(6916009)(86362001)(66556008)(41300700001)(66946007)(8676002)(66476007)(76116006)(66446008)(64756008)(2906002)(52536014)(8936002)(5660300002)(966005)(38070700005)(478600001)(55016003)(316002)(54906003)(7696005)(71200400001)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?CmP1E+pfAK3mBASMDnDM1XL1+0NbpPqHmf/7DVRzH0cKQkrsRcrhOQxNDJ?=
 =?iso-8859-1?Q?ZLa1xBM9wzfKaPhvYrvUV8HZ49LZiS5N3Rj7NAW2ElR/4glS5eitlAHlub?=
 =?iso-8859-1?Q?eYrGNsiAdocuLv8PTS7FcGtoQWwnp9vBkGFGkQ7iTEgRuXJzUGWTaPZo+x?=
 =?iso-8859-1?Q?/GwT9+ztEVb4ByGNLRrLpGZkCrX7Q0xJmmuyPsjpX1ol8/9tLnS3JS7H2x?=
 =?iso-8859-1?Q?kqA5wRBOTpwnAUc9LwPONWVBDCJVYY8xkLyrkYjbNTppoXaqdbimrc8696?=
 =?iso-8859-1?Q?1qXCg95Bct+PYx5nUBVbagh/MutrzTfQbxckAA5TjudqF1ox7Qu5Oz+6c+?=
 =?iso-8859-1?Q?Zj0RS5iAJalGmA3DM6g3uKmLBsuQwjK4nkCfK3BPETHoQloaCKKLgZhWHd?=
 =?iso-8859-1?Q?bZaBrSwx1iQkOojWO16kRuKo81nO1TIKk9P3iRyG3szkjkS38X7dZpmNqh?=
 =?iso-8859-1?Q?srOalM5wuJf6rgerDAdh7alGcRgT1abz7YkKwJYGGaerI7LALiXeO9oZD2?=
 =?iso-8859-1?Q?e/RkXIQioNR4M2KAKQ0nC26y0Bxxf5ZQkh2gl2Co7illNpqZSJiL5bvzqN?=
 =?iso-8859-1?Q?dtSuQU3Tz4Nwzk8kzQiwCbruJcJ2XQrWQ2DyKNpABqk+Vb1jszbfcQZrab?=
 =?iso-8859-1?Q?ZAMVZR8s71HfR+o4b4uA7PGW4QkingJ67gdNFMEcjcz5S8JqFFx4z7VK4L?=
 =?iso-8859-1?Q?8lNoiwrKOW8R/lRkkGky+fCL2AYZ+9GL3sy+dRlSaoe0N0NrTEEQxrQv/d?=
 =?iso-8859-1?Q?CFybYuCnZHmcAXA83IQyifShJS2RJ22IFfVRrnGOmA9kJ4XxMXkWc9WMKu?=
 =?iso-8859-1?Q?3IK7owqwjuXKheOSdCdVNfqSP4BXAZ0Are2JXjOJsi50IIALfMI1IOvmdh?=
 =?iso-8859-1?Q?KvYU3MXTuHudSF96w8ae9isWY6trhQPxcjQFneWkSykozl563jPaSYZmt2?=
 =?iso-8859-1?Q?MZMxIUsKk47JRfWyT6LiNpOyjWx2wqw0utHIz5AdhWCNg5NO8LMKg0vG6G?=
 =?iso-8859-1?Q?55Sszz5B/Y3cGaHhbj2zVjBoaHGAzHpe8aWF6YdKsC4a1B2tFu9NjoLPGr?=
 =?iso-8859-1?Q?SEHK/is3sWr7Ps7G6CdJFcxKjQgq+ZQaHUpQcg4jGdJVeXTh3FY+FgaFap?=
 =?iso-8859-1?Q?r6ShGR/981vZ4lPIA7VaCTjnmwzrcFQlJG3oOmBr7doaipxSw75zuu+jg0?=
 =?iso-8859-1?Q?4oftOiQEJ8Aak+C6vCldmOuQK4+7tpM6ZhuklvJwcjCVCV26dzja13iPf2?=
 =?iso-8859-1?Q?G5SFSltqGhrQD8tzBPSTDqRuzjdf6COud50bvM7jxqolJvD018GIWq5Gp+?=
 =?iso-8859-1?Q?utMqbizMhNCo7k2QI8NXrIbdPbARWOJ2n+qj81UmYFV9GZhiTEJPWdcacH?=
 =?iso-8859-1?Q?c0MShJGOpGWwxs1a9sxmgVt0qXlbUB8fH/nCFs41SaAL/QrpbwEOcjZBDr?=
 =?iso-8859-1?Q?gq/8VLQXk4EdBzNqXowEiKjmZnGnm8o9gC6Q0Ve7XfUk5syHnJF31wI3xa?=
 =?iso-8859-1?Q?kt6Hfra0aB/DohWJjNQFxy7aVcQTjJblTlSDWJLOz6OY2/L+wnhPiYMvkX?=
 =?iso-8859-1?Q?RxmKOlqqvWmYA8ZkGeudnGUsVwc1IT8WNa9gD7YQZ8uqCwX592wDhW1gOD?=
 =?iso-8859-1?Q?tMnOPTuIN5yARAFMHfyxWDudcukUspw8DojjtLzGIwmS1oS3jtz8MqQg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5d33251-22c9-496d-d102-08db10f43018
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2023 14:35:16.7585
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lZHt6ndFgnD5ShoYhDt7pP/IGADuw2ZRouuWT63c8l6LiPHdPca8aW+GzT1k9RVp0I89oFZXOSKlJBkLI4oWObhqQS7rJjtvDpcriyAGhwE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB5928
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Andy,

Thanks for the feedback.

> Subject: Re: [PATCH v4 6/6] serial: 8250_em: Add
> serial8250_em_{reg_update(),out_helper()}
>=20
> On Fri, Feb 17, 2023 at 11:42:55AM +0000, Biju Das wrote:
> > As per RZ/V2M hardware manual(Rev.1.30 Jun, 2022), UART IP has a
> > restriction as mentioned below.
> >
> > 40.6.1 Point for Caution when Changing the Register Settings:
> >
> > When changing the settings of the following registers, a PRESETn
> > master reset or FIFO reset + SW reset (FCR[2],FCR[1], HCR0[7]) must be
> > input to re-initialize them.
> >
> > Target Registers: FCR, LCR, MCR, DLL, DLM, HCR0.
> >
> > This patch adds serial8250_em_reg_update() and serial8250_em_serial_
> > out_helper to handle it.
> >
> > DLL/DLM register can be updated only by setting LCR[7]. So the
> > updation of LCR[7] will perform reset for DLL/DLM register changes.
> >
> > EMMA mobile has the same register set as RZ/V2M and this patch is
> > tested on
> > EMEV2 board. So, there is no harm in applying the same restriction
> > here as well as the HW manual for EMMA mobile is not updated for a long
> time.
>=20
> ...
>=20
> > +	serial8250_em_serial_out_helper(p, UART_FCR_EM, fcr |
> UART_FCR_CLEAR_RCVR |
> > +				 UART_FCR_CLEAR_XMIT);
>=20
>=20
> I would put it like
>=20
> 	serial8250_em_serial_out_helper(p, UART_FCR_EM, fcr |
> 							UART_FCR_CLEAR_RCVR |
> 							UART_FCR_CLEAR_XMIT);
>=20
> ...

OK.

>=20
> > +	switch (off) {
> > +	case UART_FCR_EM:
> > +		fcr =3D value;
> > +		break;
> > +	case UART_LCR:
> > +		lcr =3D value;
> > +		break;
> > +	case UART_MCR:
> > +		mcr =3D value;
>=20
> Missing break; statement.

OK, will fix this in next version.

The original driver has some missing breaks[1].
So for consistency I dropped this. same for below.

[1] https://elixir.bootlin.com/linux/v6.2-rc8/source/drivers/tty/serial/825=
0/8250_em.c#L45

Cheers,
Biju

>=20
> > +	}
>=20
> ...
>=20
> > +	switch (offset) {
> > +	case UART_TX:
> > +	case UART_SCR:
> > +	case UART_IER:
> > +	case UART_DLL_EM:
> > +	case UART_DLM_EM:
> > +		serial8250_em_serial_out_helper(p, offset, value);
> > +		break;
> > +	case UART_FCR:
> > +		serial8250_em_reg_update(p, UART_FCR_EM, value);
> > +		break;
> > +	case UART_LCR:
> > +	case UART_MCR:
> > +		serial8250_em_reg_update(p, offset, value);
>=20
> Missing break; statement.
>=20
> > +	}
>=20
> --
> With Best Regards,
> Andy Shevchenko
>=20

