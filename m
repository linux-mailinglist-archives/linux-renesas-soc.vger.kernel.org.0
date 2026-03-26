Return-Path: <linux-renesas-soc+bounces-30323-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MP0sJnsCxWl55gQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30323-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 10:55:07 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C74C332B97
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 10:55:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 70AA7301877C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 09:46:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9A05382F19;
	Thu, 26 Mar 2026 09:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="DrwY36sw"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010044.outbound.protection.outlook.com [52.101.228.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 345A8377561;
	Thu, 26 Mar 2026 09:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774518375; cv=fail; b=JVJzWcqN66CzMiVIsi0CuhGb9dLtde8gXvhXkPTCzu9abuoTOB5EU7+UDz4PBLqPUHm1UPYc5YVaPNtv2f6Jg0XMvGj5N3LHgFHipgz0r5Uv+yo+iTAUKnAefeP1iedJ6H/LHNNYAIUZQgL070SY2Rf9SWTY60x2eGeUL9L0Gws=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774518375; c=relaxed/simple;
	bh=h1lqqR1mOwOC02D4cWV0bo9UEKaMg9dwZILtiEm7+vo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=UVTC0GH/UddabIlIj0cuEYQ+3Wd8kLpWwiEaDvJTSLcwXn1qjt+fqleJVJAHGh7k5QxAmtirZncTePjQrrnksaewbP22koc7T5mbqPI0m9JCM9IidtDgRlxT8QUEWgKLonXh7jgwqInF2C24RVXTkJKjVCIkaYe4vsRBbhWUE/Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=DrwY36sw; arc=fail smtp.client-ip=52.101.228.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BL3v8gAYx7gleXkRHrWxXFT9wvkCq+4TAgXWtHCWZv4REAJNnZM1kdQGmjgM1b4tX1zs3pLJtCNDWy2E17JIqK4GmSJxk6dsoUnytOiPn5SQkT9hjuJfg4rWREeA4qP1Fwn7nuFwHBoRim3kSEb1tXJKUXSy22uwkhYqDnefhq5pDCNg/ArY6QBvokU+HMhogl3lGE+NzjWazqbAxIieL0Rf8pmLFn7HcJgjzEV2f8ybA64YNdRBIX9N7C53cnk+MG6QXklsGuTPVb/IDrin3GWg4QMBs8ngtxrg14ZJpiQEJFiP3EnUbBwksWL0IpClJxfJeGWtwzTo08NFzzfIhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h1lqqR1mOwOC02D4cWV0bo9UEKaMg9dwZILtiEm7+vo=;
 b=EL6xoHLN0tlZTEz0bG5lLa6F75fc/BMKlGQudqMvVHCp3LeNnLNGDr2y0t2Ug8p+j2lQAEIxoOly7XOFQ7VuBr15O1clL5Lals73iWbXWQGp3RMjwMX7GUjr/NPX0E082HjfYRsG6Y8PVFYSer3PUN5O8ObJpD/37ULX0zWfWng+pABBc0mG/RZr/6Jp30m9xHnycLTMmV64/nWKT+m0BgLxCo4p2HvFB6XVcSbCXDHs0HDDAB5zSxKWCtEASc0QBzLBzjXbEocUaq5VBJ4upHpyabgARaBR9hb3JZRXThTbMYiJNqgvZb2OhHWURtYc9KV2kP15DSoxVIJna2ZYIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h1lqqR1mOwOC02D4cWV0bo9UEKaMg9dwZILtiEm7+vo=;
 b=DrwY36swWavjP1NJnrwospuV7KS8RE8xIG0vUEtloZztT/B95ii1j1C9Vn5Kq9mDAbvwkjD/X8o9dI3zJGdCAf9YJb9nr+bATYLZ1HKgWxjPWkJ7FqsdKrnbPpoR8Aq0IAwpQs8qKmirQJdbCkzAc6++AwUplQcHWQM2fSjlA+c=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYRPR01MB16438.jpnprd01.prod.outlook.com (2603:1096:405:142::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Thu, 26 Mar
 2026 09:46:08 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9745.022; Thu, 26 Mar 2026
 09:46:08 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: geert <geert@linux-m68k.org>, biju.das.au <biju.das.au@gmail.com>
CC: magnus.damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Prabhakar
 Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v2 10/10] arm64: dts: renesas: rzg3l-smarc-som: Enable
 eth1 (GBETH1) interface
Thread-Topic: [PATCH v2 10/10] arm64: dts: renesas: rzg3l-smarc-som: Enable
 eth1 (GBETH1) interface
Thread-Index: AQHclQ6MAEX5Jdu5TUOPhywGfXmLOrXA3s8AgAABZ4A=
Date: Thu, 26 Mar 2026 09:46:08 +0000
Message-ID:
 <TY3PR01MB113463BF3EDCB500F0FDFC2528656A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260203131048.421708-1-biju.das.jz@bp.renesas.com>
 <20260203131048.421708-11-biju.das.jz@bp.renesas.com>
 <CAMuHMdUEW0+qFTG_VikJ3YnA13+ki5uzA0w4HC=13DOwKEJgDQ@mail.gmail.com>
In-Reply-To:
 <CAMuHMdUEW0+qFTG_VikJ3YnA13+ki5uzA0w4HC=13DOwKEJgDQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYRPR01MB16438:EE_
x-ms-office365-filtering-correlation-id: 03160ce3-3b7b-4af6-44ce-08de8b1c8182
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700021|22082099003|18002099003|56012099003;
x-microsoft-antispam-message-info:
 36iF0l0eYGA4aS5vaxR08aqrsGlujWNKZk016niHP2Jw38fNaPZJBM3ZN2911mXONvzAippPsRExUIZuJnIR8iXTKSxIexXMQ+ctDGbVooZJfEuZPViq8k89m02y4EINXUOgc0Qwwqrm1RxNLnhFSAkX1zb6nmQRWPRvUCsfzZ+J+DX2Ak+wCD0GdiXWwkMJszoWe1frOE4Un4eJcNUu33p7LxNwC2SnSxWeegy7pAILIbV46eVKkizlUp4P1W8U5D0qIhe2DwgUqDoDOFD4JZSTC89A/BvMqUG86zadojdBXjocHIjyfVFJN98vMr5qkpLLAqukmSIJ9e38qZvBGnew58OLiYdHnCQ8yrt0VqLV5m5KbMRFME8PXy6q5vtdatfn7BKoLGG1QWl8zWby/gRS/0YCMvCVbAR/jkT8mtSS6HqeYdauwBc8O24Hh80gbKm/q1sh3x2QrrP6/RNu8p0Q6RENz4Tj6TTmdyTq/onZVTLF1rYLMd3aSgqiWAYtsoBcKHZeI2hQGbNXuC7t4vlgu1yoHVjoBiWVGqrmUYHYGEchLRTNylsIQgyA48lc0tPED+NN5xK5QMAzH+LXaM+DWUX+9zoUdqnpUVEslHBp8AOGEufjygAmVd7hJ+YlbDCa+R65t14pjiZOQ24ddBRb3PM0PhxWwHITiLq05zlBfElWkG7SeEd4Jx0hNATiHX+DO/GBRy6etSfoYoYL3bVqa9KUTmdE/h60zejHnZHl7NaNhI0VBU4whzM1dvZ24s/NjluoEhGyJoRLCUMjE/eIKAWPXHaddXY8f69dJMk=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?V0tKb0JGbGNaWmNLZVhSMTEzLzUrczJBQS9IR2xDVURvZTloeGFLUk4xZTll?=
 =?utf-8?B?L2lxUTM3QTVUeTc3NHVpNFl1TFVrT1l6UnAxS2djQWthTEdwS04xUWdJcUJr?=
 =?utf-8?B?ZFVFdmVmNUZhZkJoTjRpZjJMQWFMbmNxUUVnN1lVeHd3ZTJGL1BsYkRzUDdk?=
 =?utf-8?B?NVRkRTRuSlRvUmx3WUdqTW5UM0dWOTV3Q1FmTkg2QnNzc1N0LzVoQ3VjTVpO?=
 =?utf-8?B?YU9KMjdBY2QwMG1zOW1DM05KbkI0RzJGRXQvMnRvL1R0M1BxVWFJRFluSzVZ?=
 =?utf-8?B?cUhKMkp1TWFjMWsxS0hvc1FDT25MRXJNdmdzUGx1SHJDaGVXZlNQcWI0cjd2?=
 =?utf-8?B?eXdoUXB0ZXIwRDJLSXBneDRab2NmRDRuREYyRmh1SU1QQVpYN1EyUzFwL21a?=
 =?utf-8?B?aENlaXd4VHd5ZWZGa3dEWHEyb3VLWHpQMW1aeE1TOHEraTJKQ0NrY3ZIRXN3?=
 =?utf-8?B?cFhVa1BLcmI3NmR3VWFCTW1KNENQTklKM2lnQXM3dzV4TEN1MEZaeXdWTkUy?=
 =?utf-8?B?YnR4WTlpRHpxNlZ0c1ZSMzZwT0pDSEUzNUt0dkpTOGxDQWlKK3VJOXI2bWtO?=
 =?utf-8?B?M2tIMFlzWE8xY0phQ2tLM3dhRGtQa1BQN0g3YUJxcW9jSXpEVjZiNjUzRnNq?=
 =?utf-8?B?MUpCS1lXTTZJcXBnVlBPSTNaZzNUNzY4MmpUSDJ0MW9uVDBOVE8wd1NFdERD?=
 =?utf-8?B?VXBRQnNIYnoxbHU3QmgwcU84a0htUjRnUkJhWmtobVdZMnkzZUI3MkdLeG9F?=
 =?utf-8?B?L1AvYnJ5d2lEUTRLZ3J3VUJFRlpsaEloYXdSTkgxa08vTXNldFh2YUVXM05p?=
 =?utf-8?B?c0huSTNpdnhhcWtFRU9INGd5eUQxQTZBTnZneFZGRE00eUlodDV1djNERUlm?=
 =?utf-8?B?cE1IcjU3cTB6YjRYNys1V0hzU3pUZjVOblRXd1Z0LzZaOHkvYnBIa3JaNlRV?=
 =?utf-8?B?MWgycFJnS0QzZklXbTRlVkorcmh5anhtSmpadS9QdE1CSzdBam8rblBxdkg4?=
 =?utf-8?B?UUNpN1ZHbkpTNVpDcFF3bUk3Y20rcDIyTjNSSFIrY0dSbUxNbjZYcnlZeHRI?=
 =?utf-8?B?NEZnekRGa1R5TWg1aVl5WS9UVHg2UWRoRlV4anVMcisycTE2cmVQbnNpRlFU?=
 =?utf-8?B?eUVJV1MwNEx5a0NvQlZtS240dUFuT2tIajhzdlViSWw1Y3dmS1BHUVVheloz?=
 =?utf-8?B?ZHJxRXl5MlZWNWNEYkxaTWFDRlpwYVFnMy9RSEt3VDErbi9pVmNBSTBjN3hT?=
 =?utf-8?B?RHdMUC9iNkg1L0p1TXhOaFBGUjhyN1FWZmtNWnBuSVVxVmtUNiszeTlVYjl6?=
 =?utf-8?B?RHdOMSt2Q255dDlhcG5qWGJnVEt4bUtIOWxnb2tPRE5Jc2FYNENXVGxQNHA3?=
 =?utf-8?B?ZXgza0luYS9UWjYvZVhBQS9SYzV4Zm5CZ0RMVDBJSXdEZTV0emJadDA1RGZw?=
 =?utf-8?B?WWUwd25reXpVMlJpWGVqWVJHOGZDdU9qcFA4anFLdkhvczVURjRRL0svQ3Rv?=
 =?utf-8?B?ZUQrRlNiTFY4V1BUZkRHMDBKWFlsMTFselZFV1dVakY2UnFNaS83WXYxMmQz?=
 =?utf-8?B?dG9Sd0h6UUMweU9HVVZIaUprQmFtYWdPN0NiTTMvaHFCRVRJM29aa0RnT21Y?=
 =?utf-8?B?TTQ4MDhwMTV2a0E3bDFPcEhHNS96VWJXVGV4T3dFc0lwZ0pxYmU3UDdNSEoz?=
 =?utf-8?B?UmRvS052VHFLWnl1Zk02M1BjS2p2QUsvRk42eUp1d2VaVFR0cU1YS3E1YnFt?=
 =?utf-8?B?MjZpNlJBUWtGaUxtUUNIMXgvR3N6UE1NNUJkYzdXeEVndWVTMGN5bGRSaDlB?=
 =?utf-8?B?aWF4aTlKbkthdnBlMFl0U3JlZXpFYmVtZVYwYTloOStSdUZBMTZORm8zRGpR?=
 =?utf-8?B?eWhTbDVtUGNmcml2elJrQk9SR3U3am04Qk1oVk5semNZNVlqZjN6TXI1V05n?=
 =?utf-8?B?M25VTitzbGlINkZCb1hsR2JjTFdmZk5HL0lhM1lEWVFrTGxzR1M1VVNWVlhD?=
 =?utf-8?B?NjV6YzBRbXZHcUdzbk5JZ2hTSy9VbGRENlpBUk9GcmRIUHgzY21TWHZhUXBQ?=
 =?utf-8?B?VVF0ZGJNNW0rL09GSTZIOTZRaDdqZkg5QUt0ay9Od0JaUUZWTXhQUW1kbWJh?=
 =?utf-8?B?Vmw0UDZyUUN0SWJNL2NQekQ1clUxanRwMlcwUDdWaDA5TEVMOXFxalAyUEFT?=
 =?utf-8?B?TWVNL0drZkR6Q0RvOW4xZE1PbkxKdm8wZVdlSTlYREJMUEYrQWxCTGI0WEdS?=
 =?utf-8?B?alVKZXM4VU4xUTU0UEM4dEd2YUFEc2FhWmdjU2JTanZPL2xYbDl5aHhsaGlW?=
 =?utf-8?B?TjNDbUhlekkxMk9LQ2Z2Rm9qOW5BczZqL1ovWnpMWjRFcUdSTFRrZz09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 03160ce3-3b7b-4af6-44ce-08de8b1c8182
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Mar 2026 09:46:08.1134
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2UpfoC/IGStgnK2wPIRz62fFQm1xGDyJbVaMUR5bh+Rh8L+EEI65RWF/jIadjizYvH3wPpdg+4PxEcEqh3mZs10NnxU6NtJiJfpDvPasTCQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB16438
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-30323-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_TO(0.00)[linux-m68k.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org,bp.renesas.com];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.7:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,bp.renesas.com:dkim,linux-m68k.org:email,renesas.com:email]
X-Rspamd-Queue-Id: 1C74C332B97
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IDI2IE1hcmNoIDIwMjYgMDk6NDANCj4gU3ViamVjdDogUmU6IFtQQVRD
SCB2MiAxMC8xMF0gYXJtNjQ6IGR0czogcmVuZXNhczogcnpnM2wtc21hcmMtc29tOiBFbmFibGUg
ZXRoMSAoR0JFVEgxKSBpbnRlcmZhY2UNCj4gDQo+IEhpIEJpanUsDQo+IA0KPiBPbiBUdWUsIDMg
RmViIDIwMjYgYXQgMTQ6MTAsIEJpanUgPGJpanUuZGFzLmF1QGdtYWlsLmNvbT4gd3JvdGU6DQo+
ID4gRnJvbTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+DQo+ID4g
RW5hYmxlIHRoZSBHaWdhYml0IEV0aGVybmV0IEludGVyZmFjZSAoR0JFVEgxKSBwb3B1bGF0ZWQg
b24gdGhlIFJaL0czTA0KPiA+IFNNQVJDIEVWSy4gQWxzbyBhZGQgcGluY29udHJvbCBkZWZpbml0
aW9ucyBmb3IgR0JFVEh7MCwxfS4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFzIDxi
aWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gDQo+IFRoYW5rcyBmb3IgeW91ciBwYXRjaCEN
Cj4gDQo+ID4gLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3J6ZzNsLXNtYXJjLXNv
bS5kdHNpDQo+ID4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3J6ZzNsLXNtYXJj
LXNvbS5kdHNpDQo+IA0KPiA+IEBAIC01MywzICs2OSw3OSBAQCBwaHkwOiBldGhlcm5ldC1waHlA
NyB7DQo+ID4gICAgICAgICAgICAgICAgIHR4ZDMtc2tldy1wc2VjID0gPDA+Ow0KPiA+ICAgICAg
ICAgfTsNCj4gPiAgfTsNCj4gPiArDQo+ID4gKyZtZGlvMSB7DQo+ID4gKyAgICAgICBwaHkxOiBl
dGhlcm5ldC1waHlANyB7DQo+ID4gKyAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAiZXRoZXJu
ZXQtcGh5LWlkMDAyMi4xNjQwIiwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICJl
dGhlcm5ldC1waHktaWVlZTgwMi4zLWMyMiI7DQo+IA0KPiBEcm9wIHRoZSBsYXR0ZXI/DQoNCk9L
Lg0KDQo+IA0KPiA+ICsgICAgICAgICAgICAgICByZWcgPSA8Nz47DQo+ID4gKyAgICAgICAgICAg
ICAgIHJ4Yy1za2V3LXBzZWMgPSA8MTQwMD47DQo+ID4gKyAgICAgICAgICAgICAgIHR4Yy1za2V3
LXBzZWMgPSA8MTQwMD47DQo+ID4gKyAgICAgICAgICAgICAgIHJ4ZHYtc2tldy1wc2VjID0gPDA+
Ow0KPiA+ICsgICAgICAgICAgICAgICB0eGR2LXNrZXctcHNlYyA9IDwwPjsNCj4gDQo+IHR4ZW4t
c2tldy1wc2VjPw0KDQpPSy4NCg0KPiANCj4gPiArICAgICAgICAgICAgICAgcnhkMC1za2V3LXBz
ZWMgPSA8MD47DQo+ID4gKyAgICAgICAgICAgICAgIHJ4ZDEtc2tldy1wc2VjID0gPDA+Ow0KPiA+
ICsgICAgICAgICAgICAgICByeGQyLXNrZXctcHNlYyA9IDwwPjsNCj4gPiArICAgICAgICAgICAg
ICAgcnhkMy1za2V3LXBzZWMgPSA8MD47DQo+ID4gKyAgICAgICAgICAgICAgIHR4ZDAtc2tldy1w
c2VjID0gPDA+Ow0KPiA+ICsgICAgICAgICAgICAgICB0eGQxLXNrZXctcHNlYyA9IDwwPjsNCj4g
PiArICAgICAgICAgICAgICAgdHhkMi1za2V3LXBzZWMgPSA8MD47DQo+ID4gKyAgICAgICAgICAg
ICAgIHR4ZDMtc2tldy1wc2VjID0gPDA+Ow0KPiA+ICsgICAgICAgfTsNCj4gPiArfTsNCj4gPiAr
DQo+ID4gKyZwaW5jdHJsIHsNCj4gPiArICAgICAgIGV0aDBfcGluczogZXRoMCB7DQo+ID4gKyAg
ICAgICAgICAgICAgIHR4YyB7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgcGlubXV4ID0g
PFJaRzNMX1BPUlRfUElOTVVYKEIsIDEsIDEpPjsgIC8qIEVUSDBfVFhDX1JFRl9DTEsgKi8NCj4g
PiArICAgICAgICAgICAgICAgICAgICAgICBwb3dlci1zb3VyY2UgPSA8MTgwMD47DQo+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICAgb3V0cHV0LWVuYWJsZTsNCj4gPiArICAgICAgICAgICAgICAg
ICAgICAgICBkcml2ZS1zdHJlbmd0aC1taWNyb2FtcCA9IDw1MjAwPjsNCj4gPiArICAgICAgICAg
ICAgICAgfTsNCj4gPiArDQo+ID4gKyAgICAgICAgICAgICAgIGN0cmwgew0KPiA+ICsgICAgICAg
ICAgICAgICAgICAgICAgIHBpbm11eCA9IDxSWkczTF9QT1JUX1BJTk1VWChBLCAxLCAxKT4sIC8q
IE1EQyAqLw0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxSWkczTF9QT1JU
X1BJTk1VWChBLCAwLCAxKT4sIC8qIE1ESU8gKi8NCj4gPiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICA8UlpHM0xfUE9SVF9QSU5NVVgoQywgMiwgMSk+LCAvKiBQSFlfSU5UUiAqLw0K
PiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxSWkczTF9QT1JUX1BJTk1VWChD
LCAxLCAxKT4sIC8qIFJYRDMgKi8NCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICA8UlpHM0xfUE9SVF9QSU5NVVgoQywgMCwgMSk+LCAvKiBSWEQyICovDQo+ID4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgPFJaRzNMX1BPUlRfUElOTVVYKEIsIDcsIDEpPiwgLyog
UlhEMSAqLw0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxSWkczTF9QT1JU
X1BJTk1VWChCLCA2LCAxKT4sIC8qIFJYRDAgKi8NCj4gPiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICA8UlpHM0xfUE9SVF9QSU5NVVgoQiwgMCwgMSk+LCAvKiBSWEMgKi8NCj4gPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8UlpHM0xfUE9SVF9QSU5NVVgoQSwgMiwg
MSk+LCAvKiBSWF9DVEwgKi8NCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8
UlpHM0xfUE9SVF9QSU5NVVgoQiwgNSwgMSk+LCAvKiBUWEQzICovDQo+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgPFJaRzNMX1BPUlRfUElOTVVYKEIsIDQsIDEpPiwgLyogVFhE
MiAqLw0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxSWkczTF9QT1JUX1BJ
Tk1VWChCLCAzLCAxKT4sIC8qIFRYRDEgKi8NCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICA8UlpHM0xfUE9SVF9QSU5NVVgoQiwgMiwgMSk+LCAvKiBUWEQwICovDQo+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPFJaRzNMX1BPUlRfUElOTVVYKEEsIDMsIDEp
PjsgLyogVFhfQ1RMICovDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcG93
ZXItc291cmNlID0gPDE4MDA+Ow0KPiA+ICsgICAgICAgICAgICAgICB9Ow0KPiA+ICsgICAgICAg
fTsNCj4gDQo+IFBsZWFzZSBzcGluIGFkZGluZyBFSFQwIHBpbiBjb250cm9sIG9mZiBpbnRvIGEg
c2VwYXJhdGUgcGF0Y2guDQoNCk9LLCB3aWxsIG1vdmUgRVRIMCBwaW4gY29udHJvbCBpbnRvIHNl
cGFyYXRlIHBhdGNoLg0KDQoNCkNoZWVycywNCkJpanUNCg==

