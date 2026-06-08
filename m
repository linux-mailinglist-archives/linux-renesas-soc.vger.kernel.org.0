Return-Path: <linux-renesas-soc+bounces-33715-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hAcGFQ07J2qXtgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33715-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 08 Jun 2026 23:58:37 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E1FBD65AD2C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 08 Jun 2026 23:58:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b=sg5Db2gw;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33715-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33715-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=renesas.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 59BF4300B5AD
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Jun 2026 21:58:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39C7E3AFD10;
	Mon,  8 Jun 2026 21:58:35 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010008.outbound.protection.outlook.com [52.101.228.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D64F3AFCF5;
	Mon,  8 Jun 2026 21:58:33 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780955915; cv=fail; b=jSvjTXo9UU6/YEhbOchAjeiJ1vD9py0xMQGTiS+CeGvp6EFjYu0I4HrtFXWGbTlGUTPdFhbm+alIOda1dulyirgC40I4yvWJzoiCXnE9au3bhKnoJXO6m+P3DMT0O+7m75wXQMS8AhvMqXSMF7wQmlOKPvOlq3zuquZIMSOp5nI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780955915; c=relaxed/simple;
	bh=qXwocP6LEGcd7Ix8nSGqJ1Er2EFEVLa42AFn4W0tIvk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=o6Ue4eCSJyFFCIJtxebBc2q01v/Tmwy56VRyrYt70MEVKUMekXSWGRP7N5b2S8sqneSOTAUeevcbZtSiUw7m0FxPAxz8qhsCHx/pgGB+aIDYenlB97fvH50Nh7YmhGSnw8cocZhwmioy5OfYxBwfuHC7UpxP8torlLwllGen7sU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=sg5Db2gw; arc=fail smtp.client-ip=52.101.228.8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PhTN9KJ2urYob4bD1FWoyZiXqo9nJtR3qojQw62pasZf/BUJi5dGt8kbziv3Te+Vg1JUOVHHvOUM1Rm/3fdNzT7t6t2W2xYmIQndLVZN+wiMhI5Tz5Qhv375jirn8G66Hh/OGqvnw3SXg4gkPZc07TQy+4LfKMNkZ+Ot4aVSMuyZMwYY/xHQOOHSY4KcP8Uby9pTuc1+lqIDSAisKvDFwLXRekPwcQR/u1qzWWfc6URQA8jjm05TWMY+bFQCoh1U3ESbngb7c5szX2wHwFfVdVXyeQbh++VGLYGz0EVe8x9J4EdRzct1b+SaOO/xKI5XLSRKE2lY6ackfwtMPtx2Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qXwocP6LEGcd7Ix8nSGqJ1Er2EFEVLa42AFn4W0tIvk=;
 b=TFoKYicBHkOy0He5eKa8gmts6vp0cGPWH6uKu4O2etTHwUsEBp1bV56Jq81jx/b5leTObib3DAhSWSfmo1fOOHD1hOB4CEZvB92aS6/wpo2dE6T4dwlNAxbc3XindYe/6kT3Y0q+ix3mJh+Fc/Ti6MkfLXT6+dHrQdqTwP33NzAaUSF31+DTWE5kwEJfdGYNkVoCn/+a3TTLJxmQbpV2kSBUgUCLcEJzOn9LFVkrflelQz02vdtl6RuzjCyVFIZJBndQ8N+/AEcpDo3nUKEWp/0LVdPgaFA/xHP7z4W3tKNBXoNaz5yqW8uHrj1Of20iwJOvP+QNuyspmtnwGqiH4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qXwocP6LEGcd7Ix8nSGqJ1Er2EFEVLa42AFn4W0tIvk=;
 b=sg5Db2gw5DDd53h9kvKowHd0M1q5BF6ahSyoRKmlC2uxMtnE31BI+JCSttuFvEC6QZI3GO+p+IT/ikShVD6eEZ4gRo7m4r8x8v2ecpWGjgdUuCrsObz1YywyhsngI3w4LiCPUefsqEWUqexKfPIvSLL8YGR6alM3PVPcETvp3P8=
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com (2603:1096:405:35b::6)
 by TY4PR01MB15994.jpnprd01.prod.outlook.com (2603:1096:405:2cf::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Mon, 8 Jun 2026
 21:58:31 +0000
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3]) by TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3%6]) with mapi id 15.21.0092.011; Mon, 8 Jun 2026
 21:58:30 +0000
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: Rob Herring <robh@kernel.org>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, Biju
 Das <biju.das.jz@bp.renesas.com>, "lgirdwood@gmail.com"
	<lgirdwood@gmail.com>, magnus.damm <magnus.damm@gmail.com>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"john.madieu@gmail.com" <john.madieu@gmail.com>, "geert+renesas@glider.be"
	<geert+renesas@glider.be>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, "broonie@kernel.org"
	<broonie@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>
