Return-Path: <linux-renesas-soc+bounces-25690-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E6AECB3356
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Dec 2025 15:50:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DBA663028D8E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Dec 2025 14:50:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA2F3241103;
	Wed, 10 Dec 2025 14:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="VpoVL5RY";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="VpoVL5RY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11020110.outbound.protection.outlook.com [52.101.69.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55AB419539F;
	Wed, 10 Dec 2025 14:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.110
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765378207; cv=fail; b=tfO/iC3i1W64YRp7XaeoacVhV/eFeZsNebz3v/mjjxlHjLe51h0PvdTgvXMxM1T0tkNNAgCfd4xV1tw91rr8XX7CcMBE3F2dsUpwYBZdOpey+Aux5ANurTVFrN8m2Gk7BaTDK04g4UCVCDKtG1c3t9UVJeDHJChkZvAQGgYs2NQ=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765378207; c=relaxed/simple;
	bh=EXMU80pRFf0FR9uvakJg2UOBKy2D9703T5iCFqgBGLk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ezHDLymavmuSpnkNuw/Br0+PmaMkOScAPNvG1Sr8KjVriB0q959LMVDE3mFLzVy14abYrP19YuUKq4JjfJEzeeQ102G1YJDfceUFYXCPrypOa/im7ZZG1e7gR5FXFzsGPVBIjLA6YsWh+5LAOBnUNpAQzE//De9PTjdd5l34UuU=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=VpoVL5RY; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=VpoVL5RY; arc=fail smtp.client-ip=52.101.69.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=paae5kg8ykeqXq88qkLobc1BfayDGHTi/ZVl4l0ISFmRagehkwt/4KMfibWGP1MyUtNm3DPWvjCxlOu9BI2Vmn49ZkHaJwUEq84yvnKopb8vkHOaA2OAG+cqQp09e8t5Li+A51BluXK+wSCHE1UW1od5V24XPsU1pbTbpe+Khk5JfEkZEHabvJpyRGZUVwZWHGyyH324PlhbBmWvi7VD+L4F7P61Srqbadau1Zt0fPR98Ogd1jqVVnz5FvoMvHvYupdlReBAHctSFeVTiLTQEKl4keqW+BOSK+qlwBr7dR7k5F23JoFtACAaWIXpQAMLrgWFMU79OK3Il0ZJQPLF0Q==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EXMU80pRFf0FR9uvakJg2UOBKy2D9703T5iCFqgBGLk=;
 b=tbCt87yknXxu6hQgwo8H3lNMMKnf8hBoaQ9e/gfDvYEkw35cJSib03RZfJZ+i2JS5xLcReGsHRO92A9rKp77fSSkf9gQZfppb6VOADKpAcupj4DR+IaP0e9K0k/Rkn8rYossB9OT4FbkE+6rAZg1hmCYyKGdVoAtNGRMBBbSlGGLEcZZn6SaHC87HenZvpbCxWlSuJHiA00Ot0topR6/X1TZjXhU+LfXJCVbFgIZ6dUjC2vlpjgiTC3+uV/1kx2WePbo4vGvx9+676LF16HbxJN4nReJpqYOK8uGCOOpN87pbrabYNklEgAeFSXUANo/KonVBkRstEy67MzVDPrSbA==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=glider.be smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EXMU80pRFf0FR9uvakJg2UOBKy2D9703T5iCFqgBGLk=;
 b=VpoVL5RYRMky5qKs0Kwv0VoEA5x1p0Q3CIhqxo752iUxu5tk45gp30Zqkf/lhh3tF88GAnhJZyvPREthSjP/wZMbpNy1ugDu6ASKxChr3HiQ++WCajrlm53W5NjK2HVX7aDqA8l5eWsjQ8vvofiRwoCfBTtdSh6doGcTcO+kTqI=
