Return-Path: <linux-renesas-soc+bounces-28682-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oEvEMWSBpmn4QgAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28682-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Mar 2026 07:36:20 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 692251E9AE7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Mar 2026 07:36:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AE6B630927DA
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Mar 2026 06:35:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27AFF3845C5;
	Tue,  3 Mar 2026 06:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="F8epB+47"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011014.outbound.protection.outlook.com [52.101.125.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 602EC1E230E;
	Tue,  3 Mar 2026 06:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772519702; cv=fail; b=ly41mVYDNFHaUaavD9wZNVQv2Q8ZCvNnUPZgpePYqlOir88uuA3Yhh0qxsAn9XP5f6ufH3ukKmsWIkbhokPjvXhFQKzzmwcC/BekmfiC6OYpHkGbGE2Q0TyWACPniMoDqqrEe0nr8bRlvX2ok6DvjTJzF26YkvuDJ+VDuqkvE4A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772519702; c=relaxed/simple;
	bh=XOYrQvCY/CTJPU52Fu4Bvie+QvxQLychDM4ohnpmh94=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=paNBm10J8tsCc4H6wAo2zP84BOIz2zZtMlPhlYlZYULTgrg2PYTYGg7JMa9wBW7kXixeFjQwVPs6g80pEn/kfS52em6mV9V3vDritt/0TeTB/O6rBijNd4H2N6a+bB+hHdCI4C0fYSn9Ag6gxMs/1tZn14qRcZbmSZInXxAidDo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=F8epB+47; arc=fail smtp.client-ip=52.101.125.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=APh3qy9R652D2mJHoSboDW+cfdofOQS+i7PVs+EZavqJEmfYJNQBtBdzLGTKZBNWCT3D5AlX4tMmjxeYhLK2tMJKN6XUzDwlrod6K1D3gb2XD5N6iRTLMUgV9ZrcKMo2ufS/bjhyGMh9ip9ZKq9lyzeukF3LiwENZgvGDnhs/kY6aDNLKofdYrZKTedS9oY9xdEcP52hVSMuvnTIaEFAeL36n29qAeSayy8Jc4GT4G+5k3Qfsb5o/zJBl5bK2LvjVbxQveioCg+Fz9/ZrK7vGvpMTIyiaW9dzBEjuV7Wr5nNSV/B7IAJonGAejNigyrTZhZJ5El5iETgQBZKpJo3eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XOYrQvCY/CTJPU52Fu4Bvie+QvxQLychDM4ohnpmh94=;
 b=Ausi2y2deBmkXdw6GAt2Nedz/fYpMG9/gxlISQT9Gi6FGJT1MrYQk/2iIVkOxytJN+JjUAZMGknNOCSu+Xpo6rheRi/JzmAcMuHvcHJazlzthWtKPJ16E3STafWYt2Ih1oAeBwKC6vD3E29BLD+6s9ioaM1OgLwcY9Yv1E5p+yqMXkuMmbW/X7UNbquWPApdmRP1kVqD4YAeWrU8/WTv034isQT7CZgat3NTq7bS9rQo8VEHq4KNiy6BtyH8UzZJCd23cXUZ/4FeSj0Z60OJYpPD7nDxBgk46EcaSZiHg5dr8bIHjKOvOLLe/QlV6R/ayst0jlr+h/qRQ8C635uRwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XOYrQvCY/CTJPU52Fu4Bvie+QvxQLychDM4ohnpmh94=;
 b=F8epB+47UoY4EXSXprY20WT78WZ5a90n0A0etentaA0aKvNjur3geluJZZSjl0qp8+PAft5EivAsGwHOJcVvPCOEh8FZNEg/7BTBn+8Bq56HduziSwRRCjLasJgqoeKfbd/sYg5fSSFY03RaTzTLO6Mj/dbrdNTKkmB7bRndr60=
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com (2603:1096:405:35b::6)
 by OS9PR01MB17219.jpnprd01.prod.outlook.com (2603:1096:604:40d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.21; Tue, 3 Mar
 2026 06:34:56 +0000
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3]) by TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3%4]) with mapi id 15.20.9654.020; Tue, 3 Mar 2026
 06:34:55 +0000
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: Claudiu.Beznea <claudiu.beznea@tuxon.dev>, Claudiu Beznea
	<claudiu.beznea.uj@bp.renesas.com>, "lpieralisi@kernel.org"
	<lpieralisi@kernel.org>, "kwilczynski@kernel.org" <kwilczynski@kernel.org>,
	"mani@kernel.org" <mani@kernel.org>, "geert+renesas@glider.be"
	<geert+renesas@glider.be>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>
