Return-Path: <linux-renesas-soc+bounces-24968-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1115BC7A798
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 16:20:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3F1B43A13DD
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 15:17:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58B5E34F476;
	Fri, 21 Nov 2025 15:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="SLEmA4ue"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010031.outbound.protection.outlook.com [52.101.229.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F9B435294B;
	Fri, 21 Nov 2025 15:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763738076; cv=fail; b=W7drOHTmmTIRG5UUEeUK02HY1cKn8eWuVRToPQKkTOZf2VAIxQe1fq+cm7kE+yf9+CKZnMyAO8xOoP+hHzOgvn+48P5egCF5rKZ+P+wb4zCq11PblmqEheX0AOOv3X4NfuhhuISjwsOtF19VfFt7jEx0ARWcEnTU6iaCGZtH5Pg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763738076; c=relaxed/simple;
	bh=Ad3W/2EV7KaRFho3RmNW3LLyFkq2YZ6ywycdAhrXsXk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GByeQnuzr/RlSNxAnG2lSR/C3RKTSPjcvGGCWWodKxgdn8RFFUxTY8Z1zic3dS0H7Eg748id+x11EEa0DWIh6wKrfbjVyZVz/nXwZ9cqgM9iU07hCLVI9Kx/ESsmUIbTijhPNMsf8zoyTRIuvD88edp262LYCdQNDsikn4nU6+w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=SLEmA4ue; arc=fail smtp.client-ip=52.101.229.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BPrkQN82n7oaoyoP9uuyCSTJdzBtBA20gUOyka97VzJWJVsj+ZXXi1084DzW2xxkCSv9a7L7xUrI8MZIxZjl0aTBHZjEG+f/mjjCYZ+RXBARMNTEjUWBIVtGGWzFjAkObTe/EtkCH0W0A3MjTATR1AelkXZdj3vTgdEuKi3kUvnbMyqeiBOvEyzc0xxfSDMT3HaNWitwnFgcFv1hWRFnnCUQNP9B6rpyryIOLQk7FCLW/m9MAlsN/d0WQ4LNwtz2LiKP0eFIByPzV0T2CUuKCOvqYbcdT7To0DqjKQjaiy0J6BlZU+YdvKxeYdcSqXPTJOnukd0DkTVkNgfn7tDGiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FHZEySxw4nx7gNUYL6G0BAeKycmdJsrqR7HcaaoMbiI=;
 b=JuvTmvlSO0E+Us2eg2JPYC5ISTouYknofBrT/KS+3IBRzSBtJpXULx7k7cDhdXoD6hBv8F+faoe0JGKI6DHMDgRFuqTcmaoQY+t/+n/wOY05TswOv9rVF7xGz0Yuqmbvn0ax9+VwSktGYjhT4n0PvIdWT8gRWYa6zA1XzdteKTNHNgQR1QNmtUsR2CI+xg3Cn6JYP+SRv+B6c/bsYfrc1gj0/GcS/tPwdqxQrpEMp3Ba6U5K9lGMkEHiErkDPeeTbcFmogGc4Le2sHT1bQ/OeCHrzEJAqOla4rjzZKlM+0++HKgGqjxWALJy9rUU7KkeNfAN0Uhu1Ta+dqfVUMfPfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FHZEySxw4nx7gNUYL6G0BAeKycmdJsrqR7HcaaoMbiI=;
 b=SLEmA4ue/NR6g0Vb8d5+Mm6kA5MICyR5GgVxbE95iPIfD0Gc5HgQVO2///DSUOfZA33OEXRAUvt8++eiHbWdgjqlCD7gOjnsHdUyjYjskG13/0BLvbVNCX6VQUQrM3XuJ7kRfsmou8PLZJApQSI38nHLNEeoRxJNwKj2MZHyPbo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OS7PR01MB16954.jpnprd01.prod.outlook.com (2603:1096:604:41e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Fri, 21 Nov
 2025 15:14:31 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9343.011; Fri, 21 Nov 2025
 15:14:31 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Peter Rosin <peda@axentia.se>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 12/22] dt-bindings: usb: renesas,usbhs: Add RZ/G3E SoC support
