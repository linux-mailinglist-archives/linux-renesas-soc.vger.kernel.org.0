Return-Path: <linux-renesas-soc+bounces-21063-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D21DB3B6F3
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 Aug 2025 11:18:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 761DB1C28404
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 Aug 2025 09:18:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF8C83054C3;
	Fri, 29 Aug 2025 09:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="UaDcbKhn"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011022.outbound.protection.outlook.com [52.101.125.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB1B5304BDE;
	Fri, 29 Aug 2025 09:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756459065; cv=fail; b=nqpO/a6PeuFsvs/DOhzOKFzJ4FTH99JxLDs9p6ZDTvvRLfmvKG8/zESZJgI1xS+nQ+rR6C1zImDxG6D50AM0QeWD8xIgr3NkrkCZ/NP/m4YqQxPG6+nz9svVJ24uzQxI0W1Ox6WHP29Awjd9Lhv2dga8LuBT9D8lb32YJuq7DNM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756459065; c=relaxed/simple;
	bh=zJdUlY1YxoAnbJkX3Ryz4ou4a3r5Rjedx5qHY7jMrXE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=J3HzWhrUGzekWygBdgDAFyCvHLGKC8Yo2Sn+zS8HWdMljep7tJauBe3o8gXT+pcQNQQPgq/YWZVyum420uQYhzplkUsRiIOZf0Qsqk+/atlQ6bnTqEf5vumSUvwtw7BUWIgbfuV07Tn4OMBBUvM+6f4ge0dPp2SFRf3D+iB6NtU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=UaDcbKhn; arc=fail smtp.client-ip=52.101.125.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zK5b01YBCRx3+zpeqt4v96RJvBT46gkFxqvOLgFCdi3SqDPAdFgXfkti9YFOfDmxSU0EGplrS/I1I1iYbTK79nlqWY6iJap8z8v51RSXB/ae51em1NEZXmhIOhwuhsmGwWJSYNFHbHYa1wGvgzaNn/q0WIWFSObA3qT43SMvJ0FgSB3ukELhjPhuFELJXXVFY/StARSEH577X5xTlBHFQx60x2pK3qZcuq+1mS1rxVRH98h00yMOXget8AHE8dCAFLyFcMzRC9/W/rYlYRPERRBaBQXiM6vY5FYSET0uf11n9SZgaRSBW7AL5U6bzFcIctEIddNnss9OU/1DUF2XRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zJdUlY1YxoAnbJkX3Ryz4ou4a3r5Rjedx5qHY7jMrXE=;
 b=bhJmSkj1cvzGvFX+mKN4m5e6XfH4KKul3ejy9b/c72hCtxziIifoG8SuhDDi3REunw3Y7XBRJ05bw+Vff7x5Bcnbaizhkzqw2bxgt/sbvz8DFVCViK+p0eT/w7txXkN0FZWoyBTrHvEaoTFFA84InISUaIV6g8AHr+reN3OkiqhycWZrDX2BRUJRZjwWol5mfBrrod4gKVu73cE8spZ91HtRaZFxm1U35bCRZpOFnlIWgv7DLtK+uSOkGoZDIkLcLyScrvIdGAV/HZsG7h5LwHXQOllfIQt7+wwED9w9fLnopALlSHT7/Ac5HkUmenYol/7sQwbIDp/+rU//0qf5zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zJdUlY1YxoAnbJkX3Ryz4ou4a3r5Rjedx5qHY7jMrXE=;
 b=UaDcbKhn3+LPUMiyhzqKN/YsaS62baHEM6miWL1OvZTtGdmm3lYO5BssMhovzdsUSPwSBxh7TDiaBxxCOi+Z6dZabjb8FBij264MV7hlIErs7GYSkK5uaLDs+9BmANJJm21NnlgKcBE1LVJFTC6y8pMcza5ExDsB6TsHnDRFE30=
Received: from TY4PR01MB14282.jpnprd01.prod.outlook.com (2603:1096:405:20d::9)
 by OSCPR01MB13449.jpnprd01.prod.outlook.com (2603:1096:604:332::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.19; Fri, 29 Aug
 2025 09:17:34 +0000
Received: from TY4PR01MB14282.jpnprd01.prod.outlook.com
 ([fe80::37ea:efd9:8ca0:706a]) by TY4PR01MB14282.jpnprd01.prod.outlook.com
 ([fe80::37ea:efd9:8ca0:706a%4]) with mapi id 15.20.9073.010; Fri, 29 Aug 2025
 09:17:34 +0000
From: Michael Dege <michael.dege@renesas.com>
To: Sergey Shtylyov <sergei.shtylyov@gmail.com>, Yoshihiro Shimoda
	<yoshihiro.shimoda.uh@renesas.com>, niklas.soderlund
	<niklas.soderlund@ragnatech.se>, Paul Barker <paul@pbarker.dev>, Andrew Lunn
	<andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>
CC: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nikita
 Yushchenko <nikita.yoush@cogentembedded.com>
Subject: RE: [PATCH net-next v4 4/4] net: renesas: rswitch: add modifiable
 ageing time
Thread-Topic: [PATCH net-next v4 4/4] net: renesas: rswitch: add modifiable
 ageing time
Thread-Index: AQHcGAXV7bX91MybG0q3qYl+0+habbR4Ec8AgAFH01A=
Date: Fri, 29 Aug 2025 09:17:34 +0000
Message-ID:
 <TY4PR01MB142823434E3947C26EF056E85823AA@TY4PR01MB14282.jpnprd01.prod.outlook.com>
References: <20250828-add_l2_switching-v4-0-89d7108c8592@renesas.com>
 <20250828-add_l2_switching-v4-4-89d7108c8592@renesas.com>
 <638d337a-6485-4eb3-a53c-c6fd7dadafbc@gmail.com>
In-Reply-To: <638d337a-6485-4eb3-a53c-c6fd7dadafbc@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY4PR01MB14282:EE_|OSCPR01MB13449:EE_
x-ms-office365-filtering-correlation-id: 53922a44-df30-4a99-e134-08dde6dce3b0
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?dHk2aWZ6TW9OQTFhQ1AzNzFJOXh3VHJJZU52MGpHaVM2ME5ndE5oWURJUnV2?=
 =?utf-8?B?M09ZMWhHakZ4UTdvM1RQWExzS1hsUHdvUlJEdFpmOW5KSDVtMkxvSHZYWldG?=
 =?utf-8?B?SWtqaThOdzBXaG1ZSEdBZ0pBbklISUdUaGdiMGJ1THB3eExtaWR6MkYvVmJa?=
 =?utf-8?B?ZWVHQ2pwa01MMEJXNmdDQ3VwWWxrNFBROU5pS0NxY2IxcFdqVC9hME9KM2dq?=
 =?utf-8?B?dFBjTVlKWXpUQXBXOW5MRDRyQi9VdUc2bGhKY0VsOWRQdDhoaTNjK3BkaktZ?=
 =?utf-8?B?ZlNZWGVmWEs3STBEaVUzcVZSV3l1aTViUVY4b0hiWXY0WElzTTJESkVURDdk?=
 =?utf-8?B?MTF2YWY3b0U4NFFSdWpNL3Zmc0x1QnNNeG8zM2huN1RlREtPbGV4ZERxZm42?=
 =?utf-8?B?TTh2SkVtakwvYmxCUFRjbU9iWU5MU0ZKZ0xGWGxnMU1XaGk3eHhaRXA0TGdD?=
 =?utf-8?B?dG5YVmtFOTRPTTVQWE9NS1RPSGdzZkJxTUY2c0lqNytWa1hqd1N1Wmttc3dx?=
 =?utf-8?B?L1VUMy8yZXNEbTAwb3AxN25MSXEvOWYvcTVBR2FGdFd4WVFqVVlRbjcxcXVS?=
 =?utf-8?B?emVxUm1kZERyNVZoaXQyK2RaazZIQ0lVdVRKVFB4MWNWZGhON3l1N0Y2MGFG?=
 =?utf-8?B?RUFJRXJJSno3TStlMjlRL042eUJkV0t1RFVqRWxPQWlTVlcweks3ck5BNjR1?=
 =?utf-8?B?R2hQaVUwQi9jVmt4akk3Mmt2QWs0VlFMYW9BcXI1VkJIZEoyd2VIK25OTTB4?=
 =?utf-8?B?cjVzT1hjRjA2dm5IN0pBSkFGTklmT3BFTmVvZGVCa3B0U2VrLzNEeWFjNEFY?=
 =?utf-8?B?TmxoL1VuaGVOc1RTcjNmMlZxWG1DTmFuVkhiK2NoMGt4amRkdFJRZVFtVnFV?=
 =?utf-8?B?VDRMdHlNb3NucnN6cFZ3VVNzaUZMR2U4MVh4Y3pSbjBrY2xCVGw1UG9LQUta?=
 =?utf-8?B?dlVVcVF0TVI0Y0hMb3VGQ3ROMkFTTHAvMkdmZnR1RExpT3pNUUpzNWVqUnoz?=
 =?utf-8?B?SHhHUXozOVhCWUlNWU5CemFkR1REUDNFV2dFa21SSTVZVnBmZmpvdnpwK0VI?=
 =?utf-8?B?ODUxTmxVMnU4UmhrVEM1NEtIYy9ySHk3aGRQank0Q3NkY2dIUDlYc2FFTU5J?=
 =?utf-8?B?dXdKZGg3TEdDU05JUXNGZHpkbW9CNFc4WFpuN0x0ZWZOSmJGdThKNkV2Szli?=
 =?utf-8?B?U1IrTnFFUTBHUC9GMEpsYjk0eGN6M1RpRjNPYWU4VWZIVkFpNEdJWmtoUXB5?=
 =?utf-8?B?SGRFeGordTJONktwSEZHd3Bhc2p1NlJFN1JTbzU1NU9aVFZ4UG5Rd2RmOEZX?=
 =?utf-8?B?bEpyT1ppTFV3WUhvM0xYM3hsck1iNnBnZHJqUlkwQ09JSDFXc0didDUxNVRS?=
 =?utf-8?B?KytvbE51TllVRzdlTzgwbXJWb0RmdlVFcVJFVEFiWXE3VUtwVnhVMGR5cVdX?=
 =?utf-8?B?MnAyTDNTT3JFblZ6ZkJ2UHZxbkdXendFM2lWd2g1UGJBbGFPZVFOV0s2QWxD?=
 =?utf-8?B?WW1ZL1RWeElSR2Q1dVRTUkRyZnFKbTh6bEZGVHM4SDZtNjhuL1FpMzdUVGVY?=
 =?utf-8?B?b2dDMmZkSjlRVWRxRkxjTFdPbTNOcDZlRUZjUXExWnFSVjJSa2RpNW81Q21o?=
 =?utf-8?B?ZS8yYXJ6VUpjY0lNOENaMDJaaTlncW1wNlVzZ0tJWXBBenlscFpSeE1RU056?=
 =?utf-8?B?V1hHQ1BSbE5hYzR4MGtpdE8zNjllSDkwbjU5ejJzS1hTZmRENUlicG1VVElI?=
 =?utf-8?B?ejQ1Vzg5TDZxRWtaMEpCYmJEZmtUWmZYNTJNSDdjaDB0QUdCVnZReTVlbjc3?=
 =?utf-8?B?V2pVY1NreWtPcGhNQjlEV2Y5VDRVOVZEbkExZFYwcWZOc2lmUXpEUTJ4RzRt?=
 =?utf-8?B?ajFUN0NBWUdtZWpxWGUrQmQxb3F2RmVHUFJhbkJSYytwOHNkYmRXaCtnd3RM?=
 =?utf-8?B?TTF0dEcwQmNaZk1MbFlsN05UbmZLQUZWOExCOE1JMVlRNUQ2MDFEeTZCOXBY?=
 =?utf-8?B?YnNRUk5DTFVnPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY4PR01MB14282.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bFlOSkxPOGRUVEgrWG5qSVl1Q2tQcDQ0bFB3U3o2cW10Mi9vRnRPMCs4WWlF?=
 =?utf-8?B?REw2SlZaYTFvVkIyaFFrVjBKM3h2UXdvWXY3cW1FVzlTam54OVBTMXo3cXgy?=
 =?utf-8?B?dXVjRUd5bFNINC9XVVFpRk5qYjV4dUI2NmFUTEg4cmlJK0FPL0owTFpGdjkw?=
 =?utf-8?B?QU1mTXdqWFNHTndtaDM1WG1IR3M4OG9PR2pyZy85L1V5Und3aEtQSUhLRlZP?=
 =?utf-8?B?TzVmdGQxcGdTNmdYOFdmaGQrcFpvYzlrQ3M1Z1VDVmhBVHpnUWlkMlB6aEtM?=
 =?utf-8?B?ak5iTFg3RXYyZ3N5b3NWMm9lZGlCd2hEZWp5d2FjeWpnaEN3bHk5WjZTazRW?=
 =?utf-8?B?RUdWTU9YbTgyakYrZ3FxYlB1WVY4UVpZS0JRc1lUWXJtNm1ZNnpKU0syeWdw?=
 =?utf-8?B?d1B6TDhyZmg1QlNzNHdHQVdSUjZIb2h3cWlOcndiTkVhek1adXBpZFNXVnpj?=
 =?utf-8?B?cXhoa3Q0eVorS0lhQlNQNlB4d0hJSTJraSs1QW5KSzE1WDZLUVh6MzZBa21p?=
 =?utf-8?B?TzhOT2ljdE55ZEdlRkFBejFEUnJ6ZDBLcC91T1BTbTFCUEJTbWpZZ2NZMzJO?=
 =?utf-8?B?Y20vWW9Xb3ZjNXJFbjQvUEp5NXVORDdrejZHTjhBekUxL3FndmtqTlFhNUtw?=
 =?utf-8?B?c2hSYWMyQ2xIOXVRZjBSUVNydDdNS1ZudE81Y21oQm01UUpWeWx1aXN2M2k2?=
 =?utf-8?B?YTh2dXhwakRuWFhudE44ak8rRGJ1dlpreWpnVkRrMVVzVWxvbFZITTR1WkdQ?=
 =?utf-8?B?WjBEdEZDZmZPbCtmWGNaSnRtRWZMQVoxVmFJWmo0WU05c2E0bHVyV3Z3WnlB?=
 =?utf-8?B?b3lqMXQ2bjZtdUlWRnYzM2taWEEzeFhFK09MUHNqMzN1Nmp2UHlxeDJRemhm?=
 =?utf-8?B?aUNyZXRBQ1cybWp2LytRanMzWFFJTUozOWVOYXhmeE95Q1Vyc1M4UUdvWm5j?=
 =?utf-8?B?WEt4ckg2TEo5VVkxN28rOUMvVlpXS2JSOFB4blNUWktsRG03akh1SUxOOVpy?=
 =?utf-8?B?bFJRRjFiZ1dBU2NuVk1xZjMyUG9URjY3OWFqVmZxUStqcGo1ZEd3SGVvUkp5?=
 =?utf-8?B?WHl4bnU1RjVLQXIrYmpBaDRORThZOTRqRGZadnl4UzRTVXJ6TUh6RHN5RjQ5?=
 =?utf-8?B?Qnp2eFJ5SlRuN3FRMkdNVENhMnp3ZCtxM3c1cjhCcGxjZFhOcFRaL1hnOHJp?=
 =?utf-8?B?WVgxeEFOcnJTVmNxYWpWY0J0bjVMaWpIUkNVc0laSDQvRUZLU00zOUExR2ky?=
 =?utf-8?B?VGFheWtISXA3NWVkdUlTMS92UDVwaWc2T21uVzh2Um5vTWNqaWpDY0w1RHJn?=
 =?utf-8?B?WXRPdGIxU21JdzloOVRSUVRhWVN6SlNKQ09BT2x4UFp5VjFOd1FGdlQ4dERP?=
 =?utf-8?B?T0VQcURNT0kvWVZqZTZXZTV2Sng2TmozNjlFd2RDMkw1bkU0cGd0VVF5Q09i?=
 =?utf-8?B?VXA2dGVOM0o3MlpKTzQ1bjM1bVNaY1A0UklITENrRjVFcGI2NWpOVnlZYTBJ?=
 =?utf-8?B?Z0oxa2NHSzZQczZiVXNzZmxZcEJRZ1Npd0pzcU8vcVU0U2QwT3QrOW12cWNv?=
 =?utf-8?B?dWNCVjQ4WlFwOWZlN3Z1NGFiTWkyVGIzY29GTS9mNkgyaHZLOXlnK2UxN0Fz?=
 =?utf-8?B?VU9kUmplMW8wQ3hhUjRXb0ZHN3ZZT2wwK1poR1VLZjdmVUYycjg1d1Fsbzl4?=
 =?utf-8?B?ZzU4eVlIRWc5RlBCRUpxcEJwSW5paWlrVkN2Wm9mSlNxL3pxbG4wWmI4L2xX?=
 =?utf-8?B?MnllM0xLSGVrMzJMV1JFY1FJNVVwbUdVQ2dGdnZ1SnZBWC90bm1pVE00VTNp?=
 =?utf-8?B?N3RGeHlxbEpQRm9KSlhWMUJYaTIwSmxyNU4wZXM3Q2drVnhXTDhNR1ZYVm9C?=
 =?utf-8?B?UWljOUZEbkZqRXVrZ3ZMTkQ1N0pZQTV1NzJyNWtNcmZ0a0Q4eFU0TTY1eFFp?=
 =?utf-8?B?ZHZUa3VnajQ2ZFU1QWEwdWIzWXNsSndlZWpuOXpnNUJqMWlxck1ZYmg4USti?=
 =?utf-8?B?aDNGV05kZVdsWjQrejJHYUZFTUtjcG9UNUI4RWxQN2g3bE9NVTcySlE3ME90?=
 =?utf-8?B?Qzl4Rlo0UnhhaFpPZ2xVVlU4YkxRbFRRSllUT29KdnBCOGp2TE5YZXlzdzVT?=
 =?utf-8?Q?5XRhagc6sUV0cBKzhLWf3UM0Y?=
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
X-MS-Exchange-CrossTenant-AuthSource: TY4PR01MB14282.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53922a44-df30-4a99-e134-08dde6dce3b0
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2025 09:17:34.3611
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Sb9ZN7hmNN6VB74Nyug/iGGkkLNfYxfvO3r2KiQY0KWklS3r198k+BdfpSx4AGFWj2iF6kFEote+xS0ToFH4g2tMTtxhKnBaiv8rP4tHpsk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB13449

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBTZXJnZXkgU2h0eWx5b3YgPHNl
cmdlaS5zaHR5bHlvdkBnbWFpbC5jb20+DQo+IFNlbnQ6IFRodXJzZGF5LCBBdWd1c3QgMjgsIDIw
MjUgMzozOCBQTQ0KPiBUbzogTWljaGFlbCBEZWdlIDxtaWNoYWVsLmRlZ2VAcmVuZXNhcy5jb20+
OyBZb3NoaWhpcm8gU2hpbW9kYSA8eW9zaGloaXJvLnNoaW1vZGEudWhAcmVuZXNhcy5jb20+Ow0K
PiBuaWtsYXMuc29kZXJsdW5kIDxuaWtsYXMuc29kZXJsdW5kQHJhZ25hdGVjaC5zZT47IFBhdWwg
QmFya2VyIDxwYXVsQHBiYXJrZXIuZGV2PjsgQW5kcmV3IEx1bm4NCj4gPGFuZHJldytuZXRkZXZA
bHVubi5jaD47IERhdmlkIFMuIE1pbGxlciA8ZGF2ZW1AZGF2ZW1sb2Z0Lm5ldD47IEVyaWMgRHVt
YXpldCA8ZWR1bWF6ZXRAZ29vZ2xlLmNvbT47DQo+IEpha3ViIEtpY2luc2tpIDxrdWJhQGtlcm5l
bC5vcmc+OyBQYW9sbyBBYmVuaSA8cGFiZW5pQHJlZGhhdC5jb20+DQo+IENjOiBuZXRkZXZAdmdl
ci5rZXJuZWwub3JnOyBsaW51eC1yZW5lc2FzLXNvY0B2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWtl
cm5lbEB2Z2VyLmtlcm5lbC5vcmc7IE5pa2l0YQ0KPiBZdXNoY2hlbmtvIDxuaWtpdGEueW91c2hA
Y29nZW50ZW1iZWRkZWQuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIG5ldC1uZXh0IHY0IDQv
NF0gbmV0OiByZW5lc2FzOiByc3dpdGNoOiBhZGQgbW9kaWZpYWJsZSBhZ2VpbmcgdGltZQ0KPg0K
PiBPbiA4LzI4LzI1IDE6MjMgUE0sIE1pY2hhZWwgRGVnZSB3cm90ZToNCj4NCj4gPiBUaGlzIGNv
bW1pdCBhbGxvd3MgdGhlIHNldHRpbmcgb2YgdGhlIE1BQyB0YWJsZSBhZ2luZyBpbiB0aGUgUi1D
YXIgUzQNCj4NCj4gICAgIFBsZWFzZSBqdXN0IHVzZSB0aGUgaW1wZXJhdGl2ZSBtb29kOiBBbGxv
dyB0aGUgc2V0dGluZy4uLg0KDQpUaGFuayB5b3UgZm9yIHBvaW50aW5nIGl0IG91dC4gSSBmaXhl
ZCBpdCBmb3IgdGhlIG5leHQgdmVyc2lvbi4gQWxzbywgZm9yDQpbMy80XS4NCg0KPg0KPiA+IFJz
d2l0Y2ggdXNpbmcgdGhlIFNXSVRDSERFVl9BVFRSX0lEX0JSSURHRV9BR0VJTkdfVElNRSBhdHRy
aWJ1dGUuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBNaWNoYWVsIERlZ2UgPG1pY2hhZWwuZGVn
ZUByZW5lc2FzLmNvbT4NCj4gPiAtLS0NCj4gPiAgZHJpdmVycy9uZXQvZXRoZXJuZXQvcmVuZXNh
cy9yc3dpdGNoX2wyLmMgfCAyMSArKysrKysrKysrKysrKysrKysrKysNCj4gPiAgMSBmaWxlIGNo
YW5nZWQsIDIxIGluc2VydGlvbnMoKykNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL25l
dC9ldGhlcm5ldC9yZW5lc2FzL3Jzd2l0Y2hfbDIuYw0KPiA+IGIvZHJpdmVycy9uZXQvZXRoZXJu
ZXQvcmVuZXNhcy9yc3dpdGNoX2wyLmMNCj4gPiBpbmRleA0KPiA+IDQ5YTI0NDY0ZGJiMGNmM2Yz
MjE5YTA2OTlmYzQ2NzFkZGQ3MWVmMDMuLmM1NzM5NmFmNzBhNGIyOTE3NDZkNjQ1MWVhZTcNCj4g
PiBjZjYwYjNmODk3MjEgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvcmVu
ZXNhcy9yc3dpdGNoX2wyLmMNCj4gPiArKysgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9yZW5lc2Fz
L3Jzd2l0Y2hfbDIuYw0KPiA+IEBAIC0xOTMsNiArMTkzLDI1IEBAIHN0YXRpYyBpbnQgcnN3aXRj
aF9uZXRkZXZpY2VfZXZlbnQoc3RydWN0IG5vdGlmaWVyX2Jsb2NrICpuYiwNCj4gPiAgICAgcmV0
dXJuIE5PVElGWV9PSzsNCj4gPiAgfQ0KPiA+DQo+ID4gK3N0YXRpYyBpbnQgcnN3aXRjaF91cGRh
dGVfYWdlaW5nX3RpbWUoc3RydWN0IG5ldF9kZXZpY2UgKm5kZXYsDQo+ID4gK2Nsb2NrX3QgdGlt
ZSkgew0KPiA+ICsgICBzdHJ1Y3QgcnN3aXRjaF9kZXZpY2UgKnJkZXYgPSBuZXRkZXZfcHJpdihu
ZGV2KTsNCj4gPiArICAgdTMyIHJlZ192YWw7DQo+ID4gKw0KPiA+ICsgICBpZiAoIWlzX3JkZXYo
bmRldikpDQo+ID4gKyAgICAgICAgICAgcmV0dXJuIC1FTk9ERVY7DQo+ID4gKw0KPiA+ICsgICBp
ZiAoIUZJRUxEX0ZJVChGV01BQ0FHQ19NQUNBR1QsIHRpbWUpKQ0KPiA+ICsgICAgICAgICAgIHJl
dHVybiAtRUlOVkFMOw0KPiA+ICsNCj4gPiArICAgcmRldiA9IG5ldGRldl9wcml2KG5kZXYpOw0K
Pg0KPiAgICBIYXZlbid0IHlvdSBhbHJlYWR5IGluaXRpYWxpemVkIHJkZXYgdG8gdGhlIHNhbWUg
dmFsdWUgYWJvdmU/DQoNCkdvb2QgcG9pbnQsIGFsc28gZml4ZWQgZm9yIHY1Lg0KDQpCZXN0IHJl
Z2FyZHMsDQoNCk1pY2hhZWwNCj4NCj4gWy4uLl0NCj4NCj4gTUJSLCBTZXJnZXkNCg0KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18NCg0KUmVuZXNhcyBFbGVjdHJvbmljcyBFdXJvcGUg
R21iSA0KUmVnaXN0ZXJlZCBPZmZpY2U6IEFyY2FkaWFzdHJhc3NlIDEwDQpERS00MDQ3MiBEdWVz
c2VsZG9yZg0KQ29tbWVyY2lhbCBSZWdpc3RyeTogRHVlc3NlbGRvcmYsIEhSQiAzNzA4DQpNYW5h
Z2luZyBEaXJlY3RvcjogQ2Fyc3RlbiBKYXVjaA0KVkFULU5vLjogREUgMTQ5Nzg2NDcNClRheC1J
RC1ObzogMTA1LzU4MzkvMTc5Mw0KDQpMZWdhbCBEaXNjbGFpbWVyOiBUaGlzIGUtbWFpbCBjb21t
dW5pY2F0aW9uIChhbmQgYW55IGF0dGFjaG1lbnQvcykgaXMgY29uZmlkZW50aWFsIGFuZCBjb250
YWlucyBwcm9wcmlldGFyeSBpbmZvcm1hdGlvbiwgc29tZSBvciBhbGwgb2Ygd2hpY2ggbWF5IGJl
IGxlZ2FsbHkgcHJpdmlsZWdlZC4gSXQgaXMgaW50ZW5kZWQgc29sZWx5IGZvciB0aGUgdXNlIG9m
IHRoZSBpbmRpdmlkdWFsIG9yIGVudGl0eSB0byB3aGljaCBpdCBpcyBhZGRyZXNzZWQuIEFjY2Vz
cyB0byB0aGlzIGVtYWlsIGJ5IGFueW9uZSBlbHNlIGlzIHVuYXV0aG9yaXplZC4gSWYgeW91IGFy
ZSBub3QgdGhlIGludGVuZGVkIHJlY2lwaWVudCwgYW55IGRpc2Nsb3N1cmUsIGNvcHlpbmcsIGRp
c3RyaWJ1dGlvbiBvciBhbnkgYWN0aW9uIHRha2VuIG9yIG9taXR0ZWQgdG8gYmUgdGFrZW4gaW4g
cmVsaWFuY2Ugb24gaXQsIGlzIHByb2hpYml0ZWQgYW5kIG1heSBiZSB1bmxhd2Z1bC4NCg==

