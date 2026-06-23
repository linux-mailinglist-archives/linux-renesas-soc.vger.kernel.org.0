Return-Path: <linux-renesas-soc+bounces-34375-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bAFeMzCqOmpXDAgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34375-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Jun 2026 17:45:52 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C0D6B8691
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Jun 2026 17:45:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b=pTCfA+8G;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34375-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34375-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=renesas.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D77C43010CF5
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Jun 2026 15:45:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F006274FE3;
	Tue, 23 Jun 2026 15:45:47 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011026.outbound.protection.outlook.com [40.107.74.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAD0821255A;
	Tue, 23 Jun 2026 15:45:45 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782229547; cv=fail; b=oii1xex5XcDWxSipwMQtO+4tjxmHXqlRk1egrZrCgA90d+1ryYlwvQyDF1hD2dhi9KVlu3gS5OSH0x+l90RhnBQAmZaXCScKdeHizmf5AggC41yqfhQEQHKAO27muT60kMUM9SaYi4oQvKRSjO30d0chhTIO6EHQHFYsCyqcrZI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782229547; c=relaxed/simple;
	bh=gXR6Sh5d+j0RqxkY9N2bdng7Sf6iGnGQO+m07Htutf0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=BX/fHDu5uJZXsBALY9OWhmBrPzZLF3UJG8XAC7AHioaLouUoNtoYwiw/4HUdqS/lDZvQxUYD9AnvZno4kaJiNrLA5nG0Gd0Szq8VQrDru8YIOHuhyp8h/GfUmWvbqr55DBV7l4dkOW4zUjTkUA+ORxg/2l/LOgBMrVe2QpTOAaY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=pTCfA+8G; arc=fail smtp.client-ip=40.107.74.26
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MN202EXD9CjWFZJmznHf0SHRciTEUWxN03DKxSzXRCXRD0HZdp9dFZ+EaSRt1go8YSAgdpUH3c9CYMkxiTaUuJGPgJQSY+iz2SUicHTU0MCyv1OxCtI38XfjAkC6uMjhy8BiURrmNQRlpml6kx8xibMRjwW/fvhoJdyozDxZOoVTVcGDJMdOEuv4nz6qS6ScsJUEKYe4+8riP9p80lJoTUYrf+k6OE/FlLkLVj9C11cb3OI2850J/0SI8MG92lr4gNsNDlB+XAUUYlUttfr7X2Mxzg0TslVcvFbCraLjjZ5H8I0gLC3Nk9rvF3CDkTd5GJjXSN9Zmme6xU1uXnuRig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UVt7YNzQbhSYqY371BH0xlyeGL1x7Bg1kKb9zoFenXE=;
 b=Rs4Sicwfb7fb8wBb+ZxCKcpveQ55Xvp1YPngWpqPapvOMoB64XuFHhnGgZhaDswrYQrw6VPobmVbFvHNGj8p56slV7bC+bzdZGIIqQsV5NRRQCqzNjgBuBCnkZqwoJ4bP20Lh2/l3erqsHxvBChip/CnWlnZrnJDg2DINrez0TsSBCIB0ozewLXSiHSde1crRlbmg/L/eb5dwg/zMF5zt9Jnp9OUmNGcR1T6uBMw4LmyI1bVQse+NBhEpLhQ94yubmmjUFodUMnYHo00LY6+xXYoDsQByYzTqrTyMwBCwNL+S7TH5Bvf8krQyKgZwKCSiJvdMgV4m35929tZTrf3/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UVt7YNzQbhSYqY371BH0xlyeGL1x7Bg1kKb9zoFenXE=;
 b=pTCfA+8Gt19BxcaWdnqWSzHhkyBmeTBFUaIUMrgIkaJxUKLWgRfWsHmUjMGmp3gzsd9TT8u+CQezOrqBjS5y7bn5SdajuIrYj50ycNLeTOoug1XMyZUGNM44iOD6rJvWTDg0fxMdgB/dvImcPQv4ZpzHKRPixwfbnbJYPiy8A/U=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYWPR01MB8347.jpnprd01.prod.outlook.com (2603:1096:400:160::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.13; Tue, 23 Jun
 2026 15:45:43 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.21.0159.007; Tue, 23 Jun 2026
 15:45:43 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Brian Masney <bmasney@redhat.com>, Geert Uytterhoeven
	<geert+renesas@glider.be>, biju.das.au <biju.das.au@gmail.com>
CC: magnus.damm <magnus.damm@gmail.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH] MAINTAINERS: Add entries for Renesas Versaclock {3,7}
 clock drivers
Thread-Topic: [PATCH] MAINTAINERS: Add entries for Renesas Versaclock {3,7}
 clock drivers
Thread-Index: AQHcHnI8YiXEV8nnI0CNMKkuqNWmqbZN+lkAgAAXKSA=
Date: Tue, 23 Jun 2026 15:45:43 +0000
Message-ID:
 <TY3PR01MB113468D638026EC76C787C5AB86EE2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250905143441.7082-1-biju.das.jz@bp.renesas.com>
 <ajqWevofEJ3fv856@redhat.com>
In-Reply-To: <ajqWevofEJ3fv856@redhat.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYWPR01MB8347:EE_
x-ms-office365-filtering-correlation-id: c5d758bb-f735-47a9-96d1-08ded13e7c03
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|38070700021|22082099003|18002099003|11063799006|56012099006|4143699003;
x-microsoft-antispam-message-info:
 GVN0iRExZ9MduMzNwQt9yjhSM3/PpRh+P2wWsLKTfupSO+PDT3GQ+6z4GWfsqk9yegiIYFGARlOqb4jjO5b/Rp/EZ3gtBjYytKp0G34a/vXOLSbZUyj2zCEZssrjVlmrTX2e7bKfHshbDZ08imxQd3/KuIsU2YzffjZf88WGlKmpTDP1DlKUPPB5YkD682gH88aAbKXfhf+5fyfI2kfoUx8Su/Mrgycm9GwYiRxu8RManIom+pZfjAL8PfhE2hPSFGB7jubyMspoFjqL5m/2ZVFY8i5Elp7ez+eXFTe6gyLE+AmkILSBojYUoup1AMCxFvHirQjKiq1/wHWdlQ750/1Di1Ybylpy7abpM4ACfKJlcwWPB7f9pwYmG2daZcj8KWr6wyCQIt/OP/AUoax80xQ9xS9HZ+x2I5S0cm7UY6CEpS6QynTX2MRpQ6zPZC92Spq4IVVt9rU2iecfZU7d+GVIoN5dumTPw4YhfDkxkztRdaI4t3O80zp0IRgD+KPsxBFPidQBxWAjd2Dcg1dd3Zlm2SZObUNAmGil4HP8cPeZ0X1eD9fW0Tc8EbNQ1dHOkEUNVK3hcyTFLUPEBMfII7kkI1FzA6ED2uJymcHf83Z7vvw8ovHl/rXMlpnCHPX1m+sZlVuLjDurr+jWh7itroj5EwB2nMcDK32lSzP2Uqh3IZj3jjrvnho2jLtipI8awh4uI7AUgdmDfjbCz3zTs2H09ItKol44z2Rivk1lsGA=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(38070700021)(22082099003)(18002099003)(11063799006)(56012099006)(4143699003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?7ZuZUuvip+sfmYOxsdtMBAej/OrgZK9BKkyC4s4mD3wk8oqMFCTSRX4eiFI0?=
 =?us-ascii?Q?sx+BMLVp/hwnfla1l+CBavsQu0AyLXfCHKB+rLkg9ZEG9zHYPWZukt6n0zU1?=
 =?us-ascii?Q?4r2mWC7xsa+pucKDeiZXesodIx0IOqTfUrsh59ON+PCWuBvonHBE5rudR7hy?=
 =?us-ascii?Q?IiKeHWIq4riKUIvEjdA63ElNe2k3QLLw80ehc7EBdrcWPRnULF/oSWnTN63v?=
 =?us-ascii?Q?uwOeiSRVMiO8txx1htbRbFN+lfK5b84Z8mTsVGXIN1yHxumfwzBDYoeY47vO?=
 =?us-ascii?Q?3FW5pFsYvNgmhRZvnL8KV/e2cKc+2o0779JUQ7W4xe71KSkWt9L8jmcvyHa8?=
 =?us-ascii?Q?3DK7JYdjMhEgFGD6deNFpmuPxkSSRNJAjTKGZoWLRGNr32+DmpHuPNtDP+W9?=
 =?us-ascii?Q?dnw9do0Z9MzPTDVHmH5L2SDTYdlovzwoF8PNHx89NFj+rne7tVQuCo5M5Bt6?=
 =?us-ascii?Q?gtqUmw32g9XXa05W7FwodHHeeM8WtmC8lgATfzMmaLbzNWJQmBqhvIMlkIfd?=
 =?us-ascii?Q?KWASUMdwv71+1wBNHSvwLSknvo7O9vcaTgOf+jn17l+WsPKDIK7jFz8p/5r2?=
 =?us-ascii?Q?0ciLEOoAEHJtRZ3zIP9r7hk4A8puyvmfN+A5mYntpK2zfA7avD5r+DWM2Hl1?=
 =?us-ascii?Q?fVU7SqSPxQoGiXWr/7ituKJ6IivOPYWPkFAHFGrKV/jvz59s5rG+1R2h319u?=
 =?us-ascii?Q?itOokUdIUACtwThLema7Y+k5tykguQ4Wl9iWoIOh6XUf4rlM5iNm1TDwBZys?=
 =?us-ascii?Q?9bR4g8UG61Cw7VZzgoSOdpaTtz7BaH9xbCfjoJm4uqBNwANU+ouv1je6aCYi?=
 =?us-ascii?Q?4hsI1YDPb5yCpejZX2HAxGEg/EsKAsATjd58Vkgt9QUvUEc9OILLDGfUkTEV?=
 =?us-ascii?Q?lkbyYeHvEmRUSTZAHT1PJ2DQZQBVx1PoAzfHY7hDtgl0mufUSlD+vIM1Wtsw?=
 =?us-ascii?Q?vA9EE4w3P0VuL5xNrcqmghS4BUGYsvwE5zdIp3BEbJSnbTY62czMe/wIPlqZ?=
 =?us-ascii?Q?2phcnglgqEwrIs6fAAK2tnX7QgcOhYsp5qybPqgQTdU8izm6ihtOc9tYsIFw?=
 =?us-ascii?Q?kXnWEnD0OKSQiHy77XDqW9ktwoeg8z3Bq/XWGFenalrql3uexGQ/uPEc0nE+?=
 =?us-ascii?Q?8HnHacoS0eWNXDuqxCrqBh+pBFZekB7Bgsh2ccLVQa1LzstAnlqeGueKZn6z?=
 =?us-ascii?Q?0sG0dH6/4DeSEYqRgeMz+tqQ97ZU3oBdl6ry8PVeXHn65qgtm4UuNoi2PwKf?=
 =?us-ascii?Q?iC9sIFmwKaLjBMuM1Fgo3YUF3llU0ubWmjPOA8j88M8Db5wgrB8VhTbSDtRK?=
 =?us-ascii?Q?Zx8f+yAhnCCUBWz1vNHECTE+KF+W3Ty/HUX/boO8gBaCOLKR8ffTYa5cI5/9?=
 =?us-ascii?Q?CvSu2fDW3c2hzGdV4xHeG05GfoflbC47BK4eaJ0OoEf8h6JQExC9m+g2ebRA?=
 =?us-ascii?Q?46eU68taR2PZnecYG4DjdQNO5OoCfEWXf9t+oeaXrC6Vl17EhG8Lop9EtbDH?=
 =?us-ascii?Q?gRkUAZVDDciVS3LrHJ1WX5O9JNzTvEfqbbKqPhH18zPWu8oOLySdzxrWXMdI?=
 =?us-ascii?Q?9fZQGmWJi52KGjvXZ94rlA0XMtYlrhp74kwupN2Gu+8+i2SGPTgXM8jCEHEW?=
 =?us-ascii?Q?oV3cveLky5BDO2DeQLxBLl9QI5IMTrlR8pmnTg4Uo5Mwz/IO9ne9rGdLYPNx?=
 =?us-ascii?Q?mjMLOfg6OBDfchV57QKY8PN1ql3waR99J77JU4INqZ5B+IvAIOLIiYr1YC8o?=
 =?us-ascii?Q?C19KVqbvbQ=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: c5d758bb-f735-47a9-96d1-08ded13e7c03
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jun 2026 15:45:43.1617
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z3tFHBV6X6r7WUALAebxOhgoFv+fP2+eZ/2YzvqZyamVImBZ4E78YOMk8fbR/ZqdTJwhZF/t854pfX/aRXMWt9fhaiIiWoQGi4hW30doEdM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8347
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34375-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[redhat.com,glider.be,gmail.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bmasney@redhat.com,m:geert+renesas@glider.be,m:biju.das.au@gmail.com,m:magnus.damm@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:geert@glider.be,m:bijudasau@gmail.com,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,bp.renesas.com];
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
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,bp.renesas.com:dkim,bp.renesas.com:from_mime,vger.kernel.org:from_smtp,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B8C0D6B8691

Hi Brian Masney,

Thanks for the feedback.

> -----Original Message-----
> From: Brian Masney <bmasney@redhat.com>
> Sent: 23 June 2026 15:22
> Subject: Re: [PATCH] MAINTAINERS: Add entries for Renesas Versaclock {3,7=
} clock drivers
>=20
> Hi Geert and Biju,
>=20
> On Fri, Sep 05, 2025 at 03:34:38PM +0100, Biju wrote:
> > From: Biju Das <biju.das.jz@bp.renesas.com>
> >
> > Add entries for Renesas versaclock 3 clock driver. While at it add
> > myself as maintainer for versaclock 7 clock driver as Alex's email
> > address bounces.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
> >  MAINTAINERS | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS index
> > b13848dade9e..7a7478305bf1 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -21704,10 +21704,12 @@ L:	linux-renesas-soc@vger.kernel.org
> >  S:	Maintained
> >  F:	drivers/phy/renesas/phy-rcar-gen3-usb*.c
> >
> > -RENESAS VERSACLOCK 7 CLOCK DRIVER
> > -M:	Alex Helms <alexander.helms.jy@renesas.com>
> > +RENESAS VERSACLOCK 3 and VERSACLOCK 7 CLOCK DRIVER
> > +M:	Biju Das <biju.das.jz@bp.renesas.com>
> >  S:	Maintained
> > +F:	Documentation/devicetree/bindings/clock/renesas,5p35023.yaml
> >  F:	Documentation/devicetree/bindings/clock/renesas,versaclock7.yaml
> > +F:	drivers/clk/clk-versaclock3.c
> >  F:	drivers/clk/clk-versaclock7.c
>=20
> It looks like this patch wasn't picked up last year. I got another bounce=
 from Alex's email address.
>=20
> Geert: Can you pick up this patch?
>=20
> Biju: I see that
> Documentation/devicetree/bindings/clock/renesas,versaclock7.yaml also nee=
ds to have it's maintainers
> updated.

OK, I will send a patch for updating binding as well.

Cheers,
Biju

