Return-Path: <linux-renesas-soc+bounces-26412-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 26714D029A7
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 08 Jan 2026 13:25:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6D3D13249795
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 Jan 2026 12:02:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 295DF44A70C;
	Thu,  8 Jan 2026 11:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="pUvvY+vn"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011025.outbound.protection.outlook.com [40.107.74.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2CA6449EBF;
	Thu,  8 Jan 2026 11:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767872028; cv=fail; b=BpyAACdfu6b4Y/Ym+GmS6d0cJBARa/EsbCbQAf6MKsJkM4itgK1Qy+G3l0w/rXyuwZu1AtQd6BZF85yAMGQ5IXGxg+jBHd6/7FP0N53rnbAKNoTjtm6hKHTK6LJsF+UMfdaHuCtAsCG0EKJCZlKHK/11h0XwkXxhqBcf5i86EOw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767872028; c=relaxed/simple;
	bh=bP04hvOPKRBsXYWXRxZUxwuBUN6EC4S26MLlJmDXxX8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=HBssEitnTM3F3hjk5y3gqZmQpZh7m//Riqo8FNQUTCLUnmZnK+gH70DPAG5n1AYEfKVte0bPp2N1vgOuNrVCBkI+OWedHHvrdJ4ic77ZrxThynQEPrDj89QasrrhMUp5mvc1NKUMWalWZMV9WWdFGC2K/imX2UcUPQaL+sLXR6M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=pUvvY+vn; arc=fail smtp.client-ip=40.107.74.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ePttQjH26GS3+8+aQ3S4rYUg/ezjhnvlvvpjXKC8HxagHi+yHWBdkANEFG/hnewuc0ly6F5zdLnfBwICdQf2iBOW70I8GDK+zUycbk6vh0SzwS/E7TU0iZ3hV6v1T8Q701V9pcIhb0sbmLFliD1hwfnTPUmFegMI8jGVqmMhgthQs3cKJ+FqGfYo4hU0OrdyeNvAvf0yhSu2s4Cz1ZCw5TmlLnf03+kfO3ONN3ymQK6s2K5zuI7aUzeDEfwgD68paGXmEVLcRnFHIguFVCBXKcyqUqtxvPqYH8qAs4dzwE9OIBIYYBy6jaWu8Ub+kZKP9j2BeaoO7t1uavFZva6xIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bP04hvOPKRBsXYWXRxZUxwuBUN6EC4S26MLlJmDXxX8=;
 b=eB1IgxErCg9DOzA+jUj9tggau+7Dd80iHM70hzdT0fRPdjhAQ25FyW4Fq/af670YXsZWpA5pfJu/2zRiGAS7gmj9R0sHkrTzbL/U5YVFH5Mtp5nhzJ+mMqI7eod/6iJEQNS1yFIv3zRwYf8b1RhzK97nHuxLFeFCfHLMXSRBbqrdxW/U/i4+/icdsyrfQ3ma8HGTZwFt9SUNSpbWZ2V+49Inp7c7HZ7dKhGk5kwwhD5fVPbBNcznEGsOMyCvqimK7pa7mEGGbwDCI+Xyv5M0UbFjEsJnfnEdUJ1Nu0GRgozK4EiRU+gJP/X2WRY9OCAznHXHu0ZbquY0CgzaITyrFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bP04hvOPKRBsXYWXRxZUxwuBUN6EC4S26MLlJmDXxX8=;
 b=pUvvY+vnujEqezUq0cJjDkLURuTz2kJZ1PusC+ypnb6whO5AaKMM1FbAk2q6K39BXj+00seVHdPsZdO2ilpAE6KoapjHgLmjEE5HKmMvmwGUjfJz3ON5sQUZi/KLiBvF8ISmoCCdjwpBc5Tp0Tfb+bgHteSR15XwQPAsjLZ7j8w=
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com (2603:1096:400:3c0::7)
 by OS9PR01MB17397.jpnprd01.prod.outlook.com (2603:1096:604:44c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.1; Thu, 8 Jan
 2026 11:33:41 +0000
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::2511:10cd:e497:4d97]) by TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::2511:10cd:e497:4d97%2]) with mapi id 15.20.9520.000; Thu, 8 Jan 2026
 11:33:41 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: geert <geert@linux-m68k.org>, biju.das.au <biju.das.au@gmail.com>
CC: Michael Turquette <mturquette@baylibre.com>, Philipp Zabel
	<p.zabel@pengutronix.de>, Stephen Boyd <sboyd@kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Prabhakar
 Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH 2/2] clk: renesas: rzv2h: Deassert reset on assert timeout
