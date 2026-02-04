Return-Path: <linux-renesas-soc+bounces-27869-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2KyyIgQPg2kBhQMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27869-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Feb 2026 10:19:00 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EC83E3BCF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Feb 2026 10:18:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2C8B53004411
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Feb 2026 09:18:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 924CD3A1E87;
	Wed,  4 Feb 2026 09:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="dxZYQg3g"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010006.outbound.protection.outlook.com [52.101.229.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B26C3A1E81;
	Wed,  4 Feb 2026 09:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770196734; cv=fail; b=H7Un4VIpTgIJePt6/Lb57pZb0XSgw/QtIZCiYY2ksrAw0WlD+EFyow0YpLpi7T/aFG+N0A4lar9n8IruPVknTAA2plCCMU1fJ7PDoOvuuHVfWyGo24xEpOcgmQUgYSr5tSR0um7C0WMk54YVSpTNQiiz4qhSb5LihL2gsHAXlf4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770196734; c=relaxed/simple;
	bh=Nnb01R2b5ZydWB5Vm1tYTTyYkC2fC9Y+xINa/LlQlF8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=OikEG69XlEz8YCpq9GGMLNRq1rI5+76P+P9QLLJeIY5YA7FHwnTJSKb7ywbnkTcN9VlVS5NVsgzRtub0488q3BiwuI5Afy+ttvJOUTHNJaQFnNNMRhRQ5OkWBy4Oa83b3TXdmKXdg+wKttiAquRKvngGGJU4zP5OD4mtuW6f3QI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=dxZYQg3g; arc=fail smtp.client-ip=52.101.229.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yZPECc1clur2RhBs1WFS61NmW1yQDghRQ00+Z4LvzpVSidzrcc0YMt510NS1TYD7MxQLGrynUEmxI720R7AlsROGZxC3DbUHgF8/aSQQI+HYkSjCl6qlqNHu/KwnoPZ3k36IfmieRMA+9HC0eyw9JwZwm38o5t2Gyx7YArOcrkz4tmVLsnZT+y8BOmF9vpyKNmu/JN/uo94nnt1hunEmQJirO2dzh+h5VlJUf93huLtYPMg6q290G4lgbRDj/Wh3l5YmyMroLrOpU7kAX5P1JjV8pBA6GyhZbkwVE312Gk1n3gw5XsCoccn5edOL8dJdqyYRQZkfGPeoRlq2hL6Yew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nnb01R2b5ZydWB5Vm1tYTTyYkC2fC9Y+xINa/LlQlF8=;
 b=OV6ver8NC9SW6AgmWB52hUbH2xz9BxDKD+ojTegQ7YBunQIkXh/ywYE4JyyTwBJU9xSP2C3SDfZc1VfzyJqfdWhCSCQaMipLbofR5bTjHA9/+0YrITNrzSUgltLcrkT1H0P6J+6C2DhtC5N4r/SNSf6i3e5EDhX//tPV2HfdKYwh+P4G4OTpWWO0Ve3Iw2PRxncZZ7Gwxdw45QkyVdScmHwhUFzH7MhnS0WZjB4mQI4CqNZEhmMsW4O/NVCHeXjpiLd7UfrPT8z/I/rH9inQst0Y+TezmKNaT+h037flSBDz6rbKp77Bp9dNH3ze+qe0rlUTxz27WLv+BY1NRQjSkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nnb01R2b5ZydWB5Vm1tYTTyYkC2fC9Y+xINa/LlQlF8=;
 b=dxZYQg3g3vNoGAOEn0eQzggSsGshkRZvbd5/ZLmN4gTDE4p6LuMI4DRFhAmFrxRFZyNKS2BUqB/DpthE57U39twb5tBOqMLOvbOP07dexdS3H4jCC7r6gQTveCLgblyfsVNw/6eFnHyYa0sxLOeOSyllTY9qYc/PuGu/ZdPNI0g=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS7PR01MB13902.jpnprd01.prod.outlook.com (2603:1096:604:36a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Wed, 4 Feb
 2026 09:18:48 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.9564.016; Wed, 4 Feb 2026
 09:18:48 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Rob Herring <robh@kernel.org>, biju.das.au <biju.das.au@gmail.com>, Geert
 Uytterhoeven <geert+renesas@glider.be>
CC: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Stefan Eichenberger
	<eichest@gmail.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH net-next] dt-bindings: net: micrel: Fix dtbs compatible
 too long warnings
Thread-Topic: [PATCH net-next] dt-bindings: net: micrel: Fix dtbs compatible
 too long warnings
Thread-Index: AQHclQcRZ95CLxaU3UmEg4/YkLVjErVxjuiAgAC09sA=
Date: Wed, 4 Feb 2026 09:18:47 +0000
Message-ID:
 <TY3PR01MB11346B87DF83086FCFE19B15D8698A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260203121723.312336-1-biju.das.jz@bp.renesas.com>
 <CAL_JsqJK3brXxSeD-U42PBCeHoxUhWJYho3ZWj__t5C1LL-n-Q@mail.gmail.com>
In-Reply-To:
 <CAL_JsqJK3brXxSeD-U42PBCeHoxUhWJYho3ZWj__t5C1LL-n-Q@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS7PR01MB13902:EE_
x-ms-office365-filtering-correlation-id: 75ed81b0-7f73-475b-6404-08de63ce6746
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?QzVvWm1tTSt5VnNPVXVzc2VKWDcwek9pYjV3QmxNVnVBaVRRMWk2WWR5ekVm?=
 =?utf-8?B?TVNwdmZ6T0lnUVNFT0Y1MXBHYzNETHY4T0VvcFZaY1JVMnFnQkJjd2p6OXpl?=
 =?utf-8?B?MFV1dUxSWE0rQ0xWL015Q2N4ZW10YVpreFYzR0lXSm1GWDBnd3BVVDczU3hQ?=
 =?utf-8?B?Y2VLdGRFOXNpNXlMaVVpSHVoK21YQU1WQ0k4d1RBZXREbEJRL3g4bFBHNmo2?=
 =?utf-8?B?TkRxZk43QkxUYldVQ3Z0Zll2OVMxdHlma3BFNWlvY3dVZ3JXQjgyOElXV3o2?=
 =?utf-8?B?SUJsRTdnM1E1Wm9ZcVJHdDY4eEpUR3QvaE1icnhDTTJUU1kxWjJDU3d4WExt?=
 =?utf-8?B?WFR1Kys3SVBqOTRpTVNlYWc5VC9waDVoS0pFMWtESDNpbkVndjl6Q1pReWlX?=
 =?utf-8?B?OWVaY2FtMitxRnBtN2RvOHdHajk3Umd6RFpTZjJyQzJDYXlCRXl0OTNhaWdR?=
 =?utf-8?B?bnBqOXJ5QStQYS96VEpWNlZVcy9Qc01VTjMyOGtOMnl1cGY5MUZqbVNsUEpV?=
 =?utf-8?B?MXJYaGlKd3g1OXZ0amxnT0s0Uy9sOUJGUWxBamU0SC9ad1ZuV21oR0V1eW03?=
 =?utf-8?B?clpXcnA5WE5tZk9Ib3FycjhDcno4bXJ2cGxvcVZaQnFLeXljT3MxVDlSbUkz?=
 =?utf-8?B?SEdLK3pvOUc4QzJwK0h1NXJmMWNYZnBUQmc1LytKT0YzbkF4VWwzbWpCRHp5?=
 =?utf-8?B?Sks3Ri8vaVovVjZBckhpK09YYWFCanFaMU5LS3hod2NHQXk4MWxuZVZ3SkJR?=
 =?utf-8?B?WlpxUzJrV2F0ZFNzUFIzUlJCTlhITGIzVk1iUWZSWVdVTVFXcGd4ajJmRmN0?=
 =?utf-8?B?NVBNZGtiRkE1SWt3NlFVbnprbnJMQzlUWEd4Z1NQMXgyK3BUVXc2aTN0V0tX?=
 =?utf-8?B?aUl0eHBtZ3dHTDFWNVdxL2lISTlHQ3VwZE5mbXJkd2RzaDhoaGlKVEd4S2NZ?=
 =?utf-8?B?WXdRdVNSM20rN3FOQ2IvN014YTdWR3VhMXFNT01IckxBL1c4b1ZTZi9tOE8z?=
 =?utf-8?B?UTFNdWFGV1IrV1U5UjRrcVdqWW5PNTlhY0Z1d295TE1pd0QrWjAzV3JmSDJ5?=
 =?utf-8?B?bTkzdDErWmdISzNFWGhXb0p5eWlyYzhrUGFldk1hd21FeU4wcjF1UytycVhS?=
 =?utf-8?B?RlFyVGhtS3huSGJUYUN1Z0NZekhnMmlYNmNsREJUT3B1NGg5UTBLTDJBeklz?=
 =?utf-8?B?MnNIUjEraHFWdkhCcjRIUllDdkhJWHNPVFR3NUs2WTl6QldOdTIybGFwNWVt?=
 =?utf-8?B?M1JDa3ZMdFB2S0hXK1BOYis4Vnh5dFhjTnl4R0crOWlvSXpKY1JTU0VyM29F?=
 =?utf-8?B?NlhCcW1lR0oxZVVuNm90R1B3eTlhL2NJZzR0ZTdjWHI1eThCb1ZtSk5wZCtt?=
 =?utf-8?B?TmZhUjF0eTFlN3RaNEpybUhSa2ljRUdXd0pGeVA0cFRtaFVPenRKd2tYWWc1?=
 =?utf-8?B?dS9xVGFrTXdhR0VuZU5zTWlTQnc2My83YlNpV0FsSWtOeWFiZ2xVeVl2K0dD?=
 =?utf-8?B?V3NucGxqWC9wM1Q2ZjU1dUFoSWdCWmg0VnRPMExnemlyUXBQTkMzUy9ScDNG?=
 =?utf-8?B?SWVIRHlsYWZSRHZDOFA2YVQ4QkpEK2ZhT2ZBci9seDhRUkdNaTc0MDFEVU5J?=
 =?utf-8?B?SkZubkpUYmNrcHp3S0RYTVRNcXRaYnRMdnRzRGQydi9CeHRsQ29vWFZJbFFJ?=
 =?utf-8?B?Zk5oYk9DVm9KbFlFUGpSSGorbHk1UmMyQUhFNHFtQ2RlNU9jY1pWVitDZjNR?=
 =?utf-8?B?TkVubGZIMld0WXY4WGpzZms3bWhTK1ZvUCsxMG8zSmt5Y3JzQ2JEdWhTeWwy?=
 =?utf-8?B?R3QwT3dTRGNYbS8rL05SbkN6ZjZDWjVnaE4xTG5GWnFUb2FDU09haGh5Ti9n?=
 =?utf-8?B?L1MvQjFnQXVZQlo0UXZwVGIvOE52TVdGME1lWUV6ekZqSXpyYjV6V1lRRjVk?=
 =?utf-8?B?dnRxQW94RUx6aUo0WVJGVEtENWtvanNTUU11blI0SFJxcUxvUFVxZlJrdUNO?=
 =?utf-8?B?MUNmRnZock0rdTFDdmpiZWk0RG9GOUFNNGhPcDN4OGt2TEhIMlJxNFVWMWFN?=
 =?utf-8?B?QUVXcUdoaHRqS2tlZXUySWJ1Y0xSdXNpTWpsMDlHVHJmSVFNTERjT0tVbkxr?=
 =?utf-8?B?UHBMdkJyUEVEdHhMQWZDYUpNUi90SVk4L0tYanVCN1I2Z3liUGRxSFZIdXhy?=
 =?utf-8?Q?j3/3C5jhCcuh03rxgi5O7d4=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Wkl0ZkowVjBxMHluT1A2c29Tc3hZblJCUllwdENQN1BucE9abE93VTdiNlpz?=
 =?utf-8?B?Q1NEUWIzcFl5NFF0MVBqL2tTUmJQUXV3anV0ZTgzNjVSRSsxMTVCTTNJaERT?=
 =?utf-8?B?aytqc0NlVWNUYmVTRE5tTWZHOTUrcERHMHdKSEVDRXJSSDJTb3BKaElUOWVj?=
 =?utf-8?B?VHlOS0VwV0JlbzFqWHNCdXRzbThQditmRnVyTk5CVlR5aGdXNU5MdkdCVDda?=
 =?utf-8?B?Q3gxaE5UcnUyVjZOTHlQMFlYZFFVa0YraW0vTU1kT0l2bk1vNDRxYWY3b01w?=
 =?utf-8?B?RytPZFFxOHA1SlZmMFJsY21HVzkydUZ6N0Y0cnA3VStPcXA4d0EwRkhBV3hw?=
 =?utf-8?B?emczME84MVVaUWFObHlWNExsenFCSE94MTRmRTg4MkV3VnY0R0c1eHJNM3cz?=
 =?utf-8?B?MlVjdmhVelZKbzNVb1hJdUxqTml6clVOSTJybVV2VTBUZUpiSkVFQk9wTGNK?=
 =?utf-8?B?Rms3K09QRjFRRXIxcHNjWUxpVkxoUTVQUmQ1VVhLeEU5b2N5enpWUE5IYVhF?=
 =?utf-8?B?QTJBSnlzbFlkb1J6d3lwVlRjQlRrRDZCdm13ZTM3amlmTHpaaG5BbC9jR0xC?=
 =?utf-8?B?ODNOcVZYSVFpTHQxOWRVbTZCNUd0Ty9zZTNRallLVnZhZFg5VlJKRkxyaVZm?=
 =?utf-8?B?WGhmTkdremVWbnk4bTlSdXRJYjREMVp4cG53dkNqRkV0Q0cxekJwRG4yQThl?=
 =?utf-8?B?TE1lRE91NEJOK0cvakswWUtyZmUxR2hPUDd2QzNtLzcrU0ZHcnNDYTZKUFVk?=
 =?utf-8?B?TXYwRldmT3ZaZDVCSHBiK0lzNi9SMWxZT1g0bGFBTzZNWCtjN1RjZGdmSUtV?=
 =?utf-8?B?cEtPcis3dkk1cC9aZmlJbjd0eFFrLzdJby9xTVg3YTZDc1Zkamx5cVBFWlVK?=
 =?utf-8?B?MlhwV05zWko1Q1RVVlY4MDd2d0FBVlhsdUErTWZtN1VCVzJlREVwZVdCeGR5?=
 =?utf-8?B?cFptaFVlc2gwY3RpV2FPTXVuM2hBbzVjdU5QZlU5K1laQVVjZ0plK2s4RG1p?=
 =?utf-8?B?bnJqdjd1QXdzN01raFJvOStkaGRXR1BmK3ZiY3dXdSswRmlzcldaaDVQUWdw?=
 =?utf-8?B?amo4cUZ6YW9XcDBuWmE1QWQyWmI2dkJ3L0taOVAxc3M4RmpZdmZ4WTJRR2hE?=
 =?utf-8?B?bm9NV2kxTHNrNUVUNGVqR2JqYUpxL0RSeUVONWJEM0ZxVGtVcm51ejlyRzRU?=
 =?utf-8?B?S2o2QXRmdzNDcjIzajNTY3NISFdLL0cxdHNyeTlvbzJ6STNvTk9lM29Yb1pa?=
 =?utf-8?B?U0N2eVdES2U3dXUrQjhlVHNmUXVUL0hHL2xPQSswbHEvQkpyd1dQbGF1dUNk?=
 =?utf-8?B?K2dRWC9aRkd0dERaY3RaZExjdCt4SXIvektRQnJJRENpWFdqcEdMbDhiTm5r?=
 =?utf-8?B?dm5hT1h2K2V4RDhsQTd6TmtYdHRUbWFudHh1NlFNQWxaU0dSRWI5Q1lmQXlp?=
 =?utf-8?B?ZVh6STRSZStxQXR2NWVDQVZEalIyNHNOR0R0SW4rME13NDZWNVY1RUN2WDVK?=
 =?utf-8?B?eHE2UEVsUXJJUzltMURJcDV5NGExUXgzSHR0Y3RXYmFwdGR1NDFVWFlBa1hv?=
 =?utf-8?B?MW5KQnh6TFQwekdDSFB2S21HVzZRS2V5TjhPQm15TUxCak50NWFZTUd0dDhy?=
 =?utf-8?B?OEZwOXQ1VUlxdWFTaHBVZmx2bnFlV2tVK0hxZHNDWm83NVltZEpNK0REOUNs?=
 =?utf-8?B?emRNZnRSS3F3VkFTc3lQb2gzT1IxNTFWb2hiLzk2M0hGSFBnK204YmN0cHRF?=
 =?utf-8?B?YTE1ZGdZdkVCSSt0TnhEVFJEYlRUbkZSUkJFOTl6UkZwQnhpbVBuL3drOWE1?=
 =?utf-8?B?bCs2QzJrcVBKMVhFK0l1ejhHS3F0QTNSZUtEWVhpRGlKelBoSS8wZUozVXIv?=
 =?utf-8?B?VGVwdXB5NEFGbmt5WmR1YitveS8zS1hzWm9wUE1taWFhYmdnK1ZjQUxOemtu?=
 =?utf-8?B?UkU5Rm5hU1g2WmcybkhwTyt3SDZWY3RsT3U5NGNMRTJ6d2k1ZGppS3hEMTZZ?=
 =?utf-8?B?SnNxdEV6TWFJcE4rMDZERXozcGRMTndPRVpLd0J0Ni9laHB0VEd6S2lDMXox?=
 =?utf-8?B?cGZieDBTTGRyZ3lyaE5xWG1VMTlPUExuWGJ3REp5QnQxZ1Vka1JSRUxqQ3lM?=
 =?utf-8?B?eCtObXdYbEZMdXhJMUxzcXVPVFpNMW9EOUNLOHJra2lNYi85VWRucjNYWTM3?=
 =?utf-8?B?T0lvcEtZYWtPQ0pKOCtHdGh0aStOMzFnYTE2YnNOajNLLzhTdEREQmVMVDdr?=
 =?utf-8?B?Yk4zYXJpS3BWOU9SblJpM3FzUnVvS2xmNlNlM1ord0k4WWxBNmdWMCt2dTBF?=
 =?utf-8?B?YnRIQWJjUmRmd0M0Sm5iKy9paDlneUQ2Ykxid3l4Zkk3WXVENXJ2QT09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 75ed81b0-7f73-475b-6404-08de63ce6746
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2026 09:18:47.9811
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7qZcac6PmbaI5H7hJe7gM4rrKUG3iMkUWqts/7jiip8GmB+Qf3nx5vC/Zv7iTQ4D1wIgzJsuE2LJx9VluYHfJlVTEp9JF7l+SaAxoe5mDBo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB13902
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27869-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,glider.be];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gmail.com,vger.kernel.org,glider.be,bp.renesas.com];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,netdev,dt];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7EC83E3BCF
X-Rspamd-Action: no action

