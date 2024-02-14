Return-Path: <linux-renesas-soc+bounces-2824-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C38F855754
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Feb 2024 00:35:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3B1EA282F26
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Feb 2024 23:35:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F6FC1419AC;
	Wed, 14 Feb 2024 23:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="m+p3Fhm2"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2048.outbound.protection.outlook.com [40.107.113.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE5181419A2;
	Wed, 14 Feb 2024 23:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.113.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707953702; cv=fail; b=IZDfKCp+TR55B7SW7l27K1RpP8rJ84uZhii9lmMQTcjcFU8xEthrmyGDkOVMbh663qRclY7/QEZJrwQXTvlPH+ZJgS0fRUF9afY1C2LBd8UD1654SMVZ6zPEsnFLIA6y+tgw/x1+2DHKyMZku+Wk5wtv6bqKs+dtbG76JwK623c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707953702; c=relaxed/simple;
	bh=uP9oKQ57wd5HmLyC6pYP/Q7UmLvVl/Knz0U2VMX8gdY=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=BVzR2ShnO+OeZWtV3Up/pPvAlWu8li0G7QT2U8If2AaTUS/sEF9o29/xQi9r/0QP9F109JWJpAd8fjkWmW7rH4Uvv3kvE6esL+fxSzvFGIqJzDsScwGLsQgw7UcaNB1CICpVVlEKfXWfLfW5aLmKV5TAWXTQATJXBe5XOMPfs18=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=m+p3Fhm2; arc=fail smtp.client-ip=40.107.113.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g0wodMEkVwHLZWlgoOlTHIgh1ZFhyQHUsQkjVBBg56a5+c1dE6bsF/oaGMyxHZyCWfXxMcPTSWtxuuNQ1tVJ2LyWJiym6cOhKWWCwaZ92capglGT33G+7nBnkFuzGn/h14SrrIldIgzQFUEqsg+Pka+wSI5v62CdvMMnqSZOxGEsDmrL5b2Uqrdm0nCPiNmJrQieOYAmobQySy3ZlAaeRkic6G7lmmnwIKz0rdjmtoqdu+pVHtPpsPNKULz4KW3RmKeYoiqMLgB/ZCNlp826YnIn3tZXFYyml4ZbDkUjWzFTCxFKcGbu6wrHL/Y68RZXiVpwABAjSxJfSDuKlW6KZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D8DNiAb3ntPEQfEqcy746fn6MwmI7pUX831+lb9KBOM=;
 b=GrG3L6odCyL4jsJnAoSjU2Lhbzs6v2nSuU9bAPAUdx6R9+iSOTnrXVRWZMP/r7f98BcijqcjhCS6UKAHx+NJIGoEXl9TADTuhYIs6DtCTqJOkIU5ZESSe4NRvZjqQFujl5uE0tFUlY24cvDYLJS65nPbVCbk4Yq5yl0T9sscryCogA+oEvFb3d+YY+y9rAgRx97pnSfa5vHC0c6OMJrUlIFwTxZfjVEPniTxTPlr5LGAqAEBiFfxxf/PBLsILjRe+8psggIE6c+wJNzPqezBuiN254wha20XtkFMU8AYK1ybWtTJ0Pvld8rPoAxpTdAITyw1ycOS9ITgvtWnrzVKKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D8DNiAb3ntPEQfEqcy746fn6MwmI7pUX831+lb9KBOM=;
 b=m+p3Fhm2mEJFYg+i6kSum0mrqkyPVI2wGYfnpfEUNIpBmxn5HiYvCt1+KFBwujf/9l8t+oY7zvGsrQEB3s0RMYJ1BLpQQ5QYMohlAeZlgVUgDtN4AVaF5rlAhgffVn9JpRsfvYFpBS2rhJNsjyaiVgn4bcOjldx7gUF8gEr+M98=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB11464.jpnprd01.prod.outlook.com
 (2603:1096:400:401::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.29; Wed, 14 Feb
 2024 23:34:56 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::4d0b:6738:dc2b:51c8]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::4d0b:6738:dc2b:51c8%6]) with mapi id 15.20.7292.029; Wed, 14 Feb 2024
 23:34:55 +0000
