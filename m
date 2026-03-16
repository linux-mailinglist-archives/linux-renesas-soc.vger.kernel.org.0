Return-Path: <linux-renesas-soc+bounces-29437-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UIoGCxlst2kYRAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29437-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 03:34:01 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9809F2941FD
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 03:34:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D40E13025E50
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 02:26:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D926730BBB9;
	Mon, 16 Mar 2026 02:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="N0i6clby"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010022.outbound.protection.outlook.com [52.101.228.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5895630AAA6;
	Mon, 16 Mar 2026 02:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773628014; cv=fail; b=gcgfggm/Iowx2yC4zDyPh7zPBKLlkm0SYl6f4P4rQpJ/aP6UFRMHUEMoNJGRGC/qON/nOeUd0Z0hlS8PEVsBkaAxKx2/bVg6yII/yaxx3qJDRJ0bm8kcSFJ3kHbwqYxsp3JdtIrvMW9I276BArpMTK5j2MZqMl/UhqONrhF8Bn8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773628014; c=relaxed/simple;
	bh=Butrcqfum4l1Yb6bbi3BMApt4/F8Uu44q9E1WTiQeak=;
	h=Message-ID:From:To:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=DHveBAcMQH+4ofWHXe0+W5lD/h2VBvsntgRIwFul0YR/MeVHz+7Udj/6xuQKEZQOj8Idxji1dUwrJwOmQli8nqjfJvHOEuC2h1ZNSi9umS++sCjN/iJMly88Kpz5+QEfxUZkVbgmFtuDTdgE3qQwQz5iIqgF9LxjQ/UPMgWouCc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=N0i6clby; arc=fail smtp.client-ip=52.101.228.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mnIhBnuVmAwXLPeNiv/UfohUw4XJ9nUyb8DdQZr9+4iq7yNIaN1wPi9c3wq4I1MX3gHyf44KymdPjTbzanRF1Mzv0O5oXF76LVWPYJ8fzP1LRSkOsmzsXmYRboLAqvvXiTrBWc3S3FAgMPJUdrfzb9ctf/vsalAsh9Sk+DExx7pJTrpIBI7pZVvmJP9iwQyLV39BlLlkIkV3w0Free4xcJU/MJwf9hiDHZxL8Ie/ixGrsJOz8iy+dEXSCZ9uw4VVKojZqxIDu8imoteouqUSasujap5V08HrC1H9fgxvTnNr47fdRUwQ2DAP/8QAXDg1h450D7zblB9JVp0noKP4Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7F/0QnT/NEykdho3cKDuED4yoVvO7cYBjysONFvAEtc=;
 b=JfrF/GZ3kG6GReCCOGDY8sXtHvE2mrOOYngg2oLct8Sbqqyqzvm8pQb9jUbUuUUO2B2bPSX7s9r5EOEYM69sLHo7TDrOetmvZ4UV+hgOXkRBay8yc/QfgYro+g9W9BivbYbISd3LFOX1YyFQ1+ATQbS47RfnGwW/LvgRM/D1KcaDdOmxT0NHguDqsLksQ2WhbyaPzKaZ+BP8+m5CL/YugqU9uD2Af0XP4ALUEXVmD6n6W+w4JxuxUXlueBe+FarLv8ObGojhxMb2mcKsuEya7xITNFtk282YNX9cjtzcOIA0KbtTkFwTW8HtnE7Edn/VHQVR0hNI9pXbPInJg3o6Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7F/0QnT/NEykdho3cKDuED4yoVvO7cYBjysONFvAEtc=;
 b=N0i6clbyKw8XhYp2WiEFXtYgdpLkmt1WD4zLHGOZmfDi2wx14WtB4eYUndMDC+9WB+ycronV4maTXf4JxVAfR/oMYSkDsA1zM5VK2Cp9bYGvsIHTahwrueorcQgPcLv8KNMnuTr9KRhNbfQeAcmNJ649fsH6voFoVhdQ44hONnM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com (2603:1096:400:ff::13)
 by OS9PR01MB13205.jpnprd01.prod.outlook.com (2603:1096:604:30f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Mon, 16 Mar
 2026 02:26:32 +0000
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9]) by TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9%7]) with mapi id 15.20.9700.021; Mon, 16 Mar 2026
 02:26:42 +0000
