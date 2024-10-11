Return-Path: <linux-renesas-soc+bounces-9677-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 44ED2999EA1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Oct 2024 09:59:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BC1271F2467B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Oct 2024 07:59:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7111620A5F7;
	Fri, 11 Oct 2024 07:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="BrKsCHm5"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010061.outbound.protection.outlook.com [52.101.228.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDDD420A5EE;
	Fri, 11 Oct 2024 07:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728633579; cv=fail; b=hwX2Dh/JpsoGm5ReN+iBte2JKqYZNt+QrVwMORihEhDFn60IjveLAnFXe+gRsMRCm1QX34uQ6zuG4Ih7TksFhkZRbIZ6HPJJOR3HjMI/D+zV4OHKVvqDQQe/CfnuIq3AStZ94l27svXBrwx9F1R0zNv4noMbnFkliaXxT1wlBq0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728633579; c=relaxed/simple;
	bh=ZkkV10vSaW6sg3Lszh7foZIcy5SMNB3XVF9l5cHyU8M=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=S9vr5iSAxQmE6u+4yKOpt4di2onp2T9/vyspJWK9UKAlAjnXioVPzJstS33DifXLePutM3XqDTPT6Tjpr+rVQdQVUNYbMB1+tWw74QbvJmNUdVQ5iPIT7yn1I1T2Fl4ytFVtjzq9iKD+DDu7gM64GKYsGXGRAD6X6CQ1FRDiCSI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=BrKsCHm5; arc=fail smtp.client-ip=52.101.228.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Im3t+iGSpMPAj5UviLEgzDzfwp//xIbmkQ+g2mmwg1L/3u1YXT6m75jsnwoHcGzKobpXfPHSZRf7LoeLz7ujdXiRn5tTlH8NsisUEO0Dxy/SNXqbmkLkUwunekZZ3bsPL2/e5TK8umSDKv2yehwq+TMswWkY1aJSxd8FTurvj2P4808AURb/RbJ1DmCt98t+DmfQm7VaY392nr6GKaBSu+pQtwvM2AF9sqyCrWd/I/lzbVH7tbIjCimI4JYBMgW4xLMFWVvw/UWv/sROu9v9EsFlYa2A+jA7tlcVjQPlP0CKciUVIVy4EL/1A1MlhOJ6Xx7rz8jQDCR2MqUpSUPHIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZkkV10vSaW6sg3Lszh7foZIcy5SMNB3XVF9l5cHyU8M=;
 b=XlDAIFzfDFEK73Xptq99WZ5YydUwVxkyQEMUyXtoSWNgSjOiA20lP3Merw4/wNgfIaXNxA4GNjEZuvQSa613C1qsxfAdJmk0HEeow/I0OeDg+Y/qFB3GddWNDvxck6gznhzG7agqFwENMPBVUzAxH+IKIurpqf7M2nuwbthYQBtCmADB6odeo4b5bP6AiInfwR7kvonYc0c/PF0bph4iZjcgjjCKqFkTczjOtX88uDdzG1POOEvfmNnNwZ+h4hn8koYWrV3OxOvyEBp6qV770NGUEmWDVg/2OqP/cecu9pYCSIh5ry/0gR8Rm5v0DWNo3sAaWZKAO6pINp9edpx/ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZkkV10vSaW6sg3Lszh7foZIcy5SMNB3XVF9l5cHyU8M=;
 b=BrKsCHm5KPLYtctXMIo9U8GOaImICdY5UT1so0VIuWGuYdLhu8MNxsGPWnWOBvb+8QsfPIPqIaYtziWd+SD0ioBV+vK6uGosp/JRPzc+GA3jZVtqr1i3Wf/+991c6WSbrUtVMjtQmtHzYyNMW9f7fdcLKo1bphxo9n3GtNQf/0Y=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS3PR01MB9577.jpnprd01.prod.outlook.com (2603:1096:604:1ca::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18; Fri, 11 Oct
 2024 07:59:32 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%3]) with mapi id 15.20.8048.017; Fri, 11 Oct 2024
 07:59:32 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>, Magnus Damm
	<magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v2] arm64: dts: renesas: r9a09g057: Add OPP table
