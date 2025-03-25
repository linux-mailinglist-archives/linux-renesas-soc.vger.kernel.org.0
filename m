Return-Path: <linux-renesas-soc+bounces-14796-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 402C1A6FDC6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Mar 2025 13:47:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CB4D0841B07
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Mar 2025 12:40:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A279258CD6;
	Tue, 25 Mar 2025 12:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="OnVoo4IH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011057.outbound.protection.outlook.com [52.101.125.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE959258CD7;
	Tue, 25 Mar 2025 12:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742905384; cv=fail; b=RDDHXirdSrXdLbuF6KH+iHklnd6Wkoe7nP6lFp3qjluG8CdjIrrYOYs7plnX9xMFJ94B9hrevdvK509AAyff7lk8AWUdikPoGj0U51txAGTTnB81e0cHUQpDSvzlT7z9OsLcYX4c396KkQmXtekpPYOUsixiQqI7MCk3FQdUeZo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742905384; c=relaxed/simple;
	bh=C4XmlGTiqtocbAeMhdY1LUD17YA1DhB+MVddAL0a0so=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=HY2HefMwgou0CsIZtuTC2A1nkUnSQVPBX2JMMagfw6kyfT9W7mTiH93NnIpnCcqeYEppxDB91v6r6koi9KwyGe4zJUO5cODvUQVLKCW8B0TM0vPJpzwakkhaikRbyoS5POWnJKWGUo5QesJggSImen7wlCVZiuXy1Hhwpw1OEHg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=OnVoo4IH; arc=fail smtp.client-ip=52.101.125.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AkKHOj+DYbAOC+6g3sUpRg/RUr0ooxUkMDyphCn7qxXZ+y2P0DElNrB4jMqUxyYl2m36HZeuhr5A1uItDmSS017KuB3PXvLm7UJjE3PqgK+jEScRIrZBwkM89/UFYT2uKmhqysDGcV7SuXjK/bTAZrjzqODTKFAIv5TmIMIml2DT3xeVWwNXcuL6CYJNn2mUNFUHuTyjkIZmCgEMzUoPwRBYDTwkpWRN6FXbTUWJ3y9B9+djc7wbkg4X9p46/s1NdA26oZikhCVu487AZjFMPzQISIx/Pfw8zruXerujhT94JJ0mivLAOLwv+HuVVSETPiyo5olUB8up/ZB1DSsmTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C4XmlGTiqtocbAeMhdY1LUD17YA1DhB+MVddAL0a0so=;
 b=eawraDA3TcXdfhIMDP33xdi/n1CoDAGAAzHX7Snq9Z2hOvrQeL+UKlAcYGxh7PNTBdGzgYu1t6kkLDCPdRHPhDgBg6QGM+sNxAphFqztSPh3hmNJjbwDDZ4zTg1fIZOsGTau79NZLvYDQhSuo5tPsMa3KT25+7kXAiLzTfeKMuFCjjWM+I4Kb0kFnmDtHV9WDtTJjl5QpwMdxMb3XN3YyluE0uCZlZxIktFvdoWUl/kH5cYLYzZFEkQoqL24aXdwF02GT5ohP6zdwzPTqgEkxlounWHywOXDssOE7Gpx2UftQdTz8B1BGJ8LRgWlnw4DgCdBX03xl/L3IMSrJZP9Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C4XmlGTiqtocbAeMhdY1LUD17YA1DhB+MVddAL0a0so=;
 b=OnVoo4IHn68wOlXV+7gwUc59lvsHZM7Ji13vJDfwyvNjexyuIxrF6rgOy6uLgEO/5vLCqmevOJUGlLi5hdD0PDNbwC0dTxjr6j1Mv1stAy+9Rf5xkmlfG6N49aT0i9G2CSBHKvqwZgiSWwI4OKoiVSHLrFliRArxFYs0wEGl8O0=
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com (2603:1096:400:3c0::7)
 by TYRPR01MB12207.jpnprd01.prod.outlook.com (2603:1096:405:fd::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Tue, 25 Mar
 2025 12:22:58 +0000
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::7497:30af:3081:1479]) by TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::7497:30af:3081:1479%5]) with mapi id 15.20.8534.040; Tue, 25 Mar 2025
 12:22:58 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Stephen Boyd <sboyd@kernel.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>
