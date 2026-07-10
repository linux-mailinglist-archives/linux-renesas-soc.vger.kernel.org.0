Return-Path: <linux-renesas-soc+bounces-35013-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lxVYHx6yUGpO3gIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-35013-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jul 2026 10:49:34 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 200B5738A64
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jul 2026 10:49:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b=JJuaOB6y;
	dmarc=pass (policy=none) header.from=renesas.com;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-35013-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-35013-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D95B8300D141
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jul 2026 08:42:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45ED83D79F9;
	Fri, 10 Jul 2026 08:42:07 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010012.outbound.protection.outlook.com [52.101.229.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 283133F12DC;
	Fri, 10 Jul 2026 08:42:04 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783672927; cv=fail; b=iNigqza7ON73m5jTE4kLwM+aGPmP/P6F8ONRnrfN9uHHq34Ya2gLMKnkkbpAfC0SYhLS9CXGYx0eHnP9G+wuxn7QeIiQkUCEFIaItd2UdrZP9BAzFiGop777kGjTzSc5oHlGgDAHx0PwaDWXyGIgKR2BR0WqhzpEVVRtpoD8Hpc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783672927; c=relaxed/simple;
	bh=9ivZ+VH4a/ycy73BcOFD8BZoHvJx1oNvYx6sPHh5s0w=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=R8hZeldKtPN7Ebov0S0j3sEBB5O94IZcl7XMSyqgHbXb2RhwayAJJrimloVzgb5UbvtzzFdOkZ3yYImV+jYwauWN4aTlESR0LRKkkjxTgHxphZix2qcjgabG/ex8TbEuFPR5U8cUlKbdki6mgpd3IqQrUb/f2ZhCPkencTJ7BDs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=JJuaOB6y; arc=fail smtp.client-ip=52.101.229.12
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FGnwXDUtq+2826vDdujf7P1xU4RGZZNrXfaoYAFCN16kd9N/9M685jV+/SpF+vhpDHUo5fb4zddWMeyY4+NLGR0yVzhJscKp0eiDaJJ0INoGmkGQQ+LDocZBYXMyA7HoDSkN3OLdsrGAYt5Nbavo169vCHtnQ7cRI+DTJoNXKcpMsjJOVg5lKeIKwfOO70oMCM120XDfdfZ7qONd1AuF7sCOs9fMbMNZ2QaFEpZ/KgYUpPIsSIB+gsE0BUysMaZCOhyIgdsqeo61SzODEt3KMHH1E+P2+zZveszCwo5stu9q6nVbh+hyaDKkHrsYpLz5VRLxCR8wobvNOuxppoPS7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=htXCRKMVLyn6oWQjLegy90W31mg7zagwML5nd7tDnbk=;
 b=l+5HdgcpGmJ3I/c+0T3wX/rqId16WymG83bXRhSKgylOMpr6NJfpGyo0HDLlz8lh3bNPSKL27SiS8WNOAO3uSe06nU9Q1O9ZWxuF0kRMZYX32yAEnryQitKI2sviDPrd9slr5NzFY1A82YF0in2aR64hXZ2vsWUq/kk+7zXhIakGHFNIfmPJ7paLJ1rKmcTUaZJ0JBkwZ/zslXXcFrctCDH0fMkPGFOlt0z0ZV7ZJxtox2V4DTwhU1y5BfQfL6PWGCs8FoOeJqDwvi5lC57HnaD5psKcGqqQr4xlcfsOf8StFiDhVQuxXy2zv1Js3enQSjN/J8yWGSCU06TApvVU7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=htXCRKMVLyn6oWQjLegy90W31mg7zagwML5nd7tDnbk=;
 b=JJuaOB6y+vIUO7lvI54xKB0lOFiyM/B1efJV5VGAPOgvGMysAO6OTsxuJFU/L3EwZdMA4idWGdU28t3hdQLLRI2I8TFC1hfJx7TMPDaw5HZIAVE/2SsnenZmJTENclMidVCMo9c/kIXiA2D+0a+F3s598MVDSEi3Gq8CDRzODxI=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS3PR01MB7732.jpnprd01.prod.outlook.com (2603:1096:604:179::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.17; Fri, 10 Jul
 2026 08:42:02 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.21.0181.009; Fri, 10 Jul 2026
 08:42:02 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: biju.das.au <biju.das.au@gmail.com>, wsa+renesas
	<wsa+renesas@sang-engineering.com>, Ulf Hansson <ulfh@kernel.org>
CC: "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH v19 05/12] mmc: renesas_sdhi: Add tuning delay support for
 RZ/G2L
Thread-Topic: [PATCH v19 05/12] mmc: renesas_sdhi: Add tuning delay support
 for RZ/G2L
Thread-Index: AQHdD9lCj3OfpJGuqEOWAXgZDhqTd7Zmb0ZA
Date: Fri, 10 Jul 2026 08:42:02 +0000
Message-ID:
 <TY3PR01MB1134675EB2523D3750C08DA2A86FD2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260709192916.630794-1-biju.das.jz@bp.renesas.com>
 <20260709192916.630794-6-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260709192916.630794-6-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS3PR01MB7732:EE_
x-ms-office365-filtering-correlation-id: 4a8b7377-9bcb-462d-69cc-08dede5f1d2c
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|38070700021|6133799003|56012099006|11063799006|5023799004|4143699003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 9VIdU7/ldLfw0uVmccbLHYNYnCWR6PaYTppF4kRrR2UOB5nePNMK7ktsbWba/yCSOBUxekD9nJ89IS6cioBOa0iXepAP7aW9GAj1iws9BHUDVw0By47Udiu06lnGWNZZZYEBXhtW3Uony8FsHxtjtFLmDwq8IwiGSgj/1qEOCfQ8HFtA6jJ1YnxPv7KdYdgb26QDMxOmjwph8GZpUKFgIdR3Nh3CES1l/1tkQwGydj3d6I28PzhIsKPX4lLtGrNvvgpTSYyoXuxHinVs+U/CZUpI485wwjJFs3Jk8ghXvw4GXW0/CqyGXid+Zp3gXrRfFF6tepj9/gL57pvQaDrB+dq+i5IuiKx6TsvjLx/Wk/aCYSgRy8HFZHAWTHfdxaA/0j7XaCVv5JTCtTGCcgBH5gcfkOy60vFhPJvxO4GJGo1yMDIBo3IpQ4eiU+U7ZBaR95RceQQ46mnvCKO1VMulNNGM9mc4Fo7qgPuatWz4wK36KQe/FPz/KVndItgzPaf0p6jADlrIpNFWRBFiYMptGiF5Wm/jb6JGo1VnCeWAUwxNqdGJnEg9S/4zm3pMS6EjnAj3NMi2MIEZkw4Fs3RImRnw09UqDBrgXp8tBQFt5CT7Z6ELacir3WIrSBioYznglFEJ5hiBDa6bje2Ub4T2A3XuWkdfW2UUONkO+FjpcZU=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(38070700021)(6133799003)(56012099006)(11063799006)(5023799004)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?AnThejTxK4RE3P0FBUy5YVo9bvd/QtTMgBPyXXOHMPCqRwvYHcQf+/2wB1nB?=
 =?us-ascii?Q?ylYMHd3ZOHziSXpcpbmZisXIt2BdqPNV7A9eCgdSvaDTk6BWENUSfXgmRixj?=
 =?us-ascii?Q?9iWD/cs99fbyQMGvW1gau6c3OUhSw5BSEy9qH8hbqGxzQ6UrfGMD1KEs6Sl9?=
 =?us-ascii?Q?fPDFu1yfSg+UpOlWQPrLt1Z7hkDeJjV6cLlfUXMNwLCQHabrw/PNEGSysbzh?=
 =?us-ascii?Q?gwtgiaTXmeweGakDEozxu4oWIWWFL1XRwqMli8RbgwBbZluvVv/EA2aLk+jG?=
 =?us-ascii?Q?BEY6DEv/x88ZqGDvaeGAv0RUD4i8KQe/VFatTK8vAaTbMyn6/5LledwM4MUG?=
 =?us-ascii?Q?NOEOOI3WuaUqNOzVy4eyOZFnhMdJnPAiCq1Nn6pQ28BSEQF/c9SH3UfU2zmH?=
 =?us-ascii?Q?FGG9dWkqtLcTS4sKZCkCn5z76loCV4HYKbAnIg0dW1LmaHENVT8m6twroSjc?=
 =?us-ascii?Q?6wh3eLMPMTVfYYAjuBvmaZPOnldwXqAhUC+pIWgQKEl3iDX1tvPd/PD1K668?=
 =?us-ascii?Q?kodjxDLPQ7IF3T+TbdSnKMjBkgFd02PRcw3B618SzxtxpQsDiF1GRnSDTpjs?=
 =?us-ascii?Q?Oki4UFDLuia2k8JDuGd1CS68MaK1YzurYKnysm39pvf/DYDxBuU2BrkVAAk0?=
 =?us-ascii?Q?D2k6LZ6TBf3YSdm44XbZeaGjS4c2bS7JWsacvFxk8QAhMjlhcYvEdH952ZXZ?=
 =?us-ascii?Q?RqYUCOaf40THDHlk6KEX5lnzcZUMRiKYjHYzuj0p44G8OJKoPB1qGOszGYgJ?=
 =?us-ascii?Q?4ii/TyPwor3Bd3m9eDxDenKAiK65e5ZtzwY7cfRtJb3kx0S2noE5sTjLDC9b?=
 =?us-ascii?Q?DOb0PB7E+0PpspGTtLpOrulHDqhU5BYYAL5lVKa+Rd4JJh33ILCiq9C1GCfd?=
 =?us-ascii?Q?HwevLArA704iMMA8Jw/q12pv1VD3OOvB4wGHpwkj95XIdtiqlz3BbwGBD5AJ?=
 =?us-ascii?Q?CZZs8CjnMLFEBQuGCPEkt9OPuP+pSA19HXnNtGKvaAj3P0iQXaNG7q4dtCMN?=
 =?us-ascii?Q?JkTnFR7mNxEQVvbvYiM8uFKtNV5bRbY7ufc7Vr3j6lBh9xgI/N08z5r7Wnxx?=
 =?us-ascii?Q?uoDzI5w9wVRkFKNb0c8uv2L/9IWfcIhiUTKUWAXnjXeT2VbdLOiiLeYMbAU0?=
 =?us-ascii?Q?H2uwnj+JIsH2ISSc9JFgsU/rgvzEGQ3Cbn+Vno827qZd7+9hmNjTdZQZ+tp7?=
 =?us-ascii?Q?/a1uyQOJteJ0zY6sJ7dkKpWlhNURYmvPKJ5upWhoiLLmBPyRZEZRnfWJ1WT0?=
 =?us-ascii?Q?duGrI4OyRkee9uxO9DYl0iQv4Nnq20ljTfYDIetob8UgDOn0BmlV2lolpHi2?=
 =?us-ascii?Q?mNfWrPjrakBpYxs1nusd23dC2ihgEWx8USfN8mGhdRCiQJdpIjej2EwH2brt?=
 =?us-ascii?Q?qnE/ZiF3ewtlDN7xAMZu+96k4dwG5rgG5mmNDTWkRhhRbugJGKwTf3/qD7ru?=
 =?us-ascii?Q?UJi3t1c0uttiSnWo1YC7iX372KAX4q7Nnwif1TFUbI508wlvARVry0VQ0VHx?=
 =?us-ascii?Q?smBBMoIMdCsgD1++KSfUW2B5RPedKGnk9CIPYn2mrhNMFIgrAjKFTXIhCHJH?=
 =?us-ascii?Q?jQCZQxak5OuU2gdkSYtmIyRdgGvpLPM6BZU3vWA9w4UuFvcri0QwZneq98Yt?=
 =?us-ascii?Q?5hoOK0vJOe4ndKRNfiv4JRVddB9VYFjql62NnvGt+wZBi8jS7Y50s1o/Ge1Z?=
 =?us-ascii?Q?soMRF4VxO6s0CcsHoO0SfXfeMaMts4GQDeJBmoUyHp8gBr/lQ1JvrPK4eTqN?=
 =?us-ascii?Q?ANoNNUmu7A=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a8b7377-9bcb-462d-69cc-08dede5f1d2c
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2026 08:42:02.4939
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Uw8Gj7IYnm/R7NXb72Rp9lsDjysfnZt4oRZfqndepu8EVZhJLNdPTafQx347sZjg3UrV40LkJjZb1Kzy/UaUdMjzZJzGPZhEyTMsOFV7Qng=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB7732
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
	TAGGED_FROM(0.00)[bounces-35013-lists,linux-renesas-soc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid,bp.renesas.com:from_mime,bp.renesas.com:dkim,sashiko.dev:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 200B5738A64

Hi All,

> -----Original Message-----
> From: Biju <biju.das.au@gmail.com>
> Sent: 09 July 2026 20:29
> Subject: [PATCH v19 05/12] mmc: renesas_sdhi: Add tuning delay support fo=
r RZ/G2L
>=20
> From: Biju Das <biju.das.jz@bp.renesas.com>
>=20
> Some SoCs, starting with RZ/G2L, require a hardware adjustment delay to b=
e written to SCC_TMPPORT2 when
> switching signal voltage during tuning. The register value differs by vol=
tage: 0x1 for 1.8 V and 0x0 for
> 3.3 V.
>=20
> Introduce TMIO_MMC_TUNING_DELAY flag (bit 13) in tmio.h to identify contr=
ollers that need this behaviour.
> Add renesas_sdhi_set_hw_adjustment_delay(), which writes the appropriate =
value to SCC_TMPPORT2 when the
> flag is set, and call it from
> renesas_sdhi_start_signal_voltage_switch() after the regulator is configu=
red. Additionally, reset
> SCC_TMPPORT2 to 0 at the start of
> renesas_sdhi_execute_tuning() when the flag is set and tap_num is 8.
>=20
> Introduce a dedicated of_data_rz_g2l descriptor carrying the new flag alo=
ngside RZ/G2L-specific
> capabilities, and wire of_rzg2l_compatible to it instead of the generic R=
-Car Gen3 descriptor.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v18->v19:
>  * No change.
> v18:
>  * New patch.
> ---
>  drivers/mmc/host/renesas_sdhi_core.c          | 86 +++++++++++--------
>  drivers/mmc/host/renesas_sdhi_internal_dmac.c | 21 ++++-
>  include/linux/platform_data/tmio.h            |  3 +
>  3 files changed, 75 insertions(+), 35 deletions(-)
>=20
> diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/rene=
sas_sdhi_core.c
> index 5c478995d660..832a7a7be725 100644
> --- a/drivers/mmc/host/renesas_sdhi_core.c
> +++ b/drivers/mmc/host/renesas_sdhi_core.c
> @@ -256,40 +256,6 @@ static int renesas_sdhi_card_busy(struct mmc_host *m=
mc)
>  		 TMIO_STAT_DAT0);
>  }
>=20
> -static int renesas_sdhi_start_signal_voltage_switch(struct mmc_host *mmc=
,
> -						    struct mmc_ios *ios)
> -{
> -	struct tmio_mmc_host *host =3D mmc_priv(mmc);
> -	struct renesas_sdhi *priv =3D host_to_priv(host);
> -	struct pinctrl_state *pin_state;
> -	int ret;
> -
> -	switch (ios->signal_voltage) {
> -	case MMC_SIGNAL_VOLTAGE_330:
> -		pin_state =3D priv->pins_default;
> -		break;
> -	case MMC_SIGNAL_VOLTAGE_180:
> -		pin_state =3D priv->pins_uhs;
> -		break;
> -	default:
> -		return -EINVAL;
> -	}
> -
> -	/*
> -	 * If anything is missing, assume signal voltage is fixed at
> -	 * 3.3V and succeed/fail accordingly.
> -	 */
> -	if (IS_ERR(priv->pinctrl) || IS_ERR(pin_state))
> -		return ios->signal_voltage =3D=3D
> -			MMC_SIGNAL_VOLTAGE_330 ? 0 : -EINVAL;
> -
> -	ret =3D mmc_regulator_set_vqmmc(host->mmc, ios);
> -	if (ret < 0)
> -		return ret;
> -
> -	return pinctrl_select_state(priv->pinctrl, pin_state);
> -}
> -
>  /* SCC registers */
>  #define SH_MOBILE_SDHI_SCC_DTCNTL	0x000
>  #define SH_MOBILE_SDHI_SCC_TAPSET	0x002
> @@ -350,6 +316,55 @@ static inline void sd_scc_write32(struct tmio_mmc_ho=
st *host,
>  	writel(val, priv->scc_ctl + (addr << host->bus_shift));  }
>=20
> +static void renesas_sdhi_set_hw_adjustment_delay(struct tmio_mmc_host
> +*host) {
> +	struct renesas_sdhi *priv =3D host_to_priv(host);
> +
> +	if (!(host->pdata->flags & TMIO_MMC_TUNING_DELAY))
> +		return;
> +
> +	if (host->mmc->ios.signal_voltage =3D=3D MMC_SIGNAL_VOLTAGE_330)
> +		sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_TMPPORT2, 0x0);
> +	else
> +		sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_TMPPORT2, 0x1);

