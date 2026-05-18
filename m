Return-Path: <linux-renesas-soc+bounces-32740-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CEZ+Fc91CmoP1wQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32740-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 May 2026 04:13:35 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B6EB564EFC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 May 2026 04:13:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A8A673006B27
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 May 2026 02:13:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81D13296BCF;
	Mon, 18 May 2026 02:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b="EzPLo4Od";
	dkim=pass (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b="3XSTCACD"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0a-0014ca01.pphosted.com (mx0b-0014ca01.pphosted.com [208.86.201.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11FA1287510;
	Mon, 18 May 2026 02:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=208.86.201.193
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779070411; cv=fail; b=QDKezr2mKhGzNN9pQmAnedQj4AF1BH9qpcbm53cczE5rYqzgKQzoH9DqucJ3CnBVzp7G/N4H5fy4Xl3cxFP2ofnAyO7bRPnMnekz9t1yC+IaTMFSNPxbFrHgRiPdkAol/crjVK0K8fICrt3KtDeUpBepnZz9tZj1ySRIBlsU8rw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779070411; c=relaxed/simple;
	bh=U3nypzQHm8KWqUTQ6enNrLbhEvEx/Z69roWxpgP7jR0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=kHL+cTzZQJYEVTMl9fQ83ACxaWhWmaGmtElMMpGC2YulF6xSGU/eegSz4SIvyJtzLFqAgEt7U8SM9hLj6dtoT9t57L/WTC3sWpKZYmdYNlu4wbHjF0LhdIYxHnPgyokcR2qNZqtz5Xd1I9z4QHdFVF4TU8dCLMAg1yqfdh9+S2s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cadence.com; spf=pass smtp.mailfrom=cadence.com; dkim=pass (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b=EzPLo4Od; dkim=pass (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b=3XSTCACD; arc=fail smtp.client-ip=208.86.201.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cadence.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cadence.com
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
	by mx0b-0014ca01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64HLjVQR3288038;
	Sun, 17 May 2026 19:12:43 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=proofpoint;
	 bh=RvUsbIhnr9Ztw+NVSdC5Y/dYLB1wXRZAeOvmwH4fIx8=; b=EzPLo4OdHoc0
	Y2vkzPVVQawqegaFjZEESVjLoXJicaba+dlBq+y8NniJFQy00FlwTFLiWA0h3w9U
	juheTfx+5OkvmnRAYRLtb5KPO2ti5u9ybF8ILZJvOQCTh8QWPxZKG3clZoTXpWUt
	IJrT857qGyWkzZdsNWqV5e07kPgZkJmtShuX6wnDcs2+4x00Uevi1CkzMUMFFE+K
	0wTYZT7BSNt7J9zFm/cgnWImYa1FSGY1lncwSWdy+zLmG3VW62XYEHgQBG2XfqT1
	RbCQ+Xruk9gX0GI1G8haUJoiVdj1yUUtZk6WtnhmSCMjruDm2F7sYikOQ8TVykL7
	jJbSiGtP2A==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011057.outbound.protection.outlook.com [52.101.62.57])
	by mx0b-0014ca01.pphosted.com (PPS) with ESMTPS id 4e6m5uc4gy-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 17 May 2026 19:12:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZjUVnefKYls2eV+m/rN/Save/arskss5ADr6xCMlamhBg8LXFwVrqXy9WWXp0CsLHBEsTg0VmshtOKx6G3RvEjlpSKYalDaOSz1NO0d/JEfK4aujM5aZh9RJLxWCmmOz+tROc8tjPBscD9eLaWd036aT/PAJR8Fru6Zho6iJJc5WhxT8pduUecDXzTkpBmDfAJqBvW6qq7I3KTPqJQo5LDJbAUdM2N+fCbiCGJCOo8wnH+lL3j6w9red6KlD0g6xdBNquL+fervwMGchQgB/QI/BT0J9tyyCloLgdZ2tArQYaKhMHlULbFbTh54rMH+UKSi0Er4fUCCWcmKBuH00eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RvUsbIhnr9Ztw+NVSdC5Y/dYLB1wXRZAeOvmwH4fIx8=;
 b=J8SXQmoEnSe78jSVZx77Z70dQzw1QujZvbTfdfDonR8gqAas91NBqnEWu3UXSXdwmMkIdDURws03yzWsJZCdj8kSeNqy+m4CH0u4aA1ERb0G1ky9KfWxg4HhnN12DdwmQFSBXulD+/QCWoRuKL/ftFSZPdmbpflNKfHzPwFYRQ4FUYy28FI7dkOKegvxgbhx0SwZoeOF+zJTSEv08XPHXDTieLuuI0Gd1QI7jHRM1vl7gWgyZd4XvprXkFcn/O+lMipxgf/6Jte/Cwve+pk0oaSJRlCquuxv0KE/7gXeq2usgvog+52JPATQRgD6bAiSsKogY7+jMjXuRp++Y+L7/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cadence.com; dmarc=pass action=none header.from=cadence.com;
 dkim=pass header.d=cadence.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RvUsbIhnr9Ztw+NVSdC5Y/dYLB1wXRZAeOvmwH4fIx8=;
 b=3XSTCACD8rxFk+DCM4mF1MMVXBVPw4TnH7MLLIYTPKDZ7Nhr2OR66OUCz4kccvcDn00N62EFo8hptzKZjAE63hn+RU5FBezj7IoNcvAY1C/423OKFeWKQ5TJLi9n5VlBtA/Kn+urw8H2ESaRWuH2/axieRjb+dSN9Jms1FGjg9/9lAAEtBcBKQ7+Md3MkoxYDL8tgsz4e2obzS18uZNElwJU5SG3TVnm5oZR3VFcey7g0/78mSSSjXEp9KKEwysaPIxZuNWOFPvTOvX8XpskMUITufRoP8aHqTPkTfIC8OjWH8BQ5eg4wDZaKKuHYtxYwF4NcrOKaykZTVVaER2m9g==
Received: from DM6PR07MB6716.namprd07.prod.outlook.com (2603:10b6:5:1c9::16)
 by PH0PR07MB10779.namprd07.prod.outlook.com (2603:10b6:510:335::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.15; Mon, 18 May
 2026 02:12:41 +0000
Received: from DM6PR07MB6716.namprd07.prod.outlook.com
 ([fe80::2e20:ee0a:1b4:1175]) by DM6PR07MB6716.namprd07.prod.outlook.com
 ([fe80::2e20:ee0a:1b4:1175%3]) with mapi id 15.21.0025.012; Mon, 18 May 2026
 02:12:41 +0000
From: Manikandan Karunakaran Pillai <mpillai@cadence.com>
To: Hans Zhang <18255117159@163.com>,
        "bhelgaas@google.com"
	<bhelgaas@google.com>,
        "lpieralisi@kernel.org" <lpieralisi@kernel.org>,
        "kwilczynski@kernel.org" <kwilczynski@kernel.org>,
        "mani@kernel.org"
	<mani@kernel.org>,
        "vigneshr@ti.com" <vigneshr@ti.com>,
        "jingoohan1@gmail.com" <jingoohan1@gmail.com>,
        "thomas.petazzoni@bootlin.com"
	<thomas.petazzoni@bootlin.com>,
        "ryder.lee@mediatek.com"
	<ryder.lee@mediatek.com>,
        "claudiu.beznea.uj@bp.renesas.com"
	<claudiu.beznea.uj@bp.renesas.com>
CC: "robh@kernel.org" <robh@kernel.org>,
        "s-vadapalli@ti.com"
	<s-vadapalli@ti.com>,
        "linux-omap@vger.kernel.org"
	<linux-omap@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
        "claudiu.beznea@tuxon.dev"
	<claudiu.beznea@tuxon.dev>,
        "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>,
        "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>,
        "linux-pci@vger.kernel.org"
	<linux-pci@vger.kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v4 2/7] PCI: cadence: Add post-link delay for LGA and
 j721e glue driver
Thread-Topic: [PATCH v4 2/7] PCI: cadence: Add post-link delay for LGA and
 j721e glue driver
Thread-Index: AQHc5l9RsT4zyZPLJEykoM7+XPboKrYTCZlg
Date: Mon, 18 May 2026 02:12:40 +0000
Message-ID:
 <DM6PR07MB67169B65E6B826E24A8E64AEA2032@DM6PR07MB6716.namprd07.prod.outlook.com>
References: <20260518004246.1384532-1-18255117159@163.com>
 <20260518004246.1384532-3-18255117159@163.com>
In-Reply-To: <20260518004246.1384532-3-18255117159@163.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR07MB6716:EE_|PH0PR07MB10779:EE_
x-ms-office365-filtering-correlation-id: 7517bf37-df23-4d01-6614-08deb482f0ee
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|7416014|38070700021|921020|56012099003|18002099003|11063799003|22082099003|4143699003;
x-microsoft-antispam-message-info:
 xTSKwPh7G1AQakMbVqGXh0xzL5TSuvObzh3suFPw1XCAsrJmgKy3Ncli/YDxnaWxfFTFvaUENWLgjSdVFAR6iF0lMdNaRqmnUx5sLBAazG6xSie07GOAoHXPBAzCkG+lf1UwJuT1skFT/FDSpC6GDcQuR9MhGcCP+nbgURgUx3bP2tZtK9yeBTTvCqz90CeOl6RiCp+CKr4evQIQjMx6xVJ1PQt6bZjfvXua+WvZefci7KRsxpEnb4NEKOiQkysIC9FJLIb9bVUroEA0a5EWA8sMTqTzeY1OSYyN9kHNUcF/QGssZZotu1TKLWyMGfrcQAyxyEt31yBHVnTggkpaq+24SpXkdPY/MeKDguWOOFAxFe3cU4oZlkgUyQjtXX+NZedvRP0jk5agObzGvZOA3jdXDQWEfY8/idJ22ssclGQlRLPEkHp7ZXvUy8IQzUIUtlOcjk9nWDxrzFUY5lMJYmwJJGTqXaPAsKzZVruJFKU/1UzIiyFX02KgXsopKA8asv0sgmxQaULRzYqawN9bVNWT8gCtfR6Bj+haWUo6EbcsTUS+y/fuPwC1hTB3RQ67u/kUfaBrfgFehzrtEx74GJE43ze3o59hDnAP9e9pmyRY6hwI4DgdJG2lwEWo6cwdfl9JZuGLZlYBJwFmhW/113a+tTrLpgvooNOrbXe2ZGFsW8BJ1dsjA+vUwVcP6Dxcc3tL3blq+bWvCzdWNYIYnvbN1VblGcUVL69b2b2jJ0gZwyW46agKEutkRNZ2whfSWBlfzl5NFtC9DGcx6lknTQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR07MB6716.namprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014)(38070700021)(921020)(56012099003)(18002099003)(11063799003)(22082099003)(4143699003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?bGseoZzo1lCYim4tusVPXSJa7qtbYH6dsRoMKsbGxakS701HAOx6Ll+g/CnQ?=
 =?us-ascii?Q?Pew/3cDlzVZfynqapIM5tSNBwdQZXF+ZV2fCCh3qlRr9NgvFj3WAqkUPM64I?=
 =?us-ascii?Q?pzZO3W9atRiagg+h/aXz7ZeQM7NqsGVT43RNmKih6I1EynEoasXEfg4d1LO+?=
 =?us-ascii?Q?srXwusFXgmoNYGIW33H1Cqg6Db/J6adr0UdvaI3FBWmNpxl38+W9ppoGZRLC?=
 =?us-ascii?Q?SupvMLsLiTtR67ohQXo8Ba/su26LawMtgEi2MwDo7bwF8+z+0wOZPQEmnLbM?=
 =?us-ascii?Q?kNKv8vtxH7qFj7YyArDCJ1i1pRsBxalHbUx7c06GOwVK0kyMUuiOwpUmHcGU?=
 =?us-ascii?Q?KNYAp4K0zpHe3pNVz0/RFE3neFt5GkHLKo4g80Kt5NYKHJLbq/9LdC416528?=
 =?us-ascii?Q?E0lfQIuCFqEZR8bTdEEMkuhXXbhnqfEGqIRtjm7XcWBb20uhLfM4O74QITQE?=
 =?us-ascii?Q?rbnqqsOr9GWH3VgGliieFdPfELLtbVbNGz8QO87RC/YykHcGLJmqh3vMOFtN?=
 =?us-ascii?Q?aRupJ75mupCgqjOL2ODT66SaS5mCu+cIjAUHTCqJHruy2X1iCfFoi5YNcC5k?=
 =?us-ascii?Q?1sXXoyu8YbsVIfuI1A43wOId2vGbzUwweA2qwi0ArBcu3154n4FybqKgg+AO?=
 =?us-ascii?Q?HasRzcjtPHbW0Aoqf9/YIoFGZTdM9qN0qAPPJKdlVlftYodrahkpBwdelczu?=
 =?us-ascii?Q?JrnTbZi/het5xrSGVv/ZaKGNlLBhn+Cb/5sNtZu80g1SmLiui1YOp4srAfTA?=
 =?us-ascii?Q?p6/CUyKUdqCWf78w9+rSv0yi2vJ1qR8AqlVL+0IizAEr/rJ8x2Gy+vceF+wr?=
 =?us-ascii?Q?bWvWzq37ytTzoBSFEJ2fcV0z15twGlnLq8IzBomi1J64hH/KMQsQ2FGOdyva?=
 =?us-ascii?Q?KfRNjXMs2PPxnamOYBkgMja7/GsSwwNX+K/2H01hNYj086P/YB3fg6tLrhlT?=
 =?us-ascii?Q?RAfxc+e+8nCmcM8fTPkVNV2AkrSUIgSZiJ0c7Zivo+r0fFrkjotXfemGKXrF?=
 =?us-ascii?Q?6uDQEtebTPJiy3fB/OBz2Gp280UCVtSKS4XWjXm0w/UNp+7wAS5epVS0zakf?=
 =?us-ascii?Q?xeW76gqp7wy/N5gU/36WKGrQC+4vF3TlMxJ0dBHGdj0+p+Tw/BTHCE12ji1x?=
 =?us-ascii?Q?DOZcaA48hcgc47HCjh3XIlEz24ZIVzJjiAO2WtpBwKbyVLPiGdbRfQNX2gNr?=
 =?us-ascii?Q?PPchsjSNAUP0IuaZXMcFhepquEdtyDX/UGUQxw1SsZ8Htae6UfK9M1WtfaMs?=
 =?us-ascii?Q?Y1iS1nRZc8IESkfjSsBgQfgrCNztZg8bv4OfOXq3PQK+LEW3o8pBMH64We1Y?=
 =?us-ascii?Q?TlR2DUm+lzxmAeL5nsr5HVNZiJ29RMizd/HyyulYUFcNjaQ4wIDYoSxKl/mR?=
 =?us-ascii?Q?V8iPjCtFqVCASkUdjYIEpRUxPevNb9gI+uQ04SinvFRRsTdFVhMCYYapOmuE?=
 =?us-ascii?Q?nWhiiPct4VekmK0wyTrG5KOZQGqy/q8G+oSDZcqCqSjrd/e7expBYSqvfAzY?=
 =?us-ascii?Q?ffnQ/LYNOJcpvccViPwXq9ocQ7Q0Sf2d98kCtKOQA65yQf306D1jXKHRsnUD?=
 =?us-ascii?Q?GuOvv6equzFvKgQi8LoAAWI5B0yhEikeFVowQk0pkzWAiUvk2cnkQSEEnLUG?=
 =?us-ascii?Q?7JwSMP2o/+QeOOki2MGcjzqNNhH1I2r11tAjLexUVKpRlQSxZJPYrqsuf2Zf?=
 =?us-ascii?Q?/xSrWMjFuN5NlwNhoj66uFwF8XGw+v1kLgyBgMpw0AHBe+ILQ2P9JLbnlWnd?=
 =?us-ascii?Q?CLguOQL7jQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	PRwZhlldNNvtyThV+psQW24xCRSxbTrWkVUbUHnQXw8mj+7REOPT6woWRlq0ja+DgsczZr/P+Xp1eWRsmCZLvZ8HRG+fIYFk0iEn1TbCWXTp4CyOB8zYZMjuD/t+bKIRHaybpT0xr3BFsiR27NS/3HL9l9sJ43rg+n2c1GcILUmPl10r37c5tdWRDOXQCatfzYPZyB/qdUBgiv5pKt1GW2gAWg5zhcjWeXTx/s8RhubkPI/mBesBi/FrVJgQjf5We6KdOhoUy5K3O0YDPXaRwhXl5bD+RhWq5EpR7aD1ukSj+je6r4LnHJYG1s/OKxeoF9NSlVw2+sxua0jvbdeP4Q==
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR07MB6716.namprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7517bf37-df23-4d01-6614-08deb482f0ee
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 May 2026 02:12:41.3969
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RQ/sbO1yN+4RGfwkJ/fE45jmJv3nROuYCyRKOtUIJqVCqSsKIzvV45Yoq7ljDqZYKyd8DYXJyCU6VduZYwH1St9Kqhe5t3XHpzL8w8+2OO8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR07MB10779
X-Proofpoint-GUID: qcj3E0YElYFoRpi01iFWt85xCM7vyov3
X-Authority-Analysis: v=2.4 cv=ddKwG3Xe c=1 sm=1 tr=0 ts=6a0a759b cx=c_pps
 a=aQYToRbhQZUme44wGBfxuw==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=Zpq2whiEiuAA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=W8fx6O4W8wtO2w6lYej3:22 a=tuMieXAyK57eGGFK7xkD:22 a=Byx-y9mGAAAA:8
 a=RimS0RksS0CQPZxmF5wA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDAxOSBTYWx0ZWRfXz6I+pxIz7Ykd
 xtPCkP/jUUDSNSFp1lFUhhR0cqD36lA9Au2WeyvmmHa5Zv2Zoihl2BwyKUX3xjdPqA/5TQt9hIf
 i4qhWTsq0jdiOSDI7Bj8x8r1ouim9hGRYgnHMG3aY5Jddhx1mF6M0eR1SKL3aYP0txQwMwW7gqV
 sc1wISosqjh9bEJe+PwFmltZETQ9joe125bdG+Ee+93vGzSRVu4sFIQjStiJYJjrBuolJg+vmoO
 fzYX4OdpFqjQGsqqgHJBB/9Ffi09Jt/mO3MM1mmp7csaQ9ZDRqY4qQWOCZN/yC40kk6Vz/VmbVn
 xYyeqjgBnxVfaWO981i0oZZrwl0hSHCPzj0JNWacvIk6kBRkUb8ijl0tFWLkStCoxn+pX8Zr4xg
 Yl8q/bTjmEdoaiX4KMYUwDGVw53HFKtQkqc1Js+l9jfJgGUwawqz2iYUinas4hmlYeDUDbVzyci
 PEcUBtjHIMxTAJIZ/rQ==
X-Proofpoint-ORIG-GUID: qcj3E0YElYFoRpi01iFWt85xCM7vyov3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_01,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0 impostorscore=0 clxscore=1011 priorityscore=1501 spamscore=0
 bulkscore=0 phishscore=0 suspectscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605180019
X-Rspamd-Queue-Id: 3B6EB564EFC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[cadence.com,reject];
	R_DKIM_ALLOW(-0.20)[cadence.com:s=proofpoint,cadence.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32740-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,cadence.com:dkim,DM6PR07MB6716.namprd07.prod.outlook.com:mid];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_TO(0.00)[163.com,google.com,kernel.org,ti.com,gmail.com,bootlin.com,mediatek.com,bp.renesas.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[cadence.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mpillai@cadence.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action



>EXTERNAL MAIL
>
>
>The Cadence LGA (Legacy Architecture IP) PCIe host controller currently
>lacks the mandatory 100 ms delay after link training completes for speeds
>> 5.0 GT/s, as required by PCIe r6.0 sec 6.6.1.
>
>Add a 'max_link_speed' field to struct cdns_pcie. In the common host
>layer function cdns_pcie_host_start_link(), after the link has been
>successfully established, call pci_host_common_link_train_delay() to
>insert the required delay.
>
>For the j721e glue driver, set cdns_pcie.max_link_speed from the existing
>link speed logic. For other LGA-based glue drivers (sky1, sg2042), the
>common LGA host setup (pcie-cadence-host.c) provides a fallback reading
>of the device tree property "max-link-speed" when available. This ensures
>that the delay is not missed on those platforms once they enable the
>property.
>
>Signed-off-by: Hans Zhang <18255117159@163.com>
>---
> drivers/pci/controller/cadence/pci-j721e.c                | 1 +
> drivers/pci/controller/cadence/pcie-cadence-host-common.c | 4 ++++
> drivers/pci/controller/cadence/pcie-cadence-host.c        | 4 ++++
> drivers/pci/controller/cadence/pcie-cadence.h             | 2 ++
> 4 files changed, 11 insertions(+)
>
>diff --git a/drivers/pci/controller/cadence/pci-j721e.c
>b/drivers/pci/controller/cadence/pci-j721e.c
>index bfdfe98d5aba..ae916e7b1927 100644
>--- a/drivers/pci/controller/cadence/pci-j721e.c
>+++ b/drivers/pci/controller/cadence/pci-j721e.c
>@@ -206,6 +206,7 @@ static int j721e_pcie_set_link_speed(struct j721e_pcie
>*pcie,
> 	    (pcie_get_link_speed(link_speed) =3D=3D PCI_SPEED_UNKNOWN))
> 		link_speed =3D 2;
>
>+	pcie->cdns_pcie->max_link_speed =3D link_speed;
> 	val =3D link_speed - 1;
> 	ret =3D regmap_update_bits(syscon, offset, GENERATION_SEL_MASK,
>val);
> 	if (ret)
>diff --git a/drivers/pci/controller/cadence/pcie-cadence-host-common.c
>b/drivers/pci/controller/cadence/pcie-cadence-host-common.c
>index 2b0211870f02..18e4b6c760b5 100644
>--- a/drivers/pci/controller/cadence/pcie-cadence-host-common.c
>+++ b/drivers/pci/controller/cadence/pcie-cadence-host-common.c
>@@ -14,6 +14,7 @@
>
> #include "pcie-cadence.h"
> #include "pcie-cadence-host-common.h"
>+#include "../pci-host-common.h"
>
> #define LINK_RETRAIN_TIMEOUT HZ
>
>@@ -115,6 +116,9 @@ int cdns_pcie_host_start_link(struct cdns_pcie_rc *rc,
> 	if (!ret && rc->quirk_retrain_flag)
> 		ret =3D cdns_pcie_retrain(pcie, pcie_link_up);
>
>+	if (!ret)
>+		pci_host_common_link_train_delay(pcie->max_link_speed);
>+
> 	return ret;
> }
> EXPORT_SYMBOL_GPL(cdns_pcie_host_start_link);
>diff --git a/drivers/pci/controller/cadence/pcie-cadence-host.c
>b/drivers/pci/controller/cadence/pcie-cadence-host.c
>index 0bc9e6e90e0e..058e4e619654 100644
>--- a/drivers/pci/controller/cadence/pcie-cadence-host.c
>+++ b/drivers/pci/controller/cadence/pcie-cadence-host.c
>@@ -13,6 +13,7 @@
>
> #include "pcie-cadence.h"
> #include "pcie-cadence-host-common.h"
>+#include "../../pci.h"
>
> static u8 bar_aperture_mask[] =3D {
> 	[RP_BAR0] =3D 0x1F,
>@@ -397,6 +398,9 @@ int cdns_pcie_host_setup(struct cdns_pcie_rc *rc)
> 	rc->device_id =3D 0xffff;
> 	of_property_read_u32(np, "device-id", &rc->device_id);
>
>+	if (pcie->max_link_speed < 1)
>+		pcie->max_link_speed =3D of_pci_get_max_link_speed(np);
>+
Why is the conditional if required here as during cdns_pcie_host_setup(), t=
he value of
max_link_speed is expected to be '0', unless specifically initialized by th=
e platform code separately.

What happens if the max_link_speed is not defined in the corresponding dts =
? Would not the -EINVAL returned from the function create issues ?

> 	pcie->reg_base =3D devm_platform_ioremap_resource_byname(pdev,
>"reg");
> 	if (IS_ERR(pcie->reg_base)) {
> 		dev_err(dev, "missing \"reg\"\n");
>diff --git a/drivers/pci/controller/cadence/pcie-cadence.h
>b/drivers/pci/controller/cadence/pcie-cadence.h
>index 574e9cf4d003..042a4c49bb9a 100644
>--- a/drivers/pci/controller/cadence/pcie-cadence.h
>+++ b/drivers/pci/controller/cadence/pcie-cadence.h
>@@ -86,6 +86,7 @@ struct cdns_plat_pcie_of_data {
>  * @ops: Platform-specific ops to control various inputs from Cadence PCI=
e
>  *       wrapper
>  * @cdns_pcie_reg_offsets: Register bank offsets for different SoC
>+ * @max_link_speed: Maximum supported link speed
>  */
> struct cdns_pcie {
> 	void __iomem		             *reg_base;
>@@ -98,6 +99,7 @@ struct cdns_pcie {
> 	struct device_link	             **link;
> 	const  struct cdns_pcie_ops          *ops;
> 	const  struct cdns_plat_pcie_of_data *cdns_pcie_reg_offsets;
>+	int				     max_link_speed;
> };
>
> /**
>--
>2.43.0


