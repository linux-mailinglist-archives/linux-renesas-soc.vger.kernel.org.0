Return-Path: <linux-renesas-soc+bounces-24726-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E4FBEC69FDF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Nov 2025 15:32:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 1B27A347B9A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Nov 2025 14:28:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 617E635CB8A;
	Tue, 18 Nov 2025 14:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="b+XmBRH6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011054.outbound.protection.outlook.com [52.101.125.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 889AA35C1B1;
	Tue, 18 Nov 2025 14:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763476052; cv=fail; b=fSBhBHqA2ZPAicrEKHaOO4o0JoVA5bxNAvBxvYmDPA8GFjA+haR1+5avLAahHeRGlQDjyGVi13nFDKUCUxDBBPbWg+0KA4v1REwlAtzEg9i0E2TSE7QCrc0yyMkj2GyZPY8bD496upYHsSppkiisHwbpYkXJQAjGIL66P01qQJU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763476052; c=relaxed/simple;
	bh=rQbd3gu6WqmaUN86AT0Gb8JCWdE0YAEhUgB3dI11HcQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=H54R3FkzTag/y09mpUo7255Y9Abfb9JI0GZ1+sBK/DP2+yqpGsFcIrgHVZbc/2oSyIoU9TSSC2d9AXUzatu+QeDX9cQRob6dszOcMwzPY0d27FAcKXaecPNyJlADAOyGYen6+ddcgIVv0sFTy6rwbkVmbVWqO8L7Tru98VmCogI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=b+XmBRH6; arc=fail smtp.client-ip=52.101.125.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NQHY1uaU93RKeedURWDN1dzbgMLYguU+khZRL4FQnpQ4bKRviAIfRupjTr5lAmK38i34OZxy9kZlOtg1sYkxpD8YgO8CGUXh938YV4GDdr+xK9jjti/Dlm8TH1xEJoaNoYkORQhl9v3RlAAR51C0DhYQ4u2ToA+nzQzrKG+isgQ+Vqps+NCgf8fhIdlBs4ecnHs/VQflP70Dm23GLnT97RcPLheC0Lwq6ITuE8273c66VDo+EjZsPXkz+k6FhA7aocM5eZaq64aAIewqrPT9kQLTlDpVBoCYQZHqk70ny0A3QRs9AYRJ3Pn+7j54lHKYn1kkAa48FLL+UwGh/LqPbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wZKOc4dGOqXuY9VsBsvpUrAlYSc5PODy6MAKvluqZUQ=;
 b=SMuY7dgsymk1btlaFiQvoxdZS3Re/dezQPdiWjieArXGmUS3/E/jB6blH/rs5mIcdjxNeR96bhkONO0akvz6pYe9AXpkfyeET8Wbeod1Oe5ztU6AYpdzNNKtUSclKzNpmYg+aOpyWUHYcT8pOduchi5o1/sLQD3NZDuFeC/Za/tsjn3xzwzpmrf5FLhGAPxDjnZH9JYJaHZODSn6WBmamlLzhjpcPipOhzXSVclk6o6QYJuF86tk2fneHMK81+mAYiWleK0WXL/NrI23/1281tdPvy4Es/eWcEIVknMWEHc1PlnCn/y8nEm8fD++WdfTvR2fpTg3TslVorfMhLajAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wZKOc4dGOqXuY9VsBsvpUrAlYSc5PODy6MAKvluqZUQ=;
 b=b+XmBRH65XPX0lGIxReyQ3cdg4ZiFmGLt9mJD3Za6/Bz8jVKZ4hCi9oanEqZrAYz7W8Bc63mcOdA5ztJFZm17O23eCK6Fh5y5al6ZL8c/82++tUrbBBqDhOUGrSzsg/nq0uQEm5jq4l9HT6kWTZNgCko018L1Xz4xpR0zXyEAqw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OSCPR01MB13363.jpnprd01.prod.outlook.com (2603:1096:604:331::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Tue, 18 Nov
 2025 14:27:26 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9343.009; Tue, 18 Nov 2025
 14:27:26 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: renesas: r9a09g047e57-smarc: Add overlay for P3T1085UK-ARD
Date: Tue, 18 Nov 2025 15:26:39 +0100
Message-ID: <0babc991d3b2163200bc083ef80563931d4b639a.1763475830.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1763475830.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1763475830.git.tommaso.merciai.xr@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0129.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::16) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OSCPR01MB13363:EE_
X-MS-Office365-Filtering-Correlation-Id: 66b39b45-f53b-4bc9-a8b7-08de26ae98b5
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YktZWkxrS0FLV0R3UUFlUk9iY3B0UDF2OXo0c1ZQUW53bGZWL0ptSU5OL0pP?=
 =?utf-8?B?M1phVUZSVGZZQnRIbFRaWWRlNVJPMVh1OWM3eFhYVkFQbG1YV3E4ZVZVUUZi?=
 =?utf-8?B?VEozcmI1enA3aHRNOEtFbGk0cnhlYVo5ODBxemNGM1lpZ3Z2THRCcE5ZTTJC?=
 =?utf-8?B?bjBuYmFHWEdaSFVsVVZmNmRhdGZHOTZXeVIrS1YwMUQ3ZXYzVy82aG1ya1VG?=
 =?utf-8?B?ZmFLVEpaZkhDNFZUbUc3K3k4eUw3ZlJkeU91RVVjbk42VXVpOWdDR2JIM2FW?=
 =?utf-8?B?OVc0TTBZbUIxcHRsbE94VnB5S3MzQk1ZWFJnWGhLNC9XWWxUeTJpa1BvTURH?=
 =?utf-8?B?UllveXdOMCtXQnJHY0N6eHpHa2ZDVXkvcnl6NkE4TjNkZGd3MmNzUUc0bW1F?=
 =?utf-8?B?TDVMQVY3d0ZYVmQ4RGdPVlp6Y3FCUEc3VzdPd1ZTZkRUS1B0dGNPdFdRUHpB?=
 =?utf-8?B?SmQvNVQxdlptTUhuenk0dGpIRkpjRU4vSXFiOHhHYWkvK1pJQUp3NW9qSTdR?=
 =?utf-8?B?R0wwaFdpN1NFeGFhMkNBSm9CMWhDTERUbURlYUx3WW1xRWFXTnA3cDJhYkp6?=
 =?utf-8?B?Y2xJeXFXZjdPU0l2blh6NkNLV05kK0hoMlljckNGWDZDcjNMYVM2NUM3ZHlB?=
 =?utf-8?B?dnBGamlqWkl3aVFjdGd3N2dsOVVjL1VJSXA5ZzR2QVlVanBkcExFei90b2hF?=
 =?utf-8?B?MTdXMDZIay9qUkp2NGpTNXdVYnZ4eTdlYkwwQ3ZoTFZGRXhHVEJvbHhXbWdw?=
 =?utf-8?B?cjM4S0JPbkRFeWVqemVQbU1wcEZqM09Nb0p4WkVGbno2VGR2aW9QUmdjNkJy?=
 =?utf-8?B?dUxEUzBvVFFsZWg5ajRaRUNpY0V3WWExVGd5d243TmpBZUQyTzRkbHNsWllO?=
 =?utf-8?B?U2dnN0ZkMllzR2EvcVVtQ280QXVqTHBURlpvWDlqem9XTlJUajN3WjZWQWF6?=
 =?utf-8?B?eTR5MkNmYVh5eUNTUUdYZHB4T3BLMnNHMS93cEp3WnlPVy9BSUZDT1NCdjZW?=
 =?utf-8?B?VWRjRHVTLzJiOXVWV1N4aHNCV0JHRzdFZmIySlptM3BRWkE2OUxUUUtrMjBi?=
 =?utf-8?B?cmhIaTQvZmZTMWQycGd3QkM0QlBHVTBSVlFkR2E0eldnQnRpMzVnbHpTRkZU?=
 =?utf-8?B?RGo5dlJNRnVDYzhMcG9JRHd4SktQeDdHRm02MzN3MjgzWExXN1Q3VVVKbzVz?=
 =?utf-8?B?cjdLaVJsN2dXd1FrUFdZRm1nSnpYOGxzVjhvUlVxbXNmSFhJS0xIVUp5QkJS?=
 =?utf-8?B?R3FlUzBCaDlXT2hIaG1XOXZZZjZnSFd2VTBqM3VuR0QxODMvN1VlOXpNbExK?=
 =?utf-8?B?ZzRWSjJjL0ZnUXZxK2kwUTcrS2k1akdncmFGSWFEMXhlcysxSkRjVEpWeENl?=
 =?utf-8?B?TU1kcjB1b290TnVUeWNjc0NNYmExdnZGTHZSaHNZbTcrU2wxTmV6RTRRQjh4?=
 =?utf-8?B?eHdLRVAxNTk2OEQ4ZkRZby9mK1k3RGpXRk9UMElsQnA3bldRQ0hHdytZMytR?=
 =?utf-8?B?NTBld0lQdFlMT25GZlpEbThVNVd5ZG5IeHNhdEMrbUpnOTVGNDV4UDNnczYx?=
 =?utf-8?B?UGlsQWNOVnJzdExTQ01sK2FYR0NSNVEwTjlrVFI2T2d1R2hMZjF3WkVTQnh6?=
 =?utf-8?B?RjE1eWV0NWVzKzRWWUMvQzBmWThhWlh5bjNaNjJpOTY4M0ZudHNDN1k3WU1N?=
 =?utf-8?B?ZnJHVTlna01OVkZCTmNJWFN3Wi90T3hRTk12UkxWYlU3RGNPS3NsbFE2WURl?=
 =?utf-8?B?OS9OTUpjRDBlNUdRYW0xRkdaMUNRUE5PNkNpKzZVenBzY1d4YThyOFJGVDRn?=
 =?utf-8?B?VHgzUldyWFNzYUZXMCs1QWZnaGMrUnBGTHdIdTN2SW12TElpK2diVzVOaEgw?=
 =?utf-8?B?eURUMklQdWV3RXZXeVRjNGUrR2NvS3F0Sml1VWxOU1hEYjZQMDRHNlNwR3p2?=
 =?utf-8?B?dGIyd0ZKelpaZ1haTEFvL3p0dEdmU1RXR2szM2s0d2ROdW55UWtTU2xDeVB0?=
 =?utf-8?B?VDFJWTBrY1kvTkZyVEdpSWRDSTlVUDNaREdjQ2FDZm5sYStjSjBFUjlaYVRQ?=
 =?utf-8?Q?Gq9RRK?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dG9SQko2M2tNeDBiZzZZZW92VHVEYjFvcFZUWFJHMzR5YUFHMEdudlBjSDNJ?=
 =?utf-8?B?K21jVVJ3eVBabFR1RzZOUmRhRURHQ1Zqakk0Wkc1ZFM3Nlk1dGJBNjhZN3NV?=
 =?utf-8?B?VGRvN1hMbVowYXhLTC8wQkJ3bkt1a2dlSzR2bFA5WnZWL1R2NVZjem9vZmd2?=
 =?utf-8?B?Nk54aXMzdnlEdnVPZitZN1dRVTJCdUJ6M0NBUEtxc01UbjljNi9Rc00rKzN1?=
 =?utf-8?B?Nlh2eFI4VzVPUVpneGlRZjh1ZmNkVnFyeVhwd1N0YlB1RHpBMnJIOUNlbkdW?=
 =?utf-8?B?Ty8wV1ppVmd6SEZVdFpjNlllZzRwMXNTY04zc1c1RFJUSEFDNUhnL2kxVENB?=
 =?utf-8?B?M2VCMkhCZmk4Q1E5TGdmNWNxZ1RZdnNES2lXaGNGTWdkN3NOdjNYQzhQbHUx?=
 =?utf-8?B?WHQzbzFTMnNBVnA1NTRWazFuZ1RFTCtCVFY0UGNlcVNCc05rV1V3SlJlelNT?=
 =?utf-8?B?clFrS3JrSXNsUXUvbVNJNW90cGY1bUNvNnZabUdjT2lyS2pFbVRuNXBWU2Np?=
 =?utf-8?B?NUNSZy9saERYRFpFVGhIcmxlbUt1TjZqbkFXWWdITlJ0aFFzVGpYL1B1Rm90?=
 =?utf-8?B?aHBrckwzcjZRWjM2WUpUdGhJczNPYjFNYm5sTXBwMXovbG5sSDFZak5uRWZZ?=
 =?utf-8?B?N0EwU1Q3THJ1aE9ET29YbStSaUNCUmNmYXQwU2FRSlVrNytqUTBkV2xRZ0F5?=
 =?utf-8?B?OUZYcFNpOExFS0dDc01vbWNLQkZSV0lyL0taOFRwcEhZZUJwelhzZWtnUTBo?=
 =?utf-8?B?aWhzd0ovVU5jMmlZU1BKRGVTR3pVWWZjYjhiOVJ6R2lMTUtCT2NuaHRWMnY4?=
 =?utf-8?B?bC9LZnEraEdaUzVaV3NwNWR1d1NROW1lYUdEbHZseFpmNEJZVFZxNEVCMGxM?=
 =?utf-8?B?d0xLOHdjS01TMTcwVFVpZ3lBZDNkL1RFRXdsWmRlck53Y2gyeXNDRnhYMFVD?=
 =?utf-8?B?bm4zQUFjRlhPT1B6azhmWDZrQjNwTG1Ud2pLMEc2UzZnM05VTStDd2NYY3Ri?=
 =?utf-8?B?TFMrZ1drdXdyMy9JWk9QcUJJazdKWHBEZjVVaGRqeXJKMlcrV2JCZlVDTzhr?=
 =?utf-8?B?UHZKT0xVRHRzWi9zZStjMW90clFtNjNPME1zRDFPZnNTdGJiWkdsK2JSaHN3?=
 =?utf-8?B?UVZyOVR5K3JVRkJDUGZCamlKQjJSbVZFcW81dWVIeC9ncHNZbVBQQXdTRzZQ?=
 =?utf-8?B?RFcwV0twcHdlcGQwYXBBajBVbGpiZHhOTFhudE1nOS8vZm8xb3A3NndHaGZS?=
 =?utf-8?B?RUd6Yk52OURZb3ZtcTdSR2NMdnh2ZlRFY1R6TGdxYTBsZVdNTHlmQ2l3NGc3?=
 =?utf-8?B?STcxaUwwNUErQkJRL3Y3RFFSbTNlZ3E1Q2YreVR0dGZqbGJXRXN5ekNCeVd6?=
 =?utf-8?B?ai9UdlY0ZlJZUEkvZUhmTjdhYnNsY2JXY3RuRVpIcjhqdG5OYjZkV2kvVHJm?=
 =?utf-8?B?U2huOWRjS1NxWkZQclVLQmlTZW10UmFocFZYaDdOQThYeWFRbGF6bXA3UTF6?=
 =?utf-8?B?WTdmZkE4RnNDNE1hd0hXcFZoZzdNRFNOTmoxWGJsbnRGNEJ2VThYcHAxQmc3?=
 =?utf-8?B?RktsKzJ5SWU3WDlYQk92bThScjJBZTYwdFNGbWdaSmdyZXRIZW5TdVdDaWtE?=
 =?utf-8?B?c2F4NEhOQTdZNUE2M214QjREZEZxb2JlblNDZ0oyOWttSjVTNTZNZTRHdWhO?=
 =?utf-8?B?SFUweXZsQmdaL0R6TFlXQXpyLzhIeXQyM3N1amZwWTNETmJPeDcxQTVFNWZP?=
 =?utf-8?B?azdNM0w4WDh5RnlNN1l1Q0xpU210azRNaWtrV1grdVZwZHRmTWg1Y2kyMEJh?=
 =?utf-8?B?SGF1Y2lIMjZIQVBYS2hqa1c4MkFpZkVBM2lhMExOdm9FRVd6eXVsMG5iQWV0?=
 =?utf-8?B?TXlrcXFORTNGd29adkRxYlpXeGovTmFaZEtTYWpGcDE0aVBTR29STXVBVlYx?=
 =?utf-8?B?ckVBbTRrOERqc05jODhvckhpMXgvWWFFclFvMXBISW1wWFdjWW0yK1pSRE5P?=
 =?utf-8?B?dmNDeDc2MnhWUTArSmpEOFJKSG15eXJGTko4TllqRnhVRVArOVBSTVo1VGZO?=
 =?utf-8?B?K09JQ2oxZzh1NFlnRlRlYnFLbXpKbng4bEJGWU9wbDlmMThaVU1hQ1N0b3dU?=
 =?utf-8?B?MC82aElaTXVCVXJydHJmSmRFd0tUSHBpd1N1UkNESndmMCs5ZmxrOHdGR3lw?=
 =?utf-8?Q?hXZKBkQDpt06zaYiK4bsoFY=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66b39b45-f53b-4bc9-a8b7-08de26ae98b5
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 14:27:26.4938
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WG1spndWpgPv5qgTyLG3Pw3s7q86a1ylcAJAwL8hGvvybc0W5pb4in0cV7RVH2V/VJ80SSc5vOkcAKpFjkJh/J+EhM4TAkL66z3vQvud+cdKXOKHwuTAUkPXzSfNwrx4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB13363

