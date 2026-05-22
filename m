Return-Path: <linux-renesas-soc+bounces-32967-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WI6QCxFLEGqmVwYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32967-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 14:24:49 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 305075B3E0C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 14:24:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 318B430A2C30
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 12:08:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2C7937B00F;
	Fri, 22 May 2026 12:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="P721jhE5"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010034.outbound.protection.outlook.com [52.101.229.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 393A837AA9E;
	Fri, 22 May 2026 12:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779451645; cv=fail; b=eGRzgFD4JwKrC/sJt9nkq5a+gS3dNx1HdCwfPiQWfIBsAHsY0Hs0TbxMH5tk0fdQTyOOP451j2697iwB66HGY4h0HY7w+D1EbosyPyZv7WHhzmNQN86Sp1u3JPTLp3vKmc7IC3XjHL6ZHwaQAnfvRdeo5IdiXjO2oPLynfOZCf0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779451645; c=relaxed/simple;
	bh=ZzzV0NXEH4bZcr/4ufUpkr/LYC1HyWLOEryj4t9x5Ks=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=beJay4jbRJ1vhmeOOyAgcFnY3M8uaQexyledQ6JBnWbQ0805HH9eL6Qb1n/ZTAIeCpm1b0cKNxwdxFYSPH9kdACZsXaelEEDLsygbxzne2+wivmsrHC8y/2bt2KR4SHIiO1mFB+C8XBH6w1kBY8OPWy1lNGILS9iuJe/4MCst6w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=P721jhE5; arc=fail smtp.client-ip=52.101.229.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J9aWKIP3NahSeI0xzw4AXhD94t+p5tAq0KVN9SqTJKYq46Bu7Tl4OQ3eemLul1vNamn8MWaKViYIoswC7ouurSy/LSeYbeuLSDL29fbMw3rKnsnuN61dr6o2J2BSTdP1a0cnp28hILjrSjvVP7/DTwLtUWO84SVESi8HKB3Z9DYmLiQrQxfGb+bJ2ylu47qgRUN+R0QV5BT8c6MgTjP/KouN14sGj5ByTi6T44niMgZVj8o+APrN4+OS1MhXTa2gLlUGrA9eM2NnwizEND/6TpSyib/lKpkIqR4aRzJE9NZM3GVlzMeo1wdIXRCW9iW+hOJj4ic8xbXcnfyEPcfvqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ubEipok151Qm2Vkp4cXalDK+7yZNWhTI1l3ja/EBNcc=;
 b=X/UaQ/HY2rGsuQjJDX5mq/Ktdsc9E3Dx9UILWF1ZlenQnU2UT3lZ4eGoxFdYh1TVVKWLq2jSwg0qNG6ZijUAVLoVxXIsDEQ/T3HOnJfErfxnhxEeyxnjkDqi/K+TMRhXp2WxcI31pey9W8VjcnrnM1JjxwW2zUyns5pZMxYRY/Sy0DI6K7kIdl1cdMj8FKPeigKiFY0RW5TN+84nx2919gezm6mzNZP1RK5CVipvs3kS0Nottac3sky8m/P8kk9R+T+Qh9EEeN6cJAW8r2EotgyEkviyznceE+u9YnlmkdI8CoXbAoVtxRfCkucqHpTrK3o/NqpNr2Avl7Tvy1ybbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ubEipok151Qm2Vkp4cXalDK+7yZNWhTI1l3ja/EBNcc=;
 b=P721jhE52XH5A/yl37BING2SfJKY46L3zOnj0v3VPtbMV2hyq3tZ17F+AhObgbONSJwN6P5VB+HML/DUmclrePcHwHTFA3jHHS6D0R3K+Q+dyZxmbN/ZlCaW9GtPpmdyLkBMz6bOqzFcIgj0fc66+Yv9uEjMxFwLPmhoyazdyjA=
Received: from TY4PR01MB14282.jpnprd01.prod.outlook.com (2603:1096:405:20d::9)
 by TYWPR01MB10612.jpnprd01.prod.outlook.com (2603:1096:400:2a1::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Fri, 22 May
 2026 12:07:18 +0000
Received: from TY4PR01MB14282.jpnprd01.prod.outlook.com
 ([fe80::655d:9c47:4499:eb3a]) by TY4PR01MB14282.jpnprd01.prod.outlook.com
 ([fe80::655d:9c47:4499:eb3a%5]) with mapi id 15.21.0048.016; Fri, 22 May 2026
 12:07:16 +0000
From: Michael Dege <michael.dege@renesas.com>
To: Jakub Kicinski <kuba@kernel.org>
CC: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	"andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>, "davem@davemloft.net"
	<davem@davemloft.net>, "edumazet@google.com" <edumazet@google.com>,
	"pabeni@redhat.com" <pabeni@redhat.com>, niklas.soderlund
	<niklas.soderlund@ragnatech.se>, "paul@pbarker.dev" <paul@pbarker.dev>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH net-next v4 05/13] net: renesas: rswitch: add exception
 path for packets with unknown dst MAC
Thread-Topic: [PATCH net-next v4 05/13] net: renesas: rswitch: add exception
 path for packets with unknown dst MAC
Thread-Index: AQHc4SOMjiP2EZKQr0qNzD7alKPrUrYLL2KAgA7R8QA=
Date: Fri, 22 May 2026 12:07:15 +0000
Message-ID:
 <TY4PR01MB142826C4D8BFD45FB4D3D6EDC820F2@TY4PR01MB14282.jpnprd01.prod.outlook.com>
References: <20260511-rswitch_add_vlans-v4-5-a5a225f8faae@renesas.com>
 <20260513013551.1408389-1-kuba@kernel.org>
In-Reply-To: <20260513013551.1408389-1-kuba@kernel.org>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY4PR01MB14282:EE_|TYWPR01MB10612:EE_
x-ms-office365-filtering-correlation-id: 3ded023d-b6d5-431e-aaa4-08deb7faaa48
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|11063799006|5023799004|6133799003|4143699003|56012099003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 PigcTa1aj/qZE1Wv/tj0Dcxsw7H1RR0JeYQ7g9iyI2R1H0+730QgeP9yiSQtr0M6lc0O1GTi4dzY7a6n6qZ93o4mcqbLRKtOF8rZO9qwjRvkvNMzUO6PqzCKrUvk78HVj72bq45MOpfIOTP/AalSRzdqtTLqx2eig2BPhuKpD2+n+Ee6uALIL6W5kln3a2uIVFhvg8psMhmikrtaD3DLwLv1faZhajAwD5liAk3oCY4n+/jIPGoUPIjXO75v9WfuUsabIfI+8DgdBQSx59ClcPnEQ+9fcRt2hfL/7NpAQydU/CK4DPDr+rRDNhn4q/gjwkliOZYrMgy6/FvehzqTICRwMm1FqQ1M4djTCT9akTARP0iW+4sZDohSFPuojD6d0/QequcLQQctouzwFsJlNuHh5McwP9f1nmok8Uv3N49q8LA6hySPQlE65qnPK/XQjDfCwuy89+Xxyx3Um8ydETzo81xpmJUPdJDXqlcWdHJdKVESeQlPAqUrDDDDHpDHYnYWIhSijXpE0mEmG71UjT3H1ZAWMNRXcOr2Im5M9V227pnsM4igjTwPzCqj5af4tgvtezpSy8ruAlIg6vdcwt2kp/8RYfBblYhfwJP+M3nXpOxYozr+hIwtvzl8dyc1nK86WgzU1dWPkU9mhOL3jOrRPkzgmjrgGcIpU64A0Lv2N3GtSz3nwH6IWEfPR2sgJksyjloxIkLQwXydUWG6T1hsERUH3beT5Z0/0qKgO74hn0s6peZn5LEcl7ver9ye
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY4PR01MB14282.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(11063799006)(5023799004)(6133799003)(4143699003)(56012099003)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?bqxgOQLhUvjDvXa9nWfJTZFc+M0FPMx6FsfhLt0VrtSWRk55bnqWV5y3Zg+Y?=
 =?us-ascii?Q?UxARkb5NOLIMHUOJHykTNXpc5Q/Cn5LWUkaObqFcF6sgUyswcgya+QpHtlY9?=
 =?us-ascii?Q?XrzeItioR45HPbh78HVSq6AfH2osxesa45JMqxZxV26wJ6PtnT6ciNPBPgwf?=
 =?us-ascii?Q?GwRHabyvFyjZ60dmkF6pSsd6WQg2mmq+btUKrv4Npu1FoSlwJ4RgR3btIFck?=
 =?us-ascii?Q?NdH4XmU81OXSkJmw+c4wazrq7LaHbIdO9/rBVVBovawhDcmlVFmat+OYFpBP?=
 =?us-ascii?Q?pcqa2/CrWx5G6CnwHqLF5+dhcfPPBzwQtWv2DJ39F8A8Ks+CR1chwZgbrSjO?=
 =?us-ascii?Q?m8aeoMUhEPsFwExPxR5j0+G5mN2YkQ5PzdTTMpWs8LMqqn7b4kqNkgglIKe5?=
 =?us-ascii?Q?MmTbRvQ1ab3Km710WLv7lkhhmRA0l9psqFeBRpfoQNJtfQhaBm6UQhy0BRB5?=
 =?us-ascii?Q?5AL2EpY1g3bWAsicbKX8zAed1Y4eHnFtvePIBb2Xy181GjhGWk53/dkmTyKP?=
 =?us-ascii?Q?AkmtpCbDEyHF4/I2uOyZ0aqndjDKmdGe1usHsDqyLKxXW6r3+M97M0NImhfK?=
 =?us-ascii?Q?YMOGDpa9HXOlq1VaDU+2aLE1UUFwhZU9i574+IrPlCnPvTXt6D8yVFFHGzur?=
 =?us-ascii?Q?6CyWE+b0L1GNhU2XIzhYayleqYE7rR4O2fgM3qGlNT7g+4Q5NubhwL+gPPG4?=
 =?us-ascii?Q?nUauvveiGvqa2OG1cDPxnKYpza6GCfz3tq9b1vcPGPBe+kd6NNLfm1VaGlFX?=
 =?us-ascii?Q?DE8X6AD1PwA8NaWwEDGziEVso8ofX0sXdkRmSks34zzNcAySIKCxIHSIWwST?=
 =?us-ascii?Q?bEoG3GEfiIK2f11x9lOt6u7Iy1BVp884bjsB+6oDR3EoD6p0vr5AwXnOYZZf?=
 =?us-ascii?Q?Aanfn7h5L0dLuyIBedS6FV2AInT4KuF/8O5mRQf/0jGwl5qtxOQvAUxP+Zsq?=
 =?us-ascii?Q?u3GRzV7KIPOV1Dk9/d485zhhBq4t6o2MPpDH9F9E77xwyAWw2pWFxr7BWdf9?=
 =?us-ascii?Q?Qj9dosX3kRLj6E/mmw3JbDYUnl19FjXDPwKaqbzmvaRxwa7QXXzutiViihVl?=
 =?us-ascii?Q?VTHbZg36DEwC0+bTd1rlg/sSU/TneLDeDUHW6AfGBm/hFkPrX4b26w15vTfu?=
 =?us-ascii?Q?ykNdzJv5I65i2cW6Ii+GdCxROZhwkfDN3mJklguaB+SE1neRgEzZkY6kCd9m?=
 =?us-ascii?Q?89egx6Nk+30yYE9PIDFHqcap2FGBxInuFQJ+hTitHC92Mkh+bW2mPUSlFbOS?=
 =?us-ascii?Q?D6d7Xr5PaBj1a9qby6XMjCOn5vsIJ3LhvFYP2fw+WwlvWtw/MNsO8B43gygg?=
 =?us-ascii?Q?1AB9afminLQtKncua1ZGeZoDag34+erVKH7bbCBw3e6FzFa56f8N6Hf95ICk?=
 =?us-ascii?Q?KxviHsGx2v/UNWtWdsZDw6rybcGcWavWxqYtjvWVmaoQy72nvpxKXjADdFMa?=
 =?us-ascii?Q?Fsz/PMMUgkiZBN1e0Q7aYmtAEpZA9AmeJDHAswC9FgbxSSozmsYd4hub5lqo?=
 =?us-ascii?Q?ci78z9iKB12XudYiY7qw9yepevPvUbJlAesC+7pXxCpIJDwr4QvcdnY7+Sju?=
 =?us-ascii?Q?hfahPSWthoxY8fgxbUhz0E+HgwqdQD2WCon9A+WHObEu9ToLArDOMF59KxXO?=
 =?us-ascii?Q?n9f4fOvYBap4P5u40RbOY1D60zjEeA+N51OhHDbMek83EvxqrEkzp+DtUinf?=
 =?us-ascii?Q?4eUJrfoTWicNeEHgrf9b1WOR6WsAKgFO+sXWoFXjWDBON6DhhhiBF8ZSz3sM?=
 =?us-ascii?Q?RrhAQaQEaQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY4PR01MB14282.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ded023d-b6d5-431e-aaa4-08deb7faaa48
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 May 2026 12:07:15.9177
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: N+p+IvfnsKQ3Fc3NqUlJKc/UO+1csgFhxmfrVSO2hYlT8X+29XvzMloTeNTntAMkirLCqIavecoFSR/h1X5Xnc8GbHoNadzo2ggRsajULmY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10612
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-32967-lists,linux-renesas-soc=lfdr.de];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[104.64.211.4:from];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[renesas.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michael.dege@renesas.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[100.90.174.1:received,2603:1096:405:20d::9:received,52.101.229.34:received];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lunn.ch:email,TY4PR01MB14282.jpnprd01.prod.outlook.com:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,renesas.com:email,renesas.com:dkim,ragnatech.se:email,davemloft.net:email,pbarker.dev:email]
X-Rspamd-Queue-Id: 305075B3E0C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello Jakub,

