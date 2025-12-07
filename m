Return-Path: <linux-renesas-soc+bounces-25631-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 79CF4CAB3BE
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 07 Dec 2025 12:03:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9824D3002FCC
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  7 Dec 2025 11:02:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA53A1E1DE9;
	Sun,  7 Dec 2025 11:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="G5otryT8"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011052.outbound.protection.outlook.com [52.101.125.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 955D14D8CE;
	Sun,  7 Dec 2025 11:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765105373; cv=fail; b=qvEPWzQBPgMpjwZ5I7ZR3mOkxpNI+LISyQ1IPY0Z1VKSW8W9TMzuoszz0eIVQFQZgrxx7q/vI+2hRUTDzbxR2lQZlC00byPyIOJrfyZ2XVmWNBFTgOqzswQR0TLM0RbzAWa1dMtp6EtvL0UYRkKoKqDrHoHrv2AaXRHeHHkXnWM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765105373; c=relaxed/simple;
	bh=L0fxtNTfh30WaS8P9KLUtDD4q5IBZcHx1Oa0Hl7oUTs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=gLyR9JUaCagewv1A4xZZ2R3FY8R3k6sD0OD6UmgzgbsuHjPBAw4CzxfUMbKcxrz0F4QkYk611c0+dKLQn4GqybTG3kiIG1syhh9XIUUzxRbEznIi3GXtoQb3DQ/Ez17az74LN7dQpA2+ifw9hlGhxX/6Lq1oM1OUAJokXtJzqLk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=G5otryT8; arc=fail smtp.client-ip=52.101.125.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OOQR1WP+YkqBOjDQdWTWz4U7cJTiKcseRcPioKMvyubtcYxr6MJltJ86/JO7zukK4BXLHAUupKJcyC/aPM2N3oJfdjp7QInuxp7z5rUsdEd17oBUUHMsMv691R3hAda4bDYDrOR72h5M9X7+yxnG0QV/GJxadOIgTmFkzxEYHN/B7+TE0InVdA+gep0UAWAS3H6llNE8AQspg0C8rbXT5tU5nvZS5FENeemtYA3RnifFEnEY8gbkG7/wDnJXJEViouTYffXQGO+pwirhCcRanzxFFXJb8NnfUsWm/w1BXsGZyrVBu0h+BBsoN9LaIAAdpPYKi1kai6nBsKatpiJRJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L0fxtNTfh30WaS8P9KLUtDD4q5IBZcHx1Oa0Hl7oUTs=;
 b=Rkv9DXilDo+djzJFI5CBw2kuBs6ig2SK3fueg287c25k/fssESlHm8ss4zfLLzn3Ml4CWUL5ry5u13TYDar0cTaZro9VBaqM35kfmeCl5ZJ6zR0CGnkCVHv1Va21199edbBGLtAPEDMRE/XGDBdUBHkjXmiitYKhZUgkeQoen3pGeXb+GMtYzk0ZQoR0Y6jpthLF234cKEC70vyrBghuIYeXxKKxfrJ4xZMNtdLOwHeH/uDNetqbruaSCBULDRE+hMPK3g+5/kTWH4H3armSTcgvQoXdpP03P9SGWkRwBwCzihrsz91HM7yXYJtL6NzvL/WZOSY++KJdMXJVjbBpkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L0fxtNTfh30WaS8P9KLUtDD4q5IBZcHx1Oa0Hl7oUTs=;
 b=G5otryT8oAklwEwctotvH1PErHMheIMcqnK7b5NOqqFOnpga0it3qRAzoz3MD/VV2xyaA701X62Uui1+sLM7eUlnUkFzQIRyjvw5TkPmFVs2PD5A8p6ejSkVeq9zXnAJ8VjtoQt7SC8JKETt+QEREtR4CArSeHXUUctoU8R5m/M=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY4PR01MB13349.jpnprd01.prod.outlook.com (2603:1096:405:1e0::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.6; Sun, 7 Dec
 2025 11:02:43 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.9412.005; Sun, 7 Dec 2025
 11:02:38 +0000
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
Thread-Index: AQHcUkXayA+E33hY1EmsX/GuWX+dybUR8j8AgADxDfCAABPzgIADNCBA
Date: Sun, 7 Dec 2025 11:02:38 +0000
Message-ID:
 <TY3PR01MB11346D053263D4E4C367F1EA186A5A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20251110132715.724084-1-claudiu.beznea.uj@bp.renesas.com>
 <19fda177-6c11-45d6-9dab-3f75edceda4e@tuxon.dev>
 <TY3PR01MB11346F5E49BF172AE78C55EAE86A7A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <50937606-46fd-4202-ad4b-9ede5bff76fc@tuxon.dev>
In-Reply-To: <50937606-46fd-4202-ad4b-9ede5bff76fc@tuxon.dev>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY4PR01MB13349:EE_
x-ms-office365-filtering-correlation-id: 99efb452-8b02-4436-305e-08de358022d0
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?RnZYL1dyeEFwVFk2TXdkbFVUdVJmQXlRcUUzM2FGV2hveVJhUDN1ajlQWW9E?=
 =?utf-8?B?TVpod2drSjU0OGFhSW9pRGpKdkpkZm5qWTVjUVljeCs2bmFGVDlaNDFHZmVs?=
 =?utf-8?B?U2JsOFkyOVRUWVo5NUg0R0JuMkNmK3dMcERYaEUyVDEzTE1lbHcwOFhSVFBh?=
 =?utf-8?B?cmVPVU85TFk4SnZ4RjZPM0JCcXNzUjRFRlU3Mkx1Z2JtcWVWOWtCUFBNOXpB?=
 =?utf-8?B?RkhLUlVjWlN4d2VZaDNXVm9sY1VlUzZQSEs0WnlYZ2xUL21TeXZ5Y290c3Zy?=
 =?utf-8?B?M05ZSkt0UEhBMVdjMk9TZGZLQ1I4TVdLUlE3UFhQQ1U4TXQzVys4NERjRmUz?=
 =?utf-8?B?cklmaWxRUkhJNFZrQ3pnNkRxdVhDYzhPbUVSTGFySWM1OGsxakROaWpDKzZv?=
 =?utf-8?B?d0ZBb3YybEZ1V2daR2dkeTZGMWtZSnI0YXhLVVRDcnFXRU9GZUJOeENIcERU?=
 =?utf-8?B?SHJVcWMrMFdBZ3dVU2l5dG1IWmlEams1M1RzZkIwcDRRSUdsMHgwWmZxbno1?=
 =?utf-8?B?eUJsYTI1QlA2RWNaTmlXTWEvcitBQTdkMi9ZL1hwN1NzNnRUQlBXeUhEV29y?=
 =?utf-8?B?KzR3RDAwRXBFb3djVGRkU2pGNmdJUS9ldG5xWGUxR1V4eGlzNmJMWlUxYjdX?=
 =?utf-8?B?RXFkZmxma1Q3cFplRmFUbUFUbDNwQ0NrM0RkWldDQ0F6RnBOOW8wRHU3K0k3?=
 =?utf-8?B?cm1ZbWcxOFFhTmZsbnppS0lPY3IzSVlkTGdodWh2eVVkRHZQZTRmcDJBTlFZ?=
 =?utf-8?B?UjFYbXJid1Z4L1U4WnFBd1JzUEhzMEpweG1kRENpTXRRVExFYmVraVJhMldi?=
 =?utf-8?B?RDBrNDlVdWtjY1RyQ2owTnJLVWF6ZTFvck1tdUZxQm5hQjVsVWxWR05Hb3FG?=
 =?utf-8?B?V0Z6Wi9yaWVUb1pjUVd4T3JkOVR1U0pLZWpUcCtRRHZPMmk4R1BkQUFsRm11?=
 =?utf-8?B?ODZQdERxOGhMbnFFY0o4UFpyZDUwdzFNekIzTWVJQ3hGWlNlb0NnTUlBV3gz?=
 =?utf-8?B?Y1dRbkF0TTduYWU0bXBTUDE0SHNNRUFTV0thMFpuVkF2MkdtekJTckNDby8z?=
 =?utf-8?B?ODN1UlFrMExZQVJTMGZjczM1UlRVVFVIZnI5cDllTlZiSVNPVTdRTCtJOGVj?=
 =?utf-8?B?RWY0dmhSb2k1U3F2TkNuc25CODhuZUVtQ0I1M1lpQ0pEUEtyYTE1QlkyMzNl?=
 =?utf-8?B?YXJUVlNEdityUXJJVS9ycWprU0JvcnF3Q1dzakdndHpPQjFnbVh0NVdwRVlW?=
 =?utf-8?B?a1RFd0xGd3d3OW1wem0yTDlDKzZpZVNvUTlMMXZPR1J4K3JRSWlCWWh1b1py?=
 =?utf-8?B?S1V4SzBYendhaVgrR3M4RHorUFQwbWNUSHpWOGJRRVloT3EycFpub3dPbHND?=
 =?utf-8?B?VEZkRGNoVmNqbFRrRmt0TGgrYUh3eUlMbjJLQ3F5TzJmWGdmVGhmY0lnWFBE?=
 =?utf-8?B?RytqZnhjQTZTSDhUK2c1ak9Td1VFd3dLSys2a3hKYXZZUmIrS0Q1QXZiK1pS?=
 =?utf-8?B?VUpOTE1ETmZoMWJzZGRHS0Z2UjdWZHZ1UFQyTFFkWXFUdURHWkc4TjUvU0N1?=
 =?utf-8?B?d2FPU2E1bHg3aVEvWWluamN6VENKOEdCWUNhc3ZFMDZwaDEwSytlMmFyK00v?=
 =?utf-8?B?T0cxNkowYVNZLzFWbTBFT1RmZ0x1M3FJcjVTMUtyUSt3UUxQQmlVK2x6ZVhN?=
 =?utf-8?B?eUhzVzBNeENMQXhzeGVtSFlVVXE2Nk9RbE9NdnRFZWdrTmszN3VMSDBQUVdM?=
 =?utf-8?B?U0tmSXYzQThkL1FYejgwNmFIVDlYZS9WRFdxb05wMmVHa2V5Ym5XMWRNbUdT?=
 =?utf-8?B?UE1ua2c0THlMMEc2R3dtWm0rTWNEL282cmxmMkhqdUoxOFQwaUp4QnBya2dp?=
 =?utf-8?B?NFNWcUVScklxbGg3cEJyc1hUL0JJakRRTlIzd081V21sc1JwTjBOYXpQUVdq?=
 =?utf-8?B?SXpiT3JHUjB5NUVUajhHT0NxalFReW5xU2RibElJZnhsOU9jbmpGK3M3aWZr?=
 =?utf-8?B?TWhPbFpVWWRRPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eSt3d3lySVNXaWEwamFiWUorYmRFWkd1S3YvRkw3Z3JHYWhJbXlSNGthOWhP?=
 =?utf-8?B?MXdZK0xXalhML2pmTFhtSVIrWXY3TDFCa2k3TEVob20yUHVkaDJoUGhUdm9P?=
 =?utf-8?B?R3VmdW1vdG9qZCtqc01tSlZrYUZ5SnFpRHlMQU13YWk5Nm5oaG1GM0NmZ0JD?=
 =?utf-8?B?dFUwYnVjWFRCN1Q2dWIxRHZZUTdBZmpsdXd5cS9jUjZtT3lpcWdFTkxuaDRK?=
 =?utf-8?B?NXl4RE14cmpCWTR4R0NyamR6bGRCTWFkM1AwNlhUZitLd1lQSktVWHZEdHhx?=
 =?utf-8?B?Rzlyd25MY2lSSHNuSGJSRzZXbUpiSisyZkJNWjVrVjhGVmlqUWFQU2F1L0p1?=
 =?utf-8?B?R1pncGJRenVWRGJrSjd2c1BjcjA1ak1rcFFmQ0hTU3hkRCs3RTVkeEt0aTFY?=
 =?utf-8?B?UXB5cGN5ZnQwY3g1K3A1SEZ0M3N6a0tIZWYrbis5SUExQjkvSDRhUDNxMDVD?=
 =?utf-8?B?Qy9QZGl3WVlBdzZadnVKU0lTYjhCVElLbklrcWFDSnV2RCthWXFzaHBNUnNM?=
 =?utf-8?B?UzBUNTZiRnZzeG9YWU5NNitkaE8xRDRFQm5GUWZ1dTZBV05hZGQ2eERjUmxQ?=
 =?utf-8?B?b3lZNy95eVRpcjdFaHE1VVhSTFRDcmlIbFZ2NFhXNkNVL3gzQ3ZwREJVTzI3?=
 =?utf-8?B?aTBHNlR6N0l4bnhEc2F1TjE4SVc3QkpNU1BPL0t2cmlLcjhWTWVoY1psdzgv?=
 =?utf-8?B?NDZMNFRzUDZ2Q3dEWGZEOGxnS2kzMEJwSUtWUmR6aUdjWHU4N1VSK2ExUE9I?=
 =?utf-8?B?OGhYRU1MUEMxN05RRUlaT1g5L3RmZzlDWldNR0Y4dVR5bWNObDgvdUM3VmRE?=
 =?utf-8?B?ZlJUUXdjeDBmTGQvVDBkVmduN0VES2lIckkwRUVLSkNyVGk1RkZHRzdWRS9u?=
 =?utf-8?B?L2lBYVRlNWpKNFlQUWJhVUhFWlBPVTliVDNhZENXQ1dWMUdNSjJhSzN5cG9L?=
 =?utf-8?B?YXZTYmlhY3V2VkZYeDJRa3JiNXJBeC80M0pyRUZKQkpxUFVLSFFkVlVpMHNl?=
 =?utf-8?B?T01NVU1adDlvWXFtMCs5bXJlNDBsWjVsZkpVTnY1c3k3dGVyc2NTU3ZGYVN3?=
 =?utf-8?B?Zm1WZmkwTzE3a2RnZnlDK3Q5VDdqSjFCZW50aTVMTGIwblF6a2o4OHhSbEF6?=
 =?utf-8?B?VXpjVVpreUhnSjJ0clJMekhrQU83OEQ2ekxVeGJobU81cDlBNUxGUDIySG5y?=
 =?utf-8?B?eU1MeGhjSDJidHFKM2orK2hKRFVkTGkxRU00cVMxUUMvZDFYZTdNWHpDdERU?=
 =?utf-8?B?TzFJM28xdU1aQjA5N1dwUjZ3eXozY1E5N1ZZemdRaDZjekNMOWlKNVFxNVVW?=
 =?utf-8?B?Q1BvU0RBT05SOFdydzhvOUpPdDNKQ2tqY0lLWnlBTmlPTFREWDFSNUc0cWFV?=
 =?utf-8?B?WElyR0VsQmRsUG1sSzZHeklSRUloaXlvcytDQ2tUNHl6WjhCUmJSUTJNcDlq?=
 =?utf-8?B?YUR3VVBlQ0ZxMUNjQ0NyMUpTSjVnTlRTZCtmRUd4UmFxc3g5V25vcFFRTyti?=
 =?utf-8?B?WDBSV1ZtM3ZCb2RNVFI4a3BOTGJIN0g0cVBja0w4QWtkZStzMWs3dmpNTnd1?=
 =?utf-8?B?ZURYb2x2SVphbFgya0RSRitjN05Uc05FSWwzUWZqZ1NCOHh2ZmZ2YXFCd3RY?=
 =?utf-8?B?QVE4cWd0RWJ5Z3VYRXlxQzFCMnFZMWl3SFNTYTlMQS8rUzZhdmthcjB2ekw0?=
 =?utf-8?B?d25oRXh6YkZXdktWY1h6SlI4UFVRL0RBRkJ3RitSNHh2ZUtFVnpwSjJuQ2h0?=
 =?utf-8?B?dmR3dDE0OW5IVk9VL3ZQMUlFT1JSalB4RWRoQm9US25ZQ1E3b1E4U21wT1pn?=
 =?utf-8?B?eXhXS3lBSTZYZm5PcG1kK0VUcXFUNGw4cENqM3VzY0p5U0lNTUs3dHowZGRB?=
 =?utf-8?B?QVNQUGN0UlpvbjBEbFAyWGZlUFVoQUtMUWVOWGdER1JRZjJLdkE1QjZaVHgw?=
 =?utf-8?B?SDJrSm9WSEZTRkl5eGczbFNEdEdIczJidXl1SEpZbXV2SG8yNnY0M0ZlU1pH?=
 =?utf-8?B?dzdGVVh5dVZuNlFEUlM0UTJBdExwUDdneHc3OHpVR2duWm1lS1VUc2ErYzB4?=
 =?utf-8?B?SWRRSi9yYzYrZWJEMVdodVVCbDNGN0RaREV0cTRZWXpWR2pnYVNZRlVDM0tN?=
 =?utf-8?B?cGRyZXY1clI0eGRneVowekFTS2ZydzNLWDhPTisxTDZjWTJDdEZQdml6N05D?=
 =?utf-8?B?dWc9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 99efb452-8b02-4436-305e-08de358022d0
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Dec 2025 11:02:38.8818
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ijM7qwYD1qdeDp1G7GoTZhFkkuzWZ6b2i7NwagVx+RG4aE6ppL8IZwmm/Pi7xbvnIjxAOAr7/nVgiV8+Ku897SrUEONxKSBba5fMc2t5HA4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB13349

SGkgQ2xhdWRpdSwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBDbGF1
ZGl1IEJlem5lYSA8Y2xhdWRpdS5iZXpuZWFAdHV4b24uZGV2Pg0KPiBTZW50OiAwNSBEZWNlbWJl
ciAyMDI1IDEwOjAwDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIgMC8yXSByZXNldDogcnpnMmwt
dXNicGh5LWN0cmw6IEFkZCBzdXNwZW5kIHRvIFJBTSBzdXBwb3J0DQo+IA0KPiBIaSwgQmlqdSwN
Cj4gDQo+IE9uIDEyLzUvMjUgMTA6NTMsIEJpanUgRGFzIHdyb3RlOg0KPiA+DQo+ID4NCj4gPiBI
aSBDbGF1ZGl1LA0KPiA+DQo+ID4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4+IEZy
b206IENsYXVkaXUgQmV6bmVhIDxjbGF1ZGl1LmJlem5lYUB0dXhvbi5kZXY+DQo+ID4+IFNlbnQ6
IDA0IERlY2VtYmVyIDIwMjUgMTg6MjYNCj4gPj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MiAwLzJd
IHJlc2V0OiByemcybC11c2JwaHktY3RybDogQWRkIHN1c3BlbmQgdG8NCj4gPj4gUkFNIHN1cHBv
cnQNCj4gPj4NCj4gPj4gSGksIFBoaWxpcHAsDQo+ID4+DQo+ID4+IENvdWxkIHlvdSBwbGVhc2Ug
bGV0IG1lIGtub3cgaWYgdGhlcmUncyBhbnl0aGluZyBJIHNob3VsZCBkbyBmb3IgdGhpcyBzZXJp
ZXM/DQo+ID4NCj4gPiBJZiByemcybF91c2JwaHlfY3RybF9zdXNwZW5kKCkgZmFpbHMsIFdoYXQg
aXMgdGhlIHByb2JhYmlsaXR5IHRoYXQgaXQNCj4gPiB3aWxsIHN1c3BlbmQgYWdhaW4gd2l0aG91
dCBhbnkgaXNzdWUNCj4gDQo+IEhvdyBjYW4gSSBtZWFzdXJlIHRoaXM/DQo+IA0KPiBUaGUgaWRl
YSB3aXRoIHRoaXMgY29kZSB3YXMgdGhlIGZvbGxvd2luZzogaWYgYW55IGluc3RydWN0aW9uIG9m
IHN1c3BlbmQgZmFpbHMsIHRoZSBzdXNwZW5kIGlzDQo+IGFib3J0ZWQsIHRodXMgY29kZSBpbiBy
emcybF91c2JwaHlfY3RybF9zdXNwZW5kKCkgaXMgdHJ5aW5nIHRvIHJlc3RvcmUgdGhlIHJ1bnRp
bWUgc3RhdGUgb2YgdGhlIEhXIHNvDQo+IHRoYXQgbm8gcnVudGltZSB1c2VycyBvZiBpdCB0byBi
ZSBhZmZlY3RlZC4gVGhpcyBpcyBhbHNvIGhvdyBjb3JlIHN1c3BlbmQgY29kZSBpcyBkb2luZywg
ZS5nLg0KPiBzdXNwZW5kX2RldmljZXNfYW5kX2VudGVyKCkuDQoNCkFmdGVyIHJlY2hlY2tpbmcs
IHRoZSBjbGVhbnVwKCkgaW4gdGhlIHN1c3BlbmQgY29kZSBtYWtpbmcgdXNhZ2UgY291bnQgdW5i
YWxhbmNlZC4NCg0KRWc6DQogU3VzcGVuZCByZXR1cm5zIGVycm9yIHdpdGggdGhlIGZvbGxvd2lu
ZyB1c2FnZSBjb3VudCBpbmNyZW1lbnRlZCANCg0Kc3RhdGljIGludCByemcybF91c2JwaHlfY3Ry
bF9zdXNwZW5kKHN0cnVjdCBkZXZpY2UgKmRldikNCnsNCnJlc2V0X2RlYXNzZXJ0Og0KKwlyZXNl
dF9jb250cm9sX2RlYXNzZXJ0KHByaXYtPnJzdGMpOw0KK3JwbV9yZXN1bWU6DQorCXBtX3J1bnRp
bWVfcmVzdW1lX2FuZF9nZXQoZGV2KTsNCisJcmV0dXJuIHJldDsNCn0NCg0KDQpUaGUgc3VzcGVu
ZCBlcnJvciBjb2RlIGludm9rZXMgZGV2aWNlIHJlc3VtZVsxXSBhbmQgaW4gdGhhdCB5b3UgYXJl
IGFnYWluIGNhbGxpbmcNCnJlc2V0X2NvbnRyb2xfZGVhc3NlcnQoKSBhbmQgcG1fcnVudGltZV9y
ZXN1bWVfYW5kX2dldCgpIHdoaWNoIG1ha2VzIHRoZSB1c2FnZQ0KY291bnQgdW5iYWxhbmNlZCBm
b3JldmVyLg0KDQpTbywgbG9va3MgbGlrZSB0aGUgY3VycmVudCBsb2dpYyBpbiB0aGUgQWRkIHN1
c3BlbmQgdG8gUkFNIHN1cHBvcnQgcGF0Y2ggaXMgd3JvbmcuDQoNClsxXQ0KaHR0cHM6Ly9lbGl4
aXIuYm9vdGxpbi5jb20vbGludXgvdjYuMTgtcmM3L3NvdXJjZS9rZXJuZWwvcG93ZXIvc3VzcGVu
ZC5jI0w1MTkNCg0Kc3RhdGljIGludCByemcybF91c2JwaHlfY3RybF9yZXN1bWUoc3RydWN0IGRl
dmljZSAqZGV2KQ0KK3sNCisJcmV0ID0gcG1fcnVudGltZV9yZXN1bWVfYW5kX2dldChkZXYpOw0K
Kw0KKwlyemcybF91c2JwaHlfY3RybF9pbml0KHByaXYpOw0KK30NCg0KQ2hlZXJzLA0KQmlqdQ0K
DQo=