Subject: RE: [PATCH v2] ASoC: dt-bindings: sound: renesas,r9a09g047: Fix
 dma-names and ports schema
Thread-Topic: [PATCH v2] ASoC: dt-bindings: sound: renesas,r9a09g047: Fix
 dma-names and ports schema
Thread-Index: AQHc9SbE88+QH7spg0qrWm41YM+SpLYweniAgAMYn+CAASQ+AIAAf2Vw
Date: Mon, 8 Jun 2026 21:58:30 +0000
Message-ID:
 <TY6PR01MB17377A9331795E824D2D8B3A9FF1C2@TY6PR01MB17377.jpnprd01.prod.outlook.com>
References: <20260605200526.683577-1-john.madieu.xa@bp.renesas.com>
 <178069496769.286078.10840905064274842451.robh@kernel.org>
 <TY6PR01MB17377F8945B85671FCD20B83DFF1F2@TY6PR01MB17377.jpnprd01.prod.outlook.com>
 <20260608141220.GA2500736-robh@kernel.org>
In-Reply-To: <20260608141220.GA2500736-robh@kernel.org>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY6PR01MB17377:EE_|TY4PR01MB15994:EE_
x-ms-office365-filtering-correlation-id: 8e50aa97-5876-49ff-7b25-08dec5a91403
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|56012099006|11063799006|4143699003|3023799007|38070700021|22082099003|18002099003;
x-microsoft-antispam-message-info:
 OOXoe6OGIU3HJWaHNOvbmKl58f7GIYPViBF8qixJsSBVA+Tb3YlrwLa7ssbbFtIfrQczt/z5Vt8rsNHDrnwigdvEAt3OKeUNgZmKXC3B2rHBY0OSvyfpkS58O1Z0eyRrEywOPyuc5QO4WtobioJI66oZnHH5wXQmkTW4YNIfinf35A7dOj35fyp1SMux1p7hUNxRzvUIOPEAsfHAKgVzLL2I1lWDF9hTp+aC81skYtGMcXn72z7CuwmZu8fsXLEzw3whpxenYCZkJ9hDpr8gos7GBEUSVzVUfveAZqLUQAu0F4lFBhKRHFGuHQXiZxHIGaewDjrJaTuIIjGAFgt5OwL9c2d7bm+K2017gU1TufZHLETOjdXmTlx2T+GMze+al7bPvsZkd0VYdbzAzmkWwsWiFM51/1M7WkNfTf3Y5d9g9nkMCvRi0nGRyl1s5WdBYG7qIWv2tLDRjEut9SmNAHeAo0vOalORVN+iq6YVOd07Zx1m6TDEuvMAkV3iPmqc4fOdKwRMJwP5guWTj5BKcaezSUh5jE4/cCWmXvS0HTrUlxBOLDQnwKvdXamARttaqkuIndonjZQQIaYHA88z6ZENacvF/hil98XGECthzYlhKtEOIngvYmvacgpkFs4utyLc5f2JFfGjl4ophNLBRQD0eMmUiGpTVBdSgFhrJQNVfBS5zWnXWtuie8yDHWUcVL206BhAvcj62eoIpMe4aj1VMESZtfcJu1qY8lXPCh9h+QzkqCBtcwEBD5iD9kw7
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY6PR01MB17377.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(56012099006)(11063799006)(4143699003)(3023799007)(38070700021)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?qR4/qKUp5VzdL80BYpVAVKX/Mlu3MdfagJlnlA7YeeLcP2GyHRDMh/DMFt3A?=
 =?us-ascii?Q?NA4G/cWUudRKQJ4LYSuoGZk6jorBEszRC23IFSztUxLZzNttTDb9T8WGcdg5?=
 =?us-ascii?Q?3V+sSC+GFECOy1vMcRqVBDz3cCVHYDAYOzJ+er1GaLPgUYEqK3oV1KQH07Ok?=
 =?us-ascii?Q?WiPd+gtHCsz7FqfT1/LZVwsc+HHZDEKx8iX3FOn+E+RuUkK0KLxV6xynbz74?=
 =?us-ascii?Q?6Cro4/nYo90DzY+OwX98AZbnD7szB5UYDeScpD2pNDOCS66AHxdqLjp+3hGX?=
 =?us-ascii?Q?fIe8GNS2OMB/GfOHu4PcRS+GXptYWy3txXFsZzPd6OzZNhGFaCbVskCXvKoz?=
 =?us-ascii?Q?wkkIRORF9nTcOsiw25WMTL8Ra3pXoiM18Wca4LF7rtsuVkupIZaGgWU1U2FV?=
 =?us-ascii?Q?KzP1r8wb/6VOcIDhMJIuaLQnQLYdkWh8XShPjqUDF9/gOuoSrnjIz8PpL35J?=
 =?us-ascii?Q?XGEuUEIJxfM4QhTibneIXWuMafz7qdPXKuPnxU7Dq8G3lr85rmYvE+HcgNg7?=
 =?us-ascii?Q?NY/nNw35b++5LyYC1zG0oOmKoO0mSOZPpwsLhXzJAOMhQjUDhpzDIfKe9+YU?=
 =?us-ascii?Q?Ew5mlGlzLHTepgrmlOdNENpdorgh4HDf5KkGK76Sedfq6xnGzIAkS5PuXoEB?=
 =?us-ascii?Q?9gLNjJRTuHEmyE676geRJwWOxqrk9ZUfH87OSdbrvDZg8n1alIw7Q7BK6TnT?=
 =?us-ascii?Q?pUBkAOHkh0sOWUrlHwSI1OQfQ/dPxR0eIHAQkkmN7gc2CuzBui1y4ui17JIV?=
 =?us-ascii?Q?AY0K2qzs85MT71IhNFHKAsWZ24ISea06Yl9+XI9hj8qoglhEicUd4D57Jv0s?=
 =?us-ascii?Q?QQ/3JoaTJgjyRGk2jmEQYpi3dOrKxlkTonqq9hyUM7APM1Fc0BevueTAn2XZ?=
 =?us-ascii?Q?NrLs69qQ964q/5h3g9dZ0aN2mMXvE3MPH/0w9ert6Sk+6qywu/MBxUwVGmWk?=
 =?us-ascii?Q?A/dW2zoTsBa3V36BmcBD685NKU1tycQ6xelw0lXWAch2j16+seaLwCw/pDy8?=
 =?us-ascii?Q?PdtnfMpgqyyqUhEQ1hCmre9Qp85h+Ke21rUBGFEOpLBjnVre8FQCDsVmlNHT?=
 =?us-ascii?Q?amb3e6QBC96pphbMI7DofzrxsAjIDrRy3Eyn969gsNzYouNuG594VvZNpNDl?=
 =?us-ascii?Q?ZBnB0ROTbqdjBFaydGNCn0WVAcwnpDt5mh65zFmH/yL7IVKyDACy1ZEUORzR?=
 =?us-ascii?Q?u0di0uvqc5LNH7qOlzSh+LrcsbLl1yIVi9O/6zzIAJJzTgYt4ujv1tNTLMf9?=
 =?us-ascii?Q?gNMRQ7FUumJylWkZdDOex2qeIqHtgHJAINx5OPVYVnWX0l37vDUXJMGAD4Pu?=
 =?us-ascii?Q?3ez0VR3w4eO/6V9+q/nDeii3Lu1NohONujcJ6jfR8XJRAWtrorlg3hFu8VnT?=
 =?us-ascii?Q?sR6MP7+35Hhq4QBGtoSeFF9C3KRv+0n2vZKgfmUBhDjZn1AusC/l78b/IX6t?=
 =?us-ascii?Q?z9yhklOHAWkclHh1CIW4iAC8bS5hsUf3JCWWDSadaKjtrnaFdDZRwqI3GeKI?=
 =?us-ascii?Q?IuMJyfbR6qXOcHKogLZbofkLGZdO+GUDOfnsVW/bqqWaTJH+3cOPFDz3rwGU?=
 =?us-ascii?Q?8jDkLW4bmybeBkpAZ7CCRWP9Uii5jM0OJli8ZHVPXVQewMS2tRN7s4e2FgFy?=
 =?us-ascii?Q?ZSibNy2j6NhodFDCPkHjl1L+zFCt/uBsRWum8Y/rrr7Z0MGnRgGuwrUi3cEJ?=
 =?us-ascii?Q?0xEVOZYcRpZDvnAWuQ2zI4STYu5WDb5GyL+YHUETpfnzDiwObcZ/Klwv+8lV?=
 =?us-ascii?Q?2p/PhhnIWZX9B+bsCmwJS19wUECXWvs=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: TY6PR01MB17377.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e50aa97-5876-49ff-7b25-08dec5a91403
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jun 2026 21:58:30.8771
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: po63HELHrzyW8AlNN0Gij4jUwCr+tf6L2ge+SOZtOKYb6B1GLKZJfUYwbR4/YnSfGqHLeTrlvt6zWK9G7fsCPGbSCyds3ZPlKbH2z4PzGEA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB15994
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33715-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:devicetree@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:lgirdwood@gmail.com,m:magnus.damm@gmail.com,m:linux-sound@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:john.madieu@gmail.com,m:geert+renesas@glider.be,m:krzk+dt@kernel.org,m:kuninori.morimoto.gx@renesas.com,m:broonie@kernel.org,m:conor+dt@kernel.org,m:magnusdamm@gmail.com,m:johnmadieu@gmail.com,m:geert@glider.be,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,gmail.com,glider.be,kernel.org,renesas.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E1FBD65AD2C

