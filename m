Return-Path: <linux-renesas-soc+bounces-27712-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qGIwM0rxfGndPQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27712-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Jan 2026 18:58:34 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 020C3BD8C1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Jan 2026 18:58:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 96AD730091C2
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Jan 2026 17:58:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63A30366554;
	Fri, 30 Jan 2026 17:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="XNA2n+k5"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010022.outbound.protection.outlook.com [52.101.228.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61A9433E37C;
	Fri, 30 Jan 2026 17:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769795909; cv=fail; b=XBxNFsRwYdiL89zCAqbH/WNESdLGWpQTF9ukZ8Cwqf0Q0nNrHTaOK1pxhsGHR49mPGmbu0YWQbSraQCFw6BJzEOGq7N/K8klaVIdrJp0qhDRO9++W6k5Wyo+3scsGWNq8bDNDdo68jFmCs0AMsJ2h8bU4pGcWNRLg2zIXDWCTbw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769795909; c=relaxed/simple;
	bh=jM8RUS/0fq3xa1WFRiyJbBdKAWxj1ijRe9/BUF5ccVo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=mOqWmdwFrN68Ty1j98s6XFWCMSsZIlFop9W9q10kNIQu2FuFerG7r9BBpVFcuGhwc1Moqhc0nMj7CZ5BcRX5VSyzVIhyRSzu0LlQf4irpwzFRsIz3TMZFKq0lH0hPgx2r+HtlDr7HXO/ZYOq2M0fwFiIzJlIcHMlg9mze9yWgY4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=XNA2n+k5; arc=fail smtp.client-ip=52.101.228.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HaHAdUgB31ufl0TscfghlgeeW1I8jzqDXjlv9MnZRYbgUS2v9rNCOSLhH4KfyttyD7CWJisrYwZHUrTL2QZS8By26k8pbjrrxxn7BQOX1IXTt36ErJWMXmpGdIcwAM3qDMb941iCKrjQI5knU3MkoGJqiJEkz82KoUoxaggzvCVA2SJWNCqMxqvluRUjivlwfOe7x2NBlVEQPNcHNJkWelHHz7zmZLzQcZ1PQSIV2mNw3aXWOXJ60LGGu1IZcspD0daPRMTUegibKVEygDJqSe5QWFDLR8Q2hpWwRGDk7w5WSQT1zz/SrThNDedGXkkAp8URyRhQXCyGT055Rggvfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LhQxhsQIAFt3NtZeF3nbQw6pkaky/REG9ilu+DPB3CI=;
 b=J7+jmd33NvFItsGQ6A9MJVb8kJamBvOWZ5EBZO8EHXzsHZnuUDoWF09IsGj5/6q7wXnDdjK7Y/B8XNkdZxw44GSp3MBUh5LCTbvz0LXMtV8ViHa27amfSzGBGjOS5N7er1Yt0PeBd89GjI647AZksxbuDo3eU74o4mfPu/+FhcWav+CAHlziPotdUaGVxyoZ3oK+b07k8RP5CO7AD4KeTaO7xL981qCg2du8KmONcahR2/5loOvtvNnDAFXAh948EOQRXfkn87Q/NhmEHxQLXG6PKlwdP/xn67B2PVOs8ClGIgyKdc1F0IiJD+5O6agObu3GV4R+b8yOuaaefZ8vgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LhQxhsQIAFt3NtZeF3nbQw6pkaky/REG9ilu+DPB3CI=;
 b=XNA2n+k5ATtntpiPAIR29qH81LVFFWBUp/XtzRDBpIT/xL+gCq8F41JhfkBzhamJ39PRwpBWDRGTeXHLzbpLhMudWkF/uf+la7Hdld3sWLoDSEkx8ntdSjUX6W8dIiYny0QLcIYGroTl7sZ+CpcfuC9nbC7xN8dNfgSIVJ0z2DI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYYPR01MB14020.jpnprd01.prod.outlook.com (2603:1096:405:20e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.11; Fri, 30 Jan
 2026 17:58:23 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9564.010; Fri, 30 Jan 2026
 17:58:23 +0000
Date: Fri, 30 Jan 2026 18:58:04 +0100
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com, geert@linux-m68k.org,
	laurent.pinchart@ideasonboard.comy
Cc: linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 00/20] Add support for DU and DSI on the Renesas
 RZ/G3E SoC
Message-ID: <aXzxLEiANRVVhBHP@tom-desktop>
References: <cover.1769789834.git.tommaso.merciai.xr@bp.renesas.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1769789834.git.tommaso.merciai.xr@bp.renesas.com>
X-ClientProxiedBy: FR5P281CA0037.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f3::17) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TYYPR01MB14020:EE_
X-MS-Office365-Filtering-Correlation-Id: 18bc42d8-605c-431c-88c5-08de602928d3
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?b+ck/BETqrCC7jcadsqAz8Ib6+kQxjrgpnp6S4KCUmAQf0jeR6Tbd4smMPKi?=
 =?us-ascii?Q?wVHO3NaJHhKpSrWY9QIMPKKCIQhIVTJKVOl0ZIuLfIEpJzPrpOJUWAkyw3oV?=
 =?us-ascii?Q?yr3VsLwwrmdsbeU1S+LfvFF1U6L1VI9vCEjQiVqqDGZ5v1APHJR/qroJvsLi?=
 =?us-ascii?Q?uQuv13Rb9iMWzs1G8GCjaGYm3zj5YBNYZohK5BrEOF5llK1ZCNlYWD9bNxc5?=
 =?us-ascii?Q?+JykrphdgCo5dQlgzRjVZV9uli25b3UYnBAHHiVp7AwIBYI53yYFYcqWuUlQ?=
 =?us-ascii?Q?LacWeniFikc5KkMDHFz094uiCFt3l4X9rsrWk91OMEv2cJK2p5RnJv7wqTs4?=
 =?us-ascii?Q?axNI/gpNDcYHmF0xXJlYYm0IprhU3i04m0kKnMRYbrpBS6WWaL+6yXuvCbz7?=
 =?us-ascii?Q?sH5AFSDkgfU9ig2HvWk+kkloBozbT5eKTj43EwrXlLcPrgqiHsGoTwuq+bJm?=
 =?us-ascii?Q?QgTM+GHdwgBnqYAZP1AfxGIT1SrAS9jQYFQxu7LjdpyitEoIWOErM/lKMTEO?=
 =?us-ascii?Q?GCtadE5rZq8OCfiGjIvykeK0Q4Spe+34/ZF/t5JsHTgS8vB0Vj11He9q+SgW?=
 =?us-ascii?Q?RK8Ib6/2LMEQhx73Ee8PeaFEbnqiYyGqTrCr6SXk9Ju3Um7XCNiHXtNebgKe?=
 =?us-ascii?Q?Dgty2fgLr9tazPO54ZvDlC1zUbfyYnRnJ39g5DnL0xhaxoGI4QBQ/wei6elN?=
 =?us-ascii?Q?6cwKKZ8MLgCcw+cQIjEBpYKEuGdGFf0RDumbLqtXJ81R4porit2XGhpfrZoI?=
 =?us-ascii?Q?18hj/wlSCi7aysil1Y9EFn5oFUGzjLPq8shbvGa4WursaDzxXahPFokqsrE0?=
 =?us-ascii?Q?AVQSGLO8XtVItmUPn81aCAVtZrnIyQYpgQAICz95wQCHmnWxhFzAJeESpyu/?=
 =?us-ascii?Q?7KWCMSpkKdCYaGWdqeU4EA7DMi9osBcbLT0eHshkT09rviG3scnja49W2xrf?=
 =?us-ascii?Q?OJFidS3YYyUZXeP7RznS1CUnniyKYkGFF8IAlwWZ8alKR/HFvtINdOKAS1KV?=
 =?us-ascii?Q?+aUrpeL3RM/vcu0mBrsL5vo4V/1LwcZ4hFoEQyiWpP/wXOxE/35Wqtt308li?=
 =?us-ascii?Q?Hh6lcbBqSlna3QPMOp68aDxEQv11nzBzg4hboj5bslTqSNfUWmkd8Sc1fHL0?=
 =?us-ascii?Q?r4+3EUeWDJPW62iAPOil6w/uglF4MsxF3qdVl+9l4qHtXlOE3L76qzojESJ8?=
 =?us-ascii?Q?vvgndNHhbspuokHB5o70D3Ggz/vRkpvAH0aGZNKA2p7emlYh0LsUnztR00zn?=
 =?us-ascii?Q?rI0cAkctBsWEXi1lsa84shisnCKAB3O+IlLNgq0vEho39M/ayoLpH7AdjpqX?=
 =?us-ascii?Q?FACoFtr4Th72mmxjJu2HK3zxk8jjKleUipVEsguorpf9sbrmpv+5GzJtgZLg?=
 =?us-ascii?Q?Cnci204rbjM+b/gTsIIayuVW/Fz4PIB1Wux++cX4aijGqKKa0BLEElpidjJL?=
 =?us-ascii?Q?ZEGJRANviNh9yjDCJgcP3bVfrbZotiNrt4UPhPx4rhzUSr6FzKTZ9iGDw7Ff?=
 =?us-ascii?Q?+JbL5AjPFlMzxLPZsXtHUUNGjVZWMyWj+kTFiYRy9yMdKXI1QqD/iEtkuzvC?=
 =?us-ascii?Q?YaKw5yHEheEHLFZv9h9McG/VFrK5ptjSPJ18HTgvySgMpan2u0QHvdV1m8F1?=
 =?us-ascii?Q?uHZR7cvKDJFgKhw9qIIHPfo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XqN31+0fgXLZ2Ncw53qLh1Cvlp3qXd8DY7EkU3nN++nl0SA1yL5QWYWwb4Ys?=
 =?us-ascii?Q?IjTyWKci26Grg11idIbSitCpVluQoG9m7zCd4lvIqVYMiBgMP0dKEv0jibYz?=
 =?us-ascii?Q?MkLv/dYw4K+LQe7VY/LCgZs5lp1unP83dr6tVrqIjvfOS9VoFM3eu2+2KzRY?=
 =?us-ascii?Q?Oa/7pAXuAnShJWDg8E0581j6pH1B8AZGjfXh9w9qJvbX3u4DIMQSVCtbVnoS?=
 =?us-ascii?Q?xfFQ0DkIW0vdUOu7jCUVQQw3UTv3mWarI8HL9Vs+FS1TO+0gqjrcVAVN1fik?=
 =?us-ascii?Q?HpmcXqgEKWqG26ie2MFMyIAzmEJNvJTlNpoVewjh9jmAUcgW2HyuWouIqvnL?=
 =?us-ascii?Q?0xkgfFwdFr5CgFcPxRkW1aw+XCEnpDxe+SJzcpvfP7J2Ah+GuK0jcTcUL5H6?=
 =?us-ascii?Q?ji6cz/cAZm06eZKh3BlDm/nDSKQXdQCwdpTyoqnbNt79jPaw85A/Pj/JOEDM?=
 =?us-ascii?Q?2hzRrD8E1H3tF/m4uxgzWYZyz9pUd2aS1mvixVP2qDpi2Gx0n5JjsWMsMCQC?=
 =?us-ascii?Q?iwfi/ANasqZbu0FURCjoTedpazXC9nb3BH1Mx9GwEWMSw5g0IgKvcltKdRI6?=
 =?us-ascii?Q?gKqXikotW2QFX3IgYKgJduuTtVz0nDF1yEsY9Wx5jbYfWiZnA2sLnBbMrNC0?=
 =?us-ascii?Q?DLo1SSMlF6r2l0kneerasvRW/x2UNCXg1AUyp18Lh+NAA4coP7rqbok4i/mg?=
 =?us-ascii?Q?o1AlKtEPu+ufehtecz1RKPYNTh9o/FUox57Bl/Mz/ZgmPCVt8yyrsFKbzGp0?=
 =?us-ascii?Q?g3xXfqXMf5lzazVDYAtLSXdAjQZOJ6ba76Cr4Qajpt2XZyTH5zyTUc9B98V0?=
 =?us-ascii?Q?fHoBS7VYZqIZTKoReOxjweBz2qdLRg3KabO6kBBXXgpxvTgILxjF91r51nAD?=
 =?us-ascii?Q?FdRmFd+bqMS6F2L2pkHQr+YzQKHWgA/XY9az7ginLdcbtZ1+X7kmkNPZZ6A3?=
 =?us-ascii?Q?fHNun2sosJ9rPtdwf70FCoqF7AVnn8hEoWz+QnzWE7QuHQpszKT1a0c+NMdo?=
 =?us-ascii?Q?MraDjLv+nKQtLtCQbhvUvbZc3BNIKbzij6iJRLLV7oaD+ArX7RBR4kX1pfCP?=
 =?us-ascii?Q?h26M2f77HU46CEkqpKn85OsPYn4F2vnPrwwoVXYKLpjxz5tyJES6tBd2v4a9?=
 =?us-ascii?Q?C4kiBG0g+r2uuAor8XVh6Vn0B6qWabrWIy6Rj/LaF86cuxzDp22KnhP1AHOj?=
 =?us-ascii?Q?3tLFdKL6F19kSisSgmvkjVAXuYaJOUk9yz/TmUc8/OQ5yTKHjdgHXOpOYo/A?=
 =?us-ascii?Q?mM5rehXg4yggN6LoS4voW7ea5yb2WFjX+K20qLjjq1ul8eK4h9xCjfFrCQbm?=
 =?us-ascii?Q?dQmURt8wL2NnVkRmblgb1eCXxW8hE0PBKpBHmg7ad6n1JucGGdq7TLsYv8YE?=
 =?us-ascii?Q?G85cYiGcguB3BQkrwTO/1VQPdQnZa+xnBCARvmqcVlPrz8bFeY1BGgJ7s6Fv?=
 =?us-ascii?Q?Me6zEdJb+8773FkqbNA2l1xTjE0caDoN7QgGhHZv4z7iXVeQcfHLVvyrJvK6?=
 =?us-ascii?Q?YP1kUn18yM1kBkxaqStHOvg713fUdmB8e5mSZf+Q67VEWuIFFy9RwC/9/eKZ?=
 =?us-ascii?Q?pSzctZJd31LGSP9EhuHkYYQ7jszhCYVT+3CPM0VMvbVEHTrZHRD8GVXqqJ4p?=
 =?us-ascii?Q?3mikL0ZgZsG4Y69dVVMk4WF6AF0wbtkcl5/SfsgAwV3ImWvIOMHZfAW389Le?=
 =?us-ascii?Q?xJiRiIIJN+JUMHgo6pV+G4Z4C2SVe+oWCJ770KRnKwmlGEO9/DPZ+Ld4JTdr?=
 =?us-ascii?Q?/J/RHDvS7KQ8x6/To7/J8na5O3BHbij1xn4BDb6HRS2lwomS3qxB?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18bc42d8-605c-431c-88c5-08de602928d3
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 17:58:23.1889
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y4Gevh58d2WI60zH0gemnmkdUro51FY9KsUfexYy53BdvyBAHdLOeSSIF8Vs7SksU1kEWDKeTWh8R/l3LoQ5yk4AhGYEyoEECtIuMYQnM+LDKZYc8+TFelp/mjv6f9kj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB14020
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27712-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,linux-m68k.org,ideasonboard.comy];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,glider.be,baylibre.com,ideasonboard.com,lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 020C3BD8C1
X-Rspamd-Action: no action

