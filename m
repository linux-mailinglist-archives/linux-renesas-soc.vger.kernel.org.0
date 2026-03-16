Return-Path: <linux-renesas-soc+bounces-29449-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IKTwIkBst2laRAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29449-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 03:34:40 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C56229425E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 03:34:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 27C3B30825F2
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 02:28:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D83C330C618;
	Mon, 16 Mar 2026 02:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="ACkMsxCg"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010066.outbound.protection.outlook.com [52.101.228.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68E0B30BBBC;
	Mon, 16 Mar 2026 02:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773628085; cv=fail; b=dOqfdHrdtqrwqQHByTCzSU0sRD41gLbTQufnM/85CtkO1xsS45H0Kh7FhUNOjuRcY1nN0lbD3jcfjh5nSkh8pVZkN79fv3v0xosyBit08bsmNslhIxlW6kFYnx4yUzkpzZr4m/Ju3w+3l86c8GuXZFClh8rJN1j5bWgQ/9QF7Z8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773628085; c=relaxed/simple;
	bh=mFPqklze2e8Bu4/nQnWS9eQsETW8h2zuCrMIEb1tYFY=;
	h=Message-ID:From:To:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=VMRTfIdKgjWHjbDzDGiW1nXG0ATVjUUaytj22o13GSQs+5nYTzeWPmB00dxlswbJDO7qBn2oyyzUMjEiw352TzPU1E4c2FwL6vSth4Z6yBqhen8VhsovB1ST7PXqf0iR+2zOpokkuU/1o0VW8g81ecJfb8xoYY+wwh22C6MKUjU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=ACkMsxCg; arc=fail smtp.client-ip=52.101.228.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yxePdyeuMZ96Y1EKL/b/EFPLmjI9R/Xm9r8SPl+yHV/CQUp1fFBndCIct35yGYyDi+7dnVmNtcfczXwp2Qf+70IyH2AVN+rIXCGQQ/edcuEInvprBNp3zQi7L4SqD/4jP386PY+2BfbSaODk0wQvt6PC01+gZkMFCpSsqV422Zj1f0Pn8zBxaj9rJj4jHHd7fgkpHuRteHEE/ywKGQLjdqd0iIpw/4H5Zm5gRv/8PYVItNbRidlx0EiUT5zkgkWI0ibDUDCqqkE2uFOANxBF1mhqL8x6zWKjWoTifz/94M/+GzlRZV2lJ0UnB9WcAttVwx+ZNWoK4LME/e9HWYKEsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i+mE367Pll+knepszqiwuVZbfvbOHUJg3yFaBGclVNc=;
 b=tiT8X9kBaIaNLZSmY1v2laqVBvJ9FMtKcnK164QO/EPf734cXAqrDv3Hq48iD2km/5TCQaxzD2j3L1tIwIBKmwzi+H2LPPKGaN2+/o7JpsZMLWmTx5H/JOG7s6C5jLoN+fgxXyFiuhg1fgrvHip4lG5taHVzlJsfjrDKOzdiER+LrCpC2LbFTFTORLEKUwwCwBVY5cechVcO4znt1MPmX8yDh6mYI2a6bXy4HAnMiSq2lYjSWeYxnIgyATbWvqpg4FSApe8AN8F/x/HOpqrtyOkgi5IuwP2Xwi5Oi8DOsdNtw+5hrCDY5qiA56e4Yd5E+FycNWy00wE7YmzfH3trrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i+mE367Pll+knepszqiwuVZbfvbOHUJg3yFaBGclVNc=;
 b=ACkMsxCgvaDhIZa6jZ6sfmSO8xcjJ4uxlnQ9p6GTfsYlLkHGRiKZX+7XcZF4dVbRABdslae5bmgf9d9YYiRbX8IzwnYQ6IShpymNrOfgrKx4IISlxp19OcsNEVsdd/cXZS2zYUiLsqy7/HaB6oIE8Y1wl19/bIS5QZbGbNDaySY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com (2603:1096:400:ff::13)
 by OS7PR01MB14729.jpnprd01.prod.outlook.com (2603:1096:604:395::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.21; Mon, 16 Mar
 2026 02:27:36 +0000
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9]) by TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9%7]) with mapi id 15.20.9700.021; Mon, 16 Mar 2026
 02:27:52 +0000
Message-ID: <877brcjyoh.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH v2 28/29] ASoC: xtensa: name back to pcm_new()/pcm_free()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
In-Reply-To: <87bjgoldf9.wl-kuninori.morimoto.gx@renesas.com>
References: <87bjgoldf9.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 16 Mar 2026 02:27:50 +0000
X-ClientProxiedBy: OS7PR01CA0102.jpnprd01.prod.outlook.com
 (2603:1096:604:256::14) To TYYPR01MB7976.jpnprd01.prod.outlook.com
 (2603:1096:400:ff::13)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB7976:EE_|OS7PR01MB14729:EE_