Add a device tree overlay to enable support for the NXP P3T1085UK-ARD
board when connected to the RZ/G3E SMARC SoM via the RZ SMARC BREAKOUT
board.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/Makefile          |  3 +
 .../r9a09g047e57-smarc-p3t1085uk-ard.dtso     | 83 +++++++++++++++++++
 2 files changed, 86 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g047e57-smarc-p3t1085uk-ard.dtso

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index 1fab1b50f20e..9e5b22343071 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -185,6 +185,9 @@ dtb-$(CONFIG_ARCH_R9A09G047) += r9a09g047e57-smarc.dtb
 dtb-$(CONFIG_ARCH_R9A09G047) += r9a09g047e57-smarc-cru-csi-ov5645.dtbo
 r9a09g047e57-smarc-cru-csi-ov5645-dtbs := r9a09g047e57-smarc.dtb r9a09g047e57-smarc-cru-csi-ov5645.dtbo
 dtb-$(CONFIG_ARCH_R9A09G047) += r9a09g047e57-smarc-cru-csi-ov5645.dtb
+dtb-$(CONFIG_ARCH_R9A09G047) += r9a09g047e57-smarc-p3t1085uk-ard.dtbo
+r9a09g047e57-smarc-p3t1085uk-ard-dtbs := r9a09g047e57-smarc.dtb r9a09g047e57-smarc-p3t1085uk-ard.dtbo
+dtb-$(CONFIG_ARCH_R9A09G047) += r9a09g047e57-smarc-p3t1085uk-ard.dtb
 
 dtb-$(CONFIG_ARCH_R9A09G056) += r9a09g056n48-rzv2n-evk.dtb
 dtb-$(CONFIG_ARCH_R9A09G056) += rzv2-evk-cn15-emmc.dtbo
