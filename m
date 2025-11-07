Return-Path: <linux-renesas-soc+bounces-24328-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2991FC4023B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 07 Nov 2025 14:35:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2081C4EE31D
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Nov 2025 13:35:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91F442E7166;
	Fri,  7 Nov 2025 13:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Gu2mdPT9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011053.outbound.protection.outlook.com [40.107.74.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7221228507B;
	Fri,  7 Nov 2025 13:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762522541; cv=fail; b=l9X+P2zGN3sWClG1Mu+dnRjhwCv6SRTkFNOVIH2USHVV6+BewgXAxTglj55tDUFhilC1InCNR/0kC+dTk7Tq3tQ/EpdTyVYIBlVSJeuX3wnaQCEeaBdRviXfEE8SM0uLYtP0/tVsn4jQd3f+dBo3lAgxdBKya6qv53wsCYVB6d8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762522541; c=relaxed/simple;
	bh=Q7FnbTpBl7QGHPARSYPIMIXBgNC2yxZQDXW2CUk6Ezs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=JiE7MIuALpF0GTXT1hKVgrmGsmRlUzXRtJQG9pHYN3hEYiXwbLvI9sghsBLXA8U2Swu5TxHXLoE1+GPkD1Rf2I2+LizF+n/fUTc7/xUVzLlPfs8l2hFwzJBYv/kCOHjdLHitSClzMbU300/Oo10y+t+I0Z3zNOPW5Jb/MESSmMs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Gu2mdPT9; arc=fail smtp.client-ip=40.107.74.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U2/+n7IieDHlJ0zfcp5KyvcG0UdtKaYxE3cGXAW1C7iPElit7N9Ihm2/YxRzmulL5L7/j/mq3khp9ahwYX9wqOB3gbCyt+IFWwNkGbQ1wP95RvlFus57rlInIEo4rBW7pk0oWCsyv4ULPG+3pazOv4Fu4rOysh/+HRwestHBIDZHRwbD1887hZLQWzpwLPjX2DExdnY5WcV8ItMV7WNVcY6VUYlvYj3U70tECyMDd9etkXTXrTpxIqguhxLOlqYfk2xNK07rUhxi0iOGF1InvNVt1pihwvL1KV7NbG5emkQkKBCWuhueiciPrPgv1fdELCVeZsXDUGdEcWIfFBiy9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rulc30xKIuNV2hr3AROjH0xf7NmAXJ64GtLNBnBDCz0=;
 b=tUwfNp5CaQOYMO7OdpKv+YWF3H22qwcu9lMsOkedaue9b3KTIDuzCV8mmfNMiOaskNq+6bM4+0vS4XMZJpd52Bhq7WPk9uaysQMubCuWpk4NYNwUbcTWiHvAivJwqrlwCwsniaEuJpG0Q+GLwYi/b6cE0LraGTO7eKotFAT2yYLnQcHIJqSVI4jos4Ml79IQpK0OmD3fK6IUEE53msay9UVD/h/RhFqE0Hi+M3lPE37KckfZLXZ6lgHjLfHPalsjzXxM6eIHcWIM/A2pmE1hg6ScvmT9j5npt1c7uVeeWv8QPBMMc83eSQkhZlRvMrEJq1fEbRmVqjmampGpPy+sWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rulc30xKIuNV2hr3AROjH0xf7NmAXJ64GtLNBnBDCz0=;
 b=Gu2mdPT9mt5bTGgk2t4p55RlPPyXMH4Zq9O9EssIuLQKJkN8xK+RqSO44zAVPpmBzi5d3pokT9otOB+mvl4YeOOaz3MJkS11jFSQNAWUPfL8qBt42umyNOWcDJ2elplUEUROr7/bWKUZJ9plNpa50SkcDLOMyy/UkTUhsMdmBas=
Received: from TY4PR01MB14282.jpnprd01.prod.outlook.com (2603:1096:405:20d::9)
 by OSZPR01MB9548.jpnprd01.prod.outlook.com (2603:1096:604:1d5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Fri, 7 Nov
 2025 13:35:35 +0000
Received: from TY4PR01MB14282.jpnprd01.prod.outlook.com
 ([fe80::37ea:efd9:8ca0:706a]) by TY4PR01MB14282.jpnprd01.prod.outlook.com
 ([fe80::37ea:efd9:8ca0:706a%6]) with mapi id 15.20.9298.010; Fri, 7 Nov 2025
 13:35:35 +0000
From: Michael Dege <michael.dege@renesas.com>
To: Andrew Lunn <andrew@lunn.ch>
CC: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Andrew Lunn
	<andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Richard Cochran <richardcochran@gmail.com>,
	niklas.soderlund <niklas.soderlund@ragnatech.se>, Paul Barker
	<paul@pbarker.dev>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>, magnus.damm <magnus.damm@gmail.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Nikita Yushchenko
	<nikita.yoush@cogentembedded.com>, Christophe JAILLET
	<christophe.jaillet@wanadoo.fr>
Subject: RE: [PATCH net-next 09/10] net: renesas: rswitch: add simple l3
 routing
Thread-Topic: [PATCH net-next 09/10] net: renesas: rswitch: add simple l3
 routing
Thread-Index: AQHcTxzKoVdV1cP1k0WlN+3+CViRarTmfzwAgAC3zVA=
Date: Fri, 7 Nov 2025 13:35:35 +0000
Message-ID:
 <TY4PR01MB14282FDB5F80A61205F7080A582C3A@TY4PR01MB14282.jpnprd01.prod.outlook.com>
References: <20251106-add_l3_routing-v1-0-dcbb8368ca54@renesas.com>
 <20251106-add_l3_routing-v1-9-dcbb8368ca54@renesas.com>
 <06213fb1-12dc-4045-803e-d2a65c7e9fc6@lunn.ch>
In-Reply-To: <06213fb1-12dc-4045-803e-d2a65c7e9fc6@lunn.ch>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY4PR01MB14282:EE_|OSZPR01MB9548:EE_
x-ms-office365-filtering-correlation-id: 3d9d9dbc-ceba-41e1-5951-08de1e02881d
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?mVe5gWjsMR7L9aaRURiOq9CSbNqH/x5j2MA4ZAXAcAK1Cr1dA3HRL4XVPfAP?=
 =?us-ascii?Q?9VMupe4Ix5bcfh3BWLgVl+uespjrKrfz5vVjQLwAVtPr6GvNRbTDNIS297pf?=
 =?us-ascii?Q?W/TKaWPAzR9c+FwHswPXNYbGKyXi01TYakzv2SG7qPwWa/K0WLjvn08Z5sf2?=
 =?us-ascii?Q?YFoobgc2LuHlIIbU+jXdVLAHEu1QzPvuAriAYGQxCBXyQZfdvTDs6Q280ikH?=
 =?us-ascii?Q?OrGiEcb/th/jAYS6cS/t2n41HIm+hBN9VafTm73I1pUHX7YPjtmlrHrwz24w?=
 =?us-ascii?Q?ywEWqmSjS8HbCdJ4bA7r0L/3RvgR86tD+NWmKIcwM2f3h+UTtgihZw2HnSgo?=
 =?us-ascii?Q?PPQ4frlp7Dm0pRUOi9uflbxD08XMiG6R9PxYLRFaTdhSWoL3Np7lMUPLO+y5?=
 =?us-ascii?Q?QPufXnfnjwEbRqMEO246lt3GxdFVKnCJXXtCSC0aJ2XAausj1A63QExtiHIj?=
 =?us-ascii?Q?DGXoz7ol8sx0vZyF3jpask1GW5n5UrCERw8q9bNbKDluZtBOl9aNgCY6pnGn?=
 =?us-ascii?Q?trDEDprpt3PZYibqKjj3CuG28gFDss292DtX51blhiWZOQQ0IS3PhRPQ63y5?=
 =?us-ascii?Q?5Jg/txiPqZma+WWZ+0/vlkE+/sTph8lH7s/+EINIa9RwNNz5+c/L5KUZX3Jd?=
 =?us-ascii?Q?70V6KhPCbKJXAR7uVKStDXz2fyvmprAxEE3BM8TyxdVr4nW7hf/M6+ARksKK?=
 =?us-ascii?Q?Qe57B/HvsTVRLhrvTczNh+GNYfO4vWJBgwTCt1nId+Rt+IhkF7UysCzVKKZd?=
 =?us-ascii?Q?bhSjHkqp3Ip+C2rAt1HZohqkRHIZRftYug1KAcOPiC2jJPmK72U1OoqRJ7Lk?=
 =?us-ascii?Q?rvoTN6FLD4V0FqJ8X6E0Yryi2dJ60fGbQvrsqqfSk0lV7x0f52PrGigERWhh?=
 =?us-ascii?Q?tlySuPX9dp9myivJu+JfDpvCvO2KPCak0gqAx0Q4B4asOShapna5ZouFauDs?=
 =?us-ascii?Q?CTZqorysaM+RaqIm+sNHzc3f/X+35Vv7ZmFxuCiEhLh9Hjy7KXMghQVdXykY?=
 =?us-ascii?Q?ICjZg0UNCbp5c5jGm3ZQ2X450gOr0RxxVdWXKU8ivR+EWEqWo8fWDaMzihUB?=
 =?us-ascii?Q?MKJCYPhgxqbIqoXjp/Txr6EAwQeLQHT90si/P366EQS0eRejsFhoVwX5sk8d?=
 =?us-ascii?Q?wHbLoSw1hYtWE8r0kOEfIMbb9zvl4PTgf2EmRCLlHGUqQzgrcjrNpxPgE/LD?=
 =?us-ascii?Q?SCNmJ4sJzxrr3ML9v8YETJEzGNYcfBDY8WErsJz2QBvWf+32XAkEcnldxWYp?=
 =?us-ascii?Q?0iXCLTpMMcwd+Cn8ZocwD0FBO2GvgBilxwnmII52ugzUhL7jtakbZxRvhkj/?=
 =?us-ascii?Q?g48IdCYi+INArkqGx/EINLI0VjiZIpHA45hHxrxK6LPDOngdDN7hBnVgRziq?=
 =?us-ascii?Q?3wHbL9TLTqgv/1LJmOtv80Qn2X6D3Aoo+eN2HjSxZtFMfZzeVvM3Tgrk9UGr?=
 =?us-ascii?Q?SibwIlMKI/TS4bqIoiKes8qcUtQa6ihOLIfOqwGlwrXw+tE0deZ/zdBM0A/z?=
 =?us-ascii?Q?TqSRGnB/VAhL/9tKGzGOPZRrFOoIeH2Gd6BN?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY4PR01MB14282.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?WHcGVXCoPAs/JBq9kZBSKNwTBOxRgFvPNcNI7ivdfwtyS1+0hIeOQrHde9a9?=
 =?us-ascii?Q?Fv7icyWrd0F73db5LbbkCqxr3jCguTakFw0Sy2x3LQWERdQ5EJPw64t1dmtX?=
 =?us-ascii?Q?4KWe/N4RK9Bk3IG4paCWE1yaeSRCOFRs2RewWD0sbPuLA4LNMu16qiQ2aVeJ?=
 =?us-ascii?Q?ohvuH8TUQe7ZOgrwIbnQSh9IJTTOYJhYIkjBdQbRYiS4Z9dts/blX0oZfNgt?=
 =?us-ascii?Q?GHJD8criQTq2bb33fecr+LeRiu4zgRGpeT51eUf8AOlIs7MRAABULXr52fCK?=
 =?us-ascii?Q?mkIswRRWAosxagoyZ2qpicOi2JGR2Iu9qhGwmmOM6KtQJjKBaoltjj2Nwh+E?=
 =?us-ascii?Q?+L+6zYtsacbE4Io+FfQjM43jKWJyoC+G/8zuyO9nqtndtHPK0kq9YT7BJO4H?=
 =?us-ascii?Q?3awQ09WBfAAmhCjgvuLgq5LgxfY796IjQj0RlXpXa/2wq/oRGiel6iuSLxUK?=
 =?us-ascii?Q?Xk+tQmAXvPOviOlIA0JUBxZa1i625xi0FMW1G0lI41EEjiufzxqJRfTTjaIX?=
 =?us-ascii?Q?9i6+pO2W0TnAtiNzBGCaFqdLqewnFy+1cI4V+yTISwmJGPuAD4b5oeKTrPpX?=
 =?us-ascii?Q?dO+TaBCNDXk7PPYyFIQpOvQiMqoQRL7en7l01Sjq/a3lQ+o8eTBa2bF0/H9M?=
 =?us-ascii?Q?JHn4C0SUIvh14PoijU/kuRHvKk8M2M717TrkX2RvO10qfiCrz0CNq0X+imT1?=
 =?us-ascii?Q?FvWjrTJaDByF34VjotJnwKmCXKZ/6pAetnRB1nkdk1nP4iCxwhMLqkiuVYtu?=
 =?us-ascii?Q?Hvvx5nOmwhqx4Z3Jq2/9UT7LXlKdTwOERVSYcBfOLZK5rH4cvuDAHoZ5yTXa?=
 =?us-ascii?Q?g4MivjXER7zhbdimmJ0T1N69yHPFoUEYVXrPcUlirxO8nM0qzcmmuqIetsJJ?=
 =?us-ascii?Q?9sZZM9eSVGsF3gogCEoZ/SsXnopm05EqcQt3bQgklHOgsmn4NMTStMXN4GKz?=
 =?us-ascii?Q?6n+zRAs+CswFc36wzZxKlgTtnRHaonTfL7NW55ufAH79I8Nv6Oowx4HrpiNT?=
 =?us-ascii?Q?GTQWZ9z5wxZj0upu3avoAfR6KKET2zhqnxy08cNwjxrUUp5XafXrgs8MHpZX?=
 =?us-ascii?Q?RWvJyew1r9ipA1zGbeJMqGFojgsys0/PBgoFjUCAAGS96wSk32ZmDD9f3PO8?=
 =?us-ascii?Q?tZd5hRMRZe8DED18+5w5p1ikSk/pcCNIEu0jxFMgJ7cZ9W1sZpKKyFT54rTw?=
 =?us-ascii?Q?1d2ZRMxB4X1XjsMWdlXbNasUVTr61OYooBoMZq9t5WESLmgWj3B7vWVKLPXd?=
 =?us-ascii?Q?DcWXf4nHgz0OgNjSbPaOpqZbF3TMMJrAHekulDwuWrOdR3hRgl2VOodkxv5t?=
 =?us-ascii?Q?1z+sXjM8ZlJtZRACS/kXvWt5y+3Pbo5AuDoXz+Q9EB3F+k1Be3BPSTJCE4FW?=
 =?us-ascii?Q?tRaBLjbq1hBOyiXEUZkotSQduxqqzH6KKoVLZRL05Onjxax/fWJil2eFAfSi?=
 =?us-ascii?Q?ATHLx4bqMjUpbFFGDMVeTSsKthiJ5DgHkNMkiMfraVOdXib7nju/mww9CEGc?=
 =?us-ascii?Q?Q1ouSXyjAlXNKj9Cf/Gm2bqyOrudPpp3exHCyoT4Uv9oMEhZJQelW/Bk/VHe?=
 =?us-ascii?Q?aiJdS1dkJfreXptIgWb7JSO76CVnoJXa90EqXONP?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY4PR01MB14282.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d9d9dbc-ceba-41e1-5951-08de1e02881d
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Nov 2025 13:35:35.5363
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XskgUhEM+XXU3aKcAEQXm2/7fNg0kk/m9+mDqimSchihDEWiRgDjCMnsUQmgUfDXY3ioQZPTkS+6CcmdH3KPDc3vnuJXAESRsdIz/8JuPNo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB9548



> -----Original Message-----
> From: Andrew Lunn <andrew@lunn.ch>
> Sent: Friday, November 7, 2025 3:32 AM
> To: Michael Dege <michael.dege@renesas.com>
> Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>; Andrew Lunn <an=
drew+netdev@lunn.ch>; David
> S. Miller <davem@davemloft.net>; Eric Dumazet <edumazet@google.com>; Jaku=
b Kicinski <kuba@kernel.org>;
> Paolo Abeni <pabeni@redhat.com>; Richard Cochran <richardcochran@gmail.co=
m>; niklas.soderlund
> <niklas.soderlund@ragnatech.se>; Paul Barker <paul@pbarker.dev>; Rob Herr=
ing <robh@kernel.org>;
> Krzysztof Kozlowski <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.o=
rg>; Geert Uytterhoeven
> <geert+renesas@glider.be>; magnus.damm <magnus.damm@gmail.com>; netdev@vg=
er.kernel.org; linux-renesas-
> soc@vger.kernel.org; linux-kernel@vger.kernel.org; devicetree@vger.kernel=
.org; Nikita Yushchenko
> <nikita.yoush@cogentembedded.com>; Christophe JAILLET <christophe.jaillet=
@wanadoo.fr>
> Subject: Re: [PATCH net-next 09/10] net: renesas: rswitch: add simple l3 =
routing
>
> > +void rswitch_update_l3_offload(struct rswitch_private *priv) {
> > +   u32 all_ports_mask =3D GENMASK(RSWITCH_NUM_AGENTS - 1, 0);
> > +   struct rswitch_device *rdev;
> > +   bool l3_offload_enable_cond;
> > +   u32 l3_rdev_count;
> > +   u32 l3_ports_mask;
> > +
> > +   l3_ports_mask =3D all_ports_mask;
> > +
> > +   l3_rdev_count =3D 0;
> > +   rswitch_for_all_ports(priv, rdev) {
> > +           if (rdev_for_l3_offload(rdev)) {
> > +                   l3_rdev_count++;
> > +                   l3_ports_mask &=3D ~BIT(rdev->port);
> > +           }
> > +   }
> > +
> > +   l3_offload_enable_cond =3D (l3_rdev_count >=3D 2);
> > +
> > +#define FWPC0_L3_MASK (FWPC0_LTHTA | FWPC0_IP4UE | FWPC0_IP4TE | FWPC0=
_IP4OE)
> > +   rswitch_for_all_ports(priv, rdev) {
> > +           if (rdev_for_l3_offload(rdev) && l3_offload_enable_cond) {
> > +                   /* Update allowed offload destinations even for por=
ts
> > +                    * with l3 offload enabled earlier.
> > +                    *
> > +                    * Allow offload routing to self for hw port.
> > +                    */
> > +                   rswitch_modify(priv->addr, FWPC1(rdev->port),
> > +                                  FWPC1_LTHFW_MASK,
> > +                                  FIELD_PREP(FWPC1_LTHFW_MASK, l3_port=
s_mask));
> > +                   if (!rdev->l3_offload_enabled) {
> > +                           rswitch_modify(priv->addr, FWPC0(rdev->port=
),
> > +                                          0,
> > +                                          FWPC0_L3_MASK);
> > +                           rdev->l3_offload_enabled =3D 1;
> > +                           netdev_info(rdev->ndev, "starting l3 offloa=
d\n");
>
> This, and the other netdev_info calls should probably be debug.

Thank you for the comment. I will update both places.
>
> > +static bool rswitch_l23update_hw_op(struct rswitch_private *priv,
> > +                               struct rswitch_l23update *update,
> > +                               bool install)
> > +{
> > +   u8 *dst_mac =3D update->spec.dst_mac;
> > +   u32 val;
> > +   int ret;
> > +
> > +   val =3D FIELD_PREP(FWL23URL0_RN, update->index) |
> > +         FIELD_PREP(FWL23URL0_PV,
> > +                    install ? GENMASK(RSWITCH_NUM_AGENTS - 1, 0) : 0);
> > +   iowrite32(val, priv->addr + FWL23URL0);
> > +
> > +   val =3D FWL23URL1_TTLU |
> > +         FWL23URL1_MSAU |
> > +         FWL23URL1_MDAU |
> > +         (dst_mac[0] << 8) | (dst_mac[1] << 0);
> > +   iowrite32(val, priv->addr + FWL23URL1);
> > +
> > +   val =3D (dst_mac[2] << 24) | (dst_mac[3] << 16) |
> > +         (dst_mac[4] << 8)  | (dst_mac[5] << 0);
> > +   iowrite32(val, priv->addr + FWL23URL2);
> > +
> > +   iowrite32(0, priv->addr + FWL23URL3);
> > +
> > +   /* Rule write starts after writing to FWL23URL3 */
> > +
> > +   ret =3D rswitch_reg_wait(priv->addr, FWL23URLR, FWL23URLR_L, 0);
> > +   if (ret) {
> > +           dev_err(&priv->pdev->dev, "timeout writing l23_update\n");
> > +           return false;
>
> Why not make this an int function and return -ETIMEDOUT?

Good suggestion. I will rework the code accordingly.
>
> > +static bool rmon_ipv4_dst_offload_hw_op(struct rswitch_route_monitor *=
rmon,
> > +                                   struct rmon_ipv4_dst_offload *offlo=
ad,
> > +                                   u8 frame_type, bool install)
>
> Why all this bool functions? Especially when you have calls returning err=
or codes you are throwing
> away.

I will look at the code and make improvements.
>
> > +static struct rswitch_l23update *rswitch_get_l23update(struct rswitch_=
private *priv,
> > +                                                  struct rswitch_l23up=
date_spec *spec) {
> > +   struct rswitch_l23update *update;
> > +
> > +   spin_lock(&priv->l3_lock);
> > +
> > +   list_for_each_entry(update, &priv->l23_update_list, list) {
> > +           if (rswitch_l23update_matches_spec(update, spec)) {
> > +                   update->use_count++;
> > +                   goto out;
> > +           }
> > +   }
> > +
> > +   update =3D kzalloc(sizeof(*update), GFP_ATOMIC);
> > +   if (!update)
> > +           goto out;
> > +
> > +   update->use_count =3D 1;
> > +   update->spec =3D *spec;
> > +   update->index =3D find_first_zero_bit(priv->l23_update_bitmap,
> > +                                       RSWITCH_MAX_NUM_RRULE);
> > +   if (update->index =3D=3D RSWITCH_MAX_NUM_RRULE) {
> > +           dev_err_ratelimited(&priv->pdev->dev,
> > +                               "out of l23_update entries\n");
> > +           /* FIXME: trigger expire? */
> > +           goto no_free_bit;
> > +   }
> > +   set_bit(update->index, priv->l23_update_bitmap);
> > +
> > +   if (!rswitch_l23update_hw_op(priv, update, true))
> > +           goto hw_op_failed;
> > +
> > +   list_add(&update->list, &priv->l23_update_list);
> > +out:
> > +   spin_unlock(&priv->l3_lock);
> > +
> > +   return update;
> > +
> > +hw_op_failed:
> > +   clear_bit(update->index, priv->l23_update_bitmap);
> > +no_free_bit:
> > +   kfree(update);
> > +   update =3D NULL;
> > +   goto out;
>
> It is pretty unusual to have a backwards goto, especially in error handli=
ng. This is one case where a
> scoped_guard() might make sense.

Thank you for your comment I will investigate and rework it.

Michael
>
>       Andrew
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

