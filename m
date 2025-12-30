Return-Path: <linux-renesas-soc+bounces-26201-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC7DCEA1A0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Dec 2025 16:48:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CEEB7300EA1C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Dec 2025 15:48:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 932FB1C1F02;
	Tue, 30 Dec 2025 15:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="S0E+jJQI"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010053.outbound.protection.outlook.com [52.101.69.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 757E02A1BA;
	Tue, 30 Dec 2025 15:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767109689; cv=fail; b=B1G55dTYHxtV759WhJZoa5KDLeo822zhEgGHxaSFnKON5QL0HoPAX5FDb6SpAFuCj2rNCrPrBdPgXpSfDFqnhiDnq5SLLc90vcGENjO7dZeq2qJAkX3wqRqqKnwh0QsDL25sx2eJT7IEJkXkF18fGXLDozsGiShDYzZ3+bVuQRk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767109689; c=relaxed/simple;
	bh=Yh3X/qHCeqbspw+YoyRWZecZj12CMpHBYBIRbQUAw3Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=FEZU9JWVUUEpwDftlNFNwVf1ybG+CYb36+Fj9z5IjzXbgV5qvMTOtJhsfLfDWVW/HdGLim4mtFUYHFcVzTFcJO4Tz3A5VeU/oOjXEKrfaFnUrjc5vyLagilyjN8hB7bH36dwdaXYOjwRga2YVjNENJgmdn7lOMLUB0zKa5zVy7I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=S0E+jJQI; arc=fail smtp.client-ip=52.101.69.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SYZ5LmjC2Uyb3pcUJQn29huwj9EJ5yJ+fNxWuhsCB7rS88E87UDoLqrqF7T9P5fx5YCSbJVpTRzCA8RnDLblL21QO32Mr3X7hvyR6D2ivn66KfaF8JobRZQZ8Ex7x35zKInF01AEoXHuzLTX4LgDsMjGHXxTN9ta/t97SniSXURheFi9ivwI0hi8QmMr5D1mdC/ZLygz85uU4Ho7mpfsZniKGcgD1XTGbttThTF0KGjfZQ/nv5pMCx3yD1O0ilytzEYp7QjKaefBjVV5p4X88a2gLw5rl+76zq7uvk0waX3G4lg9ZH5BM49zX8aqTwTX+VcUXsNp0o4LTWwmrbxdmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ah6HpvfblbDT1wARrMumJejxt18ym7vWrWaGKGI/bao=;
 b=aAATngHV6bSuD5nm3UzTasgdvIrtPazBb0PqlZ5slfESCKC8Byhv6sCRHewRoH2uM//zEt+DkzJ7ZK7CJtQ8ecOtimleofff+1HetAkrOgHkF97rZ2bzK+77J5ym6WfNjmAvstdwEbFfrya+cuwTt/IDoTT162UWfWcf/o32SEUccl0B3d/M8PIyyeMCMd/JDmB0Y42Ziz/tBbQzyVQPMe2Aiv0okPfozBwUeDQ9tNWTNMnlUG6u/oOLFM5cqAS1pHttf+L/+waUZKMpDw2l2brH5scH434PTLG1XVZ5cB0ZFfE25ZuHF61g4qxnQFGuk+z5r4Zz7DrAXNL5h1AzZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ah6HpvfblbDT1wARrMumJejxt18ym7vWrWaGKGI/bao=;
 b=S0E+jJQIN+j9nhT5p7Om55B4gthyC9evEKqZClizChdM4Gv1e9FEhUsayxzq66BqlxzvqnJme20tek14jE+D9UMT6iLkqhz2m7S7YsCEnOsiSH77OWqqPaIz7+crUnhFpe4dNwtK0lxNWAowzf3NghV03enozTJU0AYDdT3+jOjOq9sehyg08BFJEwiWQtZTTkEQENhIpXQP34bjwyGIGym/QG0w9mb/HH5RtNY+68wDmQ9ord34ACglgsgAGF/Dqoi8dNW1N2plxCbZdyAnXTisBFAH9iNCAKID1JVwOx8oJK/zj3LMRUQl4WIZ3c6QYPrRMd6NMsAoQO+v2PmPrw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by OSKPR04MB11318.eurprd04.prod.outlook.com (2603:10a6:e10:97::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Tue, 30 Dec
 2025 15:48:03 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9456.013; Tue, 30 Dec 2025
 15:48:03 +0000
Date: Tue, 30 Dec 2025 10:47:57 -0500
From: Frank Li <Frank.li@nxp.com>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] i3c: renesas: Factor out hardware initialization
 to separate function
Message-ID: <aVP0LV3K07ciFR+e@lizhi-Precision-Tower-5810>
References: <cover.1767090535.git.tommaso.merciai.xr@bp.renesas.com>
 <c93219af1fcfc461a1b072df0289c291a37c45bb.1767090535.git.tommaso.merciai.xr@bp.renesas.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c93219af1fcfc461a1b072df0289c291a37c45bb.1767090535.git.tommaso.merciai.xr@bp.renesas.com>
X-ClientProxiedBy: PH8PR05CA0008.namprd05.prod.outlook.com
 (2603:10b6:510:2cc::19) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|OSKPR04MB11318:EE_
X-MS-Office365-Filtering-Correlation-Id: 025bbaa2-3d5c-40e1-28d1-08de47bad16a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|52116014|376014|366016|1800799024|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?KPkCxwcxLeRghqj2N6zJdAr6Pw9zxEEzdKJkaSJmcv0ZT4It95vYDV30K4m6?=
 =?us-ascii?Q?oZk4XiSCcvg9sW7W1JSkPsTSaQlRGEg348HlLvorm1/pWHNXecJghRd4dfDW?=
 =?us-ascii?Q?IDrbcNbNSqS/gFfPPzcX+6cxlSknxfTlgcjTtQKC1hv6X7z4kcnEMVkwE5mm?=
 =?us-ascii?Q?toPA2ve3HCSy+5eQU1oMl4dY8EYP7hBqJIKDt/KiCFpHH6hBZvqFU1JvcPuk?=
 =?us-ascii?Q?0maUKmZ3Vl5LgURhASddK63zRPSwGoCnV/X+jrEzk1kgStUGbkfhbARbWsQn?=
 =?us-ascii?Q?nPVvH5/NygvXuagtWwt1xmXGnqseCIC4oF0+UfaN3UvZ4gnrYtxl5OJP8acg?=
 =?us-ascii?Q?ApMx5nK39EKZOcceUtD4iSv2Rv/+VMRuRu4n1iAC7RiewXTpFemA+ctFIcaZ?=
 =?us-ascii?Q?mi2uL8dHSBFZ5GU0tQwgEFi6Xr4O2TnhSdRYP+YuYGFR0KzspKub7VWKW1o9?=
 =?us-ascii?Q?DEr+jOlp6qJjP54rYbsypPBqYqda9d3jgBgRiIIF90/VTaRBz9ZsXgNnUdzO?=
 =?us-ascii?Q?mAXcZL5KyJbmJ/sL0/cT0Br5NQTnqp9n+AZXNsybGux/TQqb9cma6rizccXV?=
 =?us-ascii?Q?8gPp7ngUg44j/oUyKRbAftLR1gao1xbroQ4hP8F4unTC/N/kibcGJbfUfWG4?=
 =?us-ascii?Q?pCZ4ynAqMsKXXPNJqV0lZJsXHzTqQig35adFbBCAwEolV5S5uPsYkKZ+c5Ue?=
 =?us-ascii?Q?s1baeug1V+5lC4prN5nTWh9PibNsVeJyk0/pRb+WxfGrbe6eVPJp0pqFLpWR?=
 =?us-ascii?Q?2xGo+mrNkVLFwU9++y975QO9s9+7/N5ymWFWzHm8r4liIedGrm4xI3br+Bvn?=
 =?us-ascii?Q?k8VO0UMErMNwrHF9DP57fd0SYgj3WJ30UdsobqfDbHAIBQXh1BPP+bj7K32W?=
 =?us-ascii?Q?xTVhXDAZDm/fj1oG81yG0PUgDiflLyJmO9lFcVVDW+VAVs3W0q0el0v4fD5g?=
 =?us-ascii?Q?rBC/RsnNBnUgO2tvIA2kgCsL6dSyjLMJicr3EsOryPvunPlr8E/xhgRwKdn/?=
 =?us-ascii?Q?UAa0QCjar1ZpxySQytM9ErfRjAjeLsBrwDqo+5Hn0QFdL0E2ihL1iOIblZDo?=
 =?us-ascii?Q?ASZ5nYCE87lj5FzOuoeYzGlsI6cKjjZCOSt/4GHpejTXt1IFIY49KfvWFRhD?=
 =?us-ascii?Q?LkpgHim5ZLetYWVg9gS0/gd1p9a0BaVwTbcdnBqC4+AuQIwoxD8Dhlc28KhL?=
 =?us-ascii?Q?QrrIOgLzMJ+ISS9rBFHXvirCXtbfSCMJxNmKrxoXG2D3dQ+OyXQmNt6Bhei/?=
 =?us-ascii?Q?eCbYgNSqzjtMCkO22jZrTej0uC/AV9JzICJgsuggwm57vYX5PC3S4gajG4Qg?=
 =?us-ascii?Q?i6N7HKMPLBMLiy3PLsEUzF7oyTHx8v5gQh/WWKW31vr851YUujXkmCzkYDnq?=
 =?us-ascii?Q?82Dw6kh92QtOQ575/YHiJawx6fHn4KisYFAAXo9d3s+8S9rWu7tytG1PwTXN?=
 =?us-ascii?Q?Pq/OK1P05b/jef6HFOGVCkLF620CAaEbCU/xIv/656NyV5POVChZJunAJfO3?=
 =?us-ascii?Q?KFuQN46qSvbSXvzQakmGsAiDRTQlo/8UhejR?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(52116014)(376014)(366016)(1800799024)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0ncx1G9HLqwmNsJ0S9PfXmtwdVf/wqXuMwAk5blU18Fk0Idml/blXnfUWFtR?=
 =?us-ascii?Q?uOyb2gKcnMEHSExu6LGCs6xBEKozqEgCOR+7SEYLqY8NG88s0DOjY3unoGMc?=
 =?us-ascii?Q?3ivGnwAF8UANmSdKLMAW+NsTL88655SmEKeUN+xyyZq96rYUkvvZu4Ap+idz?=
 =?us-ascii?Q?JBBGo6KPRAMmEnPzRUlsSYTNrVh6mSyqlN86l0q01cvCc3S2QbfIIApE6PFc?=
 =?us-ascii?Q?UjARjAOGE9NOHuFbjbA1i13o2Thl3pJXTThrRQ40kKrCqjC+c7suRKktOUi6?=
 =?us-ascii?Q?u+/BIk7DzlLFFJOPZWkgrCvvvM9KotvZ4IzbF7WxRgkDhgQ5o0xTpDqw29ry?=
 =?us-ascii?Q?GflbZQ6uBQIzfy4KBa79XAal1VfdTqRlwMyKI2BbGE5UWTMH+SRVl1GARQeK?=
 =?us-ascii?Q?92H993YAFTuD+qNZKfb9TGZkKFokKlPsop9+Rkakk1Jal+ozy2HdOJUF8FA1?=
 =?us-ascii?Q?HyP32q72Zq19oQziemybzXRIRfFpj7o81IFQiAFAEoYSNzBRMxoPG1GfBzd2?=
 =?us-ascii?Q?8Ej0/chTn6EgoJ02DFw2VQlC144SgU0yFzV1l8jA/hnu04NS+WoXhbDsLLvI?=
 =?us-ascii?Q?D/Y2srRW0J+3DevMpeWOINyPC1iliIH9tqUdyPgJbWDRZHtsqly7gTxLJavm?=
 =?us-ascii?Q?mahF6Du9P8/EH7sZVcsJu+xlmEvpIk1dI4EkOB/hYALxicAWwYS/kAIGy2zw?=
 =?us-ascii?Q?MouTBCysQZTEbNLmDGk8TQBfOfdaUORNHbKT5aV3smBMGOVgKSJC3+sCrdkw?=
 =?us-ascii?Q?oI3Es7KwsI+5v8NWl8IM9QOAkV1VU/5c0BOeq5BGVt3t+aCngS9Ky4D7KRvI?=
 =?us-ascii?Q?QGTornleaHIDOKgK+E9k+J0kW+R27lKKlt13UU1iVndjRskb7DgKKn8x+0Qx?=
 =?us-ascii?Q?DlJD+QmDbTu2I/TImNfAIbTnogf5yR0OxqUcRYaP4NjYNO6/xj2LBWivLPJk?=
 =?us-ascii?Q?FAPJFykZtXGx3GIm6y3eIHqquxIGDoRguBaQIC0KeB9SrI+03j8ng5AtP4Bh?=
 =?us-ascii?Q?Eg0ZdTSvzVXkdFJtm+6de0Gz2FKinAUJ7xbTHFInU0KRw3lo1Pwv9ftty2PO?=
 =?us-ascii?Q?LVWaf5HCIl9yBLA8VKNhuvJcYnEzjf76AIf198lZbB+J1vnKbsaQzWnl4sBW?=
 =?us-ascii?Q?G8bklpAS1MK89nnq20TgzrFTAUGf4WhPyYZwNDb1qsJ2MYJvy4WF1WT0SiEU?=
 =?us-ascii?Q?dEvv5AJ4soBsgDLkijdryXQWPw5ukJYpVelYUoPTh84cnAHzBnEVfCS71SR9?=
 =?us-ascii?Q?VLVw7Hq8IK5ngSInFiWF3SW1W15Y+iSbpB8dEdkI5FOWivp+Zo1ONU8+DTTY?=
 =?us-ascii?Q?i5/K8dPiLBO4ne3xc39ynpfBAadLrHZ0ZMDQr51WdKFcFq3cAzhZ0qBcwS06?=
 =?us-ascii?Q?xz24NJhbSROJLzvcH3bAm8b2WCd5TS6cpssa9QqCqUhdHhsRSrJT8M2r9wgu?=
 =?us-ascii?Q?PD26M5c4Rn8CN7CkZMMpY9/TtG0YvWwOQ31F9zdhHjvAiKydWptn+UuOxzeW?=
 =?us-ascii?Q?ALVjpNuztl7pa3zpD3iQkUhKlgjfOVeU632h2UeNV54fLVUjpcIV+PBZ9qnG?=
 =?us-ascii?Q?BRI4K2hCDCFEgleQiV5TyAYZ2JsGwcZ2a7z0iEyKLybYdepYqSo2botopELn?=
 =?us-ascii?Q?rRUSyxPx54TVKyb6EdUcS16YE7aW4UrMW7S+kSyTN4R7Zy5Tn3u7DKv6L6oN?=
 =?us-ascii?Q?A5AFqxKUHbPAuqdLfikXa9PhSlZ25n4xMSBUyVvOeDNZ2e9kSVoe+Mjk8qS2?=
 =?us-ascii?Q?GivT8Ihuyg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 025bbaa2-3d5c-40e1-28d1-08de47bad16a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2025 15:48:03.7157
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o2mgzaHqphzHZDxzLnklfum5otFghCagTJgXE9lcip0x11oxQzn7vY4Ha0hrYm2zo19w4neeQdrlRys0dyUZ/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSKPR04MB11318

On Tue, Dec 30, 2025 at 11:39:38AM +0100, Tommaso Merciai wrote:
> Move the hardware initialization sequence in renesas_i3c_bus_init()
> into a dedicated renesas_i3c_hw_init() helper.
>
> This simplifies the code, and prepares the driver for upcoming
> suspend/resume support.

Nit: Simplify the code and prepare the driver for ...

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
> No functional change intended.
>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> ---
> v1->v2:
>  - New patch.
>
>  drivers/i3c/master/renesas-i3c.c | 99 ++++++++++++++++++--------------
>  1 file changed, 55 insertions(+), 44 deletions(-)
>
> diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
> index 2736363c9074..4f076c372b36 100644
> --- a/drivers/i3c/master/renesas-i3c.c
> +++ b/drivers/i3c/master/renesas-i3c.c
> @@ -485,13 +485,65 @@ static int renesas_i3c_reset(struct renesas_i3c *i3c)
>  				 0, 1000, false, i3c->regs, RSTCTL);
>  }
>
> +static void renesas_i3c_hw_init(struct renesas_i3c *i3c)
> +{
> +	u32 val;
> +
> +	/* Disable Slave Mode */
> +	renesas_writel(i3c->regs, SVCTL, 0);
> +
> +	/* Initialize Queue/Buffer threshold */
> +	renesas_writel(i3c->regs, NQTHCTL, NQTHCTL_IBIDSSZ(6) |
> +		       NQTHCTL_CMDQTH(1));
> +
> +	/* The only supported configuration is two entries*/
> +	renesas_writel(i3c->regs, NTBTHCTL0, 0);
> +	/* Interrupt when there is one entry in the queue */
> +	renesas_writel(i3c->regs, NRQTHCTL, 0);
> +
> +	/* Enable all Bus/Transfer Status Flags */
> +	renesas_writel(i3c->regs, BSTE, BSTE_ALL_FLAG);
> +	renesas_writel(i3c->regs, NTSTE, NTSTE_ALL_FLAG);
> +
> +	/* Interrupt enable settings */
> +	renesas_writel(i3c->regs, BIE, BIE_NACKDIE | BIE_TENDIE);
> +	renesas_writel(i3c->regs, NTIE, 0);
> +
> +	/* Clear Status register */
> +	renesas_writel(i3c->regs, NTST, 0);
> +	renesas_writel(i3c->regs, INST, 0);
> +	renesas_writel(i3c->regs, BST, 0);
> +
> +	/* Hot-Join Acknowlege setting. */
> +	renesas_set_bit(i3c->regs, BCTL, BCTL_HJACKCTL);
> +
> +	renesas_writel(i3c->regs, IBINCTL, IBINCTL_NRHJCTL | IBINCTL_NRMRCTL |
> +		       IBINCTL_NRSIRCTL);
> +
> +	renesas_writel(i3c->regs, SCSTLCTL, 0);
> +	renesas_set_bit(i3c->regs, SCSTRCTL, SCSTRCTL_ACKTWE);
> +
> +	/* Bus condition timing */
> +	val = DIV_ROUND_UP(I3C_BUS_TBUF_MIXED_FM_MIN_NS,
> +			   NSEC_PER_SEC / i3c->rate);
> +	renesas_writel(i3c->regs, BFRECDT, BFRECDT_FRECYC(val));
> +
> +	val = DIV_ROUND_UP(I3C_BUS_TAVAL_MIN_NS,
> +			   NSEC_PER_SEC / i3c->rate);
> +	renesas_writel(i3c->regs, BAVLCDT, BAVLCDT_AVLCYC(val));
> +
> +	val = DIV_ROUND_UP(I3C_BUS_TIDLE_MIN_NS,
> +			   NSEC_PER_SEC / i3c->rate);
> +	renesas_writel(i3c->regs, BIDLCDT, BIDLCDT_IDLCYC(val));
> +}
> +
>  static int renesas_i3c_bus_init(struct i3c_master_controller *m)
>  {
>  	struct renesas_i3c *i3c = to_renesas_i3c(m);
>  	struct i3c_bus *bus = i3c_master_get_bus(m);
>  	struct i3c_device_info info = {};
>  	struct i2c_timings t;
> -	u32 double_SBR, val;
> +	u32 double_SBR;
>  	int cks, pp_high_ticks, pp_low_ticks, i3c_total_ticks;
>  	int od_high_ticks, od_low_ticks, i2c_total_ticks;
>  	int ret;
> @@ -564,49 +616,8 @@ static int renesas_i3c_bus_init(struct i3c_master_controller *m)
>
>  	renesas_writel(i3c->regs, REFCKCTL, REFCKCTL_IREFCKS(cks));
>
> -	/* Disable Slave Mode */
> -	renesas_writel(i3c->regs, SVCTL, 0);
> -
> -	/* Initialize Queue/Buffer threshold */
> -	renesas_writel(i3c->regs, NQTHCTL, NQTHCTL_IBIDSSZ(6) |
> -					     NQTHCTL_CMDQTH(1));
> -
> -	/* The only supported configuration is two entries*/
> -	renesas_writel(i3c->regs, NTBTHCTL0, 0);
> -	/* Interrupt when there is one entry in the queue */
> -	renesas_writel(i3c->regs, NRQTHCTL, 0);
> -
> -	/* Enable all Bus/Transfer Status Flags */
> -	renesas_writel(i3c->regs, BSTE, BSTE_ALL_FLAG);
> -	renesas_writel(i3c->regs, NTSTE, NTSTE_ALL_FLAG);
> -
> -	/* Interrupt enable settings */
> -	renesas_writel(i3c->regs, BIE, BIE_NACKDIE | BIE_TENDIE);
> -	renesas_writel(i3c->regs, NTIE, 0);
> -
> -	/* Clear Status register */
> -	renesas_writel(i3c->regs, NTST, 0);
> -	renesas_writel(i3c->regs, INST, 0);
> -	renesas_writel(i3c->regs, BST, 0);
> -
> -	/* Hot-Join Acknowlege setting. */
> -	renesas_set_bit(i3c->regs, BCTL, BCTL_HJACKCTL);
> -
> -	renesas_writel(i3c->regs, IBINCTL, IBINCTL_NRHJCTL | IBINCTL_NRMRCTL |
> -					     IBINCTL_NRSIRCTL);
> -
> -	renesas_writel(i3c->regs, SCSTLCTL, 0);
> -	renesas_set_bit(i3c->regs, SCSTRCTL, SCSTRCTL_ACKTWE);
> -
> -	/* Bus condition timing */
> -	val = DIV_ROUND_UP(I3C_BUS_TBUF_MIXED_FM_MIN_NS, NSEC_PER_SEC / i3c->rate);
> -	renesas_writel(i3c->regs, BFRECDT, BFRECDT_FRECYC(val));
> -
> -	val = DIV_ROUND_UP(I3C_BUS_TAVAL_MIN_NS, NSEC_PER_SEC / i3c->rate);
> -	renesas_writel(i3c->regs, BAVLCDT, BAVLCDT_AVLCYC(val));
> -
> -	val = DIV_ROUND_UP(I3C_BUS_TIDLE_MIN_NS, NSEC_PER_SEC / i3c->rate);
> -	renesas_writel(i3c->regs, BIDLCDT, BIDLCDT_IDLCYC(val));
> +	/* I3C hw init*/
> +	renesas_i3c_hw_init(i3c);
>
>  	ret = i3c_master_get_free_addr(m, 0);
>  	if (ret < 0)
> --
> 2.43.0
>

