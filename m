Return-Path: <linux-renesas-soc+bounces-24879-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C03AC73D34
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Nov 2025 12:52:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id D5FF0304F8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Nov 2025 11:52:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 799373112BD;
	Thu, 20 Nov 2025 11:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="kCpiWVzm"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010020.outbound.protection.outlook.com [52.101.229.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4DF62E6CBF;
	Thu, 20 Nov 2025 11:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763639539; cv=fail; b=Nj+GnEm8U7zAVLJJ/k2RvNVYah1rD0aKJzRnQ2n5rI9boKv0l5kJFosbpaeY/OA84MSrmZFTnofzRZl0/fBrw1h7Z1fPcv88zqSdq2qrQMuXv3Dp7qCqfmcPBK+TYWHP/Yu0bX+X5AkPvHKUWQHUKM3gmSYhjzN+SjvmAA5bnGc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763639539; c=relaxed/simple;
	bh=DF8PJj8Ogz5WhAy7QN1fIIzu28wW+YICPZUI28mQhoI=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=SII5dUkaA1eDfz/OFDiv6B0FjkgAGBoO06SCTx9cgv1j4RYMeEnhvNZ6DcmZn675osETx9RS9ikcyprGBOXPJ9K8Yh2WmW3v21ZiV5Ei95XrH6QDCYyTDqC0NBbWhgO+6jlG0ReoAEafMyeY396oLoEbFvns0baVxVZ0gUo2pnc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=kCpiWVzm; arc=fail smtp.client-ip=52.101.229.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fYVsS5ymG1a9Ft2S38T3UR9gblCiu/y2m5yKTIvfIJxj3N13kia+JoKHa7Mg9zkgE4lYn8Y/6e1E/vAaw4zejCwHtg2D6j77vtBOnwNLTYdqrgHc0VI18xV1zZHvipD9/72AC9dz6NLsfHBhF/xNmCXyjQ1W//3KqdlgdoIXbxzJeB4FctGV7S5IBGXoTC1KcOeuoP6jWytD6bdQUDYt4vmUEQ9CD1yfoHvoC+hNTLroW+gy+80980cqmCxPf8+NLBcYpxnkS/thgkUip3O/rErGEzE0yO6UT+IB0jhVX/TstRJO9CveY9FidstKTOcZduA0sC68m4owNCwN5MQIOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BqhMwKl9ayoPhpg8EGt1MFIk5Vb0iHQlx2Jvqol4KUE=;
 b=FW4nCP5pSbwPxjJqmJVFjCf8HnyyWNJmU0x78IfK0IjkDOIcCnyqXXr2Rn73E3x2GVHZ3HFXLQgUkNoZTvb9/CfOw+m5LkMpr+mlmVTv7xKi5217XvT4CDS8zkXj0XkeF45PxxRZqih68eVCczheQOeH416bqiqOuh0mQ0/oLQwjlo4zuQXMd7aRN1aUZhikqmoG7d1vuzz7OzQyp5LUrqYA+Tl5aePJErXZreKFURkb6xgofG/Etybf32MGQ25qDnyXNni3o9wfPpHlQLuyzukft8CJxf/FL+VPy2XGjpdgfnAXag/LAMhkkVZ5fhSBOM/mt2lT4cRM/vxqfB9XIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BqhMwKl9ayoPhpg8EGt1MFIk5Vb0iHQlx2Jvqol4KUE=;
 b=kCpiWVzmc964CniWCy0t7GSrAecqI4+4fbY+kpo1QBDK0HTXXDQgEj2Non6foexvk/3TV4OCigR5lmWwWAaCLo7/TWb0jF8BgYr7UIuYXfd/kWHSl0WeOtes5mkYDJ+HNcs5RiH2MShAy5ErHm4c4D/5R7bFIkvla/qnjH7Guj8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYCPR01MB11636.jpnprd01.prod.outlook.com (2603:1096:400:37a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.9; Thu, 20 Nov
 2025 11:52:09 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9343.009; Thu, 20 Nov 2025
 11:52:09 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	wsa+renesas@sang-engineering.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/1] arm64: dts: renesas: r9a09g047e57-smarc: Enable I3C
Date: Thu, 20 Nov 2025 12:51:38 +0100
Message-ID: <cover.1763638659.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0201.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e5::17) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TYCPR01MB11636:EE_
X-MS-Office365-Filtering-Correlation-Id: d26e3b35-fd11-427e-e067-08de282b3c23
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RHA5eFl1TUs5YnhDZlVXbmRsOWhOMFRGU1pZMmlmWm9oYmM0VUxBMnRwTXZ2?=
 =?utf-8?B?Ujhpdm50emxxeDF1UGVyQXVucm1xY2RHZXFNeFdKKzlXMllvMW1zbFdXcUpm?=
 =?utf-8?B?b21zQ29rVEZ3NllYOXNwRjlIYkpZNENWZFN0MG9wUCtwa2pRUFJXekZlYWR2?=
 =?utf-8?B?YjBTV3BaMk82WTQrRS9OZTFEZzJpTUlubjc1ZXVBOTJsVVBZQU9BazZhcnVk?=
 =?utf-8?B?M2VRenBuTWpqU2F3SlZzWThrMlN5WkdTeEZQWW5FRWZaUmpxeStkZnNSM1RX?=
 =?utf-8?B?U09DRTc3ODV6cllMREREUWhiSlVVRXFRREZOV1JsdG9FL0w2MG5JcUt1MHVq?=
 =?utf-8?B?T3d4RHg0TVRsUEJNNnNSNkpGNEhPKzk3STZydGdTbU42ZEhVSHowNmpIYVhY?=
 =?utf-8?B?L25UamE3bjB5KzZsaVB0N2pDcDc5M2xkRXZCOXllamhXYVg0RVlLdlRrL0x1?=
 =?utf-8?B?VEQyYnRFRm5BODhsaitIK0hWeUc3dVIzM3hIckhreEZEWDBneitpaFJVdFpR?=
 =?utf-8?B?aHhPYksrZ0JhRkZCVHBVemVWQ2JtZzNnRm9tV2N1Yi94T3dtdVlKc0xnamVJ?=
 =?utf-8?B?Z2VlWFMzT043NXozVmxXMTRSaXFzVVNURE03czlBeDJnUHk3LzRFNFdHd0d5?=
 =?utf-8?B?bWJHcmtvRVRhRWFjSGxleE1Kd1QxcjZjS1JoMFllQjI0NEhvU1dEcVBYRENi?=
 =?utf-8?B?WXgyTjdETFhvL2tSeTd1MEpEbmJIaVNHTk1Qc2NtVE85K0o1T3ZlSUhZSE95?=
 =?utf-8?B?RU5BY01SUnRJVHFZSnJ2azNaVkJYODhGN2RWZGphdDA0c2xNcnlxWUxpdUZK?=
 =?utf-8?B?T2RneXg3TzM1OG1oWG5BVkVtVnVZOCs1NEFISUV2TWI1eWJrc001NVRObDBX?=
 =?utf-8?B?d0FUMEJzZG9JZEVuWmhkZ1N3dVBSdU1jaEloNG0rU250SHNjNnc0UnB3R1Vn?=
 =?utf-8?B?ZS8yRUhUNFRoRW9KOFliWm82TWZHd1NOaWZxVWludndFSmF4UkZTKzJ5Q1RX?=
 =?utf-8?B?bzlpZTJ3aDBiVkhzSm5ZTVFZT3BFcFZoSTFLdVk3MlZNdk9jbVdFV2dyb25O?=
 =?utf-8?B?cDBqRy84eWUzWUZhWlFUMm43S2pqWVk2b3NiQ1dLbWFkMHVBQmlVVnFWbzIv?=
 =?utf-8?B?S1lSVEt1QnBuTGJkQ1NHZCtlS2tadEwvbEJSVFVYUElMQzFQUzhEdStNeUQ2?=
 =?utf-8?B?a3Vnd2V2UWFNaVAxNUczRlhBVG9seThzS1g4ZUlGVHY2VjcvWnFMaG80NWJR?=
 =?utf-8?B?KzdHc2IzOUdmMUI5eFNjZzB6RTFTMnQ0bml5d0cxNW9PQ1pTaWNXd1g1Smdi?=
 =?utf-8?B?eWQwRkN5dWJ0Yk5QSVdROVNzTkVPVmlNL2UwZlI4TWFhdUtQUTV2WW1meE0r?=
 =?utf-8?B?T3JmaUMxUkF2VnFva3BlZVVRVGtBQnZ5OTNTbVhKL2RIS2tEajYrOXYwNFkz?=
 =?utf-8?B?TmlYQzNWVW8yWlFsNVlmZjVHUjNnVDY4ejZIcjZENEd2dWp0RFh5Y0Q3ZldO?=
 =?utf-8?B?S2dEQXpxcFFkTHpzTFFlNWswdWpGNTVFS2lybElHNzZZUThMUitMSFJnN2tT?=
 =?utf-8?B?eloranJMMFlhdTc3S2NXZkFkckkwMWNFMENKRmdSSXd6bXZLc1h1VEppejJS?=
 =?utf-8?B?TnRYZWhRNDJ0QXRTR0J6bnRibTJLWDdPdkdiOGN0RVpxRFRNQXA5T0QxcHVH?=
 =?utf-8?B?SnlkWE5sVVordVJObHZaR1VPR2ZpZTRSRGRpQnd4WGg4S296QWVSbE41Q2xL?=
 =?utf-8?B?emdxRERnMlR3MjhHNTdIV0llb2ticGZmM0o0NjNZcmk3NU50dmlTaytsQnFz?=
 =?utf-8?B?cHdXeUN5QmZ4blo4N0N2WUZsS1BLUGtrNnJWcWNOVzJJZjhKVmY1aS9RemJG?=
 =?utf-8?B?RE5kM0hseHhTQXNXYWdGd2Y1REdFNDZYdG9KemR4RmZEcUdUeU1VZ210RWFL?=
 =?utf-8?B?VnlPQVRuSitTNUpPaUVOWkNKM1dRR3BqRXVEekE5UVg0Z1hDdFM4eVlmdGNh?=
 =?utf-8?B?VU0wdUF4c3lEUGlMeWh3STRJUGRXeWxOWEdrb1BCSHozM0ZHWmlEblBUNi8z?=
 =?utf-8?Q?jEJMjL?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U3ZVZGIwOXFnbU5WZjd6MjI1RVNwRW9YUTI4b2FFeUU2c0JXVlNheXd3Y0Uy?=
 =?utf-8?B?bE5BdHBFRDVORGVpeHNYZlNNQkVRbGJSZDhBeGJjSm1tRTMxSGloLzkrY2Vm?=
 =?utf-8?B?cHcwUkV0b0FsbmNSc1ZlU2pDSUo3SUFVYXNVSTdmWVlWYVo3NHlaTTJSZkw3?=
 =?utf-8?B?d21IejJIVTFmem5mNWtXODNRaWxrYkg4a3o3T3ZFSS9GZUkrQzYzWkVrV1Iz?=
 =?utf-8?B?U1A2NlVsTmdxUnpVdDJTQlJvY3hZMnZGckU3WTBUQ3hNdVh1SUNxSCtzRnM1?=
 =?utf-8?B?ZVVkOFczbXh0Z2JLZFVhb3NtQ3Fod1FVc1dMckJTcnpyRndHUmpOQ0FJZEI2?=
 =?utf-8?B?UENMV25BKytIdEpwdkc1VkZRY3FvRFpuVHFGWVI2cURnSU0rd2xacWp3RTVx?=
 =?utf-8?B?a09Wajk5TUo2OG5UcnhFU2I4MWdnQTBnZzlzbEpmd1RIUGU5dXRyWk82Ulp0?=
 =?utf-8?B?QWx1VnpYQnM4ZCt3eEJFcUIxQzJtVE1xY3lQMGJySnhvZ3duTFI4Q0p5U0Vx?=
 =?utf-8?B?T3NjQzk2OVQ4ZUxYQnlKSGJCYWcxUDkwS1pwVHZpYzVOU2NpSHVEZ1lDcnBC?=
 =?utf-8?B?d3VhNHNkRE9LMHMxaEVUdk1kQUJ1MWxPRnF1UThucGdWdEJzclpodzlOSmN2?=
 =?utf-8?B?MlFTNWJkYXFBS1lqUGtvbVMzaVdVMVlMK0xzQlJSWXZMelJTK3NKb3pFK0Qz?=
 =?utf-8?B?QkM1RzZZekQvbHhHbmNoMExCbmpxY1JBY2t6NzdZQVlkK21ENFJrdk5jT1N1?=
 =?utf-8?B?VUJWVkFqQUZsY281V1R2ZWZKVXBhNE84cFdiQlV3enc2RGQ4bUxWV2xkekdO?=
 =?utf-8?B?Sld4aXFnYkNsVkJ1SWlKRFdNeUNRZzBPSFJVZW94ZDhOT0lyeDZtc01VMHpZ?=
 =?utf-8?B?ZnJCeUZqdTI4ekZsSFJmNVgrc0tWNjdDZ1Q0QVRScDNBWFNSdThVcTlWeUJw?=
 =?utf-8?B?MHJpZlhWY3M3UmJRbExyNVA4Z2ducWNnTzNEOHpkTExieXNHWlpNRUptdEZX?=
 =?utf-8?B?aFZwVXNLdjBlSnJyU0lyU1lzcWdEUkFFWFk0NDhRK040MXRyQjl3ZTR6WUVO?=
 =?utf-8?B?RElzMTBuUTlaWC9mb0NDZEVmbmJ6U1M3akFZWjI5OVVRQVlPbEE2aGhNU0M0?=
 =?utf-8?B?elVnZ3U5c0NEWVU4V00vWEg5cXZqSktqNVFEOVAyQ1JTNGVHa2J2ZzM5UFpI?=
 =?utf-8?B?WmZNNk1iSlYyc2h0R1p1QlFSMjlTckFITm9qR3NtVFNWaFVqd2hXZ1BJc0x3?=
 =?utf-8?B?ekF3MkE5NmtlQ2tHekRnS0VHQUdPZkxzaDZWcHZyY2lRQWF5OWdUTC9yOHBw?=
 =?utf-8?B?cW5SanpicW55OEQrQ0xHYmZzYW0rYVlLbEF5ekIrRmVKZjNhdmpoTDQ4REE2?=
 =?utf-8?B?K01ROFdZVkhtYVNlT1AzeG5xN1VRMVk2SmZkNDVOenhXQlRteHplV1RBTDU4?=
 =?utf-8?B?YWx5NGhFUVR1QmM2NFZQd0laNEdJS3BaMjRKMVl0VHd0L1JlSWVhRXozYzFM?=
 =?utf-8?B?TUVScmI0cFFCeWhOTFhHcjBVcnBJK0ZvK0VRZkVuZDlRSTQrYkIrQ1E5TC9H?=
 =?utf-8?B?VXp4aHhCdXRVSjcwcUJnT2cvdEhtS0U1cmNaREphRy9KRkZ0TnA0dXJ2cHZO?=
 =?utf-8?B?QVVtM2pHQmFzMmhVK3BkS1FCYnF3NWM1MFRIWVR2U3o1WVZqSkZvZGFuV3di?=
 =?utf-8?B?MHhnRThHTm1IdGw3R1RGc083QnFqMXM1RlYvYnNSek4zSnRLSnZQZnVZSTlh?=
 =?utf-8?B?alJjWVZDVWdINzMwUllJS1dUekhMUzlRWENjSFQ3cE4zN2xoTGMrMm1WK3JL?=
 =?utf-8?B?RzdpRHgvTWFkWG9ZenFYYnFvUUxpQS93aVNXRTFTbGNZdWtFSm9QMWZCb2dQ?=
 =?utf-8?B?Y3AwcXdFWGI3ODUwZk45aTllTTc4MDRrdjhLYXlMOUZVRHdJMzJPUDdzRVYw?=
 =?utf-8?B?UEFXRm1UYU5mb3RwQnFoWkVER3VVR2hZYkhpWExaQjA4emZLWVJhVHNrMSsr?=
 =?utf-8?B?NHRpdlZBZEx6WWU4VjdSanlZMmNINldBa1phQlZyRGk1TkFxZldaSEpLVjh0?=
 =?utf-8?B?VXpCSDNYc1ptMTh0cjRLOUc2dzk1R0c1YjBIaEVILzBBRC9GNDdHczhlbGxU?=
 =?utf-8?B?VXd5d0FqZk44blh1UzRkbXMxdzdZVDNsb0JmeVBhbTV0dGtIY2F4bW5qczVw?=
 =?utf-8?Q?YW+uPkBCcfJpJjSAi978h1k=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d26e3b35-fd11-427e-e067-08de282b3c23
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 11:52:09.2096
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zNyoUDP23H5oIo1tim15RXMHTwiHhpy/OMcPSJlDh3X0Y2ctNjdvS3JBIDkncw2RCBcE8ViYesjd8GUR82XcLqgkn31Qw9/qcnC6FeARQ7IaNQAI2xHYa9jr+ugkKfzV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11636

