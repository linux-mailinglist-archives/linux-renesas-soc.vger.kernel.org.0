Return-Path: <linux-renesas-soc+bounces-31315-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0ND/BKB/4GkKiQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31315-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Apr 2026 08:20:16 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA1040A998
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Apr 2026 08:20:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B9476300D706
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Apr 2026 06:19:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2519F378D9E;
	Thu, 16 Apr 2026 06:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="GGS718mM"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011023.outbound.protection.outlook.com [52.101.125.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 365E8358379;
	Thu, 16 Apr 2026 06:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776320389; cv=fail; b=dhB9vmUHxRxnCcJqfNQNDr19h45AZIWM5sCiBkihGJ+StISTxOehIzOVLPk2HGhi5smHsnER0M5v/mbHlt6RVvNchY1Kh6U5fj+zYRwlUQp3Prp6ZdojMiLiEMKpUjVMk5XouzLXyhsrtkOrvfgzyZPfSCBaioc77wgXoBKlNc4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776320389; c=relaxed/simple;
	bh=0XthmgS/5mFlNBIH21lE1ax1/wwWLS7d9FALLFbgTs0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=otbhyDhaRvzfpj2QurCpWfJXQMOpPIAN1Iq27x/zVZgoQLMSI3pTDN43jwkLExHYSx29dr68+ptQFR+Zzvs0D94rBJs9TqMWP6lize/uolnLJ07mlSKZAIkG8JPoPxZVoKvrqYif30nCntcfEQIBH0J4t4SRk/mBX8UEo7HVCiM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=GGS718mM; arc=fail smtp.client-ip=52.101.125.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F91hpzxnMP8ML9q0/gYUukQDaFewdlFMXloHYC5uR/6MysZ05tXrg5XUnZzJM1Tv1JDIbDcJAX8W3uPxccnBOz8VOIjjpbqyo08rpbDCmoWaaOVz+rTSWvRrYdGxU5t7eVDB5xehSFHcWgK8j9FxoEUm8mDfEIE0oWQOx3SyJ9a/Xx5yfDZEP3vp2jzHEA5bLSk/5UueRhshaSo+5Z53Nd+wn4AWBe0+JuViLoCb4dJPXHZSdlMtRvHcpOloNZtez/IHRQ4NE4RRDfESh5jrFNBeRPGF51fbZgeFHRy/4g4J3yWbpW8t31fKn7cOt2gv7EJM+gVMCX5IleOETMQixA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZflNpglM7qAN2bZj1tKVXtIpEzcUcxUULUI7z5Lnols=;
 b=IeQFFm/BuqXRlGT+4EEn57w1tSyVp+odMcGqhBD2Ay6GnvfnJX0pEo5ZAQOgQkdHY7FTw6kpREbLsdhzu0ZRUtNuVPaUX4peLl1xsnmqvnaYpSYmO4JbfK1TykBBMY2pce19s+YNH7GRLjYANtw/RCxBQHvXA5gw1tiWSEqLPyG8n+Ca33Vds4gQuRtg6bG0YZO0a09hNiRDfO7G3vY9B2cMa52Ajrg0efPszoDEANgsbKtZ8jqrd6aWOzedEuLPjWtVeU55MWbMRuumyXDNXab6Wk+ws0ZQmwm3zVKwTHMRKELtMO/J3QSBQTQiJRpPVOS6qYXqFg5+3x7YxDqjgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZflNpglM7qAN2bZj1tKVXtIpEzcUcxUULUI7z5Lnols=;
 b=GGS718mMthSKw40VNjQQvKloH5u2fg3h0dokCZ6oNeUw2gYi+DazvofisGqhJFg9i8122SjyVDB4F2FMTTE/N+GzX2d4JzVx61B3d4t/z3ateUqCaE8s3W8ZozHJ1v7hz661s8eLzV1C85HjSE0b0NYM/3I1v2IZbWSteCyXMK8=
Received: from OS9PR01MB14288.jpnprd01.prod.outlook.com (2603:1096:604:35e::6)
 by TY4PR01MB17921.jpnprd01.prod.outlook.com (2603:1096:405:34e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Thu, 16 Apr
 2026 06:19:44 +0000
Received: from OS9PR01MB14288.jpnprd01.prod.outlook.com
 ([fe80::dd81:2b0c:9be0:96be]) by OS9PR01MB14288.jpnprd01.prod.outlook.com
 ([fe80::dd81:2b0c:9be0:96be%6]) with mapi id 15.20.9818.017; Thu, 16 Apr 2026
 06:19:36 +0000
From: Michael Dege <michael.dege@renesas.com>
To: Paolo Abeni <pabeni@redhat.com>
CC: "paul@pbarker.dev" <paul@pbarker.dev>, niklas.soderlund
	<niklas.soderlund@ragnatech.se>, "kuba@kernel.org" <kuba@kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"edumazet@google.com" <edumazet@google.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>, "davem@davemloft.net"
	<davem@davemloft.net>
Subject: RE: [net-next,v3,06/13] net: renesas: rswitch: add forwarding rules
 for gwca
Thread-Topic: [net-next,v3,06/13] net: renesas: rswitch: add forwarding rules
 for gwca
Thread-Index: AQHcwqCV3ns5BFL7+kavTwypiKN2jLXhTBsQ
Date: Thu, 16 Apr 2026 06:19:35 +0000
Message-ID:
 <OS9PR01MB14288F38D2E379FA03237D84E82232@OS9PR01MB14288.jpnprd01.prod.outlook.com>
References: <20260331-rswitch_add_vlans-v3-6-c37f41b1c556@renesas.com>
 <20260402125933.234477-1-pabeni@redhat.com>
In-Reply-To: <20260402125933.234477-1-pabeni@redhat.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS9PR01MB14288:EE_|TY4PR01MB17921:EE_
x-ms-office365-filtering-correlation-id: 981772d6-2454-4e3c-82af-08de9b8021dc
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700021|22082099003|18002099003|56012099003;
x-microsoft-antispam-message-info:
 5VWPAkVmIaQeMacaha0QXfbAzTjGyip6SoAjaVWoaFEwP4j43eQJviffs84vCExO3/pkTqkwxGS7pmyzwPm1pdCL84nk12f7XCLMoJM18SWWU3cF/x6PnPjmnQddFOS4QWicuM8rUr1Ax4uvLHchhK/w3WQQBgk1jurZmubEXcI8WBedXCCjfYofcTB5aeu8O9WI5v/pFHqURg4Bw660zYg3ad6wq5nkyW+RMDJdmVUu/g1EfwsStVIZZnId134IbeFxkkR9GBuxeEOv52x61bMsjGHMrAwb8CiMhrB4Ht8RNfyqu7SM6xr9LK3d1A49zIYI2Gqifb9LCH4Y3tw1cl7P+sEAjobq0oPHkMtN1QItoWLVa2yC3DjnsSzAX6C+0bakHZ3xucQMAzfBje1PHwblcDC3Qbgu1chE1gFxnszxGOWUASIM0ffUbThaGZz4mmNYbzjB/pend1Umv/u9nvH9c7YTx3hiXsuJv5wazvQ5ammqohiIbR13lESA2ahJZ4cTPq/zjcbfoTAwxl4ku26IbmhHXW5GeZi9ruSlU7fA6TzGix1QEaTv/0Vzl8x/feu3UfmzSg7uYh/rbV9u+i6SATAo7F9R5mRGqTGQ6bNrLB21j9pvsEVdpsmhVUAg5sLybqlzyFwpXf/h5qeuZrpb/z9p5qjZwOMUre3p/IIQ8b3iB582OrZGWyLa/Y9Tqu0hlUdw2ePLDuGboPhJjtNidbDQ49N20oPMMjtwGipFUb0wsFG0c0bEdIFICKmv
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB14288.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700021)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?9LJZBvNAC+SOS5VJ+Lha0H20eE8b0yaG2+v4V1CpTpbjMdV5o4JUGQ4kw1fS?=
 =?us-ascii?Q?kMWBG+AZRaYB3BXEXE+5pFh8McGyAYsTVxSavfcdOFA9pRPugp7CehsUVPPu?=
 =?us-ascii?Q?3MxVWUDfi/qkk8GS0tupdKHvGu0gCJeMsdJJQbdMFo3IikE4gdIirmZ3lJTi?=
 =?us-ascii?Q?ZYRdDmMZsHfAOiMqHm8P6Bs/3C8jLrrRZjzmjOVnNBqZ5mQd9esf0CQNlaNr?=
 =?us-ascii?Q?QlWXtDGWKQZ0rHQ4BZtMk1kzpuKXLGl5kg2uTzMQm1JrCbAJULYD1mUVOnRr?=
 =?us-ascii?Q?KXKBHWFWy6lGb3NL/qY6hlnWEJADpybfnNqsVSsQaVgim7ZgxkaA9reSrYd9?=
 =?us-ascii?Q?4omlh0u83lUJYW325neTXsY3k8WR47EgKEIavIrqUMrY8gy8fW6mC/sCsxAe?=
 =?us-ascii?Q?iX+18jvQzG4SqDtY3n0UzW3v9q94MVZk8TlhvkyM6vv4h1r7o8nOPocJybir?=
 =?us-ascii?Q?2H8xM6N2bORJCfMySQxLRVYNcw6j5NVdZ0oLxThg4ksL9vdnFEYSv8uN4wO6?=
 =?us-ascii?Q?nw+1jspq9l/CJx05u6J94PNiTnRpw2Ab/bh5Jisury2ogQow35zWP7risqnh?=
 =?us-ascii?Q?6ZSxdaj8oYL8E6p0x4BAepR9TQTclUTBVeJsrQLy2QTITo1RniTjmRD1iJbn?=
 =?us-ascii?Q?MRBpzj9P0zSfAl3c7Hb8pFiu2t540/oTx0VY/Oqn9j1UEI0uVNPWPR9/mK9S?=
 =?us-ascii?Q?XG3x/R27/1+th3HDzBTfCaEEQ4rEm7iick5vJ+T25S22cU3yS+g/Vkc4/Q83?=
 =?us-ascii?Q?s9tkGACRIXqwvEHvLtzO4gWAD0K/64KG7nR2s3JI1iaGYz1pJWuViTTRShg/?=
 =?us-ascii?Q?cux2n1O59jP/hud59qZDXJPuOED5vKoWCRMSbOyejwA3LIjN+dasXOQ9nAzs?=
 =?us-ascii?Q?bP+f/IRzuGNl73/ad0kOhAYTI9yRbgG+bt8EEQYrsSudT3DOQJ54pwicpuuR?=
 =?us-ascii?Q?ZpgKnxj0JCRD8u6hQEJNk5AjBKHnmQkb51HwH+XW1vdLDnURUyT5DyYUaqAl?=
 =?us-ascii?Q?LVzjV3ZhPfyl2FFu9Ui9Oz3d46f11KjbFPlIv+OXd4EJorTuG18wNgSkD8Zc?=
 =?us-ascii?Q?SOr18oxU1OeoS7bqbWT7GDZWkkzpB4hiUL8sYqIr6UdX8BW05dkV+6EbNK21?=
 =?us-ascii?Q?Jm/5jWL1l3cFsWszOf7AQhyStbC+Vu92XKbh6b/1Eu/WCCSMFW9zmp5QzAKP?=
 =?us-ascii?Q?KgJzC4LA4cZ9YtHahc/6tMQg58q8af8aPiVLqfJSB8GYkECWLfJdoRaIeizp?=
 =?us-ascii?Q?bjRrOlv+hm816sGOw60A33Qopl3EFqEQmYBaY+9j0tfCxDuQeSIYKmVDU7Fy?=
 =?us-ascii?Q?+dYHqpQkMLcRzivtBCFEhdgNkHTiZHDDqPndkkwrNvnE28LqYmPyfjY8ZJdF?=
 =?us-ascii?Q?/sGae0Te27FmQq2CMYx7lOTlY/u+nVtAWuj+kGfZZBgEf9MLEwD+6eEYirMW?=
 =?us-ascii?Q?QvA6XzxldfsXIbmV3isuhtNKq8S/AI2xhn70PHWx/xIfsh/TGfwnhKR5cl4p?=
 =?us-ascii?Q?av2TT7C6xATDJXS6R5DrP24WgByOBebTqil1K+d9gppGHBoHFBhNOnyT6nmM?=
 =?us-ascii?Q?AeABo6/d2KWGwA7FAHB+EOQr/S1avgap4hJQTEzduYpRmGwTtCdRvRPjZhKX?=
 =?us-ascii?Q?5mP67Qt2I8h1HBUo/dOwGEcVQC3t0eF3jMqZYmFcusxpXREXzMT+cPALJN3B?=
 =?us-ascii?Q?VplLMGDMmYIaIG5gTzATe1f13W8g7HOhGVW6TBYs+W8jL70b7uGblcHcra9+?=
 =?us-ascii?Q?H7YZwV/R5A=3D=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB14288.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 981772d6-2454-4e3c-82af-08de9b8021dc
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Apr 2026 06:19:35.9333
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OeCjaHpMc4aN2/pmBD2w2OpRpAsuvrY70b2qc73JpReGCtTNqF1ThjfdT/ROtARsyp/7yyM0qvpO9l8wuhst4JBnxsd5V3GHl3+0il8sOwU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB17921
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31315-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN_FAIL(0.00)[114.105.105.172.asn.rspamd.com:server fail];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[renesas.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michael.dege@renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:dkim,renesas.com:email,linux.dev:url,davemloft.net:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,lunn.ch:email]
X-Rspamd-Queue-Id: AFA1040A998
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello Paolo,

Thank you very much for your review.

> -----Original Message-----
> From: Paolo Abeni <pabeni@redhat.com>
> Sent: Thursday, April 2, 2026 3:00 PM
> To: Michael Dege <michael.dege@renesas.com>
> Cc: paul@pbarker.dev; niklas.soderlund <niklas.soderlund@ragnatech.se>; k=
uba@kernel.org; Yoshihiro
> Shimoda <yoshihiro.shimoda.uh@renesas.com>; netdev@vger.kernel.org; linux=
-kernel@vger.kernel.org;
> edumazet@google.com; pabeni@redhat.com; linux-renesas-soc@vger.kernel.org=
; andrew+netdev@lunn.ch;
> davem@davemloft.net
> Subject: Re: [net-next,v3,06/13] net: renesas: rswitch: add forwarding ru=
les for gwca
>
> This is an AI-generated review of your patch. The human sending this emai=
l has considered the AI
> review valid, or at least plausible.
>
> For local reproduction steps see
> https://netdev-ai.bots.linux.dev/ai-
> local.html&data=3D05%7C02%7Cmichael.dege%40renesas.com%7Cce95b7b1d9df4483=
358208de90b7b638%7C53d82571da19
> 47e49cb4625a166a4a2a%7C0%7C0%7C639107315865778020%7CUnknown%7CTWFpbGZsb3d=
8eyJFbXB0eU1hcGkiOnRydWUsIlYi
> OiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7=
C%7C&sdata=3Ddee%2F%2Bmcpl10Pk%
> 2BHTcL0u75PN%2F4FFyv9xB2kWqnwj%2B9Q%3D&reserved=3D0
> ---
> net: renesas: rswitch: add forwarding rules for gwca
>
> Add rules to forward packets from the Ethernet ports to the CPU port (GWC=
A) using L2 forwarding
> instead of port forwarding.
>
> > diff --git a/drivers/net/ethernet/renesas/rswitch_l2.c
> > b/drivers/net/ethernet/renesas/rswitch_l2.c
> > index 709524c8a5c4..cabf1f92ad0c 100644
> > --- a/drivers/net/ethernet/renesas/rswitch_l2.c
> > +++ b/drivers/net/ethernet/renesas/rswitch_l2.c
> > @@ -93,10 +93,32 @@ static void rswitch_update_l2_hw_forwarding(struct =
rswitch_private *priv)
> >     }
> >  }
> >
> > +static void rswitch_update_l2_hw_forwarding_gwca(struct
> > +rswitch_private *priv) {
> > +   struct rswitch_device *rdev;
> > +   u32 fwpc0_set, fwpc0_clr, fwpc2_set, fwpc2_clr;
> > +
> > +   fwpc0_clr =3D FWPC0_MACSSA | FWPC0_MACDSA | FWPC0_MACRUDA;
> > +   fwpc0_set =3D fwpc0_clr;
> > +   fwpc2_clr =3D FIELD_PREP(FWPC2_LTWFW, BIT(AGENT_INDEX_GWCA));
> > +   fwpc2_set =3D fwpc2_clr;
> > +
> > +   (priv->offload_brdev) ? (fwpc0_clr =3D 0, fwpc2_set =3D 0)
> > +                         : (fwpc0_set =3D 0, fwpc2_set =3D 0);
> >                                             ^^^^^^^^^^^
>
> Does the false branch have a copy-paste error? Looking at the ternary
> operator:
>
> The TRUE branch (when offload_brdev is set) assigns:
>     fwpc0_clr =3D 0
>     fwpc2_set =3D 0
>
> The FALSE branch (when offload_brdev is NULL) assigns:
>     fwpc0_set =3D 0
>     fwpc2_set =3D 0   <- assigns to fwpc2_set
>
> Both branches assign to fwpc2_set, leaving fwpc2_clr unchanged with the i=
nitialized value
> FIELD_PREP(FWPC2_LTWFW, BIT(AGENT_INDEX_GWCA)).
>
> This appears to break the logic for non-offloaded mode. The FALSE branch =
passes fwpc2_clr with the
> GWCA bit set to rswitch_modify(), which clears the GWCA bit from the FWPC=
2 registers. Is this the
> intended behavior when bridge offload is disabled?
>
> The symmetric pattern in the TRUE branch suggests the FALSE branch should=
 be (fwpc0_set =3D 0, fwpc2_clr
> =3D 0) instead.

Good catch, this is indeed a copy paste error. I fixed it for the next vers=
ion.

Best regards,

Michael
>
> > +
> > +   rswitch_modify(priv->addr, FWPC0(AGENT_INDEX_GWCA), fwpc0_clr,
> > +fwpc0_set);
> > +
> > +   rswitch_for_all_ports(priv, rdev) {
> > +           rswitch_modify(priv->addr, FWPC2(rdev->etha->index),
> > +                          fwpc2_clr, fwpc2_set);
> > +   }
> > +}
> > +
> >  void rswitch_update_l2_offload(struct rswitch_private *priv)  {
> >     rswitch_update_l2_hw_learning(priv);
> >     rswitch_update_l2_hw_forwarding(priv);
> > +   rswitch_update_l2_hw_forwarding_gwca(priv);
> >  }
>
> [ ... ]


