Return-Path: <linux-renesas-soc+bounces-19834-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B3EB17FF6
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Aug 2025 12:10:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 004DE3A72C5
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Aug 2025 10:10:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3D16231832;
	Fri,  1 Aug 2025 10:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="Ywt5n6ms"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010041.outbound.protection.outlook.com [52.101.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C516620E030;
	Fri,  1 Aug 2025 10:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754043052; cv=fail; b=aSmUVqy5Z7RmGrO+74oL+ig1ySMq5Atu8H9xTi96hwgWCxgILdWkbsju1zcFKYXIw2ne4tYBLKtS2ysji23R5oZu4b9AgEcd62RTQ5KlZGREw9l3WusrAjpeElw3e0oo6o07Hp7uTzdVtyMuwgBh4rQ9egyfxK0uVoTfMUOWEfQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754043052; c=relaxed/simple;
	bh=ebVqE4JGlN5bFSZgXz5/ZfNXb0PKVEETkqnp/VJ8/1E=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=XIKv4H8weyaBJzYz/nWly6Zndf8KE5Z3C/li3MCt973VfUdt35p/39RjU9oAE7vBAQ5UFeHiWDRyDtFtVx8qk0GDv+mP0ItviQlx9jOlPJrGrDTvMFjFuz6ydu8qxM8euHvUnyrk1kxJcS6XujYpJPAgwVOyEoFnPJ6QlQAPjiY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=Ywt5n6ms; arc=fail smtp.client-ip=52.101.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JCCDPCbYXQq6TCQdbC4DAy5NKpQ4vhGUcdla/hdq61uZYvQMWeg/wRmtUL+FUliRMynAtMW3RaFTrj4yFJ03cJ2nk7skVFmoEVHFU/jLpwVDEgYTg6FISZM2QlViD5JFVo4OP1GBtYmxCIoanHe3RmDRZlgfZbMgLsEn9ynBeu1mMhRTdEjmwGs4pGvLRsOLdlzgg4xQCG0sdIEk5DFxkYIcPoi05s08LfqIf7QQ5gmbclIqQPaT5ptPLA4DgPoN8beaxcN5hra63y/5mt0AUv2LCG6EMJbj0UrxWpyvKuLEbmRF1TtglP7HMUcVZWPwzCu4l6e37kxTZjSgRNBuCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ebVqE4JGlN5bFSZgXz5/ZfNXb0PKVEETkqnp/VJ8/1E=;
 b=vA5vmEbZcGDARB6JtW4t3VPkccLxX8uIabXscndP2/tmXAxEM1j86C5rqa2/3J/aE7DbBpjR+GJlVJsYx4WJBRjRbE/cYw9Uqk7BnnJAPUqiQzAttihQqOHYNDoBos/JAiIWFnpeNaum+otMOhRtb2i8utsYl2Da1N9ZMdx+pRbXU+wqc/N+5PH900AR1Vumn6MVC3JxW8N1PjuxHrK30fjfNdLUqW6tTAh02PgPUogypJUnO7Wf4iphCNsCL1dsB1DTEoXQW7YbpyegHK/oqj9XMT8NAu6sX6rtE2/FKgQ3m9rvZIsXQ1xektvfTeIkP1VBEb+ZoNbSsIEVi+kiSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ebVqE4JGlN5bFSZgXz5/ZfNXb0PKVEETkqnp/VJ8/1E=;
 b=Ywt5n6msUlLm/KPr0EqvKs5h7lwifRiZOVUO81rNGVBLEoMHCjSPFiqs3Vs3hC01vjCJgCwDx2ue/AuwdLfepWLEhJY3E2VgGE5h2jeBeT+Zw/WkDXF+FeWz9q+MRszXSWZX0yuYbcq5Pzx1rpm/v8eZADV/7TgnosPSNIpy4wU=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYCPR01MB6077.jpnprd01.prod.outlook.com (2603:1096:400:61::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.16; Fri, 1 Aug
 2025 10:10:46 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%7]) with mapi id 15.20.8989.013; Fri, 1 Aug 2025
 10:10:46 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, geert <geert@linux-m68k.org>,
	biju.das.au <biju.das.au@gmail.com>
CC: magnus.damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] arm64: dts: renesas: rzg2lc-smarc: Fix typo for deleting
 node
Thread-Topic: [PATCH] arm64: dts: renesas: rzg2lc-smarc: Fix typo for deleting
 node