Date: Fri, 21 Nov 2025 16:12:01 +0100
Message-ID: <ef1df11f43d3c12027cc6353f8f8f510f2d8f902.1763737324.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1763737324.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1763737324.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FRYP281CA0015.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::25)
 To TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OS7PR01MB16954:EE_
X-MS-Office365-Filtering-Correlation-Id: 5316ff2c-3988-4116-f99d-08de2910abd3
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Gh8DRXNfuCTaesOiwb0pgLMOc6YsEhT6A9WIEoPTgqt3hxJu4olG5U64+Qyw?=
 =?us-ascii?Q?onhkZuagGZzbLdvNprx6aaskQ2y9umAQRKqTszp68xEvnFYS5skGvkDpExya?=
 =?us-ascii?Q?QlQcyFzXbTyJDD/pn1gNqrYf0MIOSHMs5VFt2NHjHRIMypcVT7wm0eS6Vd3X?=
 =?us-ascii?Q?tlqIXBkjfIMaM7bk9VMzcMYonfanDm97oc3WO3/zgkuPoyW8ITN1BxcD7jb+?=
 =?us-ascii?Q?q4V5lp9+SKoB4qex6DcL6ViNjiaRuSpCwvmPvd0HPIADiRt9bjnyXespRwH6?=
 =?us-ascii?Q?Vjq9hhU2DDF5/8KcJLD91GXSqxy++w0GMvKOCGhqpOFJgzIoWr84u1UUf6hP?=
 =?us-ascii?Q?V3g8t0bic03xmteZt/a7usYdOzcLSbWQwgvc6qGdLI4p/e9ThWqqtGF28Ber?=
 =?us-ascii?Q?CA9gR3JVQPUOVsWmcW6F0RFFzLF/oDShZt60C78kosgm6gE0nahP/GAzpetp?=
 =?us-ascii?Q?ntKsm9TbbHwDt31HX6iKezhmSxT0vQH90B5aOojWgULkh/m1LeWwTmV9Odh+?=
 =?us-ascii?Q?vJEKF6UBEOi30/6w/hzII2PCCliZP5Bo6CEFTJDhja9lClx87mtTbn3oqk4S?=
 =?us-ascii?Q?/M307nCXA8NIyFb1L1kT3N4RgbszFLsweC/JD3LB2d3HIaQlsSait4YmLnjS?=
 =?us-ascii?Q?D0yvH80eY/CNh4XXv9sPjB0/xd9baVBUiRVtc9y3NMu5wK5Q0y7Mba2MIlVn?=
 =?us-ascii?Q?LPM4+pp3w1f7JjKquA6PhJojL09wl6Pwp2pojfE6h3Bmq8WyJQ2udgt7ZSez?=
 =?us-ascii?Q?XTPZtAYPCGn2xzS/LopYRB4SoQf+BPwBRM5juhA9RSjFdaGdxM2BbwB2Jj6F?=
 =?us-ascii?Q?9utHR2ctu4XrvKCW/An3T6NJL/cN2CV8SRhLlXkkQ6Jh/yBJBHLVp1Aty5J8?=
 =?us-ascii?Q?BwdJiimN4h1T+51OKw8atZui9CKxFqGSMozrFcDkICEDX7z/pDvWCoUqv5Ax?=
 =?us-ascii?Q?j6TbiDDUSpBv7Cy4dj0xO1AqtL9ZwCdTzpRG2s+s7aRppxl0LnWxbFnGK1ab?=
 =?us-ascii?Q?OtAf24yfEOOb2xBByYzBtxFNMKxddMYS6AUpGPlSHPoKVZWE07puxqHQJCIU?=
 =?us-ascii?Q?vFl2ffG7cvEbTRO/GRaEH8pf40LpDyiPf2k5ftHdpyTRr8Zlel5ukQNegJmP?=
 =?us-ascii?Q?vfBHfyLilbEGQU8vAzE9CA+7Tz9fioglcU6HA0Fv3S4QIbOGIz4H6wuVUzaD?=
 =?us-ascii?Q?uo1PHz0e5LjY+vETXLq/EPXKhvukaW9ZxSu3nDcQfPTlSSTHMFXDIj/3JhzK?=
 =?us-ascii?Q?4W5DZlRRjuISkuwL2ZJqQQRZnc7IyvlmLo4q5UryayqmL4r9330YbYSXQx0f?=
 =?us-ascii?Q?Sk8feKS99yn+6lF8KTgiL5p7OXgaq2F52P4rQVNvOGHBv08K1t91800dvkzb?=
 =?us-ascii?Q?PL5Dfsg6Tl7cYpGhuxS163yyKf86HZEOWSG+9xtXPpFM3ZlzdT1AY1V0rrKB?=
 =?us-ascii?Q?qVlvnb0QDW+2+5Pwhx9Bt4ir0ys8rTjE/qaIn8RjsW4+O/KakbJK987HcfSF?=
 =?us-ascii?Q?NdqjNqN3mFGfX3NEEhNn2pzw9eUz73t1LyGg?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tp0PwfYdM3LTVOtA4YoiseKK65vuqTeyrmv51m+aGl5zVmEKHI/ef3vlkDOA?=
 =?us-ascii?Q?DRLt3EjZY9bIAzGnAtSFb3tHLqA+edvZaZQFCVjNkwzUau8R2EsporbiKPIS?=
 =?us-ascii?Q?4WiOV8PJ1FXwRhyH+6DDqN8RNQY5IhS436+E6pDVfXazL7mdExwA/54SsOrG?=
 =?us-ascii?Q?yeOEMctzi2vs3zau2LanNiq4/DvGhRoWzODsFL6I41LXomcq1ahX0o4gtMnB?=
 =?us-ascii?Q?yweonSIjsHh/m9L31AK+H2N1TU/tMQrlzckYmuZQVU6INNwBB81bOB6Ma8nE?=
 =?us-ascii?Q?uB6sItUNRwrwhSNE8kJeABWbWUIjlop0roxLC3DV96WsG+qgMV6Qnltcm0Nc?=
 =?us-ascii?Q?7g23FjOJDtMKxAQV2unNO0d6GeNldCJK2SIEcR1w31dFOtiQWsNr5N6+/P//?=
 =?us-ascii?Q?NQxmZr2NfEe5NdLdyXYtQYazep12gE4wQAf8ti0UlvNL3YnE2RPpyOZy6wWL?=
 =?us-ascii?Q?NhsW3n0zKLJy1JT563285WSNvbyRvD53qj6EPfvfk8d0Yvqz8MXkd7sxlvLN?=
 =?us-ascii?Q?X8bpNCYJcUIMmUEd7pVUaha4q912znRq9O5+hKfhnGm3fQWNLQCLY3UWd7zH?=
 =?us-ascii?Q?tnwWd4ggxJgmO/Xk2IICA5w3sC2G/yjM/uFOTgHZWpd29RiCcmJ0cCmkpGzj?=
 =?us-ascii?Q?tf41zLRyT7NTo0lwpCgKshbGXzQPDHQxxubC3JRN7G1cerDseFmxCrClltd6?=
 =?us-ascii?Q?HCeceGONzfBm3J6zICdnr+BN6WWTHnqe2fWzcfezPIKTnOjOt+job3cNh20P?=
 =?us-ascii?Q?NwsdzYYM0vfPOn6Ds1vEjzqYi4n/ZvpBjxpTvANpvQhMT8jCXgbTjfcU2Vrm?=
 =?us-ascii?Q?iW+NSE+usoPQ78apRv6k2Ms7RbBu7i6T8fsplHwv8DcdcHiOjATeWpm6Teyl?=
 =?us-ascii?Q?9A2Y9j7eHp+5YiEs6Yr7RW43e3xhfCakt+5OkpYUSRpTs1ftbbLJl44wwV8f?=
 =?us-ascii?Q?5PZXL6qGC2c6xFy4kn//xiyJYZNHeQLl9K1WNBRv/rr6FWHcMWk4l4III49O?=
 =?us-ascii?Q?OGqR8pZcnXQ4biJNM69gr/G5EoDO808L3+n0M2m1g12FLAM23zLyu1jHd4yq?=
 =?us-ascii?Q?lnwRohHOJWVLQTt1pW+ia0aGautuB9WbqwXlF0CnsEgoQQVi35Ahr6V/pUyt?=
 =?us-ascii?Q?++lEwEZjaqzolXtROk11gKFfJrp8Ck51lFIGJLloUBhM6dlOMxu4S+XzHlWP?=
 =?us-ascii?Q?Q9+Y3Kxqy8hzW8bxpI3ocQzi/c/6djLferS9tD14zpHxOcwHuefFfQ7hHsQE?=
 =?us-ascii?Q?7wLWVkjzZ1Pc3HJR5uLNjZWY9VlO6SHIpuUEKyV/JUXs4ZVU1lzeTomGN4SU?=
 =?us-ascii?Q?Cj58M3ra7j7OSZESBHQz3NJPN03QeVmCs38CLp32nhAMgJghbI/fZIpPxdCN?=
 =?us-ascii?Q?S2s2HNoTgI6wRQvTCAYiU+q4b5RooHiILf/SFIgcQDOnec0fo5CG6kUwk/U4?=
 =?us-ascii?Q?UYpYslU/CxLZmjh0WRylK0LAHPAvYfhW8r9noNZP1bcDsC14Ui4eda5IFzZ7?=
 =?us-ascii?Q?6hJWGqjQw8Ci+R//z3QK78QrMW6vvlipxxVNo01NDJ20wKVYIuKgV5cGX8hB?=
 =?us-ascii?Q?nNUxAD6YuHR4yQrcAtKYKWOX3LSxCdNk7fPnMzvjaNdNWGCVNVdP63GwJ1oy?=
 =?us-ascii?Q?OuvGqqosehGwlvX8mgqTVQE=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5316ff2c-3988-4116-f99d-08de2910abd3
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 15:14:31.5677
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lkXEdOKATLg+Xt+8tXEmmM7jQaLb8hvkDRwnckKsgiQJL8rgAicZ+frTEEan7iPHAlQH3DVwMJ/VmaTbMaxGb9H1lKzE/rkJggQOysNbWIUnQRUseryWl/AaAruYrSRF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB16954

