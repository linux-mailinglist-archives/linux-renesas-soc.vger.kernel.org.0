Return-Path: <linux-renesas-soc+bounces-34257-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JT/AJA90NWoYwwYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34257-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Jun 2026 18:53:35 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E54196A725C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Jun 2026 18:53:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b=fPB+31Ii;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34257-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34257-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=renesas.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2C9AE302DA1B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Jun 2026 16:53:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB66D3B4E87;
	Fri, 19 Jun 2026 16:53:07 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011026.outbound.protection.outlook.com [52.101.125.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E91033B14C9;
	Fri, 19 Jun 2026 16:53:05 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781887987; cv=fail; b=OedoPCw9yc9/jdgqFe2a1dUVBS5Tx3cEk5WeiylGO0s9iL/MPwX93dD8CpqR2lC3UA8rXBr87c1YIOkT0GcDrjPCxZapEXqWuDJBfrhrqRdfJUGtaBFjvczGaMQP4Tsbpnp1HvcfnwCmmXVS0f/kPkv7udE3NbDns0Z7tQ+Nfqg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781887987; c=relaxed/simple;
	bh=ZCfGfQTImbbr5qov8AWuBa7wnIK/mVkvjoSU/YzRndk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=qxDOQwLw+gizAj8MEDLR57H7gVxD2qiw9aNVXAFAhs/rTYX8uhPj6Ie5lXBUhAhQkU9EFFYz16edARoWnP1fCmzvCbx7Vxa53HxxO0is8/JUMsD5/0Ur8enZlGKCELlLnYLAhaTc/vPpFPgaVOzjvXjOOcZLZLVMqZ+6XxvFnF0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=fPB+31Ii; arc=fail smtp.client-ip=52.101.125.26
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AEuRFEQTz2K7HlHLysWQfFRBsbqSr94qkbZzpLO+PPfE1hPfqhzPGRv4hYgI+OlAySb/s0YyQLH+zfwcZ+sr+HUE39AFZ8l7oChFIJIric+x1z4jFYNfOtFbuodM06lLtScgbDguSepF5/twtveCW7PlZUeAtofT0Cjw5Ez6+Ma5uqB39sl7mTTKPmo/fO2IAHw1Wd0/+g4PUvZw1x4uDeUd2YWbitEWSDXl1UrN6OaaYNnFtC6mbzP1h7Kj/a9jt/wbpHeLSZxWjv4cv3zzFDXeN2Cx37tTv+O2iTz5/lhobi/krUK3dPWDcaODbe+hHJExFAJL7NBlS+zJnxc3og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1w5tZeQHuEL8nyP3gPocClByc23w/8N1CF9GmlSAm0E=;
 b=Prw5byl8WXIMQ5NPQ/4zY9CWpQl3lhOAY7M4d08gFc85iBF2N41FZvBssSTL3D94KcYoWQNUHZ525rjW8I8vrIZwiq+RHDzp89qe54WGUgZuTvxyuZBRl+kSv70C7VyCMFlgLc1VSwxGyiRQx83C3yVbQGLlxRyaxdGR717VVu17/A1Ry5eXg5wfpyraLn7iEAtD/a/4LttPgCrD3Wtsu0BhtcoO81ujSXx4FPX5Pmwq7/Vkqr0VttWo2m4LZpvcChruaoylImyva0Dx2nGRGtbOoETxe+MyIsXTBo+k3iRAx35jR1hpBG+G+tkN203fDm4svFNyft35cBoNHzHq6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1w5tZeQHuEL8nyP3gPocClByc23w/8N1CF9GmlSAm0E=;
 b=fPB+31Ii32FhDLXIdwOVb6lRpszArwZSl+irT0gCNIbTjnify6a9mzoEkD/Jz/qHkdxHX6mjSb6uHSAVdQFCyLIjBpzUEW5hlpgVPkoHESKM2EkHCAMWezIKgMdwu75bdBKJxrx5YLgHk4HcYre57yHNIUWv4BLq6tG33Bhpiik=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS3PR01MB8682.jpnprd01.prod.outlook.com (2603:1096:604:151::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.12; Fri, 19 Jun
 2026 16:53:02 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.21.0139.011; Fri, 19 Jun 2026
 16:53:02 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: biju.das.au <biju.das.au@gmail.com>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
CC: Brian Masney <bmasney@redhat.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH 0/6] clk: renesas: rzg2l: Add RZ/G3L MIPI DSI, LCDC and
 LVDS clock support
Thread-Topic: [PATCH 0/6] clk: renesas: rzg2l: Add RZ/G3L MIPI DSI, LCDC and
 LVDS clock support
Thread-Index: AQHdAApc6miJ7eXQC0CWgcFrJThzQ7ZGFq3g
Date: Fri, 19 Jun 2026 16:53:02 +0000
Message-ID:
 <TY3PR01MB11346D39255C9750D1F66D24786E22@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260619164030.380098-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260619164030.380098-1-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS3PR01MB8682:EE_
x-ms-office365-filtering-correlation-id: e975296b-3503-4c80-edee-08dece2339fa
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|38070700021|56012099006|11063799006|18002099003|22082099003|3023799007;
x-microsoft-antispam-message-info:
 XHPGM6ciu71xgH2XR8azVW/GXkkiE3cJmUbASepihVJMyZ6FPstrYflSVp6icvl8W6M+FSorfrEt6iNb1r/QriapbXUGEOIKD/pD4VmcXGicOjXveJ1oIF3PiOQ/hiHNYx2QcnKi2t/Z4Mn6qElflp0a10ZaTUQcmB73IZE0MNwRhxl0Tg+sL/1MNTmSAcY860jkfsbNxQvNMGNZWflSFIW3vSourQjAoF0vYd+zwvMN8HbkQnu+WVYKrwCRJYAOoonOsLl4VXc7TJQBnZ0M52IJwh7c7Y/xwwfo9BBYrHGrmc/JI+/yI/5P4pc6yqjkn82l5Psyck+i8JuVpKY7zvRs4eGhJax4tGg1NeghHlJIwvwxHkbgtFAnTA0kktYKJ7p0uj0oblSUXaCUIO2djsCarw/Gq0mYPZ7sz6e/4xgmptmGEcq/13j27gkEtph1vlDp6pvAsTQhQQXtCmfb8uRsO288q6+ulTxWN4Y48yWbw/oQhN7+nGFwMcvQo1z2VYzZbX41Ki8ISqzPlYq/jbxJoRcLkqWB0Bwojiimb5/vnn5oM6mt+5yR8piivrTnNQc+kacE4e78xdpe4/WVJBrdI1D0xiJiPGj9ceGAVB6Hf2uwHBUtoKMCuvdLWfBPAYgkC7TCfhUU7IXBuVI+btyZZ9yFoRAUcgC1nyGObh1dw3hdE3sdIjOkd4OCuO7q1eF0BuI48XZU2X2IuLckpR/F2cf687q/X3zK5tJc/9o=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(38070700021)(56012099006)(11063799006)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?31xhIw5xvf2SES7VQtZ/8CIJb/m+hjfPp/TTJmaClB27dTnR6AgmQuhkMmFs?=
 =?us-ascii?Q?G02vp9oP5rvdx8mDplaRQ+nV3WX7khwg1wX7EAckoHuNDWC/Md5Mdkk7sKa3?=
 =?us-ascii?Q?OkoG8MX3/4r0WpH30Qk1AZQA7098suoXqnUNk0LJ/8nvdaaoIofErQTQ4adw?=
 =?us-ascii?Q?yXUcgzUKsvgZKXiZKjboCGHXFrFrvpjhM3TdY23UD6l2H4unAA1vGzBFFr3g?=
 =?us-ascii?Q?9vQCRMSsyVTPaJKiZ1mPOgKsoRyB+GXoNJN1kdoMeYWrmZAXwfyDh6nOZgXt?=
 =?us-ascii?Q?wF7pPlRNhzlasbHbjLroJbCZJe8bPfPtEhkMK9Jp2jnmI43NE0aJKvBqzarK?=
 =?us-ascii?Q?M2/RnF0f0Zm+XtPvwlQ346BaYqL8ALj9KPN8UsznNxkNpyWijkpRhgkdOqBW?=
 =?us-ascii?Q?qTUydJunwRPuAil0t1otXm5KDcxJ50nKzbC7L27Cp2OmoP9CPI9oRw6wrWS6?=
 =?us-ascii?Q?sC/wiPX2rWoqIOowIg419xLqgZEOpaYmdceOCyHeIWsMJycfgMnScTg5PQ9z?=
 =?us-ascii?Q?hzvGLK4qwj30GJfDJkuXVttopXaHRa2jJg39OMKYOB3zy3+nGLAyJ9Yi1TJY?=
 =?us-ascii?Q?glFdytCJ5V+2uJAw97FfBmT77er6W4MVtqF14MIv4ipN4o6Z6cHSWsRgCFTP?=
 =?us-ascii?Q?g9q+e6lJ4HpAwi2I9Mz57efN5loKtwBS1j77yJUdBRztOX+QKqXQ/wIFaKTG?=
 =?us-ascii?Q?R7Fj+aA7Guwf7HrK9opRnsRLaHCt3YBcgx2eUXW7FWz5c5a3FOWYbza7eZ+f?=
 =?us-ascii?Q?kmqn3rfikvh5073mJwK9DdHiKLeZnBmsJOSeJ57d2zrJJoYvLINLbqCfJanH?=
 =?us-ascii?Q?me3/UUEnBaSxFlDvNoyjPhPLUm8yqjiXn/FR73nI3Rc+ogbMj2XQZkfNGRau?=
 =?us-ascii?Q?QHESwwT1UaKi/W6COVnVs517Ziy1S/Ci2VuZt3OwfHY/ccggoEzHPn7J5n/h?=
 =?us-ascii?Q?n3bjuOSND/n9bPH5EvpRfTgBdJrGHF9Jj4CYe8cI7fEyl/xgvjCSh40lo8BM?=
 =?us-ascii?Q?oSbLXNJBQDPG1vZRPZlcojDUVVkG3JwAXhbgkpYmBN5GaZOin1ZVnkOlydkN?=
 =?us-ascii?Q?AE1e0q/vUYnNaV5ohOS1uZRjuv42brExFSxiF6W4DyXTqgM9Jdq79rPS+bd/?=
 =?us-ascii?Q?TPFTtUAI7RcUUxQfts4DrpL2ed7Dzsswjn+/22awF+CIXkW40Lg+MJRcBpX5?=
 =?us-ascii?Q?WISn4AgXqtiEDCHZimTNTbR1saICEhboDc40AzvPLHaa2QIggzULAwjmdsqJ?=
 =?us-ascii?Q?rqwe6xScMd0E8du96YXANbjCXVWOnUG89xz8AW8YeMUFVTlMJvbAyV2n5ymV?=
 =?us-ascii?Q?mw/cyCbk+js9V1xoAyex90qbtoWdsxVFTtwpslqQlWGCPO8BpoF3xSmH/uRC?=
 =?us-ascii?Q?jGj1T1zoetaEdykYl9qIU7wEF8fQJKjOZRiDDdeHTX88OEPBwwZoyMqMenHh?=
 =?us-ascii?Q?gJOd4FUzAnqBiwcdPhFDJdXCO2x0nlV+uoT6d98NPEfW5kTjKRrHPQ8S6WSh?=
 =?us-ascii?Q?4+fEXJwCFaIAhzygerROU9pghfbQKKXrB92cz5qwI71FfbP5UcG85lhoO7t0?=
 =?us-ascii?Q?51X1Zrr/9BGRYNOGu6rZAxpJ3SYnirL1m5IpcWTb7aSUKqHRZb4/XqDLH6cU?=
 =?us-ascii?Q?XRRCYVHkiP62OgwQ0tSp59Nvx5sV4LIOFu6/OReVMGfZV9EVryVICeNNj9s3?=
 =?us-ascii?Q?LurEsuDVnLV76h/qKl3YHi0rpS/jH+EQOB08ee9SOGyAh56dHRNzejvJRUpK?=
 =?us-ascii?Q?ETPETJz2RQ=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: e975296b-3503-4c80-edee-08dece2339fa
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2026 16:53:02.4517
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ibXr2VmIVg7jmkA10cFsG5hFpADeXmBT1DMEzaza4FjnH4694qx55E9RRlgIGU8E9POzUPpdwHQ9hzgVG8fMr1WoIk6mF0LRowdeNRHKLnQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8682
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34257-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,glider.be,baylibre.com,kernel.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:biju.das.au@gmail.com,m:geert+renesas@glider.be,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:linux-renesas-soc@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:bijudasau@gmail.com,m:geert@glider.be,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[redhat.com,vger.kernel.org,bp.renesas.com,gmail.com];
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
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,bp.renesas.com:dkim,bp.renesas.com:from_mime,renesas.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E54196A725C

Hi,

> -----Original Message-----
> From: Biju <biju.das.au@gmail.com>
> Sent: 19 June 2026 17:40
> Subject: [PATCH 0/6] clk: renesas: rzg2l: Add RZ/G3L MIPI DSI, LCDC and L=
VDS clock support
>=20
> From: Biju Das <biju.das.jz@bp.renesas.com>
>=20
> Hi all,
>=20
> This series adds clock and reset support for the MIPI DSI, LCDC and LVDS =
peripherals on the RZ/G3L
> (R9A08G046) SoC.
>=20
> The DSI clock path on RZ/G3L is generated by a dedicated fractional PLL (=
PLL7), followed by a two-stage
> divider and a mux that selects between the LVDS path and the DSI/RGB path=
, each requiring a different
> output duty cycle:
>=20
>  EXTAL->PLL7->[ DIV_DSI_C | DIV_DSI_{A,B}] -> [mux: LVDS | DSI/RGB]-> vcl=
k
>=20
> None of the existing clock types in the driver could express this hardwar=
e, so the series introduces
> three new clock types plus one small piece of supporting infrastructure, =
then wires them up for RZ/G3L:
>=20
>  - Patch 1 adds CLK_TYPE_G3L_DSI_DIV, a two-stage divider
>    (power-of-two DIV_DSI_A cascaded with linear DIV_DSI_B) used to
>    derive the DSI clock from PLL7.
>=20
>  - Patch 2 adds CLK_TYPE_G3L_PLLDSI for PLL7 itself. PLL7 is a
>    fractional PLL with its own parameter search (MR/PR/NIR/NFR) and
>    programming sequence, distinct from the existing PLL types in the
>    driver.
>=20
>  - Patch 3 is a small preparatory change that splits the divider
>    "flag" field used by CLK_TYPE_DIV into separate clock flags and
>    divider flags, so that later patches can request divider-specific
>    flags (e.g. CLK_DIVIDER_ROUND_CLOSEST) without affecting existing
>    CLK_TYPE_DIV users.
>=20
>  - Patch 4 adds CLK_TYPE_G3L_DSI_MUX, a mux that additionally tracks
>    and sets the output duty cycle (4/7 for the LVDS path, 1/2 for the
>    DSI/RGB path) depending on which parent is selected.
>=20
>  - Patch 5 wires up the above for RZ/G3L: it adds PLL7 and the DSI
>    divider/mux chain to the core clock table, and adds module clock
>    and reset entries for the MIPI DSI and LCDC peripherals.
>=20
>  - Patch 6 adds the remaining module clock and reset entries for LVDS,
>    which shares the same PLL7/mux clock tree set up in patch 5.
>=20
> This series was tested on the RZ/G3L SMARC EVK [add testing details, e.g.=
 board/display panel used and
> what was verified - resolution, clock rates measured, etc.].

Tested the below resolution supported by Gechic monitor for DSI/LVDS:

1920x1080-60.00--> DSI (Max resolution tested)
1920x1080-59.94
1280x1024-75.02
1280x1024-60.02
1152x864-75.00
1280x720-60.00--> LVDS (Max resolution tested)
1280x720-59.94
1280x720-50.00
1024x768-75.03
1024x768-70.07
1024x768-60.00
1080x607-59.97
832x624-74.55
800x600-75.00
800x600-72.19
800x600-60.32
800x600-56.25
720x576-50.00
720x480-60.00
720x480-59.94
640x480-75.00
640x480-72.81
640x480-66.67
640x480-60.00
640x480-59.94
720x400-70.08"

Cheers,
Biju

