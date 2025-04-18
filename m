Return-Path: <linux-renesas-soc+bounces-16148-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6656EA93544
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Apr 2025 11:30:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A059C3B65F6
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Apr 2025 09:29:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A574926FDA3;
	Fri, 18 Apr 2025 09:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="aYjgLFQt"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010046.outbound.protection.outlook.com [52.101.229.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B77F1EE7BE;
	Fri, 18 Apr 2025 09:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744968597; cv=fail; b=AvD0IuqHDp/Mj8jDl6HJJpxvsPP4JPqnXDSNHKDb1HmV8shIwFUwJLlOYweIhQOQM/UhbOSb2csRs71up7QyyA83I1t8Gg//YB2uLLsIcs1s64IKnQcJTqKTvZEWMjWMOGp94F+ByY6sTehMglpiZ38VFNgLapcml+s6+qeflB0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744968597; c=relaxed/simple;
	bh=hZbJG/nmZcFlpd+3IZAUHxusYnLN5kQz/kaM5cNuxk8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=AezKAjxbupNuauLOsuQhjuSEnK/M1eY3oH8qKKHLZpBVD5UWzbdMjBWiCc4u+JGf0YaE72sHDl50co2hQ5yjHkuVf6xcOTF+4iWdzCADD6AW92bpgJxrA3rpGeDwSW2IJMVIFvwUZMrL7CwvafII19P0QyLOQc0sV1df4ycP8Tg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=aYjgLFQt; arc=fail smtp.client-ip=52.101.229.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KhaeitxE6K1ffNtm7T6wS4jB1aebEAwOw1Weni50d4PEcpFa67+RAUwYrE5frDf+QkiRwpDg1FwdlTMmfK3YpgjpAUNGtKRzOibbAfsjnWMQyxHh/fypGHXRM0mxHAokCO+FTN0TMW2Ljw5M8Ct+s0VD4IHcKrUrU7rzJQt2p9MDE69XLhGZcf/2nvwrZD/xgYZ/FER4ieYBso8gTvPwAUlQHelzuI1n02I8C3ezDpAuwWBkD5H8O9NAj/QVTxgj7gNQnW6PZRW5fZmbvkU0T935Sy1hPTH6a4n3IKP4gIx4/Ib2ey/CxXH+X7AXElJ4WsfvH1Oi/lHgh/sPTHavvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hZbJG/nmZcFlpd+3IZAUHxusYnLN5kQz/kaM5cNuxk8=;
 b=cdoETidtNu2bUTa2LiiwbgxbiAXQQBhjxN7tepma7Xc4agSLvLfPwLkC55VnGKzuyJ6430pkgHBwD8EJOPvfRn7px+c7FivdYBXod2tHUoBxja/2kLJmA1y4tPXpn7Uk+IiQJ3dFNptu/l9qdVU7nh6P2OWuLo7cH+akaYDxEARZM2nINFQwyXvv4xe0LXKnxVrVohG2PcWOhN8wmWRdoZAevKhgKdVbK4AXTOpPh830eB+1jIX9A6V43PYvscKIDtYq4EVX8GbbazQe56albeQJiLhHxZTG03JczuTc9Bzxml+rvzLwhqAcb7G9lkDAm2zaiHYz7s2IPXunpYI9jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hZbJG/nmZcFlpd+3IZAUHxusYnLN5kQz/kaM5cNuxk8=;
 b=aYjgLFQt5r1G5aK5+3Z/xNsT9T7xiu+3YgxH4c42+mWWkDg6g+rDHX/M9VH/RjrIDWSe48MMurTMwNGhqvJiaN522fTaoZqz3mzOTz8ExGaGbxeVCOsDrN51s8XoYa54UHOGYb7ygB2ZSAngprZSZAg5TAQ4f/8rZvAz5RpAEc0=
Received: from TYCPR01MB11492.jpnprd01.prod.outlook.com (2603:1096:400:37e::7)
 by OSCPR01MB13709.jpnprd01.prod.outlook.com (2603:1096:604:37e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.35; Fri, 18 Apr
 2025 09:29:46 +0000
Received: from TYCPR01MB11492.jpnprd01.prod.outlook.com
 ([fe80::4a09:638d:4f7f:51ce]) by TYCPR01MB11492.jpnprd01.prod.outlook.com
 ([fe80::4a09:638d:4f7f:51ce%5]) with mapi id 15.20.8632.030; Fri, 18 Apr 2025
 09:29:46 +0000
From: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: "thierry.bultel@linatsea.fr" <thierry.bultel@linatsea.fr>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, Paul
 Barker <paul.barker.ct@bp.renesas.com>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v7 02/13] dt-bindings: clock: Add cpg for the Renesas
 RZ/T2H SoC
Thread-Topic: [PATCH v7 02/13] dt-bindings: clock: Add cpg for the Renesas
 RZ/T2H SoC
Thread-Index: AQHbpN+JvL0uzxQDaUahLHILhgmcIbOn8wqAgAFLPZA=
Date: Fri, 18 Apr 2025 09:29:46 +0000
Message-ID:
 <TYCPR01MB1149254288CBFABBD03F027938ABF2@TYCPR01MB11492.jpnprd01.prod.outlook.com>
References: <20250403212919.1137670-1-thierry.bultel.yh@bp.renesas.com>
 <20250403212919.1137670-3-thierry.bultel.yh@bp.renesas.com>
 <CAMuHMdV9p9uwMUR59F+_fJiSU0b5vJWr4hHJmc4geos=48TndQ@mail.gmail.com>
In-Reply-To:
 <CAMuHMdV9p9uwMUR59F+_fJiSU0b5vJWr4hHJmc4geos=48TndQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11492:EE_|OSCPR01MB13709:EE_
x-ms-office365-filtering-correlation-id: 12916bd2-b92a-4fe4-965a-08dd7e5b8f0c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?TWpIbnMxQWR2MFl6ckhaYmh0V1BJSHNGOGQvWkRQNDhvWGNVaWVDZ05GQ1Y1?=
 =?utf-8?B?NnZBZFVJY3QxMjlKRFJORFovUS80UEd1Z3Z4azFpNVRJdTBaR1RJZ051QUQv?=
 =?utf-8?B?ZFpkWHd6NVpvUVJ3anhhS3doQlUrUlViOTRlL3ZqMDAwMjRzU3pkTmlsdStR?=
 =?utf-8?B?cURlemlHK1MxQWY0YlRiT3U3WVNxNHNVN29CNE9ZcjFwZXBKeHo2NDM2cnNF?=
 =?utf-8?B?MUVmdG85L1pJT0pRaC9OZkNqNnM0ejBlSURndU1tYnRia1Q0MDcxOFVwRWFH?=
 =?utf-8?B?MzhFL1UxSDJVZUtDSDBTYURTRlkyQjlNYTVBQktVaGwrWWRRTENHVEZlakdj?=
 =?utf-8?B?c3B5QjFmb1Y0ZVdYQW1sdzBtOS9xTm1sdmpBT0puTUZXclNRdk11MTh0RUsw?=
 =?utf-8?B?Wk16RGZGWUlLbW9FRU45bjVJekVUMDZlbXU3Y04yaFp1NXBYblUyWDl5N1VI?=
 =?utf-8?B?c2xFMUVKLzdJSnVnWWtVSUttUzB5TWxBenloTHdZc21lUlZsN3Q1R2dyeDNt?=
 =?utf-8?B?SmVubThtbVVlanZmZHdOZHhubytRYWIva2dzb2RJdFVTTnFJUWs2aVZtaXo4?=
 =?utf-8?B?L1R5eFg4Z0haR0tlSnMrbE9GRUV0UDJIU3FLYVZrN3puT0w3S2liano1YVJx?=
 =?utf-8?B?SWJOY2x6YUR4VGdLTjhoTnMxbWF4OE95OGpDaUpLeUp6Z1EzV2Zzei9pbXpT?=
 =?utf-8?B?UzNoNHBYWTVyMU0vMTMyRWxMc2o0UlkzdURaZ016N0NtU1dnQzI0dFY4QXpz?=
 =?utf-8?B?YkUxc2cwSUdFM1ZFeTJ5M3hHU095cm1kajcrWE54Y2RUUzdOSy9MamdJY05H?=
 =?utf-8?B?L1Z6THVaUUVZWjhQRVdtcTJVQ3BQODNiZWxydzRYVFo2Vy9CbFoxQkxHdFRo?=
 =?utf-8?B?a0Vpek42SUdsSDV5NFp5UzVBN0ZiemthL0M5SGUvL1BVNVFmK0cwa255VHIw?=
 =?utf-8?B?N0c4SThQZ1R1cHVZM0t1Qy84UDVoL2JZS1JYdVNqUzJpT2xqNFJSWmhIR0Iz?=
 =?utf-8?B?UUtkYnZpcEFzUkpGbS93RndNOHFvYlB1OXFmcmI0S2JvcEtVN2VVSFREQ3du?=
 =?utf-8?B?SC80eHQxSmxTU1d6aXFLTGkzT0R3aTk5bG93Smw0T0dhVloyckxlNXgyUWdO?=
 =?utf-8?B?M2VodjlLZGNtWnIyUldqVUhNNC9vRllxNmpRK1ltVlNQOFFRMCttRWRuZlFE?=
 =?utf-8?B?dThiTFZMeUxWc0RnaGt6cmdGUUhpN3h4clN3RGtsK0FHUzNaV3Jsa29oOHpx?=
 =?utf-8?B?ZFFyNHZUUUZoaWpEeWIwZ2YzeXJTeHJleXFQOHNtRUlxcnczVmxjVS9JaTQy?=
 =?utf-8?B?R2ZNdXB2eE9VdUdUdWQ0WlZWSlBjVXN0QURiR1JOeGIyTjdDZjZpa3BBenZi?=
 =?utf-8?B?elByMkJlUTBpNFpzMkpxL0pFaVdWQ2psWGJKQ2Vzb0pRT2EyNnREZC9sVjJG?=
 =?utf-8?B?NFVXa2tTTW44SEdjSEZ0YnB6Z3hIVUFKQmNLZjU0eHRCcGJmTVlDcEZGVk5L?=
 =?utf-8?B?UytnT3A5YjJrZzdiR2pMUHB2VWJ0ME1GVlAyZUdDNEp0L0ZSakdOWE16UlV2?=
 =?utf-8?B?ZmROSi9vZTlqa0dzdnBoZ2Z6SEYvdVhTbkRndjJRbE91SlFMSXMyakpLbGR6?=
 =?utf-8?B?ZVNabmVWQkdoZzVObTd6SXpvYUZqZ2VtZ0VLUDJmL0JkQU5yODZWSm5BRk9D?=
 =?utf-8?B?aDd6MUIwTmpEZForYktRdDZqSkhZZkU3VFl3a0pWZ2Q0OEJsaXlkT014Vkhq?=
 =?utf-8?B?RWpXWG5Nc3JDS1NyUkRFc2xEWHZMYnRCWDNsaHJrSnJRMlVHVnl3WjFEUllq?=
 =?utf-8?B?MWVNMEh6MHdic0tDVkZXNDNzKzJ0ZDRwdy9sNjRDQ2MxUWs5WXBWYjRJM3JR?=
 =?utf-8?B?Qk1NRVRTZjl4a3k2SWJuWlVtSHAzMnkybVlnbzA2WVhXM2p3dml0TG1Fekdu?=
 =?utf-8?B?aVJDTEUrUlJiR0FGZUZyYWl6eVFTbTBtMndUTW15OXpjMjZiVm5PRTZjVStw?=
 =?utf-8?B?OTFDbTB1N1BRPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11492.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UzhYTmE4Y1hZdXpDeE50aGIzcHo2c3lUaHBBZ2RMTGVrL1FqcnJCL1BJRzNw?=
 =?utf-8?B?ZXpFTmEwQVJBejF5VzJlV3dhNTIxRGdKZW0vSVd1bW12bzZYV09yNlY1bSt4?=
 =?utf-8?B?U1d5enJKbEcxWWh3ZDkxQU0rOGREbjE4azJ6eCtuM05JTE9wdE5hUWVsdi8v?=
 =?utf-8?B?c2F6Z1dDU09OYXZnTnUvWlJjTG5ya3E4dWwyK21IZnNRZFVIdGNSYWtxQlhh?=
 =?utf-8?B?WHJPeC8xMDdrMXZ5QlY2UVlhL0JOYi9teUd2ZTU3NU85b25hR0s5K3RWREFS?=
 =?utf-8?B?N0ppbnFtTThVMkFPQzZmNlhQSUM2dGtNbHZOUjh1TW1OQXBTVEc0Si9iV0Zx?=
 =?utf-8?B?Z1VJTGV0dEV4eC9tZE14UXZOUmdUTEUycDNJOVd1L0E0dkhGczgwaFJEeU81?=
 =?utf-8?B?SG01RlBFZElZR2tKMDh4MFhydEUzRDdOZWpsei9kMlQyUzNSMHFrZk5NRzRE?=
 =?utf-8?B?bFFsVy9yeHk0VFFuTXpvMzI2LzJ0SEh5RFYvRXRVR1NvaUhUZU5TYnpsSU8v?=
 =?utf-8?B?aUdoajRIcjcwWEt6UE1MVE9WVlZaTTNJTFhNV2hObGNXODlIUHpaY3UzQUFm?=
 =?utf-8?B?a1FONzMxQXhobFNoenUyL2RYTGMrVlVCYW9CMENXZnQ4TWQrM2tOaEE3bHhx?=
 =?utf-8?B?djBlR2h0Mm1oc0psQm41Y21HWHFVM3lZTUZNZ3BMKzh6S0Nac0ZGNHZWOHpD?=
 =?utf-8?B?dkpyNlhmVjY0Ynh4OSsvRG9kMGdGSVU3U1UzMEpyckUwUW8xVHBRanY2T0dG?=
 =?utf-8?B?OXFYVnA5UGJmekpnS2J4N3V3RjF3RWNkWmZHcXN0QWk4R0R4M29ISGl5d2pR?=
 =?utf-8?B?bWN6K3gyUXh4Ukdqa1VhQjdUZ2dZVUxKTE5YTmE3d3JldkFIc2E5UHlSSnFT?=
 =?utf-8?B?RkhjdXE2OU1xNlU2TDNGTWh0VTd0blIydkNleWtHODBWd1lXMTFsR2Y3QkZn?=
 =?utf-8?B?YkRVSW80czE5ZFZKNFNHZm1RUkNKZ2VOWHVENVFTajZkQVRVbTVjRVRXNGFz?=
 =?utf-8?B?UmlBdnZyNlVFTlRhMmhGM0xLa3UwMzVLMG9CQXdGS3FDZlM2OFRaSmRqamZ6?=
 =?utf-8?B?MDJhWHNCOFFRTksxd253SldwMkFnQlBrOFhDbmNYVGZNcUZxQTBxaUdGblMx?=
 =?utf-8?B?TXBiaXVPamd2ZUU5ZzZBckY5dzhLR09XanlpK0QrblprbElNMmw4UURUa2tD?=
 =?utf-8?B?M3NPY3p4eitoWnNWd3lud0s4eVYxZ1NkMWxjclVuUk1jeFpuOE1EajF2Nmp5?=
 =?utf-8?B?clhyRkJ3RnFURzN6RW9GcW9ZQXFPdDdqcTdoSWxCQU40RnZ3SldnM1F6dzZ4?=
 =?utf-8?B?TXhHaENBMDVwbmYzSHR0SVcwT3oybkJDUE5aTkx3Wk9mQlIwbFlRU3hEMmdN?=
 =?utf-8?B?TzFMWlFMS01EdUhGbnZsVDRJVi8vQXpOMDk0OTdMOWxnSkdHUXV0endGWHZo?=
 =?utf-8?B?emViakFzTllGV0pWZjI0cG5QelFwNFpiNnZmdVRQMWphMERiOHZyZE05WC8z?=
 =?utf-8?B?UWI2RjlsVnFiSmF0RHJmYzdacktSbi8xckJIWmtET2xOTzRLS045YlptZHk4?=
 =?utf-8?B?alcyUnkzN09EUWJyUzM0OC9VN0E4ekY1SmhjNzhybFE2eTRIdXJsOEM5QzZL?=
 =?utf-8?B?aFpIU3hsWVRFTjkrOW5oS09ib3ppV3o0VGxYSUFEMU53cUlGeEdNM0czaElr?=
 =?utf-8?B?WlQ3RUdpOUQvZUFoQTJNWjNGWmVQYWhpaUhhbzl2V0lTaklvbTlkd2w0Tm9x?=
 =?utf-8?B?YTFsMzZTYUZVblEvSHB1RzB6TlN3QUdIR0l1UnZrVXQ1YVFyU054ZWlOM0ZG?=
 =?utf-8?B?dFdla2ZwK3NGYWM0VnpPN2doWUpqRUZDVUxZNS9TRzdJUzRkK1d6TzV3ZUpT?=
 =?utf-8?B?c0Eram1HZmxzcnFqUDJxRzRIODNKSGNaMVZvcGpOS2VFTHY1MnpjL3d6d2VO?=
 =?utf-8?B?SjNlMjZORjJEU2Y2NEZhRUt1bzRwbzV3QU5NY3BXV2ZSUll0TTdIbnJDNWM1?=
 =?utf-8?B?MmlnckM0Y1FHZXRzMWNNb0dWQlBqY2o0UloyUXRBT1l2VXZ4Q1pyaFdaQktQ?=
 =?utf-8?B?VXNVUkI4MUg2KzE4anBvOXNXcjJsYmRBcjJoYzV0OXVpY214MjZ3TWpncnlL?=
 =?utf-8?B?K1NjV0hJcm1QSnpTcEFROU1PUWVFVVVkdzkrU0doOVlmV0MwZWZlQXAxdjFz?=
 =?utf-8?B?VXc9PQ==?=
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
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11492.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12916bd2-b92a-4fe4-965a-08dd7e5b8f0c
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Apr 2025 09:29:46.3244
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zTdlFCV45jwGZf1mxJPFxWF2NWjtJLd39QZRvKzZtBZQmSiMeGYLk1aIOw46Cc/1nwgp0up6fqSasb5mtzx47GKvlgk00ExRwX1FIoHAU6ydtFACcDMP7ED+s6wOriKu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB13709

SGkgR2VlcnQsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCltzbmlwXQ0KPiANCj4g
PiAtLS0gL2Rldi9udWxsDQo+ID4gKysrIGIvaW5jbHVkZS9kdC1iaW5kaW5ncy9jbG9jay9yZW5l
c2FzLHI5YTA5ZzA3Ny1jcGctbXNzci5oDQo+ID4gQEAgLTAsMCArMSw0OSBAQA0KPiA+ICsvKiBT
UERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAtb25seSBPUiBCU0QtMi1DbGF1c2UpDQo+
ID4gKyAqDQo+ID4gKyAqIENvcHlyaWdodCAoQykgMjAyNSBSZW5lc2FzIEVsZWN0cm9uaWNzIENv
cnAuDQo+ID4gKyAqLw0KPiA+ICsNCj4gPiArI2lmbmRlZiBfX0RUX0JJTkRJTkdTX0NMT0NLX1JF
TkVTQVNfUjlBMDlHMDc3X0NQR19IX18NCj4gPiArI2RlZmluZSBfX0RUX0JJTkRJTkdTX0NMT0NL
X1JFTkVTQVNfUjlBMDlHMDc3X0NQR19IX18NCj4gPiArDQo+ID4gKyNpbmNsdWRlIDxkdC1iaW5k
aW5ncy9jbG9jay9yZW5lc2FzLWNwZy1tc3NyLmg+DQo+ID4gKw0KPiA+ICsvKiBSOUEwOUcwNzcg
Q1BHIENvcmUgQ2xvY2tzICovDQo+ID4gKyNkZWZpbmUgUjlBMDlHMDc3X0NBNTVDMCAgICAgICAg
ICAgICAgIDANCj4gPiArI2RlZmluZSBSOUEwOUcwNzdfQ0E1NUMxICAgICAgICAgICAgICAgMQ0K
PiA+ICsjZGVmaW5lIFI5QTA5RzA3N19DQTU1QzIgICAgICAgICAgICAgICAyDQo+ID4gKyNkZWZp
bmUgUjlBMDlHMDc3X0NBNTVDMyAgICAgICAgICAgICAgIDMNCj4gPiArI2RlZmluZSBSOUEwOUcw
NzdfU0RISUhTICAgICAgICAgICAgICAgNA0KPiA+ICsjZGVmaW5lIFI5QTA5RzA3N19DTEtfUExM
MV9FVEhfUEhZICAgICA1DQo+ID4gKyNkZWZpbmUgUjlBMDlHMDc3X0NMS19PU0NfRVRIX1BIWSAg
ICAgIDYNCj4gPiArI2RlZmluZSBSOUEwOUcwNzdfQ0xLX0VUSFBIWSAgICAgICAgICAgNw0KPiAN
Cj4gSSBjYW4ndCBmaW5kIHRoZXNlIDMgY2xvY2tzPw0KDQpJIGFtIHJld3JpdGluZyB0aGUgZGVm
aW5pdGlvbnMgZW50aXJlbHkgdG8gbWF0Y2ggdGhlIG5hbWVzIG9uIHRoZSBkb2N1bWVudGF0aW9u
LA0KYW5kIGRlZmluZSBhbGwgdGhlIGV4aXN0aW5nIGNsb2NrcyAoYW5kIG5vdCBtb3JlKS4NCg0K
VGhhbmtzIGZvciBoYXZpbmcgZGVlcCBjaGVja2VkIHRoaXMgIQ0KDQpUaGllcnJ5DQoNCg==