Subject: RE: [PATCH 1/4] clk: renesas: rzv2h-cpg: Add support for coupled
 clock
Thread-Topic: [PATCH 1/4] clk: renesas: rzv2h-cpg: Add support for coupled
 clock
Thread-Index:
 AQHbjCwSQtFnS5HRQ0O4YyzU/N2JT7NlMPsAgAC1N4CAANHqAIAAiUfQgAsHYUCACmTiAIAAsbuwgAW2pQCAALNw8A==
Date: Tue, 25 Mar 2025 12:22:58 +0000
Message-ID:
 <TYCPR01MB113325BE576B7B4D4D3378BC186A72@TYCPR01MB11332.jpnprd01.prod.outlook.com>
References: <20250303110433.76576-1-biju.das.jz@bp.renesas.com>
 <20250303110433.76576-2-biju.das.jz@bp.renesas.com>
 <1347ee4d678ce81c33917b3802601aee.sboyd@kernel.org>
 <TY3PR01MB11346C31C2533FD074D87BBD286CA2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <98c8c1eab30fc333974bd1ad88791356.sboyd@kernel.org>
 <TY3PR01MB113469E04E10E3D14FB3F69F186D52@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <TY3PR01MB11346D2881A8CC9C3019C978386D22@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <983e0e616d62f236dcbc3eecbeab5ab4.sboyd@kernel.org>
 <TY3PR01MB113461FA9BBF036D285AAC8F386DB2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <a6bd517263b66bc69a72d74aeb88cbf5@kernel.org>