On Fri, Jan 30, 2026 at 06:24:57PM +0100, Tommaso Merciai wrote:
> Dear All,
> 
> This patch series adds support for the 2 Display Units (DUs) and MIPI DSI
> interface found on the Renesas RZ/G3E SoC.
> 
> RZ/G3E SoC has 2 LCD controller (LCDC0 and LCDC1), both are composed
> of Frame Compression Processor (FCPVD), Video Signal Processor (VSPD),
> and Display Unit (DU).
> 
> LCDC0 is connected to LVDS (single or dual channel) and DSI.
> LCDC1 is connected to LVDS (single ch), DSI, and GPIO (Parallel I/F).
> 
> Thanks & Regards,
> Tommaso

Please ignore this version I've made some mistake while
rebasing/squashing, sorry.

I will post v3.

Kind Regards,
Tommaso

> 
> v1->v2:
>  - Rebased on top of next-20260129.
>  - PATCH 1: Added rzv2h_cpg_plldsi_smux_{get,set}_duty_cycle clock
>    operations to allow the DRM driver to query and configure the
>    appropriate clock path based on the required output duty cycle.
>    Updated commit message accordingly.
>  - PATCH 2-5: Collected tags.
>  - PATCH 6: Moved clk_ids to match enum order.
>  - PATCH 7: Collected GUytterhoeven tag. Fixed "dsi_0_vclk2" position
>    to match order.
>  - PATCH 8: Collected GUytterhoeven tag.
>  - PATCH 9: Use single compatible string instead of multiple compatible
>    strings for the two DU instances, leveraging a 'renesas,id' property
>    to differentiate between DU0 and DU1. Updated commit message.
>  - PATCH 10: Removed oneOf from clocks property, which is not sufficient
>    to differentiate between RZ/G3E, RZ/V2H(P) and RZ/G2L. Use the already
>    existing vclk instead of vclk1 for RZ/G3E DSI bindings. Updated allOf.
>  - PATCH 14: Instead of using clk-provider API to select the right parent
>    clock, just set the correct duty cycle based on the output. Updated
>    commit message accordingly.
>  - PATCH 15-16: Collected tags.
>  - PATCH 17: Squashed fcpvd0 and fcpvd1 patches into a single patch.
>    Collected tags.
>  - PATCH 18: Squashed vspd0 and vspd1 patches into a single patch.
>    Collected tags.
>  - PATCH 19: Reworked DU nodes to use single compatible. Use vclk instead
>    of vclk1 for DSI Node and set to the right position.
>  - PATCH 20: Fixed: dsi, du and adv7535 are part of the R9A09G047E57
>    SMARC SoM board then add entries in the rzg3e-smarc-som.dtsi instead
>    of using the r9a09g047e57-smarc-du1-adv7535.dtsi.
> 
> Tommaso Merciai (20):
>   clk: renesas: rzv2h: Add PLLDSI clk mux support
>   clk: renesas: r9a09g047: Add CLK_PLLETH_LPCLK support
>   clk: renesas: r9a09g047: Add CLK_PLLDSI{0,1} clocks
>   clk: renesas: r9a09g047: Add CLK_PLLDSI{0,1}_DIV7 clocks
>   clk: renesas: r9a09g047: Add CLK_PLLDSI{0,1}_CSDIV clocks
>   clk: renesas: r9a09g047: Add support for SMUX2_DSI{0,1}_CLK
>   clk: renesas: r9a09g047: Add support for DSI clocks and resets
>   clk: renesas: r9a09g047: Add support for LCDC{0,1} clocks and resets
>   dt-bindings: display: renesas,rzg2l-du: Add support for RZ/G3E SoC
>   dt-bindings: display: bridge: renesas,dsi: Add support for RZ/G3E SoC
>   drm: renesas: rz-du: mipi_dsi: Add out_port to OF data
>   drm: renesas: rz-du: mipi_dsi: Add RZ_MIPI_DSI_FEATURE_GPO0R feature
>   drm: renesas: rz-du: mipi_dsi: Add support for RZ/G3E
>   drm: renesas: rz-du: Add RZ/G3E support
>   media: dt-bindings: media: renesas,vsp1: Document RZ/G3E
>   media: dt-bindings: media: renesas,fcp: Document RZ/G3E SoC
>   arm64: dts: renesas: r9a09g047: Add fcpvd{0,1} nodes
>   arm64: dts: renesas: r9a09g047: Add vspd{0,1} nodes
>   arm64: dts: renesas: r9a09g047: Add DU{0,1} and DSI nodes
>   arm64: dts: renesas: r9a09g047e57-smarc: Enable DU1 and DSI support
> 
>  .../bindings/display/bridge/renesas,dsi.yaml  | 144 ++++++++++----
>  .../bindings/display/renesas,rzg2l-du.yaml    |  54 ++++++
>  .../bindings/media/renesas,fcp.yaml           |   2 +
>  .../bindings/media/renesas,vsp1.yaml          |   1 +
>  arch/arm64/boot/dts/renesas/r9a09g047.dtsi    | 175 +++++++++++++++++
>  .../boot/dts/renesas/rzg3e-smarc-som.dtsi     | 114 +++++++++++
>  drivers/clk/renesas/r9a09g047-cpg.c           |  84 +++++++++
>  drivers/clk/renesas/rzv2h-cpg.c               | 178 ++++++++++++++++++
>  drivers/clk/renesas/rzv2h-cpg.h               |  12 ++
>  drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c |  48 +++++
>  drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c  |  26 +++
>  drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h  |  11 ++
>  .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 105 ++++++++++-
>  .../drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h   |   3 +
>  include/linux/clk/renesas.h                   |  20 ++
>  15 files changed, 933 insertions(+), 44 deletions(-)
> 
> -- 
> 2.43.0
> 

