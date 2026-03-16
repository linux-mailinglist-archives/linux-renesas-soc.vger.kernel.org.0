Return-Path: <linux-renesas-soc+bounces-29446-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GF+YGKdqt2nXQwEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29446-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 03:27:51 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D9D03294042
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 03:27:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 92DE5300E396
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 02:27:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19F1430C61B;
	Mon, 16 Mar 2026 02:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="dqBR69Ka"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010028.outbound.protection.outlook.com [52.101.229.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8334F30BBBC;
	Mon, 16 Mar 2026 02:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773628069; cv=fail; b=Ntm5jqNTtEaDRMA3xjYhWGjTiu/VAvqXysbijAX9hX96GAjujVghf2IZv66RmgJ9gpGxRSdcD2x/flKDYDk18PrWamwyeyoM2fpXyDVro24/Kd6tAuqZE6CneEIfKH7nNI4VRTy81FAz1wmVvLrfaz3n23XakavUfE/IIW9SHT4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773628069; c=relaxed/simple;
	bh=9YSD5T7RdN04CSyyb5SudpRvZZL8Wu7E9zNk24CaHXw=;
	h=Message-ID:From:To:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=p//wybZPrkSkO2MdKyUqaF0cmj1kQUBQYX5G3kiDYpYER3+pGu8i4VZr3/my4w6DgQn0IPOMecvosQM4W8dujIey7O0aAhTuthQS1gTC7EdcSLM5SrgOJZOreIiNQ7m2t89Q/vxmF83YeJlbqUA7UaKLhduOwLSrz8MbatiUHjA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=dqBR69Ka; arc=fail smtp.client-ip=52.101.229.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eOo9uvH/xnHu5JJc7xFsEKbjVUOqgV8tQnE1RGSRfmTLUzWXynGx5ejrShdrDXL8wHHhX36OijnPZBC5noFtj9/eYElbDClHDnEZ7VxMGILHVUbYYaSUlm9FPHmsOj3jDWokIrRM6d0peE3DajKZNogP49sW93mWPnYcTQ4g5XwHmVznPwhmls/762gNy1N3dpOIY4Yoyz9loESPqXDK/sfAuX7EAg8NPmb9n0b2EDuZx4Md2/NvNp6DQUOkt/F3zX67N73UVXj5iPbzQBYRoyKC4ksfdEwqLUStiwHeHeyGemeVxu48y0DyuE1ccpGi5oFzbyg8T1eVOpHWB9zSGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h7alxssNUv7LV1xuk4OORJnzrLV2GYrPmEa0WYb04+8=;
 b=tevNaa54jrZCSRZOfvEJ7hkCgM439DN+vt96im9O3Jc9NJ6yP/6Q5Zf44YeTrI1Xsns24wFFKdiEqQnHQFY3X5hq1+wjDElGJ+Ub5Ylw5AQN36XMpHtG3PGgqQ/gyI59x/m/yXpqmP8s3Ml275Q6fRrne+f74JooT7DJTlPvxoQ08IwnS7HFkgb8dt5JOMPP68Ay20jxp+abFjtW8o8JGjfwRQpFAAx+5zUPgZjWDIR8XCd5wS+ALZFzDpNI4ZtOx2PuK1DmtDeC3v3X2AiXv/jCPwjEmKxC5Mx5HUoKR67eCI1OAGPJrw2dKa6vI6oFPgd0AyF4whw1bBc+RF+Oqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h7alxssNUv7LV1xuk4OORJnzrLV2GYrPmEa0WYb04+8=;
 b=dqBR69KaH3BG4YC7au3xmMASfipJ9SF5NGCwDA87Y2zz+RCfJN5c98VxDAhJ5XkbrEl3xLISHZ0Cfq9z5udAosiwf7boYxM8u482eMuneK03+DZf3TIFMCa97GpmU4vqREnVRmLW2sq0qs0ti93ufqAgXWrpF7+YzXDhqRpMAqU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com (2603:1096:400:ff::13)
 by OS7PR01MB14729.jpnprd01.prod.outlook.com (2603:1096:604:395::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.21; Mon, 16 Mar
 2026 02:27:18 +0000
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9]) by TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9%7]) with mapi id 15.20.9700.021; Mon, 16 Mar 2026
 02:27:34 +0000
Message-ID: <87bjgojyoy.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH v2 25/29] ASoC: tegra: name back to pcm_new()/pcm_free()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
In-Reply-To: <87bjgoldf9.wl-kuninori.morimoto.gx@renesas.com>
References: <87bjgoldf9.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 16 Mar 2026 02:27:33 +0000
X-ClientProxiedBy: TYWPR01CA0023.jpnprd01.prod.outlook.com
 (2603:1096:400:aa::10) To TYYPR01MB7976.jpnprd01.prod.outlook.com
 (2603:1096:400:ff::13)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB7976:EE_|OS7PR01MB14729:EE_