In-Reply-To: <a6bd517263b66bc69a72d74aeb88cbf5@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11332:EE_|TYRPR01MB12207:EE_
x-ms-office365-filtering-correlation-id: 5ab1e9cb-d6d8-4574-84ff-08dd6b97c749
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?UTkzUnp6a0UyT045RndEY3Izd3UvVk4wcWdMRUx1bWhkUnpjY1R5QUJpZnFo?=
 =?utf-8?B?UGpDRW1ZQUpTQWJ5M3dMRU1oZ2pJQmQyNnlRcURJUDhIaTN3MFJnYkQwMzZx?=
 =?utf-8?B?NUNQaWZzaldEdFh5endVZk00cW1ZOWRGRmpXTWZyUlVGSVVoR0phYmM5dkc1?=
 =?utf-8?B?OXh3WTY4RzI2QmNsSWtvVkxOejI5UDVZYXlQeWVZVldwT2llbFNXTXVrV0RB?=
 =?utf-8?B?ZWF1N2R2ZVJ1TGE0RGI4TDQ3aWMxbFVkMEwwR20zWkYwb2FaLzBnd0Y1VUl3?=
 =?utf-8?B?SlJlL3ZmOVFWRUpCeVA4ZGpPcWNLTW1ZQzdPR3djOVdrSEROK2JnSUsyS0c4?=
 =?utf-8?B?dUNZN0RGRFFKeHQ3dm5GTXRIY3Y4eTZ0RnkvWUd3djdjcXJBY0QyM01BMEo5?=
 =?utf-8?B?NE14MThmb1cvbytzcXlIQVQ3eDlCeGVWbGd1eEtBQzczUkhGTlA5ZEhXMHRv?=
 =?utf-8?B?TEt5djF4NjBvS1crYWF4Wmw0YUd4TTVkVWlQaVVXQWM3cGp4R2ZJaVd2MU1y?=
 =?utf-8?B?VWVnOW11ZkpGRFpmL2JyV0VsUmZzOXV1bFlVR3hPUkJjajZBUlBYajMvVFhZ?=
 =?utf-8?B?M3ZRY0ZaYzRXR2JEUzQyQkN0dzJUUDUxcEl4cHZmVkdsMVdEKzVjOC9WdTFN?=
 =?utf-8?B?SDJ1VFcza0Z6UERjQnFrLzZDQzYreUV3L0xkS3JHdm9kT1pncmhpeG52RExC?=
 =?utf-8?B?N3duMCtZRUlKS21xSHRERTBGNDlUdGpqZWlvM2Z3VC9OS2NacGt2RWhlTWdn?=
 =?utf-8?B?RUJ0c0hVVHh4bDZHUGk4WlZlVjNPOXFsNkdrbWJGZ09VZkhkU2ljaWM1VVdi?=
 =?utf-8?B?c2g0b1VzSTFhS2IxaDVrWDlqQ0p4VjVXOUtGc2dpSDZpUDBvZGt1VER5QlVh?=
 =?utf-8?B?ZldUYURVWHlXempNdStQdEgrU2F1LzRxL0djMGVZbTdqWTRpL2FtcmVQa3Rk?=
 =?utf-8?B?VXBZSjRpWmlTdWo0SER6Ti9QdmU5MlJKNnlhNXd3T3lpMjdOVDhrS25yUXds?=
 =?utf-8?B?dTBHWXQ2ZGJLTi8zaVlhekRaQXZWenBzVk5nczEreWMwN3FBWHhQWVdpbXNo?=
 =?utf-8?B?VEtaWkM5TFRWdEE5alh6OFZEcWxocUVReGU5WmhDVkExMXUwM1FPNW0rM3I5?=
 =?utf-8?B?T3cwMzJGcExzQmVPbXhick5rOXQvdmx4YWhMRVpIZ05lREFyZERneEdhYXc5?=
 =?utf-8?B?cHFEaXlkdGZsTjdUdGR6Tlhxcmwxa3BLdklMYmxSRTVzT3p0VzI3bmN1UGIz?=
 =?utf-8?B?ZmJteEp3OGFuMnRmejlsM293SllKR1haTS94akIyTnlqT3dvTEUwTUJkUEdS?=
 =?utf-8?B?YUpOVFhzNnNxZE9kdmxyT0ZEdUl0NkRNR0g2SDdWRWlxVWdzd0c4cDM3eVAv?=
 =?utf-8?B?WWc3dytWQ3FKTFpFckgvT1lXZDZGbVloV2QzTVRZS2Q2K2tkQ29oVFE2Vkx5?=
 =?utf-8?B?WS9wZXNCVGdpNm01S2FpbXdPSk5TMWNadllQNE1PMCtiRDJuOWkrRHdKb2l3?=
 =?utf-8?B?aFZMbHIreDFBaWdJRE5xcnJCQmNCQlJzSUhQWkN0THl5TnR0dlFwdVZ6MVVp?=
 =?utf-8?B?UEdVcUkzcm9LZWUvSVdWY1E0RGdMSWJUaXlzTnJMWU9ncUtZVkhpY2VsWUR1?=
 =?utf-8?B?dThzUWFkTW50M3dpVS9IamhGcE5ha2x2V2RjTnBaSEJwZ2kzcVY4L1ozWHFz?=
 =?utf-8?B?TGNSNkJZd1VvM3JKN1BWTzg5N1ljTFV3K3V1UnZCay9aQXBmN01yR3hpSElT?=
 =?utf-8?B?Q2d4TVE3ZG1EM0RYR05UZVJlVDNkUFprUXRNYWVRbThpaUVWdHoyNVh3ekFn?=
 =?utf-8?B?Wk5xYkZHRjZvOTFUbDNnK3FFdG9nM3diazgvbktVdnozVWMvdEg5eXF6RnJv?=
 =?utf-8?B?dFhMM25ONVNpcmNpY0tJWVVROUN1UWFPOTZaTTA3WGlZa2o5NWtxUEhNcTR3?=
 =?utf-8?Q?5k0c4lfWj4lJF9Ir35MuKlq1C4YKDB3Y?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11332.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NXUxbk9hVUhYRnNNQ1krbjhObXp6NGVjWHNtSHVUUU1neGRWR2h3NVA0d0xD?=
 =?utf-8?B?c0tZK2VwVUtyWmpHNjIvcVJZNnVXWHExLzNGM1ZHUjFNb0FiUkh6cWdMa2Fl?=
 =?utf-8?B?UzBpVlJ4Z09LWkIwUVN5S0FZcEFmaWlIVDd2bm1BVEZSeXhqdFJva2orSUVJ?=
 =?utf-8?B?OWJlWXpWNlB2N1psR1RjZVloaVkvdTNCQUt0WGo3VnEzUWVxTVNYdlUyd0xj?=
 =?utf-8?B?OXZERFM5Q2Q0NnowOTZrNjF5Qk9LRU15clZ2dEFpT1NYcE15RFAwVFBqQ2R3?=
 =?utf-8?B?aHJpYlpMQzFPTVNMMEtYV2RES0pDaUR0Z0FxTy9ZU2Zsc2NFRzd5Q1ZjakZW?=
 =?utf-8?B?QU1sQnRaellNU1draUQwZEpQeENuS2hibU1VV1lEa2w4dHp4eXV2eWFpN3N4?=
 =?utf-8?B?bXBrTklWdHpvL1NtdTFWMlpMRzBRK1pmQU9tbzIzUEZRcTBHVHV1dERuMEg4?=
 =?utf-8?B?NjV6MGlSUzBGN0VrVTJmd21PeXhjL0JqNzVjMnVTWms5N3F6MEIvN2FXbGFx?=
 =?utf-8?B?WjdVZlI5cU5RNVpLYjB5c0V3TklsOEVoVzlCYzYxODN6emRuSUVIUjVBUVBZ?=
 =?utf-8?B?UXhOQTIrOFBSTC9WSXlhQlpHY3Q2UEdDRC82VXRvRlk1RnE1ZDYvZ3V0aW9L?=
 =?utf-8?B?d1p1YmM3U2dsYWdYTXkrdEdoVU1jdjNVbzVLY1FRMVR5VHJTaGkzQVRWUlQ1?=
 =?utf-8?B?TFVnZU5ocUlDUjZKWFhPK1B2UzFBa0dVTzZRRk5ZZXdPUkQ0Z1JzQjBFQUVD?=
 =?utf-8?B?RlFjR3NseTkrcW5pRFRmYmNwbXB2RUhQcEh3MjBhRXhXUEJ0bVFMbWxwTGpF?=
 =?utf-8?B?SXFuNmp3U3o4S0wxT3J4TjFaWDZVNU5xWm1zaXA5MGVpQjZ0SVM0TjNuZ2JV?=
 =?utf-8?B?QllRUnh5bXovcTNaNW0xRUhaOCs4SWRrUlI1N1pIdnJvNVpEN0hwcStGZW1r?=
 =?utf-8?B?TXpuT3h1Z29qK09lMWx3Q3pBQTNqOVRuTVBPdTdOTWRHUklDdFBjUHlMUFVX?=
 =?utf-8?B?amo0SURMZkozK2VRR2RYOUtDdmYrZ3hrNFJxZjk5UDBkWkFNSHNHR2hvemd4?=
 =?utf-8?B?M0EvOUVPTmhKMkYvbXd5L3VWK3RVRkkvc2ROOVRZeGhic1E1YXplR2o3dlZO?=
 =?utf-8?B?akRVRitpYng5TDZGVHZUVXdiaXJsZGZjalkydmt5dFF2dzhyTEZUclozbWJH?=
 =?utf-8?B?Qmduc2FLTEg1bU85T3NRMnh4bFhxZXBuWmtlRVVsMks0OXNZd092VFlTdmZX?=
 =?utf-8?B?YXNmdWNmTThXZUo1RzNDZXpMdEp5Q2lFVXUvSjlBYStVc0V0OE52S2F2V2w0?=
 =?utf-8?B?WVkzZlYxTUI3d09ERWpjV3lDdUIrQW5YYVhpYjcwdUFPR053dkpybHdiWHVR?=
 =?utf-8?B?eFVCd2ZjNUc4blRWQWJHSmoycTVnTW1aRk51c001RW5YdG1HMXBtSTVUOC9E?=
 =?utf-8?B?aHRYSVQ5Z2xBdEx0Zk51aG1YM2dVUytncSt4eTUwcEF3VVAwekowMklpemRh?=
 =?utf-8?B?N3BFc3NIb3dvU2xwZTIrQmN0MTh3M1ppSDhsQ0I1NEZ5VUs4K1ZqMk5TeC9C?=
 =?utf-8?B?bEdWZnk3RlNGcGprUzNmRmRzbHN1ODBhMjF4RDJFQVBnQkZlMGhwUWFLVGwv?=
 =?utf-8?B?NDhDc3NIY2hOUWlyenZSa2hGQWd1bFBCUFovL2liYUE1VlhwZEFsN2tVa2Nv?=
 =?utf-8?B?VTFESmpaWWxZV3o2MWtBS0p5RXN3ZEhpRlhMMzZGcGFwZ3hWcUVSL2FtTmlC?=
 =?utf-8?B?R3liWE9xcHRGY1pTMitpQS9GR1ZTWVNGS05Vb056eC9xS0tZMmRWc1JzNWFN?=
 =?utf-8?B?bTY0SlI1M1NkMHo1VzdTRDdROEU1UDN0cUM4WW5lei9Pb3krYXQrRHpvZ0xR?=
 =?utf-8?B?U2h5bTUydGJNNDFlMUMvWE5hL0VIeGM5YW05enlGZjZTcVBKNE15ZXorbzhS?=
 =?utf-8?B?WFo2OUJVRWo1aWgwcmNRZEhsdmN2REVralBSZGtxcTZpUjFSMlRqWGFCWlF0?=
 =?utf-8?B?N1ZsaG1uWVl1b2JlUHJHNW93N2ttbGpsc0t5Q0dWTExiSDBYU25DcDhlZita?=
 =?utf-8?B?NWFOY05jb1ZETUoxOFhxY2pnamFvVVdXNWlkcitEMXMxN09vUElqL0p0NEE5?=
 =?utf-8?B?MGo4MjJmT1owWmdVMWVjVGZpNmJPWHF3RE5YUEo3S1lYSUhLcHVrZFJ6azk3?=
 =?utf-8?B?MEE9PQ==?=
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
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11332.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ab1e9cb-d6d8-4574-84ff-08dd6b97c749
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2025 12:22:58.3775
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3XH1og24//h//Z3+KhaCRCtnPwxv8FIQOWx8LbOb94cvooY/e6PWQ/y9iPOMUYmQCFLSbzfpdPXKXJdsdUsZSBZdhMTCmQ3PWN86LepIHrY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB12207

