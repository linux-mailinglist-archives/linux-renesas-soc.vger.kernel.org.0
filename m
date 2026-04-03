Return-Path: <linux-renesas-soc+bounces-30867-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id S0drC0ruz2mt1wYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30867-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 18:43:54 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D0C13968B5
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 18:43:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 67C32304A8DD
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Apr 2026 16:30:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FBFA3CD8B7;
	Fri,  3 Apr 2026 16:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="P3zW/p0D"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010043.outbound.protection.outlook.com [52.101.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 747363CE482;
	Fri,  3 Apr 2026 16:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775233854; cv=fail; b=jbtUlqzrHNNWSVq5QQyThw9fpvk/dMhFozPUPRDAAEar8ajeptDWz0be6L2LaasmqofPVECe6X3DfaIs1kMWT7MjzELwaup1PGWD6dpSC6ipCJm1pPMUgPLsre42uzgTBJ8LGzmBGEMgFWOZLyNw+/Mh6JRHappKyxM8OoRHV64=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775233854; c=relaxed/simple;
	bh=lCrY3qf+8LsMCN05zBc9GRJ4gKD7l0uAmTiqMpjhDjU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=nZSUwgAGEzWPxyEqEo6TsO81ga9pJCs6K/f8klgf61U7bMO6uzj5DBv2fE5FwkIjprNcXlCypdEYgEDWU6Y9rlpM6sLfgSKyfBvdDuUleXQeqABYyigcNdUa4L3aS3YSIK0sq12XUKhJr6lFqKYN5c7Joa1r44W1Wl6c8yqbsgg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=P3zW/p0D; arc=fail smtp.client-ip=52.101.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aNloNTEVawGmT2T5qLWvgqsKlBRH2Ygk/YAmSuFjmhxMP60Wy3KzwG9FmKc0sMXipCiPK1Rzb/FLjL55stYkPTymdD/DNJpsRe7wcmSLgAMm+VIZlV0TanFORxAnQXB6QqKRS38DUwMlWzeKXkg0d8mgJIce+svXSFA1HktN/2NwoWN4WlsR9QorJKJKDbxg7+weWwcF85/7LYWZ3u2V2fbx8vtOOygfCh/yxdFBXHrKoT8Qsf4RbpN26/1S53SvXkdqJ8OelimCrcGQqiVSWgcGmBKbVeeONJ11uKMMR+iYXHQC7Zd22ze8Qog0NsNRmHwFkz0YdcOnd34MnvecLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lHLHg+W3P/DEO4cxlnjMWCczTiAy3+UXA35H451sywE=;
 b=N/xbztOnpKESk1SS4OoLvsNCKGFvC2Bvtqmac850Hw6+hCB81FwFGLJ5v7UFGpyPEp5VnIC+jlCtHkC7kWxcugUmEk/c6QT4ReDResGiPtH278j/JZDJc2Gay6xq5A8HszNzjnZyzw62rHuDCAAmVP3BTZwG3g5zBhQDmqj0cL8nhq/LmKCdqqKU52oB06c3jSjaFPvn8r4CFsDoA110yqN8IXpTp8mV7H3JfmWymIBVgxeEibM0uDNqNlKZuyMR4iqPyoDjRT+01HWJ2yqhLE/5hVDCKSDFjZ9RXcxHGat51VlFCeSIJGoCUZMpSmAcaxY7x1M18g1iIl7IGoNTrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lHLHg+W3P/DEO4cxlnjMWCczTiAy3+UXA35H451sywE=;
 b=P3zW/p0DIZcicTGmB84YfT32kycp7CCssvqLILO0o3LomGO9pcex6Z/ZHIz2HRcLsqODOVPk9ZQe771zt2WBNwLr3Hnmx5wvfkdmYAKFsd2NRAkDsMfkmmNOUHRWoOKdQU4VPLocHwVfSmD07WWNMX5ex/OAGWGX+Nlj9nbH2Ps=
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com (2603:1096:400:3c0::7)
 by OS7PR01MB15384.jpnprd01.prod.outlook.com (2603:1096:604:389::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Fri, 3 Apr
 2026 16:30:49 +0000
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::2511:10cd:e497:4d97]) by TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::2511:10cd:e497:4d97%5]) with mapi id 15.20.9769.020; Fri, 3 Apr 2026
 16:30:49 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>, "andrew@lunn.ch"
	<andrew@lunn.ch>, "hkallweit1@gmail.com" <hkallweit1@gmail.com>,
	"linux@armlinux.org.uk" <linux@armlinux.org.uk>, "davem@davemloft.net"
	<davem@davemloft.net>, "edumazet@google.com" <edumazet@google.com>,
	"kuba@kernel.org" <kuba@kernel.org>, "pabeni@redhat.com" <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>