Received: from DUZPR01CA0096.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bb::19) by GV1PR04MB10629.eurprd04.prod.outlook.com
 (2603:10a6:150:207::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.8; Wed, 10 Dec
 2025 14:49:59 +0000
Received: from DB1PEPF00039233.eurprd03.prod.outlook.com
 (2603:10a6:10:4bb:cafe::13) by DUZPR01CA0096.outlook.office365.com
 (2603:10a6:10:4bb::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.8 via Frontend Transport; Wed,
 10 Dec 2025 14:49:56 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 DB1PEPF00039233.mail.protection.outlook.com (10.167.8.106) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.8
 via Frontend Transport; Wed, 10 Dec 2025 14:49:57 +0000
Received: from emails-9942782-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-6-47.eu-west-1.compute.internal [10.20.6.47])
	by mta-outgoing-dlp-670-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id AE398804AE;
	Wed, 10 Dec 2025 14:49:57 +0000 (UTC)
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=none header.d=none
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1765378197; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=EXMU80pRFf0FR9uvakJg2UOBKy2D9703T5iCFqgBGLk=;
 b=UrML6ljnEzFsKKxSjwSPAz9rhd5cLG2axJPK2V2i46BXyIy6TuW+xuuxIOlHBwkdHfo1h
 uXSbfu+HEHjK5/7LNG3fK109BXuANC96AyO7HPr6qyG8GgLIqetv9hFs+KMtiUGkQ9eDt12
 Y2CItY2BfbG5v3RbNctCoaZs0mx4iD4=
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1765378197;
 b=cC/01I8Ty7Q6ZVwVN9CUr0Vpbcm8oQYlEU9IuzhOl2IF3islroJ0NFJuX7ufv22gShqJ8
 93luLIL8KC1R8Ai/tOs4eQTwlODc1vudROClpjMfaTLa04/Ifybkw/pMguRQn2i5PUwOarh
 oe+BlegOqLs/VZWQqLmW5Q6C8qnQB0I=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KYHmtQZrfEmupuXJ6zK1g7SSw28lCKvi5ZEBvvysj1zrgJlgiuPTKF2SfH+asW54Snag74/Q4aC2HYoVyUa3119/zOw1dcc3C2ga1VQ9y+JDXkY/0se/EGzLp9yBO1ErHRVTz7NvBXxryubzknIypGHeCsK+RNcu3LrtnvEjgoXnxo+fhKCaMTvqbBvOHeHF3tUhX2Inu9TSLhfoSFpMjGC0MrXuNSTQGi4ORH354gHtrk7ShAp80/G3wFtGFl5hxEF70CPKwT2PJ1DcqcH8NSdgKfc5hbYATzDTiyBUe7Ka7TbYVDe+C89dwTLp2TfZ4cR5Sdm4MTsR7Dw0NV2vjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EXMU80pRFf0FR9uvakJg2UOBKy2D9703T5iCFqgBGLk=;
 b=uB5m2jSbDPxd4Md6kqa+ynY+fHp9jrNuFVUcePVRfqTgTlbd9VEhRVnNxBg5Ut07iXNnll5HJBuPlC6uRgmFB4g/UuNW1BT8wrtn3+T3/0rE4hQu5hoq8pORfu6LbiJzrraqat2BEp35VMgoYg5FrxPf4dIs0B+zzcnhvTr6KClMY2BzZ1J93706E1+P5ZFLrxmI/zV7f4V4VtgEkLgM4duRUUdCuhOZ0f0O/JQ6ttguOrEfgXGVYbrCvs2xGzVCUhSpD6K56VWUJMdkoei1WV/uOSox17nK4RiAaFlKo09Q4S2ogqvoWKrpmmx+0lOnsdXECxn+8OPPNdfvMsb6dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EXMU80pRFf0FR9uvakJg2UOBKy2D9703T5iCFqgBGLk=;
 b=VpoVL5RYRMky5qKs0Kwv0VoEA5x1p0Q3CIhqxo752iUxu5tk45gp30Zqkf/lhh3tF88GAnhJZyvPREthSjP/wZMbpNy1ugDu6ASKxChr3HiQ++WCajrlm53W5NjK2HVX7aDqA8l5eWsjQ8vvofiRwoCfBTtdSh6doGcTcO+kTqI=
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by AS8PR04MB7558.eurprd04.prod.outlook.com (2603:10a6:20b:23c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.8; Wed, 10 Dec
 2025 14:49:46 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6%4]) with mapi id 15.20.9412.005; Wed, 10 Dec 2025
 14:49:46 +0000