Thread-Topic: [PATCH 2/2] clk: renesas: rzv2h: Deassert reset on assert
 timeout
Thread-Index: AQHcaCtibMJqsnntuUOEg2wJmjZhwrVGviKAgAGWlNA=
Date: Thu, 8 Jan 2026 11:33:41 +0000
Message-ID:
 <TYCPR01MB113322F3C6A7C71C20F4B42868685A@TYCPR01MB11332.jpnprd01.prod.outlook.com>
References: <20251208101356.101379-1-biju.das.jz@bp.renesas.com>
 <20251208101356.101379-3-biju.das.jz@bp.renesas.com>
 <CAMuHMdUbAU68yuW7aok1WXMzNOVGTZtVJNZQLJyyrbvk976szg@mail.gmail.com>
In-Reply-To:
 <CAMuHMdUbAU68yuW7aok1WXMzNOVGTZtVJNZQLJyyrbvk976szg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11332:EE_|OS9PR01MB17397:EE_
x-ms-office365-filtering-correlation-id: 1c268a28-bd02-4895-d78f-08de4ea9c669
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?TkJxUzNIZ0pmZXpTa0l3WjRzNGc0blBFMlFUekdNY0dwVXJ2U1FWbG5zU3Fh?=
 =?utf-8?B?T3pBYUozWHhsNHhSV0d1WjcyZlBWYmJnaHBMRWZxQU9YTGRkSkpLNFdZOEJW?=
 =?utf-8?B?ZmppWTRYblRzaFA3aEgvSDhnbGdFNllnZUhWbVQycW9zN05Xb2NKVGFxNXZk?=
 =?utf-8?B?SGZ2YjN3S3VteEhoRkZ6L08rM0c4eWpSWjBYU2pFV2VFNU1NZXpiTUdOMUVm?=
 =?utf-8?B?ZFNpL0RwTm9LU1ptQ2Y3dEd0QjFzMGN4eS9rd09mbGMzWUNlTmYyWEtJNkVh?=
 =?utf-8?B?YW4zVFVVc1BzTEdTenEzazc3UzIzMkx6TGsxRkNkWHFPOUs3eDc1MGNPWTNM?=
 =?utf-8?B?ZXVFbmJ2VmlOOHJ1RHE4ZFhkSUtjREswWUEzZVNnclhwckVoRmFpdWRQMnAr?=
 =?utf-8?B?SlIzRHlscy9wWGFEbGc2VFplQVF0cVo3V2JoSVdXaVVzbWtXZTVuTG5pWjJw?=
 =?utf-8?B?UWVoUVQ3REl4aXo0bkcvditZeEQ0VkMrRFVvTjhpL055WnNReVlyRTFCdEFV?=
 =?utf-8?B?Rzh4T3ZIZ1NZSW1jUTJhVStZWHdYRldueUc3eG50WUxNbUNzajlrUkN4QWQv?=
 =?utf-8?B?SDB4QldpN28vTEZSZW9ZRkVxbUtQeEkwempjVXNwM1o1QWdQZ1ZhNkhKWUJ6?=
 =?utf-8?B?Um9ueWJZNmk1UWN4NGx2SUVzdnZUUWlpNUNsaEtZK0pSQVFKT1ZmNVF4ZGlP?=
 =?utf-8?B?Nkdtek4vclJvcW1uNlJQb09sNjRyT1lvckc2ZStNMW5uK0txeTZ3YmtqTzQv?=
 =?utf-8?B?aDhZWnZjOE10VWtMR1dvaHRMbXgrRWFNTW9TYy9hNk5odGU2WmNzdTB4Nnk4?=
 =?utf-8?B?VmtuN01LT0ZCS2U5dmlWWDUwVytMMzIvWDZua0hnb3lQZ2JCU2FUZzVjNXZH?=
 =?utf-8?B?YXltMHdBMm5jcnh1cHFlTUMrUllwdkc5eVY1bkMzM01jVUFKTGRHSm9raXN4?=
 =?utf-8?B?ZlpTNlFlSFhZZ0piYWJkQUNlb2dLWU1RaHZrNkhZendGNjNMTEVkLzF3SFNW?=
 =?utf-8?B?eFBjYVZyV2NjYWxBVzNZdHppbFIxVmwyb3N6emMwcmJ5T2RRcUtjd1hVSldt?=
 =?utf-8?B?bllwQUNwY09HQmduQlpWME9Zd3U5UDdPdklpbTBsMm5uYmJCYUJSMGtrdll6?=
 =?utf-8?B?aVlkc0x5ZnpvVVdwRUJGeFRMSlpQMWVXS3UydjJvZ1ZzTU40Z0dCaUtxd1Ay?=
 =?utf-8?B?QVRJVmMyYkhHQnljaGN2N20yNHBiOEd5ZHkyWnprMEF6MUVBYTVDLy9TTzdm?=
 =?utf-8?B?dUw3VW9NUXBibHhranNNWEIxY1RZQXBWcUNBSzA1WHUwZzJZRlF3bXliT0Z3?=
 =?utf-8?B?UUlwZGR3bFNxbWE1WGJzY0YzT0dqdnRaMklRckVBRWx2dGRrM25VbmRSRzBn?=
 =?utf-8?B?S3J1b0ZYWjNpdDJqeVE0VXorSGNQL2JGc0xyWmtLY242TFFQd1ZLelZlTUhW?=
 =?utf-8?B?QnJ0dm9NclV5Vjdod2lxMHVIazgwaklLRit6bEY5azVaNk5ScCtlQ3QzNTB6?=
 =?utf-8?B?QnBCdVNJYnRnc2wvTTkwQnBwUmtQaENobGU2MG9EVWpGS2ZCb3NITmVaSndY?=
 =?utf-8?B?cHdQb052M3o2dTJCZ282RmhKMC85WHZOeWg2N1BOcS9PQ0p4elI2eXg0a1dn?=
 =?utf-8?B?MTlocm1LR0JxLzJRdll2ZzZUV1VQaGg1VzRXeHVOZVhXREpxNW1PdDZyYmh4?=
 =?utf-8?B?cG1xZUl4RFBGc29xeVlBY0xsbHgzakdOVzk0ODQzRU1SQmE1UENzb2pCODN2?=
 =?utf-8?B?RUQvQ1dqYjJYKy9uMS9NVCtQc3dnZmc3K0VwZDdqNi8zWlhHS2xISXVndjV0?=
 =?utf-8?B?elNSTjNBMW1OZlJhaWJNZk44aWszRmZ3bGFjRUY3Q0FKbncxTitsTlJzVDZU?=
 =?utf-8?B?MnI0ays5V2pJRG1LSnZtQ0ZtQ3N6ajlwS2V5Zm1QSVZPYWhidnduZmFXN0JM?=
 =?utf-8?B?cmdyNllPUyszY0drKzhJeXlWOTZHZUQzbXBJRUNZTzkxRmtVRC94RlZXcG9v?=
 =?utf-8?B?TmhreTVjYzZrUGtubDc2Uitnbmh0dTNKazlCYVBrRDFNWC95QUo5Nm1MUFZl?=
 =?utf-8?Q?229zw8?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11332.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?c3Qxc2I2SGMzeUx6YzVOeWNZT0kzWlFrcEFMUkJoeEdwQ0l0UUp5OE9xZnlo?=
 =?utf-8?B?YTRITmZvSXcvb0FsMDA3YlhiU084UERiblBVU1RCTG1rOVJvaEthYlM2Vldq?=
 =?utf-8?B?clRCNVRFajJUdHloaGFPcDVwcHBNV091MUFLS2lmL1cwWm9qeUVIRzdOSnlK?=
 =?utf-8?B?Ylg1WmpwTEJhS3crdnhKcmw1TlB0MzVwaEh4am1FSDEyL2JYd2xPTlllb1kx?=
 =?utf-8?B?bVpic0drY2IrQklkL1hmcW45VmJXRTlWUk1NcVVJL0xRc2pGb2pidDkySjk1?=
 =?utf-8?B?UXpYdG12WDg2bXFFRmdNdFhFNWFCbm1MemQrVGtmRW8vcnU5SFRyYVloRDE5?=
 =?utf-8?B?TC9EaGEzQU4rOVlVWE8xMzRxdFE4ek5FMVJrT3hYdDFNRDBVdGFkMHpla1BQ?=
 =?utf-8?B?UGd2QUV5NTNydTBFKzYxTWFVMU40cmU1c3dOUVAzZlI3cU9rdEV4RjVLTHF1?=
 =?utf-8?B?ZUlrVUt0dzNxL2lDNE1rdE1oRlhDYnFCSzJ3Vm1tRWYrM3BieXc5alI2Zm5u?=
 =?utf-8?B?WFBoTVJBNnI0UEJYRE5JLzlpNXFuUisza1VzY3g1bzJqY3JkOHVMbXpMNFFP?=
 =?utf-8?B?Mm9YUmhNZkJDd1QyVjJrVnpoNmNmK1ZvdlpSTlcwQVQ3d3pSZjJsalozdE5W?=
 =?utf-8?B?cmVDMzZsaW9lMENiMkFJbmtiQmg0SDcvSTNZbWplREEyZEtkNWpsQ0U5UVZa?=
 =?utf-8?B?cllRM2dpYi83bkZVazNBRlVtbHk4djN2M1ZvL2lUaWVEbFBUSDNxajF0SkVS?=
 =?utf-8?B?cE1TRVJmdUlDUy9rK3Y4aS9hR3ZQdUNXVkg0SUhyUGc1c25xZlYzRHBoN21o?=
 =?utf-8?B?RldsN3FLZ3FqUE95RDB5UWI0L1hlSFFjejY3ZkZTekh5ZSthN1VkUGsrOEtm?=
 =?utf-8?B?UVFpVlBjajRIbk42WlZDNkV0cWk1QTJDNzFKV3RNZ3h0M3MwYWlqMnpidVJB?=
 =?utf-8?B?ZVdsZ1RRZ1dzRmJjamxyREIxRnp5WTllcHJCcWJHdTRVTjNOTjVCZURLMXFN?=
 =?utf-8?B?WWh1eExZNTBwNTIybXloemEvWjFQL1Z6WG9aY2NoKzF1cjZSYy94RjdSNWw2?=
 =?utf-8?B?REFTS09razZ5Qm90QStDVGV0ZEhJZmp2Zkk5MWhTRW43ajZhRFdOWEVIaXBT?=
 =?utf-8?B?ZVlkcVF0d1gzM1ZkUHEwT3RhVmZGdCtZdEJhMmhPdXd5eHRXcmd2c1A4VmpD?=
 =?utf-8?B?Z2NFSGlOdnBDN2wzZkZ5aDFsenVmWHVMVGNCS244WnVWVUtxN2ROek9xaEVZ?=
 =?utf-8?B?UVp4SjIvNkJVQ04yaW8zckFZTUo5QmlGQ3phL3NBK0Ryb3p4OTVwemdKbXM2?=
 =?utf-8?B?MUhkdWRKZFVmWEIvOWxJOHZTaGRWLzc3RmZpOEhnamV2QVhoVi96V3JLNngz?=
 =?utf-8?B?ZXJoMk1GVTMwbEo1RlVPUkZrY21PeVZadDR1dDNSOFM4TmtFMkRHbElFNzlN?=
 =?utf-8?B?czhhdWl1Q1RiV2daMHU5aEpZQnlNVjg5elUyMVM4d0tPY01yc09nVTN2UG5U?=
 =?utf-8?B?M3BFK2VHU3AzTHMwSTVRT0F6RnROK2srcEdtaUFpTHdWYW85RGtzMzJ0cHdR?=
 =?utf-8?B?SFI5a1g1eEQySjk4cG83ZUZuK2x2ZDlhUmppLysrMUdHNXhzQlpoOGlkaDNN?=
 =?utf-8?B?cEdnSmZXMis0L2E0ZDdLUmdROXA2cGc0MU9oUlhyYUZzRysxRlY5cURKWm9F?=
 =?utf-8?B?MVEzem0yRXN4K0FTRmxXNjZCTkwyRGxNT3BKOW1zdGpIWThXWmhpdDg5ZzN5?=
 =?utf-8?B?a0swWEpUYXZ0K3NLd2dHUTRFWnZMRStSOGo0RnNJMUd5bHNqbkIxNEJmMnk4?=
 =?utf-8?B?dmpaS1F6VThMeUhqekFLZzNWOExBWGpoNTdpNVZaRldqM1VUazZjVitMd1hl?=
 =?utf-8?B?TXluMVF1cG9BWmh3N01HRzExNSsxVXBqRnJjOFdPczJQSFhUK01qckgvaWFj?=
 =?utf-8?B?Zyt5K3FxYmRIMisvaHArRXl5NDhXRElzVkFZczZvcWwzckVudktJQ1kxa213?=
 =?utf-8?B?RnRWa25pT1ltWm5wL3FwU0pmdzBaR251VnltZnI5Q2l3d0pSd2daVmFaK3BV?=
 =?utf-8?B?bkkrMnNZN1RwbnhDSjBaT0RkRG55S2tDUEhQdytSd3VZc1hUV1lQUGUyTWls?=
 =?utf-8?B?YmdGczFlMDc5QWpEeFRSY1ZOQVZNZ1FpL3ZCUkRRVTAxaEpGL1A5L0JibGhE?=
 =?utf-8?B?ZzFyam82Q1N2MysvbkFWQi93ekRFOFdYOHo1T1A2a0NZalpRcXFxbktjbjlR?=
 =?utf-8?B?bklRMFE0MmYzNnRlRjNZenZoUTNlNVBUSkZ4WGtVVUwxUWdPR2c5SnR4V2pY?=
 =?utf-8?B?L28yNUtHOEk4b1o0dHJxeHlZMENPMVZUTlRDREUyNlJXU0hMYUJiQT09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c268a28-bd02-4895-d78f-08de4ea9c669
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jan 2026 11:33:41.7941
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pijNjzPj2531HgyAwerfGMva8KHmSjUU5EWcXaTj9hMlUVsUHqb78YkiutuFhkqWtdXoFTo0NDQZFr6gTkOzWkk08NxW1xz5DJtRJL/d5Ds=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB17397

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrDQoNCj4gLS0tLS1PcmlnaW5hbCBN
ZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhr
Lm9yZz4NCj4gU2VudDogMDcgSmFudWFyeSAyMDI2IDExOjE4DQo+IFN1YmplY3Q6IFJlOiBbUEFU
Q0ggMi8yXSBjbGs6IHJlbmVzYXM6IHJ6djJoOiBEZWFzc2VydCByZXNldCBvbiBhc3NlcnQgdGlt
ZW91dA0KPiANCj4gSGkgQmlqdSwNCj4gDQo+IE9uIE1vbiwgOCBEZWMgMjAyNSBhdCAxMToxNCwg
QmlqdSA8YmlqdS5kYXMuYXVAZ21haWwuY29tPiB3cm90ZToNCj4gPiBGcm9tOiBCaWp1IERhcyA8
YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4NCj4gPiBJZiB0aGUgYXNzZXJ0KCkgZmFp
bHMgZHVlIHRvIHRpbWVvdXQgZXJyb3IsIHNldCB0aGUgcmVzZXQgcmVnaXN0ZXIgYml0DQo+ID4g
YmFjayB0byBkZWFzc2VydGVkIHN0YXRlLiBUaGlzIGNoYW5nZSBpcyBuZWVkZWQgZXNwZWNpYWxs
eSBmb3INCj4gPiBoYW5kbGluZyBhc3NlcnQgZXJyb3IgaW4gc3VzcGVuZCgpIGNhbGxiYWNrIHRo
YXQgZXhwZWN0IHRoZSBkZXZpY2UgdG8NCj4gPiBiZSBpbiBvcGVyYXRpb25hbCBzdGF0ZSBpbiBj
YXNlIG9mIGZhaWx1cmUuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5k
YXMuanpAYnAucmVuZXNhcy5jb20+DQo+IA0KPiBUaGFua3MgZm9yIHlvdXIgcGF0Y2ghDQo+IA0K
PiBSZXZpZXdlZC1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydCtyZW5lc2FzQGdsaWRlci5i
ZT4NCj4gDQo+ID4gLS0tIGEvZHJpdmVycy9jbGsvcmVuZXNhcy9yenYyaC1jcGcuYw0KPiA+ICsr
KyBiL2RyaXZlcnMvY2xrL3JlbmVzYXMvcnp2MmgtY3BnLmMNCj4gPiBAQCAtMTM2Niw4ICsxMzY2
LDExIEBAIHN0YXRpYyBpbnQgX19yenYyaF9jcGdfYXNzZXJ0KHN0cnVjdA0KPiA+IHJlc2V0X2Nv
bnRyb2xsZXJfZGV2ICpyY2RldiwNCj4gPg0KPiA+ICAgICAgICAgcmV0ID0gcmVhZGxfcG9sbF90
aW1lb3V0X2F0b21pYyhwcml2LT5iYXNlICsgcmVnLCB2YWx1ZSwNCj4gPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgYXNzZXJ0ID09ICEhKHZhbHVlICYgbWFzayksIDEw
LCAyMDApOw0KPiA+IC0gICAgICAgaWYgKHJldCAmJiAhYXNzZXJ0KSB7DQo+ID4gKyAgICAgICBp
ZiAocmV0KSB7DQo+ID4gICAgICAgICAgICAgICAgIHZhbHVlID0gbWFzayA8PCAxNjsNCj4gPiAr
ICAgICAgICAgICAgICAgaWYgKGFzc2VydCkNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICB2
YWx1ZSB8PSBtYXNrOw0KPiA+ICsNCj4gDQo+IFNhbWUgaGVyZTogaWYgcmVhZGxfcG9sbF90aW1l
b3V0X2F0b21pYygpIHdvdWxkIHVzZSBpdHMgb3duDQo+IHZhcmlhYmxlOg0KDQpPSyB3aWxsIGRv
IGluIG5leHQgdmVyc2lvbi4NCg0KQ2hlZXJzLA0KQmlqdQ0K

