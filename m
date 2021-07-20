Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB5CC3D01DB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Jul 2021 20:43:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231571AbhGTSC4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 20 Jul 2021 14:02:56 -0400
Received: from mail-eopbgr1400127.outbound.protection.outlook.com ([40.107.140.127]:3895
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230471AbhGTSCz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 20 Jul 2021 14:02:55 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hDeopAv7ZWJr9dvnkDWeqW+6Ma972YKSHJ2+bcXkTQ3Z9vtZkxUNx7tb6T/TGDLtkfDngf2gAUJHmSu7wDCMfmCZDtb8gjchVw5wHGJaekJsgC2iRdMtTy5PWLnHyl7Asa5ELFmoD7Tv7QGtx6IoKb8vXteBQ95wBXiSIAgFMCnsuYjqRC8XqB9rEnByWWxEztgOIRAA1cQaI120pzw5z9MPR55xtbGi5YPMIQWmoUf4cpK0/d40sWhhnQ69j+5rjmyL+ihFHpek55KCyoz0KuozRu1EYV3tJGLPN07lxFt/FMUhR01HD+0eZecehL9al/fWwBYwqaroZS6iBGKNXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S9uMr16C372fD8tBJ7s7MI+/9vIh5AgOU8Ff7PtuHQY=;
 b=albMqjvWaVtAHeoBlIgg0bNxGmGkxf8cHjWVpv9LfhYqb9HXVWW3td3ka+E/yGMyISDUF5p5tVnkgbhbG6HEizadRJOFVRtPtBGXX7EQ7TIXS5PCno8exU7Dd4eGniMWRyzws2nwuvEJQiznsxY4WvpqA46tMVPu2T7jBxp7mZUUSKaYLuYgvb+8uKCfCqXAoUIoctx3PvyBNJk4UrKBk2qcFbaNnt26wcu976tVto1y/SO/Fwg9kPIINihSyGUn4Vuyi6vEZvDdb3tTpI8lWUNtg34hZk9Ver+5h0+pf2cvmyjt1nZsK5oiRCKCzQkiRa+Dcq2A6QGl25nx9iLIfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S9uMr16C372fD8tBJ7s7MI+/9vIh5AgOU8Ff7PtuHQY=;
 b=WSiJPw4nI10u6D73xSurskfyY1a5G4Xap/aOBOG5k3UVka/IhC68V9aRs29Epwyu6qwO07Pvl+SE+w979L6PyTO1K0CS9p6PU9AXTiU+U616EXI+vLQjXjymUJrWfMrj8vu+oJTdKOXzvybpQDP80/Yjq0v9ypWSOg8hjtwprUA=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS3PR01MB5847.jpnprd01.prod.outlook.com (2603:1096:604:b5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Tue, 20 Jul
 2021 18:43:30 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c6f:e31f:eaa9:60fe]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c6f:e31f:eaa9:60fe%9]) with mapi id 15.20.4331.034; Tue, 20 Jul 2021
 18:43:30 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Chris Brandt <Chris.Brandt@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
CC:     Phil Edworthy <phil.edworthy@renesas.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>
Subject: RE: Regarding SDHI clocks on RZ/G2L
Thread-Topic: Regarding SDHI clocks on RZ/G2L
Thread-Index: Add7vsI9+kXhl+CeQLOqy9wopCg2QQBtkhtQAAB1h0AAB0AVwAAAjH7Q
Date:   Tue, 20 Jul 2021 18:43:30 +0000
Message-ID: <OS0PR01MB5922CEAD71AEAE5256A116C986E29@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <OS0PR01MB5922386AFB9BBEF95626761C86E09@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <TYCPR01MB63193D71B89ED65ADFF521F58AE29@TYCPR01MB6319.jpnprd01.prod.outlook.com>
 <OS0PR01MB5922D113C4BF2C729B01497286E29@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <TYCPR01MB6319F7494FB5A69FB00AEA2A8AE29@TYCPR01MB6319.jpnprd01.prod.outlook.com>
In-Reply-To: <TYCPR01MB6319F7494FB5A69FB00AEA2A8AE29@TYCPR01MB6319.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: renesas.com; dkim=none (message not signed)
 header.d=none;renesas.com; dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 33b14442-9f3f-4cb6-18e6-08d94bae4536
