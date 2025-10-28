Return-Path: <linux-renesas-soc+bounces-23715-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 324D9C12DBD
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Oct 2025 05:32:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0E3BD1A62C50
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Oct 2025 04:33:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7D9E33E7;
	Tue, 28 Oct 2025 04:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="U8mmq/Ik"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011038.outbound.protection.outlook.com [40.107.74.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0FECD271;
	Tue, 28 Oct 2025 04:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761625955; cv=fail; b=d+VcsJIkhBadje8WN+PFyIQbbrKyRQOVazvnHxMitAPqYQI2lQfVN/Aj6lhpkmuOC+k4pT4lFzASOph6HlwAOZwKJ1xi/pn47/TvOlw7ga7vTGkToCpaINAwgAecFJzDxsFaN3RQZ5YfNoZwpR4++ClcwWqjT/CBiGJhwWnsIeI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761625955; c=relaxed/simple;
	bh=+ZaZeMEt+EhO9VUlGB72uX0xQ5CTuw/M3i0Z6wasc+I=;
	h=Message-ID:From:To:In-Reply-To:References:Subject:Content-Type:
	 Date:MIME-Version; b=mCoK/3QIWaKybXphsHnGxAV8oH8G2V618u104jYC2lKrQ+Jz84btZ0HhfWnglIbGhhB261HwWcQMJR6UiOHDla+qnPaz0gLMn8oI2HAFgVD6/+YzZ4b+93ILmRnpEb/rk8Sm2Pls0xsAxypPTEYf2/sY2nBXoiPAXNIgNLT+JN4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=U8mmq/Ik; arc=fail smtp.client-ip=40.107.74.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X7JQIOHyVU93Sox1370Y/DdxzGPB1dtn4bjAgerQC2nIMGCUmgwKd42LNN227wF1sNjAPZhk6EME7ZMkuAteQYo2MHT0yQWlZRgQrj1HSq03OE8mZwxYpvrDgZrRE58RvA+o4MrK19Q5x74/HGIOQLLGeFncRlYuGw40bTSFjzp/Es1TXAk4nD55w5uZH91UkOt/qCniKQ7vITLr8d1OSC6V1NhtU04+kGwLRx4PuVm1zi0fiAav3dTIP6kZmCtKL1scSyAFvBoffF8sGTJ/lAgsF7Cf+J+GZmxfo5rBvbNhxqUF6O+sNRRIeVNDH9RL2WFQ2bIOlXtlkRoHinxbWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lxr9jCcHBHOZBzz9JS4P7mka/tXXx1fwVf1i+h0EnEk=;
 b=qWRSo9Jf52nAJ8T4DpUQzMKltFZ0yyuOtqFSPmBTjoPMF8YgcD8NEk8oCFFAUgcqtURtw2VKUMX9sdpAsp/QKSOPEw+lxOTzpsRKv999yvWN8ZlxRYsmI2AD1k6TFSpP4NMRkd6WcT0oq3pmhBQuZL8+UOv/GEpKW3LwHaCbLnp1CJOFJLLBaPgo0PNMI2oSXOBv72ELPIDi8jbkXpcintt2pwaCmhf8PdFCI/a37WDAQuxIUd4WMMGCtgHksmdzqEOPGJtFjp/Tos1d3xFYqi0F0hhlUZnvWPKlOl2P0gs+JvhpvpTr6Q2xFjiRnXSy+o6ldffh78zatpazdazGCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lxr9jCcHBHOZBzz9JS4P7mka/tXXx1fwVf1i+h0EnEk=;
 b=U8mmq/IkmBY65uCQn8pMknD9eisZufl2tsxOxzkMvv96NSL5Zlh0rsxRdLdH4x4FwShrvpaJl0T0iw3phk0vyJdSYyYHxwODCqMjMxAt+hgZtZWqb49rzQiwTpICmjbPsZ+L7CqOBt0+teA5PTyEXNA71gRdy6X4OCOvRdBpAAo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSCPR01MB13679.jpnprd01.prod.outlook.com
 (2603:1096:604:380::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Tue, 28 Oct
 2025 04:32:30 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9275.011; Tue, 28 Oct 2025
 04:32:30 +0000
Message-ID: <87ms5bsl2a.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
In-Reply-To: <87o6prsl2z.wl-kuninori.morimoto.gx@renesas.com>
References: <87o6prsl2z.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 1/3] mailbox: remove unneeded double quotation
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 28 Oct 2025 04:32:30 +0000
X-ClientProxiedBy: TY4PR01CA0004.jpnprd01.prod.outlook.com
 (2603:1096:405:26e::16) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSCPR01MB13679:EE_
X-MS-Office365-Filtering-Correlation-Id: 04d611c3-766d-4686-a3b7-08de15db01ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1bqPL4d5PfZea1cuYMJOlnpNJpCo9Dk8iYTwc2rx9v3QEbW53DoSibzJMoYp?=
 =?us-ascii?Q?3/50pkOoo4+B+jttC2IRwtDu33dX8UbIoFkyNCGQmIYXe5GTh2Xg3cniYLtD?=
 =?us-ascii?Q?3JWZkNM5T8TvAVLU3Yx6mSldskrggtaFq/exSwfEcpnAjC0qhlx8RaQ0YIOe?=
 =?us-ascii?Q?D3Z/d/RYvPlC5eZe4IXljVvA+TYPSQxKhMtNKXI+huJ+/iSpMsZARO1PRTgu?=
 =?us-ascii?Q?LsXQKE0zGXgbKzHlZY7PvY+ivGt+yOqT1+Y2kQ4m8r1WoVQ2N2YatTABhn8v?=
 =?us-ascii?Q?NV8GaLHhXGXVXVU1WClfPzY8eTAG9F57QNim1rEzp+hhR0beTHIgvX7ClFMu?=
 =?us-ascii?Q?rEx3q04RiQwyKs1XEZhcdhdVPdAiQsSexO0EMNeBGfaEaXOat4QaH5rnzOSJ?=
 =?us-ascii?Q?SnSDrhCv4uuziWoLlk0HFgxR+f7pSsJVx5gbQSngt04rbuhxrs9kcrmdXzgI?=
 =?us-ascii?Q?IJLEpj8d1nk65Y0N7q7WzfYSpJo+6GG+gm+ne2G8IjIlVUq81HFKUxLEnR00?=
 =?us-ascii?Q?D1lmLuyyu+XtNmKB2UnW5w+0WKfbQby1Xc2BZtk+rS3AdyUdRFRZUqUfVLt3?=
 =?us-ascii?Q?DCPAjHEisJVrrLl2b5C2pGFBnCLpHQ5pt3SO98nLFi6Dn2WS/jC6k+Fu9+ot?=
 =?us-ascii?Q?2hf+HcdSADUEr5VyDXVMo3y0nFOU10YnHV6ml3L23Ba+R1w/3peCc284HR9P?=
 =?us-ascii?Q?ID6Y4vty7kdHEWEshTTNxu/wq8+Kjtita7f5jrX/gJOUvvLW5FgF7rLcl8Wm?=
 =?us-ascii?Q?ZdFW9AwvGgAwLxBMzDpueKQfJtAsi/HNWsooOjTAd9zT5zD1TbgtkcwbGJIM?=
 =?us-ascii?Q?eq4kpxBAeVmlIqKaA3gC0Tzu7Hy5ETo3qmQxsPNoXAcdlsi1LPt81E5swLKo?=
 =?us-ascii?Q?+J1wJH3xx6I/v0pA84PybUjc8FmOfstK/bUjK9sK3qn38qKwsVIv46Wn3Fx6?=
 =?us-ascii?Q?bnTl5sYEK0HFYeDDWbTVi3EbwHsYTtNO+7OAvT5G/bzbZnqS+jA7F8dgyzGc?=
 =?us-ascii?Q?rM+YbISZi9f9SsES9Y9IfhdymeCCVCB4wfmWX1YsGxhHrEMoegjHOKMNpKr1?=
 =?us-ascii?Q?h4jpIyu2PvePjEbEvfRaEMWb1JbBVTOV34gUGzxys021bXybpxPHgXhz6zQD?=
 =?us-ascii?Q?nBURpfogmd8jLFS5g4H1rlL9P8lIiQf2+p3X/xTMzNz4BdRAM2YNbJpqdgJN?=
 =?us-ascii?Q?1CsXbyMsF4NZK+P+6pIg0Mc34Py+BsVWQ95Gpt49ue6WEkYXWUKk0ek/bz1l?=
 =?us-ascii?Q?YuQrgta5YkcErMOZTCsTyg2bChO1SWMzYEEtbO/KNO1dnJidUHyZo10Xv4AZ?=
 =?us-ascii?Q?CkYS0jcThooUw1vnMi//sosIuB/c5MDmdtYR+PYv2UNt57X6GU0UdWSMJaiW?=
 =?us-ascii?Q?GCVdMtNKA56EXfUcPPVQ4g3BJI5OMc/dn6leDJxQHV32375Ry0WG1+0r+stO?=
 =?us-ascii?Q?ImdL1ZCJr3isx3MvYrmT++RCGSj/i9C2R4fvhNW/AZ0BJu/fgSAfduxlXoRc?=
 =?us-ascii?Q?3VGgx5ci8R+7pvuerY50g5ffffa1iZM3EheL?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2SZAQcB9MdKxnDCuRHQ00TKJzxhtYpV6tj6tUvBYJMv6Pc+JAyGIlmJKuvwH?=
 =?us-ascii?Q?3xEhr+pCZ7m4q31TTqAMdlNVl1Z7QIecD9BDb6by9YO9tlAEwxQP6ypq3CI3?=
 =?us-ascii?Q?ljZYTSecWQ2Wry+BPeedELCt1Rhd7BDInpqfPIU+QYhV67HOUxwQKAA9wlmB?=
 =?us-ascii?Q?fNhkdCKdYROy0iUDfSwT/G9J9o9JgVihE/2rRHhqjvDajrkLBqH2cJoCArsl?=
 =?us-ascii?Q?xgaL4SXf4wh87kqBytUUGn5VtUXcTn2JgBVsNrD0Rr1vj5tyhOtIbGwmDWx9?=
 =?us-ascii?Q?A+V21GjzE7n0LFcsWPuOgBdu0Z77Az9WQ4dByT02kL5D6dO25+M8aYBh3FtP?=
 =?us-ascii?Q?rguXn/KA1Uab+nheJuwvBdZ9Qu9AyhIm6ez8vz9n6o35tCKzRsmntVJgpqeD?=
 =?us-ascii?Q?ZrevS97twtdaOXO1v5BSS6bhxlbM7oki7UwD+UCv2rvJv8dWdsaeAh82Ekmo?=
 =?us-ascii?Q?pziAWWwi/ddXZjrrCqSzmQUPQnAT9kUqWROGJyK0bDUOBQNnHVKLvsVaGzka?=
 =?us-ascii?Q?ITQd4ENKxZd+hFiz7XCXKlpeID+f0Cgd+ueUGmRI2qXHLcf57lMsPVwUXbue?=
 =?us-ascii?Q?FikXvj/GUZSOC5uGBrdQMtlHlDLG6aRzkwTnzfsF2ssRP5evOgr0T3SQ4tdc?=
 =?us-ascii?Q?ZRMKk4BcjXTac2wZVUEn4ZqjRyCzF9EzlQ2q0P5Hl5sfv8HRvRXGVpXuYtif?=
 =?us-ascii?Q?xsYEQR9CrOYsnMx8XwJ/78mInOlLI+vYEHZ/FliIaBqKyrLfFlUdxqlr85Uo?=
 =?us-ascii?Q?tv5CNJCVnEQ8nt5Nbo4KX1TiAKj2S2NBmsPakB1Sbf4huIu2MitfMHwYfkF1?=
 =?us-ascii?Q?QENnneu7Kp0bA7UmxwBkbEfw/g5xCHTR8mZeXuYC4w34mhUzTPjJZbWIfanl?=
 =?us-ascii?Q?N8Tb8wPE5rvHMRQJ7a1kHmonVdmK0JacOtL5voKQzqZPytKh6LupOCroUEzO?=
 =?us-ascii?Q?i50rjDbuwfZtV3rPY62qm/3IcL0LKmPx62N8udSeKSruGnkR5X/h94nfZaqL?=
 =?us-ascii?Q?1JOs6Lx2AWKTZNk6wt1TAkXAyM1NI8yUYuvtrTELC+mg6iJznchbJLPH7VfU?=
 =?us-ascii?Q?bzuz2RxDHDqtHtH24yBec+XeV6/X1zehnlCgPe0RaNAq42SVNCdv3/s5swFu?=
 =?us-ascii?Q?6F5xCwsss0SVksU7G/mvuvUfvLQOyvazjMra3QH+2TKGdu/XBpfw8hsQPLsL?=
 =?us-ascii?Q?GF1GENwQXoNKZhsEmK7BkH7f/2UrDT5Chga2qmJU/0At7dGDO9wXiLAv9Yo+?=
 =?us-ascii?Q?XO/lrL1LfXg50QnR+kZdDNpbkw/kVtYAbnqNqkv1zuKCHaZIyempwfJrRH3I?=
 =?us-ascii?Q?wap8ZXiNDrQI6H86opkH4nkd9G2wYJRqnT1l5f/G3YicQgfmFaQwKhU19Tf8?=
 =?us-ascii?Q?0yfYyAh/3O6cntKITb1jicBb0p2xu22P0+hFnBUhk1+vuWhCn2sNNXHaoQ0d?=
 =?us-ascii?Q?FvzvrGs0pyBAC3us9Nn1TgtF2TNV050CDP0Z1d1YGMsHaM2lPnl1FxiQnd3v?=
 =?us-ascii?Q?IfrNBKz6nUWbN0FoZm41EH5gjrZLxlV+ExElC4IX4IWzb66lceYSNIRPNxY/?=
 =?us-ascii?Q?po5Xc6ppNyYw8EVm8UFUwFxC5pU2gTiKsf/RQmVDCbj5I6gxldyVmxiU7ogE?=
 =?us-ascii?Q?eVl8zL7kn1NcPqtvbrnsmlk=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04d611c3-766d-4686-a3b7-08de15db01ab
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 04:32:30.5471
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XLUx9yTI40xxshWHZYdMHuyNsgn0HjCF2J3zHRv3lh4PNESvBCvwpto5FnTHZiMcAhmtLwOY//3nVc4g3jFsV2IzRZMk0eekMPcWKUbXrIipd89q/DB2e9/dG03m5nlV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB13679

It makes Kconfig strange. fix it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/mailbox/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mailbox/Kconfig b/drivers/mailbox/Kconfig
index 29f16f220384f..e47cb68989267 100644
--- a/drivers/mailbox/Kconfig
+++ b/drivers/mailbox/Kconfig
@@ -279,7 +279,7 @@ config MTK_ADSP_MBOX
 	tristate "MediaTek ADSP Mailbox Controller"
 	depends on ARCH_MEDIATEK || COMPILE_TEST
 	help
-          Say yes here to add support for "MediaTek ADSP Mailbox Controller.
+          Say yes here to add support for MediaTek ADSP Mailbox Controller.
           This mailbox driver is used to send notification or short message
           between processors with ADSP. It will place the message to share
 	  buffer and will access the ipc control.
-- 
2.43.0


