Return-Path: <linux-renesas-soc+bounces-15933-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1507A887C0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Apr 2025 17:50:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0A4537A776A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Apr 2025 15:49:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BA1327E1A7;
	Mon, 14 Apr 2025 15:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="TZCgbf5L"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010065.outbound.protection.outlook.com [52.101.228.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93A5227587A;
	Mon, 14 Apr 2025 15:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744645848; cv=fail; b=D6rtshHp7Dn8zMgEAnTFBXwpB1u5WJ/MBgVOrtBiJq5IpIhpvTY49TzKVP8LP4hntroulTa3NIZDArDqb5kSkHnO0ebMoM6aeLXlTOslj8Pqqyi5XVgXA3cUFxX2jOc7O9PLRzgWLgk/+Dx0BNIL5buFOIkV61/COQw2cLq9vcE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744645848; c=relaxed/simple;
	bh=LWojV6ZQpkLd8TFjwAXgQRLYx3bMzp5PbkWkwrecWoA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=fMcCrAUJzJa1cn53JquZZYjjyLuFmwPSlUShkpPqUkItacJdGwnD4qYwmI20p45Bxz8LZSCl8CRmP4cICEKbCdKBL2vk8nS2v+4nGIgD471j4PyLygCfxf1bZVs29WdVd0ewfIihthnozjiX1mwBAj2nIb2YI2mBpoWIU2QUPDo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=TZCgbf5L; arc=fail smtp.client-ip=52.101.228.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=buioMkuCSpKxlVqpfKdQqRFVFA4iGzies/F4hYb2sEErNqWcj1Z1VnOpb2U1BBKecJ3ZlUfQHqwXZB8OTx2GObj7tH7bTQrHblBPROLj/320o4s1oeniOR0DtlKDzBMs7+0McRGrcr98d5kGyw4ciei7Tfnv7VTCg9iaw0bu4xFV8Pw4bNjVq5kVBtjHVafbb5esXArZgvFb+m+z9IWgrwZDtutZyPhhEdy2QZcrvdgVjWhDoFeJKU7BzNX+qBzrG/eEpQ23YHTPvr0ZbxZLT4gh3FCBmH6VcUcemG5tUUT20LLXIhgIc5WSP4ICpRDTPbQNNQynM/TFT+t2mMfZYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LWojV6ZQpkLd8TFjwAXgQRLYx3bMzp5PbkWkwrecWoA=;
 b=HVOC62X1pXij39bwACRfRXzfH1bwh/RpaiX7Kr5q65xLcNdUFIQ7hJlker1T826/e04V7V7nmkAxzFiBIF0GWR6cn4oQAJdzGExpu7X7e8i+OYw7uXJnfSNjMbab7eV0PRFhJROZj5Fiq/0/3rFyGDbOGznl4kJcxXEoHxifHzrXjoXD1a30nkGUDv8L1uhBipewGX6ZP0CGEnkVCDl9AXYPM5BWneoi5aeab3iEYVE+ZFOpcpXj99Nd9zSy/1bnio7QtFDYftGHKUFkh1fpYFulBqIOZeAjMqqbW2N8pv5YGeUk1HsDOVFCis9lEtgibGot61q/gnJdgmrojWLfrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LWojV6ZQpkLd8TFjwAXgQRLYx3bMzp5PbkWkwrecWoA=;
 b=TZCgbf5LPDH4Y2MXAGLRoPxJf9cT0OySEb/eK0oKIBIUZ649WG+fnVriViaHFFC4kZSUKlPvt0EgOrlrqA4CT8oNLRn6O1BifC6iA/mkDod7fX8IrS6U/e2V6CgrIdtt299slmi5C+nlnL7pJS6Hxd4lzg/oR+dZoJAH7C2jM38=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYYPR01MB15270.jpnprd01.prod.outlook.com (2603:1096:405:27c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Mon, 14 Apr
 2025 15:50:37 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 15:50:37 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Prabhakar Mahadev
 Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH v2 2/3] arm64: dts: renesas: r9a09g047e57-smarc: Enable
 CANFD
Thread-Topic: [PATCH v2 2/3] arm64: dts: renesas: r9a09g047e57-smarc: Enable
 CANFD
Thread-Index: AQHbmbbxy9rzBEdWpk2jTCL2tJSV7rOjczAAgAAAXGA=
Date: Mon, 14 Apr 2025 15:50:37 +0000
Message-ID:
 <TY3PR01MB11346958A838B887BB07FBC6786B32@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250320164121.193857-1-biju.das.jz@bp.renesas.com>
 <20250320164121.193857-3-biju.das.jz@bp.renesas.com>
 <CAMuHMdVVAqP30iK25tnOyy+pLBusKQn-agvSAw-Xuy9Vds1Nmg@mail.gmail.com>
In-Reply-To:
 <CAMuHMdVVAqP30iK25tnOyy+pLBusKQn-agvSAw-Xuy9Vds1Nmg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYYPR01MB15270:EE_
x-ms-office365-filtering-correlation-id: e17d906c-a278-4c44-9147-08dd7b6c19c1
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?VUZSdkVCWXhZdlRPK29EM3JiMU9DbUNzSWpkLytMTGtTWnNPTHRoM2sxekZE?=
 =?utf-8?B?WlRyYjF6MTVBaG1SVFdoc21ENmpla3V0NTZiU1JxMXJhZXRqZ1BpWU9yT2p3?=
 =?utf-8?B?WXYxK0RrTWRKSC9DRG1nRTQwQ0lUTmQ3bkhxUnVFeVIyS2xlQzRwNER6L0kr?=
 =?utf-8?B?NkVHVG10MzE5NTNkR3ZDZVVIdFBaTGNvaDFqQTNzN3l6K2pydHhidmh6U2dN?=
 =?utf-8?B?TVo2MUFsQkZWeHhPRE5pYngxUE4zU041UGszRWxNUlBBZVdra1V5U2NtRXVJ?=
 =?utf-8?B?NlVrRE1aZEtUT3NYblNlT0QwM1RqY2IzM1pCclRzenorak9xTHFrTXkxRFhI?=
 =?utf-8?B?MFRWVG9uS1l5QkRtZE90NUFXSlhucUpBV0E4Nkh1QmorSEJqUUQ1cHNRc3VM?=
 =?utf-8?B?bzg1NXBNWDBQdEFFZlE2SXowRDJsb040VHpOSitWeENHRjN0NUtZZnA4Q1Rv?=
 =?utf-8?B?N0MrOERGWis5SVZ5R2hmRTVDVHhTR2lmYVdlSDN5bCtqdkIwcVk1MHJoNzRQ?=
 =?utf-8?B?c1NtZVg2RzBBMFFYK085MUtta3JCeEJiS09qTk14MmFqbnFTTVd2WE5QZU5u?=
 =?utf-8?B?dzY0TzN1cVFLVllVOFdqanN6T0oyWExLcDBRaUh5SVEyRW1aSFlMRmpUM1h5?=
 =?utf-8?B?RGw5Sit6b3F1MG13STRZSE1panNDU0xmS1JBajZkSWZ4Q2h0aGc4SDgwWW5i?=
 =?utf-8?B?cERNSERDWkVBOGZjTjdqeTNPT1pXbGEwRGZDSlFtdmJ5SGxTRFlUMHUweERU?=
 =?utf-8?B?ZFhQaFkyQ3RrejRHTW9yaGxhSW53TnFuYzRVTjJOQ1VxUk1sOUdhTVZQKzNC?=
 =?utf-8?B?VjdpMVlkM21tZGhMSE9CRTAzU3habHhNTnpCOTRvb1Vna1JnTE1pMkJlYTVF?=
 =?utf-8?B?QTlqZEkzYmJtaG5LOU5yVXJ5N3RieUhaL0VmWmVoc1FYTWZwN0NzdnBCREg4?=
 =?utf-8?B?Z0NkQVlrTUJmY0N4N1FoK0RSdlJZTU1hbDRRVFlpVlE1UytXVE40Mzdod0xt?=
 =?utf-8?B?UEVMOFN3Tmp0YnhMcFhZZm4xMkRwVkluc2VnWVRHYTJTa0xOTzVSSnA5M2tt?=
 =?utf-8?B?NFVSK2tsZStwaS8yWnNEZWkwcEFaYUdoV1c3Wkt3L1VYOElXdjByYzRCK3pz?=
 =?utf-8?B?UndBNU12ZW1kTEw3ZERyWk1hZlVmMVRIdFp5UzA4WDZJdEVyOVBOZyt1UUhx?=
 =?utf-8?B?dVcycWNyYVA4eGRoTVB3ZGpDd0NsSzYwWVVoSFNnK0tjVGV3K0R0WDdIaVVF?=
 =?utf-8?B?d2ZnQXZkUXdvQ1F0Y0NrMW53QzB5RWttSm1FMHBzUHM1TXBlT0Y5S090N0cv?=
 =?utf-8?B?c2JXdndVR3BlOTY0ci8rUHNNcFZ2MjZJRnNaSjEyaFJwckpZYW1hYzVhN2Fu?=
 =?utf-8?B?QVRvZHBteDVKK0lJSWdMOE5RaElTZHVYUHpvMlpLUWpiOVg3RGRMeXZrdzJr?=
 =?utf-8?B?b2h5cDl0d1NxMUltNFZ1ZWd4cEJoQ2NuZjhQK0M3UFVBaUovUkl4SE9UVlJO?=
 =?utf-8?B?SURjSXVKd2I4eWdra3g1RzZlSW5lc1hHUUdXSjltM1N0QTlIRXhUTEFueDVG?=
 =?utf-8?B?Z3VaRG13SmtpNGVlSU9aL0JpSUhLOWkxMjBVK0dFQlFvK0R3UVFaemxUd05N?=
 =?utf-8?B?TXlvOHYxdXpvQkRhZDl5UFVMbEhoZzJmbGJuMFp6QW0xV0hSZFZpa1o3dWxv?=
 =?utf-8?B?bVpyT2xNUk1GQXQ1YWF3aFg2blhoZWNtR2Izbjl5VldBLy9IelpuYjZlWFdP?=
 =?utf-8?B?Q2tkb2JuMk9oOHp2aDdiOERpVDZBc2F5ZnozQTZ3Q213bWYvM0wyTjJpZmxD?=
 =?utf-8?B?Zm92VjFaV01lYzI1dzNYb20ycnJIRGRhUGNKdGthSDltRHY1cjlKVUY1Zzg5?=
 =?utf-8?B?OWJ0TGdvQXR6Y2pIczZnWG5paGtTUTh1Y21vUURSNzlHOXNEaERRejNuemJk?=
 =?utf-8?B?Y0RlUVpqUHNEVks1ekh1RzdSbklxMjBvbldwUDZqRXpuV3VWTUJFY2FIQnFZ?=
 =?utf-8?B?QlY5TS9MRkJRPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?djU2YXM2TjZISnlYNmxHbTBnNjZhTk55NVF5eDdlajZqQ0VublNvamowUjBU?=
 =?utf-8?B?SkZ6WUJ1cjhUMFlQTC8vc1BwYTJJWVpDZmM0RjNYbWlqWkRhN2d3VHhhUXhD?=
 =?utf-8?B?WmpvMUVxREdBSlFRSVNqSGNkeGpYcFZxMFk4blJpSDU3MUlQa1c2MTh2VGpG?=
 =?utf-8?B?Sk9CWVVRS1RBZVBUOXZjNXI4UFp5cWtzek1MdW93ai90UUpRbDl2MnVJWE1K?=
 =?utf-8?B?RFVDeDJVZmF1eWcwYURDTDcrS0JTM2VkVE9hL2xkYXBGb2VkYlV1N2ZTeGNP?=
 =?utf-8?B?UEVKZGNEcmZzdFZLbUt6cEIrRDR3L2dIMGNyZkUweURoSkNLck1OelVMS1Uv?=
 =?utf-8?B?ZGlIbWVZbk8xamNmTVBzUmNmeStkSzUrck5RTlhYTmJGbEd6R0tMbkNCZXpH?=
 =?utf-8?B?VGRXMjVSalhOVlZHZktCNmQ1OHkxanhYSGNHOGg1QzA1N2tqUGJaaTZGVVZz?=
 =?utf-8?B?Z3JJdTNnNFR2cDY1cUd0d1dHOURFWDZKWFVRV0plOFZuNlZpUWRqRUphWE1V?=
 =?utf-8?B?NUl4VGVxcW9kYVJMYnU3V0dBTGQ1Znh2Z2g1TWdETEtZYUJYWnFwWHFqbUkv?=
 =?utf-8?B?Y29JVDZGYXdWNTFXdVpQNHFSUHNOMnpNYUdLVmdhNWJjbzNTYmdhV2tGTDYx?=
 =?utf-8?B?aVBSZU1TWk8vL3grY0NmUUlWTVhzRUJMOHlmeFBoZi9GdXFMU0tnQzcyVThJ?=
 =?utf-8?B?U0NWQys5S3gzVTBHZ2tab0N0NVhrSlBjblNoZklTUVA0OTNYRExJTGpUY29Z?=
 =?utf-8?B?WVh2MzBJSGV4ZEJVSDNUNEovcTFQQTc5R1JBYWtGOWNJNjVMYStic1JWdWF6?=
 =?utf-8?B?VDMwZ0Q2RVhRLzFTNWErVnF3SmY3Z0wxSkw4bjVZYUNtOFRIYndxK2U0Wjhl?=
 =?utf-8?B?N1lwb2RxSEVqK2JZZlBzNHpodDlDYjRLdnZrSjUya2ZxL3htTWJ6SE9mWUhV?=
 =?utf-8?B?NmRBeVpuZXMvZlBFUUJsVHdRQ3NyN0VLeXFkU3BTckYrOGxNTGN5ZEhoWmcy?=
 =?utf-8?B?TjZtK1FuRWIwbzlYd1ZQRUlnNlNZUUY1SEczS3pJKy9XMEhTMHlHZElGWXBn?=
 =?utf-8?B?eEcwWG03TWhwQ1Bpb3dxRWJEUlZIRDRia1lVemt3Qk1ERFdMUG1NSHpsREgy?=
 =?utf-8?B?NXdIY1g1QlUwOTFvTS9QYWcvb1BETG45cUV0YVdKS1RwWTFSbGhDWlB5WHpv?=
 =?utf-8?B?S1RMeHBDNUQ3UFBWcTN4bGl0VkxHN3ppZCs5dTEwczNCYXd1R1QrbEwvNThS?=
 =?utf-8?B?aU1NaUdrNjlPN1FwR0ovU01mc3gyN3NMZDJPWmJ0VGpnODR0djFPaDU1UHNy?=
 =?utf-8?B?N0xnQWNVZkZER3JNMk10S3NQSFllOGJ0eFBtbzRWc1VnR2tTNUlzSVZQOGNn?=
 =?utf-8?B?dDV6RjExdndXY05ZNWxMMEFiWTlPTkNpVWNUeVNVd0MwTjBZUkFlRlNwNjNC?=
 =?utf-8?B?Y3BPeFYzUHpuMEEzcmRNNGh5SG1iWGRVYUkzbm1EUlBGcFJYdFV4R0FuTEhu?=
 =?utf-8?B?RWZ1RzMxaE5JdlRZaG4xd0IwSnAvYmI3ZmNqcnMxV0dpL28xWEV4R2tPNzMw?=
 =?utf-8?B?dW9pSWhYRSt1Y3pWTWxZTFpWL0JUdHVqWVZVcjIrSnkyUWt3WXRjeS96T3Jt?=
 =?utf-8?B?MnlzUklDYWtjNTNRenZlcldaNEdVOEV2Wnhya0h2TFlXMklSSFloWlNnQUNm?=
 =?utf-8?B?clljek5FMFA0MDk3blJ5NTVwQXRmb2VGS0ZReTZWdnFzRVZ4Z1k3TFNrQnFw?=
 =?utf-8?B?aDJzTWNBWnovVlIzMi9xcHhPNGJqRjBNWWVjYWt4T29GV2RlKzU0ZFc1eWtk?=
 =?utf-8?B?TnhweDlvbG82SlE5V0gveC9IK3ZFd2pHUllRam5Pa2lhUWM3TW1ZNkc1QXBk?=
 =?utf-8?B?Wi9obTduTGdhcTZDb01KK2Y5VnZ5ZHVHMjFXdXlzalpzTUJmVlBCVGtQNG5x?=
 =?utf-8?B?YW5mYWVoeTNuTFdCdCtiVWpKdFdLZE9aK0x1bnpKQ3d2MmE4M3NpcGp1aVBC?=
 =?utf-8?B?ajMwbTA0Zis4SENlTTNMTDhuTFU4UDBsVlZzcVNHdkhjMGxtZER4RXUvWXQy?=
 =?utf-8?B?TTlwcWc1Wk0vc3pLMjFHNUJnY2NMeitZdm1xaE44MEdsc09VOWl5Uy9pTVpV?=
 =?utf-8?B?QW1YVkJSQjJDc09VTGtGNlZOamEzcEliRDdCNkIwSDI3L05JNUprK0tKMENI?=
 =?utf-8?B?V2c9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: e17d906c-a278-4c44-9147-08dd7b6c19c1
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2025 15:50:37.5092
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: paXE5FVzJy6BmA+z04+Smt9yQCmKF/0XtuihuY7jPi84CTRR+1nVbYJ0hd+k+PW9XBa75+LGEvHzY9TM27NbmkX0EmUZV1PQfJmp2hgGkKg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB15270

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IDE0IEFwcmlsIDIwMjUgMTY6MzkNCj4gU3ViamVjdDogUmU6IFtQQVRD
SCB2MiAyLzNdIGFybTY0OiBkdHM6IHJlbmVzYXM6IHI5YTA5ZzA0N2U1Ny1zbWFyYzogRW5hYmxl
IENBTkZEDQo+IA0KPiBIaSBCaWp1LA0KPiANCj4gT24gVGh1LCAyMCBNYXIgMjAyNSBhdCAxNzo0
MSwgQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPiB3cm90ZToNCj4gPiBFbmFi
bGUgQ0FORkQgb24gdGhlIFJaL0czRSBTTUFSQyBFVksgcGxhdGZvcm0uDQo+ID4NCj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4gLS0t
DQo+ID4gdjEtPnYyOg0KPiA+ICAqIFNwbGl0IHRoZSBwYXRjaCBpbnRvIHR3by4NCj4gPiAgKiBF
bmFibGluZyBDQU5GRCBkb25lIGluIHRoaXMgcGF0Y2ggYW5kIENBTiBUcmFuc2NlaXZlciBvbiBu
ZXh0IHBhdGNoLg0KPiA+ICAqIERlZmluZWQgdGhlIG1hY3JvcyBTV19MQ0RfRU4gYW5kIFNXX1BE
TV9FTiAgd2hpY2ggcm91dGVzIHNpZ25hbHMgdG8NCj4gPiAgICBDQU4wIGFuZCBDQU4xIGJhc2Vk
IG9uIFNZUy41IGFuZCBCT09ULjYgc3dpdGNoZXMuDQo+IA0KPiBUaGFua3MgZm9yIHRoZSB1cGRh
dGUhDQo+IA0KPiA+IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOWEwOWcwNDdl
NTctc21hcmMuZHRzDQo+ID4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I5YTA5
ZzA0N2U1Ny1zbWFyYy5kdHMNCj4gPiBAQCAtOCw2ICs4LDggQEANCj4gPiAgL2R0cy12MS87DQo+
ID4NCj4gPiAgLyogU3dpdGNoIHNlbGVjdGlvbiBzZXR0aW5ncyAqLw0KPiA+ICsjZGVmaW5lIFNX
X0xDRF9FTiAgICAgICAgICAgICAgMA0KPiA+ICsjZGVmaW5lIFNXX1BETV9FTiAgICAgICAgICAg
ICAgMA0KPiA+ICAjZGVmaW5lIFNXX1NEMF9ERVZfU0VMICAgICAgICAgMA0KPiA+ICAjZGVmaW5l
IFNXX1NESU9fTTJFICAgICAgICAgICAgMA0KPiA+DQo+ID4gQEAgLTMzLDcgKzM1LDM2IEBAIHZx
bW1jX3NkMV9wdmRkOiByZWd1bGF0b3ItdnFtbWMtc2QxLXB2ZGQgew0KPiA+ICAgICAgICAgfTsN
Cj4gPiAgfTsNCj4gPg0KPiA+ICsmY2FuZmQgew0KPiA+ICsgICAgICAgcGluY3RybC0wID0gPCZj
YW5mZF9waW5zPjsNCj4gPiArICAgICAgIHBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7DQo+ID4g
Kw0KPiA+ICsjaWYgKCFTV19QRE1fRU4pDQo+ID4gKyAgICAgICBjaGFubmVsMSB7DQo+ID4gKyAg
ICAgICAgICAgICAgIHN0YXR1cyA9ICJva2F5IjsNCj4gPiArICAgICAgIH07DQo+ID4gKyNlbmRp
Zg0KPiA+ICsNCj4gPiArI2lmICghU1dfTENEX0VOKQ0KPiA+ICsgICAgICAgY2hhbm5lbDQgew0K
PiA+ICsgICAgICAgICAgICAgICBzdGF0dXMgPSAib2theSI7DQo+ID4gKyAgICAgICB9Ow0KPiA+
ICsjZW5kaWYNCj4gPiArfTsNCj4gPiArDQo+ID4gICZwaW5jdHJsIHsNCj4gPiArICAgICAgIGNh
bmZkX3BpbnM6IGNhbmZkIHsNCj4gPiArICAgICAgICAgICAgICAgY2FuMV9waW5zOiBjYW4xIHsN
Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICBwaW5tdXggPSA8UlpHM0VfUE9SVF9QSU5NVVgo
TCwgMiwgMyk+LCAvKiBSWCAqLw0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IDxSWkczRV9QT1JUX1BJTk1VWChMLCAzLCAzKT47IC8qIFRYICovDQo+ID4gKyAgICAgICAgICAg
ICAgIH07DQo+ID4gKw0KPiA+ICsgICAgICAgICAgICAgICBjYW40X3BpbnM6IGNhbjQgew0KPiA+
ICsgICAgICAgICAgICAgICAgICAgICAgIHBpbm11eCA9IDxSWkczRV9QT1JUX1BJTk1VWCg1LCAy
LCAzKT4sIC8qIFJYICovDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPFJa
RzNFX1BPUlRfUElOTVVYKDUsIDMsIDMpPjsgLyogVFggKi8NCj4gPiArICAgICAgICAgICAgICAg
fTsNCj4gPiArICAgICAgIH07DQo+ID4gKw0KPiA+ICAgICAgICAgc2NpZl9waW5zOiBzY2lmIHsN
Cj4gPiAgICAgICAgICAgICAgICAgcGlucyA9ICJTQ0lGX1RYRCIsICJTQ0lGX1JYRCI7DQo+ID4g
ICAgICAgICAgICAgICAgIHJlbmVzYXMsb3V0cHV0LWltcGVkYW5jZSA9IDwxPjsgZGlmZiAtLWdp
dA0KPiA+IGEvYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3JlbmVzYXMtc21hcmMyLmR0c2kN
Cj4gPiBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yZW5lc2FzLXNtYXJjMi5kdHNpDQo+
ID4gaW5kZXggZmQ4MmRmOGFkYzFlLi4xZDNhODQ0MTc0YjMgMTAwNjQ0DQo+ID4gLS0tIGEvYXJj
aC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3JlbmVzYXMtc21hcmMyLmR0c2kNCj4gPiArKysgYi9h
cmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcmVuZXNhcy1zbWFyYzIuZHRzaQ0KPiA+IEBAIC0y
OSw2ICsyOSwxMCBAQCBhbGlhc2VzIHsNCj4gPiAgICAgICAgIH07DQo+ID4gIH07DQo+ID4NCj4g
PiArJmNhbmZkIHsNCj4gPiArICAgICAgIHN0YXR1cyA9ICJva2F5IjsNCj4gPiArfTsNCj4gDQo+
IEkgYW0gd29uZGVyaW5nIHdoeSB5b3Ugc3BsaXQgdGhpcyBpbiB0d28gcGF0Y2hlcz8NCj4gSSBi
ZWxpZXZlIENBTi1GRCBkb2VzIG5vdCB3b3JrIHdpdGhvdXQgYWRkaW5nIHRoZSBDQU4gdHJhbnNj
ZWl2ZXJzLCB3aGljaCBpcyBvbmx5IGRvbmUgaW4gdGhlIG5leHQNCj4gcGF0Y2g/DQoNClNUQiBw
aW4gaXMgYWN0aXZlIGhpZ2guIElmIHlvdSBzZWUgdGhlIHNjaGVtYXRpYyBHUElPOCBhbmQgR1BJ
TzkgYXJlIGNvbnRyb2xsZWQgdGhyb3VnaCBhIHN3aXRjaC4NCg0KQnkgZGVmYXVsdCwgdGhleSBh
cmUgc2V0IHRvIEdQSU84X1BNT0QgYW5kIEdQSU85X1BNT0QsIG1lYW5pbmcgU1RCIHBpbnMgYXJl
IHB1bGxlZCBEb3duLg0KU28sIHdpdGggQ0FOIHRyYW5zY2VpdmVyIGRyaXZlciBzdGlsbCB3ZSBj
YW4gdGVzdCBDQU5GRC4NCg0KSWYgd2UgdGhlIHN3aXRjaCBpcyBzZXQgdG8gR1BJT3s4LDl9X0NB
TnswLDF9X1NUQiB0aGVuIHdlIG5lZWQgQ0FOIHRyYW5zY2VpdmVyIGRyaXZlciB0bw0KQ29udHJv
bCBpdC4NCg0KDQpDaGVlcnMsDQpCaWp1DQoNCj4gDQo+ID4gKw0KPiA+ICAmc2NpZjAgew0KPiA+
ICAgICAgICAgc3RhdHVzID0gIm9rYXkiOw0KPiA+ICB9Ow0KPiANCj4gR3J7b2V0amUsZWV0aW5n
fXMsDQo+IA0KPiAgICAgICAgICAgICAgICAgICAgICAgICBHZWVydA0KPiANCj4gLS0NCj4gR2Vl
cnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBn
ZWVydEBsaW51eC1tNjhrLm9yZw0KPiANCj4gSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRo
IHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1dCB3aGVuIEknbSB0
YWxraW5nIHRvDQo+IGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0
aGluZyBsaWtlIHRoYXQuDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGlu
dXMgVG9ydmFsZHMNCg==