Dear all,

This patch enable I3C support to the rzg3e-smarc-som.dtsi.
Tested using NXP P3T1085UK-ARD connected to the RZ/G3E SMARC SoM
via the RZ/G3E SMARC BREAKOUT board.

Using the following connections:

 RZ SMARC Carrier II (CN1)  →  RZ SMARC BREAKOUT board
 +--------------------------------------------------------+

 RZ SMARC Carrier II (PMOD1_6)  →  P3T1085UK-ARD (J9)
 +--------------------------------------------------------+
 |    PWR_PMOD1  (pin 6)    →    (pin 9)   +3V3           |
 |    GND        (pin 5)    →    (pin 7)   GND            |
 +--------------------------------------------------------+

 RZ SMARC BREAKOUT board (CN1)  →  P3T1085UK-ARD (J13)
 +--------------------------------------------------------+
 |    GND      (pin 2)    →    (pin 4)   GND              |
 |    I3C_SCL  (pin 3)    →    (pin 1)   SCL_I3C          |
 |    I3C_SDA  (pin 4)    →    (pin 2)   SDA_I3C          |
 +--------------------------------------------------------+

 The following jumpers setup is required on the P3T1085UK-ARD board:
 - JP1: 1-2
 - JP2: 1-2
 - JP3: 1-2

 The following SW1(1,2) switch setup is required on the RZ SMARC BREAKOUT
 board:
 - SW1(1): 1
 - SW1(2): 1

Thanks & Regards,
Tommaso

v1->v2:
 - Dropped overlay and moved I3C support (pure bus mode) directly to the
   rzg3e-smarc-som.dtsi as suggested by Wolfram Sang.
 - Removed alias as suggested by Wolfram Sang.

Tommaso Merciai (1):
  arm64: dts: renesas: rzg3e-smarc-som: Enable I3C support

 arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

-- 
2.43.0


