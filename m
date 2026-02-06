Return-Path: <linux-renesas-soc+bounces-28005-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UCn0KPHqhWk0IQQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28005-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Feb 2026 14:21:53 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AB3FFFE064
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Feb 2026 14:21:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EB0B930060B4
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Feb 2026 13:21:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6B7A39525A;
	Fri,  6 Feb 2026 13:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="hJPHh81+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010035.outbound.protection.outlook.com [52.101.228.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCD8B2EAD10;
	Fri,  6 Feb 2026 13:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770384108; cv=fail; b=NDhX1FO0Bthq4G5HK3HTr3JFQCEkitx7r9rF68WNdrA0yne5EmcLUZ9Q7MY9RtP4XD/npKhrT71ml8Q9/BB6zhYmujnhSS0giotXcIp2+Gmpw7EndYe+eCbBvGhpF3epq3uZ0Kti0bLXqs8snviq4czFrkfU1anflk6lYYLIFqM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770384108; c=relaxed/simple;
	bh=Sm+FPDhSEXutXMr2ojsFS7YHbOJzwmqLrKK8eGQGTd8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=lvR3gp7JZmaPNbATfEYNViLufl2nFSkOd38tmbWfffKyDIqTaw3t10EAFxaub8583t3Q7Ku3ZiD/9b4896bcN2bfR8UQ/pbeh04UGAzOBSAK7o4STTJ3KJlePbqEX0/cceR4UwmaeP2h/SFRD6fl0rziTv43a9ZvOaZ8ZCkea2w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=hJPHh81+; arc=fail smtp.client-ip=52.101.228.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kR53wuNMQrB5EHUp0QXFeCaeFuEs0u45a9asEoFwxYf93HenNSuWR5FrMyNJxrCi/TNfyyd5ouu3GTPa4YgiTdwgvmKrMiAU5AJ0vOdmvFV8qJPwMV+holqs1hRtENPtXx7UIPzGzp/D/3Fu6zSdXUSFxQZgKjgVc7AGWrmsro0B4CuVFTV6+Y2yfc1VKB5kUkb6Q/qJ7W9EGRE9YLajs3tdwpaLHrqTeVtCiVRXFW3WExkg8J9dMaunBOGARtcH0Nte3+JgMto8civKoadYiYZT08xRCe9am20OsGXN/dmRupj1baDRtTuD+nD5R7LCManUo4qvu9DUc7z84zBc/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sm+FPDhSEXutXMr2ojsFS7YHbOJzwmqLrKK8eGQGTd8=;
 b=lMTbyRpiUayls741Kwdm6p9dTW+9f8OrSWXg6TXu4nAUx7AxwtXrOyJvRS/1tfghymzBKGFacxYSByQP4qsf5cngvfZPV+PFFkhIaGKxa2wS/3fgkhpPenIWg+X8m3Oc6RDNX9gRgZ+p/EM+HAncbp4/ptir9Ih7KiPTWlAzjZECVca3uozwW6ftBYbyAHBfbCHj5mm8dq7eK3+b6FGviF3U6PN1jupff8Gi1FNohnsHVPuGUvF3C0fRs0zLcNxRJ/rjiv1xe10BwdvBn45HvWtKRBLbNxJeWsk1hE9GQ4eP3zYDbyaKrk1zbOxNVMr0drj3g+QdUb5mpQJg3xHoiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sm+FPDhSEXutXMr2ojsFS7YHbOJzwmqLrKK8eGQGTd8=;
 b=hJPHh81+Lh9LM8l/aE3uYxoCE7lec6+cddImFb0U6Sj+CMFFh7w6HPwgx/IizO52n6AoLXnythWzTkxbemH3odRHGduscs5RsqsmO5/WjPCA/LGsUutzRlPdpQ+ON8WumDbJ9ne+SkzqR8rGtavH50DakygXGPU/WdKNE3dXQDo=