Thread-Index: AQHcAhnPYXXZJZvDfUKebpJ6p3R1PbRNZ/qAgAALdYCAABI2AIAACR/A
Date: Fri, 1 Aug 2025 10:10:46 +0000
Message-ID:
 <TY3PR01MB1134621E4F7282C5CB3344B0D8626A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250731125109.147422-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdXTbOcYPrgHxpCNJEWNhcd8e5NBC0gyYQXn0KmQ8wqEMw@mail.gmail.com>
 <TY3PR01MB11346C00F991D3D718D16417A8626A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <4ba8a463-43bc-402c-9814-5ef811d4c715@kernel.org>
In-Reply-To: <4ba8a463-43bc-402c-9814-5ef811d4c715@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYCPR01MB6077:EE_
x-ms-office365-filtering-correlation-id: d59f28dd-de68-4aec-9f10-08ddd0e3aeba
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?NVV6VEg2MitPcmxKT1N4TmE0YVdPV05sd0ZvWUpPblUxMjF3cFBzTnF0a2pC?=
 =?utf-8?B?c0lyV1NmamlxZTgrcVJuUGsvaGZvSWRQSlJRczJXQ2lhN2pqZ0dhOGJPUTFo?=
 =?utf-8?B?MHUrZVlCdkY1dzV0RUJ4L0RyOGRPdVM5Y0pqK3plbFArbWt1Uk55dDh2RXR0?=
 =?utf-8?B?ejEycFYxeFZqYWNITEoxTUtIQjJxV00yLzhsTmRoK0I1Vmg1SDkrM3ZQbE5K?=
 =?utf-8?B?bE82UUtveEY4VFBMcEROWkViQW9rbWsyaElIajN4VVZvODFlWmVZUmtPYWlR?=
 =?utf-8?B?YTFmMG1od3ZyL0trZG5OckxOYVJ1cE5OajE1aWx6cW8wWTh5eVJFNzJQUUdr?=
 =?utf-8?B?akFad1VZSDhxTHJiMlBtNXRxaEljdmpneWxzRkJBN3BYWmtLdnNJQWhDRUtl?=
 =?utf-8?B?MW9rSHdrckdxc0hLOENtQUErbmU3MXNkRmFWUW5xTjFUTXE2MWhUSEgzSkNH?=
 =?utf-8?B?bmo5SGFEYVJLbDJaUHcxdkQxVHFKVysyZDNZcWpxMmdtYTdhNmtIMWxNMUlW?=
 =?utf-8?B?YzRvbDljbW5vMmRFczk2YmFrbjJDSU9wanZLcWhtZzh6RkJMMWdGZFV0dnhu?=
 =?utf-8?B?aVZSMjZVSStZbzV2bmN3RjhUenR2M2xMVE0zRGpRanpWakZaRTAzRDBDcm5t?=
 =?utf-8?B?YnNlUVovYW5YSnBleWJjdG8zSnNzNFVLWVFvbWR5eVBKellmUlVma1I0azRw?=
 =?utf-8?B?bkU1cHBGMnpsUHZqWjRJNXZmWEpwaEU5bzlESjIrNlpKcnZmVEJzUUFTSjZs?=
 =?utf-8?B?cnNLN0hmclQreUJVYTMxbUFzNGxOUUI3cHR5NWg4NkhBU01jb3Q0d3lySFV1?=
 =?utf-8?B?NGxVRWZJK3djWWhsVndLTlJ0TWZmVGtEOHpleFBPUGNpWllEL0VWMUw1clpn?=
 =?utf-8?B?azdNU3VWbDVyOE8rWXAwRi9COHVVM1NYZW80aUh6Wjg5NzAycWJSVS9wNnNY?=
 =?utf-8?B?b01Gc1dhQzF1MDhtZm9TK3YzbEw5dHBqZzRRaFZFRzVQYkxCRnIzSER2dngw?=
 =?utf-8?B?RnNUMHZQMzZNQXZIK0pndGx3bWhvRHoyaVNzZ0xqOGNGM05RVHVyeGFWQ3Ri?=
 =?utf-8?B?VDFjc3BWSXcyRGQrRVhvN3ZhZWVxeGtOTFdwMVhpbDJBc2VoV2l3WnUxME9h?=
 =?utf-8?B?QnM4MDltU1FBWGVaUzZzOTFPOUgxVzkvZmtjWFJMeUJGdFdqN1BZUDFzNVZo?=
 =?utf-8?B?MkZUYnRqdmlqd0c0WW9KQU1PeCt2ZVFkcmcyVHI1K1U5L1JrZTlmcUFwV2I4?=
 =?utf-8?B?UVNWcFZILzMrK2gyOTF5bnZIN2JxbDZXUFlxUXlSUXNjK0VqcjRrL05CVjlH?=
 =?utf-8?B?UkFWTDBncjE1c0VyTG0zUGhFSjNQdnkwL3MxRU9xY0xFcHZwejFnc1d2a0hU?=
 =?utf-8?B?dU5GWWpJdHRSTDFyZ0ZqdnNXdGZiUnN3MzFMMFJXODNVYmliNGduU2J5N3ZW?=
 =?utf-8?B?TVVSdit3aWVFeDZQVjMzZDJMeHRtdmZ0Q1M5RnRMM3JjZ2RqMmVjRDBncE8z?=
 =?utf-8?B?YkVyUTdibXZvL1NuMDl4WmtiVUY2cFcvQ3hUMGNnRFVrbG1IV2YrYkJyM0lE?=
 =?utf-8?B?b0x2dzZiUUJucExQL2g3ZXhKVEU2SHBPK3BBU0V5QmkxQTVaRk1neHNjL1ZG?=
 =?utf-8?B?WEdtOU5OOFF5SDh5RXlTSWFRZUxFWEJwRWVSbmFUaWFVdFhGdGlBSEFLQkpn?=
 =?utf-8?B?eWNXWDYwWkl4Nlc0Z3Jid2JCWC92UTVxWk9hRy9RTkY5R3dBd1dKMkhHdmln?=
 =?utf-8?B?aFJIUlVuRVRadXdVV3F0TzcrMkxjRXFBa3ZCUXpzcFlVSCt4ME9YcWp4TS9r?=
 =?utf-8?B?dXpIQkpKWFlSUmxzQ0lnWTdRT1R5SWQ3b05aSngvS21SNkpOTXZCTXc3aUdH?=
 =?utf-8?B?OXBTMnFiUDBjZnlpVGhZZlpHNnYrei96NTkrVXNNcm0rcDZEb0c0YW93RlNh?=
 =?utf-8?B?aUIvMEtVOXlkTkFMbWh3U2N3UXEzWTdQS2s1YnRVVjArZ2JQYkRQZUFBZ0JG?=
 =?utf-8?B?cUladUphUHBRPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RnZpZmpENVp6bDNrVlgxZ3NrWnJNLyttSElGRXV2am5kNnRkSytWNU1TZ0N6?=
 =?utf-8?B?b2YwblB0MlBiL3hhbmpXdjdjNjNBdU5uQmpxd2J3RlhDdnNZNGJaSGdsRGhr?=
 =?utf-8?B?dmFHRlg5TVlGRHNzQTNFM2xmMFc2R2R3dTdDMUwrK3J4Qk9qRDRnSDR5Uzkx?=
 =?utf-8?B?dERiMm1CRTNtQ0NrVFFMUU5tOFJlUXM5UUEzNjBuMWFQRnZYeVQ4L1JlcElG?=
 =?utf-8?B?bFZKV280TGV3UnVscXpnaVZTanRLSjQ2dk13d3FQaU9sRTU2VUdxUnRoMkl6?=
 =?utf-8?B?RlgvMjU3aHh1OWk3TVEyN3dWeTNSSWs5QkFBamljaWoyMXJZQTUzNDBRcXg0?=
 =?utf-8?B?NmE4TVhWWHBKSFdmWjZ5aS9sWWViKzd0ejJXYVdnQVZFN3YxSnlZT2FTYk1T?=
 =?utf-8?B?ak1mUmNMWlFWRUtuY0taYjQ3QTRCQm9kclBFQ3Q1OCtubng0MW9GbWlSMkln?=
 =?utf-8?B?aXVkOUVuYTNoVXo3enZmaWw0RENodFlYYTlUNW0rL1hCNnJBQXNzMElId0Ri?=
 =?utf-8?B?TXBaRkxhS3puY3laWFhORmhRRWpBbXZNeFlpWUtyOTkvQURyZHYyTFg3ZkFn?=
 =?utf-8?B?MFF3TEY5enQyUGdKZkNlaFo1MUdVQkhscTd5SVVrU0F1OGJtaVlYTSswRlg0?=
 =?utf-8?B?QWhoM0dhSjBpSGxiN2FPWFl6R2xUOHM0VUNaRXVqdkRiM2JvaGhTNGdGZi84?=
 =?utf-8?B?ejlMUmJjdXVYcy95UWZJUmRIMGNJWndwa01Tazl1dHhTdVZxZjNTUS9LUWlY?=
 =?utf-8?B?N0Rja1dzNU9yNzRzWHpDWUpxRzlUM2p1UXZoQUV4U2xrRmJlejlPbS9VNnlC?=
 =?utf-8?B?aWRUUEMxaFRjME10U3ZtTENRQnBIcjVPRWpRYlpLOE1vVFdGRnlkcGowUU5M?=
 =?utf-8?B?cUo3R0VMTzZQMTArd3Rma2tVQ0lvWjNyWlR3NENkcjRWOFJneXJNaGJtbitF?=
 =?utf-8?B?NTBDbjdLSHhpc0I1eDhMakJaNmlnQmtDdmtiTTI4U1Z0ZEUyNXA4U0RJeVJK?=
 =?utf-8?B?SGxRSzZnME02SDdUeWkwMUdrMERGaStpNTd0R3JrTFNmcXVWTDM2Y3Iwbkhn?=
 =?utf-8?B?Z0w2NnBGTUJsNWlvV2JmZDR6Q0RzTmpibGNrbXEzUGVhQUJuU09UN2JvOWsv?=
 =?utf-8?B?UjNZbFdpUjVRRzNOUEZIcDJ6OFl6N0xKTldNeGpLVmZVN2dkNnFzRDloOTI1?=
 =?utf-8?B?eFhDVGlUK2NnYnM5ZDVmQStOZW93MC9yWlhMNDVLYVoyQ3FwZGF5ZTQrb1JI?=
 =?utf-8?B?ZkcrUllYVDdVVldVT3QrUzlTbzBPZnFjNm1sSzl1bUFxbGlEeS9rQTd6VGZn?=
 =?utf-8?B?OEVaNFdKQWNkWGZqZlhsdG1jM0tLM1A4cCtIOEZFWEFsWll0eFJXeWdURWtC?=
 =?utf-8?B?bFV2WDlPaEFFV2FuMWFGRzUyMjlzcUtpWVVEbjVYTlBjK0IzMUI1UnFiVEha?=
 =?utf-8?B?MEphNUYwb0p2VDhpSGlXNUJhRDhSQnp1QWFrZWEvS2VMZEQvSkkyd1ExeElJ?=
 =?utf-8?B?VDBkL01rWStScG1vSmpMM0RNMFFTNEhGUWoyZjc1SFJhVkVoVmlFdDJkYmVY?=
 =?utf-8?B?aGRUL2N5VHRHM0R0dWl6bHo4MVBmQk0wME5USk0rbmdzeStuMURnSVIzRVds?=
 =?utf-8?B?Z3RmZWdIbVRFU3ZtK3FJbndLRWNqMm5haEsvQlQvdnN2N1IzenMzYnJOWVFy?=
 =?utf-8?B?NVVldi9leSszd251eFh2RUFxSGpNVk9PTjNrcGRLZmhYN1ZYeWozd2NkeTRl?=
 =?utf-8?B?VDl1R0dMSUFZbTRaNHNLSlU3N3VBYW0relMwQW5ZaUtKU3dnWFR0eVBqd3Av?=
 =?utf-8?B?M3VMWFBqcEdoRmFZbzBHRUk0S0lmQnAyTjRtbmJjVkNJbUlqcjlvb05CWFNj?=
 =?utf-8?B?TTJUQml2Y1pXNVNWQ2JtUnlNOEhiWXR3SmhENW84dHdJYWZndmFRQzlnTTU5?=
 =?utf-8?B?Vy9VQ3R2L25hWXZPNVhMbWZBL0xhOHdXc0NuLzR1U1B5MmJFUUhZNXhhSW9E?=
 =?utf-8?B?cmdwY1JwRERIOS9oa1JKeWJtMlh4L2ZTeWs4UEl1UXJWTStuQ290bU9mUExs?=
 =?utf-8?B?cks1VGFLOEQ1anRGNjdJS1lQQitUZkVKSkVlQkFFSmdIYnVlNk43R2FLdzdx?=
 =?utf-8?Q?/61ixjP6r9P4KxDrVIAn+jf3x?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: d59f28dd-de68-4aec-9f10-08ddd0e3aeba
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2025 10:10:46.4016
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VcCUy2o64hLbekYXCbchEd8BhK0HEYlhn63ftRpUlFHCMb2czP96+Ud5jefwTt7J4UaIeyVya+v0SbsIocDkzse2HwUrMzGAjSjhb964fj4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6077

