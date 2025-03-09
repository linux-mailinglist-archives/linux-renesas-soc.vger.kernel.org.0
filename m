Return-Path: <linux-renesas-soc+bounces-14183-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 092E8A58759
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  9 Mar 2025 19:51:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 71174188B615
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  9 Mar 2025 18:51:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC9B816ABC6;
	Sun,  9 Mar 2025 18:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="ELE8PpkR"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011068.outbound.protection.outlook.com [40.107.74.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB21A2556E
	for <linux-renesas-soc@vger.kernel.org>; Sun,  9 Mar 2025 18:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741546260; cv=fail; b=cHuDkde4SONnfdA0J5xXWLs6b3zAJWXDZaTTrzNW3gSo2p2/7xz1L6Td6o3Gu8w3NvS/X1PaQG3XRLESHsEwMDNyOQRE9QywQ8iDXzGFYm4C+PlddzEFA2bHSGF8pcK0152oMhdxMgGGLY78Gdu5Xd/nFHu43JgP31RT3+Jh87E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741546260; c=relaxed/simple;
	bh=lRt23ah/CS9Jl8k/JhfVL3YqhHkF6b5fMvcv1fP3aAc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=YqRqVZNGgBQmPLkR4ts+4ch+koP5DMJInDdqPj+DiDbD+zha3GWh3gTZR4dFW+Cgy5oNKI79u6JmgggJLBZRdSpK+aLHb9KvqIxtBOyZUKFjzAJ2Jb+EJcCx634ovyliYnQsbA9e5D/McSwjax3pfpfRJsQ57NVMtZGmuLlA/sI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=ELE8PpkR; arc=fail smtp.client-ip=40.107.74.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NgTnvZfC0qoLijmJY5MSgbf6QTi/Xvsr/hhkHlwPWqXpR+Zbvc9anytrdydpHmilBZ6a57uexjo5wxRNPWUgbzN/41zizEsyt4TAVUUDB6o3aihhPQeeKFrFX25RkB6BxcybSjgAHy9fT3EqanV/QWcNTyTQLY2JWcScBKzDD6HA+rceMRULngLgEVleYY8FKzuL2RHYbFVhHsNYtks0kBZzrcBFLVJ0XtvMMQOvyoHaqqP3ABvDs5d0JnslJlPOb+SJztalcL1yCRWBWWiyQRhwDLgFM8mXscl/URzhwKefjQBwEAoX5mdGEh1yBoIQHsxBsYZJrj/9Yy4MX9WGgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lRt23ah/CS9Jl8k/JhfVL3YqhHkF6b5fMvcv1fP3aAc=;
 b=mPDMLJ8/Qkh2hxDlNvcugw5nDBMaseM5xen75e3O75qzvAdy5Txo/MGs5TTFtOF3CHbHGDhgk5SIWNCk8u6Mfun8NVU26x+cKLZ3aqirBkTZV7bMPWR32pl94Z0wjDKfr2AncMQFE4CuTFhNUTBI2cEMvW1w9ltTOCdO8KEKAvLGhhjqp6sBhNI0SsRjvMPshO1rxAXpGzeSQfCeI6kP79BHJDE7k5mvEwwQWzKMF/2wVpSa+CqNl0vhopx5nhL+d614wFDerTWw+L0SYs6CHBjpB7XfwfigIohb4kn6ujse1aw0l13SGFwZQmq/rq4HcWhB2rvnR62Iu93IJf/KzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lRt23ah/CS9Jl8k/JhfVL3YqhHkF6b5fMvcv1fP3aAc=;
 b=ELE8PpkRH2b2TEvTGedGIe1VRjJVfP9nzF2IoG8EitYZjW7Z4bFx9vrZ/r/38VxePh+/an0JZsSFNJo0xuOXd4fR5c1wu7JI0lV/VMibW1OahhYnwHE9V7E71MghOFK+aKVB+SejzVrFjx3nWnkewOUTzmm0ICueeW4FHkU2KG0=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OSZPR01MB6879.jpnprd01.prod.outlook.com (2603:1096:604:13d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.26; Sun, 9 Mar
 2025 18:50:51 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.8511.025; Sun, 9 Mar 2025
 18:50:47 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>, Mark Brown <broonie@kernel.org>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2 2/8] memory: renesas-rpc-if: Move rpc-if reg
 definitions
Thread-Topic: [PATCH v2 2/8] memory: renesas-rpc-if: Move rpc-if reg
 definitions
Thread-Index: AQHbjrqLARyFG2OLuUyFd0aqtnBu3bNnWsCAgAPPm0A=
Date: Sun, 9 Mar 2025 18:50:46 +0000
Message-ID:
 <TY3PR01MB1134667BD7102FA79D512E9D686D72@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250306170924.241257-1-biju.das.jz@bp.renesas.com>
 <20250306170924.241257-3-biju.das.jz@bp.renesas.com>
 <CAMuHMdVcGD2xnzHHV8w9UGm2BqqANLG8SBR=2QRfpwVeRDn=tw@mail.gmail.com>
In-Reply-To:
 <CAMuHMdVcGD2xnzHHV8w9UGm2BqqANLG8SBR=2QRfpwVeRDn=tw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OSZPR01MB6879:EE_
x-ms-office365-filtering-correlation-id: c1e81640-3257-4867-fff2-08dd5f3b4dd9
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?ZHRzVkNoQ1ppMmMzQ0sxbHVOK1pLeExUU3g1eWNENU5VNFQ0L3ZJNC94SW9T?=
 =?utf-8?B?TFNkLzZ6Y2l2Y1BicVFwZEFuQWdSaENLeEJzTlU0bDBMNU45aDRHVmtKNGM0?=
 =?utf-8?B?WjFHWVpvcG5BNVlxVGJBYVloRThraFlBV2g4T0tTQWZ4QzB3MGRtK2w1STQv?=
 =?utf-8?B?Y0R1YzdZSE9WT2QvRytvTDNmOXdSZXo5ZVBONEtoYmlKdkZOd3JKR0ZlS3VH?=
 =?utf-8?B?RC84MXo0Y0FFUW9RK3RsUnF4cEFoY1VjUXVlcU1ocUZYOEtyalJBMkNOSVFJ?=
 =?utf-8?B?dU5MNis2cGYzSlJUWW9HR1dkQkZzdHRVZUJXaGFUK3RoTjNPcmU5ZEZheHc2?=
 =?utf-8?B?eEkweE1hTThhOTFsbFNMUG9iRjcxS3pRWWpYV3p1UzlvUkQvWUtmVnQxZVpS?=
 =?utf-8?B?TXJrYmNoS0dqaFlwRmpTYmo3bjZwdVQ2QjFSMS90ODF5U29VVm1YRmxVbk9G?=
 =?utf-8?B?WURqZ0o2cVFtejJsU2RtR3NTU01ESjRnNmJyRytEaTB4TVhLWC9HbzM0YUdp?=
 =?utf-8?B?QzdFUFBNSjkzUnV3WEdHTzVCMmI0UUdaWG5pYzZWbzNZc251eUQ3TjByRFpN?=
 =?utf-8?B?d0FtcGRML08vSkJiankyZHlTK282dUVLNFIrclBIZHJHU1I5eGlrL21PVkFP?=
 =?utf-8?B?STRBN3VIcGNKTWM3NGZCd25Kd0hrYW8wNkJRdytoRSttZUgwTHNuWHk3eVhr?=
 =?utf-8?B?cUJQVVF5M3dmSUNGaFZjTDFiNWdOamlaT2dBQmo3UVg3WG14QzVVQkNlM1cy?=
 =?utf-8?B?azBRZlg5SFloZDF3VjB4a0RWRDdHQ3dzdU9SU2tjR1QxMUlJNFhSVkVlb3dk?=
 =?utf-8?B?Qjh4MTBQR3gzeWtJMWxTNndBb2hMOVU3V05qZTZpek5JeXY0M1ZuNUxYVldP?=
 =?utf-8?B?RXk4QTFjbXZDSDJvR0JWYmsrVld0T0xpMXE5dGRtZFVMbXlwT2g0TFEzWE11?=
 =?utf-8?B?SEdmcEJPZEVxS1lVbUN6ajIvN3k3dlVaNFJrVng0M1liYzdCczczSjVIZzIz?=
 =?utf-8?B?NlRma0VveG9XNGFNaVpFSE40UDRNYnAwT2owTTBvczc3SUozU2hyaStSandK?=
 =?utf-8?B?R1F5WTNud1htNWRGRUNlMEhJZ3lUYmVtZzlYZHpmT3lLRzNhRHJabTJleHZt?=
 =?utf-8?B?S0NuWWdwcUZXMTlsU3VyYzdjRWR4bU1JblQ0MHo3UDNNRWJKMzBac1pVcTNQ?=
 =?utf-8?B?SkJjV08vWEN0WlRWSFNTM01icVgyZkpQKy9CZUFEVmU5RmwvRnNxaG5tY3hh?=
 =?utf-8?B?R0lWbWw4cFJJWEhkcnNVcnhLS3FCSXdGb244TG1IOVovZXBTMlh6UWljMm9x?=
 =?utf-8?B?VVR6VTErRDVPd3cvL0ZMMEdGNnlYNmFMWXVuMnFhWDJDMElUNFBQa2ZOMXFZ?=
 =?utf-8?B?aXJ2UVlFZnYvK2twdTlsVVNDbHViT2tZeEFsbkk3ZDRWcjZHelhrYUlERThY?=
 =?utf-8?B?NGl3V0RzemRzREMzM0ZzY2FGcG5JWmozZEV0cVlTM2ljeDFoTkNvNTUwZWRC?=
 =?utf-8?B?SjA1bm94QlA2bkk2NTRacDZQdG1FOUw2YlNicEd3eWp6UXhNY0NzMDVLaFND?=
 =?utf-8?B?bS8vZjNJcDJnbHNoRERpUWNDNEMwWTFqbDltYTJRVmU3YWl4UUdPd2FnVTFS?=
 =?utf-8?B?ZWtKZ0RmaVhPL01jUWt5MHVvbElpR0xKUG92UlFuSE5uTlJ4MzArdzZGTTI1?=
 =?utf-8?B?a2NTQUhibFQvUUpKZlRYdC9yMXJKV05Vc0dkbkI2a09BUWY3emdYVm5mdjFq?=
 =?utf-8?B?SXUrRU96WGxuei9TcVUrakZGcnVudUtLY09lbFVmeG9xalIvNWdIR0FwVlhC?=
 =?utf-8?B?YTUrcEtSVzNyR0VnMmkzblgrYUx3N1lnUWZQZVR2NmtJRndIck9iaG9rbE9r?=
 =?utf-8?B?MG9wNDdlQU9zK2VGQ0V0N0E1Rk5Ld3ptOEJobDRla2hmMkY3VDM3bFVpQmYv?=
 =?utf-8?Q?6txfjc60QbmEuVH/8ZiRx6EAGE3yB+rP?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZUl3YVhhblpSVnNJcXAxdXVycVZoaXc3UmE3NER5QjdNODYxUXJYeThjc0xE?=
 =?utf-8?B?OFVjNmRldlhCZUVOeXFKendYZ1ZrT1RXSEpPQXg4dzdvcW9heFNmM3ZyZTFx?=
 =?utf-8?B?NjNlMVNJVFZub0RmNlRaZGFvN2RuT3J2ZHlzaEZobHErWmJpdG5wUGJvRFpj?=
 =?utf-8?B?YUpkOGJ0K250SjlnWU5xaTQ4aDM1VzBYOW55TTh1NEpFcUtXRnpvV2hyZUNN?=
 =?utf-8?B?b2dYTVZIVVh4VC8wNXZrb1BUbU1kUksxMzk3T3pFNzlZU0FlQ3dvMEJnTkpl?=
 =?utf-8?B?YUNPY2tud21ScnJZaHYzbnZ5RjVzMklxR3o2MnJzSy9qRUVKZHI4RUc2bDF3?=
 =?utf-8?B?Y1JHQTdvVithQ2FveC8vdWprUkw4VTAvdmlNZkZERnBzRG5jQjByanJwcmVQ?=
 =?utf-8?B?ZXd0eFFSOHVkZ1VqOHJtTmYrb0tyQzIreEprWUI3TzQvZFZwUnFqeURFWnZj?=
 =?utf-8?B?SjdvZHZmaFo0bzVVaG02U2wyNmRnb2poNExLbXJCTSsyQlBhR215UXErNFlH?=
 =?utf-8?B?eVBtSEdxMGRCa2FNZkVVZU5sNGtaMERtNzRzWHdXQ1kvVGt2UkhYTUlBT1Bm?=
 =?utf-8?B?SzFURGdoMWxVQ1hDb3lwblRwOEJ3ZEhBRXVVU0RwWHZ1a1drc2xyK1hWS2pE?=
 =?utf-8?B?MkJrbUI3UGFmYWZtMktTaitDOWxlVUFudTQ2bWtnMlIyZS9qeGEvZCtOeFJv?=
 =?utf-8?B?a2U3Y1RYNDRhampFVDNEdVRrYmxQTWRsaGNOTmFNdkRHVCtQODBFRzhTVnBZ?=
 =?utf-8?B?M3hIaXo5WUgyak9hTkJsWjIyS1plUW1IVHVmbitaYW8vWnMyT0x2R3RTZG5R?=
 =?utf-8?B?NW15bCtqWHRpTjZIa1JQRy94d0xZUExNQ2xwbEowUVcwWHpvL2xJdHdBTUNM?=
 =?utf-8?B?MDh4RDBZeXMxcnk5QkozcS8vaithZTc1YndUTkQ2aVdlTkxodUpSbUtCU2lt?=
 =?utf-8?B?VVFzaWZZd2JDWmNhV3FjNjJLNDYxUmpIWEpXY0tnN1Arazl1bGQ4WWRXMnBt?=
 =?utf-8?B?UjlNMmFRK0paU0VucFVLUVk0eS9pc2VIK1hjUUhNQ3QrYWdkNGlrTXVRNTVG?=
 =?utf-8?B?Vm1uWHZaanBXcmZHM0ErL2lTZTF6d0d0WE55WkU0SFlOck9UVDA2NERqenc5?=
 =?utf-8?B?M2hnaGRYTzNwZk1sVnQvcm0xN0hTdnNXNG1pSEFxN3JXYzlyaFd5ZXlJcmRS?=
 =?utf-8?B?WTRqSjgrR01NR2FBUW5URVJjZGJ1bjBaditpQTNGN3JYUWtoNlRPQXlLeXlr?=
 =?utf-8?B?K004a2ZVbFp2OG5peUZWYzUxNUsveHNmVUQ5Y2tvMW5Cek9mMzFFeHgvS1BS?=
 =?utf-8?B?VjNVYjBLZ1cwMytvcFlPMlRFQWIwblpuaUZIVWZFUm9nMk1aTUtNUTE4R0Ro?=
 =?utf-8?B?eUh5TEUrSlZMLzVSb1A5U2xuK0NwTmpZRDEyeW1sTDRUbnVZblhsTWxiTmU2?=
 =?utf-8?B?R3h2MTJVMXVJSDcvK0dSOTZuYmZCdVVnVENpL1BxUFFmSEV6cC9WWFcwWUE1?=
 =?utf-8?B?a2NpaFhBVklxeHkyU21CcGI4dE9lOEptN1BEY0VzNklQVzM0NUNueVpPUVJL?=
 =?utf-8?B?aURQcTd5Sy8vTU81c1JpQ2h4ZVJpUnAwVDBLNzlXUlVXdW5qNXhyUGFSZ2Zy?=
 =?utf-8?B?NVZzMmNsOVplaFZpSGV2b1ZwdlZ6ZnNCZXhTd2ptaGxNVEJONXUxcFNacU90?=
 =?utf-8?B?WUEvSEd0YUxmMDlWY1FUM1EwUWVLNUZzUnVSYUtZMlkyaFY3T1haSTJiSnJm?=
 =?utf-8?B?S1VBRFhka0NKMjRjaXlickdqSFhrS21TQ3NybFM1WWgwODJ6dWlvKzZpWERi?=
 =?utf-8?B?VFVpSjVJcm5sZkI1bHEyY2VVUm1YVlFKb2lLL3dHejJjcTA2QXRRbE1Bc3J4?=
 =?utf-8?B?S2pZSmRLWjRQYkJLazZ2a0thSlp3NDVodCtDZmVha0wwdStLWjNFQkk4MnV0?=
 =?utf-8?B?N1YvVFBkanIwLzdlQXF4Y0pXR0VSSW8vOTVKYzJxdkE2dDJ4NEFMakRsVm5L?=
 =?utf-8?B?VmI5WjVTWWkxTGt1MG5ybFVvWUpTbVdFOURTUVVtbkFUakhubTBwVTlLQ3Np?=
 =?utf-8?B?WENLRk5HSTJXeDBoT1JYS2gzK3ZMbVM3ZFdDSHAxZlc3akVOeXFuMFhwcEpB?=
 =?utf-8?B?RVdSbFVQdXJTeXRzTUxqUGNDWHUxZ1R2eFU4OTBvL3VVNTk3VzJoRUNKd2wz?=
 =?utf-8?B?SUE9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: c1e81640-3257-4867-fff2-08dd5f3b4dd9
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Mar 2025 18:50:46.9867
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: O3L0eBNVbSmwPX6BQzFJPrJjDpl0drlwuLSQ0O9LRVqbkr2j7toYBExPkYxM7zrROwY6ulr4rXzVuFmM6RjINhqNnJTLP6HAgVofejD9Yz0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB6879

SGkgR2VlcnQsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VlcnQg
VXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4gU2VudDogMDcgTWFyY2ggMjAy
NSAwODozNw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDIvOF0gbWVtb3J5OiByZW5lc2FzLXJw
Yy1pZjogTW92ZSBycGMtaWYgcmVnIGRlZmluaXRpb25zDQo+IA0KPiBIaSBCaWp1LA0KPiANCj4g
T24gVGh1LCA2IE1hciAyMDI1IGF0IDE4OjA5LCBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVu
ZXNhcy5jb20+IHdyb3RlOg0KPiA+IE1vdmUgcnBjLWlmIHJlZyBkZWZpbml0aW9ucyB0byBhIGhl
YWRlciBmaWxlIGZvciB0aGUgcHJlcGFyYXRpb24gb2YNCj4gPiBhZGRpbmcgc3VwcG9ydCBmb3Ig
UlovRzNFIFhTUEkgdGhhdCBoYXMgZGlmZmVyZW50IHJlZ2lzdGVyIGRlZmluaXRpb25zLg0KPiA+
DQo+ID4gU2lnbmVkLW9mZi1ieTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29t
Pg0KPiANCj4gVGhhbmtzIGZvciB5b3VyIHBhdGNoIQ0KPiANCj4gPiAtLS0gL2Rldi9udWxsDQo+
ID4gKysrIGIvZHJpdmVycy9tZW1vcnkvcmVuZXNhcy1ycGMtaWYtcmVncy5oDQo+IA0KPiA+ICsj
ZGVmaW5lIFJQQ0lGX0RSRU5SX0NEQihvKSAgICAgKHUzMikoKCgobykgJiAweDMpIDw8IDMwKSkN
Cj4gDQo+IHNjcmlwdHMvY2hlY2twYXRjaC5wbCBzYXlzOg0KPiBFUlJPUjogTWFjcm9zIHdpdGgg
Y29tcGxleCB2YWx1ZXMgc2hvdWxkIGJlIGVuY2xvc2VkIGluIHBhcmVudGhlc2VzDQo+IA0KPiBB
bmQgaW5kZWVkLCB5b3UgbWlzcGxhY2VkIHRoZSBjYXN0LCBvdXRzaWRlIHRoZSAoZG91YmxlKSBw
YXJlbnRoZXNlcy4NCg0KQWdyZWVkLiBXaWxsIGZpeCB0aGlzIGJlZm9yZSBtb3ZpbmcgaXQgdG8g
aGVyZSBhcyBhIHNlcGFyYXRlIHBhdGNoLg0KDQpDaGVlcnMsDQpCaWp1DQo=

