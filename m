Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 60EA6694C05
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Feb 2023 17:06:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230021AbjBMQG1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 13 Feb 2023 11:06:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229694AbjBMQG0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Feb 2023 11:06:26 -0500
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2112.outbound.protection.outlook.com [40.107.255.112])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62E571C58B;
        Mon, 13 Feb 2023 08:06:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K9f29l207lGLa+qc47XbJ4vBtkbYEuLu+Vmt+FecwnuHFvCV0iGf2VyPlUxu+AG34N0uyGax68V86h+2+tTEdkGsbAphrolvL1svG+USY2QKfvHTwFEJr92b+AHHdLX7KWDYD7ENhXAAHHsXjlVj2pZsXY+I3EprhN8RyW+/8ukwg8cjsJtwquPdW0bEcggqmK5btRjJX8MV442JWWI3HTl2vZCmhQFq/zPhKRdeyLUp8kABlipHVTl6JvlCL0BO45Q9faDflp93ickBIb77plbRrNT6OUz9xi8v72XaIZrkVogEABWS1dE5zSKy9e9UXsP1NWu8tE+OJ49DoRuiWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZEsRsLqlwTedIcu5u4NsejPn5EW8Or71OR5U3GAnfEo=;
 b=aYz/GLV6RkY2loW+khyLzf1m5y9HpUL2qnG0Yap+yxqNFnI1ax1zh4ueWEIX7OZoy0yNjRQNCk2DxdYYxJMj0JgXlyo3OGK9hjD0vzKR8TitXzPxqRXc1ST0QFOKVb+auktH3TFoySC0FKqQGIq+7melRkGH+QTy6qVUx4EOb3soZtuVXVcGOzF27oalczlWHdRuQyLUrPK+EYDmardp9+UQDykKackWcUm56vlc/EXzeGtZqIWnvZstTBmA7kE5nBes6/XUryguvcyhxc1Gu9sOQCM9InpxsyLz322ON9uDICm5VbhrZv4zghAy7lgawmddwzKcVi+/JKHoAS6BFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZEsRsLqlwTedIcu5u4NsejPn5EW8Or71OR5U3GAnfEo=;
 b=Lllt6k8XPNxf+O6leYnjxQv/Ftggd16PHqS3JhK8LTIh2NVasZnOYL6ArKEumQzq3CopBUIz4udyVjkCCo7ZgxQTHUO4IRGjXQICPf+Btop3QWOLx8N75B8iXCbrbAWqQsdyMoaX4dI3u1E3AtfLHXy/JBF7y2aZ1E3cXR8ONQ0=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYWPR01MB12037.jpnprd01.prod.outlook.com (2603:1096:400:3fd::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Mon, 13 Feb
 2023 16:06:20 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::343d:7339:78e5:a46e]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::343d:7339:78e5:a46e%7]) with mapi id 15.20.6086.024; Mon, 13 Feb 2023
 16:06:20 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     =?iso-8859-1?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC:     Geert Uytterhoeven <geert+renesas@glider.be>,
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
Thread-Index: AQHZPY8kj9QN2R7bt0udUTepz/GAba7Mkw8AgAAAZ9CAAAeJgIAAAGyAgAAAnACAAAB4EIAABLMAgAAbYICAAAWmAIAAAMYwgAAIzICAAAK3kIAAP6DA
Date:   Mon, 13 Feb 2023 16:06:20 +0000
Message-ID: <OS0PR01MB5922C215BB4780846E23246A86DD9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
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
 <OS0PR01MB59227AE1C2A89B75DFBF8F8286DD9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <c2e6e9c4-9342-45df-401e-8dffa881e8@linux.intel.com>
 <OS0PR01MB59228E1C6038C8609BBABF5286DD9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB59228E1C6038C8609BBABF5286DD9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYWPR01MB12037:EE_
