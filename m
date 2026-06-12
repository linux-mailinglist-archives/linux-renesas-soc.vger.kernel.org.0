Return-Path: <linux-renesas-soc+bounces-33921-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5XrTKe//K2o9JQQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33921-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 14:47:43 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF7767977F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 14:47:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b="Znqxg/LG";
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33921-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33921-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=renesas.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A9701300611B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 12:47:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 321E53E16AD;
	Fri, 12 Jun 2026 12:47:40 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011021.outbound.protection.outlook.com [52.101.125.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6434E3BB107;
	Fri, 12 Jun 2026 12:47:38 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781268460; cv=fail; b=glrV7pZnSSEAXk3aeXe+QUKpfW6lXiGKUq+/vu7sIidbQIr2z+Drpy6pF15cYzL+//JLVUCL/2p7Iqu/YwvDlf2DdZtWxDJ+Tos3nncoy21eiicAuDMoQvlbkvbjGPR1EwEu6zkDsm33BCrNP0yGy0LDlKc/c5JjzhS/1NCoAn0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781268460; c=relaxed/simple;
	bh=j6mqP4bOVff6fipKxXToQ/mO1POr6UURErPl8e8G0lM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=XCGGLHl/BsLIoXnrKEZgR5C6wmKehNyAgV4VtHEt1q8BZODeuhsutR5v5jBwWcaADJ1b8zAqB/LOEhDrl9IFxFBDsplpq2sIfhKMkvBEWMSouaDgx/RiHXP6xnTzeE2akkDOtUgF4IXqc9RsPsfhQq3uLIeHZubrQ7dceD1bwB4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=Znqxg/LG; arc=fail smtp.client-ip=52.101.125.21
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YrdtWzqxYzND4tOEe1F3WzMFTETFzDjrpPLmo0OzWThtAGVCQOnPH/epdCZoYcjTi888chRnKtlHywEyBsVxPIRftUrxl/UKgbYHvapzgYNqsFdw3LTq+rsPt3iEV6Xz6mxzPlXRhK4StNxaSnL1220AhDHmoEx8xG5WsqWAj1GQ3FU2LKi5DzHSPMIoV2zZE75mE2Rdorhe1kmBtAvIRujcjhrWac2Y7SpDpujZrSVJ/1MHA2SkbcIl+nmQ2CKqV2wPoK9eVHQLbPeyzcEdV2q4anpK6pvuWn7NpTWCGmljzbGjonytQz6iRb8X26kistIjz/ffPmQfXY6pNMUORw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5GjpxHEDsLybNkS/fDpF1Vj5/IjolkKPDfL8QHwuMTo=;
 b=G2xIXwoUIt3yYbsTriQgMvdesA1dJZlaENdSPkCtIHfVXVHRF7v3QoG5znB2ZMNfqTW0hTqu2KGzGn8ZYgPQJfJfgHTGhvqz/DoZr78j4d6WFNt9BLdj7YuM/lrUf5oZN/i/j5g22AcW1KoZgCgZR4mVRLV6Wbf+P860cV2r97eXjKxBmoonHn6d7MfEyG1aUoYcWFqM/CPWWXEpOyUtJbXK7xyjB6JIziDVMYFVavDGl+fAJUPw6K5j6Y8SQ8aEzGe9YJN/U++OkS4W+bcHmvnAM3LoKxu+38WxAqf4TH2mpeTIuv8hQ60wOhRzvMQe3V/aNl1sUhnc1fnh1l6akQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5GjpxHEDsLybNkS/fDpF1Vj5/IjolkKPDfL8QHwuMTo=;
 b=Znqxg/LGmZjkh9w9JHStTwWj4Ey/oq/Ce7451afHV9/Tw6yT8vkxUHl02lC/B6PJRogTVTRphQkQystWqGVGF+OuRZiSy40ntRNUIcmcHmRU/PoXdfpuxWu1SRxL9uQ7uhiMaxAq1qiq0R/DM9hTNwc3Wj6LajWmXY+FfonRwdU=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY4PR01MB14466.jpnprd01.prod.outlook.com (2603:1096:405:23a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Fri, 12 Jun
 2026 12:47:35 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.21.0113.014; Fri, 12 Jun 2026
 12:47:35 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: biju.das.au <biju.das.au@gmail.com>, wsa+renesas
	<wsa+renesas@sang-engineering.com>, Ulf Hansson <ulfh@kernel.org>
CC: "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH v17 14/17] mmc: renesas_sdhi: Add HS400 enhanced strobe
 support for RZ/G3L
Thread-Topic: [PATCH v17 14/17] mmc: renesas_sdhi: Add HS400 enhanced strobe
 support for RZ/G3L
Thread-Index: AQHc8yZOYuRsglwqCEiaUHVpImBWcLY67KNA
Date: Fri, 12 Jun 2026 12:47:35 +0000
Message-ID:
 <TY3PR01MB11346C9166A00D8C7CF037A4C86182@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260603065731.93243-1-biju.das.jz@bp.renesas.com>
 <20260603065731.93243-15-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260603065731.93243-15-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY4PR01MB14466:EE_
x-ms-office365-filtering-correlation-id: 4ad6771d-abf5-45e3-6008-08dec880c6fc
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|4143699003|5023799004|11063799006|6133799003|56012099006|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 esPbI7Jeoi8gSKGAZRZuJHhJz1INFvC9J8sdzpj8N2v1PJt98Em88Die0QIIGy0hCMbXELZNmCFw5BszTDApcCkWO6lRpYQZ3wOGb6w1d2l7ZKRBLISjb7Br9p+8yFsblbqmIUuu/7PHxAWk97zcdDXAOOQqaQ60aVE2M6IdKx1KLQxl8sf+ArVZy4pMWjmGnB5Jxr4rmyBWk31dGSWfa7y0T4IViJ66f8HhMnp5L3gSjqCOccsoT/Ig9ZEkehzaFcXgYY4xpNzUB99PrnufmZx4SvqwVXRhuVIRQtdEHUXob3kHYnE4PPExc30h9JfUvaEtA1fha24gnvgQH3Fb7uOv+DU4wQxs0OghZpvseyjrxp542rqUuC6p9PcDvaD6uxtGCpuwTJqsHYARgxCe2s8abXlTgCoSfUL5ET6b1YFyYhS2M3/RljPbEJaqOr3NRZprfMxhVkgKQjRc7KqV07u/hAsX8lwrUHyXrApz/yhm+O2xHdJLlla5dpAxSM3XmYhR3vVUAGFgjey6xh8dkQMy1dSn3DF5x5jSkEo1Wju7uRpG/lQEntlJ5W2aLGCz4P4MuTN3mADpowB2qjARGT6PoWYzMG4db4kZu9lI+PZubKv5ZshNm+V+ijOXGcJ+dDxxSg38k94WecCSWNuYDldFG3dIL+yWr4ORAOhQIAFlGPHmiH2ck36g569XmIkzZMTVJ/TsT0RtO4Z+FhgWg8bGl6FnZHRokS4s7cE8kD7lNV3Hcd4GHSFhsJhWwRYL
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(4143699003)(5023799004)(11063799006)(6133799003)(56012099006)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?c53jN3MkezKiZ59lwc99wT3P0T0wwYmuXDdOmuXITJF4SAgDbFUd+X0cGmEw?=
 =?us-ascii?Q?tU3Kv9euX+n3yLsj/65Tq9qK8qv9V9Autiu/VlS6lekvnldvmOByJ7nWoVlm?=
 =?us-ascii?Q?Oj4qKUas02QhvM0fd7B2lW7vpzpPCtmBkd+LvIZOerTz3dvqkSMl6+zDhBsQ?=
 =?us-ascii?Q?cwwb6RWOjEFNH485k6yq3aeyoWgku8NLDunifDZeEoQ5mDad+XyXxQEVlOVp?=
 =?us-ascii?Q?ePnCu+ruRajDuP/sQoA9pCX0mjti/k9Jy5OrIbHX+KdaRf3tilDNNjNt42hg?=
 =?us-ascii?Q?pNjEdOFQ18kBw9hbyJ2DsV/cmnV7d5H3WBHmHIT6+RF989undCx62y6F6A2Z?=
 =?us-ascii?Q?lMgnQfQDOxrh7EQiU/56PpatRQXNrPv+ivz+/7OM5JZUBwXcsXN/ImHS8tIN?=
 =?us-ascii?Q?s8rmRJV6BdLBk6S7Qu511OtiL5JnWfq3dctWHqKNhW9IXqP8sbyM8qrBEkOK?=
 =?us-ascii?Q?SVIdn+gEgK4hMuZlGHHgTkWzy0vyGjZP+/Jz8PefQfN6ArvUtHVmL6oTV+VO?=
 =?us-ascii?Q?iBXAa2U/+PdEOFP4y2TLHIxI0Fvb5S2GI0LtnSo8ELEp2B1Grg57TlqIq3P3?=
 =?us-ascii?Q?OmXfGh3AAVMEMmeIxtyaIKfhw/RNq/1YXYzGIQfy7qBhjJ53u+skutukTZZ/?=
 =?us-ascii?Q?6xsuLyFFl5xt/eCKsrzsLoJK6RznPzQDtF15k4mpInWqMCkxAb9PW0YpAgQg?=
 =?us-ascii?Q?psYq1JY7utmsRpMIPfp/ndK3+XH9Ba1iKoqXF6dGek6VrN9uCcQaOvLhVHT6?=
 =?us-ascii?Q?KPMCDOVOQdXZGX2g2uFFscl5p2nR3k+KfiaOStFVrBIQodRe3BNAyFGbMGvQ?=
 =?us-ascii?Q?jSNr3lWtNFYdcSJ/jPnXnCvhZSM51qM8VkTYWgBiE/YN3rggN5yFaju3bdLY?=
 =?us-ascii?Q?zk5yufrfmbksuyG7MnoAY7MxHfpZ59m5UIkibHLtcoxqYCljC9p3lmzBavhp?=
 =?us-ascii?Q?2TGGDVanvJx8nrTGo0HFzal6X5ZfqIgShEZCYCUoo7LCj37mNkVkUh5jBNz0?=
 =?us-ascii?Q?rbk9CWPXoVg6V6u4tacxoQRXF9tnQng38jnqt+ysbmxfvg3Mo6dCFfQWC+eM?=
 =?us-ascii?Q?GUre/AD4SzWKS1QUSvrQ8DpjnLlyr4N+Hnf0zMZUaGhqeY0o6C2aJV9U74ZM?=
 =?us-ascii?Q?0swstzw+lMjyWS2V3GHS/JY74+IHFN7KudVK8GSg0STdzcVR7KHgDi2bT2gt?=
 =?us-ascii?Q?p3J2Dz997H71lWoymKfPDh9Q1d9xJxOLpcL14686m4vKXyXRiJv2GhZ6upWj?=
 =?us-ascii?Q?k8ODfP6XMB9Ca5Nx5XrDuY1K5Ne7vSP8MhVIfU/Ca0pRPhRsHm5oXZ4axggB?=
 =?us-ascii?Q?FtlE4jGRwpVeRhvK0hwIlOSc8O5A9+HYv2ImqBPAvL7vUyPZE7kDBLid/qTx?=
 =?us-ascii?Q?B8VX1oC/PrFETYshd3vWYH9meft1r3YdWECWOUiignT+bCWGDWIMLMMlApG/?=
 =?us-ascii?Q?maccdVnvBxCC7s+OZowQUIrnvoWf6hXie5X0TbGYuGJHJnH0s+fvzmcw/ygJ?=
 =?us-ascii?Q?AwYQX1Gd+IRI2gWEx9r+mLnRHjyYtBRdrlINJ8v4Sd56pXpcQwAlYfQLqDrg?=
 =?us-ascii?Q?wIbQZuDPEZrbknt2FAFfMoIX9yzcNJn9Cv1qLCgpoJ3+TUzKjly1CSp+rkB/?=
 =?us-ascii?Q?vbP2JKgxeWUB2DzARdaHazOB6SwJCxgjDCPnGwQmoPKidH+T4TkZeOve2nrg?=
 =?us-ascii?Q?x4pJsGudIvgIRHZ1IyT75RaTBQYuo+UX87dQmGjMmH7Tvszo1kIsBDjKUoSW?=
 =?us-ascii?Q?4TEqeyz3lQ=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ad6771d-abf5-45e3-6008-08dec880c6fc
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2026 12:47:35.2583
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8g5oJD+Io/oU4nsxxNrKD8cPHQ8VzuCxVHAV8mWK3ETonmCHyenALcFMWSoPqjeMtLLl9EgY09NQX3S2QQziogw5TiroRicB0dbQg5aVYlY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB14466
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33921-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,sang-engineering.com,kernel.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:biju.das.au@gmail.com,m:wsa+renesas@sang-engineering.com,m:ulfh@kernel.org,m:linux-mmc@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:geert+renesas@glider.be,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:bijudasau@gmail.com,m:wsa@sang-engineering.com,m:geert@glider.be,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,glider.be,bp.renesas.com,gmail.com];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,renesas.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3AF7767977F



> -----Original Message-----
> From: Biju <biju.das.au@gmail.com>
> Sent: 03 June 2026 07:57
> Subject: [PATCH v17 14/17] mmc: renesas_sdhi: Add HS400 enhanced strobe s=
upport for RZ/G3L
>=20
> From: Biju Das <biju.das.jz@bp.renesas.com>
>=20
> Add an hs400_es bitfield to renesas_sdhi_hw_info and implement renesas_sd=
hi_hs400_enhanced_strobe(),
> registered as
> host->ops.hs400_enhanced_strobe for all SCC-capable controllers.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * No change.
> ---
>  drivers/mmc/host/renesas_sdhi.h               |  1 +
>  drivers/mmc/host/renesas_sdhi_core.c          | 53 ++++++++++++++++---
>  drivers/mmc/host/renesas_sdhi_internal_dmac.c |  1 +
>  3 files changed, 49 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/mmc/host/renesas_sdhi.h b/drivers/mmc/host/renesas_s=
dhi.h index
> 92b66116f044..1a837d0c9479 100644
> --- a/drivers/mmc/host/renesas_sdhi.h
> +++ b/drivers/mmc/host/renesas_sdhi.h
> @@ -48,6 +48,7 @@ struct renesas_sdhi_hw_info {
>  	unsigned tuning_delay:1;	/* Has tuning delay */
>  	unsigned internal_divider:1;	/* Has internal divider */
>  	unsigned scc_hs400_mode2:1;	/* Has scc hs400 mode2 */
> +	unsigned hs400_es:1;		/* Has hs400 enhanced strobe */
>  };
>=20
>  struct renesas_sdhi_of_data_with_info { diff --git a/drivers/mmc/host/re=
nesas_sdhi_core.c
> b/drivers/mmc/host/renesas_sdhi_core.c
> index 282107d06114..2a70a2e64b9c 100644
> --- a/drivers/mmc/host/renesas_sdhi_core.c
> +++ b/drivers/mmc/host/renesas_sdhi_core.c
> @@ -274,7 +274,7 @@ static int renesas_sdhi_card_busy(struct mmc_host *mm=
c)
>  #define SH_MOBILE_SDHI_SCC_SMPCMP       0x00C
>  #define SH_MOBILE_SDHI_SCC_TMPPORT2	0x00E /* G3L: SDm_SCC_HS400MODE1 */
>  #define RZG3L_SDHI_SCC_HWADJ2		0x010
> -#define SH_MOBILE_SDHI_SCC_TMPPORT3	0x014
> +#define SH_MOBILE_SDHI_SCC_TMPPORT3	0x014 /* G3L: SDm_SCC_HWADJ3 */
>  #define SH_MOBILE_SDHI_SCC_TMPPORT4	0x016 /* R-Car */
>  #define SH_MOBILE_SDHI_SCC_TMPPORT5	0x018 /* R-Car */
>  #define SH_MOBILE_SDHI_SCC_TMPPORT6	0x01A /* R-Car */
> @@ -298,8 +298,9 @@ static int renesas_sdhi_card_busy(struct mmc_host *mm=
c)
>  #define SH_MOBILE_SDHI_SCC_SMPCMP_CMD_REQUP	BIT(24)
>  #define SH_MOBILE_SDHI_SCC_SMPCMP_CMD_ERR	(BIT(8) | BIT(24))
>=20
> -#define SH_MOBILE_SDHI_SCC_TMPPORT2_HS400OSEL	BIT(4)
> -#define SH_MOBILE_SDHI_SCC_TMPPORT2_HS400EN	BIT(31)
> +#define SH_MOBILE_SDHI_SCC_TMPPORT2_HS400OSEL		BIT(4)
> +#define SH_MOBILE_SDHI_SCC_HS400MODE1_ENHANCED_STROBE	BIT(30)
> +#define SH_MOBILE_SDHI_SCC_TMPPORT2_HS400EN		BIT(31)
>=20
>  /* Definitions for values the SH_MOBILE_SDHI_SCC_TMPPORT4 register */
>  #define SH_MOBILE_SDHI_SCC_TMPPORT4_DLL_ACC_START	BIT(0)
> @@ -574,6 +575,8 @@ static void renesas_sdhi_adjust_hs400_mode_disable(st=
ruct tmio_mmc_host *host)
> static void renesas_sdhi_reset_hs400_mode(struct tmio_mmc_host *host,
>  					  struct renesas_sdhi *priv)
>  {
> +	unsigned long val;
> +
>  	sd_ctrl_write16(host, CTL_SD_CARD_CLK_CTL, ~CLK_CTL_SCLKEN &
>  			sd_ctrl_read16(host, CTL_SD_CARD_CLK_CTL));
>=20
> @@ -583,10 +586,12 @@ static void renesas_sdhi_reset_hs400_mode(struct tm=
io_mmc_host *host,
>=20
>  	sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_DT2FF, priv->scc_tappos);
>=20
> +	val =3D ~(SH_MOBILE_SDHI_SCC_TMPPORT2_HS400EN | SH_MOBILE_SDHI_SCC_TMPP=
ORT2_HS400OSEL);

SH_MOBILE_SDHI_SCC_TMPPORT2_HS400OSEL- This bit not available in G3L, so ne=
ed a fix.

Cheers,
Biju


> +	if (priv->info->hs400_es)
> +		val &=3D ~SH_MOBILE_SDHI_SCC_HS400MODE1_ENHANCED_STROBE;
> +
>  	sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_TMPPORT2,
> -		       ~(SH_MOBILE_SDHI_SCC_TMPPORT2_HS400EN |
> -			 SH_MOBILE_SDHI_SCC_TMPPORT2_HS400OSEL) &
> -			sd_scc_read32(host, priv, SH_MOBILE_SDHI_SCC_TMPPORT2));
> +		       val & sd_scc_read32(host, priv, SH_MOBILE_SDHI_SCC_TMPPORT2));
>=20
>  	if (priv->info->scc_hs400_mode2)
>  		sd_scc_write32(host, priv, RZG3L_SDHI_SCC_HS400MODE2, 0x0); @@ -783,6 =
+788,41 @@ static
> int renesas_sdhi_execute_tuning(struct mmc_host *mmc, u32 opcode)
>  	return ret;
>  }
>=20
> +static void renesas_sdhi_hs400_enhanced_strobe(struct mmc_host *mmc,
> +					       struct mmc_ios *ios)
> +{
> +	struct tmio_mmc_host *host =3D mmc_priv(mmc);
> +	struct renesas_sdhi *priv =3D host_to_priv(host);
> +	u32 val =3D sd_scc_read32(host, priv, SH_MOBILE_SDHI_SCC_TMPPORT2);
> +
> +	if (!priv->info->hs400_es)
> +		return;
> +
> +	if (ios->enhanced_strobe) {
> +		sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_CKSEL,
> +			       ~SH_MOBILE_SDHI_SCC_CKSEL_DTSEL &
> +			       sd_scc_read32(host, priv, SH_MOBILE_SDHI_SCC_CKSEL));
> +
> +		sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_DTCNTL,
> +			       ~SH_MOBILE_SDHI_SCC_DTCNTL_TAPEN &
> +			       sd_scc_read32(host, priv, SH_MOBILE_SDHI_SCC_DTCNTL));
> +
> +		sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_TMPPORT3, BIT(8) | BIT(9=
));
> +		sd_scc_write32(host, priv, RZG3L_SDHI_SCC_HWADJ2, 0xFF);
> +		sd_ctrl_write16(host, CTL_SDIF_MODE, SDIF_MODE_HS400 |
> +				sd_ctrl_read16(host, CTL_SDIF_MODE));
> +		sd_scc_write32(host, priv, RZG3L_SDHI_SCC_HS400MODE2,
> +			       RZG3L_SDHI_SCC_HS400MODE2_HS400EN2);
> +
> +		val |=3D SH_MOBILE_SDHI_SCC_TMPPORT2_HS400EN |
> +		       SH_MOBILE_SDHI_SCC_HS400MODE1_ENHANCED_STROBE;
> +	} else {
> +		val &=3D ~SH_MOBILE_SDHI_SCC_HS400MODE1_ENHANCED_STROBE;
> +	}
> +
> +	sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_TMPPORT2, val); }
> +
>  static bool renesas_sdhi_manual_correction(struct tmio_mmc_host *host, b=
ool use_4tap)  {
>  	struct renesas_sdhi *priv =3D host_to_priv(host); @@ -1333,6 +1373,7 @@=
 int
> renesas_sdhi_probe(struct platform_device *pdev,
>  		host->ops.prepare_hs400_tuning =3D renesas_sdhi_prepare_hs400_tuning;
>  		host->ops.hs400_downgrade =3D renesas_sdhi_disable_scc;
>  		host->ops.hs400_complete =3D renesas_sdhi_hs400_complete;
> +		host->ops.hs400_enhanced_strobe =3D renesas_sdhi_hs400_enhanced_strobe=
;
>  	}
>=20
>  	sd_ctrl_write32_as_16_and_16(host, CTL_IRQ_MASK, host->sdcard_irq_mask_=
all); diff --git
> a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesa=
s_sdhi_internal_dmac.c
> index 83d348fb5eeb..a021ebb46070 100644
> --- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> +++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> @@ -277,6 +277,7 @@ static const struct renesas_sdhi_hw_info sdhi_hw_info=
_rzg3l =3D {
>  	.tuning_delay =3D 1,
>  	.internal_divider =3D 1,
>  	.scc_hs400_mode2 =3D 1,
> +	.hs400_es =3D 1,
>  };
>=20
>  static const struct renesas_sdhi_of_data_with_quirks of_r8a7795_compatib=
le =3D {
> --
> 2.43.0


