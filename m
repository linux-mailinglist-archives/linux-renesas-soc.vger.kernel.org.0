Return-Path: <linux-renesas-soc+bounces-31901-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cIMDOxRm92n6gwIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31901-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 03 May 2026 17:13:24 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C6B4B6318
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 03 May 2026 17:13:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9C79F300130F
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  3 May 2026 15:13:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99EDC2C324D;
	Sun,  3 May 2026 15:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="FFWKwdih";
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="FFWKwdih"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11023127.outbound.protection.outlook.com [52.101.83.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D51F82C21F1;
	Sun,  3 May 2026 15:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.127
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777821202; cv=fail; b=EraauYTIdS8gD2VGIXZ9MzgiDkfOmUgCGSdy4/bqqYNQ5Nadybx7hN2whPBvlepTsnrPDo+HTmb3RzC63enjt9EZ4+tVb6XNPtrY+IrTBWvhzxYoyKt448z4/RVGMziAlMqAS2cDPkyat9mM1VyROG7hk2Wo8pHuMIfh0jM0e6Y=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777821202; c=relaxed/simple;
	bh=5WeI+9JAp/TWKZwfBiDzUS9bt1N8wBaNFEb9FBp8NMY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=D0ECmPN5O+582BSgMvbRkctKeD6dPHGu2Rp4fHCJef0NVMBPCnLaVnmts7zsLWHVBmU96mKqJ6wUwh5q2OV47tD+16P9rq/EDF3QYL68AVvId8GLqAf3WCJGYzVyp3mgvnEjG+ilgjrklZtVRqX4aqo03xu2RE0Y0oQEpLaw5Iw=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=FFWKwdih; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=FFWKwdih; arc=fail smtp.client-ip=52.101.83.127
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=PYaOr3MXtQqzEJT2nbABHEONmRfA6JNobxug5Khi5nzvrkwR0dk2csotjQJuCKEJcGKVHV6RCY0Ff95/5VeqKzuDGPTxqyIruBYR+/PrsrE1ywZC+iPZATNZSoDc33sQr05Tp9DEDWzE0LDoudbJfDEtmq7HGndE2rGg8wj64dZrZUjEPxqZuq7JnG9JkVg3QPkVULA9+89G76K1fXT7Q63T+k2HTP/pnjuVfNF5mjEHIBI5zaWacFKrh7SS3A6cA3J0Ax8XVfWr4EQmluqIzRhig/tfq26cRNhgCBvSwmfDtRBDWvFUM47CFTxaKAwPmnJQxS5T5m2rYEk3pEuvbA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5WeI+9JAp/TWKZwfBiDzUS9bt1N8wBaNFEb9FBp8NMY=;
 b=QA/WihNSHgxRK43VouJjDYYdbszRHNWeT1wWMbRTuJVBhtNMKFCsLiKBUwwEgR0pKkKtjMEWh2V/0GZdZ3PFz8jzeJhrw1fCNRPNuICxPGFh0+bJCzeRgKOvGAyF/TlzA/wjXi2b1ZIkBi2WSgQVP5HeUy7aIYc/5DsZiboLdXOKhxIk2CU90wVNyOgIlri/H2zrkOB54vASoSeJqM4ptca8KMEjN3HzA4HyR41j/vw0n0w8y718K7hh+gC55t0/zs+23rbKD1YZsjJFpWstNF2XhXExXLsIlVGHIuM4DYtHpRiHZeOHTvnm80QK+lp4VVBV3bI7mbJ/388QEvdilg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=bp.renesas.com smtp.mailfrom=solid-run.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=solid-run.com] dkim=[1,1,header.d=solid-run.com]
 dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5WeI+9JAp/TWKZwfBiDzUS9bt1N8wBaNFEb9FBp8NMY=;
 b=FFWKwdihCaiDdvaqLpTcLePsgsFxtwErUkLdSGB4pFU/p2tvz9d9RRhzwAVlrLO6+DAAeiWqI2VeU1tc9hEVV9nHfx7FoP+Nc/GAGMidWL0X+uaX4BrDbXzLAPhuN4BC75VIC91JTSPh2wA7CwXujcTJ58aAg1eSYm6IP8+HpFFqC9HKjP+iyjvgofu1nS/6E8lnMTb49s9j+8AbHny/l/oFduOF8fKLL7egQWt0HHDP/aAVrBP9H0x7l1ovnyRvK1X2gM8MP6h3E7RRyiMTTBYhreZM/EW9mvcjCfva0Yo1uf6ckm9SiD7M65mTsHrk0fI0nCu/56AdGSkRzpQo+A==