SGkgU3RlcGhlbiwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBTdGVw
aGVuIEJveWQgPHNib3lkQGtlcm5lbC5vcmc+DQo+IFNlbnQ6IDI0IE1hcmNoIDIwMjUgMjM6NDgN
Cj4gU3ViamVjdDogUkU6IFtQQVRDSCAxLzRdIGNsazogcmVuZXNhczogcnp2MmgtY3BnOiBBZGQg
c3VwcG9ydCBmb3IgY291cGxlZCBjbG9jaw0KPiANCj4gUXVvdGluZyBCaWp1IERhcyAoMjAyNS0w
My0yMSAwNzoyMToyNCkNCj4gPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gPiBG
cm9tOiBTdGVwaGVuIEJveWQgPHNib3lkQGtlcm5lbC5vcmc+DQo+ID4gPiA+ID4gPiA+DQo+ID4g
PiA+ID4gPiA+IFRoZSBwYXJlbnQgY2xvY2sgcmF0ZSBvZiBzcGkgYW5kIHNwaXgyIGFyZSBkaWZm
ZXJlbnQuIElmIHdlDQo+ID4gPiA+ID4gPiA+IHVzZSBhbiBpbnRlcm1lZGlhdGUgcGFyZW50IGNs
aywgV2hhdCBjbGsgcmF0ZSB0aGUgcGFyZW50IHdpbGwgdXNlPz8NCj4gPiA+ID4gPiA+DQo+ID4g
PiA+ID4gPiBBbHJpZ2h0LCBnb3QgaXQuIERvZXMgdGhlIGNvbnN1bWVyIGNhcmUgYWJvdXQgdGhl
IGRpZmZlcmVuY2UNCj4gPiA+ID4gPiA+IGJldHdlZW4gdGhlIHR3byBjbGtzIGZvciB0aGUgZ2F0
aW5nDQo+ID4gPiA+ID4gcGFydD8NCj4gPiA+ID4gPg0KPiA+ID4gPiA+IEFsdGhvdWdoIGdhdGlu
ZyBiaXQgaXMgc2FtZSwgZm9yIHNvbWUgcmVhc29uIHRoZWlyIG1vbml0b3IgYml0DQo+ID4gPiA+
ID4gaXMgZGlmZmVyZW50LiBTbywgdG8gY29uZmlybSBjbGsgb24gc3RhdHVzIHdlIG5lZWQgdG8g
Y2hlY2sNCj4gPiA+ID4gPiByZXNwZWN0aXZlIG1vbml0b3IgYml0cy4gUGFyYWxsZWxseSwgSSB3
aWxsIGNoZWNrIHdpdGggaGFyZHdhcmUNCj4gPiA+ID4gPiB0ZWFtLCBkb2VzIGl0IG5lZWQgdG8g
bW9uaXRvciBib3RoIHRoZXNlDQo+ID4gPiBiaXRzPz8NCj4gPiA+ID4NCj4gPiA+ID4gQWNjb3Jk
aW5nIHRvIGhhcmR3YXJlIHRlYW0sIHRoZSBzcGl4MiBjbG9jayBpcyB0d2ljZSB0aGUgZnJlcXVl
bmN5DQo+ID4gPiA+IG9mIHRoZSBzcGkgY2xvY2ssIGFuZCB0aGUgY2xvY2sgT04vT0ZGIHBlcmlv
ZCBkaXNwbGF5ZWQgZm9yIGVhY2gNCj4gPiA+ID4gYml0IGluIHRoZSBtb25pdG9yIHJlZ2lzdGVy
IHZhcmllcw0KPiA+ID4gc2xpZ2h0bHkgZHVlIHRvIHRoZSBkaWZmZXJlbmNlIGluIGZyZXF1ZW5j
eS4NCj4gPiA+ID4NCj4gPiA+ID4gU28gdG8gY2hlY2sgdGhlIHN0YXR1cyBhZnRlciBjaGFuZ2lu
ZyB0aGUgY2xvY2sgT04vT0ZGIHJlZ2lzdGVyDQo+ID4gPiA+IHNldHRpbmcsIHBsZWFzZSBjaGVj
ayB0aGUgdHdvIG1vbml0b3IgcmVnaXN0ZXIgYml0cyB0b2dldGhlcg0KPiA+ID4gPg0KPiA+ID4N
Cj4gPiA+IFRoYXQgYW5zd2VycyB0aGUgaGFyZHdhcmUgc2lkZSBvZiB0aGUgcXVlc3Rpb24uIFdo
eSBkb2VzIHNvZnR3YXJlDQo+ID4gPiBuZWVkIHRvIGNhcmUgdGhhdCB0aGV5J3JlIHR3byBkaWZm
ZXJlbnQgdGhpbmdzIHZzLiBvbmUgY2xrPw0KPiA+DQo+ID4gRnJvbSBzb2Z0d2FyZSBwb2ludCwg
Q29uc3VtZXIgZHJpdmVyIGJvdGhlciBvbmx5IGFib3V0IHNwaV9jbGsuDQo+ID4NCj4gPiBTbywg
dHJlYXRpbmcgYXMgb25lIGNsayhzcGlfY2xrKSBzaG91bGQgYmUgT0sgYW5kIHdlIHNob3VsZCBk
cm9wDQo+ID4gaGFuZGxpbmcgc3BpX3gyIG1vZHVsZSBjbGsgaW4gdGhlIGNsayBkcml2ZXIgaW5z
dGVhZCB0cmVhdCB0aGlzIGFzIGFuDQo+ID4gaW50ZXJuYWwgY2xvY2sgKCIuc3BpX2Nsa194MiIp
Pz8NCj4gPg0KPiA+IFRoZW4gd2Ugc2hvdWxkIHVwZGF0ZSB0aGUgYmluZGluZyB0byBoYXZlIG9u
bHkgMyBtb2R1bGUgY2xrcyBpbnN0ZWFkDQo+ID4gb2YgNCBieSBkcm9wcGluZyB0aGUgc3BpX3gy
IG1vZHVsZSBjbGsuDQo+IA0KPiBJIGRvbid0IHNlZSB3aHkgdGhlIGJpbmRpbmcgaGFzIHRvIGJl
IHVwZGF0ZWQuIENhbid0IHdlIHJldHVybiBhIE5VTEwgY2xrIHBvaW50ZXIgd2hlbiB0aGUgZHJp
dmVyDQo+IGNhbGxzIGNsa19nZXQoKSBvbiB0aGUgc3BlY2lmaWVyIGZvciB0aGUNCj4gc3BpX3gy
IGNsaz8gDQoNClNhbWUgc3BlY2lmaWVyIGlzIHVzZWQgZm9yIGJvdGggY2xvY2tzLiBTbywgd2Ug
Y2Fubm90IGRpc3Rpbmd1aXNoIGZyb20gRFQgZW50cmllcy4NCg0KPiBUaGVuIG5vdGhpbmcgd2ls
bCBoYXBwZW4gZm9yIHRoYXQgY2xrLiBJIGd1ZXNzIHdlIG1heSBuZWVkIHRvIHJldHVybiB0aGUg
cmF0ZSBvZiB0aGUgc3BpDQo+IGNsayBtdWx0aXBsaWVkIGJ5IDIgb3Igc29tZXRoaW5nLCBidXQg
dGhhdCBpcyBmYXIgc2ltcGxlciB0byBpbXBsZW1lbnQgdGhhbiBhcmJpdHJhdGluZyB0aGUgaGFy
ZHdhcmUNCj4gd2l0aCBjdXN0b20gbG9naWMgYW5kIG1lZXRzIHRoZSBzYW1lIHJlc3VsdC4NCg0K
DQpNYXliZSwgZHVyaW5nIHJlZ2lzdGVyaW5nLCB0cmVhdCBzcGl4MiBhcyBhbiBpZ25vcmUgY2xv
Y2sgYW5kIHN0b3JlIGl0cyBwb2ludGVyKGVnOiBzaWJsaW5nKS4NCg0KRHVyaW5nIGdldCgpLCBy
ZXR1cm4gdGhlIHN0b3JlZCBwb2ludGVyKGJ5IGludHJvZHVjaW5nIG5ldyB0eXBlIENQR19NT0Rf
Q09VUExFRCA9MiBpbiBEVCkgZm9yIHNwaXgyLg0KVGhpcyBuZWVkcyBiaW5kaW5nIG1vZGlmaWNh
dGlvbi4NCg0KTm93IHdlIGhhdmUgY2xrIGFuZCBjbGstPnNpYmxpbmcgZm9yIHNwaSBhbmQgc3Bp
eDIuIFdpdGggdGhpcyB3ZSBnZXQgcHJvcGVyIHJhdGUuIA0KDQpbICAgIDIuOTI3NDg0XSByenYy
aC1jcGcgMTA0MjAwMDAuY2xvY2stY29udHJvbGxlcjogY2xvY2sgKDEsIDE2MSkgaXMgc3BpX2Ns
a19zcGkgYXQgMjAwMDAwMDAgSHoNClsgICAgMi45NDU3MDZdIHJ6djJoLWNwZyAxMDQyMDAwMC5j
bG9jay1jb250cm9sbGVyOiBjbG9jayAoMiwgMTYxKSBpcyBzcGlfY2xrX3NwaXgyIGF0IDQwMDAw
MDAwIEh6DQoNCkVuYWJsZS9kaXNhYmxlIGNhbGxzIGlnbm9yZSBmb3Igc3BpeDIuIEJ1dCBpdCBy
ZXR1cm5zIHByb3BlciByYXRlIGZvciBib3RoIHNwaSBhbmQgc3BpeDIuDQoNCklzIHRoaXMgYXBw
cm9hY2gsIG9rPw0KDQpDaGVlcnMsDQpCaWp1DQoNCg0K

