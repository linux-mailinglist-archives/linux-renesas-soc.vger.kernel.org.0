Return-Path: <linux-renesas-soc+bounces-29445-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ENo3H2Vtt2l+RAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29445-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 03:39:33 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C3C152942D8
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 03:39:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6D27C303A26B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 02:27:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DABB30C618;
	Mon, 16 Mar 2026 02:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="jEE9Tj+w"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011029.outbound.protection.outlook.com [40.107.74.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93BC330C37B;
	Mon, 16 Mar 2026 02:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773628062; cv=fail; b=KTeW9vqtCWA9X1DBQ6JiUcGLsN+G/leBCK5HgBH8e63Eq3qYCKuP4v4LnmoBIfw2nPyn0xVDDKv908wQqkgYoMJVgAJ7h0N8gp5m8IYN6tsRJvRLn9ALRnDmi1COqWAbNGqQ4bOvwfxTvZw0h0ZPICALqtKtULfpU+pZYdqaNvE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773628062; c=relaxed/simple;
	bh=8cd+wItVdJjazVmnrM0v3ZinIqg6GU5X8gUhasZ9Jss=;
	h=Message-ID:From:To:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=kGXzg/i6hq4OFeFgvLRYQOMYI+r/WczR2HfXPjwVNNKlZX541o7FPSZkdOvzVagGeOYKqMgrwYy6L8bwa25BU8EQBHvzmHoiOfO4avRNnn/11d8fGGp3Gjg1d+HoHM0wIjAOXpze3EqJRqAIQ+CG+MGh3YtLRNI1rrotMoT3P7Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=jEE9Tj+w; arc=fail smtp.client-ip=40.107.74.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vZjxZcbClX300eb/pFpK0GIO8LIq/5Py4zjQHctkYAST1i52etKfE0vMfKoM+qiyGUzFkBVAVZ93Me6+F42SrBALo5/B79Eea/tuHGwD55VS9uBx6tqdSeJFrJ0DPurne0N8j7se4SX74SKGATDzmlQfem2NQuZBCx3KtqsnLV3z1fN9VF034AAVvItZrDISYG1xub7hawmfiPKOc5MfxkUXoJDxgUFEARAjm/Y1W2moh7ifbMV4P2NrsOJXxMtp78Yp8TYs/+jx2TU16/kaYCeojkzsj9iX5cRUf05C5iqSksG7cEAS7uZo2hF/35NNlJMr2P6wXOlKWebZVTpXtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8UMy1NdEaIzy5L21p4LpkoTzEJrETcN4W8yrZPm4SR4=;
 b=Mq0rbv5qRNBcWimWCT+OyS6jWd7UIwgDd0aHHD4HXwljTfTpMrD1CmKuvT/SKGAx1CkbJbkEYOIORAIObuMXuamyvJMEgLX1V4tPCg9NwgvI6Lfm+Wh4+pICuLKJU/jjAHlYVgJouHDb3ZNCn8todQZwJzmyuO2NUuTXCUE4rNLlYoSCcM0CJg+7RmgTGDMyqRGOTWVPUavCP3iUE8d7Y49UaVE9vhbuRCz/vWo+IvLk78/MMe+vEntuGXIvPxrY70nmZc/gQf3KJPW5820KY0E12Tkabm7xYGWq6lyIoCfyq3dqJlslmacP5xHCvOeCRGqPLgkWxuea+dcfXRiU0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8UMy1NdEaIzy5L21p4LpkoTzEJrETcN4W8yrZPm4SR4=;
 b=jEE9Tj+wmYNA/Z5iIGrqvPMHCZioR63gbaYrPq2Q4Lzo0DR6+PqMcTlFbVr2anDtxbYAfPeMuFSiqhDRPcKdtHCr545tKPShKdY2Uphb1F2SZBguKPe+f0NUfsteBhlVrpO+7cn6nvyZNQ8gbk2kSpIeed0E39wQvZSGcPz/v9s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com (2603:1096:400:ff::13)
 by OS7PR01MB14729.jpnprd01.prod.outlook.com (2603:1096:604:395::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.21; Mon, 16 Mar
 2026 02:27:12 +0000
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9]) by TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9%7]) with mapi id 15.20.9700.021; Mon, 16 Mar 2026
 02:27:28 +0000
