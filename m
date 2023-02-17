Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A1CF569AF6E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Feb 2023 16:24:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229539AbjBQPYu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 Feb 2023 10:24:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229520AbjBQPYt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Feb 2023 10:24:49 -0500
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2071e.outbound.protection.outlook.com [IPv6:2a01:111:f403:7010::71e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DEF96CA39;
        Fri, 17 Feb 2023 07:24:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cCM5Xnmbn87SBiNZuQxyN4nHCT+m5b0woe+XEIAL7I/AN2TTgqWKRwGw0fMYPniirdS1FYTHGoyT08P4PKePjrFqnKigt6itEpFOJhOPFuUxQ7LhDsEyeJ4RzDBP8HD/Jz18DHYZjvP88IVOAb6bpiPoSRYJ2ep2h3YIKCz0755G8D6yjhpXq89EyDCASbQTDQ1HMq7TNtUFyfGipw+aNQrjxbHiheu9WTuCxNjjb6G78rWNT+ZLZn1p+BF+Fzhdxj1vpjH0ipcN0GD6DZpM8bLNbEPo/+i2rc0EWAPuQSsFyHBnfCS7fMKA6R6pah3kJ0+Inku/XiSy4sZ9MWpzDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vU9xOQKbQOWAco4A3lhHkGb4KPVYT55PP11Qo+ntSZM=;
 b=VwAK5EEONHLNJjY3n8u3d4FIQSuVlRXLH0FINJqFOw+1c0QlJelEEM1PqP/6YYJ5/trJ5tEhRv0yQ5pnOHyfLf8NSaRrq2Mx+f0YyvczvrzUSScY3e3nF3aqvEbZMWIn11y1/bqsRAkT8AR7HpYo/uDmqPAnqXAWxKab6hISTqXwdImXyv0AH0IcDbYxp0FzDOllsIgMUcx2tP8cd+0NDo2x88GkGHmcALAZWu+LTcc64ZYrwsrq0Ya5YohDg9LmFM1tmVOXpxlHPCo+pXZrxwF+uf+wzFCiQwreiLJnhF1XwtYf+RmQCYpF8CDJCMf5lvpM/P3at5wZItsU1LpFkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vU9xOQKbQOWAco4A3lhHkGb4KPVYT55PP11Qo+ntSZM=;
 b=iV3tlVs+q7DDs/Q3QBAa4PMOaIPFiNjWCO9yUV3ywLB+Ek0ELMigYzKuhfRZ2Afo8Go1GhbIBLlSm7IbaKD6Opc1udD3j2Pxc9F7gDYZKlVnFZQqgspqQ70e5a30eoZH/dQnQdDWSRjkQWD1+F/yzRUX13z73Aj6kxhXnzlagDM=
Received: from TYCPR01MB5933.jpnprd01.prod.outlook.com (2603:1096:400:47::11)
 by OS0PR01MB6065.jpnprd01.prod.outlook.com (2603:1096:604:c8::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.17; Fri, 17 Feb
 2023 15:24:44 +0000
Received: from TYCPR01MB5933.jpnprd01.prod.outlook.com
 ([fe80::9eb:3c9a:c2bc:af06]) by TYCPR01MB5933.jpnprd01.prod.outlook.com
 ([fe80::9eb:3c9a:c2bc:af06%6]) with mapi id 15.20.6111.013; Fri, 17 Feb 2023
 15:24:44 +0000
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
Thread-Index: AQHZQsULLWkrxmHF5Eim51yNEnh8Oq7TLqCAgAAFCsCAAAwAAIAAAnHg
Date:   Fri, 17 Feb 2023 15:24:44 +0000
Message-ID: <TYCPR01MB59334480E01178A7F280FC1D86A19@TYCPR01MB5933.jpnprd01.prod.outlook.com>
References: <20230217114255.226517-1-biju.das.jz@bp.renesas.com>
 <20230217114255.226517-7-biju.das.jz@bp.renesas.com>
 <Y++LqQIHuO8BGTm2@smile.fi.intel.com>
 <OS0PR01MB5922982DB09B8F1DFD70602186A19@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <Y++Z9G/ouZQE/BTM@smile.fi.intel.com>
In-Reply-To: <Y++Z9G/ouZQE/BTM@smile.fi.intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB5933:EE_|OS0PR01MB6065:EE_
x-ms-office365-filtering-correlation-id: 4a41cc13-9a44-4abf-39bd-08db10fb18e9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MFlh/JlxfseXgCYWvGg0W+biSi7wvZ1vEf6mjkQrlRko5J4xNdLRzCW0C0TryZjR8kwPXEdnFUoijOoLidOk//yFOQVdn7rKbi1vNiDjef85N1LJhQ/d5Rq9EdjNhhvCJAQQtNLlHQK4Y91ITs5vjGywZHocp5iovl2H4/+BMG5NWsEq55qQGgZGAwThMqtwhRI+4Mj+2i0g+L4tyhJhBwMgTuKQ+mWYsPZMWg35Odcndbnkcf+iAt7FXMx919Bq6Kizwx3fK+m3tRUJmqJpaJriwIKH1iIgMkcbHr8sWpbQKz550XcZLrJPYDPX2LLiIgXKmIJSPNpzRrry9Yn54RhXr1tVXEkCH32IsCbXKydVKwUEVt3jx5BngSJkhfO+tlehBYDlZ9VwXU6qe3p7/wBqGl+vZ0SdIjycHk/ACN2aG1c9lOaqzUH73xvecpTGu17yA7S7RzV9IM2/rqPFlH/dR14n0H/Y511VDA+B9oVYHTZ7Eu7peEPhEVJTrK10HH8WQNXHcSCDv+6Cfokj6zv+jxwoNzEiu6nqL9miAOp8mkMEYhMSEyoh1C3FM3lgD9MSlhO06S1bAKulyINqZfH/bPFyoukLmCD7UYLrYPMngX74p+x3LNfbdvLh6emk4JJGmHkkdKWZh5aGmQCgjVioDZ+qKCD8x30cVob2uhspogUv4u6kmrhgvVL2/Zxf
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB5933.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(136003)(346002)(366004)(39860400002)(376002)(451199018)(4744005)(86362001)(38070700005)(2906002)(38100700002)(122000001)(71200400001)(7696005)(6506007)(54906003)(26005)(186003)(478600001)(33656002)(55016003)(76116006)(66946007)(83380400001)(6916009)(8676002)(64756008)(66556008)(66446008)(66476007)(316002)(9686003)(41300700001)(52536014)(4326008)(8936002)(5660300002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?bMz7Kiv3Q/79iYSUE3QvOMzGJw8QVmod+VOqqLvhTqajPF3biD3njspR+B?=
 =?iso-8859-1?Q?ZVbXRcWRKaFti60hkmmwtloutwyHJe5/qu7sxuPb5owTAuR29D8PpUVF65?=
 =?iso-8859-1?Q?8nhYs4i3kQAQWicdMzCSTnXFMBfUYZTD9jsLau3BPgS16lIH1BsXcUkLcA?=
 =?iso-8859-1?Q?V0vYsp6stkPIS6pjH8ji+32OJkrVzI5m697DtfqO/siYUD4o032wYtZrr9?=
 =?iso-8859-1?Q?4vr/NpIBZLOX924CdHiAI1A2SLhjgU6nORJoL6Uo94Fr7KhPQSR0rWhqyU?=
 =?iso-8859-1?Q?xDlcMnsDddup2To6wImDqs0OOxp4VI7KoAtIEEq2CSjwsMY14GUnykD4bL?=
 =?iso-8859-1?Q?vETuEHHsch00QcZ8uZ4HihV06edA0diRLxTxZ1oh+raWd/1jRQRFM0k9/z?=
 =?iso-8859-1?Q?bnw9qi8qdKq3SyszpFo87DizGkVqRXo1boJ+Ujsb2fDySoW+kBkgVjep8Y?=
 =?iso-8859-1?Q?Wor8oz1FOtxiEBsxBs1BorfboSIW0k/a8bDOrjlG15vYVDReQn72nkLr8K?=
 =?iso-8859-1?Q?dB56F1hpSizbX1KdM7KMmFp+0rHgybW/ALLgqvaSIjjzZ3K+fyudSMF29u?=
 =?iso-8859-1?Q?NmppdEOJ9gnowof9HweKUqdZWKKcwnK9di8Xi71+raFwuiV4GjpSnZDsjV?=
 =?iso-8859-1?Q?tzHEZOkSgUawfPyGKYAmRKOYhVhD7q3e1MDRn31y9KZfbO9OgqRhiPZSlu?=
 =?iso-8859-1?Q?mPx7f8eZDNtOuIG6Vo35GfsM5DuKlsdDOzTLTPnmzgvyEPcVY8uUicOTXO?=
 =?iso-8859-1?Q?TvYiZlKLL470Qxx5rtB3hCCwVSZR2s8lCHiZGmtgrJxnrMEFRQMn09j4DQ?=
 =?iso-8859-1?Q?w+Oh6smuunA9ElrKHk7cTTYXUKLbzkqcAf+5qZvDseZ/LSq5XF8UDpWl09?=
 =?iso-8859-1?Q?dBWXc6T2DvfeWDGqzwcD8HNfgin/sa9VKDf3OpGsgKFsrxuB4whdmLtLaa?=
 =?iso-8859-1?Q?2ONm5ubOpeKrqwkA9wp0fhlwhS+uAPY/iBbcnepsya9DeEysY+0WKVS6J+?=
 =?iso-8859-1?Q?24/AojNQqsj2oLhnePwugbClysCZaWyavlPWKmXZZi8C82npHgQyd15bmU?=
 =?iso-8859-1?Q?sc/disrqzjSloDyhwd3YrSdKia0Ggd/9g129V+Fh2FZ867uYonKAz/JWDb?=
 =?iso-8859-1?Q?zvAMDFdPk/OI+CccVHHaICy42+mByi6z7lezSKtL3OjE5jwkxE0m5mQQ75?=
 =?iso-8859-1?Q?rT+qg+mp3SdOIC6rynJalpNteDiQo5i5l1nU2wRnUHMO1j76vEvMEizRom?=
 =?iso-8859-1?Q?BKKfk7NSpNBKohjMQACAIOKDXOv936GYfydUOXwIkvhD9Gr/nnyqkMKCYu?=
 =?iso-8859-1?Q?skYnND0o9Jt2JkpEFnGvlLIkZ5slmrzjymW3ByQ5YLNGwRck70bUo/LseO?=
 =?iso-8859-1?Q?vEBiVwmhWYz9ZXUh/sveRCVcsIU0H4qCD183E2BXYygjsFMtxf64r8FLpZ?=
 =?iso-8859-1?Q?y89D9h7EPl6QsJh92tUfi+G6D0AfWkax3JGGWyDpxzQMNt+3dLf1HRoEbb?=
 =?iso-8859-1?Q?ptlAyfSLZdyIM7TpjweLauVCkGUWmMIiUXOwxMbtXvTkjPp51ynF3W8SxR?=
 =?iso-8859-1?Q?NI/AukHR4VZFLMg1y3DCtpBkHNfv3kykZpPWoAMappO0vqu4oSdDGt3hlX?=
 =?iso-8859-1?Q?efeLc0xaxZWPTowuVAc0uNXQZ6TvErin2Eh1ylrbm1r3CX9a3RAjWgSw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB5933.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a41cc13-9a44-4abf-39bd-08db10fb18e9
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2023 15:24:44.3205
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /Xo6xjpImRPwOpErx7/0GuEgPCzQSaiNVUpRIZu0byLmYS/dJYvts/0X2fPvChvNzkZ/Dfc8e4wBzigDy0qaGcdnTmGuq8MwVl2/0TqThd4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB6065
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
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
> On Fri, Feb 17, 2023 at 02:35:16PM +0000, Biju Das wrote:
> > Hi Andy,
> > > Subject: Re: [PATCH v4 6/6] serial: 8250_em: Add
> > > serial8250_em_{reg_update(),out_helper()}
> > > On Fri, Feb 17, 2023 at 11:42:55AM +0000, Biju Das wrote:
>=20
> ...
>=20
> > > > +	switch (off) {
> > > > +	case UART_FCR_EM:
> > > > +		fcr =3D value;
> > > > +		break;
> > > > +	case UART_LCR:
> > > > +		lcr =3D value;
> > > > +		break;
> > > > +	case UART_MCR:
> > > > +		mcr =3D value;
> > >
> > > Missing break; statement.
> >
> > OK, will fix this in next version.
> >
> > The original driver has some missing breaks[1].
> > So for consistency I dropped this. same for below.
>=20
> I see. Perhaps you can add another patch that adds them there first?

OK, will add separate patch for adding them first.

Cheers,
Biju