From: Josua Mayer <josua@solid-run.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, Wolfram Sang
	<wsa+renesas@sang-engineering.com>, Mikhail Anikin
	<mikhail.anikin@solid-run.com>, Yazan Shhady <yazan.shhady@solid-run.com>,
	Jon Nettleton <jon@solid-run.com>, "linux-mmc@vger.kernel.org"
	<linux-mmc@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: mmc: renesas,sdhi: Add mux-states
 property
Thread-Topic: [PATCH v2 1/2] dt-bindings: mmc: renesas,sdhi: Add mux-states
 property
Thread-Index: AQHcYr5ivKGW5aRMFEW96j1IOm16C7UZQ6YAgAG/T4A=
Date: Wed, 10 Dec 2025 14:49:46 +0000
Message-ID: <8db3548a-5e01-47fd-99ef-dcd694abc786@solid-run.com>
References: <20251201-rz-sdio-mux-v2-0-bcb581b88dd7@solid-run.com>
 <20251201-rz-sdio-mux-v2-1-bcb581b88dd7@solid-run.com>
 <CAPDyKFrD2x0U49w2Fpzrc98wKXtyyN-B1P69OMJk27+0Yzsg8Q@mail.gmail.com>
In-Reply-To:
 <CAPDyKFrD2x0U49w2Fpzrc98wKXtyyN-B1P69OMJk27+0Yzsg8Q@mail.gmail.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-traffictypediagnostic:
	PAXPR04MB8749:EE_|AS8PR04MB7558:EE_|DB1PEPF00039233:EE_|GV1PR04MB10629:EE_
