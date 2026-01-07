Return-Path: <linux-renesas-soc+bounces-26344-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AECE3CFD3A9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 07 Jan 2026 11:41:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C57D3309AD93
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  7 Jan 2026 10:34:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 666722FE591;
	Wed,  7 Jan 2026 10:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="XOY4um9x"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010061.outbound.protection.outlook.com [52.101.229.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65EC62FD69E;
	Wed,  7 Jan 2026 10:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767782083; cv=fail; b=AYAa7U27PQsq+27ZhoLoY5kMF+dC5Z44LtRdPPRjkNMwadUUvG/SoW8qh0XkFKTgvggxye64+rX/s1G0/QrtvzJDxbKW2O6xk6TNS8AFxbmllPcqDT6M10qW7rJlhDh/l0549n5B8QHJhsqY9EcmL97FHf3T3eq3k52kK0JN6GU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767782083; c=relaxed/simple;
	bh=EYPcNT/ds4Soa2emIkR3h1cseBot8o2yyvMBm95AN3I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Wn9Y+JFbOGlW1imtyycwER6+mUidvKkYtF7Z2LZcppIDB8SuLoqwkKNGcrwEyuRUgZNoYTDDzOVtx+UnIrhOB188cuwnCHW8J9qtKnjq2a3YI5pqeUiC1SmlHr3o+w+OCWIpQFrCvc2+2niMw4ddU0l9czbrXa7IY6y0jA9ZYkw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=XOY4um9x; arc=fail smtp.client-ip=52.101.229.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qpWCUiSHYww3U9MRmlaGlPC8GLxJlfzBSViefWu7W9CmqRGis+vpLdUjfP849Hu5yO6FQ82bhS9tXwXRysy7oYsNGm7tunJ5+I0knHoFWKkelCXZwJUzAp3Sge02rR/hV192isZzBAq9FLmdXm0tsKsx+c3KYbAjxZG9pYainazEzsYgkLb8Jc74JleGZ3ttrbUNaFGqODD5s+Mgt9NfdSEeVWTGaMFszZXwWtvFqDScssxsrsKEVvrsrRrV/p/GaxOdW2/uplBKhB9av4IwwOTUV9yp/ZfuBLc6ObuzwWcgzEQFsjbLCqxUcXbkesynhi/m3+XjmDYIVcHqCGkvyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r4NC7DHlsElt5QFnm5Wt4UCDZH0KCaMIm2Q+1Q4s3bM=;
 b=PAux6qOGie5N1XoMUoV0KyxI4bACc5uqnrHRJE+5ruHWEMOjmrtescT3kSm7H3gQhzRIFWG1GjNSBrVzenc5Et+H5oHXFyLSQKUFeVHV90sGOrXeUOAHcd0mH2i2L3KoEHH5uVQGnlPOYYqrjdM52bBUY4Zr2KhoJquKfnhkDgGeyXGAs9B1ID9XdYrYIkRrpPNXW/vOOjcdqLq+0MqAqd2BDn6Fmk9G4WQ58SHDxnRmpVV4idNFTkuTZM8Pvvmt6PDkfB0+KfxW6YXSba3GVzBxifgRvpYa9XVNOtkzafTD0D/Rqhb31xfHGT8jbe/GrG4CnZmOvXKbfCFgAWQx/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r4NC7DHlsElt5QFnm5Wt4UCDZH0KCaMIm2Q+1Q4s3bM=;
 b=XOY4um9xV2R9mR+59kVBpHh4UGWULjcBDFG+LAN8WQxHDFvukJeJgO4dRU7NIkHJy6rXgjUnfGSr7ElgIwsGwlPR+m0d3Db2jKiaD+nD/KA8p4mXeEdCTMM/xXicD9gy9uGuL3cYKI184u/ALje77tCJLjsVCiV2kswYxtRZj5U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYRPR01MB13558.jpnprd01.prod.outlook.com (2603:1096:405:18c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.1; Wed, 7 Jan
 2026 10:34:30 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9499.002; Wed, 7 Jan 2026
 10:34:30 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 2/4] i3c: renesas: Store clock rate and reset controls in struct renesas_i3c
Date: Wed,  7 Jan 2026 11:33:48 +0100
Message-ID: <9e1da95dd9137590c752ecd9429925afcbeb918b.1767781092.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1767781092.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1767781092.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0368.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f8::15) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TYRPR01MB13558:EE_
X-MS-Office365-Filtering-Correlation-Id: 1693f2f8-e350-44af-5a8f-08de4dd856ba
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Pj1vVtuOfYG9E0CeFIb8bw1CWOxUF9YU51mhHbX3FuRnZ/3rxKCc8LLbWDP5?=
 =?us-ascii?Q?USFQuFHCwNBhGYpIaiJI1TssHv9SNDD1dxUDWp7XqTqy0cvh4JSzyVO0Sk5x?=
 =?us-ascii?Q?27tnaMKaOMk3i6ZsmNROm16vEdGBTj4z5F1Na2trfa4YScWzRACUMc0GrBhT?=
 =?us-ascii?Q?taeQh4nOMJNZd4VeC6LXeMqRly28S/XSkBJyv+zhck+G+JNNUntJK3M2D6uw?=
 =?us-ascii?Q?wiogaaEq5Flo72UhVdo+V0lkybJ6HzkFp51q1v/fZoTgxYRWKe/cbgP7jre0?=
 =?us-ascii?Q?5jnYsPQvigHsC/rcBLcGKy2gXOLDxLY59q2ZHr+Bis+3iURONOCTbUQA6knG?=
 =?us-ascii?Q?XE9uq7SBgE9jHWNcu7MqkhUhjbw4hCmTnsIA7R9Y30pKN2FW35oWGgmWetpq?=
 =?us-ascii?Q?BUcvr257TXaokMDYUg2vH9Wp/da6WfLic9saCfcvFrjG7eBfSELUaLEEZINt?=
 =?us-ascii?Q?M4IcG/lpwBs3Q9EcZWwMr5cK2fQNRjhHvU77k1NBfrsuobtvF3y2WZrrV8y8?=
 =?us-ascii?Q?nWpUehHR1lMPwZcDHg+NVtoOkRz/nsSFbNzY/nx2XDwIdiRDasnnfPHfrVhJ?=
 =?us-ascii?Q?YE/uHyYlfLabnl0gz55DhbWSIhaBOHZmO44OFZYC4LR/TVMJn1Gw5BCytnSs?=
 =?us-ascii?Q?8HTithAOTVlyKibF8AlhNpyx7ZcwHyDXaQxyodksX3jo+qyxo0TMBZAlYyya?=
 =?us-ascii?Q?NEA8ljyhSibRqQ6pR4rMZkKutMpZSsiS432FmgDhmIM09V8zsyxEnA/on7qA?=
 =?us-ascii?Q?bZGvXILpJlGtMC7oQAv4JTAxLS4yR+kWOyEFmKrUUNPklVXvO2XJZU3lLnje?=
 =?us-ascii?Q?NxjtUDRkc4kAxm+I7/NIq96FykCIL6ZIZCpcD3LsEYDO9M2OCUcgkcBzes0Y?=
 =?us-ascii?Q?IlR5JmZ3YDooYQJ35TlLLBS+QqZ0QCMkydYYg7tvQdTQhkTYgHeLfb8X7wQq?=
 =?us-ascii?Q?ew758AVSdkM3xP0xpTNWZDaNCZI8s/i75LLZWUuPqLfWoqyNEZbkYel5Scwa?=
 =?us-ascii?Q?/bfpDanirxHvTyYpvqMUSDG0n6P/BYAvAkcMPkwOPM1r9NTh4HEvZ5671uWL?=
 =?us-ascii?Q?jnEh14C8q5WRSYnpviRGfwO/hDKdPYPKH9j7hyyIeDVibtLCNOg5Y3+ffSMP?=
 =?us-ascii?Q?tWPU+cEBzf+O6QjczrCjHe9edokgG271vj3NDCJngHZHkBHHFDTpISetkrlK?=
 =?us-ascii?Q?HIpcAM4c8DY4Bt71t/5PXnCi2MWGOS94ho2F64+RCViyAxeze/m0cVKTzItc?=
 =?us-ascii?Q?xyxoLcEdTCwRrnvgjSEa7kR9Vgc9MRlw/6cwrkjeGT53JBJWwM08OiZ42Yj5?=
 =?us-ascii?Q?cwbkxrpGsnI+j0otBb9ib34zVPeoWkLo2n7Nx4r/9jJ56eo/fYHU3U69o59L?=
 =?us-ascii?Q?I5f7tiCCONHxsKVtzlH8zDiUj22cOzTfDGB+tlGOpIx9FT+CRQBd9VDza5Ck?=
 =?us-ascii?Q?UHNGPrJeG6tmWeey+9NiXZUDXajxXcfwZOdtOEu8hqkGt1gUeuPkjTolbfjN?=
 =?us-ascii?Q?iN+RbRMBZ/Q86fLsYVIIFgQ9BGG8ZCY3SD7M?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ovljffnfTiS52NUZy5MK99L40As0hFeONHAeqjPBrOrAW2VKEsJdl3oZqMsY?=
 =?us-ascii?Q?zGtCC5BddKSBiQ/38Bb+n9sEujji4qleT/I9tA4zavp4iy9z7OzpK0CioYfo?=
 =?us-ascii?Q?fdiK9rUH4/ed+CmAe0oNkN0VVU6P1xnMtL6ea3sfeYJfKg0+qxDWw8rIbhxr?=
 =?us-ascii?Q?yqftpj2G99MICYNZwspTxqJo4DONvmVFXANumSzu8DSm1XjEifJ04U5THLeF?=
 =?us-ascii?Q?0lraDxUinBm9IMM0kacxIID8c3TGKJY0FIgKxqKqkrX5F0vZGbM0fH3Xpz/A?=
 =?us-ascii?Q?PNqOaKeuNtikZPaO8EXn6cYulfUWQ9YF7R0WLOx7ZGuQWHPkC7A9C3/QvGHB?=
 =?us-ascii?Q?PP6PhfK7IJ21MpXeDuXSM8aqRdmZQV2MuPNoZJid26SKgpxBvwNp3/ZwbZ6b?=
 =?us-ascii?Q?Np3EeoxIE9i4Pj6/OtZWxCFeCiZ55AFn8+dAzSDvuYQytVUV7cHqhFd+qXPH?=
 =?us-ascii?Q?dcq02VDX5zh7ZHjWBuY92shfUtDsXM12qgaccnYYHCqXKxmjC7Q51aj/lCia?=
 =?us-ascii?Q?qtTFBOiJA5GCL4OROPdu1WgkDJ7RFJvGP/KdEsK3nVNZe/nupaUXWNCMxBol?=
 =?us-ascii?Q?Wd1Nd4Omza7S97xo+DyN/7LwymxYO0jhXNgfLYT2g9nuBq/81nVtnHF2rtl6?=
 =?us-ascii?Q?JlI5I6Co9srr8N36AWiPRuXrGWhDYuAJ7F+JSWgHuprPwl0+f9NzO+JJomRc?=
 =?us-ascii?Q?uuWSMqzFGBQH6jQIBCvo1vfzfy01+wFBkwKvt4osRHvPcHGJ/XMaIj1WgSDX?=
 =?us-ascii?Q?h93oXq52w4eeqB7HRQjqNH8OFyINiXNHzhySTFhw6hw6bERtdwCXujN2coLS?=
 =?us-ascii?Q?DgjuCOlZ9Vlt4pQWQ5FoiWlNotnvUimQKeEcPFkRzm0e6u5E8WZsVlynVSm4?=
 =?us-ascii?Q?h/OkOGtCBqaX+CbdK9mGOUduuaLDTiLGtSH93H2m18KOIzvxg9aNq8xvihTs?=
 =?us-ascii?Q?e+kvxgxhqnbEjpMgUiVIGw4qIAi5Za8/+YCb4k1BzxilC3WRGqHN9SCOjGSf?=
 =?us-ascii?Q?bzfwqIq1OLZl5V56cwq/7B2Be+6ZCdDpp6TbLwLLb+8QS6MKyBHPwn4BfB7t?=
 =?us-ascii?Q?EIVclqrfeayxAaPu9aA71EN6TYWXw6t7g+nafODQH/BYC5fOHp7nCxuhPcr3?=
 =?us-ascii?Q?Xu5nRYUn/XeyGujJSfdIwK08p5yNQDEXyHcfS0PryalQebHQlvZE2Co52YWr?=
 =?us-ascii?Q?DiP1/4QqEC9X7eHmk6tOK003PrOZTxQOrv+Iuohwoj6kwXrKSL8zabkJLySS?=
 =?us-ascii?Q?18fkmuLb8agY5bWtSDT5lA01qm7E0gX4Z842cTEdHT6npzIgvwn3cs2OLXjJ?=
 =?us-ascii?Q?xZvBMAuo9Hpk1uE9xvIC+Qjt7KBCqi+Uxuhgo9V8sKM6oxcR4NPdnNL0aFbE?=
 =?us-ascii?Q?RzxySPgbEqd5029xYdZBDyWYP/4HphnlVECVRxZImBquCVdQmcOtf1970AgF?=
 =?us-ascii?Q?BSdY+e36AixuOVUb4bRAuMyh8z3+jK65YP+miWdYsMCb+mDl7cyAJTBk+tYA?=
 =?us-ascii?Q?lhgOl+gC1HK/adrsIZzjkG+p33bN2Yloagn57iOytw78BKN/19IQagI9gTjk?=
 =?us-ascii?Q?omknzUXxueHbhJwW756uyrlX1KUAK5rb0sxwAh4FCmZcsUC2Z5vUckDBQLFt?=
 =?us-ascii?Q?gC6s9avgUt6rIaY4yHlNF1sO3IpTM9CDr2jF3F4iWx+vqCICSiiy/hP/upxT?=
 =?us-ascii?Q?dkEkKz3LM5kU3iA0bwdvRIbKQeV7t395MN/OewlqpxEtKG0BIUTdTeDj19vq?=
 =?us-ascii?Q?HfF9TF7aX/uFHY4HYlyI6AWrIrYfQ0RHcuUJrSz4TQaLEfbww+4p?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1693f2f8-e350-44af-5a8f-08de4dd856ba
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 10:34:30.0078
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cnskmDv5kLD+Qowhm1n+d8tF5M2LQY9Gp8Y7eWTgNRsGmJYKKxqb51kHvY4hQs3s6SL4N8CwP+vLr/tcSUPZLNeaQRxlnpvTXEV0ik5ZVF3BhoJDw6bPm/Oo6uMkPtN8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB13558