Document the Renesas USBHS controller found on the Renesas RZ/G3E SoC.
The USBHS block on RZ/G3E is functionally identical to the one found
on the RZ/G2L family, so no driver changes are needed. The existing
"renesas,rzg2l-usbhs" fallback compatible will continue to be used for
handling this IP.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v3->v4:
 - No changes

v2->v3:
 - No changes

v1->v2:
 - Collected CDooley tag

 Documentation/devicetree/bindings/usb/renesas,usbhs.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/renesas,usbhs.yaml b/Documentation/devicetree/bindings/usb/renesas,usbhs.yaml
index 0b8b90dd1951..dc74e70f1b92 100644
--- a/Documentation/devicetree/bindings/usb/renesas,usbhs.yaml
+++ b/Documentation/devicetree/bindings/usb/renesas,usbhs.yaml
@@ -27,6 +27,7 @@ properties:
               - renesas,usbhs-r9a07g044 # RZ/G2{L,LC}
               - renesas,usbhs-r9a07g054 # RZ/V2L
               - renesas,usbhs-r9a08g045 # RZ/G3S
+              - renesas,usbhs-r9a09g047 # RZ/G3E
               - renesas,usbhs-r9a09g056 # RZ/V2N
               - renesas,usbhs-r9a09g057 # RZ/V2H(P)
           - const: renesas,rzg2l-usbhs
-- 
2.43.0


