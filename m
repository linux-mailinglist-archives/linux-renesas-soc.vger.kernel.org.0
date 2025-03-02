Return-Path: <linux-renesas-soc+bounces-13861-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D53C8A4B3EF
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  2 Mar 2025 19:10:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E70D516AA18
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  2 Mar 2025 18:10:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5E5E19CC20;
	Sun,  2 Mar 2025 18:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="ambSNkMe"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011019.outbound.protection.outlook.com [40.107.74.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A213933EA
	for <linux-renesas-soc@vger.kernel.org>; Sun,  2 Mar 2025 18:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740939004; cv=fail; b=cv1xlgo1THA6BExvvLDlO0wncW1SD10Gpma/zDAVYnpnXN7tdfmR3l59VoJb96QXJcstlWQTgKfPXyFd88tsdiglP9cAXG9cv3T2lBZblZ0gKPa7f1i7QeZoaKWZwH3hVrFkacpZ4iiGvdwh/+M96unr43z4gz9mOd3XvEharZY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740939004; c=relaxed/simple;
	bh=txzkjS7NmiK8afOMTmH1NzID4fFpUzLMqH4tfJE6b2k=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=mrxwXlEslvHT82cRmMEqsJ/NQKVrJVxdse7O/h/yNKF/v3oi22ACLUDA78mPSkiPwlZjl5KegLA86ZKZZYEzpbeOFrKWd1alupP9fSGt9VAh7F34TM63juF5Vebn2R5IFsR7PW9OOiQikHdugaAiDbeLsBDLTSWi3hpkQakg8EY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=ambSNkMe; arc=fail smtp.client-ip=40.107.74.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=huSJF/K/zwZh0kzdGscYRLQUDVLCJrqFBoNe15ehaP2piQ+eJwGfb3mElZ7jNOR4pMExIcH9fXycadF8Ed9XaLU//sCTR/WCNNDHKBL72ei718ZxoYU2zAlt76AuSrZCZuJxR2ahxFORTLbyv0a/CbFfdB1BKotZA1PHpeslxhPjGh43W+KsuIZOe9auQbsqirqS3plxsHKtEgHxub1k/nDWr1hgcpBPBEE+I6YmffwedGFDvy13EGhf64ZHpXEv6ZtAZ8dxSnW05ljBByiTgx6Zzz5APCb98A1empVOlfdfsSZE4OkFqAYe9UEjyebTw5sCtehJ23cJwGXcM+HyLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fBqEEocKJQAEWoGPEKkTPpqCh47frYOFQL1+GhPWqEc=;
 b=F3BV4ZO/T2ScMh9InKOknTEOmkJKJ8AUfVU7OogHGaD3ZZnn6ubNm+eexD8GwgjoS8wTjlliUKL8xKxaY0cRJkh03UC0MrtIVWckPoqYJ306PQc5ekozVolTM8CEO2lkR/maZjPTDiTp2e1x7znTXjLGf3RiJwhcvh7OLx4csutl6dzrF3iuy0wOGv0HGrenB5Wa8j18/IP3TFFIH7ifIjYdEZbWLCLghjNaih+S3OLpigk2VYf3ZeOXKVL7ALKj6ACDAKViPxD5dyiYBn+hHNtf6hX9KrusWtU5SPmfk7MDmYujgTk50Fx8dXCxninbO8bBgnAsKie1CprORM8YJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fBqEEocKJQAEWoGPEKkTPpqCh47frYOFQL1+GhPWqEc=;
 b=ambSNkMeG8HXzpiQJatxIg6O/x/mqKzX91+KRTb7XBvV9jaX0Or5A8SsuFlw4ozOVnyXqsBNg4fI1AF3rD6WYoQLkf6y/96cNdexIGoDDGSRPGhBE6jtyudmUZEpeHD5qeT5+YNKB3zEmIIHR4+ZvA8E2fqfe8+0zsvME4eEWd4=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS0PR01MB5697.jpnprd01.prod.outlook.com (2603:1096:604:bb::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.25; Sun, 2 Mar
 2025 18:09:58 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.8489.025; Sun, 2 Mar 2025
 18:09:52 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: kernel test robot <lkp@intel.com>, Krzysztof Kozlowski <krzk@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>
CC: "oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, Mark
 Brown <broonie@kernel.org>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH 7/8] memory: renesas-rpc-if: Add RZ/G3E xSPI support
Thread-Topic: [PATCH 7/8] memory: renesas-rpc-if: Add RZ/G3E xSPI support
Thread-Index: AQHbifsIQ/Uv17JXjEKgTTkbL4LZYbNe0ouAgAFVpoA=
Date: Sun, 2 Mar 2025 18:09:52 +0000
Message-ID:
 <TY3PR01MB113467810F839C45315DE211186CE2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250228160810.171413-8-biju.das.jz@bp.renesas.com>
 <202503020521.ZJBds3LY-lkp@intel.com>
In-Reply-To: <202503020521.ZJBds3LY-lkp@intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS0PR01MB5697:EE_
x-ms-office365-filtering-correlation-id: a9f9cef9-9f5e-464c-73d7-08dd59b56e27
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700018|7053199007;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?8gajVw3dOHDLMnPYBzCKtcXhxbC302gzJr+n1sl21FVqwNPoG2Ow+RO/WQdV?=
 =?us-ascii?Q?Y2TIH8ITEVk1yqiLxS1CVQ00oCuoqh1iDnw41+V7CseIgIczh0gYO70g4oV6?=
 =?us-ascii?Q?aMIJg9rgnVRzZ3Cd4K3HkN0nKeijHRMcjxeq2EZuTSKO+awSWsj5ICx7u0de?=
 =?us-ascii?Q?hvo3xRkQZGYP2uwZspVj552/altiGAI9viQ2JS0pnC5rW39Z1tt/27q/ySNM?=
 =?us-ascii?Q?W2tMzFei5mJOs8SbQ7F9YIkUD6mcciSSEQmGk0mCZFjhIfRl56veChqPp3M+?=
 =?us-ascii?Q?YO8jJprTeYe3VBauBQxdjdXP00aorhXGUIjgMGYyiC6MT/5ZuAvod0JrM9aG?=
 =?us-ascii?Q?mji3s79cE4D2/RXcsGjV+DdX+hUQPbYHQPlXVP6so+VIJ870/bdFGQTRzhnG?=
 =?us-ascii?Q?54SbFPPGwcU+Lbb9LTGMjP991PIerlB3F6YAyCqVU83wuUBtXEM1qoCnReJa?=
 =?us-ascii?Q?B4gtInnjSL+/EakBX/aZhBJ2xXUqFHtbPT10BTFDQA0XSXOSNHwJ3KZEOFOa?=
 =?us-ascii?Q?0Ynja7sidN6DQE3lhAtBHRIOJaRlwNiGwlFZVifFFHn2ajW7+OLphKsy+JGW?=
 =?us-ascii?Q?uFZAzxrBKeASXe62UK9H0emep/JSgS+BAakpYEE+SvRkC2TSO8KD1V9PpmWR?=
 =?us-ascii?Q?DEL15FNQTiI2uPBk2YDx0Q51YPbl/dG8QlFvfuI8fSEbG/C50JWGrgDBi5LN?=
 =?us-ascii?Q?pNa640RGJ03bKC1xVjkAHOCyfAtjc+jtbKFQCO40IqYlLDQmF+ptOmueFav6?=
 =?us-ascii?Q?0jcftqoQ9Grgk3tfiJFORAUpC/AgqHQlJCJ2XK8Tvx/jB4pNqwwxT8ngdnRS?=
 =?us-ascii?Q?riDiltGusvrVX8lwJ85tMYuHb1iqmyS5bq93WV5cZ4k161lWbyDDDntLjFB7?=
 =?us-ascii?Q?CWkDKrcm0+IMGOgZRKsR4wDeuMzUH+f0v5HtstitV7NqEFecRs+AK+OJHDGZ?=
 =?us-ascii?Q?sk4YmA6erPClc3gtirG2V/qWzG/DlebwDB1A/YatBuT49K0ds73pQdAkATf8?=
 =?us-ascii?Q?VnxN08c1fk9Ls8uc9vVhTImIWm9pDUS8KpCB9OVlYAEHxY29oCVXeLxRujVw?=
 =?us-ascii?Q?KDE0fWMmpIUQyL+9+Bkl+2z+0RVgNMce/l/3JJKg298XwOOc6YFDSZCewtww?=
 =?us-ascii?Q?hHKZAYggtJrOxEOJ9FGqf01Zb74q0jHTjrFRIiDZ2842aZijQduYX8b0vVpN?=
 =?us-ascii?Q?/F9U+4xBDwF3KLqEQMwzzlPJXN5+6PCBLzcdlOkXUfvbo6vOyPT7zHUhDJOq?=
 =?us-ascii?Q?rFHrukcDPLh9s1G/2+aoqmmyVVlO1JHsyTidTyoUjH0vMJB9Km2lFQNJOJ5b?=
 =?us-ascii?Q?iEHbPgAFbpYUJGFSj2vy36W6nJwEhfYP7rWkpmVEmfhU6fnfq/lt8GeRYnkh?=
 =?us-ascii?Q?EF/Pn4Z72Ey+lxCSpM8xngMrRoNK85Cti62JTJ44O07vkj/8GA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?npZTQCT20r+AwuvW3k7DewIjAyUb2qtY7xDquwHMoMmoiyNZubPZygIrVbEM?=
 =?us-ascii?Q?7dcF7f042dkPnNxnryPqBqCjQB0rLqWsig1PTt1jJmHeB43k4HV5zdNb2JWA?=
 =?us-ascii?Q?w0Rg+u0t67u6JU0elUnREoKIkDT8qCekU4enft3TTBmyee1sj7jxRSHoY3Nd?=
 =?us-ascii?Q?R6Tna9CvD1jtZRuW6ffbQC7Fpt/DbGpcdxR0BNOSiQVxTeJgG7O/c7373JW1?=
 =?us-ascii?Q?EVcqMCC1C8Djhv3wdHmBBTqkABc/IE5T1btFb2o/UerMwLTi8fFUkXZSCP4N?=
 =?us-ascii?Q?n3BEl4C5BpD03uiqV5mepn4+dMuci5TjcLjFrXj+g/hFjPbP++e8o/jcKKbM?=
 =?us-ascii?Q?ScGb2akruvaHf6IrSkz6SnyOnI84akSmT1s2SBLvVU0W1ZR6QPSdacBXmHv9?=
 =?us-ascii?Q?llTfTT970cqALJZXJHw4ENIN3jBEL12pvOCZ7xRX7A0YPobYkXwDP3AkHckD?=
 =?us-ascii?Q?K7/9RrSUmqlUrm4gFnRzGB+McUldm5sW01BSBeL2veuk+wkkUeCv1WiV4+Qb?=
 =?us-ascii?Q?H16MWcXGbxA+jBW42/p9iDdFsHN93AIt5v8CKG3XSzt1iHG+fU7/QnbtOjeM?=
 =?us-ascii?Q?SoW2Vu4YEjsZmJPsbJBzAE8qU7O62MKoR5fQ3OOzdsE7fNOk5TNDGosg7vwt?=
 =?us-ascii?Q?Ol4Ax/mRUGn6ULleAnwMds4HU2iTMHlSdYbqv7qxfWo/wqGE/yitHy8ka/vw?=
 =?us-ascii?Q?lGFHt/ZyZ2s7bynCpeLHY7R+wIXwavo80Rg7PqfRc6ty2qwdNhQ21Vhv/+GY?=
 =?us-ascii?Q?7c38lM8nSV0cKDHr9ZBzyb7Nzf5tM77R1+BxoOsx50K3/IfLqhMWo+/1DrKm?=
 =?us-ascii?Q?GTaiQUTSQ4jIlo9sgmiC6oH2kToxSQKapDHiphZgPD//nigKXgmh3GCu1/le?=
 =?us-ascii?Q?GWww5CEAdOslmV+KGjfGrlIodq5DtsEWvq8Y1aO82eETc4v4sEQf5QQD+kgW?=
 =?us-ascii?Q?M81gd17xxs0sRcBlga1oCSmIWNYlEdj7Zp2c+EVu4Nd6nzxFdB1Pj/7ALzzQ?=
 =?us-ascii?Q?ojjSyRCCFI+L/1E+mHxDyjFEiBHv2ZC16I/3ucQoyp8Gh0j3MKeV/rYvZkf6?=
 =?us-ascii?Q?S45/Qds3ct593efDdg8gl0jx27JncgkpeJFZJRVnN5NrxhZmqpQCA9zIH8Gd?=
 =?us-ascii?Q?MYFvdbO3lnklJeMg+b3sVa4K+cIGOX/hiThvRgCGirDxpQmPeVkzFCOGdNWS?=
 =?us-ascii?Q?5/phsfCKrwBcRUyM+4nuXFUM4WPOE7yV9CsnzxT3qn3c3zcllpjGHfpDEYIl?=
 =?us-ascii?Q?Z+hHh2Lfs4e9ZMbr3jv1d3/vsraDx2aGT2+PBpParZpduCYdaA59/N1hx3sk?=
 =?us-ascii?Q?gokjxHm3b1mzceyY8IOvyvl9Ymv024ajFUSQUNkKJbeZmhjtSb7JTJ7NOf9Q?=
 =?us-ascii?Q?7y6qX7bd+hwkeuYkGX+j1sQI+J1H5AkGbNycHDmRGozxEz3gdR3Shj5dC2NI?=
 =?us-ascii?Q?TA+m5F0Dvwawkqe7Labnem6hnVyKunUG9S6I2fLsu/gekmEpNL/0ZdUa5WCf?=
 =?us-ascii?Q?gTlJd8gxrttsdVCc/9EF2Ngh3XJq2Wzo0w57zVzEB3FTlq1sU8lYr0KPY5Tq?=
 =?us-ascii?Q?YXm4AIinlER8DJ7+rjHGq4b9dCHsuqmXg6S3BFJIQNRp9pWHyXH9dSPacVbD?=
 =?us-ascii?Q?aA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9f9cef9-9f5e-464c-73d7-08dd59b56e27
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Mar 2025 18:09:52.7940
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g2gm1eaw3GoxAnkqLjIpBt/f+XHJ9O7AEwDtJ+m135JklrftxZcOFfZzR46scwrdZUX1c8v++Lym+P+EoJph/45hLUGIlcN3jRjkg0mLiBo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5697



> -----Original Message-----
> From: kernel test robot <lkp@intel.com>
> Sent: 01 March 2025 21:46
> To: Biju Das <biju.das.jz@bp.renesas.com>; Krzysztof Kozlowski <krzk@kern=
el.org>; Philipp Zabel
> <p.zabel@pengutronix.de>; Geert Uytterhoeven <geert+renesas@glider.be>; M=
agnus Damm
> <magnus.damm@gmail.com>
> Cc: oe-kbuild-all@lists.linux.dev; Biju Das <biju.das.jz@bp.renesas.com>;=
 linux-renesas-
> soc@vger.kernel.org; Mark Brown <broonie@kernel.org>; Prabhakar Mahadev L=
ad <prabhakar.mahadev-
> lad.rj@bp.renesas.com>
> Subject: Re: [PATCH 7/8] memory: renesas-rpc-if: Add RZ/G3E xSPI support
>=20
> Hi Biju,
>=20
> kernel test robot noticed the following build errors:
>=20
> [auto build test ERROR on robh/for-next] [also build test ERROR on brooni=
e-spi/for-next krzk-dt/for-
> next linus/master v6.14-rc4 next-20250228] [If your patch is applied to t=
he wrong git tree, kindly
> drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in ht=
tps://git-scm.com/docs/git-
> format-patch#_base_tree_information]
>=20
> url:    https://github.com/intel-lab-lkp/linux/commits/Biju-Das/dt-bindin=
gs-memory-Document-RZ-G3E-
> support/20250301-041012
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git fo=
r-next
> patch link:    https://lore.kernel.org/r/20250228160810.171413-8-biju.das=
.jz%40bp.renesas.com
> patch subject: [PATCH 7/8] memory: renesas-rpc-if: Add RZ/G3E xSPI suppor=
t
> config: sparc64-randconfig-001-20250302 (https://download.01.org/0day-
> ci/archive/20250302/202503020521.ZJBds3LY-lkp@intel.com/config)
> compiler: sparc64-linux-gcc (GCC) 14.2.0 reproduce (this is a W=3D1 build=
):
> (https://download.01.org/0day-ci/archive/20250302/202503020521.ZJBds3LY-l=
kp@intel.com/reproduce)
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of the same
> patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes:
> | https://lore.kernel.org/oe-kbuild-all/202503020521.ZJBds3LY-lkp@intel.
> | com/
>=20
> All errors (new ones prefixed by >>, old ones prefixed by <<):
>=20
> >> ERROR: modpost: drivers/memory/renesas-rpc-if: local symbol
> >> 'xspi_dirmap_read' was exported
>=20

Oops, While cleaning up I accidently replaced EXPORT_SYMBOL(rpcif_dirmap_re=
ad)
with local EXPORT_SYMBOL(xspi_dirmap_read.

Will fix it in v2 along with other review comments.

Cheers,
Biju