Update the struct renesas_i3c to store the clock rate, presetn and
tresetn handlers. Replace local usage of the clock rate and reset
controls with these structure fields.

Simplify the code and prepare the driver for upcoming suspend/resume
support.

No functional change intended.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v4->v5:
 - Moved presetn and tresetn reset controls renesas_i3c struct
   entries above num_clks to avoid padding.

v3->v4:
 - No changes.

v2->v3:
 - Collected FLi tag.
 - Improved commit body.

v1->v2:
 - New patch.

 drivers/i3c/master/renesas-i3c.c | 39 ++++++++++++++++----------------
 1 file changed, 20 insertions(+), 19 deletions(-)

diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
index bb1d11693ec9..c1ab4edb3ab3 100644
--- a/drivers/i3c/master/renesas-i3c.c
+++ b/drivers/i3c/master/renesas-i3c.c
@@ -258,10 +258,13 @@ struct renesas_i3c {
 	u32 free_pos;
 	u32 i2c_STDBR;
 	u32 i3c_STDBR;
+	unsigned long rate;
 	u8 addrs[RENESAS_I3C_MAX_DEVS];
 	struct renesas_i3c_xferqueue xferqueue;
 	void __iomem *regs;
 	struct clk_bulk_data *clks;
+	struct reset_control *presetn;
+	struct reset_control *tresetn;
 	u8 num_clks;
 };
 
