Return-Path: <linux-renesas-soc+bounces-11611-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30B929F8EA4
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Dec 2024 10:11:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7FC36163621
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Dec 2024 09:11:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 648A31A8404;
	Fri, 20 Dec 2024 09:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="gL5l/i7T"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011017.outbound.protection.outlook.com [40.107.74.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE9C01A83F7;
	Fri, 20 Dec 2024 09:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734685872; cv=fail; b=XVUhCARA7KnRfy2voMdywv+wWizx1i4O4NlflGbviauOXX49TX5x1CJn78aCHPrrKwOCreJSnt87VXqS2zeOIcF0jr8+UjmnodMpIWyUqiO2jo31ASaYMSvD50kf/wEwJWVXuAw6aDsF/07zlhV3Qa8S//FroCYixbzYrbBHPG4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734685872; c=relaxed/simple;
	bh=4t0ZQXhqMxAAlnPrXRoPjJKCd6gYV22qqSgJWCfglJI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=NnyV77D9JAXxL6Tb2El/XUojFdFQsddPg8svKi0z59WjDtJ61M/LKDu0rS9zl8Q1d1Hx77T5xZQ1b8whNLG0RnodCexB5Br4Kix6e/UJv+HZOgD6hwrhMX9Jnw4Dqk5aM5QQtgaiEZvzahRw8YN8VO52IAJZllgcbFs2j/Q3pEQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=gL5l/i7T; arc=fail smtp.client-ip=40.107.74.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O+YxUMNzpv+ss8vYGM0ro6JZ0ihnwv/czmmYIs2ien42QVXCg5BB7PN5jXuMwvJ4z1st6Ibk8ei/VST8epK62B8fKk3RJFVuyz+f3q0/qHhhVXI2vxFZat2zprOTf6k95lLoArzoh4gSzDmPCjbzHpDfvzQ7yWhOrFHULcxK3RapkqZfB4KyRH4aP6H/x9uj+nN182qQ4xelrdjxJAgbQpOSRz6mc3gXKFUfQWxEDqVzsOluFOm8YY60n2ADEfHc0Ks+OgMln9lD3N9B69SyAAu1fpio0PTDjlLjpM0WBADT3frr5l1ean30PzjlHhIPeJIsMu3NgVlijKIvNjQMKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4t0ZQXhqMxAAlnPrXRoPjJKCd6gYV22qqSgJWCfglJI=;
 b=WkA7S2G8qHUk7gLhe0PvdRdzv0b1FDrJWMrJ6Lq4B+DySXS8uNaxjX5Qdvf7SLtf+V76lk5U9IH3yQCaeP2Qh9EvIJUNsAEkjdtFjnMzNawdefFe6YC8XUBzxoeM3V2rUnaxdesFbXHzNeUIH+1xiVHjNDTEpu7a3BgMShCTeRV9pqfyTNS/JE0itsREio0rDQrD40ulNRC12Y6IxEdO2MKuLMUzD34wBxlOCOpf/UNgNORJXHjxUOJw9zBQsBNXx0OpSGEWX1TivoMDhoLas1p2THbCXvoc7etkUXgXOCdPBE+B9Mtw8YoKjzD8i1qOajBl166bicETqoNr/0AIww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4t0ZQXhqMxAAlnPrXRoPjJKCd6gYV22qqSgJWCfglJI=;
 b=gL5l/i7TCfSfdKLTLCcumN+S8R0U9HiCdeKbkyyTwdGRwHW9ZpxAPP9TQwvjuSrEMSQrZ5g9rLYu7R7q+hO7iURJIITWXvKZjRhnhj4aBM2w/sFze0VU4DfrHWdthoCyTyYqy8loltpBHjAjua2oBErcTxIGHkrV7DDfmsOO8Is=
Received: from TYCPR01MB11040.jpnprd01.prod.outlook.com (2603:1096:400:3a7::6)
 by OS3PR01MB5831.jpnprd01.prod.outlook.com (2603:1096:604:c7::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Fri, 20 Dec
 2024 09:11:04 +0000
Received: from TYCPR01MB11040.jpnprd01.prod.outlook.com
 ([fe80::b183:a30f:c95f:a155]) by TYCPR01MB11040.jpnprd01.prod.outlook.com
 ([fe80::b183:a30f:c95f:a155%4]) with mapi id 15.20.8272.013; Fri, 20 Dec 2024
 09:11:04 +0000
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: nikita.yoush <nikita.yoush@cogentembedded.com>, Geert Uytterhoeven
	<geert@linux-m68k.org>
CC: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Geert Uytterhoeven
	<geert+renesas@glider.be>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Michael Dege
	<michael.dege@renesas.com>, Christian Mardmoeller
	<christian.mardmoeller@renesas.com>, Dennis Ostermann
	<dennis.ostermann@renesas.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE
 TREE BINDINGS" <devicetree@vger.kernel.org>
Subject: RE: [PATCH net-next 1/2] net: renesas: rswitch: use per-port irq
 handlers
Thread-Topic: [PATCH net-next 1/2] net: renesas: rswitch: use per-port irq
 handlers
Thread-Index: AQHbUpYM+IA+S8xJU0SYrx15NW+ONLLuxP4AgAACz4CAABCScA==
Date: Fri, 20 Dec 2024 09:11:04 +0000
Message-ID:
 <TYCPR01MB1104022CD76BDE941D1C22536D8072@TYCPR01MB11040.jpnprd01.prod.outlook.com>
References: <20241220041659.2985492-1-nikita.yoush@cogentembedded.com>
 <20241220041659.2985492-2-nikita.yoush@cogentembedded.com>
 <CAMuHMdXV-2bdU9Cmk_VHTJ=M3Afg5aTfY=_k=p6v1igzpV5kBA@mail.gmail.com>
 <7b009b7f-0406-4dc1-80b3-79927d6143f0@cogentembedded.com>
In-Reply-To: <7b009b7f-0406-4dc1-80b3-79927d6143f0@cogentembedded.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11040:EE_|OS3PR01MB5831:EE_
x-ms-office365-filtering-correlation-id: 77a8df79-d99f-4b5f-c46d-08dd20d63b0e
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|10070799003|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?Vk1vZ0NzVWg3MmNOdW5XQkxpMnYwRjQ2SlRUMTQ2Nzk3NTVBUTlXL3gwZ0JV?=
 =?utf-8?B?bUlxdjZMTkx4anE0MVhpbWxQcUNqd2ZJQS8zRnltek41SHlTWUw1d1E5Qnpa?=
 =?utf-8?B?NnRCZzRJdVBGdkYyaUFKQ0VSK0RkZUZlMFdoRWJSQkFFcTN0Z2tOTHM3eFd3?=
 =?utf-8?B?YzR2T2M3WkVlL21HOFBVMUtZMGFSU2tndmpmM2F6eVhQcW96Lys3TWhMU3F0?=
 =?utf-8?B?N0dDTkdWMjZhWW5WMUE0dVBraGwwNEZxd3AvVlprQmhnU3BoL3ZYQUtFT3RZ?=
 =?utf-8?B?TnBzb1dhSnB1NE9jN1lmdlZpc3RaTmxMMVpHZVNPYkFBTUVuZDl2OGZMMDJH?=
 =?utf-8?B?bUNidjJ2U2lGeFVYNjNwWmZuT3FyUUNYWWNFZlM3TTM3VUttS05odGNneWJv?=
 =?utf-8?B?ZFBoRHUvREdmcjhadnNXa2pyTXRXQy8vNG4xYjU5c2x2bjJDVzJXZmNzWHFh?=
 =?utf-8?B?ZWswRnZJUXJsOTNiVXRNSmNPZ3dlRk54a2J0WkFuWW5wVllPMXMyYlhKa2tJ?=
 =?utf-8?B?OElUenNTbE8vRTVPQmw1bUNaelYxaEZrUWZ4aVdETnhBaXdyaTEzSlNCQVlP?=
 =?utf-8?B?a1NRV1c3TnFKbXd3VllyYnA3TUFXeHNaL2RDSWNqN2I0WXF6cE40azNiOVVK?=
 =?utf-8?B?YTR3WWNPaTlIaDVlandDbkNUWnBkQ3dBTTljNHo5M0dMMlZRTFVENjF5Zyth?=
 =?utf-8?B?RmZYSmdGZlhzMDVoRXQ4cGIwM1lEblZSQzJiUUcvMkhHc0l3eTVDZE5yOG5K?=
 =?utf-8?B?b2lmQTVzRDVNTGZSMXRrcm9yWlJOSEpHSHV1NXpxZk9XNVFPaXNyT0h0WHd2?=
 =?utf-8?B?UkJIZlg0YnBmN2pwR0U2TGtqbENxR1c3TENLenl3MzBPVjZqUmZ3T1pkNE8v?=
 =?utf-8?B?YlVhdEZJWjlRcG5rWWk1SFNhY2Z1UmpyN2xCMU9RRnhSZjBsZHlRZnl4ZkMx?=
 =?utf-8?B?WUliZzd5Yml4QkZBQnFSZFhxTnhmQklmUm1lb1Vxa2d1aWFWWUo4bnlSTnNr?=
 =?utf-8?B?M2RMS2NFbVE4SnFBQkJZWnlZVDVXWTBQT3lGbW9MOUlQWndLbjhyYTN2V09T?=
 =?utf-8?B?TFJ4Nlh3L3kyNnlWbTlLUVhZeEsrb3AvZDdiSDVnWmt2UTFTTnY4R0FSYVg2?=
 =?utf-8?B?UmdlallyZ3FTZUowdVI5VS9LMnp6UGFwQVJVcDBpT3ZUQjBNSVU1ZTZMUFRD?=
 =?utf-8?B?Q1pLaXcrQU1hZjRHd2ZPWmE3eXBFVklUbTlkSlh2THhzc1ZEckMvcVNBNjFr?=
 =?utf-8?B?V0pxS3FkY21GcGovOW9iQjMwSnhMT1RXU3JNNk80em90TUFvVVlrZzJCU1Q4?=
 =?utf-8?B?d0VSN1J5ci9JNHl1Si95a21Vdytvb3pEL1lOSlNIQzlWT0tkQWhvMCswV01l?=
 =?utf-8?B?ZGlGZHUrQzl1Nlo2U2lobFJJRkE4WTllRTZ1RXFDQ2M2eFI1K2Z3Q3ZoQ1pn?=
 =?utf-8?B?dkxVWVlVSTExL2kzZkhIak1LdGdLajk5ZEFoOEJSakR5L3ZGV1NvVVNGZGpl?=
 =?utf-8?B?S2g4Y0dodWtUa2w1aFNvbUxHbjRqMGNwUUpNR0d2U3VuZFFzOWpvWnZJcGsx?=
 =?utf-8?B?S2F1YmtkOURmVWozWVFwczRqcDBza3QwL2VMTEdieHVTNithN211V3MvZXlH?=
 =?utf-8?B?R2k1RzdxR0g4M255cDBRM3kvQ2ZZaXhwYVN6T3JnVExnQmJpdXV3OWdKRS9V?=
 =?utf-8?B?Uk5YY3Q3MHJkWkRIWHdXNXJSdjVoSHhuc2MwTEVsNVF3OFVqUnpWQjRhWVFx?=
 =?utf-8?B?bVNMaFQrbU5YV0tjbGhlZkdXekVzVUI0cUhKYzRQQmpuQS9Cc1dwbnBRNVN1?=
 =?utf-8?B?Y3B6YzduMHNXZWZCZy9ISURSNFhpYStsSElhcHRQcEtiSk9VbmY0S1lRWlpv?=
 =?utf-8?B?aU1yWnJ0WEtyM0haMWRZMGFYZ29BMk5nc0RMemtyZkRUckdNajV5blM4VVlr?=
 =?utf-8?Q?8BoAQVRKrPcmkwHw644NhzLSuOSnI8Zt?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11040.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(10070799003)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MkZDT1QzTmM1T01QL0RLZi9uSUtVT3d6R3QycU51aStwTkY5aWRaOStaZURS?=
 =?utf-8?B?N2JUckJ4SFVJRzdvZFo5MkZPcU8yUHpJZWhjMFRZWjJFWmZNckNjYjVGNEJp?=
 =?utf-8?B?MzI4TEVjdlBncFVUeDVBazRDOGtFYUFmTGF3L0hWQlJNVSt1N2JkUVFocEQ4?=
 =?utf-8?B?dTJaS0ZaQ21tcVdxTlVHN1lUVnR3YVpnYW9KSXRJbHExcjRKMXRaUGRqQkZH?=
 =?utf-8?B?Sk4xd09rakNKZ00zYnpnQjQzWUlOV3gwNVkrRGYvREZBeE5Hc21nTWlmSEdo?=
 =?utf-8?B?VFJ3bkY3dEYySm42Ty9zTllGejUxblcwa1E3QU5wZGtsSFl2ZTRzZFRHSHNm?=
 =?utf-8?B?UmptTlBnRVZYNEZ6ZnRYSWpUanVocUQ5c2FkR0pjcW42aXZkem5qWkJkRFpT?=
 =?utf-8?B?VHFFWFlTbWY0ZCthMlp3SGo1N2s0VFBmaitOL1duR29GWmxHa2RmVnJ0Z3No?=
 =?utf-8?B?RllxcDJkTS8rT3BSMlc0ajh5YkJzWGxlWVFXcGp0R0pReEF3b2NBNFhlUUdJ?=
 =?utf-8?B?OWF1R3Y1MVQ0ZkxDMHl5VG93Qy9DRDNOM2t5ak9IQkZPbDRNQzQyR2Nzbldq?=
 =?utf-8?B?eERtSnlYL05GWnNYb1Y4ZXRERWNQY0dkVW9uQ2NETzNlaXFaQUtMS1JyVm5N?=
 =?utf-8?B?RnFSbG5WdVJVcUdyVjBUNVNJaGZqVzhxRWoyRjRNNlpnakRiY3NJL29RU3Zn?=
 =?utf-8?B?N0ZyeTFlTEVMRVNUOHVSdjQ0MVJrZDZiZ1E3eEp6S2kxeEJPbXBuMnVISGNz?=
 =?utf-8?B?YmlSSGlkekF1NGtzaTV2dTFvUFMrNDU5NU9HQWYzMGJwVmw0dmFpb0YxWHJs?=
 =?utf-8?B?QUszQUlvc2NpUUwvQ1dnUzc1T200TnVoQjZzY0FRemZhOGdmWmhlQ1lIU01x?=
 =?utf-8?B?Tkx1ZTl3dDc3YWl3Y1AvdWlWdElDblZIUFpMNCtTcUFJTFV3OFpVSmdTT29p?=
 =?utf-8?B?ZnNOZGtGeFJCcUZheFBPUWZMT1hON0ZWSW9NK3UzZE9WLzlxK1AxVGgyNjky?=
 =?utf-8?B?ZXNiSThBR0FaZmlYTzNEOUZ1d1E1ZGpSd1hWTHpwQWRLRmpwVlMwYTFPdnlO?=
 =?utf-8?B?Ry83cVV4V1o2M2VYZG5EWnFLcHdwNGtjQzBrQ0srVnUvcUFrYUp5K0tSTTY4?=
 =?utf-8?B?RmNWdjhiK1JlSm92QUdDTGFJd2pSWXFSRmFCWm90T3BFTWZjYmZ0WnpwZnln?=
 =?utf-8?B?SS9EMnFzd0JmUWZoRk5EWW1ZZEFJTjBaWHBSNUZTT3pPZEVheU5EWTRyeG84?=
 =?utf-8?B?ZDBNNCt2YjQxY3JOQVd5VEttSWNUeTVnMythWUtyQTBaUlAyakxjOTFKalE5?=
 =?utf-8?B?aDdPVmtxeFh6L0VxMzZxNTZGSzN6dXZKRkhGVXIrZ3FzT2VQbjVKdnlrUW9k?=
 =?utf-8?B?a0JjcXA3OG96ekFKaUR5U3RNZlpZbmZTRXZpN0N4Ulg0RkRPWDZ4NXdLNDlu?=
 =?utf-8?B?MzJPMWRyS0NPS1kwTWVyMG80SXF1ZVJsa2dNMDV2WGdVU0RkRXV2SllySUg1?=
 =?utf-8?B?R1M1VjR0WFdjSHBZQjBDeE1WMGVFZndpOUZSd09nL1hvQXpjbUpGcnBTcTNr?=
 =?utf-8?B?OWIwWlNQQWlKblVkWUVBTVBpUXFQTmFkYW01UzdNVU1Id1RIUE5RdU80K3N0?=
 =?utf-8?B?RWFScUgxdVJCdHMwQWczdm84NXFzd1pHeDVrNVJBYW5oaGFJKzgyaHRnUGcv?=
 =?utf-8?B?dEF4WE83Mm94b1dLYjdSWkhGajcvMDNuQnVvRFB0SGZNMjlvRVhmeHhiZ1Nt?=
 =?utf-8?B?R29jekZCc3E3OGx5anVnYTlpd0hJZ3EyLyt1QVl5S25xaE1GeEtCNHNGR1hx?=
 =?utf-8?B?OFlHRWRMYjVZZlFRVGZldCt5Wk9rYXVCSHZyZVZjd2FaR25oci9BVi9ZRVZi?=
 =?utf-8?B?K3JXaTlOdU9NMDk3ZENISThNZFZCUWFnV1BkQWFaUURqWFlrN1RXcEltRms1?=
 =?utf-8?B?ZUFPdlJGTzZWR05qQlA3OEFBVzJjZStjZXpURDA3QVB1TXJRUlp0Q29QcXRH?=
 =?utf-8?B?aWppd0FLSUZiL21QN0o3c2ljRWRrQlEvMHZqblBTU0c5VFUxMkhybEdnVEVV?=
 =?utf-8?B?V29jRERha3creVVIenpMWGFnYklsc2tuYVZQOUpzMm1zSlp0K2UxcjJDd2Y1?=
 =?utf-8?B?NkdBMS9YazVrK2ZzcTJxdXpwRmJaanh5a3BOMXRhMWROcFYrWDUzcG1aRGdT?=
 =?utf-8?B?NmR5bWsvdS8vMHlnSzdZaTZKbDdXajhHU0xhQVlndXBYL202YTBYRE0vREpi?=
 =?utf-8?B?RnZabzh0NExjM241UGU1TE16V253PT0=?=
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
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11040.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77a8df79-d99f-4b5f-c46d-08dd20d63b0e
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Dec 2024 09:11:04.2369
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1DQxCl0T2kDpUsAr0FmKRgK5dvd2U9c0zvDOvZk0QU2AxQTodb3zbOCX6LobxCiQf2tDvqCw5tEpfLoow78Cg5Sn7qwxsY3p69OVuODYgwMbIZHFXPstmyGMm6qntSDt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB5831

SGVsbG8gTmlraXRhLXNhbiwNCg0KPiBGcm9tOiBOaWtpdGEgWXVzaGNoZW5rbywgU2VudDogRnJp
ZGF5LCBEZWNlbWJlciAyMCwgMjAyNCA1OjA5IFBNDQo+IA0KPiA+PiBCdXQgaXQgaXMgbm90IHJl
cXVpcmVkIHRvIHVzZSB0aGUgc2FtZSBpbnRlcnJ1cHQgZm9yIGFsbCBwb3J0cyAtIEdXQ0ENCj4g
Pj4gcHJvdmlkZXMgOCBkYXRhIGludGVycnVwdHMgYW5kIGFsbG93cyBhcmJpdHJhcnkgcGVyLXF1
ZXVlIGFzc2lnbm1lbnQNCj4gPj4gb2YgdGhvc2UuIFN1cHBvcnQgdGhhdCBieSByZWFkaW5nIGlu
dGVycnVwdCBpbmRleCBmb3IgZWFjaCBwb3J0IGZyb20NCj4gPj4gb3B0aW9uYWwgJ2lycS1pbmRl
eCcgZGV2aWNlIHRyZWUgcHJvcGVydHkuDQo+ID4NCj4gPiBTb3JyeSwgYnV0IEkgY2FuJ3QgZmlu
ZCB3aGVyZSB0aGlzIHByb3BlcnR5IGlzIGRvY3VtZW50ZWQ/DQo+IA0KPiBJIHdpbGwgYWRkIHRo
aXMuDQoNCkRldmljZSB0cmVlIHByb3BlcnRpZXMgc2hvdWxkIGJlIGEgaGFyZHdhcmUgZGVzY3Jp
cHRpb24uIEhvd2V2ZXIsDQphYm91dCB0aGUgImlycS1pbmRleCIsIGl0IHNlZW1zIGEgc29mdHdh
cmUgY29uZmlndXJhdGlvbi4gU28sIGV2ZW4gaWYgd2Ugd291bGQNCmxpa2UgdG8gc3VibWl0IHN1
Y2ggYSBwYXRjaCB0byBhZGQgdGhlIHByb3BlcnR5LCBpdCB3aWxsIGJlIHJlamVjdGVkLg0KDQpB
bHNvLCBldmVuIGlmIHdlIGNhbiBhZGQgYSBuZXcgZGV2aWNlIHRyZWUgcHJvcGVydHksIHdlIHNo
b3VsZCBrZWVwIGJhY2t3YXJkIGNvbXBhdGlibGUuDQpIb3dldmVyLCB0aGlzIHBhdGNoIHNlZW1z
IHRvIGJyZWFrIGEgYmFja3dhcmQgY29tcGF0aWJpbGl0eS4NCg0KVW5mb3J0dW5hdGVseSwgSSBk
b24ndCBoYXZlIGFsdGVybmF0aXZlIHNvbHV0aW9ucyBob3cgdG8gY29uZmlndXJhdGUgcGVyLXBv
cnQgaXJxIHRob3VnaC4uLg0KIyBNYXliZSBjb25maWdmcz8/DQoNCkJlc3QgcmVnYXJkcywNCllv
c2hpaGlybyBTaGltb2RhDQoNCj4gTmlraXRhDQo=

