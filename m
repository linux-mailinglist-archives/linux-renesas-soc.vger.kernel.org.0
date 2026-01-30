Return-Path: <linux-renesas-soc+bounces-27678-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AOLlGX61fGm7OQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27678-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Jan 2026 14:43:26 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9329DBB468
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Jan 2026 14:43:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 47D82300D150
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Jan 2026 13:43:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9AA73093CF;
	Fri, 30 Jan 2026 13:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="XgEQxOp6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010006.outbound.protection.outlook.com [52.101.228.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5772F72618;
	Fri, 30 Jan 2026 13:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769780597; cv=fail; b=nxIhcaTeoMDh2PF4sZIJ9o0mGdwlg69xqC6gwRFahMo5TI3G+27ATTfTf+WkFrvwbCvUJ/CJroLRY27HvzDg2nrBdKJGYjzNOP4ruVGDu4J6a2H+tksAgiQNccqr0CD70M/VoaJKa/0RGSzNp/Q6i4x5Z1K5bfVUQECcxN8BiGc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769780597; c=relaxed/simple;
	bh=UrW8LrKxLYp97cHWLM268yKGYz8zgYCli4IGuwOtZdQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=nb/gPPss6tiy2+N7T+EXOHcQmvLGfiJayCC/wrlMGGMhIkxvxcqyODFgo0jnCOulyFiveTg2t4+e3yPZpQJO0Z6CmBcGBhjuA5wSRPuU29CVjWFl/BWVnnotAgG2flszrKD5Eo3tKncPVe94gNLm+1DgPjUsFRNk8h2KY0Q7/rc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=XgEQxOp6; arc=fail smtp.client-ip=52.101.228.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KjXtPGMSQyIHCl72n4dAQPNpmR2+9KG/cMKGbez3dK5M/DoxEoP4oZVXFNqj4lRhdVXtearJ8TtLPgbZcloxnSZ8Mh6tQg0qlZnA5GlrmpUtRJ1yWsyasYZek6wWbGbGy1V6ztnZcltLwJxZBdBOT6nu2kZ6+GUMT0/rFfMd1uqqcrGNT1zpKzfnUX78SlSnfmRoser0t/mF4pJxB0SgQlZsFLEEZrtL0xxU5+lT3bOaYLHcBjwZBKci6/BoW1BQ9maZir3UtTXdIlVKtypzxpltfq0o9+81YxIHwiBJWG+iYe7X9jmcBeKasZzd/yILHS34MCQfxJizNFTAndjPyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UrW8LrKxLYp97cHWLM268yKGYz8zgYCli4IGuwOtZdQ=;
 b=qpOCi3QL1gyOod6vixn70VUhAl88xCUWBjiZbRmRdlVdt7FkKCl1cgXvCbxnUTQ7FeA5CGqwZK2gsq6oYkVUeySp1dJm3G0+t8AblY1OfPm0wKmbKQ+ZTXtWchdeEx3joY33xGERvfAFekVg6RLJuMzn/M+Egw+TUxW9DKkWY7kwgf5rlY4z14ld4T4ueDT+YJoEPLr/2znAvjVgvsycolegYhsZuqryu7Bq7u9He1wIa5lM4pI0uPEZfspY7gYYT2enIIr2WPTdAl9w7ip5CEVfbg6RkcbV0gyKJa/l8Kb7DR4jPjS06VojNDzZVGOlHRhu5AX9hSb4mZjYylw8JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UrW8LrKxLYp97cHWLM268yKGYz8zgYCli4IGuwOtZdQ=;
 b=XgEQxOp69XT65HteK+5x5E/+k09vSZuTDx6OG4057pf6HDOnCAkWCSqVsUCM9uZ2UIg6q4VyGi8dtzqk685ev7Ihpn1ZJNMok1W85qtIDmdyony7/30hWe4BYNehfU30r/155Vv5/43CMKwWJGgTyno6QZSZGwaDJ1SpLgMGrHw=