Thank you for your comments.

> -----Original Message-----
> From: Jakub Kicinski <kuba@kernel.org>
> Sent: Wednesday, May 13, 2026 3:36 AM
> To: Michael Dege <michael.dege@renesas.com>
> Cc: Jakub Kicinski <kuba@kernel.org>; Yoshihiro Shimoda <yoshihiro.shimod=
a.uh@renesas.com>;
> andrew+netdev@lunn.ch; davem@davemloft.net; edumazet@google.com; pabeni@r=
edhat.com; niklas.soderlund
> <niklas.soderlund@ragnatech.se>; paul@pbarker.dev; netdev@vger.kernel.org=
; linux-renesas-
> soc@vger.kernel.org; linux-kernel@vger.kernel.org
> Subject: Re: [PATCH net-next v4 05/13] net: renesas: rswitch: add excepti=
on path for packets with
> unknown dst MAC
>=20
> This is an AI-generated review of your patch. The human sending this emai=
l has considered the AI
> review valid, or at least plausible.
> ---
> net: renesas: rswitch: add exception path for packets with unknown dst MA=
C
>=20
> Creates a queue for the exception path to handle packets with unknown MAC=
 addresses. These packets are
> sent to the CPU for MAC learning and broadcast.
>=20
> > diff --git a/drivers/net/ethernet/renesas/rswitch_main.c
> > b/drivers/net/ethernet/renesas/rswitch_main.c
> > index e05c42db5f4c8..bf26c1a3384aa 100644
> > --- a/drivers/net/ethernet/renesas/rswitch_main.c
> > +++ b/drivers/net/ethernet/renesas/rswitch_main.c
> > @@ -682,6 +682,34 @@ static int rswitch_rxdmac_init(struct
> > rswitch_private *priv, unsigned int index)
> [ ... ]
> > +static int rswitch_shared_rx_queue_alloc(struct rswitch_private
> > +*priv) {
> [ ... ]
> > +	err =3D rswitch_gwca_queue_alloc(NULL, priv, gwca->l2_shared_rx_queue=
, false, RX_RING_SIZE);
> > +	if (err < 0) {
> > +		rswitch_gwca_put(priv, gwca->l2_shared_rx_queue);
> > +		return err;
> > +	}
> > +
> > +	return rswitch_gwca_queue_ext_ts_format(dev, priv,
> > +gwca->l2_shared_rx_queue); }
>=20
> If rswitch_gwca_queue_ext_ts_format() fails, does this leak the DMA resou=
rces allocated by
> rswitch_gwca_queue_alloc() and the queue bitmask index acquired via rswit=
ch_gwca_get()?