Looks sashiko's comment is false positive as after the tuning only we set H=
S400
registers. So it it is safe to unconditional writes here.

[1] https://sashiko.dev/#/patchset/20260709192916.630794-1-biju.das.jz%40bp=
.renesas.com

 }
> +
> +static int renesas_sdhi_start_signal_voltage_switch(struct mmc_host *mmc=
,
> +						    struct mmc_ios *ios)
> +{
> +	struct tmio_mmc_host *host =3D mmc_priv(mmc);
> +	struct renesas_sdhi *priv =3D host_to_priv(host);
> +	struct pinctrl_state *pin_state;
> +	int ret;
> +
> +	switch (ios->signal_voltage) {
> +	case MMC_SIGNAL_VOLTAGE_330:
> +		pin_state =3D priv->pins_default;
> +		break;
> +	case MMC_SIGNAL_VOLTAGE_180:
> +		pin_state =3D priv->pins_uhs;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	/*
> +	 * If anything is missing, assume signal voltage is fixed at
> +	 * 3.3V and succeed/fail accordingly.
> +	 */
> +	if (IS_ERR(priv->pinctrl) || IS_ERR(pin_state))
> +		return ios->signal_voltage =3D=3D
> +			MMC_SIGNAL_VOLTAGE_330 ? 0 : -EINVAL;
> +
> +	ret =3D mmc_regulator_set_vqmmc(host->mmc, ios);
> +	if (ret < 0)
> +		return ret;
> +
> +	renesas_sdhi_set_hw_adjustment_delay(host);
> +
> +	return pinctrl_select_state(priv->pinctrl, pin_state); }
> +
>  static unsigned int renesas_sdhi_init_tuning(struct tmio_mmc_host *host)=
  {
>  	struct renesas_sdhi *priv;
> @@ -709,6 +724,9 @@ static int renesas_sdhi_execute_tuning(struct mmc_hos=
t *mmc, u32 opcode)
>  	if (!priv->tap_num)
>  		return 0; /* Tuning is not supported */
>=20
> +	if ((host->pdata->flags & TMIO_MMC_TUNING_DELAY) && priv->tap_num =3D=
=3D 8)
> +		sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_TMPPORT2, 0);

Same here.

Cheers,
Biju

> +
>  	if (priv->tap_num * 2 >=3D sizeof(priv->taps) * BITS_PER_BYTE) {
>  		dev_err(&host->pdev->dev,
>  			"Too many taps, please update 'taps' in tmio_mmc_host!\n"); diff --gi=
t
> a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesa=
s_sdhi_internal_dmac.c
> index 2bf354331b2d..8476678d47a6 100644
> --- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> +++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> @@ -142,6 +142,25 @@ static const struct renesas_sdhi_of_data of_data_rca=
r_gen3_no_sdh_fallback =3D {
>  	.max_divider	=3D SDHI_MAX_DIVIDER_DEFAULT,
>  };
>=20
> +static const struct renesas_sdhi_of_data of_data_rz_g2l =3D {
> +	.tmio_flags	=3D TMIO_MMC_HAS_IDLE_WAIT | TMIO_MMC_CLK_ACTUAL |
> +			  TMIO_MMC_HAVE_CBSY | TMIO_MMC_MIN_RCAR2 |
> +			  TMIO_MMC_64BIT_DATA_PORT | TMIO_MMC_TUNING_DELAY,
> +	.capabilities	=3D MMC_CAP_SD_HIGHSPEED | MMC_CAP_SDIO_IRQ |
> +			  MMC_CAP_CMD23 | MMC_CAP_WAIT_WHILE_BUSY,
> +	.capabilities2	=3D MMC_CAP2_NO_WRITE_PROTECT | MMC_CAP2_MERGE_CAPABLE,
> +	.bus_shift	=3D 2,
> +	.scc_offset	=3D 0x1000,
> +	.taps		=3D rcar_gen3_scc_taps,
> +	.taps_num	=3D ARRAY_SIZE(rcar_gen3_scc_taps),
> +	/* DMAC can handle 32bit blk count but only 1 segment */
> +	.max_blk_count	=3D UINT_MAX / TMIO_MAX_BLK_SIZE,
> +	.max_segs	=3D 1,
> +	.sdhi_flags	=3D SDHI_FLAG_NEED_CLKH_FALLBACK,
> +	.clk_mask	=3D SDHI_CLK_MASK_DEFAULT,
> +	.max_divider	=3D SDHI_MAX_DIVIDER_DEFAULT,
> +};
> +
>  static const u8 r8a7796_es13_calib_table[2][SDHI_CALIB_TABLE_MAX] =3D {
>  	{ 3,  3,  3,  3,  3,  3,  3,  4,  4,  5,  6,  7,  8,  9, 10, 15,
>  	 16, 16, 16, 16, 16, 16, 17, 18, 18, 19, 20, 21, 22, 23, 24, 25 }, @@ -=
263,7 +282,7 @@ static
> const struct renesas_sdhi_of_data_with_quirks of_r8a77990_compatible =3D =
{  };
>=20
>  static const struct renesas_sdhi_of_data_with_quirks of_rzg2l_compatible=
 =3D {
> -	.of_data =3D &of_data_rcar_gen3,
> +	.of_data =3D &of_data_rz_g2l,
>  	.quirks =3D &sdhi_quirks_rzg2l,
>  };
>=20
> diff --git a/include/linux/platform_data/tmio.h b/include/linux/platform_=
data/tmio.h
> index 27ea21c00419..868a21842fa5 100644
> --- a/include/linux/platform_data/tmio.h
> +++ b/include/linux/platform_data/tmio.h
> @@ -50,6 +50,9 @@
>  /* Some controllers have a 64-bit wide data port register */
>  #define TMIO_MMC_64BIT_DATA_PORT	BIT(12)
>=20
> +/* Some controllers have tuning delay */
> +#define TMIO_MMC_TUNING_DELAY		BIT(13)
> +
>  struct tmio_mmc_data {
>  	void				*chan_priv_tx;
>  	void				*chan_priv_rx;
> --
> 2.43.0


