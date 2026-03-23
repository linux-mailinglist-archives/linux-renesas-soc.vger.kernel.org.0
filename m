Return-Path: <linux-renesas-soc+bounces-30089-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id O2teGv+/wGmQKgQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30089-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Mar 2026 05:22:23 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 072B22EC69A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Mar 2026 05:22:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B38D5300278D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Mar 2026 04:22:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CC1A29BD82;
	Mon, 23 Mar 2026 04:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="hr8Rk3uu"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011023.outbound.protection.outlook.com [52.101.125.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 808A848CFC;
	Mon, 23 Mar 2026 04:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774239738; cv=fail; b=J/ycY+EotIxWCEEeYJRMgUSpaK/uF2/PFCIw1bhg//DGw1ascKIbiWmeWic21vVeecnRrK6fjFZox9NlLCodsMenPR2ZmHLhfiw5uZCuzeL2QUnOXhBNa0fPFNUyvYg6/U9SA91giY0JNbTNyYTpv4ZDP4VKjwkTJH0F9p0t+l4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774239738; c=relaxed/simple;
	bh=W9ysO+r61meBtA32jdvP4vWcEhUrOrqLEcojpiRpfQc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=VQW3NN5Ncpx91E/yD6cqU4nOsfPRkUdM+wtGQJD6gJCGvUxryEmXJ9Mfx9O/pUO5Q08sLJDsoevgyff1dZhtLAqg7gUnVTdRX1Fe0hmmSG3MvvHiNElf90XiDSDeBjv8qNF+gelhinUpYVDxdkfHdkfr31rZdQprDguuuwZwyks=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=hr8Rk3uu; arc=fail smtp.client-ip=52.101.125.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uuSJnmydIaME0AEj+dto5rvNMpceRktt+JQ5vDrCM9KLBh+U7X0G6fZa/a5BXvnnq6AjS/nw9d6AB89q4L31H2uJE14KD2p3+CO24YLx3PPnei4ULtx+UNaKkP3StGs9gi8TvBDsdUIWstJ7uKRNS2wiJlBURS4Qr8r0JuQYmEw37t/ykNk99i2JTiVimmCQ6GB0fD7Dy4muc060xSoK72R8Of5PlgliPFcFdBalvjO0tFvdf4Wrt8Hzem6T6sjAjl9vIqjwm7s2GfhLP3ypQNeJmcaEXwa2kPQcqWgQyks2gDJPyrCEsRj0+QOdvQYhy/qL7mxv4qmQrxxFAGSjCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W9ysO+r61meBtA32jdvP4vWcEhUrOrqLEcojpiRpfQc=;
 b=Hrt6htI9PLtqYHhvw3MePValFgn5vxL7a3GRDya2fAtSJ/nz9IRPN7QvGqkCSMao+f9IcRmCFO4AzzjKj88+ayLMHbDiW8ua3Pj2uLpsWHVhkCYenPz4p8AA+YrUST/kEpPu4UZfS3SRMxdzah9fBPrU9qO4xVZtbU/E4lnYDZbAwvPFuKmwt2c8kG7Yufb6CxboKF2+lgtZDHXA8x2pslDfx+k0SwwGkPSFqM7QfQOPGU9eaZDm1/7CW4HnUtPYyO5Nz48Wm/j9egiP+o6Vp723xoeFmaxOGFFLU89gWOxxyoY0NNWkhGfMLBiFfV8J2tvW0Y7qSlPb2MZ1LD7suQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W9ysO+r61meBtA32jdvP4vWcEhUrOrqLEcojpiRpfQc=;
 b=hr8Rk3uuwex1RlfxSZVfw3U+x1zz9ZRPZ5BRKNJyHhzf/0v4wZTaRPQEKW6yFjY1FPlIXC3t47dVnP9LUcx2Z81hlyJurKxeawB96WjGNQB5chQSVSEdav9OXStJk9j7xN35XEI7p8CfOMwob6QeZ1oSqFu+4+17fWyjRwyJdgk=
Received: from TYWPR01MB11935.jpnprd01.prod.outlook.com (2603:1096:400:403::9)
 by TYCPR01MB6701.jpnprd01.prod.outlook.com (2603:1096:400:9c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Mon, 23 Mar
 2026 04:22:05 +0000
Received: from TYWPR01MB11935.jpnprd01.prod.outlook.com
 ([fe80::dc30:6b24:b7ba:d429]) by TYWPR01MB11935.jpnprd01.prod.outlook.com
 ([fe80::dc30:6b24:b7ba:d429%4]) with mapi id 15.20.9723.030; Mon, 23 Mar 2026
 04:22:05 +0000
From: Dawei Liu <dawei.liu.jy@renesas.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: "linux@roeck-us.net" <linux@roeck-us.net>, "linux-hwmon@vger.kernel.org"
	<linux-hwmon@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "corbet@lwn.net" <corbet@lwn.net>,
	"skhan@linuxfoundation.org" <skhan@linuxfoundation.org>,
	"geert+renesas@glider.be" <geert+renesas@glider.be>, magnus.damm
	<magnus.damm@gmail.com>, Grant Peltier <grant.peltier.jg@renesas.com>, Linda
 Xin <linda.xin.jg@renesas.com>, "tabreztalks@gmail.com"
	<tabreztalks@gmail.com>
Subject: RE: [PATCH v2 3/3] dt-bindings: hwmon: isl68137: Add compatible
 strings for RAA228942 and RAA228943
Thread-Topic: [PATCH v2 3/3] dt-bindings: hwmon: isl68137: Add compatible
 strings for RAA228942 and RAA228943
Thread-Index: AQHctn204ex+FeF5rEmz/2sFsNGYCbW5erMAgAIQviA=
Date: Mon, 23 Mar 2026 04:22:05 +0000
Message-ID:
 <TYWPR01MB11935F24356873C46E02FAB5CD54BA@TYWPR01MB11935.jpnprd01.prod.outlook.com>
References: <20260316053541.3903-1-dawei.liu.jy@renesas.com>
 <20260318021921.75-1-dawei.liu.jy@renesas.com>
 <20260318021921.75-4-dawei.liu.jy@renesas.com>
 <177412601062.18368.450072825684601974.b4-reply@b4>
In-Reply-To: <177412601062.18368.450072825684601974.b4-reply@b4>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYWPR01MB11935:EE_|TYCPR01MB6701:EE_
x-ms-office365-filtering-correlation-id: b34c50bb-847d-4524-af32-08de8893bdb7
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700021|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info:
 1CsoBT+s+sG7gwBu5spjYeO7X1u+gOdvyLFPA5J2xd1A0LCIp1g4jHvHydtmS9bjIbPf/navwqomOPzRUCrZHe/ytVnss+OOu/07S43Rhyipy7n6UH/FxSDYmZcbcePiMtlvsFkeplAtIU2gFvYRJNP8DVmxYX2KcY6LQOn6vKZ9g5NEQRh3rAr9fVzhPHtzP8Wadwvk7j+jyLpP/r31cViMzef3NWkjWSVvnkVjGripoPEvcuiuFmAUizh29dkhl2H9EdVT0JfAA7N9n3U60HHx6mJeVy+jitIdObyW1VXXwuq1RWuekE04n04VJe5GKB8F/UmN+vKt7iDMpmhx16tkVK83M5MkIxKY0XHp1MKnz+PUhonECsYA7rPq4bNVwWDDyZDwLLba3vloTjzyb6QKxWrqMdyP0ayw7vx40qNhq++6JkFclumtWbEfQkms1bkksQl7qly0cMGyNX82STrr1uMPtrrNictVKhPjMbUta2O68cIcpD85HWszcpk+fv7ig5Z7SI7RBAiRmH7m80PT9Wrrkjld3mqHkBWQensgF+QqSH0lmseSe49/S2/tRL/C+NTMl8V1l9MPUwCMJ1NRLoehNWYqq/cArWsFiTqrdOwiOtG3Z+L8irxn3tYl7RsJQ0OoYInwasO/2LjKK5YfimOry6hn/aHT83cuIMSAhEPKVUaXZS27YxDORU5QXK+QUHvXKELeG7L1E1E86KQgOd0VV2cnRBEshAgsQcfxPJi08JBkjogDV8r9NNcrn0xpsX6t3g7oSNLSqtvcGHtUBzbNaJNl4KxbCo1Nj7E=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYWPR01MB11935.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700021)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?L3hMaUlFSXJLWlZqU2RvQm43WkxoTFlFUjB4Mk1kdnd3bGgvZWUxMXNZK2dT?=
 =?utf-8?B?cm1QWTNJQzdXeWgwa3ppalVEU1cxZ0gxM3pEcnpHV0d1Z1YreGwzeTJYVnlQ?=
 =?utf-8?B?TFk2STVZZjMvK01kNjM1TWRDcTRzWXpZV2pRTUtIVDFVcHExbEhxQmlzOGRC?=
 =?utf-8?B?UzREd1oyMkUxcm4reDJXVDVxSzRHMDA4NWpxaWdPeVY4SWhiLzQxV2FINkN2?=
 =?utf-8?B?NHh6NjVSdnFOUHJUOG1URndPS01ia3lMYmpvTEpWZjM2QUMxZzhHVHF4bjNi?=
 =?utf-8?B?NWNBY2FIZ2l6V3ZEUG5FcVFiREhEYlBMVW1pMVJ5RE5wZFRJRGxaV1B5d2ll?=
 =?utf-8?B?ZFhvekpoQ3d6MlVRNlpXQ3orRHgybWs2QzMySFBsN2FaamJ2cVpaOXJkVHFQ?=
 =?utf-8?B?aXloTlJUYnMrYUJLQ21JZmhQZ29DUTZEMUhpSUo2dTFIUStTckkrd3lXTzdz?=
 =?utf-8?B?MDRML2ljVGZROUxVTmd0bE03d2lDbVBMaFlKY3dSWXhBbnNkWjB2YkV2L1ov?=
 =?utf-8?B?Tzh0SDhHaGFUQkZDME1LSENmb3puZWJTdTZzUVhKVlpLcW9iWkNPSlZaSnl5?=
 =?utf-8?B?VXJ2N0N0U254SmU2L0ZFUTJTOGZPRHB1OU4zZkNsYUJ4ckFWeVJBajlENDh5?=
 =?utf-8?B?Zm1GSmlrd2JjTUNPRTRNZklhMXdFTy9aQThqZ0Npa2ZOdnpGaFRvMm1SUW5C?=
 =?utf-8?B?YmtLSW9wSElla3FxMEt4QzhMcWhpMXphZEQ1eHd2V054aGcyUUJiR2J3SFYv?=
 =?utf-8?B?UFA0MkRkM1dqWmVuTEkyTXpHMy9oZ3hSb0RuUXZGRkdNaDRXc1NMNjdpaVJF?=
 =?utf-8?B?b3htemNkS1NPRkJKZTQ4eTFVNXoxelo4R01KeTJHTWZXUUl5TVFRTVdOR0I2?=
 =?utf-8?B?VHFXYXBYU3RhYXU2a3V4SlRVRzFyaklGbmtHSy9aa05rcTdlK09mRlhJeFYy?=
 =?utf-8?B?dThpQzgyZHBHa1lhK3l6K0xFcWxCMThSUzg3WVB5VlVKN1VvR05rNDN5SHBp?=
 =?utf-8?B?S1JabFdOWFBia2FNSGowOHNXUEtNeGUyQnVsS2tWZ0laTFJTTjBiTCtiUXhM?=
 =?utf-8?B?L2RSQVZRRnkzYUFuakh5TTBqVjVLTnBwS3A0YWQvZzdmUXp1c09EYnRBeFJj?=
 =?utf-8?B?NzY4Nld3VVExdFJjcEVoeWF6OW5ZR2NXazN0R1lESXp1SWozUGdYSVpZVEla?=
 =?utf-8?B?VC81ejJpWmM2Y3JDMERaUVArb3U0MTh3NVdZMUYvNmRVSXFiQjg4NlBGVEVY?=
 =?utf-8?B?eFQwVmhsZWJFMFhiVkx1Q3VBRFBRS09HanFiSkVmQ3Y2L3puZWJFeTdQZHBn?=
 =?utf-8?B?RXk1cG8yRHZpMVh0eUVjcDFLRlEzTHhlN0oyOVpqUDZhQ0JuS3o5U28zcFBz?=
 =?utf-8?B?YUdNemd4Z1RsOFJSR3JkRHpJcit2RUd2SHZQYUdXMGx2L0Zhb2xCZzdPU2I0?=
 =?utf-8?B?QS83eExkdlRHeWQralNRVDR2bnAyYnhjOW9YT2RaWHQ3MUwraVRZdE9ERjVQ?=
 =?utf-8?B?Y25ISzNMb1EvamNNTURRYTVWRmJlWWNuaG90N0ZoSFNoRHhyMWxOeEtxdTE3?=
 =?utf-8?B?dmZpbngrR3hNcjFoRFhjMlgwTUd5aEduZ05TeDMrWUJNNkcwKzZzWFh1bXlE?=
 =?utf-8?B?c0EvZCtURlRxSC9ZMWdhVVgvZkFhcldTVk9UdUJIbmNHUWhQUHJocFNVSEZ2?=
 =?utf-8?B?ZkJLT0s1dzI4QkRWSUVBRWpsUEw0MjF2M1p5bCt3VDREbWx3aU9TY21DNC9x?=
 =?utf-8?B?TWtBRE0zSnZCZGZETGxUY0JVcVJ4SDJBS2pFUElqVFc4UEsvT3hoN3l2UGda?=
 =?utf-8?B?N1lGZnpqL0VDMVJPdVRpa0ZEL2pFbis3YXJ6RWtiZ2o2WW9rUlh4THBGRnpZ?=
 =?utf-8?B?S1E0NldhcEo2aTlSQy94K3lEZmxYNDNjRXNCQWdDSldTV2h4R0t6eUxFUk9p?=
 =?utf-8?B?aCtSbGtIemJVT3JwUEFBdmdnWm4rRm9Vb21UeVNPK2xONDVwY0NEOUpqK2xY?=
 =?utf-8?B?S0VkdlpSYit5cHM2ZGdOSk9yV0syVlh3dVFRZHAvUEZjVkpRQ2ZjdFM3UmY4?=
 =?utf-8?B?dzhrYzdwZDFqY2pHTjVaR2plaTAveWQ0aWFVcjkvRHo2K0ZEWTZiaHFpUkJx?=
 =?utf-8?B?bHMyTGZGQ1ZmOVFFanhjVXZNS0JQejhBam5McGx5YmhnQnlyaXhjeGkrYjBm?=
 =?utf-8?B?djExUlhOaEpFbE5vdFJqK0JQcHRMNWhBRFF4TFllVUpCaTIrVU90NytFRVN2?=
 =?utf-8?B?ekVrUVRUMUlkYVA3Rm1BenB3Rml5SlRmTmhQQXgrbnQvcTFxTkZIdHFwd0M1?=
 =?utf-8?B?aXR5MmIrdUdaM0tkanNXaENMOFpqTlc5VDNkV2tZWFEwY3orbmFWQT09?=
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
X-MS-Exchange-CrossTenant-AuthSource: TYWPR01MB11935.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b34c50bb-847d-4524-af32-08de8893bdb7
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2026 04:22:05.7110
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BoCAm7lHIBr2pp3qEBJ0Yt0m2KokcKmYB/v0RXyXgDF6Dm7rujX3cFrVK0g5eWwhT/e9d1qijEw8wE3TP6J2PFFRQSfQPM5Q07fmwq0gcxE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6701
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30089-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_CC(0.00)[roeck-us.net,vger.kernel.org,kernel.org,lwn.net,linuxfoundation.org,glider.be,gmail.com,renesas.com];
	DKIM_TRACE(0.00)[renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dawei.liu.jy@renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-0.995];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,renesas.com:dkim]