Received: from DU2PR04CA0233.eurprd04.prod.outlook.com (2603:10a6:10:2b1::28)
 by AS8PR04MB8167.eurprd04.prod.outlook.com (2603:10a6:20b:3f9::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Sun, 3 May
 2026 15:13:16 +0000
Received: from DU6PEPF0000B61D.eurprd02.prod.outlook.com
 (2603:10a6:10:2b1:cafe::38) by DU2PR04CA0233.outlook.office365.com
 (2603:10a6:10:2b1::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.25 via Frontend Transport; Sun,
 3 May 2026 15:13:16 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com;dmarc=pass action=none header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 DU6PEPF0000B61D.mail.protection.outlook.com (10.167.8.137) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.9
 via Frontend Transport; Sun, 3 May 2026 15:13:16 +0000
Received: from emails-7165981-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-243.eu-west-1.compute.internal [10.20.5.243])
	by mta-outgoing-dlp-291-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 701487FD2C;
	Sun,  3 May 2026 15:13:16 +0000 (UTC)
X-Mailbox-Line: From b'josua@solid-run.com' Sun May  3 15:13:08 2026
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dHl+5yZeMAiN7miiivYNqwlxCjJpX8YIHIE0N8MALywM7UINlvxiYuDsgIYp6uM+gN/wDqwNuXCQIh0cX9UOuhsigRcypqnoUnNPqqOCRzH/CuNTxrBbQJEBgif4b/tTdiGC1BWCdEgCXBYsAhPpudTisyNMGfOuoj4AOFkaoKOV5Bx4I4QhVeAROnpOxh4CLS8YBZ+COA4DTTcNupuNa1jqbISSCuvssPvMOFAFL2yrMFxjl5gxZsoYxCFQ9Ilxoq5B88iMNGNPA8XgKtd7ntKy0h8lFrQy5dFXOpBeRDhLbKZESXJ7Tk/2xRZbl8/xQDQhrhjVTPpJH+SVBeQmZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5WeI+9JAp/TWKZwfBiDzUS9bt1N8wBaNFEb9FBp8NMY=;
 b=NaQO5zIrBYATAYyP/IgkW7V0yGJpuYjG86fQiIYJxV8+n7w3tiVr2CHf0PSc+4CCQMNvWyQAlaVU81n1km1j/SLuSdlE5un2zYkGS9J9mJNb8OeQK5jXXODmrYmcO5rqpIM/qHGFiIawmiOBNij/fALsc64wEf7VxuZIaVGDyYnCRAK7YbDGzkLypC4QZeekGSGf4NrYZTfNnQgTU5cDUFmajtUMclWuy6/DJepqqQQctyhKAphJxWcRHcqTHA1Nusl+J1F8L3QJCXp2LalSvd+JE6oRKya2ErCTqIcYfAmUWtsDjzDv50f3q6IjaR6MCLMhg0vfutbq77kyNfXaBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5WeI+9JAp/TWKZwfBiDzUS9bt1N8wBaNFEb9FBp8NMY=;
 b=FFWKwdihCaiDdvaqLpTcLePsgsFxtwErUkLdSGB4pFU/p2tvz9d9RRhzwAVlrLO6+DAAeiWqI2VeU1tc9hEVV9nHfx7FoP+Nc/GAGMidWL0X+uaX4BrDbXzLAPhuN4BC75VIC91JTSPh2wA7CwXujcTJ58aAg1eSYm6IP8+HpFFqC9HKjP+iyjvgofu1nS/6E8lnMTb49s9j+8AbHny/l/oFduOF8fKLL7egQWt0HHDP/aAVrBP9H0x7l1ovnyRvK1X2gM8MP6h3E7RRyiMTTBYhreZM/EW9mvcjCfva0Yo1uf6ckm9SiD7M65mTsHrk0fI0nCu/56AdGSkRzpQo+A==
Received: from GVXPR04MB12057.eurprd04.prod.outlook.com
 (2603:10a6:150:313::24) by AMDPR04MB11701.eurprd04.prod.outlook.com
 (2603:10a6:20b:71a::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Sun, 3 May
 2026 15:13:05 +0000
Received: from GVXPR04MB12057.eurprd04.prod.outlook.com
 ([fe80::14f1:a127:2988:de5b]) by GVXPR04MB12057.eurprd04.prod.outlook.com
 ([fe80::14f1:a127:2988:de5b%2]) with mapi id 15.20.9870.023; Sun, 3 May 2026
 15:13:05 +0000
From: Josua Mayer <josua@solid-run.com>
To: Mark Brown <broonie@kernel.org>
CC: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm
	<magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, Jon Nettleton
	<jon@solid-run.com>, Mikhail Anikin <mikhail.anikin@solid-run.com>, Yazan
 Shhady <yazan.shhady@solid-run.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH RFC 2/2] regulator: raa215300: add support for
 configurable 32kHz clock output
Thread-Topic: [PATCH RFC 2/2] regulator: raa215300: add support for
 configurable 32kHz clock output
Thread-Index: AQHc2k29cM/V2zy5/0StYCooPklNNrX7euaAgADodwCAAAa0AA==
Date: Sun, 3 May 2026 15:13:05 +0000
Message-ID: <c2413501-891a-4569-96b4-846b8a01dda8@solid-run.com>
References: <20260502-raa215300-clkout-v1-0-fd1c2a240963@solid-run.com>
 <20260502-raa215300-clkout-v1-2-fd1c2a240963@solid-run.com>
 <afadX4IC9o-zj6qC@sirena.co.uk>
 <01bf5fdd-17f9-4ee6-95a7-561f715ec387@solid-run.com>
In-Reply-To: <01bf5fdd-17f9-4ee6-95a7-561f715ec387@solid-run.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=solid-run.com;
x-ms-traffictypediagnostic:
	GVXPR04MB12057:EE_|AMDPR04MB11701:EE_|DU6PEPF0000B61D:EE_|AS8PR04MB8167:EE_
X-MS-Office365-Filtering-Correlation-Id: 13135636-23f0-4ac2-04a3-08dea92680a9
x-cloud-sec-av-info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700021|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info-Original:
 1q03lbgsSSDesJCg0b8Zf5BxSBvoNq8QN25o3kq6k0yE+ze20kzKFAkyYq609I7m5ZFkRlJxJe8SE4zbkhyi02jvbTZhanxzeyx6dPzInaRCVu5K4QBfkOW5zHHpDKsyNRvkE+QBnUKL4TMNRslMkSOE34p3udX0uDJfH/JTeiioKDEkMmvOs2AKL+5750HKeGNDCgEIXmeEqERFveIOiOsXrEt2/Og1ooTLVn8EmsdP0xyXZ6Zpuso8u8T6lrHD7C2oAt9cpUZarjpv8a3PXx8IKQGauEJNnLyU2Ep036yDGKhPGxDHz+w7u9hQZJoK5KoHGk+PmxBGWmX0WWLeIoE7GuY5Exh+frRzglj2F+6QqAEtOlpkZu+1YayelLrmN6YyO9DAFOY8yTYvsb3N0TA1DRf9saS4/WVuKlvQCeBoXy5d0sfx3pKN8Uzq3roFih45Jx+zHWyl4sfIaBcpm66vYK+eWDq8OyRpr1Tm0GyzxOTeIm/bqEiImWW6oHVPBNV5BAbHS8sbQSHqdfY1QJRGIq+4+WpixhT6QFIz/jDDPlyfsOB8jzBKNq4X5mgw2lKdeB3amwHunsNR/aVLYqpittCbRQbqJbF1C7QRLyv0S+lzZkDG0RD12iZOOYNKyFdUK1DjcCyGNx9tQVRx+fyAcGW8hYe5h/aViWHxQyXq3Z4FYryPvuN3hyh6xMQk4eHMILx9Ye87vLRg/PjrWPAWwj+2gJ6NQmxFof49KiYiEFNFz4pE4fZvtsVR3C+K
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12057.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700021)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
Content-Type: text/plain; charset="utf-8"
Content-ID: <59AA79439CC8B342A0AE45DFED56E66E@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 bM31VJ6khTgMiQIhB8tLEAguifRwLrA09d59BbbJE3Z1H0keerwlJubdOCecIkcCyGjPIbmk0j3FoqaLKodg1+e53+UogSCTj6JrlF7Vu1vf5q6wtlAH45DPjp1bbpUkO3zZW7x5K9OqWQInFcD7sMgZR3FjoAcX7Q0ER2FVbCM5tKbQjZ1hcSvvh/V71OLVwkUFi5cqrvjJZwIExfstU153yx06KERxPFCRT3ghMx2kQyQtEES8JyagaPyVDfzg8NNmwx2GZ3UVmgbo/FsFQb3iDnuUUrozycePgOBMkIecgJ3btEZcNrmU0EsVgt2al89U+iIoT3IOSST8vrYZbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMDPR04MB11701
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2-6.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: b8a1cd45d8fb4c3abb1a22536c8f2972:solidrun,office365_emails,sent,inline:52cc2c17907e1f9762cf1cd9eaed627c
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF0000B61D.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	39c52686-04d4-43c8-8962-08dea92679e0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|35042699022|14060799003|1800799024|36860700016|7416014|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	U2i3/tSETOmAg4Ix88zCLtfUp576pkr/o3cnjxXyjQfq0V99RY1oXwXAH3NqlG0l+QukdKBm7l5ld+bzrb5Dp22QaGmOKTQqhox4l64zmz03d/hH/U+64/4dcn4yARfW2RibRD8A0HGh0psYlQ038nRDi4d8ME8KX/Y0SYF8ZVjynly6XmYJJAEiSct3V8Da6KL7nTX5HUyT0w1a1MaCWkpWm5KAP4eGS7W5CKtSUFzUSU63GfrZGQaeatEgt7ibQfhNGRZQuUD3MYh5sMnpnk+IXsMkSDuoSadVq2awbZK19WHQhQRQ6gU52wQ1ZXOM1zvRg0eV8hERu82Z0efjhBjHi4EOOKs65Nu0YhrWdbNSPLdVuYeI3Szq/W8A1FGMPYYkW0LtbnYMuEGtn6E8ydDfqox+2Mb+4r6Il9IeEL+IlO0/Yz0z3CVY8bvQ+2d4KfzM3VBYYu02DsEX93F5PYFhHdoA/Tlzy0APYrj052jNPr948xbhQQhs0BqNOWkVPndgze6N7wR4lYJxfGo7xJn2ot3HnaK9Xz8kS+jZiUHG3q/BS+ygafTNM8q0HZs5bHOwFJuGIxpJc9dbebRZts/ZtJ9tFNE2Gvz/RTlUBsPogICdCBd8OSEH1x5XKOhSZWOvE5BMXZn0CHKomjuOJZ/AQvx2EE1+Z2YXWBRsUSYZcXCn4oJf3s1esvkh5uJk3EcYAgjcT3izY5r32amPF8bVWQ9wCJThw6se/5tWs18=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(82310400026)(35042699022)(14060799003)(1800799024)(36860700016)(7416014)(376014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	o3mZm1npWSIf9yrncyXxOw52D7JKdR+1z8C+y6Xk3Lf9ffY9OhvksB/m15aHju9vjVdQZZo7ruxyCjfGx7qwUOGJgXRqtMCgNoctauUfKV4zg7lWsXpmGsOp2EzKlMDued/JaWRYBYSfevsm141hPrt2NeF+9dKN6E8JjK+y4wUA98niMAvaFxSul7VETPn7fpeeow8q+LvzYBJJXarZr2TfksPo1HBO3q8y7yFUWPK9pPgRntaNwXzSyUVtdFD28KZ8CyLbD4vp3X58HlvuvANd1DvDYLrkFT0n2fwQkiEJSSmfgp+SJCUbYVDVaYe+y2jelAJ8JRTCOY0Xp6lfsrdR+aOzGOg60KAygceZgeXCUq8oZuRFCXXF+WEhd75KmYPjFsU+tFEo5J87AFepj8MfsR1o4WHCFuzQ4XKuphUR+6kqwaN+pInROHQgtcKs
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2026 15:13:16.5156
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 13135636-23f0-4ac2-04a3-08dea92680a9
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000B61D.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8167
X-Rspamd-Queue-Id: 92C6B4B6318
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.94 / 15.00];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=3];
	DMARC_POLICY_ALLOW(-0.50)[solid-run.com,reject];
	R_DKIM_ALLOW(-0.20)[solid-run.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-31901-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,glider.be,bp.renesas.com,solid-run.com,vger.kernel.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,solid-run.com:dkim,solid-run.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[josua@solid-run.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[solid-run.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[9]

QW0gMDMuMDUuMjYgdW0gMTY6NDkgc2NocmllYiBKb3N1YSBNYXllcjoNCj4gQW0gMDMuMDUuMjYg
dW0gMDI6NTcgc2NocmllYiBNYXJrIEJyb3duOg0KPj4gT24gU2F0LCBNYXkgMDIsIDIwMjYgYXQg
MDY6MDc6MDVQTSArMDIwMCwgSm9zdWEgTWF5ZXIgd3JvdGU6DQo+Pj4gUmVuZXNhcyBSQTIxNTMw
MCBQTUlDIGNhbiBiZSBjb25maWd1cmVkIHRvIG91dHB1dCBhIDMya0h6IGNsb2NrIG9uIGl0cw0K
Pj4+IG11bHRpLXB1cnBvc2UgTVBJTzIgcGluLg0KPj4+IFRoZXJlIGFyZSBpbiB0b3RhbCA2IGNv
bmZpZ3VyYWJsZSBtdWx0aS1wdXJwb3NlIHBpbnMsIGhvd2V2ZXIgb25seSBvbmUNCj4+PiBvZiB0
aGVtIHN1cHBvcnRzIG91dHB1dHRpbmcgYSBjbG9jayBpbiBvbmUgc3BlY2lmaWMgY29uZmlndXJh
dGlvbi4NCj4+IFNvIHRoZXJlIHNob3VsZCBiZSBzb21lIHBpbm11eCBzdXBwb3J0IGhlcmUgdGhl
bj8gIFRoaXMgaXMgc3RhcnRpbmcgdG8NCj4+IHNvdW5kIGxpa2UgYSBNRkQuLi4NCj4gSWYgd2Ug
d2FudCB0byB0cmVhdCBpdCBsaWtlIGFuIE1GRCwgdGhlbiB0aGUgbG9naWNhbCBzdWItZGV2aWNl
cyB3b3VsZCBiZToNCj4NCj4gMS4gcGlubXV4L3BpbmNvbmYNCj4gMi4gY2xvY2sNCj4gMy4gZ3Bp
LCBncG8NCg0KSSBmb3Jnb3QgYWJvdXQgdHdvIG1vcmUgZnVuY3Rpb25zOg0KDQo0LiByZXNldDog
c29mdHdhcmUgdHJpZ2dlciB0byByZXNldCBzeXN0ZW0gKHJlc2V0LW91dHB1dCksIGUuZy4gZm9y
IHJlYm9vdA0KNS4gcG93ZXJvZmY6IHNvZnR3YXJlIHRyaWdnZXIgZm9yIHBvd2VyIGJ1dHRvbiwg
ZS5nLiBmb3Igc2h1dGRvd24NCg0KPg0KPiBUaGVuIHRoZXJlIGlzIHRoZSBSVEMsIHdoaWNoIGlz
IG5vdCBhIHN1Yi1kZXZpY2UgYmVjYXVzZSBpdCBoYXMgaXRzIG93biBpMmMNCj4gYnVzIGFkZHJl
c3MsIGJ1dCBpdHMgcG93ZXIgY29udHJvbHMgaW5zaWRlIHRoZSByYWEyMTUzMDAuDQo+DQo+IEFu
ZCB0aGVyZSBhcmUgc29tZSBtb3JlIGNvbXBsZXggcmVndWxhdG9yIHN0YXR1cyBhbmQgY29uZmln
dXJhdGlvbiByZWdpc3RlcnMuDQo+DQo+IEltcGxlbWVudGVkIGlzIG9ubHkgdGhlIFJUQyAuLi4g
YW5kIEkgd291bGQgbGlrZSB0byBhZGQgdGhlIGNsb2NrLA0KPiBhcyBpdCBpcyB1c2VkIGZvciBC
bHVldG9vdGggb24gYSBTb2xpZFJ1biBib2FyZC4NCj4NCj4gTXkgb3duIHBhcnRpY3VsYXIgdXNl
LWNhc2Ugd291bGQgYWxzbyBiZSBzYXRpc2ZpZWQgYnkgaW1wbGVtZW50aW5nDQo+IHBpbm11eCBp
bnN0ZWFkLCBhcyBJIG5lZWQgdGhlIDMya0h6IHJhdGUgd2hpY2ggaXMgZGVmYXVsdC4NCj4NCj4+
PiArI2RlZmluZSBSQUEyMTUzMDBfTVBJTzJfUE9XRVJfT0ZGX0RFTEFZCQkJR0VOTUFTSyg2LCAw
KQ0KPj4+ICsjZGVmaW5lIFJBQTIxNTMwMF9SRUdfTVBJTzJfQ09ORklHCQkJMHg4Yw0KPj4+ICtz
dGF0aWMgdm9pZCByYWEyMTUzMDBfY2xrX3VucHJlcGFyZShzdHJ1Y3QgY2xrX2h3ICpodykNCj4+
PiArew0KPj4+ICsJc3RydWN0IHJhYTIxNTMwMF9jbGsgKmNsayA9IHRvX3JhYTIxNTMwMF9jbGso
aHcpOw0KPj4+ICsJY29uc3QgdTggZGlzX3ZhbCA9IFJBQTIxNTMwMF9NUElPMl9DT05GSUdfVFlQ
RV9ISUdIX0lNUEVEQU5DRSB8DQo+Pj4gKwkJCSAgIFJBQTIxNTMwMF9NUElPMl9DT05GSUdfRlVO
Q1RJT05fTk9ORTsNCj4+PiArDQo+Pj4gKwlyZWdtYXBfd3JpdGUoY2xrLT5yZWdtYXAsIFJBQTIx
NTMwMF9SRUdfTVBJTzJfQ09ORklHLCBkaXNfdmFsKTsNCj4+PiArfQ0KPiBDb25zaWRlcmluZyBJ
IHVzZSB0aGUgcGluIGNvbmZpZ3VyYXRpb24gcmVnaXN0ZXIgdG8gZW5hYmxlIGFuZCBkaXNhYmxl
IHRoZSBjbG9jaywNCj4gb25lIG1pZ2h0IGFyZ3VlIHRoYXQgaWYgYSBwaW5tdXggZHJpdmVyIGV4
aXN0cywgdGhlbiB0aGUgY2xvY2sgaXMgYWx3YXlzIG9uDQo+IGFuZCBkb2VzIG5vdCBzdXBwb3J0
IHByZXBhcmUvdW5wcmVwYXJlLg0KPg0KPiBUaGlzIHdvdWxkIGFsbG93IG1lIHRvIHNraXAgaW1w
bGVtZXRpbmcgYSBjbG9jayBzdWJkZXZpY2UsDQo+IGFuZCBpbnN0ZWFkIG9ubHkgaW1wbGVtZW50
IGEgcGluY29uZi9tdXggZHJpdmVyLg0KPg0KPiBBbnkgb3BpbmlvbnM/DQo+DQo+Pj4gK3N0YXRp
YyB1bnNpZ25lZCBsb25nIHJhYTIxNTMwMF9jbGtfcmVjYWxjX3JhdGUoc3RydWN0IGNsa19odyAq
aHcsIHVuc2lnbmVkIGxvbmcgcGFyZW50X3JhdGUpDQo+Pj4gK3sNCj4+PiArCXN0cnVjdCByYWEy
MTUzMDBfY2xrICpjbGsgPSB0b19yYWEyMTUzMDBfY2xrKGh3KTsNCj4+PiArCXVuc2lnbmVkIGlu
dCB2YWw7DQo+Pj4gKw0KPj4+ICsJcmVnbWFwX3JlYWQoY2xrLT5yZWdtYXAsIFJBQTIxNTMwMF9S
RUdfTVBJTzJfUE9XRVJfT0ZGLCAmdmFsKTsNCj4+PiArCXZhbCAmPSBSQUEyMTUzMDBfTVBJTzJf
UE9XRVJfT0ZGX0RFTEFZOw0KPj4+ICsNCj4+PiArCXJldHVybiAzMjc2OCA+PiB2YWw7DQo+Pj4g
K30NCj4+IEdpdmVuIHRoZSBtYXNrIGFib3ZlIHZhbCBjb3VsZCBiZSB1cCB0byAxMjc/ICBJZiBu
b3RoaW5nIGVsc2UgaXQnZCBiZQ0KPj4gZ29vZCB0byBoYXZlIHNvbWUgdmFsaWRhdGlvbi4NCj4g
RG9lcyBpdCBuZWVkIHZhbGlkYXRpb24gaWYgdGhlIG1hc2sgaXMgZ29vZD8NCj4+PiArCQkvKiBy
ZWdpc3RlciBtcGlvMiAzMmsgY2xrb3V0IGluIGNvbW1vbiBjbGsgZnJhbWV3b3JrICovDQo+Pj4g
KwkJcmFhMjE1MzAwX3JlZ2lzdGVyX2NsayhkZXYsIHJlZ21hcCk7DQo+PiBZb3Ugc2hvdWxkIGNo
ZWNrIHRoZSByZXR1cm4gdmFsdWUgaGVyZS4NCj4gQWNrLg==

