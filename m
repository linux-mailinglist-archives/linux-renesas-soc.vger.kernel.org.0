Return-Path: <linux-renesas-soc+bounces-29664-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AHZbM7KyuWnJMQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29664-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 20:59:46 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C602B1E9A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 20:59:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7EAC330634E9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 19:59:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15A7F3446AF;
	Tue, 17 Mar 2026 19:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="rwqf21l9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010019.outbound.protection.outlook.com [52.101.228.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63CF433FE33;
	Tue, 17 Mar 2026 19:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773777580; cv=fail; b=YLfBZwhKzgBGm0z8kIWKFVjs/VOzx6RyH1Kc0pv5oS2GREGKVXlofZNYa0BucbEmdyPH4swAlnumeSgcPXVVX61kLKzFi8fWS+VUB2ER+od/hAb/2+jQsjC0lN1p9eAySmpdXCGj9lvYejIZc7b+93Ic+IYWOE2g8GESfoDB52I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773777580; c=relaxed/simple;
	bh=2s05YhhyxLC4g+tJLp80+FCz8z/nN5f54+cbYWJ8JwY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=bapvuOoZ0K6/iIHfIekc9LQGCFDIXnPPJIvPJ73I2hsFtyQ6Yp6uTvnxnKNKEaRA1aVbbiV3u8aaVGe7RWFQbSvb3z88CbRjjVYvf871Kk+ihTKfJGxIPLyoi+YHL7/w/ceNbB67u4PUEi4uXh/YiXnB9KurSPrO7Phvvsix4N4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=rwqf21l9; arc=fail smtp.client-ip=52.101.228.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I+lBsdLhtwEuXvEz+Ku62IxO6MTaO46tP5X+fgxuN1/b1+CdxxelpQskPJAp13moRf8C4TObKejEaw70JpdkMCAJsaYte+1T/uwZbK1lDNr4PTiHX20oKSQE71jocuyB+wmaSdXqzFg/xwGSI5IUOJRFJN2meJyiVlZCroYOWMDsUA9A8XMDOYJjJhL7r9OIk1BC1MZO/7XY/l9xpnazutSw+SHdUeiuXPz7A1kkhUTT5N57DpHuRQSu/T+Zsp2lvDy4crTJmVguhtrxvzmHGxkWoQ8w/D2+85V35U7uu47pYweFcaqam3wczLrMPIH63HvGAYpmIvFd1Eww8XcaJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yWzf/SQ/a9OW61b4J4YMIC53bK3XmFkNV7QESaEgOZo=;
 b=yfezpwl7F3iqyKuOrS0/FS8FpvZ4WnMMhu6uGm1R4e2gekZrVrfKN/byK7ytWrTUfxkymz9+wb9hCl9+DjZTVLXyk3HKczsD1RnizeMQIoddbM2Atg467z7uZZExI32+ciZ3GeYAGuxH2CbqgJZbedXuXzdS0Wh1nFJE9KMeMGRIec/TE+Q5j64gT5yDS4VrWLBuqiB/K9I//IucX5ce/xaDVHJ2sYHmPEXXvshep/YOLpsbb2Txb+JneN0v9WkaeoX+0ecjnw012ymEvq4tpgeM26NL72x8cmS5mi4Q/eI48gc7zZSFFOlAG0SZb3EbOd3m6JlCuA5F+9XRNnjBzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yWzf/SQ/a9OW61b4J4YMIC53bK3XmFkNV7QESaEgOZo=;
 b=rwqf21l9aNmKZYW/+ghheAp9MDS6MwvboVOAAiVDiT90fJQ1xKgt+6KTnt9g+7yq1K7H4U83gQWrpbR6nDy2UADEEGDezx0qjiITvWqvjmB1JVgAIWmsVEVVxN5eWIUAxQu9VbkTMfsLX95ffpfq7amQEoVK07l0dLt97EdIRYE=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYCPR01MB11915.jpnprd01.prod.outlook.com (2603:1096:400:387::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Tue, 17 Mar
 2026 19:59:33 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9723.018; Tue, 17 Mar 2026
 19:59:33 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: biju.das.au <biju.das.au@gmail.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
	magnus.damm <magnus.damm@gmail.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH v4 0/9] Add support for Renesas RZ/G3L SoC and SMARC-EVK
 platform
