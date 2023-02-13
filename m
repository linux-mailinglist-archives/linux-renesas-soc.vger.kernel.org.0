Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F0656944BB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Feb 2023 12:40:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229992AbjBMLkz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 13 Feb 2023 06:40:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229570AbjBMLky (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Feb 2023 06:40:54 -0500
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2090.outbound.protection.outlook.com [40.107.215.90])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D73A113DA;
        Mon, 13 Feb 2023 03:40:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nKyGDKnu4M0yAf7PZ/G0MbvzF4/fkj4jyGRGXgt0k46mDFJRM9XRsXmV07mY8fFa4muVTNAF83EgC7oZWXYOmPHSGlx7HQytY2kmWQbhzpJI/CeoafM6lU4vMEDN+eQ6MNIqeAnBCpBFSpvmcKOBKpVb7ZJUUhrbnxyt9uyh/xA+9lJ9cUhnjusJgA3Q4lo2uO6detbIFs7afLRvwECddbNa/AXOZnKFoZBVDo9CCfj4VIGAkTCDxDC8iMMXaGado4URt/WWLHpnFlujJisSf7dA/r3fXc+hVNF2qFu9U8GS2OR+CuHo4EiiVaHc1M6Q+4laXIccKb27dG8cqP5t+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=41IDle5Vdzw4nqtXD3xs2H4Av7hUndSzHjcMDarQPD4=;
 b=Nyay+vxcVOT32LNYCIy7TpLqhC9ZSyYllAfX17WLgfkL5hAHsinsxKu/kHYYi6XoYtsahRYr8srSHp1cqP+hrxo/2vfDZnIooL+slnPS5L7XQuoLk4FktsWq6/3l9E8ukoOyOeGCWdbcubhq0emmEwBwAjmSV4TEZZdzm8w0GpsC5hPl9MfmhDIjcrwH1R4Y0afntBA3k0dyjN4nnFIIueXMcXKsrip5tnqLlPkD7rwzJ39X4SBwaFFQAiugDEhx0jIEkswVQ7qm+Wfv/H01p9oG97jJpAZhAjWMM0TSWYcJDH8Vgm1cLFhlq0dnp7XSNd2Sr/rhidzLnK1pYaFG1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=41IDle5Vdzw4nqtXD3xs2H4Av7hUndSzHjcMDarQPD4=;
 b=YRoL3t24TTny8Xrxl2juDXbu2jyjtIEaYBO6Bk4pTbann+60Mf9V8Uh/A6hrbDqFkyZvxRJXo51S8fzTXCuTzLaEOW4j+J3RNX5BZIwy5PZ4XwpN5hubu5T8w1eyIf28GJ6PqWs0ZMPpkljg4Ol3VJOXIc+/dP0/RnNL/Kg6ePI=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYCPR01MB8357.jpnprd01.prod.outlook.com (2603:1096:400:15f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Mon, 13 Feb
 2023 11:40:40 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::343d:7339:78e5:a46e]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::343d:7339:78e5:a46e%7]) with mapi id 15.20.6086.024; Mon, 13 Feb 2023
 11:40:40 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     =?iso-8859-1?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
CC:     Jiri Slaby <jirislaby@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        =?iso-8859-1?Q?Niklas_S=F6derlund?= <niklas.soderlund@ragnatech.se>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-serial <linux-serial@vger.kernel.org>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v3 3/3] serial: 8250_em: Add serial_out() to struct
 serial8250_em_hw_info
Thread-Topic: [PATCH v3 3/3] serial: 8250_em: Add serial_out() to struct
 serial8250_em_hw_info
Thread-Index: AQHZPY8kj9QN2R7bt0udUTepz/GAba7Mkw8AgAAAZ9CAAAeJgIAAAGyAgAAAnACAAAB4EIAABLMAgAAbYICAAAWmAIAAAMYw
Date:   Mon, 13 Feb 2023 11:40:40 +0000
Message-ID: <OS0PR01MB59227AE1C2A89B75DFBF8F8286DD9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230210203439.174913-1-biju.das.jz@bp.renesas.com>
 <20230210203439.174913-4-biju.das.jz@bp.renesas.com>
 <56b431df-be7f-474c-8cf5-30c2eaa2745a@linux.intel.com>
 <OS0PR01MB5922A860B77A9BC0C9E5E3AC86DD9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <cc7f4d69-7e68-0d0a-4b89-c4e16dff716b@kernel.org>
 <56c8fdab-a037-ea00-d83e-f75c92566d92@kernel.org>
 <f10bcddd-2905-3f63-dd0a-8424798932dc@kernel.org>
 <OS0PR01MB592210E15CD943F1987316F086DD9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <283b2e79-e992-dc35-2a79-feccc93103fb@kernel.org>
 <OS0PR01MB5922139BA73BBBE2556161DA86DD9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <4cfed9ad-bf89-7b1-40cd-7def4c64f1@linux.intel.com>
