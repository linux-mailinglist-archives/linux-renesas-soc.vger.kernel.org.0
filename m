Return-Path: <linux-renesas-soc+bounces-25023-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A980AC7D0EA
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 22 Nov 2025 13:54:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A905E4E2873
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 22 Nov 2025 12:50:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B6DB285071;
	Sat, 22 Nov 2025 12:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="od0Wv2IA"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011010.outbound.protection.outlook.com [40.107.74.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E34521257B;
	Sat, 22 Nov 2025 12:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763815839; cv=fail; b=TwjEs8UwmPVSquzfbIQ2RRKLCE0+NYDHMBiuKCmUruHETbM2sM3v878Adc+FRtgqsqhPOx4HFtq3HYoOUEMOI1nWs62HYxslpeeXdi+bsETg0tdt7K8Q5iI7r5JPbXthJWnJpsIqAQd1KTzA9Wd4lhFHFvlWqRSKB+7+AdUp9ac=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763815839; c=relaxed/simple;
	bh=Zq/Fdt6fl2Af20vPzd1iPFFo2yEqVrleXxw/7/JY8P4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=d16XAJvYPbqkVADfit2zreGO3/Vc0Q7K7UGAArkZpfARVODalSyiKyjkw5ubkf9Lo4OTn+5BKWRa6k4JYbwQDWnzGVxCHKRLtJujeT6CQk13di2Vof1rDk0XVdGgyr00Kjz7VXKzyZqnyf/DCAJ54H7IiTPi9gffol38E4ypYps=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=od0Wv2IA; arc=fail smtp.client-ip=40.107.74.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a4cPK1+RhnOsxh9XUt78hH3qCxmX+cuPXGkjlZfo1qbLb10xaY+3XKqyt9PvOAu9Nx/ZnvHN766utwAeJjbRB1O391pT/nB29/uuP8yH8Nb/Ee3QY97DNWpLFszbMMGCHez7PCY/g2uokw+d7UIwH+MMM7Mx1c5Q7BMI7Tzb8KVCuI/a177SCKL7R6PnaCcDY0wjaMocEC9ekEM+OfK6jA9jKuSpS0Z3w3Mk4EhEidx0U9sClY4k9s7Kyoi093jvHSzGZtAMNfcH5q55kVB/pHiaLaiYn2skvxzVIkJ17sCiGCC8R3KawTgb85UrovCyR4Y3rrQoliFaFGajMWeoxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zq/Fdt6fl2Af20vPzd1iPFFo2yEqVrleXxw/7/JY8P4=;
 b=sSebPV9jvpiNvl+62rlgJoPb/hrcyEzaIWgj4iBk7q9IKklsPubT5BIpffRsgGKxH7rzftcCsMpumv9NhDJnmX/rstB+XOBcTCVz5Gy+4XT127Xtimw44YZKSu1QlHlyEHGS+UjI86oWkjSxEbHfPVCuxMWFHS8qlv8rQV2wlNlzBRFiaJyf9zHLz37ZB9aoHVdC3UYz6oNfM9I4IDcV8ZuqTRC6mKgNEUJkHRRuo+Oc7Hsvelr5lF1kwUJqB8KgqLaybOPOtHOyZ1n9j8mmffnoEQzd+7v3CBjXs0esopaTheNuI6AFgW2sYdTdGGuJBthgU6zlrTi+5k7YqssFTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zq/Fdt6fl2Af20vPzd1iPFFo2yEqVrleXxw/7/JY8P4=;
 b=od0Wv2IAHeuHXzCJ/4aNxpNfVMYa2pJetcfhkROMFXPCvnZEhWn+Geg8g0pI5cG4XAL81IlPrnoRCAAQgiuuAX/XeXWq/q+SLwuAodKlUqZL/++MDvDs6GkzJRPSye97cNoNOMNP+39w6jjNJIa7WINkykMZdSxfZWH4uIYFmbs=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYYPR01MB12494.jpnprd01.prod.outlook.com (2603:1096:405:195::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.6; Sat, 22 Nov
 2025 12:50:34 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.9366.005; Sat, 22 Nov 2025
 12:50:34 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: geert <geert@linux-m68k.org>, biju.das.au <biju.das.au@gmail.com>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
	<jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, magnus.damm
	<magnus.damm@gmail.com>, wsa+renesas <wsa+renesas@sang-engineering.com>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v3 04/13] serial: rsci: Drop unused macro DCR
Thread-Topic: [PATCH v3 04/13] serial: rsci: Drop unused macro DCR
Thread-Index: AQHcVVS6tyh0ABzPh0GO1y6wrGB6hLT9Q70AgAFugcA=
Date: Sat, 22 Nov 2025 12:50:34 +0000
Message-ID:
 <TY3PR01MB11346CC3EBC27603F455D572586D2A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20251114105201.107406-1-biju.das.jz@bp.renesas.com>
 <20251114105201.107406-5-biju.das.jz@bp.renesas.com>
 <CAMuHMdUUd6_rWDaxGTjJVJjyfup3rt3vzUTMz4=iBXv+w=7zwQ@mail.gmail.com>
In-Reply-To:
 <CAMuHMdUUd6_rWDaxGTjJVJjyfup3rt3vzUTMz4=iBXv+w=7zwQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYYPR01MB12494:EE_
x-ms-office365-filtering-correlation-id: 33faec28-cad4-4e1b-595d-08de29c5ba3e
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?cVdheEY2U0FnSjFxTXNKa050MFdwaVZRMUtVTGxvN2N3NUg1UmZQRk1zVEJv?=
 =?utf-8?B?ZFF1QlpFcEJEczFoQzJiaEYxSEx5QkQ2Rzh6YzUxbVVZZjZLeFAwcUhGWGt1?=
 =?utf-8?B?V0gyWUpnVVNKOVN4bjVpNThmVTRaSlhhbU5IU3U0eU1rK0hlTEgyd3dQYnQ5?=
 =?utf-8?B?Z0ttWjZFckkvOGxEOENtRDZ2Q1dHMWNURW1JVXE1UlppU2xkZ1FWMXVHVjlV?=
 =?utf-8?B?VDM4TVJBS1p4ZVdhaTJvb01CemtMYnh0L1NBWUZCSXhjQ2QrNWxTY1RoSExB?=
 =?utf-8?B?aHpYUlNRbUJ1Z09NNGxlY1dzTlhZUk10ZWgva1YyRWpVV3BFd3lnbG1sTkRm?=
 =?utf-8?B?c0IwWUFqN25vc1RnZExPbnNBV2VndUR6YVFERXNDNUt4TFNVTkRTc25TSmF0?=
 =?utf-8?B?N3RtOXEvUlp6ZWQ4RVRuZFQyRm5vWTEweFFzVW9IU1Fsa1BYL1VoWW5nalhk?=
 =?utf-8?B?ME0xaE05QTE2NlVTcHJWRExtT3hWOTdYWEEyTzhUc08rMHdRMUQvbmV0Y282?=
 =?utf-8?B?YU41eTVPdi9aaElDd2l3ZzR6RzBkVHFoWFdNanJDOHVvVWtJOWx1SnpuSWk0?=
 =?utf-8?B?SVh3eGRNZ3U2bm80UGhyelBGa09EMWYzYUxnQzRGWCtwcTZXVVdCRVQxQzhy?=
 =?utf-8?B?c2ZKQ1R4VGkxakk3K3lYNEFPRmJ3TlArdnA3ZHBSMmVDbHV6bkcxWmRDZ3JL?=
 =?utf-8?B?RUJpS3RIWVo3TlFvNkZVcUhORDMrR0lPaVBkK3N2K0w1VTVQR01oMlZJR0E4?=
 =?utf-8?B?Q090RVc4U2haL1hlQ09QTWVoQ2tKelQ1NlZ3NnZmeW52THNDUjcwUDdUOFZH?=
 =?utf-8?B?cFV4WjJOTGN1YW8xZVVkczdYV1A0SGVQanA0bGdKOVFuQjdzWUtFWDFBZGhO?=
 =?utf-8?B?N01KS0V1RUVwa1FrTnJOa3ZhYU1LU05MeGlQK25VZ1IyMXBGT3BZOWZGV3Ri?=
 =?utf-8?B?OTN2bTRUSW13VGtBdW1seVVFbTgyRUdIMkdYWDJCczZvek1odVh4U1BOZmJU?=
 =?utf-8?B?ZTNIclZMMm9mdVA4OVdwVWtZaU1ZNjlVQytZMXNCZDlWN1N1Um1yZGtMcFlQ?=
 =?utf-8?B?SzJRNnE4UGF2anUyMklCZmh6VEpqVHhuVDFFaG1PMk0xTWZiWlRhS2hPSVRS?=
 =?utf-8?B?SVA4aEdLMGVSd3JIVVVSRnZBWkpINWtUdy9peDJCczZDa0RqZFB2MFRZRDBQ?=
 =?utf-8?B?bXRGc0pNOUhWenJZTXpPd0FhTm44ZHdHWXpPWlZsVDZ2czhxSHlycjk1L2hr?=
 =?utf-8?B?aTJ2KzJZOFZkdlhoNElzSklLckphZVVYeEQxcjNwU1o4dG1sMVNSby9Wekkv?=
 =?utf-8?B?emIwdjN1WmhDSGlRZ3FVKzFlY1ZmWVZDZDBJdlcwdDJDVUdab1FKTFdqa0xo?=
 =?utf-8?B?SWxIeGwwZktEUG1Jd1V6ZVlSNzloNVQ1bFNxeEZ2bmZSd1Y3aExMWWYrU2Ux?=
 =?utf-8?B?cU5ZSDQzOUMrV0RoVkFoR0Z3RUoyMnhzcjIwOHZVRnNZaUV2em55cmRMSUY5?=
 =?utf-8?B?bk9EWmtOSjZvSnliR3lMcE5kdmFXY21FSUI2SnJGZkVqTnFTemtXeGdtWWMy?=
 =?utf-8?B?TDh6ckJlc2dJMWNIY3JCSmdzcDd3UDFwOXpJbE1vblhJT3BSQUZIRlhGT3gw?=
 =?utf-8?B?UXhpNmJmMWZYRTMyZkFVa01HNnhJNGdZNUpQcmVPTW5QRE9nUFhzYkxSYzZY?=
 =?utf-8?B?SUtIRy8vZFNZUkx2M1VhKzJlcThrUW51M2FweVV6QllnUjJPd1dTNWhMRXls?=
 =?utf-8?B?MkxxTENYazdKRVNCUlhKMWx0RVBYTk43UDZuMVlkbmpvQWJFTkp1U0xyN1E2?=
 =?utf-8?B?a0hPY1ZLR0dCLzJsQ2ZvVjM2MzVNMnJxczBtY1FaVXYyUDExMit2eUZkZ3h4?=
 =?utf-8?B?Szd6L0F2WkRvWktsYUZHdDc0WTMxWGRXcW92cDQ1MVA5NDRJV2JQZVZmc1c2?=
 =?utf-8?B?V3ZaSFdkRUFUVFBBd3lLV1g1ZFRtK0ZuUjdPbkVJVlFSbHVnNlBaTk1wUGFl?=
 =?utf-8?B?LzJaTEZQQVhYdW5Wbkp6QUlPL0tnN0ZpaHpWMDJYY042K0lJL0oxcHliWGNn?=
 =?utf-8?Q?mb0n1l?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VnBSWWdBcmlLTmZTL0NLY255YXlXcFAxNkJOYzVlaG9OcDBhZmFNTmpFMTlz?=
 =?utf-8?B?ajZUc1JWRlRUYWRrRWRwK2VDbDRhakl4ZDFzYVcwUXNVanlPYW9ZOThVNmRu?=
 =?utf-8?B?VTk4SndMcSt4RFIzYjRjMFZ2RFROZFVPNktGUjFEWno4c01YVXN3MW82Z0pB?=
 =?utf-8?B?eWhDLzlzUmNkL0d0MzBsVk1wdW1aVmxaUHF2TllOZlpndTdReGFhdjlrQnRK?=
 =?utf-8?B?NStTZGFQdHhNVWVISzQ1U05hbnBxS0hISUJaWUtvSW5Ya1BxTzl4Vk5BVWZt?=
 =?utf-8?B?MTJidjh0ZVY5NExERmxTSXF3Y3lYV2doYUU4ODV2b1ZWeVVGa1lpQnNWQWpB?=
 =?utf-8?B?K2NDS3FHVnlLOVFJQnBrR2dZcHJFcUlQMWZNd0ZhelY2RnZXTk5ONjcrV0NP?=
 =?utf-8?B?NHVPL1VLRkZMa1hsOEFHU0xPUXhEU2RUUnRYcWJ2dWRFY1ZHSGhjTUZCQXgw?=
 =?utf-8?B?Zk9iQmJVMHJXMnFlVnpKNkNoNnVwNmZLWGtlQjFwTC9xQi9iVGE1dmwwdHl5?=
 =?utf-8?B?RHhVOUpuaFhVRkpILzZmeXc4VlhUQithWjh3WFYwdm8vRmY0aTVYWWpTemMz?=
 =?utf-8?B?cUZVbzdLcm1WajBZaDR1QmZFdGx0d25EQmJYeHUxcTRjTXBaNU9PU2d1b3pD?=
 =?utf-8?B?bWV1MmhZVjBsa0xaK001ZGFWNHd3bDdWQ3NRQVhrYkhoaDNITERVR2NZejVa?=
 =?utf-8?B?ajFNVkZCa3dIR1FrZzRzMmxNZnZxV3c1TG1EYWljanZjS0UrZ0J6bHE1TllN?=
 =?utf-8?B?MFNQK2hZRFRyak9KQkRpbHdMeW81L1hKRUVjbWtiY1VCME1FMUhKRFZlcGVs?=
 =?utf-8?B?MCtMRDYvNW5EV0x2akRMRnFwVUlYdDhoT1NrMFFQMGh4ZU5uVUNOOFg5UTBr?=
 =?utf-8?B?bXhFRU13SzJPc20xWjRSTENXbnB0VXdnUUhKUWxmS0JQU1NCcW5YRlpoejE0?=
 =?utf-8?B?dWpZUXFjYlQyUUVDeHp4UGd5VkZCSUxjZWx0OFVFZGhCRzVpTjhhRGpEM1pa?=
 =?utf-8?B?cDI5STVPejFDM3dnYVZtWXZuK3BSYmlaNHN2TXp5MFZXdW9KY2JtUllqc0ZU?=
 =?utf-8?B?Wm8yNnVibDRwdDlBYjlzeVZheWcrYkFYRW1jeWhhWGc3OVhpUVR5ZXpPRXgy?=
 =?utf-8?B?cVVEQ28wK0pJSGdnMjJENmNPSWNaOEsxYmxLRjRvUDUyS0dlUnBleHkwK1Nt?=
 =?utf-8?B?dWo0TnFDRFh3WnUyTDFmQzhhbnVSWFBoUU1DK3c1UFJ0eEE1QmhJOEZ5N3ph?=
 =?utf-8?B?aVdaWkhLNFpuK2xrd2VXUjFhdG9VbHE1VzZGZGV6NDYwV1NPenB4RFdqQ2hX?=
 =?utf-8?B?YlRzN0F4K0oyWExVY2lrRnpEUG81WERSbm1zalo1bklkTnpFS0hkNlJTRWlK?=
 =?utf-8?B?bFVVQ0FWd01sK0d2bFh4anVMN3ZJbWN4WEYrY1d6MkYzYzQyTmMrZjVLWFY3?=
 =?utf-8?B?S1I1WlpJZWRROTFtbVFUeDRCOGlzcDc5Sis1bkRKNGZGY1Z6TzBGN2ZjTklw?=
 =?utf-8?B?WlVVNXR6QVpWblREYnhkMTkreUhiUENjaXVSUnlIaGlodmRZTUNjRWdnWjJt?=
 =?utf-8?B?TnpKeFBPS09iQUtLaUpaeXdtY3RtYW5lM3NieWc4bmI1RTlRVzk4Zm1vSFB1?=
 =?utf-8?B?M2ZRd2VUQ2pXZTFmZ0RVZEM0RjI3OVYzdGx3clpIZUhadm1yMlN0VTFMVzJi?=
 =?utf-8?B?YnlRUnM2cmp1VXg3NHJIRGhObUY5QlhZc1FnekhPMDliY0IvbmJRUHRhRjFY?=
 =?utf-8?B?eGFya0w0eHQ3QjR2cEhOSFVFZzExTEJ0U1VyMGFuZnl1MnFveXhJc0ZQVTcw?=
 =?utf-8?B?cWxZNkUrajdOTXhkSXV4MFBwWWJhcnVSTVFFd3ZpTjlQbHBvVkRXQzZKZnRG?=
 =?utf-8?B?SkVSZ1ZiTllkY2pKcUpFcU1qMnlDTk5NNGdSeHFvTkxNSVcvNGNNSE9Ncm02?=
 =?utf-8?B?aURUdEtOYVdFaEI2dlpXelBWajNKbVNXVlgzTitYYlZVTjF4RXJkbWlwemVG?=
 =?utf-8?B?TEhOTG8zU3VkaURjYXpQRG00UVp3VVJkVkc1K1o2SzN2alB3Z1NUWWNBU3Qw?=
 =?utf-8?B?WWZqeTQ4aDJyaUJBU1VMSkVwS0paelZjVTB1T0d4ZTlPWUlvb25aRzcxT2ln?=
 =?utf-8?B?OFBZdk0wdXBjNGhTOWg1UUs0a2o2andlRmZ4TDZtZkRsYnBySEFBSm5IYjY0?=
 =?utf-8?B?Wmc9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 33faec28-cad4-4e1b-595d-08de29c5ba3e
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Nov 2025 12:50:34.2882
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BvqzffQKGdRkJ1IJ035aRbPbtpAtvnuWS/hBLUiv6Zmbwg0yMpeqeiBMrA+jHikEPWUXSaHe/PHyCQNomRY+0jrdHTJWn+Va+aGyyM2MkqU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB12494

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IDIxIE5vdmVtYmVyIDIwMjUgMTQ6NTgNCj4gU3ViamVjdDogUmU6IFtQ
QVRDSCB2MyAwNC8xM10gc2VyaWFsOiByc2NpOiBEcm9wIHVudXNlZCBtYWNybyBEQ1INCj4gDQo+
IE9uIEZyaSwgMTQgTm92IDIwMjUgYXQgMTE6NTIsIEJpanUgPGJpanUuZGFzLmF1QGdtYWlsLmNv
bT4gd3JvdGU6DQo+ID4gRnJvbTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29t
Pg0KPiA+DQo+ID4gRHJvcCB1bnVzZWQgbWFjcm8gRENSIGFuZCBpdHMgYml0IGRlZmluaXRpb24u
DQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNh
cy5jb20+DQo+IA0KPiBSZXZpZXdlZC1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydCtyZW5l
c2FzQGdsaWRlci5iZT4NCj4gDQo+IEJ1dCBJIGFtIG5vdCBhIGJpZyBmYW4gb2YgZHJvcHBpbmcg
cmVnaXN0ZXIgZG9jdW1lbnRhdGlvbi4NCj4gSXQgbXVzdCBiZSByZXZlcnRlZCB3aGVuIGFkZGlu
ZyBSUy00ODUgc3VwcG9ydC4NCg0KT0ssIHdpbGwgZG8gd2hlbiB3ZSBhZGQgUlMtNDg1IHN1cHBv
cnQgbGF0ZXIuDQoNCkNoZWVycywNCkJpanUNCg==