Thread-Topic: [PATCH v2] arm64: dts: renesas: r9a09g057: Add OPP table
Thread-Index:
 AQHbGaIZmx0KhA/2XUiyPZAzZz+L/7J9FRWwgAAGadCAAC1egIAA3vUAgAACHjCAAAk3AIAC+5uwgAAB5QCAAAGLMA==
Date: Fri, 11 Oct 2024 07:59:32 +0000
Message-ID:
 <TY3PR01MB1134642E82FBCF217DFD8A75386792@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20241008164935.335043-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <TY3PR01MB11346A1726BCE1687C6AFF519867E2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <TY3PR01MB113469ABB6393E0A6451034A4867E2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CA+V-a8vWpUmq9esgcnjWVcPb-jUaLuKvhJF2VwiWrCx5_nOtww@mail.gmail.com>
 <CAMuHMdULuCWd1V0Az=NWHhSb7voDKbTo9rp3Excntp7qvTbbuQ@mail.gmail.com>
 <TY3PR01MB113460ED98BB6EE2575D0CBC7867F2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CAMuHMdX8rCM+yG4cwtG9yogwz0xWqD3O0aiXNMwE9Vkcpyhrkw@mail.gmail.com>
 <TY3PR01MB1134648DE5396A9ED9227BEB186792@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CAMuHMdWa0=pKfY=RL1NYXP+EBz6AK-6Br4wy4d_g4XwoCyW9og@mail.gmail.com>
In-Reply-To:
 <CAMuHMdWa0=pKfY=RL1NYXP+EBz6AK-6Br4wy4d_g4XwoCyW9og@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS3PR01MB9577:EE_