Received: from TY7P301MB1984.JPNP301.PROD.OUTLOOK.COM (2603:1096:405:38d::6)
 by TY1P301MB0234.JPNP301.PROD.OUTLOOK.COM (2603:1096:400:2ed::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.6; Fri, 30 Jan
 2026 13:43:07 +0000
Received: from TY7P301MB1984.JPNP301.PROD.OUTLOOK.COM
 ([fe80::961:aeb3:eb77:bd7d]) by TY7P301MB1984.JPNP301.PROD.OUTLOOK.COM
 ([fe80::961:aeb3:eb77:bd7d%4]) with mapi id 15.20.9564.001; Fri, 30 Jan 2026
 13:43:07 +0000
From: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
To: geert <geert@linux-m68k.org>
CC: magnus.damm <magnus.damm@gmail.com>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "mturquette@baylibre.com" <mturquette@baylibre.com>,
	"sboyd@kernel.org" <sboyd@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: RE: [PATCH v2 4/5] arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Add
 versa3 clock generator node
Thread-Topic: [PATCH v2 4/5] arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Add
 versa3 clock generator node
Thread-Index: AQHcjuBr2aBtSpVCZ0CNQ/H/tjeqdrVqvfTw
Date: Fri, 30 Jan 2026 13:43:07 +0000
Message-ID:
 <TY7P301MB1984CB3A92C79442592B045DD39FA@TY7P301MB1984.JPNP301.PROD.OUTLOOK.COM>
References: <20260120150606.7356-1-ovidiu.panait.rb@renesas.com>
 <20260120150606.7356-5-ovidiu.panait.rb@renesas.com>
 <CAMuHMdVOCFS-31HA2Uxiu7CSmiOf_XwPk1kijYf_WkD0aJJJMw@mail.gmail.com>
In-Reply-To:
 <CAMuHMdVOCFS-31HA2Uxiu7CSmiOf_XwPk1kijYf_WkD0aJJJMw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY7P301MB1984:EE_|TY1P301MB0234:EE_
x-ms-office365-filtering-correlation-id: d715f300-6f9c-41c5-367a-08de60058071
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?d3VCU21oOTlmWGdWK01WdEhXWVNnMFdpUXlqVmxuOGZTa3lGd3NIZHF2a0lP?=
 =?utf-8?B?YTRBVUtkSVl1cHlyTE9ySnVVTW8reWt4RXJzU3JnVk01WTNCNmJYalNUTUpY?=
 =?utf-8?B?RVJEdEJ6NlhGUjREcHloQjV2cVlrb0VobmJhTTJaWnNCd0ZsbGRIaVhLWHEx?=
 =?utf-8?B?REljaTdzaG5ZUU8zZDgzMFN2aWt4T2JvbnVuSVl1cThvcXFpbDB5dXgwaEdE?=
 =?utf-8?B?N3hZb2pkMjVBQ0pzQzJxZS9yQitFYS9TUGovWEF2SGhqaFlKUDdsZlJiamJV?=
 =?utf-8?B?WkQyUHExN0Z4S0Nabk1JdCtqQjUzVHZwYm4vdkZOTkRLR1phUkZMWTRKQ3pn?=
 =?utf-8?B?TGQyWHVYYUJjK0lINWdPR2pmMG5vb1dvZ3llcTRlRHhLa0l6ZHNqTUhBWGJW?=
 =?utf-8?B?MDZHdnF2Qkl3RGVaMUVYclA2NlZQekt0dlJCTzF6aU4xak5GNGh6bm9yUHFh?=
 =?utf-8?B?VXVuZ2NGVDErK0N1c3J2T0J2MVFld3F5eFFYenR3RE44em12ay9qS0QrcmJM?=
 =?utf-8?B?NjY3NlZKVTZVbnc0WlZIaTBNVDc3NUpib2xUTlcyZkRKY3VKVDFBa1RZa01R?=
 =?utf-8?B?U0Jsd0loaEFXbmhrNlRYQXI1UFJzNmhoUXYwN091dVFYQ05jS0FjREtUcFl3?=
 =?utf-8?B?aTM2Vk9NdENYcjBKQzVuQTQzamlrRHRZbFFaMmNqMWF0cGZTMjlDMXovY2Fu?=
 =?utf-8?B?d0xtM0E4aTRkM2tHTlBaSGFsQlVwVUcrNSsrdURiV0Q2czB0NTZ3TnF5bHdR?=
 =?utf-8?B?N29yaWxNdXlxVlZsVnBnU0JHb0wxa29ReDh6YWxlTUpvRWc2L2Zabk1seVp0?=
 =?utf-8?B?MW05WlVzQnJSWlBwcjFVc0pQNUgxVzVQaGJ5RGRQQ2xLUTBLMjExRmJyOW9h?=
 =?utf-8?B?dFZUcUdCREtsbnF0K0dabHBoa0xkcUY4QmdZQnM5U2JkSFFiRjhyUzM5ckVy?=
 =?utf-8?B?QkRscXVZeVp0czVCbVFWdDY0R1RmUjhKZ0VrWGNXSTFMclJ0R2RyaGFVaVRO?=
 =?utf-8?B?cGVyTDVMMzI4THgwSDJRQVRWbThOUnlSOGtmNHVscmNINjlGYklhUTd1V3hz?=
 =?utf-8?B?Y2x1MjVPMVFWemloMXFxZ0NYelA4QitCYWhvTzhoTzdleU9jQTNrQnR0dE1R?=
 =?utf-8?B?dVFFR2dsUTIxWUg2Ni9ncEVFMkVtNlFDYnRMUlV1Z2cyNmV2ZnMvZlp0cThS?=
 =?utf-8?B?aVRVRnlSdHpjLzJ2TU1XZitndFg3ZnVueGZTcjZRdnl2b0NabkQzOVZwcWlG?=
 =?utf-8?B?QkMzNHlpa05hTFlQRFVMOE9YY0ZGaXhkdVlLWTAwTWxuWHk2am5iTkh2MmdG?=
 =?utf-8?B?NVgzQ3NoQ2ZLSTlCZkkxQ1pqRjVETzJwOFlJaU93NHBCbDZiT0QwNUhQUnR3?=
 =?utf-8?B?NzVpeDBuKzRwM2VXeTM1TUJ0SVpuNUxCZ0lyNVVOalIzVGNkT3ZNS0w5KzdZ?=
 =?utf-8?B?dldER2dIUXVwS0gwQlBwTUhFN01KR3NJRnpQYlh6WlhvKzNkSVE5bmdUcC9l?=
 =?utf-8?B?VFl6Nkl1amplcnpLSHArZ3p1TUNENnZyMUMyTEZHL0FudzNNY0tNWDlJZWdH?=
 =?utf-8?B?MUtOenRhVHZXeXV1alZOOVdTbnVUVXJUNEgyeC9CMlJTRHVCcnRXbmVTMWVz?=
 =?utf-8?B?NGlkQUUycUEydkdjSGZybWFHQkVqRm4xMHppeVNzTFZYN3YzeW1PaW9CZ2Mr?=
 =?utf-8?B?Nkh6dG41ZUJIZm1IUVlObGN4T3VFTm9DcVFMNTBpVUFqdmpqbTkwUFZoaFJC?=
 =?utf-8?B?ais2NWZ6WVlmR05lQUxkTTk1ZmpNVzQrYzVsa1Y3cmFRdStmNFVnTHYxbnAw?=
 =?utf-8?B?R1lGQWFtMmJadEFQeVFwMStoSnQ5cTg0RzFyZVlWazRBT1BicHVYQkJsUDc4?=
 =?utf-8?B?Q2gyYXBKclU1SXpvOE1XeW9TZ0xYTHpWWk5tSFB6ZTltVllMODVlMnZST0Nv?=
 =?utf-8?B?MHNSTEZYR1grQ21Ub2htWlpaQkpRZ0NMS2Q2N2ZraUZaVHo3OGNRcHk4clJ3?=
 =?utf-8?B?OG96b3FLZ2RUbVpYTVFyQ0ZKdUFYdGdCMUM4eDQvdWpyZ3hSUTBmYWVVWk9s?=
 =?utf-8?B?V3E3bTlFTE41aUFKYUJSaHpHSUREeVhuRGt5RnZFSlM2ZWNUaVYvMEpkVFNk?=
 =?utf-8?B?dzlZQUp2Q1d0YXdsSjFjZDBMbVI0NTNrTlJWdFQ4MmJ2V09HUy85VmZ3NWFU?=
 =?utf-8?Q?pSkpQUdZhc7xCO1IB6czL8I=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P301MB1984.JPNP301.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?a3RqalJGbG1FdjVkSlVqRHVkQkwrQ3NoMlk3S3NMcW8rVnlWSHBGZE9EZjFp?=
 =?utf-8?B?VzNLZURMd2NYaHVFOW9oRTVxditROGpVMlFtY0ZhMGFtK1pMTzZXOEJZRkJh?=
 =?utf-8?B?cGpZT2lFOWYrWUVHaW9NSDNFQ1c1ZUkzZ3pFblAwc0U0TjduZC9hNjZaM2tr?=
 =?utf-8?B?RHNoZmFJTjRMU1YzelNTV1QxazR2b0ltM0pYQUQza2R2NVRLRkpzWjlhdHdq?=
 =?utf-8?B?ejNHVmFuYVJQM1J6YWFXbFQ4dDlVWnIyYXFGY1dTaTkvcFQ5bkVWVkV0c1dH?=
 =?utf-8?B?cVJncDkrVnhIK0FyRzVXYnhKNHhsWlpyL3ZHdjhjdzIxMlEzcTY0NVVIWk9L?=
 =?utf-8?B?bXJZZ3VhQm1qTVBFNDdINTIrbXFhQTZWd0hPUVZqNUtMYXd3QXJQS05DOVlr?=
 =?utf-8?B?eVB2UWZybWtQb293RTFFYXNnU2Q4RDRYMExTYTRVNUxXelRyRXh0SmZEYi9R?=
 =?utf-8?B?UW8rZVBibEk0aENhZlZEQ3J6UlBNQllWN3VxMXFIWlhLU3JDVXMwdk92VVR2?=
 =?utf-8?B?NHErRWJnK1RpbUtCcTFzS1BoNjdhbXJFSHhDNkVZaDhpVkQ3ZGJzVStKQVdv?=
 =?utf-8?B?UjJsczVnVlJGTTRSbTFpOVRhZTZaM3o5aTkzdG16ZHlOZEFvallPTzc1N3N2?=
 =?utf-8?B?cWVqbVBXa3p3WmdrcmsvZ1doMnJubnh2SmxmSFBmOHZhNmNHajZpVDRFMEFO?=
 =?utf-8?B?TGNJYVRUNGlLamZwdjgzS1pzcTBpTHVaOWVFOVBmUC9DZmtBWGhzSlJ3cGhG?=
 =?utf-8?B?UXA0ZTc2MjJpdElPdjhtN05IN0VlOWJubzNQR1VCbDJ2Nzg1TDdBYmpvUjA2?=
 =?utf-8?B?dGVtQ3FBbGM2SnI0YTVRZWFieUZJMUduRlhZeDJZY25LNlFXM3VqRzNzWmV4?=
 =?utf-8?B?WHpiaUF2UlEweTJPTVc5UStEWmsvbXBLV1o4emxaRkxEM252ZWNBcW5WVUtq?=
 =?utf-8?B?NHl3ZGluY0N1TGRORnpqNUpFSnAzQmpmK1dXZzB5QkJRd25TTkxuTHRlN3gv?=
 =?utf-8?B?SC84Zlg1TVhrTEluMW5DUjhOZTFOYnpkK21Ea05lYVZ6R3QrSzVDc1VYdHpu?=
 =?utf-8?B?d1JGdG9uMTRhQU01bm9xWC9VTjhwNDhKbjJwbDcxRlU5TU5zYUVNbTNKbGxN?=
 =?utf-8?B?aVFOUUZLajdBSHpxQjhNSmJSSE45NEpGeit4OTVZTzduOENKdU1aNldKMHlT?=
 =?utf-8?B?a0I4Uk0wZnFrdmlTNThMd2h0MjA1V3pkLzB1TnJqNER5Q0VzQlVyeDhBRy94?=
 =?utf-8?B?VDEwbjc5Ky9NdW9JdE9rcHVSTHlXUlVxQmpqRDV1SlZxdlpYT3c2c2ZWWllX?=
 =?utf-8?B?WFU2OUcvaE1nNVRiSEhOeXNVSVl3T1ZNWkZra3BDb2FieU5NZWhSOTVaa1hH?=
 =?utf-8?B?VEtLOE9HQ0pnRkQ1cm4vd3h4U205a3lLOHBmNEpCd2U2NGxrNlJ1a0tSZVE3?=
 =?utf-8?B?bDNFME9kbnVTUzdkSy9ILzJhVS9GZGZ5MTJyQkJJeklPcVlZamtPSVhPVTUv?=
 =?utf-8?B?SUVHMVl3RGJ3S1VnZElXd0FFSVNHa2NvdWNHMTV3YzlsQzFHVWlaTVJaNXV6?=
 =?utf-8?B?Vk85Lzh2QXJGSGYvZHJlOEpGNTVERDMyU09Sb0ZZeGN0cTFHTUw4Nzg2bnZw?=
 =?utf-8?B?TW9ha3lzaWpVdVI0MDYzV3dZTGcvRkFtSi9YV2NtcXNPNmRFbG5BUmhWdjQ2?=
 =?utf-8?B?cFdOQVBTZmVpaUR3VzF6V3A2ZjU5OC84TEpPbDExWG9jV3p6aUpZTzhnT1p5?=
 =?utf-8?B?VG1JZmtLNFpZQmZRdnI3WWJPZmlsOG0xUEtPUngxdVR0aEloTndjSUM5dUlD?=
 =?utf-8?B?aWZDSDgrUEpMbndEVkcyNis2clBsZUxuWUNiL3pBcmN3OUtGRU1QTFFqNkpY?=
 =?utf-8?B?RW1mSForQTNIMUtmcWRPRGc1cnZtSk5SZHRBTWNmbmNjTjNCSXRvZ1NXM0py?=
 =?utf-8?B?aW1uQk9UMHVuNVpjNXIvS1oxTUFaV1A3T2Y5VzRKQ3ZpbWN0V0QrWGJtOVBZ?=
 =?utf-8?B?VWlBQ1lqSW9wNmZUQ2xEaDdRTWoxVmRqRXFoYlhhUXNtSHpVb01waERwTEV4?=
 =?utf-8?B?NlVYUjNzODlGWDdGV01rTkgvVWdYQ0JWRS9mR0tqSUdSaDlkQWRudWsrTThr?=
 =?utf-8?B?MTQ5S2M3bm00RHJvbGJHa3pXQ0V5dmQxM2ZEVkpCbllnNkxDY0hTYjR2eTI0?=
 =?utf-8?B?RnEyZmxOOHlLZ094NnREQ2s4TVI0bzJDSkNvUmUzdXd4UkhkQVVsdndaZjRw?=
 =?utf-8?B?a2VabE1LR1k2MXpDRHRTWUoxY3doazFHdTR3T0VVT0pESzE5azZ4OHdzeUZy?=
 =?utf-8?B?SVd4eERGMm1ZNkRoOGxvd05mbTVobUl0RkFjMzhvcGk0eVFDMEQ2dEx4a0dK?=
 =?utf-8?Q?8lNKgBOwrkO+1A34=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY7P301MB1984.JPNP301.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d715f300-6f9c-41c5-367a-08de60058071
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jan 2026 13:43:07.8652
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: W9ys1mgd20hwjdj7AaSXIQfj8865ifzuG2OgH+iU7HINsN1SfRe/nk8+sxfM2pOsCLpeYLnXqfxC+PUZL5SsNWgqx1xoSNmIWVQ7kRl53WU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1P301MB0234
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-27678-lists,linux-renesas-soc=lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,baylibre.com,bp.renesas.com,renesas.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ovidiu.panait.rb@renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[renesas.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,renesas.com:email,renesas.com:dkim,TY7P301MB1984.JPNP301.PROD.OUTLOOK.COM:mid,m68k.org:url,linux:email,0.0.0.69:email,0.0.0.12:email]
X-Rspamd-Queue-Id: 9329DBB468
X-Rspamd-Action: no action

SGkgR2VlcnQsDQoNCj4gDQo+IEhpIE92aWRpdSwNCj4gDQo+IE9uIFR1ZSwgMjAgSmFuIDIwMjYg
YXQgMTY6MDYsIE92aWRpdSBQYW5haXQNCj4gPG92aWRpdS5wYW5haXQucmJAcmVuZXNhcy5jb20+
IHdyb3RlOg0KPiA+IEFkZCB2ZXJzYTMgY2xvY2sgZ2VuZXJhdG9yIG5vZGUuIEl0IHByb3ZpZGVz
IGNsb2NrcyBmb3IgdGhlIFJUQywgUENJZQ0KPiA+IGFuZCBhdWRpbyBkZXZpY2VzLg0KPiA+DQo+
ID4gU2lnbmVkLW9mZi1ieTogT3ZpZGl1IFBhbmFpdCA8b3ZpZGl1LnBhbmFpdC5yYkByZW5lc2Fz
LmNvbT4NCj4gDQo+IFRoYW5rcyBmb3IgeW91ciBwYXRjaCENCj4gDQo+ID4gLS0tIGEvYXJjaC9h
cm02NC9ib290L2R0cy9yZW5lc2FzL3I5YTA5ZzA1N2g0NC1yenYyaC1ldmsuZHRzDQo+ID4gKysr
IGIvYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I5YTA5ZzA1N2g0NC1yenYyaC1ldmsuZHRz
DQo+ID4gQEAgLTEwOCw2ICsxMDgsMTIgQEAgdnFtbWNfc2RoaTE6IHJlZ3VsYXRvci12Y2NxLXNk
aGkxIHsNCj4gPiAgICAgICAgICAgICAgICAgc3RhdGVzID0gPDMzMDAwMDAgMD4sIDwxODAwMDAw
IDE+Ow0KPiA+ICAgICAgICAgfTsNCj4gPg0KPiA+ICsgICAgICAgeDE6IHgxLWNsb2NrIHsNCj4g
PiArICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJmaXhlZC1jbG9jayI7DQo+ID4gKyAgICAg
ICAgICAgICAgICNjbG9jay1jZWxscyA9IDwwPjsNCj4gPiArICAgICAgICAgICAgICAgY2xvY2st
ZnJlcXVlbmN5ID0gPDI0MDAwMDAwPjsNCj4gPiArICAgICAgIH07DQo+ID4gKw0KPiA+ICAgICAg
ICAgLyogMzIuNzY4a0h6IGNyeXN0YWwgKi8NCj4gPiAgICAgICAgIHg2OiB4Ni1jbG9jayB7DQo+
ID4gICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAiZml4ZWQtY2xvY2siOw0KPiA+IEBAIC0y
NzcsNiArMjgzLDI1IEBAIHJhYTIxNTMwMDogcG1pY0AxMiB7DQo+ID4gICAgICAgICAgICAgICAg
IGNsb2NrcyA9IDwmeDY+Ow0KPiA+ICAgICAgICAgICAgICAgICBjbG9jay1uYW1lcyA9ICJ4aW4i
Ow0KPiA+ICAgICAgICAgfTsNCj4gPiArDQo+ID4gKyAgICAgICB2ZXJzYTM6IGNsb2NrLWdlbmVy
YXRvckA2OSB7DQo+ID4gKyAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAicmVuZXNhcyw1bDM1
MDIzIjsNCj4gPiArICAgICAgICAgICAgICAgcmVnID0gPDB4Njk+Ow0KPiA+ICsgICAgICAgICAg
ICAgICBjbG9ja3MgPSA8JngxPjsNCj4gPiArICAgICAgICAgICAgICAgI2Nsb2NrLWNlbGxzID0g
PDE+Ow0KPiA+ICsgICAgICAgICAgICAgICBhc3NpZ25lZC1jbG9ja3MgPSA8JnZlcnNhMyAwPiwN
Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPCZ2ZXJzYTMgMT4sDQo+ID4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDwmdmVyc2EzIDI+LA0KPiA+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8JnZlcnNhMyAzPiwNCj4gPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgPCZ2ZXJzYTMgND4sDQo+ID4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIDwmdmVyc2EzIDU+Ow0KPiA+ICsgICAgICAgICAgICAgICBhc3Np
Z25lZC1jbG9jay1yYXRlcyA9IDwyNDAwMDAwMD4sDQo+IA0KPiBTaG91bGRuJ3QgKGF0IGxlYXN0
KSBxZXh0YWxfY2xrIGFuZA0KPiANCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICA8MjQ1NzYwMDA+LA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIDwzMjc2OD4sDQo+IA0KPiBydHhpbl9jbGsgYmUgb3ZlcnJpZGRlbiB0byBwb2ludCB0
byB0aGUgY29ycmVzcG9uZGluZyB2ZXJzYTMgb3V0cHV0cz8NCj4gU2FtZSBjb21tZW50IGZvciBb
UEFUQ0ggdjIgNS81XS4NCj4gDQoNCkkgdHJpZWQgaW1wbGVtZW50aW5nIHRoaXMgYnkgb3ZlcnJp
ZGluZyBxZXh0YWxfY2xrIGFuZCBydHhpbl9jbGsgd2l0aA0KZml4ZWQtZmFjdG9yLWNsb2NrIG5v
ZGVzIHRoYXQgcmVmZXJlbmNlIHRoZSB2ZXJzYTMgb3V0cHV0cyBhcyBwYXJlbnRzOg0KDQotLS0g
YS9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjlhMDlnMDU3aDQ0LXJ6djJoLWV2ay5kdHMN
CisrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOWEwOWcwNTdoNDQtcnp2MmgtZXZr
LmR0cw0KQEAgLTUwNCw3ICs1MDQsMTEgQEAgaW8gew0KIH07DQrCtw0KICZxZXh0YWxfY2xrIHsN
Ci0gICAgICAgY2xvY2stZnJlcXVlbmN5ID0gPDI0MDAwMDAwPjsNCisgICAgICAgY29tcGF0aWJs
ZSA9ICJmaXhlZC1mYWN0b3ItY2xvY2siOw0KKyAgICAgICBjbG9ja3MgPSA8JnZlcnNhMyAwPjsN
CisgICAgICAgI2Nsb2NrLWNlbGxzID0gPDA+Ow0KKyAgICAgICBjbG9jay1tdWx0ID0gPDE+Ow0K
KyAgICAgICBjbG9jay1kaXYgPSA8MT47DQogfTsNCsK3DQogJnJ0YyB7DQpAQCAtNTEyLDcgKzUx
NiwxMSBAQCAmcnRjIHsNCiB9Ow0KwrcNCiAmcnR4aW5fY2xrIHsNCi0gICAgICAgY2xvY2stZnJl
cXVlbmN5ID0gPDMyNzY4PjsNCisgICAgICAgY29tcGF0aWJsZSA9ICJmaXhlZC1mYWN0b3ItY2xv
Y2siOw0KKyAgICAgICBjbG9ja3MgPSA8JnZlcnNhMyAyPjsNCisgICAgICAgI2Nsb2NrLWNlbGxz
ID0gPDA+Ow0KKyAgICAgICBjbG9jay1tdWx0ID0gPDE+Ow0KKyAgICAgICBjbG9jay1kaXYgPSA8
MT47DQogfTsNCg0KSG93ZXZlciwgdGhpcyBicmVha3MgdGhlIGJvb3QuIFRoZSBwcm9ibGVtIHNl
ZW1zIHRvIGJlIHByb2JlDQpvcmRlcmluZzoNCjEuIGZpeGVkLWZhY3Rvci1jbG9jayB1c2VzIENM
S19PRl9ERUNMQVJFLCBzbyBpdCByZWdpc3RlcnMgdmVyeSBlYXJseQ0KMi4gQXQgdGhhdCBwb2lu
dCwgdmVyc2EzIGNsb2NrcyBhcmUgbm90IHlldCBhdmFpbGFibGUgKHNpbmNlIHZlcnNhMyBpcw0K
YW4gSTJDIGRldmljZSwgaXQgaXMgcHJvYmVkIG11Y2ggbGF0ZXIpDQozLiBUaGUgY2xvY2sgZnJh
bWV3b3JrIHJlZ2lzdGVycyB0aGUgZml4ZWQtZmFjdG9yLWNsb2NrIHdpdGggcmF0ZSA9IDANCjQu
IENvbnN1bWVycyAoUlRDLCB0aW1lcnMsIGV0YykgcHJvYmUgYW5kIHNlZSByYXRlID0gMCwgY2F1
c2luZyBmYWlsdXJlcw0KDQpJJ20gYWxzbyBjb25jZXJuZWQgdGhhdCBpZiBxZXh0YWxfY2xrICh0
aGUgbWFpbiBTb0MgY2xvY2spIGRlcGVuZHMgb24NCnZlcnNhMywgbmVhcmx5IGV2ZXJ5dGhpbmcg
d291bGQgbmVlZCB0byBkZWZlciB1bnRpbCB0aGUgSTJDIHN1YnN5c3RlbQ0KYW5kIHZlcnNhMyBk
cml2ZXIgYXJlIHJlYWR5Lg0KDQpDb3VsZCB5b3UgcGxlYXNlIHByb3ZpZGUgYW55IHN1Z2dlc3Rp
b25zIG9uIGhvdyB0byBoYW5kbGUgdGhpcz8NCg0KVGhhbmtzIQ0KT3ZpZGl1DQoNCg0KPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDwyMjU3OTIwMD4sDQo+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPDEwMDAwMDAwMD4sDQo+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPDEwMDAwMDAwMD47DQo+ID4gKyAg
ICAgICB9Ow0KPiA+ICB9Ow0KPiA+DQo+ID4gICZtZGlvMCB7DQo+IA0KPiBHcntvZXRqZSxlZXRp
bmd9cywNCj4gDQo+ICAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0DQo+IA0KPiAtLQ0KPiBH
ZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0t
IGdlZXJ0QGxpbnV4LQ0KPiBtNjhrLm9yZw0KPiANCj4gSW4gcGVyc29uYWwgY29udmVyc2F0aW9u
cyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuDQo+IEJ1dA0K
PiB3aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIi
IG9yIHNvbWV0aGluZyBsaWtlDQo+IHRoYXQuDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgLS0gTGludXMgVG9ydmFsZHMNCg==

