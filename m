Return-Path: <linux-renesas-soc+bounces-31023-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EPHLHvRp1mnIEwgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31023-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Apr 2026 16:45:08 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DE3443BDD19
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Apr 2026 16:45:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A07883006529
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Apr 2026 14:45:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A501C3D3499;
	Wed,  8 Apr 2026 14:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="XpU2W5X6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011009.outbound.protection.outlook.com [40.107.74.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4B223D332A;
	Wed,  8 Apr 2026 14:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775659505; cv=fail; b=A4G3+7aDtbqfBCfAf1qmS2iD7SAn4p3DWb9zL/kbw+8icFGEurDzyG7Zppj8EKJAZLMrF2p/K010gmwPqwOCzvzHes9cKkG0R+7I9lCdQjAi7o9ucpvSb17fpMsD18NDAckKrn9+dr7plMwLvEsNeL8LbrFXqNHrwfIRDLn6SsI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775659505; c=relaxed/simple;
	bh=hSC9gd/LjupXISOcU+KNEfqwT5UB0hXMSAWDmBFH2AU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=VjhUYPgtmJYapjXyrSsCvnw5341toDOjOFk6NZ6h+SUXlEGIYMevi3kADgRumQgcCp8P46eCy2jc/6RaF2ggzXbuC6WZm5HvSkOkft8KR23lHrfThi4TwzY3jYaKsAJ89+wOYjndEFsJz2EKpkeip2+Ym517nEaa8XJUmTtha1s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=XpU2W5X6; arc=fail smtp.client-ip=40.107.74.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BXGoZuk0H5SCASeapxFAskf3CPw3QEfxbYZPaPMJsy/mzeBIXHaZcIZmytDA51MJ+g0Oqz0G1p/qvLgtoVlBkSFdwZApUyvROdFBlavjbeLwOHY4UPpDjctZny9DKSXJPjXDGQ4c9kP+Z84I3xBfWiUlA37q8OggLq84jyKFB/e2xIjbE5kZ/RubOJzlxELYj4b4T3F66evddciSOcXyokY0OsNEyaFRYlz5JF5Acf9JsSd27wrq01jMyrG67naCysV+6dVLWH2s8aQBiRdiaYqYZdLFA78R3VUvKBPp0awoSzJJ9gCjV2e/SxJaMNGc9usypxdUmTCr1vr+cGRBDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IDK7fOup7eUFC4r+TUbWuTGx8/lxw0RY2Y0bwv1fCNk=;
 b=hYGcXqq/LiecgNddqexhTJxic7hLFvIuJWIqmF9JGHr3VafmzASYuvOVhaPbusCkvVtyjIo087c0ae7OL4J+ZTPe3SeG8H+ePGGuVfg7q5RgMF9EmD5cJH5aDFcGHRLHaJBfbXKR+Xqb8MP7EDSzIKUG6eYFlRbjicuaR1t1/M00QsRh+CejL0eiqZBEnTn6vI4FP90KwK9TlmvqZaMZQChe8NGHBLA8o+09Ktoqxn0mXO8sekNbMwNiBgxZ3T7W9a4uA1Jj0bzhSWvdIHoRZmXf27RUSWj6SNASlYW6GD6Gn2QSpFaKz8y8jf7x4lnrE3OgYxjPFMsZu/V/9VTcww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IDK7fOup7eUFC4r+TUbWuTGx8/lxw0RY2Y0bwv1fCNk=;
 b=XpU2W5X6uDpd5vvZjrNZeDtYiijHc3BQX7IaP2Ce+OwZEemkBShqDCWxUiZKIIULfZFMkY2daG0fifDtj94FhEDhdKTedWpgOzTi0y2q1xhIbgzLKbSUe96/pSS4AqQursobjOT17dAZIy5BbWup8mX8ZRvgwJcvuYdKERxKhqE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OS3PR01MB10232.jpnprd01.prod.outlook.com (2603:1096:604:1e4::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.21; Wed, 8 Apr
 2026 14:45:00 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9769.017; Wed, 8 Apr 2026
 14:45:00 +0000
Message-ID: <87a18664-d19e-4434-8f92-1c7ce4f3a131@bp.renesas.com>
Date: Wed, 8 Apr 2026 16:44:48 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 10/21] dt-bindings: display: renesas,rzg2l-du: Add
 support for RZ/G3E SoC
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: tomm.merciai@gmail.com, geert@linux-m68k.org,
 linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
