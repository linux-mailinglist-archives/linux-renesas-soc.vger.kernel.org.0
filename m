Return-Path: <linux-renesas-soc+bounces-19284-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9922EAFA464
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  6 Jul 2025 12:17:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E4FF23B71E5
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  6 Jul 2025 10:17:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F408A1D5CD7;
	Sun,  6 Jul 2025 10:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="qD0Vb+kY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011037.outbound.protection.outlook.com [52.101.125.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97B27881E;
	Sun,  6 Jul 2025 10:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751797048; cv=fail; b=CNlZl9nYcvxlhtcOJEgdglSj6ewMlBtehjP+2XPoJL0XiRUFuVwhY+8OV6QlkfdRfYgkGtrEawQl8U8NgghBceT2icoDNfSyAW+HeCF3LD/LEcXi6uYlCxgsYNQ7GEnYp+6lF5S51MtuMOiljJcYNTJE2U36qDUDxGpJmhjOTaM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751797048; c=relaxed/simple;
	bh=Yu9i2yZzG9WnwhJjrDWzZWIFl20us+xKeaiggh/OnIo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=n6VpM8g7ziB4cSutLxZ4hl7AziYNbSm03DFpBtr3Wb4jPytiM7pYQSi32IoBQEOgeD03jsAKPh/N9sPkzhGrWGRkjtufaIOyjdJo0F+ACEZbDvYklhpCDVnf46BwKqtosk4OkNqD9HXxnAbmGC3PQ6EwOtX6D03sX1qLFmUEZuY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=qD0Vb+kY; arc=fail smtp.client-ip=52.101.125.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ls+024YLgqbBF1ydDPFPjSAUj2Q7p80YzZxXNd3ntlKsk6GC1bqWpBFFoA4iZxPqEzlsuOc9wGn/P+HeLFu8XqJoVYcr5Qn9cG8ys+0ABftVGrHAh+3ahfY5t9IVhGqrwNZyk45xs+i9xrQ/zj9bSl092xJ8TLXllTNDHpCTD/eTc1cTW5Q+AU7egzVMRyzL3VbzxLItKYssbvPG+6bpoaWm4h5ekH3O7Hmfoumjj927YWYrzKuHF+Ff3UwrgBm3i/L7S7iIrXneZFAnVtE8T3ioJ0DdZZU4Vj6KZhEX3R58glEjOUps5g2WoIyNq0a78C0ejn49Xayi+9PjRhO1hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tjSLHQZ7TWdyLitPaQQlf8pJhQyM0DXViZeRKNEUZao=;
 b=c9gIMzcEi6gi5H+mq3+u9J3zLclL32mVav5tKwPxZqgrg8iUZsRH4VDMWn4j1CFOH2g5TtdmcxS1WJbSNFJKOwvWAVLcF63LbZTqlTTW4zzmVEjwdrYOaZ6bHnIQdO1LCB4+sZtFRUZApF+/xdLaRX4bwn+1lB0bdKowQqZ46XdlZXyEEGYvCztihEY8IPKOApUAp6jW5z23fnvYgwuQFeM2/ecfO9vAZg+vY4gpUiH1ghQw96sP7hdMF+oDMQiGRCDFPkjSdNDKsoMDxXOlszmFuGoow3k182X9Agf39BU31/H15/uBLbXIRONrkp0UJ8sdnrQblq0ms10pSUkJdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tjSLHQZ7TWdyLitPaQQlf8pJhQyM0DXViZeRKNEUZao=;
 b=qD0Vb+kYyxICOi58pKsk9Q1IR9H1eaQ9S4XSxT9zqk1NfRSnxscVGh1kRpYw2Kg5PRDM0BiXpEAilSfiCWQfjohEa2dnWNK068CwnYVwHR3yXqoM3enf1o4uCwOPE4Tf2wsEkeK9bU7ElGINWgJpKmEj92idbb+P3+Ya1ETHzMI=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS7PR01MB14808.jpnprd01.prod.outlook.com (2603:1096:604:398::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.21; Sun, 6 Jul
 2025 10:17:21 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%3]) with mapi id 15.20.8901.024; Sun, 6 Jul 2025
 10:17:21 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Russell King <linux@armlinux.org.uk>
CC: Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Andrew
 Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>, "netdev@vger.kernel.org"
	<netdev@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>,
	"linux-stm32@st-md-mailman.stormreply.com"
	<linux-stm32@st-md-mailman.stormreply.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
	biju.das.au <biju.das.au@gmail.com>