x-ms-office365-filtering-correlation-id: d14f9939-ac24-49b5-0c70-08dce9caa439
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?aTNqQXdRbTB0VG9OT3V3U1lXb1FUS0dYdGk5bWJXem53dGRtUWlkbmhyclFO?=
 =?utf-8?B?SHV2T08wRG5kblNJMDlSRlVtUTU4cmNqcHJadzd1dzNwenBKUHRGNXB3N0NU?=
 =?utf-8?B?azFjVU1JY2VSMUNHckp2MU01SExsaTE2cG1xLzBrV2x5NzJQZEtIUlFTUUZ1?=
 =?utf-8?B?MjVOVmhZYlg1M1RLb0ZpUHNtU2J3ZXNmMjBaNjZuQW04TFFBQmZ4TjFkbHBP?=
 =?utf-8?B?dkdMeXhQRWlsaHpiYVVTbko0L25SNTdaSHlTMGM4a3lmc3VITzdIdG5jTmJk?=
 =?utf-8?B?eU9PVGdHdDlBcFdjODdLVm1mYW1MdldiWm1MejBleWxydVIzR3I4L2lBOTlF?=
 =?utf-8?B?TlE1QmxaUVdRVEN0MDl5aXMycDdKRnphU2FMenhqdURoL1RvYTduN3dlODkr?=
 =?utf-8?B?byszTE5XRVN3SkpEYlNDTE5HS09LanY1RHNYWDU3Q1oyQkM5cCtzTHo0enlx?=
 =?utf-8?B?bGN1N0o1eFJvUXRuZUxzOUlObm9NYmt3TzFkWnNob0xpZFpoQWFuSUc2c3dJ?=
 =?utf-8?B?eEJYdCtYSC8yZ2w1dUR5ZWRkUFFzMWFYV2tyNUVoVDdadlhncjZOZjR1M3BM?=
 =?utf-8?B?SzBZZnVGNktXSEhTZGU3VGg0citFUDVJbDZLUE9Bb2xTSzVEK04wL1o4dGZJ?=
 =?utf-8?B?RW1oL29RRUZKL1hjQVJUL1JnYXdKNlBNbXQyR0k2cGJRSURKalRvT09GbUls?=
 =?utf-8?B?MVZZZUtkWk1kUXVBR2VOWXVPK1lweEh4ZktjV1RBRkhKSmlncGFHQ3FZdDUr?=
 =?utf-8?B?L3NKK0duRUFWS3AzdEZPWlVUY0YxWk5ERjhQR1ZNSlVGNjlOSGZrZ1hQQU9m?=
 =?utf-8?B?cTRFN1ZxbDhwVjVmN3piNG8wUzFBd1I2TG1jdU9oMVVBSDhHT0hDYVg4U1VS?=
 =?utf-8?B?QmlhdmpkaGJoU3RvV1EwUEZUUisxM0hJRVo3d0c3SzBNS3pWRHhaQWhpbXVU?=
 =?utf-8?B?dGxCc0VmbUVxaVBxdE51SEZrYVVBeDlpRkUzV3oyczdqRDBLdGpHWEI4Ym8v?=
 =?utf-8?B?V2lieXhKajA2bVdTK1BkbFlLWGlXQ0thNDlNa0xDSHE4R2FGTnRKMmVLdHZF?=
 =?utf-8?B?c0RRMlV3U2Q4SmFnSnNza2hpeThHdDRzVkFUUW12bnVReXluRmRzUUhXQldz?=
 =?utf-8?B?RFRjblJYOTcxRFpJNE85cGR3ZGpEeHFOcnMrYTBCdnhOakdlamN2djh5SmZx?=
 =?utf-8?B?SU1jTzVyZWV0SzFWTzBva2g4c1FIN2xXVURKZWErSHdiYXUzL0lCNmJObG1R?=
 =?utf-8?B?ZU5ZZkNYektuVVkvdlRlSkJBamNZSGFPckFpakIyUzRVakM0Yms2T0NXZnBC?=
 =?utf-8?B?OTdtUm1WLzVlcmtyaGQwNWN6NUZkRC8walU2dGw2YTVWSUtHait5ZFFBbTZJ?=
 =?utf-8?B?STdMbjhNakFQUmtYQmtsZ0F0V2FoY2NzNk4zdDk5TEtUaE9uM2JCb2VjY1Uy?=
 =?utf-8?B?cFdkUnJXRTBPSktKSTQ4VlJGcVIxYm5FbmNiY1l4MDJOSklPVTVmKzNPTUov?=
 =?utf-8?B?ajhjajFOMUdKb29JTlJiNDVmL1pzV2lQbWxXVkNGZG9sWHdRTkRPWGVseHMv?=
 =?utf-8?B?UUdxRUthRXdiRVZnMFVVME9QTjZPc1Q2d2Z2OG92aTdCcWVwSEc4eUdXU0xz?=
 =?utf-8?B?dUJIOXpjZTlaMXQ3d3BDZHhPTWZma011eE84WWpZV0tseWhaekJvcldacU5v?=
 =?utf-8?B?R0JmLzByaHpILzMrOUlMRHFHLzRPNVBzTHllazRJMUV2MHVmV2xVNUE3R0hH?=
 =?utf-8?B?L0lOdlVkdk8vRVk5emlCLzFqb0x5R3RKZm1lNkpGUmZWUHlRaVpLZXQvWkpZ?=
 =?utf-8?B?QzN1Z1o0VGVpWUgyTVNUQT09?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VEFVdEtvL2RzRWdwSWF5aDVvNVpmK1hVQSsveFgvVTBXQitYTEtMUWdMb0U5?=
 =?utf-8?B?V1JHa1ByaGV3WHVyOXpmSUdSQzNkanFBMlpTRWNnVUY5MXBuaTkrUTZkbW1o?=
 =?utf-8?B?MmdMZmd0bzllZU9rQmgwcTQzVmc3ekZRSGpDRzhkNG5OUUNudEVEVnJxL0V0?=
 =?utf-8?B?aHBDVGl0RWdndFJuNmQ0ZzJ3cjVPSUtpQlNnc3RRZmVySk5NbEJIVVh2YkpD?=
 =?utf-8?B?a3AyZmpEK1BzTmJLblFGRXUrN25NVnpVekVRbjVJUE5hZ2NIdEtYakRzd1p1?=
 =?utf-8?B?SEQwWURhOVBkVDdzOTlzNTZHT0F5L2dhM210VkZua2JHK2dScTNMSmpGdXBK?=
 =?utf-8?B?NjNHY2RDaC9TTzFjNTRFRzFOdW5WQitibEZCMVJRcGtGR1dXMlAxZU4xT2F5?=
 =?utf-8?B?S2FMakR5cVBqOXR1aDc5SDJxemVSYWJqbC96eEQwblU1SnhyNzg0ZGpwSVZN?=
 =?utf-8?B?K0gvTU9FNlJYUVJCT3Ntd1BpQ3MwRlQ2THk3U2hVL3p4c0t4N3JEYTBtWUNX?=
 =?utf-8?B?VE9TTStXU2JJY3RqbWx3RVVjTVExc2lleHVrQ08xSW9qRk9KSFV1R2NtVnZE?=
 =?utf-8?B?YWRVV2tmYU9BbzVFZEYzMXZjL050S0o5QzhJUEdmUC9DN21DTEFqYkJEeEox?=
 =?utf-8?B?Y0FQWFpjRnZwVS94dHh6T21NajF5eU9SeHpWYWhwVDdaSExacEw3YjIzTFdF?=
 =?utf-8?B?Q3NrRzZQd3hsMUlYZEFvdnlmY0gzWVRDT21xNmhNUU5YT25aYU50RDdqdFZh?=
 =?utf-8?B?bWtMbzhLWFJYNlM1ejR1YXRac1BPWUtVTU8vcTBaNHFsalhUVFBxdXJLNXhD?=
 =?utf-8?B?cFYvenlBZ1puYjVOOE5TQUdSSTUwZHVva2ptUUdBOFl4T1M3R2srZFM0aVNI?=
 =?utf-8?B?NVpreGN2YzY5UUdDamJvOEMrSi9HVnVpWDMxNWtCWkEzNTZXVHdJNWp0NDBX?=
 =?utf-8?B?Y01jUVY0TU50emlKVndCY3RvM2g1dlgwcnhtU3E4dVVWTFgwWkdZZ2hxNUpw?=
 =?utf-8?B?UzNocVBhWVZwc3ROdEtOM1F2ZUlJYkIrVXkzb3drd2VwRlM3WndTN1RPczdK?=
 =?utf-8?B?SkVHa0tDZlpSbGxGTlZDMzhIcE9FK09hZkkybk5IUHFQMS9QVkZtNlJaTTdF?=
 =?utf-8?B?OUNYUGRQWjRrVlBsc01tdVlkLytXaTZFVGNuTGk0dzFNT1VSQVM5L3k2NkJL?=
 =?utf-8?B?ZGphUUQrYWt2R0llOHg5MmZCTlMyMVhoNm5ocDJMWWpWamhQSFFuVnVMd2Yy?=
 =?utf-8?B?bFBUZnpUWUdHcGV3WWZKUFdTYzRZcVVaZ2I1RGVlenVxN2taMHZmUGF0Ri93?=
 =?utf-8?B?ODZhNHp5Wml1VFRpYkgycHY1cnVVWko5Q002SVhabGhVcys4cWdrNlAxVXRu?=
 =?utf-8?B?Tld3S285WExkSmt6dzdiZm9sT2kwWC9IWWdGanUwdlZEd0pJUEdQY0VuL0p4?=
 =?utf-8?B?YjBaa1dxbVNzRXBoTEZydi9jdlhNdE1DMlR0eHIzYnBSR2IveEEyV1p6RU1v?=
 =?utf-8?B?OUJQTTdYK1hSbnIwZFZpb3gzSTQ5TUpLUy9kb0JVZjJtYmtGY3hvdnRBQzdG?=
 =?utf-8?B?dUVNeHFxdHdoaTY4MUV3K3ROUDhRTHFFc3EvZFhDclJyOWk3K3pkOFdDc2s1?=
 =?utf-8?B?RUhtYVUrY1luUksrSkRVeXpGcjNyMU9LOWF2cFRXMDY4T2ZEZ3IzU2tuN3hU?=
 =?utf-8?B?bk5BMHVUUERnVkRQYTNaUXdoVlJCMnF1US9zOGY0VVFCNEE0VjNxUEtReTQz?=
 =?utf-8?B?RWthUXdsenRnd2liUWs2NU9PWEhmL3NqdUpLdklhcGpTVmFhWk5POFFSZEdY?=
 =?utf-8?B?V01Ta1laZVM4UTVPbEhyYi9JOG01TndUckg2ZWxNM2J1OHdrWHlFS09aTzlO?=
 =?utf-8?B?UUhUYXRwd0doWHRNdFhKd0tWdkJNckdCVXRKc2JYSGhKc2MwYUgvcGxGMGU5?=
 =?utf-8?B?U2ZPTFRxQlJiUWVGeklScTR4SkF0UTZzSEdyN3E0UmhzZEpJRExjUzlVbmhm?=
 =?utf-8?B?WGR4UFZ0NFg0TnpWVnFrRzJVbzZGMVE1VnRCMGFCTmt0cVhlTU1sa3FCWXZp?=
 =?utf-8?B?YkE4bXlxZ25LSnhLb24vQ3djQ3VYeWVqTnc4SEY0RytSbXBhT1RzbkNBTlhm?=
 =?utf-8?B?NEFZZHdYYThBOGRiQ2loQ2M2Z1k4bG5McmxQTTNpcnNUOTk3UURicjFPVHVE?=
 =?utf-8?B?aUE9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: d14f9939-ac24-49b5-0c70-08dce9caa439
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Oct 2024 07:59:32.7198
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: i20Z4/36Lgttf1jh4KxaZTE8AaMHUGR1xSkL3p3zL+GNe4L1N3q06xJvhGrh4yWgpgzVduF1IQ3E8BYt+d6WOfCWWESmjW9cTmT6MHMQ+Wo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9577