References: <cover.1775636898.git.tommaso.merciai.xr@bp.renesas.com>
 <8f814f22ff62dcde6153260e2c8c29a5415c9a89.1775636898.git.tommaso.merciai.xr@bp.renesas.com>
 <20260408122436.GH1928916@killaraus.ideasonboard.com>
 <dafdbdcf-98db-473c-8122-296af1922e6c@bp.renesas.com>
 <20260408141638.GA1965119@killaraus.ideasonboard.com>
Content-Language: en-US
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <20260408141638.GA1965119@killaraus.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0271.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e6::20) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OS3PR01MB10232:EE_
X-MS-Office365-Filtering-Correlation-Id: 01fb90ed-36f2-4ed7-4453-08de957d6931
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
 ySp3+tPP4BYNZqALzP4z5QT+MmbIn4zcZm+87D63zUbSoyy6aMlZ6lahEpmqENZrrHc2lVfULK9RJlwkm4gsAv13Sl5PdX01V55ya+C+iOdorzG2GLJfEA/cjLBVQiRQXLnY5GS+qi7OzJAwEcEZkKd3I3S6mxBvQvsccVq1Ok6CcarNoi4cK+AyxOfiPx0epCn5qWWlQxzWtQsEeeM3BdLw7PqGdcmBPwoVLtj6AMkg9U4UaaQTitCG278p7VhUEft6AQcq34S3x3Ydt20WV38tW5l/gb+r8pxBWK+UhCeLp5WQZtqLeScEAQ8Y1UVehrpGT5hHmoW2Lgu0NM08DMfAuDmB55N5jYM2aSY9JWDK525pdybVHQZjfgBUDY21h/SAmdgyZhM4zEe9WbVLbSlPV7tBxZMfTvl8mCsi8AAyQu5dScW+ctRgUgCjLRjpM/HKh3D2jQbMQVYZvXRSu50jp9YlrWraNUCjbobe2A33GPRRlG1PVHGDcI9Ykhj9DTNz4IqAQS3i5Yy+oftKV28XixePXvesXEzFYLx7lK6QA3G0WlMlnJT9FJ8uzB8Q72pv7/cWEiN9Xb04K8swO6Y7+6nczHOjFlz9kxJ+AQyhsMQcz0zFm0rs5k2JkDPiKv5I4iN1I0L+HY8rNhHNKDjhPrxKGiWs9ntSb63JOsnJsVRSRCzCAp0X6/mMkjqHdOF2X/v3t8IP8yZUGJ2cJW9jbCt7sxihGaDefCnEgDE=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?dGVDcnFxV24rSUwvTVNzZDdWcTFORER1Y0RoR0dscVAzTjhlVXR6TGR0cHgx?=
 =?utf-8?B?QURBZFhZbS9tYkY2MzBuWFp0U1Z0SkZvbEJTazRrWUpQck9VcGlYUzdqdUtR?=
 =?utf-8?B?bkJwbkxyOWJMM24rR0JwaUhrcmFrZHg2WEdFeFpIOHNWeVE3endaaVIrRkpx?=
 =?utf-8?B?aFFzcWJFY2hKMFFTeVJBRHl6SXRuVkk2dXk2M3o1SW9Rb0xvdnd2VHpZbHJw?=
 =?utf-8?B?MXpiTW50Z1hyanlISnBTMXFzNG92T1AyUFIwRUVNL212dTdCRzhBMlhHaUNE?=
 =?utf-8?B?ZHJvaHA4SGd0UzdyZ0J5NzRRaW9SM0M2VFVSU2VDUERhSFZnaGF6U3JSb01q?=
 =?utf-8?B?b2dlT3VYYzV3L3BSMkZkVnB5Yk45WEpEbkV3dWdhR0FHdnZHQ1dSeEIyVDdw?=
 =?utf-8?B?ZU5NVzgvVktDOEFMcW8rVldkaFRnQ0dNaHpCcThjbmdTYkllNko0T0IvbkZu?=
 =?utf-8?B?TytvY2piWUlUNEdzM1ZXRUg1TVhZbnp6Tzd3d0poZlhQOGdHQXNJanRkcjZG?=
 =?utf-8?B?a3h4Nlk1b041bnJtRGs5d3E5L1pzcFdPb204VXdvL0RxeU5lOW95UjFKK1Rp?=
 =?utf-8?B?Z3BoTjJDb2orbWRSWWVYM1BlNTJ4RDNDQTN1b2JSYUVnYjhadEpZTmVueUhU?=
 =?utf-8?B?VzhmTndvVTFEMWVtODN0VjJScjArZ1Y0TUdYVDNWbHdMZko2akVYSWppYVZM?=
 =?utf-8?B?SUhkU3B0cjhmVDBITzFQdzMvU2lKU0p5RXhMbTZ3SC9WbjZ1ejE3WDJnaTh1?=
 =?utf-8?B?VlZxck0rMFJUNXFlM1NpQXZpRnBYblZWOTJKclRtdG8wUFZHM1V1aVFld3Np?=
 =?utf-8?B?dk4xSGVjc0FYWTJFSXF0YnczTFpKS25iMFlaYmwxSmtHdVYrdFRJNEtjaHdE?=
 =?utf-8?B?Mm90MEtQVjREcWZCSU44WFpWOEZBMUhUZ1F1U3JOR01lOHRSMzlGaWVJU1RX?=
 =?utf-8?B?eFRhMEJhRmJ6NHRjaktFUHBKUFlDSjY1U0krUHpBV3BoZ2t4YmcrZ1c1NnEy?=
 =?utf-8?B?N1lzd0t6dk91MmFBSmNRUmUvc0d3OW5jRmtrL3RXRjJsWElBYjRWc2l4NU1y?=
 =?utf-8?B?YjRIT0JibE53OWxGemFLVHVPSXlWOC80Z2wyaHpHUkZBa1B3aUI3clVmTzBU?=
 =?utf-8?B?Z05KTk8yZzBZTmNuTitOWnMwaVZEaUF0aTlqWklIa1hIT2F2SGpEem55SVVS?=
 =?utf-8?B?OE5KZmxaOGZYZGRteWZ4bFJoZ3NqcmRzazNubzRuNituRG9zdGZ5cG9kTGVR?=
 =?utf-8?B?bHZPbTFrMFBaZkNVU2VqemZFRHNvZ0xCMFRYS2lOZHVZWHdBbFdZakVOQnlT?=
 =?utf-8?B?RVVVZzdjVm80M1pheHhBVzk1OWcwUlpsK3owSjYxdW5LTEFZTXp4TCthcElS?=
 =?utf-8?B?NzNuQXZDeXpZbEZlcFJxQjJUZStWc3UzYlZOQUJISnczMlhLc1NBZ2NlMmRW?=
 =?utf-8?B?eTE3citHMVpYbFhOSGRaZmVFelJDU3hHdUpUQ0dVRFVEcTdNU2xmdDgwVXM2?=
 =?utf-8?B?NWozS1BuZ0daekl4U01TcE5SVUZPSFdjWlVUZnZNRlkvSnBNNlZ5UWtQbCt1?=
 =?utf-8?B?Qk1GdWZ6OUc1ZTZVUnB6L2VOQVZKUjhlakowcmcybU8ydFVrQTlxYXJUbXo2?=
 =?utf-8?B?Uk5tY1JTYWs1L1NFRnpkVkNkNXU0Z3hzSjdhVTRrb0srYmVCQ05pbDlJeHlx?=
 =?utf-8?B?TUErNTcwZnVscTVsR05Dck9iK0Rsa0FUcmxTRHNER0xoTUhDMUtHdS95K2Y2?=
 =?utf-8?B?OHRBUmt3QUdPQXIyNXVNRVFkQ1JaUE5RSksyWFg0Mmt3OFdGYmhCR09kRDE5?=
 =?utf-8?B?SFlUZkNqVTFYZlNXOU5iRVJPUFBFUkVHaXZkQ1JPM2ZyMUxHbURyS1UrV0FB?=
 =?utf-8?B?WDIrU3IzNUllcFF0V1NYczRnRmlNaUlDZk44ekZsUHVhTE9XY016dFBOMG84?=
 =?utf-8?B?MHNKZEdLMEVXRlVLM3plWmw1eGUyeVhuOTFOTzVXWXQ3eFlrZ1FiNTBMbEM3?=
 =?utf-8?B?RjF1djRvTkdObE0yckdPeGRMWlFTYkl2Uitqa0MrWWU2eWt4UEhRYmhXUC9a?=
 =?utf-8?B?Q21DVDBpWEwvaUUxOEYrVVY1Z3B4cFJzd0h2UXI5dmlkeWlRbzBaWVZQUklQ?=
 =?utf-8?B?MldGSHRGSzZiWGRrYzFaMjZIeG1MRDZOei9WVGVKL1lYcGl3S2MxNTA2c2tW?=
 =?utf-8?B?R0xqU1VWcmxzbEcrRnJESWlGbFRNSjdITnF3cU9YdWswZlVBMjdXZkFmYThw?=
 =?utf-8?B?N1ArK0RRcHFIOHRHS1JzR0VMRVdDcFNZdVBDczVnRVlHc0Y0ZlRRUi9Ga1A5?=
 =?utf-8?B?aG1wYVBzTnhYeHVIMlRYNEpNYUIxeks2RVhVVlhXYlNtK05uaDVnOFRtTHZq?=
 =?utf-8?Q?TI8qEMeeVYTvSxQtMMNHRr5/1IZ1uO1YqbILr?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01fb90ed-36f2-4ed7-4453-08de957d6931
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 14:45:00.2738
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iQd5L14zcFimvCdMZN5j8rTLBjIPpcd9t/WLUvFz5vJ4Uo7LJt+PIczIFnx7t+BUvjOeEr3XagBQqCKgXFKxvznzJvuqHk2CrYbCjGQajEy19jHu63g86fYYTERRJTd4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB10232
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31023-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,linux-m68k.org,vger.kernel.org,bp.renesas.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,glider.be,baylibre.com,ideasonboard.com,lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	DBL_PROHIBIT(0.00)[0.0.0.3:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,0.0.0.1:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,renesas.com:email,0.0.0.2:email]
X-Rspamd-Queue-Id: DE3443BDD19
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Laurent,
Thanks for your comment.