Subject: RE: [PATCH net-next] net: stmmac: dwmac-renesas-gbeth: Add PM
 suspend/resume callbacks
Thread-Topic: [PATCH net-next] net: stmmac: dwmac-renesas-gbeth: Add PM
 suspend/resume callbacks
Thread-Index: AQHb7c6+F2cIzXpCE0eHQabSLpoq6LQj6xeAgAALbTCAANFSwIAAF8uAgAACdQA=
Date: Sun, 6 Jul 2025 10:17:21 +0000
Message-ID:
 <TY3PR01MB11346A275022D7B74E8FDDB27864CA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250705170326.106073-1-biju.das.jz@bp.renesas.com>
 <aGl9e9Exvq1fVI0s@shell.armlinux.org.uk>
 <TYCPR01MB11332BCE03B3533784711A5BF864DA@TYCPR01MB11332.jpnprd01.prod.outlook.com>
 <TY3PR01MB113460004F6A57B3AAD77E86E864CA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <aGpKncEeZTifSlA2@shell.armlinux.org.uk>
In-Reply-To: <aGpKncEeZTifSlA2@shell.armlinux.org.uk>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS7PR01MB14808:EE_
x-ms-office365-filtering-correlation-id: e1cbab3f-6caf-469a-71cc-08ddbc764b5e
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?geyNe9BJdA3RDsY5KdCh8H+GEaNzo4VIc0GWU4Jp0nImtuu4NeJdQA3BG0gi?=
 =?us-ascii?Q?hlgD/6NjgRbzc1oTbW1El1kx+VOH2WsLGASZdJgsIDac2XTwr1P+RWjF8jut?=
 =?us-ascii?Q?Zkuz7kokqPkT8ty8wvfKZ2mwLD+0PkyiAjZVEy/t/HVbS031jp+ua9dPMKmg?=
 =?us-ascii?Q?LpSCsHekmRC+OTBFaB68HAbwOUYSQyvZYlHidP/XyBLF3vt6MInMZFYBhyae?=
 =?us-ascii?Q?BDBszyoSsaJguNk+iG5vyyq/Btdu6pC42lpye7Y4iqiORY7ZYGe2uRJzmjNT?=
 =?us-ascii?Q?/88Pi5FavtnK/LJ20OEnU9WNPwHaMpMPC+0lj0w9MCye8fGGC5owpJvLHr54?=
 =?us-ascii?Q?XkXKfIn7onjvTwBUHKxIwDhTxODZV7fWNsSw+0EuXMhgx997v80bWJS029fr?=
 =?us-ascii?Q?qhydU5tJCoHEFQLz1akkwKLc46PufqD/2XXuVeQATBSZjtN1eDIeEIeWqObp?=
 =?us-ascii?Q?DOFEVEMeEVOKEXd/4NCG1CbErukBnCeGMQIbGvmg3hczW/6pQjRmvJWn6eRr?=
 =?us-ascii?Q?18ab18i+kcWsDUyjuW0VO+Ja3iLT293Ph5KAb7CKBJ2AteUBpVCx+YbPgBY6?=
 =?us-ascii?Q?py6lm1HFZf4mAuafHhMt4qqufe2tZm3ulj4qauXIojolErG355rGKanfu1ob?=
 =?us-ascii?Q?fiiu/gG46QFIeITGestbA5sXrrCiL1F1wUhiGawkHXBB92zquImB+Zze4P91?=
 =?us-ascii?Q?3TCcaZlJwXvta772UZwfmRedh04a8tsZ5SkVI7xorGDk4t8H7b0ph0NMk93+?=
 =?us-ascii?Q?4g0fVb6OpUtJNPUcGT8ikBVoMaLAaUrFgHeNbSBnbP0xUN3I4nkRvkPaw1ZW?=
 =?us-ascii?Q?1GaKiZ7GxebUisL6ZSP5QQQaPgp51Ql5b433NRpLpic+LeJZbX3O4POKT/hO?=
 =?us-ascii?Q?+cMZlVToL2dvBjTPRjY6144cy/mVaGxKMMa9GBEgwgIebAlZ7ZlzS8fPI+Gl?=
 =?us-ascii?Q?irQ64kGL37ZujqgdBuaozh+NtZAb5r2MO9rYUMtEAvAd9xK3k+gLAnd841Ke?=
 =?us-ascii?Q?8wO3OeuQhL9ACRU0V4FLRgfjFxcwg9TfhT0yECz6k1xU0OQP9Ofpk+kLE5tk?=
 =?us-ascii?Q?CQUelDYy0tPcYyxTaNB2SplFr7yH3Vl4OgIPFk8/UcawQiUVcqY4mxx/87gV?=
 =?us-ascii?Q?f3s0I0OknyWKYIKF8R3ucSQRp1RVDSYvBdWwNS+FxcSznSlyGUWOimRR8v6v?=
 =?us-ascii?Q?iMafCf7RzQPcXFowYWVWwdg5e5RryFwi3oS8SaYrJU9pQYpB6lm86N2kdrF0?=
 =?us-ascii?Q?5RF3hkqMWUUJfWCb+S1Af8ijEZa1GVBFEffexGXRrG5i4WS6RzwJcN2ssC9z?=
 =?us-ascii?Q?fL8HMLoCPG7gPqVaD0VuWNjacbK+PL5guz/5cbROlkFvbBnlGafobVh1hl0N?=
 =?us-ascii?Q?21LyY35kg/BiQXMuLynLYVIC/VBuVeSJMQffrbhTb+Rva7I+k1ECpDCi+U4c?=
 =?us-ascii?Q?Be3EPnVNjiVve6BP5DPZqJYa0Rpo6WiOP2ljtE5scu/AruP0+m5ofzR/WbKm?=
 =?us-ascii?Q?/3u4CuYJ7Y9YN9o=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?xrq86Aw3adGxxVgTkZdcYVce6AYVuwdQFgA2e2OBKL47p6OOgfFRw0s4T2my?=
 =?us-ascii?Q?TPBU5btH2YmTvnv0plwaFrNDKb40K7YCwwM7OCvdXvpVhkDg6irnfMPHFce6?=
 =?us-ascii?Q?gcI77259+775qBOvc0j6Ib6KK+0miRqCbYRO9hl35IuLnlk7XEpPfKmW1PRu?=
 =?us-ascii?Q?3kfdRmkpZCBtiNkpTLOR/Y1z+rUVj1kG71vr5rNASfyd3jm4DzVSqo/tdVj2?=
 =?us-ascii?Q?SNR05gvD3J8CB1n3F5CEqhhQSI48OaFWX1+R7F7bCFfhwttqOvHsb0iBwVZP?=
 =?us-ascii?Q?0JsgtS4PLUPc2mzi+nY5JFhAhdf0nwOliiJMbHa6lGfWWaWCzsaDC0TCLFdR?=
 =?us-ascii?Q?ws8K9YyJ3RlRcJhiYuh+ZxXwrPiyyzKYfImF8eQWriVZ5qFO/Gox8oNafLLR?=
 =?us-ascii?Q?EhOK+EVkRd9FDrvwO7ninkq+b67YUd2TgIIKHSpReA4XK7rCVA9q+d/9QzKO?=
 =?us-ascii?Q?SFjxMlPZ1R4nSEAuKGGwX8Tg2/k5rWlN2A14VPpWJYZxtXDnGtv3I/n1QxT6?=
 =?us-ascii?Q?V6rdpTVbRqNg5Q+1ltfOr2CdHRod8aherpXoLkgABJ5gUNRogcymCZfios0e?=
 =?us-ascii?Q?zuX9KfAVYpzdrO/GLaws5k4rrG0GrdLpNRdPToQJLlX80LBcPs5iePvgt24M?=
 =?us-ascii?Q?rDGH95h/OLZEhwQOiTyETGKExhFQXjjIVl1HAF9xnKRGgjI+l2cJ4GBpd+zD?=
 =?us-ascii?Q?/nKV0VgtNEFVeQ3zZwC+vj/yGJGYt0nZPaXcyVkehzoB5ayemX895ZjBkBhu?=
 =?us-ascii?Q?b0jzQsnfGD7R50ErKPezWYOrSDhfwOArPgQ5kmCSvTJSu0delf0JAWeAAZzQ?=
 =?us-ascii?Q?s/tmIZZFadOWhdgC8cKs/Dv5/4FiN1/DrEjOvYOj1fumD1opOBuQV7VmRPg6?=
 =?us-ascii?Q?VVIDqHkmT7MyLp0xCFqifqGWM4axGho7FllgNQdkCfr7OVxYZAv+J+LF1h9L?=
 =?us-ascii?Q?rmLahmKNLqFS3waURnylheWxa7zmyPP1Mw03GBDwt77NFzsjpnaRA/RwlaKz?=
 =?us-ascii?Q?TKvXNaGeqUZqFCgL9N3QP00PETmkkGuitaZiv7vLGyXDMPtfF7BEbLJWOwGj?=
 =?us-ascii?Q?KGDXImHDvBwpoqxf7sTXzq+KZMlP5otJqICpzdQDZO7SuPf1Oh1BY7p/H8F7?=
 =?us-ascii?Q?7LOZjXFQVAzw9FosjI/zFu/Rnl7dNKy/LcBMa3hmT4dPBmS/lC3WfpfjTtLj?=
 =?us-ascii?Q?tJQqaMyu/XjyOKv94RJqIrfR7x2ebXwXCV5pWFG6NnQklbWn1dXJbfegyZaj?=
 =?us-ascii?Q?+RR7eris2yMlpLrFlr/YzjU4jHsWy2vmy9lD3vUD4Yo9NXYklLhp7CyojzLH?=
 =?us-ascii?Q?NuLj5jJumvdZEL2pE/sjDPyuUafMlW6DTjUqXnnnyVZjnPv9cCHRDbfJzbN2?=
 =?us-ascii?Q?b6jBCn2lDCKaqbLQZH3FVqJjbB1/gxU4raSEEIwJE/07aD7lnSiP5l2KH132?=
 =?us-ascii?Q?BCwuSFzm3gltimPUme3p5vo5CLpfXDQ+nG1ZS7F4QSjoNNjSNYS0hZifveZH?=
 =?us-ascii?Q?Pk7gGQ/SRc6BPcdks2SJTfOJvFC8myHdZq4KxC6Oyb/rT14P3oDkdXiXVMDJ?=
 =?us-ascii?Q?rMHE5Rn/3MuqFbdXEm88NNzgNYOobkx8jrINPGlNBFA5TStKr0mLQjULeKWn?=
 =?us-ascii?Q?nQ=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: e1cbab3f-6caf-469a-71cc-08ddbc764b5e
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jul 2025 10:17:21.3031
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UDjlsKA/+UJEyMZr/kPJRI27zOzl9Soh+4mAW2BKqb+hsjeQcMTRMnLdi469fzkKP4gxP4UUgaxLcjhlZXmOF0ZAwRpnV/GgfmI0Lt7P1pw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB14808

