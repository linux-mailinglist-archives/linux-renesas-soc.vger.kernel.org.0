Return-Path: <linux-renesas-soc+bounces-28975-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sA/SJ+DrqmlxYwEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28975-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Mar 2026 15:59:44 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF242233CA
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Mar 2026 15:59:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 75DB631035D8
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Mar 2026 14:49:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01CC53A9603;
	Fri,  6 Mar 2026 14:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="CDVk3sB+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010043.outbound.protection.outlook.com [52.101.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6A7127FD4B;
	Fri,  6 Mar 2026 14:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772808563; cv=fail; b=fLJMOWicShOT18naJYHbt77f+dPgPbu19m/bdhn3Y2vT/YE7MHU5xSU/vQgag4UTsZ3cYGDnRX+OhQuTYmRNE9gxYA+SU9wDFsJrvburJQ0YdEHTOULuYOxZBfmmd4YGRFyrS/C9XXq4xwcdP5XE+4zWrFVg6H2aT9xKRWx+0do=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772808563; c=relaxed/simple;
	bh=KG/tBuH0Lv1wiLhYNleE9itFfkVEz1isqaS5RjO6Kw8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=kJJ6qf+PFtv8S+7g2gcSgqmjZLktCRoy+ValI5Dmae/ROGg475cRt75kD410xsJHKEH/9CVc6FmtGn9OScpaEW06ZtpCBeUUa7wLQlHAyZZYkztf9vrQRq5456G1dY8EtPyVBWrWrJpHRSAsV0mLht/6NzGjtUJRYCFeIGrAuig=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=CDVk3sB+; arc=fail smtp.client-ip=52.101.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qmlRusTX9PAMHaiN5YI7e1JYegj0CFUs5G1ICCH5DB+ljDmReB0Dv4ZcsDCEp0HfSwXFbv0KluxyZwwoakle61EyhVS6NUcFM3TmbgXSbl6wNFPpJp+zz9SXl+AefXix6oKPLKia8q5C+x0MWWAoC/Ewn8vzDLtPLm5TSplaJ5yxMCLj61I/RjP/SSDj8+MOfBa66BtF9ggQYKoF+kCJVIhCAPxGqeMfwvXmATTeTcx7K1lySmNBcAhHTH9rSCOf3x3yIXEOSU1sx83u2/EccsmAB0eEatnpTZ2Wz4NqQYVcMlk4T4hysuhdY2YCU1UPLInsK/UvB56n6hf5QIcu7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9sq/0ZIFwGYdrlmCqqyuBrUBLkTIuC4SPV4JLjKygmI=;
 b=EemH3XFxS04azo/kZZhdkr7aM7eutwOY/v2DHD0trmZNne//xwd+CbfeMYlvi7z4P+tOqqNT16PhTgfKgxxbJFpcp+liz+rQgD0WISgkJjlZ0dSZhoXvgpipESsHdMhCGmA8vU+PXyibqinwKPJ1wDAmlX+LW4oro3z89Kbd60+65Kl0QJwAxaCrsJwX/wSNQ0bPvaPiqd/VXP+W9JHxQV1WbVWoIYggrAjrwpHLBkMyIhZnEkzXDT5TbcM2KgPJMMRM5v5e6pE1NXgZgvJPFBkrJJw8TrSinaj9zbT+MlsfBDFaKFesV3aobBZiVdjQilp+Ml8vcmEBVxbWCaxIGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9sq/0ZIFwGYdrlmCqqyuBrUBLkTIuC4SPV4JLjKygmI=;
 b=CDVk3sB+vk9Vuqdn+YBBeOe7Sua9i+sGNWqlaogSRawKOEYFo79rT/2YBgm5DE8d/V2VbouPkx6/7+rS+G509nLsysBG2Bx7wthVTMFkRsPcc/3554Y+OfTNL8hq+BEHfVQLgxPxzvDlk/tYay1A4ZtrAF89i4a0sbY6Bvzyrg0=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS9PR01MB15212.jpnprd01.prod.outlook.com (2603:1096:604:3b7::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Fri, 6 Mar
 2026 14:49:17 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9678.017; Fri, 6 Mar 2026
 14:49:17 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: John Madieu <john.madieu.xa@bp.renesas.com>, Claudiu Beznea
	<claudiu.beznea.uj@bp.renesas.com>, "lpieralisi@kernel.org"
	<lpieralisi@kernel.org>, "kwilczynski@kernel.org" <kwilczynski@kernel.org>,
	"mani@kernel.org" <mani@kernel.org>, "geert+renesas@glider.be"
	<geert+renesas@glider.be>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>
CC: "robh@kernel.org" <robh@kernel.org>, "bhelgaas@google.com"
	<bhelgaas@google.com>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	magnus.damm <magnus.damm@gmail.com>, "linux-pci@vger.kernel.org"
	<linux-pci@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "john.madieu@gmail.com" <john.madieu@gmail.com>
Subject: RE: [PATCH v7 12/15] PCI: rzg3s-host: Add support for RZ/G3E PCIe
 controller
Thread-Topic: [PATCH v7 12/15] PCI: rzg3s-host: Add support for RZ/G3E PCIe
 controller
Thread-Index: AQHcp/6Mgy22Z/aR3kizuyWQZDnsmrWWrjEAgAABfwCACuyegIAAA1DA
Date: Fri, 6 Mar 2026 14:49:17 +0000
Message-ID:
 <TY3PR01MB113468434BE43563E000C3D2D867AA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260227153236.55988-1-john.madieu.xa@bp.renesas.com>
 <20260227153236.55988-13-john.madieu.xa@bp.renesas.com>
 <TY3PR01MB11346B9FB9B0FE7BA3B82D6378673A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <TY6PR01MB173776608DDA83CD05D26FEA5FF73A@TY6PR01MB17377.jpnprd01.prod.outlook.com>
 <TY6PR01MB17377E0DB8F3BCB6E189E18DFFF7AA@TY6PR01MB17377.jpnprd01.prod.outlook.com>
In-Reply-To:
 <TY6PR01MB17377E0DB8F3BCB6E189E18DFFF7AA@TY6PR01MB17377.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS9PR01MB15212:EE_
x-ms-office365-filtering-correlation-id: a30eefc8-63f5-44fb-2b3f-08de7b8f8ab9
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700021|7053199007;
x-microsoft-antispam-message-info:
 pixW2z6GQ69aG/PeBS6or0KpN2zNGSMtzJrtfhmH+bFE++HPO+KDq1wDTt6RvaUgxOURtP4Ml7aX2Iqz+RC3SHyXByC2j2F1RFV+BxNa/9vYw1YtLIROHPSnn2kNTLNsxFdI9z0KcHK6U6F9Wd+Q35TR5YkO+1GzZ+7LNJ3HS8E6vZnNrkTu46FblveNlaFhAnD5YO4CIxZfwQOBNdPLYbJ8vRlaPWONT1q2Ix5/Agj08LPCyiPQ5ru1NBpwAzmdYZAAnP/brmghxCIUbajznJ2XtO0hgRVThY1n5inFnm0ZrztAW+tBEV8OKWrk2qAmoyw0otLvcFnkmpTLTqqXRvmdUsTtnNC+LXZOWkOSmPxfcBCSgZlz4uuPPhkFP868BTGFbgeKX8Nfh6WK80ejKZ8p59uewG5B0N/aP2H7K6B3RuaLXrre8Q4cvA1o1IrPu6Bskq9hBDiIXIA3y02dNubDZ0UXQD6rQ8PV7aAgD6z7KUw9205DUEqAN91ySF7LCTqEy2L6gx2FKpDdny/AiXhoBHuFsLIJj9LMD1Mr3WR0iZGgVz9XLE1sMfCrIGyIfYFzjTZPSPHrxQWZWyDAjvGNKaSRUp4Tsa2SeTUwW1PWGjvUht2VrGzUkT5cYp7hveX5d8/JMU5wrbsPC2rXjL/I9J/SVWeEz8FP6XEjlt/0gPunzdg7SnR7SBu7RTvo6BTxJJRi0auHu/zY7LOkNpkfhKcKJ8SX8kHipZpGE+wG4RkEEk9tuZwHKrOIoxjkye3hEEn24vCk1i3ZiN11a5vck4CBUibWpm/rMv07hqY=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700021)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?O9P88j/hnKT7Re6HBc3vmK/mGaXAti9jbFYosapyZ0WjF1hZE2vCtt08cxYS?=
 =?us-ascii?Q?OAVatCESmiP054xJvPg5p/CjKjchbHKcP0L5ff++Sh3iG3R070i6iPGCH3jB?=
 =?us-ascii?Q?9xxvZp1oSzVWOjWT749Im4MtgYzu8scBJJyhwB6chW89Vq73DVYcOGMyS0HJ?=
 =?us-ascii?Q?3XbWW92xo1neRzIfPHhI46QJ6+1z43X+lvHqTBCm8O7yvrNwyYkLxhXfQfO3?=
 =?us-ascii?Q?9imCVIoyvvs3J4qIbkSKphmdrsklEaT5i1Doyx82hWiSMvxLk1ImUhRv6Pzy?=
 =?us-ascii?Q?UhqNZQe5Er9x/IRuacBMCjXUs5Bq53UKK/0Ppbe+XceCZ4cpSHeg6rxJHmnK?=
 =?us-ascii?Q?TYZ9nP9uCUdRY6pa3kFpVM5eJ8tkAo/eDDI0PsvLE7isNZrjFW7s6cfUbdad?=
 =?us-ascii?Q?yBOTFqERDH3KATGMyewTonu5mwL6TdpRrpGF4KKwfBzTj1k6GRiPRlcqLjen?=
 =?us-ascii?Q?6sHUmHxLZRdqvZLMIooipKpOVu0eNzte/6GWAleGIRnc7jIkMUjq+HiSQCSe?=
 =?us-ascii?Q?82TZ2FPadOVBY7Mtpl/u7Mz4W61TW2augmnMzzJjyS5lCHMDXFbdQ1ICNLpr?=
 =?us-ascii?Q?/B/dOGwITjHeW/CM3ZJausiRzegeNnRc2yHvJK0Ae7HDeLqORm0HYeGrM2Qd?=
 =?us-ascii?Q?lkqssIlHqq82UdQYOVM/U3v69Dj88udDvk2nOQc8vqBTFOxUW6IqcehmOpTw?=
 =?us-ascii?Q?xZUpHvKtwPjBxk2uU03ZrLnmP0Co37z5dS+NtUBHCndlSWSbbU5y/+zGhsFL?=
 =?us-ascii?Q?P+Me67LscKWEN555Ed3fFqsA0trqoVd3AK+H1c7etqY5kVXQXTdud4uEbZXV?=
 =?us-ascii?Q?11ivzGhlrfeBHLqs5GN/APitsdxDsB/fB68K3fYxxCODwujF0079PdiEM57k?=
 =?us-ascii?Q?+vjIr/mHJ7+LBkytATPJTFuCfukq35EG9p+dObcl6uRRU0zWDH0S1B9gR8+Z?=
 =?us-ascii?Q?yGtFdtizwX3x7kJUdbsCowUgUuFXBx8/COXhGFOs84GMUKn/ey7KbX4QQMxE?=
 =?us-ascii?Q?oKAgXqFYiUsEDElEBbkAZepDCAUIds+v3RncjhnwE3Q32tZRntaYxZJq8MuX?=
 =?us-ascii?Q?QBa92zYvWi7/mXPOkvmfuhgMwHio/RoY/t7VbVEk6D2grpK5QhRvrnFzrFM4?=
 =?us-ascii?Q?I1Q0rLuQm8x7mMns7W6qBMv3CUfyQpLNx0dDUCY7xB82kRX8NzgZMPc3eGLo?=
 =?us-ascii?Q?MqMj8wjh85Mgc2zYbbrpBmOu0rZpKOmuHTEDxxR44mhz0Hrs01PeZfAa3JCK?=
 =?us-ascii?Q?44q7Q50quARJMi9Oj+NvIcj6mbwConNhTdJ6MYfOlCu4wtJpn116Kq3Va66a?=
 =?us-ascii?Q?lXuLcVB6AYpyiDrZO+YlwYDODJtCkcp7QX9GMpvZaG/DDGNDmhwLqt6C1dcv?=
 =?us-ascii?Q?lT1/AZD6l7H8BwXfvH5KaSSbaqvMpg0cWuhUMw7CI1NbZgOtF20VzsPM7v+7?=
 =?us-ascii?Q?L+qGK8mQaRSn6vf80xGPEC/azj2US7OkuUc5IY5e3yiuujY319DG3sEApayW?=
 =?us-ascii?Q?pnnPapxZX8c9EBBFH1NLselNTYBoYbG0YEDtOlj8BlflerwPdyOh5/wwthV+?=
 =?us-ascii?Q?z/6PSU/TSYypHDfoWqcvoJaV1vi8W5Ux7GpaAbfFOzVVIOe3yHh1xZbuOPrH?=
 =?us-ascii?Q?1Mg7GckxYwLwv58nvY3C7z7BgSjBsbz7bQ87tsbf4QXqXn5fDtxHfsBD7rWa?=
 =?us-ascii?Q?E6QlHw+FI8NUoVY/DAAqX5A1fNgxOQUfZyTcX24lHeS8RhYa6Q4xg896Q3sN?=
 =?us-ascii?Q?lxwmunwqDA=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: a30eefc8-63f5-44fb-2b3f-08de7b8f8ab9
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Mar 2026 14:49:17.0699
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: B5VVAufdGX35jMM0tIzlFtar2cRGPfm/0D8Ew6gsNRcTIflihSHN+OciE/5keW+TLrE4CAro+kCV0YKIDXQquGkt8DnRIj7v5v9/VKBTfgI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB15212
X-Rspamd-Queue-Id: EEF242233CA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28975-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,google.com,gmail.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid,bp.renesas.com:dkim]
X-Rspamd-Action: no action



