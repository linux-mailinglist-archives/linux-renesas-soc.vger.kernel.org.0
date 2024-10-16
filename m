Return-Path: <linux-renesas-soc+bounces-9791-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C6299FD04
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Oct 2024 02:18:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 254351C24BA6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Oct 2024 00:18:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DDFE4A1B;
	Wed, 16 Oct 2024 00:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="IasrGnpu"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010019.outbound.protection.outlook.com [52.101.229.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59D7CA933;
	Wed, 16 Oct 2024 00:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729037895; cv=fail; b=ulqaWKSZYvYe2/5JvuUgyDVbP++Jg+xYVU8Zn1rXmUyFt2o0uoU4ci4dBHPKgUI7Gi+qZitohvO4lduBI9SHLb4Yz0zYo8m21VL2+/Xz1a23hxCNi3VWCHT2pm8+HJe7aBPhjKaW8efI9gneq5TVeBgD45s3YcvNUkOQkwO1d8I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729037895; c=relaxed/simple;
	bh=bc+KPHzh3pl4EHNJSVlAbm2gSq6H4DqshncYnJcq6vQ=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=i5Wr43JzysWabi83tlgHTeAlIHzw3udpKWwFFPAlGJL6xYhbfKHq8MTUeQaKYeEKh35BCOmKQJ4xok4/xI43nlYnCtBBrAZ57ALXfISwVcH2OXsizphTEsCGID9Wp6UDF73qJKhUG3O52OepPGorl5V1QXR9uzDk0uY/nOZnQXM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=IasrGnpu; arc=fail smtp.client-ip=52.101.229.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=diPSpty8iE64HZ3CpH2kY811LVG9YJRBZYnWxk9JKMZDdBQVxvdbY1RpozkAhNBr8+iuQwjAAqtn/PeXVu+FY/48vitU6+wEEKwcA99AMKtdrarzuF0g3YlJlrK1M0wDP3JIVQNNNkJQLeAjjl0A36vxBI3OI5Qq45JuNiHFYuTXLt/lm83Yd1lExV9Vc6O+gvLPYTsN9DZDaPc7VVJwEhSJS5zzb05o7j3UqdY1vgYBR9S7yygo0vAaDBd4t3xqlDQE1hlYEap1aOQWx9WfvGAiwaKQwtLpbrTrFKdQOjhSu5AKg7aWoLUwLEWOxZQ5JQQYo2NzIAl9OhxWvs57gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NTtwFuTHsCQHdhWzuwwVyLOGvDFlMjD5vCBYg300/Rs=;
 b=uoe5DFbXQn7XzDxBH+OE6SnpMcB9ADF3HZ601o/3TwUr5UEdF708ujfB5QYTg1yIIgI5G4/lFgVfGG3TXnTTejWb9ZmOjHbj+lzLf/8+0v0SP1LPZPe/ygXsDE9OQiSDhIevM9sVX3Uat87uIWpjlFil83QnI3uo8KHQ6uvszKHsqTtfr390X0Y5R6VwWKQG6/imTHi0NM/KOGaELv4TrvCQ5JRFRi+2xIpvqNsVVXV7oIe4I4zqxN5ESmlZ/rQLcEHoRW58GYf45iZa8JUvVA7KNY2NzzoBQiyvbKvPrLZvoaCfi637zzictIA0gDCJKhbozvHvERGh4NbC/J/4/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NTtwFuTHsCQHdhWzuwwVyLOGvDFlMjD5vCBYg300/Rs=;
 b=IasrGnpuGpLbe221WttOx4eOodZ0DxYPKsXNlfmxoTJZXHQQ6Mn2R3FjMTNkalMYgICzEd3Gb0xFuWDTZApska8zOsuVOdTEofVH8ru8AG5McosYtjO/Xkf4QinvZm+YUHe+XulutzW1OgauJlofX1FgbVKiQUKIUzeanhjVG+8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB7062.jpnprd01.prod.outlook.com
 (2603:1096:604:121::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.27; Wed, 16 Oct
 2024 00:18:09 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8069.016; Wed, 16 Oct 2024
 00:18:09 +0000
Message-ID: <87iktsew8v.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 0/3] ASoC: Rename "sh" to "renesas"
In-Reply-To: <20241015113757.152548-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20241015113757.152548-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 16 Oct 2024 00:18:09 +0000
X-ClientProxiedBy: TYCP286CA0166.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c6::17) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB7062:EE_
X-MS-Office365-Filtering-Correlation-Id: 47bb7d26-309a-4f7a-41cb-08dced7803bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?kf4iYIxs9uz2F5ltK58fgAG9lruXQ7zOf/7yzmypdo3x58W7ceDUgL72QIEC?=
 =?us-ascii?Q?jc9k0GW6PnaUD/a4xNKRsH2pEiip/Ge9/VPp8GvqyJ0RyzMJ1iM51c5gvXZ9?=
 =?us-ascii?Q?UGgCGkMkPA1VALFnnyeed6+WGsjYpZzahSc/glKvNkIeFfFpuoPuZkCwtXUl?=
 =?us-ascii?Q?FOaJyokIOH49t1c6dkYDeLUi1fvGqJFz3u5MHvE95yh822gM9d3yOBRLWH59?=
 =?us-ascii?Q?/OKjinPU1gQVLNFWNwSonizqOytSuAci9I4mW6Zlsb8VcZCFeLjFUzNDvO80?=
 =?us-ascii?Q?5aLxhTDDyunzL89/xJ/zOf28mjoeVZaiy0EXGjQNOlInPgV4Q2LdKuCu5/NV?=
 =?us-ascii?Q?mXQhN0GfdKF+Q8QPXCRdrZXPs+3NAf19XI+yTxA9c+hOHX827JCYov6i53YM?=
 =?us-ascii?Q?9YK2Yc6miyaViZVv47kKb/v3TbqnGXBKYn808UNsWY3CMBypdjHnZ5drVWPK?=
 =?us-ascii?Q?sUePDob05x3JUIh0DhNJ1K5XGEY9FTH1P3AsUi4vV39N/dhU6QI4PfqRYmkR?=
 =?us-ascii?Q?keXtKRktCsGK22KJ2BKtBTRIDwPad7Z6R53z4cEREnFeqJ/pJXfrJKm67mVs?=
 =?us-ascii?Q?T9XCYZpitZAUGY8+gWrnSRU4E98qx53DQnGR9c4wcQTzCm7M4/yf8Wcb+QKC?=
 =?us-ascii?Q?Wls0SQTDjtnnZ/7DXc1fh87YkFwEFBRbe7vKfLvaS+xtJMqja47MRTjA12gy?=
 =?us-ascii?Q?8MS8v4FYaztrEcvFnoPnx97h8+r13eFD3iNeJ1kIZggNBkcdr+Fte/BLad5C?=
 =?us-ascii?Q?dPzn4J426uMbSu7/1BLREfqr4IhPuaSkiDOY5osnYfadOAiMUxOaktw/yVTZ?=
 =?us-ascii?Q?K62Pk6BDQnJgz8ofEycorF2tl8L0QP3XI9eRXEUi8gQRavTKPRAxrfzb5PJ8?=
 =?us-ascii?Q?UJMeZdSeYJMkJVp+RKrBl00PwLSjrDXV3t4ND0ag7ZUN7okxmzvnmFukgSF8?=
 =?us-ascii?Q?rgBXgEw2oo9ceJgSjyesqY08WOC8vNXojnWPnVtPZ7BajfG5z3mmhYHHW3lh?=
 =?us-ascii?Q?n0Ku2AvAOrBc6d/zK8ba4QSLUoKz7B4h/QbxH3a+AJMPh5WbBIUVlPL8AqcD?=
 =?us-ascii?Q?wgw9DVrLlMomI+gI3LiZ4iWJR0GaHXi1pKsOFFDcqAq9slGkPMo/TYHnHojQ?=
 =?us-ascii?Q?iLhyz/wGU0yavCRUEcoJzFbxWUs50qMtl2yDiNHOSbVCmuEnN2R05MFjgJHM?=
 =?us-ascii?Q?CikyNcDIr1fh7SiNyg34TzqMdkJnqsC5j4wwpPz1S4Oy3jsiFYoMvPPfZOLG?=
 =?us-ascii?Q?VVdQYJCSZv9j4v5ixDLeVYGMB1RGSkvv3QX/7PGGxaK7Af3KB5pBZb82WMZ8?=
 =?us-ascii?Q?43avmudg9LXadrGHPUEpGTd4XglMJFmRSI8jyLdD24v4Xg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sdLwaJ0XolikK/7k+TArLGtcNmk5yl1h4zb75cN6opJosC4ejIJR7Fs1VW0Z?=
 =?us-ascii?Q?Sny7se1OtP49hFHPNtwHMIcJaff1/m/p+N7vi+G8U+WhfoyEpoh3Fr2wXn9V?=
 =?us-ascii?Q?MlhP42+ZRZag4UYMXR1E3SSgzSmKcZw4nAgv5F1kLx2jGaHidPNT6/vHp/bH?=
 =?us-ascii?Q?2jJ+6Lt9vo8dpGh0dAnRSubThXtSQdanqwBY79+Iq0DTaxEad3vVzVM9Vcuo?=
 =?us-ascii?Q?BLHtCApQsre78Hba3pPjEEpsd9AKRSJAUuyBkgA0dNZlb/sr/aYfm+gBLOj/?=
 =?us-ascii?Q?P66o5UVfk4sqjLXSDT8qILLSirP5l4nLorR+oB45lHbpijrABn3jSjDA6d8V?=
 =?us-ascii?Q?GAIQiDuI09DXdLposlKPViHYXEFfA9mJeTJSuDwKaJxRBpiXRfgHamwb6IME?=
 =?us-ascii?Q?8WoxA5+fdxpfeVkSxI6w6rgkPy8J0F57PSERFZRXRwcoB8asDgxxW03YJI5x?=
 =?us-ascii?Q?eUnhvJFujdmfyFcdjjVlsAz3X3HY6zDSl4cTTHHlqTKcWJyyfp5/iR939qhE?=
 =?us-ascii?Q?hbWVSzUs+SjNUl6VY+F9SI/WbRbqOobkYFERcY44Jgqnm0w70oltqTNc3uz5?=
 =?us-ascii?Q?yqO3n2SHPHG8b5Xn6ELi6fLxdrksyR1QnyLaldZ8bUkrGh9yqGikQvbPBg2d?=
 =?us-ascii?Q?lwzWgo6qCrKJp3vCxWZ62FPtYkjOTs3bGBM2GpizyoKuzeUXB+336/n27zSD?=
 =?us-ascii?Q?g3hkGauI95Io0bkADPfTkvoJiVQCpdDSjqLCkK2Ai51incJiNNYjosUvqoRE?=
 =?us-ascii?Q?BPIRZIXPCi4ffvmOI1sprfDvW2QsnvKzFCE/rwvQK5uGgYd8Rc/ZAf1k9aU/?=
 =?us-ascii?Q?gCCeaFdwrpzq/FZ26K0/ypN1WEiQeTikzPVOvAGsjOEM4wyixqnPqiRPTCn5?=
 =?us-ascii?Q?ZPotheYjicps6D6qlMjOUqg+pqfzdvf3aBcp8Ta1zvvm8f+bc9vfouqz7eyn?=
 =?us-ascii?Q?Nlstv8NtTqPkYIGT9o610hjTnu9twUiYw6dIQOBOPBxTZv0LVQynEwXTjzuI?=
 =?us-ascii?Q?H2e9hZ5uEcpo2syNzblr7y0gHQnSsf3ZsvbiZ9dxBwsDYIuDAShh9Qs39egc?=
 =?us-ascii?Q?girKMiI0kJrQDTrpSkucoLYdhuJOX1n5eqQeiYcAhNZEsSAspEfUxVcdBn8q?=
 =?us-ascii?Q?5E8aOJYVNlOEToDv6cxP1fBF9jXIBS1djUfnZ2xYVUlmqCTpexAyAzSnwiM6?=
 =?us-ascii?Q?NxbYri7R0bqnKKZc276wikKCcNxzkz7+39G4kiBvXzi9HX+MUNTQl87wqvwE?=
 =?us-ascii?Q?3j2OiM2CTuS6IqykbcC1T2gfYHw+V4BiQb6r0EwD+urNst0c1i5x7XwhkFiy?=
 =?us-ascii?Q?RLj0hOQsbwJ8ELriP+7IGYaKkGJfmkMKvKxNWupuG9LNA3XqJAmfn94s0edx?=
 =?us-ascii?Q?9oiF58rvFkO5sGQdytUDiQqDQVeTW30vYIPayr0nSF/W1vsY9XrIVR9jYcgd?=
 =?us-ascii?Q?rym7Wie+0dg17Wl11RycXsNCttjBnhpQywwn8pJ+hj8Kx5dYuYN3X2Xusqk7?=
 =?us-ascii?Q?vV8yibuYdHI9y7EzZ20OA2RmEpv6hLc/6SkJaGcCbI8fdXTY6CzGf0+xYK01?=
 =?us-ascii?Q?8hN97mROfwe8HXUEqrPuHaAAc4aMw7DlXZYmcup211hugaufqPK+CQPe4CIS?=
 =?us-ascii?Q?a+PlxR+6/VlGO4c164Y94X8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47bb7d26-309a-4f7a-41cb-08dced7803bc
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2024 00:18:09.5320
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vouwrWi8M5wR9Z2yO2AbnV2nNNeQyPXErUOq9+KpLAxBEB5Kkj6POysDXVPi70u5ZoxPE9AvZny1RhuTc3sYByVqwLgBV9joZdwf9hKdWQGd5Q2HI1A46c2RgHheQypC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB7062


Hi

> This patch series aims to rename "sh" to "renesas", along with this
> the references to this path have been updated.
> 
> Note,
> - This patch series applies on top of [0] + [1]
> - This change was agrreed based on the discussion [2]

For all patches

Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thank you for your help !!

Best regards
---
Kuninori Morimoto

