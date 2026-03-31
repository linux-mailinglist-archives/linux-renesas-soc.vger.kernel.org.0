Return-Path: <linux-renesas-soc+bounces-30651-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aB4uIxGty2kpKAYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30651-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 31 Mar 2026 13:16:33 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 886EE368986
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 31 Mar 2026 13:16:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E3215302EA83
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 31 Mar 2026 11:09:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3138B3AA4FA;
	Tue, 31 Mar 2026 11:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="bJHOJQqQ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010007.outbound.protection.outlook.com [52.101.228.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BFAE3A7829;
	Tue, 31 Mar 2026 11:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774955382; cv=fail; b=ZauwGy3gMFkEpmglDU+XAcW/JF26SCegUyMlTy0jDivQFRY+t09UqKUB6EX5GHTbSk10xcBvakZaP/HkGgMxMFxlUn7K74zde2UFGY8v7izQsMUAIFWxgFM5qOUG+guf7mLGs8rzOaxiaIdhZe8f7OVCH7h28wGNTeIHWaEau9c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774955382; c=relaxed/simple;
	bh=MHV2DCEMmeXLf5MJAVV/mSbTOGk5cNLNZw3LXOLl6jY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=fqZk9N0nRhYS41dZTKkRsoHDhIp2+7VYDZX3CZL1l/jRhTx9dbogEVzc4L7TROXZa4rJTjmt+k9SvoBnA7CEAi9ZPr4ToqOim38TTJl0DSqeOXf692LnNRcgvQN2Lt9A5rTPTf9PsQDqRNcJaGQBO7Er5xWcxbXkhEGGxO9bS+Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=bJHOJQqQ; arc=fail smtp.client-ip=52.101.228.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S56Kql3MAU2VEuIryu9Ks8P/jMSHmbCX4AZnhWDjKzD9IXwZGtEHe+B94uaAPQvwBw1pfCk0dmQp2uUk+C2kb3i4mIlgx6z7+Z5WiDLwwHAZkbKfQE89FEnJRFqHHpDx5WfU2iM5oAemDQ48ffNCAPv6RBrd9x2YTGOFq8L4hxtM0WDE+hdtSJl1ZRziN/ldRzleIObsY/IU7yZP70jdzu251tgIHaDdena1TBjCgCRDn4HNX2PEKHwdPt/wZwYT4R7XJ1VxrpnxhPkSo9Na6ut5xrF54V+zuuSURdgTn+LS7mZ7c2WCZMPLc/3X5rdA53Mh7dv8Yz6a3ovqOOsQNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MUZOZaBGRIo2C2+5P5ejApdB2vQkvYf1UY4jJlO3irY=;
 b=QS6x7991pESrPV7aDNPi0IRLtS+IdkNO+eliFp4Tp81jA/Oq6q7qcWgxE/elEAuxBo3LeN7C/Q86w4eqTdXSvFN8CcnmrCtcIhklZHoLUi7Y9kIDC7Bx16p28xGDjW30+DaicGtdjPOAlJnm6O0LuFdIU1JX2iYy168mbJKcKEwkAAOOrtte+x0F65UIOz4lIqYfhrqyqdt0cTHzRbxiwdIyB8RLMdN81QvUJHq2lUQH+CojuOKd/seNN0yN+W+8uU22/fHawnmgC7mG4po0nAoB5AU4ymH9ka3d3+yZ2TOl9wPC923eU9AWjd/yVKWaqotBJv79Cjlv3KbUAg0jpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MUZOZaBGRIo2C2+5P5ejApdB2vQkvYf1UY4jJlO3irY=;
 b=bJHOJQqQvfPvcGq+WA4jLloi4PN2aj+WvjT/bYPld8DblcL7LLkyGQsIwcUhnw2FIcRyVlT84LlpKQNnveF/iDTjbfueoyDYIfnWAYl/h+l1rarjiL5M4mZUgakMZhpnbeU/WjBEphvUxRKYCU/mkIULAqEH8PebPtZxaYQ6iOY=