Hi Russell King,

> -----Original Message-----
> From: Russell King <linux@armlinux.org.uk>
> Sent: 06 July 2025 11:06
> Subject: Re: [PATCH net-next] net: stmmac: dwmac-renesas-gbeth: Add PM su=
spend/resume callbacks
>=20
> On Sun, Jul 06, 2025 at 08:45:14AM +0000, Biju Das wrote:
> > Hi Russell King,
> >
> > FYI, The above testing is done with rootFS mounted on SD card.
> >
> > But when I mount rootFS on NFS, after wakeup, I am not able to contact =
the NFS server.
> >
> > The below patch makes it to work[1].
> > Not sure, why the original code is failing if the rootFS is mounted on =
NFS?
>=20
> It would be good to understand exactly what is going on there.
>=20
> As stmmac sets mac_managed_pm to true, which is propagated to phylib, thi=
s means the mdiobus
> suspend/resume will be no-ops, as the MAC driver needs to do everything n=
ecessar to resume the PHY.
>=20
> Is your PHY losing power over suspend/resume?

Yes, it is losing power during suspend.

>=20
> Maybe phylink_prepare_resume() needs to call phy_init_hw() as well, like =
mdio_bus_phy_resume() does?

The below patch fixes the issue.

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 67218d278ce6..511d87481631 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -2593,8 +2593,10 @@ void phylink_prepare_resume(struct phylink *pl)
         * then resume the PHY. Note that 802.3 allows PHYs 500ms before
         * the clock meets requirements. We do not implement this delay.
         */
