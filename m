Return-Path: <linux-renesas-soc+bounces-29611-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QI91GkxauWnYAgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29611-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 14:42:36 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D972AB1E2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 14:42:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 95D5F3039A6B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 13:35:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6242A296BDB;
	Tue, 17 Mar 2026 13:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="CHS61CM8"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011032.outbound.protection.outlook.com [52.101.125.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E9D6A55;
	Tue, 17 Mar 2026 13:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773754518; cv=fail; b=MD2BZgk2hjtCOT4fJMO4NVHlaECLa7NqR6gGDJe7akMxKJYWMCbsCkOLIV5ZlozlCI/3zB5Ilc7xqVpzKuVfXG5cqo6Br6YlzemMe4PPYSVoUwb7ZzBYwyxd8W6TeYqvclt6B1/p7O2S/p0OiEpyKNnVtg/dIGanZQjKYcsndEA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773754518; c=relaxed/simple;
	bh=Dh1GnrXhVKnBxprvCOXG+dFmDarUUuY+tpmQMuoSrtc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=pKq/wsan+KHL9sTOh1yLrHOClge/OdXm2Obow+2MO3fF06byKrgO889N6PhWL80Ba+6SVmSQ7FHgXF7nb9I+Fqq0k8uuvMNOI57ZISipF2yMeu1bjXhi7uzxN07TRuwq2ynVGBsaYC8ZNb8igvANbbM784z0rKaWuzo/3djLegM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=CHS61CM8; arc=fail smtp.client-ip=52.101.125.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ijaH46uO8/kGP8SZRARyCoPlCiUyuNHzuI/MjHOPaBlFaQZE1QgHqUbemQ2zYm0I+8lkKMaajtpILnFuRBbsZcu6JaPlytldCSuHyVCUTCyDc9sASbATwPE4iLIPj8AH02Ga7GHyuKGLs340JVrNpw19t+9coGC1d5c5AcOLSVan/hHkZM/rjxcp4qGkaWA0fRfyIC7SLW2jX6AENftihX0n3EEJA2qMb20zKoyl3zMDsp2KavgtrAPM0Kd85f1PrRzupIn7/c66jG0drytN4xYYoj16GFUH38sUk88UYup/Wd0DZlp85HHQmTspADZvNFfbg+4K1MVr/bcYbMrZgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rtGZJBja89JR8zoUsfszuB622oeks+tTzQ47vyTWIFk=;
 b=PL058X9NOETJmldJVkB8uTE7DUG7FdFKezvmNR+AKcX5KbCtMilUiHLCuToVtEDQQIpkdY3f5WwLOIsi2G6mYNlWZfOH7QSqi/6vvPd8ndlZTkFywJSHs8KBssVCOzJV02xbrCKWE1y+OmRhq1ewFLlRX4ZdK+NHMHeVqjhI5QYptZ//vkkeY9N9xsCWmZRugr+KHG2WHjRfhfMxAnROf4GXKujw2t3/wzKACvWqXnxFF3iR9Nqqam/sM5ig/x6S0bKk74ieU6aTrU48EC3wOvI0eaAEXn/wg7d1/Rysn192ZdbXUN9ZOT3Uh6OjCbBc7UE2KrcR+V3h2/3I/i+O7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rtGZJBja89JR8zoUsfszuB622oeks+tTzQ47vyTWIFk=;
 b=CHS61CM89Ajn8FQ8CrvuTZltnpcQZmDagkfQt3Veab52GTleaEw3G1su1fDk4ERz02KSmCtE+0CrW29f/RfzyWg3AxvYAmSy4MWssQoZ3h31VN3sBX/5Px7n5SQIsImB0HZKuOegl9t3F8jbaIidvhJsBzZpOJQT+yeEKbOhVkA=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS9PR01MB17256.jpnprd01.prod.outlook.com (2603:1096:604:40a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Tue, 17 Mar
 2026 13:35:12 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9723.018; Tue, 17 Mar 2026
 13:35:11 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, Tommaso Merciai
	<tomm.merciai@gmail.com>, geert <geert@linux-m68k.org>, laurent.pinchart
	<laurent.pinchart@ideasonboard.com>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
	<mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
	magnus.damm <magnus.damm@gmail.com>, Laurent Pinchart
	<laurent.pinchart+renesas@ideasonboard.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: RE: [PATCH v5 14/20] drm: renesas: rz-du: Add RZ/G3E support
Thread-Topic: [PATCH v5 14/20] drm: renesas: rz-du: Add RZ/G3E support
Thread-Index: AQHcnQYIEBblwDjwa02Xz21Etbf+ebWy5lBg
Date: Tue, 17 Mar 2026 13:35:11 +0000
Message-ID:
 <TY3PR01MB11346E0B218CBFD8A403514918641A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <cover.1770996493.git.tommaso.merciai.xr@bp.renesas.com>
 <152f19a068fcdf27c063e845fe04a48a46c5b47e.1770996493.git.tommaso.merciai.xr@bp.renesas.com>
In-Reply-To:
 <152f19a068fcdf27c063e845fe04a48a46c5b47e.1770996493.git.tommaso.merciai.xr@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS9PR01MB17256:EE_
x-ms-office365-filtering-correlation-id: d33207b7-0dad-484e-18b7-08de842a039c
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700021|22082099003|18002099003|56012099003;
x-microsoft-antispam-message-info:
 4O2RV0X3UVaZzKt9mEhAs3K4xMLQvAQD+pe0Lhojv9jIOSV2qDgi9FQWnYfyAQRiNjJW2DnfQD2zqPTFeuO0petYqmTEL9SIjtarrutbksnmLdkHMTOVr5Xlm0jDe/f3do2IiXUltKiIzjzelx4lXNVXe62FU0OkJlqCTs9/oFvDSkI1sRnafrb+aFZaH/IMTpuSn1kDea6MMZeNDlEyZZRjeXWXcIoiJrqmmJElUoueS4CeJyb0Bcio7q7kflHsfmHL/A3E6Wh4gvPs7OUfnf8wBB4zx3OovGdmq7Eok/XTHoitSZVVJfhtZvcaAmre/C+DZ3G/47Tx5pJPYITTXz/HXpcBaWd6iL62u7TpDIcz62+StAKF49lHtNmE81kkk3DowSX4iZ28g+XeAYPscCtHoJCDfx31QEBr85GeBMeNse7tA2WbDt1vwbogr6o5S6EApgmz6y+/mk63mg1IwEEnZFrvbr9Oei7TrF9Ls7ILtLdqxtTEHfYCSDoOMyRaNpEV9HVuw83iLXwzZ+Rewer4fnaeqs3B+0zmF3hJbJ35M8GOHqMrduMqESbDW/m2plApLKt/2aUHDGzDR3iipyNTeB3wQWuolWjvdR8BwQkI2XYvpygflAtnMhfAIrgRgnb/vKxACf/rmnHk5F3hJI8aYHH970RSbH1FqFkqyQMd1SNAuxdBkAOQLy1GpXdA3H+lQf++lTWEX+7/dGXW1gRw92EkSMAC5Gq8v3b+yemPZgGJ/ADkDuVCjkOjVvciiX0GsBNVIXQvvU9HZtb0Ao9MDo2WcSUQD7SXDelKVaI=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700021)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?4oEXrZfuhL6gQ/AT/tax9dD3cUFDIRHvuyzczBLJf2eOfdkhpjHBD+FN+ytO?=
 =?us-ascii?Q?wEv+7t19C0bGIOGvRhqe2hDB8YkVQdNK4pLffb9JK10jydONcQCO/aipwBNe?=
 =?us-ascii?Q?CqkxEPKtBHPE9U6WApvfOVZvncTIDOjHJOu/z8g5sbVN7ZIjYgEqb3ATkXMV?=
 =?us-ascii?Q?qGZa58Ou2UBeEf+qcDZCfnA4MnN4P/IFVyV2ocUp6UoTyeI8G+XQkfj2UuAe?=
 =?us-ascii?Q?TBq0DazuP5Mfi6LtBSJWqCSxy8KGr9GsnyMe5Uy8Qetjy1uQn7SaJ8ighsXf?=
 =?us-ascii?Q?q1ZlggRd7030SSoDsDxqqZtvQPV1UizMRfKzie/LL5ipVG90sjI/OJD5g+WY?=
 =?us-ascii?Q?XYIa81MIgTJ4ZzU1aJNZtuZD98Nt5aGyaCniQUaHkOmM586Qzz41xLdcWmBY?=
 =?us-ascii?Q?5coLseOLaeYPC6WZN0kc8tlUXM65yMObPTFsQGAjIn7PQR5+i//QOulORQGf?=
 =?us-ascii?Q?VFzJYT4ij+Wm1668dfN66+nf9eCl6DxGbvLWk+87FXkJHk2ynOUvyRPj4EJZ?=
 =?us-ascii?Q?EHEmopD0bdkBlYcPy46Nopq+2itohcZgb1aR9GPu8pgue9ZreH83wyrLDvhg?=
 =?us-ascii?Q?JYbiJm8A40MJcLQNOCvydaa+q17SvfoNaEkctZ8clBp13G2KdhcJmrnxHeKF?=
 =?us-ascii?Q?sQeR+VlMtRekPnEZ1IaWLJx2TYQi5xJJkg3Fl1nq0USGroSB4EGPql8VLVd0?=
 =?us-ascii?Q?YZpV/LB1HG3ZfLFPzEAezZStYPzACBzbBbW3Yrl7+dqdWBWeuEJRna4WwoPK?=
 =?us-ascii?Q?LKJvo0cWSzOUAD4x+CCIPwJmWd3M9RzNbrFBrHq4tFW2Jj9Z0y91BtBkYzUr?=
 =?us-ascii?Q?WqtwhG7uN4VuIt/fslZpRT8dcPewKsC8ltuJrLmI0tFn50IpgLJOZWCKj01i?=
 =?us-ascii?Q?2ChxU9ZTecdIHAndcSDVpnZn3DsNxjjZTEKWTc9Im0edVfBnEsfLq1L+XmFO?=
 =?us-ascii?Q?GSiqxpZ9QPklBljISyds6DfZGgMe/kUZhz09mFS+9rz07eb3kSHQ6pYojEz+?=
 =?us-ascii?Q?YImj1yyxv9VOhTmN7PGmNnEwNGrrvFREEhlMOWHePos07rYCnk2ERdseBYc8?=
 =?us-ascii?Q?rq3yY17PhhjsbzGOeI3aq6bN/m8B1XvYKUBjsdKpGDN43grVD09qPOiiyA6M?=
 =?us-ascii?Q?wVCP1PWzXywwK3+nf1CEVVGuhj1X6jxdl1B1aEmt/eo4nykNfyCfSZ2XDM1B?=
 =?us-ascii?Q?dkqDHm7NjPG186QFyYuDlgkyN5kYvbOno2/xGexemIIuO0IPKLlJc8iR3PQ9?=
 =?us-ascii?Q?TnP/sbRxjpYbnaNRdNmHgOz/rtlikYbmsE5H6zXiSGq4tjqMJTtL0maSviPR?=
 =?us-ascii?Q?qoDP2pH97Z1WqNDhFwzPNb5IjCGXXZpv7ZxP7FRNopM02xn83MImxjmWXhSk?=
 =?us-ascii?Q?eJCXzjzsBZH/b8EpQB0KPFmvHxGkvHuKe5rG0QmrBKh+P25yL5lDgS8YB1QZ?=
 =?us-ascii?Q?oD2/KW6yqSPHTKb/y8M/TpjkmS0ROOCvpDvvVsBAOLuluqbGEh1ObIYPDGve?=
 =?us-ascii?Q?mUgovesi2zwDeNNhSf3Mh8SvmINCYCzxSVIuMerYg8mBc65AEHL1YQa8z7hF?=
 =?us-ascii?Q?mCmqSUYHXC8YTT4oTqpf3n+OWv7IQ+s6q4Bq4sKr532wCnitmUv1Mf0jAnMM?=
 =?us-ascii?Q?Jl23aoWH6eRcQFm4XcGvdbgT094lwmAU1MO8/ahhK9KrbnIKHD6JSViLrn1I?=
 =?us-ascii?Q?6Jr2z7LC6W2vmj8W1A7BcNLvhLR/UJIINg8DDZWRTvWGBBXCKksUqKOMjt5K?=
 =?us-ascii?Q?V+gKRc4UMw=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: d33207b7-0dad-484e-18b7-08de842a039c
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2026 13:35:11.6844
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1ceMbsLfGJXmLTJkXE7hdcCmaoLN4xh/VJ8k6B5rtm60JDuWvsTwt1wO7otFQIX7iFS2M5Nniz7iZX3gDYP0C3bjN7pkOVkZw3jKCC+oAmg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB17256
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-29611-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_TO(0.00)[bp.renesas.com,gmail.com,linux-m68k.org,ideasonboard.com];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,glider.be,baylibre.com,ideasonboard.com,lists.freedesktop.org];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,bp.renesas.com:dkim]
X-Rspamd-Queue-Id: 71D972AB1E2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Tommaso,