Received: from TYCPR01MB12093.jpnprd01.prod.outlook.com (2603:1096:400:448::7)
 by TYCPR01MB10696.jpnprd01.prod.outlook.com (2603:1096:400:294::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Tue, 31 Mar
 2026 11:09:37 +0000
Received: from TYCPR01MB12093.jpnprd01.prod.outlook.com
 ([fe80::3468:d7ea:e817:1e6c]) by TYCPR01MB12093.jpnprd01.prod.outlook.com
 ([fe80::3468:d7ea:e817:1e6c%4]) with mapi id 15.20.9745.027; Tue, 31 Mar 2026
 11:09:37 +0000
From: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	"linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Rob
 Herring <robh@kernel.org>, Guenter Roeck <linux@roeck-us.net>
CC: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, magnus.damm <magnus.damm@gmail.com>, Prabhakar Mahadev
 Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>, geert
	<geert@linux-m68k.org>
Subject: RE: [PATCH v2 1/3] dt-bindings: watchdog: renesas,r9a09g057-wdt:
 Rework example
Thread-Topic: [PATCH v2 1/3] dt-bindings: watchdog: renesas,r9a09g057-wdt:
 Rework example
Thread-Index: AQHclQrDEukhAG0pA0ODsvKeUfiXJrWc9eoAgCvckFA=
Date: Tue, 31 Mar 2026 11:09:37 +0000
Message-ID:
 <TYCPR01MB1209331146787ADF63F9C430CC253A@TYCPR01MB12093.jpnprd01.prod.outlook.com>
References: <20260203124247.7320-1-fabrizio.castro.jz@renesas.com>
 <20260203124247.7320-2-fabrizio.castro.jz@renesas.com>
 <CAMuHMdXtrAwAtqNPqwq5qKHo4SKQqFoGSE7qPnFRD4rbKkPfaA@mail.gmail.com>
In-Reply-To:
 <CAMuHMdXtrAwAtqNPqwq5qKHo4SKQqFoGSE7qPnFRD4rbKkPfaA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB12093:EE_|TYCPR01MB10696:EE_
x-ms-office365-filtering-correlation-id: fe68967b-87b4-408a-706c-08de8f15ff82
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|7416014|1800799024|38070700021|22082099003|18002099003|56012099003;
x-microsoft-antispam-message-info:
 4diCdMBq+liyASz3oem6OQ+67Ckyl9azsZ6jBVqlCzAGIWsloOVnONfnpYtjREnRic298QkWCcsil+OHRW+vBfLY1rrXqimdK+sbJK8LAHRUVpvIhDh41ckR68MiiAiVUH4qDvDRlF0M18mon6idznZBd8SBKlPGNq0EA3j7Fgh0JR8dJBFT0VZzy6DGdGKvE4T1uMoUqTJcttnFYUq6ejKggeiierbYfAfut9EduzVv1O2ZaQxD+l9ruLfEhwg0mf3wF74SfKIqNBX6Dgf3TllmK2h9ODoY3XvyJbAtSKFIpDoJK3ZPvAepDOyQbsguapXcdUvVJ8rzmW1ky/1SP+szaj5yiOFjE0L1C7JzqxtRVGsRAkw0Xl1mF/ZtncS/7D+1B5uZ/AhS56XyfReGyj8s7Jn8r2zU9e4F10FDegz9DK/ERFyHQv2MfCw3ITwFoordFB1zXE7ge/31l1KZZue7mlwSDW4W3qDotzBO3/GeOCcPYliRfuG6YdR8oLgoHFRCahK7PybRphBkN6bno+FtZh3j15jWGUfAKJT6qQ76Uw9b2OlFDYLc5I7//mhnD2ZY4FtQbY74rLZ+HX9tBPkdD1+smV/n097CMhxDG+hEk8u9OR9W2HgzJAZdjpjV6aR/QPnNcXLgsuNM3dfAP3gF77yEsNwIOlp6/DMH7ryGuGQj5hWv15AJpkwXUCeolHWtv4zXe1w7Lqnj2vuOcp1P00SyANS7tiYcF9PiEe8Pa81cnEodUrDshftk8KgFl6fxbnHjMRiq/PlPJyAqwGATiEnFYCkIfg9lxcmKDgY=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB12093.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024)(38070700021)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?QizdrN5ERPH92Ll+TyJbTATO3GNHQm2YO3+98D5sDbcZAsawzCyhOMKSyvsi?=
 =?us-ascii?Q?cgPjJVFbndXQh6RNYuUONQ5VtOaNBusZ0zD3xIwzadXP2kEba+5DFjjR/T6y?=
 =?us-ascii?Q?4//DFhPMcdr35Ba0n7NUnwVV5lP0m3C3EBS2GgsJpbhg1oRecaA5wxJVWMPU?=
 =?us-ascii?Q?wgSGapIq54d140yAEe7fN1dGJ5GxVdkGzaRxle0qPpaKK9HhbIhO1t+4GD9T?=
 =?us-ascii?Q?seyRuWCKiEJcpyRJDQp5JFHvFzLcs0DEo5usBgvBfF2S8nqzcCzazO1koSJp?=
 =?us-ascii?Q?eBP+d1fBY59jJNrpL2WO6Gtqv/XYawZHTgdyjAmcQfVlqtfXr1JhK91YdEpZ?=
 =?us-ascii?Q?GNjymQur91HwuqaynC1qW1BRHpTUPVY7G0aOkqvFDwXu919FlsEQ5oEqciC7?=
 =?us-ascii?Q?VBKMfnZqAEtdQfOpKvedL0aSA43BOk03rqic7Tx3/1cyVonqWRtxgcpHYMfO?=
 =?us-ascii?Q?Fdy7x5k+JdMS0+vYTL8YV6TDCqT6T8VM3ypMkhHTRj9VeC4GhyXuOuywuiF2?=
 =?us-ascii?Q?YQXmkdaXudapdFWVH0dqzW/7AjepI6fmLSiehN3LJwbN0skeD27LYbQzg1H4?=
 =?us-ascii?Q?EZSqbNSYRryaNX6b2Fub4N7lKhozzD7kVR0m5k+m2+D7e3PvFWoup3Iy1gL6?=
 =?us-ascii?Q?DoHexk+hKtStfpfKpt+aBI+Bo6PV6U2sfG2kB9n0wkrgFvryKoVo/9lBjIXO?=
 =?us-ascii?Q?Dlp6bWjN5Hj4tvZH/8cTTTc5VxIo5NwSJUM0SU1R520X3E/3jUHc0ebl8kns?=
 =?us-ascii?Q?S5QIO0VIXFAe3KJPBFjI4m2Lc6hwCaC7RsfSb7YoDCRb5UhCiKbBsT005iw3?=
 =?us-ascii?Q?VGnsvp/UrzLI2pFlEpyrHYUQcGbn/Kv+U/KVMKLxmCWKh72NyqbpAs6fVzSY?=
 =?us-ascii?Q?Q9lMXX1SR8/EpHsn0hBothcC5iqSk8v7380uwvc/2kK0V1xWeOxj0n7AMiEa?=
 =?us-ascii?Q?innbhi35m+njst4PUoA8b6rsfp0BkTWOX5tYBLZY5mdRGEBu8TOClkPWAfdR?=
 =?us-ascii?Q?DRvB/WDLvKjVIuiJJnvyJzequWHEb6CqW8zQh75e7e8V6DhQrxdcpfzEn6O7?=
 =?us-ascii?Q?9eRhfITrmQohJX9aQIrUWcH+Fy/o/Ubmgtjfr8iw7vbGbxv/g2LwXVIGY5Op?=
 =?us-ascii?Q?bp73TPhQFDG+727+3XfKYNR5abSsz9CxqdJ2m8xOk5K+Y/sBWsV/b8YZdhra?=
 =?us-ascii?Q?5XT6vOp3QPz/W5My6flk4v9ibJKKrgZ7v1xuV9Gpkpf6Ts2NQzDX6ghoEw9C?=
 =?us-ascii?Q?w46pdTMxYCw9qmLp3ukSWqIr8ZTLTIn968mXpy30y8k/rkbZRMKvlwOvxqpl?=
 =?us-ascii?Q?VT4RY47pZnX0r8s4+wQlHjYSMbVAOYO1IKz0DFDzPvfP9ZRgytFuYiKam+/T?=
 =?us-ascii?Q?5xAdMzqyILQS3BkmSTrvxXy6SqowQ5HBg0YVUpzA9wF2jaD7579S2019V9gW?=
 =?us-ascii?Q?WI8i8vI+0kara+HxpZDK0WCc2mgsf5hD0AIHMIHH6CIq7cJXz99DzN8CLE56?=
 =?us-ascii?Q?DHn/ItMpqQr5jqVOoY7YX8bd18HomqpfaGoJ28pa5ob7PwF0q/0uW+2tjQbR?=
 =?us-ascii?Q?ubqA+Xu+lKEYx85hcimsZ4CUvqzeGr8k9kkYkGHLUzG/1N9AK61QP6UCDnk8?=
 =?us-ascii?Q?rhsGAWsFVAM2qN+GOqIkorWT/vTy2Z99wxiSO8CzJTkDp1aBpHH39EsfH0HG?=
 =?us-ascii?Q?yFQNM61E1SIJznZqsRi0S+2Ax2OdVRE59QhcvN3jVm0WuYmmK+1riUzHfG02?=
 =?us-ascii?Q?l4fILaBNkc2XpLV9tHgsEMw+enM97V8=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB12093.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe68967b-87b4-408a-706c-08de8f15ff82
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2026 11:09:37.6863
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rmBqQJL/AQ0r1SSiw3RvQGzMuv8ocHGB4pIyLZA1huHl50QipgP1POx/I/Y+4DoFez4VemBQfYZLvp+nfbUBuQMX5EQwC13QRM+x7CWvsyI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10696
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30651-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[baylibre.com,kernel.org,gmail.com,bp.renesas.com,vger.kernel.org,linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fabrizio.castro.jz@renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[renesas.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 886EE368986
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Dear All,

This is a gentle reminder that this patch is waiting for someone
to kindly pick it up.

Kind regards,
Fab

> From: Geert Uytterhoeven <geert@linux-m68k.org>
> Sent: 03 March 2026 13:17
> To: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Cc: Rob Herring <robh@kernel.org>; Guenter Roeck <linux@roeck-us.net>; Mi=
chael Turquette
> <mturquette@baylibre.com>; Stephen Boyd <sboyd@kernel.org>; Wim Van Sebro=
eck <wim@linux-watchdog.org>;
> Krzysztof Kozlowski <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.o=
rg>; magnus.damm
> <magnus.damm@gmail.com>; Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@=
bp.renesas.com>; linux-
> watchdog@vger.kernel.org; linux-kernel@vger.kernel.org; linux-renesas-soc=
@vger.kernel.org;
> devicetree@vger.kernel.org; linux-clk@vger.kernel.org; Biju Das <biju.das=
.jz@bp.renesas.com>
> Subject: Re: [PATCH v2 1/3] dt-bindings: watchdog: renesas,r9a09g057-wdt:=
 Rework example
>=20
> On Tue, 3 Feb 2026 at 13:43, Fabrizio Castro
> <fabrizio.castro.jz@renesas.com> wrote:
> > When the bindings for the Renesas RZ/V2H(P) SoC were factored
> > out IP WDT0 was selected for the example, however the HW user
> > manual states that only IP WDT1 can be used by Linux.
> >
> > This commit is part of a series that removes WDT{0,2,3} support
> > from the kernel, therefore the example from the bindings has
> > lost its meaning.
> >
> > Update the example accordingly.
> >
> > Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
>=20
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>=20
> Gr{oetje,eeting}s,
>=20
>                         Geert
>=20
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>=20
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                 -- Linus Torvalds