SGkgS3J6eXN6dG9mIEtvemxvd3NraSwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0K
PiBGcm9tOiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+DQo+IFNlbnQ6IDAx
IEF1Z3VzdCAyMDI1IDEwOjE2DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIGFybTY0OiBkdHM6IHJl
bmVzYXM6IHJ6ZzJsYy1zbWFyYzogRml4IHR5cG8gZm9yIGRlbGV0aW5nIG5vZGUNCj4gDQo+IE9u
IDAxLzA4LzIwMjUgMTA6MTEsIEJpanUgRGFzIHdyb3RlOg0KPiA+IEhpIEdlZXJ0LA0KPiA+DQo+
ID4gVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suDQo+ID4NCj4gPj4gLS0tLS1PcmlnaW5hbCBNZXNz
YWdlLS0tLS0NCj4gPj4gRnJvbTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhr
Lm9yZz4NCj4gPj4gU2VudDogMDEgQXVndXN0IDIwMjUgMDg6MzANCj4gPj4gU3ViamVjdDogUmU6
IFtQQVRDSF0gYXJtNjQ6IGR0czogcmVuZXNhczogcnpnMmxjLXNtYXJjOiBGaXggdHlwbyBmb3IN
Cj4gPj4gZGVsZXRpbmcgbm9kZQ0KPiA+Pg0KPiA+PiBIaSBCaWp1LA0KPiA+Pg0KPiA+PiBPbiBU
aHUsIDMxIEp1bCAyMDI1IGF0IDE0OjUxLCBCaWp1IDxiaWp1LmRhcy5hdUBnbWFpbC5jb20+IHdy
b3RlOg0KPiA+Pj4gRnJvbTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0K
PiA+Pj4NCj4gPj4+IEZpeCB0eXBvIGZvciBkZWxldGluZyBub2RlICdjaGFubmVsQDAnLT4nY2hh
bm5lbDAnLg0KPiA+Pj4NCj4gPj4+IEZpeGVzOiA0NmRhNjMyNzM0YTUgKCJhcm02NDogZHRzOiBy
ZW5lc2FzOiByemcybGMtc21hcmM6IEVuYWJsZQ0KPiA+Pj4gQ0FORkQgY2hhbm5lbCAxIikNCj4g
Pj4+IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4N
Cj4gPj4NCj4gPj4gVGhhbmtzIGZvciB5b3VyIHBhdGNoIQ0KPiA+Pg0KPiA+Pj4gLS0tIGEvYXJj
aC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3J6ZzJsYy1zbWFyYy5kdHNpDQo+ID4+PiArKysgYi9h
cmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcnpnMmxjLXNtYXJjLmR0c2kNCj4gPj4+IEBAIC00
OCw3ICs0OCw3IEBAIHNvdW5kX2NhcmQgew0KPiA+Pj4gICNpZiAoU1dfU0NJRl9DQU4gfHwgU1df
UlNQSV9DQU4pDQo+ID4+PiAgJmNhbmZkIHsNCj4gPj4+ICAgICAgICAgcGluY3RybC0wID0gPCZj
YW4xX3BpbnM+Ow0KPiA+Pj4gLSAgICAgICAvZGVsZXRlLW5vZGUvIGNoYW5uZWxAMDsNCj4gPj4+
ICsgICAgICAgL2RlbGV0ZS1ub2RlLyBjaGFubmVsMDsNCj4gPj4NCj4gPj4gQXMgcG9pbnRlZCBv
dXQgYnkgUm9iJ3MgYm90LCB5b3UgbXVzdCBub3QgZGVsZXRlIHRoaXMgbm9kZS4NCj4gPj4gSW5z
dGVhZCwgc2V0IGNoYW5uZWwwJ3Mgc3RhdHVzIHRvIGRpc2FibGVkLg0KPiA+DQo+ID4gT0suIFdp
bGwgZml4IHRoaXMgaW4gbmV4dCB2ZXJzaW9uLg0KPiANCj4gUGxlYXNlIFRFU1QgeW91ciBwYXRj
aCBiZWZvcmUgc2VuZGluZyBpdC4gVGhpcyB3b3VsZCBhdm9pZCB0aGlzIGVudGlyZSBkaXNjdXNz
aW9uLg0KDQpTb3JyeSBmb3IgdGhhdC4gV2lsbCB0YWtlIGNhcmUgbmV4dCB0aW1lLg0KDQpDaGVl
cnMsDQpCaWp1DQo=