X-MS-Office365-Filtering-Correlation-Id: b0a7578f-a32e-40ab-0f31-08de83039fbb
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|52116014|376014|366016|921020|38350700014|18002099003|56012099003|22082099003|41080700001;
X-Microsoft-Antispam-Message-Info:
	27ap38zxBylhE3LDq6RFy0yp84bro2lHri0H2M9z9ae+zqEI1+Vq46pRmyd3EDs4OUgtiw/DluJmRFOw16TBDdo+wVK4iDx+RhrxdLI84H9xHqbri5Ce/lDNWEn+TeT0mRUiWzmW5O1dw1NVllRVGb1KBBwG/7fp0fgJPYmRawgT3bHueihldqEO9Oy2KZ3kMXXqCxWr8OnzDr6KdA9uOLtJ7801YcFw3JalnBZaOmj/qygx3+dqNgIwS/fuY1/bF/lXd+KVAju2qLZhV/5opuNWaQLqMBvWQ0Z0WQ4nYG4ivo4UpGAAwLKNc5EH1kEjGFMZM2Vc/6vocMggSKxgUyyyyltQW6BD7LGTqHD2+AgVR41oL2HoyiNI3Gmi5f8/Qook7PQL0tLIecLmnO25fDzkPOWkhZ9fTfG6ukWV1fBIj8y0QX6FUliwBCawenTeG/TzjJq6clzkVCWi5OLz04NNqFX+Lp5beiTeuA0UUaZgVpdjjKEqBQn8nTmRfv2XfJcqBipxuI2Px4gBo/YVRS2x61zsxS9AEXikOTBAXZkF+CGlbmV5m+SI7qHYXKW3v+SaDFhlx7QRM2Lk1E13jZ9x2tkM3Rm4jhg4pEhBJx2KrVKZRtmTd9Jc+aKC8OvAoEesO2SKx3vCejpazH0ZubCXlt2YDtMCojmx14i3DJn1qT55gVvPhMYnvmu6S0Znbqn29XfyomM9/m9n+snTWy7COfdWDqKSSu+R6HJbspxaD9mLJ/fKDv53ecFt7GlitLtceGr77EO8N//4qnY1xIgG3JZhHLG1BRL7X9SBUDv7wDqsr8lFbkukh0QIGvvu3ezVLiNc7UQ2neAhl50zuw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB7976.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(52116014)(376014)(366016)(921020)(38350700014)(18002099003)(56012099003)(22082099003)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wbDFtEvzTrvNHItho7CPOcW+DUjALChnJdyIptne1jZK/ZiB9MVnadf/CldO?=
 =?us-ascii?Q?7LOkSeQm6z6KMwg07sMfLv6vP6FJ4znbIVQgrlhCiypbR1uFW5piCViwQw9f?=
 =?us-ascii?Q?ZcscBKE/tbWN61EPCaLRnXbEDH6j10/FE0JBKNmejnCJxdC5Y4PSNLhCUBoe?=
 =?us-ascii?Q?44STJgSULDJQUlv7/wQLPwF+FziSFOs5bEzoSVml/pfkqQE7rQWdccCplMhK?=
 =?us-ascii?Q?qhEzNx/EqOeldUOmNglcEHzrZfTC2lVBzlAckMUjgyUTbcfFW7v+0moGI+NO?=
 =?us-ascii?Q?sg9+siDsaunIOLiXhe8Ikjbo67uO9wd7JH8oU8InHxjxoOuMPsp0y6TuoUFQ?=
 =?us-ascii?Q?4EOBQjnPelNMFTAeukmolD0HYTpYkOJJkXhD2MvhZyOQDRVpz/7sgZO9S894?=
 =?us-ascii?Q?atu5Aw9fCFzQoswMA2QPClDGOsGZICohROv0Aok5M+rQUWtnDfr2Gnqwg6FQ?=
 =?us-ascii?Q?hYf4RtkeC/ynOmi8/LKU/XLvJ+/zjv1w+6obbJon2DLWaPJfmjgJYIYYMVk0?=
 =?us-ascii?Q?BK+tvl4hO4TVDqeW6qNsmm9lRGs/fki1mNxlwOYGj3iDPER2MG5x/MR2T9LI?=
 =?us-ascii?Q?917tWDOQVRTHA0Uqt6Ouy1NV7pTJlOA/2VRU9x9JqH51xTD9tYO8TxhHVj6C?=
 =?us-ascii?Q?RdLoLXAL0isY6HxgGWZjvvs+ibpGOpgaOjQdspe0S2fsVcpkttoDoRXjFSxu?=
 =?us-ascii?Q?rqOx1mP6hPhIvIVEF33poIt7pWYZrteMorSg+tSuug13Pn92rXxDqsRD7ift?=
 =?us-ascii?Q?anSNErwQvmgQpzFyPRT1jtT1Fb5claP1Z5vWGmHSq7XKytAtnqn50TBUeAEm?=
 =?us-ascii?Q?5Ny3+9SZ8fVK//0WeGEVpFuaugdv5YNVB0Qu1v/Z5kAHNStiwPJsrHppT6EL?=
 =?us-ascii?Q?GokXRAQQsBv25JDaN9Ri+DFDug+h6a+qyRXvIsY9pt8AQJy5iNYP15FoiAi9?=
 =?us-ascii?Q?Vyf7MGoaeqK3KJR6FGp8YkK2d4BSXYPsHF3sssR8RB5l5giXYwgo80ZsQgMX?=
 =?us-ascii?Q?Y0y23wg/wsRbQHTikAWZvL60pfI5QnqniN8fF3mFLVdLxLCnZs7BPDNTkAPW?=
 =?us-ascii?Q?tP0XkokQPYExzzs1Dq3RaYmQ9zX8INfiqo5rcMHaKaeS2kOERc7u5+l3zkbN?=
 =?us-ascii?Q?NFAHjOQKilI12t5VRtEqppLa7iwEmfWpEiGaINA9GcLs5snmrl5XyaiC3BSM?=
 =?us-ascii?Q?bbCpUIw0C2mjFfqv4qQhLboShhOzZASweO+WwS+FIvE/EcqHK/aflouSpwrl?=
 =?us-ascii?Q?OTuoT1ya0NiV1ejVJhQiADVP0X/hVwG6eHds5hYETpAaZ9T1s1zyzN9jRJUl?=
 =?us-ascii?Q?2JsFPAIrUo9nNA4y5qEdsNFaecjGUvv7TZ7qpC3gQdfex/qbKmqRoqCf2NYf?=
 =?us-ascii?Q?pEWasBGGVAroy37Poaq10/ZHWv+S1i5I3P6DcIf+IGcmUbCtYV+ig4Zp3goy?=
 =?us-ascii?Q?cx3OPfeWHyjcF6k2AMUoOIj7oX+IhOwqtQgCPe/v7A8R10DJaGcUEdBWtPde?=
 =?us-ascii?Q?V4lQbSF8vSEpAYVFDg4FxHzlvD3tUxW3lEFVF/kFH5Q7dJb8pER0DjuzILTF?=
 =?us-ascii?Q?kwqn0aotAN/Il/bQn2gUqZPDMVkm+qaEgbI13X2ATOudhTIc/o8IazYcXlGE?=
 =?us-ascii?Q?xAZ1JpTQDxEh8dlBYdOM/zVh+T/qacsDRbvLhra973tDFtBVQhFpz3Sfmc5C?=
 =?us-ascii?Q?hlmehTzj3Zz9E+gDiK/KbbQjAV2CneIIm6n3uwZTeKqwmIBv95q/6V4sQbce?=
 =?us-ascii?Q?i0JpsJlWBJTTizC3wEZc+ThKSuIPt6dSL+abAN4h/37dPshdf3cI?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0a7578f-a32e-40ab-0f31-08de83039fbb
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7976.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 02:27:52.2813
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Txgrm7ueBkEqcOQ9WMTZpbUMMX1daryVMm1LwGDYLa7IvpNYG7ih/8k34qYuQQnPz0+VVIkZSyCqSOD9hVmhvS4p8xla3WsoR4b6v4x/xfJy3hTGLYPBltBmyO7jz9PA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB14729
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
	TAGGED_FROM(0.00)[bounces-29449-lists,linux-renesas-soc=lfdr.de];
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
X-Rspamd-Queue-Id: 4C56229425E
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
 sound/soc/xtensa/xtfpga-i2s.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/xtensa/xtfpga-i2s.c b/sound/soc/xtensa/xtfpga-i2s.c
index 678ded059b959..9ad86c54e3ea1 100644
--- a/sound/soc/xtensa/xtfpga-i2s.c
+++ b/sound/soc/xtensa/xtfpga-i2s.c
@@ -481,7 +481,7 @@ static const struct snd_soc_component_driver xtfpga_i2s_component = {
 	.hw_params		= xtfpga_pcm_hw_params,
 	.trigger		= xtfpga_pcm_trigger,
 	.pointer		= xtfpga_pcm_pointer,
-	.pcm_construct		= xtfpga_pcm_new,
+	.pcm_new		= xtfpga_pcm_new,
 	.legacy_dai_naming	= 1,
 };
 
-- 
2.43.0


