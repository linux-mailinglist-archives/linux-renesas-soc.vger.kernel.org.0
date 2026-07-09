Return-Path: <linux-renesas-soc+bounces-34920-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ziBlMis5T2qscQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34920-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Jul 2026 08:01:15 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3581072CF56
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Jul 2026 08:01:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b=wyXWcfqG;
	dmarc=pass (policy=none) header.from=renesas.com;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34920-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34920-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B5D7A300DA6F
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Jul 2026 06:00:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E67CC28466C;
	Thu,  9 Jul 2026 06:00:51 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011066.outbound.protection.outlook.com [40.107.74.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC56827B357;
	Thu,  9 Jul 2026 06:00:49 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783576851; cv=fail; b=Mq5OyNDVR7kYYx3g/OOiqhDlA8A1nJZ3xTY2BqL0TZJ/mT2h6attP/yH4ko98GnexY/YtHY2T5GLuGydMHeBDBk/oP4n8rHdOPUzjEBdaGjCuDnanQDTlC24QdI62iaJfSMivEOKL1mxH1ydzKPP22U71LkbVTs2+FF88K+6R60=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783576851; c=relaxed/simple;
	bh=zi++pq01CVwOVXIAGJX3YLEV7m8EdMyV7lGDhSHMtg0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=D4455QkLMu9Fkp9UdUogVHSUy3usQ5hXrcrkR+cf1Oy6nfmogMgxGC1eNWC6ZS2ywAgtNVGkhjTUjxs+OS73i3NyYceo99yKE37sBmb14xhHboyDfx7XfNP6y2q5iXZAaYyZ4XTJTi54hSa1SzcPVyxGH/ckyRuY5aRCaq6FX3o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=wyXWcfqG; arc=fail smtp.client-ip=40.107.74.66
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mm5atUejgl3Jgm2eHNCd7U2kZFkv4J7qZIjP9JssZDb9KWNpTeVoaX9AIb8hD6O7AbF3vN5dNbJT3PbbqINJJboifa92U/Pl2XMsEdueYB+iXXRby12aacUnl0hZ9xmfB2aHBezjHIojC2ke2LNRBmcK/b7bcb/KN+6lxIfeNRGvQto5uRiVEy+c506eaecjSEgdOGjr+R8SoZjZWtDKbK7ZexSz/8x59T67tYjHta6JqUg9sc5RXQxs7Z5PVF+zN2mvu/OC4PamYj3gNEhyn1S3HJRBWM/E2wCHCGKQtVnncwlk6ZiSK6yWo0B08U9qMqzSXKGKBu5zoeNB0fQlhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GGkeILTMDFOV37HFlgWBzgZhaBLC7d0835fKbwFSEHs=;
 b=cOECpFii2wjDPYPor/+jVMbmhV0di3JrDLzi7bnz6KaILk4iaC3ZCaP+2MIN3cEzLZhuXM0789ZWUw5qi2t/+vnSrovE6uRdsb799Y74NH+qmPN7T4MMNIX5aeH3X2wVn6bNpwAVZ4zuOwtpgT2EnnDcyFsV+HBElIAtwKRWgxcxl/9kDJh63FVaqm6C5Mjb3xTOSfxcWel8VPtbMfZDTGll9MaS7uDwj2W9+DLcPEY9wL7E/7IuumjGfK7ds7eEMv0Csxt6JmOKx/j4QgWdsFiiSWRoeY+194qGcsZMPUTNj9O1tZb1QuoRsGb33jIfCUZySBLRvagwqGBV6S7QiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GGkeILTMDFOV37HFlgWBzgZhaBLC7d0835fKbwFSEHs=;
 b=wyXWcfqGd62J0piblpg/4ay3SCUbzEEpOBe+CnFMTkyyGQFKp8AsgbiO9ginoFQBx2bY9k9SyyMVKFe1nAgacp9jvImG9QfPURigIEtbXApBDwGqxDOXWLqlxTljSa6OvmOT54mJIt5QEpLy1y/0/ilXFSAV5jeq9wZT80y1odE=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYYPR01MB12434.jpnprd01.prod.outlook.com (2603:1096:405:f8::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Thu, 9 Jul
 2026 06:00:45 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.21.0181.009; Thu, 9 Jul 2026
 06:00:45 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, Rob Herring
	<robh@kernel.org>
CC: Tommaso Merciai <tomm.merciai@gmail.com>, geert <geert@linux-m68k.org>,
	laurent.pinchart <laurent.pinchart@ideasonboard.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
	<mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Philipp
 Zabel <p.zabel@pengutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>,
	magnus.damm <magnus.damm@gmail.com>, Laurent Pinchart
	<laurent.pinchart+renesas@ideasonboard.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v7 02/13] dt-bindings: display: renesas,rzg2l-du: Add
 support for RZ/G3E SoC
Thread-Topic: [PATCH v7 02/13] dt-bindings: display: renesas,rzg2l-du: Add
 support for RZ/G3E SoC
Thread-Index: AQHc3gMIeY2WJ7+Cdk6/LqmJCyov0rYMk1KAgCzwRoCAK474sA==
Date: Thu, 9 Jul 2026 06:00:45 +0000
Message-ID:
 <TY3PR01MB11346733171878A6D2E38076286FE2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <cover.1778141145.git.tommaso.merciai.xr@bp.renesas.com>
 <ff8e401a0667970a42a55420dcb071e34730a923.1778141145.git.tommaso.merciai.xr@bp.renesas.com>
 <20260513222725.GA2069022-robh@kernel.org> <aiqtSWTTa4ZIThrp@tom-desktop>
In-Reply-To: <aiqtSWTTa4ZIThrp@tom-desktop>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYYPR01MB12434:EE_
x-ms-office365-filtering-correlation-id: 4047388d-8b31-45f3-7066-08dedd7f6ad4
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|23010399003|1800799024|13003099007|38070700021|22082099003|18002099003|3023799007|6133799003|56012099006|5023799004|11063799006|4143699003;
x-microsoft-antispam-message-info:
 tFte69RRv0CkSgv0dLLZAzGhMn2/8WujD1K4K9KU51cvUndFYSPuiFti/0iQ2+hGvYmDusR1oPH3n4IRbLYGJispDgaCF0Zhz+Kdp5a1KTneSxBu7eNhYnDGxGTR+zClgAyo5h0bkKgKGJbDWJaCrsypb1kN2u2yw8vV+gYr6eWdnJbFN0OMEZQYaUB7Xy41QWP3PB9s3Bh33XGTnJvUtDEyyFG6PAIndNuhnZjGpCfUUMcp7HBPiQsqtQVYBTb4ro11EPOvz1goZvIuBEKTQpHscmDPCVmLQXzMvv/XLcJuCqtYIOw/wD14X7gdSrZL3C+vU23sYNfsynZ94kvN7tmauqAF67R1QM8AEwRnf+fWXA6gWxjrETGM43WGc8hRlzAzmWqSZXpG7dQqY4m5N1ryPYGoL3xcwanZyMDnglj3kw+Gej3XC5UJhm1Nr/k9kXICSdropvwZ8AjHFdFRjHk/RfNQxQz+n1s0+Gc4V+lx7lDxKxOtH+NwXeSuOuCPoWWRXc87bAPOFj/R67OthhxBS8zS/hWPGJtjUbFswgxmr6ACo/RRneWDiYyyUxd/ZDjrqLUhNlpAhbqIrthsHc1BC0XMZAa0WkTHoT33agNGO7Ti6e0cdPhR6Ywyan6jGw/VMSVQa4+YOlBInc2HODlmFwZXsti2qlZCjunTbkaeC5hwCpFcqZgojd0s9DKDi77uQrbOP068W4NHMltOJGtEcYdIR5sCcv9oN4zzePo=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(23010399003)(1800799024)(13003099007)(38070700021)(22082099003)(18002099003)(3023799007)(6133799003)(56012099006)(5023799004)(11063799006)(4143699003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?BI/AQ3ToXdEe3BAbR3IwgUCGsPr8yL+ur3CCPqDfADZ8CiheOueHowG2qm5d?=
 =?us-ascii?Q?XJi3jbJOVZ2ZICsZca6xcZAbL4NPYMjE5eDHBagDKEcSN7UP4nOemjs2hvXS?=
 =?us-ascii?Q?Pr2z8K8E7W+StcUXCvdQQT4o3HiMDBCTLTD/r5k4NbFinwxWqxyKC3F+/0/N?=
 =?us-ascii?Q?lh3H0H/GYUxRYjF6YrZrD2Q+CCvcdlgFvn8tCDBYA8yMxUxyea3qOrb3nedy?=
 =?us-ascii?Q?rqG/QwBMrqvR1/pRk2d3GYZjXYJVK24DZoTjNRJQOt95X4/hpsGvCxqgLahV?=
 =?us-ascii?Q?YGOjFrwoPoNtzzJ20qXHAPn0uHi53WpcRfV9QBlLMsoNmvj9aLCWugWcjRg8?=
 =?us-ascii?Q?O3GCcAsisaLfUsNd6clhoBMqLUH7Nff6euIj5QvFKNg2Ml133/oiQhJg26fZ?=
 =?us-ascii?Q?0AS4StaBMUfVnlDliJHrSd2ltfVCfkp8851bndp+z4LuS6UWJzl5UNc+bRpr?=
 =?us-ascii?Q?mmj9aaxIcbNFcUvrjDNj/BYLPmdiqD1UdjFHUOsvGq6II/X6NKjGMmwqP1z7?=
 =?us-ascii?Q?ISE0TF6xHJCGtq5MnWsA1aSWVGYqbXzPmxhzzBThzPzBGyFFCjnbNS2PHwlp?=
 =?us-ascii?Q?4/4PTkAhAoaijSThj78dypf4ASzD/Q+8tUk9wNpWj6zKaRiVaiqUYHVt1Dfy?=
 =?us-ascii?Q?/ZknzaopE6thIdDHzQC9cgrkQjR4kw/fVLMp9ZiyawB01TUgr7LsXUHS3ouI?=
 =?us-ascii?Q?1Nv3vD1z8iYDCoGnw8fJjUZE9NBezrM+3XzehxS7PmYgNjyegpTB8ouawBc9?=
 =?us-ascii?Q?DFDUn1CCFHe0I3EtceUROZvQImolxjYOGH/LfrBUFweFbV20iRvlNj/pCVqB?=
 =?us-ascii?Q?JIz0leWUHDNRbxPd8F4rj7PHRabU10oUazl1HaItiC8FWZAdOIR3QLoKBSj/?=
 =?us-ascii?Q?u6X+FxbPXdkSfFfWWBxkZyM9UajX98X3ZAio13weC0NXfcC/kPAei1VrcuHh?=
 =?us-ascii?Q?lB2yDkwJ7LcOnovcNsc8K38eSW6MkkUZoL8kAK0OY5LKr99jnOoAlRrVVh7y?=
 =?us-ascii?Q?riHDxqfmycfagqT1agKq2JlDvwpdZ/m1pq54aLnATUkX9jLGWj14IzTn4vO5?=
 =?us-ascii?Q?VKTA/c7T/FKOTcZEbOTY3coi8dFZ2YO4zLKz6+d9lsb+ZSf3zUzqcylcarc/?=
 =?us-ascii?Q?JxB2ZMFDPRYk8MAclW447tOExyKEJayT8s6Ed83xymuNckO/a2y1wuWAPy30?=
 =?us-ascii?Q?KJWXSRXFEEj5DejkX+u+3SfV+McLNHkQCfLo/XfFldUaJMqmagoSqrsnQzOW?=
 =?us-ascii?Q?4XpqEo1bzpe/fUZOmt6GCapuD5kev5+nPRRGOHQCGTdM+Upv99XTvKYc0Wzg?=
 =?us-ascii?Q?hoouHtrVIW7pERgqQI0+O6cn0Y0DX7YXpxzq55yLWWTu/WiIBH4FzZenLlNt?=
 =?us-ascii?Q?0KE9C8FP1Ddt3QXFNmY3EJHB8RJvvqpaN8mFrhNgZ7RRfSD38ylUbrXZWX6p?=
 =?us-ascii?Q?NpN/bzpxOwXQvBAKDbfw5MvkA7KAR04FS3Kja2oe8MKlsAjtQ/2W3+9NcJMc?=
 =?us-ascii?Q?lnvM2bzIUDWecNAq5jv5tGZLNRuDmd9La8ofwxqoH0JxV7VUZKadGUP25XFV?=
 =?us-ascii?Q?18KYF5ey0zVAmV1TMeHkVTMDGHROa9HbusHfMMgJPRieDJWXvqVECMMZ2Cg/?=
 =?us-ascii?Q?HDYM4vYSp7CYC26tC+RNBe8jI67inHpsv/D1EAlWChmziqBUT5GLmRtxy6dw?=
 =?us-ascii?Q?xrxan3DC2psaVGt2Rms0jcR7mp/Oa+Bn+HYxPVltvlKnfOIe1P0S36eaDo5i?=
 =?us-ascii?Q?q1lOiNMfPg=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 4047388d-8b31-45f3-7066-08dedd7f6ad4
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2026 06:00:45.5430
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WTE4G7RgqDfWRgzIbgJyNhzTHit1TkFilSHOUbUQrQ6yO0ToUlz6+wCQpxZ6OUw1tioEDDR0DPrtQnRBqp557ALwhEao1OYjuv95rm/c+Is=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB12434
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34920-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tommaso.merciai.xr@bp.renesas.com,m:robh@kernel.org,m:tomm.merciai@gmail.com,m:geert@linux-m68k.org,m:laurent.pinchart@ideasonboard.com,m:linux-renesas-soc@vger.kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:p.zabel@pengutronix.de,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:laurent.pinchart+renesas@ideasonboard.com,m:dri-devel@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:tommmerciai@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_CC(0.00)[gmail.com,linux-m68k.org,ideasonboard.com,vger.kernel.org,ffwll.ch,linux.intel.com,kernel.org,suse.de,pengutronix.de,glider.be,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3581072CF56

Hi Tommaso,

> -----Original Message-----
> From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> Sent: 11 June 2026 13:43
> Subject: Re: [PATCH v7 02/13] dt-bindings: display: renesas,rzg2l-du: Add=
 support for RZ/G3E SoC
>=20
> Hi Rob,
> Thanks for your review.
>=20
> On Wed, May 13, 2026 at 05:27:25PM -0500, Rob Herring wrote:
> > On Thu, May 07, 2026 at 11:21:30AM +0200, Tommaso Merciai wrote:
> > > The RZ/G3E SoC integrates two LCD controllers (LCDC0 and LCDC1),
> > > each containing a FCPVD, VSPD, and Display Unit (DU).
> > >
> > >  - LCDC0 supports DSI and LVDS (single or dual-channel) outputs.
> > >  - LCDC1 supports DSI, LVDS (single-channel), and RGB outputs.
> > >
> > > Add compatible string 'renesas,r9a09g047-du' and extend the binding
> > > to support two DU instances: add reg-names ('du0'/'du1'), extend
> > > reg, interrupts, and resets to maxItems: 2, and extend
> > > clocks/clock-names to six entries (aclk/pclk/vclk per instance, minIt=
ems: 3).
> >
> > Don't write what the diff has. I can read the diff for that.
>=20
> Ouch, thanks.
>=20
> >
> > >
> > > Drop the "Each port shall have a single endpoint." constraint since
> > > RZ/G3E ports expose multiple endpoints.
> > >
> > > Add a RZ/G3E-specific allOf rule mapping two DU instances to two port=
s:
> > >
> > >  - port@0 (DU0): endpoint@0 DSI, endpoint@2 LVDS ch0, endpoint@3
> > > LVDS ch1
> > >  - port@1 (DU1): endpoint@0 DSI, endpoint@1 RGB (DPAD), endpoint@3
> > > LVDS ch1
> > >
> > > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> > > ---
> > > v6->v7:
> > >  - Rebased on top of [1]
> > >    [1]
> > > https://lore.kernel.org/all/20260429170012.366537-1-prabhakar.mahade
> > > v-lad.rj@bp.renesas.com/
> > >  - Use single DRM device aggregating both DU instances (1 DU dt node)=
,
> > >    modelling single port for each DU0, DU1 and multiple endpoints for
> > >    outputs.
> >
> > That seems like the completely wrong thing to do and you've given no
> > reason why you think it is the right choice.
>=20
>=20
> We had a discussion with Laurent at [1] about this topic.
> In particular:
>=20
> DSI ip can select at runtime input data path or DU0 or DU1 via DSI_LINK_G=
PO0R VICH register. This can be
> done by managing the
> 2 DUs as single DRM device aggregating both DU instances that will spawn
> 2 crtcs. In this way at runtime we can select the output for DSI ip via t=
he following commands:
>=20
> modetest -M rzg2l-du -s 58@55:800x600-56.25@XR24 (DU0 -> DSI) modetest -M=
 rzg2l-du -s 58@56:800x600-
> 56.25@XR24 (DU1 -> DSI)
>=20
> This can be done using option [B] (single drm device that spawn 2 crtc).
>=20
> Using option [A] we will have 2 drm devices 1 for DU0 and 1 for DU1 that =
each will spawn a single CRTC
> and the above feature will be not achievable.
>=20
> In the end we need a way to have single DRM device that spawn 2 CRTCs.
>=20
> A) Two device tree nodes rapresenting DU0 and DU1 design [v6]:
>=20
> du0: display@16460000 {
> 	compatible =3D "renesas,r9a09g047-du";
> 	reg =3D <0 0x16460000 0 0x10000>;
> 	interrupts =3D <GIC_SPI 882 IRQ_TYPE_LEVEL_HIGH>;
> 	clocks =3D <&cpg CPG_MOD 0xed>,
> 			<&cpg CPG_MOD 0xee>,
> 			<&cpg CPG_MOD 0xef>;
> 	clock-names =3D "aclk", "pclk", "vclk";
> 	power-domains =3D <&cpg>;
> 	resets =3D <&cpg 0xdc>;
> 	renesas,vsps =3D <&vspd0 0>;
> 	status =3D "disabled";
>=20
> 	ports {
> 		#address-cells =3D <1>;
> 		#size-cells =3D <0>;
>=20
> 		port@0 {
> 			reg =3D <0>;
> 			du0_out_dsi: endpoint {
> 			};
> 		};
>=20
> 		port@2 {
> 			reg =3D <2>;
> 			du0_out_lvds0: endpoint {
> 			};
> 		};
>=20
> 		port@3 {
> 			reg =3D <3>;
> 			du0_out_lvds1: endpoint {
> 			};
> 		};
> 	};
> };
>=20
> du1: display@16490000 {
> 	compatible =3D "renesas,r9a09g047-du";
> 	reg =3D <0 0x16490000 0 0x10000>;
> 	interrupts =3D <GIC_SPI 922 IRQ_TYPE_LEVEL_HIGH>;
> 	clocks =3D <&cpg CPG_MOD 0x1a8>,
> 			<&cpg CPG_MOD 0x1a9>,
> 			<&cpg CPG_MOD 0x1aa>;
> 	clock-names =3D "aclk", "pclk", "vclk";
> 	power-domains =3D <&cpg>;
> 	resets =3D <&cpg 0x11e>;
> 	renesas,vsps =3D <&vspd1 0>;
> 	status =3D "disabled";
>=20
> 	ports {
> 		#address-cells =3D <1>;
> 		#size-cells =3D <0>;
>=20
> 		port@0 {
> 			reg =3D <0>;
> 			du1_out_dsi: endpoint {
> 			};
> 		};
>=20
> 		port@1 {
> 			reg =3D <1>;
> 			du1_out_rgb: endpoint {
> 			};
> 		};
>=20
> 		port@3 {
> 			reg =3D <3>;
> 			du1_out_lvds1: endpoint {
> 			};
> 		};
> 	};
> };
>=20
> ---
>=20
> B) Single device tree node design aggregating both DU instances [v7]:
>=20
> du: display@16460000 {
> 	compatible =3D "renesas,r9a09g047-du";
> 	reg =3D <0 0x16460000 0 0x10000>,
> 		<0 0x16490000 0 0x10000>;
> 	reg-names =3D "du0", "du1";
> 	interrupts =3D <GIC_SPI 882 IRQ_TYPE_LEVEL_HIGH>,
> 			<GIC_SPI 922 IRQ_TYPE_LEVEL_HIGH>;
> 	clocks =3D <&cpg CPG_MOD 0xed>,
> 			<&cpg CPG_MOD 0xee>,
> 			<&cpg CPG_MOD 0xef>,
> 			<&cpg CPG_MOD 0x1a8>,
> 			<&cpg CPG_MOD 0x1a9>,
> 			<&cpg CPG_MOD 0x1aa>;
> 	clock-names =3D "aclk", "pclk", "vclk",
> 			"aclk1", "pclk1", "vclk1";
> 	power-domains =3D <&cpg>;
> 	resets =3D <&cpg 0xdc>, <&cpg 0x11e>;
> 	reset-names =3D "resetn", "resetn1";
> 	renesas,vsps =3D <&vspd0 0>, <&vspd1 0>;
> 	status =3D "disabled";
>=20
> 	ports {
> 		#address-cells =3D <1>;
> 		#size-cells =3D <0>;
>=20
> 		port@0 {
> 			#address-cells =3D <1>;
> 			#size-cells =3D <0>;
>=20
> 			reg =3D <0>;
>=20
> 			du0_out_dsi: endpoint@0 {
> 				reg =3D <0>;
> 			};
>=20
> 			du0_out_lvds0: endpoint@2 {
> 				reg =3D <2>;
> 			};
>=20
> 			du0_out_lvds1: endpoint@3 {
> 				reg =3D <3>;
> 			};
> 		};
>=20
> 		port@1 {
> 			#address-cells =3D <1>;
> 			#size-cells =3D <0>;
>=20
> 			reg =3D <1>;
>=20
> 			du1_out_dsi: endpoint@0 {
> 				reg =3D <0>;
> 			};
>=20
> 			du1_out_rgb: endpoint@1 {
> 				reg =3D <1>;
> 			};
>=20
> 			du1_out_lvds1: endpoint@3 {
> 				reg =3D <3>;
> 			};
> 		};
> 	};
> };
>=20
> ---
>=20
> Please Biju, Laurent correct me if I'm missing something.
>=20
> [1] https://patchwork.kernel.org/project/linux-renesas-
> soc/patch/8f814f22ff62dcde6153260e2c8c29a5415c9a89.1775636898.git.tommaso=
.merciai.xr@bp.renesas.com/
> [v6] https://patchwork.kernel.org/project/linux-renesas-
> soc/patch/8f814f22ff62dcde6153260e2c8c29a5415c9a89.1775636898.git.tommaso=
.merciai.xr@bp.renesas.com/
> [v7] https://patchwork.kernel.org/project/linux-renesas-
> soc/patch/ff8e401a0667970a42a55420dcb071e34730a923.1778141145.git.tommaso=
.merciai.xr@bp.renesas.com/
>=20

RZ/G3E LVDS support single link (2ch): extended display and single link (mu=
lti) mirror display
I believe to support this feature you need single node solution.

Not sure, you just need to extend like R-Car with 1 ports containing all th=
e 4 ports
Maybe You could try this as well??

Or

1 Ports containing 2 port that contains 3 endpoints each (Current patch)

Cheers,
Biju=20