X-Rspamd-Queue-Id: 072B22EC69A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

PiBJZiB0aGV5IGFyZSBjb21wYXRpYmxlLCBtYXliZSBmaW5hbGx5IHRoaXMgYmluZGluZyBzaG91
bGQgc3dpdGNoIHRvIHJlcHJlc2VudGluZyB0aGlzIHdpdGggZmFsbGJhY2s/DQoNClRoZXNlIGNo
aXBzIGhhdmUgZGlmZmVyZW50IGhhcmR3YXJlIGludGVyZmFjZXMgYW5kDQpmZWF0dXJlIHNldHMg
Y29tcGFyZWQgdG8gZXhpc3RpbmcgZmFtaWx5IG1lbWJlcnMsDQpyZXF1aXJpbmcgc2VwYXJhdGUg
Y29tcGF0aWJsZSBzdHJpbmdzIGZvciBjb3JyZWN0DQpoYXJkd2FyZSBpZGVudGlmaWNhdGlvbi4N
Cg0KSSBoYXZlIHNlbnQgdjMgd2l0aCBhbiB1cGRhdGVkIGNvbW1pdCBtZXNzYWdlIHRvDQpiZXR0
ZXIgcmVmbGVjdCB0aGlzLg0KDQoNCkJlc3QgcmVnYXJkcywNCkRhd2VpIExpdQ0KDQoNCg==

