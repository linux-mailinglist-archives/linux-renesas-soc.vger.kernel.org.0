Return-Path: <linux-renesas-soc+bounces-35150-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SZtfGfAaVWoEkAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-35150-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jul 2026 19:05:52 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E1E74DDA9
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jul 2026 19:05:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=MzeJPDzo;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-35150-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-35150-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 13423303ADFD
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jul 2026 17:02:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B306327A10F;
	Mon, 13 Jul 2026 17:02:02 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013025.outbound.protection.outlook.com [40.107.159.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D20F233928;
	Mon, 13 Jul 2026 17:02:01 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783962122; cv=fail; b=KlGM+vA64q75j7+rgh6LZpt2Sfy1it+S8A6w+isukrWEgtpXyzI5J26VMrZXQ28WPhg9UyKhCmICjlqgNSvZeF67FDuidCKwCa8fjtSioRjdHFIWfprwdezqXJmZ5uWj2L9NPLs0KaA/16y9UplZq5IwRwqVog23OzQO2SJ2a0s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783962122; c=relaxed/simple;
	bh=ItkCex002n0TFcnkJ/NZehVGyosjKmPeInqbqcon2Og=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=X/tNKzPbNH2YYGrxdfGvj6pKEQSJ4J2aOuWubxEMN1lLq+qPDjKCTpwiHi2jWR3gDnkMF6UFBI2rR3jTSOmJqOr6DbObisvXAaubFnDXSNTqKA/Tjt3CVX/AYdbycQWfOTBxDLT+r+r9wdostHAxOB++9Gp9CdL3lCja2ssQTOQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=MzeJPDzo; arc=fail smtp.client-ip=40.107.159.25
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QJlH45fR2n72kPfuFUjIh7PEKr99nmGZlIilXS+OrhBxK263qk4UNTnWxiIBA/qj86Ef8C9D11aeruI5Opny3+20ycz+/it426ja0gDZ+J5XMRZFl0LM1CAJG5UrD1BHHFSr9ZpDSnr/b4Lw5epGw2uP4TIoBH29mBcjQ4tJpjdk48fOUmDjp/RnuBciH8CKluwzRceeA75avFVi0dlF7DrS4Jk38kBQ4nswetKkU3b4anDZK+VaHTC5az1J95ni+Btrj8MMms/ErbF8wSHZSqQoErbtPYMF0omK80GXbZgaaRw1k66Isclg5qBbWv9tMn1yGSGqsErjKvnDyDK69Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8yLswBYSnT2zZCVJ8Fewk+d6xwuVuDuP4cch0nxUTIc=;
 b=hYOF+1DWrpHf3J0Lr+RxElkCB9HFWBpkmuBf2gh4BuDlkxOq1L4vR0eatvZEy7kwkJ3zbNNQxlK0dwBleGZuA4KJIh/glR7c5vVPPBMSmHP1a7QNCMSJSk+7fFnrWvK/gj4UeKvtGggOOT+cyOXsPMupoUrA84v30TU6sFplVznjeWEd0i2DbFLCOH5W/Z/zPT2FvtGfXmpOvNCjTn+kZnhm6gZcBzD4YylyobqZ+5D9JY7JCFMDv1wKsn5FXbLYLi/X5bvz31dOoSHkk0NIWhw6N22pA6m/QGGKjLv98kGjCC0J48ccLUUptxMLGHFoLw9XveLgiIEMkmOsdyENCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8yLswBYSnT2zZCVJ8Fewk+d6xwuVuDuP4cch0nxUTIc=;
 b=MzeJPDzou8OlJ9fWPCDwM/sn1t5yJb+OWKE1h3p3mxYmAeqmz4omv6KcqwSjaMZKTb3vN1Ov/1pz+ZDrLfaSXl2OCHTePU6Ckg4MzIh6QSK5kjLE3uUmcrrkrXYXZCwWz2spvNvaCEppojWkqoK3uNp3enU6R48gx8HJNTNKl4tHZf7OcJ/uDAXqcMqmCcs8tdMW8PHhON/laUYhpp8FOYnB8q+he0jhZ0Gj/WiyvHK07SGnZpAhn74k2P/Tp4wCw1c4Rxas0aCgavgAqa5N8FxFB2nReQr+Bv67EuQouX+1sbftljUyZQMPEd6Hze6B3N1VhqcGNIPpe7+34A+tPA==
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PA1PR04MB10228.eurprd04.prod.outlook.com (2603:10a6:102:454::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Mon, 13 Jul
 2026 17:01:56 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0181.019; Mon, 13 Jul 2026
 17:01:56 +0000
Date: Mon, 13 Jul 2026 13:01:48 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: wsa+renesas@sang-engineering.com, tommaso.merciai.xr@bp.renesas.com,
	alexandre.belloni@bootlin.com, Frank.Li@nxp.com,
	p.zabel@pengutronix.de, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH v5 08/17] i3c: renesas: Fix out-of-bounds access for
 newdevs mask
Message-ID: <alUZ_N9VdxkhcpqM@lizhi-Precision-Tower-5810>
References: <20260713130545.568657-1-claudiu.beznea+renesas@tuxon.dev>
 <20260713130545.568657-9-claudiu.beznea+renesas@tuxon.dev>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260713130545.568657-9-claudiu.beznea+renesas@tuxon.dev>
X-ClientProxiedBy: PH7PR17CA0056.namprd17.prod.outlook.com
 (2603:10b6:510:325::17) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PA1PR04MB10228:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e00aa34-4fce-492f-6fc4-08dee10071b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|366016|19092799006|1800799024|18002099003|22082099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	4BGmmKMLxfBSf+OLWO4jLIvvjjHEg9h5Un43Pa75gakadQQeOLJKppkHQ0Z7v0Em478fWPw+3twIm06iHqmKm8YdUEWr7aP/9DAm1U3zFF30RtNmXQPK8EpY2KvxcEdiQWK5MuzLpmgcjiPnF3oJc3bKSvXZkXY3jwyBMzSP119zC99rOfNaec9Dp5cY0jClOuIh8FpvLNhLXZHOdV7DqO0Ld/cYdf1Jq3UrWGEvyprdotJy98DrRTcXbK96Nku1doOu5rwRTAsotdEO35/+CMVdCgm0Tp/tS+bHmKtJ+tF2lQgh4a87sVryhLTJ/bb1dHbaEBGrUYgmVU9Ed4QAPafW5UH0omfiANcRAu92OKL5oBHic/n8oXJRNOo9TeAKWPLvz1EFLRsIjef3TVdCvL7lHXLUdLBURW6WAbCDn363PI/hnqvdcYlKNzCeGSsEQTQfQ/eI3YjM4WYeAlSR5oMcq4R7d1sGcaE1o6Rn5OVBvY3iQphgf2t96I+PLYwLpPk3n9CpXR/+9YR+qcbQ0Kog1O+ioeI6ft+lpAAi0hwZljeFBdCY4nUm1huEoBpNT+zeK25eb3ILJMvLSyWCphtOL0sNL0Fo8g4DaNmorpRavjbSOF/bIN7HSBAc4uLN7dA9xr3c3SmKoKIbpnxEHgFx0bvi8Nwl+LJ/e3VB9b8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(366016)(19092799006)(1800799024)(18002099003)(22082099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SjsSIIt9J046Q622uZIMZnt1RurTGyoiCDBdTSVLJ92abL4SqCO22CHh0oT4?=
 =?us-ascii?Q?Ot2C47ANA/IAOYmS3SXyXxqsm1uux8pdEoIUzmda+lEgS0CRQZHyL2PUHrEw?=
 =?us-ascii?Q?7sb92Hp/par+ReYd3JvmLe+HfusSPdDIGE4LOAyTsYA02b39mUww6RfHmaY6?=
 =?us-ascii?Q?aP7mT/4PYV2LHsmAKmyeiNEIdABf0hCViO2kUA5wL5haMuT3zSRytBqRJA+a?=
 =?us-ascii?Q?ce0N3iF6ECcnGSY7x39I2UJJ12LEKD5OTKBDJzJwxRDCVh42Op/CpsgKrfFo?=
 =?us-ascii?Q?agEjH0ZxMOfCoPahKvqlBDl3UwIlQQl0bRpd4dH0SgEDzji+01bRoDqLzal3?=
 =?us-ascii?Q?z2m5ki/NVvM4QrFl+P34SHesy3lSoui4YNj1dk440uRRjz1WVHiaTxTktYLd?=
 =?us-ascii?Q?nDcKr71woXac2D2LWJjrGrCg+0UgP87z6VwuV249R8ZBNv5upud5nMlbQ/Su?=
 =?us-ascii?Q?k5AP3m/dnGOmI5+h+CTjrE9PQMTMhGiWvYlJuK48pPRfRmYbQiCN7GSgjYcx?=
 =?us-ascii?Q?D7wrHOiitrXKdwfZCB0zU3hrfFxAcfMwOEymXoiSZzwhH3vYuSbYle5Qq2gX?=
 =?us-ascii?Q?gkK7k4+R1QxvwCBlPzqfgwv9hZWhw2ZOLVSZSxpI79dR1fiQ8qyTtdCMA8jU?=
 =?us-ascii?Q?VFA+XoARq/qyuvccJtDmQFaTL0FfV9Zv7znlLDMVnWo6Iyo0atEe2/pryrL/?=
 =?us-ascii?Q?nNPFGKgucrlTuW3Gfb20EvZqUAyZSV1Lrp1hIm4uMWkZTUlqJyjeNKwfkDGI?=
 =?us-ascii?Q?37z4STbXS7F3AlRUgLw4Rs/OrmX8QxHm08FEkfJI+NX5P5jRzHowFjzcfWa5?=
 =?us-ascii?Q?zRYGXB4DkTbEtz15GDlcynASlKhHFBaVukx9hGKZBATXy7urEoEzvX+M7+iX?=
 =?us-ascii?Q?faEeaENoLCYpYx4T3MexWmtmzMVGJ3CJUVYFFySXsGZQoH96e9BFfB4vUHB+?=
 =?us-ascii?Q?PzxlNODGsnf/O7BMH8ppEC+u1PILqB3VSLxXq0sgwrccflEbIY5jGTZ96wXx?=
 =?us-ascii?Q?lS4I75dT6L7Gwul216mjNe+T2on/k8ldPnYjRcMOgd5z3JACR2BKae2LWan6?=
 =?us-ascii?Q?jrwU5yTcs9lp2KKXGAYFefPcDvCCUTW8SRpYa1Fmwsu4i5maYRduZQHyNUGe?=
 =?us-ascii?Q?y6gKThCYJ72Z/FBQwlze9QjD7fCDDCz6KBk9B7cbwLPdPW+MMaIOYoR6azVR?=
 =?us-ascii?Q?liPeScDf1VW5asukDC6fCeKVG87fJmPV2klgCkNOVrJ35zsbWHo0bjw+SyI+?=
 =?us-ascii?Q?KXYc+T+dDbpROhgU4HtvZG5dRvZSyYyq3364+Yn63Pm4sIghdQNlXSqnqThp?=
 =?us-ascii?Q?8s3ClMzX7+4E24t9YW+qTO+uq/3S9UbRd6QZ6iZsarSxNXOq4UMCaJNEXN52?=
 =?us-ascii?Q?YsQaTQI72IYF6NbzpYiEv7KUbhiv+DDkgx9CO3XKSKWtUezHltXEA6n5Kmbc?=
 =?us-ascii?Q?ISYu2l4Wz+96e7hm78B30ruzvKpcvkJyDL/aHZ7+f9B12EXWGQXZQPzHnfJ9?=
 =?us-ascii?Q?4CDlD+QPQc+AEA8xolLdRVNlDf5h2qQD9N7TH9EW5AjXL2aM7/MyKQCkxnjn?=
 =?us-ascii?Q?C2UsvPUo+06vIHMUbtMDUiy6ZUEokUgu1QslKGeyQmDxw4vrS/V3OVJjgwyE?=
 =?us-ascii?Q?jA5ss1oSJXxWP3csZc3LCqNAGlOnV6Fv+JUq4foB5Y/TF5CGse7bnBGfA9TU?=
 =?us-ascii?Q?Ol8bdkqfRmwxKozkKUGcWXhRR8shuyOTT7Aav+DwpOQcKia9IIJvHnEAq0/u?=
 =?us-ascii?Q?PtHRmvkykE1OVHQYvpoeX8SmIXV9urYt+YJhZR8OE/QzP1gGVKeU?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e00aa34-4fce-492f-6fc4-08dee10071b5
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2026 17:01:55.9433
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zkEk/CWfm+BQPr+tbPLSgAEMDNqIZPoCKN6WSTxDP8Dpnp00pzeGm43XGDkJAj9nmUK5GqZWr7stjZAA9Oy+Y5AANBdOOElKhYHV0cnzAGFV44YEt1MOoJ7/8XW1G5iv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10228
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-35150-lists,linux-renesas-soc=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:claudiu.beznea@tuxon.dev,m:wsa+renesas@sang-engineering.com,m:tommaso.merciai.xr@bp.renesas.com,m:alexandre.belloni@bootlin.com,m:Frank.Li@nxp.com,m:p.zabel@pengutronix.de,m:linux-i3c@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:claudiu.beznea.uj@bp.renesas.com,m:stable@vger.kernel.org,m:wsa@sang-engineering.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[Frank.li@oss.nxp.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@oss.nxp.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.nxp.com:from_mime,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email,nxp.com:email,vger.kernel.org:from_smtp,lizhi-Precision-Tower-5810:mid,NXP1.onmicrosoft.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B6E1E74DDA9

On Mon, Jul 13, 2026 at 04:05:36PM +0300, Claudiu Beznea wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> When software initiates DAA (Dynamic Address Assignment), the controller
> reports the result via the NRSPQP (Normal Response Queue Port Register).
> The data length field of the response descriptor, which is accessible
> through the NRSPQP register, indicates the number of devices remaining
> after DAA. Consequently, when the bus is empty, this field contains the
> maximum number of devices supported by the controller (8 for the Renesas
> I3C controller).
>
> Adjust the condition that computes the newly discovered devices bitmask
> to prevent an out-of-bounds when the I3C bus is empty.
>
> Fixes: e7218986319b ("i3c: renesas: Add suspend/resume support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
> Changes in v5:
> - none; this patch is new
>
>  drivers/i3c/master/renesas-i3c.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
> index b9784d238f61..c459e40fd5ff 100644
> --- a/drivers/i3c/master/renesas-i3c.c
> +++ b/drivers/i3c/master/renesas-i3c.c
> @@ -703,7 +703,11 @@ static int renesas_i3c_daa(struct i3c_master_controller *m)
>
>  	renesas_i3c_wait_xfer(i3c, xfer);
>
> -	newdevs = GENMASK(i3c->maxdevs - cmd->rx_count - 1, 0);
> +	if (cmd->rx_count >= i3c->maxdevs)
> +		newdevs = 0;
> +	else
> +		newdevs = GENMASK(i3c->maxdevs - cmd->rx_count - 1, 0);
> +
>  	newdevs &= ~olddevs;
>
>  	for (pos = 0; pos < i3c->maxdevs; pos++) {
> --
> 2.43.0
>

