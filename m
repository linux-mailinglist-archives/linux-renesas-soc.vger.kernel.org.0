Return-Path: <linux-renesas-soc+bounces-28281-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yMAcKGOWlGneFgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28281-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Feb 2026 17:25:07 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B1AF14E235
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Feb 2026 17:25:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2052C304263B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Feb 2026 16:24:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CD3136EAAA;
	Tue, 17 Feb 2026 16:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="kHbkR97V"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010014.outbound.protection.outlook.com [52.101.229.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E2336EA9C;
	Tue, 17 Feb 2026 16:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771345483; cv=fail; b=WOIXRVvOqXS2h/I/v5BaS1UVbTCiZNjJKsc5iSHil7stEqeIK/dbPfzFC1+wFqX1Ye6WX767iYY0efsXpWJELc6I6FXH0r/dxsrJ855eZL1I7IOveJtHCBd8oOKQNZItNqP4AJfAoS28+X11Fc7iI7iO3MAp3xsD1epIAEBQZ+A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771345483; c=relaxed/simple;
	bh=a+o88TgHFVD9ibEndDjk0EKoPu/y6H5Owm40ubQv/1M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YARWQOe5BuHeavdIbgJoNlKbcxwiTLxFWtjrJ69c3Bdl2gXns17L8F4B9Kh8ZmaFMIlzXblNKzLbCfIA818CmYya9SXOLP5hIyuDvmHFON3OHq9nG6Qp9KRt1aIDAoik77r5WTSJPcYeslIZ4I968y+gFF9ZAnpGJd4Iekex4hg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=kHbkR97V; arc=fail smtp.client-ip=52.101.229.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c9WiPRCC0ZSwB1ILU5V5DLFu3U5SFwvC/ChiuVxXIWNqF9GDx10k4RYB7orKOZL/gVPyy0YMtGvjB1zKRjQm3IgALgZsWLrauCV9FWBBHEaOaNBmQ2xfmyEH54umY/vTUSxR7p/73whG9JCYuIzS02ZpVlHdmHJrmTJHRiLMFbkEZKEuvVw4C7Ck4BzA6j9w038a1qID7syjFK9FGPZaX7kvMLBtr5KH26i9+ID8Fhll1i0hMLYWw03hqgjkcVT8UO4ljqCpVWzoOhJO9po0Ngq+CWlFmfZYgV6vjVW7EwKSfQdKhRjmnAllhQuys0aXfkErwzfbW5lxClUT8hLV5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zXSwbrkgn2Ks619OQYcI7h6Eyx8NqzWHCnAs7JkwKrY=;
 b=whI0N1h2iG8SmKVzzh5610rgsmEyGNf5ZH/GvzDlxs3HHO24VnhtNxRpHq3cjCYTLCDW1dYVyUyZYdSjFc6pxVhR4K1AmH8DZO2OZLNMUkY1xeBHZnRRvKl2pOoKdRQZRYK9ASqa+4iEIq9bI95a2Xz8n2I1qGgHFThF1TTG6WocZNUGRkQbp8gP/H4dPqYteZPR5xBfwQKlVNF5B73KfJkLp5fKOWnQfkO+Ap47L/+DR5ZZCplPCa7yAzTQOqPLD+hqzlDcSrS03ibvbMQ4tL8L70uAgSCs64SD4Dqf3XmrPLDZ5PaS7ejfM13I3TRnUgP5yGGfNiYBNhB2H9pASA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zXSwbrkgn2Ks619OQYcI7h6Eyx8NqzWHCnAs7JkwKrY=;
 b=kHbkR97VlCqr03/8n4uMFjS5kMco2PTRUfjZ+hyNBQ9mD5Rf8l0J9Fs5xa3RJvH1ch2fp4gb7rqDjBnpfcNBI0a6KE9l7IhnB6a4NBehiFuy3v9MB7T6hW5yI856RhzliX/g215dwlrG2tL5bRwkycxcYRcNN3pN2qhxXJfGHYo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYCPR01MB8581.jpnprd01.prod.outlook.com (2603:1096:400:154::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Tue, 17 Feb
 2026 16:24:40 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9632.010; Tue, 17 Feb 2026
 16:24:40 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 1/5] clk: renesas: r9a09g047: Add entries for the RSPIs
Date: Tue, 17 Feb 2026 17:23:45 +0100
Message-ID: <ca59fdcc6c32b8f6659aa9218f1a42d2bcd258c3.1771344527.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1771344527.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1771344527.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0320.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:eb::9) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TYCPR01MB8581:EE_
X-MS-Office365-Filtering-Correlation-Id: f8d67c42-6f7c-451b-920b-08de6e410cb4
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?U3mCAyuWZd8YELMhx+vsMTeGbNSd8arbjlRATazNESqXOQlW6PcMIie/kW7n?=
 =?us-ascii?Q?jBaWhpm+zIakoO8WbGOj9VaaI1FzzfY2+yl5tYYzxjofvEOBs0M4ZWDW0qs9?=
 =?us-ascii?Q?KJpb43+sViesacpodjU4qDwo2G6gZ2MIjwKvtINOuBazGC3/Cru7oWxBiLzj?=
 =?us-ascii?Q?HpbZnHDyOMAfJsoB6H7is25JFZte20JuCPSEB0P2V+b3QRA+9yYciFiwPi8z?=
 =?us-ascii?Q?DeNAN4PlKs/QSGpIIWJvneogywdRsM/WVshqnuSJdoozkKjBeMqCpUOFIHnt?=
 =?us-ascii?Q?5ztMZj2FYFt9vl66lCgUEzW6XsBORKsY7cIcRYLvCYl0VuJz7sPtEs0OtEnZ?=
 =?us-ascii?Q?Ctg9ohlo5QM4tWIx7iSihHoUsOeLmyRVdNRiBXOBP0y72tozl28UL76AKq0f?=
 =?us-ascii?Q?MPxm/zZZm5XeUoVVTRujF0ypadlTDfn3qAd0h4C+LxuKRM4eCAC+Kp5W0bik?=
 =?us-ascii?Q?65gV7xWupd27YCbQ/d+cK/OfhnIuDoakasg/Of/mnFnqkfgKACmhZbRIp6BX?=
 =?us-ascii?Q?W0KQH8Lm1ngXwNZadtTDgGmw7WxeN0mDmA/xd7FJOBa309FvopGxPY3xXWyy?=
 =?us-ascii?Q?6/YQbNjYLIAT3YP5gvw97JzeA38tKypddBvNBxSjw03qohcBp72+sL308zE7?=
 =?us-ascii?Q?i/YtoWGKNHUXRI7h3SnVMf+gf1FuiUmgdvSDCm7IOO4rgntVwyHzFKNHrt/C?=
 =?us-ascii?Q?ZNZeiTZoDSSrx6THcRG3Qhyv7KFnzWL96vFIq7dvqk2coikH8MW5PfnERx1S?=
 =?us-ascii?Q?TLa8YK1gUSLYXkT+qtEXe/Lia1azToPNmwFTEBJSsf2XMiWzbypgqZcFKmgO?=
 =?us-ascii?Q?Vd//SA56p9Ylca88GyuyUBqSUzvW3u31bs6UVaVmwxQYhmxALf42zBOnZLyI?=
 =?us-ascii?Q?KYJzMCxO7rL0hJ7ZCGBrgkUziCqGPb8nV7CvTmRasiQga/A33afBi5tov6Rb?=
 =?us-ascii?Q?z2Fb93nuFiksQHZ8+Lbwbd1i81AouJlSF0MKD/oM1JVZV7nwR4lRXHMd2We0?=
 =?us-ascii?Q?krS1dDYLOLP0Bo1UrlLf8G5Dei3lR8Hcv1Vm48OPBET7Do70o0NU6aTWlm1T?=
 =?us-ascii?Q?yEaTnqVUfYLgb92WfCYyVT/Xc4rPflhM7vQ8vQhmh7XAIdmZcgUZlCmUHch8?=
 =?us-ascii?Q?/Z7LCLzymqApRjIxF9UZoAnE8/SJCMMxBkG8R2fWR4XLH72jkiigOQTex2mn?=
 =?us-ascii?Q?vGXLXQ4CmzXZw0u3gf0c/H48fQHfbHqsRls64AcJQ6g93OmE5Aq+Q/8tq0Ep?=
 =?us-ascii?Q?qoYwQiOk+UZfB+dYkioymIpaFzc8zkV0kMZkPvudjqzeO7KrI/AG+MKBoG+H?=
 =?us-ascii?Q?QQBCt3/AjlYdJRldrk3H5bpb2iu2hBSoWcUCWUduTwwk1lzzoYveuS4kTJFX?=
 =?us-ascii?Q?tDh8/oZmBVWPYejysrh2vjmySRHm8fkIOx9hJ0kmBLtkc37ZbKkqTudOzmEf?=
 =?us-ascii?Q?qiVNepzIkomcIifoYWw/XvRBNkS7E2LnhjL2fwp1w6JhIEHfX7IlLb0CZJEJ?=
 =?us-ascii?Q?Dsc6ZCpO0ftstMmFY7/p49AOuPuz7ioyddEo9IHPnkbQ1QJqg4baPMQDFbQ9?=
 =?us-ascii?Q?MS3r5bTKzNATg02rOYdw7FB3LcpzqpVipWsFArP8ixiqxvp/Z56ujfA+2SSA?=
 =?us-ascii?Q?AxwcZgZ55/p7r0jOaCghpv4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fXIb3/2h0oO72QFDtMjB4V8pMYAh1kSEtv+K/yqVY8LPL3zOUoxlTLZzN/io?=
 =?us-ascii?Q?kgf3kR7inGg6rqs0bfUGpSLX1LPdO3pL9OhxSb2t5ZvjwarD/EjYWtdxMs6N?=
 =?us-ascii?Q?GbyPSR/pAx/6sXw+/f7TAbKRh7oXRX/7Qi66LPFAosrQ+PxHt8DaoN0nUxau?=
 =?us-ascii?Q?KO0Vmcmq/Al/D3oGgDdoSpF+2aRDupuaFhUupjLfV8ZpR8czc4AnEaETV2u+?=
 =?us-ascii?Q?2sFfEbjp6ZVMWG6OEh2RVZuKUu72ijSPRhORUP0+6cnuIY/GnxEePEVD42Rv?=
 =?us-ascii?Q?a9QC7rn2TS3Ls02bpHbPcC9qZvQQEP7/+pQd99KqqwAt7uffFTRBTWtuypO2?=
 =?us-ascii?Q?5lWO1cyLC6rRdQya1nVjASmwi/t5t7mWtJu8nLNxgu9nPkdQ8g0ahIlFHvbt?=
 =?us-ascii?Q?WlP2PWUoXOQtBWQC3+/lRczVRGuAQPuOlWn7yz9YUvBQ2o+J/XSnRlbNlNBA?=
 =?us-ascii?Q?z5turmlch7xXNEWXAPrPlScE+Vv+RQe70pb1zAGP72+kZ21/4+AeDty9v5+m?=
 =?us-ascii?Q?t9yYTg+HWjXfd7yMECe6bLzaq6cJaFFYwuJPcFESQBruB66oL0+nzvp8upAa?=
 =?us-ascii?Q?X0uu4Jv2MU0LG6lWIrquPHOF/V5kfHqGYt6IIJN+Bo347gnXE09eb2j9Zeo3?=
 =?us-ascii?Q?MH3DPvZb04yDmTGvfAfieo0qZGPA34Zg3+efkRxNqATRvV8Ehj2C0ZyKkYNQ?=
 =?us-ascii?Q?K//IoRXbUu2ooc2v044b5K3iTaJLpPLcIw/7Aobym9kp+5QXrJj9WDMDpZdl?=
 =?us-ascii?Q?mEzCAZjXfBdvzEYCUnoFaSB8gsfQb7zcqg1lPnr88+2FiOJsqtz7w4wZZvnx?=
 =?us-ascii?Q?gLl7JXLGY5lCbP91sxK13H+EgfVy/jbxz6KjmIFcpAfOlNipEW3WJx31kYZ1?=
 =?us-ascii?Q?iSAn3ZNafhicHaprJaSUY3robxjsn9OQtUnvqHUKDXhNerBCwio9RDjnn2mv?=
 =?us-ascii?Q?O8TMgpUDDL+cCqMGRIWoogvyLzPXyTnctsmsPHTDmLcqmiHmBrUjYDGA0IjN?=
 =?us-ascii?Q?T3YrgbQYXSgZW6b929uvgOcRyFnrf6RaeDc27hSq4LEE0/jdq/lVfyUfwn4D?=
 =?us-ascii?Q?u7Yvt4U4GY1eYhpnpDkyW+/pRPcPdQl4SSopbXEX2b+VlpVPUwxX/mT7UbHP?=
 =?us-ascii?Q?PQ4Kmytf8YswtAM+pcDmRQIClSd75cb/huv8tcsco2lVMUtX/MbpWD7UcPid?=
 =?us-ascii?Q?QJg7DiOhqiffdUhSGtWUq4ujjZpImO5g64UAp1FPrNdnwJ+hNIfy4OTkGH4D?=
 =?us-ascii?Q?8sKLX+1J2e2hr9VSvG9mFjtyQKy2FHrOyAWAFaLouPFc8BQsUcTRiVpAwwzD?=
 =?us-ascii?Q?CYRq/wNZVFfbB9wjJvgmdCnFuuZIJL7+2eerTf+BowFY6+fAmxRkrPuTIldP?=
 =?us-ascii?Q?XrQJUJRcFryL/VHGN4NrUnZ/K77jo55iAn+urfGTfTqSh38y209iZezHVEf1?=
 =?us-ascii?Q?wow1H+y7SA+nCbphVSubMyy86NZTHMi6JlTje3FE2b/HXZ+h4xhsxR0/mbhd?=
 =?us-ascii?Q?IJOlFHMKxP5YP9+J6tQ9bSKB8uBooKXXxPF1V2AqA+Y2WOwrS/aOkP7dxOR0?=
 =?us-ascii?Q?zMfSN8uLHaj3alwWUWEiZ+QrTIfsLjk5cweeGLWINqn5k7yATWHIQTKm8n1f?=
 =?us-ascii?Q?R9qSnNIkEjcWJh+6HNdTSRk2obN5srUL8WD2DNYXRZVej6aGNSU1dxT1bJdv?=
 =?us-ascii?Q?dpG6g1rlAwA4BALclm98IsWlkculi1QRjL7XZpmgkgCaO5EqLzcpxxMv5UHH?=
 =?us-ascii?Q?xtB0ANOmbdoNCoIuiCEgAryR7C+Dwt9iRbL+t2fCakmFAuWxqTmO?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8d67c42-6f7c-451b-920b-08de6e410cb4
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 16:24:40.1417
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p1bD19QHY9x51pOKbVyt6sfK1vqrnyrHlMzHrUpUzM0jLosOrKSQ8Z42A6JqLXzH/gZd8fwCAAPMCiPaXTbJoWyvK1p+8SHOrr2EUv8+K9QWEVzUYoSCIBF7P637hl8Y
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8581
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-28281-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,renesas.com,kernel.org,glider.be,gmail.com,baylibre.com];
	RCVD_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	PRECEDENCE_BULK(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1B1AF14E235
X-Rspamd-Action: no action

Add clock and reset entries for the Renesas RZ/G3E RSPI IPs.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
 drivers/clk/renesas/r9a09g047-cpg.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/clk/renesas/r9a09g047-cpg.c b/drivers/clk/renesas/r9a09g047-cpg.c
index 1e9896742a06..45e2d9f93b92 100644
--- a/drivers/clk/renesas/r9a09g047-cpg.c
+++ b/drivers/clk/renesas/r9a09g047-cpg.c
@@ -224,6 +224,24 @@ static const struct rzv2h_mod_clk r9a09g047_mod_clks[] __initconst = {
 						BUS_MSTOP(5, BIT(13))),
 	DEF_MOD("wdt_3_clk_loco",		CLK_QEXTAL, 5, 2, 2, 18,
 						BUS_MSTOP(5, BIT(13))),
+	DEF_MOD("rspi_0_pclk",			CLK_PLLCLN_DIV8, 5, 4, 2, 20,
+						BUS_MSTOP(11, BIT(0))),
+	DEF_MOD("rspi_0_pclk_sfr",		CLK_PLLCLN_DIV8, 5, 5, 2, 21,
+						BUS_MSTOP(11, BIT(0))),
+	DEF_MOD("rspi_0_tclk",			CLK_PLLCLN_DIV8, 5, 6, 2, 22,
+						BUS_MSTOP(11, BIT(0))),
+	DEF_MOD("rspi_1_pclk",			CLK_PLLCLN_DIV8, 5, 7, 2, 23,
+						BUS_MSTOP(11, BIT(1))),
+	DEF_MOD("rspi_1_pclk_sfr",		CLK_PLLCLN_DIV8, 5, 8, 2, 24,
+						BUS_MSTOP(11, BIT(1))),
+	DEF_MOD("rspi_1_tclk",			CLK_PLLCLN_DIV8, 5, 9, 2, 25,
+						BUS_MSTOP(11, BIT(1))),
+	DEF_MOD("rspi_2_pclk",			CLK_PLLCLN_DIV8, 5, 10, 2, 26,
+						BUS_MSTOP(11, BIT(2))),
+	DEF_MOD("rspi_2_pclk_sfr",		CLK_PLLCLN_DIV8, 5, 11, 2, 27,
+						BUS_MSTOP(11, BIT(2))),
+	DEF_MOD("rspi_2_tclk",			CLK_PLLCLN_DIV8, 5, 12, 2, 28,
+						BUS_MSTOP(11, BIT(2))),
 	DEF_MOD("rsci0_pclk",			CLK_PLLCLN_DIV16, 5, 13, 2, 29,
 						BUS_MSTOP(11, BIT(3))),
 	DEF_MOD("rsci0_tclk",			CLK_PLLCLN_DIV16, 5, 14, 2, 30,
@@ -457,6 +475,12 @@ static const struct rzv2h_reset r9a09g047_resets[] __initconst = {
 	DEF_RST(7, 6, 3, 7),		/* WDT_1_RESET */
 	DEF_RST(7, 7, 3, 8),		/* WDT_2_RESET */
 	DEF_RST(7, 8, 3, 9),		/* WDT_3_RESET */
+	DEF_RST(7, 11, 3, 12),		/* RSPI_0_PRESETN */
+	DEF_RST(7, 12, 3, 13),		/* RSPI_0_TRESETN */
+	DEF_RST(7, 13, 3, 14),		/* RSPI_1_PRESETN */
+	DEF_RST(7, 14, 3, 15),		/* RSPI_1_TRESETN */
+	DEF_RST(7, 15, 3, 16),		/* RSPI_2_PRESETN */
+	DEF_RST(8, 0, 3, 17),		/* RSPI_2_TRESETN */
 	DEF_RST(8, 1, 3, 18),		/* RSCI0_PRESETN */
 	DEF_RST(8, 2, 3, 19),		/* RSCI0_TRESETN */
 	DEF_RST(8, 3, 3, 20),		/* RSCI1_PRESETN */
-- 
2.43.0