Message-ID: <87cy14jyp4.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: =?ISO-8859-1?Q?=22Martin_Povi=C5=A1er=22?= <povik+lin@cutebit.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Andrei Simion
 <andrei.simion@microchip.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Arnaud Pouliquen
 <arnaud.pouliquen@foss.st.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Bard Liao
 <yung-chuan.liao@linux.intel.com>, Benson Leung <bleung@chromium.org>, Biju
 Das <biju.das.jz@bp.renesas.com>, Cezary Rojewski
 <cezary.rojewski@intel.com>, Cheng-Yi Chiang <cychiang@chromium.org>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Claudiu Beznea
 <claudiu.beznea@tuxon.dev>, Cyril Chao <Cyril.Chao@mediatek.com>, Dan
 Carpenter <dan.carpenter@linaro.org>, Daniel Baluta
 <daniel.baluta@nxp.com>, Daniel Mack <daniel@zonque.org>, Fabio Estevam
 <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Guenter Roeck <groeck@chromium.org>, Haojian
 Zhuang <haojian.zhuang@gmail.com>, Herve Codina <herve.codina@bootlin.com>,
 Jaroslav Kysela <perex@perex.cz>, Jonathan Hunter <jonathanh@nvidia.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Kunihiko Hayashi
 <hayashi.kunihiko@socionext.com>, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, Lars-Peter Clausen
 <lars@metafoo.de>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Michal Simek <michal.simek@amd.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Nicolin Chen
 <nicoleotsuka@gmail.com>, Oder Chiou <oder_chiou@realtek.com>, Olivier
 Moysan <olivier.moysan@foss.st.com>, Orson Zhai <orsonzhai@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.dev>, Ranjani Sridharan
 <ranjani.sridharan@linux.intel.com>, Ray Jui <rjui@broadcom.com>, Robert
 Jarzmik <robert.jarzmik@free.fr>, Sascha Hauer <s.hauer@pengutronix.de>,
 Scott Branden <sbranden@broadcom.com>, Sheetal <sheetal@nvidia.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>, Srinivas Kandagatla
 <srini@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Takashi
 Iwai <tiwai@suse.com>, Thierry Reding <thierry.reding@gmail.com>, Tim Bird
 <tim.bird@sony.com>, Tzung-Bi Shih <tzungbi@kernel.org>, Venkata Prasad
 Potturu <venkataprasad.potturu@amd.com>, Vijendar Mukunda
 <Vijendar.Mukunda@amd.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Xiubo Li <Xiubo.Lee@gmail.com>, chrome-platform@lists.linux.dev,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-sound@vger.kernel.org