Message-ID: <87o6kojyqf.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH v2 16/29] ASoC: mediatek: name back to pcm_new()/pcm_free()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
In-Reply-To: <87bjgoldf9.wl-kuninori.morimoto.gx@renesas.com>
References: <87bjgoldf9.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 16 Mar 2026 02:26:40 +0000
X-ClientProxiedBy: OS3PR01CA0071.jpnprd01.prod.outlook.com
 (2603:1096:604:de::22) To TYYPR01MB7976.jpnprd01.prod.outlook.com
 (2603:1096:400:ff::13)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB7976:EE_|OS9PR01MB13205:EE_
X-MS-Office365-Filtering-Correlation-Id: 447967d9-a9dd-4d22-29fd-08de8303763e
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|52116014|38350700014|921020|56012099003|22082099003|18002099003|41080700001;
X-Microsoft-Antispam-Message-Info:
	eW6sAxkZN1UZNvgc3g9BRHwjK5T3D1WNlyalcHmYRo0B167p/FbHvkXdDRfFPIEdwRwoOJiOehl3qduGDYWYwa0Pgo8KgSpfDJzi/7odgFT17w7oHYwsY4m/HZ2hi8N7/AtC5GV74guEC1OBhLGLazuaS5IDjR5NyDb4gyy/R7HCCHcLaF3sTIhyHAvrfwSR9LTT9iPp3BrpZUwhe6qxLGzy6FSFO6e2uipFbi+1J7zhmQRKc4b6lFVssuQOmzUouSm/BuPAzOfJiYt9htrHcXYxn2moZxI2oCej1CdbmhfcQ++amHL0o2VpPwc2jbAkd8QTEuSmSeW7gHoIoTgMpk17SbG5aCQtopAhvJ1u7Z9J2LyM9QE5idOFDjV0tDp+X5a07wtLVpvavIIuwmaHg9zv+uheqTbA1ezmunVDi2P+GQDN/ViE4q/AzemuYGR6DP0gosNL6AUwxgtXVQl9cPbNJRQOjA0ohaWUF34jdqW1rHgTTlwRTjfVRAIS5sdzwCzcOO1XXSV0pQRCSL0YJuN+7+IS8GQv1bVQiCbn7rTznKaSdgD4+CD34lpMdFo/3vDo41FsqUUfuHsOVv7dAtqwRXM/HWPuntm2hNeC1lgozqjUzfZ60F2i5DmGp92iidPqg9/SbHyCf53AcNqJqCEq4MMxJbPzcS4euuGWVOC9XpngF9YqydraIujbxsM2HrMYx8qOduZhoyHqvFXq6IeivPvu/YNw23/AHUNBZzmcEv9ssIyjOkz8OWwgVnNZpMbpQuCJLzSpnSjTlaDbSerMx3sfXbP6GPYvlKn0MU/HFRXMze7yNEcnO9qGrtp2layPeolR06dnFRys1VwLGQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB7976.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(52116014)(38350700014)(921020)(56012099003)(22082099003)(18002099003)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GG4HsgcY+S+OdVf5mrAm/mvvLvBuXny2hS7QVnxI0YgYTakDeNC7scDgxxDx?=
 =?us-ascii?Q?JYj8HlX3q5960juPdeA7ehlUxA/amspF9i9Urv0MSKz/a6VLh9W0UOTS31f2?=
 =?us-ascii?Q?B07BTklg8haXINtPui4aYH0hO1GUz5CoJM73bMdGNH1U0nx82EfikwhSBC1q?=
 =?us-ascii?Q?dngZOzRkCs9FaeuWQ75FEq5XyXY5TD0lwc26LhKuxbnVoqDHFXgxsrB7AdH/?=
 =?us-ascii?Q?tnE7KOVZdxzTAgM94GsBzjU8p6g+1nPd8OGJLq5BO4UsPqddVgUWPg+NAfJE?=
 =?us-ascii?Q?c772nZTfDlC58HM/RQKF7lAi2gTsalV2v9XmQ2HEiUiS/7rT1/EbgSHw6TqC?=
 =?us-ascii?Q?BENNmrUiMIG+0muTQLZoZ/5/UH00hFm3YUbw/h3pjbGSLqm8MUvZFoJ1isJ4?=
 =?us-ascii?Q?ubOZm6j7OaaIuwffAHFiQHfuV53L9bRho62c6pUzl1ImYBN3+WhBmaYwyYYR?=
 =?us-ascii?Q?msYZ4l9lQtVTkjCwW0b6XSiF0NUlFsRJhkAj2qvGXN6cFsFqOWzgQr1wlfPm?=
 =?us-ascii?Q?VLVPFVtCK+7tR/POJ9ULj9zOz8xJRXHZ8KbQ9wzZbcccWcjGDXAktKh76KqE?=
 =?us-ascii?Q?0Nb3cHB4Pi9TGSNgPvPKLsXmi28m8uQfih6IS9oH5t7CiRlF2K/vnVETz6Z2?=
 =?us-ascii?Q?mjQG0tQ5YjcZULnG+yznl4xci0mAjeeclFdwqLQsySz2YpCsyWky+lMCEiLr?=
 =?us-ascii?Q?72THAc/mPJ0yH8G/D20l9crOwpVEZZe5i6ueJwK5xErXGIQmNu+f66TIfydH?=
 =?us-ascii?Q?ZPpD4IlD6+3F/rb5sYq6bRrvIGQQEEpuVLJTirw1JMG6gevmKf0ducXm9SDk?=
 =?us-ascii?Q?QSCn2I4elNpS7eyWNTPhRJgjZ1C6yaByLTZCgqni2BOZSZHEmQ0EGBrKMjA2?=
 =?us-ascii?Q?V1Xa0Bra5aM/sangAM5VpUnFuUOkemyq+LGkgbdPbYYFqOxZi4RrV8ga0bi5?=
 =?us-ascii?Q?c2eZM0IhUfEwLjb3SWXLGIWU1Mw8AGVNdEIbUmixi13c5PYQKdkIA+ikE9dU?=
 =?us-ascii?Q?GHyl8MCtz6LPf5wx86+IWMz8Zr2BtM7QkOFeUnLjltmv0QFaKeaapu104puC?=
 =?us-ascii?Q?TFUwtARVDkWEC3JHfbnUOuem7hbUGzlz6BTg5JqktKnmfM8zgvZBa9dLRhH7?=
 =?us-ascii?Q?DHRtIHrnjuE/huUIFZESjDG/BHOUm5w+O/nyLEYWK3GeILXHtv6Z2JnaLe6+?=
 =?us-ascii?Q?hyaScLYg8JoFaxRIZ6m4sENOiYSoc2D7L7mlYn04NDGatUOPJEdbbr7esjTn?=
 =?us-ascii?Q?5dpxcUAAb0JO65cI4/z4TSW5cysl9bvbU8V9GGw5qxVDt79gWBJCR9fX/3Ha?=
 =?us-ascii?Q?ooPoIFiAGhATj7z854+paO7l4DHa7U1NReOAZAkNUikLjgXotXxW9rxoMuXR?=
 =?us-ascii?Q?uqFCCa3pvhiLOyxcyDdI+RgtMPyVV+2eGk29szOhYAeJG596vM9mPBnmwTD4?=
 =?us-ascii?Q?ym7FFi8E3Fes92fPb6+QDfSN905X1Z+Quezeh3w1XmMb1GmEsBNwRk8pH3YS?=
 =?us-ascii?Q?+NRvCoxs9iutcr03pHNkd1RdQKB3I7JnJbZ1vrDNXU2wCHgs5YiiHCeDBWYr?=
 =?us-ascii?Q?tyoPmGct+C9YX33OJJTq6jbxrkDXo28ST+QijrDdm8P1Mg5e5fP+jLQ/ALji?=
 =?us-ascii?Q?qbx85WVjBj+TwxSrHSn5osTbpWmy9zr7SYGX4rCmOmWdrf/VUyvM7la4DvXZ?=
 =?us-ascii?Q?2giYsQMfIFJpjzOR9dtG2g2bAyC9TOexbulEoiCsCC7iQgj4u9dqjMWL6pMg?=
 =?us-ascii?Q?gDlLFuIOkj1yDmDZR/Ky77ORzj/T9fsNma7sWevtvYORbZ/F976y?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 447967d9-a9dd-4d22-29fd-08de8303763e
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7976.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 02:26:42.6996
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L4/Wk71/3aimA1WPaZYiwEl7peFMdkbYSnjKAgD/MLUq7yWePPFhOO00C7xtDqf0HpWH7gwYn/ycwW+hMnVpVnYbcm9Hv9JkDNVhxVz0wklBnN4f806ePx32SoCmOdhX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB13205
X-Spamd-Result: default: False [2.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[cutebit.org,bootlin.com,foss.st.com,microchip.com,collabora.com,linux.alibaba.com,linux.intel.com,chromium.org,bp.renesas.com,intel.com,gmail.com,tuxon.dev,mediatek.com,linaro.org,nxp.com,zonque.org,glider.be,perex.cz,nvidia.com,socionext.com,metafoo.de,kernel.org,amd.com,realtek.com,linux.dev,broadcom.com,free.fr,pengutronix.de,samsung.com,suse.com,sony.com,arm.com,lists.linux.dev,lists.infradead.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29437-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:dkim,renesas.com:email,renesas.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9809F2941FD
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
 sound/soc/mediatek/common/mtk-afe-platform-driver.c | 2 +-
 sound/soc/mediatek/mt8186/mt8186-afe-pcm.c          | 2 +-
 sound/soc/mediatek/mt8189/mt8189-afe-pcm.c          | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/mediatek/common/mtk-afe-platform-driver.c b/sound/soc/mediatek/common/mtk-afe-platform-driver.c
index 938dd3d46b003..f2b39fc9ec81e 100644
--- a/sound/soc/mediatek/common/mtk-afe-platform-driver.c
+++ b/sound/soc/mediatek/common/mtk-afe-platform-driver.c
@@ -149,7 +149,7 @@ static int mtk_afe_component_probe(struct snd_soc_component *component)
 const struct snd_soc_component_driver mtk_afe_pcm_platform = {
 	.name		= AFE_PCM_NAME,
 	.pointer	= mtk_afe_pcm_pointer,
-	.pcm_construct	= mtk_afe_pcm_new,
+	.pcm_new	= mtk_afe_pcm_new,
 	.probe		= mtk_afe_component_probe,
 };
 EXPORT_SYMBOL_GPL(mtk_afe_pcm_platform);
diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c b/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
index 085e993c650d8..44a521c3a6104 100644
--- a/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
@@ -2773,7 +2773,7 @@ static int mt8186_afe_component_probe(struct snd_soc_component *component)
 
 static const struct snd_soc_component_driver mt8186_afe_component = {
 	.name = AFE_PCM_NAME,
-	.pcm_construct = mtk_afe_pcm_new,
+	.pcm_new = mtk_afe_pcm_new,
 	.pointer = mtk_afe_pcm_pointer,
 	.probe = mt8186_afe_component_probe,
 };
diff --git a/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c b/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
index 166ece74270ec..24b0c78815f61 100644
--- a/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
+++ b/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
@@ -2378,8 +2378,8 @@ static void mt8189_afe_pcm_free(struct snd_soc_component *component,
 static const struct snd_soc_component_driver mt8189_afe_component = {
 	.name = AFE_PCM_NAME,
 	.probe = mt8189_afe_component_probe,
-	.pcm_construct = mtk_afe_pcm_new,
-	.pcm_destruct = mt8189_afe_pcm_free,
+	.pcm_new = mtk_afe_pcm_new,
+	.pcm_free = mt8189_afe_pcm_free,
 	.open = mt8189_afe_pcm_open,
 	.pointer = mtk_afe_pcm_pointer,
 };
-- 
2.43.0


