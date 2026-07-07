Return-Path: <linux-renesas-soc+bounces-34807-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qIOvNFrrTGpVsAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34807-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 07 Jul 2026 14:04:42 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 726F871B323
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 07 Jul 2026 14:04:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b=oKJwjm6L;
	dmarc=pass (policy=none) header.from=renesas.com;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34807-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34807-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6D170303D330
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Jul 2026 12:04:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7009B3FDBFE;
	Tue,  7 Jul 2026 12:04:29 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011032.outbound.protection.outlook.com [52.101.125.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC6B83FA5F1;
	Tue,  7 Jul 2026 12:04:27 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783425869; cv=fail; b=F2Mm3XFwC59FSmhAMku5VNwKYr5c+cnXDqvZVRVHiiCc2+9aC7xIZokNOiPm2RxX4JsVBYgvVioJUItymzUJC1aFQiAFCXP7ripeFDrn8mycEQJzxWOeepjbH2MrfeKIREdPaqcEC/UJHlftUl39xN17Wut1dWslkFaOqKldBek=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783425869; c=relaxed/simple;
	bh=G3h+Z1N66IY+04POCCM//DpKm6ob60S0M+LePuRoiuo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=pJ30TynCmlw1Mu9KekJ4Vpgw11PoAxaWNfGIepRxG4WAGhnFI+8rpeTjZZrKt9pNH4ElWE1urX7qLLkziHW4j2ovNommw+l/zB33lcrGizI6YHe8baYmtBCu3AhcSVtfFFbe4CfwaaY7DpGxZpaDaFYkjxH8pE0u/+XlxLxtRrA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=oKJwjm6L; arc=fail smtp.client-ip=52.101.125.32
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YuVm/so+Fvkif8ZxYWV3lk6VlxGpfF4mzRb0S13LM5EUUSppSh4RYP0/pMLloztudwf8b57NxbZ0GQxm3UeU+b587dofc1M294eAwhUk7sLTizxiD2NLU1tUXIWUfDm7Gb0zY/JrIf0WKZjXER9zJOH1mFWu2Eo1X1/R/8cU/NMZIZ4nXyYwOoScjHokcEawppsDEGo8VFPBkvOfIj4334YPJHLEyoWSvPyjfGX1MTqpiHALmE1UF6ffee+2dtEf7/y5Lfte4b/IMwVQ4uvUeCBiBjeDhPZOcz1+6hWsd3s0K9CQuMtDE9Csr8xTxq1v6sYJn7dY3T9JZjnWm7vhCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IPbn7X4ScmtrQhVivBFy8RgAe2W/+90V6YtuNZ9Jkw4=;
 b=ULQPARCqqFbATNOKUdqc/rhFwhbfbC3YjJ1h5nXDh6WIPV0gPp0XaAOZPbrXK2q/JWlAWkHawiqbrLRkl3xvDNWzve/ZiOXqnwMDpwgXKlNTyU11+cKSLSmqnhjcOlvZHniOdZs7W8CZKEHPC0vFqMCj7H2EA+2lT2VQZjVqiOECb8LQ9jyevXDk6z6EpPwSgRtcyGY71ZA66GVlkMmZ2x7GpkjSw4eh1TJLVlsoocffhM4Y2qBMwChOYGta98UpwBHuj9koM+1Fe1ONHsXOp3gC8XChJFTYJMVOGBiHoyHpYjCMSvX5eDMedsmqMndV6DR/8k148kbITfqyzBg84w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IPbn7X4ScmtrQhVivBFy8RgAe2W/+90V6YtuNZ9Jkw4=;
 b=oKJwjm6LkylrDUW9TMvcV71zwvf1ypGTY6qst4zEMRzkp3x8NX+dvZTSh+VRrGN6LhUCWBJOeCLCVcoTw1fLhTomJu81VsAoYd3Qj8uMAQPk5NdMy3vph0Xan6DbPeTfHwvCmr038rXmpj/jUE+VkVg0sjFGdnvhmbC6BLi1JlQ=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY4PR01MB12685.jpnprd01.prod.outlook.com (2603:1096:405:1e5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.9; Tue, 7 Jul 2026
 12:04:25 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.21.0181.009; Tue, 7 Jul 2026
 12:04:25 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: biju.das.au <biju.das.au@gmail.com>, wsa+renesas
	<wsa+renesas@sang-engineering.com>, Ulf Hansson <ulfh@kernel.org>
CC: "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH v18 09/12] mmc: renesas_sdhi: Save and restore IOVS across
 suspend/resume
Thread-Topic: [PATCH v18 09/12] mmc: renesas_sdhi: Save and restore IOVS
 across suspend/resume
Thread-Index: AQHdAl+wM5t7iM5dKkuNJi9o9qUGd7ZiCu/Q
Date: Tue, 7 Jul 2026 12:04:24 +0000
Message-ID:
 <TY3PR01MB11346B13B13FCCD02DD9EDA2686F02@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260622155610.184271-1-biju.das.jz@bp.renesas.com>
 <20260622155610.184271-10-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260622155610.184271-10-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY4PR01MB12685:EE_
x-ms-office365-filtering-correlation-id: 2a98a7e1-ce2d-42c5-394c-08dedc1fe359
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|38070700021|18002099003|22082099003|4143699003|11063799006|56012099006;
x-microsoft-antispam-message-info:
 PoYl6m0Iz8PkDMBxdj43JFnmhmYPgyCn39Z1fR+d2EG8dsT6F2VMzngv487gV78dwGl+UD13Nxi6hJP0LCqHmlvixZ70Mirtt46f1hBS2AcbEviw6bnb7T/Ww/tUCijHh2j0OoYMMSy0+msUhUBygLx7kCHrTCVvcnameemTtfujPhCjhBHjmDNJ6OkHMAn/RRuJlRFElo3XnoSRIFmmh2khqlg+0532/28k9DX0tjU8d1iBMyaQRMXF8ine9T68p4MgjcNHqEUXOKSHn41zygxevToeryzPCpuysiqdOeYML8543p9I7KBruDAV+jSP482UZOcWFzHh8xAQk9qpOsLWgSc5X0U9NArfFUYsNHOH6DAX4CLRZ+dqLV9sUc5RQnbkeGgjdhbpM24nUDq+tbZ9tljztcB5n6dI7WaWXhFUHsXDwx+qJSnCK95hMRVzOUUd9FDntaM0LdREH92j+e8UvSyIupjIY/DNupn+OUbCIAwbIM8vKYu1KX+XuVDNuepHarWFVJZ6mz00knAsZFahVcjoTqFprzg5YMhUwXr9DlQtfX3dV7kflo8ZZ8COzUrf3HPVQ0BriYmfVqyyktKrLarTLT68m1AolEMG2IGj1eNYJpdyR8/MIavTtnuWP3smRDJDQxBoA2+ylg/6lPwIBDpZFcwtaYWnADZv9so=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(38070700021)(18002099003)(22082099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?crkp2droQPB6j5RbBqW0/TrFg6PozF3dOjYE6DFDLSBVwSmtAVxytPEDtC3O?=
 =?us-ascii?Q?LPiFLt+v1RDF7p1UyqP8PWbHOuEBkB8RezJdt1s3Ht6MtqEi0MtdS0vrw8f2?=
 =?us-ascii?Q?oFsPS8BU+AVmIARlKLtrnuN2MuS8TH/shtdxuKCUVeYOITtUL33Cmfwjjpd4?=
 =?us-ascii?Q?oPooJET5ySpj91VKdpghj3iKExAHdi8tkgKUP1z9SxAh0i4bRtVE5Ps57g1F?=
 =?us-ascii?Q?3m1luvF5WlVbqnhXpp/mjKd2+gk1UHZ9+fOPfzvixlDDUGUm5v3i53uqwGpx?=
 =?us-ascii?Q?CEyNoi0T6svXElJdLrMdnGb1fb3KaIOeDG4NJsKQk+9bdyRLZPOkw6ow3ixr?=
 =?us-ascii?Q?0ASUofhhcmGFm4IApOFa7dCAPzBTkEdtH3r8LZV0S4bMjSNOjCilIGH+sNgb?=
 =?us-ascii?Q?deRV43hFbXZTl+QFLdru3EeV7cD6eE8UMYmeTn2NO4lz6S0Dbh4mD696/UHX?=
 =?us-ascii?Q?jR87ji91JIH7Z0vvGZ6qs6VTN+XztsZsch5gxlDB/SPaBWjgyTFn0ycto+pj?=
 =?us-ascii?Q?HKhoJEdnYfWE8NI+sojKg3yW5ZCafGwx3uMAfMvz3NKkkyR5ka5RfvSXDvtQ?=
 =?us-ascii?Q?A7OCiuY7s0497gV8tgj1dWitlQQIyf5xRAZnANI2t4yJ2Es4FrCsZ7EZslhY?=
 =?us-ascii?Q?mm2siBmAYlWdMS/MafgQe1YYT0oB5LLNo+RcRF1C1lhugDYTRca9BCizhAp7?=
 =?us-ascii?Q?x09aB+QPHq/asbP+NzOd0T6CxBJEpyA71d8mZNq0k2qee/Gaj5WUxcfdPJp+?=
 =?us-ascii?Q?X5y1PyeVeVA4p23PtbYoF7JMJKTqOQD5m7oPJzHzjH3awSp9VTDnphw70+0C?=
 =?us-ascii?Q?j4MJ74jBsDFVDf3gyG78OHb/rVgNHVw3NIi+9w6XSJw9O+BkFvFs09LulSN/?=
 =?us-ascii?Q?EgGHOj04b/I7cC42irAnB/1pJUV1G3m8FJKzrL5j1QouuLJxj8bRcAC7oa98?=
 =?us-ascii?Q?YE/M84mfa7YzRPgE63Pu6PpRMF8/HKwmAJYi0wyVIWZNMWWkEP1979xVYJuk?=
 =?us-ascii?Q?fuk407pU84jnmy8mUYQy+CbNDCw0gwsiWArn+hj4Svpp9zq0y0QF/kOUZS/O?=
 =?us-ascii?Q?EOeFBRgrvl31mfQDD6R01oqDGl2JpKYp3SPzYAlgD0zkIMftorsBCIqw22HW?=
 =?us-ascii?Q?9EPaC74D3jop/vfM4XAgkcK1Llhy2jRklxLt39Fn8sW9d53uKTvzKEcG7Mwz?=
 =?us-ascii?Q?x8z2kzQKfROv7PqxSrfOA8NOZ19boYXgBt3jopX0Lm+1a1qoH9oK2lgw7jnp?=
 =?us-ascii?Q?0QWpQEUNifSG/STr6gMulwMsInXEtEmu1t5ZJHiEcvgyENAnVmbWFfCFpvLz?=
 =?us-ascii?Q?TR6nZe/S1gOzdo9Wy3Fo51IsL2xLRbJpYIYMJnADHBSkMl1PWRPgUS8WZwnL?=
 =?us-ascii?Q?MGUyGIsC3sJ0N3neST22olIqigfxtNMmsZIZIk0BcxvMO//QqmXOIumK/ohH?=
 =?us-ascii?Q?l/DRmoyXb6iHBb/t7vAhcJU1GLsqsmIwHmr34QqluqwZO0f/n8SCpBqJ4P40?=
 =?us-ascii?Q?7by/SxoDnEIUYVN1tzLndXgxwbTDbtqDKbZtbPkHODM4xOH6FcCTLLMESkQl?=
 =?us-ascii?Q?CEtWFzH3UJ0tjCrB1dnpFBiH/1S4DGybBYvZKFbrYUk9ygDjH8IMud4rAx0E?=
 =?us-ascii?Q?f8123riVJ49u1JVq2OlYceUvjv1Thqhj8faDbp5rWk4Aq6ED0A/wTfFewHTg?=
 =?us-ascii?Q?ZHdPOjLTGs0dtmkMZOp28oEobAMPIrdl2GuJaVlP6N5Zg+JhVfY0i22T01Wd?=
 =?us-ascii?Q?8vOLjE9qKg=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a98a7e1-ce2d-42c5-394c-08dedc1fe359
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2026 12:04:24.9321
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dL1QkbbxX5tI46aGGGanTPUE6wCMLsRtw5pjTQikEY24ufzuepVJxSCOZjHac0zTbeDbkx1m9q2Md18ObFv5g2hcVUozm94cgyXV/A1VWIo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB12685
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
	TAGGED_FROM(0.00)[bounces-34807-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,sashiko.dev:url,vger.kernel.org:from_smtp,bp.renesas.com:from_mime,bp.renesas.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 726F871B323

Hi Wolfram,

> -----Original Message-----
> From: Biju <biju.das.au@gmail.com>
> Sent: 22 June 2026 16:56
> Subject: [PATCH v18 09/12] mmc: renesas_sdhi: Save and restore IOVS acros=
s suspend/resume
>=20
> From: Biju Das <biju.das.jz@bp.renesas.com>
>=20
> The SD_STATUS register, specifically the IOVS (I/O Voltage Switch) bit, i=
s not automatically restored
> after a suspend/resume cycle, causing the regulator to report an incorrec=
t voltage on resume.
>=20
> Fix this by caching the CTL_SD_STATUS register value in the renesas_sdhi =
private struct at suspend time
> and writing it back during resume. The save/restore is only performed whe=
n a regulator device (rdev) is
> present, as the IOVS bit is only relevant in that context.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v17->v18:
>  * No change.
> v1->v17:
>  * No change.
> ---
>  drivers/mmc/host/renesas_sdhi.h      | 1 +
>  drivers/mmc/host/renesas_sdhi_core.c | 6 ++++++
>  2 files changed, 7 insertions(+)
>=20
> diff --git a/drivers/mmc/host/renesas_sdhi.h b/drivers/mmc/host/renesas_s=
dhi.h index
> 9ac5cb25ee98..9d5e591ef2f5 100644
> --- a/drivers/mmc/host/renesas_sdhi.h
> +++ b/drivers/mmc/host/renesas_sdhi.h
> @@ -106,6 +106,7 @@ struct renesas_sdhi {
>  	struct regulator_dev *rdev;
>=20
>  	unsigned int divider;
> +	u32 cache_sd_status;
>  };
>=20
>  #define host_to_priv(host) \
> diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/rene=
sas_sdhi_core.c
> index 8e14ce3ca7ba..f77985d305c0 100644
> --- a/drivers/mmc/host/renesas_sdhi_core.c
> +++ b/drivers/mmc/host/renesas_sdhi_core.c
> @@ -1391,6 +1391,9 @@ int renesas_sdhi_suspend(struct device *dev)
>  	};
>  	int ret;
>=20
> +	if (priv->rdev)
> +		priv->cache_sd_status =3D sd_ctrl_read32(host, CTL_SD_STATUS);
> +
>  	ret =3D pm_runtime_force_suspend(dev);
>  	if (ret)
>  		return ret;
> @@ -1422,6 +1425,9 @@ int renesas_sdhi_resume(struct device *dev)
>  	if (ret)
>  		reset_control_bulk_assert(ARRAY_SIZE(resets), resets);
>=20
> +	if (priv->rdev)
> +		sd_ctrl_write32(host, CTL_SD_STATUS, priv->cache_sd_status);
> +
>  	return ret;
>  }
>  EXPORT_SYMBOL_GPL(renesas_sdhi_resume);
> --
> 2.43.0

[1] https://sashiko.dev/#/patchset/20260622155610.184271-1-biju.das.jz%40bp=
.renesas.com

OK will add the scoped pm calls before accessing the register.

+	PM_RUNTIME_ACQUIRE_IF_ENABLED(lvds->dev, pm);
+	ret =3D PM_RUNTIME_ACQUIRE_ERR(&pm);

Cheers,
Biju