CC: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH net] net: phy: micrel: Fix MMD register access during SPD
 in ksz9131_resume()
Thread-Topic: [PATCH net] net: phy: micrel: Fix MMD register access during SPD
 in ksz9131_resume()
Thread-Index:
 AQHcw1uOXzjJ5f4us0+uUd80lAj1i7XNRYKggAANrwCAAAEosIAABp6AgAAfibCAAAtSMIAAAY3g
Date: Fri, 3 Apr 2026 16:30:49 +0000
Message-ID:
 <TYCPR01MB1133240A73BD311130F4C32C5865EA@TYCPR01MB11332.jpnprd01.prod.outlook.com>
References: <20260403111738.37749-1-ovidiu.panait.rb@renesas.com>
 <TYCPR01MB11332623A3F7FF4601FE8C35C865EA@TYCPR01MB11332.jpnprd01.prod.outlook.com>
 <TY7P301MB198462DF309670467625AD40D35EA@TY7P301MB1984.JPNP301.PROD.OUTLOOK.COM>
 <TYCPR01MB113320392754A3B42F78A9FC5865EA@TYCPR01MB11332.jpnprd01.prod.outlook.com>
 <TY7P301MB198479332A7A0C00451120EDD35EA@TY7P301MB1984.JPNP301.PROD.OUTLOOK.COM>
 <TYCPR01MB1133228575528380F6F8D1CFF865EA@TYCPR01MB11332.jpnprd01.prod.outlook.com>
 <TYCPR01MB11332125932E37C2E2A124CF5865EA@TYCPR01MB11332.jpnprd01.prod.outlook.com>
In-Reply-To:
 <TYCPR01MB11332125932E37C2E2A124CF5865EA@TYCPR01MB11332.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11332:EE_|OS7PR01MB15384:EE_
