Return-Path: <linux-renesas-soc+bounces-31935-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YHVjEmxq+GmauQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31935-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 04 May 2026 11:44:12 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B35CD4BB28F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 04 May 2026 11:44:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 772E7302BA66
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 May 2026 09:39:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7844D377EAF;
	Mon,  4 May 2026 09:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="LhkAerVZ";
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="LhkAerVZ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11020105.outbound.protection.outlook.com [52.101.69.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92BE337CD55;
	Mon,  4 May 2026 09:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.105
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777887551; cv=fail; b=Kc/JoSUGQvgtVgTFFq8q6QpHEpRrmWqqvh/hfBdOX9buHb8vg/b8li3/IYFycPKIvl5DvrnEnXwfpR/K5U39zr8RErx2Bdw8dyhFekpqqFXZBoDu4Lg0ufAtYz5nG8ib3blTum89rPacMDGM0p7xTEkgUgs8Q6yNCsTj/N174ek=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777887551; c=relaxed/simple;
	bh=hZNiBqL5hNgXOSalrp6LZ0zPaUxuZ2zXz32Bh0Ps80w=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=LSXJ8dNjQ2zrzWnH0ApNcPsxfdvKA0E07TftgOje4pO02iw7/rVcBUATVvhDqqMcGedfywEFWd+pgzWNgiUnA1WCr95tksOBBEf/rLYTcwmmin2L09fBVKxlwvEMhgpkcNV4RSLkDckpZGh5qzWWIk5XxMkC/vk4p9jh4ZDmtFg=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=LhkAerVZ; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=LhkAerVZ; arc=fail smtp.client-ip=52.101.69.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=DVaSOe/uFcZmWGTEbK8vroA4pvFAhlZApEPgJn3yAsmzJY8qverX5KQBqe/a8l+yGkrFx3FX99itmDpostqPSk2D30DPpfAaCxyafCqjqGOS79BUyxQv+aaEPX/yZQ3X/j96BIuLYwOJOMsVMz+YVVt/oeyi49Nzd/QzWq02TSCBNoaGXtJ7U3RxX/6QfPao7qaqmEch2o1TMqpVhccqSgh6rVLw1Q43Mq4ym3Yop3CFUexDPFYDDFC5YjdsMtLbJFJumBgsNSaNg5jOWQJBCmj7i5DQn7TvoF0vx2CsVEpw0wbrBZeO5bzR3dN79z2K0Jk6779iI6t0Nf6L/hdJWw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hZNiBqL5hNgXOSalrp6LZ0zPaUxuZ2zXz32Bh0Ps80w=;
 b=gmleTDkUmWC6IMp8YIzRofBFsxPrL/M6kv+vctcT7cRGA44+7yUv1ZZnA4PMWKQaCL4zcznWojKHcgMAhWt/6a3nU41z4+JpW/L5HQ65qAsRfsLZBx6HOj6Xjrc0pAlRzfMX06gu5G2K97wF/gquWbodTtGltaiBzQn88n/z3kgvY7XgHoTVHR3bRUZg7GtMgaetYK3mailuY6CSDEi60/EI4HZnHlK3Utpry5/DLxt0UnGwv1zLfuyCefi1RgtGIrloLNzPgRlO6DYV/FmJEX9ErNqatWS9f8iBwlcsx79uLD8CU06gMdD73jjEam5LIio2YmdPLRd0UuDBccIG3w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=gmail.com smtp.mailfrom=solid-run.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=solid-run.com] dkim=[1,1,header.d=solid-run.com]
 dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hZNiBqL5hNgXOSalrp6LZ0zPaUxuZ2zXz32Bh0Ps80w=;
 b=LhkAerVZd7k+BKpYs3zeYPt5SBYI+Dq8iZPGxVBVEiW0TEdJ/zV9yrIlgeSqN7fuCMrZKRYitutpQmfeQZ1LfPid6Y+eRp5M9l6YfNnJHTyccpLpbCI/kxkz4UK25+Lz3cyOT3zTz7Kyatf2v7Jnn5qhwILvJjxuAuqXMGbMtjHO/i9Z80VJerKRJAkaf2gXQau4cP8jl74S5fG0XbYbzpUcRSJjYg7HxWAlsyUOusu17tkiLy1KZXGgf1SLKbg3rgZn0OlrQq98R41ubAFsGdDhePxp4jO7XwfdZAQURfFDEK/3IIakFAvaYQOEExkhc6vmMefqX7zdptz/70GtMQ==