x-ms-traffictypediagnostic: OS3PR01MB5847:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OS3PR01MB5847915BB6D708B648A8932086E29@OS3PR01MB5847.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:843;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UGire0GsUk5elTV3lQGc2gzQi7JOgrbQq3AAZ9261L8WjgyprfjTuEpEm4tbVyLQtJtem0Ml6P2B7HWUTAFOxcN0rw6en/n2fkw1EUHXTXCIFu0LzENUo3AizSIOOsJhTEXxjiFx4HSWLbYKVW3e1T4ghfd2ohwb3D5doRmT/i6muggFNcPUNCpbQsdmJHlmxCuYWXwxystGMXfNyEH3EJvZSYiqbKV7Vi8q+CwlksHFdgPm1ZlxAnG7tpXJSLw+VxRqR87I2SQGHWDknJCokd7nZC70RuO41UoaVkuGMD+qCIg8OjVkVPo4lri4y0649yHNlMvr6MyDVi2wlPwPc4Js3h294+82JbCeQmtO0riC1QQErkhjRb52CJk5hEiaU5nDXFHstxV1/kTZuN6COXGVecTDys4TRyxzAiH1whuW8dJ1SFzPE87X53Gl8Y/XroB1BmjunrQ9oCKVfwEhPJ07XpD7VgBuQhtwMpWJuWpwLoPmtqHjBpl7MEjSqn481PBaJSLJDEUVpfhPhIdeKmXe7dVNIrxjynpEPx/z6FMJs8OWRTBCM0JwWO6S1I+8OtmQ/ZvqTVAdLlfFYH1qrBX6323BMJ3/twRbV0J/Bx221xY/9rvZoZkrH85wHKS9J/McC3HM9hrsPPoe4HYanOvrVK/FEwemA6wGgCKJmLfJfLaU6jyiiTbLbzKGDsVDly8ArLq/e7i+CUPIjVNwE7rBZazp4j0MnuuEo8y2fI3qjN5cymDucxPlzg9uOee3mS0Ka8m44QsY9jCi/R0lgQNadQEVVzGpo3oxR308XDc=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(346002)(136003)(376002)(396003)(366004)(478600001)(7696005)(966005)(83380400001)(52536014)(86362001)(107886003)(54906003)(4326008)(26005)(2906002)(122000001)(38100700002)(9686003)(110136005)(33656002)(8676002)(316002)(8936002)(186003)(66476007)(55016002)(6506007)(66556008)(76116006)(66946007)(64756008)(66446008)(71200400001)(5660300002)(38070700004);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?hzTC9bX3De5+MkPYPirif/BrDsvQyiqE/Wtt8vnni20DDgEMwCp0EHJS9ToQ?=
 =?us-ascii?Q?U66Nv19IJ1Dtbw9nk9VS4WyMiXegZcxIwAG+QeIPACRMP5QXHsTVoI6ApHpH?=
 =?us-ascii?Q?INbDXeYHQrgw04PLtszV3MO9JclmVpDHAstGVnKVwIOjL2ILKz5b+BxJLpog?=
 =?us-ascii?Q?42Sg4BWvIrtB76NJA9LkrNRD/Mp4VJ9ibBnkB1/T0siFZP4AgrcaMp5jTEXS?=
 =?us-ascii?Q?/+azEXTdT89TiuMFSLIeWAqIrcvJSIzVosxArEsZEWB+4Kew+Q7rDeTERacm?=
 =?us-ascii?Q?BSNFtP1n84bb8HC9Myg+n/OYaiNbu9PvEvHhB2P/1XLNCdfmsyeSxPNvNz3G?=
 =?us-ascii?Q?NZpC03eEfRWVaBbePC6uSQ1imePN329I6KXYOlZISa0TJ82livQm4ZqUiX6T?=
 =?us-ascii?Q?Y6RwQi/KXMkEVRfZ3tcPEjQDvYNhk3kKft5Jw35cLE3C5Dx7q0JLvKyaFqNt?=
 =?us-ascii?Q?+io/F9/qsXFGrylwdQRod4oEQ+NINyzH39xlGKpu83YJkt0iqFcCO47ZVKBw?=
 =?us-ascii?Q?3PE79FGH4CiaT1tm7FB0PC2Yxsp5ycs19Rc90lzFElruVa6hoiOTgIhkWzrP?=
 =?us-ascii?Q?lImGROJIzQ2DwdYpQjH21TtMR8E9bzgMk6Xx6HKxgHdquZ8r7B+79aAjsdar?=
 =?us-ascii?Q?bvdMvgSihIDV5/SmjOLWbz6huq6JISRGdb9gwmLiJkmHEy21V2JuWbF+CYel?=
 =?us-ascii?Q?zR0w9AeBtjh0sMfpJlg3FM3e0ifRCB6RRChabxXuEPaBmZsy8bHY/q2QY5ti?=
 =?us-ascii?Q?dNMX7zBljd6T03caHOi55g27XaMmCYnIF0NYNFUln0VhMqVYpeJMW6ZS+s9H?=
 =?us-ascii?Q?SlsSJK9wH74C1xVqB4YhFg9EvaYVpfCg7LQ04WlTj19CorOzwzDsh/MhjHrx?=
 =?us-ascii?Q?CnmQslkZJ1IzJwXOsZemVeFOrBITodlD08zW6+nPMRf7pbG7wJNbkGCp0s+Z?=
 =?us-ascii?Q?6TOebau+76yyPdxMQt+SxpQRYz6Redps1J4ZKz9Ime5GoYYcH+pyI6naWLb3?=
 =?us-ascii?Q?6IBJZ0vL203ZQ85JPlB0Y5nm+gqq9EuBKEFC28GvG+gPaUcSOdrgW941fLTW?=
 =?us-ascii?Q?2Pck7RFIwnb8Wh7zC4j1FZLR1g7ElmnsGdUKO96uyOa9uUIgbR/aJNBgFDds?=
 =?us-ascii?Q?7+1yoDToRqol6R4nvARbBE1DSLP4D6I4HhJnZcVxF1xz4uyOT1ba2RvpwNaq?=
 =?us-ascii?Q?LQaYmWGpHgR61m/asZj+A179i4stsrcRKtvpZF+utsJE4JvE8o3kExLT9JAO?=
 =?us-ascii?Q?w6jySg/tr0RZYNvDNpwschoTZoQ587wiF612fvf8LDhdMkzd+44+BwcM5gAy?=
 =?us-ascii?Q?kzT8sEapKatbzQJ6QBY9cZhx?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33b14442-9f3f-4cb6-18e6-08d94bae4536
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2021 18:43:30.5827
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nPz+kNyv7+hFh7V1y9qR0kvhLYzla4VCtz4Cqw8ICn0QfEWPb+qvzwmHpLn2XWxJYAngEYb4AZGjaGKSuqzKJrGvQ9xK+Y+c1t8voZck3/w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB5847
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Chris,

