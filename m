Return-Path: <linux-renesas-soc+bounces-24573-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id BB364C58713
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Nov 2025 16:42:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 997CF35B72A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Nov 2025 15:32:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85E802FABE0;
	Thu, 13 Nov 2025 15:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="RAr2+fff"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011044.outbound.protection.outlook.com [40.107.74.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADBF22EE60B;
	Thu, 13 Nov 2025 15:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763047374; cv=fail; b=ePQNzBNYinCiEPudvz3KYaRd3BPvBXVhsMM+JQ1cfdgENNVg1my+WbHUmbyF4ffptJr9GX4BqqHFw2e4b0ESbCLELIPtiqJ8IVZLeLc8qWKkKxBauaVKmRhstHgE7R8bPeqwuZ8NnkBbDk43aX92jJDdBup66HgzRtJte5RnZmE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763047374; c=relaxed/simple;
	bh=Zf1Jd6n/37eN5rFpZ1phzugIQ0fWPrplKJi7HN9bMJo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=tBoWqCUpX4GO31/wQOWDJNW7rd+wZmW6Kwww2jed+QfOqH6h5H166r82/1nD1Vc/ws75u4uO0xx/UVrY9ipVCIVOTleQHhK1avzB3JFvTcPY6av8Owr4Y0Aub4hpaRO8rZ+4QBwMIT5Rgm9ThtfdJOuooCYdYJkM1GW4bOphF0Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=RAr2+fff; arc=fail smtp.client-ip=40.107.74.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zEC5IaY/RcUi17BfsdAgArvHic7FoPGW7VeL3b9RZYeLLV7/4Zcv1K+JfW0dCAnpsJzZ2w+am9xAnBfH3w/wnorMfrh1z1AzXGbkS95veXVjMJ4SqSCDsA7gMjCApk2j8stVnY5zhdzP2TBN3HIce8CEXtRaIbI/bAuE7XX/QJsMb6a6L4c/dmn68uy5wu0xmgMKQ1hkGd6imF3xWTOXyB+VGEXNC+Kn1Pemmetk2c0A5jJzltx3D7cYZX4bTqHN40OngFy71kBe0lcnHvejjnfWUAoeot/5qEMd70KD4Fl1LaXUUSTC9InYBTfkpdWuL/jDuXJMU7AeARnxWS0dGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zf1Jd6n/37eN5rFpZ1phzugIQ0fWPrplKJi7HN9bMJo=;
 b=c0WTfBN+JlztYtoYBvPK460CGoZDRYxeuYaJRG0FJgQwvI52JIlJgGUfHNvmwIUc4rs/R9uCinLLNZom1SfHmx7Kl1bTzO6JzchhSrFsl+CDICgEQ3ZaVyUWeyGlM8CMdpuMkMAoskw/c+Knuh7LXN154tQx2W+h6c9LBdru5v4Bb1a3j8v2OxdYDqXBLKVyE7v4megJk9E5dl9JJel7QxnlUaNp5yjV80Ur6jVc89WHwdFxrkPf/JwKexWNR7KbcB4PY/skIimUIyDJS4Y+veOW9r4KkVB/RoGeL5rcyo6AaE0MViY12SiLWaBhnrp9IQUCZz8t1t4i5JmZgjh3VA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zf1Jd6n/37eN5rFpZ1phzugIQ0fWPrplKJi7HN9bMJo=;
 b=RAr2+fffWKWTH5UW4Ez54t+G6OyAQGpgY+QLhzWbMTZEsUOtffvvKHwUYDrCgTf2A4nyHygILbyvG4nwzYz/YWExDHkVFVSxJoG+z4eglspJZZCKZ1qvNUOpqPONwvn7dHOsiwxsObKHV4PJWHfO+lTXQ9iaAxGXkSz0OEpEqGQ=
Received: from TY7PR01MB14910.jpnprd01.prod.outlook.com
 (2603:1096:405:253::12) by TYWPR01MB11863.jpnprd01.prod.outlook.com
 (2603:1096:400:403::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 13 Nov
 2025 15:22:44 +0000
Received: from TY7PR01MB14910.jpnprd01.prod.outlook.com
 ([fe80::c78:8e4f:a976:9941]) by TY7PR01MB14910.jpnprd01.prod.outlook.com
 ([fe80::c78:8e4f:a976:9941%2]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 15:22:43 +0000
From: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
To: geert <geert@linux-m68k.org>
CC: magnus.damm <magnus.damm@gmail.com>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Add NMI
 pushbutton support
Thread-Topic: [PATCH] arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Add NMI
 pushbutton support
Thread-Index: AQHcVKykmnOZV1/GEkOiRI4OSBE0lbTwuENQ
Date: Thu, 13 Nov 2025 15:22:43 +0000
Message-ID:
 <TY7PR01MB149100957580E90D7022DCF19D3CDA@TY7PR01MB14910.jpnprd01.prod.outlook.com>
References: <20251027140651.18367-1-ovidiu.panait.rb@renesas.com>
 <CAMuHMdXWwGo0bVmDpqxABH7aP0HcNDuqvv7D76xUv2Fa_48zEg@mail.gmail.com>
In-Reply-To:
 <CAMuHMdXWwGo0bVmDpqxABH7aP0HcNDuqvv7D76xUv2Fa_48zEg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY7PR01MB14910:EE_|TYWPR01MB11863:EE_
x-ms-office365-filtering-correlation-id: 972fd340-ca93-4be7-ae4c-08de22c87e16
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?NnFmbmRaMWJYVy9nTVlPTVVkMllENmlwSTM4TXJrdDE3QjBYV1hvVjVybU1t?=
 =?utf-8?B?VVZ1c2xVeUovYmFhYlUzem0vMnFmczA3ZHJhZGhOQ1dXdW4rdXNqb0lxQWRr?=
 =?utf-8?B?eEsxSy9BZEtPaXl5Z1YwODFMdEI3TTdSZUlBRFlKU2xMblRsNWhQSnJCeW9z?=
 =?utf-8?B?RkZzU1ljZ3prK3ExbXRyM3JOaS9lK2t2OFNGM0UwbVFMd0xrZUloa3grQUZQ?=
 =?utf-8?B?UE1zdU5lNTUyelpsTHR5OXhmcmkrajhiVXlUVkFlZ3dlZ3pJc2RHUUpMclJq?=
 =?utf-8?B?N1g5MmlVcDR0Q09JeWUrSE1KL2Y1MGpCVEQ1K0R0YUVoY3JZUk5ySnN0Z2Np?=
 =?utf-8?B?Y29CNW04MUp6dUpsc0pURXB3YXgzMk4xKzJrdHVaRDFxM2RZQWQzN2R0NHFK?=
 =?utf-8?B?Nmw5SVhWOEY3YTNVdThhQnBpaTdTdDd4UHhPT25YeVJGc2ZvWWV2WGtDOHJH?=
 =?utf-8?B?RDVoT28xVmovcGdMS1lZaHFGL0FjWHY4b3RNTWEzb1VudW5EaXh5QnlLTjg0?=
 =?utf-8?B?ckJ4MndtSW1OUnZiam9hKzZ2NHZxd0J5M3RGQTlkb21zWWNWa3Q2MFV4MU9j?=
 =?utf-8?B?M1Ywd3B5Y2NYeXNnRUVsby9oSWFDOWZTSjdYQTFZeXg1NXU0K2pFOG41NTNS?=
 =?utf-8?B?YWNYckFtS2RMTjJENzkyNitXZWhiczNNb3RoTjFXdmZOVGtCbEpzakdKbzlX?=
 =?utf-8?B?Z3F2YisrMG53M2RBMzVIVk94SWg0cEhFbzVBQ1lZaU5idXdQOUZXYzM0WGNr?=
 =?utf-8?B?Q2NKM2d3SG10RDBLbW1kUzZWSEkzSWphNVJmYWQ5Y3dVTFdzTWE2cTdzLzRE?=
 =?utf-8?B?UmZpUEhYb21yb2RoQXhONFlIYm9tSG9BdEpZd0F6M0R6OUNOTTBiaEpsQ08z?=
 =?utf-8?B?cXVGcTFwdzhUSzQvK3N3OW5zY2FGd28rS29uZk5nRkV2STdGVFg4M1pwZytL?=
 =?utf-8?B?L2xQUStTVXdOK3ZPOVRBUUM0SUpwRjEzRGFwQ2FHUklLQWI3TFRzb3dVWU84?=
 =?utf-8?B?MUkyT0pZWEFUS0ExdHd3MzJqcmE4OXVZY1lPZU9leVhSKzU2NXBkZk9DK05h?=
 =?utf-8?B?TE1Qemt2ZVQwYkxXODRsYVprL2JRNStyb1F6cFdvNVhRY2dyTkxMSllRVGN4?=
 =?utf-8?B?S05FdWZJRXlKcitrck12L05RanQ3OWQ3cmhaZzB0a0xiV2RLVVdOYlNzVUxj?=
 =?utf-8?B?QTBITG1nUUNRT0FWSDNvdEYvck53THZsL0RlN2RQellrYlMweXFtdEdRWGdi?=
 =?utf-8?B?YzJINkJTTnBKUXE5TU9Na3JMdFQ5Yk9EQVQ3TjNqZ0RiZFVqUUtCc1psZldq?=
 =?utf-8?B?T29QWGp0N0hZdVZhVFBNR3EzK2N6dzdHcjNRUXZ0cGQwbnl2QmJQeU1qWWRL?=
 =?utf-8?B?eThOUVk1WUR5SjBYNWMreVhIQ0pRbkFXVVREemJHVFE5VGZEdmd2dzdDaHhN?=
 =?utf-8?B?ZVlxejJqdmkzZWdpS05hYlNaNGpPUDAvWHFxcHVUWVBvdTRBa2pPeHJGdWZE?=
 =?utf-8?B?UVpmNndZWWFrU0FXYmZpaFhHaWxzcXpXM3psM2xYS3FHTnlTN09HVkw1ZXds?=
 =?utf-8?B?YVQrNHU4QmZMVUluNVdCN05MNFNDLys4T09rMkFvMlNCNDFsTFZGdE9oYXlE?=
 =?utf-8?B?R01BblJ5a0lGbE5pZ3FvRmMxWlJJK1p4VEJBQjgrZkNFenJ4Z0RWZ3Q5USs2?=
 =?utf-8?B?SkxOVTg5anRTV0Q2NGtXeDVWTVBYOWFJU1p1dHFmUTA2Tll0K3IxdG8vUzZy?=
 =?utf-8?B?dU9FcnQ1MWQ4bVNJbTFhaFROc1QvTGdLRHhyUVpSNXNQU09aRXpTSmRreTN5?=
 =?utf-8?B?UnFNb29UUUtnWUoyU0lXaDd3UmRLM1JCMzFIRkE4VXd0cTZKUWwxdXNnblFB?=
 =?utf-8?B?dHdRdjJoaTBDaWNscFFkUkJUcUtiQlNjV2xadDk0VUxhZlR3UElPenhaTTBl?=
 =?utf-8?B?SC8xWmV0WVFCZVRJNDk2bjZmcUMxc1Z4RDlUdzhWOUhYRHR0MnNMV252TzY3?=
 =?utf-8?B?NktHOENxMTRqQXZPbjViYms5Vi8wUmdHSU1LSkJzMkwxWHhZM0daRDhLa2tu?=
 =?utf-8?Q?XXt6tH?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7PR01MB14910.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UFdNU1pHZUZzSTA4SGg5Mms5blVYT01RV0hrNUlNYWdNOU83WWJ2eDMzMTdq?=
 =?utf-8?B?ZTl5d1J2WUVkN1hVL1NMaDkrSlZZbEowOVRicEkwTmNnSnhBamtrZFVQRFAz?=
 =?utf-8?B?RlEzQVUrTUJQVlhiQzhWZnBWbEdkakgvUFhkakdlYTdScVN5N2RDbHVpSkYv?=
 =?utf-8?B?dE9JS0dNbmljejI4NExCSExHTHNENXVqNWRjalc4cHJuOUhJNzF1OXhZdWxw?=
 =?utf-8?B?SnJCbENieGxjWU1EaThkQjZzSm42SUM5QW52bEhqM3lXTnNkcEZuMnlKSG9h?=
 =?utf-8?B?S1VydE9EcTJ4aFpzRXVmaHU1Nm45ditUdnE5M1ZDUXJoRjJTU1BzRmFkalFx?=
 =?utf-8?B?R0JBN2pMNHQ5Q2RTc01EUlNQTU5NdGVualZIU0JlZWxQTzdKTHczWjB0M0kx?=
 =?utf-8?B?VE9CSXpGQ0hNZFRxaHg1MGVwdWtJNmk5R0VQdm1obWdYRUlZZUxKSDhyRjd3?=
 =?utf-8?B?azlXRVF3MGxubkRoNnFmS0FZaU54NVhhUFhCTWZibWdHRFBSZkdsZ0Jjb2M3?=
 =?utf-8?B?NXJvS3pFY1FYZXNHN25IcW1ORzBMaXlpYjk3ZnVVVFVvNThxV1ZxVkU2Qk0z?=
 =?utf-8?B?QnpXMFdWK3hrbkx1RU1xblo4T2E4eVVpSmFQeitXQ21sTVdXUElVaGR2WUlI?=
 =?utf-8?B?SXZCS0pyUmJiUzIvK0tGQXNWcWJ3ZzI2QlhyOGpFU1BBQnArd3JrTXViRk4z?=
 =?utf-8?B?bjhJaUdwajdURmVKdTRpY2dsQnFubTU1V3EwMmlqaVFjZDVXKzN6M3dKVjBn?=
 =?utf-8?B?NFBiOXdBWHRWUC9mQ2N4WGJqSnZDYjllSndXWk4wb0piTnppdXJRTlBhOTM3?=
 =?utf-8?B?Sk9jV3VFN3FvSDgrV0JXQXE2eHVTZVUxcmZLT3RIaEdmNk8rTkF5WW5MeUZt?=
 =?utf-8?B?OUFCTE53RDFNUDQ4NEJCMjVlR2JhSExZQTNtN1d3UCtpelNmeU11eEpLSG05?=
 =?utf-8?B?c2FMeHJhVFdSTGlmSHo4MWZVVkN3aGFDcHo0WGxxRXRTeTNiZWhVcnVKMzRQ?=
 =?utf-8?B?SEYrakw5aUJ0aUI1OTRWZktiUm8zQUxvZnd1Tjl5MGVEWG91dUFZa2tsNG1u?=
 =?utf-8?B?TlkzZUM5MFNwUi9JM3Q4WjJtZ25XRU8xQ1Yzc0NQTjErcnNWWUNlYlgrV0VZ?=
 =?utf-8?B?bjdhRlF1TWs2MHNVRTJhK1EyTG1vSUhCVEswSXYvalBFdEVYMFFTOUY3WG4r?=
 =?utf-8?B?dVl0c3grTHRhSy8xeC8rK1VZQUJGSWNrUmpXbk14aFNjSk9iZVNtVWlQYlEx?=
 =?utf-8?B?Nnp0cGJRY2dtYlJIRjBRRkMxY2U2ZEdBY2hJS0JOa3pTSXl0MnNpallqaXVH?=
 =?utf-8?B?WHlYZjROMlE0Z0JBWFh6bkdmL0NITDRobmlNczE5Z3ZkbmdBZEUxenlxaTNj?=
 =?utf-8?B?bzZzRFNGbWs5Vm1CYUtJT1RQZnQvNnZHNmlGRU5jUzE2MFk5bUF3a1Jab3dw?=
 =?utf-8?B?b2FpRVRjOXpHZkV0cDFYTkRtQUVIaEthUTY0SW1FWjVRWmJVTklESGtiSC91?=
 =?utf-8?B?VVFqV3FkWmRXemJMTEVMWVJOQnUrOUwxcUhtTmhWT1ZtTjhnZ3k4NVFLWWRv?=
 =?utf-8?B?QnpmVUc2cEVUVFJqc3YwT3Y2VlkyamEzbk1TOHpMU3MyQ0I5ckw5SmMzZmdO?=
 =?utf-8?B?dWVBUWlYRWZxaGpJZ1dzcVdHOTJjcDJqM3NydHlDakl0VFdlUERvTTVDM2x2?=
 =?utf-8?B?WEdkZHFKN2hiSEdpYXlhdmQxYlg2NnAxZC9hdDhRajZEZ1cvTG1rNm1samJt?=
 =?utf-8?B?QUs5bXNjR1B2cUdzMjRFc0I4dENCY0JMcXl4NzlPa3V4andhRmhDWlUvdFJ0?=
 =?utf-8?B?UTZ4NVM0RnNaQzkzcU0xcG8zM2FTazVFdVA2NllKR3hTS1JyNkR3S2xXanhj?=
 =?utf-8?B?RzNnbUkxOHZyOEsvRE5EODdpekVId2FwVlA4Z05JVkZKSFo1ZWQxbFlWMEdF?=
 =?utf-8?B?M1NZTENTSDFac2pwQ2tZVTU4aUgrcjVxVkhObFYwZnFwcnp4WjF4S2FtWmNN?=
 =?utf-8?B?aEcxR0xmSHN5R2lpVWF0eEhPMHhvWFFObmVqRlUzUWttMEJiS1AwYkFGeWI0?=
 =?utf-8?B?WUNVYjg2dzhCVkRxYkVZRGUrd0pzMmIvNm55b3YrelNxUm54MTNMQ01UNTZO?=
 =?utf-8?B?Qy9vaS9OS2w5MjMxRExqY0hocWdYK0lwSEZnK2RzRVpsU1lzMTB4ZG10MnZ5?=
 =?utf-8?B?a1E9PQ==?=
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
X-MS-Exchange-CrossTenant-AuthSource: TY7PR01MB14910.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 972fd340-ca93-4be7-ae4c-08de22c87e16
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2025 15:22:43.6899
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8TYRo8wupzSLj+PlymI54diy05TUVLG5Zg+HwclYrUTHZSVw1245ptIvRUE4G5gGhiXzSssLtGQy8w2PD/JXwfRpBhFtz4PjrV3ha9NUuxM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11863

SGkgR2VlcnQsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VlcnQg
VXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4gU2VudDogVGh1cnNkYXksIE5v
dmVtYmVyIDEzLCAyMDI1IDQ6NDkgUE0NCj4gVG86IE92aWRpdSBQYW5haXQgPG92aWRpdS5wYW5h
aXQucmJAcmVuZXNhcy5jb20+DQo+IENjOiBtYWdudXMuZGFtbSA8bWFnbnVzLmRhbW1AZ21haWwu
Y29tPjsgcm9iaEBrZXJuZWwub3JnOw0KPiBrcnprK2R0QGtlcm5lbC5vcmc7IGNvbm9yK2R0QGtl
cm5lbC5vcmc7IGxpbnV4LXJlbmVzYXMtDQo+IHNvY0B2Z2VyLmtlcm5lbC5vcmc7IGRldmljZXRy
ZWVAdmdlci5rZXJuZWwub3JnOyBsaW51eC0NCj4ga2VybmVsQHZnZXIua2VybmVsLm9yZw0KPiBT
dWJqZWN0OiBSZTogW1BBVENIXSBhcm02NDogZHRzOiByZW5lc2FzOiByOWEwOWcwNTdoNDQtcnp2
MmgtZXZrOiBBZGQgTk1JDQo+IHB1c2hidXR0b24gc3VwcG9ydA0KPiANCj4gSGkgT3ZpZGl1LA0K
PiANCj4gT24gTW9uLCAyNyBPY3QgMjAyNSBhdCAxNTowNywgT3ZpZGl1IFBhbmFpdA0KPiA8b3Zp
ZGl1LnBhbmFpdC5yYkByZW5lc2FzLmNvbT4gd3JvdGU6DQo+ID4gUlovVjJIIEVWSyBoYXMgYSB1
c2VyIHB1c2hidXR0b24gY29ubmVjdGVkIHRvIHRoZSBTb0MgTk1JIHBpbiwgd2hpY2gNCj4gPiBj
YW4gYmUgdXNlZCB0byB3YWtlIHVwIHRoZSBzeXN0ZW0gZnJvbSBzdXNwZW5kIHRvIGlkbGUuIEFk
ZCBhIERUIG5vZGUNCj4gPiBpbiB0aGUgZGV2aWNlIHRyZWUgdG8gaW5zdGFudGlhdGUgdGhlIGdw
aW8ta2V5cyBkcml2ZXIgZm9yIHRoaXMgYnV0dG9uLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTog
T3ZpZGl1IFBhbmFpdCA8b3ZpZGl1LnBhbmFpdC5yYkByZW5lc2FzLmNvbT4NCj4gDQo+IFRoYW5r
cyBmb3IgeW91ciBwYXRjaCENCj4gDQo+ID4gLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9yZW5l
c2FzL3I5YTA5ZzA1N2g0NC1yenYyaC1ldmsuZHRzDQo+ID4gKysrIGIvYXJjaC9hcm02NC9ib290
L2R0cy9yZW5lc2FzL3I5YTA5ZzA1N2g0NC1yenYyaC1ldmsuZHRzDQo+ID4gQEAgLTksNiArOSw3
IEBADQo+ID4NCj4gPiAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL3BpbmN0cmwvcmVuZXNhcyxyOWEw
OWcwNTctcGluY3RybC5oPg0KPiA+ICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvZ3Bpby9ncGlvLmg+
DQo+ID4gKyNpbmNsdWRlIDxkdC1iaW5kaW5ncy9pbnB1dC9pbnB1dC5oPg0KPiA+ICAjaW5jbHVk
ZSAicjlhMDlnMDU3LmR0c2kiDQo+ID4NCj4gPiAgLyB7DQo+ID4gQEAgLTM0LDYgKzM1LDIwIEBA
IGNob3NlbiB7DQo+ID4gICAgICAgICAgICAgICAgIHN0ZG91dC1wYXRoID0gInNlcmlhbDA6MTE1
MjAwbjgiOw0KPiA+ICAgICAgICAgfTsNCj4gPg0KPiA+ICsgICAgICAga2V5czoga2V5cyB7DQo+
ID4gKyAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAiZ3Bpby1rZXlzIjsNCj4gPiArICAgICAg
ICAgICAgICAgcGluY3RybC0wID0gPCZubWlfcGlucz47DQo+ID4gKyAgICAgICAgICAgICAgIHBp
bmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7DQo+IA0KPiBEbyB5b3UgbmVlZCB0aGVzZSBwaW5jdHJs
IHByb3BlcnRpZXM/IC4uLg0KPiANCj4gPiArDQo+ID4gKyAgICAgICAgICAgICAgIGtleS13YWtl
dXAgew0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGludGVycnVwdHMtZXh0ZW5kZWQgPSA8
JmljdSAwDQo+IElSUV9UWVBFX0VER0VfRkFMTElORz47DQo+ID4gKyAgICAgICAgICAgICAgICAg
ICAgICAgbGludXgsY29kZSA9IDxLRVlfV0FLRVVQPjsNCj4gPiArICAgICAgICAgICAgICAgICAg
ICAgICBsYWJlbCA9ICJOTUlfU1ciOw0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGRlYm91
bmNlLWludGVydmFsID0gPDIwPjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICB3YWtldXAt
c291cmNlOw0KPiA+ICsgICAgICAgICAgICAgICB9Ow0KPiA+ICsgICAgICAgfTsNCj4gPiArDQo+
ID4gICAgICAgICBtZW1vcnlANDgwMDAwMDAgew0KPiA+ICAgICAgICAgICAgICAgICBkZXZpY2Vf
dHlwZSA9ICJtZW1vcnkiOw0KPiA+ICAgICAgICAgICAgICAgICAvKiBmaXJzdCAxMjhNQiBpcyBy
ZXNlcnZlZCBmb3Igc2VjdXJlIGFyZWEuICovDQo+ID4gQEAgLTMyMCw2ICszMzUsMTAgQEAgaTJj
OF9waW5zOiBpMmM4IHsNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgPFJaVjJIX1BPUlRf
UElOTVVYKDAsIDcsIDEpPjsgLyogSTJDOF9TQ0wgKi8NCj4gPiAgICAgICAgIH07DQo+ID4NCj4g
PiArICAgICAgIG5taV9waW5zOiBubWkgew0KPiA+ICsgICAgICAgICAgICAgICBwaW5zID0gIk5N
SSI7DQo+IA0KPiAuLi4gYXMgbm8gYWN0dWFsIHBpbiBjb25maWd1cmF0aW9uIGlzIGRvbmUgaGVy
ZT8NCj4gDQo+IElmIHlvdSBjb25maXJtLCBJIGNhbiBkcm9wIHRoZXNlIHdoaWxlIGFwcGx5aW5n
Lg0KPiANCg0KWWVzLCB0aGUgcGluIGNvbmZpZyBpcyBub3QgbmVlZGVkLCBwbGVhc2UgZHJvcCBp
dCBiZWZvcmUgYXBwbHlpbmcuDQoNClRoYW5rcyENCk92aWRpdQ0KDQo+ID4gKyAgICAgICB9Ow0K
PiA+ICsNCj4gPiAgICAgICAgIHNjaWZfcGluczogc2NpZiB7DQo+ID4gICAgICAgICAgICAgICAg
IHBpbnMgPSAiU0NJRl9UWEQiLCAiU0NJRl9SWEQiOw0KPiA+ICAgICAgICAgICAgICAgICByZW5l
c2FzLG91dHB1dC1pbXBlZGFuY2UgPSA8MT47DQo+IA0KPiBUaGUgcmVzdCBMR1RNLCBzbyB3aXRo
IHRoZSBhYm92ZSBmaXhlZDoNCj4gUmV2aWV3ZWQtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2Vl
cnQrcmVuZXNhc0BnbGlkZXIuYmU+DQo+IA0KPiBHcntvZXRqZSxlZXRpbmd9cywNCj4gDQo+ICAg
ICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0DQo+IA0KPiAtLQ0KPiBHZWVydCBVeXR0ZXJob2V2
ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LQ0K
PiBtNjhrLm9yZw0KPiANCj4gSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNh
bCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuDQo+IEJ1dA0KPiB3aGVuIEknbSB0YWxr
aW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGluZyBs
aWtlDQo+IHRoYXQuDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMg
VG9ydmFsZHMNCg==

