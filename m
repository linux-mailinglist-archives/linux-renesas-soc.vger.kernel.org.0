Return-Path: <linux-renesas-soc+bounces-33923-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CdF8Lg4PLGpXKgQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33923-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 15:52:14 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 31426679FA4
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 15:52:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b=oO0FqJua;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33923-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33923-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=renesas.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 30E2630594F7
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 13:51:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE22534A3C4;
	Fri, 12 Jun 2026 13:51:54 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010014.outbound.protection.outlook.com [52.101.229.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79C55346E54;
	Fri, 12 Jun 2026 13:51:51 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781272314; cv=fail; b=El6sdmwvHoku3CYBWEvXbyvsdC9uA/GZ9FEjphVwCkBdXqZ5wWyiH1YDCnXAYk2mPK8bBWnzMC245PHeD7SaUEKUKIFSj37v87XU+J5qJFq7r6qfPLgzNAjxu3/CjmVtSC4dw6MUZ09BH5syF80lFYqu3q97MYHvPLRmC2JXUPE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781272314; c=relaxed/simple;
	bh=nmnDoQcUuimZrNyiCkSVtkIeKLeucpmmgbgqcq1HVVY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=G5Q4bjAqyJoeYMEf/vXryOrlAVYZookjUkUpedz4UCUjbhs+vxGuC+JZN12y8KbkZrNBUiDVoYxuZ1p4RskCwhf1fRlwU0g53tzGHYNAViAdaS4MCOh6L0ckmFQJ2yiNzZTQ6X6IxTMGGCWfVqY2nUkz7m22v/kxZO9YIaCZkjE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=oO0FqJua; arc=fail smtp.client-ip=52.101.229.14
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TUts6e1UsKsNLONZeHw3AwlbgIUWar4lY0dGeKzJe/8aN7DJdgvekz8s4Ot70dHQMrEzdo2pxfOR9lcsGzRYhhpsr1kjMWlCQCZ8zYjbwiHRLhIwxt3pqR7aYwW2xGneKQI266nhBlx3oACwFUh4jm7Bm46ZBkyjdt1M8zBfm2gyioZRqjJMYTTGG5dPlpCvO2mi5Np4DXATfPLesZRHP6+/qdFXva+Zga8U6kMxZ6romC9D99bjbMcctv2Uc9SoKs6MWo+OmWNM4EvxzAdj64ru48+pbnn6djtjoPYUBznt0AC7k+qi7RMyLkL7d7tCpuQNRp9lYyM1jhEpCN0Tig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5pxhrjfr2xsDemwg/JBppWDxNpQYg4i28a9yRuKZYVs=;
 b=MrMsmqMwTak21X2GnElJIOxlLxM0J0mJmxZl3FMmuGBZ5ftFWOVt+EWWpURjJ4GBO8r5dvJgVaHod+p4i5ox1vvPGtdr/pjBgn9HGzITcMRK5MT04zhKWj3wiQVzKkYDgHDu4PLNXqaJJl2lYg+2ydnrG9RGwTe0+BRQSlR8guULrl5lERbPxm/96SYERrhAWMBJ5p0NasuWkKRmOrFNtIcQgCzzQ8WKqejjV+8CbEGB7KaZw1/qOsNgpEyG9/ttGx197kPf1OBUxy+puVO9fVHprENLbEq8YVXJeXpgzoFCt5A4gmAh3/pXzdKBpmf3kX3EVZXQ+tjtaXPJAQB1eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5pxhrjfr2xsDemwg/JBppWDxNpQYg4i28a9yRuKZYVs=;
 b=oO0FqJuaB8lBKkw6uERvLWy5sws2NqndGsNCXxUEULcwqxB3kzScbXGriGQoJGTdChnij1zgMU9ed29sn3GVy2HG92AWktWmwrtElrrMnzleALF6YWLAjU+0DueZ5XuFNjffDeZA1kNpyS7Nobe6DJa9WPLUbLkCmtLx7uzbQac=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OSOPR01MB17772.jpnprd01.prod.outlook.com (2603:1096:604:467::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.11; Fri, 12 Jun
 2026 13:51:48 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.21.0113.014; Fri, 12 Jun 2026
 13:51:48 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>, wsa+renesas
	<wsa+renesas@sang-engineering.com>
CC: biju.das.au <biju.das.au@gmail.com>, Ulf Hansson <ulfh@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
	Philipp Zabel <p.zabel@pengutronix.de>, magnus.damm <magnus.damm@gmail.com>,
	"linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v17 00/17] Add Renesas RZ/G3L SD/eMMC support
Thread-Topic: [PATCH v17 00/17] Add Renesas RZ/G3L SD/eMMC support
Thread-Index: AQHc8yZFMuP1bVIRGUixq2TgdBuPhLYsZmtggAAF44CAAAEkYIAOhcOw
Date: Fri, 12 Jun 2026 13:51:48 +0000
Message-ID:
 <TY3PR01MB113460D9FC3AE79E9391DF4C286182@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260603065731.93243-1-biju.das.jz@bp.renesas.com>
 <TY3PR01MB11346485C16AFB6299B1711FD86132@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <ah_Ve65DvPhlTZ7a@ninjato>
 <TY3PR01MB1134651DFD308D3DD8AB20FE386132@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To:
 <TY3PR01MB1134651DFD308D3DD8AB20FE386132@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OSOPR01MB17772:EE_
x-ms-office365-filtering-correlation-id: 36facad5-6ef9-4c7a-0ac0-08dec889bf7d
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024|23010399003|38070700021|22082099003|18002099003|56012099006|11063799006|6133799003|4143699003;
x-microsoft-antispam-message-info:
 I93BvkRCY/jtlmbugFKDGpiHETFf4uGzYztN5y9LXXtptBuFqiYTrH0CAttzLuz8yJcLcCnLam6RNJqXVftj7+gEXn4N5H0i77oPyn+9XH/LtGZ+LpCQ1gevZlf3m9NX9vnrVBVGxRFNG1kbhWADGi21MDONl/STrseFCUBBx7tTmsOVkzz/O1WTPSBAgsU3thFGlpggXM6fLaVYVVhDYmj+EPzhVf3Dy4N768WV9YWbiK+WT6jdZquRRKigVkTM+dmMtsXMefJ6hrD9oBz3AJXOLhdWSsfrlZxbI2gl75mHEeijkowIZtGMduDZp3b+ydan3xNQIDPNavn6qGbfZOlbFMi8qP7c9M1HEN6klf9WBkVh6Vmbn98Hwz0B5TTJeG8qnNv3zEmQg4+Pqi3/TJQHFWGJUBcegFKhqMfowg4CElPN5yKQHUoEh8VItf0mFz6edL6j2Pbur5kE9O9jlwWQWr51Te3vuwd1PluvBhc+PAzu0X7ApNkIe3PTXSRbAuXnh3U32W2tDIzlJgp3SSZgLodK/vPPSnpJmlH0h5IptR7t+3KwLazO05ZVejhHCFDz7gprOwgAY+M2K2yXCIAy2e0WQBQGR0qnfrJqTDQVFKJDA9T47fe1NZ9dB8VWld178NT9KZQ8QRLH87Zr7XCY5cUKyqGEO9noIXdcFnrjWhWsF9k0M/9zgGD0ckL79Luvf7hMBkJdZJ0sXJDywhqSuS3hhGxOH17mOeRS152jzFNEf/TIT+5VlQOmRf3z
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(23010399003)(38070700021)(22082099003)(18002099003)(56012099006)(11063799006)(6133799003)(4143699003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?CXVV263RAy2+frGczT3cFY2DAkExZ3d10JMGrpRdg1AIEzef5cxEl+dxNtdA?=
 =?us-ascii?Q?ww3dN8gEwMDqL0IUICzcp4qD4TUPQobGDsT3N2j36+7/aXNIiKn407ui6FcK?=
 =?us-ascii?Q?/k2epGXC0gEgo6Yig23qoATXEfpWPcaYLWB0mLVaWD1xbp7U2CJGRPPLVrH4?=
 =?us-ascii?Q?SU1HVJuQ9Nr1PbpYDqCpWRHrAMZu+mKsCe06NsOpaOzUz91FUDJQOHfFC2y2?=
 =?us-ascii?Q?UiLT4nAl/UhEGgHPmVxB1jET2A8JbJpPvAGlNQg7km7jzoXybjSyH7q/SAc/?=
 =?us-ascii?Q?r/AO4AySbECxeEgCx6t4UI9l7NCiC5PEffHz8PW/8ynU7lnIpSMMJmATF2od?=
 =?us-ascii?Q?thRtqC1PV+673C5fEyK9P0h9EOpQh/yQQXZhH8ZBn4hWQx82ru/HtrrAFOL0?=
 =?us-ascii?Q?u5SoiL4O/TcHqVnWD+2Qt2dp8f+0j3FFsjnf8IEHPeOc2htwfL2YzSrZBdeO?=
 =?us-ascii?Q?R5y+xJ0BLGM8hHNWbdn1KfWqkT0n+lpSbnBHixEYytBPyhRG75wvrls9oxom?=
 =?us-ascii?Q?FC4BFREMfH/uf9k942CDIxjQXtNa0Aev5LrI3UwX/JYh9mePW86mHHEk8EPY?=
 =?us-ascii?Q?0wpHxkW1r5EyOJv87TXIDOmBntdeDPt4DzoWcKgLcm1VISOx92ek6L2/n2ax?=
 =?us-ascii?Q?AhOt1PCEEm/hRn5UHPuia0D+Fxk7J3Wz6nBp6ZxmC0xqM6yy1nfvZcPIaN5+?=
 =?us-ascii?Q?Jr5QE+n4s8qtmuV4Mc/0y27R5GqL/8jmXB+JH/P6QlYKxyUJdwa2dkckI3zm?=
 =?us-ascii?Q?il1UGKp4gI4LaZ32xYcTovlDVlYOlinJ+eDgEbccZ7r0Fd2yFRx5rUFNDO5x?=
 =?us-ascii?Q?A2qgkxgBa+6FLlU3dJ4+f455UhkAxvLiu+D0TEaAxPj4H2ElNXcpK7QeVhhZ?=
 =?us-ascii?Q?PMJhQhpz+S6yTF5AfFvcnuf58qe0lGvtDe27cFS/pJ6qq0e+DpFGXVGWYOtR?=
 =?us-ascii?Q?dxSG5gfNpa0Auog5wt5qxe1mQy5JlSdYkksInkofMLBZfzMQySYjTmvxxRrL?=
 =?us-ascii?Q?T6JTy5Lda6mMXusMecAVQri10TCJDe1wc8G06GTEuVOKXCQl/r6S3A/yCEU9?=
 =?us-ascii?Q?s0A0ml34GVEWTNE/EPMzaeTOc5zo+NYb9kWx5c92ymZEwYIHGhU6qpjNiegC?=
 =?us-ascii?Q?gXAboO+QkzGhCmEUY7qK/S1PEZPXFFCsnMW84KDOGE+jQpjhmUVTC+ejy5EF?=
 =?us-ascii?Q?CnPFuHjYoDxfyBmFEm0JSb7EhADcJ+6OktigEdjavAStIFuwpeMVpbKhIuKx?=
 =?us-ascii?Q?tcogsKfD2r9LDkW3aAFJj5FrN6H9wniB8Y0vP4GIeL+RZ0QDeQbQCj7+30fK?=
 =?us-ascii?Q?x/uC5qixkJAoAvXhmTbup3JRlcbEYgFp6oaT0Idz6UW7oqTtNOB8Pci+Ks2Z?=
 =?us-ascii?Q?gPmiz3T7tc1qdJMPH91pEZmIlIO3m9aIKTnH9oP9bnBLHZxZIROEuPobkiFA?=
 =?us-ascii?Q?UYMz1zmM7SgkOrZqlozBGevpnRxWjjlaURE+XsOIZwdsfQg8pH6SkoivXjvU?=
 =?us-ascii?Q?X+op4sDAYq604/goERmQcT7drN0qPbPA4XtZvkHwW3BPuyj7a5zRhyJJnPeD?=
 =?us-ascii?Q?AiSLws1UhFgObCrHtczd/7rR04qQBNY2xIn+2JFYc3+YDK+uvCH1NvwWKfUU?=
 =?us-ascii?Q?Cd1kAq/QaX7bovRn2aTUHHwzcs3SgU7A2BF/AzDrpOH1OeH+jxmx3L3N6bGg?=
 =?us-ascii?Q?cpF6nNF1NriAPzP140Y0gUK9u7r3buOL5moQMvOOZ3wxa4BqB2fO8CqPtR1E?=
 =?us-ascii?Q?X3TykrP+Yw=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 36facad5-6ef9-4c7a-0ac0-08dec889bf7d
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2026 13:51:48.0650
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nOtlj3lctO34OGvi1VXXC7/HuNtKcyTKJ07wtfyKLj4EaF1vHrAuH7theat+VqXw+F9ZG1HmVscfPLFQUvbTuZwWEjv3pYo6ak6Tf7Z2I7Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSOPR01MB17772
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	URIBL_MULTI_FAIL(0.00)[sang-engineering.com:server fail,vger.kernel.org:server fail,bp.renesas.com:server fail,TY3PR01MB11346.jpnprd01.prod.outlook.com:server fail,renesas.com:server fail];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33923-lists,linux-renesas-soc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:biju.das.jz@bp.renesas.com,m:wsa+renesas@sang-engineering.com,m:biju.das.au@gmail.com,m:ulfh@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:p.zabel@pengutronix.de,m:magnus.damm@gmail.com,m:linux-mmc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:wsa@sang-engineering.com,m:bijudasau@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,glider.be,pengutronix.de,vger.kernel.org,bp.renesas.com];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sang-engineering.com:email,vger.kernel.org:from_smtp,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid,renesas.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 31426679FA4

Hi Wolfram,

I found some bugs in RZ/G3L in between

1) SH_MOBILE_SDHI_SCC_TMPPORT2_HS400OSEL bit is not available in RZ/G3L, bu=
t instead used
   as timing value 16 instead of 1.
2) RZ/G3L needs to set HWADJ2 delays for 3.3V and 1.8V operation
3) When I added HS400 mode support, forgot to retain HS400 bits (HS400EN an=
d HS400ENHSTRB) in
   renesas_sdhi_execute_tuning()

I will send v3 with these changes, if it is ok for you.

Cheers,
Biju

> -----Original Message-----
> From: Biju Das <biju.das.jz@bp.renesas.com>
> Sent: 03 June 2026 08:27
> Subject: RE: [PATCH v17 00/17] Add Renesas RZ/G3L SD/eMMC support
>=20
> Hi Wolfram,
>=20
> Thanks for the feedback.
>=20
> > -----Original Message-----
> > From: wsa+renesas <wsa+renesas@sang-engineering.com>
> > Sent: 03 June 2026 08:19
> > Subject: Re: [PATCH v17 00/17] Add Renesas RZ/G3L SD/eMMC support
> >
> >
> > > I will fix the issue soon.
> >
> > No need to resend from my POV.
>=20
> I will wait for review comments then.
>=20
> Cheers,
> Biju