Subject: [PATCH v2 24/29] ASoC: stm: name back to pcm_new()/pcm_free()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
In-Reply-To: <87bjgoldf9.wl-kuninori.morimoto.gx@renesas.com>
References: <87bjgoldf9.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 16 Mar 2026 02:27:27 +0000
X-ClientProxiedBy: TYCP286CA0309.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38b::10) To TYYPR01MB7976.jpnprd01.prod.outlook.com
 (2603:1096:400:ff::13)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB7976:EE_|OS7PR01MB14729:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c52c163-6a31-46b5-bbf6-08de83039172
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|52116014|376014|366016|921020|38350700014|18002099003|56012099003|22082099003|41080700001;
X-Microsoft-Antispam-Message-Info:
	l+LiR2z714rKpqLLvMzw3EpSFxFfK45aMr5UhVpbMZMdmp4xWFKk24daswZxsE7SrhxsLZfhPyooR4EVtJkRbt7M4Y2K3QAK0bDIibE0FWpd5uIcjyP01aU7GCiLQT2uHezT7J6UVaB8IJ8H9zg8W5nyJQijkYtRtO784HAsYx0KY2qEABl4/84iqE+FbRuapZS7/PJzEUqXXVM2nFqJy7G0crJLUfadjxpIeBTN65ATl8ZMzr64lnUBvzLjjJ8sq6DUFcWd41GF9C4SqFkj0wwwY0Kq5BaTd8kw9MRgJeBnl6YE4Mzh5ErJygGJAS543m5hML9WpPyCnYctXRl6tqWSLtnAxn22555ecgSzIcXsPjACF6nUdXbuO8SYd6KUwu1RS61xyqcOs5JJBVoeStjqze8yNadQR0LUnyqm0NQafUn053AurusEDpvlWT7y1KxnJHYLNzm/13GzOV8EhnD7AjNAXXEHQcvBInIng7nh160SxECJA3VW0LlacG3n9yCY/yu/2nEIEMpYphzgKAr8YBRJFgmSnLy7SF+1RsoJJ0WFsjG1Fk236mNiMjYdW2oDtXrxwVIx6OoL7IMThtU7WsxiP2KMsGqiHOtegLOHcTq23L1KUYHOZ3MIMNOIbQcs55XzcF4o5V8vSWE2FhP6kAPrSfch1iKW2nZb/zfbKNwM/MhVd0uK95i3EKvAvn4DH4HFf9sKlzL163284AXPKhqHl3GX8sETKw6Vh6yL8qsDQ8+61nAxMlz9qlKjOF/ux+kJ2MgqAhOJHJvgLWkgp/b4BU+Nk5nYrCyHaOV2uIIUzezEq8MD5/G7Vc3cnKumdAZvjo5hz0qKhCpRiA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB7976.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(52116014)(376014)(366016)(921020)(38350700014)(18002099003)(56012099003)(22082099003)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?X7A2RWODG1sb6ifgXa+TSW1KEo+/tkLOsrezmG5j1FBuCJx6pJESsFzesLym?=
 =?us-ascii?Q?XzaqKDKLVTQV0lst8vU5xqgh2CTwfDzMPXH0lmYCpl7gU9AP/MNY1Z5OIDGj?=
 =?us-ascii?Q?Su82V5p24e34O2aypVmnl6L3NZAdU/8k6kiB7buId/BlyOkutGD8PnIui1Va?=
 =?us-ascii?Q?dY9ylFc4BHVmdQ9CYkyO1Q+2H8GSV81cZrvuDt0lVJcqL/S64wtyXKGt1a1E?=
 =?us-ascii?Q?S/ZRi12nQ6Ds/P9hgx1KF/zT9FYpgyc/47UdbhwEjdkCGGjHvT+tXaXL7WYp?=
 =?us-ascii?Q?+DtDnMeYcpvkADxm0iLd5CNDc5Whr8FUalA8RvwlaqatkuQCKBVOU+kKsCqd?=
 =?us-ascii?Q?O/NWIFVzkFKwLrdrka4hg3OdIEDtpSYWcD8aGNV4sOmSeCqximAzEOsulMCE?=
 =?us-ascii?Q?1uiaaaoQgLNd8KcfABpdloVDNt9IPi04whZ6eDd48R/kSnTBcqvPlWrzKF73?=
 =?us-ascii?Q?6MOgaLksYEK39re8x1unlF4mZ9XC7XbOmX562FHpMLCCrfQEQZrFclmBhqM+?=
 =?us-ascii?Q?H/2Gemnawv+jprN6SoehHHUJmUZaWjlC/V6aHg4R6/Yx+H3wzNLNGoaD0TDb?=
 =?us-ascii?Q?KshHKgNBFR+dV6UMsZLD83ZKD5dk1fYmpU/AF8f7j6CPecoC8nzEK5GHxT6w?=
 =?us-ascii?Q?GFzGTew+d7RJCAJFIHahjlblHKi5yjcmcOZIKH2iCG91PAuImPcUs6OurTqi?=
 =?us-ascii?Q?5yyJ73pdohxFvCFB5hTs23LN7D2hlIRXcOYdsLIcpfE5bAvtBpyx2tMmcCGM?=
 =?us-ascii?Q?2s8zV5BF3kOFB109jux+i5vopKitj/mJg+D3HQdD3JAQbcd856yTG2j7kfIa?=
 =?us-ascii?Q?Sva4yBl0MpCPFwwTCzP/qKzwOitCZrqDMD+wAIoXph5mwpA8Y1fP7h98lNSa?=
 =?us-ascii?Q?3S/gcmauC0lp/PE5fiSKjfdQBEJ+MCcOXrMdwFlPT2rtRzjEzMxrELiBxxGb?=
 =?us-ascii?Q?dlF+xMmLnEahOggTavA86wrkWJlZPFw0/vpU/yvAxVwKNkhp7ea0zL4/NRUN?=
 =?us-ascii?Q?GogsypI2WTDx3ZH/G+WYOk8GtDQVsvSzeTUZQUj2qyY0weI+z1GN7WHb03sZ?=
 =?us-ascii?Q?5ooPg/niXag5y8sNMueOG1zMZXafX/AyA0gDJleHF9eklEOAO6a9FyA443c4?=
 =?us-ascii?Q?1F64t/FyJPMmbhRdlKzLc8vLd3ZwcEN3TXypbQykMZB99F3jFWUIOryZHcbZ?=
 =?us-ascii?Q?iBLXCnmtsWqFFPW9ltbwgqNyeajZIsYLD/cKz0QvNLzvT/DVnhMN4lrx1KjU?=
 =?us-ascii?Q?PW1GTMCYygHAYv9TpbRacufnAIYNRc9+nU3ePjhspZ9PPpNzbfXUE7O9hST1?=
 =?us-ascii?Q?F7hAONqJRmSfrAQKrD3l7yY//tpYoNrUSO+4N9ZdjEVI8qNH1VmhW41HEOTP?=
 =?us-ascii?Q?LwJcfaKpDPS1Lmd3k2GA5GiAtnrkfvsu9tYvnU7WH6TPqymjFrjJ9tb9Yohz?=
 =?us-ascii?Q?9NAt0cqyWLmwm56PfTGSxTYjTgOH15uVx9u4Rd4RZoHfeMTFD4fhB0sRa3sI?=
 =?us-ascii?Q?FPT1SyNtgA4O1jbzGFbq8XLim7/9l3GskCbv7ZIpKWZ5I/KQRFsq9gtGGr7W?=
 =?us-ascii?Q?AMcbaOH3/z1urFQKT8Thsj/WdAucG8Opsoi7pCkYT5hFCKiDqeHRh7JN/Dqz?=
 =?us-ascii?Q?8mIbyRqWglH4+30QZrD99FtpmtWri4rYaKvggCWnDjveWudRlEFuqvpPnjKF?=
 =?us-ascii?Q?3DpbWmOTaGKUUQ//X7EekxRc9xxF01gw2Uuq3j82mSkRRscumtEoxSlxDIPr?=
 =?us-ascii?Q?zWjJ3rxw7rJjZiHMQOp0/X3lY3cYqQy3/WAHYy3fEto5JuZKkcFz?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c52c163-6a31-46b5-bbf6-08de83039172
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7976.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 02:27:28.3171
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IeBtMDDTdMAbCONZCqlAbUmsPnHJwhJtX4NKClg7IlTYkZf48fnCYmjCqILCLjpHFnOyVqg090KgJvg1aiMxC7jKGYxlwbMownzuRKv2xpk4HJpasDtzuea2uHoXQcji
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB14729
X-Spamd-Result: default: False [2.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[cutebit.org,bootlin.com,foss.st.com,microchip.com,collabora.com,linux.alibaba.com,linux.intel.com,chromium.org,bp.renesas.com,intel.com,gmail.com,tuxon.dev,mediatek.com,linaro.org,nxp.com,zonque.org,glider.be,perex.cz,nvidia.com,socionext.com,metafoo.de,kernel.org,amd.com,realtek.com,linux.dev,broadcom.com,free.fr,pengutronix.de,samsung.com,suse.com,sony.com,arm.com,lists.linux.dev,lists.infradead.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29445-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuninori.morimoto.gx@renesas.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[renesas.com:+];
	RCPT_COUNT_GT_50(0.00)[67];
	TAGGED_RCPT(0.00)[linux-renesas-soc,lin,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,renesas.com:dkim,renesas.com:email,renesas.com:mid]
X-Rspamd-Queue-Id: C3C152942D8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

We have been used pcm_new()/pcm_free(), but switched to
pcm_construct()/pcm_destruct() to use extra parameters [1].

pcm_new()/free() had been removed [2], but each drivers are still
using such function naming. Let's name back to pcm_new()/pcm_free()
again.

[1] commit c64bfc906600 ("ASoC: soc-core: add new pcm_construct/pcmdestruct")
[2] commit e9067bb50278 ("ASoC: soc-component: remove snd_pcm_ops from component driver")

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/stm/stm32_adfsdm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/stm/stm32_adfsdm.c b/sound/soc/stm/stm32_adfsdm.c
index 1797a91fea7ae..0f6d32814c222 100644
--- a/sound/soc/stm/stm32_adfsdm.c
+++ b/sound/soc/stm/stm32_adfsdm.c
@@ -315,7 +315,7 @@ static const struct snd_soc_component_driver stm32_adfsdm_soc_platform = {
 	.hw_params	= stm32_adfsdm_pcm_hw_params,
 	.trigger	= stm32_adfsdm_trigger,
 	.pointer	= stm32_adfsdm_pcm_pointer,
-	.pcm_construct	= stm32_adfsdm_pcm_new,
+	.pcm_new	= stm32_adfsdm_pcm_new,
 };
 
 static const struct of_device_id stm32_adfsdm_of_match[] = {
-- 
2.43.0


