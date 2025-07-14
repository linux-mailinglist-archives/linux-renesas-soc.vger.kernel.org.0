Return-Path: <linux-renesas-soc+bounces-19539-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E5ACB03873
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Jul 2025 09:56:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B58187A7718
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Jul 2025 07:54:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58D1F238176;
	Mon, 14 Jul 2025 07:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="UFfaGyHj"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010043.outbound.protection.outlook.com [52.101.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C4E5233723;
	Mon, 14 Jul 2025 07:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752479764; cv=fail; b=Vad0Ov4PpicRbTEOfdOu3ximqneGbomfA11v6VNtLMBIg4p4zrKZHw3MRrp1HWQdshj2eoGkcEVWckK055JkgthdHCvXKvRagdgWLaHU4zpoKxck3N4PwMZYrCvPzsErHAThacPDQrCU0xS0sYoiWl4Vaae3aNB3LNY1OPtrGXI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752479764; c=relaxed/simple;
	bh=jbjTHRCI0Xta10m/VQ3+0yFnQ9vg7pq0tn5tymafIqo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=fpqdHcFdY5LLk1koEKMbXmh8DWHOJWLCPxAkx+Pa3XnaSNQQx5MvifqrgMOMnu8PVIkVYgJaGZtMcVYb+eoS6oTF0SBx8rnsJCk3wkDA4mRg6VRp8paV0SyMDYJrrhlsqNwOx41ypi0hxiXxdWapQI2jZTlLHAQZtomyAZWbn0w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=UFfaGyHj; arc=fail smtp.client-ip=52.101.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VZSBby3XqHmDHoXgd0PozpuUucLK4QUJzVReqvuX6OVvz1YcwpRbBmP7WlXnL4Y7wIQBVMTC+HtJxtOTHwR2BCY28IZdN6ZRkz5LeoPZnYNRUH5W272tUvrhy+kAOz2AdQLXRtwjX3ZEWlHhKHFOSCpIQ8//l7UV/rRXjIwa4wfY/S12uTCmX/iHwmu/LP15SUuEUEkWmx09TDj2fqWO9i5o470edHTjQgxTX/iAMpUIbG+iluRniZqP2qypVjKHQEMCqBUkEt05AkMEscqVQdog3a5Xza8/+hNwf6T8YQELQh0aDWgjbKc9i7FCgPmiSNfsSrtEmi5+dqrhzIqLyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jbjTHRCI0Xta10m/VQ3+0yFnQ9vg7pq0tn5tymafIqo=;
 b=KIM12wxdNTfh6LWgbElpAL/vOjsvrhpTFZERX4GRW3TbSvxWxdOQav8L6z7YdiGcuvmPEyi601ovoXiPvqLpg8ZQEy1c6fk+hNHqWLSBVEqsiP7GcHckcjYp4gjVU8WcDQPNaf7jAzB9iXxE4DWsbB4nQwMM+ry2fv1pzEDXFt2kLpb95yQv9npoT9yxF0Q5XOIiJ6mVjny4Z3Ns04vNIQoQQFgE/CQdk0TOnIsxZR9uhWkaJOxl0xIgwh/glvEwmS98SiO+5ONdUaegKLbc9tZeJ5Y8VQWPHoq/WcoFZiBDBdx15sXUjq+3sg13bllAA/RZYG+Mqbjo/dHAnYBDQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jbjTHRCI0Xta10m/VQ3+0yFnQ9vg7pq0tn5tymafIqo=;
 b=UFfaGyHjh9tXDd57FIY7ujuilBlVWz+Ow6t11X38eOSI9BIGiE5lwTC5wkBphK4V6k37qRzFnRoo1p3KiSCEMoqdYg/qGw5VXYLLTMFhNz/CaZ54TxQu1mlHXjveOqZeEx7VkRcptpwLE8rAJ7eAMP4vhlDMW0a078SVM441uZQ=
Received: from TYCPR01MB11040.jpnprd01.prod.outlook.com (2603:1096:400:3a7::6)
 by TY3PR01MB11984.jpnprd01.prod.outlook.com (2603:1096:400:40d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Mon, 14 Jul
 2025 07:55:55 +0000
Received: from TYCPR01MB11040.jpnprd01.prod.outlook.com
 ([fe80::b183:a30f:c95f:a155]) by TYCPR01MB11040.jpnprd01.prod.outlook.com
 ([fe80::b183:a30f:c95f:a155%4]) with mapi id 15.20.8922.025; Mon, 14 Jul 2025
 07:55:54 +0000
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Michael Dege <michael.dege@renesas.com>,
	=?utf-8?B?TmlrbGFzIFPDtmRlcmx1bmQ=?= <niklas.soderlund@ragnatech.se>, Paul
 Barker <paul@pbarker.dev>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
CC: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Michael Dege
	<michael.dege@renesas.com>, Nikita Yushchenko
	<nikita.yoush@cogentembedded.com>, Andrew Lunn <andrew@lunn.ch>,
	=?utf-8?B?TmlrbGFzIFPDtmRlcmx1bmQ=?= <niklas.soderlund+renesas@ragnatech.se>
Subject: RE: [PATCH v3 1/4] net: renesas: rswitch: rename rswitch.c to
 rswitch_main.c
Thread-Topic: [PATCH v3 1/4] net: renesas: rswitch: rename rswitch.c to
 rswitch_main.c
Thread-Index: AQHb8ZaXMqs2RqTq10a1yrM1qIN6W7QxRP4w
Date: Mon, 14 Jul 2025 07:55:54 +0000
Message-ID:
 <TYCPR01MB11040B37CC8F15CF82B75315FD854A@TYCPR01MB11040.jpnprd01.prod.outlook.com>
References: <20250710-add_l2_switching-v3-0-c0a328327b43@renesas.com>
 <20250710-add_l2_switching-v3-1-c0a328327b43@renesas.com>
In-Reply-To: <20250710-add_l2_switching-v3-1-c0a328327b43@renesas.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11040:EE_|TY3PR01MB11984:EE_
x-ms-office365-filtering-correlation-id: 84a0cfb8-0719-4558-f9ab-08ddc2abdc64
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|10070799003|1800799024|366016|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?RE8rTUQ0QWxSVUh1cGpTQm5mZHlDbEc3R2hUUWhwQzM5SDV0Rm5rZW9jS01F?=
 =?utf-8?B?ejVUK0h2U09jakY1VU9EcFA2RkFLVTdhZU8xTXFpRUExZzY3QzdUTERaZi9J?=
 =?utf-8?B?VkMzUkx4REtjUDExMXRyZFkwNUplK3ovcjltN2dQMHpvcE1TK2Q3WmlZVHJt?=
 =?utf-8?B?QXd6cVkzZmVLODVqVFRNZG1IZVZTTW1YMlJ2N3FTVkxLVldPU0hTUW55V2hr?=
 =?utf-8?B?NW1LaXM3ZWJtU2lIL1lpcFoxMnZrUFVscVBlb1ZabzNxalpDVExsS25YWk9a?=
 =?utf-8?B?NFpzVnltOVltNDFnelRRTDRTV3VQeEVlMUYwWmgxSk5TTjRKWXFhVnRkOWR4?=
 =?utf-8?B?SFhqbFZqMWFtMEI2OTdJZ2h4WVo5dkpxREJ1OXJYakJzVWxodS94NHZ2cEEz?=
 =?utf-8?B?TXlPcG9oU0ZMRkVrcU40bkgxVUxpTVJJcFdVUUdDNkJmUTI3YkhRbnBaeHAr?=
 =?utf-8?B?aVNtb0Y3bU5penlLNGNoWHBXTi82VE1XYmg0Z2VSM0p0VCt3WC9wYXF2UjVK?=
 =?utf-8?B?VTg5RTFrMEw4M01uL3lha0VnQUZnSnRmcmJaZjVxR0FWUTEwcW1TQ2MvQmFX?=
 =?utf-8?B?ZGVCOUlKYzVTZ0h4K0dkZS9DYzNnd214cHZOWk4wTVFObU1EdnVOU2Vsbzkv?=
 =?utf-8?B?cUlCRllhYUs5VVRaUml0WFpjTi83aE9PN05Ma0RpeW9wZ0ZXVmVIekkrcFBi?=
 =?utf-8?B?eHlKMXVZS05yL2hQOUs0RWMwOWlmS3RHWFM1cGEyN0JoZzFUb0JRSXpCcHZX?=
 =?utf-8?B?R3lYdXlGM3k3UzZLOVh3V3hmbUh3WmVZRlZ3ZHlqdEpkYVMwOXBwTVBKMjJp?=
 =?utf-8?B?Z1ZaaXFzNzJTSlR3THN6ZnQrdkNXWE1MK21MdHAwZ090WFplWnFGWVdwd3hJ?=
 =?utf-8?B?bUhlaUpmcCszVFdra01ZNWVGejN5TTZqSHF2QVBoQ2dUN29SL2xOTVEwZXJQ?=
 =?utf-8?B?eVIrdUJNc09BbkZaVWdrRkkyNHVIbDdaaTR3NWVuNFdhekdCS0RnbU1BR1NI?=
 =?utf-8?B?YVBWNEtBNjBtcVhHenBDSnVycEZmSDJNc0ZpYldzQmtFdXhFMi9vTzhjbEpL?=
 =?utf-8?B?WUJBc0xUdzl4OWFlbHkyTkQ1UGQybjRvQURHOERMbys1M0YydFZrL2FVZy93?=
 =?utf-8?B?WHBVaFVjQ1lpd0RSb05tRzA1cHVsWUhuSWhqYnNVVlRUK2VGM0h1TERoYzha?=
 =?utf-8?B?NjRSdDhHS2NsckhZSnlFekJGR2VVUU9Yck1jVzB2amJxc0s4S0FjbmV3V2pZ?=
 =?utf-8?B?cXpseUxzR2I1VEpXcjZkcW5acmY4bEtEbFlxMjZ4ZDd0dm4ra1hCa01OZHJk?=
 =?utf-8?B?MU9NYWFHSDZkUEFaZXh6bkNyRFM3TzJMeXB1RXNDNk1WeDRXRjBqaG1UenlG?=
 =?utf-8?B?dFJwM2FlUW5ycDBGQWVIaXpOK2h5NVAveDNiaEtqaEU5OVRVbmVSZUQwcmNm?=
 =?utf-8?B?dkVySXZkVXZKWWNqNWpDenpJbzhiV0JsVDNhMTdUWElXN2tpT0EvTFBXMFVC?=
 =?utf-8?B?WjIxanlnMTBhWjBJQ1daUnBZdzJZc3BSVWtlN3gxSDR6MEQ0R3RQV1Y3REc0?=
 =?utf-8?B?YXJRcnVjamhBOEVOdllhUllsWHVZT0RsdVRiUzdJSUVTdXJUUmpQVFFBQXZ0?=
 =?utf-8?B?R2lObGpRclVFTTZBaGFWMTI0SDVqdDNuWTQ4QXU1MVFKalpGZFZjQ3ZzV2k2?=
 =?utf-8?B?UU91ZXZUaExhcW80b29wTzRKeTRWbHhQaXYvWFE3YktiTGUxcHpkQkNCdlJh?=
 =?utf-8?B?aGZtRlUwSG9sWTJUeXprMG1DSHEwQ015SlV6VHA3Qml2ZWcycXhjWUFVNy9C?=
 =?utf-8?B?dWhxMFUrTlF1UEdCTmFIeUV3WndRRUViQW9HM2JVYWJqS3FDeUJGd2xvRHdi?=
 =?utf-8?B?UHNQeG5tSTg3dDZJaHI5aHlCNW8xRDM2OXdEaHZMMGhwcFVlVVQrellOUG5T?=
 =?utf-8?B?d3JBbXlXTmhYd09DZ21pSFJ3WUtOOFNPbXZzbWZOSDh0cnZYRVRvc0E1L1R3?=
 =?utf-8?B?YmpOajRPQ0xRPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11040.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Y0puU2VFTnd6T3Rzcm5BbHI1K2Jtb0NrS3pKbDN5Z2tDbnJORWUrcU5jZXNn?=
 =?utf-8?B?QVFNVlphTlNFQndUMVdVdzl3RzRvR0ZUYWljZHp6NFNPeWgxS3dLRXBkUDZX?=
 =?utf-8?B?VFc4M3c1WnZiYzBkbnFWZFJIUDdYdlg4T20vSy95NURUNG41TDY0aDBLMG1v?=
 =?utf-8?B?QW01Y3RORCtTdnN5YjBnWGVRMTdrT0NFaDBxemVHOHl4NU1BRjRNRnRYS3hp?=
 =?utf-8?B?YUo5VGJHbDRWb1E4eXhmRll4c3g0V3NCVmhwcjQzNmVSRE03ajlJdGZXRHZP?=
 =?utf-8?B?cnMwN0FpQVhwSElRaWJ5V0lYVFpJWDNsOUlvSGcyQnBjYThWZGpoWFBuUVF1?=
 =?utf-8?B?MW9kNXlOVFlSbGxJNGxoV2VJVENqVGNQMFVMT0VNeCt5OFg2NzJ3TFZOSTIw?=
 =?utf-8?B?amxScmVpUmw3UEU5YWZ3T01leUx5VkZFRmpLMm5DeXBHNWM4cEZYTU1DSytT?=
 =?utf-8?B?YW4zTkRnYjhKRVlLaFlCOTNtOHFLRGpwSkFVWmwzMEtGS20xUjFCQVY3WmJB?=
 =?utf-8?B?T2VFbTlxR2M3dEUxbnhEclM5R1pUTjY1cmdrZENtSE1XMzVUc1djSWlIYSth?=
 =?utf-8?B?ZzdNYXBONVdKeW9lVWI4OVpKR29rR0xPQ3o5N3FhRnFMbElMc01ndG83Y0po?=
 =?utf-8?B?Mkc3S21Fc3A5V2luS0dHYUJMZDRxbHVucTd0cWpDbnNvS095Y3czbVFqeDVw?=
 =?utf-8?B?bXRpNnV2Y3FwajZBV0hmdERlSnBQcm5CK1FDRlErb3dwMEtDL0EwQklzS1ha?=
 =?utf-8?B?R05kVjBPQmhHczExNEVxemNaWVhwVFUxVVRpYkNnUWRpRFFMQkszdHRtdUc4?=
 =?utf-8?B?VUlWaUdOcTJyL2FIQTNrNkl5Y1JIY2ZTdVUrTTVHNzVWSHBWMW42dE1CQmU4?=
 =?utf-8?B?djF1OGNEY3BTU1lrUkJXWit1NzZQUWt2dzJuZnFjMHJRa3c5M1BjYXNoSDdt?=
 =?utf-8?B?dFArZGlhWW42VDA0U0tQUnQ0cXVPclg3cFhDcytLcFR5TmJFa3ppYm13V1di?=
 =?utf-8?B?NHdEM2JtVy9VUEJpZUhvS3U0Uzg5U05vQXU5M016eG5qMW9EcE9JbTdJZFYr?=
 =?utf-8?B?c01ZNi9nOE5LWTFIVW1WL1h4NVNVUmNiMHFkdUxkdEYwcGJzTTEyemFzazdD?=
 =?utf-8?B?N3pvU2tWZExYTFFkY0Y3UWtnYXB6RWtEN29rRGxtems5N1NPN0k1MXBvS2cv?=
 =?utf-8?B?Z3U1UzVDSXdUU1p3OHIvUFZCTFdzSWNFekFYakRCWXdOYUtPSFFCbEc5Y2t0?=
 =?utf-8?B?ZEU0MHBHd1lMekdZQllOWXFFeFE2Nmg2V0NSMjdOdU9NMEVRUUZtMWRkQVl6?=
 =?utf-8?B?a3plZ3ZrUUg4ZS9jK2lSekpLTjJlWVRkSEtBZ25qUnZmcXRxV2J1YjVWbStE?=
 =?utf-8?B?RUFGMWVkd293WmF4ZVR0WVduNHJqUmU2UkEyOHRpdkloVlE3NlFJRW5KSVoz?=
 =?utf-8?B?S1FwZGFIejFIajcyVU9QYlFPTVV0UUIwNnZxQUp6RlNSU09nbExqTDRIR1FC?=
 =?utf-8?B?V0Y4dkJpSVdwZ2JXcS8xWEdvVmlyQWlxMTIvQVFwRTQ1YnUvWU1tbGtXd01x?=
 =?utf-8?B?R0pSN1I5Y0duREF0ZjczbDhiampTcnZqTzJOTEJpS3BvbW5PdzZ5aWJFTzE3?=
 =?utf-8?B?WHZleE1uOVVPakc1WmdPMWNCWWhaaVFIZzUzMVNRU2kxNU1xd3NOKzB1UWV0?=
 =?utf-8?B?NjNXbXBhQ3dtUWZ3aERkd25EL2JBTmNxN2hMaitWRUgvaTBIRFhuamt4VW5K?=
 =?utf-8?B?U1BiTlVJZzg3NmVvek5tOSs1UGFKYkZqcUZ2VGIrMnM0NlJxRTQvRC9ubDlG?=
 =?utf-8?B?SEFGNFo4dGdyMWdNOFc3TSt6WDNSNEl1Z3dwdE9zQVRlRUtsYm1iVEFDZWl4?=
 =?utf-8?B?N09jSVVVS0RKdWRha1NGUXdLTFZRYXM0QVBkWHI1ZlNRZHJXSnVzRmxjb3RC?=
 =?utf-8?B?bzNpNVBieUJWeFBFN3Z5VzBydkMrNHhWSVdkcXppVjdpYkdtWHZ3THcwbHd0?=
 =?utf-8?B?Z0JOTVl3akRYc052U0xUd3dFbjhDemxKb01QaitZVkh0NXdqYXVGVmcrdUc5?=
 =?utf-8?B?S2xCNlBlY25JOWxyV1Irbi9DQzliR21hMW91RFhmZWZRcGliTmU2ZFp2dG0z?=
 =?utf-8?B?Vit4ZW1DczdUdWZxdEloVWFMejZBNlJhV0xFdk84Vjk0dm1MYkNiRWI5Z0Nz?=
 =?utf-8?B?Wm03a1Y4N2poenhEeE5wNFYwUElvR0xPNlFvY2licHcwUHRCUXFMNm5yWCtD?=
 =?utf-8?B?TGRhOXJYNmt3cjd5UnBaeW1UR093PT0=?=
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
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11040.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84a0cfb8-0719-4558-f9ab-08ddc2abdc64
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jul 2025 07:55:54.9185
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WMtZo2cl8g38/9ZhC0uTsH7YubzuSp3oqWLtBwPH7z4vJPZrsaATiDh2oqElDH9RxE3TYiolk4FOuc4IqVXLbZ1XInZ3WNnQdJ6bbF/0DzjyBjR56SmFZRQe+lzGBW83
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11984

SGVsbG8gTWljaGFlbC1zYW4sDQoNCj4gRnJvbTogTWljaGFlbCBEZWdlLCBTZW50OiBUaHVyc2Rh
eSwgSnVseSAxMCwgMjAyNSA5OjMxIFBNDQo+IA0KPiBBZGRpbmcgbmV3IGZ1bmN0aW9uYWxpdHkg
dG8gdGhlIGRyaXZlci4gVGhlcmVmb3JlIHNwbGl0dGluZyBpbnRvIG11bHRpcGxlDQo+IGMgZmls
ZXMgdG8ga2VlcCB0aGVtIG1hbmFnZWFibGUuIE5ldyBmdW5jdGlvbmFsaXR5IHdpbGwgYmUgYWRk
ZWQgdG8NCj4gc2VwYXJhdGUgZmlsZXMuDQo+IA0KPiBSZXZpZXdlZC1ieTogQW5kcmV3IEx1bm4g
PGFuZHJld0BsdW5uLmNoPg0KPiBSZXZpZXdlZC1ieTogTmlrbGFzIFPDtmRlcmx1bmQgPG5pa2xh
cy5zb2Rlcmx1bmQrcmVuZXNhc0ByYWduYXRlY2guc2U+DQoNCkkgdGhpbmsgdGhhdCB0aGVzZSBS
ZXZpZXdlZC1ieTogdGFncyBzaG91bGQgYmUgcGxhY2VkIGFmdGVyIHlvdXIgU2lnbmVkLW9mZi1i
eQ0KYmVjYXVzZSB5b3UgZ290IHRoZXNlIHRhZ3MgYWZ0ZXIgeW91IHN1Ym1pdHRlZC4NCg0KPiBT
aWduZWQtb2ZmLWJ5OiBNaWNoYWVsIERlZ2UgPG1pY2hhZWwuZGVnZUByZW5lc2FzLmNvbT4NCg0K
QW55d2F5LCB0aGlzIHBhdGNoIGxvb2tzIGdvb2QgdG8gbWUuDQoNClJldmlld2VkLWJ5OiBZb3No
aWhpcm8gU2hpbW9kYSA8eW9zaGloaXJvLnNoaW1vZGEudWhAcmVuZXNhcy5jb20+DQoNCkJlc3Qg
cmVnYXJkcywNCllvc2hpaGlybyBTaGltb2RhDQoNCj4gLS0tDQo+ICBkcml2ZXJzL25ldC9ldGhl
cm5ldC9yZW5lc2FzL01ha2VmaWxlICAgICAgICAgICAgICAgICAgICAgIHwgMSArDQo+ICBkcml2
ZXJzL25ldC9ldGhlcm5ldC9yZW5lc2FzL3tyc3dpdGNoLmMgPT4gcnN3aXRjaF9tYWluLmN9IHwg
MA0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQ0KPiANCj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvbmV0L2V0aGVybmV0L3JlbmVzYXMvTWFrZWZpbGUgYi9kcml2ZXJzL25ldC9ldGhl
cm5ldC9yZW5lc2FzL01ha2VmaWxlDQo+IGluZGV4IGY2NWZjNzZmOGI0ZGY4ZGQ5ZjI0YWY4MzZi
NmRjMDc3Mjk2NTM2NmYuLjYyMjIyOThiYjU1ODJiNzA5MWNmOGRlNzZhY2I4M2FjN2RkMzljMTEg
MTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L3JlbmVzYXMvTWFrZWZpbGUNCj4g
KysrIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvcmVuZXNhcy9NYWtlZmlsZQ0KPiBAQCAtOCw2ICs4
LDcgQEAgb2JqLSQoQ09ORklHX1NIX0VUSCkgKz0gc2hfZXRoLm8NCj4gIHJhdmItb2JqcyA6PSBy
YXZiX21haW4ubyByYXZiX3B0cC5vDQo+ICBvYmotJChDT05GSUdfUkFWQikgKz0gcmF2Yi5vDQo+
IA0KPiArcnN3aXRjaC1vYmpzIDo9IHJzd2l0Y2hfbWFpbi5vDQo+ICBvYmotJChDT05GSUdfUkVO
RVNBU19FVEhFUl9TV0lUQ0gpICs9IHJzd2l0Y2gubw0KPiANCj4gIG9iai0kKENPTkZJR19SRU5F
U0FTX0dFTjRfUFRQKSArPSByY2FyX2dlbjRfcHRwLm8NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
bmV0L2V0aGVybmV0L3JlbmVzYXMvcnN3aXRjaC5jIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvcmVu
ZXNhcy9yc3dpdGNoX21haW4uYw0KPiBzaW1pbGFyaXR5IGluZGV4IDEwMCUNCj4gcmVuYW1lIGZy
b20gZHJpdmVycy9uZXQvZXRoZXJuZXQvcmVuZXNhcy9yc3dpdGNoLmMNCj4gcmVuYW1lIHRvIGRy
aXZlcnMvbmV0L2V0aGVybmV0L3JlbmVzYXMvcnN3aXRjaF9tYWluLmMNCj4gDQo+IC0tDQo+IDIu
NDkuMA0KDQo=