-       if (pl->config->mac_requires_rxc && phydev && phydev->suspended)
+       if (pl->config->mac_requires_rxc && phydev && phydev->suspended) {
+               phy_init_hw(phydev);
                phy_resume(phydev);
+       }


root@smarc-rzg3e:~# [   21.382260] PM: suspend entry (deep)
[   21.386144] Filesystems sync: 0.000 seconds
[   21.394055] Freezing user space processes
[   21.399743] Freezing user space processes completed (elapsed 0.001 secon=
ds)
[   21.406775] OOM killer disabled.
[   21.410020] Freezing remaining freezable tasks
[   21.415642] Freezing remaining freezable tasks completed (elapsed 0.001 =
seconds)
[   21.423051] printk: Suspending console(s) (use no_console_suspend to deb=
ug)
NOTICE:  BL2: v2.10.5(release):2.10.5/rz_soc_dev-162-g7148ba838
NOTICE:  BL2: Built : 14:23:58, Jul  5 2025
NOTICE:  BL2: SYS_LSI_MODE: 0x13e06
NOTICE:  BL2: SYS_LSI_DEVID: 0x8679447
NOTICE:  BL2: SYS_LSI_PRR: 0x0
NOTICE:  BL2: Booting BL31
[   21.469365] libphy: #######phy_suspend 1908
[   21.469401] ########kszphy_suspend 2350
[   21.469457] renesas-gbeth 15c30000.ethernet eth0: Link is Down
[   21.470144] ########kszphy_suspend 2356
[   21.470503] ########kszphy_generic_suspend 2343
[   21.470535] libphy: #######phy_suspend 1925
[   21.478742] Disabling non-boot CPUs ...
[   21.483025] psci: CPU3 killed (polled 0 ms)
[   21.490772] psci: CPU2 killed (polled 0 ms)
[   21.497394] psci: CPU1 killed (polled 4 ms)
[   21.500532] Enabling non-boot CPUs ...
[   21.500742] Detected VIPT I-cache on CPU1
[   21.500786] GICv3: CPU1: found redistributor 100 region 0:0x000000001496=
0000
[   21.500823] CPU1: Booted secondary processor 0x0000000100 [0x412fd050]
[   21.501549] CPU1 is up
[   21.501644] Detected VIPT I-cache on CPU2
[   21.501665] GICv3: CPU2: found redistributor 200 region 0:0x000000001498=
0000
[   21.501686] CPU2: Booted secondary processor 0x0000000200 [0x412fd050]
[   21.502106] CPU2 is up
[   21.502200] Detected VIPT I-cache on CPU3
[   21.502221] GICv3: CPU3: found redistributor 300 region 0:0x00000000149a=
0000
[   21.502242] CPU3: Booted secondary processor 0x0000000300 [0x412fd050]
[   21.502755] CPU3 is up
[   21.565815] ########kszphy_resume 2389
[   21.565828] CPU: 3 UID: 0 PID: 283 Comm: systemd-sleep Not tainted 6.16.=
0-rc4-next-20250703-gf2ebaf5365aa-dirty #65 PREEMPT
[   21.565837] Hardware name: Renesas SMARC EVK version 2 based on r9a09g04=
7e57 (DT)
[   21.565841] Call trace:
[   21.565844]  show_stack+0x18/0x24 (C)
[   21.565859]  dump_stack_lvl+0x78/0x90
[   21.565870]  dump_stack+0x18/0x24
[   21.565876]  kszphy_resume+0x3c/0xf0
[   21.565884]  phy_resume+0x3c/0x74
[   21.565892]  phylink_prepare_resume+0x60/0xa8
[   21.565901]  stmmac_resume+0x90/0x2a0
[   21.565910]  stmmac_pltfr_resume+0x3c/0x4c
[   21.565918]  device_resume+0x108/0x1ec
[   21.565927]  dpm_resume+0x198/0x1b8
[   21.565933]  dpm_resume_end+0x20/0x38
[   21.565940]  suspend_devices_and_enter+0x4a8/0x58c
[   21.565948]  pm_suspend+0x180/0x20c
[   21.565954]  state_store+0x80/0xec
[   21.565960]  kobj_attr_store+0x18/0x2c
[   21.565967]  sysfs_kf_write+0x7c/0x94
[   21.565974]  kernfs_fop_write_iter+0x120/0x1ec
[   21.565980]  vfs_write+0x238/0x370
[   21.565988]  ksys_write+0x6c/0x100
[   21.565994]  __arm64_sys_write+0x1c/0x28
[   21.566001]  invoke_syscall+0x48/0x110
[   21.566009]  el0_svc_common.constprop.0+0xc0/0xe0
[   21.566016]  do_el0_svc+0x1c/0x28
[   21.566023]  el0_svc+0x34/0xf0
[   21.566031]  el0t_64_sync_handler+0xa0/0xe4
[   21.566037]  el0t_64_sync+0x198/0x19c
[   21.566044] ########kszphy_generic_resume 2328
[   21.568610] ########kszphy_resume 2413
[   21.579522] dwmac4: Master AXI performs fixed burst length
[   21.580438] renesas-gbeth 15c30000.ethernet eth0: No Safety Features sup=
port found
[   21.580457] renesas-gbeth 15c30000.ethernet eth0: IEEE 1588-2008 Advance=
d Timestamp supported
[   21.584111] renesas-gbeth 15c30000.ethernet eth0: configuring for phy/rg=
mii-id link mode
[   21.584126] ########kszphy_resume 2389
[   21.584131] CPU: 3 UID: 0 PID: 283 Comm: systemd-sleep Not tainted 6.16.=
0-rc4-next-20250703-gf2ebaf5365aa-dirty #65 PREEMPT
[   21.584138] Hardware name: Renesas SMARC EVK version 2 based on r9a09g04=
7e57 (DT)
[   21.584141] Call trace:
[   21.584143]  show_stack+0x18/0x24 (C)
[   21.584150]  dump_stack_lvl+0x78/0x90
[   21.584158]  dump_stack+0x18/0x24
[   21.584163]  kszphy_resume+0x3c/0xf0
[   21.584168]  __phy_resume+0x28/0x54
[   21.584175]  phy_start+0x7c/0xb4
[   21.584180]  phylink_start+0xb8/0x210
[   21.584187]  phylink_resume+0x7c/0xc4
[   21.584194]  stmmac_resume+0x1ec/0x2a0
[   21.584200]  stmmac_pltfr_resume+0x3c/0x4c
[   21.584207]  device_resume+0x108/0x1ec
[   21.584214]  dpm_resume+0x198/0x1b8
[   21.584220]  dpm_resume_end+0x20/0x38
[   21.584226]  suspend_devices_and_enter+0x4a8/0x58c
[   21.584233]  pm_suspend+0x180/0x20c
[   21.584239]  state_store+0x80/0xec
[   21.584245]  kobj_attr_store+0x18/0x2c
[   21.584250]  sysfs_kf_write+0x7c/0x94
[   21.584256]  kernfs_fop_write_iter+0x120/0x1ec
[   21.584261]  vfs_write+0x238/0x370
[   21.584267]  ksys_write+0x6c/0x100
[   21.584273]  __arm64_sys_write+0x1c/0x28
[   21.584279]  invoke_syscall+0x48/0x110
[   21.584286]  el0_svc_common.constprop.0+0xc0/0xe0
[   21.584293]  do_el0_svc+0x1c/0x28
[   21.584299]  el0_svc+0x34/0xf0
[   21.584306]  el0t_64_sync_handler+0xa0/0xe4
[   21.584312]  el0t_64_sync+0x198/0x19c
[   21.584318] ########kszphy_generic_resume 2328
[   21.586896] ########kszphy_resume 2413
[   23.029414] OOM killer enabled.
[   23.036456] Restarting tasks: Starting

[   23.041654] Restarting tasks: Done
[   23.045259] random: crng reseeded on system resumption
[   23.050644] PM: suspend exit
root@smarc-rzg3e:~# p[   24.223019] renesas-gbeth 15c30000.ethernet eth0: L=
ink is Up - 1Gbps/Full - flow control rx/tx
ing 1[   25.410201] 8021q: 802.1Q VLAN Support v1.8
[   25.414618] 8021q: adding VLAN 0 to HW filter on device eth0
root@smarc-rzg3e:~# ping 192.168.10.1
PING 192.168.10.1 (192.168.10.1) 56(84) bytes of data.
64 bytes from 192.168.10.1: icmp_seq=3D1 ttl=3D64 time=3D0.516 ms
64 bytes from 192.168.10.1: icmp_seq=3D2 ttl=3D64 time=3D0.838 ms
64 bytes from 192.168.10.1: icmp_seq=3D3 ttl=3D64 time=3D1.03 ms
64 bytes from 192.168.10.1: icmp_seq=3D4 ttl=3D64 time=3D0.985 ms

Cheers,
Biju