Hi Rob,

Thank you for your feedback.

> -----Original Message-----
> From: Rob Herring <robh@kernel.org>
> Sent: Montag, 8. Juni 2026 16:12
> To: John Madieu <john.madieu.xa@bp.renesas.com>
> Subject: Re: [PATCH v2] ASoC: dt-bindings: sound: renesas,r9a09g047: Fix
> dma-names and ports schema
>=20
[...]
> >
> > This is the 'items: maxItems: 1' I added on playback/capture per your
> > v7 Comment [1] on the original audio driver series. These phandles
> > point at the ssi-N/src-N/dvc-N sub-nodes, which aren't specifier
> > providers and have no #*-cells, so the list isn't split per-entry and
> > the constraint trips.
> >
> > Would you prefer I drop it and keep them as a bare phandle-array, as
> > renesas,rsnd.yaml does, or is there a form you'd rather see here?
>=20
> The problem lies in renesas,rsnd.yaml having no constraints. That should
> have the same constraints. However, you really shouldn't be redefining
> these properties again here, but refactor whatever is common into a
> common schema.

Agreed. The dvc/src/ssiu/ssi sub-node layout and the playback/capture
routing are the R-Car rsnd model, so the common parts belong in a shared
schema that both renesas,rsnd.yaml and this binding reference, with the
constraints defined once. It can be prepared as a separate series rather
than folded into this fix, and give rsnd the missing constraints in the
same go.

>=20
> I suppose for fixing the rest of the issues, you can drop 'items:
> maxItems: 1' constraint on this patch and address that separately.

Will do. I'll drop it on playback/capture (bare phandle-array for now),
which clears the remaining dt_binding_check errors, and respin. The
shared-schema cleanup will follow separately.

Regards,
John

