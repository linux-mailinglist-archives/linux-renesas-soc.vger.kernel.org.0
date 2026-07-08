Return-Path: <linux-renesas-soc+bounces-34906-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SE8gNhSITmr7OgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34906-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Jul 2026 19:25:40 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D167D72929D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Jul 2026 19:25:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b=IIqV7SjG;
	dmarc=pass (policy=none) header.from=renesas.com;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34906-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34906-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1F95030657B1
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Jul 2026 17:15:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C77E4C77CB;
	Wed,  8 Jul 2026 17:12:51 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010042.outbound.protection.outlook.com [52.101.229.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2096E4C6F0A;
	Wed,  8 Jul 2026 17:12:49 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783530771; cv=fail; b=GnuZfHpRsd0pO1l06j8Wr0XxK6RZoW/3B86YsFxiE/1+rMaXQbpW4LwOzVdY43ziFzH7Xy58EpYHDULOxuQlWmFVQUlmv1NxAq2FKUaiRrMelo6NcL9pu4d5axiC+8Uc0ebU0upCEFfdYfpPZLyLrUZq7eC05BOTpUPHlrnqYWc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783530771; c=relaxed/simple;
	bh=6g2L5FF1YiK6+rozXi8pN9Zwshv8xgreFsBUlCAb4z4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=SMMEOTJaZ52vTjhFy3oUZIsjkYYwbvr4hBWoGjuVNP+/IxyDJvmr7yegjsXVkZMPSt6mGNHoCgiIwXxCue9jsOQy00B5urnBJ+IyfvgQJrxwTshKFc2NuauproPMUycf4hSbJLkX9gAetcPFbYWzhByoMlfpKRU8mNZ2ZzHD2dw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=IIqV7SjG; arc=fail smtp.client-ip=52.101.229.42
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iooXtNtJOosotWK+Qos5gA5GIZJ13xScGmVQsXGtu9QBsCn4dwiVwz+camg2qJ8ohn9ZpIFvV2S+oIi4gKEgbJXrdEAmmiC/ivBL933J/AlxM3oKY39Cb7UujPLKe1FcU8xEAebKwbkta6O57obBZEyxE6kaGY3Y+qd0RNEyQh0VpKnYXhfSIab99Cs9nxWZSAsgbg6F5MrIsXeAElMs7akOUWRuHeSEUBFYWRjfFZutz+7odecOBc1RCF/Nz3ojY5GEVORNOPT3z44szCyt8guNa1GqiLMRyNo+y6nBNoBYQrwtDLEyKym97ETPsDOJtpDKdJKhtaBR5gyxEW13sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X8Qr6kAty4ZZ66Q3iSz8klv43NA0xxpPjPml3r08EXw=;
 b=gt57h44QjWpdffMf/EKUtfj0KduwvPHNoo0VhnAgKTfwe3fPvttozSsxmaUcJfGUP75Du590vHvQ43ZPq1+NcbqRj5TU2tR09X2/5YnO9ej2j7cTy+de5BYWiU8pnmlDTeZj9VJl6f64XVzYDtQA31KD9AU0AK98IkcO5S1gJs8GcnP3nE+pD54E6fYfdfcl1ZNZLxdorYrMk1WLuyK7ijvyohO7RmGoUQ9dvUtE3TyaznXIFEKMpbJWfmyGv1BmPwkDH4Nwc1D5St5IcCvF6yUF6Yx7Fncvr83i3hPYhOe0/DT4RHBRYiEfVA7Z9W9BMPQ2dFxHldCgj+/puIx6mQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X8Qr6kAty4ZZ66Q3iSz8klv43NA0xxpPjPml3r08EXw=;
 b=IIqV7SjGIETqfdQ9DrYdsdv6oOR+nUpBfYtbx6rh/WHQ5ssHvAW1jJVU957YcRD7vp63rJu7Z+zYJpr2rcc8NWp+1DGhrK6TZ0fXQiKAK8xNdAxgfuWZ5M6CRQhm5uZgGOGzUR/jid+x5Uh/EMvKz4WJdytl3cMsL67SfrKOyZY=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYWPR01MB8411.jpnprd01.prod.outlook.com (2603:1096:400:176::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Wed, 8 Jul
 2026 17:12:43 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.21.0181.009; Wed, 8 Jul 2026
 17:12:43 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
CC: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
	<mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
	magnus.damm <magnus.damm@gmail.com>, Laurent Pinchart
	<laurent.pinchart+renesas@ideasonboard.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Prabhakar
 Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH 07/16] dt-bindings: display: renesas,rzg2l-du: Document
 RZ/G3L SoC
Thread-Topic: [PATCH 07/16] dt-bindings: display: renesas,rzg2l-du: Document
 RZ/G3L SoC
Thread-Index: AQHdC5hYbvmOFVdH5ke7RqO86JVq3rZj2zoAgAAHPvA=
Date: Wed, 8 Jul 2026 17:12:43 +0000
Message-ID:
 <TY3PR01MB113463076F1F6FF83135C7F3986FF2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260704093433.273672-1-biju.das.jz@bp.renesas.com>
 <20260704093433.273672-8-biju.das.jz@bp.renesas.com>
 <ak5-tIYnLmHps4M4@tom-desktop>
In-Reply-To: <ak5-tIYnLmHps4M4@tom-desktop>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYWPR01MB8411:EE_
x-ms-office365-filtering-correlation-id: 0ff9131d-f6a7-4038-896e-08dedd141f9b
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|23010399003|366016|56012099006|18002099003|22082099003|4143699003|11063799006|3023799007|38070700021;
x-microsoft-antispam-message-info:
 Mc95yRIMW957C+CnoXI+2euWlo3pv7vCSmOTvqzT7nxBjOR6Y+idLcgQLo7YsAWR9DdHDI+EP92XSfU5vFJJuaWWeh1qpBMJ/OXDqAFOGzl1e2GLaqXHBIL93Ga1UZ4JouaPcH6/e+qOxwrta3Qd1YPYm3O763L2oa+EEDdA/yudU4x/AIYf7E2FLPlu3s6gbZaOTUpu2eSsvDY4YRhk8KZKkIYrYN3zMJnGYR6DBYz1Ja3aTTTNfnFPI0zW1f2jHX0aLkVp8vssowLwlU7tYPe/zgRREKJrbLuctAcLJxrDQ5Sylcl65HBXICjyEXpXSXlraMkKtqRSBN/k+qpbFMb3L/UNqNSxzVk5poAJvN9XxNu55hHVDSECD69JDS35j/Ey3XQ++U3p0hLi+5Fsb9L+7DKrriqdq+y5vya8lrlaxFoSZ5I5SZjichOM48jAHYezvD63d60zpXwhskkMhLlpnpU+ERC8fKfMnWBXrrmRuChPL75YiZFjSFZN5+p4JN/YnpYVA6bytYxiy6o27uMzTwoTWKR7EV3mFhKP1bNsFv5/YnkmhtRLbmu7ZAPVoYN47SjZbXkQue1ngXc9jQ1aalYO66gZUhX9Ks0LOj6dgSI8U1wxVl2Sllj56+mZu9KRIG3xjosE3cyntnLe3eMbR1zwgAOrEj/K03wJl7VV1abd+jI1w7T8XVMyeROub5VO0kecxLwSXYrQSQJXuZGxk70qWcUgEK8Cq7745vE=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(23010399003)(366016)(56012099006)(18002099003)(22082099003)(4143699003)(11063799006)(3023799007)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?1612dTEQd1yryXza9dckTopdZM5G2n8yVJJhIFIdK6Tzpe9Rkg32AT8FOXwY?=
 =?us-ascii?Q?yzsSThUkkYfLPvX+4kEEY+B0ORGioSiprWt4bQ96CVpHBfxnlLOsFFMcJRw0?=
 =?us-ascii?Q?exPp3ea5y4Uu3i7PLu5zhOSMUMM0zaMs9xIvr3Kd0BdBTgGEwKlBQOPiqaXh?=
 =?us-ascii?Q?CzOtuoS1kS5B2hnFgrA5sdd46Y3XxL+WYBB20J57iPSUt5YH0VhTu7RdOFYm?=
 =?us-ascii?Q?jYQqFDGTZeaoOa3fuESGDkp0hjJSYwhEhp8zDLDJS9+EnSTdQ1mob5GFRJVq?=
 =?us-ascii?Q?6Q84kWdvoWyEw26FyCX+tBgDxf61S5mvfS08T+qq1n//upDcWGQhud4+7/F0?=
 =?us-ascii?Q?ktrG2rJ+XHg48cYEhaf3gi46ynr7tV0+yZt8WU1M69PcKjoi2XY8bd1PMeYg?=
 =?us-ascii?Q?FnDKJ9nWGAwYnReNrZ5uk3chwlq0ILmkTlm313c7tjT1dc/ul9kioDO/O0h3?=
 =?us-ascii?Q?QPdOWweotLRSXUSyF60LeaGLXRt7S5j5qvNdfLNfe9snNbte+BQT1LRkwjab?=
 =?us-ascii?Q?lDwMkn5O+CBpFpImTAdKi4WebWCjpJcJz5B53sGDiLhllxSYv+Xzc9MEkOuZ?=
 =?us-ascii?Q?fyzG5gvfdE4YTvuoxO8x+4D5ZcQho0CszuoJ8yXC4p94roClTOBdE2k7fYdV?=
 =?us-ascii?Q?8oCok6NcQcl/gSmuqqtt1oSv+B+yCB5FLXSGtOCVIbbkeiMgPAbDl7/ZKTd0?=
 =?us-ascii?Q?PgzRaSxj7GLtGsNR2DJ6RkcHPvFWfhHZ7Ntiq6eksItvtox9HRjFHyMHi1ss?=
 =?us-ascii?Q?1xK/KpAPGG4FicIL970Gr99ZQqE0MX2a/g+iWO7EmfHo9TJu/nlSUGU85Zab?=
 =?us-ascii?Q?tAJvwFNcjVeHyYM7oL3hjkt0oSaz7u+o8Eka9iG0TvI43nZrXlo5+Mk+99D3?=
 =?us-ascii?Q?sLIhujmqIzLwVSUMXiImSdZq7QcCH0t4pLCc3EZu0nN1DDoR1n650ymNadrC?=
 =?us-ascii?Q?1ckwZaRFolED2PRVHgHuaUnQfcmIJl+Jqk65kpranLpuWTHEA5zDCemx0bB5?=
 =?us-ascii?Q?PQJgf2ncXN2xu91CJ2awV5gB9MsXndF16AHr5IA8EJNLbyD6K7bA9kNLXAlw?=
 =?us-ascii?Q?c+CfO9phRRCsUfOQje7ePWjmbNEKNeiwQvOur+QnRS8HXtI3NRO0jqjhnVbS?=
 =?us-ascii?Q?Zv0ZrsmQk9Ef2BD64YVAZCnB8E736HGKrdcJ3bodqwhO8I0Odhl0CyVwt6OY?=
 =?us-ascii?Q?BB6O/4jiooimi4U6KNEOghJgmaz7JVAgESmH28DSNgKBWPQA1kNos3vJ9tI5?=
 =?us-ascii?Q?NPd6OKdFW0gR9/qNdwbDMY1MpeWqKqrugMXQQ5/gUfO9tWegOAc/tB7doCf1?=
 =?us-ascii?Q?/kJJbXtkdQwnb2TCOiQw7g2bA4RkurmFYIe8Gqp4YuQBXdRR0OZycIboIod/?=
 =?us-ascii?Q?ApnXHxWsc6O1TEWYrVv6ZXQZf2ESnpKHku26ZPFxmnyWuNtCbscLeMhACtM9?=
 =?us-ascii?Q?s7AbG4AMeyZQtp4hujNcdSfMeakq9RZd/c4mqtFcNJuWlQf48+HbqGdyNraX?=
 =?us-ascii?Q?u30wcYQWBUywa3PU647ASm53MdwS/Hgf5JUYGRWSR7otJbk14Mcb83vYlI02?=
 =?us-ascii?Q?hTzcwsbGauihr3ncHUb0YBl+Yp9zozYk+omosKYf5E4EhhCVJnEo6MY+TEot?=
 =?us-ascii?Q?n32AAK1wqzQWlBQFq9CPH2LFepJ75M9gwHvmX8Neqjorrnf00Mo7QlTBgxCz?=
 =?us-ascii?Q?dLeMdgjt3omHLLn1k/t3B10i4PtC3RochfcODVk6OOEN8d5m7E9BXn2CKN5J?=
 =?us-ascii?Q?gQ0Uhaxv5A=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ff9131d-f6a7-4038-896e-08dedd141f9b
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2026 17:12:43.1299
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7/5ApjMAz7KtarVqvL1X6kXCz8kk7WVPAaOPxGtNgtaS3yamd+R8Jee7iUZC/kjsetwzV2Ph3LFNsg8hfLwo5n2TtQ+EZKXY+ILiwE6FOnI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8411
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
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34906-lists,linux-renesas-soc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:tommaso.merciai.xr@bp.renesas.com,m:biju.das.au@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:laurent.pinchart+renesas@ideasonboard.com,m:dri-devel@lists.freedesktop.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:bijudasau@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,m:laurent.pinchart@ideasonboard.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_TO(0.00)[bp.renesas.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,glider.be,ideasonboard.com,lists.freedesktop.org,vger.kernel.org,bp.renesas.com];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[TY3PR01MB11346.jpnprd01.prod.outlook.com:mid,renesas.com:email,vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,bp.renesas.com:from_mime,bp.renesas.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D167D72929D

Hi Tommaso,

> -----Original Message-----
> From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> Sent: 08 July 2026 17:46
> Subject: Re: [PATCH 07/16] dt-bindings: display: renesas,rzg2l-du: Docume=
nt RZ/G3L SoC
>=20
> Hi Biju,
> Thanks for your patch.
>=20
> On Sat, Jul 04, 2026 at 10:34:17AM +0100, Biju wrote:
> > From: Biju Das <biju.das.jz@bp.renesas.com>
> >
> > The DU block on the RZ/G3L SoC is identical to the one found on the
> > RZ/G2L SoC. However, it supports the DSI, DPI, and LVDS interfaces,
> > while the RZ/G2L supports only the DSI and DPI interfaces.
> >
> > Due to this difference, a SoC-specific compatible string,
> > 'renesas,r9a08g046-du', is added for the RZ/G3L SoC.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
> >  .../bindings/display/renesas,rzg2l-du.yaml    | 27 +++++++++++++++++--
> >  1 file changed, 25 insertions(+), 2 deletions(-)
> >
> > diff --git
> > a/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
> > b/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
> > index 7c84a9ecc7a7..65368649fe77 100644
> > --- a/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
> > +++ b/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
> > @@ -20,6 +20,7 @@ properties:
> >        - enum:
> >            - renesas,r9a07g043u-du # RZ/G2UL
> >            - renesas,r9a07g044-du # RZ/G2{L,LC}
> > +          - renesas,r9a08g046-du # RZ/G3L
> >            - renesas,r9a09g057-du # RZ/V2H(P)
> >            - renesas,r9a09g077-du # RZ/T2H
> >        - items:
> > @@ -65,7 +66,7 @@ properties:
> >        model-dependent. Each port shall have a single endpoint.
> >
> >      patternProperties:
> > -      "^port@[0-1]$":
> > +      "^port@[0-2]$":
> >          $ref: /schemas/graph.yaml#/properties/port
> >          unevaluatedProperties: false
> >
> > @@ -88,7 +89,6 @@ required:
> >    - clocks
> >    - clock-names
> >    - power-domains
> > -  - ports
> >    - renesas,vsps
> >
> >  additionalProperties: false
> > @@ -108,6 +108,7 @@ allOf:
> >              port@0:
> >                description: DPI
> >              port@1: false
> > +            port@2: false
> >
> >            required:
> >              - port@0
> > @@ -124,10 +125,31 @@ allOf:
> >                description: DSI
> >              port@1:
> >                description: DPI
> > +            port@2: false
> >
> >            required:
> >              - port@0
> >              - port@1
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: renesas,r9a08g046-du
> > +    then:
> > +      properties:
> > +        port:
> > +          properties:
> > +            endpoint@0:
> > +              description: DSI
> > +            endpoint@1:
> > +              description: DPI
> > +            endpoint@2:
> > +              description: LVDS
>=20
> I'm seeing you are using ports + port@{0,1,2} in driver and soc .dtsi so =
I think here we will need to
> have ports + port@{0,1,2} aswell.

Good catch. My binding test did not catch this.

I will fix it in next version.

Cheers,
Biju