SGkgUm9iLA0KDQpUaGFua3MgZm9yIHRoZSBmZWVkYmFjay4NCg0KPiAtLS0tLU9yaWdpbmFsIE1l
c3NhZ2UtLS0tLQ0KPiBGcm9tOiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPg0KPiBTZW50
OiAwMyBGZWJydWFyeSAyMDI2IDIyOjI5DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggbmV0LW5leHRd
IGR0LWJpbmRpbmdzOiBuZXQ6IG1pY3JlbDogRml4IGR0YnMgY29tcGF0aWJsZSB0b28gbG9uZyB3
YXJuaW5ncw0KPiANCj4gT24gVHVlLCBGZWIgMywgMjAyNiBhdCA2OjE34oCvQU0gQmlqdSA8Ymlq
dS5kYXMuYXVAZ21haWwuY29tPiB3cm90ZToNCj4gPg0KPiA+IEZyb206IEJpanUgRGFzIDxiaWp1
LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gPg0KPiA+IFRoZSBLU1o5MTMxIFBIWSBpcyBzdWl0
YWJsZSBmb3IgSUVFRSA4MDIuMyBhcHBsaWNhdGlvbnMuDQo+ID4NCj4gPiBGaXggdGhlIGJlbG93
IGR0YnMgd2FybmluZyAiY29tcGF0aWJsZTogWydldGhlcm5ldC1waHktaWQwMDIyLjE2NDAnLA0K
PiA+ICdldGhlcm5ldC1waHktaWVlZTgwMi4zLWMyMiddIGlzIHRvbyBsb25nIiBvbiB0aGUgYmVs
b3cgZHRzOg0KPiA+DQo+ID4gcjhhNzc0YjEtYmVhY29uLXJ6ZzJuLWtpdC5kdGINCj4gPiByOGE3
NzRhMS1iZWFjb24tcnpnMm0ta2l0LmR0Yg0KPiA+IHI4YTc3NGUxLWJlYWNvbi1yemcyaC1raXQu
ZHRiDQo+ID4gcjlhMDhnMDQ2bDQ4LXNtYXJjLmR0Yg0KPiA+IHI5YTA3ZzA0M3UxMS1zbWFyYy5k
dGINCj4gPiByOWEwN2cwNDRjMi1zbWFyYy5kdGINCj4gPiByOWEwN2cwNDRsMi1zbWFyYy5kdGIN
Cj4gPiByOWEwN2cwNDRsMi1zbWFyYy5kdGINCj4gPiByOWEwN2cwNTRsMi1zbWFyYy5kdGINCj4g
PiByOWEwN2cwNTRsMi1zbWFyYy5kdGINCj4gPiByOWEwOWcwNDdlNTctc21hcmMuZHRiDQo+ID4g
cjlhMDlnMDQ3ZTU3LXNtYXJjLmR0Yg0KPiA+IHI5YTA5ZzA1Nm40OC1yenYybi1ldmsuZHRiDQo+
ID4gcjlhMDlnMDU2bjQ4LXJ6djJuLWV2ay5kdGINCj4gPiByOWEwOWcwNTdoNDQtcnp2MmgtZXZr
LmR0Yg0KPiA+IHI5YTA5ZzA1N2g0NC1yenYyaC1ldmsuZHRiDQo+ID4gcjlhMDdnMDQzdTExLXNt
YXJjLWNydS1jc2ktb3Y1NjQ1LmR0Yg0KPiA+IHI5YTA3ZzA0M3UxMS1zbWFyYy1wbW9kLmR0Yg0K
PiA+IHI5YTA3ZzA0M3UxMS1zbWFyYy1kdS1hZHY3NTEzLmR0Yg0KPiA+IHI5YTA5ZzA0N2U1Ny1z
bWFyYy1jcnUtY3NpLW92NTY0NS5kdGINCj4gPiByOWEwN2cwNDRjMi1zbWFyYy1jcnUtY3NpLW92
NTY0NS5kdGINCj4gPiByOWEwOWcwNDdlNTctc21hcmMtY3J1LWNzaS1vdjU2NDUuZHRiDQo+ID4g
cjlhMDdnMDQ0bDItc21hcmMtY3J1LWNzaS1vdjU2NDUuZHRiDQo+ID4gcjlhMDdnMDQ0bDItc21h
cmMtY3J1LWNzaS1vdjU2NDUuZHRiDQo+ID4gcjlhMDdnMDU0bDItc21hcmMtY3J1LWNzaS1vdjU2
NDUuZHRiDQo+ID4gcjlhMDdnMDU0bDItc21hcmMtY3J1LWNzaS1vdjU2NDUuZHRiDQo+ID4gcjlh
MDlnMDU2bjQ4LXJ6djJuLWV2ay1jbjE1LWVtbWMuZHRiDQo+ID4gcjlhMDlnMDU2bjQ4LXJ6djJu
LWV2ay1jbjE1LWVtbWMuZHRiDQo+ID4gcjlhMDlnMDU2bjQ4LXJ6djJuLWV2ay1jbjE1LXNkLmR0
Yg0KPiA+IHI5YTA5ZzA1N2g0NC1yenYyaC1ldmstY24xNS1zZC5kdGINCj4gPiByOWEwOWcwNTZu
NDgtcnp2Mm4tZXZrLWNuMTUtc2QuZHRiDQo+ID4gcjlhMDlnMDU3aDQ0LXJ6djJoLWV2ay1jbjE1
LWVtbWMuZHRiDQo+ID4gcjlhMDlnMDU3aDQ0LXJ6djJoLWV2ay1jbjE1LXNkLmR0Yg0KPiA+IHI5
YTA5ZzA1N2g0NC1yenYyaC1ldmstY24xNS1lbW1jLmR0Yg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1i
eTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+IC0tLQ0KPiA+ICAu
Li4vYmluZGluZ3MvbmV0L21pY3JlbCxnaWdhYml0LnlhbWwgICAgICAgICAgfCAyMyArKysrKysr
KysrKy0tLS0tLS0tDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspLCA5IGRl
bGV0aW9ucygtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9uZXQvbWljcmVsLGdpZ2FiaXQueWFtbA0KPiA+IGIvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9taWNyZWwsZ2lnYWJpdC55YW1sDQo+ID4gaW5kZXggMzg0
YjRlYTYxODFlLi4yODRjM2JhMzc5ZjMgMTAwNjQ0DQo+ID4gLS0tIGEvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9taWNyZWwsZ2lnYWJpdC55YW1sDQo+ID4gKysrIGIvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9taWNyZWwsZ2lnYWJpdC55YW1sDQo+
ID4gQEAgLTE3LDE1ICsxNywyMCBAQCBkZXNjcmlwdGlvbjoNCj4gPg0KPiA+ICBwcm9wZXJ0aWVz
Og0KPiA+ICAgIGNvbXBhdGlibGU6DQo+ID4gLSAgICBlbnVtOg0KPiA+IC0gICAgICAtIGV0aGVy
bmV0LXBoeS1pZDAwMjIuMTYxMCAgIyBLU1o5MDIxDQo+ID4gLSAgICAgIC0gZXRoZXJuZXQtcGh5
LWlkMDAyMi4xNjExICAjIEtTWjkwMjFSTFJODQo+ID4gLSAgICAgIC0gZXRoZXJuZXQtcGh5LWlk
MDAyMi4xNjIwICAjIEtTWjkwMzENCj4gPiAtICAgICAgLSBldGhlcm5ldC1waHktaWQwMDIyLjE2
MzEgICMgS1NaOTQ3Nw0KPiA+IC0gICAgICAtIGV0aGVybmV0LXBoeS1pZDAwMjIuMTY0MCAgIyBL
U1o5MTMxDQo+ID4gLSAgICAgIC0gZXRoZXJuZXQtcGh5LWlkMDAyMi4xNjUwICAjIExBTjg4NDEN
Cj4gPiAtICAgICAgLSBldGhlcm5ldC1waHktaWQwMDIyLjE2NjAgICMgTEFOODgxNA0KPiA+IC0g
ICAgICAtIGV0aGVybmV0LXBoeS1pZDAwMjIuMTY3MCAgIyBMQU44ODA0DQo+ID4gKyAgICBvbmVP
ZjoNCj4gPiArICAgICAgLSBpdGVtczoNCj4gPiArICAgICAgICAgIC0gY29uc3Q6IGV0aGVybmV0
LXBoeS1pZDAwMjIuMTY0MA0KPiA+ICsgICAgICAgICAgLSBjb25zdDogZXRoZXJuZXQtcGh5LWll
ZWU4MDIuMy1jMjINCj4gDQo+IFRvIGF2b2lkIHRoZSBlcnJvcnMsIHlvdSB3b3VsZCBuZWVkIGEg
Y3VzdG9tICdzZWxlY3QnIHRoYXQgZXhjbHVkZXMgdGhlIGMyMiBjb21wYXRpYmxlIGZyb20gdGhp
cw0KPiBzY2hlbWEgKElPVywgbGlzdHMgYWxsIHRoZSBvdGhlciBjb21wYXRpYmxlcyBoZXJlKS4N
Cg0KT0suDQoNCj4gDQo+IEhvd2V2ZXIsIEkgdGhpbmsgdGhlIGNvcnJlY3QgZml4IGlzIHByb2Jh
Ymx5IGRyb3BwaW5nIHRoZSBjMjIgY29tcGF0aWJsZSBmcm9tIHlvdXIgLmR0cyBmaWxlcy4gSSBk
b24ndA0KPiB0aGF0IGNvbXBhdGlibGUgaXMgdXNlZnVsIG9uIGl0cyBvd24/DQoNCkkgd2lsbCB3
YWl0IGZvciBHZWVydCdzIGlucHV0IHRvIGRyb3AgYzIyIGZyb20gLmR0cyBmaWxlcy4NCg0KPiAN
Cj4gQWxzbywgaXQgZG9lc24ndCBtYWtlIHNlbnNlIHRoYXQgZXRoZXJuZXQtcGh5LWlkMDAyMi4x
NjQwIGlzIHNvbWV0aW1lcyBjb21wYXRpYmxlIHdpdGggZXRoZXJuZXQtcGh5LQ0KPiBpZWVlODAy
LjMtYzIyIGFuZCBzb21ldGltZXMgaXNuJ3QuDQoNCk9LLg0KDQpDaGVlcnMsDQpCaWp1DQo=