On 4/8/26 16:16, Laurent Pinchart wrote:
> On Wed, Apr 08, 2026 at 04:02:14PM +0200, Tommaso Merciai wrote:
>> Hi Laurent,
>> Thanks for your review.
>>
>> On 4/8/26 14:24, Laurent Pinchart wrote:
>>> On Wed, Apr 08, 2026 at 12:36:55PM +0200, Tommaso Merciai wrote:
>>>> The RZ/G3E SoC has 2 LCD controllers (LCDC), each containing a Frame
>>>> Compression Processor (FCPVD), a Video Signal Processor (VSPD), and a
>>>> Display Unit (DU).
>>>>
>>>>    - LCDC0 supports DSI and LVDS (single or dual-channel) outputs.
>>>>    - LCDC1 supports DSI, LVDS (single-channel), and RGB outputs.
>>>>
>>>> Add a new SoC-specific compatible string 'renesas,r9a09g047-du'.
>>>>
>>>> Extend patternProperties from "^port@[0-1]$" to "^port@[0-3]$" to
>>>> allow up to four output ports, and explicitly disable port@2 and port@3
>>>> for existing SoCs that do not expose them.
>>>>
>>>> Describe the four output ports of the RZ/G3E DU:
>>>>
>>>>    - port@0: DSI (available on both LCDC instances)
>>>>    - port@1: DPAD / parallel RGB (LCDC1 only)
>>>>    - port@2: LVDS channel 0 (LCDC0 only)
>>>>    - port@3: LVDS channel 1 (available on both LCDC instances)
>>>>
>>>> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
>>>> ---
>>>> v5->v6:
>>>>    - Extend patternProperties from "^port@[0-1]$" to "^port@[0-3]$" and
>>>>      explicitly disable port@2 and port@3 for existing SoCs that do not expose
>>>>      them.
>>>>    - Reworked ports numbering + improved/fixed ports descriptions in the
>>>>      bindings documentation.
>>>>    - Improved commit body.
>>>>
>>>> v4->v5:
>>>>    - Dropped renesas,id property and updated bindings
>>>>      accordingly.
>>>>
>>>> v2->v3:
>>>>    - No changes.
>>>>
>>>> v2->v3:
>>>>    - No changes.
>>>>
>>>> v1->v2:
>>>>    - Use single compatible string instead of multiple compatible strings
>>>>      for the two DU instances, leveraging a 'renesas,id' property to
>>>>      differentiate between DU0 and DU1.
>>>>    - Updated commit message accordingly.
>>>>
>>>>    .../bindings/display/renesas,rzg2l-du.yaml    | 30 ++++++++++++++++++-
>>>>    1 file changed, 29 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml b/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
>>>> index 5add3b832eab..32da0b5ec88c 100644
>>>> --- a/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
>>>> +++ b/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
>>>> @@ -20,6 +20,7 @@ properties:
>>>>          - enum:
>>>>              - renesas,r9a07g043u-du # RZ/G2UL
>>>>              - renesas,r9a07g044-du # RZ/G2{L,LC}
>>>> +          - renesas,r9a09g047-du # RZ/G3E
>>>>              - renesas,r9a09g057-du # RZ/V2H(P)
>>>>          - items:
>>>>              - enum:
>>>> @@ -61,7 +62,7 @@ properties:
>>>>          model-dependent. Each port shall have a single endpoint.
>>>>    
>>>>        patternProperties:
>>>> -      "^port@[0-1]$":
>>>> +      "^port@[0-3]$":
>>>>            $ref: /schemas/graph.yaml#/properties/port
>>>>            unevaluatedProperties: false
>>>>    
>>>> @@ -103,6 +104,8 @@ allOf:
>>>>                port@0:
>>>>                  description: DPI
>>>>                port@1: false
>>>> +            port@2: false
>>>> +            port@3: false
>>>>    
>>>>              required:
>>>>                - port@0
>>>> @@ -119,6 +122,8 @@ allOf:
>>>>                  description: DSI
>>>>                port@1:
>>>>                  description: DPI
>>>> +            port@2: false
>>>> +            port@3: false
>>>>    
>>>>              required:
>>>>                - port@0
>>>> @@ -135,9 +140,32 @@ allOf:
>>>>                port@0:
>>>>                  description: DSI
>>>>                port@1: false
>>>> +            port@2: false
>>>> +            port@3: false
>>>>    
>>>>              required:
>>>>                - port@0
>>>> +  - if:
>>>> +      properties:
>>>> +        compatible:
>>>> +          contains:
>>>> +            const: renesas,r9a09g047-du
>>>> +    then:
>>>> +      properties:
>>>> +        ports:
>>>> +          properties:
>>>> +            port@0:
>>>> +              description: DSI
>>>> +            port@1:
>>>> +              description: DPAD
>>>> +            port@2:
>>>> +              description: LVDS, Channel 0
>>>> +            port@3:
>>>> +              description: LVDS, Channel 1
>>>> +
>>>> +          required:
>>>> +            - port@0
>>>> +            - port@3
>>>
>>> Why are ports 1 and 2 not required ?
>>
>> About this we had a similar discussion on v5[0]
>> We are using the same compatible and:
>>
>> - LCDC0 supports DSI and LVDS (single or dual-channel) outputs.
>> |
>> --> then has:
>> 	port@0
>> 	port@2
>> 	port@3
>> 	
>>
>>    - LCDC1 supports DSI, LVDS (single-channel), and RGB outputs.
>> |
>> --> then has:
>> 	port@0
>> 	port@1
>> 	port@3
> 
> Ah yes, I forget there are two LCDC instances with different output
> configurations.
> 
> Something still looks a bit weird to me though. For LCDC1, which
> supports a single LVDS channel, you use the port described as the second
> LVDS channel. Is there a reason not to use port@2 ?


9.11 Low Voltage Differential Signaling (LVDS)
9.11.1.2 Block Diagram
Figure 9.11-1 shows a block diagram of LVDS.

LCDC1 is connected to LVDS, Channel 1
For this reason I'm using port@3.

Kind Regards,
Tommaso

> 
>> Then port@1 is required for DU1 but not for DU0.
>> Same port@2 is required for DU0 but not for DU1.
>>
>> [0] https://patchwork.kernel.org/project/linux-renesas-soc/patch/ca022fdbba5236c36e0cb3095db4c31e8e0cb1b8.1770996493.git.tommaso.merciai.xr@bp.renesas.com/
>>
>>>>
>>>>    examples:
>>>>      # RZ/G2L DU
> 


