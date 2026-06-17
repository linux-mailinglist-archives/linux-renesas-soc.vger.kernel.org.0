Return-Path: <linux-renesas-soc+bounces-34104-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gCCTDlzmMWomrgUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34104-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Jun 2026 02:12:12 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 92CBC695D41
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Jun 2026 02:12:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b="k/3ApdHx";
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34104-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34104-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=renesas.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7DDE3300B576
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Jun 2026 00:12:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C746F171B1;
	Wed, 17 Jun 2026 00:12:08 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011019.outbound.protection.outlook.com [40.107.74.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52416A95E;
	Wed, 17 Jun 2026 00:12:06 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781655128; cv=fail; b=fglIlH7BQr0NqZuBff0jt6hE3dD7MGUIiKnDy2pgR8L48ytN6xcxJxwU1n67Uo37RMf04tfD+i5x6vIKQC/CEb+NgfkhlHfiLnbCbnuXpTJYfOzybLneEl1RSDzLnAeV5YSwqdUPpQFE33KFlF3N6DTzxU41YNX6LONqetmN3u0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781655128; c=relaxed/simple;
	bh=5BeGN0CaH46/Zedwf+9DThObuxgb0K5BboQQ0nRmeTw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=MotMc0LUkArXU3Ae3mRqS1ykyvJnrByeN9XUpsMwulsIm/RFBhLsCKHUAQsQ7AqynR80T2JHmgh6KvxHrJoaVvkjZAC7rkXyFUBzN1Lq9RPdBRSElGccq7ZU/9BcsPbdr/bYZquGQLNJWIkOdvt0ybeNL089Xp5HfrYB8PCQ6ok=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=k/3ApdHx; arc=fail smtp.client-ip=40.107.74.19
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iODxsNXuoSsfO9dgmR/Tz93tsFoo2ZoP3XWjHr7JBfUy+9ytsHWIEjD3FF7n8PeSAbu9lPALBSBurOlJ0lDQSpLIi9d6+q2ZojLHjxz6P0cXZHTh3fn5aMw8RXSrtBbvsj/pgMm3Z4q82ttRJz4cL4s/4SE2WXGrFwy8T4AM1mi6w01mYJZF/xGPXzzH+fBWuz2K7l2I4OYKXTfHNa2RSAxbzJDYeMuQ4uP9U/XCX9l4AML7oXKd0Yt6pb+zyVW33PGHc1MoidRtVgFi5FvVTK0nMa1RjeXtFB34MfF/euTGHArru4+psCBj/EF3HCRuFdE+sTJunjcHrPa+DlsNZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5BeGN0CaH46/Zedwf+9DThObuxgb0K5BboQQ0nRmeTw=;
 b=llstvbyeUO68qJ/da0AyhzEpUm61Y88cqNv7i5vljk+QVfKgZGHBOHGKFIsKDqXxEgPAzslO0fKqnltumf5wJHSfDVpAFcwjTdQVW5HaQlpMy64ve8iEG1lva8me/JHjZU7OSvuw5QEuSVz9GTFHrjzpc2PLGfsdFvlcny64M0SPuFceZ5lMtW+hzdQ9FqBpIU++jMusX7m2uVOMttaWSxWVVlHUuAv1TVy/WTDrn8NPC8N8/GEk9Z3h7ZSkYW3G8amXY8w+Ybjegz8hY/qJa24specN/EwexdvhOkKpzPORH/R5SjKsXlHj5xi1kb/3YCJo7/zxtkNANlTf+N7R3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5BeGN0CaH46/Zedwf+9DThObuxgb0K5BboQQ0nRmeTw=;
 b=k/3ApdHxLuN4CwCq79aGqduIuHYBw6xoL1oQ0gL9LPwPjm0m5KKr+UOIBc/bJzmRTjqVX1iPyWsAKFLC8tqFJOSHpS9TRPu/UEKzayEazYOLfAUC3up+CElsQpgWJ+yBt57FonyxtitUsiiFRmVbMlmznoHWJ4/7vkfbe/vhl3Y=
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com (2603:1096:405:35b::6)
 by TY3PR01MB11210.jpnprd01.prod.outlook.com (2603:1096:400:36f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Wed, 17 Jun
 2026 00:12:02 +0000
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3]) by TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3%6]) with mapi id 15.21.0113.015; Wed, 17 Jun 2026
 00:12:02 +0000
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
CC: "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "broonie@kernel.org"
	<broonie@kernel.org>, "perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com"
	<tiwai@suse.com>, "geert+renesas@glider.be" <geert+renesas@glider.be>,
	magnus.damm <magnus.damm@gmail.com>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "john.madieu@gmail.com"
	<john.madieu@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>