Thread-Topic: [PATCH v4 0/9] Add support for Renesas RZ/G3L SoC and SMARC-EVK
 platform
Thread-Index: AQHctkaG049+twHo+U+dxBOWKUmfwbWzI+uA
Date: Tue, 17 Mar 2026 19:59:32 +0000
Message-ID:
 <TY3PR01MB11346876072AAF91064B2700D8641A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260317194442.468147-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260317194442.468147-1-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYCPR01MB11915:EE_
x-ms-office365-filtering-correlation-id: cfac2031-1fcd-4e98-edeb-08de845fb524
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|7416014|366016|38070700021|921020|18002099003|56012099003|22082099003;
x-microsoft-antispam-message-info:
 1SF4/VTEIC1EmVSWeEWeyLL9SXHu30sr7BKi6ooxSZ627Nv3ZQg3sLktr41eEQn3KYYEYG3IvxfoOAqRIHgGeqfYevrJtvzDTvClj4ylzApSo8pUW0Zz7fsxoRmsPQtFMzWZv3+W8u4GIXNuDafBaCfWEDeoGV6I7XDv/booCWkb9KZV+EV8JRS2ISBJYH+JkhWLU+eGf4XRzk6rJHRajJ0aaZ5anawCFUkQjXdD86GqEpoAc3QpV2vSNgSY50drbEF5Ilsv8GgHyNvkLQtmLUWb1P8cEasNJSXsVipbkxIrd9CfnAPwtm8Ms59j94by3fgszxezAFFmks0IWwdyx1lKbabjlHV6/rpQoOC4GoGlacMRWV4QuSAMqk85et+C+6PsgxQmP1HKl6pHUVjhwspi/qDr8eeUlG9DIUCUEJDZEyHslJS8qFT5w917ATAJX72VIl9Tz7LWCzF0cK7GGV7UDqf3NxP5EugpZYUbvmYsM4y9jommDQ5lJjJbbF1igwek0YzlHscm6JJFlmtZBFs5/zs0AN1H4gwBqlRyC5HzHfX/67bFkk3Ll/yfrE2SKAVmWvD9zVmZv7jrTfd2j34lDUtK1wgHjtkKdBtq258wuvSls19Cm8yv3739jiqJxzahPdovDtW5u+fCZUZmb7ZMvZsujRKXQkZngSMYLTlo6E07aUQ+jtS3JhkHSr8NjBoKO/6LP2/3Z34txxof6DjfUqQ/XvAKRpOLBLDRMLxo1Ur4ScYOc5qm4B3osjgBgn3c1DjWvKNAarMU6Gl7DA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(38070700021)(921020)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?ol1/DUv10tJ+tbARUJmDJtJoMM6hxKEUwvmlxh0rCUDDhiT0ghhkbt91CdNK?=
 =?us-ascii?Q?c7stsbc6qEVBCDwXubWHVQ/fSYth3MYKFf4+rF3QYGWHNaMHby9xJh1QabXc?=
 =?us-ascii?Q?s0vtj4RoIv/kp0fUMaPVyC+5pfGsUPKgc4mPE5ghhFO9WCQqBAR18ZhtFctV?=
 =?us-ascii?Q?a8Kcdp1Rw9pPDY1BeDO9TdimLEdyd0UJsN9WZwpEtrO+XzxA1nuhCzjJd4FC?=
 =?us-ascii?Q?Ob8QlKN+VihXiHNFvxfMyko8BZT7X7hfU8JbPa38QlFwWqkbdYStHezUO0ZQ?=
 =?us-ascii?Q?W+R1QrSh3i2y5pkoOnbXO08Qh+lpnjKuPCYzfSzdDPYjl+jSWluDBg7oNAz7?=
 =?us-ascii?Q?M6b63N/XA6nw82xPQq0hYmgcpAnuOX+NfZTlYPZHjZDCnYffkoXDzO80OSeQ?=
 =?us-ascii?Q?ldKhzgJzrlg38ZJMA7AacEfLujtSNYK142jxGY8zcILPP6ca9rD12UaeaMOO?=
 =?us-ascii?Q?KhdqzA5DBtsABWulQ98BI1L2YdSpIPO3vhrEr6qD6UDG71PDuRCcxxNDn/BL?=
 =?us-ascii?Q?UpQABjD4k9BeA7boCdIJftiPBMaa/oWAivI5STmh11hxPUWbdQO+i6OBcQdU?=
 =?us-ascii?Q?Mv+p6qKnHnbrxZEhaECW5bMrhMvb9NTc6CR8z3ERSN2w6QUn7+fIBvEVUxJS?=
 =?us-ascii?Q?otgxLJZ/47oY6MrWi0Rr6BYkFk7pGRR40yfHjxiyaqFSOa/3pVVHrosSkKbE?=
 =?us-ascii?Q?2dqaUf9IJoTDWUz36XXgLCv56eVrKPMTulAbcGLKGbTNWirkUhOwydcnzelk?=
 =?us-ascii?Q?tHdXrgwB9eEg5im+Z+orCuYYSKPVqmQIOFsC4VzWZ/6uMDp8/j/KPr93BDXa?=
 =?us-ascii?Q?uUXjLF14TuRElb3JT6Wq8M2vI6ePLYkKlq+LMphvQnESJ56IkJmX/x0M0MR/?=
 =?us-ascii?Q?KGvmQwaAGlx4a91t0qc/1EgY89e4t/fDwSH++qW3HGwZWwALEmrc3hqBxdCk?=
 =?us-ascii?Q?XiVh+ANRZe9KdJKDiA5rZebwJlhTJyYfriD2cSBSHc4D5FN5627ONOcBKdqF?=
 =?us-ascii?Q?KQWPRSbzcHfoZtPereGlUVP8o+VpnPJoFJuJqDoGH2cFkDxKaz+TKmxoQEoA?=
 =?us-ascii?Q?GxHR/CHe9U5K+O5SXKjpLJ1YGb02Yl7f74443X4A8Lvegga6PDt6PaFxUMDF?=
 =?us-ascii?Q?92aWxORGJR6HkIXnoXZB/G5n27tYW6aYbGrN+ptueGFqgTUTl2C9dRjiC+aV?=
 =?us-ascii?Q?w9mis4FAHHRwVm6EGGBCf30ZuRBvMRegTob7uT9vgRb3BG0cM2k+m9KhiH+o?=
 =?us-ascii?Q?mNFAuuY2Vp84yu2B/hDzrukO7zjRi+0vsVT6lT2Jul4G3oZi+JvG62rEBC3h?=
 =?us-ascii?Q?ok/Sa71y0G7gLp7NhE4r9IUvDrxybw6ogwsNUVS8Um1bp1vaq2tvy0z5oB3u?=
 =?us-ascii?Q?IYcmeQMChXR7d21Fizo5IIv+XB61olYyKLWhawGagX5zcTKehwa8ocE8VUbI?=
 =?us-ascii?Q?DSoWMotCA+vrCLpHesbD/s3rCovMqaxYBi9r/XFybMXz7YTiG6U96pPqg+we?=
 =?us-ascii?Q?+tyrwI744v3Tc7+yoMyduzf+dgN4pjn4DZPxAdfMsoB8jn19vIjdWRAO+IVS?=
 =?us-ascii?Q?IV8rCpVV33wTIJ51FwtAlSHWPm7lirMEQcoDezFE6++J1HxIofbnj9sNw6+9?=
 =?us-ascii?Q?ROCs4Eg329Nm/4on4onXvGtZpkxzIhqaa4BeHWTl0bpyXZ4uujLWIFGLJupl?=
 =?us-ascii?Q?FReM7c4sVJAqQOw/UqoCZ+f4dFOu6+CiP5GfJM5OZ2Dao/HdlEm/d9sOqfav?=
 =?us-ascii?Q?xpapavid4w=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: cfac2031-1fcd-4e98-edeb-08de845fb524
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2026 19:59:32.8742
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kn8jNCFd2lB1k452YpbSnXiBxBtRIV++QNeb6RGsLXc7W3ibmBWzwn9yUytF/QoX5ShEI3cOpNXAcWGdKG9+sIbtANiPVVWUwFRyjEAf2xw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11915
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-29664-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,linuxfoundation.org,kernel.org,baylibre.com,glider.be];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,gmail.com];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[TY3PR01MB11346.jpnprd01.prod.outlook.com:mid,renesas.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,bp.renesas.com:dkim]
X-Rspamd-Queue-Id: 74C602B1E9A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi All,

