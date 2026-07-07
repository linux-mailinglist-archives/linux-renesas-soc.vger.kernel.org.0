Return-Path: <linux-renesas-soc+bounces-34804-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lpxJL+/bTGoVrAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34804-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 07 Jul 2026 12:58:55 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F62471AB44
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 07 Jul 2026 12:58:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b=mb8FKeza;
	dmarc=pass (policy=none) header.from=renesas.com;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34804-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34804-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3A287308DC4B
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Jul 2026 10:54:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99DFD3F44DB;
	Tue,  7 Jul 2026 10:54:06 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010017.outbound.protection.outlook.com [52.101.229.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D0E3DD873;
	Tue,  7 Jul 2026 10:54:03 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783421646; cv=fail; b=qHVSvLTb6RNkgspq3B4HxfjhPInGIVrZ2JpcjWlGokNpqaDwi5j2f98Iv5En0vIju78N2C0+ZmFOjKOhjSEFupNg2IxTn4EyWb00DtIHgMMKCZOiYP3MMQwP4L8U6XgWyoMV8BGYGgCTueciA8xCw+FdmxTdwDV+rqQCam7yCCs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783421646; c=relaxed/simple;
	bh=0N2klaBu11idCToHhOK/Hdqf2pXU6Pj3+3sR9SYQIAg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=eHDVZnDJZpQ4OPBNNKFBGTimbVu5luKUKW8+u09I8/6e8oz/0vN6YlBvs7mrN6lYdNDougGhLDEs6IG/UcNFdtlMMoTKDGrw9mQe72ByPInCR/VNZ5OzVo82ziREsbk8tW+r9WywzefkaGyWr0r+DVJz8Nv8fkMZMFIENKg1zyA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=mb8FKeza; arc=fail smtp.client-ip=52.101.229.17
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VOwDp1DbMlChiKnCC6FOUBdbpusOM7fcnbq2GwakZ0SqdWQvM5PAwutokXJSSZwFA2Z9fnkHVqs0YFn2JdDNJOiGju+qRMAKad2dGW/xZ8N9NufPPgccQR9b4ObHrjZZoWdJhF94jBwKbuH/CCw8mUSjbQgI1NODp/BtZxNuJkMS0c1r7isM6f91hAKnIECuFbyFYdGBE10UHo6RjUXXjfJ4PREQAh9sVGthR1UOkf7JS3PpB4E2OCGQt0ikJaQk1Bx/X74pKQRVxF+loYes6oyL5LFQMmA8dbjQUOCPARj2fLzUjkMfgfVXQeJ277tStTKqvO+7J30PzKKxR4Rbww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yFBCsiNhn3N/frtyomKopAKAn+fRyGvPMeKLmElGXJg=;
 b=RlbIxqBLv+93U+MksnKAN7APsGUHYmI6OxPqRNw/N1c7blCdSqHeN6b00FZCy88iccXq2QCZRFUcairxH/pWCWGZFH5CGdcqP75aerOsd0LhtUknsYluzhXLmDFNKtfIzWf/1ZYXvTOvCN+c7WEdT1Gz5fR5IVKun1UawTWqdE/3V6mJU91IrYiXFGoZaYhIgMo1XjDAKC46pDlY2X6vNmRUXCQ7Rv2A3X2lyuiT0jdp7kdMBYBYJchZQVAgMYY1W3AAlq4adgHM2Qbl6m6PZUOH5wqGsIP/zZojfC4VnxBVuYGLjeQQcWujyHMBa28EZmjpzEvlsSafuCvaB8TeHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yFBCsiNhn3N/frtyomKopAKAn+fRyGvPMeKLmElGXJg=;
 b=mb8FKeza+b3XfbpQrVbIDeqqXimk1Tmbzyr4tw8N9F7R0DgrqcG+5XLSBiymtlGY1knr14reY0VCdBeTTDcZvw/+NPWRMzFz4nInu024wVjnw4BsSJFH6SzQ4Nk7H2RXeaSQqy+W7j05Dqp/3jg5JrcCXXTQrzO1H+mywnLTirs=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS7PR01MB14968.jpnprd01.prod.outlook.com (2603:1096:604:397::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.13; Tue, 7 Jul
 2026 10:53:59 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.21.0181.009; Tue, 7 Jul 2026
 10:53:58 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: biju.das.au <biju.das.au@gmail.com>, wsa+renesas
	<wsa+renesas@sang-engineering.com>, Ulf Hansson <ulfh@kernel.org>
CC: "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH v18 04/12] mmc: renesas_sdhi: Add max_divider field to
 support SoC-specific clock divider ranges
Thread-Topic: [PATCH v18 04/12] mmc: renesas_sdhi: Add max_divider field to
 support SoC-specific clock divider ranges
Thread-Index: AQHdAl+t65n/jCG400miBz4CBtOX3bZh9/tA
Date: Tue, 7 Jul 2026 10:53:58 +0000
Message-ID:
 <TY3PR01MB11346CFB7B99FB22483112D7786F02@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260622155610.184271-1-biju.das.jz@bp.renesas.com>
 <20260622155610.184271-5-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260622155610.184271-5-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS7PR01MB14968:EE_
x-ms-office365-filtering-correlation-id: 6dce7aaa-a13a-46b4-ef88-08dedc160c64
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|4143699003|38070700021|6133799003|22082099003|18002099003|56012099006|11063799006;
x-microsoft-antispam-message-info:
 rW2MSpmhT0aP052OzZkWGSzGrra6B8MI72oyPWE1fNoXeNsX0CvZ4uj+zs8fLRfd/rGQ4BfabSlDr6jBuxYoaH9OvpHWoNjngr5JGy91uIPfsL50xQYXZSlDu8Rj5MBYZiQd0AGb97Xf/GpkfxXeUXatnEdgji4hgBI9gFHQcM36/42dL3OFxkN4BaQvyUGVJDhQm/4mlrNFVmkTLjWND558xZvb3RSO4ID86u1OIg0SCyj4pveZe6KGwnuQ9aowUtMk/+NnXRxvk0TnKV3t5HVnxH+2FY9LEmjEl3b5clrA629UHqgUpjK7lEW92Ow6I2dJhsf7895QB+G6PVPezzXF8tMyo/sADgGnFr+oz40lXa9pRwUS6giEb16pjihE6RPDW8FQOjAZ4IKl41Ro7ST3NHHLt9gXTiNulADR4eHHirCV8NWWMnQsKijoiehieknWa1ej4yt4ChBqaOuAcG4HOHQi9yHljMbNO4eBhjhzX8Z7XmHZthBWmV5+DPiLyVsXQvJsN6De3Cr5CJ+Lv9KwvHKYs1bGv5qfFUO5+CBmrM5WfZC2sWIGTCjpiUsjQt2OG9HmKtEPcPn+r20mpgiNbyyYsMMbw2QnwybnSQdhTYRgsLh5+ac+b+Uo0PGCTJGwdJ25KIuVRM5FTWVaac7lPA14oHdfh2az+27CdiM=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(4143699003)(38070700021)(6133799003)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?4IUTWn34aHaPbiqneWfYNMA65O8X0im0owwKsxpGXegPD4MJgxXq+N2Wr/Fg?=
 =?us-ascii?Q?CBzkD0tSKPLBRvJLXnVN/5QtgtLLcGwIjsQudvAU/LdAeE/H5ALZpE1lbx/i?=
 =?us-ascii?Q?o2oI9Nvrj3v9H/3dmsqq1I8Sal/EA0/CsnPUNPmdlFd8f0pul32DoTm8Kn1y?=
 =?us-ascii?Q?VE1lQCac15mTd7c3EUM3KyQIMZ4oir8o7HFJj2niL7a2bouZoORbr76odk74?=
 =?us-ascii?Q?pdFnAAUJOORUVqeYDnFTmSymL7OU1RDnJAwhjURn12bEYGQ1mEyBOhwQNSPb?=
 =?us-ascii?Q?2epq5kLOTa56q6Sc4VuuIZLjr7bejnYu0EiTaLBnddU/L8UzC10YDGPpWtt6?=
 =?us-ascii?Q?3BvRSWz24haLXpMbs59g3/Rs/t60J6kktnegTJb5ZexYjuvpedendqjKn7nW?=
 =?us-ascii?Q?tBaGkTlI7Rfgl2vUn4GEABnjYTX8pwuRHl2kUbMlTQc7jQUwz+IdbMHfUX/8?=
 =?us-ascii?Q?xjQGEZKsGTwIsYPh2Ildp5cyuodiSu4lmdYZzCIKUQ2PTE+HbsYKTIpJvcwV?=
 =?us-ascii?Q?RuDjJ47cEWrXO6m1yV35QATLndG/HF3fq8OfBnridGMj+KJTMlFkEwtVY2lt?=
 =?us-ascii?Q?uQsHUebKSLobLpIJhbBD3K9yVI8ucZZ2nkdOvKKRoavhbK++/+HW2ZBw5Zx3?=
 =?us-ascii?Q?PGE85WrmcOyXPgfN9SGVwpS1MewKApgDeyXX7CGRj6cuxYVyArVEPxV+Orza?=
 =?us-ascii?Q?4y/D+BxrvgBsjWseO+n4rKv3wrtOUVd5mvfw94HDh0arsiwsVUSI77+7KLIW?=
 =?us-ascii?Q?FnjGLPKUmtpfpHRbiPEhzqfyoLRnvDfJnyKd87mG36olw7r5Ohv3QOtU29Qf?=
 =?us-ascii?Q?qYQ9tFwgkrcmLYUml1CWC2YU8c6TByOHBvRZvrM3hrBzzPaqxzkf053aU91Q?=
 =?us-ascii?Q?wuQQp8lOWCHojxt0TGBxXKuOVTnwc5l6cgI8PNSsDWYEEitKmKExmIIrgYif?=
 =?us-ascii?Q?D/9MM1WDsBGKcMavn/V6BmktgoLWKxcMjc4D0hFEURXFqOu1BWhVtJI6TxuS?=
 =?us-ascii?Q?H31IjqyV7ttuIn+2qHe0rzDzW0q+6JLtLOSkB1/UqMiMrMJP6HBXX2B+Niql?=
 =?us-ascii?Q?cT6yfOizgnGwpxiswBMiq9RU3tPY94Sdd9RTyFoonG1wLelSkFNqwkskBvBA?=
 =?us-ascii?Q?1nFn7E7BF0GUUthZ7Q5z0LTnYfCJkALAnSCIBJ2j/frqzaRK7+/1sMiO/NQQ?=
 =?us-ascii?Q?yILJwulGonDwXvPpNKT2kevbfKKgJCrqX97wt0AdArVu3ccPPwVnEyReAiZt?=
 =?us-ascii?Q?Imct/bsu3WmDm9W+pS77sPd9fosMtN60vPZ2lxMMAB/7ycbnIWRDTZSe7ddL?=
 =?us-ascii?Q?Ain1YT4x+mtfGVBl0NYSQ4C2xQOr8y2Bpw+0PTcmNpUD0Xsi0li65V8ZHP4T?=
 =?us-ascii?Q?okv4TrGU3fI+xqeZbva2txK/8Rzd7Ud1PVLaUE1gdzQX72jZMLqIi3QYAm4w?=
 =?us-ascii?Q?qWaYpJG7yGeWBnNPTKMVia802qdKvY8UN+x49pSnpGjBfetv1uwBWj1troXZ?=
 =?us-ascii?Q?LEWrwUFCCXY4cehNyEupncHWRoZVnJFwpDDeMMJmG53f0YVZGRqIDW74S39L?=
 =?us-ascii?Q?M4NjJb6c1zFGuZ4K3++fasksSONrbFSUdS1wPjshAJTEpi+aDNiRb9QDPN7A?=
 =?us-ascii?Q?wfnUYhNSBPMZ6he4ckVKE/JRO2BkaBJI487ZEHtnRVuU4LkT3tRu5Q871qQx?=
 =?us-ascii?Q?7mOzyT8SM9LIu91g0zCjyevQIPwgf4uGtHhDMkExg7wBhthB/Sb9hdHjnI2u?=
 =?us-ascii?Q?Qz5BAkxaGA=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dce7aaa-a13a-46b4-ef88-08dedc160c64
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2026 10:53:58.7985
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lf62+YS5XquZo9NIWsbYMNVn9S/nzIqZ8hbvCEjKUr6mIGrTFP7x0eRGAaylLWKY/V5C+v5BnVvfoRNBDVdfb7X9xy9grimDz8+o/YEZtYQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB14968
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34804-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bp.renesas.com:from_mime,bp.renesas.com:dkim,renesas.com:email,vger.kernel.org:from_smtp,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid,sashiko.dev:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0F62471AB44

Hi Wolfram,

> -----Original Message-----
> From: Biju <biju.das.au@gmail.com>
> Sent: 22 June 2026 16:56
> Subject: [PATCH v18 04/12] mmc: renesas_sdhi: Add max_divider field to su=
pport SoC-specific clock divider
> ranges
>=20
> From: Biju Das <biju.das.jz@bp.renesas.com>
>=20
> The RZ/G3L SoC supports a maximum clock divider beyond the existing hardc=
oded value of 512, requiring a
> configurable max_divider field.
> Introduce max_divider in both renesas_sdhi_of_data and tmio_mmc_data.
>=20
> Replace the two hardcoded 512 constants in renesas_sdhi_clk_enable() and =
renesas_sdhi_set_clock() with
> host->pdata->max_divider. A fallback of 512 is applied at probe time when=
 no value is provided,
> preserving behaviour for existing platforms.
>=20
> All existing of_data entries across both the internal and system DMAC dri=
vers are updated to explicitly
> set max_divider =3D 512, consistent with the approach taken for clk_mask =
in the previous patch.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v18:
>  * New patch.
> ---
>  drivers/mmc/host/renesas_sdhi.h               | 2 ++
>  drivers/mmc/host/renesas_sdhi_core.c          | 8 ++++++--
>  drivers/mmc/host/renesas_sdhi_internal_dmac.c | 3 +++
>  drivers/mmc/host/renesas_sdhi_sys_dmac.c      | 4 ++++
>  include/linux/platform_data/tmio.h            | 1 +
>  5 files changed, 16 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/mmc/host/renesas_sdhi.h b/drivers/mmc/host/renesas_s=
dhi.h index
> f926a36f213c..438b2a7afe76 100644
> --- a/drivers/mmc/host/renesas_sdhi.h
> +++ b/drivers/mmc/host/renesas_sdhi.h
> @@ -23,6 +23,7 @@ struct renesas_sdhi_scc {
>=20
>  #define SDHI_FLAG_NEED_CLKH_FALLBACK	BIT(0)
>  #define SDHI_CLK_MASK_DEFAULT		0x80000080
> +#define SDHI_MAX_DIVIDER_DEFAULT	512
>=20
>  struct renesas_sdhi_of_data {
>  	unsigned long tmio_flags;
> @@ -39,6 +40,7 @@ struct renesas_sdhi_of_data {
>  	unsigned short max_segs;
>  	unsigned long sdhi_flags;
>  	u64 clk_mask;
> +	unsigned int max_divider;
>  };
>=20
>  #define SDHI_CALIB_TABLE_MAX 32
> diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/rene=
sas_sdhi_core.c
> index cccc8fc235d2..7e48e78cbfab 100644
> --- a/drivers/mmc/host/renesas_sdhi_core.c
> +++ b/drivers/mmc/host/renesas_sdhi_core.c
> @@ -117,7 +117,7 @@ static int renesas_sdhi_clk_enable(struct tmio_mmc_ho=
st *host)
>  	 * Minimum frequency is the minimum input clock frequency
>  	 * divided by our maximum divider.
>  	 */
> -	mmc->f_min =3D max(clk_round_rate(priv->clk, 1) / 512, 1L);
> +	mmc->f_min =3D max(clk_round_rate(priv->clk, 1) /
> +host->pdata->max_divider, 1L);
>=20
>  	/* enable 16bit data access on SDBUF as default */
>  	renesas_sdhi_sdbuf_width(host, 16);
> @@ -205,7 +205,7 @@ static void renesas_sdhi_set_clock(struct tmio_mmc_ho=
st *host,
>  	}
>=20
>  	host->mmc->actual_clock =3D renesas_sdhi_clk_update(host, new_clock);
> -	clock =3D host->mmc->actual_clock / 512;
> +	clock =3D host->mmc->actual_clock / host->pdata->max_divider;
>=20
>  	/*
>  	 * Add a margin of 1/1024 rate higher to the clock rate in order @@ -11=
37,6 +1137,7 @@ int
> renesas_sdhi_probe(struct platform_device *pdev,
>  		mmc_data->max_blk_count =3D of_data->max_blk_count;
>  		mmc_data->max_segs =3D of_data->max_segs;
>  		mmc_data->clk_mask =3D of_data->clk_mask;
> +		mmc_data->max_divider =3D of_data->max_divider;
>  		dma_priv->dma_buswidth =3D of_data->dma_buswidth;
>  		host->bus_shift =3D of_data->bus_shift;
>  		/* Fallback for old DTs */
> @@ -1148,6 +1149,9 @@ int renesas_sdhi_probe(struct platform_device *pdev=
,
>  	if (!mmc_data->clk_mask)
>  		mmc_data->clk_mask =3D SDHI_CLK_MASK_DEFAULT;
>=20
> +	if (!mmc_data->max_divider)
> +		mmc_data->max_divider =3D SDHI_MAX_DIVIDER_DEFAULT;
> +

As shaskiko [1] pointed out, for non-DT platforms

+	if (mmd && !mmd->max_divider)
+		mmd->max_divider =3D SDHI_MAX_DIVIDER_DEFAULT;
+

Also replaced the hardcoded value 9 with a variable as ilog2(512)=3D9

-	for (i =3D min(9, ilog2(UINT_MAX / new_clock)); i >=3D 0; i--) {
+	for (i =3D min(ilog2(host->pdata->max_divider), ilog2(UINT_MAX / new_cloc=
k)); i >=3D 0; i--) {

[1] https://sashiko.dev/#/patchset/20260622155610.184271-1-biju.das.jz%40bp=
.renesas.com

Cheers,
Biju


>  	host->write16_hook =3D renesas_sdhi_write16_hook;
>  	host->clk_enable =3D renesas_sdhi_clk_enable;
>  	host->clk_disable =3D renesas_sdhi_clk_disable; diff --git
> a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesa=
s_sdhi_internal_dmac.c
> index 2865ec30be66..c91b910488da 100644
> --- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> +++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> @@ -103,6 +103,7 @@ static const struct renesas_sdhi_of_data of_data_rza2=
 =3D {
>  	.max_blk_count	=3D UINT_MAX / TMIO_MAX_BLK_SIZE,
>  	.max_segs	=3D 1,
>  	.clk_mask	=3D SDHI_CLK_MASK_DEFAULT,
> +	.max_divider	=3D SDHI_MAX_DIVIDER_DEFAULT,
>  };
>=20
>  static const struct renesas_sdhi_of_data of_data_rcar_gen3 =3D { @@ -121=
,6 +122,7 @@ static const struct
> renesas_sdhi_of_data of_data_rcar_gen3 =3D {
>  	.max_segs	=3D 1,
>  	.sdhi_flags	=3D SDHI_FLAG_NEED_CLKH_FALLBACK,
>  	.clk_mask	=3D SDHI_CLK_MASK_DEFAULT,
> +	.max_divider	=3D SDHI_MAX_DIVIDER_DEFAULT,
>  };
>=20
>  static const struct renesas_sdhi_of_data of_data_rcar_gen3_no_sdh_fallba=
ck =3D { @@ -138,6 +140,7 @@
> static const struct renesas_sdhi_of_data of_data_rcar_gen3_no_sdh_fallbac=
k =3D {
>  	.max_blk_count	=3D UINT_MAX / TMIO_MAX_BLK_SIZE,
>  	.max_segs	=3D 1,
>  	.clk_mask	=3D SDHI_CLK_MASK_DEFAULT,
> +	.max_divider	=3D SDHI_MAX_DIVIDER_DEFAULT,
>  };
>=20
>  static const u8 r8a7796_es13_calib_table[2][SDHI_CALIB_TABLE_MAX] =3D { =
diff --git
> a/drivers/mmc/host/renesas_sdhi_sys_dmac.c b/drivers/mmc/host/renesas_sdh=
i_sys_dmac.c
> index d1a4f65ddd91..d91b48dce8c9 100644
> --- a/drivers/mmc/host/renesas_sdhi_sys_dmac.c
> +++ b/drivers/mmc/host/renesas_sdhi_sys_dmac.c
> @@ -30,6 +30,7 @@
>  static const struct renesas_sdhi_of_data of_default_cfg =3D {
>  	.tmio_flags	=3D TMIO_MMC_HAS_IDLE_WAIT,
>  	.clk_mask	=3D SDHI_CLK_MASK_DEFAULT,
> +	.max_divider	=3D SDHI_MAX_DIVIDER_DEFAULT,
>  };
>=20
>  static const struct renesas_sdhi_of_data of_rz_compatible =3D { @@ -39,6=
 +40,7 @@ static const struct
> renesas_sdhi_of_data of_rz_compatible =3D {
>  	.capabilities	=3D MMC_CAP_SD_HIGHSPEED | MMC_CAP_SDIO_IRQ |
>  			  MMC_CAP_WAIT_WHILE_BUSY,
>  	.clk_mask	=3D SDHI_CLK_MASK_DEFAULT,
> +	.max_divider	=3D SDHI_MAX_DIVIDER_DEFAULT,
>  };
>=20
>  static const struct renesas_sdhi_of_data of_rcar_gen1_compatible =3D { @=
@ -47,6 +49,7 @@ static const
> struct renesas_sdhi_of_data of_rcar_gen1_compatible =3D {
>  			  MMC_CAP_WAIT_WHILE_BUSY,
>  	.capabilities2	=3D MMC_CAP2_NO_WRITE_PROTECT,
>  	.clk_mask	=3D SDHI_CLK_MASK_DEFAULT,
> +	.max_divider	=3D SDHI_MAX_DIVIDER_DEFAULT,
>  };
>=20
>  /* Definitions for sampling clocks */
> @@ -75,6 +78,7 @@ static const struct renesas_sdhi_of_data of_rcar_gen2_c=
ompatible =3D {
>  	.taps_num	=3D ARRAY_SIZE(rcar_gen2_scc_taps),
>  	.max_blk_count	=3D UINT_MAX / TMIO_MAX_BLK_SIZE,
>  	.clk_mask	=3D SDHI_CLK_MASK_DEFAULT,
> +	.max_divider	=3D SDHI_MAX_DIVIDER_DEFAULT,
>  };
>=20
>  static const struct of_device_id renesas_sdhi_sys_dmac_of_match[] =3D { =
diff --git
> a/include/linux/platform_data/tmio.h b/include/linux/platform_data/tmio.h
> index 76056d49f5e0..27ea21c00419 100644
> --- a/include/linux/platform_data/tmio.h
> +++ b/include/linux/platform_data/tmio.h
> @@ -62,5 +62,6 @@ struct tmio_mmc_data {
>  	unsigned int			max_blk_count;
>  	unsigned short			max_segs;
>  	u64				clk_mask;
> +	unsigned int			max_divider;
>  };
>  #endif
> --
> 2.43.0