@@ -482,22 +485,21 @@ static int renesas_i3c_bus_init(struct i3c_master_controller *m)
 	struct i3c_bus *bus = i3c_master_get_bus(m);
 	struct i3c_device_info info = {};
 	struct i2c_timings t;
-	unsigned long rate;
 	u32 double_SBR, val;
 	int cks, pp_high_ticks, pp_low_ticks, i3c_total_ticks;
 	int od_high_ticks, od_low_ticks, i2c_total_ticks;
 	int ret;
 
-	rate = clk_get_rate(i3c->clks[RENESAS_I3C_TCLK_IDX].clk);
-	if (!rate)
+	i3c->rate = clk_get_rate(i3c->clks[RENESAS_I3C_TCLK_IDX].clk);
+	if (!i3c->rate)
 		return -EINVAL;
 
 	ret = renesas_i3c_reset(i3c);
 	if (ret)
 		return ret;
 
-	i2c_total_ticks = DIV_ROUND_UP(rate, bus->scl_rate.i2c);
-	i3c_total_ticks = DIV_ROUND_UP(rate, bus->scl_rate.i3c);
+	i2c_total_ticks = DIV_ROUND_UP(i3c->rate, bus->scl_rate.i2c);
+	i3c_total_ticks = DIV_ROUND_UP(i3c->rate, bus->scl_rate.i3c);
 
 	i2c_parse_fw_timings(&m->dev, &t, true);
 