Please ignore this series . I missed to addresses for Patch#4. I have sent =
a new
version[1] fixing it. Sorry for the noise.

[1] https://lore.kernel.org/linux-renesas-soc/20260317195650.468330-1-biju.=
das.jz@bp.renesas.com/T/#t

Cheers,
Biju


> -----Original Message-----
> From: Biju <biju.das.au@gmail.com>
> Sent: 17 March 2026 19:44
> Subject: [PATCH v4 0/9] Add support for Renesas RZ/G3L SoC and SMARC-EVK =
platform
>=20
> From: Biju Das <biju.das.jz@bp.renesas.com>
>=20
> Hi all,
>=20
> This patch series adds initial support for the Renesas RZ/G3L SoC and RZ/=
G3L SMARC EVK platform. The
> RZ/G3L device is a general-purpose microprocessor with a quad-core CA-55,=
 single core CM-33, Mali-G31
> 3-D Graphics and other peripherals.
>=20
> Support for the below list of blocks is added in the SoC DTSI (r9a08g046.=
dtsi):
>=20
>  - EXT CLK
>  - 4X CA55
>  - SCIF
>  - CPG
>  - GIC
>  - ARMv8 Timer
>=20
> This series also adds SCIF support for the RZ/G3L SMARC EVK board (r9a08g=
046l48-smarc.dts).
>=20
> v3->v4:
>  * Dropped SoC identification patches as it is accepted for renesas-devel=
.
>  * Updated commit description related to core clocks section in the
>     hardware manual
>  * Dropped CLK_P4_DIV2 from core clocks
>  * Added MIPI_DSI_PLLCLK and USB_SCLK to core clocks
>  * Dropped LVDS_PCLK  module clock
>  * Added BSC_X_PRESET_BSC reset
>  * Moved the patch series from [1] to here as it is boot-dependent.
>  * Updated commit description
>  * Updated LAST_DT_CORE_CLK with R9A08G046_USB_SCLK
>  * Fixed typo 2->8 in dtable_4_128[].
>  * Added critical reset table r9a08g046_critical_resets[]
>  * Updated num_resets
>  * Added crit_resets and num_crit_resets to r9a08g046_cpg_info.
>  * Fixed typo R0A08G046L->R9A08G046L in commit description
>  * Dropped R9A08G046L46 from commit description
>  * Dropped unused audio_clk{1,2} andcan_clk device nodes
>  * Reordered i2c device node and updated reg entries by using lower-case
>    hexadecimal number
>  * Added placeholder in pinctrl node
>  * Dropped unused DMAC device node
>  * Added pcie node with placeholder
>  * Collected the tags.
>  * Updated commit description for patch#8
>=20
> [1] https://lore.kernel.org/all/20260306134228.871815-1-biju.das.jz@bp.re=
nesas.com/
> v2->v3:
>  * Added macros R9A08G046_ETH{0,1}_CLK_{TX,RX}_I_RMII in r9a08g046-cpg.h.
>  * Keep the tag from Conor as it is trivial change for just adding macros=
.
> v1->v2:
>  * Dropped scif bindings patch as it is accepted.
>  * Collected tags.
>  * Squashed the patch#3 and #4
>  * Documented GE3D/VCP for all SoC variants
>  * Documented external ethernet clocks as it is a clock source for MUX
>    inside CPG
>  * Updated commit description for bindings.
>  * Keep the tag from Conor as it is trivial change for adding more
>    clks.
>  * Added CLK_ETH{0,1}_TXC_TX_CLK_IN and CLK_ETH{0,1}_RXC_RX_CLK_IN clocks
>    in clk table.
>  * Dropped R9A08G046_IA55_PCLK from critical clock list.
>  * Added external clocks eth{0,1}_txc_tx_clk and eth{0,1}_rxc_rx_clk
>    in soc dtsi as it needed for cpg as it is a clock source for mux.
>  * Updated cpg node.
>  * Dropped gpio.h header from SoM dtsi.
>  * Dropped scif node as it is already included in common platform
>    file.
>=20
> Test logs:
> / #  uname -r
> 7.0.0-rc4-next-20260316-g7f7df5dd3d2a
> / # cat /proc/cpuinfo
> processor       : 0
> BogoMIPS        : 48.00
> Features        : fp asimd evtstrm aes pmull sha1 sha2 crc32 atomics fphp=
 asimdhp cpuid asimdrdm lrcpc
