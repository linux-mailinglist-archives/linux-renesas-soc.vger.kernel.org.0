Return-Path: <linux-renesas-soc+bounces-30756-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sHX4CTBwzmnxngYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30756-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Apr 2026 15:33:36 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 92CAD389CBC
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Apr 2026 15:33:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E0ED33078713
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Apr 2026 13:32:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBB3C306D26;
	Thu,  2 Apr 2026 13:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="Xgo1qQlI"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011013.outbound.protection.outlook.com [52.101.125.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72E7915539A;
	Thu,  2 Apr 2026 13:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775136755; cv=fail; b=hmcKlVB7sinXNPx6ukPDX81i2MSMCXfhoZ+KO7IDYEWLsHZ+C5YOQInz7jDPM8lG7pOYJIMEfKgozEPpU8M9cNeQ3kCGKUNukGvi9bFkLsH2m7bYAucik1qVrVTJbo1Ki5hw8+I+a2kJI75YzJEXKqT89dGPijkRRD3Zm1iNwFY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775136755; c=relaxed/simple;
	bh=V3jASK88xgrT0jvOc0oVpzVvzEoEuq/laNxVB3yFkR8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=R+P+9laPhlzjY6XPEOnwFMgEUzflRJ46lLblJehXFXUyFvIkiG5/5ywcFDSVUfVdUIHyKBCMFYN2G5DjCBQGna1FFDV3qM0xRSMPPp7FVXvFwQOFt//2zCV0pQ+n7JAGGMwVvuWRc4ONAGDZitIFgZYXcjIY35GHmX33yHqsam0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=Xgo1qQlI; arc=fail smtp.client-ip=52.101.125.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lEhiOoOfNhdh2qDbffQaEl3CdBH99djfa5IUleP3O8sKShvUgvRRyn0MfNR6wY44QYJ+3cf14voCfILkZZ9chIletlBOC1h6j/UT+LCih0E+4b4na8rmYQl9DEH27LazxFmB0VpWwLFNqxtyZAnnZRKyW07WHMEy1gJNiiJ2WMoMwbF5ThgniKNiUk6KcosyqdLSkqAhS+eyFlaErKtToH4/Ov7lMMoQzM0exb0slZTiV3sa9c/k1j5WA2Q+3QaukDHQCmKLMWAV34XZ+N73iz32GTELXa78EUV58fPM1A1Ul8EfMm+bB1FC8t9HUGf/YZNxxVfAejYptaO8xP9nqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e6TrFKEufL/2P3myskBsoEcaKuWLVz6x+oOz1axpEv0=;
 b=SMMqVWWqzYgP4mJGXwWLiwl0qasJ6amW9GJuy2McK2uS+Mdp7PMpcv+QMmFND3jogvZ5VhvgnUGSk5lAIwpHdXanvB5mckNbdGKvr5uPfqqfWO0Zx7ifokHmNtrtlN3xEe1mdxDh1XV+snKSOsAi5OHJ5qRLqz7/F1StNDD14ALXe+b/+yfG3Kk3zCEY7rhXXwoC2SzJOgcyABT0/QdSDI2mGnOY+/GFJ+KusISlIaCfgGGrGBYJJDCla46V9VxyNM0/H/l8eboxNaKmIble+R+o0O7+JChAm2BzwnJy7484jTtOIV0BfrRKbZOcK8AlrlMHMKUU7LsNPg2Pv+NVlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e6TrFKEufL/2P3myskBsoEcaKuWLVz6x+oOz1axpEv0=;
 b=Xgo1qQlIYAqjYYrWtpJjbu/bWJM77CH50qEJaX7HmjX0lkVfaX4nochrLqa9XQUMPbqQ6/s7kuqN9C6+J27FO1gZIqm81UxDhc/8X00n41LLdchtD0m07k6Oj3tAT/h+sLPSQrQY++JBmub5fGL1kv7RInt3RTr2AdZxedzkuXQ=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYCPR01MB8344.jpnprd01.prod.outlook.com (2603:1096:400:151::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Thu, 2 Apr
 2026 13:32:30 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9769.017; Thu, 2 Apr 2026
 13:32:30 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Mark Brown <broonie@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
CC: biju.das.au <biju.das.au@gmail.com>, Fabrizio Castro
	<fabrizio.castro.jz@renesas.com>, Rob Herring <robh@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
	magnus.damm <magnus.damm@gmail.com>, "linux-spi@vger.kernel.org"
	<linux-spi@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH 0/2] Add Renesas RZ/G3L RSPI support
Thread-Topic: [PATCH 0/2] Add Renesas RZ/G3L RSPI support
Thread-Index: AQHcq6tn0LK2JKDugkSgDHRkkiWo8rXL6eUQgAAFrwCAAAA7cA==
Date: Thu, 2 Apr 2026 13:32:29 +0000
Message-ID:
 <TY3PR01MB11346472F87787030828ACFFE8651A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260304074907.9697-1-biju.das.jz@bp.renesas.com>
 <TY3PR01MB1134614237922A87C70AA685C8651A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <f6fd2e18-d5f8-40fe-a4d2-7894bd232da7@sirena.org.uk>
In-Reply-To: <f6fd2e18-d5f8-40fe-a4d2-7894bd232da7@sirena.org.uk>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYCPR01MB8344:EE_
x-ms-office365-filtering-correlation-id: 2067984f-dc0a-4484-1b34-08de90bc49df
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700021|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 ZNiEPBkrHfU7hraw3KkpFPVurK0KZamGQXFZighn7dClX2u8AlDmqRvHzEORXg25g/Kq6p6RgYKjJ2MeVJJ+TtmgZzmsha1LzPbnQZzfKU68TYwhC5B764Zf+eU2Q5f18QWGM2wLuhmK0ji51iXbwzSfuYcU6gy3SPfs46xOmkAlI7UisAwat5jwpCIq/+6YmfQbp6BO8p0HYRqqRyzPLeFucRw5nAou96sFwrIVfLoUs+bSLcLJYGm6Xg+oOoU1OHj0JxwmeppHhdO6zSkRfjSYIU1xNs1vohmitnXPX8Ny5uS/z55bl44CTF+GSPBbnmYhJjppFR+k5DzvMuvGW4jLrbAfSB8fUDSvhRNqlBqVbW/eZhl/go9q0SSSos7WTN40kSVvP1KgBDZaw9metRrq7qX2blhC7UDi0UDJshrz3OEIO2dF0ORk8Vbhq/Qdy0GI8I9/xWXuw9LouBxzpzcJ7Z55shs14kpZ5dabxwpWJzPSfvVGkLEU7XQXpu2emkZi1QYG6Mq05gZi1H17HhTxHbDQc1fqbf0VLh8WSIIF0M2JOkznh+9e/uGWBJlk3vXt23DCZTAwee3fnKhfx+ZhS08tDC+agAZepcnWixLAhGQA1t3O35SU7C6ghSOcW7jb8TyRpS16gHcDmsuJhe3TJLi4Db6pjOpKSwlcx8OwCf/8tR34p+LmR2Dmy4hkSB0zzHL0NICCYxzsnzRgiezBZkrz4nStuySi1FaWt0kpCv7Yso1x48OX3/vxAqqg
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700021)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?8BjwDx9haM8kF3uYiFh7PQ6dXH6gUKNwwfnIeN3KKt4p0rXUsQTzCUWitDgG?=
 =?us-ascii?Q?0d+cmjO1R7TlslvBG+hIEr5CWnBGaR5Z4HyuaDpXs25GPP5trnbQARrVCWoG?=
 =?us-ascii?Q?zzk662UJUDUzP1AcO7wTKqFFP5rYkP2VQpHS2R7ojaEURAEZophCd4LrA2ly?=
 =?us-ascii?Q?JzIz95znOb3zQuhaOumuKU7rYjjjnZeGIxJHxLL/QV2UMvTDO+waOgTVdIP5?=
 =?us-ascii?Q?53Iq2OvuArq4W+01xsNDrvqfwYc1yoyP8WVAZZulNxcs2OeCubcBjwXG929S?=
 =?us-ascii?Q?AGzjJLDeUC5XkRC8bz73aKRTOwCQqRdP03MuIyP4vuxV07R0fB0g1ZJ9l1tX?=
 =?us-ascii?Q?ySJboTYnQK+fFqW4vjCCVswjxsMdyNJ49KbL+naSk4xR9cNSwA/y610n7/VP?=
 =?us-ascii?Q?I31tlrvyBl0LxScLD6QJyFaMs6/MBkHSQiRDo7qF9gRHliQrh0GvzTq7DJmP?=
 =?us-ascii?Q?8pagIFFkj+giHpkT38zNngQFmazfo791i/MAKRzk/gYeJlJNFh70h2r/M6sF?=
 =?us-ascii?Q?STlWZvh1Jxi7MEeCS8WhYGqTd3tlF/vbp2QLygapByMmVYsSDW7MOwXNgsQz?=
 =?us-ascii?Q?j0q2vh18W4Gk41TxjM3iTuFCYsv85sq6cbZu2vEN9dp1JKGxpGFnrQJHOrjd?=
 =?us-ascii?Q?Z7Cqj2KtrE6ctWn4SIs4OiXATop28gaM/5cR1ASDCPrl48vW3UXZTU3XH1ha?=
 =?us-ascii?Q?TCT/vhycQpJkpkEL4cwQlGcOjVOhiHbWjIqcIMzUl245/pCI/CsIWH+QQcO+?=
 =?us-ascii?Q?eF0h9TgXf9Sf1px9sQ3dN08tJFCRGY1AilozwAKz74iXV9xMTyn/ht0VE+48?=
 =?us-ascii?Q?klKwxw6uGGaAIrhB2ddEv3p6dTcGCZRG/FelZNK4hkprrYkcyirXlAh7F2jI?=
 =?us-ascii?Q?hZ7v7xCwa4lZ/vXGxh+pFF1u8BTY2gjSDfOkpae9p0GxTAwY0bKzFfjbNnD/?=
 =?us-ascii?Q?x5WbxJWtZRxwEwZQ3w7qUoI0eesksPY4UlGg1Hrvjbimctaf7pqwDCLK/sIQ?=
 =?us-ascii?Q?aztL9VatOTk9uoI2IhOx5A6K55YkyWNoOdh6Tycde8L5KXP03N1X03mAh1IW?=
 =?us-ascii?Q?8acnntt5tXQXXEmV5LoGIj+JnqwpdU+Mv40lTMrj54YUzBVjIXm+db85oxr2?=
 =?us-ascii?Q?dutLJyqQi4+8ZRXFFC7U+q0W5mn50iitT4c8CdNI14Qlaz2/ihJQ6g9UmCTt?=
 =?us-ascii?Q?O2nBA0Kz30Umo4cNAuE9tx67GQsmMyPdbwyMSqro9ule/rAaiK8Zgu+zAF24?=
 =?us-ascii?Q?1crvQaPeldiF6g5xrOQvU9TesOwcWo2zlJOkdvXr2nQ4ajl6ivh9WXE9dIw3?=
 =?us-ascii?Q?YA6F6U4aJkMQgw/vbWqo0rqgCOyVn143fO2Vfd9aB66KUmkm36l0JI4mIgJC?=
 =?us-ascii?Q?JOO60CH6BbvXSQuv3twb88LlmtwxTOFr2Y28S7Fo5eBHkZfPg+dduv9YVWMx?=
 =?us-ascii?Q?Rg5Dyr/QyEIhup42l9T8MLPFZRNmxdwr+wLoGGsj2IxVmfuR+XpU41N6IXDW?=
 =?us-ascii?Q?V7SZW72SywjtQ8JpZUTRkmmaNLOTTtirD+bLS/YOeSCFHYpD/iN8F0oVpeMh?=
 =?us-ascii?Q?2lPSDGzYMtRZKzc+HHwduUKLxHBo5ydpMm47zphUo5Ql2DYFc8BZv5FJVwQ5?=
 =?us-ascii?Q?sRlyIjIPqqBU2D2uwzXqfC0V4VhgB865g+kFqPUzSocCqyz1a3Zn5KyB8BWL?=
 =?us-ascii?Q?MGipIvhfKvsZXzTY1xT5rhu7aLwJH4LKW0FjG32tkxWjS3vUxer97Xs+UT9r?=
 =?us-ascii?Q?+Kdd9GMnYw=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 2067984f-dc0a-4484-1b34-08de90bc49df
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Apr 2026 13:32:30.0147
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SF59ZFVthjyJyg7gNBbrLOkNezX0khxv4AE8x0vqTjMq2dN3BthTWlvPIzCRfFtmSpROe/iYvVloJhsFosd237wmZea9XaQ7OpVuI9gGYY0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8344
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30756-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,renesas.com,kernel.org,glider.be,vger.kernel.org,bp.renesas.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-0.999];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[TY3PR01MB11346.jpnprd01.prod.outlook.com:mid,bp.renesas.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 92CAD389CBC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Mark Brown,

Thanks for the feedback

> -----Original Message-----
> From: Mark Brown <broonie@kernel.org>
> Sent: 02 April 2026 14:20
> Subject: Re: [PATCH 0/2] Add Renesas RZ/G3L RSPI support
>=20
> On Thu, Apr 02, 2026 at 01:00:28PM +0000, Biju Das wrote:
>=20
> > Gentle ping.
>=20
> There's strongly negative feedback from Krzysztof...

I believe Krzysztof is complaining about patch [1] and his
comments were addressed in [2].

>=20
> Please don't send content free pings and please allow a reasonable time f=
or review.  People get busy,
> go on holiday, attend conferences and so on so unless there is some reaso=
n for urgency (like critical
> bug fixes) please allow at least a couple of weeks for review.  If there =
have been review comments then
> people may be waiting for those to be addressed.
>=20
> Sending content free pings adds to the mail volume (if they are seen at
> all) which is often the problem and since they can't be reviewed directly=
 if something has gone wrong
> you'll have to resend the patches anyway, so sending again is generally a=
 better approach though there
> are some other maintainers who like them - if in doubt look at how patche=
s for the subsystem are
> normally handled.

There is no pending points, everything addressed in [2]. that is the reason=
 for
sending gentle reminder.

if Krzysztof has any comments related to [3], I am happy to address.


[1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/com=
mit/Documentation/devicetree/bindings/spi/renesas,rzv2h-rspi.yaml?h=3Dnext-=
20260401&id=3D4d28f38f64ef69ab27839069ef3346c3c878d137

[2] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/com=
mit/Documentation/devicetree/bindings/spi/renesas,rzv2h-rspi.yaml?h=3Dnext-=
20260401&id=3Dc2edd7841f58cf228347b91256f0d9efcc1a1f50

[3] https://lore.kernel.org/all/20260304074907.9697-2-biju.das.jz@bp.renesa=
s.com/


Cheers,
Biju