In-Reply-To: <4cfed9ad-bf89-7b1-40cd-7def4c64f1@linux.intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYCPR01MB8357:EE_
x-ms-office365-filtering-correlation-id: d613ebd8-f88d-4e9c-8fa7-08db0db72206
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: c8nUHPoOx/tzcgFH8eFyQOt8gDUERRhMcxWT7fgzR5mnYfjkM5z6Qp2/8w/+/8qpNlrFPbU0i5wAf0ROldeeigG7AD/XCHhRVO/IKBaW5iFF794ydrVhI0m2ns8q16BJXqEtRzTbtj7rX+ysCAyJSwVmhhXLca+Eym4H7Ah84zrkcmD769DF2DBgNNACGlxITAUokI5UumIb1vFcl/RZVN9j6wneQ9A0AXUbPGY5XsvbGrw6o11WZH2QEqT5VKRFj4QWhpyDGYgxVK35K05+VPnp8hY4Uh1v+NAqbQZtmqNXBDoNTNTbxi/x8Yrq9j+pn+JgS/n9K47ekZDyIEvlBLvjb5bciGm2B8IUp9MG7RCekeLu7XkCcZuNobzLkpZdfKf7JOo8vd3HVQfdmw73LJJplCmCr3Qo12QNiQiwC9nQA485AUua7KpCWL2AhEzk7hRIOAI1EXVmb+Re30sC0zZAI/gkPZL35pS8FtqH6fTn47Ao2+xvC4r81dK83L5Y3lMlCO7sjap8I+DtJKOBgjuliA31CSDdGm/EqQWn9JfAUKmRCUxzvFovelIQdfBaSP9ctDR/LNLQKAdGfBYAfc1YMlB+yLCmAYHOp5nPhJjasPn+XDMiFDQAVl26rNz1+2bT1EP/nGQ9TWANviJeRtgZ1oO0WvdxoNlKpnVB7FhR5ldhtfox7vSrvHD+ZzODimyrlXo4wUSrmoryJz7/Hg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(346002)(396003)(366004)(136003)(39860400002)(451199018)(2906002)(83380400001)(7696005)(38100700002)(6916009)(122000001)(38070700005)(55016003)(86362001)(76116006)(4326008)(316002)(5660300002)(66946007)(8936002)(54906003)(52536014)(186003)(66476007)(66556008)(64756008)(8676002)(41300700001)(6506007)(33656002)(9686003)(26005)(71200400001)(66446008)(53546011)(478600001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?Afa2nA+mG5tqkRl6yZUfz7DabXQqX+Y4/x2+T5x3iVrnFNKb0LvUbSb05A?=
 =?iso-8859-1?Q?UsdclqduTNqOCfrH2EgdNT0Th1J+iikTBVjyEwnEx4zY0XozCe3ipnVcta?=
 =?iso-8859-1?Q?ghrbD1r3ddbgoktb/h0j0RMpblY31KFDbeg5OSHR2Yti+yqrDG6Ed4+dUc?=
 =?iso-8859-1?Q?vCFgMT4yROsge8V+N7fwZwB+uMrTlQ5CHA8JLsgTfm85D+agrh7raOBQkV?=
 =?iso-8859-1?Q?Gpt0RCAAY6CWl9YLbEfkAb/cdVkkM2c4+D7JXmfMfW+3MHJdj+e5V0TSfS?=
 =?iso-8859-1?Q?qN0mdZLpp4ZBWne08xnVQDK270MtXUWZzBR3+ODVbi1Cmx7yi7Qgkz4eIu?=
 =?iso-8859-1?Q?qKvVSrp2ZJ7NbbiIW1pjihzJK4prpXRIe+ZhXvF5B04FTsPw0nwshhYpXs?=
 =?iso-8859-1?Q?KWCOumfN+CQDovi1ezJQ/OixuezFFMJliTlTfl1yKt1ww0R8vd18taKfeX?=
 =?iso-8859-1?Q?iAdtNeuk2lNaKHVD9dcPR2JI9IAfCW/ddH/sBjJFZrm3uJnVpi1h5A9nZk?=
 =?iso-8859-1?Q?TMv6oitg7VcH+mygtlbPC5SX3FBZwfK4W/T+XsvlpEjKDKASuSOQ5glMvI?=
 =?iso-8859-1?Q?TEDJJrJh2m7MEQNsAYhSjc8hat6GZJ2V2ENcgBtgtKpfTjKcMhu22j6//H?=
 =?iso-8859-1?Q?1/t5qSjncjrBgw/odmo9pss/T3/yJSHQBu62K8SlgW6GkCOmV2q8YbW3do?=
 =?iso-8859-1?Q?h40/xigXzPYG7NDx2v/umfMVoAzFmqexco3vtTBshb5/8iHBIJ5xqHiadD?=
 =?iso-8859-1?Q?frO7+6KK4dnGkWNaK4NBJmQDBqdd08p2xgOcfz8W1/xHLVp6gSGlYmD8YX?=
 =?iso-8859-1?Q?Mq0obe70tS20cObsuTJJoLFwHvmfqEW+GvzHNwk9BUoxqGkMrFUnkofp8P?=
 =?iso-8859-1?Q?qToDYfC+pxlRhheMR1vqZf17ATjPGqud8yehQ0VEyYQwi32eKIi645zg6w?=
 =?iso-8859-1?Q?dGO/0mvDPgYwHWkfCzgHjJlktBh3zwDNve8kMi5MtKcbCXKJwtdhvfyptA?=
 =?iso-8859-1?Q?au3pdfa0lTMg0JqiUESGzi9cem4SjU0u8cBhZmfYt8eftU0fMVKLMxf1m9?=
 =?iso-8859-1?Q?Bgr8ECj9e/anB502wjgunnEa+V0qcXobokrI/TVYR4HD0AsjzgwnuZVDJN?=
 =?iso-8859-1?Q?dr5i1cgLmYiYBOYF8kCoLSEVSfG3PvqiVoEL9EcNVRj7+c4VJoXKNfnBOW?=
 =?iso-8859-1?Q?IB4NjPjEn4UHRU3lq2105aTd9LfbJ9DJdvSfxncsI+liphS4pERcftpLOm?=
 =?iso-8859-1?Q?c+g3u60cQ/Xn9MFwvAMSQ4ooAxaDQMmBRhiSG3d2S1XjgmcbLI1W9FUOUk?=
 =?iso-8859-1?Q?5FnihB7CD8kNqh1nNK8Wkw7RUQVRBjje0tJe70mk48DnH6l6DveZnxWYJP?=
 =?iso-8859-1?Q?NcqOZtMeJlxtkna4rB+qerVoJfx4cw8X3Aq+lSlaUev/ox5rInOi3SoijV?=
 =?iso-8859-1?Q?FJE+8N96p8WZVQuwCUsp/2FUrJi0ATcCAHzVMipH5zXGh0ZjwKBGbu9DiG?=
 =?iso-8859-1?Q?0fwQh82zcITImA94Ix4QaG+9Fyuvfr5RFIBuejUDtPHxyq7AtbRbRdpoQU?=
 =?iso-8859-1?Q?Qfjnw++dYfPvXoN2KXTAyAjlw0alPhvLwkmHRMhXs23LF05Uib7gcAGE+/?=
 =?iso-8859-1?Q?QgT/StSRhMxv2JDctRIdhY2aEakUzr4XRUj2M55hVWQK0aSt5JJr2mDA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d613ebd8-f88d-4e9c-8fa7-08db0db72206
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Feb 2023 11:40:40.3776
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vvwDPLTA3gi/n5v6LYLWgQDiMldGZRA3e2JlY6CY/TMGHno5/nFBrcRA36sCpOENVd3hGZZ/kSs/CxIcl0PokJDqvxOp0/6f4tCarYlqxAk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8357
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

> Subject: RE: [PATCH v3 3/3] serial: 8250_em: Add serial_out() to struct
> serial8250_em_hw_info
>=20
> On Mon, 13 Feb 2023, Biju Das wrote:
>=20
> > Hi Jiri Slaby,
> >
> > Thanks for the feedback.
> >
> > > Subject: Re: [PATCH v3 3/3] serial: 8250_em: Add serial_out() to
> > > struct serial8250_em_hw_info
> > >
> > > On 13. 02. 23, 10:31, Biju Das wrote:
> > > > So looks like similar to other macros, UART_FCR_EM (0x3) is sensibl=
e
> one.
> > > >
> > > > UART_FCR_RO_OFFSET (9)
> > > > UART_FCR_RO_EM (UART_FCR_EM + UART_FCR_RO_OFFSET)
> > > >
> > > >
> > > > static unsigned int serial8250_em_serial_in(struct uart_port *p,
> > > > int
> > > > offset) case UART_FCR_RO_EM:
> > > > 	return readl(p->membase + (offset - UART_FCR_RO_OFFSET << 2));
> > >
> > >
> > > Please send a complete patch as a reply. I am completely lost now.
> >
> > Please find the complete patc.
> >
> >
> > From e597ae60eb170c1f1b650e1e533bf4e12c09f822 Mon Sep 17 00:00:00 2001
> > From: Biju Das <biju.das.jz@bp.renesas.com>
> > Date: Tue, 7 Feb 2023 15:07:13 +0000
> > Subject: [PATCH] serial: 8250_em: Add serial_out() to struct
> > serial8250_em_hw_info
> >
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
> > This patch adds serial_out() to struct serial8250_em_hw_info to handle
> > this difference between emma mobile and rz/v2m.
> >
> > DLL/DLM register can be updated only by setting LCR[7]. So the
> > updation of LCR[7] will perform reset for DLL/DLM register changes.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
> >  drivers/tty/serial/8250/8250_em.c | 70
> > ++++++++++++++++++++++++++++++-
> >  1 file changed, 69 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/tty/serial/8250/8250_em.c
> > b/drivers/tty/serial/8250/8250_em.c
> > index 69cd3b611501..c1c64f48ee7e 100644
> > --- a/drivers/tty/serial/8250/8250_em.c
> > +++ b/drivers/tty/serial/8250/8250_em.c
> > @@ -17,12 +17,23 @@
> >
> >  #include "8250.h"
> >
> > +#define UART_FCR_EM 3
> >  #define UART_DLL_EM 9
> >  #define UART_DLM_EM 10
> > +#define UART_HCR0_EM 11
> > +
> > +#define UART_FCR_R_EM	(UART_FCR_EM + UART_HCR0_EM)
>=20
> It's easy to lose track of all this, IMHO this would be simple:
>=20
> /*
>  * A high value for UART_FCR_EM avoids overlapping with existing UART_*
>  * register defines. UART_FCR_EM_HW is the real HW register offset.
>  */
> #define UART_FCR_EM 12

I will change it to #define UART_FCR_EM 14=20

And will add the below unused HW status registers in the driver.

#define UART_HCR2_EM 12 (@30)
#define UART_HCR3_EM 13 (@34)

Is it ok?

Cheers,
Biju

> #define UART_FCR_EM_HW 3
>=20
> Then use UART_FCR_EM consistently within the function you add for RZ so
> you'd need provide both _in/_out with UART_FCR_EM. (You'll have both
> UART_FCR and UART_FCR_EM cases in _out but that seems fine, IMHO).
>=20
> To me that would look the cleanest workaround to the overlapping defines.
>=20
> --
>  i.
>=20
>=20
> > +#define UART_HCR0_EM_SW_RESET	BIT(7) /* SW Reset */
> >
> >  struct serial8250_em_hw_info {
> >  	unsigned int type;
> >  	upf_t flags;
> > +	void (*serial_out)(struct uart_port *p, int off, int value);
> >  };
> >
> >  struct serial8250_em_priv {
> > @@ -46,6 +57,7 @@ static void serial8250_em_serial_out(struct uart_port
> *p, int offset, int value)
> >  		fallthrough;
> >  	case UART_DLL_EM: /* DLL @ 0x24 (+9) */
> >  	case UART_DLM_EM: /* DLM @ 0x28 (+9) */
> > +	case UART_HCR0_EM: /* HCR0 @ 0x2c */
> >  		writel(value, p->membase + (offset << 2));
> >  	}
> >  }
> > @@ -55,20 +67,74 @@ static unsigned int serial8250_em_serial_in(struct
> uart_port *p, int offset)
> >  	switch (offset) {
> >  	case UART_RX: /* RX @ 0x00 */
> >  		return readb(p->membase);
> > +	case UART_LCR: /* LCR @ 0x10 (+1) */
> >  	case UART_MCR: /* MCR @ 0x14 (+1) */
> >  	case UART_LSR: /* LSR @ 0x18 (+1) */
> >  	case UART_MSR: /* MSR @ 0x1c (+1) */
> >  	case UART_SCR: /* SCR @ 0x20 (+1) */
> >  		return readl(p->membase + ((offset + 1) << 2));
> > +	case UART_FCR_R_EM:
> > +		return readl(p->membase + (UART_FCR_EM << 2));
> >  	case UART_IER: /* IER @ 0x04 */
> >  	case UART_IIR: /* IIR @ 0x08 */
> >  	case UART_DLL_EM: /* DLL @ 0x24 (+9) */
> >  	case UART_DLM_EM: /* DLM @ 0x28 (+9) */
> > +	case UART_HCR0_EM: /* HCR0 @ 0x2c */
> >  		return readl(p->membase + (offset << 2));
> >  	}
> >  	return 0;
> >  }
> >
> > +static void serial8250_rzv2m_reg_update(struct uart_port *p, int off, =
int
> value)
> > +{
> > +	unsigned int ier, fcr, lcr, mcr, hcr0;
> > +
> > +	ier =3D serial8250_em_serial_in(p, UART_IER);
> > +	fcr =3D serial8250_em_serial_in(p, UART_FCR_R_EM);
> > +	lcr =3D serial8250_em_serial_in(p, UART_LCR);
> > +	mcr =3D serial8250_em_serial_in(p, UART_MCR);
> > +	hcr0 =3D serial8250_em_serial_in(p, UART_HCR0_EM);
> > +
> > +	serial8250_em_serial_out(p, UART_FCR, fcr | UART_FCR_CLEAR_RCVR |
> > +				 UART_FCR_CLEAR_XMIT);
> > +	serial8250_em_serial_out(p, UART_HCR0_EM, hcr0 |
> UART_HCR0_EM_SW_RESET);
> > +	serial8250_em_serial_out(p, UART_HCR0_EM, hcr0 &
> ~UART_HCR0_EM_SW_RESET);
> > +
> > +	switch (off) {
> > +	case UART_FCR:
> > +		fcr =3D value;
> > +		break;
> > +	case UART_LCR:
> > +		lcr =3D value;
> > +		break;
> > +	case UART_MCR:
> > +		mcr =3D value;
> > +	}
> > +
> > +	serial8250_em_serial_out(p, UART_IER, ier);
> > +	serial8250_em_serial_out(p, UART_FCR, fcr);
> > +	serial8250_em_serial_out(p, UART_MCR, mcr);
> > +	serial8250_em_serial_out(p, UART_LCR, lcr);
> > +	serial8250_em_serial_out(p, UART_HCR0_EM, hcr0);
> > +}
> > +
> > +static void serial8250_em_rzv2m_serial_out(struct uart_port *p, int
> offset, int value)
> > +{
> > +	switch (offset) {
> > +	case UART_TX:
> > +	case UART_SCR:
> > +	case UART_IER:
> > +	case UART_DLL_EM:
> > +	case UART_DLM_EM:
> > +		serial8250_em_serial_out(p, offset, value);
> > +		break;
> > +	case UART_FCR:
> > +	case UART_LCR:
> > +	case UART_MCR:
> > +		serial8250_rzv2m_reg_update(p, offset, value);
> > +	}
> > +}
> > +
> >  static int serial8250_em_serial_dl_read(struct uart_8250_port *up)
> >  {
> >  	return serial_in(up, UART_DLL_EM) | serial_in(up, UART_DLM_EM) << 8;
> > @@ -120,7 +186,7 @@ static int serial8250_em_probe(struct platform_devi=
ce
> *pdev)
> >
> >  	up.port.iotype =3D UPIO_MEM32;
> >  	up.port.serial_in =3D serial8250_em_serial_in;
> > -	up.port.serial_out =3D serial8250_em_serial_out;
> > +	up.port.serial_out =3D info->serial_out;
> >  	up.dl_read =3D serial8250_em_serial_dl_read;
> >  	up.dl_write =3D serial8250_em_serial_dl_write;
> >
> > @@ -144,11 +210,13 @@ static int serial8250_em_remove(struct
> platform_device *pdev)
> >  static const struct serial8250_em_hw_info emma_mobile_uart_hw_info =3D=
 {
> >  	.type =3D PORT_UNKNOWN,
> >  	.flags =3D UPF_BOOT_AUTOCONF | UPF_FIXED_PORT | UPF_IOREMAP,
> > +	.serial_out =3D serial8250_em_serial_out,
> >  };
> >
> >  static const struct serial8250_em_hw_info rzv2m_uart_hw_info =3D {
> >  	.type =3D PORT_16750,
> >  	.flags =3D UPF_BOOT_AUTOCONF | UPF_FIXED_PORT | UPF_IOREMAP |
> UPF_FIXED_TYPE,
> > +	.serial_out =3D serial8250_em_rzv2m_serial_out,
> >  };
> >
> >  static const struct of_device_id serial8250_em_dt_ids[] =3D {
> >