Thanks for the patch.

> -----Original Message-----
> From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> Sent: 13 February 2026 16:28
> Subject: [PATCH v5 14/20] drm: renesas: rz-du: Add RZ/G3E support
>=20
> The RZ/G3E Soc has 2 LCD controller (LCDC), contain a Frame Compression P=
rocessor (FCPVD), a Video
> Signal Processor (VSPD), Video Signal Processor (VSPD), and Display Unit =
(DU).
>=20
> LCDC0 supports DSI and LVDS (single or dual-channel) outputs.
> LCDC1 supports DSI, LVDS (single-channel), and RGB outputs.
>=20
> Depending on the selected output, the correct SMUX2 clock parent must be =
chosen based on the requested
> duty cycle:
>=20
>  - Index 0 for LVDS -> CDIV7_DSIx_CLK (DUTY H/L=3D4/3, 4/7 duty cycle)
>  - Index 1 for DSI/DPAD -> CSDIV_2to16_PLLDSIx (symmetric 50% duty cycle)
>=20
> To support this behavior, introduce the `RZG2L_DU_FEATURE_SMUX2_DSI_CLK` =
feature flag and extend the
> `rzg2l_du_device_info` structure to include a features field. Also, add a=
 new helper function
> `rzg2l_du_has()` to check for feature flags.
>=20
> Add support for the RZ/G3E SoC by introducing:
>  - `rzg2l_du_r9a09g047_du_info` structure
>  - The `renesas,r9a09g047-du` compatible string
>=20
> Additionally, introduce the missing output definitions `RZG2L_DU_OUTPUT_L=
VDS{0,1}`.
>=20
> Introduce `rzg2l_du_crtc_atomic_check()` helper to store the routes from =
the CRTC output to the DU
> outputs.
>=20
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> ---
> v4->v5:
>  - Fixed RG2L_DU_FEATURE_SMUX2_DSI_CLK to RZG2L_DU_FEATURE_SMUX2_DSI_CLK,
>    update commit body accordingly.
>  - Added features field documentation.
>=20
> v3->v4:
>  - No changes.
>=20
> v2->v3:
>  - No changes.
>=20
> v1->v2:
>  - Instead of using clk-provider API to select the right parent clock,
>    based on the outputs. Just set the correct duty cycle based on the
>    output, this reflects at CPG lvl to select the right parent.
>  - Updated commit message accordingly.
>=20
>  drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c | 48 +++++++++++++++++++  =
drivers/gpu/drm/renesas/rz-
> du/rzg2l_du_drv.c  | 26 ++++++++++  drivers/gpu/drm/renesas/rz-du/rzg2l_d=
u_drv.h  | 12 +++++
>  3 files changed, 86 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c b/drivers/gpu/=
drm/renesas/rz-
> du/rzg2l_du_crtc.c
> index 6e7aac6219be..cc35dd409e3e 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c
> @@ -64,11 +64,32 @@
>  static void rzg2l_du_crtc_set_display_timing(struct rzg2l_du_crtc *rcrtc=
)  {
>  	const struct drm_display_mode *mode =3D &rcrtc->crtc.state->adjusted_mo=
de;
> +	struct rzg2l_du_crtc_state *rstate =3D
> +		to_rzg2l_crtc_state(rcrtc->crtc.state);
>  	unsigned long mode_clock =3D mode->clock * 1000;
>  	u32 ditr0, ditr1, ditr2, ditr3, ditr4, pbcr0;
>  	struct rzg2l_du_device *rcdu =3D rcrtc->dev;
>=20
>  	clk_prepare_enable(rcrtc->rzg2l_clocks.dclk);
> +
> +	if (rzg2l_du_has(rcdu, RZG2L_DU_FEATURE_SMUX2_DSI_CLK)) {
> +		struct clk *clk_parent;
> +
> +		clk_parent =3D clk_get_parent(rcrtc->rzg2l_clocks.dclk);
> +
> +		/*
> +		 * Request appropriate duty cycle to let clock driver select
> +		 * the correct parent:
> +		 * - CDIV7_DSIx_CLK (LVDS path) has DUTY H/L=3D4/3, 4/7 duty cycle.
> +		 * - CSDIV_2to16_PLLDSIx (DSI/RGB path) has symmetric 50% duty cycle.
> +		 */
> +		if (rstate->outputs =3D=3D BIT(RZG2L_DU_OUTPUT_LVDS0) ||
> +		    rstate->outputs =3D=3D BIT(RZG2L_DU_OUTPUT_LVDS1))
> +			clk_set_duty_cycle(clk_parent, 4, 7);
> +		else
> +			clk_set_duty_cycle(clk_parent, 1, 2);

What happens if clk_set_duty_cycle returns 0 due to clk_parent is NULL??

> +	}
> +
>  	clk_set_rate(rcrtc->rzg2l_clocks.dclk, mode_clock);
>=20
>  	ditr0 =3D (DU_DITR0_DEMD_HIGH
> @@ -248,6 +269,32 @@ static void rzg2l_du_crtc_stop(struct rzg2l_du_crtc =
*rcrtc)
>   * CRTC Functions
>   */
>=20
> +static int rzg2l_du_crtc_atomic_check(struct drm_crtc *crtc,
> +				      struct drm_atomic_state *state) {
> +	struct drm_crtc_state *crtc_state =3D drm_atomic_get_new_crtc_state(sta=
te,
> +									  crtc);
> +	struct rzg2l_du_crtc_state *rstate =3D to_rzg2l_crtc_state(crtc_state);
> +	struct drm_encoder *encoder;
> +
> +	/* Store the routes from the CRTC output to the DU outputs. */
> +	rstate->outputs =3D 0;
> +
> +	drm_for_each_encoder_mask(encoder, crtc->dev,
> +				  crtc_state->encoder_mask) {
> +		struct rzg2l_du_encoder *renc;
> +
> +		/* Skip the writeback encoder. */
> +		if (encoder->encoder_type =3D=3D DRM_MODE_ENCODER_VIRTUAL)
> +			continue;
> +
> +		renc =3D to_rzg2l_encoder(encoder);
> +		rstate->outputs |=3D BIT(renc->output);
> +	}
> +
> +	return 0;
> +}
> +
>  static void rzg2l_du_crtc_atomic_enable(struct drm_crtc *crtc,
>  					struct drm_atomic_state *state)
>  {
> @@ -296,6 +343,7 @@ static void rzg2l_du_crtc_atomic_flush(struct drm_crt=
c *crtc,  }
>=20
>  static const struct drm_crtc_helper_funcs crtc_helper_funcs =3D {
> +	.atomic_check =3D rzg2l_du_crtc_atomic_check,
>  	.atomic_flush =3D rzg2l_du_crtc_atomic_flush,
>  	.atomic_enable =3D rzg2l_du_crtc_atomic_enable,
>  	.atomic_disable =3D rzg2l_du_crtc_atomic_disable, diff --git a/drivers/=
gpu/drm/renesas/rz-
> du/rzg2l_du_drv.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
> index 0fef33a5a089..3c20471fdbea 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
> @@ -51,6 +51,29 @@ static const struct rzg2l_du_device_info rzg2l_du_r9a0=
7g044_info =3D {
>  	}
>  };
>=20
> +static const struct rzg2l_du_device_info rzg2l_du_r9a09g047_du_info =3D =
{
> +	.features =3D RZG2L_DU_FEATURE_SMUX2_DSI_CLK,
> +	.channels_mask =3D BIT(0),
> +	.routes =3D {
> +		[RZG2L_DU_OUTPUT_DSI0] =3D {
> +			.possible_outputs =3D BIT(0),
> +			.port =3D 0,
> +		},
> +		[RZG2L_DU_OUTPUT_LVDS0] =3D {
> +			.possible_outputs =3D BIT(0),
> +			.port =3D 1,
> +		},
> +		[RZG2L_DU_OUTPUT_LVDS1] =3D {
> +			.possible_outputs =3D BIT(0),
> +			.port =3D 2,
> +		},
> +		[RZG2L_DU_OUTPUT_DPAD0] =3D {
> +			.possible_outputs =3D BIT(0),
> +			.port =3D 3,

Maybe use .port =3D 1 for DAPD0 for consistency with RZ/G2L.


> +		},
> +	},
> +};
> +
>  static const struct rzg2l_du_device_info rzg2l_du_r9a09g057_info =3D {
>  	.channels_mask =3D BIT(0),
>  	.routes =3D {
> @@ -64,6 +87,7 @@ static const struct rzg2l_du_device_info rzg2l_du_r9a09=
g057_info =3D {  static const
> struct of_device_id rzg2l_du_of_table[] =3D {
>  	{ .compatible =3D "renesas,r9a07g043u-du", .data =3D &rzg2l_du_r9a07g04=
3u_info },
>  	{ .compatible =3D "renesas,r9a07g044-du", .data =3D &rzg2l_du_r9a07g044=
_info },
> +	{ .compatible =3D "renesas,r9a09g047-du", .data =3D
> +&rzg2l_du_r9a09g047_du_info },
>  	{ .compatible =3D "renesas,r9a09g057-du", .data =3D &rzg2l_du_r9a09g057=
_info },
>  	{ /* sentinel */ }
>  };
> @@ -74,6 +98,8 @@ const char *rzg2l_du_output_name(enum rzg2l_du_output o=
utput)  {
>  	static const char * const names[] =3D {
>  		[RZG2L_DU_OUTPUT_DSI0] =3D "DSI0",
> +		[RZG2L_DU_OUTPUT_LVDS0] =3D "LVDS0",
> +		[RZG2L_DU_OUTPUT_LVDS1] =3D "LVDS1",

Normally new additions are done at the bottom of the array.

Cheers,
Biju

>  		[RZG2L_DU_OUTPUT_DPAD0] =3D "DPAD0"
>  	};
>=20
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h b/drivers/gpu/d=
rm/renesas/rz-
> du/rzg2l_du_drv.h
> index 58806c2a8f2b..480a7bdfcd66 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h
> @@ -20,8 +20,12 @@
>  struct device;
>  struct drm_property;
>=20
> +#define RZG2L_DU_FEATURE_SMUX2_DSI_CLK	BIT(0)	/* Per output mux */
> +
>  enum rzg2l_du_output {
>  	RZG2L_DU_OUTPUT_DSI0,
> +	RZG2L_DU_OUTPUT_LVDS0,
> +	RZG2L_DU_OUTPUT_LVDS1,
>  	RZG2L_DU_OUTPUT_DPAD0,
>  	RZG2L_DU_OUTPUT_MAX,
>  };
> @@ -42,10 +46,12 @@ struct rzg2l_du_output_routing {
>=20
>  /*
>   * struct rzg2l_du_device_info - DU model-specific information
> + * @features: device features (RZG2L_DU_FEATURE_*)
>   * @channels_mask: bit mask of available DU channels
>   * @routes: array of CRTC to output routes, indexed by output (RZG2L_DU_=
OUTPUT_*)
>   */
>  struct rzg2l_du_device_info {
> +	unsigned int features;
>  	unsigned int channels_mask;
>  	struct rzg2l_du_output_routing routes[RZG2L_DU_OUTPUT_MAX];  }; @@ -73,=
6 +79,12 @@ static inline
> struct rzg2l_du_device *to_rzg2l_du_device(struct drm_device *dev)
>  	return container_of(dev, struct rzg2l_du_device, ddev);  }
>=20
> +static inline bool rzg2l_du_has(struct rzg2l_du_device *rcdu,
> +				unsigned int feature)
> +{
> +	return rcdu->info->features & feature; }
> +
>  const char *rzg2l_du_output_name(enum rzg2l_du_output output);
>=20
>  #endif /* __RZG2L_DU_DRV_H__ */
> --
> 2.43.0


