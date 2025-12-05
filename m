Return-Path: <linux-renesas-soc+bounces-25603-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B5682CA7EA2
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 05 Dec 2025 15:18:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7B466343BA6C
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Dec 2025 11:56:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B06F332F741;
	Fri,  5 Dec 2025 11:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="icNSF38X"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011054.outbound.protection.outlook.com [40.107.74.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6E31301716;
	Fri,  5 Dec 2025 11:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764935732; cv=fail; b=gu7ur6AAJ45kKwZWQap6B+VP+qX145aCsooVRCO2CbJ/Y4JZUtMIrN7G6ziU1sNqgzOvy22d8rEekH6VGv5oUuvnaMLB+tjjPFNmg6MC6CU5NgbDPuc127x6cfu5zMuGEB+KIRFYOVdvtyWVWFrmByF8ND/lfgRbMUrn4wFZBQU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764935732; c=relaxed/simple;
	bh=X+/pH0Z8VFiUWZI3pZTSTFEVSmvgYdkHXpx4sQ55zgc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=HKb9ASmoNaAUFCVodJbzoZ3E0Ohulx8iXcHm02oRZiz8fYFK1tKWFxLNDQoIdFvtfybtsS5aeXInGZ8hbwZzKbdGehjf4HhRE2zukRgGnCH9Y7zeurlqCq4O7mf5u44KMKIiRnYuJ2suMLFODaXwx+y35ADqQ0ck6gUTJqWgXAA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=icNSF38X; arc=fail smtp.client-ip=40.107.74.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WsH1+7keAoGH4y8VLFMk5g1S25c+QY94ccSzuO236CU2NXmz5wKu/PLIsLNzoo8PfIu2gBQWUaYbLKMzqslTIMx4GBfDsrYpiY20VaedL54QQ4TUFUMuPv6zyzn1QrRC/FaOgg2J5nhDdxDtUxSosUMrAwqVhhay8evNlMygpoqx8YdkEmkYxla+NAGMgr6ZBJfbNFKjs0h9F0rL2MDZ/q/nY9TnbTsmGXUHqEVm6puQibCe68rbcOJQgfN+eKf4JzlZS11AJ3R4lO2aVSlhUcWV/3CoPWHdDmEElrD+QUQ2F8PUQdCF6RSXTh5vGU6Cyl0D6uVaYisApCOdN6eTJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X+/pH0Z8VFiUWZI3pZTSTFEVSmvgYdkHXpx4sQ55zgc=;
 b=Kb0nFx9Fz6xB++q74tQlMTl/rS/VBF1sN9+aCVhwwuvtPjnEbGmcpQ1BT1T5kdj5QVf2eJ1uxyv4YHVxYYYbDl6zZOYyDiOVSAaLhSaedH3GTrt30J7QBYcG0KPs1pt4kGf20dU2nhCVtWGRyBBIGTUWpIVMKfgXsrUApzYT5Z1wZJU42Gh9hd5xNk003uP3XBYPrzCk7VhS54fy11El0QvBkk6Uw97g58enJVxnIRkO2muX+LmmtyV6FdC+tPQ6DX1lqkzpy4IqXduoeAVn2U4vS5czVVuQj13ILOxtuMfEQpzZ3C13EqOGumH0Zg/meMNgaCdzb/LaERl8yA2cYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X+/pH0Z8VFiUWZI3pZTSTFEVSmvgYdkHXpx4sQ55zgc=;
 b=icNSF38XlC/SwT+9egznBxh6K6JYw2Ku1K9i3g0Yl0rdZghYL0tzX36m3tRff/QLtCHpjWx3RoS69QFeFD6J+5jt6mATSL9EutjQ3sRlNsqBgfXdHvqrR4x0dz7lseqQQ8wYJmXaZo9Er6RWeXo5qeqkCom8Z+QtZW5TDugU5PM=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OSCPR01MB13102.jpnprd01.prod.outlook.com (2603:1096:604:335::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.10; Fri, 5 Dec
 2025 11:55:21 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.9388.009; Fri, 5 Dec 2025
 11:55:21 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Claudiu.Beznea <claudiu.beznea@tuxon.dev>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: RE: [PATCH v2 0/2] reset: rzg2l-usbphy-ctrl: Add suspend to RAM
 support
Thread-Topic: [PATCH v2 0/2] reset: rzg2l-usbphy-ctrl: Add suspend to RAM
 support
Thread-Index:
 AQHcUkXayA+E33hY1EmsX/GuWX+dybUR8j8AgADxDfCAABPzgIAAA2hggAAJoQCAAABcgIAAEgTw
Date: Fri, 5 Dec 2025 11:55:21 +0000
Message-ID:
 <TY3PR01MB11346E629B11BC5F812D32E0086A7A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20251110132715.724084-1-claudiu.beznea.uj@bp.renesas.com>
 <19fda177-6c11-45d6-9dab-3f75edceda4e@tuxon.dev>
 <TY3PR01MB11346F5E49BF172AE78C55EAE86A7A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <50937606-46fd-4202-ad4b-9ede5bff76fc@tuxon.dev>
 <TY3PR01MB11346625CD598704CC36C63AE86A7A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <da64005a-e6fb-4bbb-a97c-e6c3ada8aff1@tuxon.dev>
 <TY3PR01MB11346820489C604B63A315E8486A7A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To:
 <TY3PR01MB11346820489C604B63A315E8486A7A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OSCPR01MB13102:EE_
x-ms-office365-filtering-correlation-id: cd1aef5d-58bc-490c-9aab-08de33f52abc
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?TUk5QWYya0lZWHFKbVNDM25ZTGhJUFdJN1YwbEdOeWpucnZkQXc0WjRBQSt0?=
 =?utf-8?B?a2x5QlhaV1Z1R1E4VEF4K0pycGJ2a3k2K0ZXOHJJR2xhanZsbzZEYjUrdzE2?=
 =?utf-8?B?Nmp3UVkvbktNVHhXZVVNL3dwbnRHRTMyQkNzVytKTnpGTGgzYXY2a3lLd0lF?=
 =?utf-8?B?WVdxVjNjVG9jQkx2N1N2bS8wZGxteFRGZVpKWk9qd1YvUEFjZzNocU5iRnRY?=
 =?utf-8?B?L3RwbFd3Q3gvQlFGQW5aMHVFZkVkTFJONi9hQ0htL2JicUxYNkRCSW9La3VB?=
 =?utf-8?B?WkovNVF0T0F6ZExRbE5lbTVXTFFNYWNPWURzVlZTYmpZZ2luTEV0ejBWL3Rv?=
 =?utf-8?B?eGhQSVJyTWloZTVHOWJTRGxOWjdZVWUvbG12c1o4Z2lsa1NFN2Q4STFHSnZL?=
 =?utf-8?B?cDV6NFRJWlZ6TG9xOE9IdjZjRk9SdHp0WHY2NnZFQ2Nycll0cThoQ1E2VmZw?=
 =?utf-8?B?VldPSFdMYXRZdTl6UHFoZkFGMXRCNEF2NmtmcXJ2ZUpHUTRwUW9RaXNKU3lM?=
 =?utf-8?B?OXprQm1CbHFiUFh2RGF4eTdoY3UwbXlZaElnM1p4MmRseUY4WHhyQ2pjMWNM?=
 =?utf-8?B?SDZXZjV5b1dKMHh1d2wrUmhLWTJXeHBIbWlIam9DYTN6T2tQTU1pSkFIZW9K?=
 =?utf-8?B?ZXRHdFMrVExqQ1hTQW96SDJzN2JzdTFDTDRHbWVURTJ6RWZoWVFDWkhTcWhx?=
 =?utf-8?B?N1dWOWJHZkpCa2tmditJTEFrTmtKeXU2WmlCZVF2ZGszWDBTK0UvdjlkRkVv?=
 =?utf-8?B?dXJFQnR1N3NLT3pSSG90MkxJcjFWN0p3anN6aW5ENStZWU9KWXR3ZWpsS1RI?=
 =?utf-8?B?ZmRXRERVZFN0U0RyTSs0Z0M0YzUvY2NZTjJXY2J0bWQ3dU8wVWRwOVVzVmw2?=
 =?utf-8?B?K3JrMTZyM0wwY1dwaktPTTVsZ0k1NUlubFV4Tjk5L056ODh2NUJhSVdkQnhW?=
 =?utf-8?B?Y0FjUnVRcWNPOUc4eHBscktuQm0wcnlwVENvbEV6TG0wR3VJOFY5aTBQUE5q?=
 =?utf-8?B?d2dGTXIzbXBha0FyUkg3TWRFcWgyVzN1MTNSa3NraFM1UGdzb2ZReHIzaXJW?=
 =?utf-8?B?cy9icmQ1VlVJeG93MHVnZTNyQXNqU1dLVUpQclpvSUE2bE5wZGUvQUtFYW05?=
 =?utf-8?B?M3k3dVAvVUlsOUJYeVg2Rytsc2UrcmE1RktWenY5ZTBML2FmV25UbStubWQw?=
 =?utf-8?B?c2ZIZjNsblcwOXdraVFjRTA1ZUdYSFFERTg1c2cxbTRYYjVGeCtXdy9aUmZ1?=
 =?utf-8?B?RFd6bDRXZHVsc09kYlBadVA1bks0VTI5aEYva3FqczM0am1Zc3Zodk8wd0Mr?=
 =?utf-8?B?ZlI5eXZmdXgxNFo2cWRxT1RML2lzUWdKVlJhZGtGOFJpNlNtNmUwSktXa2NY?=
 =?utf-8?B?cGc4bytrZ0YxemRvdFZnWUU2RzMvdzR1Tnh4ZmczQ0FydWYydytFdGV6Uk81?=
 =?utf-8?B?S2x3WHEwR3hGM3BMeTdFV2VuaHo4SEpWS0Q1blFJWG5IaHhVODdlVjcrSlpp?=
 =?utf-8?B?UVZqZ1ZPWnNGSlJVSHBCZTIwWURtTnZ2QWJuVmhzNEU3dnE2T2p3bWQ0eThU?=
 =?utf-8?B?NFJaeDNSVkllaFNaMlBVcWFnb0NLMGRnZi9nOW4wbWtldVNMQkFvNGRNL2NQ?=
 =?utf-8?B?NkoyYTd6UFBBZGg5OGlqYmNLR2tnbnhTRUhIMWtwY3NXaklnVGNYMXBxV0Z5?=
 =?utf-8?B?YXA1bGRlLzh0b1M4S0FFTElCaHlSa3ZRdHFpOW9wTWEyUWVueW4rOW9RLzdZ?=
 =?utf-8?B?LzlNRm1Wc0N4cWZ5aVE5UE5td2xvSGU5VTBpT0RWSmNnemR0NjB1OGVyQmJ4?=
 =?utf-8?B?VHhJeTRUdFhIOXEwL1I0R0Vmc3J3T0RaNzU2Tkx2d0IxQ2xzNHMwSzU3M3px?=
 =?utf-8?B?eCtneEF2bG9WMUVGNmQyRSs1cnJSY3dEYjNZelFkZW9HaGl3ZlJ0VVpJdFFU?=
 =?utf-8?B?LzY5TzZMclNvbHNDcGEyU0JaaTNBeFh3dVphWE9JWE1tSmdYeElGN2ZCeFJW?=
 =?utf-8?B?ZmYxQ20wNzd3RGJxTFdTeklxa3E3NkFMMkE1NVh0TjM2Vjg4d0VSdVpnTjFH?=
 =?utf-8?Q?E3adUO?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MmZsTlRPTVVXdHVQZmxBYllBcGxrakpxMGhCd2J3UitnSmdDenc3cGkzS0py?=
 =?utf-8?B?MHl2WjlhejJ4WlRndjVidkFvUkxxYkhPelBvV1NNVG5sYTgvcGtnbXpReTZZ?=
 =?utf-8?B?ZEtYZlBQZnNuU2pNU0owOWt5VldMZ2Eyb0Zud0tTajFwaGxiLzJndm0xUHF6?=
 =?utf-8?B?TFp5U1ZGenIxa2YwclNiMk9XZkx2N3h5NWZ0OEJReVBCVlJYbm9nazZ0WkFN?=
 =?utf-8?B?TUdpd2pEM3hueUh3ME9qaTBqSTgvVEdabDU0Y0NlM2hucU5IaUluSWZKZVRL?=
 =?utf-8?B?Yk1vQlR0RTNlTG9SOHFFTURENjBYZUh1alFiRlBRYkw0RE4rRFVBSXd2WEsr?=
 =?utf-8?B?YjFSRE1IMXdzNXJLRndGK2Y4N0pKWkNhRXRMdVFOUDkvbjBqSFk1UVVtSzZB?=
 =?utf-8?B?WU9iOEFNMndaUkQvYU1yZUMxNzVkZ2RxWFZ2aVN6N1gyQklwVmtRVTI1ZVpW?=
 =?utf-8?B?U3JxN1RXMnY2Y1ErT0xWbEJ5ZUhyWWlOOXJJUFpTMnJTdkRiZUdhK3RBaVN4?=
 =?utf-8?B?aXIyTnF2NEd6R295RVBwdVRSOGNjcTdrRzB3aHlRTjZZb1VyRkkzWWJWOExE?=
 =?utf-8?B?NlRZMnlXWkhsMEx5KzExUGJTYnA3dWtycndROGxuL3AreEpjMVk0YXN4WklS?=
 =?utf-8?B?M3JGYWtCaGRlcjUvSkVxd09CeVlFMC9nOVlDTVpRTWRiNEIzblkrWnl4S2t2?=
 =?utf-8?B?amdZcVVVK3JuODl1Z1ByYjQxNzN5VmdOekFCQVNBYmVhZjZTOEV1RFhGSUww?=
 =?utf-8?B?bWh6bmN6M3NQTmVhcG1QSEtZYTROSmhXdnF2eGZMQnBjUGJ3SDNremU4NWU2?=
 =?utf-8?B?SnFsTHZrcjVBN3JqcVJXbXNhc043bG9sWHpSNC9BbzNzQkpuY0VCQk93VlRO?=
 =?utf-8?B?RnBKRUwwc2FrYmtMQ2JOM3ZCMW1BM2Z4UkJNTnBaK0dUem8yQklXYzJDNHpm?=
 =?utf-8?B?S2phZVFwTTE3L3I2dDBoT3B2WVlDc2NOMktsQUoxeUxPcTdoR2luOUNCc2Qz?=
 =?utf-8?B?eEhpZHUzSHNyOGJpbUovWmp3cVk2VXlCc0M1YkNxTHh5T1VkaUFiTjRMMzJa?=
 =?utf-8?B?OVFaSkp6a0kxMWNNTTFHSXlRK2hJUFhmSE56Y1ZDeUNxTCtqaFFiTUxuZmtU?=
 =?utf-8?B?aHI2cDlCa1RIR01XaTcxU0xtWXhBOHNIUkFlOG5mWFVLRm5mT3d2WElWNGlB?=
 =?utf-8?B?OXJISjkwa0J2bGE1ZVk3R0Qxc0RoSFhJbXl1Sy9UMmhpUWFBL3dDRzRGbWNX?=
 =?utf-8?B?b1Q3elpOaStlWmtxcU1yYTlvWEVuTmFMZjNrQ2dhYzFzUElyajdsNmdxVzJU?=
 =?utf-8?B?Sk5MT3dTNVhJNDl3cm1RQWNYdmlMUFdCQ1o2MXRWcUhyM09McEQvSG9uQ3c1?=
 =?utf-8?B?bmlubVJySlhtTHhvUFlrWDdkN0JLRjRBR3pXU2ZrVFRIUE9aZUsyWHVYYmlE?=
 =?utf-8?B?ZzluYkoraXM0dzdVNTMydStiZDBXakFVOXRPaGM0elpuQWUyY0NxUUN5eXJR?=
 =?utf-8?B?Z2tZdXdVNDQrNklMOFhZZkNpcTQvUjZLTnJqZHgwQlJPbit4RCtxR3M0dEUx?=
 =?utf-8?B?ZG5seXpGM3crTjZGc2dxNjNGWFpMNkR3OG1DK2JqMGdnNlVDbXFvbW51Um94?=
 =?utf-8?B?a1hKOGNUclNzVW9ZUndMUzhjZDdpZWk5blZ1R1M5dzhwNTJvU1pYemxSM1RU?=
 =?utf-8?B?RE1hS0xZL0x0bENZQUR4dDdiUTg0RnNwN2Y4cEJOWE5hMEhJL3MzaUMyNTBn?=
 =?utf-8?B?R3pGTFNvSThRdUxDRFJNTVhsWkM2ZHZ2ckFKdlU3Q2NPUEE5YURFSFVyMUd4?=
 =?utf-8?B?QW8zZTYrRHYvVldCNi9iTzJqaG9DZUZ2MVJZdWJvUFJSQjBTeHNPUG5odncz?=
 =?utf-8?B?SDNJYnlGU1BxQmkyeDBNWlFHbStsRW90SS9kckJEejdKVnc2L0VxR282eWxI?=
 =?utf-8?B?bDlkUVdidU1Zcm00N1FCUnJZc0FHUVJIOTdnTVJKUWxEVDZqYWk1eGdxbndx?=
 =?utf-8?B?NG5uZmVtcWthRVlUazU2VTZlT0UySkcrNStydUlVbjAxTnF5aDVHVDk0R3Fx?=
 =?utf-8?B?Vk9mMUFNV0lDZWtPdVR0dnptclp2bGljblRXekwzelIzeDJOTktnT1I0T0Nt?=
 =?utf-8?B?UC94R3VHRTQ0Zkc5cGJyS3BDcUNiTVNDWUJ2Ym5Cd0hYUWhXam95TXBVWUN3?=
 =?utf-8?B?RWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd1aef5d-58bc-490c-9aab-08de33f52abc
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Dec 2025 11:55:21.0156
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: u7hVH7aKsoLugQx1LimnhtCCHIxAppUBfdMaTOyvU0FWEQinCmx8LyElaOBfXhg0zt8FvGCOdHhGCjATFtU9eUUQAQ7qMC/Q1druApkzfpw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB13102

SGkgQ2xhdWRpdSwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBCaWp1
IERhcw0KPiBTZW50OiAwNSBEZWNlbWJlciAyMDI1IDEwOjU3DQo+IFN1YmplY3Q6IFJFOiBbUEFU
Q0ggdjIgMC8yXSByZXNldDogcnpnMmwtdXNicGh5LWN0cmw6IEFkZCBzdXNwZW5kIHRvIFJBTSBz
dXBwb3J0DQo+IA0KPiANCj4gSGkgQ2xhdWRpdSwNCj4gDQo+ID4gLS0tLS1PcmlnaW5hbCBNZXNz
YWdlLS0tLS0NCj4gPiBGcm9tOiBDbGF1ZGl1IEJlem5lYSA8Y2xhdWRpdS5iZXpuZWFAdHV4b24u
ZGV2Pg0KPiA+IFNlbnQ6IDA1IERlY2VtYmVyIDIwMjUgMTA6NDcNCj4gPiBTdWJqZWN0OiBSZTog
W1BBVENIIHYyIDAvMl0gcmVzZXQ6IHJ6ZzJsLXVzYnBoeS1jdHJsOiBBZGQgc3VzcGVuZCB0bw0K
PiA+IFJBTSBzdXBwb3J0DQo+ID4NCj4gPg0KPiA+DQo+ID4gT24gMTIvNS8yNSAxMjoxNywgQmlq
dSBEYXMgd3JvdGU6DQo+ID4gPg0KPiA+ID4NCj4gPiA+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2Ut
LS0tLQ0KPiA+ID4+IEZyb206IENsYXVkaXUgQmV6bmVhIDxjbGF1ZGl1LmJlem5lYUB0dXhvbi5k
ZXY+DQo+ID4gPj4gU2VudDogMDUgRGVjZW1iZXIgMjAyNSAxMDowMA0KPiA+ID4+IFRvOiBCaWp1
IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+OyBwLnphYmVsQHBlbmd1dHJvbml4LmRl
DQo+ID4gPj4gQ2M6IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7DQo+ID4gPj4gbGludXgt
cmVuZXNhcy1zb2NAdmdlci5rZXJuZWwub3JnOw0KPiA+ID4+IENsYXVkaXUgQmV6bmVhIDxjbGF1
ZGl1LmJlem5lYS51akBicC5yZW5lc2FzLmNvbT4NCj4gPiA+PiBTdWJqZWN0OiBSZTogW1BBVENI
IHYyIDAvMl0gcmVzZXQ6IHJ6ZzJsLXVzYnBoeS1jdHJsOiBBZGQgc3VzcGVuZA0KPiA+ID4+IHRv
IFJBTSBzdXBwb3J0DQo+ID4gPj4NCj4gPiA+PiBIaSwgQmlqdSwNCj4gPiA+Pg0KPiA+ID4+IE9u
IDEyLzUvMjUgMTA6NTMsIEJpanUgRGFzIHdyb3RlOg0KPiA+ID4+Pg0KPiA+ID4+Pg0KPiA+ID4+
PiBIaSBDbGF1ZGl1LA0KPiA+ID4+Pg0KPiA+ID4+Pj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0t
LS0NCj4gPiA+Pj4+IEZyb206IENsYXVkaXUgQmV6bmVhIDxjbGF1ZGl1LmJlem5lYUB0dXhvbi5k
ZXY+DQo+ID4gPj4+PiBTZW50OiAwNCBEZWNlbWJlciAyMDI1IDE4OjI2DQo+ID4gPj4+PiBTdWJq
ZWN0OiBSZTogW1BBVENIIHYyIDAvMl0gcmVzZXQ6IHJ6ZzJsLXVzYnBoeS1jdHJsOiBBZGQgc3Vz
cGVuZA0KPiA+ID4+Pj4gdG8gUkFNIHN1cHBvcnQNCj4gPiA+Pj4+DQo+ID4NCj4gPiBGcm9tIG15
IHByZXZpb3VzIGV4cGVyaWVuY2Ugd2l0aCBzdXNwZW5kL3Jlc3VtZSBpbXBsZW1lbnRhdGlvbnMs
IEkgY2FuDQo+ID4gc2F5IHJlc3RvcmluZyB0aGUgc3lzdGVtIGluIGZhaWx1cmUgY2FzZXMgaW4g
c3VzcGVuZC9yZXN1bWUgb3Igbm90LCBpcw0KPiA+IHVwIHRvIHRoZSBzdWJzeXN0ZW0gbWFpbnRh
aW5lci4gU28sIEknbGwgbGV0IFBoaWxpcHAgdG8gZGVjaWRlIGhvdyBoZSB3YW50cyB0byBnbyB3
aXRoIGl0IGluIHRoaXMNCj4gZHJpdmVyLg0KPiA+DQo+IA0KPiBBZ3JlZWQuDQo+IA0KPiA+IFRo
ZXkgYXJlIHN0aWxsIHN1cHBvcnRpbmcgc3VzcGVuZCB0byBpZGxlLCB3aGVyZSBwb3dlciBpcyBt
YWludGFpbmVkLA0KPiA+IHJpZ2h0PyBTaG91bGRuJ3Qgd2UgY292ZXIgdGhpcyBjYXNlPw0KPiAN
Cj4gWWVzLCBJIGFncmVlLiBQcm9iYWJseSBiZXN0IHRoaW5nIGlzIHplcm8gZmFpbHVyZXMsIGlm
IHRoZXJlIGlzIGEgZmFpbHVyZSBpbiBzdXNwZW5kIHBhdGgsIHRoZSBzYW1lDQo+IGRldmljZSB3
aWxsIGZhaWwgaW4gc2ltaWxhciBmYXNoaW9uLCBhbmQgdGhlIHN5c3RlbSBuZXZlciBlbnRlcnMg
c3VzcGVuZCBzdGF0ZS4NCj4gDQo+IFNvLCByZXBvcnQgdGhlIGZhaWx1cmUgYW5kIGRlYnVnIGFu
ZCBmaXggdGhlIGlzc3VlLg0KDQpGWUksIE9uIHlvdXIgcmVzdW1lIHBhdGgsIGlmIHRoZSBiZWxv
dyBjYWxsIGZhaWxzLCB0aGVuIHRoZXJlIGlzIGEgcG0gaW1iYWxhbmNlIGZvciBuZXh0IHN1c3Bl
bmQoKS4NCg0KcmV0ID0gcG1fcnVudGltZV9yZXN1bWVfYW5kX2dldChkZXYpOw0KDQpTaW1pbGFy
bHksIGlmIHJlc2V0X2Fzc2VydCgpIGZhaWxzIGZvciBhIHNoYXJlZCByZXNldC4NCg0KQ2hlZXJz
LA0KQmlqdQ0K

