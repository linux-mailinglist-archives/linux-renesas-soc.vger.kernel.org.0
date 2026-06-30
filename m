Return-Path: <linux-renesas-soc+bounces-34549-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SbXZGIRvQ2qUYQoAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34549-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jun 2026 09:25:56 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id F2D786E11E2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jun 2026 09:25:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b=q5BKTjtp;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34549-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34549-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=renesas.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4176B3006790
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jun 2026 07:25:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2E1239A071;
	Tue, 30 Jun 2026 07:25:53 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011018.outbound.protection.outlook.com [52.101.125.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E96DC396573;
	Tue, 30 Jun 2026 07:25:51 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782804353; cv=fail; b=Kju9XWKcs9xi5EucbDf1+uzV+z4wQbIUmkOpIz/fYshTjA2MESd5pPIOrDaa6mD45L9q9q2GOlLDDuXrFxhS3q6T3LBcoikJdpkiC2ST8qDJxcAAm5xPTCCidVmjj0waaZ7zWjNW27lFdusoJXhbGDA6uWy0pCsn5iaS34CpPeY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782804353; c=relaxed/simple;
	bh=WtJnAE1sGjevdmMyZe/FtWADM1r0zYHBTouBisi7NNs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=RnOG1as0itAq2Bh5Vr07xKeX/mVDqE8KjkdOSnn1TfvjieYQ7A8WnPmFBSt0b6ie4ZgP6GT03VvxbcNZTZXQ7SOmNCXWvu5OSb93rLH7UWslf7IqFndS9RcvBMKcFMPIAwmfZ3O+iAtzMxvHI/PTt9FaQzgoEtt1pb50+Yd9PhA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=q5BKTjtp; arc=fail smtp.client-ip=52.101.125.18
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YdIekl30fGUwJorAQkN4ZZvFOYoztmTLgpia7zWS5j2JwiB3tpys1cJGzuU1to46mUopXg6gDe3w2f16lPAzV70M+HJGhAE6+hk5jAkYOcAMzCmB0qZw2y6SK4JcA3lEw75VNXhrUmiLAGXUD1ugiDYuEeAuBQCY3MSeLNXqbeVSMMgZ5blFvmSnQuh7yQW1I1qcsanCXCn4uU3jv9zJ58BaqUVIv136bTASvxJCcOSeTGCtP+TNNksfDWxuOdhvbLpL3lP7f5reLrkN+R1tMWAMRZYwpxQ4MBU4k5zgjNAGos5nt959YkaZVqALsP2TUYHofhBKbTzikQlMUBdRaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WtJnAE1sGjevdmMyZe/FtWADM1r0zYHBTouBisi7NNs=;
 b=AiJm4Trak5+6dq1NO8iQinaAkT8nyqX9+tHgpkMEY5NhD/JY99SaCKDLZ18nZEs9nAavU5BgaD5yFLtb2GxtpVcGsmf1S/uE4eYfNbVQCIftmSld7DPuMzYpYNxh+pbbvNrobbnxAlFI1rMOokTgpQmAjJsqT3bsn4io64DfJI5peCWaH4urwBBj+dMl3kFWqWtWhbCjfIEu4ZpDZ1s3U2ttUVoFH9kzssr3tJ6S7/5FfR+A8yCoIGdJ8eOiockqb9RLjWhUof8W0fgPDJPSZF6KhWuQ+ILOMJG9unw0DXU5uAC9ued34HyXv1XL8hCs+a3NEtUF9Pzfg2+92+RlLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WtJnAE1sGjevdmMyZe/FtWADM1r0zYHBTouBisi7NNs=;
 b=q5BKTjtpIbezBX6iUKSArwLCOu/GRj7ZoIiv3W2vYlZGMbRD67C+o7YtF0wpQY1tJ9v7CkVkWd27+rd+MY50jS8UxGr9TQS9dLTQ95GAsglCVBwModvnZbtwfXGkF/c/+KBhzRRDCZ3+qzSMcsLO1+ARg8RSkoRlkgmdPWhnT7c=
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com (2603:1096:405:35b::6)
 by TY3PR01MB11082.jpnprd01.prod.outlook.com (2603:1096:400:3ae::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 07:25:48 +0000
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3]) by TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3%6]) with mapi id 15.21.0159.018; Tue, 30 Jun 2026
 07:25:48 +0000
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
CC: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, "lpieralisi@kernel.org"
	<lpieralisi@kernel.org>, "kwilczynski@kernel.org" <kwilczynski@kernel.org>,
	"mani@kernel.org" <mani@kernel.org>, "bhelgaas@google.com"
	<bhelgaas@google.com>, "robh@kernel.org" <robh@kernel.org>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"john.madieu@gmail.com" <john.madieu@gmail.com>, Biju Das
	<biju.das.jz@bp.renesas.com>, "geert+renesas@glider.be"
	<geert+renesas@glider.be>
