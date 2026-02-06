Return-Path: <linux-renesas-soc+bounces-27967-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QCIgBSt/hWlmCgQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27967-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Feb 2026 06:42:03 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DCC7EFA668
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Feb 2026 06:42:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 206F13037F1C
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Feb 2026 05:41:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2FBC33A70F;
	Fri,  6 Feb 2026 05:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="hikmbth6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010018.outbound.protection.outlook.com [52.101.229.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DECE2BCFC;
	Fri,  6 Feb 2026 05:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770356513; cv=fail; b=tGyKUWUm8daWUHyz78s+xswhuD35z2C2iQtaoZnb/VlTixJXriHeaFMczaiW2G1eGvhBv6IZMbB/9BmsZlC0KmrHPiPzxb80upYOJoTiL6Xpu9dwDiBg2NgJV1iG1BzkpA/RhKQ/l7Fq05S2Mr4IjBB5FPhSDyJdc++K0GyTauE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770356513; c=relaxed/simple;
	bh=FNeW8CuJc4S9OoUFPcP4ZnDv8EIqDBGm7C/vfzc7rpg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=PF1F9S3CMnUVklTYIMqusxy4EDCs9AG6JxP1qgn4ZbzBgHAGW+L3PnmONFtxmjsGmeRaK0bW0k4JgI9adNZTnV3N8DG1HF/evNnEfwtMinkkuSqard/h1zFuwQmXuOhSHLdvxS/dmPySdrGbZIuTc6ONdIukFrQTW9/8tAmEuDs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=hikmbth6; arc=fail smtp.client-ip=52.101.229.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z8Frq7e9z1GxVNaQh5sK2S7OpDhKsC/3PBMBJjcNFl1BgNfgG7+3HBUspdOpBMe6AETAosjOETlbtU9ZPqodmZPZ6cZVgrA2lWFoyWbsOIJ/60/8kgygO/dqrdiD/d/JQ7T1hq2t2EErN5PeZ7n+LdmdMzycN4M5rHegPOIyFRfN5wr8klhvM1Y5ycAa0FZWUe1bIZFavv738S+cPwCaef9q3JBG5EHH9mNl3/u2JFkEFjMAIYrv1+XinHJcs1Mt8c4CQ2UY5g2bXdcUp71LuPJKRF/CLJ4/NC/3IKWhR9WqnCew9UVFLyVnsZFBv7Ysjh/6bpTdTnpzYAIAXorssA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FNeW8CuJc4S9OoUFPcP4ZnDv8EIqDBGm7C/vfzc7rpg=;
 b=LO/Sv//nKBhJjqUbq8xTi/PE3gaISU2SwF0yOwe2ZC18dNYqN1AqKKynfhR1b/v7+ZBcOP1YFS7t95c1s6Ee8TSFckm6TJh9OFKJmtmu/X2hGIG5XwaDYsViSLqzAffc1jT+IM5wwiSNQ47VvAB46xHNSQotFQzc4Mt4BKbpxib6KtR4kKFkncg07aFgO8rK+A87B/9jRzASlEM0JFRP+2+3rZ8kOwl9Ufuaw531Rigy0EkF4ZbJQXsIumeFuC0HmJDtYNWtK6EcmfigKndKhaDEgNfuamIii8s6ge/8T5RtuUpNlWiax7+VbrvceBIbeanrvYjCXplUAHZ4b33haA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FNeW8CuJc4S9OoUFPcP4ZnDv8EIqDBGm7C/vfzc7rpg=;
 b=hikmbth6XnA69K0qoAMhMDXLAVedLl/3yD8xU9+tLl1cWmzEEKDhGiQ9YdsXKLyjOJXDH5/NSmxmMgh5IND0Dq+9OZaW7pVnqoJaHR6hNZJhFpQbvWlTI8SN6wpRli6KV5W2hjsai39SqzShofpEponYjB3KV70tJl0xGIRmOz8=