@@ -510,7 +512,7 @@ static int renesas_i3c_bus_init(struct i3c_master_controller *m)
 			pp_high_ticks = ((i3c_total_ticks * 5) / 10);
 		else
 			pp_high_ticks = DIV_ROUND_UP(I3C_BUS_THIGH_MIXED_MAX_NS,
-						     NSEC_PER_SEC / rate);
+						     NSEC_PER_SEC / i3c->rate);
 		pp_low_ticks = i3c_total_ticks - pp_high_ticks;
 
 		if ((od_low_ticks / 2) <= 0xFF && pp_low_ticks < 0x3F)
@@ -518,7 +520,7 @@ static int renesas_i3c_bus_init(struct i3c_master_controller *m)
 
 		i2c_total_ticks /= 2;
 		i3c_total_ticks /= 2;
-		rate /= 2;
+		i3c->rate /= 2;
 	}
 
 	/* SCL clock period calculation in Open-drain mode */
@@ -539,8 +541,8 @@ static int renesas_i3c_bus_init(struct i3c_master_controller *m)
 			STDBR_SBRLP(pp_low_ticks) |
 			STDBR_SBRHP(pp_high_ticks);
 
-	od_low_ticks -= t.scl_fall_ns / (NSEC_PER_SEC / rate) + 1;
-	od_high_ticks -= t.scl_rise_ns / (NSEC_PER_SEC / rate) + 1;
+	od_low_ticks -= t.scl_fall_ns / (NSEC_PER_SEC / i3c->rate) + 1;
+	od_high_ticks -= t.scl_rise_ns / (NSEC_PER_SEC / i3c->rate) + 1;
 	i3c->i2c_STDBR = (double_SBR ? STDBR_DSBRPO : 0) |
 			STDBR_SBRLO(double_SBR, od_low_ticks) |
 			STDBR_SBRHO(double_SBR, od_high_ticks) |
