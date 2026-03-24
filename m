Return-Path: <linux-renesas-soc+bounces-30144-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AHdCCrhVwmmGbwQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30144-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Mar 2026 10:13:28 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F72305660
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Mar 2026 10:13:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 73F0231598C2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Mar 2026 09:02:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1033D3DA5B3;
	Tue, 24 Mar 2026 09:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="dObqF35y"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010037.outbound.protection.outlook.com [52.101.228.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43BC43D9DD5;
	Tue, 24 Mar 2026 09:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774342960; cv=fail; b=Rn+j1bWwCAJcNbSkFf3bazKSF0DMvZKeLuVkg0gikVoqOn1PlQjSHDKuFnbVBcM9Nea57S0djgymhTSjHCo3s3R4l/Jirkr0VjezKX4EwcMDKxUjdh82lUVd6OBVas6c8Gd9wJ9dsyb7OBgT1uss2UenW6acpuB9QPbA22cChBY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774342960; c=relaxed/simple;
	bh=+Go0NuoLE1SNipQEHP6m7H71R0sI+3kOpNwjMSFm5lg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=JzhyRMqAlN1LIJ+yVGndWL2naCP5HOu6ffPxqUzv792u/Yk7+9A03fHsjXGWzTd4Xs94TJTMsZFJgU8MMwe+lw1YokHXRpEdhzEmH6KcbFcuArF6+B3FR+x85bYkoPVeJHg/o86GtYgFVol4e1OarK2O/GmYtuMAXuUXSE3P7pQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=dObqF35y; arc=fail smtp.client-ip=52.101.228.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OlxvK4vGIX6hZN3aA/Ats3aePg63hUKsWcMBYIxNeb3LRUZB/a86u2x6QDqahB3Aey5avWfRmpArTf4IA2gHzIR+DRiziTGUosfLE1G+wyQxX5OgNoVgJ+gX4kr727QmNRj2KDgDDsc67aeSyWZpwJGgZq9ZcgOD9xO3w9gAbXEwIuW5e6lGyx2Derkgm/GIDv/Q8SA+RU8babvzZ2w2ucdTSzdxn0GtaIRW76+QYJAsh1OLv7S6hqXumTNIjFdL27DQhf3ubI7MKGlQ4s9cUvZyzOS2cLvzDmQiHr2dKV4R+ZarZzoBGhahXvrdaSWB0fuQzAsxft8Bd1CkPnL8cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t02Z04oHL5BasptZ/rKFMm22YPS/aCd2H4z3qEZRhXQ=;
 b=Jg09DcGUmfWNgneOuD0tNLhiSYaOCTbpHV/Jk9j0s7z763BnqbSn0j/JvfZeAoyyZ+78Mezsmb5p+zN5Go55a0TM9jjrkDp2BGEm6oRJoyidN8SN3aOkoz6MVinpHmonZfyHV45LhbLF6BIvbsIci68MIRZAD15rFql6wVtfgvetHRWHfD4sJG51QpsvPVtDtXEca1+wmJGF1iOBnU6iK/4UyGYu6Mf1A2CPnvL9vs2PX+wfXgYyJ8EUBx/lnrWr+eM156enE0/3rsOfoitokHKgJR+GDWGvg3qncLnJ7URE7e3AfxaoRuko45Iol1kM2XQuOVVZiIn0sHG1OtG2ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t02Z04oHL5BasptZ/rKFMm22YPS/aCd2H4z3qEZRhXQ=;
 b=dObqF35yaGINtlnuzSgmXQWi6UrNdsMD85slPKV/Oq/1G86sdHB1QkkdsVbs/0dqWNXueWIHeJOLGxrzDFmtp11heFxWb9lMqGK0xilOBOygGl9T/ixQpxe/3JOkSs1F+p/WKqnxIQJVWDvofRpGZVD8N+ryzWCuC8nLUJjGxHg=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS9PR01MB12554.jpnprd01.prod.outlook.com (2603:1096:604:2fa::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Tue, 24 Mar
 2026 09:02:32 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9723.030; Tue, 24 Mar 2026
 09:02:32 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: biju.das.au <biju.das.au@gmail.com>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, Prabhakar Mahadev
 Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH v7 05/10] clk: renesas: rzg2l-cpg: Re-enable critical
 module clocks during resume
Thread-Topic: [PATCH v7 05/10] clk: renesas: rzg2l-cpg: Re-enable critical
 module clocks during resume
Thread-Index: AQHcuFdLMPHY8vPymkaBa167hSz6oLW8NwbwgAEwgvA=
Date: Tue, 24 Mar 2026 09:02:32 +0000
Message-ID:
 <TY3PR01MB11346A7439CD161161313D7B28648A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260320104950.42220-1-biju.das.jz@bp.renesas.com>
 <20260320104950.42220-6-biju.das.jz@bp.renesas.com>
 <TY3PR01MB11346E7DCE7FC74864F738314864BA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To:
 <TY3PR01MB11346E7DCE7FC74864F738314864BA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS9PR01MB12554:EE_
x-ms-office365-filtering-correlation-id: 4e9b6442-83c6-4336-7b08-08de898415ae
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700021|56012099003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 uFfhaFLXOCrt03KsidU6Yxj86sVKe1xBEnNEV1C9EV/cNZqVck/rZLJKGB0ikj/yHgKXU0oDMGEMl+IdX34NUf3FiumAbW6QXYn6/E2qD32vwNFngbFLPJFG7X4nc1+9bZFROIocjGTEj4qFEmoWdDcnqcP57tuRpqNXyFqlrN46Huxd0Twt41EoWonDICwtIQ9TDmUivtRaq28ctJprgFWSf4fkQvs1+7B+5IEMpWZ7nqqZdRAgOix7Eq9qVI5VOTINniGLBGIGkKbw9A+n3vKD96axH8ArV4ej8boTMLfJZPY1XVywxKUzzBaIh8Z6AlVihLOvu6rXjY6N8n1fwihd8pGVwIbEeh++p8MAyGAlDxmG2SamokA/wYCj0tLz6bGhxwAN1xG8fj+0vvJoPOFcbo5yaf6J4hk27rmLWKs/noLVe2sNGivkoZ17KkLKxiwOSEcLdVeUYaF8J/ow30Poxy17+5n0BSw9dxjja7sNPG6pruFe2DEGUOS/JeX6lCN2+j7tsFv1QYdv9UlRr4HmoXuS25606hjidad+IBcVp0MbcijuW0rpzlXqBkRk7tvNRsFtkqLhPlB5PKye11enlHZfM59rcWPkFPaP7B7l3Bf/ZOoh5215eLusaxCfTbNd8VC1cHTDVGgB93VW5D1xZuTMoYddepv8wnIpFAop0F1LTn1QYD9Lecf5SB2ie07GqSE17Nk2mjmlMD5c+i0R0kUjwZq7OM0dkwbT3rc+PZQsqklRDWcunmapfg4CGLo6Ea6KumH43kjteWYnV3mndss64/7hp89DzntCcBg=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?aepUOUlwroQoTvIYj6wr+vtqqBFU0iBYIA7eaC4XCqu5/aAiX0pVmn+4cbIz?=
 =?us-ascii?Q?u706DtWtNQacj2fbRd956evdd4+i1ZIHx1pKzQ8ws370WCOi7kLhNBRdWyB+?=
 =?us-ascii?Q?4lv0NJ+rdz5HIYhj7KXHAnUksuY5mQne76UOPNgrGfdDfP95OPS02OUeKY3v?=
 =?us-ascii?Q?dtAWtJ4WEno0E6VGaIvBCz1T6mKm5QzjezBdwJwD3zYrgR/6rQ3+E75jICm4?=
 =?us-ascii?Q?HyjviLl+qK9YeCN1xorKQi4oB9Svj/PQpOzaLXJQrWPZrRsqP41jhTaczOgQ?=
 =?us-ascii?Q?8Femf2c00UbLesDGtXe9QW7gj7ehwEUkoDggQA7wHm4UKfVSradMFB1umKo7?=
 =?us-ascii?Q?MUGcDDEAejyTRLa7So7+NdGxgxjqwOSq911ZfrTEEsLw/S74lyHV2xHistPK?=
 =?us-ascii?Q?gDqicz4RGg3DUPxGrU8JkLMM+oNmTtBNCQi5vVZE5gR3FG/Mf4IwhzoCr9rO?=
 =?us-ascii?Q?iwg2eTa4rYp/T+P6BXE60y5f+7n3WpwSA50itarmnc49mYpYLWMuBJSPU6JJ?=
 =?us-ascii?Q?fJV7AZ+F6vAHLB3zOrET5Fhi7Lp/odk3kXIp5axXb0HAmdOCc4sWhdWwZw7U?=
 =?us-ascii?Q?DrMQReH69OdU2l6tCEjvd2FCCsbFlqmOwVTfU94qJMcIg6aE9DHK3nJ0m7BU?=
 =?us-ascii?Q?/OPQYs8A6u2MbBd9QILwaUH6ppoG5eiIDAUcDydXL20MpoeQZKzOH1DbHCEk?=
 =?us-ascii?Q?8OyBBJLz9cMCT2vq/W8BBqvH3d8U3GY7S41b1ehrYy2dAXwrp70jrFwP2bkN?=
 =?us-ascii?Q?w9KSBn7Nhhi0ofz2bVcg2DfpmpWXlMcG5WnmcdFuJN8yTvwv2KB/GwqSuikW?=
 =?us-ascii?Q?c4fzM+/krw7HhX3wukz//IdTgviN1TDTUPWRCkaGzgwlhfabqZeSqWBAQkyN?=
 =?us-ascii?Q?92m5s7DWy/wYS+jbRfTVWiyWQpflR2tBGU4zKZmsoj4Tf7nHQydeBxIr2MI7?=
 =?us-ascii?Q?k8UZ9+mXaWz/9HcnkGmLlgWgwr3xNHHAP7IXWirpDwOPLgB1t8R7VDhAupit?=
 =?us-ascii?Q?+Hr+hWl2J70VRkPcsKclNnL4Dkz/4z9TIaBRaFcRqcL2pYxZGic2uQlUT3l/?=
 =?us-ascii?Q?Ftf+Vdz26WN8Ne7yw8mYvE/SLwgGcqbKu3fum6KkQAhbSddU4eNVuyVrjGME?=
 =?us-ascii?Q?Zty9wDKZfmvIhEpyEOvgPLxTSwXC+ujcNJ7OoMZbzS5bBTeQU/AkJEjyogUz?=
 =?us-ascii?Q?vIHXz72Y5vC6Lq0UmiwQ5shyTGN3K8ehxAtJAVhkcqCZeMnv0VrujQcaSjNa?=
 =?us-ascii?Q?jx+zdCK9wjDw6TVCHspGta3XBorSiVHwzRHfMHRjCO12NUZGI7N+w3/K8SQU?=
 =?us-ascii?Q?2tRT/EPZdf10mkJ/6MaU5I29/Vk0pGG4zq9mMdWY1H18tfQnRF4LQOIny9On?=
 =?us-ascii?Q?w3EYd4fYxLMpmUxicwctw9rLTCZ+tv4+pQbX4Ww5lOLTovqSTmdcs79U1hzX?=
 =?us-ascii?Q?n2YpKFOL2CaN40xi/g5ZMinGXb24f+PSnHOlc7g/sRny9a94uqFV47ThnA0C?=
 =?us-ascii?Q?mRDeVIkKGsqVUjgnVuK4EcYYEGD3pMDE5shZQj44CQ4jFEl9K+u3HgEeOKR7?=
 =?us-ascii?Q?iCKx58AKrR9+qgwu5SRNPrApE9bWqFvxT1Fni1r3yWlmQ7kCv/MF1YwowYpU?=
 =?us-ascii?Q?/BZoynO/s+N7H6sEKho8F3ucNsAJCsWpgzQ7nn5Tt8xlgxKC1v7by29rYRO9?=
 =?us-ascii?Q?0kUlHot8TrMTgMU24awkLh5E92pUenXEGX7VnQWPW6MjT7bRgRYdb7HA6QbC?=
 =?us-ascii?Q?q0HIkHGn0A=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e9b6442-83c6-4336-7b08-08de898415ae
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Mar 2026 09:02:32.5303
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: h/8yDq6gHST98yIlUw9HfnLO5bg5RSUFPwdQKhmEFG80c6Jj+bQ9Ry0timwBIetCeUcqqO5dwrp5WZcLg6+niy3jH4yRNGPzLeCBLCbRt+s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB12554
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,glider.be,baylibre.com,kernel.org,pengutronix.de];
	TAGGED_FROM(0.00)[bounces-30144-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_SEVEN(0.00)[10];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 34F72305660
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Geert,

> -----Original Message-----
> From: Biju Das
> Sent: 23 March 2026 15:00
> Subject: RE: [PATCH v7 05/10] clk: renesas: rzg2l-cpg: Re-enable critical=
 module clocks during resume
>=20
> Hi Geert,
>=20
> > -----Original Message-----
> > From: Biju <biju.das.au@gmail.com>
> > Sent: 20 March 2026 10:50
> > Subject: [PATCH v7 05/10] clk: renesas: rzg2l-cpg: Re-enable critical
> > module clocks during resume
> >
> > From: Biju Das <biju.das.jz@bp.renesas.com>
> >
> > After a suspend/resume cycle, critical module clocks (CLK_IS_CRITICAL)
> > may be left disabled as there is no owning driver to restore them, unli=
ke regular clocks.
> > Add rzg2l_mod_enable_crit_clock_init_mstop() which walks all module
> > clocks on resume, re-enables any critical clock found disabled, and
> > then restores the MSTOP state for clocks that have one via the
> > existing helper. This replaces the direct call to rzg2l_mod_clock_init_=
mstop() in
> rzg2l_cpg_resume(), preserving the correct clock-before-MSTOP restore ord=
ering.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
> > v6->v7:
> >  * Updated commit description
> >  * RZ/V2M has critical clocks but no mstop, so move the mstop check aft=
er
> >    enabling critical clocks. After this, we need to restore only mstop =
for
> >    module clocks, so remove the inverted logic and continue statement a=
nd
> >    directly call rzg2l_mod_clock_init_mstop_helper() if the clock has
> >    mstop.
> > v5->v6:
> >  * Updated commit description
> >  * Dropped the list implementation.
> >  * Replaced  rzg2l_mod_clock_init_mstop->rzg2l_mod_enable_crit_clock_in=
it_mstop()
> >    for enabling critical clks and restoring mstop state during resume.
> > v4->v5:
> >  * No change
> > v4:
> >  * Moved this patch from [1] as it is boot-dependent  [1]
> > https://lore.kernel.org/all/20260306134228.871815-1-biju.das.jz@bp.ren
> > esas.com/
> > ---
> >  drivers/clk/renesas/rzg2l-cpg.c | 17 ++++++++++++++++-
> >  1 file changed, 16 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/clk/renesas/rzg2l-cpg.c
> > b/drivers/clk/renesas/rzg2l-cpg.c index
> > b68b0312f0e3..038b3f8e85a1 100644
> > --- a/drivers/clk/renesas/rzg2l-cpg.c
> > +++ b/drivers/clk/renesas/rzg2l-cpg.c
> > @@ -1600,6 +1600,21 @@ static void rzg2l_mod_clock_init_mstop_helper(st=
ruct rzg2l_cpg_priv *priv,
> >  	}
> >  }
> >
> > +static void rzg2l_mod_enable_crit_clock_init_mstop(struct
> > +rzg2l_cpg_priv *priv) {
> > +	struct mod_clock *clk;
> > +	struct clk_hw *hw;
> > +
> > +	for_each_mod_clock(clk, hw, priv) {
> > +		if ((clk_hw_get_flags(&clk->hw) & CLK_IS_CRITICAL) &&
> > +		    (!rzg2l_mod_clock_is_enabled(&clk->hw)))
> > +			rzg2l_mod_clock_endisable(&clk->hw, true);
>=20
> This call will keep increment mstop->usecnt on every str cycle.
> So, planning to add same check for normal state like standby state in
> rzg2l_mod_clock_module_set_state()[1] at early in the else path.
> Also planning to add helper [2] for code reuse. Are you ok with this or y=
ou have different opinion?
> Please let me know.
>=20
> [1]
> 	criticals =3D rzg2l_mod_get_critical_clock_count(clock);
>       ...
> 	...
>        } else {
> +               if (criticals && criticals =3D=3D atomic_read(&mstop->use=
cnt))
> +                       return;
> +
>                 if (!atomic_read(&mstop->usecnt))
>                         update =3D true;
>=20
> [2]
> +static unsigned int rzg2l_mod_get_critical_clock_count(struct mod_clock
> +*clock) {
> +       unsigned int criticals =3D 0;
> +
> +       for (unsigned int i =3D 0; i < clock->num_shared_mstop_clks; i++)=
 {
> +               struct mod_clock *clk =3D clock->shared_mstop_clks[i];
> +
> +               if (clk_hw_get_flags(&clk->hw) & CLK_IS_CRITICAL)
> +                       criticals++;
> +       }
> +
> +       if (!clock->num_shared_mstop_clks &&
> +           clk_hw_get_flags(&clock->hw) & CLK_IS_CRITICAL)
> +               criticals++;
> +
> +       return criticals;
> +}


On second thought

I will introduce a helper rzg2l_mod_clock_endisable_helper(struct clk_hw *h=
w, bool enable, bool set_mstop_state)
and avoid setting mstop state twice during resume()

The helper will allow to enable only the critical clock without setting mst=
op state.

Cheers,
Biju=20