x-ms-office365-filtering-correlation-id: ee27cb7e-5fe6-47b2-d40a-08de919e5dca
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|1800799024|376014|18002099003|56012099003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 aG3ZfZ0dKrOSlkXoyRzkt0pCRX7/IWG9imlhZMqWYV59Xd5I4qUDpyUSn/dr5zPdFYIRN/qr4LI3GqmbgCuxdqZBL1zxJEmJw+5YtWQ2wH4v9Y8Phb8Vmz8IY9zP0+i6GhTYXv7TPv+/3PkriuwC783yE82sF2UBbOPvOhsd2heXAH3xo/66J1Q/tu5s3AyQfXD8yQtS87hFRwjZmYujT763ArKV7pfb3JDBZJtT4CM4sS6mqOekJ7g1rMs2TsVJJaoEeKLBREGBIYplZyEUoP5HThJgypiQNILT9DGQb+3IIFjoHgrRaBSgo8OpUzJ03h34XW/xO8bAL+15QWlqfJyNSbdQzcygH/pEz9TXLdYpuBVLgwsLQbdHUqmsRd8suS/Y1il3d3uASt5gcv6CsO6lxppwGcl5R2KFirMG7rav3KINz3cAZVPCnB0vhxLo6r719Gp5aif1k+jL7ww8tnzb+VSK2HJaXmgNFviSrkRd5aTJPtGCKzaBxnTDXK+ZUdkhqCncN5+msgT3+oAUgxRIEKfHxUUWd3SdiDFmS5AHa87M8pq3Bh1j9i8T+mxBCR/RvaWDQz5i1JrV41j/f+vmEWaEqXoTm6vQDc39OuOjlAz5VzN1vXSjC/7UePoyo+64/qkU/HCDWt1tVITPaUTOQLorBTpGO26pjXNswsk433Z6xIE7UbrZviHc9znPqiOcra4OCMF1Bh5lQzb5MAmoebuv9RwIFrtXJpFsddV75Ihvu3FgP9OO3/3GB+PD6Fkq4XLWr0yXQcH/vdSuspwWCAmbAhp70nMFMZHkpFw=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11332.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014)(18002099003)(56012099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?xttYyepVj2PD6IM2SoOYmI3FX/dWEJatOcOw+R0tBQEvp54QJsChpcHbqtRe?=
 =?us-ascii?Q?JJH6HC0RNNk/g2J/N8KZNqeuXj9Fuf32JX30czjT0ljhyzjSWGWEfhbHnE4s?=
 =?us-ascii?Q?SNVC+vDMW6ZZNtqxrYQuiw71W6uuc4B+ZIRD9kyJR/urACEhzotqm5TN7C6p?=
 =?us-ascii?Q?EYgvKnAHJx5xax2Stq5bP6zwGpDOXU/79+KZdJvMj/HcycKX0RFU9b0NZCOE?=
 =?us-ascii?Q?OhBkA6e4mkqufo+8rs5mKCKVIRpM50pra6vztELbffUXtkB6TFZYjUdKXao2?=
 =?us-ascii?Q?DV5NR59YTmhj9Lz9hQpRDx4PSc3NEl6NiTVt7Jp1zN+JGyCsgpWrSZE2XZIu?=
 =?us-ascii?Q?Uyil5OwlLI5bpgylDRUJH0X+CNTrEIZcDn5P+OXsYUCdW5qPwA0YOEiSNA5U?=
 =?us-ascii?Q?8NQnlmlGBLEHHRamLDvdIwAdcxsd7HPcs/HX5j7cDKfwXyO6NEfv+9W0Neuh?=
 =?us-ascii?Q?buP1PbjkXWgoTDq1p+8Avu0KUh87eFD45P6tu9lZLjHVx4EfkprGncDEewUR?=
 =?us-ascii?Q?kaPs1AuU8JwyisXklEm0xYFBpbCWfM1HRT9jCZ4rH6h0+6WPJxaDOV6TkjSB?=
 =?us-ascii?Q?3zDmVCXsbzUgCrT5YBYgzqq4tS8C1kwtEhoynMjm+hIUWVDIbe97kykZCg7n?=
 =?us-ascii?Q?Y8cI9Az7kB68C1bTwAMrlhGPsINw1zmGROJQJ7la3lcrkASbMENeDseCy7pJ?=
 =?us-ascii?Q?IrwFthlaAMrmVbNeAtanpR3BwgbC5pO2xbZyxRkQyKj+2YRCGfG5n3TbYW03?=
 =?us-ascii?Q?bLx/mmpk4R9uA68R4Dv6d6BdNKBFcQqaD84S92AVvVUpFaPRo3EQi+/RYlYM?=
 =?us-ascii?Q?k4lzombO4gK+XfHIrt4GViFmstdlPIqtNyw1+3WwX6oMrVorEmts6pXaEO3p?=
 =?us-ascii?Q?pr5rY4BFBIaS84CY7LGPLuQ1mb7VLw8CEe9liBN1AAUsJUFLbP81mv6K6pKT?=
 =?us-ascii?Q?yX4srxcUEeklKxg5n03UHNInb19nl4ME4XK0RBWEXTJAxnyY2IvsWRTQB37G?=
 =?us-ascii?Q?vRWBCGi+uXoJHIntbg1K/OHfecknNrxBQCvekIjB5MqRh9sVUHG4FvqhxzxQ?=
 =?us-ascii?Q?ocPsW9TxmuH1BNlJpA/+F+uDTJJrtqPCaA/uieDx3SSfGNTDub8AEN4CCGrp?=
 =?us-ascii?Q?+A/jWFr41wmSNsr2M9hiBqPnJ7IYmDhB49lv+3qA1gN4oiDKIViiKZQ0Xhxn?=
 =?us-ascii?Q?vW1gyO35TFq7N4ONWEZqz+R3C6+nCwyhKGGxUmNevDo4vNe9gARkOT2v0B9y?=
 =?us-ascii?Q?JxkRsYHk4HcYksaWZV1lRxt4zADNa+V621BxrI1/7ZM5BCJqwy7nNR6cwPKy?=
 =?us-ascii?Q?B+wZ2Bt+ACEZvhxgcUj43hbUobSY71lbNY/NNcamq3lXlZ2xUtpzkq9JfQ84?=
 =?us-ascii?Q?Ec6juDxEjlRakXeZCrAQLFQ2HlJXKQPByxEPnHxUGMx3Xvbgw3yIoXDP8gdp?=
 =?us-ascii?Q?F0jo71pdmUbNuv6ynopdG0Wi+TRkp8ydbMCPI9WLeu6dekSyiYjKcFxkEzIG?=
 =?us-ascii?Q?BwiOVngXGmhE/JS9FcWxVAQ1nUI9OfRZPpBaUwtaVdf6UZ5dwJBIBDu45ATZ?=
 =?us-ascii?Q?boQKaVTSfTibV1EaMzNO0KeMd+zmjUiN1Pjb40QmR8SLCSEGF6YrTY48HY5p?=
 =?us-ascii?Q?NgOlLsd2KEEaS7l49yLgY4CQf6Pcetbyw7gTeuej2hacgfCzaW1Z8ZtiC7zh?=
 =?us-ascii?Q?HdWJutbwYL3VtdYWtKGh/55iTbuX9ew4lLXE438Wp4zdKClFG+D7PelRoSnv?=
 =?us-ascii?Q?WmAHy4FOdg=3D=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11332.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee27cb7e-5fe6-47b2-d40a-08de919e5dca
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Apr 2026 16:30:49.7588
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 15sIO0ZCuCyzWMvCECORZmAGF7AbXIOwDOuyo7E54ESostwKasLZvN9AiDzpniqsQfrrGU5jOL8IbKitvZrw7lhXZS8BmaoUSxs8uQB07aU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB15384
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30867-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_TO(0.00)[renesas.com,lunn.ch,gmail.com,armlinux.org.uk,davemloft.net,google.com,kernel.org,redhat.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	NEURAL_HAM(-0.00)[-0.998];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,TYCPR01MB11332.jpnprd01.prod.outlook.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,microchip.com:url,bp.renesas.com:dkim]
X-Rspamd-Queue-Id: 0D0C13968B5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



> -----Original Message-----
> From: Biju Das <biju.das.jz@bp.renesas.com>
> Sent: 03 April 2026 17:29
> Subject: RE: [PATCH net] net: phy: micrel: Fix MMD register access during=
 SPD in ksz9131_resume()
>=20
> Hi Ovidiu Panait,
>=20
> > -----Original Message-----
> > From: Biju Das <biju.das.jz@bp.renesas.com>
> > > Subject: RE: [PATCH net] net: phy: micrel: Fix MMD register access
> > > during SPD in ksz9131_resume()
> > >
> > >
> > > > >
> > > > > Hi,
> > > > >
> > > > > >
> > > > > > Hi Ovidiu Panait,
> > > > > >
> > > > > > Thanks for the patch.
> > > > > >
> > > > > > > -----Original Message-----
> > > > > > > From: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
> > > > > > > Sent: 03 April 2026 12:18
> > > > > > > Subject: [PATCH net] net: phy: micrel: Fix MMD register
> > > > > > > access during
> > > > > > SPD in ksz9131_resume()
> > > > > > >
> > > > > > > During system suspend, phy_suspend() puts the PHY into
> > > > > > > Software
> > > > > > > Power-
> > > > > > Down
> > > > > > > (SPD) by setting the BMCR_PDOWN bit in MII_BMCR. According
> > > > > > > to the
> > > > > > KSZ9131 datasheet, MMD register
> > > > > > > access is restricted during SPD:
> > > > > > >
> > > > > > >   - Only access to the standard registers (0 through 31) is
> > > > supported.
> > > > > > >   - Access to MMD address spaces other than MMD address space=
 1 is
> > > > > > >     possible if the spd_clock_gate_override bit is set.
> > > > > > >   - Access to MMD address space 1 is not possible.
> > > > > > >
> > > > > > > However, ksz9131_resume() calls ksz9131_config_rgmii_delay()
> > > > > > > before
> > > > > > > kszphy_resume() clears BMCR_PDOWN. This means MMD registers
> > > > > > > are accessed
> > > > > > while the PHY is still in SPD,
> > > > > > > contrary to the datasheet.
> > > > > >
> > > > > > SPD mode: This mode is used to power down the device when it
> > > > > > is not in use after power-up.
> > > > > >           Previous register settings are maintained during and
> > > > > > following the removal of SPD.
> > > > > >
> > > > > > Suspend to Idle case, it is in SPD mode and the MMD register
> > > > > > values are retained.
> > > > > >
> > > > >
> > > > > On resume from s2idle, ksz9131_resume() calls
> > > > ksz9131_config_rgmii_delay() which does MMD accesses,
> > > > > while the PHY is in SPD. According to the datasheet, it
> > > > > shouldn't
> > > > happen. See commit e398822c4751
> > > > > ("net: phy: micrel: populate .soft_reset for KSZ9131") which
> > > > > fixes the
> > > > same issue.
> > > >
> > > > On my board, while s2idle in SPD mode, it does not hang. The
> > > > datasheet does not explain the behaviour when it is SPD mode. But
> > > > it states that it retains all previous register values when it is o=
ut of SPD mode.
> > > >
> > >
> > > According to the KSZ9131 datasheet ([1]):
> > >
> > > 4.17.3 SOFTWARE POWER-DOWN MODE (SPD) ...
> > > The following remain operational during SPD:
> > > MII Management Interface
> > > - Only access to the standard registers (0 through 31) is supported.
> > > - Access to MMD address spaces other than MMD address space 1 is
> > >   possible if the spd_clock_gate_override bit is set.
> > > - Access to MMD address space 1 is not possible.
> > >
> > >
> > > The spd_clock_gate_override bit is not used in the KSZ9131 driver.
> > >
> > > While the datasheet does not specify exactly what happens if register=
s
> > > from an unsupported address space are accessed while the PHY is in
> > > SPD, I think it is correct for the driver to not do it in the first p=
lace.
> > >
> > > [1]
> > > https://ww1.microchip.com/downloads/aemDocuments/documents/UNG/Produc=
t
> > > Documents/DataSheets/00002841D.pd
> > > f
> >
> > For s2idlecase: ie, PHY is in software power down state you don't need =
to restore MMD register, as
> > exiting software power down will restore those registers.
> >
> > You need only restore MMD registers, when PHY loses power ie, suspend t=
o RAM case.
>=20
>=20
> I believe, You really don't need to call phy_init_hw() at all
>=20
> SuspendtoRAM case: ###### ksz9131_resume 1140, software power down state =
is 0 (Normal mode)
> SuspendtoIdle case: ###### ksz9131_resume 1940, software power down state=
  is 1 (SPD mode)
>=20
> If (phydev->suspended && Normal mode)
>   	Restore PHY specific MMD registers.


Please ignore the above, as I am not an expert in PHY sub system.

Cheers,
Biju

