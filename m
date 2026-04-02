Return-Path: <linux-renesas-soc+bounces-30761-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oK7/Gg6JzmlMoQYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30761-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Apr 2026 17:19:42 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D9CE738B2A5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Apr 2026 17:19:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 642DB3007944
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Apr 2026 15:17:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACA1A3093D3;
	Thu,  2 Apr 2026 15:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="sXKRk5/r"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011011.outbound.protection.outlook.com [52.101.125.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7E142FE598;
	Thu,  2 Apr 2026 15:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775143036; cv=fail; b=jXRMjptuM/lXc9akjYytl4p18WieufvGXm/xg/b4E2FSMqtn5XkRsAqvo5DMb8iq37M9ub/19/1UYX5perMOIh4aCTQtqE1QpswhxPLYy8Q9nx+JZxEs975k0XrgvMObnqPfcAZ3UEQxeOBeHR08N/nc9lTyw0GxpR1S2Yy79s8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775143036; c=relaxed/simple;
	bh=G6316bsj4zBLUN0f9VbVavG2vGXp3X+juRJs2fgjlb0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Ps6D4MW7Ut+mm6yHwRcWoqe9/LRjQzJtP/pDEu7757LIs0F5fCJtaT4Jj+btQQaRLcu06GQNbpzbChrsbfxGeGqvJESjk22Vcz1pTMWtAguqYiHspc/HOQgE4d/9HAxNZx8WHFWjuAzrjrtMxpAnqEwqWaTLEqCs40nl8YnXrHE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=sXKRk5/r; arc=fail smtp.client-ip=52.101.125.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SG+0Stv0cOK6E24B+zzJgJKbweZEGlW4Iz8RvRB/qxPWpJTkj13cS4WHUuCV5Qu6uhe+26wTtag9VkppfDwG78DiptdZIf9NiuRqov5uBINUQsh4R/wlqNb3HM2bd9P8OVXmeDoZpZ5pi2KJ8RbttffSCiadK6v5PuUomjAmJqMGTZ7I4VRIqV6SFG3lMk38I7z0XbUYHiXp4gU1Bia8nWH/9At/BbdkpUQv2kbkx4BEZlVyF/17YD79Hcg1EYuAGQ7l1jvP4UzcAHYbdzQIjY8tEkTqXZwdFpYzj5CRWarOVTCqX7g9IPaJKqbQwCD1kux2TO57A6CgzqvrCQCrBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XL2aq30IEwK2IVB3J8OHrIv1R3W2o70pZfyBiUrokIA=;
 b=ad5cOTXc6kqMHg9OeHWf0gUbc5RDsa9Dunb8mHtQou8Mrkmy+lUyYt5XNTrfmtPzyiG/A+SrUI8Zj/fJ3M25hKhQ3WW+qoCEu52pecBMLaSFDPZpNr9gpGtU6KYXqSWA3r2sdh8bmNkBZV/r1+v/JekRn7Plb5E0MnYYvO0IhR13i2Bfi7sVg1M9pPxSEKAjGF6/Wja9mNT6nz7EwnjT/c7HMB52PmwpAmZTnIJL1p0axb6J6MVqdb35YRXtOGMwqiW+gsDBnm+Xlj/wHXi1tqbFCeSTY4vxApYTdUD4eSbggQgcxWy+O8BfzwGlhpHrFREuEzPn1f00nxXNzxvtsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XL2aq30IEwK2IVB3J8OHrIv1R3W2o70pZfyBiUrokIA=;
 b=sXKRk5/r6P96+ecwbTsoBPWCaUdcvG0ur7NwcbUpy/dp3kPBx0btKR5K5b/TxVNPfZfe6nv/LB1kMemFoOKIKBbhwVO/UZScTfxTXBN20XQyxyz37qxJQ32z/nU+6NMg47p3JiFEABkruRjh527h+HbDxzA/xaj8VHWSy3L+bpE=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYRPR01MB15808.jpnprd01.prod.outlook.com (2603:1096:405:2c5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Thu, 2 Apr
 2026 15:17:09 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9769.017; Thu, 2 Apr 2026
 15:17:09 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Mark Brown <broonie@kernel.org>
CC: Krzysztof Kozlowski <krzk+dt@kernel.org>, biju.das.au
	<biju.das.au@gmail.com>, Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, magnus.damm <magnus.damm@gmail.com>,
	"linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Prabhakar
 Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH 0/2] Add Renesas RZ/G3L RSPI support
Thread-Topic: [PATCH 0/2] Add Renesas RZ/G3L RSPI support
Thread-Index: AQHcq6tn0LK2JKDugkSgDHRkkiWo8rXL6eUQgAAFrwCAAAA7cIAAGUiAgAACcOA=
Date: Thu, 2 Apr 2026 15:17:09 +0000
Message-ID:
 <TY3PR01MB1134651E4357EC11484AC8E938651A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260304074907.9697-1-biju.das.jz@bp.renesas.com>
 <TY3PR01MB1134614237922A87C70AA685C8651A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <f6fd2e18-d5f8-40fe-a4d2-7894bd232da7@sirena.org.uk>
 <TY3PR01MB11346472F87787030828ACFFE8651A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <fb4a0a18-5fde-43a7-8b2f-3b79656e78eb@sirena.org.uk>
In-Reply-To: <fb4a0a18-5fde-43a7-8b2f-3b79656e78eb@sirena.org.uk>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYRPR01MB15808:EE_
x-ms-office365-filtering-correlation-id: af74c8e7-a4d4-4a06-a020-08de90cae8a4
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700021|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info:
 W+nwDbeygotdpVgVG7pdLrOeUQ4AhrcTX5UtZ8uY7sY39tQHNIvW++RmNXtOizhyYegrpPed0S/Fzpck0fo8WTccpzY2lPH20wyYnOOmmvOvpq/FTZJxwkaX4bQX1eaEVC/KWspIB0xTFoNtW65KxNmC+7mUwapPohlhxr/5soc+/n3newQ+lmmikwfwgGYxeDsMLD+VXrkwrjG2z6Lf+6/VHs9XFWs+4vsJg40gl/cPl0MlKwwqAsJGnV7DBOb4WneCcjLzWqz+KShPkDHtvgR/Pp2Hfy4uX8yRQIDvwlgFNz2CC4h3cM2oU0CU4wlsaiGJRduzGtFQNQ6SUlQ3+YAr59LTBLIsPU1T9lP9gzg/7/f2L7r5KC1g4Dn3kUfXRj/qwIDuyS8KmMRJLpxxMfKUBuDOZoauH4ngcuTgz541OgKNQDW8lPysYdborRZ9qoXacV2cgXaCE0PYfV3wkUcjMW5xMOZOpYZLY5mq2frOon0sWLYdgqjeHDsjJTdX4Z+KDcjh5AdtxgJZSBlGT/Un2nL0BlOszYkgfXDQdmcq7sOzJazUB9WEVs7Dmh6++zZu1uJMX2mBVVlSOZcKZPsCqI//cbujBceMdSCikQF9NMSOvBSY31/hY4OWHb0EkHuC8MYh2UsyQRlE9A1nUQv0WSa8UG49Dc4KOIdn+ErFcQ/egQM7P+gu0S9WZutLPLihpyjF7fZjT83P1Mj2f6uUEGx3cvYfWxwBvE4rlJNh2Ttq16JbeJThu11PMS8u0ZjuQY2kAIDzDZPYeaHV78zejmFLQYsk/OkVSI6ARQ8=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700021)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?4cG5iPqE1c1X37U6YjqzbMHh2EAfmOtKS2MjpISDETWyCgassQ8Z413suw6X?=
 =?us-ascii?Q?N1LzYRRTZS11FVA+TkEGzgbIndWCSRGxhvneWAJA9idUc0V2tVeaDIegRFij?=
 =?us-ascii?Q?sHubSh6ngnx8uY9c/iZ3ADIf4rM5DbkPxhMwO+20VnMJR1IrPvJwcJ2000eM?=
 =?us-ascii?Q?PfArfNK0gGx92NO7PvWQbRzchAJ8aXXirzlQf2IGouGZZ/6IG5a5EsT/hbpH?=
 =?us-ascii?Q?4c0Qu+HEIreaqmbX33dpHkl8GSM+4sW1KCqKD0m/yGaHpjKUemeFaZttakbi?=
 =?us-ascii?Q?Uh4hWVhLmdtLhqAusct7TXjrJyeiv1IEjKl/BzA780mU5MWL+EUwORLddi9p?=
 =?us-ascii?Q?a3hvzqpj15l6KwfiHwzsdbPg/t4g8E+ruLs5aJ/9FVBfOAMeRVguH+yhFHGB?=
 =?us-ascii?Q?1pp+diP8y+u+ie9DZFfUF//I8yoTPuZaBDXlggUnn90kBapcrSuNgLy4xONL?=
 =?us-ascii?Q?KeUYRlZ0b/r3UTKarbhGQi8+XdCQWBGkwCWQ/qAIBDPOyfKYH98P7NkCgVUk?=
 =?us-ascii?Q?imPG8CctB2PWK7SIsDcI6nDJ6dQlUa7pnl8Uabwj+sOplgDR8Ov/Y8cFMUdf?=
 =?us-ascii?Q?N/AGtO5l+ovodXGRACwgMj5HcLQTWB8ivJ5Gnqu7E08IJlm0DqT0AyrwNHib?=
 =?us-ascii?Q?7ZAz4CKAaSZZyNHA9fCU1BB1i0hOUPWPDM0wRrNcWr1+HvaqR8I8Jb8LDNH7?=
 =?us-ascii?Q?pChH9R+Ec3yxvJesC6K4FjmLqJYAgqXKDyG9OhLYOUnz2bKTiI/XFIcv9F/9?=
 =?us-ascii?Q?6gnwNQt0I4rDOSSE4XC7EPSF9DS920w3IBeOSvdHYRCV+HFLIDjpfbEDhf+N?=
 =?us-ascii?Q?n2bOQASHqY4DFNQoqnV3n0xwgaDv1HGEVGqhgl+DBYtJBNO15iwaPnvGS4xW?=
 =?us-ascii?Q?vf/zWYR1AJxJBcVm681cUi3ySe2fNA2IhSxLicJWBS8lVyYCIoLA3U1SS0vF?=
 =?us-ascii?Q?0iztDmbQyxIy0QwSkhkWarGH/C60GNaooeLljxI86eDNwNlcR0S2hizYHptn?=
 =?us-ascii?Q?cgpcWd5ZfzV8InFW7PeJ5MtrAveRNlL8d3jUkdO2n15TdQP2Qi3ANj0Vixtj?=
 =?us-ascii?Q?y1ibfhAhdsfuA1E1pMcYeCMvJXULcjR0LQ8SF0o+aQTr2b1DHyiQXYJvt2xP?=
 =?us-ascii?Q?iDUi05kodmndGNDUIHO4G42JKLH1bTmOr94vm6mTuABibH6hWdaeZoxPJ74i?=
 =?us-ascii?Q?sfuBx6/JgtiOjQeGUzsbMdGH9IN8cUqaymNJIixm4G276L8rM5XCO3sFAJRJ?=
 =?us-ascii?Q?EkK2sSyBUwFbg7puLxBGozf2YRjFVfEVm06inir3M1u0phWDoDYEiwzaNGdH?=
 =?us-ascii?Q?Wt91+XAUNgedHgOHK73+xkBXhjntq7oVwRi63oqfRlLjd2aPbJ7FMfss2Jfa?=
 =?us-ascii?Q?GB3uvfFd68pXbTNibcbpAIYa262Kso9Gek+0NBDCq4CJUgGEdDBAXEsQEjPf?=
 =?us-ascii?Q?ulTLAWcF0uqlA5PpgewxsQDXYVcx5iU20J/qKZsoXzUZ22XrXvLCwKW5AAJs?=
 =?us-ascii?Q?JmiB4pKXM22hHrbJGOSoMhshFNEymwFGghSIzJbYMTG4ojO/JZwrgdCwoVmW?=
 =?us-ascii?Q?7URP2gytyJc1DJmK2/gdxb24exMlZ++XqeCSqWJLKZ189hHpSnyP+kzANcwB?=
 =?us-ascii?Q?rWOAMPZokFt0Yt0rGsEFEQ8RlFSA7Lh/Ob7m54GUn/9Vmnv3Ehdi/SQbfrnk?=
 =?us-ascii?Q?Yj5Zk9Q26XcPfIiojCNL0EjHZDYxz65vcWMwJY3XokA2tBqAuaOFFf6og03a?=
 =?us-ascii?Q?KNzQSM3NUw=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: af74c8e7-a4d4-4a06-a020-08de90cae8a4
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Apr 2026 15:17:09.3859
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yB9K72cU8yR2I3NinRDbWg8VX2cn39ykp3XvfsKL3VEbhoGhvZB/kd3zPA0F0RWRe0EoQXdDeRWrAf+5j9P5g4wRKsiDo9LXAFl3o3XkJ80=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB15808
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30761-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,renesas.com,glider.be,vger.kernel.org,bp.renesas.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[TY3PR01MB11346.jpnprd01.prod.outlook.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,bp.renesas.com:dkim]
X-Rspamd-Queue-Id: D9CE738B2A5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Mark,

Thanks for the feedback.

> -----Original Message-----
> From: Mark Brown <broonie@kernel.org>
> Sent: 02 April 2026 15:52
> Subject: Re: [PATCH 0/2] Add Renesas RZ/G3L RSPI support
>=20
> On Thu, Apr 02, 2026 at 01:32:29PM +0000, Biju Das wrote:
> > > -----Original Message-----
> > > From: Mark Brown <broonie@kernel.org>
> > > Sent: 02 April 2026 14:20
> > > Subject: Re: [PATCH 0/2] Add Renesas RZ/G3L RSPI support
> > >
> > > On Thu, Apr 02, 2026 at 01:00:28PM +0000, Biju Das wrote:
>=20
> > > > Gentle ping.
>=20
> > > There's strongly negative feedback from Krzysztof...
>=20
> > I believe Krzysztof is complaining about patch [1] and his comments
> > were addressed in [2].
>=20
> That's really not at all clear from the discussion.
>=20
> Please include human readable descriptions of things like commits and iss=
ues being discussed in e-mail
> in your mails, this makes them much easier for humans to read especially =
when they have no internet
> access.
> I do frequently catch up on my mail on flights or while otherwise travell=
ing so this is even more
> pressing for me than just being about making things a bit easier to read.

Agreed.

>=20
> > > Please don't send content free pings and please allow a reasonable
> > > time for review.  People get busy, go on holiday, attend conferences
> > > and so on so unless there is some reason for urgency (like critical
> > > bug fixes) please allow at least a couple of weeks for review.  If th=
ere have been review comments
> then people may be waiting for those to be addressed.
>=20
> > > Sending content free pings adds to the mail volume (if they are seen
> > > at
> > > all) which is often the problem and since they can't be reviewed
> > > directly if something has gone wrong you'll have to resend the
> > > patches anyway, so sending again is generally a better approach
> > > though there are some other maintainers who like them - if in doubt l=
ook at how patches for the
> subsystem are normally handled.
>=20
> > There is no pending points, everything addressed in [2]. that is the
> > reason for sending gentle reminder.
>=20
> There's more there than just "make sure you've addressed review comments"=
.

The issues related to flexible DMA names for multiple DMAs are addressed by=
 the
commit c2edd7841f58 ("spi: dt-bindings: renesas,rzv2h-rspi: Document dmas p=
roperty").

It looks like Krzysztof wants strict ordering in bindings for DMA names, if=
 it is
a single DMA.

I will wait for his feedback.

Cheers,
Biju