Subject: RE: [PATCH] ASoC: rsnd: adg: make rsnd_adg_clk_control() idempotent
Thread-Topic: [PATCH] ASoC: rsnd: adg: make rsnd_adg_clk_control() idempotent
Thread-Index:
 AQHc+PjrqkajRu0CfkuUK8HRbOHBfbY4ZYoAgAJMZtCABc/JgIAAwunwgACT3ICAAAxmAA==
Date: Wed, 17 Jun 2026 00:12:02 +0000
Message-ID:
 <TY6PR01MB17377402700DB2BB781692AD3FFE42@TY6PR01MB17377.jpnprd01.prod.outlook.com>
References: <20260610164704.2211321-1-john.madieu.xa@bp.renesas.com>
	<87ldcmovp0.wl-kuninori.morimoto.gx@renesas.com>
	<TY6PR01MB173775D8E134C9A90BB069334FF182@TY6PR01MB17377.jpnprd01.prod.outlook.com>
	<87pl1rmci8.wl-kuninori.morimoto.gx@renesas.com>
	<TY6PR01MB1737795DA5F4671C634CCD766FFE52@TY6PR01MB17377.jpnprd01.prod.outlook.com>
 <87v7bi13rj.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87v7bi13rj.wl-kuninori.morimoto.gx@renesas.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY6PR01MB17377:EE_|TY3PR01MB11210:EE_