> Subject: RE: Regarding SDHI clocks on RZ/G2L
>=20
> Hi Biju,
>=20
> > -----Original Message-----
> > From: Biju Das
> > Sent: Tuesday, July 20, 2021 11:55 AM
>=20
> > RZ/G2L document says we should not turn off cd clock during suspend.
> > Otherwise card detection
>=20
> From a hardware standpoint....yes.
>=20
> > Won't work. So whether SDHI can reliably work in this case? Basically
> > if there is no activity, this module can go into suspend state. If the
> > cd clock turned off and card detection fails during resume, how the
> > SDHI functionality going to work?
>=20
> What I am saying is that from a system design standpoint, you need to wak=
e
> up the system first before you can use the SD card (even detecting a card
> insert/remove).

Agreed. That is the usual flow.

>=20
>=20
> > Note:-
> > Currently I am configuring CD pin as gpio rather than function due to
> > some reset issue[1]. After reset cd detection fails. But it works ok,
> > if it configured as GPIO.
>=20
> > 1) Handle it in SDHI driver? ie, enable it during probe only once and
> > > avoid turning it off
> > >
> > > or
> > >
> > > 2) Add this clock as critical clock, so it will be turned on
> > > permanently and don't handle it in SDHI driver?
>=20
> So does that mean your #1 and #2 both do not work unless the pin is
> configured as GPIO?

With upstream kernel it doesn't work, because of the reset handling patch[1=
]
4.19 it works, where it doesn't have this patch.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/comm=
it/drivers/mmc/host/renesas_sdhi_core.c?h=3Dv5.14-rc2&id=3Db4d86f37eacb7246=
90d0d300576b82806bc743d5

Regards,
Biju