Received: from TY4PR01MB14282.jpnprd01.prod.outlook.com (2603:1096:405:20d::9)
 by OS7PR01MB16952.jpnprd01.prod.outlook.com (2603:1096:604:420::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Fri, 6 Feb
 2026 05:41:47 +0000
Received: from TY4PR01MB14282.jpnprd01.prod.outlook.com
 ([fe80::655d:9c47:4499:eb3a]) by TY4PR01MB14282.jpnprd01.prod.outlook.com
 ([fe80::655d:9c47:4499:eb3a%6]) with mapi id 15.20.9587.013; Fri, 6 Feb 2026
 05:41:46 +0000
From: Michael Dege <michael.dege@renesas.com>
To: Nikita Yushchenko <nikita.yoush@cogentembedded.com>, Yoshihiro Shimoda
	<yoshihiro.shimoda.uh@renesas.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
CC: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Christian
 Mardmoeller <christian.mardmoeller@renesas.com>, Dennis Ostermann
	<dennis.ostermann@renesas.com>
Subject: RE: [PATCH net] net: renesas: rswitch: fix forwarding offload
 statemachine
Thread-Topic: [PATCH net] net: renesas: rswitch: fix forwarding offload
 statemachine
Thread-Index:
 AQHclm8qD3lunnbaf0uAuh27IRHtALVzunqAgAADMACAAE+JQIAAD2EAgAAA0hCAAARnAIAACY8QgAACvYCAAAD+AIAA9TZQ
Date: Fri, 6 Feb 2026 05:41:46 +0000
Message-ID:
 <TY4PR01MB142820FC29E751D8C7F0B7C348266A@TY4PR01MB14282.jpnprd01.prod.outlook.com>
References:
 <20260205-fix-offloading-statemachine-v1-1-640224a531d0@renesas.com>
 <3b1405cd-6c7f-4883-95fb-151cab223a68@cogentembedded.com>
 <d6a9356d-6fd4-459b-9c5a-2f3e20368bbd@cogentembedded.com>
 <TY4PR01MB142829D9748A483ECAF19FD3D8299A@TY4PR01MB14282.jpnprd01.prod.outlook.com>
 <25ff0841-545b-433a-8e88-6e463ea718e7@cogentembedded.com>
 <TYRPR01MB14284CB75C7DCD35381BD17EE8299A@TYRPR01MB14284.jpnprd01.prod.outlook.com>
 <237bee8b-a7cf-4c14-9946-8bf72dbddde5@cogentembedded.com>
 <TY4PR01MB142829EB0EDDE13B588F949298299A@TY4PR01MB14282.jpnprd01.prod.outlook.com>
 <a4cfeba2-23da-4fdd-870b-6533b5ce267c@cogentembedded.com>
 <5b8bcf37-5cd0-4c32-b0ba-3386142b7795@cogentembedded.com>
In-Reply-To: <5b8bcf37-5cd0-4c32-b0ba-3386142b7795@cogentembedded.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY4PR01MB14282:EE_|OS7PR01MB16952:EE_
x-ms-office365-filtering-correlation-id: b013ad51-7b4c-4ad4-e79e-08de65426ae5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?RiszcUljS1NLVUFjbndBWVAzSEwvN3dtYkN3cVp3SjRsb1NSbFQ3OHNVb3RX?=
 =?utf-8?B?Yk1MbDRhU0FvWkU0M1VEQW05ZG45YWw2OUFzRkZCR09jV3BoSk9hN2RCcHBB?=
 =?utf-8?B?eHRYL29rUDhrbm5kWUVSNVQwemVXWnB0SFhSdjUrNEZVUVRPRzBPeWc2aGJm?=
 =?utf-8?B?dFBuOUxsSEdaSXJDQTRMTndWaVJIaVZTbm5GVW5KVERQVVZQZlI5c2pYVHdI?=
 =?utf-8?B?bjQrWU1Hc3lBclNTMU91WUxPVTNrck00U2krVVVxR1Ixc2k0WTR6YTlKSjg4?=
 =?utf-8?B?OHhyUnZJQWh5bU4wVHFCZlV2L1N6ejNOYW50RlpZM01WMllMYzVtUHl2d05B?=
 =?utf-8?B?RDRTUy9XQlZSZ1lMKzlBck1LNXJiOVB2a1N1S1pkclJJTENsR21HK1ltUXlx?=
 =?utf-8?B?ZkhXOFB1bW9lbmFIN0FVVW5uNWZzd0JNeVJiaTJrMCtQbFNUREQ2bGtmWTd0?=
 =?utf-8?B?bU93cTY1ZlE3cUlURlRkc2VzaXdPeUVRSWt1SW9EM0lURTBURGw2bStPQ0po?=
 =?utf-8?B?WTZIUnB1M29TZEV1MGtFRnlQLzNYbXkvRUR0UDRZWHU0NXljRjdvc2I3ZzA0?=
 =?utf-8?B?N3NXK0drVnAyckh1SjVkYjR3VE1tc3Q3YzBCdHRPLzBua1RpcDhjREFmTUtC?=
 =?utf-8?B?MXpmNFNrWU1aSlQ0R2tnSmo4OUlWK3czQ090a05yWlc4Y2M3TktFT0VodHAx?=
 =?utf-8?B?dGJFK3ZvbTNsMkkzSnNLNkt3bjlsY3lUam5aZTVoZ2p4NEY0Q0NzWlZLUmtL?=
 =?utf-8?B?N0RJZzZXTmM5OHZCYml2VHo5RWJUVjVGK2dVRGpSOTk1aUNIWS9XMFdBVUJs?=
 =?utf-8?B?Y2gwOXpacFU3a01lYkxQUzgyQlFLWldmRXJGdFMyVkhEZ3Jqd1lBa3d0bTd5?=
 =?utf-8?B?NjZaTkNKTGxwSk9jS1VhcmhtcnF5YnI1T2VqU3pZSkloWXpNektneGJkdVNK?=
 =?utf-8?B?aWpNbWQxdHZLWUxDYTlqT1I0WTRCdlltRms0bWhqVGE0aDREUG9pbzJxeDVi?=
 =?utf-8?B?N21Qa3RCOTM1ODR5WmRJSXNrM1ZaME5wWjJpa3VleGIwTUZJQVQ0aElaVkxF?=
 =?utf-8?B?L0Q4S1V4bDR1UG5PUE9QamNkRlVtRW0rbU0vQlFTK05pcmpEa3BZSGN5NVFF?=
 =?utf-8?B?WFk3RVc4bGd0dW16RHozRHUvUjFWMmgvZnhXMUhBNW1aMmVud2FmWnE1NmJj?=
 =?utf-8?B?SnZYMENTc09sTGlNcUk5bTRxWHNONHZsSXVQVkwxNVVMZDNBQ2FKWHdyMmtH?=
 =?utf-8?B?ODNLZ0RMOGx1M1hqZHpuM2RPL2tpbGpZeC9iNXVwMURBS3RyOUNBWnpCV056?=
 =?utf-8?B?Q25ma3J0K3NwelNjdm5lWlBIS2hUK0JlZjFMcVh0Q3lZOVJPemwzVDgwNFFk?=
 =?utf-8?B?Y2E4Tk9jWjJoVmdlVlNrZElWMUw5QkpUVXJhR29pQjBvRVhTM1VrQStMcTFH?=
 =?utf-8?B?MXNpZEw2eElqRGxvWldrbWNzUEVCQjBxKzM1V25jU0luZlVHYXhBN2k0NlpF?=
 =?utf-8?B?dlFINFBDRlRCYkhadnAxUzVYQzBJb0N1QktIeE9YQTlNcUxnWUxRVVFkUW9o?=
 =?utf-8?B?MThWRHh4V3pnTkdkU0FFMFVKMnJkcnR2YnFwSTlvZlM0SUU3bHhucjc2dkJo?=
 =?utf-8?B?dlN1TlRlZkFacTBCQW9hM2h1Y0hPVTY1Wlh5R3lURUtOOTlRQkt1M1pOeklN?=
 =?utf-8?B?bFdqcUFXZUg1bjNtWnF5NSsvNVZKczlNMTQzU05sUFhIZlBKNXpxY0RNNkhD?=
 =?utf-8?B?YnRJNUwxeWhxaGEzYU9oVXpKRkc1dUV3ZGNqQy9LNSt3Sk0xd0FHcUpBM0x3?=
 =?utf-8?B?b0pFeUNMbUFXK3VmL0xpUXAwRWdseFd4TlNWZFcyV1VQNTNReFVhcitJNnk1?=
 =?utf-8?B?REpCRG5LNzRaSWs2NGhsQ1dHaVExK1F0bktad2ExOFE5RE1XaFByN0hMbE1l?=
 =?utf-8?B?UUJncm5za0ZrNzM0dm5naWtqMUJseitvajl0Y3pqck5PZkFObEtMR0J3YkZM?=
 =?utf-8?B?L1E3L1BEcFRTclBYWHpsVDhpbUZydi9HSm9mRHphOFVMdFA4M0VhVGQyVFAv?=
 =?utf-8?B?ck9lTU4yVEVDRGdWNkM2cUhIVlRNMTNjQVh5eHZ2STR4RWdobldhUHFkWTBu?=
 =?utf-8?B?U0NiWEhwSHpaNWV5RTVWT015YTcyNUY4eDNCR0wwTnMvZEhqSjNsKy8vNmgz?=
 =?utf-8?Q?r47uyNnoVrwx6kxcB7GeN2w=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY4PR01MB14282.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bFdjVzBGSmRGVzNYUXdaMTh4eDdhNzNpVDE4enV0ZDBnSUVYNmkzMVV3dFZ5?=
 =?utf-8?B?SmpaaHhabmhLVVVYckdzalFvYXNuZDdUcjdXaURENHo3K00yYWFEUHdEYVJz?=
 =?utf-8?B?QXJCdWxuUU1kNlBqVlVSNm56YlFmSmM2YjZZdTRjMGlNME5idUVPZjk3bTBV?=
 =?utf-8?B?QksvaVhjcmxWV3JFanVQL2ZhUEM3TVc5ODFTVTdBSUtMUmI0UXpzc2d0Wm5K?=
 =?utf-8?B?eUJXL01RNGNFbFlXZ1RlejAvNjRlK0o3QUZsdG1ZN2lPTUp1MXlmaGhkTVBj?=
 =?utf-8?B?QWhQYWE3dVgvMzd3b0hUSnp4UnRtenRZcDE1eDlkTDY0NGR0Z0RSU2hBL0RT?=
 =?utf-8?B?ZWx6WEN4ZGVDSjlmSUI1WGFSZVV2QzcyRCtROThyQkFGQ1VKUzFHbmU0Y2No?=
 =?utf-8?B?Y3ZJdVVYN3g4WWJmSVp3Z2pmQ1NMR3BaTURRNFVHYjlzQlNyTVYwSjc5ZzRV?=
 =?utf-8?B?ODROWENibXd5dUxlcTZIcC9xTktEOS9JRllPWDVOYlF2b0w5R3lXdWxEMVVH?=
 =?utf-8?B?ZklxcUdxSU5LaGNReFlzZjdlSmdNQS9oblhMMGJsandNd1JOZzZLV3VHVEwy?=
 =?utf-8?B?WGJuSjlDeERKT0YvTXZMa0twR0YrajZLQUhqenZaRXd4Zi9TT1h6NGFtMHhj?=
 =?utf-8?B?Uy9xRzRIRDdRcmNuaS9ndHlqOUlwS3AxWXY5TFphYnJHRUd6QlZITWQyVjFj?=
 =?utf-8?B?ZXd1Nk1hU25EV0lrL2x0Rk8ySUo2VHpZSHNjOVVlNUl3dldQK2tYeklmK0NG?=
 =?utf-8?B?d21NWmtydm1BNmpqb2g4dHE4WllVci8vcUdGblc5K2xMbUFOYkpNRzBuWlB6?=
 =?utf-8?B?eGdZUUpNY3U1c3ZFa0Z0UkI2MTl0b3JmaTFNVXByMnlWMzZCaDFRQnlGQXZp?=
 =?utf-8?B?WmdyN1VJcHppRkFqdWp2V1YyOGdoOStBRzFtSDBITDg0S3I5cVg2MktnUWNv?=
 =?utf-8?B?NkVZMEFCZm1sMlJydFpLc2FnNVNDeGJqQlRPMnYrOTdvUlA3Mjhvd01COW5P?=
 =?utf-8?B?N1lndXdJSVM5RFh3bkZXbkw5aytkZUJJT2NFRUxLcEpZbUFGblpKaURraElF?=
 =?utf-8?B?TFlpL1dUVGJsUUV1d3lFTXNsTXd1SS8yeHJBSnk5YVVPL3RFc2VFUG5xTVFP?=
 =?utf-8?B?QzRmL2xRZlp5ZTYrcnRpMkZTbjRzTWp5UTc2ZytXTVhVaWdkSWo2V25OYWMx?=
 =?utf-8?B?ZktndDZQSCswQXh0OWFDaGthajdNTzJCM3c2dFg2d3JoTEg5dVJsVlNWMkJN?=
 =?utf-8?B?ZWNrQXZ3MWtnKzJzeEkrVHcxSnl0a0dJdHY0dUpleU13cVBHVVBUQzJKQThG?=
 =?utf-8?B?Wk9kK2c4NTVpUTNhcmw4L0YvYnNlb2MrWTJvZnM1MzZxTmFOSVBGUDZPeXNI?=
 =?utf-8?B?MnlFMGZMaFN1T1FscGdmdkd2d0Z6Y0dJOXQwUnB3TldOL1l0d3BNVTZja0g4?=
 =?utf-8?B?TlVNY1o2a3pPZEk1WUw2NVRMTzgyOTNjWDREU3NwMUlidEV0Y1E1akhHSy85?=
 =?utf-8?B?UC9hU2pBOUJWd2h6djdoRE1Sck5qcXZ2YStxUmdMU0s1c3Q5K1JYUTFNZ1l0?=
 =?utf-8?B?bGFQVTZ5VVgwZmU2VTVQVXppTjZPUlhodzFITk1kWU5pSnY1NmdTaDNsR1lm?=
 =?utf-8?B?S1Q4VmlQTnVzcGZ1aEhqbzFPQkRBNG01RUVCaTZ6U2NQUGVCZEVMSElqbVZq?=
 =?utf-8?B?eVI2RjV3c3JNdHRsWHZHZXg4K0hvWGZRL3lzSHBlYTB0eUdyODdqa2lod25a?=
 =?utf-8?B?UWxlcThpVTh5bk5ndTlCUTQ3Z1ROUk1BclEvQkxpQ1gwVnJjVllQTFBacHNT?=
 =?utf-8?B?b0UwSlRPUGRTUmVuR096c29acEdqRy9jYWJqbEYvemg3ZEdWa3RQUTAwbmkv?=
 =?utf-8?B?ZFhFdDJEdmt4cjNCT3N3SEFJY0lPQzRFUXBaSnlIWHlrMTRlSXIzREZhdXor?=
 =?utf-8?B?eEdaN0VtTkhFZHBHR2RNeGcyOUVBcmxJUk14UVh3dzlGWEtMcVlLVE00WjdV?=
 =?utf-8?B?UFlBTHlHcjlHVHE1S056bmxteFRkN3JOY1VJWERELzV1U05BODJMaDllS2RJ?=
 =?utf-8?B?WXB4bzZNNnFGcmJUbzNNWlBKVUJqT3RURVU5TGVyY2s5TE1VOWcyZnB4aGtC?=
 =?utf-8?B?dVRkdTNJZVYybFphQlV0NlNDZHVoZEVwSlpkMTNuendheWlMRFNoTVFCK2ts?=
 =?utf-8?B?eFlTNllHRlM1RXZUV2pFYy9YYnc3RDBPbXV5Y1UvMnNvNUtjL0ZMaEhud3VJ?=
 =?utf-8?B?TXdsSi9WMHkyZjBoNzRTeHpTa2pGTStjWFVhTW1ERFAxTWdMUTFPN09RMndQ?=
 =?utf-8?B?eHhtek1GYzg1OUNWR282REV3RXQ0TjdybDl2NWlCVUhiZGVGOHVIdz09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: b013ad51-7b4c-4ad4-e79e-08de65426ae5
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Feb 2026 05:41:46.8505
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6ViMkOdpDfuiS9lRa/tsPzJJv5HFKSUD99KXxDWrTS5nKw0TJqV+JVg0lAh8JuVNPi+sSfqrPU4dymoFeyLxelzjoJ83syFKCQqK/bQ9guU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB16952
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-27967-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michael.dege@renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[renesas.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,netdev];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,davemloft.net:email]
X-Rspamd-Queue-Id: DCC7EFA668
X-Rspamd-Action: no action