X-MS-Office365-Filtering-Correlation-Id: 0eb8e1fa-ca1d-4ced-543d-08de37fb6381
x-cloud-sec-av-info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?R1pyMExhdmMxb1VqbXBsQnBlb2h4eG8xdzBJK3RPbTRLRU42NzFHa1ZvdnRj?=
 =?utf-8?B?cUhjZXllYXhIcCsyb1hGQ2R0WmMybjFQQnZTMUsxSUdrdzBhU01lWXN3d09N?=
 =?utf-8?B?akQ3WStsc05lU201akg2WUZOc0VOVU5laVNNY1dDNW5NT2Q5ZjU3RDRVYzdP?=
 =?utf-8?B?NVdJT0VxWnh3M2Y3NUdxeWRXdE5wNTl0SldZVU1welQ2cTUvRDVCWEwrM1RV?=
 =?utf-8?B?TENwUW5hMkt6aGczcWtrRmEyaDB1TGhIY3ZnalBidHQ2Vmp3a1V5MElDeTZX?=
 =?utf-8?B?RlltMWtPRWVaUGNyNk4rRXBlQ1hIT0I5enNpVTBBbnByYVhQa0ZIeVFXVkhx?=
 =?utf-8?B?NEZpSndBeFVXWWZlTHlQYWhSZXF0WDBYTWZuOWJQRGRqOXR6YVNpdmVaU0Fz?=
 =?utf-8?B?ZEJZUjV0VkIyUEZlOFUvVVVRMDdwMnMxWGFjdDJvdjRjYUZ1bGNFcHc0a3ZF?=
 =?utf-8?B?QnlyMzZWb3MveXVXOVdBb0dzb0Z1M1VteXJYMS9zMklJMm1yZ0l1TmNTeWVy?=
 =?utf-8?B?UmhqVUNERFk4Tkk5SXMzTEZkdC92MnkxdjVoTFVMeG5lZlMxL0gyUG53dlF3?=
 =?utf-8?B?Rm1HcXUzRFVBVkN0cVJmNWxkT1l5c2pJazlIYVpnOTVDd0hJRTFUNk5uYlNw?=
 =?utf-8?B?RzRwaFRlai9veUtHcjQ5b0o4blhlTzhJbGwvSUc5ZXIrQ1dJMEJJVEJnanlE?=
 =?utf-8?B?SFYwRmkzS0pMNGIwcStXbnlEb3dMdDc1eEhHSnB3YVJtVW13dEFKMlEvcmxB?=
 =?utf-8?B?dHdXYmNYWEpSemE2NDFqbTZqNmFvMWhJMmpiUUYxWGNWR1I4bm1xN0V0UnRV?=
 =?utf-8?B?RkpVRFhrOW5ScU5mbi9xcVV0Q21rS3hLWmN6cEtHZkR3WTZRNzg4dWQyMU5i?=
 =?utf-8?B?SnhyQXA3K3ZsTU9LQnBoLzBSdlp2U01XZldpSC9oRGNtSHJ6RU9jRU5LUnla?=
 =?utf-8?B?V1A4Nll0NkNxcUJKWnVEZ3BVSlVtVEU2OVgrUkhad3h4cTVMQS9ReS9PaHpz?=
 =?utf-8?B?MTBRZ0J1Q1hrSHBVemp1VGlTMzU5NkJwWk5Tc1ZPUWYyTTRsTnRiSDZVUUxL?=
 =?utf-8?B?YXcxMXN0M0EvVGRuMHdNT0dWNlVzWGRyWGxsSTJSelBSdzdQOXk5eHdSbU43?=
 =?utf-8?B?eHJiRnk0eEZRdzREQ1lkVjAzbUhQU05qNllmR2t3cUZGNjNFTHBpWWhTZFhH?=
 =?utf-8?B?RHBHaXp2dHhNVG16UGdZMGVka2dKbDUrK2NnYW01aGZPODNEWTZKMkdxamFD?=
 =?utf-8?B?Y0Jmd1JNeDlSdStRTEFRbmFkL090eG1DUXlVSlBYZzVUdUVEVlRGTDRoMi9R?=
 =?utf-8?B?TmJ2WXJNemQ5eFBDNHhsRmhHbXg3OS8rSjVXcUE1c3BIWnFCamVzY1Mxa0w1?=
 =?utf-8?B?Rk1jSml4OE5JdHdHcXUyb3hNcElKVGFlWTdqeTA0di8ydTBiRnZNaFhzNkpl?=
 =?utf-8?B?NmtRZjBhcXk1aFIzVm1yRnJ2MDIyclpaYXFPYU5yb1BneUYvNG9oRUNXK1U2?=
 =?utf-8?B?bFVFRHg4dmQwOXZaMTNWWWhTeG1uVlp1Zm9GS0NvMlg4NmlwQlV5endFQUQ2?=
 =?utf-8?B?SmtselhtamIyeks0ck8yNjlJd2h3Wk1Nd3J6eStvSUJmSGd2d3VMUUE3b0hE?=
 =?utf-8?B?QlMrYVlBYkpmeE1YUVBaQVRlT0VDZ2dZVEV0STh2N1Uzd1dwY3hjck1xekZP?=
 =?utf-8?B?WHR3ZGJuR254dWdqZU42MUNCVEY5NVR1TjhUOGlvSGY3Unc3UGpDTU5mMFNN?=
 =?utf-8?B?RHM1d0J5QS94TE9tNi9RSUFQYVJYS1RBZjlLd0wxellhY3ZIdjJkNEJaWmk1?=
 =?utf-8?B?ZXV3NHZnZWVST2Z2QnRzakw3Y0kyY0h1SFl5d3pRV3VMdHIvTGRRZUFhbFRr?=
 =?utf-8?B?Tm0wbVBEajd6RHNJKy9ZU0E2SFpuQWdtL2JXeVlncjMvcHQrUlBRRk1kQWhY?=
 =?utf-8?B?bWdmN1I5ZVFOTG44QmQ5SnZRTnlRQlB6OExnMVAybm5XQ213czBMZStZRlV5?=
 =?utf-8?B?Ri90TUNvNElBM1krRm1SbC9uOUc5a1pHUnNyY2UzMHVZVzdURjZwaU1jdFB1?=
 =?utf-8?Q?a6/L+m?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8749.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700021);DIR:OUT;SFP:1102;