Message-ID: <87h6iahb6o.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] ARM: renesas: r8a7778: add missing reg-name for sound
In-Reply-To: <CAMuHMdXih9g46JKvz_UsjH3h_OrJOJLnFv6ixpYjE6Q4DRxbsA@mail.gmail.com>
References: <87cyszpwmp.wl-kuninori.morimoto.gx@renesas.com>
	<CAMuHMdXih9g46JKvz_UsjH3h_OrJOJLnFv6ixpYjE6Q4DRxbsA@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 14 Feb 2024 23:34:55 +0000
X-ClientProxiedBy: TYCPR01CA0044.jpnprd01.prod.outlook.com
 (2603:1096:405:1::32) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB11464:EE_
X-MS-Office365-Filtering-Correlation-Id: 36f6e205-3df7-438d-eec5-08dc2db58d02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	73I8GZx/oOFhyNz3VnwZiqvyiRx+RUSM/NsoBLum09jYT8a2yycEDMJq8n9OsC76S5ATetCxA1Ko88/CgCyXTjqKdl2MFQQEhoMBGHWxCyVodvynt1Y54nlWP6W63MXRHRiNbLhvhHVlFlJXvyv3sYQtwdyq8Rx6QMBzQsoyGiUb7EDEFggK1iSB0ER9q0qT4iMU/sgMWxGm2zRTdGyAS8IMQtcK+jDGnHQRkAT5kBM8baiyKb4OhPmk4h2C+/VZVPjECQsfE/v2G4HJ6CcvtDC4EUGslNDg5p4bBDvqGebxMDLL7H8Z8Xl1e7c/LfIxKvPOpElU9fU5bQgfoVW3tAQsVtIO+JsSJ97odGwEitM6FKO+K7wq+zh9yjKqHgdVnwA+p/b+KcLO9wl/kMToaq44EuG/Uad8fJFNWcCxjJoN1fRhuVA1po0SQLFtSDvi2SL+kSpI5oueyyOW0V4T6bkIx4DFgweO7r1mebZqSlR3A3Qs6KPxsDSrZDoPPjm3Q1TDhug2L63KlypA5NvbrCI096iNk45iXg5R8msv8muq0FJetZsEHJyoGI+ZafwuZa7928sK5sXf8hhq/cvGcNJEC8kbQLdoJNVs2ceFDuibv9C1yVGP9LB/5ghoZc2x
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(346002)(39860400002)(136003)(366004)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(86362001)(5660300002)(8936002)(66946007)(66476007)(66556008)(4326008)(6916009)(8676002)(6512007)(6506007)(478600001)(52116002)(2906002)(6486002)(2616005)(26005)(38100700002)(36756003)(54906003)(41300700001)(38350700005)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zCEUT4W9vm+W25v+KwMGKKL00s+vTDxmb5KFU5ZUKk9m6ZzpLbZ4oa95w4IL?=
 =?us-ascii?Q?ZbOeGgLjUZF5Egji+B0uyEd2HcA26o3iWu2AIkwfW+mekIe+Lcmx0PZ6L3DP?=
 =?us-ascii?Q?pRjwcCPqAfb4bKIfM8ZzwECuJ4zG4n/KsV6M+2DHJGwPc95QADZGE2v8JEGY?=
 =?us-ascii?Q?b+0g+qI9AicOfzR1yrFHp8YjdfyjFf9/IDswuPwaS6cglddNXIZycRfID7zp?=
 =?us-ascii?Q?LmkXjKx9WIBVNUi0XQwtG8z/hz/YS6PE8H3bCIOUtdFjGu0MTCTolw5FrmBc?=
 =?us-ascii?Q?lQOBsZ1VsfZTjqaR6WrrT4/H23WB5G+KEU+IGK0DUf37MQDub4b5mLVlrcB+?=
 =?us-ascii?Q?a/K9Ac8UOg2tV54HMa8KflkBUcwAJ26AfLIsK6z3dfP3sjV7Ghp3NesSbDYM?=
 =?us-ascii?Q?wt8QySk9krKBaK5LmqA1M3DCvuhwkTDU2U3XvtVn+rrexn7G5QyNncoD3EjB?=
 =?us-ascii?Q?1GnOS8s99QugtzvLIfFSthNA++BFulbGXrw/c3Xc8E9F7Btyr+BjiZq5ajF7?=
 =?us-ascii?Q?Ge0MPwitb6JwaDcltinSrrqUNCdOjhcsCe5cKvzo1j4P4qSV2v/5jKDdvBfx?=
 =?us-ascii?Q?t/qiqEoc+nsrmtJhgEXdFrtl+/6ohhCoI7gKnVx4FcZhJTQ84VhqkMEx47PA?=
 =?us-ascii?Q?dA7aHl4lfPwju1dKnTpV5kyDhfQeW528PclZREParO+nj5BDu1xnYNv9hHBW?=
 =?us-ascii?Q?ng4TD88aN5n0WtvZsBNEuQ71dHx9asjn/QDvIxEr4rdo80iqgfMlyee+aK8a?=
 =?us-ascii?Q?wZGg1Uz6D6uUaepqV9J2jcgHD1hXJqwn91S4KyndDpPCa/NKIwnzCHGBsgdp?=
 =?us-ascii?Q?k2NVq0c5R+QXs9TMiw/g0hyY+LXh4owZJkOY41kV9/uZQzdEaMIJQqrPuphZ?=
 =?us-ascii?Q?/EduPC7jjot9INY40HloWhsAzFBbMPXuWMNbxfX+MvouryxbQ6jwzmqGBWjU?=
 =?us-ascii?Q?pst5mscTDApU74ER88xrr0fR+8cH/M7xckTliMuZpM/ypVFDSaU9GXyLsOH4?=
 =?us-ascii?Q?dgLwhJg01YtJAUXGcqdb6+V70JBqc1LK+5l8Uh4acraCJxqJLrYAhaFrNIy6?=
 =?us-ascii?Q?44IpI+6D9RP+D+zN9e7BJAbX6eAyX0QHqWvFMmSjo0icWFGEInrVKxnKKFAt?=
 =?us-ascii?Q?5XFOqN4TJLQ5cmX0xsFER5oCLuqoniQdEMvHQL+k0xGG9IeJ8BdV2u8oGWeW?=
 =?us-ascii?Q?Wl33u1iRg8JZsEiZVuoWcTyQrb59E2jc5AH04xAcsn49P+Qrai3NrcJFnbBT?=
 =?us-ascii?Q?LfkVR9b3zH0P9gcN8Z7R6K5StaU5655q2OCr3WQHPPO25+Ipr506cGR5p5F7?=
 =?us-ascii?Q?gTtuKNeYlP1waEo+kJ7KmD0g7f3mgFbrLtlWAfVY3xhBI5lumoKNnw4ZUu5E?=
 =?us-ascii?Q?uZUiJE5ME/GlBu4+HdHvupdb5W2APUg+o5hR5GA43zdpCs6HHC32Hgv89MQx?=
 =?us-ascii?Q?ktg7BqwMD+zGV6QRp4tfUImW5x2jJeimD0jPJHR2Uksmu0bJb//N4+2tE2fr?=
 =?us-ascii?Q?mUNJHADHYUE3PyRTCq9yX66k5Fgl2GPmEWF2cT0lqmhhrMcWkikm2R+yIPdf?=
 =?us-ascii?Q?nn7HfmeKbYuVzLLfmx0DGXtkkK84CKDMqu3ec7O88Yte0n9hWorWKbQ1YxSk?=
 =?us-ascii?Q?cOuBXJeYm0/kIMkyiLF5m1U=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36f6e205-3df7-438d-eec5-08dc2db58d02
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2024 23:34:55.8917
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZUoTHTwS18ELpPZW4cpdr+EuyaS92zDYjF+qMk3CpMaqVeF19fN9kekwedZ5hrSjbcZF4B0IewamC2MXW6Hn/S+89SATATlHPkhMcqqq4DFxj41SSkCdaGbN+R6rnZK/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11464


Hi Geert

> > Sound Driver requires "reg-name" to get register info. Current driver
> > try to get register info via "reg" instead of "reg-name" as backup plan,
> > but this support will be removed soon.
> > Use "reg-names" for r8a7778 sound.
> >
> > Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> Nice catch!
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in renesas-devel for v6.9.

Thanks

> Can we just add a line to do that, or is anything else related to
> sound missing in r8a7778-bockw.dts?

In my memory, first BockW support used platform-data style
(= arch/arm/mach-shmobile/board-bockw.c) but was switched to DT style
after that by Ulrich. I don't remember details, but when it switched to
DT style, we already focusing to Gen2 board support. So I didn't use it
via DT style. I guess he didn't test it, because it is missing many
settings to use sound on DT. So, just adding a line is enough anyway.

> I do not have a Bock-W, so I cannot test this.

Same here.

Thank you for your help !!

Best regards
---
Renesas Electronics
Ph.D. Kuninori Morimoto