X-MS-Office365-Filtering-Correlation-Id: 32e7a75f-e66d-45f3-797f-08de830394e2
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|52116014|376014|366016|921020|38350700014|18002099003|56012099003|22082099003|41080700001;
X-Microsoft-Antispam-Message-Info:
	C9rALy0PzgGSaZ1hkI6nbIYmgGSnwQPtw++/4zsjVz2LGsEdgBQ9t8ugzfrTQ6FZeHpNoXp1LLd56KgLZalN0T2Q6gzzxTg9YjvBy48+47ZWSSHRW3mEAb8vODdRUSUGkm+XjJgTSrgtjdAjuh4bUujm0ix5257E5vJjuvGODudJVh44OoZcCooxzlZTBKHSgVm6iMuXCYiaT8ua74uKq85ry6CeSrnymQzlyo/Pj5fLt3wnNwotFZJEaQ922VfpuqhZfXaEftNf+tGvz2dCBzcZ+HOq/Zspc+vj3bx4NWEd2iy5Yf08hGu3t+k4dtIsbf5c8YQuNfS/iBLUqBf+qJ++4Pbwkmxr3h3porlX9hg6t1J6H6WODSb6TVfcKEOJSC9Y5wERHRtz9rs7l5WeIq0RKVrgcQzbXOb1A4Du9zdWwIyT4y4l+yjo+tnVW69VKPyw4FMxI/XfS5MTk0/XSD3sYPSPNeDQISnSIhO4F3ZxNJ8DYKgGN8SPrar+lqI3f/SHFnbiJxCSZ/m6M8PA5PY4t4/bJ6kIU+NOsEVAV0yepPL2tCdag+muazwWBRWMwO72DQu/iqIUpLKZ9dq5eLr+EecQzejlflzE4XYKSjBiVqUJhcfbDbFx+dvusq0GjPU5bzpiU6fqV7mUZP/HTNUTkFJ11zt71Pnl2U/mml4VFzVFeIroxFidjf7ANB1BpxcIam3yh9bD4W3HHFPKpnBe7/nuIZ6VLzjv7pY9wxrT2wGcQ2bjSJd11JgsHfUXJ0YYCCCuYvNGpyvzzuIXCabHm8sUd7z768FJy6nUQPwbaaKzZZNLntQZ9n6F1SNFj2epCQqVYQt08+27DInG8A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB7976.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(52116014)(376014)(366016)(921020)(38350700014)(18002099003)(56012099003)(22082099003)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?omBpWnnl6CYbcgCBCDL4MbmrVswUmHU3gjpr+5A+Nzr3qFNDCxcgITU3EJik?=
 =?us-ascii?Q?FOrLNDCc4Os25PJl48kl9KGPmUvX4oaQKOqTf41MXxiDox4FnYcCMGzr1D3w?=
 =?us-ascii?Q?APKr3wndzcCyoCRTZtmYoG0q+LscEaxaeJH2BV4eM0qAtF6Zosyc5be3rn+q?=
 =?us-ascii?Q?ql47lK4th52PdyoX+Mq0e1ahFCkniQqhN0slyfRj7tM+zdAJsZTdaoXXfFQB?=
 =?us-ascii?Q?DSXFo76QG20dUEhmD6sUq/ZW0kbMoxdouf9/BTiA8OlOjQ5vEbJbDdcTyhIG?=
 =?us-ascii?Q?heroOwdj3VslTWXum7sB4b3YKzZSZLG7Act28PF9WufEM5h1Yi+M1EHCcV4T?=
 =?us-ascii?Q?QUxkf8P4Me2ZlmKczz64AC5lhTq0CZrCjatorly3ZwGxXbL86+1j5MzYfj9n?=
 =?us-ascii?Q?WrCeENjewKzRlTdKeSNYjcgYFiObulmZ1MvRPQx5R0cJR6OX/re5S8VeCuga?=
 =?us-ascii?Q?/KRZlD02N9sFveQVXpnErl4M8X0sedd5I0sIgG0jNx/FU6wyEQ2AIYoldhCH?=
 =?us-ascii?Q?+L2GmK8geVqgqaCnWi7i3ZkEtGyqwRpuqOoYdPWwbS0FbLkfbJ+U6wLIYGjB?=
 =?us-ascii?Q?wOoFLWaKjn2vLsAv1ukndbLdeKRNyik0fKdC9di7Rqgw43nqQmHRSQ3Ua1rM?=
 =?us-ascii?Q?z548y/teZHkd9iV4zElaGWP6CBl4gCYfUaeJRavmekRbhvpnDH+cl1paFrhv?=
 =?us-ascii?Q?xb/hdeuo8edgohOvLd3MrQyuKIzbNTATZUDNtfNkZ+CcdRjSsrEUGWIOP37C?=
 =?us-ascii?Q?YItqCnuKpnYrEx+Ob4zcKtPqJsFgIj4ZWorNv5o3le21w/Q9P0Oyo69O/foY?=
 =?us-ascii?Q?EfPIu61+KL4oYmFw0rOrHo+TCehfbQd9anMylNfeNp9sfOKsnL2z48l0qc/R?=
 =?us-ascii?Q?gcs+r/c3rhN3ujWAxsIzwzOn0YY0efWXrMjcyvppSWQ6p9teWJOq/b/rv2I9?=
 =?us-ascii?Q?ErnXG+tw598UBAw52yeBa9xYdl7K6RYtX/c6MQBLtE0vr75TEcQ3K6PEQXJL?=
 =?us-ascii?Q?lwDtZQoairDROqAB+ai3BS/wXFAk5DzpWHryoQIWIV9v59PlDQ5HOvqKDh9O?=
 =?us-ascii?Q?SPR/RW5bbrlsnnk0VA7chu2ui8+xEdHeRqtDKSS1hJItUW5gpaxAB9hU8xbK?=
 =?us-ascii?Q?x6VVTe5zwmGL2t2f3hutbqVXRNBtJ1MAQ3YlmYhYJNTek0Mf9sWKtuPcse/H?=
 =?us-ascii?Q?Cg+5Zhfl8J/oyj6gg4g9G4qDtkiPCLl10DZHRHbOgjqKqucp+keEowzTPAlx?=
 =?us-ascii?Q?DnJsTFBC+zb8KfFwpwQ7rxs94IwwH7dUohn1l5NOAZO+SuTuJsAH6GS/6wlk?=
 =?us-ascii?Q?a5Y1bIxj9Jv75H2khVtsmXVLwzwI5DTnzwFhbX3q5hGXWc8HvZ7+NxEdJTBJ?=
 =?us-ascii?Q?zgEwq++CT6Tn7jxoYfj9AFzgF1r7MslmG6HaAxlEGhKaG0gRzdjnSdqoPN99?=
 =?us-ascii?Q?1TAkRqnT85tjwdBDCqn5zsMUrqnEp2/jG6Wogoro1wHkJj7r44RZFl5dYpHh?=
 =?us-ascii?Q?HLCxU4bGkoPKRs/f4Wm14uGzzKkwuqybHUy1+F0cvgrrTKWKB5xVyNs2P7hf?=
 =?us-ascii?Q?A8z7W9M6vjz6HSxBW/g2t5lSvXEcq25Fji6j2lnPz+M7yDb3+p9jnL/EjPYo?=
 =?us-ascii?Q?fIwtFWLokwpbJKDTdUcJTF3SvJq9oOy04uPSGTH1RlsOcw0DtnKF3zIX0zTj?=
 =?us-ascii?Q?bO8qAvo4BBkSpqPdYDDJC2+Yo6A1exJ1wOYxPZkheooMeSFW+8DnGFnCVXDY?=
 =?us-ascii?Q?gICn2BSwgLPmDQ67pxn6nAGSZkq6AsuSUDFlOMLDzJqjNH1ykC36?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32e7a75f-e66d-45f3-797f-08de830394e2
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7976.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 02:27:34.0985
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1yjMKNm73u8FfK5WxpMb+SPc4SDRVrqwFZTousFQvOH9agNHfTuA3dA9LyM7LnTNS5ECTpoX5omlecJDJdmh1KK+P8Ub3gNNAO6ZmIMJo47dJm0gska2PLmlbeHp3sZ9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB14729
X-Spamd-Result: default: False [2.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[cutebit.org,bootlin.com,foss.st.com,microchip.com,collabora.com,linux.alibaba.com,linux.intel.com,chromium.org,bp.renesas.com,intel.com,gmail.com,tuxon.dev,mediatek.com,linaro.org,nxp.com,zonque.org,glider.be,perex.cz,nvidia.com,socionext.com,metafoo.de,kernel.org,amd.com,realtek.com,linux.dev,broadcom.com,free.fr,pengutronix.de,samsung.com,suse.com,sony.com,arm.com,lists.linux.dev,lists.infradead.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29446-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:dkim,renesas.com:email,renesas.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nvidia.com:email]
X-Rspamd-Queue-Id: D9D03294042
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
 sound/soc/tegra/tegra210_admaif.c | 6 +++---
 sound/soc/tegra/tegra_pcm.c       | 6 +++---
 sound/soc/tegra/tegra_pcm.h       | 4 ++--
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/sound/soc/tegra/tegra210_admaif.c b/sound/soc/tegra/tegra210_admaif.c
index 0976779d29f28..ecb0955266628 100644
--- a/sound/soc/tegra/tegra210_admaif.c
+++ b/sound/soc/tegra/tegra210_admaif.c
@@ -839,7 +839,7 @@ static struct snd_kcontrol_new tegra264_admaif_controls[] = {
 static const struct snd_soc_component_driver tegra210_admaif_cmpnt = {
 	.controls		= tegra210_admaif_controls,
 	.num_controls		= ARRAY_SIZE(tegra210_admaif_controls),
-	.pcm_construct		= tegra_pcm_construct,
+	.pcm_new		= tegra_pcm_new,
 	.open			= tegra_pcm_open,
 	.close			= tegra_pcm_close,
 	.hw_params		= tegra_pcm_hw_params,
@@ -849,7 +849,7 @@ static const struct snd_soc_component_driver tegra210_admaif_cmpnt = {
 static const struct snd_soc_component_driver tegra186_admaif_cmpnt = {
 	.controls		= tegra186_admaif_controls,
 	.num_controls		= ARRAY_SIZE(tegra186_admaif_controls),
-	.pcm_construct		= tegra_pcm_construct,
+	.pcm_new		= tegra_pcm_new,
 	.open			= tegra_pcm_open,
 	.close			= tegra_pcm_close,
 	.hw_params		= tegra_pcm_hw_params,
@@ -859,7 +859,7 @@ static const struct snd_soc_component_driver tegra186_admaif_cmpnt = {
 static const struct snd_soc_component_driver tegra264_admaif_cmpnt = {
 	.controls		= tegra264_admaif_controls,
 	.num_controls		= ARRAY_SIZE(tegra264_admaif_controls),
-	.pcm_construct		= tegra_pcm_construct,
+	.pcm_new		= tegra_pcm_new,
 	.open			= tegra_pcm_open,
 	.close			= tegra_pcm_close,
 	.hw_params		= tegra_pcm_hw_params,
diff --git a/sound/soc/tegra/tegra_pcm.c b/sound/soc/tegra/tegra_pcm.c
index 05d59e03b1c5e..c490a9e668586 100644
--- a/sound/soc/tegra/tegra_pcm.c
+++ b/sound/soc/tegra/tegra_pcm.c
@@ -204,8 +204,8 @@ static int tegra_pcm_dma_allocate(struct device *dev, struct snd_soc_pcm_runtime
 	return snd_pcm_set_fixed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV_WC, dev, size);
 }
 
-int tegra_pcm_construct(struct snd_soc_component *component,
-			struct snd_soc_pcm_runtime *rtd)
+int tegra_pcm_new(struct snd_soc_component *component,
+		  struct snd_soc_pcm_runtime *rtd)
 {
 	struct device *dev = component->dev;
 
@@ -218,7 +218,7 @@ int tegra_pcm_construct(struct snd_soc_component *component,
 
 	return tegra_pcm_dma_allocate(dev, rtd, tegra_pcm_hardware.buffer_bytes_max);
 }
-EXPORT_SYMBOL_GPL(tegra_pcm_construct);
+EXPORT_SYMBOL_GPL(tegra_pcm_new);
 
 MODULE_AUTHOR("Stephen Warren <swarren@nvidia.com>");
 MODULE_DESCRIPTION("Tegra PCM ASoC driver");
diff --git a/sound/soc/tegra/tegra_pcm.h b/sound/soc/tegra/tegra_pcm.h
index 2a36eea1740dd..ad69ca9233da0 100644
--- a/sound/soc/tegra/tegra_pcm.h
+++ b/sound/soc/tegra/tegra_pcm.h
@@ -20,8 +20,8 @@
 #include <sound/dmaengine_pcm.h>
 #include <sound/asound.h>
 
-int tegra_pcm_construct(struct snd_soc_component *component,
-			struct snd_soc_pcm_runtime *rtd);
+int tegra_pcm_new(struct snd_soc_component *component,
+		  struct snd_soc_pcm_runtime *rtd);
 int tegra_pcm_open(struct snd_soc_component *component,
 		   struct snd_pcm_substream *substream);
 int tegra_pcm_close(struct snd_soc_component *component,
-- 
2.43.0


