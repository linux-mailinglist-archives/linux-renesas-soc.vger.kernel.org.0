Return-Path: <linux-renesas-soc+bounces-16238-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E70D2A98129
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Apr 2025 09:37:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9F7FC3A717B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Apr 2025 07:36:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B11B266B4B;
	Wed, 23 Apr 2025 07:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="kO0iQzn8"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010061.outbound.protection.outlook.com [52.101.228.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 853591DE3C3;
	Wed, 23 Apr 2025 07:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745393816; cv=fail; b=Sc0ICIt8744UUuCNFjow1whIbsNeDYtuw44DxvQMW9ymmKNiugJzr2OhMd0O87JConCm3Pv/LXLkQvDQP9T0JhbSVWppInMj59wn5IB4YC9779OyCCJ+r7TX0mmjVtobnH9mtnARX1Qc5bYTX7yrs+wnAT72UviBHy7A8ryr2jI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745393816; c=relaxed/simple;
	bh=pSjrk2YhAerHuqnElQNbfoGp9HkIfAtbUtofjv3tAw4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=LOgVpydc1tf7b+EEXazazKrigkR2zc9/XzcR5flocE3wkeNsr3I+g4euDGHQlWBYBLvwOOe70aXN8IXMp2o+EA+SaQj6g09wZvl425vW3W06Z25P61Jm593vkSvtuDsKHM0j0wgqGbfl/dB7ZrLODIOALiatuSMvdIFASM6HgPM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=kO0iQzn8; arc=fail smtp.client-ip=52.101.228.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FenTGE5KUYeWdZ3Qi5lP5yDHIadBE3JGg19uOWC/HNA09RNqdiiK7pvFY/3x6oDozrwP7skQJsGwgHyfZcJDYTdNGpxdlM9zghzUokrx21ViAHzvEm/CBfXxeXVVpdgidTuyGwk+dP5IlAXnNVoVD49I/3LYiclQRYo59TKjuxgeP7wfgmBAw5aVsVb9ynLhvMRjlNh8d/q256MHzEtmkbx3vRvneC8K56xGoQYHoWvbKhVIOs1xowPQnWQRLKcwjJzFbMPU8v8oD2yYVlIUQYpjpIwJpQyLtT6Un0hYAhGg75PMFRrT7ua8x26uWxrszMWz5NkQsPoVDOr0GsWm5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pSjrk2YhAerHuqnElQNbfoGp9HkIfAtbUtofjv3tAw4=;
 b=OHZ5dMibofkyzANA9HnKqAty+25ptY4S77DDIJjzH6G2Gs7PjgTtQmzZGXDCjTLHLNs1oGIw7Voc/7SeFrZiWp/qKe9t8I0+qYO1ACnh9bAtLqoygcU3VrrbUmsuWRUrbsGECVzJdaLCgs95bwvhiza4FwYy8wzFVbr1k7WbNGvBxl6GgMXNIH61Blui4lGiBNyxmpyVWbUjQd0Kypb53Ssv7R3N7RPxbICoAVlLRO/JRRxo32lh5iXg5M/nCIOBTi+Mp8/7x8YK+yAwzIyM6VUppSpljiSkbP7HhJp2oO9uSeJZyvaHDFKKVEFitmqvJ5J6c4etqlWfBEIa9DZsjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pSjrk2YhAerHuqnElQNbfoGp9HkIfAtbUtofjv3tAw4=;
 b=kO0iQzn8+n24zaFAVp3yCnpbiISkPHgEahmuFO/DHb3jfFGARAIeobK29jV9tuv8KUB1HFR2bzTLq9C3y4suDPvHJZ1ZnfLyIIQGvPH7PE57J/g0qreZPIxA32VNUU/pENpls+iQbpsr3UyXtageyy140dC/7FRFeadAmqGP9rU=
Received: from TYCPR01MB11492.jpnprd01.prod.outlook.com (2603:1096:400:37e::7)
 by TYWPR01MB9759.jpnprd01.prod.outlook.com (2603:1096:400:235::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.30; Wed, 23 Apr
 2025 07:36:46 +0000
Received: from TYCPR01MB11492.jpnprd01.prod.outlook.com
 ([fe80::4a09:638d:4f7f:51ce]) by TYCPR01MB11492.jpnprd01.prod.outlook.com
 ([fe80::4a09:638d:4f7f:51ce%6]) with mapi id 15.20.8655.033; Wed, 23 Apr 2025
 07:36:46 +0000
From: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: "thierry.bultel@linatsea.fr" <thierry.bultel@linatsea.fr>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, Paul
 Barker <paul.barker.ct@bp.renesas.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>
Subject: RE: [PATCH v7 06/13] clk: renesas: Add support for R9A09G077 SoC
Thread-Topic: [PATCH v7 06/13] clk: renesas: Add support for R9A09G077 SoC
Thread-Index: AQHbpN+aTkZ10KsUDUyuFRr6/dlYB7OoSA2AgAFUOGCAB1nygIAAAitg
Date: Wed, 23 Apr 2025 07:36:45 +0000
Message-ID:
 <TYCPR01MB11492F29C81C6A33A9ED90F888ABA2@TYCPR01MB11492.jpnprd01.prod.outlook.com>
References: <20250403212919.1137670-1-thierry.bultel.yh@bp.renesas.com>
 <20250403212919.1137670-7-thierry.bultel.yh@bp.renesas.com>
 <CAMuHMdVpiZ+F0TMbLm000M_Scwozj2-SHPrUwTHqFKckVcmufQ@mail.gmail.com>
 <TYCPR01MB11492BCF416760E978541AFE18ABF2@TYCPR01MB11492.jpnprd01.prod.outlook.com>
 <CAMuHMdVQPbP0Fi5SDN8uOJ23S=_8pqHRVR2QFS8vHNfohzae2g@mail.gmail.com>
In-Reply-To:
 <CAMuHMdVQPbP0Fi5SDN8uOJ23S=_8pqHRVR2QFS8vHNfohzae2g@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11492:EE_|TYWPR01MB9759:EE_
x-ms-office365-filtering-correlation-id: d45d0597-0eb0-4d1b-e96a-08dd823999bd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?RWpObW4wU0Y0NXV0RHZpWERFTHN3MFZoZmppYnNkcEJhQTZTVkpNOUpUcFN0?=
 =?utf-8?B?dFo2VUtSVjE2RU9jd00zWDBmaDRpN0tpOCtMUmpXOUJYMzdBNzF3SnBkbnhO?=
 =?utf-8?B?ZHF6MmFuSS9qSmlmZ2xsRElmMzBFaGNmTG1LTXFkTitTNDV1WjVOdHEwWnVa?=
 =?utf-8?B?ckRGWW1rSGxSb2JqN1ZqV0FPRGRadzI3MHArRTRnSG14RmpldjRIQ2Y1VHhQ?=
 =?utf-8?B?TEEyYy9hNGtQbEhqUmwxcTd4TktJb0QyUUkyOTRKQkN5bHh4Q3hOMlZEY2NW?=
 =?utf-8?B?MHJ3UzhsbjV2bkVES1BEWUJkWkZ0UDh4aVRYZGtydk45cmhHbjhNSkUvMHZt?=
 =?utf-8?B?dHdDYWdtckpDd2pIdFlEZnU0VmQ0RllQNU8vcS9YWjdsRFpHNWhyWFpJM0E5?=
 =?utf-8?B?UTUybUVPL1luZmpDNmpnekZtSTY3bld4VjNUVXFZT215V0I5Q0lydm1PNk54?=
 =?utf-8?B?czJ6YWw3NjYzTkVobEZ2MjlSQXR3ckFpSEFpU3NsMkIrdTJRZlErcGoyaGtj?=
 =?utf-8?B?cGdMVjQwSzdMK2xZQXlwN3pJOTJ0WjVaOC8xUXJadUZRRFFKM3ozR2xnem5p?=
 =?utf-8?B?ZldBckliT1c0QWEvdVJPUWZRblBkeTdBNXlreXVHQmRWd0t4QjUxbVVERHJy?=
 =?utf-8?B?Z09lb0pjdFM3dnd4bWJnUGV0d0FxSG5BQjNFQkJKVFR0VkI5bnZKd3NxVXZh?=
 =?utf-8?B?Rjl1TnNpK001M1BSTlN0cGF1aHY0a01aUTN3SG5PcUVaOHQ1VHNYYysvbkpx?=
 =?utf-8?B?NmZrdm5rMElHYm5wdHdpbTErU1JCOTQyM2U0TmhHelU3cXNORnQvRWYycXo4?=
 =?utf-8?B?cDdyYzR0NFlSWkJZQStDbjYvcnllaUxsYmswbHpzZnVvV2l4V1pJWHhUNGQr?=
 =?utf-8?B?WHVkRTIzSGRZeXBaNGNvRUlXUzYyaFpsV3V5eVdQRUVNV05jazcwOGJQdnpZ?=
 =?utf-8?B?L2tIWHJDLzJQTW1QcjhzUEJIbE9SbDFURVR0dk9HaTZoem4zK1IwWXNod3Y1?=
 =?utf-8?B?ejBPTVlPQ0ZmbVhRbUdteSszNURWR2hCK2RXbWhCSjl1dHNSS1JncUFieTl6?=
 =?utf-8?B?b1NnS1liNVNZSVcrNnAzbVlCUE82eGd3KzV4elBVRWUySmRlRlB5cWFXc05l?=
 =?utf-8?B?VjRLQzkyQlpuaTFYanptTFoxR0gycVFUY2VsR1g0aGZjeWdBd3VQYlFKbDdk?=
 =?utf-8?B?YnNDc1RnOSt5aSs3Rjc1WWt0bEFueGZKeXE3WXVkSVA1azZYUzFLSk1QWEt2?=
 =?utf-8?B?aCtpUmczL3NCYnJiNExOei8vSERjMmlSUTJxVzZKUkp4N1JWNWVtOGJkWjRU?=
 =?utf-8?B?dDdvSmhjMU92YlVmUlBMbVVuMTN4V1drQndIVnV1TUFhVitpZFdsZ0NHOG1p?=
 =?utf-8?B?Z29Xem4zV2pkak1ld1lwTEdKaC9wLzNXYktQUVFvQ2hzMlNXVVorOTdmZVhP?=
 =?utf-8?B?MjM5YVNDSzlUd1AxTTVwM203SnZJU25PbDRNTVlSdmppTFd3MzlBZGlzaVpE?=
 =?utf-8?B?dGJUcDN2Y3VWZE1mRk1LZ0dBek1mKzVFK1JTQ1d5aVpHbi9BYzVjZHNocDdq?=
 =?utf-8?B?QXdPR2NidkRCbzVoYjZ2WXhoZFlWRG9xQ1JycUZUeU1Ucm1hTVNHaWhSUUg0?=
 =?utf-8?B?Q1N4YzNFOFJBSTZKWnBUcVNkT04zRDhENiswWWI3YUpoZVpVeFVSanY1SEU1?=
 =?utf-8?B?TmdPamYvYnRJY2tSY0ZodXFPbEdFak00Q1g4V1NMM2oreG9wZ3FPWWJZUjVh?=
 =?utf-8?B?Q3VIbTU0THpndE1nWVA3ZTNXK3JtQmVIWDk0MUxua3VoQ1E1ZmM0RnRGaVNT?=
 =?utf-8?B?dzJkZlBXL3FZZUpGVi9sSC8wZXh0MURrQ3V0My85Si9odjQyWUs3ZWZxbXNK?=
 =?utf-8?B?ZlRYYkR3bGZRU2ZFZHFGOE5oenhzWnRGNUwveWtVYjVjeUtWT1VBMEg1Mldl?=
 =?utf-8?B?Z3hwQTdaZnZ4RElrUnl3Z3VtTXkzUEh5d0NIVFl1d1o5eFFGeDVXQkpNTk04?=
 =?utf-8?B?WDU2MFhLbk9RPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11492.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?c0RVMkFOTWJ5Q3hMUmdVeVdpdkdMdU5RRGJmaUJwTHBUcDRDQzl3NmRoeEJl?=
 =?utf-8?B?WlNKTk4wcUJ0NHp6K2pKTU9Hc1VGRmk2eWZjcGUzYTk3Z2EyK2duSnV4SnZj?=
 =?utf-8?B?Rll4bjNCT1NEcVdLUXViR2JKek9mYUR2TDZBNXYyelh0TXdIVThwbTZzTWZu?=
 =?utf-8?B?eENJUVlFQVFHSG9NMWJRcVduY2ZSNHIvRFVOSG91YnU5a3J3UXdOSVp0Mmx0?=
 =?utf-8?B?ZTlqcFNkMzBkajVzalZybGNnVWFpZy81V2VrNmJxbVhHa3pGemdjbGRjYWtk?=
 =?utf-8?B?cDU2cW9BdStSaGJZdVZGWk4rcnZ2N3k0azZLclZTUHVTclFhNFRIbGFkTjJt?=
 =?utf-8?B?UGR6aTlmZWJUMVVmRUdiajgzVUNob0Z6NklsWHJ4bGVMVjBwS016WkFsWEVN?=
 =?utf-8?B?SHROZXpaTnVqN1V0dlQzWFF4ZU1FeXNVbDBkS0s5ZmN3Q3hUWnpVYXp3Wk9t?=
 =?utf-8?B?YXZBS1hJTXVqS1VadFpKbys3aXlHd09PeWRqczh6RmN5MkUzeFVaZnIyUFAz?=
 =?utf-8?B?TVhRRktSMnBtREUzSmxiUHo1R0pISW1qVzVRMW9yRXl5T2RRQms3VlF0bnJI?=
 =?utf-8?B?MHA2eWRNRGFVbDVEekNKZGJoMCt6SkhXamxSL3MyUEhGMnQ0M1c1SG4weGlG?=
 =?utf-8?B?cVE3ZUxsbGVwY1ppaVYwODl6eUV0Z3RuSlN1a0F6NWJVWWFrV00yOWpsRWEw?=
 =?utf-8?B?Nk5sU0pmN1ltQU5XdUVkQmxGMXByb2xpNmJNYW5DUmREeVozQUs2cTZJWkpa?=
 =?utf-8?B?S0VmV1BqN2QxRStpUW9GUDJYRmhiQWpNblRlT2dZS05ybkdITVd2ZnFJN3RQ?=
 =?utf-8?B?V0pJOXNTNjQ5MS9QYUw0dUFRMVpRQi96SkNJYW5xOGtWaXc2VmhSV2dGOUZI?=
 =?utf-8?B?V0RXYjNTendGSkx3RktQem5ra1o2SE5NU25WV0hhMlgyN1k4amVWZWpVYlIw?=
 =?utf-8?B?WTB3cTFZMUlGUU5wOFZFT3JiRHRaRWgxb1BTQXBhemF2TkVtUlB4TjNWOXdF?=
 =?utf-8?B?elB5WEdBMEJmSlB4Z2QvVmhEUlo5R0R5eUN1blFVMzBLYlJNZmlCdDFiN2Z6?=
 =?utf-8?B?RzE5ZGRmanZpeXprczBjakl0aXlJNnhBR0pmQjZjV01qNGZheXJHRGxncjdr?=
 =?utf-8?B?cGgzOGQrWTBQMjAyRktwa2JRRVJSWFpXOGlBVGZLYzlkSUo5WURzekRlQ3Yx?=
 =?utf-8?B?MUcxWkhmY3B2dFF3S2VFYUszSnd6OXEreWh1ZjdhM3JTQ1c4NXZqdk9JczJV?=
 =?utf-8?B?Uk1CeFJxQnYwOURPSFVkVlhwTlVpU0lpTDRrbkM4NlUwQ1BZc1NQMnR1TTI1?=
 =?utf-8?B?SGg4WnhsdUoyV0tHb1RwWEdGS2dQNVo4bVRXVzlqU2hnRUNLNnpMWmZMYjdZ?=
 =?utf-8?B?eHNrQUdRaHNlL2xhTklKbVB2bWpCcTFWak50M1habWFrcXFjbHdEempBOVBp?=
 =?utf-8?B?U0xpMWlwcmg0YmtZejZWWW12VEh5V1puSzZIMVZNYUhJWXlOVEl0Zk5ZRFhz?=
 =?utf-8?B?eml0YnE0NHZUbXk2TldDbDNqeDB6MEd4MHppZmh3RWt5eGM5N0YySlRjWUgv?=
 =?utf-8?B?ajVKQUxaWjNESnhRRHNNTnFEMnhhVUNTbWFRSU9oeTVqb1hpcGQ4dVBUQWVK?=
 =?utf-8?B?QTc3SkZySExBZ1F3VGRrblZSWi9EYStHcytHSDI5SUI1bXczTCtmeGJvSERV?=
 =?utf-8?B?MURPMmRabnA0OUVuOG8rV252WjlBVjNtTWpybnhqOUdhazlGNUMrcmVOeUFh?=
 =?utf-8?B?ZERremN6em1WbSs5VEtBM1J4WHU2V2pCZGhORXM3S1hPS05TUTVEN1dublNG?=
 =?utf-8?B?OXJ0RGZscjFaZEtWeDAvWVlHNktFUzFqOWhuNVpxK1A5R0pXODE0aDdyRFAx?=
 =?utf-8?B?WnBQUWVkMWZ0T1Fjb0xPeUx3aTRZVmxsWXBqeUpLVzM0bGdGaVVSRFNWVFV5?=
 =?utf-8?B?ZzZjKzR3bW91STh3NWEvcXRxWGUyZjhUM3JwWnorTUpFMUYvK2RNZ3oyWE9s?=
 =?utf-8?B?bG1QbmpHS2d5V0VVV2kvY2FYM1ViQUtaR2M4Z3lXTC8rVVJMRkE3RUd0VnhW?=
 =?utf-8?B?OGEySC9aMGthWGM0M096Mk9YdnkxRk5wdGpGbWswMVRscVQwVFNaZDVvYkdi?=
 =?utf-8?B?ZzJlM1RqQmNhdVBPY0ZWendyaW1pWUFUSGphK3BkakRRRlk4MXJHNzg3ZFpa?=
 =?utf-8?B?T3c9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: d45d0597-0eb0-4d1b-e96a-08dd823999bd
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Apr 2025 07:36:46.0059
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Rr8AxtfWg2qU+kFOB+ggFPn3o9xV3W8VP1TUsIw9fcwaY7y7zjo54PciErRfB5ww/X4ThlLNQaVSW+yZB2e4UvPToQx9UesrwAZUuw8+cg/NsFM4JSzvPGFOjgphaJ70
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9759

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VlcnQgVXl0dGVyaG9l
dmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4gU2VudDogbWVyY3JlZGkgMjMgYXZyaWwgMjAy
NSAwOToxOQ0KPiBUbzogVGhpZXJyeSBCdWx0ZWwgPHRoaWVycnkuYnVsdGVsLnloQGJwLnJlbmVz
YXMuY29tPg0KPiBDYzogdGhpZXJyeS5idWx0ZWxAbGluYXRzZWEuZnI7IGxpbnV4LXJlbmVzYXMt
c29jQHZnZXIua2VybmVsLm9yZzsgUGF1bA0KPiBCYXJrZXIgPHBhdWwuYmFya2VyLmN0QGJwLnJl
bmVzYXMuY29tPjsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsNCj4gbGludXgtY2xrQHZn
ZXIua2VybmVsLm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY3IDA2LzEzXSBjbGs6IHJlbmVz
YXM6IEFkZCBzdXBwb3J0IGZvciBSOUEwOUcwNzcgU29DDQo+IA0KPiBIaSBUaGllcnJ5LA0KDQoN
CkhpIEdlZXJ0LA0KPiANCj4gT24gRnJpLCAxOCBBcHIgMjAyNSBhdCAyMzoyMiwgVGhpZXJyeSBC
dWx0ZWwNCj4gPHRoaWVycnkuYnVsdGVsLnloQGJwLnJlbmVzYXMuY29tPiB3cm90ZToNCj4gID4g
K307DQo+ID4gPiA+ICsNCj4gPiA+ID4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgbXNzcl9tb2RfY2xr
IHI5YTA5ZzA3N19tb2RfY2xrc1tdIF9faW5pdGNvbnN0ID0NCj4gew0KPiA+ID4gPiArICAgICAg
IERFRl9NT0QoInNjaTAiLCAxMDgsIFI5QTA5RzA3N19QQ0xLTSksDQo+ID4gPg0KPiA+ID4gU2hv
dWxkbid0IHRoYXQgYmUgOCBpbnN0ZWFkIG9mIDEwOD8NCj4gPiA+IFVzaW5nIFI5QTA5RzA3N19Q
Q0xLTSBhcyB0aGUgcGFyZW50IGlzIGEgdGVtcG9yYXJ5IHNpbXBsaWZpY2F0aW9uLA0KPiByaWdo
dD8NCj4gPg0KPiA+IEkgYW0gcHJvYmFibHkgbWlzc2luZyBzb21ldGhpbmcsIGlzbuKAmXQgUENL
TUwgYWN0dWFsbHkgdGhlIHBhcmVudCBjbG9jayA/DQo+IA0KPiBBY2NvcmRpbmcgdG8gRmlndXJl
IDcuMSAoIkJsb2NrIGRpYWdyYW0gb2YgY2xvY2sgZ2VuZXJhdGlvbiBjaXJjdWl0IiksIGl0DQo+
IGlzIFBDTEtTQ0kwLCB3aGljaCBjYW4gYmUgc3dpdGNoZWQgdG8gUENMS00uICBJIGd1ZXNzIHRo
YXQgaXMgdGhlIGRlZmF1bHQsDQo+IGhlbmNlIG15ICJ0ZW1wb3Jhcnkgc2ltcGxpZmljYXRpb24i
IHF1ZXN0aW9uLg0KPiANCj4gQXMgdGhlIGFjdHVhbCBzd2l0Y2hpbmcgaXMgY29udHJvbGxlZCB0
aHJvdWdoIHRoZSBTQ0kncyBDQ1IzIHJlZ2lzdGVyLCB0aGUNCj4gU0NJIGJsb2NrIHNob3VsZCBo
YXZlIHR3byBjbG9jayBpbnB1dHMgaW4gRFQgKFBDTEtNIGFuZCBQQ0xLU0NJbiksIGFuZA0KPiB0
aHVzIHRoZSBEVCBiaW5kaW5ncyBzaG91bGQgYmUgYW1lbmRlZC4gIFNlZSBhbHNvIEZpZ3VyZSAz
My4xICgiU0NJIGJsb2NrDQo+IGRpYWdyYW0iKS4NCj4gDQoNClRoYW5rcyBmb3IgY2xhcmlmeWlu
Zy4NCkluZGVlZCwgdGhpcyBpcyB0aGUgZGVmYXVsdCBzZXR0aW5nIChhbmQgdGhlIG9uZSB3ZSBo
YXZlIGF0IHRoaXMgc3RhZ2UpLg0KSSB0aGluayB0aGF0IHN1cHBvcnQgZm9yIFBDTEtTQ0luIGNh
biBiZSBhZGRlZCBhdCB0aGUgdGltZSB3ZSBzdXBwb3J0DQpiYXVkcmF0ZSBzZXR0aW5nLg0KDQpU
aGllcnJ5DQoNCj4gR3J7b2V0amUsZWV0aW5nfXMsDQo+IA0KPiAgICAgICAgICAgICAgICAgICAg
ICAgICBHZWVydA0KPiANCj4gLS0NCj4gR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90
cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC0NCj4gbTY4ay5vcmcNCj4gDQo+
IEluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwg
bXlzZWxmIGEgaGFja2VyLg0KPiBCdXQgd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJ
IGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcNCj4gbGlrZSB0aGF0Lg0KPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzDQo=