I added a call to rswitch_gwca_queue_free() for cases when rswitch_gwca_que=
ue_alloc() fails.
This cleans up the DMA resources and the bitmask.
>=20
> [ ... ]
> > @@ -954,15 +993,40 @@ static int rswitch_poll(struct napi_struct
> > *napi, int budget)
> [ ... ]
> > -static void rswitch_queue_interrupt(struct net_device *ndev)
> > +static void rswitch_queue_interrupt(struct rswitch_private *priv,
> > +struct rswitch_gwca_queue *gq)
> >  {
> > -	struct rswitch_device *rdev =3D netdev_priv(ndev);
> > +	struct rswitch_ext_ts_desc *desc;
> > +	struct rswitch_device *rdev;
> > +	struct net_device *ndev;
> > +	unsigned int rx_q_index;
> > +	u32 spn;
> > +
> > +	rdev =3D netdev_priv(gq->ndev);
>=20
> Since gq->ndev is initialized to NULL for the shared exception queue, doe=
s this unconditionally
> dereference a NULL pointer?
>=20
> > +	rx_q_index =3D rdev->rx_queue->index;
>=20
> And compute an invalid memory address here?

I reworked this to make this more robust. This should not happen any more.
>=20
> > +
> > +/* If we receive a shared queue through the exception path, it will
> > +be missing the ndev
> > + * pointer. This needs to be added to be able to determine from which
> > +port the packet was
> > + * received. Then we temporarily exchange the rx_queue pointer in
> > +rdev. This will be
> > + * restored after the packet has been processed.
> > + */
> > +
> > +	if (gq->index =3D=3D priv->gwca.l2_shared_rx_queue->index) {
> > +		desc =3D &gq->rx_ring[gq->cur];
> > +		spn =3D FIELD_GET(SPN, desc->info1);
>=20
> Because desc->info1 is a little-endian 64-bit field (__le64), will applyi=
ng a host-endian bitfield
> mask without converting it via le64_to_cpu() first yield garbage values o=
n big-endian architectures?
>=20
> > +		ndev =3D priv->rdev[spn]->ndev;
>=20

I added the conversion le64_to_cpu(). This also removed the error from the =
sparse compilation.

> Can a malformed or byte-swapped descriptor result in an out-of-bounds mem=
ory read (spn >=3D
> RSWITCH_NUM_PORTS) here?
>=20
> > +		rdev =3D netdev_priv(ndev);
> > +		gq->ndev =3D ndev;
> > +		/* store original rx_queue */
> > +		rdev->rx_old_queue =3D rdev->rx_queue;
> > +		rdev->rx_queue =3D gq;
>=20
> Does this lockless swap of queue pointers in hardirq context create a dat=
a race with rswitch_poll(),
> which reads and restores them in NAPI softirq context?
>=20
> Furthermore, if napi_schedule_prep() returns false because NAPI is alread=
y running, the interrupt is
> not disabled. If a subsequent interrupt for the same port executes this s=
wap again, will it overwrite
> rdev->rx_old_queue with the shared queue pointer (gq) and permanently los=
e the normal RX queue?
>=20
> Also, l2_shared_rx_queue aggregates packets from all physical ports. Sinc=
e this reads the source port
> (spn) of only the first pending packet and schedules NAPI for that specif=
ic network interface, won't
> the NAPI polling loop consume subsequent packets in the batch and incorre=
ctly attribute them to the
> first packet's interface?

Since this is the slow path, I don't expect too many packets using this pat=
h. Especially since the=20
environment inside a vehicle is very homogeneous I would not expect this to=
 happen.

The vast majority of packets will not be seen by the CPU, because they will=
 be handled in HW.

>=20
> > +	}
> >
> >  	if (napi_schedule_prep(&rdev->napi)) {
> [ ... ]
> > @@ -1646,6 +1721,7 @@ static int rswitch_stop(struct net_device *ndev)
> [ ... ]
> >  	spin_lock_irqsave(&rdev->priv->lock, flags);
> >  	rswitch_enadis_data_irq(rdev->priv, rdev->tx_queue->index, false);
> >  	rswitch_enadis_data_irq(rdev->priv, rdev->rx_queue->index, false);
> > +	rswitch_enadis_data_irq(rdev->priv,
> > +rdev->priv->gwca.l2_shared_rx_queue->index, false);
>=20
> Since l2_shared_rx_queue is a global resource used for MAC learning excep=
tion packets across all
> ports, does stopping a single network interface break the globally shared=
 exception path for all other
> active interfaces?

No, this has been tested and this has not been observed.

Best regards,

Michael