Content-Type: text/plain; charset="utf-8"
Content-ID: <DCE37B42729EAE4D88B8FFC5030ED5C3@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7558
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 5072f9f350884d0d9c1b8b36bb5cfa5e:solidrun,office365_emails,sent,inline:d1c18f27884f3e9769a666c8b7dc14f8
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF00039233.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	40cd1213-9a4b-44b6-50c9-08de37fb5c78
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|7416014|376014|36860700013|82310400026|1800799024|35042699022;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RXpkZ2ZqZHFabnpNNW15NlNqaDhoNHZ0aXljbVQ5dWlLZHlHSWE1eDh1aWkr?=
 =?utf-8?B?NjJ4ZTZDYkRnVG9aeXVKdWZOWGordzE3MGR1V015RWlxUFRpRGJlTm5aZ1Vs?=
 =?utf-8?B?ZjZ2NjNTTVlhM3FOd2lwSzBQWjlCcndMdTZ4dXUwbE5BL0NWT1hsRWNoWGxC?=
 =?utf-8?B?Rk9pblRJM2lRaXhUZXJmQjlVTm1NRGFzRitWbW9Zbzc2bFZzVllwS0ZTSTZl?=
 =?utf-8?B?Mi9PWWFGcHdtdXBCRDhEYkpsL0ZXKzdDTFREa2ttL2RhNkdUK0ZsTm5SV1ZF?=
 =?utf-8?B?T2w2ZUZIdy94eHA1MHlqakliOHB4ZDZnQ0czQXNVbko4VS9NZmZzUFNlYzY2?=
 =?utf-8?B?YVY4MlJJL3lFU1FSaXEyanNRZHRnZFArdHdJaFgvdklDdFRGNXF4a0Q2Z1I5?=
 =?utf-8?B?QzQyK2syaVo0NnZOYnhXL2dHUThlVUpHMTRxL0RIMjJxVHBWQkFRT3NSYVpH?=
 =?utf-8?B?Y29udk1rNkQyTURLQVlsWC9mWlEycGFWeWxmK2I4MXdiVzYzelZHd2ltdkFQ?=
 =?utf-8?B?WUpQa3JXVzA2MlVTdmV3Y05nKzM4MFFialRJUkl2ME5GanhLWS9jUDVzQXVY?=
 =?utf-8?B?dkNUYkFHYnJQckdZSlM3Ym9QRTZscjg3dU9aWEhYbGxNTFV4V3dVTjZmT3hq?=
 =?utf-8?B?WEdhVVBoZE9rUitTV3JiWEpEMHlwdXowSFExQWQvTXBqQVlHNlhBYTYxWG1w?=
 =?utf-8?B?cVR4emNUTDFndFhLQVUyS0gycDVEbm9FYUxRRlZackdmaktmalNkYnN4QnhG?=
 =?utf-8?B?UlpMTVpaWFBzbGMzWFdZeHVkVEhTcWJXcUZuN0VmOEdnTkNzRWgzYkpmbC9L?=
 =?utf-8?B?cWtJQ2hMUUp2cmt4VS8vTWZ4T0U5cmp1aC9QRHYyaTdSSEN6TmFlb2F6Q0FI?=
 =?utf-8?B?dzFYdHdTTURuMDRLZ2lGNDYvd1htckxGV0xRZHN4N09PWVNCZXFwd0VvRzFh?=
 =?utf-8?B?dHNtZ0ovZVl1Y29jTldVcWY3ZzFxeSswNlZ5YVVkczF6SlJ4c1BINXZDdk9H?=
 =?utf-8?B?MUN0R0FZeXRVdjk4QXNHOG1WU3VsR0dkRGNxY0xXVHRRUFhTbmpxWlN5ZlhV?=
 =?utf-8?B?bW41aU1VeGhWRjNLRVdPSnpPV2ZWYkFnSGg3MTBxczZRT0JNUjNtWVJlZWg0?=
 =?utf-8?B?bW5kWVNhd0xUWjFmZmgweTAzR0JyOGROS1VTVG8yZ2RDSWJiZ3c3S0cvNE1H?=
 =?utf-8?B?M1RLTHY5V1ZzTWJ2anRJTDV6eGowb0RXTXJZaXRtczhSYkV5a3lHVG1JNzd1?=
 =?utf-8?B?N2dkWjdna1VDTHV3eFVaUTZyVnpVYjZKNllBdkZFd2VxWEZ5NFpocE9leHBo?=
 =?utf-8?B?MG1VRGtLa2NiNGJoRUdsbjRvWDhQcnRwUEJ1OFhqcDMxSHROVzFEVmRETWN4?=
 =?utf-8?B?MmhEL1RCOWxYRVo2U3BNNGlBZlJaNFF2NUxaekdpVjM0VmpWYm8rZzRiKzdo?=
 =?utf-8?B?WjRTRTJuT0pSUEEzTU5YZGt4aTgvSlFHYUltcXFtNTlReS9XNmYxQzAyOWE0?=
 =?utf-8?B?Tm96SWhyU0hXZURCMlBEaUpwd3k4ak92dUl3VG9jbnRENWJGdXpkTkJhdUtu?=
 =?utf-8?B?L1hPdU9rNG4rWS9TREJWNHZkaGdKRjRpOGh1b1ZMbzNWU1owYUpvalByd3Zv?=
 =?utf-8?B?aUJwQ3YvVGhwRU9BdnRPeFFQcExidWcxVjgwMWkzbHdLZ0FqMkIvbkh1QVFr?=
 =?utf-8?B?ZFdPVGRsV3Y5ME5xTHFETWFkeWM2N0o0K2JoUGd5eVEyR051UzI5OW5nSURz?=
 =?utf-8?B?dHRCSUprMk5rTUt6QzJ2eTZmTWVaSUxOejlIVEdZdWhTNndZTjcrdSswUE1l?=
 =?utf-8?B?MnhjdW5UaVN2YXBWa1M1cTZDRkQ1c0hCK1JOVlEzdGJhNmlsQjAvZDY3dEtN?=
 =?utf-8?B?U2YrSHdNWGJpdkpPSk5UY1k1eGlKY2d5bUVFSFRBZXltYnlwaEptd1JEUE4r?=
 =?utf-8?B?aFBrNzF5K0xneEVmYytjT3ZCbFZIdUM4endrSkdQa2NMbE43cWhQV2VWVXBp?=
 =?utf-8?B?c1RIb2tRdzN3S0hTQUdqTHBNNzVlRHQ3TmlxanV6ZXdZaTNsRXJLeFAxZmdW?=
 =?utf-8?B?UWxBQ2p4QWZSZGlpTlRWUzdrWTFJUEFEMXd1cElIMXNQS1dtek5LY0NmeW8v?=
 =?utf-8?Q?0Zk0=3D?=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(14060799003)(7416014)(376014)(36860700013)(82310400026)(1800799024)(35042699022);DIR:OUT;SFP:1102;
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2025 14:49:57.8511
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0eb8e1fa-ca1d-4ced-543d-08de37fb6381
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF00039233.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10629