x-ms-office365-filtering-correlation-id: ac0e8ea3-e2d7-4356-79a5-08decc050e5d
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|7416014|11063799006|4143699003|56012099006|38070700021|22082099003|18002099003;
x-microsoft-antispam-message-info:
 891I+CmSj8Q84uWbreLi3bqi56N7UKiZn+cLjJxnUo7/vEsa2r0x3kZUM/DrDvJah+pveGC3Kr7TYyyPbiTqTWUu7aC5JxKn2BIT2w+WPO6DkeItBcEnrortCKo+XzwB1ADJcUHhPevT6rWRZe6UH7i8ckvetiSK4ZPhed8UVAnE5FJXi4svG4nrCL2IFjCU8VrX6M/M1yk1eWxiCxg0kRs6va0DgOgHBgek7btF4CCnjdTCZvFPFaO9idERVrndQvM8gO+dwvj8LrbC9kbx69+1Bf+Qxy0B7479QBuB8RkP4HtZ6+M00gMGFBCRsd3oIze18SivahH0NNKgVVF2zQH/kuVB7g8idPhq08AGoT1qVbYkjb3Npl2O8MPbPYBUgfIGlkA7HvJpNxZIV7eneHv1r5q35u7tXzBwUvqlSyGZZgLNOFYYDhfwPn32U04mttbACc3cDrYN7GcbSv7fERYjc2B+I1tS0B7wS7/Yukun3PsKMlvb6DWkdkN54WFq5QwQNyMY4uCj47kAcioR1spGOwiSeUt6C3quc5h1CuWxjkUDZzrF4nFa8keYur+ErqPys//sgM5MLpNHG+6ad6T7fRugEfAShgIhe9CB6YMfPUIu0bCjYV8WY/LBsTOumH+CUNo+KyRoIeVDcIm3tCIvNuHEBZgSrof8jVHtirI+mODFENx2zB+K/eWYeEIAX9vA+OIRS8rTUw+FmjeyfPiZwQBJS2jDmTdb1cpL4hcWkaqptPOHq0vpYGmzqFch
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY6PR01MB17377.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(7416014)(11063799006)(4143699003)(56012099006)(38070700021)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?e/tUPBBwS7VXsCMerN41CDlq8YaRb3T/zcWkF4itjA1xUCZ9lddZa1urubZK?=
 =?us-ascii?Q?8ZEMpcdTCfyYFyjc2xHNbIikSmduqj0E8b5qzYP+ZoRXoo5EEZYXzPlMYm53?=
 =?us-ascii?Q?O/hvz1uE646Km4VuPW31/tcyaOAPcRZdpnHNv2GEpOc1QdfK4X8LuzA1E6uh?=
 =?us-ascii?Q?vO+Ve7Iwosfmobwt4QDBHb/44kXJ5xdLlsFf2p9zdSWTqaLXl6iCET34fe9D?=
 =?us-ascii?Q?Pk3HtEZcpHYLk0KVkf0i3bTGudpSjk3wIzLvhCkkKkY2ktin5uITlAYC2W4m?=
 =?us-ascii?Q?Ze5EN10a/1jjhLhNQpWoguV5hTD3d/wu1B00MEtzsIabj5bxGvKzQX/0E4ol?=
 =?us-ascii?Q?b/0fH/ftUpBe+l5NbSAma2mk4QVB6eCx8b8tmmIlC+tRewMQ33jLXH7BZM14?=
 =?us-ascii?Q?5xChXf7p84Q1wQTfarvUleXX5WeYfPAN7M2XrTF4GTA0i8SYMQytAeKofK9d?=
 =?us-ascii?Q?Xp6xIYlPGthWnn9lHVmNtIpK2jw6UZenlcgnFR5XdqeYO1+9ZSOMyi01LeBV?=
 =?us-ascii?Q?U63GXM0XqTUMECdz0Oc9ki6uW+a6dzBW4Wy5i8BBjLDJsiRs4epW+3xKYCFz?=
 =?us-ascii?Q?G6AqYAqr3S6omcgddFSh1gA1M5ITc46Ch5aJ+qIEShoQsL9ZxXtuUSHUm1V+?=
 =?us-ascii?Q?V8MmS0gFL5KcdO5g5RkA34/qBR7Ar5SswdpfyPNG19VVwGQKR4h52JpyXkBs?=
 =?us-ascii?Q?PiYLzMQKMW3pRmvzPiH4r0qRM/WlaFJjdeozqF6xdLahbi/6N0QscZJCF0HA?=
 =?us-ascii?Q?jHPzaWZk6c/uXRSDXwA0KDRVfP0AOsAmR0rr6YWAhCPKpjzLv1JtDs9ObLcd?=
 =?us-ascii?Q?YiNwxBZk70MptUCkb2W2t6N6lzCOPK6oBFFbEzihKE15dCezuN7G4iRvhYj3?=
 =?us-ascii?Q?zQ/DAGy9gBjRl4ymYSIVeBhS5dvTTqw4CyKTsITutVorTvPxylybiMOQiaPo?=
 =?us-ascii?Q?+fwTiyozayS2eX2ewLpM/CPwi+lLMWLHLaO3G4rgXLc1iJfYik6kGDO2qlNV?=
 =?us-ascii?Q?ypzU3uUDtf7P0e5kyVSiT/8GJHH1yWThsq4bKM8/EpKBkg6bCYQhjw2fQkzb?=
 =?us-ascii?Q?HyMGSSH379T8ys+3eB27dbqPQUjykVWqcMMM79zYyhOVFwXqRByyXGvLJuje?=
 =?us-ascii?Q?pkrzfaVtoyU3zcaDgleu0lkvWHN4n8nfhV4PRbZLdb6H+23+b5FpC0078tp/?=
 =?us-ascii?Q?HmsAve1ogYrAfyVgLnZ5K+S1Aw0pHZKw5Z1AANQjg+6CiVYmwN98XBTFv0O/?=
 =?us-ascii?Q?VMQ5S/4fzl8DDzWmPeilJYJqdunjePfYma2oOvPn7gZUIInov8qYbRHNKqyp?=
 =?us-ascii?Q?mJMLMdoNWwkhelaboyxhRCTUYu146KVOF8FzqJVp1lT++aiepiLzUwjRArXE?=
 =?us-ascii?Q?b4vU8M6VRPmwmV2itRzJWqoE3cWrLyWLHesXV9ApnKKhh7WHut9KYshon/7E?=
 =?us-ascii?Q?/Pjuch3Wyp9zOYnK7ErMDNLYhFj55eOKV2TNbi1stHJFSS/oCcTVKyuKFraX?=
 =?us-ascii?Q?BHDOGE0cY8qngW8eb/eFYJnrsqvdBHZ41P8M8PG1Cc3S7XQ+3X4Mx2W8XfVy?=
 =?us-ascii?Q?35HVAA5SQ11OQB11XomBmieAxpteByh4gGJgC5x5zFQLtaiLiFEx78WilqY8?=
 =?us-ascii?Q?gj4HYNxaYNrHVJ5Za9RrHIAVlHGjWZqwRFkml3ckYPBxCZM5qw6Xogu7o6ph?=
 =?us-ascii?Q?donAUAA6gTDpifiqXCjhuNf03Py5P8fXn3QrFbebhYLaQofkXmwpniXIEGLJ?=
 =?us-ascii?Q?9dnsnYunVcaNNNdLG0dxUIPwZi7DulU=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: TY6PR01MB17377.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac0e8ea3-e2d7-4356-79a5-08decc050e5d
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2026 00:12:02.0705
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tiOB4vLyMJprZSgOilpr66wPLn6tMs6WMQZmAaexNaLqBtzmv/CfJrhIdL/gUV4j8fZZnWnlKGDhP+i0I0KT9pB8CixFe608cskv4vu0R2E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11210
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34104-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:kuninori.morimoto.gx@renesas.com,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:linux-sound@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:john.madieu@gmail.com,m:biju.das.jz@bp.renesas.com,m:geert@glider.be,m:magnusdamm@gmail.com,m:johnmadieu@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,perex.cz,suse.com,glider.be,vger.kernel.org,bp.renesas.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,bp.renesas.com:dkim,bp.renesas.com:from_mime,TY6PR01MB17377.jpnprd01.prod.outlook.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 92CBC695D41

Hi Morimoto-san,

Thank you for your feedback.

> -----Original Message-----
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Sent: mercredi 17 juin 2026 01:10
> To: John Madieu <john.madieu.xa@bp.renesas.com>
> Subject: Re: [PATCH] ASoC: rsnd: adg: make rsnd_adg_clk_control()
> idempotent
>=20
[...]

>=20
> Thank you. But, your original patch-set has already applied, and it is
> merge window now. So from your point of view, you want to include its
> solution patch as much as possible ?

I was not talking about my original patch-set,

>=20
> I think your this patch (=3D ASoC: rsnd: adg: make rsnd_adg_clk_control()
> idempotent) can be applied in -rcX, because of bug fix.
>=20
> And, the clk_control() separation patch is new feature. It can be for
> next kernel ?
>=20

but instead, about resending this patch (with your Acked-by tag)
as PATCH 1/2 + the clk_control() separation patch (as PATCH 2/2)
together. If however, you would like to keep this patch as
it is, I can rather send the split patch as a follow up. Which way is
better for you ?

Regards,
John

