Return-Path: <linux-renesas-soc+bounces-31275-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gM+bMqWL3mnZFgAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31275-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Apr 2026 20:47:01 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A29203FDC64
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Apr 2026 20:47:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E8324307C879
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Apr 2026 18:44:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFA4D31E855;
	Tue, 14 Apr 2026 18:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="M84zo4Lk"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011070.outbound.protection.outlook.com [40.107.74.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E520256C6D;
	Tue, 14 Apr 2026 18:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776192257; cv=fail; b=cljbU1hocMHydCbCiUSDp+Eb7sL2HT/EAz3faEbnF4xEzaIl4m/+AeORlp1v0d8LqpDXxW0hYTJqfKvD7q5yQUHKy5VyiuNxmDWwVgmEvaBzcbfY7Lyy71n55EmyctYEFKQltaexlwIKfFvqz6nTEk/HLCwRDaY75+ST6i9vniQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776192257; c=relaxed/simple;
	bh=xvZ9X6G3NZf/xAmnCh9U7KZFKcSwL9r2BUkOS0odinw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=omOf4F7NMpdi4z7BFvDdZAZ+AkrYlIQb6MZpunl82KNvyzm5lEn0dhXTsClTbnlSje60zqv1H5YmPu52UYIb+jNJNB/idx5mKFbFpg4a62I7WzP96+Hkaz7GxC8+fwv6m6fchQDecSI4Oo3AYUe5Q+d+WMekNRwbZjR5rL9ciio=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=M84zo4Lk; arc=fail smtp.client-ip=40.107.74.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MZ42f2lHwrFf+kLNzuXh5hpQYURc1tOymO6q1k81hA++bOPpEccq8i3sYPO9rLsp/N8E2owhbApvaFkfXNrbWaBfH1TCKoDuwGtVyOic04G9rQxR23e8fcMzYlE7613RCaA5n9bX4OGwIHak6Eb6vG+1lvqrpOLcFvO8fid2S8nYeQuVdp2AWvUXqub+G04nYU/k9OwLwi0C2OhqpL1nedz97Bi/ATKMXXfKUaFbT9Ht/lBJedqEfQjASNnf+/wHByJ0/RQsJNodPn4AMBG+QGSyMO5VJJUl88FYYEeaD+0VJ5ipifm28VODr/3gq6/lu3FNal1ZOpun7p/xS4XX/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=doTpPY5Z8OPhWPJZcawodCgV8Pk5lsytdXs+KERojnA=;
 b=AJ6ngBqqXS8GjJ150Agv23ReHaPDku99BWeDGPEwe+ZsRwEHmRkdiWY+ZLfC2Kla34dPc+6JWyUnmEeq0e5nZQglhNJda9YlCV2NeYCAl0RqaCnUkvCknHphdGTOd6S41+J6wHmp5dc24YIQpWN/XuYGfeSJuSAT9aoUnhr0zrxncL4Os50beZPEdylm9D/thkSfq3WuUKCMF3HCRZWarPxhgF8eVXOEYJBZEo9Tj6k7Ib5kYNTEkryGUAeUehTst4qcNm0M5N9WUdedBYoeZsvVKt1lomm+Itf3S/Rf6asDmQILI7JkM8Q6tgn9U5zYOC0NwVPtT+uroO+ZtVdr2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=doTpPY5Z8OPhWPJZcawodCgV8Pk5lsytdXs+KERojnA=;
 b=M84zo4Lksa3GOxzNd9GW42qE1dDEAigxcQOpYKlmVSc+2C3X2vQQPPbADlb5QmiIS/YVXOUyGXVrNjiMkVwwxvaTyNiQ1wD1THuNVx1USoiaRchOGCWJqFU/xiYuEETJln6uQqCtwv8Hdhz1qwNq3KQNcSMpBoDAQ4x9PZ+Rbt0=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYRPR01MB12348.jpnprd01.prod.outlook.com (2603:1096:405:fe::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Tue, 14 Apr
 2026 18:44:14 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9769.046; Tue, 14 Apr 2026
 18:44:14 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Andrew Lunn <andrew@lunn.ch>, biju.das.au <biju.das.au@gmail.com>
CC: Arun Ramadoss <arun.ramadoss@microchip.com>, Heiner Kallweit
	<hkallweit1@gmail.com>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet
	<edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, "UNGLinuxDriver@microchip.com"
	<UNGLinuxDriver@microchip.com>, Russell King <linux@armlinux.org.uk>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH net-next v3 4/5] net: phy: microchip_t1: Replace
 phydev->lock with mdio_lock in lan937x_dsp_workaround()
Thread-Topic: [PATCH net-next v3 4/5] net: phy: microchip_t1: Replace
 phydev->lock with mdio_lock in lan937x_dsp_workaround()
Thread-Index: AQHcyoTCEQMQxJrHDEmY8xpx0OuvzLXevOmAgAArOHA=
Date: Tue, 14 Apr 2026 18:44:14 +0000
Message-ID:
 <TY3PR01MB11346EE949C3D92AE05AFD42C86252@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260412140032.122841-1-biju.das.jz@bp.renesas.com>
 <20260412140032.122841-5-biju.das.jz@bp.renesas.com>
 <7924b6fa-8a8a-4a17-bb3d-40a9578a3f8a@lunn.ch>
In-Reply-To: <7924b6fa-8a8a-4a17-bb3d-40a9578a3f8a@lunn.ch>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYRPR01MB12348:EE_
x-ms-office365-filtering-correlation-id: 030d2e55-07ad-4a83-c86d-08de9a55d34a
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700021|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info:
 PzqskprG+k6EoNs4aWQOGkX9v5Q1DWoURpUidI4aKgK1mrdemiiWY/k8uB7zVYk7Lfej++P9GPxpeNrIrGXBp8fx6xWY+YGFa03lscBeLU70YoXGpZtSZcz6mCOkf/kw22Ixcu2tIz+Y6lQRMIXER/sX+6Qt7Ow9o8Ruk22NuUCdsbKGMZPI2fciS0lYm2fUuQWDZFJTdZnjqMfUMrT+3ZyKVHU42tCms8KlNQkTOKM6P5rluOMVABXkqa5alUFjvwOhS2GNziL4VaWgr1RBRSIGuKuFNVFdgwn8RxZvEDIlt1lfs/hGMmQErvA75FtlKRlQ3S/TrflJIQaKUPJ0pbIwXfaKJOxCJ0Pe4UGSuZJwhyW7C2h70zdTBdIc9CMBIVjoGWiNqdT64O+ZX8QHpeiXeEJ9MHpeJtoR9LWtDtAXUl7AMnbLm5a3VoL522HjlDWDrb77YkxzY8XDwAnS1uJZ3XG43tzX+uDs88vauPizAJgnNyK5tcdYMktW6i+7KE67imzQzUaf2MbslbkvkgKWyaijntg36YHoSq0mbfHotStPaO7pLYfDDhWeZ/T0SIcABxsHPwagqd+EKqFuDMwaS2n5W60R3UuBJare1t8y+2oHV2LWrQ31+aQ06jVcVjXMxogTmjSCAKzPEHhOk/JPzoYBMFRYQaAYIS71g9pISx4OOHKXQX6d+Od29nSLY2nwbVg3OfTk73zHZiOOXBjNmBjycFJFYhjjKLCkf4ThBHRTIyPMVJhkNmMINKHwugFGNZQI2eW+6eOn/8hFG9XSpflS/G9tQRoCVojmbes=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700021)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?w+OrY/crAi1DeIUhTk+ufjkpDs/Dv45rieDXXf7d8v763inP1pXa40gHVZ+K?=
 =?us-ascii?Q?AGVKXtNVhuUftLZCS2yFGiCN26/gak0xLlP7ojdFrhMSWzpS9d3onT+Kl1cZ?=
 =?us-ascii?Q?1kX3W6qTGBGdxsepqEIg2oHt+WQrbRuJmgblp0ztLrBNy8EWn8ITBzKQtYd8?=
 =?us-ascii?Q?DfuCWjvSYhkb3Fvl+VlYbr8kQuIMWeOP+gS7o//S9thJTncnvEDvcF1T20Wc?=
 =?us-ascii?Q?NE/3WyCKL/o6j1Q2iNpcUAE5+G0LuDeOkUbhHJcnmFIXYYhKWVVk4xqcsxRx?=
 =?us-ascii?Q?i5fEM2UBxa+PDNm2mB76WN459hZgx+w3t9ch7p3ELGD6XBST+rUL/5ho1G2C?=
 =?us-ascii?Q?DVBR98w20bRDVV6L71qNUIjs0YR2lcSKrnJoShHtlG3uOAzt6LL88umflCvU?=
 =?us-ascii?Q?lqCcbhBOaHd0MTiFcgxJwS3mM5P/IVK3seSQMLBzErVurCVRM9+EUotFp50y?=
 =?us-ascii?Q?bjB8QWTeYE//jFwX8TLMcgxDE/NCPzUsfBYv9BJHpC2wXoRukGtMZ5IkIU9f?=
 =?us-ascii?Q?Buo9R4EJELSQZEiZyfeeiX2OhynYaCbTDbu+AwDDSf4ZW3WH2ctQ6PDJ8/R8?=
 =?us-ascii?Q?2EFr10kfdApF/A/EkB1DS8jnBRyeDCx/muPEKrnOI4mA8ub+fUvi3R1MJdCW?=
 =?us-ascii?Q?Iv57CCwtlEFbuUyl2rVzdP34OM+Jk+4EyMkA9xcf1nXe2A4HOHb2GPecVOt3?=
 =?us-ascii?Q?DxIUZ84QXYlBZe25G250jQniL6Nh7gOHdXnzZt3g1EVKaj+ZQNf4L/grtt/f?=
 =?us-ascii?Q?+ljgK+ub9SATCWSgnhx6Tff+tVGA8iKmjr/9mmKRKWs+QuFmDfwFZX6Tk6+5?=
 =?us-ascii?Q?hJOuoi8J3l1MR/YwayLxC0aDcW/fBY0AWSlMBLwNCQ6Gt82cCILxmugUOy6m?=
 =?us-ascii?Q?T8htY9HmbdKhdh8ygfTaxJ9ckyQ4gEzdJYqAZXV0azooytGNJ1Di733E/Dej?=
 =?us-ascii?Q?jRR7gGq9HUjtAWzFbkfdJE79f8oMl2F8IGR7lChiYdyN4xWmTvNhcq0V7hKH?=
 =?us-ascii?Q?qNl70xiB86tj3i60o7/rslARo4R/GQa6WQ0TZgDKlO7b/r/CXtkTEdQpOmgr?=
 =?us-ascii?Q?wueUzBh39RpgwWIbAEe7pbBx1AJDbD46Fd+vj42y395j6gD4pWDNpsTPqL/S?=
 =?us-ascii?Q?kNJXP0Oegb2VRfI9pBODSFLkI69wDQiA3Pk/Wl4uN9YEuWsSGyX8nvbzOLxC?=
 =?us-ascii?Q?d/tu/Ztc+8t37xTlgIYZQfAT3QmZ7zX2Qzw2aIFp+sP1jreTJcG5x8NSR8Ip?=
 =?us-ascii?Q?i4JBofhjIRrpnTytkWdUna64QfkVnjNZUTX7XLH8xIUPwcxpB0hRoh2z6Cw8?=
 =?us-ascii?Q?BzUuFgDyfLVuy8EDWnOK+pZO0jB4XSzPmQ2xvFOqkdyeYzjjxRojIULy13m9?=
 =?us-ascii?Q?5MTEi2T7MiHlrOexYbZ888O5FXMyqG9f6gQpMU1xYF9N1tJNNSm2sB3+NIeK?=
 =?us-ascii?Q?VLrjvFl8Cyb6Eqsb2AGsWiKCp2w4Mzsl8DmowMD0wag2ULjP9u9f6C9BW9bk?=
 =?us-ascii?Q?Q5Rz7QjwOuP02tMFoVv8l270gWjvutsoZ5GhnbJ+EZ2SM/nNwR3U+rjtByz9?=
 =?us-ascii?Q?SfViY4ORcNZQcflU00If7JV7LN67kR+9fjj6wz5JeV9p+z2k9rpAZioGDm7K?=
 =?us-ascii?Q?QykFvfmVYACK8oSGza65jW07AWVYxt2XIWHCsYLavaSczHddM6zbrrKgvVvM?=
 =?us-ascii?Q?aKloEq183XELiJoeDoa1Iozs6SP9cdd1oZYAZLN8IDyfKSgOn9AtdOxKBg27?=
 =?us-ascii?Q?v2rh8WSnJA=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 030d2e55-07ad-4a83-c86d-08de9a55d34a
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2026 18:44:14.0741
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qKjslICaks1LbSjOIqiJmtYeJ/0A/CdUyI4F4fLlYXhwmFK6DAdf9CIrEk4wZpxib0bfbYYgrW9tESgT5OSZmMiZ0eacNRJEDyDGItkr3Uw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB12348
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31275-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_TO(0.00)[lunn.ch,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[microchip.com,gmail.com,davemloft.net,google.com,kernel.org,redhat.com,armlinux.org.uk,vger.kernel.org,glider.be,bp.renesas.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	NEURAL_HAM(-0.00)[-0.999];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[TY3PR01MB11346.jpnprd01.prod.outlook.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,lunn.ch:email,bp.renesas.com:dkim]
X-Rspamd-Queue-Id: A29203FDC64
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Andrew,

> -----Original Message-----
> From: Andrew Lunn <andrew@lunn.ch>
> Sent: 14 April 2026 17:09
> Subject: Re: [PATCH net-next v3 4/5] net: phy: microchip_t1: Replace phyd=
ev->lock with mdio_lock in
> lan937x_dsp_workaround()
>=20
> > -	mutex_lock(&phydev->lock);
> > +	mutex_lock(&phydev->mdio.bus->mdio_lock);
>=20
> phy_lock_mdio_bus(), and the phy_unlock_mdio_bus().

OK, will fix this.

Cheers,
Biju

