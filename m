Return-Path: <linux-renesas-soc+bounces-25434-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06105C972AC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 01 Dec 2025 13:01:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5A22B3A1CAC
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  1 Dec 2025 12:01:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 777752F1FF5;
	Mon,  1 Dec 2025 12:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="cFDu+qTw";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="cFDu+qTw"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11022089.outbound.protection.outlook.com [52.101.66.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E6902550CC;
	Mon,  1 Dec 2025 12:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.89
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764590491; cv=fail; b=R/TXqzIu5q2laymmLBQQjG/o46n0mJH5dMuT/M9dgNmaeP7I4weXOCtF3rUzN2CaLqWLKgectemHaaNHvE+i3k4RkFgXIGF8rSJ5Z9m4GWNE+iyGgFy+OwzT26kP0SThltse1V6Y0Z9rQhmXIrvlXDao1WsyTMdHlBnDXqZdl8w=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764590491; c=relaxed/simple;
	bh=N3rwfiYqhv0+gq+l0CJUnd/SYMWlWDSKC8Z+bGiGh08=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ZuvgKSSxgGSwEBFJ6I5JqC+d8luI2s69dU+UKnnntEcRdrWpVEU3JbPdRq6dR0xEWzw4m7GzlnVMg9sB4df6HE1nR68jsxVH/ODWQfINiirBxrGOxYNH0DWe53lPwSaKKY3QLmfkfwsJQmHFMjxbTk4TOB/cznUwiK/KHN2mpm0=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=cFDu+qTw; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=cFDu+qTw; arc=fail smtp.client-ip=52.101.66.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=A4HH3KjkYTBOvS0DTntIdVRIg+0cCeYGNgjCmzU/Vy+A3diAZDx+2/1OEm/o7GkWPgkd1hqwFdNgAuJA9Vv3l70qVUTGGh1VNfyaO+4ZouyRx+6bDlCAhAQ/IRq4bCSqgEBnQDb41dyp8YuZ1Oxo3RDbu/Hay0cWGGLS99SQy14FA6VhFl5o8crP9qzOIXLdr/HMbHsfgsXgWvjOOrabjRDjNfvPNjwb/E3jdgFIA2uX0gYxGbPkuA9TUGlDpDV8VKdEb1pKEzQHKEDAJqOdAhp7CKYG8SWfWMAgJOCwowW8XlNIVRw2+DWEbr91J8jQJGxZG0e9miQXo2f/kND5BQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N3rwfiYqhv0+gq+l0CJUnd/SYMWlWDSKC8Z+bGiGh08=;
 b=YQS6+Z1oo8SA2hxPwxV9J2+EUJCwChaTLI6l8WRSCjhEUF+Z+4IE2DI5sjP3eOsWCDfNqav+8XPHeOk2HKgs5DQBouncU+grfKuey1PqCtVSodgG4wnefZNGBDXJSfaku9lnNaF2h9gRK7XXn+T28rMyWmZjfBddBfjY5W8HYAj9TK2SxQJeM7clVIonhL6RzXgOXusx43DHW9PZsNvWoEHmJ4kmo/DWidJrBoYi8pjPpJ9UlcYEXaEm1kc4YxPogDjmirCOnWNTIu873ZyiVbLre/gMThtG8mzmbBkvtxT6HWfJn0vdqJP2hA63SbEAW6m+uXGdfr0Iwf0qvw+GsQ==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=glider.be smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N3rwfiYqhv0+gq+l0CJUnd/SYMWlWDSKC8Z+bGiGh08=;
 b=cFDu+qTwb5xRqswpIggW/vmo2OpmJLwLQ8vaMjUVjf9mSfLg+uBNld7s+sbKU+iDzv+njBKItc4rn0ZikLa522ycBTWHQ1VhThmRH0skgQ3m9WQ5dQI5YI7n17s4Ydy3XZbigm5p0o5GmfLWV+2eHKfIYfIDThOaEnYLHx4abUU=
Received: from CWLP123CA0254.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:19e::22)
 by VI1PR04MB7133.eurprd04.prod.outlook.com (2603:10a6:800:126::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 12:01:24 +0000
Received: from AMS0EPF000001A4.eurprd05.prod.outlook.com
 (2603:10a6:400:19e:cafe::51) by CWLP123CA0254.outlook.office365.com
 (2603:10a6:400:19e::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Mon,
 1 Dec 2025 12:00:52 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AMS0EPF000001A4.mail.protection.outlook.com (10.167.16.229) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.8
 via Frontend Transport; Mon, 1 Dec 2025 12:01:24 +0000
Received: from emails-798775-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-191.eu-west-1.compute.internal [10.20.5.191])
	by mta-outgoing-dlp-834-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id D599180130;
	Mon,  1 Dec 2025 12:01:23 +0000 (UTC)
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=none header.d=none
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1764590483; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=N3rwfiYqhv0+gq+l0CJUnd/SYMWlWDSKC8Z+bGiGh08=;
 b=ZtO0RnZsKciPZ85nbFtdnrh2MzMxlEnbTJLMadXAl6fWMlGnv1Wtkg8IghB/7XfPuY87U
 4Je+y4Z/hrHD0jV8nMkQKqmtPSrHttYif136jt/TNUkPjWQmIR3DV0Dh6KClaRH4CRPhWeJ
 1SRf2VC1LSy+ezzIwFChVXd0UrTZ7hE=
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1764590483;
 b=mHJA+jE4So4VrIbz1YeZGvCJiu5Urq/QMCj345STV75DvXyiYveKzmeNb2EjyN8hP1eiA
 rvQvwIktzMdnKxr/yWrDTzkwzCtpXXMuGVrg9AM6MD1G3k4KVn/ZNlmMVA/xZTfNOEQdRrZ
 tVt/zFp2NUDhVnNBHR3aJfmWdQofWrQ=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i4gGHkO3mKI9Jwtpqcbboa8lCHz0sYpgllBMSIYLX3Et5ItLZUgDuab3xPuEZOMhE53dzVDfR+YA/LZgcvB7WR/5iSxC+mHaXv8mCwv7lRyQ6SOnlch/25apPqcj0uJQYMkdoahIzRyp0kEUZnGbq8GSAvc8AXW5jsbkIfaHR+077Ba+lXZMN1qgKcyOtl212954l9QRP/33uvomQILMQJlduagbEwqmfj6zxcaNrSb1wfJHWM4wzfjV3uYELxT39LOR1H0C/+GcuksUuwlzvDbGZe35yySz+J8TyB/NtXd4wf3SJxjYeQe/4z7wVJhwX4ATluSoD+7pFAGXpPOJ5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N3rwfiYqhv0+gq+l0CJUnd/SYMWlWDSKC8Z+bGiGh08=;
 b=sE0IiADBBK4S38y0xgNhlCgj3p7lXhi0FY4FVMcqfVCocbXzCv5mX6HO382j1DDIhcrirz9gId8D5uibFYn5z0QRjngADrxNK+hcayNqaWz8/g1ukR5sFRAu9DB7x/gwlsAEqhK+exnmgFAoFrweyObWXYnRtKD2Tti2mz8f5+sEN454Mgg98w21/Jualkji0xrfNGBB0tEtIqV3ZBaBFZL4ui7MWGL3/0wNQAe2oknVYYEZCOWNYSS22KSCKQdqI676fbSQxggEKDJLudeam82cYxaBk0y0jhyHosS8+taf6z1nQZC+IRDmWURXvSFvw025DxT5l+kUXoP8tkZtUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N3rwfiYqhv0+gq+l0CJUnd/SYMWlWDSKC8Z+bGiGh08=;
 b=cFDu+qTwb5xRqswpIggW/vmo2OpmJLwLQ8vaMjUVjf9mSfLg+uBNld7s+sbKU+iDzv+njBKItc4rn0ZikLa522ycBTWHQ1VhThmRH0skgQ3m9WQ5dQI5YI7n17s4Ydy3XZbigm5p0o5GmfLWV+2eHKfIYfIDThOaEnYLHx4abUU=
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by DUZPR04MB9900.eurprd04.prod.outlook.com (2603:10a6:10:4da::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 12:01:12 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6%4]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 12:01:12 +0000
From: Josua Mayer <josua@solid-run.com>
To: Conor Dooley <conor@kernel.org>
CC: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm
	<magnus.damm@gmail.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Mikhail Anikin <mikhail.anikin@solid-run.com>, Yazan Shhady
	<yazan.shhady@solid-run.com>, Jon Nettleton <jon@solid-run.com>,
	"linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: mmc: renesas,sdhi: Add mux-states
 property
Thread-Topic: [PATCH 1/2] dt-bindings: mmc: renesas,sdhi: Add mux-states
 property
Thread-Index: AQHcYIJJKL/cyVts3EOroyH4FLJCO7UIblMAgARFBoA=
Date: Mon, 1 Dec 2025 12:01:12 +0000
Message-ID: <6a392466-3aa3-49df-b96c-de2d272fca18@solid-run.com>
References: <20251128-rz-sdio-mux-v1-0-1ede318d160f@solid-run.com>
 <20251128-rz-sdio-mux-v1-1-1ede318d160f@solid-run.com>
 <20251128-strongbox-craziness-cea572479d17@spud>
In-Reply-To: <20251128-strongbox-craziness-cea572479d17@spud>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-traffictypediagnostic:
	PAXPR04MB8749:EE_|DUZPR04MB9900:EE_|AMS0EPF000001A4:EE_|VI1PR04MB7133:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f4bcab0-5dbc-4093-2d45-08de30d159bf
x-cloud-sec-av-info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?dk5GZjVabG1OTjY4TFBkY1ZuQWVSRjgvMWRBcmVzNHBGbldSV01zN1lJWkhJ?=
 =?utf-8?B?SzVYV3BRcmlaQTFzcEtwN01DWlo1bHRLbUtkMk1qcDllQXRwTWxXOW5QUGxP?=
 =?utf-8?B?aEc4NzhrOThCYlcrNVlmNHZsS2NTV2pWKzN0d1JhbDlXaDFnK1hwQnM0Zjdv?=
 =?utf-8?B?N0dFaDRDNXNtZS9WczNUWjJucVU4cjdvazh3Q1lpSy84NitLWFVlQ01zaTNx?=
 =?utf-8?B?akdaSGVqZUd1MDNXWTRiTWtibEhCMFlBWWRtZlF2aWxoVDlQZ0t3UXFrSEdI?=
 =?utf-8?B?SUlDdlFiSnduU3l5Um9LTzlPZndsZVB5Q21pNUpqNjRzbDdIeWxRRkpNYkdZ?=
 =?utf-8?B?OHI4d05BRkFIaEJ1UjNwYVN5L2RDVmZ6VWtodk1obStVb2FONklQWTN1LzZI?=
 =?utf-8?B?RE04VlI0TnVRL2dzUXdoWVpiQjg5YlU1aU5KQzdJVTlpZFpibUx6RkJISkla?=
 =?utf-8?B?ODQyYStqTWxLVGN6VGZ3Umt5MUtRTDlRUE1QdHk5WFlFUldRVE9lL2k1VHNL?=
 =?utf-8?B?ZXYzN2IybWs2cUhOVGpqbVZpendHK0ZkOVFRSW0rL1V0d2JWWGJoZTFmZEtm?=
 =?utf-8?B?WHE3elRpRkhsa0NoSEI2TXNSRXRrNWZySFRoUjRkbWF6Q3ByK0Nvbk1IOWlv?=
 =?utf-8?B?ZThNemlQN2Z4WVBwMEtXNGRhdXNTUUZ6dmJYUVlYR1ZxMGV6VXMydWlpV1Vq?=
 =?utf-8?B?Vkd4NnF1N3E4RjgyZTNobXdCTHNiOWtjcjRNb2EvdG5weHJlYjRIM3NzR2cr?=
 =?utf-8?B?RmNjbExYQ1B1VVo4TEUvbTd4a0kycWlDQXEyZ2hlcTl2YlVRUUZOd1NzbXNl?=
 =?utf-8?B?MXc4ekcxOEtuc3FxdGdNNDNsQ2JUSEplME5kMVdvTlErRWdkNEx6QlFxam9T?=
 =?utf-8?B?SjEvd2FpV1VmQldPQnNXeDg4SVZHZ2xTNWtxaEFlQ04zSjM0UVhubFJQa0NI?=
 =?utf-8?B?TFBxbVV6cTRnVE83Zi9Ma1o4aWxZWTVDckJjTDVKVms1RmhZTDZtV1EvYXFj?=
 =?utf-8?B?TjkxWXFtdXNPa0xGeHBoUk45cXh6L09RMDBObUNNNWNHemxRaUVod1NqTG1Z?=
 =?utf-8?B?NnhDRTg0YVc4SzFXS2l2amVFR0FmTkIyVS9xQUxKbGFoZHZldGJmUDBkVWZ6?=
 =?utf-8?B?SkVXSlVqcGpzN29mamR3cWRxSXdRT2VuaVBnQllsSllqUEk5NFA1YVFxVTdy?=
 =?utf-8?B?NFRuOVd1UVJuSWRaNUhqTEw0WHdCTDZ4ZDljdElYUnIrZlQ2YXU2QTJxSzFP?=
 =?utf-8?B?ZXRlM1lwaWhCWlFlRG1wVzdYTXFQL3I1a3hEaDV5WElkeEdER1g2R1NDSjFZ?=
 =?utf-8?B?UjFMRzJMcEpoL0xYU2NXL0lQQWg1Uk9Ub2p3bmpRbDd0OWdaTFA2N2Eyc2cx?=
 =?utf-8?B?ZHNnYVBVeHFWcFdUSm5MZXl5OTJFYXRzTGNxc3p5VjNZNWw5aGJ4UkpzQnFv?=
 =?utf-8?B?OWNCZHVLZjkvd0d2dFQ2dUh6bjAwKzdid1dwYUIzeCtYOG9QM1ZzVWxpaHFw?=
 =?utf-8?B?c1RMMmtQVzFvUkIrNVBnQ3Rac004ZjZOcmhNSWZpNEQxTGdnSW5YblArd1pQ?=
 =?utf-8?B?RFN6UXNiV2o1OS9Nc0hhVERieVhWVEgxQ3g1OU1relM5VE5RZXRIZmEzcytN?=
 =?utf-8?B?QzJ2dXRhNktod3FBOEVGTVZESXVXQlJsUFdyRkxDajV6b0EzcFMvQy9LakF5?=
 =?utf-8?B?dEMxWVlPNXZoeU5YZWh4ZlErMDM3aVZZT2JITTRVZk1SWWZBU0RhSk5EN1R0?=
 =?utf-8?B?U1ZCUkk0V2Y1WE9aYU5NcGlBSDl1bUdKSUdxdWlIbmhVbmcvTVNWckd0YjU2?=
 =?utf-8?B?MzVreXZBMjd4V3Naa2trZ2h6NlBTUFRnQ3BzbUVOLzJjNWpDRkRWWkxtZVR6?=
 =?utf-8?B?b3BTR0EyYldDS0xsWXFDcVh4bFpaRVBRVFBQaDU0TnFwUTdvcHRucnJlK0Rx?=
 =?utf-8?B?Um81enVidEVsRkN2SFFocUR0WW9zZC9IZmllcXppREt0ajNHMlk3MjBMa01X?=
 =?utf-8?B?WDNIbUE1YUdtRnAxUFpmdDc3dHRXUk5kb2ZiUTJFaTc3ak9UZUc0RFc5Qi9C?=
 =?utf-8?Q?vat8o1?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8749.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1102;
Content-Type: text/plain; charset="utf-8"
Content-ID: <83CE32322DC7E14A8297E83B7CFCB1DF@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9900
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: e67e4537edab4ea088cf00530cc337ec:solidrun,office365_emails,sent,inline:266cf49731a6b0df5df98059e5cb6a1c
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001A4.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	edd09df0-2e0f-459c-a9a7-08de30d15288
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|14060799003|82310400026|376014|7416014|35042699022|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ck9qT1BRT3U4N0xMWFN4MUdaTVM0SnNjaEhSdjExMU5xa0k3MS8xK3lkZjht?=
 =?utf-8?B?cWNna05DYWlMWE9SNnZvUHVhU2Z6Nm9oS2MwSjBWeWxNKzJJSHQ1ZVRYS09Y?=
 =?utf-8?B?YnFCU0ZuWUMwV2pHdTVqV3AwalgxM2t5RGVnSDBwcXhpU2N2Si9JU1dmQWNG?=
 =?utf-8?B?eDQzdlpjaHFEdS9SMEhXU0REUlowOUxSNlhDaDN1aDYxSnY1OG5HRVkyTTZ3?=
 =?utf-8?B?NGdUVXJtNDhvMDFVZjhVWXpXUUdzN0cyOXl3QU0vL1BWNDJPZTJXYmhEYWlM?=
 =?utf-8?B?eWhqMDlnZmQ5aGZzQWUyN2NBODVpWHRqanFQRTB4R0NTaEtEY3Bkd3Y4eXFN?=
 =?utf-8?B?ZUNGMUxoTmFQdEdmSjRHbksxQkk1OGFLZCs2SDNaRGF5UHVQc2NXZ2JNT2tz?=
 =?utf-8?B?ZmNsZW5say9OWVJvMkRjNU1WdnlXTzVlSVdQSzZ6bUNmUVYybzJYb2wzc1dx?=
 =?utf-8?B?MzB2d0d1RnFTOXcxb0NucVQvVTN2ZTVBTE9pK0tubjl3Vzk3NnJIWXdTVG9O?=
 =?utf-8?B?V0d2RlJEa3c0cGp4K0l2dWFLK2UxaHNBZCtSUDNSdnJpVW5YRnp1OFBDY2Fu?=
 =?utf-8?B?TUY5UkFMZFdmQVBuK296anlmRFJqTkZ1aDdzYlVsTnAzWUxEOCtUOGo0ek1t?=
 =?utf-8?B?cnJZTDZac2RxRm9FTjRWZHAzU1YvQXYyQWpFTExBNk5Tdmh1MXhId0s5cVRZ?=
 =?utf-8?B?T3Z5UGtyT2tCeUEzWDRIM2RpVjFzSGdzSkFwY0hmZW11NGtyamxIZkFGVTZr?=
 =?utf-8?B?NzV5dlBYVEtVeXN1dnF2Y2g5N3FMTWxBUUV0LzBxYUZ5azJEWThQWHFvUUVp?=
 =?utf-8?B?NDdyUWFLZ3l2SFVpVU41bVRlaGRRNnJjeHdIRGx4NWtHeGFsYi8rQU9tcXN5?=
 =?utf-8?B?TEtyRWlCNGpGMHhScTBteStEZ3NLSlAxZ0FXa2hndVFNM2ZoUk0rQy9oRkRC?=
 =?utf-8?B?WDVsVFlFMkhvRkorRUFnVGNHb0pxUklvbDc3aDdwNDlCMHREa2xnV0hkeEdX?=
 =?utf-8?B?aGg0b01KcGREQlVKRkpOQlJldnA2bVZTQVRZS2JzT3A5RVM3bFhCcnJJTG81?=
 =?utf-8?B?OXBqTEl6Vlk2MGJjYi9xcFJ2MHFWeTJGS3lZSkMxQjdZOE9KUTJ2eVgzeGJk?=
 =?utf-8?B?RDlHR1hzM1RKV05DU2s3aWdxMlJJY2pZTHRYTlY4ZmlLV25uM0FJQTBzaHRW?=
 =?utf-8?B?RjFBUUxKUnBhaEUzMkRDK0JQYjBoUXdKVnhHYndrL0dudG0yR0ljaFo3QXhh?=
 =?utf-8?B?U0JaUko5WHNtc0k5RjZCR0d2TEdyQ3NVcDFvdkZYVVN1bjVlZTdVRkUzenZL?=
 =?utf-8?B?VFNmVFNtQk5HSWc3MFFwWmQzYWlHRFdZZFErK1JSTFk2MTdWcDV3L1Z2Q0wz?=
 =?utf-8?B?dEV6M3BtZWhPTlI4UG03MlpvVWw5VG14aldnandsUjd2bUN0aVRveDlXbjBu?=
 =?utf-8?B?M2xjWFdWUm5pU1FjdW4wRU1BNitGaHUvZnZGZXI4Z05maUo4VmNva2wvN2E1?=
 =?utf-8?B?RzJVL1hWTVF4L0NmK0ZyZUN2Q29BRmVNUUovQ0czbHBSdEo2S2hicEwxSEZr?=
 =?utf-8?B?c2V3RTQvM0l6Y3Y5QUgzRXJYdTcrelpoc3BMS3ZYMTBqcVc4SlF0TjhFWmtO?=
 =?utf-8?B?Mll1MU9kdzJpV3lRRVNlMVZrcmwzZU9tdFJPVGx3aUlnNVZBWk9VUWxQd01s?=
 =?utf-8?B?SlB3VWxIZVM0NzNWSW9WNTZpd25pbXdqUmRCQkhTMkZFM3N5ZnhiUy9wZjJD?=
 =?utf-8?B?NzJZT1I5bi9iaC9XZ1NtTDdGcTlqREc0ZUV3cFFlR24yeThZM2ZObHE1QXMr?=
 =?utf-8?B?dTlETzkrT2Y3NXc0Z3NUQlJJN29nSDJncXNWVk9qZkhwRFlWZWs5TFNPdTVF?=
 =?utf-8?B?aXVPVi9rWnJZVk9tKyt6V2JLTVV5d05nSm5vMW95WjRHZVZ2Vm9FbHdqMVlO?=
 =?utf-8?B?NlNWMTV1VzduK0hER0RFMUVIY09jL1laQWtPaHc3WHhuYlhHYm1sNE1uVEVI?=
 =?utf-8?B?WXkxNFkwUjRIdG1ZQm5yTURuYkh0b3FRdzEvVXFKR2YxMWJTYk9hMWdHdUlu?=
 =?utf-8?B?VGlGVUVMaXpjeEhtQnkzK3hybWhVSVZ4aWJITUl3a1RpdFhxK3JQcS82eXRr?=
 =?utf-8?Q?cYtY=3D?=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(36860700013)(14060799003)(82310400026)(376014)(7416014)(35042699022)(1800799024);DIR:OUT;SFP:1102;
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 12:01:24.4121
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f4bcab0-5dbc-4093-2d45-08de30d159bf
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001A4.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7133

DQpBbSAyOC4xMS4yNSB1bSAxOTo0OSBzY2hyaWViIENvbm9yIERvb2xleToNCj4gT24gRnJpLCBO
b3YgMjgsIDIwMjUgYXQgMDU6MTU6MzhQTSArMDEwMCwgSm9zdWEgTWF5ZXIgd3JvdGU6DQo+PiBB
ZGQgbXV4IGNvbnRyb2xsZXIgc3VwcG9ydCBmb3Igd2hlbiBzZGlvIGxpbmVzIGFyZSBtdXhlZCBi
ZXR3ZWVuIGEgaG9zdA0KPj4gYW5kIG11bHRpcGxlIGNhcmRzLg0KPj4NCj4+IFRoZXJlIGFyZSBz
ZXZlcmFsIGRldmljZXMgc3VwcG9ydGluZyBhIGNob2ljZSBvZiBlTU1DIG9yIFNEIG9uIGEgc2lu
Z2xlDQo+PiBib2FyZCBieSBib3RoIGRpcCBzd2l0Y2ggYW5kIGdwaW8sIGUuZy4gUmVuZXNhcyBS
Wi9HMkwgU01BUkMgU29NIGFuZA0KPj4gU29saWRSdW4gUlovRzJMIFNvTS4NCj4+DQo+PiBJbi10
cmVlIGR0cyBmb3IgdGhlIFJlbmVzYXMgYm9hcmRzIGN1cnJlbnRseSByZWx5IG9uIHByZXByb2Nl
c3NvciBtYWNyb3MNCj4+IHRvIGhvZyBncGlvcyBhbmQgZGVmaW5lIHRoZSBjYXJkLg0KPj4NCj4+
IEJ5IGFkZGluZyBtdXgtc3RhdGVzIHByb3BlcnR5IHRvIHNkaW8gY29udHJvbGxlciBkZXNjcmlw
dGlvbiwgYm9hcmRzIGNhbg0KPj4gY29ycmVjdGx5IGRlc2NyaWJlIHRoZSBtdXggdGhhdCBhbHJl
YWR5IGV4aXN0cyBpbiBoYXJkd2FyZSAtIGFuZCBkcml2ZXJzDQo+PiBjYW4gY29vcmRpbmF0ZSBi
ZXR3ZWVuIG11eCBzZWxlY3Rpb24gYW5kIHByb2JpbmcgZm9yIGNhcmRzLg0KPj4NCj4+IFNpZ25l
ZC1vZmYtYnk6IEpvc3VhIE1heWVyIDxqb3N1YUBzb2xpZC1ydW4uY29tPg0KPj4gLS0tDQo+PiAg
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21tYy9yZW5lc2FzLHNkaGkueWFtbCB8
IDE0ICsrKysrKysrKysrKysrDQo+PiAgMSBmaWxlIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKykN
Cj4+DQo+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21t
Yy9yZW5lc2FzLHNkaGkueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9t
bWMvcmVuZXNhcyxzZGhpLnlhbWwNCj4+IGluZGV4IGM3NTRlYTcxZjUxZjcuLjU1NjM1YzYwYWQ3
M2EgMTAwNjQ0DQo+PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbW1j
L3JlbmVzYXMsc2RoaS55YW1sDQo+PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvbW1jL3JlbmVzYXMsc2RoaS55YW1sDQo+PiBAQCAtMTA2LDYgKzEwNiwxMSBAQCBwcm9w
ZXJ0aWVzOg0KPj4gICAgaW9tbXVzOg0KPj4gICAgICBtYXhJdGVtczogMQ0KPj4gIA0KPj4gKyAg
bXV4LXN0YXRlczoNCj4+ICsgICAgZGVzY3JpcHRpb246DQo+PiArICAgICAgbXV4IGNvbnRyb2xs
ZXIgbm9kZSB0byByb3V0ZSB0aGUgU0RJTyBzaWduYWxzIGZyb20gU29DIHRvIGNhcmRzLg0KPj4g
KyAgICBtYXhJdGVtczogMQ0KPj4gKw0KPj4gICAgcG93ZXItZG9tYWluczoNCj4+ICAgICAgbWF4
SXRlbXM6IDENCj4+ICANCj4+IEBAIC0yNjIsOSArMjY3LDE3IEBAIHVuZXZhbHVhdGVkUHJvcGVy
dGllczogZmFsc2UNCj4+ICBleGFtcGxlczoNCj4+ICAgIC0gfA0KPj4gICAgICAjaW5jbHVkZSA8
ZHQtYmluZGluZ3MvY2xvY2svcjhhNzc5MC1jcGctbXNzci5oPg0KPj4gKyAgICAjaW5jbHVkZSA8
ZHQtYmluZGluZ3MvZ3Bpby9ncGlvLmg+DQo+PiAgICAgICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9p
bnRlcnJ1cHQtY29udHJvbGxlci9hcm0tZ2ljLmg+DQo+PiArICAgICNpbmNsdWRlIDxkdC1iaW5k
aW5ncy9waW5jdHJsL3J6ZzJsLXBpbmN0cmwuaD4NCj4+ICAgICAgI2luY2x1ZGUgPGR0LWJpbmRp
bmdzL3Bvd2VyL3I4YTc3OTAtc3lzYy5oPg0KPj4gIA0KPj4gKyAgICBtdXg6IG11eC1jb250cm9s
bGVyIHsNCj4+ICsgICAgICAgICAgICBjb21wYXRpYmxlID0gImdwaW8tbXV4IjsNCj4+ICsgICAg
ICAgICAgICAjbXV4LXN0YXRlLWNlbGxzID0gPDE+Ow0KPj4gKyAgICAgICAgICAgIG11eC1ncGlv
cyA9IDwmcGluY3RybCBSWkcyTF9HUElPKDIyLCAxKSBHUElPX0FDVElWRV9MT1c+Ow0KPj4gKyAg
ICB9Ow0KPiBUaGlzIG5vZGUgc2hvdWxkIGJlIHJlbW92ZWQsIHRoZSB0b29saW5nIHdpbGwgcHJv
dmlkZSBhIGZha2UgcGhhbmRsZSB0bw0KPiBzYXRpc2Z5IHlvdXIgbXV4LXN0YXRlcyBwcm9wZXJ0
eS4NCldpbGwgZHJvcCwgdGhhbmtzIQ0KPg0KPiBwdy1ib3Q6IGNoYW5nZXMtcmVxdWVzdGVkDQo+
DQo+PiArDQo+PiAgICAgIHNkaGkwOiBtbWNAZWUxMDAwMDAgew0KPj4gICAgICAgICAgY29tcGF0
aWJsZSA9ICJyZW5lc2FzLHNkaGktcjhhNzc5MCIsICJyZW5lc2FzLHJjYXItZ2VuMi1zZGhpIjsN
Cj4+ICAgICAgICAgIHJlZyA9IDwweGVlMTAwMDAwIDB4MzI4PjsNCj4+IEBAIC0yNzUsNiArMjg4
LDcgQEAgZXhhbXBsZXM6DQo+PiAgICAgICAgICBtYXgtZnJlcXVlbmN5ID0gPDE5NTAwMDAwMD47
DQo+PiAgICAgICAgICBwb3dlci1kb21haW5zID0gPCZzeXNjIFI4QTc3OTBfUERfQUxXQVlTX09O
PjsNCj4+ICAgICAgICAgIHJlc2V0cyA9IDwmY3BnIDMxND47DQo+PiArICAgICAgICBtdXgtc3Rh
dGVzID0gPCZtdXggMD47DQo+PiAgICAgIH07DQo+PiAgDQo+PiAgICAgIHNkaGkxOiBtbWNAZWUx
MjAwMDAgew0KPj4NCj4+IC0tIA0KPj4gMi41MS4wDQo+Pg==