diff --git a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc-p3t1085uk-ard.dtso b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc-p3t1085uk-ard.dtso
new file mode 100644
index 000000000000..fcbdccc942a8
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc-p3t1085uk-ard.dtso
@@ -0,0 +1,83 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Device Tree overlay for the NXP P3T1085UK-ARD board connected
+ * to the R9A09G047E57 SMARC SoM board via the RZ SMARC BREAKOUT board.
+ *
+ * Copyright (C) 2025 Renesas Electronics Corp.
+ *
+ *
+ * [Connections]
+ *
+ * RZ SMARC Carrier II (CN1)  →  RZ SMARC BREAKOUT board
+ *
+ * RZ SMARC Carrier II (PMOD1_6)  →  P3T1085UK-ARD (J9)
+ * +--------------------------------------------------------+
+ * |    PWR_PMOD1  (pin 6)    →    (pin 9)   +3V3           |
+ * |    GND        (pin 5)    →    (pin 7)   GND            |
+ * +--------------------------------------------------------+
+ *
+ * RZ SMARC BREAKOUT board (CN1)  →  P3T1085UK-ARD (J13)
+ * +--------------------------------------------------------+
+ * |    GND      (pin 2)    →    (pin 4)   GND              |
+ * |    I3C_SCL  (pin 3)    →    (pin 1)   SCL_I3C          |
+ * |    I3C_SDA  (pin 4)    →    (pin 2)   SDA_I3C          |
+ * +--------------------------------------------------------+
+ *
+ * The following jumpers setup is required on the P3T1085UK-ARD board:
+ * - JP1: 1-2
+ * - JP2: 1-2
+ * - JP3: 1-2
+ *
+ * The following SW1(1,2) switch setup is required on the RZ SMARC BREAKOUT
+ * board:
+ * - SW1(1): 1
+ * - SW1(2): 1
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/i3c/i3c.h>
+#include <dt-bindings/pinctrl/renesas,r9a09g047-pinctrl.h>
+
+/*
+ * #define I3C_BUS_MODE_PURE 1 (for I3C bus mode pure - default)
+ * #define I3C_BUS_MODE_PURE 0 (for I3C bus mode mixed-fast)
+ */
+#define I3C_BUS_MODE_PURE	1
+
+#if I3C_BUS_MODE_PURE
+&i3c {
+	i2c-scl-hz = <400000>;
+	i3c-scl-hz = <12500000>;
+	status = "okay";
+};
+#else /* I3C_BUS_MODE_MIXED_FAST */
+&i3c {
+	status = "okay";
+
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	i2c-scl-hz = <400000>;
+	i3c-scl-hz = <12500000>;
+
+	eeprom@1a {
+		compatible = "atmel,24c02";
+		reg = <0x1a 0 (I2C_FM | I2C_FILTER)>;
+	};
+
+	/* U2 */
+	temperature-sensor@48 {
+		compatible = "nxp,p3t1085";
+		reg = <0x48 0 (I2C_FM | I2C_FILTER)>;
+	};
+
+	/* U1 NOT MOUNTED as default */
+	temp-sense@4c {
+		status = "disabled";
+		compatible = "national,lm75";
+		reg = <0x4c 0 (I2C_FM | I2C_FILTER)>;
+	};
+};
+#endif
-- 
2.43.0