Received: from AS4P189CA0056.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:659::26)
 by MRWPR04MB12095.eurprd04.prod.outlook.com (2603:10a6:501:9a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Mon, 4 May
 2026 09:39:04 +0000
Received: from AM2PEPF0001C712.eurprd05.prod.outlook.com
 (2603:10a6:20b:659:cafe::6f) by AS4P189CA0056.outlook.office365.com
 (2603:10a6:20b:659::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.25 via Frontend Transport; Mon,
 4 May 2026 09:39:04 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com;dmarc=pass action=none header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AM2PEPF0001C712.mail.protection.outlook.com (10.167.16.182) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.9
 via Frontend Transport; Mon, 4 May 2026 09:39:04 +0000
Received: from emails-4481735-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-6-105.eu-west-1.compute.internal [10.20.6.105])
	by mta-outgoing-dlp-291-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 738DB7FDCA;
	Mon,  4 May 2026 09:39:04 +0000 (UTC)
X-Mailbox-Line: From b'josua@solid-run.com' Mon May  4 09:38:56 2026
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G1+Wl6xUU2TSCffYyycpTHsOguvPtFbefo/Brn8okxFHR1PZbavow0aFPLp0d6J1wMxLNm4qUrpo9xgRqGMjbxGrAn+dCgToQBqiRf8X8cB0HdANhHlJmeX5X7iqyBZgTkJQQ6TFRUrap9O+DiXEG5J66rvZiBa4bXuxvq8DAqe7+eEBLCoTd863KbPf76eB7w4TddxvzymvE3haiv4IXzdJdTKtt+rJUz82CpLnelblkYwKOuZ+4bdhS2BqCXW2R5KaK8vxRv5n+uAtIlDXqRGb6HVNTV2J4b/YRFyn93dVoiqq0OayJKS1A+rp4zvto5e3eeysVkZwMSI9UNoc3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hZNiBqL5hNgXOSalrp6LZ0zPaUxuZ2zXz32Bh0Ps80w=;
 b=PzZ6DW36qgZndNw9ml6ZTFyVbhBDB9Cdlx4wfwTyZKo/JSGh8OJI7DVZldlM9sRnfa1lj5JShX56X9zuNDWDV0owKKkGeboF5tA2u0huYold1YN6WYWltLHMBejC1Ul+Yl32dENOf5G55gOBITT3xGf2SinLRAqh0px4TNDhtJTfuyG3L9WQqjo4Lp9mX5E6Z/Ao0W2kPuw2r147Oq96txMeGP6bGyId9ivMVepCC6sGAzsfZy6Ze9QZMGnPlQ2wtHMfHYwYwjpBAfiGeqOu7ph9yfJ2UlM8Mt/2xDv5aQ2a056ND8h3jBkCtOIqCBPWIOJFF3CAvna2GfpyXS3iDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hZNiBqL5hNgXOSalrp6LZ0zPaUxuZ2zXz32Bh0Ps80w=;
 b=LhkAerVZd7k+BKpYs3zeYPt5SBYI+Dq8iZPGxVBVEiW0TEdJ/zV9yrIlgeSqN7fuCMrZKRYitutpQmfeQZ1LfPid6Y+eRp5M9l6YfNnJHTyccpLpbCI/kxkz4UK25+Lz3cyOT3zTz7Kyatf2v7Jnn5qhwILvJjxuAuqXMGbMtjHO/i9Z80VJerKRJAkaf2gXQau4cP8jl74S5fG0XbYbzpUcRSJjYg7HxWAlsyUOusu17tkiLy1KZXGgf1SLKbg3rgZn0OlrQq98R41ubAFsGdDhePxp4jO7XwfdZAQURfFDEK/3IIakFAvaYQOEExkhc6vmMefqX7zdptz/70GtMQ==
Received: from GVXPR04MB12057.eurprd04.prod.outlook.com
 (2603:10a6:150:313::24) by AMBPR04MB12566.eurprd04.prod.outlook.com
 (2603:10a6:20b:77a::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Mon, 4 May
 2026 09:38:54 +0000
Received: from GVXPR04MB12057.eurprd04.prod.outlook.com
 ([fe80::14f1:a127:2988:de5b]) by GVXPR04MB12057.eurprd04.prod.outlook.com
 ([fe80::14f1:a127:2988:de5b%7]) with mapi id 15.20.9870.023; Mon, 4 May 2026
 09:38:54 +0000
From: Josua Mayer <josua@solid-run.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Jon Nettleton <jon@solid-run.com>, Mikhail Anikin
	<mikhail.anikin@solid-run.com>, Yazan Shhady <yazan.shhady@solid-run.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/4] arm64: dts: renesas: Add various SolidRun RZ/G2 based
 boards
Thread-Topic: [PATCH 0/4] arm64: dts: renesas: Add various SolidRun RZ/G2
 based boards
Thread-Index: AQHc2u6Fsi7GUR9ICE+/GNWdITT8xbX9j3GAgAAOVgA=
Date: Mon, 4 May 2026 09:38:54 +0000
Message-ID: <a8e92cd6-690a-4741-a273-6bd7f53222fa@solid-run.com>
References: <20260503-rzg2-sr-boards-v1-0-8545677f93ca@solid-run.com>
 <CAMuHMdV=SVDL=7vShMgBas4KyUy7_XWs_9khLZSdggJofsA+VA@mail.gmail.com>
In-Reply-To:
 <CAMuHMdV=SVDL=7vShMgBas4KyUy7_XWs_9khLZSdggJofsA+VA@mail.gmail.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=solid-run.com;
x-ms-traffictypediagnostic:
	GVXPR04MB12057:EE_|AMBPR04MB12566:EE_|AM2PEPF0001C712:EE_|MRWPR04MB12095:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a34c77c-6382-4113-bedf-08dea9c0fb43
x-cloud-sec-av-info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700021|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info-Original:
 CSVCTW8X3TOHw2j+rNMnowp9eVAtaMk49PMv3v81dgbNBHRnnZZhJrfkrDKTW3YBB0XHmklVJAGbNj0XbIqilBkXVkY01ziIIjaUMiRAXXk9ovbJRhOWw+IpcBglBa9arbzhn8PBxnOyukwFSnhkGZSUN0mJqqRVn3fQ528w4nYctIYpg61WTYukpNM9PYRECHgAlwlYyrxnjPqw+BT7n29F1PxAo4nq5BTqDnWTFkDA+NF7stDoztfH1Qb0mvLCH6JqqaXzI3OI38hzoTPvTAU7aW9QsuS/S7ovu6yuUS4w9H6hldDXDxvF9/r7lTKWZWM521r8KbNqdi/siVKzIYIQqQs3a10T5BkWn7x6rARsHUHgaShQZOUHhXr8aWoHXwt3yV1jFYlZlU82pQwkD42cgQb2vg87Ta0a1hMrqeUAY5EHUAfZXA8PboAGH/GT5T2Tbdi9yHseVIsHWdxREdtlvsVno8GvsNC7YAO0gt67+IUDX8BJTxqp3PHFn8xFQ8GxU5KyiJC2hnq7exQv5GQo1DjOEsibK0ZQi8MSqR3sGfH3BCkkvwk5A7gJV52/yeGjgh0aolmf9tNPcuYyCBfeKmOKnzpy3NENXby0OVXaLVXznzKcsPZkJdN2w5KKRdtpOK+zMsFmih462Oixi05GbEi3K+sZN8se427sBpkUsj01DEeowZicYFw5liIC0ZHc5wcAhw3qPssKND+XYniyMOzOQ2KeQnEnE7+RhTKw1mtlmUoe5FtCuAhiA4+Q
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12057.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
Content-Type: text/plain; charset="utf-8"
Content-ID: <8BE83250107C844396003098C6DD7F6A@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 dahWu04/mgGjfMmasIqfvue7V97Sv8e5cLUPTUuixpvf4veuZTDXxFcx4lgUBNFopROXEr4wniNyM2CxbBdFfPTHIn110HA2aBpdJ0lSRIiQP9yau/YPtwwY0gxVWLvcga2PSmVRsAT9n1VFKyTYqAJAGTZRz8Vc9AcjaQOFBbjvtRo1IvU6RJ0196+pLxiQLnwxH641v0ATv7Hym52z6zn1GN/JabjmyrmrZnucK2WgCPGnOgZG3EjCjAB1KYr9ed/vaqGSeCUavPYIXJc0RjZjDfo15ZJ2q3EcMlKF369FQgcFTIC1f3MHTrfFYqp5aqpsM7abhg9M2SbLm+QsNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR04MB12566
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2-6.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: e40a84223d0f4b82840b1eb1ac6108e7:solidrun,office365_emails,sent,inline:7c670dcd729a2a5659380d732372f642
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM2PEPF0001C712.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2c14fab6-5327-4126-274c-08dea9c0f51e
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|35042699022|14060799003|1800799024|36860700016|376014|13003099007|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	rg3reerx5zA2GcBGWWmMQvKi2Fi2hRJKupy2HgCKXwuxWt7VTQuoSkj5Wgy/peS5fTVAUSLYr+qd6KhKEadE0dkPShslHRFrB+BGsEiaxoBYYTnE5CAtsRkeriEdZMu1ymjkaTMhSMyELBn2e2gaSUmjdiuH4vkBhfdiUOY2MF+8sikymM23OFbBp4Ejjsj0qCHNuSPSCWyBq39eKWzzoCSxtenXVC9gctCCBleUd9QbDF7Ydo+lpx6ypEHECL/hBDra1I0JdzBQKo+Vcb76jp9lM/pM6Vgyr/YFcIGh+xeEPSsnPSwzJdZzsbsvR/R2w1ywKL1JAchmikAk2g1ZokHw9cSK/HfI1y8rzrr61oeqTS2IFShiKTsDZYacFuAcvVCNx50QglSLp/SoiaXuMnCPxtGUKKqkhrELJY67CaqtQZcfB7p6TFd5g9F2bjJBNuM9X9mJrqoFowuMq+yaPVMzTCe4XMnamnSCYd4IBaGBtyH+HM3epztgoZQxC1hSAW3mkPSW5PkTWBMKluXEb1IL4tYP+CfVe5WO0siAtz1VoiqOioRGKbj6B+ziu5LHFOwrH39Q4DqDEwNrJtCsZ3FGUUoiix1aXnUmTpmDXcI23N4HmEzJr8rBP3L/sEuHSOmM9WjmOAony3P+FRKJzHC32crsAKN7V7/Io4k4RZI=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(82310400026)(35042699022)(14060799003)(1800799024)(36860700016)(376014)(13003099007)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	W7QOYBdlrNFDP3d5kqrzziFyzpnLQ1EtpnCMrLuVWi1U2Meb3yJXf98vnXBPZGTOTi9+hOUZsJtdYHE8EuqgJCh67DOu8iyDCoE90sGpxlj48pDa7lg6QdP8eOILL0FyCANjDPN/hW4RrBcaiADyG6f0pGq9u6VXtlEfHcdW3tSO5Edi6cVxuEK8Xmx386hpbk8Q6a8mT5zB4d7qwwezGooFrewLRbGgNV0TNsgxQifZBVDHych3SM+HQkTTH/WlqjdYpKwWFmQOj7+P5ZXLhoGrKHgxg2xD5JpSwbG43Ot7TytznTUcpWWEvUBcbO/wTA+PQ7S5nQUCaI3KxHZVe/R9gAmSom3TkRvwMJ/o8TYSygpUjPvs60e2ak3Si27NwQc0tl6rpUGP2IvUfOqgsfUxP+ZrL+xuzs5p7gtCqz3UJVDKlp3UGigwW7ByULSH
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2026 09:39:04.6550
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a34c77c-6382-4113-bedf-08dea9c0fb43
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM2PEPF0001C712.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR04MB12095
X-Rspamd-Queue-Id: B35CD4BB28F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.94 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=3];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[solid-run.com,reject];
	R_DKIM_ALLOW(-0.20)[solid-run.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31935-lists,linux-renesas-soc=lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,solid-run.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,solid-run.com:mid,solid-run.com:email,solid-run.com:dkim,solid-run.com:url];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	FROM_NEQ_ENVFROM(0.00)[josua@solid-run.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[solid-run.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[9]

SGkgR2VlcnQsDQoNCkFtIDA0LjA1LjI2IHVtIDEwOjQ3IHNjaHJpZWIgR2VlcnQgVXl0dGVyaG9l
dmVuOg0KPiBIaSBKb3N1YSwNCj4NCj4gT24gU3VuLCAzIE1heSAyMDI2IGF0IDEzOjE4LCBKb3N1
YSBNYXllciA8am9zdWFAc29saWQtcnVuLmNvbT4gd3JvdGU6DQo+PiBBZGQgc3VwcG9ydCBmb3Ig
YSB2YXJpZXR5IG9mIG9saVJ1biBSWi9HMiBiYXNlZCBTb01zIGFuZCB0aGUNCj4+IEh1bW1pbmdC
b2FyZCBJSW9UIEV2YWx1YXRpb24gYm9hcmQuDQo+Pg0KPj4gQmluZGluZ3MgYXJlIGFkZGVkIGZv
ciBhbGwgY3VycmVudGx5IGtub3duIHN1cHBvcnRlZCBib2FyZHMsIG5hbWVseToNCj4+IC0gSHVt
bWluZ0JvYXJkIElJb1QNCj4+IC0gSHVtbWluZ0JvYXJkIFBybw0KPj4gLSBIdW1taW5nQm9hcmQg
UmlwcGxlDQo+Pg0KPj4gRGV2aWNlLXRyZWUgYXJlIG9ubHkgYWRkZWQgZm9yIHRoZSBmaXJzdCBi
b2FyZCB0byByZWR1Y2UgZWZmb3J0Lg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IEpvc3VhIE1heWVy
IDxqb3N1YUBzb2xpZC1ydW4uY29tPg0KPiBUaGFua3MgZm9yIHlvdXIgc2VyaWVzIQ0KPg0KPiBG
VFIsIEkgZm91bmQgZG9jdW1lbnRhdGlvbiAoaW5jbC4gc2NoZW1hdGljcykgYXQ6DQo+ICAgLSBS
Wi9HMkwgU1lTVEVNIE9OIE1PRFVMRQ0KPiAgICAgaHR0cHM6Ly93d3cuc29saWQtcnVuLmNvbS9l
bWJlZGRlZC1pbmR1c3RyaWFsLWlvdC9yZW5lc2FzLXJ6LWZhbWlseS9yei1nMmwtc29tLw0KPiAg
IC0gUlovVjJMIFNZU1RFTSBPTiBNT0RVTEUNCj4gICAgIGh0dHBzOi8vd3d3LnNvbGlkLXJ1bi5j
b20vZW1iZWRkZWQtaW5kdXN0cmlhbC1pb3QvcmVuZXNhcy1yei1mYW1pbHkvcnotdjJsLXNvbS8j
ZG9jdW1lbnRhdGlvbg0KPiAgIC0gUlovRzJMQyBTWVNURU0gT04gTU9EVUxFDQo+ICAgICBodHRw
czovL3d3dy5zb2xpZC1ydW4uY29tL2VtYmVkZGVkLWluZHVzdHJpYWwtaW90L3JlbmVzYXMtcnot
ZmFtaWx5L3J6LWcybGMtc29tLw0KPiAgIC0gUlovRzJVTCBTWVNURU0gT04gTU9EVUxFDQo+ICAg
ICBodHRwczovL3d3dy5zb2xpZC1ydW4uY29tL2VtYmVkZGVkLWluZHVzdHJpYWwtaW90L3JlbmVz
YXMtcnotZmFtaWx5L3J6LWcydWwtc29tLw0KPiAgIC0gSFVNTUlOR0JPQVJEIFJaL0cyTCBJSU9U
DQo+ICAgICBodHRwczovL3d3dy5zb2xpZC1ydW4uY29tL2VtYmVkZGVkLWluZHVzdHJpYWwtaW90
L3JlbmVzYXMtcnotZmFtaWx5L2h1bW1pbmdib2FyZC1yei1zZXJpZXMtc2Jjcy9odW1taW5nYm9h
cmQtcnotZzJsLWlvdC1zYmMvDQo+ICAgLSBIVU1NSU5HQk9BUkQgUlovRzJMIFBSTw0KPiAgICAg
aHR0cHM6Ly93d3cuc29saWQtcnVuLmNvbS9lbWJlZGRlZC1pbmR1c3RyaWFsLWlvdC9yZW5lc2Fz
LXJ6LWZhbWlseS9odW1taW5nYm9hcmQtcnotc2VyaWVzLXNiY3MvaHVtbWluZ2JvYXJkLXJ6LWcy
bC1zYmMvDQpTaG91bGQgSSBpbmNsdWRlIHRoZXNlIGxpbmtzIGluIGZ1dHVyZSBjb3ZlciBsZXR0
ZXIgLyBvciBjb21taXQgZGVzY3JpcHRpb25zPw0KPiAgIC0gSFVNTUlOR0JPQVJEIFJaL0cyTEMg
QkFTRQ0KPiAgICAgaHR0cHM6Ly93d3cuc29saWQtcnVuLmNvbS9lbWJlZGRlZC1pbmR1c3RyaWFs
LWlvdC9yZW5lc2FzLXJ6LWZhbWlseS9odW1taW5nYm9hcmQtcnotc2VyaWVzLXNiY3MvaHVtbWlu
Z2JvYXJkLXJ6LWcybGMtYmFzZS8NCj4NCj4gSSBiZWxpZXZlICJCQVNFIiBpcyB0aGUgUmlwcGxl
Pw0KDQpDb3JyZWN0Lg0KDQpNYXJrZXRpbmcgdXNlIEJBU0UgZm9yIHByb2R1Y3QgbmFtZSBpbiBj
b21iaW5hdGlvbiB3aXRoIEcyTEMgU29NLA0KaG93ZXZlciBpbiBjb21iaW5hdGlvbiB3aXRoIG90
aGVyIFNvTXMgaXQgaXMga25vd24gYXMgUmlwcGxlLg0KDQpDb21wYXJlOg0KDQotIGFyY2gvYXJt
NjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDhtcC1odW1taW5nYm9hcmQtaWlvdC5kdHMNCi0gYXJj
aC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OG1wLWh1bW1pbmdib2FyZC1wcm8uZHRzDQot
IGFyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDhtcC1odW1taW5nYm9hcmQtcmlwcGxl
LmR0cw0KDQpUbyBhdm9pZCBjb25mdXNpb24gSSB1c2VkIHRoZSBlc3RhYmxpc2hlZCBib2FyZCBu
YW1lLg0KDQoNCnJlZ2FyZHMNCkpvc3VhIE1heWVyDQo=