Subject: RE: [PATCH] PCI: rzg3s-host: Re-enumerate the bus on PCIe link-state
 changes
Thread-Topic: [PATCH] PCI: rzg3s-host: Re-enumerate the bus on PCIe link-state
 changes
Thread-Index: AQHc/1YQa4l0pbRbRUKcNssNEpLxw7ZWKpaAgACZGFA=
Date: Tue, 30 Jun 2026 07:25:47 +0000
Message-ID:
 <TY6PR01MB17377E9A5F2BC2969D7EC16D7FFF72@TY6PR01MB17377.jpnprd01.prod.outlook.com>
References: <20260618190935.3018531-1-john.madieu.xa@bp.renesas.com>
 <CA+V-a8tCcGtV9Fiz8ByZ+-EXJjyR0+S_g3HnVabtPSx5_s1q4w@mail.gmail.com>
In-Reply-To:
 <CA+V-a8tCcGtV9Fiz8ByZ+-EXJjyR0+S_g3HnVabtPSx5_s1q4w@mail.gmail.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY6PR01MB17377:EE_|TY3PR01MB11082:EE_
x-ms-office365-filtering-correlation-id: 0ab24412-3aa9-4852-b2bb-08ded678ce54
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|23010399003|366016|38070700021|3023799007|6133799003|11063799006|18002099003|22082099003|56012099006|4143699003;
x-microsoft-antispam-message-info:
 6EDbgrxN9Ft1LgDdVEPmTxt1Zb/nQ5+fVE4sL64qZQk82U0jcVixul6S4rAd8MdxddoMpRfOHfzrp892Jqxqpjt4h1qYtAJVp6jFhUUZwVEX2xgB8qPfKJvwU4F46C8K4FOAfkxmcOYMaiTBXkXZzVaV/0lgnwHbMDEH0O0jgake8t/XABWrrq/y3V3vU3e49zDMEIY4lRPEie+3LGYOPfC5+krg6lx0uZYEKRZ0e8Xzcui8rTLthmemN7+HqZzFDgWzBehoeCUaTQt3lyAkRvvQPzxiiqMZekB7Uvnr2UZhCJc1Uz7Ltgq1+WoIlFTsADvgF4TFY3/QDNj24gZ5E87zBBvrPxmHirEoRZH1KQ2hlKF+W1amTNG0cmeQp2YT3ILLkkYRrP/dpZRCR2MvWwDxoL9VhHWlPKYdvreehKqlonQeUmJ7hw20q65I1TfbNCLgahYWJ5chK/QGhkBgdIv6X5Hz9Pe6eND+KCHdq7ivMAIXjA6ms/+6usFFOt9x0iObccH8bv0C8QFflJklMyQQrswVTMCVayYme3ndqb7Hz8fQlzVf93rJCnVh++EjLsD+qfLn/NU6OyfQ9BrqzeVEXi0++Lxi7Oh1iVOwBPFlpcxqjMnArb2dTknPGRoVzrwN++8xDJgfwvXaUNHrHzAO+A9BYE138BFoIJk62TJS+kQ/0NlsMUxA+GCSw+iwJnS+JtYKLbbHlQTrHVs+nCB+PJWcw4uweTXBXj7UGmQ=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY6PR01MB17377.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(23010399003)(366016)(38070700021)(3023799007)(6133799003)(11063799006)(18002099003)(22082099003)(56012099006)(4143699003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bjZtL09pZTR3Z2Y4YTlnbUZia0tnNDVneGlSL01MbVdDNExkRFdldmpMZkpl?=
 =?utf-8?B?dytyV0I5WktPZnp1N2xPZzVmenhhSDMrVXlYY1RaMml0MGtOTDBUSHFrbVAy?=
 =?utf-8?B?SjdsemNPem9qMjE5REF0MDhwaVFqMHZ4cmF6ODkrVEdic1NnQ2NKWEtQdGFj?=
 =?utf-8?B?SUYvUmVldGdoa21qVWN0OWU2STl4TWpmWHgvM2ptcFVHMnpGQnBlbmhaeGZH?=
 =?utf-8?B?cEh0Z3lpN1RPMmlUeldWUjc1bkRldUhjNjJOR2dHenEzRGFnVWRNSnVwRmdQ?=
 =?utf-8?B?UVBXT3dqMS9PZWdHYy9KNnRVc0VBaldTdUplR2o3MzFUcVgrTVRTa3dUYTBv?=
 =?utf-8?B?QkdacWM2K3BpQSt0ODNwanFuejkvblNOMmFkVnlaUDJwTXlBTEN3UEFHSDA3?=
 =?utf-8?B?L2ZZeCtxOVdaZWZKS0ZDc1BtQ2J5VkMrZmE5NGZSaWdaMmc3QzV4OERmK3Q0?=
 =?utf-8?B?ejVKSnIzTHBJckxtUE5QUkJvS1RKQWswQ1dGNDBOYmF4OXN5UjBqZm45ZVJq?=
 =?utf-8?B?SUpMdUhwN2lyNDhjV080VlprOEJSeExnbUl1V043MVVWaGIvRHREN2NFL2pM?=
 =?utf-8?B?eERqOGwvYTE5N1Z2Ym5lL2VpeVJqdlNYVmZvaWhaa0FVZzBtSlJMSTUwRitE?=
 =?utf-8?B?VnU1M0Vwb2NWc2wvMXRXNG01cDhxYnFKdmpJVFlYcnU3NXJSUUxYc0lhYkpX?=
 =?utf-8?B?VEhIaGwwQzBZbkxzSDFFaHgzY29rWUk1dEFQTXRPTjNGTk91U2N2bmFVVFRX?=
 =?utf-8?B?b3kwV1VuaExYSlJLMkovdEthSFYvc2JtaTF5anJnSUo5Y3lGbFhXSDZyS0lP?=
 =?utf-8?B?ZHFoYytZZlJYbnZBWU0vUXZ1UWZwNG9mNmd4aG5wTVJMemJyQ0VUMUhQTmJT?=
 =?utf-8?B?SEI4OGYxOTB1SzlZTWw1WDFSTEFHMW1ra2U4c2p0MzBxbnhHeURwZHYyTlVV?=
 =?utf-8?B?YkI2c1VEbC9EOUU4cmFtMHN2WnZpcWlCOWYwM1hEWlROMExERDdCUDNYdG9K?=
 =?utf-8?B?NStLb0t6RUt5WWxqS2pWbDBPdm1kZHZFU0oxVGFuU3J5c2FRMFl2dk9nc2ov?=
 =?utf-8?B?WTFvUnVNRFRpVUVqNTdRSC9QZUJSTVF2Mm9MNGV1bFBSK0ltUi9iTHBvMDFL?=
 =?utf-8?B?cUVmR1crbVNNNkdoSlZjZzNqQlp6bDFzVHVxa045TkNFN0cwTVZNVU15MDN1?=
 =?utf-8?B?aWdmVTJONER2ZlVpZjRHeStCeWgrYzc4ay9XVDVnU3ZZRHF0RmdmeWdJYlR0?=
 =?utf-8?B?QmZwQWxvdlhiSitjZmwrYThCc1U3MklYMmFPeGdXOGVzUnBKU1JnaFVyRGpJ?=
 =?utf-8?B?emJ4SkVKVGJpR1dSb25QK3lkZjRKbFRiTEhuR3kxYUdGOVBjR200Znk5OVNa?=
 =?utf-8?B?L0NQVnUzR2JMUWZzYzI3a2ZtNGRrZ0E3alYwUXZ3RjZ0cW1tS2FKT1RKYVRp?=
 =?utf-8?B?bDJYTjRDcXdlVTNIOEVueGpyMUtUTVl4WTlSTXIzK1dLM2RzdVVULzRUMDJ5?=
 =?utf-8?B?bU84c0Z3d3hFQlRSdjg0TXpIMEx3RGhoVzE3dFR4QXpEQXlkWU5Uak5JNzdi?=
 =?utf-8?B?WmR3TE9yS2lod3VFbmlFbWlPaTR0bUZZaVdIemt0Y3hpZnpUeEpVajlBRTF4?=
 =?utf-8?B?ZUJyV2ZydFhuZmVFTG5QdkV5WUVDL3U0MEhxVjgvcERhd2l2djZKamVoZ05t?=
 =?utf-8?B?Q0pEekc4Z2ZUR0lSdnNEVWNvRzMrVWxJRU5ZVFh1OVVOdjdRS0RacVNpVnkx?=
 =?utf-8?B?TEVxVnlvZDMrZWk5TDh3ZGxNNlY5TlZYSzdJcW5MVmhNUzlnR1RTU1grTWk0?=
 =?utf-8?B?cWlHdUVyK0lLc0xwQWxQanNoNVJPOHNrRWpiOHNheWJqQkhIZzlhM1R4TVJp?=
 =?utf-8?B?REl0aUlzQmtvVGxLNjdrTDVsZ3hwbFBhdVhtdFd4NFRmUG9xblN2dzFSdy9i?=
 =?utf-8?B?dnZHLzkvclRvMytqckdJb2FFeUpyYlJ6d2s4TTBra2w1aEgva0I0dTd5U0dN?=
 =?utf-8?B?U1M4Snh4Y2U3U0xJdkdFNzRQbnFvN1VFaWVtZWhsZG9BemhRZXp4VkFsemFP?=
 =?utf-8?B?NUc4cHQ0TjF4dGw0eXZ5bjMxNENHNk55TEZ0NnRtUy8zOHk1bUlnYVprbjlM?=
 =?utf-8?B?Z2JGejhBRmRtQVpKMGdsUUkxOVNzckFNS203ZXMrVURuQlFhRFE0SEdPYmEx?=
 =?utf-8?B?dms0VTJzVlFET1dkbFU5WmtJL3pRQy8rL1dGS3lpUmtHL3FVengremgxdDgv?=
 =?utf-8?B?KzZHSmhiTUthcjU2QVBib1U5MWlSalRGcnlYTzd4dHBXV29MaHVIb3c4Vzhr?=
 =?utf-8?B?ZXhUbHYxTnFJS1E1SGxzY1FHSUVuakhiU2d4a0t2dFY0SVBBb1NZcXFKZ0JB?=
 =?utf-8?Q?NB23UToMatA7Loac=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: TY6PR01MB17377.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ab24412-3aa9-4852-b2bb-08ded678ce54
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2026 07:25:47.8123
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9Xh32FZhCC6peMLj8nSEkiCdl+gAg81b9mV14iIgDQwCfL+2hSrTo3jkjeBl+2GfUQByjTqBS1JigTVSwsGw2mG6NzdHZXa8zO0PJ16yEnY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11082
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.06 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:prabhakar.csengg@gmail.com,m:claudiu.beznea.uj@bp.renesas.com,m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:mani@kernel.org,m:bhelgaas@google.com,m:robh@kernel.org,m:linux-pci@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:john.madieu@gmail.com,m:biju.das.jz@bp.renesas.com,m:geert+renesas@glider.be,m:prabhakarcsengg@gmail.com,m:johnmadieu@gmail.com,m:geert@glider.be,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-34549-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[bp.renesas.com,kernel.org,google.com,vger.kernel.org,gmail.com,glider.be];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,bp.renesas.com:dkim,bp.renesas.com:from_mime,TY6PR01MB17377.jpnprd01.prod.outlook.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F2D786E11E2

SGkgUHJhYmhha2FyLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IExh
ZCwgUHJhYmhha2FyIDxwcmFiaGFrYXIuY3NlbmdnQGdtYWlsLmNvbT4NCj4gU2VudDogbWFyZGkg
MzAganVpbiAyMDI2IDAwOjE0DQo+IFRvOiBKb2huIE1hZGlldSA8am9obi5tYWRpZXUueGFAYnAu
cmVuZXNhcy5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIFBDSTogcnpnM3MtaG9zdDogUmUt
ZW51bWVyYXRlIHRoZSBidXMgb24gUENJZSBsaW5rLQ0KPiBzdGF0ZSBjaGFuZ2VzDQo+IA0KPiBI
aSBKb2huLA0KPiANCj4gVGhhbmsgeW91IGZvciB0aGUgcGF0Y2guDQo+IA0KPiBPbiBUaHUsIEp1
biAxOCwgMjAyNiBhdCA4OjEw4oCvUE0gSm9obiBNYWRpZXUNCj4gPGpvaG4ubWFkaWV1LnhhQGJw
LnJlbmVzYXMuY29tPiB3cm90ZToNCj4gPg0KPiA+IFRoZSBSWi9HM0UgUENJZSBjb250cm9sbGVy
IGRvZXMgbm90IGV4cG9zZSB0aGUgc3RhbmRhcmQgUENJZSBTbG90DQo+ID4gQ2FwYWJpbGl0eSBy
ZWdpc3RlcnMsIHNvIHRoZSBnZW5lcmljIHBjaWVocCBkcml2ZXIgY2Fubm90IGJlIHVzZWQuIFRo
ZQ0KPiA+IG9ubHkgbGluay1zdGF0ZSBzaWduYWwgdGhlIGhhcmR3YXJlIHByb3ZpZGVzIGlzIHRo
ZSBETF9VcERvd24gYml0IGluDQo+ID4gdGhlDQo+ID4gUEVJUzAgZXZlbnQgc3RhdHVzIHJlZ2lz
dGVyLCB3aGljaCBpcyByYWlzZWQgb24gZXZlcnkgRGF0YSBMaW5rIGxheWVyDQo+ID4gdXAvZG93
biB0cmFuc2l0aW9uLg0KPiA+DQo+ID4gRW5hYmxlIERMX1VwRG93biBpbiBQRUlFMCBhbmQgaG9v
ayB1cCBhbiBpbnRlcnJ1cHQgaGFuZGxlciBzbyB0aGUNCj4gPiBkcml2ZXIgY2FuIHJlYWN0IHRv
IGxpbmstc3RhdGUgY2hhbmdlczogYSBkZXZpY2UgdGhhdCB0cmFpbnMgYWZ0ZXINCj4gPiBib290
IGdldHMgZW51bWVyYXRlZCwgYW5kIGEgZGV2aWNlIHRoYXQgZGlzYXBwZWFycyBvbiBsaW5rIGxv
c3MgaXMNCj4gPiByZW1vdmVkLiBUaGlzIHByb3ZpZGVzIGhvdHBsdWctbGlrZSBiZWhhdmlvdXIg
d2l0aG91dCB0aGUgUENJIGhvdHBsdWcNCj4gPiBjb3JlLCB3aGljaCBpcyB1bmF2YWlsYWJsZSBm
b3IgdGhlIHJlYXNvbiBhYm92ZS4NCj4gPg0KPiA+IE9uIGEgRExfVXBEb3duIGV2ZW50IHRoZSBo
YW5kbGVyIGFja3MgdGhlIFcxQyBzdGF0dXMgYml0IGFuZCBzY2hlZHVsZXMNCj4gPiBhIHdvcmtl
ciB0aGF0IGluc3BlY3RzIFBDU1RBVDEuRExfRE9XTl9TVFM6DQo+ID4NCj4gPiAgIC0gbGluayB1
cDogcmUtcnVuIG1heCBsaW5rIHNwZWVkIG5lZ290aWF0aW9uLCB3YWl0IGZvciB0aGUgbGluayB0
bw0KPiA+ICAgICBzZXR0bGUgYW5kIHBjaV9yZXNjYW5fYnVzKCkgdGhlIHJvb3QgYnVzOw0KPiA+
ICAgLSBsaW5rIGRvd246IHdhbGsgdGhlIGJ1cyBpbiByZXZlcnNlIGFuZA0KPiA+ICAgICBwY2lf
c3RvcF9hbmRfcmVtb3ZlX2J1c19kZXZpY2UoKSBlYWNoIGNoaWxkLg0KPiA+DQo+ID4gQm90aCBw
YXRocyB0YWtlIHBjaV9sb2NrX3Jlc2Nhbl9yZW1vdmUoKSB0byBzZXJpYWxpc2UgYWdhaW5zdCB0
aGUgUENJDQo+ID4gY29yZS4NCj4gPg0KPiA+IExpbmsgZXZlbnRzIGFyZSBvbmx5IGFjdGVkIHVw
b24gb25jZSB0aGUgY29udHJvbGxlciBpcyBmdWxseQ0KPiA+IGluaXRpYWxpc2VkLiBBIERMX1Vw
RG93biBsYXRjaGVkIHdoaWxlIHRoZSByZWdpc3RlcnMgYXJlIG5vdA0KPiA+IGNvbmZpZ3VyZWQs
IGZvciBleGFtcGxlIHdoZW4gdGhlIGV2ZW50IElSUSBpcyB1c2VkIGFzIGEgc3lzdGVtIHdha2V1
cA0KPiA+IHNvdXJjZSBkdXJpbmcgcmVzdW1lLCBpcyBhY2tub3dsZWRnZWQgYnV0IGRvZXMgbm90
IHNjaGVkdWxlIGEgcmVzY2FuLg0KPiA+IFRoZSBod19pbml0aWFsaXplZCBmbGFnLCBzZXQgYXQg
dGhlIGVuZCBvZiBjb250cm9sbGVyIHNldHVwIGFuZA0KPiA+IGNsZWFyZWQgb24gc3VzcGVuZCwg
Z2F0ZXMgdGhpcy4NCj4gPg0KPiA+IFdoaWxlIGF0IGl0LCBtYWtlIHByb2JlIHRvbGVyYW50IG9m
IGFuIGFic2VudCBkZXZpY2UuIFByZXZpb3VzbHksIGlmDQo+ID4gdGhlIGxpbmsgZmFpbGVkIHRv
IGNvbWUgdXAgZHVyaW5nIHJ6ZzNzX3BjaWVfaG9zdF9pbml0KCksIHByb2JlIHRvcmUNCj4gPiB0
aGUgY29udHJvbGxlciBiYWNrIGRvd24gYW5kIGZhaWxlZC4gRGlzdGluZ3Vpc2ggdGhpcyBjYXNl
IHdpdGgNCj4gPiAtRU5PREVWLCBsZWF2ZSB0aGUgY29udHJvbGxlciBhbmQgcmVmY2xrIHJ1bm5p
bmcsIGFuZCBsZXQgdGhlIGxpbmstdXANCj4gPiBwYXRoIGVudW1lcmF0ZSB0aGUgZGV2aWNlIG9u
Y2UgaXQgYXBwZWFycy4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEpvaG4gTWFkaWV1IDxqb2hu
Lm1hZGlldS54YUBicC5yZW5lc2FzLmNvbT4NCj4gPiAtLS0NCj4gPiAgZHJpdmVycy9wY2kvY29u
dHJvbGxlci9wY2llLXJ6ZzNzLWhvc3QuYyB8IDE1Mw0KPiA+ICsrKysrKysrKysrKysrKysrKysr
Ky0tDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxNDMgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25z
KC0pDQo+ID4NCj4gVGhlcmUgYXJlIHBhdGNoZXMgYWxyZWFkeSBpbmZsaWdodCBmb3IgdGhpcyBk
cml2ZXIgWzBdICh3aGljaCBzaG91bGQgYmUNCj4gdGhlIGxhc3Qgc2VyaWVzKS4gVGhpcyBwYXRj
aCBkb2Vzbid0IGFwcGx5IG9uIHRvcCBvZiBpdC4gUGxlYXNlIHJlYmFzZSBvbg0KPiB0b3Agb2Yg
dGhpcyBzZXJpZXMgYW5kIHNlbmQgYSB2MiBtZW50aW9uaW5nIHRoZSBkZXBlbmRlbmN5Lg0KPiAN
Cj4gWzBdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI2MDYyOTIyMDkzMi44NjE0NDUt
MS0NCj4gcHJhYmhha2FyLm1haGFkZXYtbGFkLnJqQGJwLnJlbmVzYXMuY29tLw0KPiANCg0KVGhh
bmtzIGZvciBwb2ludGluZyBpdCBvdXQuIEknbGwgcmViYXNlIGFuZCByZXNlbmQgd2l0aCB0aGUN
CmRlcGVuZGVuY3kgc3BlY2lmaWVkLg0KDQpSZWdhcmRzLA0KSm9obg0KDQo=