CC: "robh@kernel.org" <robh@kernel.org>, "bhelgaas@google.com"
	<bhelgaas@google.com>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	magnus.damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"john.madieu@gmail.com" <john.madieu@gmail.com>
Subject: RE: [PATCH v7 09/15] PCI: rzg3s-host: Add SoC-specific configuration
 and initialization callbacks
Thread-Topic: [PATCH v7 09/15] PCI: rzg3s-host: Add SoC-specific configuration
 and initialization callbacks
Thread-Index: AQHcp/6Aom0IM/KNdk27AqANxOY/wrWbczMAgADsOKA=
Date: Tue, 3 Mar 2026 06:34:54 +0000
Message-ID:
 <TY6PR01MB17377C2C36EE406494F0EF0A1FF7FA@TY6PR01MB17377.jpnprd01.prod.outlook.com>
References: <20260227153236.55988-1-john.madieu.xa@bp.renesas.com>
 <20260227153236.55988-10-john.madieu.xa@bp.renesas.com>
 <a22454c4-637e-4114-b43e-fa8cb1363cdb@tuxon.dev>
In-Reply-To: <a22454c4-637e-4114-b43e-fa8cb1363cdb@tuxon.dev>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY6PR01MB17377:EE_|OS9PR01MB17219:EE_
x-ms-office365-filtering-correlation-id: 35305934-8d57-4d55-ac5e-08de78eefb5b
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 NDqdlpGO+zXTlXAV8r+2OaNnMAiMTmVr+ymAlNUFf6yr/X8gtb/zUyznph5VlgtXB7uJxa+h5tvXI3OZ5fpeaPNN7y7VYld/W3F1YE+2GMWvqFp4NbUZjGQRRJ6KUgfDm7iQ1nxws36MabZkYZAXlVgd4dXtc3gcz0u8erj62snCoG6J4hl9LRrzL3qzrs7iC435/B9QW/ZsoiK1DaB8LgkWQj6zLUH8rVopk9QuBLEMpMDjmnlPW1odyKkdDFyubJ7dGbXYot9ySsnAmjQIFZnU1OhZvyg243ZTw7EEsG8qddsd8HQgF2Nz4vja5thizEv3XWOqICexS1BdmwpDXMzWkuUQytubN2aDE+/EpqGhsT4k8Z0J1tJoS+UwRPbuzhhzhQ14hy3Jt79k2SXW/VH9j68gA7s3YZ0PMUVdvHGzReDVgIH3MovYTaWR39beQeD0C2RnVYZtN+jeXvJ2IwcaHS54j4thFVHfhb+KL0tE4r5JwFaOIm7mVp53HamlFFnRyWXNsMd/HVNRzYWV6zTzm1DYGHvTrS2dByhPvYtKQDIWZjvH1M4P4LkTnJNQks7CZg5eaQRsKm/9HFAyaTAWiLwcr5W2/4TK1m72B88foUEMvjQWeLfLFI76YFThDg6TuMDwIL/+iRLgkYRLP0oi98DHRJMq0AXuysrWlQB0wlD6VjsVzUbbsrxLUKromMusvHiESYTjPUCSnaTxUfEc5M9UyKDZzrRdY2DF/6zdYb8ObcREYlpU0vZSy1mV9D+N1fdSBiVcvGe406mb9J7T22KMyRTUHRAzN8h2fNA=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY6PR01MB17377.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WlJoZ0tzOHROamV2R1I0SUJWUzVhakwzSFhDTWdCSTFwY05nMUdKYXBIOVUx?=
 =?utf-8?B?ckRkUGsrdHNOVmxyRmh6cnBDZkg0WmNoUDJSRXlsemx4VVF0a0xGaFB2R1RF?=
 =?utf-8?B?Uys5cnZhejNpR2F5OEFDb2ExbExjWTlMSllnSFUyVG0rYmRCMTlLN25zQVhs?=
 =?utf-8?B?UWpBZnVacTVuaEw4Z1BJOVIwZWFDcFdoVW40cXNyR05oWm5UV1ZNeDVZQ2hT?=
 =?utf-8?B?WGZxZEs3OVVlUVlpWE1seW1CMXNsUHJxakxsRGU5Tm9tZS95bTBnaE1WOFR0?=
 =?utf-8?B?aTJWVlIraHduNzFXdG82ZlVZdjFqaUtlR2h3OWRnSUpKN3V4NHJuclRMTGxx?=
 =?utf-8?B?VnFnRFRBcmhpUVhaRXpndEF1Rk5MejBnbFpiWk55SkFWemJKZUdMMm5PcjJz?=
 =?utf-8?B?MGtUN2liSkJYTGRkWlBRcWZSek04TUhWMnV3VGw4amRzTVdsdnZ4SGt5bUIr?=
 =?utf-8?B?YW1Hc0FYWXR2eS9iK2JlN2cvQjZUL01aS1UwbGRML3RXQytOMHBHWENwNTE2?=
 =?utf-8?B?enhqQmRscEZHUXZZazJNU0FUWEVUYkJ0Uk0zRVQyTTJwZm9rWkN5cGhjK3ZB?=
 =?utf-8?B?VVU1SW42TVhrOTVZa3kyelk2N3ZadmkwTVRDWWQzZGpjcmJNUWVYYTNDZWtL?=
 =?utf-8?B?ZWZkUVhPQjd5bHNHMGlJTGF4RjdValY0MkNnS0FFc0tRcmJiT2EvMm15ZDIw?=
 =?utf-8?B?TWYxYVczcURpckptcGlpWWI0cGJHcEVhek1yNkdIN1dlL2NqNEE4a1BBQTJE?=
 =?utf-8?B?cUdIcnk4QzRyTnNtdWlON09TdHhTSlU3Szlabi84UlIrUGl2VzJGVndIWXRM?=
 =?utf-8?B?R2daZW1rOUlwUTNVb0JJMDA4VmZlVjUrbDJYdXBXS1crbE9pYWhIeFhRNEUx?=
 =?utf-8?B?N0VoVlZocHpJSm1mMW1ncG5xL1QxUnRoRGQvRjRWekJLZEtETElSK3FnQ3Rn?=
 =?utf-8?B?VXZwWDJBSzBTOW5jSlBsV0tCdHRrdTgvRE5FOFFXVGF3ZXZSeW9NU2JmZFlj?=
 =?utf-8?B?ZUk4czJndjNQTTNsS1JrbklGOHJ3N0MrSlNoVC9FSk1Nci9PdWtPWEFpUm1B?=
 =?utf-8?B?MTNNOG1saE4vU0JWYW1GdlBXUnBWQUlXSkhtc3Bhb3NjQ0VmcENCSWRIZGpS?=
 =?utf-8?B?R2VWRDlqZCtodU90L01jRno0QzNqeThObEh1WjA2aEo2RzdVdkN1Wi9CSS9Z?=
 =?utf-8?B?cDdyZk5WS2lkWHgzVHJMUDMrbVhXSjJoQyt5V09hV2drZ0dRejNDcGltbzJB?=
 =?utf-8?B?SWd5cVE4blRsdHFUVlI5WStyR2ZvQlMzSDVzdVYvWWhvNmxXMkErdkM1VTI2?=
 =?utf-8?B?Z3hEcGx6cnExWVhEdkFiWXFaUXU4MjdIVllGcFl2QUFHV2pEeFFJbkltQ1Y2?=
 =?utf-8?B?SXZWMTVzWkxVK0N4c3grYzM5WEgvMDdiMlIwQVFLWEIyOXp1ZGxIZlJmMThS?=
 =?utf-8?B?bGt6WXdJZFErM3d6dU9wYUJnNHVvd0JDbkN6emJqb3pBc3R3d1FmMEd2cVdt?=
 =?utf-8?B?eUZnTVZ4Tm9mS3Q0dFovSUx5K2ZoNElMUVpseHgySDU3dDFHMDFUOEJudXBB?=
 =?utf-8?B?Rzk3ejhPbjBHNWRVVFdXSk5OWTFZNzJ4ekh0WGdiWGJobXdJcWRGQ21sbDl2?=
 =?utf-8?B?SnRVNmh3b3A4aEpSS3p6UTBUNlc1ZUd3dXBmVzFlZEttd3FyZlpaQk1LUisx?=
 =?utf-8?B?eG9IVU5jNG9Ha01PM0tkTmpid0ZnM1R4UUVvTmQ1cDdZYWZnZ25mZFZVMnZE?=
 =?utf-8?B?dW1CYU5xaTZSOWprSmZkdjZyU1M3TjQxN2g3Yk1pcFVpOE00dnhPam9yMGJq?=
 =?utf-8?B?Q2UrVWFIRHZZSjFvclUwWXVUT1pjSDlEaWcxOTh5S3dZV3lTQTdkdnVUYWE1?=
 =?utf-8?B?dGo4NXovamV4VjdJZi93QkNvZlBESUtjcDhjRVN5UldRTUZsL21yazM1NUhs?=
 =?utf-8?B?b0RVR2xsOW5JSENXcGtic29oNFc3ZnRLaDI0ZElrOHh2WFlGWmhMOWZmakhx?=
 =?utf-8?B?R2RoODBBeEN0OGdpVExBV1F4YkkrM2o3TlMzM21Hd3g4MVFVZmp2bkRsVmNX?=
 =?utf-8?B?RkxYcnl0NFB3cHdjVm9HS3g0UTYwQUdXbGJjZXcva0hEUWhnNmVqbG05bWpy?=
 =?utf-8?B?emk1Z240YjJ4MnpKblRHcmx2VnJuaXVzM1puZldIU3kvNmZhSzcwSWpDcHlk?=
 =?utf-8?B?dWo1WUYxQ2M5dFBPeFJwYUtjL0VuNmd1QnUzOHBOdDRsSFVQVHVZRDlIdCtB?=
 =?utf-8?B?am1rcnpMdkozSk5sY1l2WjU3Q3A0V1R1QXk3RmttU3NUZEJLcFM1L2Y5NlZq?=
 =?utf-8?B?NTZOTkpiZzZMTXhHREdpTk5LWTZVK1BZbVhvajFzeGo1ZXluSVZTWllRTThq?=
 =?utf-8?Q?Zgl8g9I+66C5rNuo=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 35305934-8d57-4d55-ac5e-08de78eefb5b
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2026 06:34:54.3682
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Q3Ttx/Gz0RsCYvdnt/kSwOfvLALsTe797F74xnXagMtrXId4b0h26pMFOSjFM0U8lF5GcIr+wHxduRu1EOUzpzvUAofU5zG9NemVz7oma40=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB17219
X-Rspamd-Queue-Id: 692251E9AE7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-28682-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_CC(0.00)[kernel.org,google.com,gmail.com,bp.renesas.com,vger.kernel.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	NEURAL_HAM(-0.00)[-0.999];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[TY6PR01MB17377.jpnprd01.prod.outlook.com:mid,bp.renesas.com:dkim,tuxon.dev:email,glider.be:email,renesas.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

SGkgQ2xhdWRpdSwNCg0KVGhhbmtzIGZvciB0aGUgcmV2aWV3Lg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IENsYXVkaXUgQmV6bmVhIDxjbGF1ZGl1LmJlem5lYUB0dXhv
bi5kZXY+DQo+IFNlbnQ6IE1vbmRheSwgTWFyY2ggMiwgMjAyNiA1OjI4IFBNDQo+IFRvOiBKb2hu
IE1hZGlldSA8am9obi5tYWRpZXUueGFAYnAucmVuZXNhcy5jb20+OyBDbGF1ZGl1IEJlem5lYQ0K
PiA8Y2xhdWRpdS5iZXpuZWEudWpAYnAucmVuZXNhcy5jb20+OyBscGllcmFsaXNpQGtlcm5lbC5v
cmc7DQo+IGt3aWxjenluc2tpQGtlcm5lbC5vcmc7IG1hbmlAa2VybmVsLm9yZzsgZ2VlcnQrcmVu
ZXNhc0BnbGlkZXIuYmU7DQo+IGtyemsrZHRAa2VybmVsLm9yZw0KPiBTdWJqZWN0OiBSZTogW1BB
VENIIHY3IDA5LzE1XSBQQ0k6IHJ6ZzNzLWhvc3Q6IEFkZCBTb0Mtc3BlY2lmaWMNCj4gY29uZmln
dXJhdGlvbiBhbmQgaW5pdGlhbGl6YXRpb24gY2FsbGJhY2tzDQo+IA0KPiANCj4gDQo+IE9uIDIv
MjcvMjYgMTc6MzIsIEpvaG4gTWFkaWV1IHdyb3RlOg0KPiA+IEFkZCBvcHRpb25hbCBjZmdfcHJl
X2luaXQsIGNmZ19wb3N0X2luaXQsIGFuZCBjZmdfZGVpbml0IGNhbGxiYWNrcyB0bw0KPiA+IGhh
bmRsZSBTb0Mtc3BlY2lmaWMgY29uZmlndXJhdGlvbiBtZXRob2RzLiBXaGlsZSBSWi9HM1MgdXNl
cyB0aGUgTGludXgNCj4gPiByZXNldCBmcmFtZXdvcmsgd2l0aCBkZWRpY2F0ZWQgcmVzZXQgbGlu
ZXMsIG90aGVyIFNvQyB2YXJpYW50cyBsaWtlDQo+ID4gUlovRzNFIGNvbnRyb2wgY29uZmlndXJh
dGlvbiByZXNldHMgdGhyb3VnaCBQQ0llIEFYSSByZWdpc3RlcnMuDQo+ID4NCj4gPiBBcyBMaW51
eCByZXNldCBidWxrIEFQSSBncmFjZWZ1bGx5IGhhbmRsZXMgb3B0aW9uYWwgTlVMTCByZXNldCBs
aW5lcw0KPiA+IChudW1fY2ZnX3Jlc2V0cyA9IDAgZm9yIFJaL0czRSksIHRoZSBkcml2ZXIgY29u
dGludWVzIHRvIHVzZSB0aGUNCj4gPiBzdGFuZGFyZCByZXNldCBmcmFtZXdvcmsgd2hlbiByZXNl
dCBsaW5lcyBhcmUgYXZhaWxhYmxlLCB3aGlsZSBjdXN0b20NCj4gPiBjYWxsYmFja3MgYXJlIG9u
bHkgaW52b2tlZCB3aGVuIHByb3ZpZGVkLg0KPiA+DQo+ID4gVGhpcyBwcm92aWRlcyBhIGJhbGFu
Y2VkIHBhdHRlcm4gd2hlcmU6DQo+ID4gLSBSWi9HM1M6IFVzZXMgY2FsbGJhY2tzIHRoYXQgZmFs
bCBiYWNrIHRvIHRoZQ0KPiA+ICAgIHJlc2V0IGZyYW1ld29yaw0KPiANCj4gTml0OiBUaGlzIGZp
dHMgb24gdGhlIHByZXZpb3VzIGxpbmUuDQpXaWxsIHVwZGF0ZSB0aGlzIGZvciB2OC4NCg0KUmVn
YXJkcywNCkpvaG4NCj4gDQo+ID4gLSBSWi9HM0U6IFNldHMgbnVtX2NmZ19yZXNldHM9MCwgcHJv
dmlkZXMNCj4gPiAgICBjZmdfcHJlX2luaXQvY2ZnX3Bvc3RfaW5pdC9jZmdfZGVpbml0DQo+ID4N
Cj4gPiBBZGQgY2ZnX3ByZV9pbml0LCBjZmdfcG9zdF9pbml0LCBhbmQgY2ZnX2RlaW5pdCBjYWxs
YmFja3MgdG8gc3VwcG9ydA0KPiA+IGN1c3RvbSBjb25maWd1cmF0aW9uIG1lY2hhbmlzbSBpbiBw
cmVwYXJhdGlvbiB0byBSWi9HM0UgUENJZSBzdXBwb3J0Lg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1i
eTogSm9obiBNYWRpZXU8am9obi5tYWRpZXUueGFAYnAucmVuZXNhcy5jb20+DQo+IA0KPiBSZXZp
ZXdlZC1ieTogQ2xhdWRpdSBCZXpuZWEgPGNsYXVkaXUuYmV6bmVhLnVqQGJwLnJlbmVzYXMuY29t
Pg0K

