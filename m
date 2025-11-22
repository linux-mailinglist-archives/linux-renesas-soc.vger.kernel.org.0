Return-Path: <linux-renesas-soc+bounces-25025-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id CAEB4C7D15E
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 22 Nov 2025 14:20:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 41C0934FBE0
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 22 Nov 2025 13:20:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 820991D2F42;
	Sat, 22 Nov 2025 13:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="byWwT9w6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011036.outbound.protection.outlook.com [40.107.74.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 773153597B;
	Sat, 22 Nov 2025 13:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763817612; cv=fail; b=gBDzXjSk6f/SJ02IVYYRlT6m8NZ+lsMEo3AaX0k6syarkbmhl/Z7a/7swnyuRKiymZcCB2AKO6j0LVqYTbmwFMXI0BgO4z+kXTgU8+P3ejCYwaYA5D8I/J1yo402AJnZfA4mxCNzgKNauE/TkzeMe6JkeKobk1bbxbzcHb96ELQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763817612; c=relaxed/simple;
	bh=MPFsLhcvJon60AtGbrwYqI5oy8FFObSSGXfL1Qp/OcQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=cNA8qEwkdFMdCoMThwiseKlowNZAFzmzZD/TURE2H7gJ/C6ky8J1qwNNm/v+j3jN8MCDzeUO65aQLKZmKaeoiRbgeoXcaDeJOfYCcAJaNXY7oRPfbFIHPjhBVx22wL7HZTZoHEVZyBh76lhR5moSaiKjdFez+LOm5TDfzhGWQN4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=byWwT9w6; arc=fail smtp.client-ip=40.107.74.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MQ8hWhiNFefJ9/Bg79efsykblVZq2YUomfvV54qItk+JeA/Vn8hneYuVRZuWf8Bs8x5nE1H0iknqxRQatyuCC+athcM16sEBU4uO+U9JfCwIF7OgS47Vj7N0ckJv3+VEHSkD4p8CWRtEl1yq0E40lv+zhl9Bbaap7D2oWJLQCABOAABCoUBFtECDbfmCvKMI4WR7P1P8qvIySEgEQgi+HcmsFJh3P/PTSeK+WTIvNjxNyf0e0HRztKuVsAnSawPqzZG2TGNhNuiaCiZD+GGhxwutzuIUM6MvrKeyvbYwVaWuJhSOzRNbbKZu1OB2yme5MtaHI1fNCIoQUz89//5oBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MPFsLhcvJon60AtGbrwYqI5oy8FFObSSGXfL1Qp/OcQ=;
 b=KJIgrPFQV8O6jf/4uQxwhOrwJ28oPfUUzTEmLHENLJDbwRpfK7Ma+aJ7eSPbn6ULeWUFsxGEqUuabXLbcUphL6+I0F+j/K7TW1rBHvuIZqUHgWj/uAyYvm1L5PLbTeEqFrNYoRipS37R0uK4t7lgoL32I2NWV/ER/qx8QKLlS9I8WdK/MX2VtKyV5FAPMb23eml7qpPlPAN/+511DBxHXX2W5gZuRBnOtio1nP4/yAJ7cyOvWwRpUfgzErQRBMBCnJ1OJYHrn2QzrJtTuLmJJXnFDSTLGaz5FYIecO0sHoXxPgORZfhwZgV1SQ6e73CCXZDi3qwFoAtGa74HpHARww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MPFsLhcvJon60AtGbrwYqI5oy8FFObSSGXfL1Qp/OcQ=;
 b=byWwT9w6xsrepPoT2zRHSOQl7Ye9Toy077PgA+Lfwb3OKCMOmWCZt6l2vXxm8NKC5LA/FmRwr9KXool2wNn9nta92R+SaUZAa4ol9d9/YUsetefO/aRRZ/Y7a3D8eoXf0/p4vfKONVnhH9sGLdWViQjP+iPm56T0MN2a8X5BzJ0=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY4PR01MB15177.jpnprd01.prod.outlook.com (2603:1096:405:268::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.6; Sat, 22 Nov
 2025 13:20:04 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.9366.005; Sat, 22 Nov 2025
 13:20:03 +0000
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
Subject: RE: [PATCH v3 07/13] serial: sh-sci: Add RSCI_PORT_{SCI,SCIF} port
 IDs
Thread-Topic: [PATCH v3 07/13] serial: sh-sci: Add RSCI_PORT_{SCI,SCIF} port
 IDs
Thread-Index: AQHcVVS8c8Hu/yPrME2Fe8ZdkVk3wLT9SGiAgAFwgSA=
Date: Sat, 22 Nov 2025 13:20:03 +0000
Message-ID:
 <TY3PR01MB1134612DF9B298D9B9A3B667786D2A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20251114105201.107406-1-biju.das.jz@bp.renesas.com>
 <20251114105201.107406-8-biju.das.jz@bp.renesas.com>
 <CAMuHMdXgYD2wfC3Z=3CAR4KVaMh_hMe09KEjg+NeEwu_DN1i5g@mail.gmail.com>
In-Reply-To:
 <CAMuHMdXgYD2wfC3Z=3CAR4KVaMh_hMe09KEjg+NeEwu_DN1i5g@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY4PR01MB15177:EE_
x-ms-office365-filtering-correlation-id: 02a1b262-f7ca-483e-b4c8-08de29c9d8fb
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?U2s2K1E0RVM1TmxnM3c5NU9EWkFOdEsxZlRVZUFiZWNmbE9Ld2VvUE9oUC93?=
 =?utf-8?B?UVVTN2U4dUx6K3ZkL21mQ1ArMkFFdHFIM1cvM0c5bEVEZ0RTSVk3cnpvRXMv?=
 =?utf-8?B?cTk5YlZQalNCR213SFRHWTlhUXVmM1J2VG1SYXM4dDFlNzM0OHhFVnVLOEU0?=
 =?utf-8?B?ZkV0SjR4RjdrakViQ0JERmZHVGpsRkV5RjdxZk1RdnZZQzQ5amtMUHdFUUNQ?=
 =?utf-8?B?Zm00OVJ2dmxRWjVDdWxDbTk5ODdGOThWUFJWa2JuVURWU1JaVE5wMjdiaTNQ?=
 =?utf-8?B?Y1F6eVNQZzVaMlBPWkxTYzhnNXlCQmdpM1FoK2JVUG81cjZhYmh4TjduOC9P?=
 =?utf-8?B?eVF0aHFjNVNueWRyUlQzdjVHRkEwWWR5SkJJQVJBTnFaSExSdUIxeFVSOExY?=
 =?utf-8?B?MFJRWklIV2xXRzQvMHhXQjV5bUtUeDhuQjdmQVdjODFneGdFamdwZkRueU4x?=
 =?utf-8?B?VysvTUlGWEgwNDNBSlpIUXZaQXZjOVZNUnZIMVB0bXJRWVV2WjYyQ0VRS04z?=
 =?utf-8?B?VFpkWHRsaldyYUJWcGdmUmRZL1ZrcmVFbWQxWFZaQWh4MWVQcU5hRTM3aWRp?=
 =?utf-8?B?QlpFS09xRGdZekROQVJ1QWdhQ01YVU5tZ085N21EL1NXWnJpVko4amhxVC9H?=
 =?utf-8?B?MWlScjFVOHhHY21jWjNCMW5uc1V3VTd3dXV6eHJ4MUUwMWVrWWJObE1LZjFx?=
 =?utf-8?B?UnR4TTFXbWZMUFlKcWN2NTlCZzZFNS95eGJDd09nR0pPUHRsekdhbys1OTdP?=
 =?utf-8?B?cDRaNm1iWldOLzE2VlJwRjJzVUl4V2ZMUGl6Nng3WlNkTXJ2QWhQZ0ZVaWRn?=
 =?utf-8?B?djczSzVzNi8xNnNTMmxhNlRETndmOURyOXNPTkVaa0pKQ2w5RkowUmdlM3Fx?=
 =?utf-8?B?cURrd3krNWNuZ2ovc0VwVXdQWHNBZ2E4WDNEcFRvTGlBeDk0V0FwN2ZwY2Jr?=
 =?utf-8?B?L1NsYnBFRFdEeW16R1dld2gwbFhraldhVHdjekVNd3pPRFl0cGZrcm5VdlZp?=
 =?utf-8?B?d3ZBYTVmNElzY2xMelByMk5zWUZoeElEbTZBbjlFakFHRk5ibnBIRmdzeHRq?=
 =?utf-8?B?dHUvRkdyRWNvVGFYQWVxM2RtbURIYUNUWXQ1SEdFalpuaWRHMVZhWWJJOExr?=
 =?utf-8?B?R2dMWTUvWnN3QUFBYnUxaFpzUFNlNzBBYW9lbzVKcWxQNk0vazA0cUtCOEo5?=
 =?utf-8?B?QjNkS1NQUXNKb2sxMnM2RVhoYlUzSVlUUFhnUjMza1hxcHBBbTUvTHpJOXRG?=
 =?utf-8?B?cUtHMzYvdWNlU095d2dwOEdzcFRnMW1wQmZkd1Fxd0ZnSUhzZjhMdVZVM1Vp?=
 =?utf-8?B?VW9KSkJSTHZXVlViZW85b3ZUYU9ybm9WVnlxQlNVcS9IeS82MXhsaDRvNlZj?=
 =?utf-8?B?OVlUSlQ5dEY4cHFZNFZBU1J1bmZIN3NiczMwaXRkUWgyaGM1UW5Hczk1bStj?=
 =?utf-8?B?N0tyR1hkeVFGNDNkbEgxYnpqci9kNEF5M3grd0VLRVpjbXMzY1IrNHFnSk9n?=
 =?utf-8?B?M0hmSEZEbG0wbTRMaGpMbm1ITEYyV1luZUlZRWNqWG5vMUJ3VnVrMmxjSmVz?=
 =?utf-8?B?M2dpN2dwUWtPSHpkNnVFdHJpT2phaG85Tlc5SUlvdXpITTlSQjYzMTlvaTV3?=
 =?utf-8?B?NEdDMzNMOVU4S1ZmS2ZEejYvb2NhSjh6ekFPb1BtcmtSNUhjblB3N2s0dVF3?=
 =?utf-8?B?dGh3OFhBNzR2MmxLS21ZV2pENXd0enRhbklIMzk2STRiRzhaSjQvcEN6WHZx?=
 =?utf-8?B?dEVPNXcyb2c1azRmMVkrenZFZFBXRS9yenRIZnZjcTIwUFB3MDFETjFmdXJO?=
 =?utf-8?B?SWxIV0RlaHJTbXcwNmViRXZIaEtrcjl3anhpOVh1cTRZbkw0UDU4YUhUelI5?=
 =?utf-8?B?NnNVVDlYVk1sUVMzc2YrU21INERZNEMwZFYvdmFNdms5cy8wS0lZd21MYmZi?=
 =?utf-8?B?ZlpUaGo4RUhsYitIelNyazBIUWY3WG1EMFNnbjdCN0k4QnNPVUh5SEEwK0JR?=
 =?utf-8?B?dmlVb0xkSkdMZDFoSDVPZS9OZ1EyUmRiWVd3N28yYnhITXZra1I3VkhSc0tt?=
 =?utf-8?Q?oH9o6m?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZGE4NnpJQlh0Tk1ic3JQcGdiUndsK2EwdnFCQS84QUZIZFVNenJwMTNnTGJY?=
 =?utf-8?B?SUNYS2xCNDAxWmEwSThoNmNCWWdKTEtwWHFIZS9TajFvNmhRZWxveEhnWm1q?=
 =?utf-8?B?anR2M2lxZTVzUHhESEV3RExBdEpqZ1JJZy81SGV3S3o3Yi9wT3hWRWRlbDIv?=
 =?utf-8?B?dDlSODdmR2VrSnJQNE1zMzRsbkppcWg1akNlK2E3ZHFjTVY4ODRqdlU3dWlT?=
 =?utf-8?B?RVQ5cG04aG1yVWFRTis5WlArUXluR0NDeHIyVWluRFdDSVEzV21CZWUxMFE4?=
 =?utf-8?B?R3FTMEJoTDdVSVVpQnk2eGo0NXdqRHBKTUhXVGhaeXFPbzhVSkY3TWlxdXFP?=
 =?utf-8?B?L1NZeEdtZHpxRGdBNkZ3Mk5FTXNUZzRvMVFKQUp2UzJEcFlONGgrUGJYMzM4?=
 =?utf-8?B?ZTk4a3BKU3VFbm5JZDIyVHJJQ05EcGhqdkJRV1NBQ0tUVVV0d25EMUNZLy9K?=
 =?utf-8?B?bEkwVHM4cmtuSjFzR25oVUR6T1hhOWw0QldIUXNZNXlnMU1PWWwwUnVISElj?=
 =?utf-8?B?SllWbGVKczJPZExwQlN5S0xleHlZWVFYV0gxdHB3bjZGZkw4bEpQQk5sNVpa?=
 =?utf-8?B?TFBSdXFZdmFHS1plalFWSC9YZEJ1YVg0d3RyM1hxQjJwWVZ5bjlmSGZGRitz?=
 =?utf-8?B?YkU2aG5WRDZiZm5PQjFhRnVTTU9PeTYxZEVLSlRzcVFaOU5IN1BET2JqSUZO?=
 =?utf-8?B?a1JpZTNvVCsxT1A5QmlnenJKQmJaR243MDFrMTFSRGxldjJSNmNjcVd0eUhp?=
 =?utf-8?B?ZFdnOThXQjFodGQzZ3FtSTZBY3l3eUpJZzdlNGwraDc0SWJGRFdCUi9vVm1u?=
 =?utf-8?B?SUVyQkYvUDZYVkh3aE54SUt4WUIrQ0EzaU5paG0yR2NBSlNCVGlzZDE4OG1z?=
 =?utf-8?B?MGZEcnRvTEQyOEFXZndMVHNBU0RPWTdTamZmVm4vaTZ3d3llSURvU09OMndn?=
 =?utf-8?B?RURUaWxNYnh2dVNJRkxqYlUvSFRjWlRRV3l2Mk0vUlB4QUdUU203eExzaVV6?=
 =?utf-8?B?UlNQV3M1Q3NnSk14ekRsT25oN2VwNURhTEZsTklvblZRS05XWEhoU1lUL2F0?=
 =?utf-8?B?Wkp3cUk0OUpDM1JlKzhWT3lTMDhHdWVValBtaEpya0tjNjgyelZPS0hQWlZj?=
 =?utf-8?B?L1FuNmVJVC9UZTNYUFpJTkRLVzRucGJ1WTFxd1BtRDVXaXJsa1dKVUY5RkYz?=
 =?utf-8?B?Zk5oUUpXNGlVM2l5UDVuZ3BRc0tzU0hOSWFZNE9DUjZBaXBUb3VERGtHUHpl?=
 =?utf-8?B?S1RVRmxOM1JzL1dPMHVPV09aQy84UzA1NE9hWi83TmhzaC9UUWUwWVBZR2Ry?=
 =?utf-8?B?bGQ3dUZEVXBZYnl2SmVRMkJ0NWVUWG1KL0xOTmFpcVovMGRFbGRjazkvY1Rt?=
 =?utf-8?B?QlovMUdPUFhKYTJnK0MzTzY2NWVRZUx4UTlveklGeDlMVGIyODVkRmdGVW5K?=
 =?utf-8?B?YnFGeCtMaGZsdHlwdGdvS2U2dUhtR1ZQS1o2UGo0M1o1L3BCTXhzMDB2VUd5?=
 =?utf-8?B?M29SVHF0UCsyZGM3SWRKWFJTOTkrNGUySVdsRm5sTHp4MEZPSXpXWSsxSXVZ?=
 =?utf-8?B?bG5FaitUcFJxTjFLWnZOdDI4WmZXaG85eCs1NTcyZ0V6bGxJeWU4cW82VmNv?=
 =?utf-8?B?VVpXQnBKc05qd2J4SFQrVElPSHZkSVdWSTRVWWpvNEZhbVMzdHBFVmhyNmow?=
 =?utf-8?B?d3M2bkJsbllUb3Qydk5rTkpFVGI2Uy9JODM1b3ZUZVNrR1JpSzBZTUlZMHVo?=
 =?utf-8?B?elVwQ3FxbFJoVUE5SVQyZGhGNW5reHRiRnU3VWcydE1zek9qN0VSaXZtTWs0?=
 =?utf-8?B?ZElvMnVYN0hYaTIrZGxROG5xQkxBb1B0UkdNR0RWV09XQ0kyWGtWVUowRDhu?=
 =?utf-8?B?N0cxVGFhUWlSSTlXQ1VKYmdsU0FOQTdFcUxCR2EyNUNyLzNjQ2tUWVBUOXd2?=
 =?utf-8?B?Y1I1NmJNbEphajY4N2E5dmI5Vy8zSGcrbG14WWZXR3pKVUxyVEszdFNhYkgy?=
 =?utf-8?B?L1lPZHNFRnR2RDBVV2xremJrbkkwcEVRZm9rTURQM1FFeERENjZMaGdNTVkz?=
 =?utf-8?B?bXVvUXcreHFTcnNPMmhJSEdKUlpnSEhaditXZm9rZkltMVBwMFJTWUdQZGVj?=
 =?utf-8?B?NVZqYVU4WHJ2VmYvT3BLY0xBMjBYSGQzbnZwQlpjRjIzbERYWitoT1FaTlk3?=
 =?utf-8?B?N2c9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 02a1b262-f7ca-483e-b4c8-08de29c9d8fb
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Nov 2025 13:20:03.8583
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vk5pRVKAm9ivK9kOcXc0bnNQkkMTAxPdGpSjjjIlBNsZ4gtQVLwsTqmYvFKzDyyoALtvcVrm+bDBeIXZEE+AzmK4wpGSuulwXUMjAaAx+zI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB15177

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IDIxIE5vdmVtYmVyIDIwMjUgMTU6MTUNCj4gU3ViamVjdDogUmU6IFtQ
QVRDSCB2MyAwNy8xM10gc2VyaWFsOiBzaC1zY2k6IEFkZCBSU0NJX1BPUlRfe1NDSSxTQ0lGfSBw
b3J0IElEcw0KPiANCj4gSGkgQmlqdSwNCj4gDQo+IE9uIEZyaSwgMTQgTm92IDIwMjUgYXQgMTE6
NTIsIEJpanUgPGJpanUuZGFzLmF1QGdtYWlsLmNvbT4gd3JvdGU6DQo+ID4gRnJvbTogQmlqdSBE
YXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+DQo+ID4gUlovRzNFIFJTQ0kgdHgv
cnggc3VwcG9ydHMgYm90aCBGSUZPIGFuZCBub24tRklGTyBtb2RlLiBJdCBoYXMNCj4gPiAzMi1z
dGFnZSBGSUZPLiBBZGQgUlNDSV9QT1JUX1NDSSBwb3J0IElEIGZvciBub24tRklGTyBtb2RlIGFu
ZA0KPiA+IFJTQ0lfUE9SVF9TQ0lGIHBvcnQgSUQgZm9yIEZJRk8gbW9kZS4gVXBkYXRlIHRoZSBy
eF90cmlnZ2VyIGZvciBib3RoIHRoZXNlIG1vZGVzLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTog
QmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiANCj4gVGhhbmtzIGZvciB5
b3VyIHBhdGNoIQ0KPiANCj4gPiAtLS0gYS9kcml2ZXJzL3R0eS9zZXJpYWwvc2gtc2NpLWNvbW1v
bi5oDQo+ID4gKysrIGIvZHJpdmVycy90dHkvc2VyaWFsL3NoLXNjaS1jb21tb24uaA0KPiA+IEBA
IC04LDYgKzgsOCBAQA0KPiA+ICAvKiBQcml2YXRlIHBvcnQgSURzICovDQo+ID4gIGVudW0gU0NJ
X1BPUlRfVFlQRSB7DQo+ID4gICAgICAgICBTQ0lfUE9SVF9SU0NJID0gQklUKDcpIHwgMCwNCj4g
PiArICAgICAgIFJTQ0lfUE9SVF9TQ0kgPSBCSVQoNykgfCAxLA0KPiA+ICsgICAgICAgUlNDSV9Q
T1JUX1NDSUYgPSBCSVQoNykgfCAyLA0KPiANCj4gT2ggbm8uLi4gQW55b25lIHdobyBjYW4gcmVt
aW5kZXIgd2hhdCBpcyB0aGUgZGlmZmVyZW5jZSBiZXR3ZWVuIFNDSV9QT1JUX1JTQ0kgYW5kIFJT
Q0lfUE9SVF9TQ0k/DQo+IA0KPiBBbmQgbm93IHNvbWUgUlNDSSBJRHMgdXNlIHRoZSBTQ0lfUE9S
VF8qIHByZWZpeCwgd2hpbGUgb3RoZXJzIHVzZSB0aGUNCj4gUlNDSV9QT1JUXyogcHJlZml4Lg0K
PiANCj4gU28gd2hhdCBhYm91dCByZW5hbWluZyB0aGUgZXhpc3RpbmcgU0NJX1BPUlRfUlNDSSB0
byBlLmcuDQo+IFJTQ0lfUE9SVF9TQ0lGMTYsIGFuZCBhZGRpbmcgbmV3IHR5cGVzIFJTQ0lfUE9S
VF9TQ0kgYW5kIFJTQ0lfUE9SVF9TQ0lGMzI/DQoNCg0KT0ssIHdpbGwgcmVuYW1lIFNDSV9QT1JU
X1JTQ0ktPlJTQ0lfUE9SVF9TQ0lGMTYgc2luY2UgaXQgaXMgb25seSB1c2VkIGluIFQySC4NCg0K
SWYgeW91IGFncmVlLCBJIGFtIHBsYW5uaW5nIHRvIGNoYW5nZSB0aGUgZW51bSB2YWx1ZXMgYXMg
YmVsb3csIHdoZW4gUlNDSV9QT1JUX1NDe0ksSUYzMn0NCmlzIGFkZGVkDQoNClJTQ0lfUE9SVF9T
Q0kgPSBCSVQoNykgfCAwLA0KUlNDSV9QT1JUX1NDSUYxNiA9IEJJVCg3KSB8IDEsDQpSU0NJX1BP
UlRfU0NJRjMyID0gQklUKDcpIHwgMiwNCg0KDQo+IA0KPiA+ICB9Ow0KPiA+DQo+ID4gIGVudW0g
U0NJX0NMS1Mgew0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3R0eS9zZXJpYWwvc2gtc2NpLmMg
Yi9kcml2ZXJzL3R0eS9zZXJpYWwvc2gtc2NpLmMNCj4gPiBpbmRleCA3OGZiM2I2YTMxOGIuLjY2
YWI4NTU3MTIzMCAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL3R0eS9zZXJpYWwvc2gtc2NpLmMN
Cj4gPiArKysgYi9kcml2ZXJzL3R0eS9zZXJpYWwvc2gtc2NpLmMNCj4gPiBAQCAtMzMyNiw2ICsz
MzI2LDkgQEAgc3RhdGljIGludCBzY2lfaW5pdF9zaW5nbGUoc3RydWN0IHBsYXRmb3JtX2Rldmlj
ZSAqZGV2LA0KPiA+ICAgICAgICAgY2FzZSBTQ0lfUE9SVF9SU0NJOg0KPiA+ICAgICAgICAgICAg
ICAgICBzY2lfcG9ydC0+cnhfdHJpZ2dlciA9IDE1Ow0KPiANCj4gSG1tLCB3aHkgaXMgdGhpcyAx
NSwgYW5kIG5vdCAxNj8NCg0KSSBhbSBhbHNvIHN1cnByaXNlZDsgdGhpcyBoYXMgdG8gYmUgMTYu
DQpBcyB0aGVyZSBpcyBubyB1c2VyLCBJIHdpbGwgdXBkYXRlIGFzIDE2IGluIHRoZSBzYW1lIHJl
bmFtaW5nIHBhdGNoLg0KDQo+IA0KPiA+ICAgICAgICAgICAgICAgICBicmVhazsNCj4gPiArICAg
ICAgIGNhc2UgUlNDSV9QT1JUX1NDSUY6DQo+ID4gKyAgICAgICAgICAgICAgIHNjaV9wb3J0LT5y
eF90cmlnZ2VyID0gMzI7DQo+ID4gKyAgICAgICAgICAgICAgIGJyZWFrOw0KPiA+ICAgICAgICAg
ZGVmYXVsdDoNCj4gPiAgICAgICAgICAgICAgICAgc2NpX3BvcnQtPnJ4X3RyaWdnZXIgPSAxOw0K
PiA+ICAgICAgICAgICAgICAgICBicmVhazsNCj4gDQo+IEFueW9uZSwgYWxsIG9mIHRoZSByeF90
cmlnZ2VyIHNldHRpbmcgZm9yIFJTQ0kgdmFyaWFudHMgaXMgZnV0aWxlLCBhcyByc2NpLmMgZG9l
cyBub3QgaW1wbGVtZW50DQo+IHNjaV9wb3J0X29wcy5zZXRfcnRnKCkgeWV0Lg0KDQpBZ3JlZSwg
YnV0IG5vdyBpdCBpcyB0YWtlbiBjYXJlIGJ5IHRoZSBsYXRlciBwYXRjaCBpbiB0aGlzIHNlcmll
cy4NCg0KQ2hlZXJzLA0KQmlqdQ0K

