Return-Path: <linux-renesas-soc+bounces-19321-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE3BAFB329
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Jul 2025 14:25:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7F74B189F7E8
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Jul 2025 12:25:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07CB929AB15;
	Mon,  7 Jul 2025 12:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="VvDfojcw"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011036.outbound.protection.outlook.com [52.101.125.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FD3829AAFE;
	Mon,  7 Jul 2025 12:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751891118; cv=fail; b=QxTMsVQVyld7Os+DC3tAbqWIqv9vzm1n6T9DLmxdyG7zYu33fNB+hEOIRdmePL8V6zNay7MYqpAUyPl0nQNI5BG34b9KhfNudiKdXDbGa0i9yyjfWaSDaS0N65UDWXcq5kBVrlT4LZeY6io6vrQF7QXRcC4nAH32HxF5+JoMRX8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751891118; c=relaxed/simple;
	bh=NUfn7v6bCmGidHA5Fqz0j4hE12QjaxgdIFVvs7Ld+Ig=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Ulv4IpcpmBWvRhqqc1dorp27zMlsahx7ZRTSYORp+mdv+i9T2V6kc1ERBi2yP8jXtbUXV23ZgcDtBIDqLWdjfIE93IukdFd4AxL9UNb18iYaDkQPA0fbyE3MIlmFDea/2nkucyDo5NPn8RVdeTlyz0VETX/elT3ncsDL2+6xCM4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=VvDfojcw; arc=fail smtp.client-ip=52.101.125.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w4+FWFLYZCx38hgn5/F8F8HHxGlP1AIxw7IfwjqrvNqtum47WPbEyITdbxol5trN+JGy5ZPpm3EUGT8j+nbvgkWv4s0IvmHFHcpXuxHXpm/1aNj9J01VVQdbplrmrgTHk6uXbc2IQE0ePMvJEiENQ29urBW9IcKERCJs+YlROQu9nrcBwvznkCszVOozIBb2Fx8EYSFb3OkwXbCDzLy9/fAm0i0SahN+xU234NFt+XD9126uDL/zMMvGW4CaFscbLQWXNTinZdACmydK8fUudIHa4ZCFrsbHfOwcCBiwW9jBIob8jJKpQ76EJeEkfN31zRdHivg8QTyCHMo9gEcQMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w+BmvCe084A9tHfyuLVJ7KvIj/9InUPiSKvfkrLdgcI=;
 b=vyJ3ZTG7IXPzGlL7zHSHmxEkV6RcMG66axymyWLeEKLlvL3DX7uEK7TAudhDcoe0yflSMWtNaiDa0tTQ+l5uaoCaJ6YgFHKBnsF4jFhlUSbc3A+Wl5xEEsx942kqS7+nJZIkSTOxxOjsao3hJHh8sGqXL1mERaXU71yMAk70VvzBlNfxmBgKq1v7U8aSAh1kofrsqj8djMPCjcfvbN932PIIR4fjIes/wBh280maTIh82txw3hC+fDBtTvukEAyQU21PM6vY0lCgjkZ+od9rbQ2FfhgDs5DlAIY6xTN6a3JZUXX82GvLy5zE+Z+ZvA3G7x7qKIHS+wKBMr0COYKmcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w+BmvCe084A9tHfyuLVJ7KvIj/9InUPiSKvfkrLdgcI=;
 b=VvDfojcwaatQel0sFiZ5LTXcw69TAVAmBNIRhx15bBBkwUExdkA+jowJBv1tByt311eB4XSUXdNBf/1HXRTX2+JLj+OpV6Yxc7gfDYKel/UVqPnbQOg5Z+WNWzPGdHPBUJkeT0CbtIV+qdZVqjnouMlAaw1PDU1PfF2THuekKLY=
Received: from TYRPR01MB14284.jpnprd01.prod.outlook.com (2603:1096:405:21b::6)
 by TYCPR01MB6160.jpnprd01.prod.outlook.com (2603:1096:400:4f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Mon, 7 Jul
 2025 12:25:13 +0000
Received: from TYRPR01MB14284.jpnprd01.prod.outlook.com
 ([fe80::dc7c:6361:a82a:933a]) by TYRPR01MB14284.jpnprd01.prod.outlook.com
 ([fe80::dc7c:6361:a82a:933a%5]) with mapi id 15.20.8901.024; Mon, 7 Jul 2025
 12:25:13 +0000
From: Michael Dege <michael.dege@renesas.com>
To: Andrew Lunn <andrew@lunn.ch>
CC: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	=?iso-8859-1?Q?Niklas_S=F6derlund?= <niklas.soderlund@ragnatech.se>, Paul
 Barker <paul@pbarker.dev>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nikita
 Yushchenko <nikita.yoush@cogentembedded.com>
Subject: RE: [PATCH 0/3] net: renesas: rswitch: R-Car S4 add HW offloading for
 layer 2 switching
Thread-Topic: [PATCH 0/3] net: renesas: rswitch: R-Car S4 add HW offloading
 for layer 2 switching
Thread-Index: AQHb7KeykmaFwgLMREu6ovPS4jC8GLQho3eAgATYm2CAABYkAIAABeGQ
Date: Mon, 7 Jul 2025 12:25:13 +0000
Message-ID:
 <TYRPR01MB14284165C9A106297976C224D824FA@TYRPR01MB14284.jpnprd01.prod.outlook.com>
References: <20250704-add_l2_switching-v1-0-ff882aacb258@renesas.com>
 <9c8cb213-7daf-43bb-8d20-aaefa13127af@lunn.ch>
 <TY4PR01MB14282E8A9E82714106D448EA0824FA@TY4PR01MB14282.jpnprd01.prod.outlook.com>
 <dd75a12d-17cd-45a7-97d0-a243df54c215@lunn.ch>
In-Reply-To: <dd75a12d-17cd-45a7-97d0-a243df54c215@lunn.ch>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYRPR01MB14284:EE_|TYCPR01MB6160:EE_
x-ms-office365-filtering-correlation-id: a2c8a3c5-a856-4874-6329-08ddbd5152a0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?X2JMzgDdYTuQauoIH0qEvnAAt27cCfGNXd6N8MWy5J0odlORMv2kjIbOPR?=
 =?iso-8859-1?Q?opFEBfEY00R4aJia5fgUN3/M1TO85h4jLQ9psqn4PTQSX9KaRVQJzqXGg0?=
 =?iso-8859-1?Q?jQBaE1emN697WR38+iGzI9Bgs/z3b9Ktxj/2PK7MumyANTmoiMUTWXBbsP?=
 =?iso-8859-1?Q?tw/YIQ3pkaCD3t2cEcMkK/EMfbme2fFK3EWLcofnQX7IRIKRSvnDxGs9AP?=
 =?iso-8859-1?Q?eC+6d2FoTr+jbDYGIt7QPiWGOuFQt+3DuHRyI4+hpyAzmZZiafbqQZMK0E?=
 =?iso-8859-1?Q?zKIWzXnTqtJKbQPkzknXc8jgl2SsZJgaM18HjR+5EPb13+mkylfILKFKDa?=
 =?iso-8859-1?Q?4n0h1jGkRGmQ87fIwZOOGnvxV7h1c3aCVZtB2GuymLQv8ciS21lFJZp7fy?=
 =?iso-8859-1?Q?KnIWRAHqTYbRgw51yo7Q7J2OBVMbN5U4eilnyaUd6avW2+syvbjJSp9u+h?=
 =?iso-8859-1?Q?Jr8gbngs2xiBHLWpW6SYXLRH7uTo7LRtBM0LFxAmjYtiEiqOn+h8S7BOxt?=
 =?iso-8859-1?Q?p0XH4k4/Hv95RC6Wkgwsaz/UFkfDPtXuFRiCE20pFDuKwZAv6IsGZgvcgG?=
 =?iso-8859-1?Q?n7gCaDfr+6d7tHhpUUAGvquXdtcJoH8xMaHUOe9hiInN2pG9VTuK0pKtN4?=
 =?iso-8859-1?Q?OVnj+ymJswi5JAGj+gFofuXVaGNY0ebd15KFZb0lwOWktQ8OT4TkMZshUU?=
 =?iso-8859-1?Q?7ddEP7lv7LhBY6K8V8MYy1ScHHnBnSqf4lJc1ChfpKXv3ZAPGmHDvQYT0o?=
 =?iso-8859-1?Q?a/qN4xnWneEDxQZ7DajRYdnHBv8waZDDmba4iSNH77gNL75U1jxGg/lp9n?=
 =?iso-8859-1?Q?X4s/tSQuFyfmzGLOsZFXF0ErO99g+mNZYnwHD7w4aRBV8EaUqdC9hlTE9T?=
 =?iso-8859-1?Q?2MrIsfXFwpH7qTxJiLtMvD1zyF9B7Ug9561C1BrsHoN0Ymk5fg+GxlICAT?=
 =?iso-8859-1?Q?rSVnXm30qko+oe/Jjo/AOJm80UtsFOUmN6icrGaih1+Uf3esOGJubfz0nl?=
 =?iso-8859-1?Q?rMB7rJyA+fgC+mMzpthYYjKZaUGKBanZIVSIY5ZL4gRnwPFoeTyvfqQNBd?=
 =?iso-8859-1?Q?52BotLEZbNlYvHm8xX+DdaXjFQdcJCgKlcwc1I/W3Ru7RQNZgOLC41G1nz?=
 =?iso-8859-1?Q?wTCKXkwh6dX4aOjrm05p1TGQqGGWqVlvaRRchstH4/fL/Bp/KXcWYqNF2W?=
 =?iso-8859-1?Q?jKO2VYPDJQEI98rQohAORY8mN0p8/L+WJdTpyF/lkLcWLXzkj1q6L2Ms9G?=
 =?iso-8859-1?Q?3JFKmxcnwMTqhRTzCYgV9cGTLFEHDyAq0hrZNIM47Bd9nARzL8XIazstIW?=
 =?iso-8859-1?Q?rjJnOsnB1DQnm9hiNxiAs+ROHsGMUm1WGt3fPgQQsGWnWaPv5Xu/pJ2Qlw?=
 =?iso-8859-1?Q?RkWqcdnUEcndSifu0a3kqhX26QUIe79ElChT0acENN0bG/YJuzElDpCez/?=
 =?iso-8859-1?Q?AhSwTEJkBDlGB9AH8wLLSWUPPMpDus/0xwGa3Eow7Ey4wYx/TZlGBg9A59?=
 =?iso-8859-1?Q?k9UbFrjN7u1HcLJ3ICAIGX/L+ApCBC06xy8ZjRmMFYLQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB14284.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?mHcJ8PW5Xc9MRYGprp9ngN4DtXfyju5kfHNJc5kV6MUYNWs5InaHl6Dchy?=
 =?iso-8859-1?Q?6QZEKbHseFpZfNcKdNSzRouszomPKr0OYr0Ep/S//DvQ/r3m6ZdQhDEWs0?=
 =?iso-8859-1?Q?nqx/EbciblpR+8AHMTbGPdNHm8/5avqJ78t2seh/DRxK77kiblE9Bx+t41?=
 =?iso-8859-1?Q?BjR5HvfCt+GFGlISJYS7zNT7jK+c2X5BEMQRM45LVbxAnC1R+UHAok1Nwp?=
 =?iso-8859-1?Q?GEzien5Sfu7uD6Q5Beh0WMOneQQuDt+coyF2Hr+qJPGObCupEdyFokZAxD?=
 =?iso-8859-1?Q?vecpSO6rUb5d7nagG8X86EhPA+ceqL5CqmZdSXUnvL3SVrjCd+0A12q7LW?=
 =?iso-8859-1?Q?ggJscuNo22g1Wcj++JeJkboJnVCqbyQdEZeW/C8WekFfgeZMpbGylv/Nd9?=
 =?iso-8859-1?Q?urNrs3ZZJjprak/Ppng18G6r4fDC3O2lpKK420uO3Ic80mLNvYWa0yyk1F?=
 =?iso-8859-1?Q?7ogRaKB8dH5b4teSUaNv1zyG2v4pWFmEmWOmCJ3H6AP/RyeBeSd7rHawmr?=
 =?iso-8859-1?Q?E/t6d/cr8Muwngnvlf+NX7fLkXoV96w4erWSkT0NuQXvC0Fu6CMa1oewmD?=
 =?iso-8859-1?Q?7leneDobwt0u+J4SXtdo7G3aPM8HDlTfg8GvE+caODiv88H8BihOj3VEqR?=
 =?iso-8859-1?Q?PA8vWcYOFMbfLEuFCsx8KATeyaH/Bzxx0JlD/9kq/Kh44fqifL4Ht3BJH3?=
 =?iso-8859-1?Q?JT+P6HP92g9KHaZ4N0t98XeAFPDHaGVlvHUYNO4htZjaeM7Xpl0ZLKznNP?=
 =?iso-8859-1?Q?y4PCMOIyLy81DaqxqCOp7TsTyuVBTLp8reaiVhUzt2LfxYzw9aL+arxKeo?=
 =?iso-8859-1?Q?KcX/x9Zojy3lbeRZsRc0I7+j/TBSHy2PjByGNUwZjAmad0a+XCRiTfJzAi?=
 =?iso-8859-1?Q?JGcw7PLKkfq3JNZg56oRRYwx2vmMjiqHXLP7xOWuIn0nPmcHyUfyH/FDvm?=
 =?iso-8859-1?Q?m0h3UR5SdOG2YuJr3o0BlE8E2y9nJfK8v67yLp0g9c34nVy5cjZihizfP5?=
 =?iso-8859-1?Q?zaVvfBk3ondvpFKtb0uM5vriRbf19KpSBL4CQbJYT/WL9f8ekFjiAzcICq?=
 =?iso-8859-1?Q?ZCeCxIMZnxdB5oJ4V/HakZIYoLd4snCsEayJUR4tgpCnGtGcfKY8mY5gkq?=
 =?iso-8859-1?Q?Sz1xdy1pEU/BuExw8l2JG3Ywe+hi+aa+T8dS48Uj9QNL4P6t5gV+v6QIjg?=
 =?iso-8859-1?Q?PSrIySEaHLNYcE0fYUSdMP/igTTynAUkppJrhhBtngz2EbmJQqEKL94IAZ?=
 =?iso-8859-1?Q?EocAdJQPTb+n/HtDM9AIZOqA8p3JnU6eO4LZSwix/vaMlqGyhT9jyWycn8?=
 =?iso-8859-1?Q?bAcnJD8tFpk40U3rhGMXQfmqrWFfALmjG9jVmaRaDtN/dhU4iDLjFfMUIE?=
 =?iso-8859-1?Q?kpg/exphFD7Y9re4HHPhsrLmdA0Eic/TmvwpdjXlWpn5Ps6Lx8koVkEnsX?=
 =?iso-8859-1?Q?PP7x/ZKEdGjy6SgxN+wxrJlUTMXvPZuf5u8mKwmq2XSMkeIXc3Eolz7Lou?=
 =?iso-8859-1?Q?fAEwcD6GyiX+5hOx1W0OyVmj30BIPJWRHGS6tlDsY80jMP4Gg/1TtyyQjx?=
 =?iso-8859-1?Q?QCOft6OMzbS+aDMnBhNcgzpV28/VJ5R+slil1bH2R5dL71AU3RzHDtPXoP?=
 =?iso-8859-1?Q?gyJM0RyzW9MUyvl19ssxZyQAgGFHMA0Ame?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB14284.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2c8a3c5-a856-4874-6329-08ddbd5152a0
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2025 12:25:13.2390
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4Tb0Ol7MXQjc79u09ZmrabRZmSCsMkg1tYDJsifpvFn0G8XhlonCpiF29FLxITitsOpMsrz3WpOrZQXEZiS+AG1CT/vwLOsFKl/ihfXpBog=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6160

Hello Andrew,


> -----Original Message-----
> From: Andrew Lunn <andrew@lunn.ch>
> Sent: Monday, July 7, 2025 1:54 PM
> To: Michael Dege <michael.dege@renesas.com>
> Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>; Niklas S=F6derl=
und
> <niklas.soderlund@ragnatech.se>; Paul Barker <paul@pbarker.dev>; Andrew L=
unn <andrew+netdev@lunn.ch>;
> David S. Miller <davem@davemloft.net>; Eric Dumazet <edumazet@google.com>=
; Jakub Kicinski
> <kuba@kernel.org>; Paolo Abeni <pabeni@redhat.com>; netdev@vger.kernel.or=
g; linux-renesas-
> soc@vger.kernel.org; linux-kernel@vger.kernel.org; Nikita Yushchenko <nik=
ita.yoush@cogentembedded.com>
> Subject: Re: [PATCH 0/3] net: renesas: rswitch: R-Car S4 add HW offloadin=
g for layer 2 switching
>
> > There is a discrepancy between the value being passed by iproute2 and
> > brctl. Iproute2 passes the value unaltered in seconds and brctl passes
> > the value in seconds multiplied by 100. So far this is OK because
> > brctl is deprecated. But the default value being passed when neither
> > brctl is called nor the ageing parameter is added when the bridge is cr=
eated is also multiplied by
> 100 resulting in 30000s being set as default ageing time instead of 300s.=
 Is this a known issue?
>
> You need to be careful of 100. It is probably the value of HZ you are usi=
ng. This means it is probably
> in jiffies.
>
> It could be whoever added support to DSA was using HZ =3D 1000, and so as=
sumed it has milliseconds, not
> jiffies, and the API is broken.
>
> If you have time, could you dig into this. Trace there where jiffies are =
used, seconds, and what
> conversions are preformed, for the default values, netlink API and sysfs =
API. Once we know where it
> goes wrong, we can figure out how to fix it.
>
>       Andrew

I poked around and it looks to me that the issue is in the default value:

Include/linux/if_bridge.h#65; #define BR_DEFAULT_AGEING_TIME (300 * HZ)

In our case HZ is 100. And the issue is only seen when no other value has b=
een set. (fresh boot)

Both sysfs API and netlink API produce the same values. That is the value r=
eceived in
switchdev_attr->u.stp_state is presented unaltered.

ip link change dev br type bridge ageing 10

and

echo 10 > /sys/class/net/br/bridge/ageing_time

Both result in a "10" being passed in switchdev_attr->u.stp_state.

Best regards,

Michael
________________________________

Renesas Electronics Europe GmbH
Registered Office: Arcadiastrasse 10
DE-40472 Duesseldorf
Commercial Registry: Duesseldorf, HRB 3708
Managing Director: Carsten Jauch
VAT-No.: DE 14978647
Tax-ID-No: 105/5839/1793

Legal Disclaimer: This e-mail communication (and any attachment/s) is confi=
dential and contains proprietary information, some or all of which may be l=
egally privileged. It is intended solely for the use of the individual or e=
ntity to which it is addressed. Access to this email by anyone else is unau=
thorized. If you are not the intended recipient, any disclosure, copying, d=
istribution or any action taken or omitted to be taken in reliance on it, i=
s prohibited and may be unlawful.