@@ -591,13 +593,13 @@ static int renesas_i3c_bus_init(struct i3c_master_controller *m)
 	renesas_set_bit(i3c->regs, SCSTRCTL, SCSTRCTL_ACKTWE);
 
 	/* Bus condition timing */
-	val = DIV_ROUND_UP(I3C_BUS_TBUF_MIXED_FM_MIN_NS, NSEC_PER_SEC / rate);
+	val = DIV_ROUND_UP(I3C_BUS_TBUF_MIXED_FM_MIN_NS, NSEC_PER_SEC / i3c->rate);
 	renesas_writel(i3c->regs, BFRECDT, BFRECDT_FRECYC(val));
 
-	val = DIV_ROUND_UP(I3C_BUS_TAVAL_MIN_NS, NSEC_PER_SEC / rate);
+	val = DIV_ROUND_UP(I3C_BUS_TAVAL_MIN_NS, NSEC_PER_SEC / i3c->rate);
 	renesas_writel(i3c->regs, BAVLCDT, BAVLCDT_AVLCYC(val));
 
-	val = DIV_ROUND_UP(I3C_BUS_TIDLE_MIN_NS, NSEC_PER_SEC / rate);
+	val = DIV_ROUND_UP(I3C_BUS_TIDLE_MIN_NS, NSEC_PER_SEC / i3c->rate);
 	renesas_writel(i3c->regs, BIDLCDT, BIDLCDT_IDLCYC(val));
 
 	ret = i3c_master_get_free_addr(m, 0);
@@ -1300,7 +1302,6 @@ static const struct renesas_i3c_irq_desc renesas_i3c_irqs[] = {
 static int renesas_i3c_probe(struct platform_device *pdev)
 {
 	struct renesas_i3c *i3c;
-	struct reset_control *reset;
 	int ret, i;
 
 	i3c = devm_kzalloc(&pdev->dev, sizeof(*i3c), GFP_KERNEL);
@@ -1318,14 +1319,14 @@ static int renesas_i3c_probe(struct platform_device *pdev)
 				     RENESAS_I3C_TCLK_IDX, ret);
 	i3c->num_clks = ret;
 
-	reset = devm_reset_control_get_optional_exclusive_deasserted(&pdev->dev, "tresetn");
-	if (IS_ERR(reset))
-		return dev_err_probe(&pdev->dev, PTR_ERR(reset),
+	i3c->tresetn = devm_reset_control_get_optional_exclusive_deasserted(&pdev->dev, "tresetn");
+	if (IS_ERR(i3c->tresetn))
+		return dev_err_probe(&pdev->dev, PTR_ERR(i3c->tresetn),
 				     "Error: missing tresetn ctrl\n");
 
-	reset = devm_reset_control_get_optional_exclusive_deasserted(&pdev->dev, "presetn");
-	if (IS_ERR(reset))
-		return dev_err_probe(&pdev->dev, PTR_ERR(reset),
+	i3c->presetn = devm_reset_control_get_optional_exclusive_deasserted(&pdev->dev, "presetn");
+	if (IS_ERR(i3c->presetn))
+		return dev_err_probe(&pdev->dev, PTR_ERR(i3c->presetn),
 				     "Error: missing presetn ctrl\n");
 
 	spin_lock_init(&i3c->xferqueue.lock);
-- 
2.43.0