SGVsbG8gTmlraXRhLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IE5p
a2l0YSBZdXNoY2hlbmtvIDxuaWtpdGEueW91c2hAY29nZW50ZW1iZWRkZWQuY29tPg0KPiBTZW50
OiBUaHVyc2RheSwgRmVicnVhcnkgNSwgMjAyNiAzOjQ1IFBNDQo+IFRvOiBNaWNoYWVsIERlZ2Ug
PG1pY2hhZWwuZGVnZUByZW5lc2FzLmNvbT47IFlvc2hpaGlybyBTaGltb2RhIDx5b3NoaWhpcm8u
c2hpbW9kYS51aEByZW5lc2FzLmNvbT47DQo+IEFuZHJldyBMdW5uIDxhbmRyZXcrbmV0ZGV2QGx1
bm4uY2g+OyBEYXZpZCBTLiBNaWxsZXIgPGRhdmVtQGRhdmVtbG9mdC5uZXQ+OyBFcmljIER1bWF6
ZXQNCj4gPGVkdW1hemV0QGdvb2dsZS5jb20+OyBKYWt1YiBLaWNpbnNraSA8a3ViYUBrZXJuZWwu
b3JnPjsgUGFvbG8gQWJlbmkgPHBhYmVuaUByZWRoYXQuY29tPg0KPiBDYzogbmV0ZGV2QHZnZXIu
a2VybmVsLm9yZzsgbGludXgtcmVuZXNhcy1zb2NAdmdlci5rZXJuZWwub3JnOyBsaW51eC1rZXJu
ZWxAdmdlci5rZXJuZWwub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggbmV0XSBuZXQ6IHJlbmVz
YXM6IHJzd2l0Y2g6IGZpeCBmb3J3YXJkaW5nIG9mZmxvYWQgc3RhdGVtYWNoaW5lDQo+IA0KPiAN
Cj4gDQo+IFdCUiwNCj4gTmlraXRhIFl1c2hjaGVua28sDQo+IFN5c3RlbSBTb2Z0d2FyZSBFbmdp
bmVlciBAIENvZ2VudCBFbWJlZGRlZA0KPiANCj4gMDUuMDIuMjAyNiAxNTo0MSwgTmlraXRhIFl1
c2hjaGVua28gd3JvdGU6DQo+ID4+PiBUaGUgZHJpdmVyIHdhcyBvcmlnaW5hbGx5IGRlc2lnbmVk
IHRvIGVuYWJsZSBoYXJkd2FyZSBmb3J3YXJkaW5nDQo+ID4+PiB3aGVuIG5vdCBsZXNzIHRoYW4g
dHdvIHBvcnRzIGFyZSBpbiBmb3J3YXJkaW5nIHN0YXRlLiBXaGVuIG9ubHkgb25lIHBvcnQgaGFz
IGh3IGZvcndhcmRpbmcsIHRoZXJlDQo+IGlzIG5vIGRlc3RpbmF0aW9uIHRvIGZvcndhcmQuDQo+
ID4+Pg0KPiA+Pj4gTmlraXRhDQo+ID4+Pg0KPiA+Pg0KPiA+PiBUaGUgY3VycmVudCBkcml2ZXIg
YWxsb3dzIExpbnV4IHRvIHVzZSB0aGUgYnJpZGdlIHBvcnQgYXMgbG9jYWwgcG9ydA0KPiA+PiB0
byB0aGUgYnJpZGdlLiBUaGUgb2ZmbG9hZGluZyBBbHNvIHN1cHBvcnRzIHN3aXRjaGluZyB0cmFm
ZmljIHRvDQo+ID4+IExpbnV4IHRocm91Z2ggdGhlIGJyaWRnZSBwb3J0LiBUaGVyZWZvcmUsIHRo
ZSBvZmZsb2FkaW5nIHNob3VsZG4ndCBCZSBkcm9wcGVkIGlmIG9ubHkgb25lIGV4dGVybmFsDQo+
IHBvcnQgaXMgdXAgb24gdGhlIGJyaWRnZS4NCj4gPg0KPiA+ICJPZmZsb2FkaW5nIiBtZWFucyAt
IGZvcndhcmQgYSBmcmFtZSBmcm9tIG9uZSBodyBwb3J0IHRvIG90aGVyIGh3IHBvcnQNCj4gPiB3
aXRob3V0IGluc2VydGluZyBpdCBpbnRvIENQVSBxdWV1ZS4gT2ZmbG9hZGVkIGZyYW1lIGlzIG5l
dmVyIHZpc2libGUgdG8gc29mdHdhcmUgYnJpZGdlLg0KPiA+DQo+ID4gVGhlcmUgaXMgY29kZSB0
aGF0IGFsbG93cyBvZmZsb2FkIG9ubHkgaWYgdGhlIGxpbnV4IGJyaWRnZSBkZXZpY2UgdXNlZA0K
PiA+IHRvIGNvbm5lY3QgcnN3aXRjaCBwb3J0cyBkb2VzIG5vdCBoYXZlIGFueXRoaW5nIGVsc2Uu
wqAgSWYgaXQgaGFzDQo+ID4gc29tZXRoaW5nIGVsc2UsIG9mZmxvYWRpbmcgaXMgZGlzYWJsZWQg
KGJlY2F1c2UgdGhlcmUgaXMgbm8gd2F5IHRvIGtub3cgd2hlbiBhIGZyYW1lIGNhbiBiZQ0KPiBw
cm9jZXNzZWQgd2l0aGluIHJzd2l0Y2ggaHcgd2l0aG91dCBzZW5kaW5nIGl0IHRvIGNwdSkuDQo+
IA0KPiBBIGZyYW1lIGJlaW5nIHJlY2VpdmVkIGJ5IGJyaWRnZSBkZXZpY2UgaXRzZWxmIGlzIG5v
dCBhIHN1YmplY3QgZm9yIG9mZmxvYWQsIGV2ZXIuDQoNClVuZm9ydHVuYXRlbHksIHlvdXIgYXJn
dW1lbnRhdGlvbiBpcyB2ZXJ5IF9hY2FkZW1pY18uIFRoZXJlIGlzIF9ub19wcmFjdGljYWxfcmVh
c29uXywgbm90IHRvIA0KZm9yd2FyZCB0aGUgdHJhZmZpYyB0byB0aGUgU1cgYnJpZGdlIHZpYSB0
aGUgSFcgYnJpZGdlLCBldmVuIGlmIG9ubHkgb25lIGxpbmsgaXMgY3VycmVudGx5IHVwLiANCllv
dXIgc3VnZ2VzdGlvbiB0byBzd2l0Y2ggdG8gcG9ydCBmb3J3YXJkaW5nIGlmIG9ubHkgb25lIGV4
dGVybmFsIGxpbmsgaXMgdXAsIG1ha2VzIHRoZSANCm92ZXJhbGwgSFcgc3dpdGNoIGhhbmRsaW5n
IG92ZXJseSBjb21wbGljYXRlZC4gRXNwZWNpYWxseSB3aGVuIFZMQU5zIGNvbWUgaW50byB0aGUg
cGljdHVyZSANCmFuZCB0aGlzIHBhdGNoIGlzIGxlYWRpbmcgdG93YXJkcyB0aGUgaW50cm9kdWN0
aW9uIG9mIFZMQU5zLg0KDQpJZiB5b3UgbG9vayBhdCB0aGUgYmVoYXZpb3Igb2YgdGhlIFNXIGJy
aWRnZSwgaXQgZG9lcyBub3QgY2hhbmdlIGl0cyBvcGVyYXRpbmcgc3RhdGUgZXZlbiBpZiANCmFs
bCBsaW5rcyBidXQgb25lIGdvIGRvd24uIFNvIHdoeSBzaG91bGQgd2UgZ28gdGhyb3VnaCB0aGUg
aGFzc2xlIHRvIF90ZW1wb3JhcmlseV8gc3dpdGNoIHRoZSANCnJlbWFpbmluZyBwb3J0IHRvIHBv
cnQgZm9yd2FyZGluZz8NCg0KQW5vdGhlciBmZWF0dXJlLCAiZXhjZXB0aW9uIHBhdGggZm9yIE1B
QyBsZWFybmluZyIsIHdoaWNoIHdpbGwgYmUgY29taW5nIGZvciB0aGUgVkxBTiANCkludHJvZHVj
dGlvbiBwcm9iYWJseSBtYWtlcyB0aGUgaXMgd2hvbGUgb2ZmbG9hZGluZyBhbmQgbGVhcm5pbmcg
aGFuZGxpbmcgb2Jzb2xldGUuIFRoZW4gd2UgDQpjYW4ganVzdCBzZXQgdGhlIGZvcndhcmRpbmcg
cnVsZSBpbiB0aGUgSFcgYnJpZGdlIG9uY2UgYSBwb3J0IGlzIGFkZGVkIHRvIHRoZSBicmlkZ2Uu
DQoNCkJlc3QgcmVnYXJkcywNCg0KTWljaGFlbA0K