Received: from TYRPR01MB14284.jpnprd01.prod.outlook.com (2603:1096:405:21b::6)
 by OS9PR01MB13128.jpnprd01.prod.outlook.com (2603:1096:604:310::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.13; Fri, 6 Feb
 2026 13:21:43 +0000
Received: from TYRPR01MB14284.jpnprd01.prod.outlook.com
 ([fe80::4fad:2240:4042:6338]) by TYRPR01MB14284.jpnprd01.prod.outlook.com
 ([fe80::4fad:2240:4042:6338%5]) with mapi id 15.20.9587.013; Fri, 6 Feb 2026
 13:21:43 +0000
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
 AQHclm8qD3lunnbaf0uAuh27IRHtALVzunqAgAADMACAAE+JQIAAD2EAgAAA0hCAAARnAIAACY8QgAACvYCAAAD+AIAA9TZQgABXJwCAACsqoA==
Date: Fri, 6 Feb 2026 13:21:43 +0000
Message-ID:
 <TYRPR01MB14284CC099C09A99CFB31B66E8266A@TYRPR01MB14284.jpnprd01.prod.outlook.com>
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
 <TY4PR01MB142820FC29E751D8C7F0B7C348266A@TY4PR01MB14282.jpnprd01.prod.outlook.com>
 <1aa615e2-1297-40a9-b7c4-beb943996721@cogentembedded.com>
In-Reply-To: <1aa615e2-1297-40a9-b7c4-beb943996721@cogentembedded.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYRPR01MB14284:EE_|OS9PR01MB13128:EE_
x-ms-office365-filtering-correlation-id: 0095a2d1-1590-4464-f403-08de6582abc6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?WmExZjZqbU83cVVuVjVIaVhHbUs4cjB0VVZaUktJKzMrdWdTdW5FMGw4bkRr?=
 =?utf-8?B?VVhLbXZLcWNJWllEYVVoNy9pM2RCT0JaNU1zdzJJb0VKcGFPWENBdmcxalB0?=
 =?utf-8?B?R0t2OVNTaXZXbWpRL0Vybjk3cXhGYUdLQ1luYjdXOGhlQzdIRUU2R0RzTis4?=
 =?utf-8?B?STBjbk1FV2FXY3A1SHhWT2c5ZDVzbWQ2bVMwaTJlcSs5SG0vM29Yc3V0RVRX?=
 =?utf-8?B?MlhUNUUwU1NiLzFVT2J1RFZMbmxra1JFaExRYkFCV0svZHAzZlQ0dzFIemdy?=
 =?utf-8?B?NFFsdU1hWE9CbHdDZWErOTdRL0RDbUg1S0FhRm1VclgxUGxYY2JmUU44RWxR?=
 =?utf-8?B?VG1kMFoxZElaS3E3L2hMOS9USEFZY3N0aFhoeldRQmNXaE5YRVRYMmNFSk1E?=
 =?utf-8?B?K3V4bS8zQndBNG9iNnFuNlF0NWJjSnNXZDIzaUQyUHlkVk9zV3BGbUdISUJ4?=
 =?utf-8?B?VnptMHJNQVI0aVdLRzNsYkhwYmdYbzl5bEt4QTVzN1Q0L2NnTGc1WEV3bFgx?=
 =?utf-8?B?QlluaDdOMUYrZks0aGRXZlpGNzdqQnkvLytPbXZ6Qm0zOCtTS0pvaG5NQm8x?=
 =?utf-8?B?ZEtIL25EL1BMNml5UXlzeHVwaGxENzlXYW95cDFDWTFHdmE1VkFPc3E3azlF?=
 =?utf-8?B?c09nYW9BYnA4MzhxYjFtUWhiWi9TdXdSKzdQVGYyaVFnb1Z6S2hKV21IQ0Zp?=
 =?utf-8?B?SjNMeDFMMmwySjdUSDBLTDNqRkcrWXRZcUczSVplUkVyaS85SzFyc3lqNHJq?=
 =?utf-8?B?RUs1endHY3NQVHdHOENJWGYyUnV3L3pOUVpnZXhlQzFYMlFETTI5UUdNZHgv?=
 =?utf-8?B?Mng3bm16Vi90eENnbHhtdFMzRVBaUlhSRU9zTzg2KzhwL2s2UEJodkxaUDRx?=
 =?utf-8?B?UE5iRE1RS0NTdGNyUkZUSGJEVlhUQU1vM2VJNXRISEFLTEVKekh1ZmptMUVX?=
 =?utf-8?B?OThFRnh1OFNQV3oyRnVDTE5FRThxYkJ6b1A2Z0czdithQkkwZDJqblRzREpZ?=
 =?utf-8?B?ZzBmY2dTWkhWMEt6QnpHOHgzcXBpWjAxZm1zZ012SEhmY0t1YW9qSUpHOXlm?=
 =?utf-8?B?d0VOWGZsemdZbEZwWE91NFJGelNaa21wem1Tb3QrQ3RPQyt2amJ4MExtUlhi?=
 =?utf-8?B?eVZrUjZqbDh6THlnQ1UzL3dmeTA5OTdreElpNUNQKzgvTGliVXYxMmgydUlQ?=
 =?utf-8?B?SnAvc0llQTRuelM1eU52YWd6emxYLzlVTzMwYnBiUzJSM1VCQnVQekJHK2lH?=
 =?utf-8?B?RUVvUURvNndWVzVVbHF4dDNSbExzODdpclpOU293emdtQnpkOGxxczVtaCtX?=
 =?utf-8?B?ZjgyNVEyUUt2d3JWTTRIL1FaNGJxTkY0SWNzOU5ZaGp4bE5jOThNZGpQUVJB?=
 =?utf-8?B?MU9xSklLVkZYdzBnSW85M3IxZ0NBOHpXYnMzWndVTWpjcmFnNVNPN01NajN4?=
 =?utf-8?B?ZGVabDIvNzArenZpd1MrNmdnNks0cVJTZFk0blgvM1FTUnFETVhVdWxkVTc3?=
 =?utf-8?B?OGFzWVF5Q2lpbXF6UklZRkU0NzFYSXJ2SkZqcllySUVmb0tuWWszbTYvOEFY?=
 =?utf-8?B?NWF1SjBwMExHRWZCb2VmbVc0ZVpXVEhBYlRvSDd3c2NpZy9tS2dKNzFiUjZp?=
 =?utf-8?B?bHlWckgyM3RZWGxVZFg5KzZzQmdkb09rclFmUmNyeU1TeHJ3Zk1VdzhBSEIy?=
 =?utf-8?B?K21qZExwUE9YQk94WENla1Nid3paK05sbDlDV2hTd3VKZzNKQTFmejBPOVlE?=
 =?utf-8?B?d0w2L0tjNFdObVE1VmVuUUFsMmdsTG9TZTdCQ29MZUJ4dUJHUG9XRUtNMm9R?=
 =?utf-8?B?aElHVW0wZVE5NGMvQ0dOUzd5L3hod3VoK2RyOHBiNlUveEpqZWxOQ3lYMHVO?=
 =?utf-8?B?bXVIRkpKWGszYUV4bkVDTTlRWVcrNWJ3NkdKRWhmT1M1SDNmaXZic3l5M2lD?=
 =?utf-8?B?aDE0dnBDd3htSUpXQnkydERxRzg5L2dBTm5RQWZWcXFuV2lEbTZrdi9YYi9I?=
 =?utf-8?B?OXlITXJhcFc4VzEwVmpWdFNLWTU0OC8zK3ZKQ2hicmhCOHh5QmQ4enIrYWVu?=
 =?utf-8?B?SjN3L3l1TThMK1dERXlpcytNc2wwSExTUmNFZFFBOTFESzlJdzBUQWFxRHRm?=
 =?utf-8?B?aEFaQWF6R3VZS01OcjUwaHUzeVhHQ3NwaVFYUDRTdngwNVZJK1JyaVBBWDRq?=
 =?utf-8?Q?B+LWEtJoJe79qMkvaaArgnE=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB14284.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WVJuUE1vSmhzRGpDemlLTXN1MXpQU1Bnb2pMMWE2bXJVYm1QRlZhb3hZakJH?=
 =?utf-8?B?VG40aFp1RmtxQUJjZjJlMDZIaDFjQzVDRFJxVTZzckd5eGdLK3lGYlByUWVr?=
 =?utf-8?B?SklYd0pCVTRHOE5lREpjdFIxK1dqVU45b2duZ2lTeEFSTnFEYUluUExqR3hM?=
 =?utf-8?B?Z3RqaWpiaXpLT1hPb0d5Z0JKWnk5aE5SaHllKzVHVUV3QUpBaGpVN1pWRU1T?=
 =?utf-8?B?QXNKRENLOVQzWUNETEEvTXZZMzNIV1dOQTZFajJ6NUUrU3UwaGtJMVVPeHdQ?=
 =?utf-8?B?ZzBzYlNlMkR2ZlYxdkg4M0tGRmJwQldrVngvUHRKVURGSFFpcFBqWStTTXRV?=
 =?utf-8?B?Wk96KzRhV2dYMFNDcXJkSG9DWUhsM0JZZll2Ujl0M2FIZlYzODdiNHc2K0w5?=
 =?utf-8?B?aUdTM0tHaG1nVkdqdjdOQmJjVUZDMzdRQ1FnWFA3bUVTYUZqSkZ5MzNxOS9o?=
 =?utf-8?B?b0gvSndMMEhnU2JFb2xkaVR0RVVPNlVETksraU15SXViTmV5UklJcG1Rd21J?=
 =?utf-8?B?cE1hVUxQOUJKMmpHT0k1RXM2UG9NTmhpZ2lMalhYMWhTbkdPdFdoNzZMRFNm?=
 =?utf-8?B?Y044R3NCR0hOeExGMFlrMHRKWkNHWXRCVjNUemc0UGw4aUg1dDQzcGdBZkJ2?=
 =?utf-8?B?Yy9sY015cFBObHRhWFZYL0hMN21NK3k2ZXprNTd2c0Jpd1JBZWx0elNrZjRS?=
 =?utf-8?B?NjZ2aG1Id1NjTWNtQ0UwYVRJMnBPY3F2ckEraHEvZktsbFdmVEdBOXlGU0tZ?=
 =?utf-8?B?WnNCeDdWemJPNXNsMU5HR1E1MUZmc3J3YjZMOUZmZnZNcDZJcW8wTGY5Tmli?=
 =?utf-8?B?eUVRR1Q4RytWaFRoSGdqYWliYUZvUUxrZy9ZM0ovdll0cGozV0NXd1VlK0tt?=
 =?utf-8?B?ZVZNM3N0WUpmUmFzdG55OTlrOWQ5L2IybEtDN2dhZm40ejY4bUl2cENaV3E0?=
 =?utf-8?B?VzJFb2ZNMzg0akx2Q2g1M1dkNGliTlBtMjBITmd5a3o3ZFVmK3RwZXBBUENm?=
 =?utf-8?B?MEJDUUpOY21FNzhRWTAvdjFpL3dnZENPWHRMSlhqbW5zQjlua2dSbmhGNjcr?=
 =?utf-8?B?eHpHMHNWM0VVMjV1TVFrLzBwTUxkamN5OWdESVQ5V2JMbEN4aFhFNXQ5RDhH?=
 =?utf-8?B?cWhNR3BVb1ZFQzB3RTYwU3lwZ2dqQUdGQ3kwaGo2eFk1TmhYeENrWU8ya3FF?=
 =?utf-8?B?cW1VcXFKNGFnOStQUkJKYmRYRmNsVXZVYngyYm1kZ2dNcjBwOUI2Y1MyOU4v?=
 =?utf-8?B?andaeVhLd3VadGMwdzg1NU9xN2RqRTd2SlRYeWUvNWhxNHg4YlFtWm42NVpC?=
 =?utf-8?B?ZVR6OGNqTkREY2ZXNk9EWHFWaU1TajN2UTN5bGE1U0szT3hDUEQzQmRXTUN4?=
 =?utf-8?B?cTJTdmRYdWROcENTbDNLR1BZb21QVk5xVldxRDFpRTlIWDJrcWZZYXBlL1V4?=
 =?utf-8?B?WGVHc3hYNTF5K1FJNVllME9ZczN2WXRoMXA2U3J4OFRzbXhIRzJwZk11U3BJ?=
 =?utf-8?B?a3FHTldBeGM4MjBwYVF3ZGU3KzJTVlVEdFMxajQ0UEFKUzNjOXZCQTFFbHh2?=
 =?utf-8?B?NENOSVV5Wk13YWtMNUcwVUJSM2JzeUN2cWZscDg1c0g2blZEVDFwU1hqSG5n?=
 =?utf-8?B?TnJVRjF5dDl6V1dSQVQwUFdEYzRPNjZ5OWNTVnc2K0J1QkFnVzFPQWwzUzhp?=
 =?utf-8?B?OWZIQ2d3SmQrdWdtd3h6dGdMbjk3QUtRNGFaM3NPQ3FWcEFEcXQvZkZvOWxO?=
 =?utf-8?B?NXFDZU5GMk9GNGdrWkt2QmJ4aVNNSXhBOTVBdWZDdnBGdmxaaVFYeHBsWm5E?=
 =?utf-8?B?UndWVkRxenRibHJUNWJYTWN2SGg2QlJ0T2RjYU5laGtnVDdIZWgzNW91TkhU?=
 =?utf-8?B?c0owVUJGY0V1Zi95TWtlcWRwYmJxQnF3aFB1RmRacGZvZHRDRGc4czRFN045?=
 =?utf-8?B?TVFxcUl5b1RmK1ZlaUh2U1lmYjgrcEVMenJ1ekdER3BBZW5OMFV2NTg0NUx1?=
 =?utf-8?B?RGlSVHhYT1hxQzIyNXhSTnZhek00SnQ3WGNCSysrdGxBb0FxNFE1VnBMSllB?=
 =?utf-8?B?bnlERUNOa2xyM2ZjN2VFVDhmL01PemZUbFBCUDFjbDQrTkxyd0d3SG4vc1Y1?=
 =?utf-8?B?bEt1S1l5M1BBTFg4MGhjUzhSQ002MndzcmVqTHlqdmxwZUlILzJOaG02U3ZT?=
 =?utf-8?B?R2NmVVNxR2dGWXZpYmpKMldnNmJyNk53RmpUTHdjdm9mYS9reW5RYSsvMzJx?=
 =?utf-8?B?a0IrUkkwR0J0UVdSUnowWEJ5QXlmNEJ4RmdXM2Zib0g1d0plRVg5Mndib3hq?=
 =?utf-8?B?VlhSTURtZENBYUJWY3podE9OQ1NKdHpza1I5aXNWYjZ5a21jSlAxUT09?=
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
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB14284.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0095a2d1-1590-4464-f403-08de6582abc6
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Feb 2026 13:21:43.4749
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Oa1o0EUdeNBdWKG+ohw2FcQ5rrN6FTaYeNvPmoIuGQH2gUNTtdCmIuKHbA1wc/E/43xRayyskM43s2WKkkBffwSG0UHJUYBLSS8CU+Dthwo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB13128
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-28005-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michael.dege@renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[renesas.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,netdev];
	NEURAL_HAM(-0.00)[-0.998];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[cogentembedded.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: AB3FFFE064
X-Rspamd-Action: no action

SGVsbG8gTmlraXRhLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IE5p
a2l0YSBZdXNoY2hlbmtvIDxuaWtpdGEueW91c2hAY29nZW50ZW1iZWRkZWQuY29tPg0KPiBTZW50
OiBGcmlkYXksIEZlYnJ1YXJ5IDYsIDIwMjYgMTE6MzQgQU0NCj4gVG86IE1pY2hhZWwgRGVnZSA8
bWljaGFlbC5kZWdlQHJlbmVzYXMuY29tPjsgWW9zaGloaXJvIFNoaW1vZGEgPHlvc2hpaGlyby5z
aGltb2RhLnVoQHJlbmVzYXMuY29tPjsNCj4gQW5kcmV3IEx1bm4gPGFuZHJldytuZXRkZXZAbHVu
bi5jaD47IERhdmlkIFMuIE1pbGxlciA8ZGF2ZW1AZGF2ZW1sb2Z0Lm5ldD47IEVyaWMgRHVtYXpl
dA0KPiA8ZWR1bWF6ZXRAZ29vZ2xlLmNvbT47IEpha3ViIEtpY2luc2tpIDxrdWJhQGtlcm5lbC5v
cmc+OyBQYW9sbyBBYmVuaSA8cGFiZW5pQHJlZGhhdC5jb20+DQo+IENjOiBuZXRkZXZAdmdlci5r
ZXJuZWwub3JnOyBsaW51eC1yZW5lc2FzLXNvY0B2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWtlcm5l
bEB2Z2VyLmtlcm5lbC5vcmc7IENocmlzdGlhbg0KPiBNYXJkbW9lbGxlciA8Y2hyaXN0aWFuLm1h
cmRtb2VsbGVyQHJlbmVzYXMuY29tPjsgRGVubmlzIE9zdGVybWFubiA8ZGVubmlzLm9zdGVybWFu
bkByZW5lc2FzLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCBuZXRdIG5ldDogcmVuZXNhczog
cnN3aXRjaDogZml4IGZvcndhcmRpbmcgb2ZmbG9hZCBzdGF0ZW1hY2hpbmUNCj4gDQo+ID4gVW5m
b3J0dW5hdGVseSwgeW91ciBhcmd1bWVudGF0aW9uIGlzIHZlcnkgX2FjYWRlbWljXy4gVGhlcmUg
aXMNCj4gPiBfbm9fcHJhY3RpY2FsX3JlYXNvbl8sIG5vdCB0byBmb3J3YXJkIHRoZSB0cmFmZmlj
IHRvIHRoZSBTVyBicmlkZ2UgdmlhIHRoZSBIVyBicmlkZ2UsIGV2ZW4gaWYgb25seQ0KPiBvbmUg
bGluayBpcyBjdXJyZW50bHkgdXAuDQo+IA0KPiBUaGUgdmVyeSBwcmFjdGljYWwgcmVhc29uIG5v
dCB0byBmb3J3YXJkIHBhY2tldCB0byBTVyB3aGVuIGl0IGNhbiBiZSBoYW5kbGVkIGluIEhXIGlz
IC0gcmVkdWNlIFNXDQo+IGxvYWQuDQo+IFNXIGNvcmVzIGhhdmUgbm8gY2hhbmNlIHRvIGhhbmRs
ZSB0aGUgbG9hZCBpZiB5b3UgZm9yd2FyZCBldmVyeXRoaW5nIHRvIFNXIGF0IHRoZSBjaGFubmVs
IHNwZWVkLg0KPiANCj4gVGhlIHZlcnkgdGhpbmcgSSB3YXMgdHJ5aW5nIHRvIGFjaGlldmUgd2hl
biB3b3JraW5nIG9uIHRoaXMgb2ZmbG9hZCBzdXBwb3J0IHdhcyAtIGRldGVjdCB0aGUgY2FzZSB3
aGVuDQo+IGEgZnJhbWUgY2FuIGJlIHByb2Nlc3NlZCBjb3JyZWN0bHkgaW4gSFcsIGFuZCBsZXQg
aXQgcHJvY2VzcyBpdCBpbiBIVywgd2l0aG91dCBub3RpZnlpbmcgU1cuIEFuZCBzZW5kDQo+IGZy
YW1lIHRvIFNXIGlmIGFuZCBvbmx5IGlmIGl0IGlzIG5vdCBwb3NzaWJsZSB0byBwcm92aWRlIGNv
cnJlY3QgcHJvY2Vzc2luZyB3aXRob3V0IHRoYXQuDQo+IA0KPiBCdXQgdGhpcyBkb2VzIG5vdCBk
aXJlY3RseSBhZmZlY3QgdGhlIGNhc2UgYmVpbmcgZGlzY3Vzc2VkLg0KPiANCj4gV2hlbiB0aGVy
ZSBpcyBvbmx5IG9uZSBwb3J0IHdpdGggZW5hYmxlZCBIVyBmb3J3YXJkaW5nLCB0aGVyZSBpcyBu
byBlZmZlY3Qgb2Yga2VlcGluZyBIVyBmb3J3YXJkaW5nDQo+IGVuYWJsZWQsIGJlY2F1c2UgdGhl
IGFsbG93ZWQgZGVzdGluYXRpb24gbWFzayBjb21wdXRlZCBuZWFyYnkgZG9lcyBub3QgY29udGFp
biBhbnkgZGVzdGluYXRpb25zLg0KPiBGb3J3YXJkaW5nIHRvIENQVSBwb3J0IHdhcyBuZXZlciBo
YW5kbGVkIHZpYSBMMiBmb3J3YXJkaW5nICgqKSwgYmVjYXVzZSBMMiBmb3J3YXJkaW5nIG9uIHJz
d2l0Y2gNCj4gcmVxdWlyZXMgZXhwbGljaXQgYWRkaW5nIGFueSBwb3NzaWJsZSBkZXN0aW5hdGlv
biBNQUMgdG8gdGhlIEwyIHRhYmxlIC0gd2hpY2ggaXMgcHJvYmxlbWF0aWMgZm9yIENQVQ0KPiBw
b3J0LCBpbiBnZW5lcmljIGNhc2UgeW91ciBzb2Z0d2FyZSBicmlkZ2UgZGV2aWNlIGNhbiBiZSBh
IHBhcnQgb2YgYSBoaWdoZXIgbGV2ZWwgY29uc3RydWN0LCBhbmQgeW91DQo+IHdpbGwgaGF2ZSBo
YXJkIHRpbWVzIHRvIGR5bmFtaWNhbGx5IGNhdGNoIGFuZCBwcm9jZXNzIGFueSBjaGFuZ2VzIGlu
IHRoZSBsaXN0IG9mIHBvc3NpYmxlIGRlc3RpbmF0aW9uDQo+IE1BQ3MgZm9yIHRoZSBDUFUgcG9y
dC4gDQoNCldlbGwsIHdlIGhhdmUgaGVhdmlseSBtb2RpZmllZCB0aGUgZHJpdmVyIGluIHRoZSBw
YXN0IHllYXIuIE5vdyB0aGUgTUFDIGFkZHJlc3Mgb2YgdGhlIEdXQ0EgKEJSMCkgDQpJcyBrbm93
biB0byB0aGUgSFcgTUFDIHRhYmxlIGFuZCB0aGUgcGFja2V0cyBkZXN0aW5lZCBmb3IgdGhlIEdX
Q0EgYXJlIGZvcndhcmRlZCBpbiBIVy4gVGhpcyB3b3Jrcw0KcXVpdGUgd2VsbC4gQXQgdGhpcyBw
aW50IHRoZXJlIGlzIHN0aWxsIGEgcHJvYmxlbSB3aXRoIGRvdWJsZSBicm9hZGNhc3Rpbmcgb2Yg
cGFja2V0cyB3aXRoIHVua25vd24NCk1BQyBhZGRyZXNzLiBJIGhhdmUgYSBmaXggZm9yIHRoYXQg
d2FpdGluZyB0byBiZSByZXBvcnRlZC4gVGhlIG5leHQgcGF0Y2ggc2V0IHdpbGwgdGFrZSBjYXJl
IG9mIHRoaXMNCmFuZCBhZGQgVkxBTiBzdXBwb3J0LiBXZSBzdGlsbCBoYXZlIHNvbWUgZXhwZXJp
bWVudGluZyB0byBkbyB0byBnZXQgdGhlIFZMQU5zIGNvbXBsZXRlbHkgcmlnaHQgZm9yIA0KTExD
IHBhY2tldHMuIFRoaXMgc2hvdWxkIGJlIHJlYWR5IHdpdGhpbiB0aGUgbmV4dCB3ZWVrcy4NCg0K
PiBGb3IgZXhhY3QgdGhpcyByZWFzb24sIEkgaW1wbGVtZW50ZWQgZm9yd2FyZGluZyB0byBTVyBw
b3J0IHVzaW5nICJwb3J0IGJhc2VkIg0KPiB0aGluZywgdGhhdCBpcyBhY3R1YWxseSBhIGZhbGxi
YWNrIHRoYXQgcnN3aXRjaCB1c2VzIHdoZW4gTDMvTDIgZm9yd2FyZGluZyBmYWlscyBkdWUgdG8g
bm8gdGFibGUNCj4gbWF0Y2guDQoNClRoaXMgaGFzIGJlZW4gc3VwZXJzZWRlZCBieSB0aGUgY3Vy
cmVudCBkcml2ZXIgdmVyc2lvbi4gQW5kIHdpbGwgYmUgaW1wcm92ZWQgYnkgYWRkaW5nIHRoZSAN
CmV4Y2VwdGlvbiBwYXRoIGZvciBwYWNrZXRzIHdpdGggdW5rbm93biBNQUMgYWRkcmVzc2VzLiBU
aGUgcGFja2V0cyB3aXRoIHVua25vd24gTUFDIGFkZHJlc3Mgd2lsbA0KYmUgcG9ydCBmb3J3YXJk
ZWQgdG8gTGludXggYnJpZGdlIGRldmljZS4gSXQgd2lsbCB0aGUgYnJvYWRjYXN0IHRoZSBwYWNr
ZXQgYW5kIHRoZXJlYnkgYm90aCBIVyBhbmQNCnRoZSBTVyBicmlkZ2Ugd2lsbCBsZWFybiB0aGUg
bmV3IE1BQyBhZGRyZXNzLg0KDQo+IA0KPiAoKikgd2hlbiB2aXJ0dWFsIHBvcnRzIGNvbWUgaW50
byBzY29wZSwgYSBjYXNlIGZvciBMMiBmb3J3YXJkaW5nIHRvIENQVSBwb3J0IGFwcGVhcnMuICBC
dXQgc3RpbGwsDQo+ICJkZWZhdWx0IiBmb3J3YXJkaW5nIHRvIFNXIGlzIG5ldmVyIGhhbmRsZWQg
YXMgTDIgZm9yd2FyZGluZy4NCj4gDQo+IE5pa2l0YQ0KDQpCZXN0IHJlZ2FyZHMsDQoNCk1pY2hh
ZWwNCg==