> -----Original Message-----
> From: John Madieu <john.madieu.xa@bp.renesas.com>
> Sent: 06 March 2026 14:33
> To: Biju Das <biju.das.jz@bp.renesas.com>; Claudiu Beznea <claudiu.beznea=
.uj@bp.renesas.com>;
> lpieralisi@kernel.org; kwilczynski@kernel.org; mani@kernel.org; geert+ren=
esas@glider.be;
> krzk+dt@kernel.org
> Cc: robh@kernel.org; bhelgaas@google.com; conor+dt@kernel.org; magnus.dam=
m <magnus.damm@gmail.com>;
> linux-pci@vger.kernel.org; linux-renesas-soc@vger.kernel.org; devicetree@=
vger.kernel.org; linux-
> clk@vger.kernel.org; john.madieu@gmail.com
> Subject: RE: [PATCH v7 12/15] PCI: rzg3s-host: Add support for RZ/G3E PCI=
e controller
>=20
> Hi Biju,
>=20
> > -----Original Message-----
> > From: John Madieu
> > Sent: Friday, February 27, 2026 4:44 PM
> > To: Biju Das <biju.das.jz@bp.renesas.com>; Claudiu Beznea
> > <claudiu.beznea.uj@bp.renesas.com>; lpieralisi@kernel.org;
> > kwilczynski@kernel.org; mani@kernel.org; geert+renesas@glider.be;
> > krzk+dt@kernel.org
> > Subject: RE: [PATCH v7 12/15] PCI: rzg3s-host: Add support for RZ/G3E
> > PCIe controller
> >
> > Hi Biju,
> >
> > Thanks for the feedback.
> >
> > > -----Original Message-----
> > > From: Biju Das <biju.das.jz@bp.renesas.com>
> > > Sent: Friday, February 27, 2026 4:42 PM
> > > To: John Madieu <john.madieu.xa@bp.renesas.com>; Claudiu Beznea
> > > <claudiu.beznea.uj@bp.renesas.com>; lpieralisi@kernel.org;
> > > kwilczynski@kernel.org; mani@kernel.org; geert+renesas@glider.be;
> > > krzk+dt@kernel.org
> > > Subject: RE: [PATCH v7 12/15] PCI: rzg3s-host: Add support for
> > > RZ/G3E PCIe controller
> > >
> > > Hi John,
> > >
> > > > -----Original Message-----
> > > > From: John Madieu <john.madieu.xa@bp.renesas.com>
> > > > Sent: 27 February 2026 15:33
> > > > Subject: [PATCH v7 12/15] PCI: rzg3s-host: Add support for RZ/G3E
> > > > PCIe controller
> > > >
> > > > Add support for the PCIe controller found in RZ/G3E SoCs to the
> > > > existing RZ/G3S PCIe host driver. The RZ/G3E PCIe controller is
> > > similar to the RZ/G3S's, with the following key differences:
> > > >
> > > >  - Supports PCIe Gen3 (8.0 GT/s) link speeds alongside Gen2 (5.0
> > > > GT/s)
> > > >  - Uses a different reset control mechanism via AXI registers inste=
ad
> > > >    of the Linux reset framework
> > > >  - Requires specific SYSC configuration for link state control and
> > > >    Root Complex mode selection
> > > >
> > > > Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> > > > ---
> > > >
> > > > Changes:
> > > >
> > > > v7:
> > > >  - Renamed RZG3E_PCI_RESET* defines to RZG3S_PCI_RESET* as these
> > > >    registers are shared with upcoming SoCs (RZ/V2H, RZ/T2N, RZ/N2H)=
,
> > > >    dropped associated "RZ/G3E specific registers" comment
> > > >  - Dropped "RZ/G3E SoC-specific config implementations" comment
> > > >  - Unified function naming to rzg3e_pcie_config_{pre_init,post_init=
,
> > > >    deinit}() and rzg3s_pcie_config_{post_init,deinit}()
> > > >  - Simplified comments as per Claudiu's suggestions
> > > >  - Used local mask variables for compactness within 80-char limit
> > > >  - Fixed L1_ALLOW error path: goto config_deinit_and_refclk since
> > > >    port refclk is already enabled
> > > >  - Fixed resume: reordered MODE before RST_RSM_B to match probe
> > > >    sequence, fixing error path handling
> > > >
> > > > v6:
> > > >   - Use rzg3s_sysc_config_func() with per-function calls instead of
> > > >     rzg3s_sysc_config() with -1 skip pattern, as suggested by Claud=
iu
> > > >   - Extend enum rzg3s_sysc_func_id with L1_ALLOW and MODE entries
> > > >   - Use regmap_update_bits() consistently for all SYSC accesses
> > > >   - Shorten comment to "Put controller in RC mode and de-assert
> > > RST_RSM_B."
> > > >   - Drop "Enable ASPM L1 transition" comment (function ID is
> > > > self-documenting)
> > > >
> > > > v5:
> > > >   - Introduce rzg3s_sysc_config() helper for sys configuration
> > > >
> > > > v4: No changes
> > > > v3: No changes
> > > >
> > > >  drivers/pci/controller/pcie-rzg3s-host.c | 90
> > > > ++++++++++++++++++++++++
> > > >  1 file changed, 90 insertions(+)
> > > >
> > > > diff --git a/drivers/pci/controller/pcie-rzg3s-host.c
> > > > b/drivers/pci/controller/pcie-rzg3s-host.c
> > > > index 44ce056d62c6..b7f92f5aee4a 100644
> > > > --- a/drivers/pci/controller/pcie-rzg3s-host.c
> > > > +++ b/drivers/pci/controller/pcie-rzg3s-host.c
> > > > @@ -111,6 +111,15 @@
> > > >  #define RZG3S_PCI_PERM_CFG_HWINIT_EN		BIT(2)
> > > >  #define RZG3S_PCI_PERM_PIPE_PHY_REG_EN		BIT(1)
> > > >
> > > > +#define RZG3S_PCI_RESET				0x310
> > >
> > > If there is any new version of the series, please put a comment
> > >
> > > +#define RZG3S_PCI_RESET				0x310 # Only for RZ/G3E
> > >
> >
> > Noted for v8, if any.
>=20
> Finally, this register (and other RZ/G3E-specific ones) is also available=
 on RZ/V2N (and probably
> other SoCs) where no driver changes need to be made.
>=20
> I would suggest keeping it as it is, avoiding the extra comment.

This register is not applicable to RZ/G3S. You can extend the comment for R=
Z/V2N right.=20

See [1], maybe for PCIe driver it won't care??

[1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tre=
e/drivers/net/ethernet/renesas/ravb.h?h=3Dnext-20260305#n160


Cheers,
Biju