x-ms-office365-filtering-correlation-id: 894c2831-a9fe-4706-7bd6-08db0ddc3f20
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Csp3HNBYGXdC1rVqDMBrmEkgt65czumaX2U8GrwWHKjEURmwAftLMvu27NbrbtyZXRJUJxuBQHB74vHToJ5NEBsOuAHwV5NhTQrijU4y25zMlbsBTUsT3PF1BYVkTTA6whBNh4VTDlL33oOplWvrpXXfMVyPnKdE91sH2xnmn8+h5n2Jxm3qNIzM3Ggz089kn9LbjI9k6BFFeS7EWiLgOmbC/TBFDLAnngz414TJwq+7sVnDpxFWU7heKL0XtDwIBIMevdgN13yB4wLSe2cDWg48bREhx0t/H4ZNtJwU6xIulQeZGEuBqtx9CHYUTjXmVRNTq23Ah2/JmgXvOK3xIl7O2sktHf5cPd7Ea9ou3Z38LLU6tNAntd5SuilKlyrsjwHJfavHP7Rg/MY6MekwX1CTJQhX/M+/a2NcbzMwpRY4KG3lR/BuPLi8rL6acElWRPPvdMvEdRNNkfY9AoWRpG/D1+dPLdsOSFNNDP2mbr5hoi3QYH6MGLEiD20T/O6lygIj7lyGuFOtG5eLNK1kiWqNo7p+Q508O8dsPtl/PiB+idjEYGnx/Cq5hUku+EtTyUDiTo9A3uPEjSufsIJzf4phcWiTyOYtFPmENi/IfKvmN6yOsBTAWOv/NaeR4LGhk3I82qSZmxHnu1y8G0VLq4yv979VjUVy6gL/+j/NHqzF/5K8gd8t8zbehX02xoCvhRsS2vrnwvdC9pHzklIsnA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(396003)(346002)(376002)(366004)(136003)(451199018)(38070700005)(7696005)(41300700001)(71200400001)(55016003)(86362001)(54906003)(110136005)(83380400001)(316002)(33656002)(66446008)(64756008)(66476007)(66946007)(76116006)(66574015)(8676002)(66556008)(4326008)(478600001)(5660300002)(52536014)(8936002)(26005)(186003)(9686003)(2906002)(6506007)(53546011)(38100700002)(122000001)(2940100002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?7QCoIQoYpJDl15LCEoBJUlYjM8NeRoR0HPW8pWMx6qtV5ZViFeHrIFO0yP?=
 =?iso-8859-1?Q?nTIskd4Ol84sWoVTXsUW+R2l7aPxIcsDn51TgHZ9Rc9VOpgXl0DWk6Uf3s?=
 =?iso-8859-1?Q?8HVB2DkD73WN3mtbMFyQOaEsLfWu+gAHO8PjtTFUC0sG0dh9jImcmKupE3?=
 =?iso-8859-1?Q?8wNAqB55YHGJiNcu5PXilWizdsyHlxsv3/ZwchR+afj+9rMD6Jxr7mtBZL?=
 =?iso-8859-1?Q?ngqrpCYKXihPPmA9iJxjbKkI6ox+A0gd35tmyZGcTQI2NsBMqPWmGfIHxk?=
 =?iso-8859-1?Q?fetFN+TjXaxGGtNnf2XMwxLSlPkGmv9lmM1BwjvgYTlIc72RcUbP0OHNNa?=
 =?iso-8859-1?Q?IVxyzemek8A9OntkuLGabkK0uqykPHkhgwQ1xGvk/fBxGqQpfy0aVi688J?=
 =?iso-8859-1?Q?OFtXStoaGckSrWp4h7AVM9U5cGJ+tcVjzr6gziMsJQP8UGBFuamXN3yOC4?=
 =?iso-8859-1?Q?EhhFDAk17H0AL/Nf6pmI9Js/QGwOVEBgw2oVcjruD/BT0D/b+yf+lWy0Y5?=
 =?iso-8859-1?Q?k/3axGsXxn+UF/Wr7LPwPesUnvDssz2c54jlb3QUs/X3msh0qMbgMi5XoB?=
 =?iso-8859-1?Q?s+VYSbE6TGTNSG/iGohEGc3oQACXx9PyKWlm4sEYJnK/SaWfbN/X9vXnPr?=
 =?iso-8859-1?Q?KnrQEjLt77Sb049aCgwEi4Ud+3r7MqtcdqMH9gDKTBrHi9n3w5L2Th/7u1?=
 =?iso-8859-1?Q?RKzwT2s+jE6pD+uXSAgyaaRn8uvpucZT7vuc+c6dh0/22FRTCgMgadC7Gf?=
 =?iso-8859-1?Q?qj7PCpCtJLf1Fn0mJFSAlRvXggSONgvNt9cVbiDmlgkw4AtRsK7pKTCsDq?=
 =?iso-8859-1?Q?W9zF4FybIuF13+S4N/rbwG+phbXuBL5veXjeb66GYLfZgQzXFZ/ktqB1Ia?=
 =?iso-8859-1?Q?9KtrvGCbEVqAm2E+rzCM7JB6Bvak6c9bCLdi6O+uiOfxVqkskG+JjjPXbv?=
 =?iso-8859-1?Q?ilBtODBb7gMyMcme3EqPUr4frFvE+3ERjKMxhnLy4n0sXJh+aP//XQBII6?=
 =?iso-8859-1?Q?WcTcYcAQEisa/hx921braBZuomAVvO/lxliRKEqhP7LJYP5mNgX7qwbnKw?=
 =?iso-8859-1?Q?nQilsFWO2l08qA3vAT8feXgeM6fjxe3LMGkuyP+sCBjhXTrt2ax9rnG32p?=
 =?iso-8859-1?Q?et02qf0qQXuFKDCtJDdrqinb75LVCZuFyDUEsAWQb/OmspW6GPKOQrWTX6?=
 =?iso-8859-1?Q?0fdZpu32yUlbWWp22aq4kqb3Nr68InzFEL3N3zdnS7dYq+maVqrZUGF0RZ?=
 =?iso-8859-1?Q?V+bX/41V3eB5cT5hRsmkX3Z8ewV4Z2wtk+L57nvNlPmwiIftSrre5n4vJV?=
 =?iso-8859-1?Q?bJm3vcGoYy0mWMpzG1UWdhGMCbe6ADR88wfIgABA5FDJR6kEpEeb6ZYHT+?=
 =?iso-8859-1?Q?ldavRecsQAQz059fHl6furjuMCahJUAeW3pmn9J91a6GLX6C2+ao4Crlg+?=
 =?iso-8859-1?Q?pt1Cdw0x+mxHdAsG7E4U/0BLAz1XYK4AvoQquDyGGBg+mxWoUV1jk6owTr?=
 =?iso-8859-1?Q?mKQVL4fCpFwjgh1Hemqy39Ap472vChZdSjY7O9fJdtUKCM14Zltv2emj/N?=
 =?iso-8859-1?Q?/6RnALfQ9gNewfQ/J1YAZFXrPgUxecCwDtpXOIvdtxIn5wlwEtxQZ/Czch?=
 =?iso-8859-1?Q?dINzotxqNJdBQ3g0pi7OJvWfA+h6Wc+6FDQetf0AHVgt2hhRvSdiKS9A?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 894c2831-a9fe-4706-7bd6-08db0ddc3f20
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Feb 2023 16:06:20.5804
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: h8DIuo0RBUyLo5blFGIhuLD0K+e55quGILZknr4dv7IhsSWDnoVwoZ/l7B72Upmgb1X3xZ66xQa8iM8nep2Rr/I0ZCGImHzb414FfHWq0Do=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB12037
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi All,

> Subject: RE: [PATCH v3 3/3] serial: 8250_em: Add serial_out() to struct
> serial8250_em_hw_info
>=20
> Hi Ilpo J=E4rvinen,
>=20
> Thanks for feedback.
>=20
> > -----Original Message-----
> > From: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>
> > Sent: Monday, February 13, 2023 12:05 PM
> > To: Biju Das <biju.das.jz@bp.renesas.com>
> > Cc: Jiri Slaby <jirislaby@kernel.org>; Geert Uytterhoeven
> > <geert+renesas@glider.be>; Magnus Damm <magnus.damm@gmail.com>; Niklas
> > S=F6derlund <niklas.soderlund@ragnatech.se>; Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org>; linux-serial
> > <linux-serial@vger.kernel.org>; Fabrizio Castro
> > <fabrizio.castro.jz@renesas.com>; linux-renesas- soc@vger.kernel.org
> > Subject: RE: [PATCH v3 3/3] serial: 8250_em: Add serial_out() to
> > struct serial8250_em_hw_info
> >
> > On Mon, 13 Feb 2023, Biju Das wrote:
> >
> > > Hi Ilpo,
> > >
> > > Thanks for the feedback.
> > >
> > > > Subject: RE: [PATCH v3 3/3] serial: 8250_em: Add serial_out() to
> > > > struct serial8250_em_hw_info
> > > >
> > > > On Mon, 13 Feb 2023, Biju Das wrote:
> > > >
> > > > > Hi Jiri Slaby,
> > > > >
> > > > > Thanks for the feedback.
> > > > >
> > > > > > Subject: Re: [PATCH v3 3/3] serial: 8250_em: Add serial_out()
> > > > > > to struct serial8250_em_hw_info
> > > > > >
> > > > > > On 13. 02. 23, 10:31, Biju Das wrote:
> > > > > > > So looks like similar to other macros, UART_FCR_EM (0x3) is
> > > > > > > sensible
> > > > one.
> > > > > > >
> > > > > > > UART_FCR_RO_OFFSET (9)
> > > > > > > UART_FCR_RO_EM (UART_FCR_EM + UART_FCR_RO_OFFSET)
> > > > > > >
> > > > > > >
> > > > > > > static unsigned int serial8250_em_serial_in(struct uart_port
> > > > > > > *p, int
> > > > > > > offset) case UART_FCR_RO_EM:
> > > > > > > 	return readl(p->membase + (offset - UART_FCR_RO_OFFSET <<
> > > > > > > 2));
> > > > > >
> > > > > >
> > > > > > Please send a complete patch as a reply. I am completely lost n=
ow.
> > > > >
> > > > > Please find the complete patc.
> > > > >
> > > > >
> > > > > From e597ae60eb170c1f1b650e1e533bf4e12c09f822 Mon Sep 17
> > > > > 00:00:00
> > > > > 2001
> > > > > From: Biju Das <biju.das.jz@bp.renesas.com>
> > > > > Date: Tue, 7 Feb 2023 15:07:13 +0000
> > > > > Subject: [PATCH] serial: 8250_em: Add serial_out() to struct
> > > > > serial8250_em_hw_info
> > > > >
> > > > > As per RZ/V2M hardware manual(Rev.1.30 Jun, 2022), UART IP has a
> > > > > restriction as mentioned below.
> > > > >
> > > > > 40.6.1 Point for Caution when Changing the Register Settings:
> > > > >
> > > > > When changing the settings of the following registers, a PRESETn
> > > > > master reset or FIFO reset + SW reset (FCR[2],FCR[1], HCR0[7])
> > > > > must be input to re-initialize them.
> > > > >
> > > > > Target Registers: FCR, LCR, MCR, DLL, DLM, HCR0.
> > > > >
> > > > > This patch adds serial_out() to struct serial8250_em_hw_info to
> > > > > handle this difference between emma mobile and rz/v2m.
> > > > >
> > > > > DLL/DLM register can be updated only by setting LCR[7]. So the
> > > > > updation of LCR[7] will perform reset for DLL/DLM register change=
s.
> > > > >
> > > > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > > > ---
> > > > >  drivers/tty/serial/8250/8250_em.c | 70
> > > > > ++++++++++++++++++++++++++++++-
> > > > >  1 file changed, 69 insertions(+), 1 deletion(-)
> > > > >
> > > > > diff --git a/drivers/tty/serial/8250/8250_em.c
> > > > > b/drivers/tty/serial/8250/8250_em.c
> > > > > index 69cd3b611501..c1c64f48ee7e 100644
> > > > > --- a/drivers/tty/serial/8250/8250_em.c
> > > > > +++ b/drivers/tty/serial/8250/8250_em.c
> > > > > @@ -17,12 +17,23 @@
> > > > >
> > > > >  #include "8250.h"
> > > > >
> > > > > +#define UART_FCR_EM 3
> > > > >  #define UART_DLL_EM 9
> > > > >  #define UART_DLM_EM 10
> > > > > +#define UART_HCR0_EM 11
> > > > > +
> > > > > +#define UART_FCR_R_EM	(UART_FCR_EM + UART_HCR0_EM)
> > > >
> > > > It's easy to lose track of all this, IMHO this would be simple:
> > > >
> > > > /*
> > > >  * A high value for UART_FCR_EM avoids overlapping with existing
> > > > UART_*
> > > >  * register defines. UART_FCR_EM_HW is the real HW register offset.
> > > >  */
> > > > #define UART_FCR_EM 12
> > >
> > > I will change it to #define UART_FCR_EM 14
> > >
> > > And will add the below unused HW status registers in the driver.
> > >
> > > #define UART_HCR2_EM 12 (@30)
> > > #define UART_HCR3_EM 13 (@34)
> > >
> > > Is it ok?
> >
> > It's okay, that number is pseudo one anyway so the actual number
> > doesn't matter. One could just as well pick some large number such as
> > 0x10003 or so if the collision with real regs is a concern.
>=20
> OK will use 0x10003, as pseudo offset.

I would like to use same Hardware restriction for both RZ/V2M and EMMA-Mobi=
le
as both the SoC's have same register sets and it works ok on both these pla=
tforms,
after this restriction is applied.

I guess it is ok for everyone.

Cheers,
Biju