QW0gMDkuMTIuMjUgdW0gMTM6MDggc2NocmllYiBVbGYgSGFuc3NvbjoNCg0KPiBPbiBNb24sIDEg
RGVjIDIwMjUgYXQgMTM6MzEsIEpvc3VhIE1heWVyIDxqb3N1YUBzb2xpZC1ydW4uY29tPiB3cm90
ZToNCj4+IEFkZCBtdXggY29udHJvbGxlciBzdXBwb3J0IGZvciB3aGVuIHNkaW8gbGluZXMgYXJl
IG11eGVkIGJldHdlZW4gYSBob3N0DQo+PiBhbmQgbXVsdGlwbGUgY2FyZHMuDQo+IFdlIGhhdmUg
dGhlIFNELCBTRElPLCAoZSlNTUMgaW50ZXJmYWNlcyB3aXRoIHRoZWlyIGNvcnJlc3BvbmRpbmcg
cGlucy4NCj4gVXNpbmcgInNkaW8gbGluZXMiIGJlY29tZXMgY29uZnVzaW5nIGFzIGl0IGtpbmQg
b2YgaW5kaWNhdGVzIHRoaXMgaXMNCj4gZm9yICJTRElPIiBvbmx5Lg0KQWdyZWVkLg0KPg0KPj4g
VGhlcmUgYXJlIHNldmVyYWwgZGV2aWNlcyBzdXBwb3J0aW5nIGEgY2hvaWNlIG9mIGVNTUMgb3Ig
U0Qgb24gYSBzaW5nbGUNCj4+IGJvYXJkIGJ5IGJvdGggZGlwIHN3aXRjaCBhbmQgZ3BpbywgZS5n
LiBSZW5lc2FzIFJaL0cyTCBTTUFSQyBTb00gYW5kDQo+PiBTb2xpZFJ1biBSWi9HMkwgU29NLg0K
Pj4NCj4+IEluLXRyZWUgZHRzIGZvciB0aGUgUmVuZXNhcyBib2FyZHMgY3VycmVudGx5IHJlbHkg
b24gcHJlcHJvY2Vzc29yIG1hY3Jvcw0KPj4gdG8gaG9nIGdwaW9zIGFuZCBkZWZpbmUgdGhlIGNh
cmQuDQo+Pg0KPj4gQnkgYWRkaW5nIG11eC1zdGF0ZXMgcHJvcGVydHkgdG8gc2RpbyBjb250cm9s
bGVyIGRlc2NyaXB0aW9uLCBib2FyZHMgY2FuDQo+IEFnYWluLCBwbGVhc2UgZG9uJ3QgdXNlICJz
ZGlvIiBoZXJlLg0KQWNrLg0KPg0KPj4gY29ycmVjdGx5IGRlc2NyaWJlIHRoZSBtdXggdGhhdCBh
bHJlYWR5IGV4aXN0cyBpbiBoYXJkd2FyZSAtIGFuZCBkcml2ZXJzDQo+PiBjYW4gY29vcmRpbmF0
ZSBiZXR3ZWVuIG11eCBzZWxlY3Rpb24gYW5kIHByb2JpbmcgZm9yIGNhcmRzLg0KPj4NCj4+IFNp
Z25lZC1vZmYtYnk6IEpvc3VhIE1heWVyIDxqb3N1YUBzb2xpZC1ydW4uY29tPg0KPj4gLS0tDQo+
PiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21tYy9yZW5lc2FzLHNkaGkueWFt
bCB8IDYgKysrKysrDQo+PiAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQ0KPj4NCj4+
IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbW1jL3JlbmVz
YXMsc2RoaS55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21tYy9yZW5l
c2FzLHNkaGkueWFtbA0KPj4gaW5kZXggYzc1NGVhNzFmNTFmNy4uNzU0Y2NiMWMzMGVmYiAxMDA2
NDQNCj4+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tbWMvcmVuZXNh
cyxzZGhpLnlhbWwNCj4+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9t
bWMvcmVuZXNhcyxzZGhpLnlhbWwNCj4+IEBAIC0xMDYsNiArMTA2LDExIEBAIHByb3BlcnRpZXM6
DQo+PiAgICBpb21tdXM6DQo+PiAgICAgIG1heEl0ZW1zOiAxDQo+Pg0KPj4gKyAgbXV4LXN0YXRl
czoNCj4+ICsgICAgZGVzY3JpcHRpb246DQo+PiArICAgICAgbXV4IGNvbnRyb2xsZXIgbm9kZSB0
byByb3V0ZSB0aGUgU0RJTyBzaWduYWxzIGZyb20gU29DIHRvIGNhcmRzLg0KPiBJIHN1Z2dlc3Qg
d2UgY2hhbmdlIGZyb20gIlNESU8iIHRvICJTRC9TRElPL2VNTUMiLg0KDQpBZ3JlZWQuDQoNCkkg
d2lsbCByZXBsYWNlIGhlcmUsIGFuZCByZXdvcmQgZWFjaCBjb21taXQgZGVzY3JpcHRpb24gZm9y
IHYzLg0KDQo+DQo+PiArICAgIG1heEl0ZW1zOiAxDQo+PiArDQo+PiAgICBwb3dlci1kb21haW5z
Og0KPj4gICAgICBtYXhJdGVtczogMQ0KPj4NCj4+IEBAIC0yNzUsNiArMjgwLDcgQEAgZXhhbXBs
ZXM6DQo+PiAgICAgICAgICBtYXgtZnJlcXVlbmN5ID0gPDE5NTAwMDAwMD47DQo+PiAgICAgICAg
ICBwb3dlci1kb21haW5zID0gPCZzeXNjIFI4QTc3OTBfUERfQUxXQVlTX09OPjsNCj4+ICAgICAg
ICAgIHJlc2V0cyA9IDwmY3BnIDMxND47DQo+PiArICAgICAgICBtdXgtc3RhdGVzID0gPCZtdXgg
MD47DQo+PiAgICAgIH07DQo+Pg0KPj4gICAgICBzZGhpMTogbW1jQGVlMTIwMDAwIHsNCj4+DQo+
PiAtLQ0KPj4gMi41MS4wDQo+Pg0KPj4NCj4gS2luZCByZWdhcmRzDQo+IFVmZmUNCj4NCj4=