> dcpop asimddp
> CPU implementer : 0x41
> CPU architecture: 8
> CPU variant     : 0x2
> CPU part        : 0xd05
> CPU revision    : 0
>=20
> processor       : 1
> BogoMIPS        : 48.00
> Features        : fp asimd evtstrm aes pmull sha1 sha2 crc32 atomics fphp=
 asimdhp cpuid asimdrdm lrcpc
> dcpop asimddp
> CPU implementer : 0x41
> CPU architecture: 8
> CPU variant     : 0x2
> CPU part        : 0xd05
> CPU revision    : 0
>=20
> processor       : 2
> BogoMIPS        : 48.00
> Features        : fp asimd evtstrm aes pmull sha1 sha2 crc32 atomics fphp=
 asimdhp cpuid asimdrdm lrcpc
> dcpop asimddp
> CPU implementer : 0x41
> CPU architecture: 8
> CPU variant     : 0x2
> CPU part        : 0xd05
> CPU revision    : 0
>=20
> processor       : 3
> BogoMIPS        : 48.00
> Features        : fp asimd evtstrm aes pmull sha1 sha2 crc32 atomics fphp=
 asimdhp cpuid asimdrdm lrcpc
> dcpop asimddp
> CPU implementer : 0x41
> CPU architecture: 8
> CPU variant     : 0x2
> CPU part        : 0xd05
> CPU revision    : 0
>=20
> / # cat /proc/interrupts
>            CPU0       CPU1       CPU2       CPU3
>  11:        104        191        429         62    GICv3  27 Level     a=
rch_timer
>  14:          0          0          0          0    GICv3 418 Level     1=
00ac000.serial:rx err
>  15:          4          0          0          0    GICv3 420 Level     1=
00ac000.serial:rx full
>  16:        229          0          0          0    GICv3 421 Level     1=
00ac000.serial:tx empty
>  17:          0          0          0          0    GICv3 419 Level     1=
00ac000.serial:break
>  18:         17          0          0          0    GICv3 422 Level     1=
00ac000.serial:rx ready
> IPI0:         3         16         13         21       Rescheduling inter=
rupts
> IPI1:       315        240        180        217       Function call inte=
rrupts
> IPI2:         0          0          0          0       CPU stop interrupt=
s
> IPI3:         0          0          0          0       CPU stop NMIs
> IPI4:         0          0          0          0       Timer broadcast in=
terrupts
> IPI5:         0          0          0          0       IRQ work interrupt=
s
> IPI6:         0          0          0          0       CPU backtrace inte=
rrupts
> IPI7:         0          0          0          0       KGDB roundup inter=
rupts
> Err:          0
> / # cat /proc/meminfo
> MemTotal:        1887304 kB
> MemFree:         1852164 kB
> MemAvailable:    1819524 kB
> / # cat /sys/devices/soc0/family
> RZ/G3L
> / # cat /sys/devices/soc0/machine
> Renesas SMARC EVK version 2 based on r9a08g046l48 / # cat /sys/devices/so=
c0/soc_id
> r9a08g046
> / # cat /sys/devices/soc0/revision
> 0
> dmesg | grep r9a
> [    0.000000] Machine model: Renesas SMARC EVK version 2 based on r9a08g=
046l48
> [    0.066480] renesas-rz-sysc 11020000.system-controller: Detected Renes=
as RZ/G3L r9a08g046 Rev 0
>=20
> Biju Das (9):
>   dt-bindings: clock: Document RZ/G3L SoC
>   clk: renesas: rzg2l-cpg: Add support for critical resets
>   clk: renesas: r9a07g04{3,4}/r9a08g045-cpg: Add critical reset entries
>   clk: renesas: rzg2l-cpg: Re-enable critical module clocks during
>     resume
>   clk: renesas: Add support for RZ/G3L SoC
>   arm64: dts: renesas: Add initial DTSI for RZ/G3L SoC
>   arm64: dts: renesas: Add initial support for RZ/G3L SMARC SoM
>   arm64: dts: renesas: renesas-smarc2: Move usb3 nodes to board DTS
>   arm64: dts: renesas: Add initial device tree for RZ/G3L SMARC EVK
>     board
>=20
>  .../bindings/clock/renesas,rzg2l-cpg.yaml     |  40 +-
>  arch/arm64/boot/dts/renesas/Makefile          |   2 +
>  arch/arm64/boot/dts/renesas/r9a08g046.dtsi    | 215 +++++++++++
>  .../boot/dts/renesas/r9a08g046l48-smarc.dts   |  37 ++
>  arch/arm64/boot/dts/renesas/r9a08g046l48.dtsi |  13 +
>  .../boot/dts/renesas/r9a09g047e57-smarc.dts   |   6 +
>  .../boot/dts/renesas/renesas-smarc2.dtsi      |   8 -
>  .../boot/dts/renesas/rzg3l-smarc-som.dtsi     |  20 +
>  drivers/clk/renesas/Kconfig                   |   7 +-
>  drivers/clk/renesas/Makefile                  |   1 +
>  drivers/clk/renesas/r9a07g043-cpg.c           |   8 +
>  drivers/clk/renesas/r9a07g044-cpg.c           |  13 +
>  drivers/clk/renesas/r9a08g045-cpg.c           |   9 +
>  drivers/clk/renesas/r9a08g046-cpg.c           | 153 ++++++++
>  drivers/clk/renesas/rzg2l-cpg.c               |  80 ++++
>  drivers/clk/renesas/rzg2l-cpg.h               |   8 +
>  include/dt-bindings/clock/r9a08g046-cpg.h     | 342 ++++++++++++++++++
>  17 files changed, 948 insertions(+), 14 deletions(-)  create mode 100644
> arch/arm64/boot/dts/renesas/r9a08g046.dtsi
>  create mode 100644 arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
>  create mode 100644 arch/arm64/boot/dts/renesas/r9a08g046l48.dtsi
>  create mode 100644 arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
>  create mode 100644 drivers/clk/renesas/r9a08g046-cpg.c
>  create mode 100644 include/dt-bindings/clock/r9a08g046-cpg.h
>=20
> --
> 2.43.0


