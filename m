Return-Path: <linux-renesas-soc+bounces-31899-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YMpjIbBc92llggIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31899-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 03 May 2026 16:33:20 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 258034B6127
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 03 May 2026 16:33:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9409B300951E
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  3 May 2026 14:33:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97D481946BC;
	Sun,  3 May 2026 14:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="B/oYSv0G";
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="B/oYSv0G"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11023074.outbound.protection.outlook.com [52.101.72.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFD5578F4F;
	Sun,  3 May 2026 14:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.74
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777818794; cv=fail; b=eaD5wuTgwxhA1pBeIUMyN7DlLsrBRWdq+EXtxhEPS75YH8RbZopxG7IoBtOsEEvxgdmxvmembD1FSx6HF3ckkTOKUexO9L5S9oPR/JteokzenCo4YW37SvrW6DCj9hFG81WELmlmPtImmuQ4e8TRgK8fYKDRILpOmVg3mCnb3nY=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777818794; c=relaxed/simple;
	bh=VPnWU5DMo5tQfwlTjSmIMzR6jIOLHW709CczP8reCl0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=udI2CnKzzRCiNiApIwc4ceBlaXjRZNTEMQwCDAYI81oTO26d9XWJzAPIR1FDiMwQmkAan2R+BNKZGT7+hpjiwgWPA6+Yo+w5mcfQqrEXAetkQcZvWO55qivB6lwIwqWYtksR/NP1zyuWYFDgNQ5faTpw7do+b5JVU6Im6xPhpf4=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=B/oYSv0G; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=B/oYSv0G; arc=fail smtp.client-ip=52.101.72.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=dGmjfn9S7Ij1KFCAkkIFHaidcJc9yxdhY+/RedsQSeshYeK7VI5VpIAArXuSg63+G9lQnsIGmUEYovwh+wcpB9AJUDh1oEF/0hUxK5M7AVf0QKU0Fwqd8YZ+cobCatZevzXMCX4A1CsQm59q/AG5qPzPLx0SuMageg13Z3h+yGyJSBrOlEDk1rXoino73bwUfQD6zI2EPLXbRXD/tkHcMDow2fx0PBER7O43BL1hC/Qe7UR/0yOBI49bQQtXraG5l3d9sl8xkZmi1xR0bR4JAm3x4MoQ5ifK4XJ0YsL1cVThx7KK5f2kT+cREI+RCXyN5fY7H4HpW9b9xBLKXmPFzg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VPnWU5DMo5tQfwlTjSmIMzR6jIOLHW709CczP8reCl0=;
 b=enQglll36HCgNzjsCAprQ1BIL7b0p1FbwqlhymdBMRTPoTHJI/PDq5rcz6pDWZM+qn1/jl8KvmKQUj8Cu6hn0Tm96POjZbwgDhWTd9Etq70qw8/54EfcDZB7uAs9XgIJkRUgV8T/EJGsR9II7NEBR4pUDUrJKZlfOxksT69pGmWsY6/VNHANGS/uVhoboKlClCIz6odj7xIfV2zPdhGtjA5diyc3noRZAuh4ZFRX/8PPOjHs5BydRFhnhirBd/Gm9gLzRXWcKRVrouEsOKQc/NAPjTB8lENCf1WAs4p6NbO/83uEUgohxgzVbMmeoOTAjz1/H9i8rF/YKXPhBezQdg==
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
 bh=VPnWU5DMo5tQfwlTjSmIMzR6jIOLHW709CczP8reCl0=;
 b=B/oYSv0GqMkQ+Ch17vh49XTSR00/CJkbaZgBHc5twKdgB5BDgW6cbmZjHzkEGfQ/OxCxB8HUM4p40798icaBY0SzpdIkwtz8TFd/jT0hIUmbvGTvAiTr2WpL4STs08PVDBLVt/rgzHNyTou0dA2Fw3IDM+OzblIob8vBORYJzhxLftUbpEH3oWfZatFY6YCVSU1xtK9bTWH+diAgO4eB6rcWGnGLF5KUIjFkfgQsib4vBJU3I6WJzjtx3sRUMreYc+p3ZPP19cszAwGjskSMcPYAYGZhxVUCv9SHzHJRcvo+xKMUU1bk2quCbSlyER1uR+CuXafQ/vM3EqUSaHZOhg==
Received: from DUZPR01CA0068.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c2::18) by PA4PR04MB7726.eurprd04.prod.outlook.com
 (2603:10a6:102:ea::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Sun, 3 May
 2026 14:33:08 +0000
Received: from DB1PEPF00039233.eurprd03.prod.outlook.com
 (2603:10a6:10:3c2:cafe::cf) by DUZPR01CA0068.outlook.office365.com
 (2603:10a6:10:3c2::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.25 via Frontend Transport; Sun,
 3 May 2026 14:33:08 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com;dmarc=pass action=none header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 DB1PEPF00039233.mail.protection.outlook.com (10.167.8.106) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.22
 via Frontend Transport; Sun, 3 May 2026 14:33:08 +0000
Received: from emails-4735750-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-243.eu-west-1.compute.internal [10.20.5.243])
	by mta-outgoing-dlp-291-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 3A4D37FD2A;
	Sun,  3 May 2026 14:33:08 +0000 (UTC)
X-Mailbox-Line: From b'josua@solid-run.com' Sun May  3 14:33:02 2026
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AmnINSd7HqkS5LIt8hdKcGPeNkCKIH6A7TUJL2QAGqteWaL4jJawaLpTKQ3i4axV9RgDVvZxRb+JvQR+tkowa6eENDKpFGvTFaPuScgvFG8KEHXFX5zUhHOz1pdg9w8XzYolbzbNMtUx4epCr9v+6f10cD39rVOsmi7w8bcx2PKY4+8/pnt12getDZKq1SVs8bWrFp/w1xNC1UeDlLS/vNLQTs5haO43xZo6wET1NO1yY7nn+fW4sdMFAZpqU5ragHRA2axBsNKxexTD9FDTI/4F8RWgoRvAngiTN2yIOPZEAtXQbCvK1wmNOEmAfkz56GDUeNVObHVXY0wgSBx2/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VPnWU5DMo5tQfwlTjSmIMzR6jIOLHW709CczP8reCl0=;
 b=NZLYQsBNtZaErP/t7uMVzz1/85y2kmA0ucDCnqBSg8FTIyjdW4p8zcJt0Ew7hhatWzlQ5gFWJFttkyftKZQiePraw8gcOEpQ55HzlPBC5sCpQj6e85xfkWgYs45+3bDERqvN5VYkkfgx6GEYT4DDduXlV5a3aBgg6sT7VSGaw0Q/evSXJihikKNWdtoEY/O8qBu/Z3sigDr/rmx//wPFmDG0CtDyEQkbpcoqKYe4sAObx0JPHV+q+YTnjm1anFDkH0cspW6148aKx7J7juaB6tevHQaAOVem3gZjEpHFnikzrXGdx9kLCa/2RaJttTbacaFpQ+9QiSUMTfywjvHC9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VPnWU5DMo5tQfwlTjSmIMzR6jIOLHW709CczP8reCl0=;
 b=B/oYSv0GqMkQ+Ch17vh49XTSR00/CJkbaZgBHc5twKdgB5BDgW6cbmZjHzkEGfQ/OxCxB8HUM4p40798icaBY0SzpdIkwtz8TFd/jT0hIUmbvGTvAiTr2WpL4STs08PVDBLVt/rgzHNyTou0dA2Fw3IDM+OzblIob8vBORYJzhxLftUbpEH3oWfZatFY6YCVSU1xtK9bTWH+diAgO4eB6rcWGnGLF5KUIjFkfgQsib4vBJU3I6WJzjtx3sRUMreYc+p3ZPP19cszAwGjskSMcPYAYGZhxVUCv9SHzHJRcvo+xKMUU1bk2quCbSlyER1uR+CuXafQ/vM3EqUSaHZOhg==
Received: from GVXPR04MB12057.eurprd04.prod.outlook.com
 (2603:10a6:150:313::24) by AM0PR04MB12143.eurprd04.prod.outlook.com
 (2603:10a6:20b:744::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Sun, 3 May
 2026 14:32:59 +0000
Received: from GVXPR04MB12057.eurprd04.prod.outlook.com
 ([fe80::14f1:a127:2988:de5b]) by GVXPR04MB12057.eurprd04.prod.outlook.com
 ([fe80::14f1:a127:2988:de5b%2]) with mapi id 15.20.9870.023; Sun, 3 May 2026
 14:32:59 +0000
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
Subject: Re: [PATCH RFC 1/2] regulator: dt-bindings: raa215300: add clock
 output
Thread-Topic: [PATCH RFC 1/2] regulator: dt-bindings: raa215300: add clock
 output
Thread-Index: AQHc2k28cng36hRwYEWsE+dKsUpN4bX7exSAgADjyQA=
Date: Sun, 3 May 2026 14:32:58 +0000
Message-ID: <af16a88b-ba5f-485b-991d-0ea1ec2f928e@solid-run.com>
References: <20260502-raa215300-clkout-v1-0-fd1c2a240963@solid-run.com>
 <20260502-raa215300-clkout-v1-1-fd1c2a240963@solid-run.com>
 <afadhRD4b94rrNZ-@sirena.co.uk>
In-Reply-To: <afadhRD4b94rrNZ-@sirena.co.uk>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=solid-run.com;
x-ms-traffictypediagnostic:
	GVXPR04MB12057:EE_|AM0PR04MB12143:EE_|DB1PEPF00039233:EE_|PA4PR04MB7726:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ff09e59-4eca-49b6-1b5c-08dea920e54b
x-cloud-sec-av-info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|7416014|366016|376014|1800799024|38070700021|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info-Original:
 JPNZuuWkOvnjh9knI7UB21yzREweepAudCXJLt1Glbk5WDV1pEGCqPi0AuQXXlTbly4wCQb6GUU2J5N36+soFwHvOwSaBD1GxaFT6kprLjY/Go/F/gv00IcelZiVu/mYQidvWNqWCiRIEJWV81pg1AnqhCz1RLKuhQn5OphLw1b+tH6IHeA1dWryck77HDHwe8gWCPzECZN/zE5j7+dIU0Th3F20J4m/Q7BahAZKyz2el/7J51LxcowYMG8uaJVURULp1eF10cb+HWJRQ0znLMLMEOUMXa44jP4F+mBIx7dStN8Wu/vn77jAZzxP6gmJO0iTqvf3nzCUDAa6B8nIlhdxb41KWzPkDTlau4p9wbWILwioy/Swll3ZCEYBSm+h1ieHV6qKOir/LP6SoZ4wrJeaJHRFgkKpEpinexBtz3OOWlcy21ry/IUmHz73r9AOtpzi2iYKyLflvcidaVdpCtQjjuhfc1mjkk78664kfDGmXNKPtiOdic/Ky5k6m6WYhMSvirO/zLYxIHVCUhyM3ayvNb/WUiL6vpbxD2y7wAXtjqVYfrHXBb/nvxHH9Zfz0OCHHMnMis9ibXss8Ev00DOVeSSXl3UV9kA5qUrXSTrLZDhFSqgxCVnd0VlVHgsj5bBg6r2jpTGuGV8fag5tLH73B+fYx6hSdklh+6g2+DVwMy5/bOmsxJg2/9XhcJ1+ZsOB44YENsC4Ds/+6Dl5s6aSsXCcJIhd4CT4jkzAv41zBitwibG7n/4SxhXYU9oC
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12057.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024)(38070700021)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
Content-Type: text/plain; charset="utf-8"
Content-ID: <F99C6B2BEB6C394D9EAC359F49F2A574@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 F4j/8MTNP6Qz8EuumE8JodXrXGGJhVVFNAPe5aaBXWwJLT3YyyI95Y4fwHVnkMgioCgn32Hl7gqrpDbRkQWgxGEOEWW8Z+krXbqlrf0HiF/X372pbvch53LSX56hnQqk13nKYrPQ9zEXOYLHlsh7vN+yAFU7m9RBom0iF+aD3hu6NY86YLlEzC2LmMFLR5An2BDOv6N8JeNuNunrIs/T74IJYI2D736WPyHoyv2x6QbnCI388XX5E/6Yg1bXe/u9pqwU76HyUg4AgN4TxIALEnsfegCxnI8YCeOFU90W5N3fNux8EOZ2d+bhnNJXcK1/FaeFqmRuIEi5P5alLMaevw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB12143
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2-6.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: a487bff8ce7c47afa3b5f139cca1764d:solidrun,office365_emails,sent,inline:52cc2c17907e1f9762cf1cd9eaed627c
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF00039233.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4177cfe5-ba0e-4746-6527-08dea920dfaf
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|82310400026|1800799024|35042699022|36860700016|376014|7416014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	hHodEdzXyIqFiRSYR0qKjabRc1jdOY7rZoAg/d5PmMm/e0lqfdTSVso4Ys0t2lbptrVr0leqoeFXcZA1i+EsnVhnLphQvuBUzoBOIQLQ/LSEdTpIqqNVSZ51yw7K8jqOAFHn3dVMKoMo5zrxdyHwiWIMFJS1/nTGzusIwFtFpBNvGo29YTNiXTAck4UAbyBZbz/2nFWg1JmtmykKQcpT4zD5mOfH//X/jNd9/XWpb+nlLg57RRu/o3UidFuJGcb+dx8lq4GHazCCGQwzhE6urc546z3dAOrbwkI3AR+T9Wrsf6wVw0on1XJwvVIP0lYU3+eOdBAnPM9eEwGCHOFZuHbA6uD4X08L6zNuSTN53i0pGKOXo1yNEdZfB58XHFvgzVmpcUDDWI7VDbidyEjeSK57yOa1mDj68vEjaITp6XjFZnC7lzQJadeFeejR3frGHH94Lt8ywgqy0whu5S2PvSsdIDKqb9cSoBsNYFr6NGNG5v4eewDY3Ae8FSKqWNUo9wIyhup058dDm/eFpISbMvKuUbhoPbJAUEW3c+U8uqIwEnf95C2xu2tN45HhCzpDB8T3RVDD8OdGUuGUNwVHgUrd9LUIC3YjRdm738ObknXrQlStJpcSO9j9vsb6bySocfxaUy4kHvEerCxWjmptOh9hB37qmHYd7Zu8fI0nU/j33aXO4dSqhNuQsLWrRMD39mp+MW+ueqoUEhN9vodZNTeRGb52gpXDPiJMIOvKk/I=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(14060799003)(82310400026)(1800799024)(35042699022)(36860700016)(376014)(7416014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	9Fh9l5/sVjhN60yY5SYQCsypuyX3fRiE7WSH1GiEXY8lWWmCbbeb3JJLKYcQHxVVx6Oi6uoHEYzwS4imXETn5kfUC+xYZtrBykIvsCD5jyKJKBoJ+TISHiKaoM/rFEA+VnCvtYMeoxdgLgwowEW9KjkuoRMJS/pJDqd/4syUo/Smw1DcJY01If5ckpOQw2BAiZtPwKymtTueEDe1/mkItO8xAQ55ryhjI4o0CE3VB823wErQVkHiIQv35vuRK8O2a15cQce+hMhYWIIQmUB3ZYyg1YFfz8rnLWh7ke9x8aeAOkTjyjCGzoU+pPM0U7F/nlnMoVdtUg/2Bl9bKTCTW+Phv/Z5aVLa87v/ZLtmFcLVddYR9IV5mvIiQ23+e37CsNOgxljO19mRNdlT5XyMMjV0+sJ3h/DLKQhLKzvMwS3qq3vp9X0ankYg1qGEK4mw
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2026 14:33:08.3661
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ff09e59-4eca-49b6-1b5c-08dea920e54b
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF00039233.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7726
X-Rspamd-Queue-Id: 258034B6127
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.94 / 15.00];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=3];
	DMARC_POLICY_ALLOW(-0.50)[solid-run.com,reject];
	R_DKIM_ALLOW(-0.20)[solid-run.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-31899-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,glider.be,bp.renesas.com,solid-run.com,vger.kernel.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[9]

QW0gMDMuMDUuMjYgdW0gMDI6NTcgc2NocmllYiBNYXJrIEJyb3duOg0KPiBPbiBTYXQsIE1heSAw
MiwgMjAyNiBhdCAwNjowNzowNFBNICswMjAwLCBKb3N1YSBNYXllciB3cm90ZToNCj4NCj4+ICsg
ICIjY2xvY2stY2VsbHMiOg0KPj4gKyAgICBjb25zdDogMA0KPj4gKw0KPj4gKyAgY2xvY2stb3V0
cHV0LW5hbWVzOg0KPj4gKyAgICBtYXhJdGVtczogMQ0KPj4gKw0KPj4gICAgY2xvY2tzOg0KPj4g
ICAgICBkZXNjcmlwdGlvbjogfA0KPj4gICAgICAgIFRoZSBjbG9ja3MgYXJlIG9wdGlvbmFsLiBU
aGUgUlRDIGlzIGRpc2FibGVkLCBpZiBubyBjbG9ja3MgYXJlDQo+IFNob3VsZCB0aGVyZSBiZSBh
IHJlcXVpcmVtZW50IGZvciBhbiBpbnB1dCBjbG9jayBpZiBhIGNsb2NrIG91dHB1dCBpcw0KPiBz
cGVjaWZpZWQ/DQoNClRoZSBpbnB1dCBjbG9jayBpcyBzYW1lIGFzIGZvciBSVEMsIHNvIEkgc3Vw
cG9zZSB5ZXMuDQoNCkluIHRoYXQgY2FzZSwgd2hpY2ggcHJvcGVydHkgc2hvdWxkIHRoZSBkZXBl
bmRlbmN5IGJlIGJhc2VkIG9uPw0KI2Nsb2NrLWNlbGxzID8NCmNsb2NrLW91dHB1dC1uYW1lcz8N
Cg0KY2xvY2stb3V0cHV0LW5hbWVzIGlzIG9wdGlvbmFsLCBzbyBJIHRoaW5rICNjbG9jay1jZWxs
cyBpcyB0aGUgb25seSBvcHRpb24uDQoNCklzIGl0IGltcG9ydGFudCB0byBtb2RlbCB0aGlzIGRl
cGVuZGVuY3k/DQpPciBpcyBpdCBzdWZmaWNpZW50IHRoYXQgZHJpdmVyIHJldHVybnMgYW4gZXJy
b3Igd2hlbiBjbG9jayBpcyBtaXNzaW5nPw0K