SGkgR2VlcnQsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VlcnQg
VXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4gU2VudDogRnJpZGF5LCBPY3Rv
YmVyIDExLCAyMDI0IDg6NDggQU0NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2Ml0gYXJtNjQ6IGR0
czogcmVuZXNhczogcjlhMDlnMDU3OiBBZGQgT1BQIHRhYmxlDQo+IA0KPiBIaSBCaWp1LA0KPiAN
Cj4gT24gRnJpLCBPY3QgMTEsIDIwMjQgYXQgOTo0M+KAr0FNIEJpanUgRGFzIDxiaWp1LmRhcy5q
ekBicC5yZW5lc2FzLmNvbT4gd3JvdGU6DQo+ID4gPiBGcm9tOiBHZWVydCBVeXR0ZXJob2V2ZW4g
PGdlZXJ0QGxpbnV4LW02OGsub3JnPiBPbiBXZWQsIE9jdCA5LCAyMDI0DQo+ID4gPiBhdCAxMTo0
MeKAr0FNIEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4gd3JvdGU6DQo+ID4g
PiA+ID4gRnJvbTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4gT24g
VHVlLCBPY3QgOCwNCj4gPiA+ID4gPiAyMDI0IGF0IDEwOjEw4oCvUE0gTGFkLCBQcmFiaGFrYXIg
PHByYWJoYWthci5jc2VuZ2dAZ21haWwuY29tPiB3cm90ZToNCj4gPiA+ID4gPiA+IE9uIFR1ZSwg
T2N0IDgsIDIwMjQgYXQgNjozM+KAr1BNIEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2Fz
LmNvbT4gd3JvdGU6DQo+ID4gPiA+ID4gPiA+ID4gRnJvbTogQmlqdSBEYXMgPGJpanUuZGFzLmp6
QGJwLnJlbmVzYXMuY29tPg0KPiA+ID4gPiA+ID4gPiA+ID4gRnJvbTogUHJhYmhha2FyIDxwcmFi
aGFrYXIuY3NlbmdnQGdtYWlsLmNvbT4NCj4gPiA+ID4gPiA+ID4gPiA+IEZyb206IExhZCBQcmFi
aGFrYXINCj4gPiA+ID4gPiA+ID4gPiA+IDxwcmFiaGFrYXIubWFoYWRldi1sYWQucmpAYnAucmVu
ZXNhcy5jb20+DQo+ID4gPiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiA+ID4gQWRkIE9QUCB0
YWJsZSBmb3IgUlovVjJIKFApIFNvQy4NCj4gPiA+ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+
ID4gPiBTaWduZWQtb2ZmLWJ5OiBMYWQgUHJhYmhha2FyDQo+ID4gPiA+ID4gPiA+ID4gPiA8cHJh
Ymhha2FyLm1haGFkZXYtbGFkLnJqQGJwLnJlbmVzYXMuY29tPg0KPiA+ID4gPiA+ID4gPiA+ID4g
LS0tDQo+ID4gPiA+ID4gPiA+ID4gPiB2MS0+djINCj4gPiA+ID4gPiA+ID4gPiA+IC0gU2V0IG9w
cC1taWNyb3ZvbHQgdG8gODAwMDAwIGZvciBmcmVxdWVuY2llcyBiZWxvdw0KPiA+ID4gPiA+ID4g
PiA+ID4gMS4xR0h6DQo+ID4gPiA+ID4gPiA+ID4gPiAtLS0NCj4gPiA+ID4gPiA+ID4gPiA+ICBh
cmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjlhMDlnMDU3LmR0c2kgfCA0MQ0KPiA+ID4gPiA+
ID4gPiA+ID4gKysrKysrKysrKysrKysrKysrKysrKw0KPiA+ID4gPiA+ID4gPiA+ID4gIDEgZmls
ZSBjaGFuZ2VkLCA0MSBpbnNlcnRpb25zKCspDQo+ID4gPiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+
ID4gPiA+ID4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOWEwOWcw
NTcuZHRzaQ0KPiA+ID4gPiA+ID4gPiA+ID4gYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMv
cjlhMDlnMDU3LmR0c2kNCj4gPiA+ID4gPiA+ID4gPiA+IGluZGV4IDFhZDVhMWI2OTE3Zi4uNGJi
ZTc1YjgxZjU0IDEwMDY0NA0KPiA+ID4gPiA+ID4gPiA+ID4gLS0tIGEvYXJjaC9hcm02NC9ib290
L2R0cy9yZW5lc2FzL3I5YTA5ZzA1Ny5kdHNpDQo+ID4gPiA+ID4gPiA+ID4gPiArKysgYi9hcmNo
L2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjlhMDlnMDU3LmR0c2kNCj4gPiA+ID4gPiA+ID4gPiA+
IEBAIC0yMCw2ICsyMCwzOSBAQCBhdWRpb19leHRhbF9jbGs6IGF1ZGlvLWNsayB7DQo+ID4gPiA+
ID4gPiA+ID4gPiAgICAgICAgICAgICBjbG9jay1mcmVxdWVuY3kgPSA8MD47DQo+ID4gPiA+ID4g
PiA+ID4gPiAgICAgfTsNCj4gPiA+ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+ID4gPiArICAg
LyoNCj4gPiA+ID4gPiA+ID4gPiA+ICsgICAgKiBUaGUgZGVmYXVsdCBjbHVzdGVyIHRhYmxlIGlz
IGJhc2VkIG9uIHRoZSBhc3N1bXB0aW9uIHRoYXQgdGhlIFBMTENBNTUgY2xvY2sNCj4gPiA+ID4g
PiA+ID4gPiA+ICsgICAgKiBmcmVxdWVuY3kgaXMgc2V0IHRvIDEuN0dIei4gVGhlIFBMTENBNTUg
Y2xvY2sgZnJlcXVlbmN5IGNhbiBiZSBzZXQgdG8NCj4gPiA+ID4gPiA+ID4gPiA+ICsgICAgKiAx
LjcvMS42LzEuNS8xLjEgR0h6IGJhc2VkIG9uIHRoZSBCT09UUExMQ0FfMC8xIHBpbnMgKGFuZCBh
ZGRpdGlvbmFsbHkgY2FuIGJlDQo+ID4gPiA+ID4gPiA+ID4gPiArICAgICogY2xvY2tlZCB0byAx
LjhHSHogYXMgd2VsbCkuIFRoZSB0YWJsZSBiZWxvdyBzaG91bGQgYmUgb3ZlcnJpZGRlbiBpbiB0
aGUgYm9hcmQNCj4gPiA+ID4gPiA+ID4gPiA+ICsgICAgKiBEVFMgYmFzZWQgb24gdGhlIFBMTENB
NTUgY2xvY2sgZnJlcXVlbmN5Lg0KPiA+ID4gPiA+ID4gPiA+ID4gKyAgICAqLw0KPiA+ID4gPiA+
ID4gPiA+ID4gKyAgIGNsdXN0ZXIwX29wcDogb3BwLXRhYmxlLTAgew0KPiA+ID4gPiA+ID4gPiA+
ID4gKyAgICAgICAgICAgY29tcGF0aWJsZSA9ICJvcGVyYXRpbmctcG9pbnRzLXYyIjsNCj4gPiA+
ID4gPiA+ID4gPiA+ICsNCj4gPiA+ID4gPiA+ID4gPiA+ICsgICAgICAgICAgIG9wcC0xNzAwMDAw
MDAwIHsNCj4gPiA+ID4gPiA+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgb3BwLWh6ID0gL2Jp
dHMvIDY0IDwxNzAwMDAwMDAwPjsNCj4gPiA+ID4gPiA+ID4gPiA+ICsgICAgICAgICAgICAgICAg
ICAgb3BwLW1pY3Jvdm9sdCA9IDw5MDAwMDA+Ow0KPiA+ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4g
PiA+ID4gTm90IHN1cmUgQ0EtNTUgY2FuIGNoYW5nZSB2b2x0YWdlIGZyb20gODAwbVYgdG8gOTAw
bVY/Pw0KPiA+ID4gPiA+ID4gPiA+IEJhc2VkIG9uIFBvd2VyIERvbWFpbiBDb250cm9sLCBpdCBu
ZWVkcyB0byBiZSBpbiBBV08gbW9kZSBmb3IgY2hhbmdpbmcgdGhlIFBEX0NBNTUNCj4gdm9sdGFn
ZS4NCj4gPiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiA+IFRoZSBtYW51YWwgc2F5cyBPRCB2
b2x0YWdlIGlzIDAuOVYgYW5kIE5EIHZvbHRhZ2UgaXMgMC44Vi4NCj4gPiA+ID4gPiA+ID4gPg0K
PiA+ID4gPiA+ID4gPiA+IElzIDEuN0dIWiBpcyBORCBvciBPRD8NCj4gPiA+ID4gPiA+ID4NCj4g
PiA+ID4gPiA+ID4gezEuNywxLjYsMS41IEdIen0gaXMgZW5hYmxlZCB3aGVuIFZERDA5X0NBNTUg
aXMgYXQgMC45IFYgYW5kDQo+ID4gPiA+ID4gPiA+IGZvcg0KPiA+ID4gPiA+ID4gPiAxLjEgR0h6
IGl0IGlzIDAuOFYuDQo+ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+IE1heWJlIHdoZW4geW91
IGRvIC8yLCAvNCwgLzggdXNpbmcgZGl2aWRlcnMsIHRoZSB2b2x0YWdlIG1heQ0KPiA+ID4gPiA+
ID4gPiBiZSBzdGlsbCB0aGUgc2FtZT8/DQo+ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiBJIHRo
aW5rIHlvdSBhcmUgcmlnaHQgd2hlbiBCT09UUExMQ0FbMTowXSBwaW5zIGFyZSBzZXQgdG8NCj4g
PiA+ID4gPiA+IDEuN0dIeiB0aGUNCj4gPiA+ID4gPiA+IFZERDA5X0NBNTUgaXMgYXQgMC45IFYs
IGZ1cnRoZXIgZGl2aWRpbmcgdGhlIGNsb2NrIHNob3VsZG50DQo+ID4gPiA+ID4gPiBhZmZlY3Qg
dGhlIHZvbHRhZ2UgbGV2ZWxzIGF0IHRoZSBQTUlDIG91dHB1dC4NCj4gPiA+ID4gPiA+DQo+ID4g
PiA+ID4gPiBHZWVydCwgcGxlYXNlIGxldCBtZSBrbm93IGlmIG15IHVuZGVyc3RhbmRpbmcgaXMg
aW5jb3JyZWN0Lg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gVGhlIGFjdHVhbCBWREQwOV9DQTU1IHZv
bHRhZ2UgaXMgY29udHJvbGxlZCBieSB0aGUgZXh0ZXJuYWwgUE1JQw0KPiA+ID4gPiA+IChSQUEy
MTUzMDApLiAgSXQgaXMgdGhlIHJlc3BvbnNpYmlsaXR5IG9mIHRoZSBzeXN0ZW0gZGVzaWduZXIg
dG8NCj4gPiA+ID4gPiBtYWtlIHN1cmUgVkREMDlfQ0E1NSBpcyBhdCAwLjlWIHdoZW4gQk9PVFBM
TENBWzE6MF0gaXMgc3RyYXBwZWQNCj4gPiA+ID4gPiBmb3IgT0QsIGFzIENQVSBjb3JlIGNsb2Nr
IHJhdGVzDQo+ID4gPiBoaWdoZXIgdGhhbiAxLjEgR0h6IG5lZWQgYSBoaWdoZXIgY29yZSB2b2x0
YWdlLg0KPiA+ID4gPiA+IEkgZG9uJ3QgdGhpbmsgaXQgaHVydHMgdG8gc3VwcGx5IHRoZSBoaWdo
ZXIgY29yZSB2b2x0YWdlIHdoaWxlDQo+ID4gPiA+ID4gcnVubmluZyB0aGUgQ1BVIGNvcmUgYXQg
bG93IGNvcmUgZnJlcXVlbmNpZXMsIGV4Y2VwdCBmb3IgZXh0cmEgcG93ZXIgY29uc3VtcHRpb24u
DQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBUbyBjb250cm9sIFZERDA5X0NBNTUgZHluYW1pY2FsbHks
IHRoZSBDUFUgY29yZXMgc2hvdWxkIGhhdmUNCj4gPiA+ID4gPiBjcHUtc3VwcGx5IHByb3BlcnRp
ZXMgcG9pbnRpbmcgdG8gdGhlIHJlZ3VsYXRvciBjb250cm9sbGluZyBpdCAocmFhMjE1MzAwKS4N
Cj4gPiA+ID4NCj4gPiA+ID4gVGhpcyBuZWVkcyBhIGJpZyB3b3JrKHNlZTogNC41LjMuMS4zIFBE
X0NBNTUgYXJlYSB2b2x0YWdlIGNoYW5nZSkuDQo+ID4gPiA+IENBLTU1IG5lZWRzIHRvIHNpZ25h
bCBDTS0zMyBzbyB0aGF0IGl0IHN3aXRjaGVzIHRvIEFXTyBtb2RlKE9ubHkNCj4gPiA+ID4gQ00t
MzMgaXMgYWN0aXZlKSBhbmQgSW4gQVdPIG1vZGUsIENNMzMgaXMgaW4gY2hhcmdlIG9mIGNoYW5n
aW5nDQo+ID4gPiA+IENBNTUgdm9sdGFnZSBhbmQgdGhlbiBzd2l0Y2hlcyB0byBBTEwtT04gbW9k
ZQ0KPiA+ID4NCj4gPiA+IFVnaCwgdGhpcyBpcyBpbmRlZWQgbXVjaCBtb3JlIGNvbXBsaWNhdGVk
IHRoYW4gb24gb3RoZXIgU29Dcy4NCj4gPiA+IFNvIGJhc2ljYWxseSB5b3UgYXJlIHN0dWNrIHdp
dGggdGhlIGluaXRpYWwgdm9sdGFnZSBzZXR0aW5ncy4NCj4gPg0KPiA+IEZZSSwgSSBnb3QgY29u
ZmlybWF0aW9uIHRoYXQgMS43R0h6LDAuOVYgaXMgTm9ybWFsIGRyaXZlIGFuZCBJdCBpcyB0aGUN
Cj4gPiBkZWZhdWx0IGZvciBSWi9WMkggYW5kIHVwY29taW5nIFJaL0czRSBTb0NzLg0KPiANCj4g
T0ssIHNvIG5vICJ0dXJiby1tb2RlIiBwcm9wZXJ0eSBpcyBuZWVkZWQuDQoNCiJ0dXJiby1tb2Rl
IiBpcyAxLjhHSHogDQoNCiIxLjhHSHogY2Fubm90IGJlIHN1cHBvcnRlZCBieSBDQTU1IG9ubHkg
KENNMzMgaXMgcmVxdWlyZWQpIHNvIHVwc3RyZWFtIHRhcmdldCBpcyAxLjdHSHouIg0KDQpTbywg
d2l0aG91dCBDTS0zMywgdHVyYm8tbW9kZSBpcyBub3QgcG9zc2libGU/PyBXZSBhcmUgcmVjaGVj
a2luZyB0aGlzIGFuZA0Kd2lsbCBwcm92aWRlIGZlZWRiYWNrIG9uY2Ugd2UgZ2V0IGluZm8gZnJv
bSBIVyBwZW9wbGUuDQoNCg0KQ2hlZXJzLA0KQmlqdQ0K

